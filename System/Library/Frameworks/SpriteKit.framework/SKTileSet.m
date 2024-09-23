@implementation SKTileSet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)tileDefinitions
{
  return (NSArray *)self->_definitions;
}

- (NSArray)tileGroups
{
  return (NSArray *)self->_groups;
}

- (void)setTileGroups:(NSArray *)tileGroups
{
  NSArray *v4;
  NSMutableArray *v5;
  NSMutableArray *groups;

  v4 = tileGroups;
  -[SKTileSet unobserveAllTileDefinitions](self, "unobserveAllTileDefinitions");
  -[NSMutableArray removeAllObjects](self->_definitions, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  groups = self->_groups;
  self->_groups = v5;

  -[SKTileSet lookForMissingDefinitionsInGroups](self, "lookForMissingDefinitionsInGroups");
  -[SKTileSet updateTileDefinitionIDsInGroupRules](self, "updateTileDefinitionIDsInGroupRules");
  -[SKTileSet setGroupParentPointers](self, "setGroupParentPointers");
}

- (void)setGroupParentPointers
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
  v3 = self->_groups;
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
          objc_msgSend(v8, "setParentSet:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (SKTileSetType)type
{
  return self->_type;
}

- (void)setType:(SKTileSetType)type
{
  self->_type = type;
}

- (SKTileGroup)defaultTileGroup
{
  return self->_defaultTileGroup;
}

- (void)setDefaultTileGroup:(SKTileGroup *)defaultTileGroup
{
  SKTileGroup *v4;
  SKTileGroup *v5;
  SKTileGroup *v6;

  v6 = defaultTileGroup;
  if (-[NSMutableArray containsObject:](self->_groups, "containsObject:"))
    v4 = v6;
  else
    v4 = 0;
  v5 = self->_defaultTileGroup;
  self->_defaultTileGroup = v4;

}

- (CGSize)defaultTileSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultTileSize.width;
  height = self->_defaultTileSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultTileSize:(CGSize)defaultTileSize
{
  self->_defaultTileSize = defaultTileSize;
}

- (NSArray)stamps
{
  return self->_stamps;
}

- (void)setStamps:(id)a3
{
  NSArray *v4;
  NSArray *stamps;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  stamps = self->_stamps;
  self->_stamps = v4;

}

- (SKTileSet)initWithCoder:(id)a3
{
  id v4;
  SKTileSet *v5;
  uint64_t v6;
  NSMutableArray *definitions;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *groups;
  void *v13;
  uint64_t v14;
  SKTileGroup *defaultTileGroup;
  SKTileGroup *v16;
  unint64_t v17;
  uint64_t v18;
  SKTileGroup *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *stamps;
  float v25;
  float v26;
  objc_super v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SKTileSet;
  v5 = -[SKTileSet init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    definitions = v5->_definitions;
    v5->_definitions = (NSMutableArray *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_groups"));
    v11 = objc_claimAutoreleasedReturnValue();
    groups = v5->_groups;
    v5->_groups = (NSMutableArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileSet setName:](v5, "setName:", v13);

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultTileGroup"));
    v14 = objc_claimAutoreleasedReturnValue();
    defaultTileGroup = v5->_defaultTileGroup;
    v5->_defaultTileGroup = (SKTileGroup *)v14;

    if (v5->_defaultTileGroup)
    {
      if ((-[NSMutableArray containsObject:](v5->_groups, "containsObject:") & 1) == 0)
      {
        v16 = v5->_defaultTileGroup;
        v5->_defaultTileGroup = 0;

      }
    }
    else
    {
      v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_defaultTileGroupIndex"));
      if (v17 != 0x7FFFFFFFFFFFFFFFLL && v17 < -[NSMutableArray count](v5->_groups, "count"))
      {
        -[NSMutableArray objectAtIndexedSubscript:](v5->_groups, "objectAtIndexedSubscript:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v5->_defaultTileGroup;
        v5->_defaultTileGroup = (SKTileGroup *)v18;

      }
    }
    v20 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("_stamps"));
    v23 = objc_claimAutoreleasedReturnValue();
    stamps = v5->_stamps;
    v5->_stamps = (NSArray *)v23;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_defaultTileSize.width"));
    v5->_defaultTileSize.width = v25;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_defaultTileSize.height"));
    v5->_defaultTileSize.height = v26;
    -[SKTileSet lookForMissingDefinitionsInGroups](v5, "lookForMissingDefinitionsInGroups");
    -[SKTileSet updateTileDefinitionIDsInGroupRules](v5, "updateTileDefinitionIDsInGroupRules");
    -[SKTileSet setGroupParentPointers](v5, "setGroupParentPointers");
    -[SKTileSet commonInit](v5, "commonInit");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *groups;
  void *v5;
  CGFloat width;
  CGFloat height;
  id v8;

  groups = self->_groups;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", groups, CFSTR("_groups"));
  -[SKTileSet name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("_name"));

  objc_msgSend(v8, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_defaultTileGroup, CFSTR("_defaultTileGroup"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_stamps, CFSTR("_stamps"));
  width = self->_defaultTileSize.width;
  *(float *)&width = width;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("_defaultTileSize.width"), width);
  height = self->_defaultTileSize.height;
  *(float *)&height = height;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("_defaultTileSize.height"), height);

}

- (BOOL)isEqualToNode:(id)a3
{
  SKTileSet *v4;
  SKTileSet *v5;
  SKTileSet *v6;
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
  SKTileGroup *defaultTileGroup;
  void *v18;
  void *v19;
  _BOOL4 v20;
  unint64_t v21;
  void *v22;
  void *v23;
  char v24;

  v4 = (SKTileSet *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (self->_type != v6->_type)
      goto LABEL_23;
    -[SKTileSet name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      -[SKTileSet name](v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_8;
    }
    -[SKTileSet name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileSet name](v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_23;
LABEL_8:
    if (-[NSMutableArray count](self->_groups, "count"))
    {
      v13 = 0;
      while (-[NSMutableArray count](v6->_groups, "count") > v13)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](v6->_groups, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToNode:", v15);

        if ((v16 & 1) == 0)
          break;
        if (-[NSMutableArray count](self->_groups, "count") <= ++v13)
          goto LABEL_13;
      }
      goto LABEL_23;
    }
LABEL_13:
    defaultTileGroup = self->_defaultTileGroup;
    if (!defaultTileGroup)
    {
      -[SKTileSet defaultTileGroup](v6, "defaultTileGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
LABEL_17:
        if (!-[NSArray count](self->_stamps, "count"))
        {
          v8 = 1;
          goto LABEL_24;
        }
        v21 = 0;
        while (-[NSArray count](v6->_stamps, "count") > v21)
        {
          -[NSArray objectAtIndexedSubscript:](self->_stamps, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](v6->_stamps, "objectAtIndexedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToNode:", v23);

          if ((v24 & 1) == 0)
            break;
          ++v21;
          v8 = 1;
          if (-[NSArray count](self->_stamps, "count") <= v21)
            goto LABEL_24;
        }
LABEL_23:
        v8 = 0;
LABEL_24:

        goto LABEL_25;
      }
      defaultTileGroup = self->_defaultTileGroup;
    }
    -[SKTileSet defaultTileGroup](v6, "defaultTileGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SKTileGroup isEqualToNode:](defaultTileGroup, "isEqualToNode:", v19);

    if (!v20)
      goto LABEL_23;
    goto LABEL_17;
  }
  v8 = 1;
LABEL_25:

  return v8;
}

- (id)copy
{
  return -[SKTileSet copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (SKTileSet)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKTileSet;
  v2 = -[SKTileSet init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = MEMORY[0x1E0C9AA60];

    *((_QWORD *)v2 + 4) = 0;
    v8 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = 0;

    *(_OWORD *)(v2 + 40) = *MEMORY[0x1E0C9D820];
    objc_msgSend(v2, "commonInit");
  }
  return (SKTileSet *)v2;
}

- (void)observeAllTileDefinitions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_definitions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SKTileSet observeTileDefinition:](self, "observeTileDefinition:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)unobserveAllTileDefinitions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_definitions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SKTileSet removeTileDefinitionObservers:](self, "removeTileDefinitionObservers:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SKTileSet unobserveAllTileDefinitions](self, "unobserveAllTileDefinitions");
  v3.receiver = self;
  v3.super_class = (Class)SKTileSet;
  -[SKTileSet dealloc](&v3, sel_dealloc);
}

- (void)observeTileDefinition:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("images"), 0, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("size"), 0, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timePerFrame"), 0, 0);

}

- (void)removeTileDefinitionObservers:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("images"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("size"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("timePerFrame"));

}

- (void)commonInit
{
  if (commonInit__tableInit != -1)
    dispatch_once(&commonInit__tableInit, &__block_literal_global_12);
}

void __23__SKTileSet_commonInit__block_invoke()
{
  SKThreadSafeMapTable *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:", v3);
  v2 = (void *)_tileSetTable;
  _tileSetTable = v1;

}

- (void)calcDefaultTileSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  id v17;

  -[SKTileSet tileGroups](self, "tileGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SKTileSet tileGroups](self, "tileGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "rules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = v17;
    if (v7)
    {
      objc_msgSend(v17, "rules");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "tileDefinitions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        objc_msgSend(v10, "tileDefinitions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "size");
        self->_defaultTileSize.width = v15;
        self->_defaultTileSize.height = v16;

      }
      v8 = v17;
    }

  }
}

