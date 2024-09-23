@implementation MUIMailboxFilterGroup

- (MUIMailboxFilterGroup)initWithName:(id)a3 combinator:(int64_t)a4 selectionCardinality:(int64_t)a5 filters:(id)a6
{
  id v11;
  id v12;
  MUIMailboxFilterGroup *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSArray *filters;
  void *v19;
  objc_super v20;

  v11 = a3;
  v12 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMailboxFilterGroup.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filters"));

  }
  v20.receiver = self;
  v20.super_class = (Class)MUIMailboxFilterGroup;
  v13 = -[MUIMailboxFilterGroup init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(v12, "copy");
    filters = v13->_filters;
    v13->_filters = (NSArray *)v16;

    v13->_combinator = a4;
    v13->_selectionCardinality = a5;
  }

  return v13;
}

+ (id)groupWithName:(id)a3 combinator:(int64_t)a4 selectionCardinality:(int64_t)a5 filters:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:combinator:selectionCardinality:filters:", v11, a4, a5, v10);

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MUIMailboxFilterGroup filters](self, "filters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_prefix:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v7 ^= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "hash");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[MUIMailboxFilterGroup name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = -[MUIMailboxFilterGroup combinator](self, "combinator");
  v13 = -[MUIMailboxFilterGroup selectionCardinality](self, "selectionCardinality");

  return v11 ^ v7 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MUIMailboxFilterGroup *v5;
  MUIMailboxFilterGroup *v6;
  MUIMailboxFilterGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  BOOL v16;

  v5 = (MUIMailboxFilterGroup *)a3;
  v6 = v5;
  if (v5)
  {
    if (self == v5)
    {
      v16 = 1;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[MUIMailboxFilterGroup name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[MUIMailboxFilterGroup name](v7, "name");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
          goto LABEL_8;
      }
      -[MUIMailboxFilterGroup name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUIMailboxFilterGroup name](v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (v8)
      {

        if (v11)
          goto LABEL_8;
      }
      else
      {

        if ((v11 & 1) != 0)
        {
LABEL_8:
          -[MUIMailboxFilterGroup filters](self, "filters");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUIMailboxFilterGroup filters](v7, "filters");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqual:", v13)
            && (v14 = -[MUIMailboxFilterGroup combinator](self, "combinator"),
                v14 == -[MUIMailboxFilterGroup combinator](v7, "combinator")))
          {
            v15 = -[MUIMailboxFilterGroup selectionCardinality](self, "selectionCardinality");
            v16 = v15 == -[MUIMailboxFilterGroup selectionCardinality](v7, "selectionCardinality");
          }
          else
          {
            v16 = 0;
          }

          goto LABEL_17;
        }
      }
      v16 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  v16 = 0;
LABEL_18:

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)filters
{
  return self->_filters;
}

- (int64_t)combinator
{
  return self->_combinator;
}

- (int64_t)selectionCardinality
{
  return self->_selectionCardinality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
