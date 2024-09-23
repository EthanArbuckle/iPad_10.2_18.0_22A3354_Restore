@implementation SKTileGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)rules
{
  return (NSArray *)self->_rules;
}

- (void)setRules:(NSArray *)rules
{
  NSMutableArray *v4;
  NSMutableArray *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", rules);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v5 = self->_rules;
  self->_rules = v4;

  -[SKTileGroup setRuleParentPointers](self, "setRuleParentPointers");
}

- (void)setRuleParentPointers
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
  v3 = self->_rules;
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
          objc_msgSend(v8, "setParentGroup:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (SKTileGroup)initWithCoder:(id)a3
{
  id v4;
  SKTileGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *rules;
  void *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKTileGroup;
  v5 = -[SKTileGroup init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_rules"));
    v9 = objc_claimAutoreleasedReturnValue();
    rules = v5->_rules;
    v5->_rules = (NSMutableArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileGroup setName:](v5, "setName:", v11);

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    -[SKTileGroup setRuleParentPointers](v5, "setRuleParentPointers");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *rules;
  void *v5;
  id v6;

  rules = self->_rules;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", rules, CFSTR("_rules"));
  -[SKTileGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_name"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
}

- (BOOL)isEqualToNode:(id)a3
{
  SKTileGroup *v4;
  SKTileGroup *v5;
  id *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t type;

  v4 = (SKTileGroup *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    -[SKTileGroup name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
LABEL_7:
        if (!-[NSMutableArray count](self->_rules, "count"))
        {
LABEL_12:
          type = self->_type;
          v8 = type == objc_msgSend(v6, "type");
LABEL_14:

          goto LABEL_15;
        }
        v13 = 0;
        while (objc_msgSend(v6[1], "count") > v13)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_rules, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6[1], "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToNode:", v15);

          if ((v16 & 1) == 0)
            break;
          if (-[NSMutableArray count](self->_rules, "count") <= ++v13)
            goto LABEL_12;
        }
LABEL_13:
        v8 = 0;
        goto LABEL_14;
      }
    }
    -[SKTileGroup name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_13;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_15:

  return v8;
}

- (id)copy
{
  return -[SKTileGroup copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[SKTileGroup rules](self, "rules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRules:", v5);

    -[SKTileGroup name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v6);

    objc_msgSend(v4, "setType:", -[SKTileGroup type](self, "type"));
  }
  return v4;
}

- (SKTileGroup)initWithTileDefinition:(SKTileDefinition *)tileDefinition
{
  SKTileDefinition *v4;
  SKTileGroup *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *rules;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = tileDefinition;
  v11.receiver = self;
  v11.super_class = (Class)SKTileGroup;
  v5 = -[SKTileGroup init](&v11, sel_init);
  if (v5)
  {
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKTileGroupRule tileGroupRuleWithAdjacency:tileDefinitions:](SKTileGroupRule, "tileGroupRuleWithAdjacency:tileDefinitions:", 255, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    rules = v5->_rules;
    v5->_rules = (NSMutableArray *)v8;

    -[SKTileGroup setName:](v5, "setName:", 0);
    -[SKTileGroup setType:](v5, "setType:", 0);
    -[SKTileGroup setRuleParentPointers](v5, "setRuleParentPointers");

  }
  return v5;
}

- (SKTileGroup)initWithRules:(NSArray *)rules
{
  NSArray *v4;
  SKTileGroup *v5;
  SKTileGroup *v6;
  objc_super v8;

  v4 = rules;
  v8.receiver = self;
  v8.super_class = (Class)SKTileGroup;
  v5 = -[SKTileGroup init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKTileGroup setRules:](v5, "setRules:", v4);
    -[SKTileGroup setName:](v6, "setName:", 0);
    -[SKTileGroup setType:](v6, "setType:", 0);
  }

  return v6;
}

+ (SKTileGroup)tileGroupWithTileDefinition:(SKTileDefinition *)tileDefinition
{
  SKTileDefinition *v3;
  SKTileGroup *v4;

  v3 = tileDefinition;
  v4 = -[SKTileGroup initWithTileDefinition:]([SKTileGroup alloc], "initWithTileDefinition:", v3);

  return v4;
}

+ (SKTileGroup)tileGroupWithRules:(NSArray *)rules
{
  NSArray *v3;
  SKTileGroup *v4;

  v3 = rules;
  v4 = -[SKTileGroup initWithRules:]([SKTileGroup alloc], "initWithRules:", v3);

  return v4;
}

+ (SKTileGroup)emptyTileGroup
{
  return +[SKTileGroup tileGroupWithRules:](SKTileGroup, "tileGroupWithRules:", MEMORY[0x1E0C9AA60]);
}

- (unint64_t)findTileDefinitionIndexForAdjacencyData:(unint64_t)a3 tileSetType:(unint64_t)a4
{
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_rules, "count"))
  {
    if (a4 > 1)
    {
      v27 = 0uLL;
      v28 = 0uLL;
      v25 = 0uLL;
      v26 = 0uLL;
      v7 = self->_rules;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
LABEL_23:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v21);
          if (objc_msgSend(v12, "adjacency", (_QWORD)v25) == a3)
            goto LABEL_31;
          if (v19 == ++v21)
          {
            v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            v17 = -1;
            if (v19)
              goto LABEL_23;
            goto LABEL_32;
          }
        }
      }
    }
    else
    {
      v31 = 0uLL;
      v32 = 0uLL;
      v29 = 0uLL;
      v30 = 0uLL;
      v7 = self->_rules;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
LABEL_5:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
          if (((objc_msgSend(v12, "adjacency") ^ a3) & 0x55) == 0)
          {
            v13 = objc_msgSend(v12, "adjacency");
            if ((a3 & 2) != 0 || (v13 & 2) == 0)
            {
              v14 = objc_msgSend(v12, "adjacency");
              if ((a3 & 8) != 0 || (v14 & 8) == 0)
              {
                v15 = objc_msgSend(v12, "adjacency");
                if ((a3 & 0x20) != 0 || (v15 & 0x20) == 0)
                {
                  v16 = objc_msgSend(v12, "adjacency");
                  if ((a3 & 0x80) != 0 || (v16 & 0x80) == 0)
                    break;
                }
              }
            }
          }
          if (v9 == ++v11)
          {
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            if (v9)
              goto LABEL_5;
            goto LABEL_30;
          }
        }