- (SKTileSet)initWithTileGroups:(NSArray *)tileGroups
{
  NSArray *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = tileGroups;
  v11.receiver = self;
  v11.super_class = (Class)SKTileSet;
  v5 = -[SKTileSet init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    objc_msgSend(v5, "setTileGroups:", v4);
    objc_msgSend(v5, "setName:", 0);
    *((_QWORD *)v5 + 4) = 0;
    v8 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = 0;

    *(_OWORD *)(v5 + 40) = *MEMORY[0x1E0C9D820];
    v9 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = MEMORY[0x1E0C9AA60];

    objc_msgSend(v5, "lookForMissingDefinitionsInGroups");
    objc_msgSend(v5, "updateTileDefinitionIDsInGroupRules");
    objc_msgSend(v5, "commonInit");
    objc_msgSend(v5, "calcDefaultTileSize");
  }

  return (SKTileSet *)v5;
}

- (SKTileSet)initWithTileGroups:(NSArray *)tileGroups tileSetType:(SKTileSetType)tileSetType
{
  NSArray *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = tileGroups;
  v13.receiver = self;
  v13.super_class = (Class)SKTileSet;
  v7 = -[SKTileSet init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v8;

    objc_msgSend(v7, "setTileGroups:", v6);
    objc_msgSend(v7, "setName:", 0);
    *((_QWORD *)v7 + 4) = tileSetType;
    v10 = (void *)*((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = 0;

    *(_OWORD *)(v7 + 40) = *MEMORY[0x1E0C9D820];
    v11 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = MEMORY[0x1E0C9AA60];

    objc_msgSend(v7, "lookForMissingDefinitionsInGroups");
    objc_msgSend(v7, "updateTileDefinitionIDsInGroupRules");
    objc_msgSend(v7, "commonInit");
    objc_msgSend(v7, "calcDefaultTileSize");
  }

  return (SKTileSet *)v7;
}

+ (SKTileSet)tileSetWithTileGroups:(NSArray *)tileGroups
{
  NSArray *v3;
  SKTileSet *v4;

  v3 = tileGroups;
  v4 = -[SKTileSet initWithTileGroups:]([SKTileSet alloc], "initWithTileGroups:", v3);

  return v4;
}

+ (SKTileSet)tileSetWithTileGroups:(NSArray *)tileGroups tileSetType:(SKTileSetType)tileSetType
{
  NSArray *v5;
  SKTileSet *v6;

  v5 = tileGroups;
  v6 = -[SKTileSet initWithTileGroups:tileSetType:]([SKTileSet alloc], "initWithTileGroups:tileSetType:", v5, tileSetType);

  return v6;
}

+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumeratorAtPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nextObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      objc_msgSend(v11, "pathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "caseInsensitiveCompare:", v5);

      if (!v13)
      {
        objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      objc_msgSend(v9, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    while (v15);
  }

  return v7;
}

+ (id)findTileSetInBundleNamed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  unsigned int *v43;
  unint64_t v44;
  unsigned int *v45;
  void *v46;
  void *v47;
  int v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  unsigned int *v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[2];
  _BYTE v85[128];
  _QWORD v86[2];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  SKGetResourceBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recursivePathsForResourcesOfType:inDirectory:", CFSTR("sks"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v81;
    v62 = *MEMORY[0x1E0CB2CD0];
    v67 = v7;
    v68 = *(_QWORD *)v81;
    while (1)
    {
      v12 = 0;
      v63 = v9;
      do
      {
        if (*(_QWORD *)v81 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v13, v61);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("$objects"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15 || (unint64_t)objc_msgSend(v15, "count") < 2)
          goto LABEL_27;
        v69 = v14;
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("$top"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("document.type"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (!v18
          || (v20 = *(unsigned int *)(v18 + 16), objc_msgSend(v16, "count") <= v20)
          || (objc_msgSend(v16, "objectAtIndexedSubscript:", v20),
              (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {

          v11 = v68;
          v14 = v69;
LABEL_27:

          goto LABEL_28;
        }
        v22 = v21;
        v23 = objc_msgSend(v21, "compare:", CFSTR("com.apple.spritekit.tileset"));

        v14 = v69;
        v11 = v68;
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_alloc(MEMORY[0x1E0CB3710]);
          v79 = 0;
          v26 = (void *)objc_msgSend(v25, "initForReadingFromData:error:", v24, &v79);
          v61 = v79;
          objc_msgSend(v26, "setRequiresSecureCoding:", 0);
          v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v86[0] = objc_opt_class();
          v86[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObjectsFromArray:", v28);

          objc_msgSend(v26, "allowedClasses");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "unionSet:", v29);

          v78 = v61;
          v65 = v27;
          v66 = (unsigned int *)v26;
          objc_msgSend(v26, "decodeTopLevelObjectOfClasses:forKey:error:", v27, v62, &v78);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v78;

          v64 = v30;
          if (!v30)
          {
            v14 = v69;
            goto LABEL_42;
          }
          v61 = v24;
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v32 = v30;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v75;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v75 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                v38 = (void *)_tileSetTable;
                objc_msgSend(v37, "name", v61);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setObject:forKey:", v37, v39);

                if (!v10)
                {
                  objc_msgSend(v37, "name");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "isEqualToString:", v71);

                  if (v41)
                    v10 = v37;
                  else
                    v10 = 0;
                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
            }
            while (v34);
            v7 = v67;
            v11 = v68;
            v9 = v63;
          }
          v14 = v69;
LABEL_36:
          v59 = v65;

          v24 = v61;
LABEL_43:

          v43 = v66;
          goto LABEL_44;
        }
LABEL_28:
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("$objects"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v42;
        if (!v42 || (unint64_t)objc_msgSend(v42, "count") < 2)
          goto LABEL_45;
        objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("$class"));
        v43 = (unsigned int *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v70 = v14;
          v44 = v43[4];
          v45 = v43;
          if (objc_msgSend(v31, "count") > v44)
          {
            objc_msgSend(v31, "objectAtIndexedSubscript:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("$classname"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("SKTileSet"));

            if (!v48)
            {
              v9 = v63;
              v11 = v68;
              v14 = v70;
              v7 = v67;
              goto LABEL_46;
            }
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v13);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_alloc(MEMORY[0x1E0CB3710]);
            v73 = 0;
            v50 = (void *)objc_msgSend(v49, "initForReadingFromData:error:", v24, &v73);
            v51 = v73;
            objc_msgSend(v50, "setRequiresSecureCoding:", 0);
            v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v84[0] = objc_opt_class();
            v84[1] = objc_opt_class();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addObjectsFromArray:", v53);

            objc_msgSend(v50, "allowedClasses");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "unionSet:", v54);

            v72 = v51;
            v65 = v52;
            v66 = (unsigned int *)v50;
            objc_msgSend(v50, "decodeTopLevelObjectOfClasses:forKey:error:", v52, v62, &v72);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v72;

            v14 = v70;
            v64 = v55;
            if (v55)
            {
              v56 = (void *)_tileSetTable;
              objc_msgSend(v55, "name");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKey:", v55, v57);

              objc_msgSend(v55, "name");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v57) = objc_msgSend(v58, "isEqualToString:", v71);

              v7 = v67;
              if ((_DWORD)v57)
              {
                v61 = v24;
                v32 = v10;
                v10 = v55;
                v9 = v63;
                v11 = v68;
                goto LABEL_36;
              }
              v9 = v63;
              v11 = v68;
            }
            else
            {
              v9 = v63;
              v7 = v67;
              v11 = v68;
            }
LABEL_42:
            v59 = v65;
            goto LABEL_43;
          }
          v14 = v70;
          v43 = v45;
          v7 = v67;
        }
LABEL_44:

LABEL_45:
LABEL_46:

        ++v12;
      }
      while (v12 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      if (!v9)
        goto LABEL_50;
    }
  }
  v10 = 0;
LABEL_50:

  return v10;
}

+ (SKTileSet)tileSetNamed:(NSString *)name
{
  NSString *v4;
  void *v5;

  v4 = name;
  if (!_tileSetTable
    || (objc_msgSend((id)_tileSetTable, "objectForKey:", v4), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "findTileSetInBundleNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (SKTileSet *)v5;
}

+ (SKTileSet)tileSetFromURL:(NSURL *)url
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  _QWORD v17[12];

  v17[11] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  -[NSURL path](url, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  v17[8] = objc_opt_class();
  v17[9] = objc_opt_class();
  v17[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v16 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v16);
  v9 = v16;
  objc_msgSend(v8, "setRequiresSecureCoding:", 0);
  v10 = *MEMORY[0x1E0CB2CD0];
  v15 = v9;
  objc_msgSend(v8, "decodeTopLevelObjectOfClasses:forKey:error:", v6, v10, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  objc_opt_class();
  v13 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v11;

  return (SKTileSet *)v13;
}

+ (void)clearTileSetTableCache
{
  if (_tileSetTable)
    objc_msgSend((id)_tileSetTable, "removeAllObjects");
}

- (void)lookForMissingDefinitionsInGroups
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_groups;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v30;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v3);
        if (v4)
        {
          v20 = v3;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v4, "rules");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v26;
            do
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v26 != v8)
                  objc_enumerationMutation(v5);
                v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
                if (v10)
                {
                  v23 = 0u;
                  v24 = 0u;
                  v21 = 0u;
                  v22 = 0u;
                  objc_msgSend(v10, "tileDefinitions");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
                  if (v12)
                  {
                    v13 = v12;
                    v14 = *(_QWORD *)v22;
                    do
                    {
                      v15 = 0;
                      do
                      {
                        if (*(_QWORD *)v22 != v14)
                          objc_enumerationMutation(v11);
                        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
                        if (v16
                          && (-[NSMutableArray containsObject:](self->_definitions, "containsObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15)) & 1) == 0)
                        {
                          -[NSMutableArray addObject:](self->_definitions, "addObject:", v16);
                          -[SKTileSet observeTileDefinition:](self, "observeTileDefinition:", v16);
                        }
                        ++v15;
                      }
                      while (v13 != v15);
                      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
                    }
                    while (v13);
                  }

                }
                ++v9;
              }
              while (v9 != v7);
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
            }
            while (v7);
          }

          v3 = v20;
        }
        ++v3;
      }
      while (v3 != v19);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v19);
  }

}

