@implementation CADCompoundFilter

- (CADCompoundFilter)initWithFilters:(id)a3 operation:(int64_t)a4
{
  id v6;
  CADCompoundFilter *v7;
  uint64_t v8;
  NSArray *filters;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADCompoundFilter;
  v7 = -[CADCompoundFilter init](&v11, sel_init);
  if (v7)
  {
    if (!objc_msgSend(v6, "count"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("filters must contain at least one value"));
    v8 = objc_msgSend(v6, "copy");
    filters = v7->_filters;
    v7->_filters = (NSArray *)v8;

    v7->_operation = a4;
  }

  return v7;
}

- (BOOL)validate
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_filters, "count"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_filters;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "validate", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)applicableToEntityType:(int)a3
{
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_filters;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "applicableToEntityType:", v3, (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!-[NSArray count](self->_filters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CADCompoundFilter.m"), 46, CFSTR("No filters"));

  }
  _CADPropertySearchPredicateExtendWhereClause(v11, a4, CFSTR("("));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = self->_operation != 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = self->_filters;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    v20 = 2;
    do
    {
      v21 = 0;
      v22 = v14;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21), "extendWhereClause:usingOperation:withValues:andTypes:", v22, v20, v12, v13, (_QWORD)v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        ++v21;
        v20 = v15;
        v22 = v14;
      }
      while (v18 != v21);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v20 = v15;
    }
    while (v18);
  }

  _CADPropertySearchPredicateExtendWhereClause(v14, 2, CFSTR(")"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (CADCompoundFilter)initWithCoder:(id)a3
{
  id v4;
  CADCompoundFilter *v5;
  void *v6;
  uint64_t v7;
  NSArray *filters;
  CADCompoundFilter *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADCompoundFilter;
  v5 = -[CADFilter initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  _CADPropertySearchPredicateGetAllowedFilterTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("filters"));
  v7 = objc_claimAutoreleasedReturnValue();
  filters = v5->_filters;
  v5->_filters = (NSArray *)v7;

  v5->_operation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operation"));
  if (!-[CADCompoundFilter validate](v5, "validate"))
    v9 = 0;
  else
LABEL_3:
    v9 = v5;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADCompoundFilter;
  v4 = a3;
  -[CADFilter encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_filters, CFSTR("filters"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_operation, CFSTR("operation"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)filters
{
  return self->_filters;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

@end
