@implementation DNDDiffBuilder

- (DNDDiffBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DNDDiffBuilder;
  return -[DNDDiffBuilder init](&v3, sel_init);
}

- (NSArray)children
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_children, "copy");
}

- (BOOL)hasDifferences
{
  return self->_object1 || self->_object2 || -[NSMutableArray count](self->_children, "count") != 0;
}

- (id)descriptionWithIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  NSString *description;
  char v15;
  id object1;
  void *v17;
  char v18;
  id object2;
  void *v20;
  NSString *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(&stru_1E39B74A8, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR("\t"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_children)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_children;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      v11 = a3 + 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "descriptionWithIndent:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("\n%@;\n"), v13);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    description = self->_description;
    if (description)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@: {%@%@}"), v5, description, v6, v5, (_QWORD)v24);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@{%@%@}"), v5, v6, v5, v23, (_QWORD)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_respondsToSelector();
    object1 = self->_object1;
    if ((v15 & 1) != 0)
      objc_msgSend(object1, "diffDescription");
    else
      objc_msgSend(object1, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();
    object2 = self->_object2;
    if ((v18 & 1) != 0)
      objc_msgSend(object2, "diffDescription");
    else
      objc_msgSend(object2, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_description;
    if (v21)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@: object1: %@; object2: %@"), v5, v21, v6, v20);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@object1: %@; object2: %@"), v5, v6, v20, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (NSString)description
{
  return (NSString *)-[DNDDiffBuilder descriptionWithIndent:](self, "descriptionWithIndent:", 0);
}

- (void)diffObject:(id)a3 againstObject:(id)a4
{
  -[DNDDiffBuilder diffObject:againstObject:withDescription:](self, "diffObject:againstObject:withDescription:", a3, a4, 0);
}

- (void)diffObject:(id)a3 againstObject:(id)a4 withDescription:(id)a5
{
  id v9;
  id v10;
  DNDDiffBuilder *v11;
  uint64_t v12;
  NSString *description;
  NSMutableArray *children;
  NSMutableArray *v15;
  NSMutableArray *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  if (v17 != v9)
  {
    if (!v17
      || !v9
      || (objc_msgSend(v17, "isEqual:", v9) & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v11 = objc_alloc_init(DNDDiffBuilder);
      objc_storeStrong(&v11->_object1, a3);
      objc_storeStrong(&v11->_object2, a4);
      v12 = objc_msgSend(v10, "copy");
      description = v11->_description;
      v11->_description = (NSString *)v12;

      children = self->_children;
      if (!children)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v16 = self->_children;
        self->_children = v15;

        children = self->_children;
      }
      -[NSMutableArray addObject:](children, "addObject:", v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v17, "diffAgainstObject:usingDiffBuilder:withDescription:", v9, v11, v10);

    }
  }

}

- (void)log:(id)a3 withPrefix:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin diff", buf, 0xCu);
  }
  -[DNDDiffBuilder description](self, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          *(_DWORD *)buf = 138543619;
          v21 = v7;
          v22 = 2113;
          v23 = v15;
          _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{private}@", buf, 0x16u);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] End diff", buf, 0xCu);
  }

}

- (id)object1
{
  return self->_object1;
}

- (id)object2
{
  return self->_object2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong(&self->_object2, 0);
  objc_storeStrong(&self->_object1, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