- (void)updateTileDefinitionIDsInGroupRules
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_groups;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v8, "rules", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "calcTileDefinitionIDsWithTileSet:", self);
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

}

- (id)findTileDefinitionForGroup:(id)a3 withGroupAdjacency:(unint64_t *)a4
{
  id v6;
  void *v7;
  NSMutableArray *groups;
  unsigned __int16 v9;
  unsigned __int8 v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  unint64_t v14;

  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    if (!self->_definitions)
      goto LABEL_15;
    groups = self->_groups;
    if (!groups || !-[NSMutableArray containsObject:](groups, "containsObject:", v6))
      goto LABEL_15;
    v9 = -[NSMutableArray indexOfObject:](self->_groups, "indexOfObject:", v6);
    v10 = 0;
    v11 = 8;
    if (self->_type - 2 < 2)
      v11 = 6;
    v12 = &kAdjacencyMask;
    if (self->_type - 2 < 2)
      v12 = &kHexPointyAdjacencyMask;
    do
    {
      v13 = *a4++;
      if (v13 == v9)
        v10 |= *v12;
      ++v12;
      --v11;
    }
    while (v11);
    v14 = (unsigned __int16)objc_msgSend(v6, "findTileDefinitionIndexForAdjacencyData:tileSetType:", v10, -[SKTileSet type](self, "type"));
    if (v14 < -[NSMutableArray count](self->_definitions, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_definitions, "objectAtIndexedSubscript:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_15:
      v7 = 0;
    }
  }

  return v7;
}

