@implementation GEOAvailableExperiment

- (GEOAvailableExperiment)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  GEOAvailableExperiment *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *name;
  GEOAvailableExperiment *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOAvailableExperiment;
  v8 = -[GEOAvailableExperiment init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v17.receiver = self;
  v17.super_class = (Class)GEOAvailableExperiment;
  -[GEOAvailableExperiment description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@\n"), v4, self->_identifier, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_branches;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "_descriptionWithIndent:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\t-> %@\n"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_addBranch:(id)a3
{
  id v4;
  NSMutableArray *branches;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  branches = self->_branches;
  v8 = v4;
  if (!branches)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_branches;
    self->_branches = v6;

    v4 = v8;
    branches = self->_branches;
  }
  -[NSMutableArray addObject:](branches, "addObject:", v4);

}

- (id)_branchForLabel:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_branches;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "label", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)branches
{
  return &self->_branches->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_branches, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