LABEL_31:
        objc_msgSend(v12, "tileDefinitionIDs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v23, "integerValue");

        goto LABEL_32;
      }
    }
LABEL_30:
    v17 = -1;
LABEL_32:

    return v17;
  }
  return -1;
}

- (id)findTileDefinitionIDsForAdjacencyData:(unint64_t)a3 tileSetType:(unint64_t)a4
{
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_rules, "count"))
    return MEMORY[0x1E0C9AA60];
  if (a4 > 1)
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    v7 = self->_rules;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_23:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v22);
        if (objc_msgSend(v13, "adjacency", (_QWORD)v23) == a3)
          goto LABEL_30;
        if (v20 == ++v22)
        {
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v20)
            goto LABEL_23;
          goto LABEL_32;
        }
      }
    }
LABEL_31:
    v11 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_32;
  }
  v29 = 0uLL;
  v30 = 0uLL;
  v27 = 0uLL;
  v28 = 0uLL;
  v7 = self->_rules;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (!v8)
    goto LABEL_31;
  v9 = v8;
  v10 = *(_QWORD *)v28;
  v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_5:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v28 != v10)
      objc_enumerationMutation(v7);
    v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
    if (((objc_msgSend(v13, "adjacency") ^ a3) & 0x55) == 0)
    {
      v14 = objc_msgSend(v13, "adjacency");
      if ((a3 & 2) != 0 || (v14 & 2) == 0)
      {
        v15 = objc_msgSend(v13, "adjacency");
        if ((a3 & 8) != 0 || (v15 & 8) == 0)
        {
          v16 = objc_msgSend(v13, "adjacency");
          if ((a3 & 0x20) != 0 || (v16 & 0x20) == 0)
          {
            v17 = objc_msgSend(v13, "adjacency");
            if ((a3 & 0x80) != 0 || (v17 & 0x80) == 0)
              break;
          }
        }
      }
    }
    if (v9 == ++v12)
    {
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v9)
        goto LABEL_5;
      goto LABEL_32;
    }
  }
LABEL_30:
  objc_msgSend(v13, "tileDefinitionIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 24);
}

- (SKTileSet)parentSet
{
  return (SKTileSet *)objc_loadWeakRetained((id *)&self->_parentSet);
}

- (void)setParentSet:(id)a3
{
  objc_storeWeak((id *)&self->_parentSet, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSet);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