- (id)findTileDefinitionsForGroup:(id)a3 withGroupAdjacency:(unint64_t *)a4
{
  id v6;
  void *v7;
  NSMutableArray *groups;
  unsigned __int16 v9;
  unsigned __int8 v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  unint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
  {
    if (a4)
    {
      if (self->_definitions)
      {
        groups = self->_groups;
        if (groups)
        {
          if (-[NSMutableArray containsObject:](groups, "containsObject:", v6))
          {
            v9 = -[NSMutableArray indexOfObject:](self->_groups, "indexOfObject:", v6);
            v10 = 0;
            v11 = 8;
            if (self->_type - 2 < 2)
              v11 = 6;
            v12 = &kAdjacencyMask;
            if (self->_type - 2 < 2)
              v12 = &kHexPointyAdjacencyMask;
            do
            {
              v13 = *a4++;
              if (v13 == v9)
                v10 |= *v12;
              ++v12;
              --v11;
            }
            while (v11);
            objc_msgSend(v6, "findTileDefinitionIDsForAdjacencyData:tileSetType:", v10, -[SKTileSet type](self, "type"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v25;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v25 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                  if (v20)
                  {
                    v21 = objc_msgSend(v20, "unsignedIntegerValue", (_QWORD)v24);
                    if (v21 <= -[NSMutableArray count](self->_definitions, "count"))
                    {
                      -[NSMutableArray objectAtIndexedSubscript:](self->_definitions, "objectAtIndexedSubscript:", v21);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "addObject:", v22);

                    }
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
              }
              while (v17);
            }

          }
        }
      }
    }
  }

  return v7;
}

