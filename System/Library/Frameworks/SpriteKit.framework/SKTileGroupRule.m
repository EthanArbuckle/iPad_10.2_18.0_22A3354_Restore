@implementation SKTileGroupRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKTileAdjacencyMask)adjacency
{
  return self->_adjacency;
}

- (void)setAdjacency:(SKTileAdjacencyMask)adjacency
{
  self->_adjacency = adjacency;
}

- (NSArray)tileDefinitions
{
  return (NSArray *)self->_tileDefinitions;
}

- (void)setTileDefinitions:(NSArray *)tileDefinitions
{
  NSMutableArray *v4;
  NSMutableArray *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", tileDefinitions);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v5 = self->_tileDefinitions;
  self->_tileDefinitions = v4;

  -[SKTileGroupRule setTileDefinitionParentPointers](self, "setTileDefinitionParentPointers");
}

- (NSArray)tileDefinitionIDs
{
  return (NSArray *)self->_tileDefinitionIDs;
}

- (void)setTileDefinitionIDs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tileDefinitionIDs;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  tileDefinitionIDs = self->_tileDefinitionIDs;
  self->_tileDefinitionIDs = v4;

}

- (void)setTileDefinitionParentPointers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_tileDefinitions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (v8)
          objc_msgSend(v8, "setParentRule:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (SKTileGroupRule)initWithCoder:(id)a3
{
  id v4;
  SKTileGroupRule *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *tileDefinitions;
  void *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKTileGroupRule;
  v5 = -[SKTileGroupRule init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_tileDefinitions"));
    v9 = objc_claimAutoreleasedReturnValue();
    tileDefinitions = v5->_tileDefinitions;
    v5->_tileDefinitions = (NSMutableArray *)v9;

    v5->_adjacency = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_adjacency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileGroupRule setName:](v5, "setName:", v11);

    -[SKTileGroupRule setTileDefinitionParentPointers](v5, "setTileDefinitionParentPointers");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *tileDefinitions;
  id v5;
  id v6;

  tileDefinitions = self->_tileDefinitions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tileDefinitions, CFSTR("_tileDefinitions"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_adjacency, CFSTR("_adjacency"));
  -[SKTileGroupRule name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_name"));

}

- (BOOL)isEqualToNode:(id)a3
{
  SKTileGroupRule *v4;
  SKTileGroupRule *v5;
  SKTileGroupRule *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v4 = (SKTileGroupRule *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (-[NSMutableArray count](self->_tileDefinitions, "count"))
    {
      v7 = 0;
      while (-[NSMutableArray count](v6->_tileDefinitions, "count") > v7)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_tileDefinitions, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](v6->_tileDefinitions, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToNode:", v9);

        if ((v10 & 1) == 0)
          break;
        if (-[NSMutableArray count](self->_tileDefinitions, "count") <= ++v7)
          goto LABEL_7;
      }
      goto LABEL_13;
    }
LABEL_7:
    -[SKTileGroupRule name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      -[SKTileGroupRule name](v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_12;
    }
    -[SKTileGroupRule name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileGroupRule name](v6, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (!v16)
    {
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
LABEL_12:
    v12 = self->_adjacency == v6->_adjacency;
LABEL_14:

    goto LABEL_15;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (id)copy
{
  return -[SKTileGroupRule copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setAdjacency:", -[SKTileGroupRule adjacency](self, "adjacency"));
    -[SKTileGroupRule tileDefinitions](self, "tileDefinitions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTileDefinitions:", v5);

    -[SKTileGroupRule tileDefinitionIDs](self, "tileDefinitionIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTileDefinitionIDs:", v6);

  }
  return v4;
}

- (SKTileGroupRule)initWithAdjacency:(SKTileAdjacencyMask)adjacency tileDefinitions:(NSArray *)tileDefinitions
{
  unsigned __int8 v4;
  NSArray *v6;
  SKTileGroupRule *v7;
  SKTileGroupRule *v8;
  NSMutableArray *tileDefinitionIDs;
  objc_super v11;

  v4 = adjacency;
  v6 = tileDefinitions;
  v11.receiver = self;
  v11.super_class = (Class)SKTileGroupRule;
  v7 = -[SKTileGroupRule init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_adjacency = v4;
    -[SKTileGroupRule setTileDefinitions:](v7, "setTileDefinitions:", v6);
    tileDefinitionIDs = v8->_tileDefinitionIDs;
    v8->_tileDefinitionIDs = 0;

  }
  return v8;
}

+ (SKTileGroupRule)tileGroupRuleWithAdjacency:(SKTileAdjacencyMask)adjacency tileDefinitions:(NSArray *)tileDefinitions
{
  NSArray *v5;
  SKTileGroupRule *v6;

  v5 = tileDefinitions;
  v6 = -[SKTileGroupRule initWithAdjacency:tileDefinitions:]([SKTileGroupRule alloc], "initWithAdjacency:tileDefinitions:", adjacency, v5);

  return v6;
}

- (void)calcTileDefinitionIDsWithTileSet:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *tileDefinitionIDs;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    tileDefinitionIDs = self->_tileDefinitionIDs;
    self->_tileDefinitionIDs = v5;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_tileDefinitions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          if (v12)
          {
            v13 = self->_tileDefinitionIDs;
            v14 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v4, "tileDefinitions", (_QWORD)v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", v12));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v13, "addObject:", v16);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
}

- (void)setTileDefinitionsFromIDsWithTileSet:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *tileDefinitions;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    tileDefinitions = self->_tileDefinitions;
    self->_tileDefinitions = v5;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_tileDefinitionIDs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
          if (v12)
          {
            v13 = objc_msgSend(v12, "unsignedIntegerValue", (_QWORD)v19);
            objc_msgSend(v4, "tileDefinitions");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");

            if (v15 > v13)
            {
              v16 = self->_tileDefinitions;
              objc_msgSend(v4, "tileDefinitions");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectAtIndexedSubscript:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v16, "addObject:", v18);

            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    -[SKTileGroupRule setTileDefinitionParentPointers](self, "setTileDefinitionParentPointers");
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 32);
}

- (SKTileGroup)parentGroup
{
  return (SKTileGroup *)objc_loadWeakRetained((id *)&self->_parentGroup);
}

- (void)setParentGroup:(id)a3
{
  objc_storeWeak((id *)&self->_parentGroup, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentGroup);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_tileDefinitionIDs, 0);
  objc_storeStrong((id *)&self->_tileDefinitions, 0);
}

@end