- (id)getCenterTileDefinitionForGroup:(id)a3 withRequiredOutputGroupAdjacency:(unint64_t *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *groups;
  int v13;
  unsigned __int16 v14;
  void *v15;
  uint64_t v16;
  int64x2_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "rules");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "rules");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      if (!a4 || !v11 || !self->_definitions || (groups = self->_groups) == 0)
      {

        goto LABEL_16;
      }
      v13 = -[NSMutableArray containsObject:](groups, "containsObject:", v7);

      if (v13)
      {
        v14 = -[NSMutableArray indexOfObject:](self->_groups, "indexOfObject:", v7);
        objc_msgSend(v7, "rules");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0;
        v17 = vdupq_n_s64(v14);
        do
        {
          *(int64x2_t *)&a4[v16] = v17;
          v16 += 2;
        }
        while (v16 != 8);
        objc_msgSend(v9, "tileDefinitionIDs");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v9, "tileDefinitionIDs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            objc_msgSend(v9, "tileDefinitionIDs");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "integerValue");

            if (v24 < -[NSMutableArray count](self->_definitions, "count"))
            {
              -[NSMutableArray objectAtIndexedSubscript:](self->_definitions, "objectAtIndexedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

              goto LABEL_18;
            }
          }
        }
LABEL_16:
        v25 = 0;
        goto LABEL_17;
      }
    }
  }
  v25 = 0;
LABEL_18:

  return v25;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("images"), a4, a5, a6);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultTileGroup, 0);
  objc_storeStrong((id *)&self->_stamps, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_definitions, 0);
}

@end
