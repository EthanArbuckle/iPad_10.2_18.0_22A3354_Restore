@implementation NSBatchUpdateRequestEncodingToken

- (id)initForRequest:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int64_t v19;
  NSBatchUpdateRequestEncodingToken *v20;
  NSBatchUpdateRequestEncodingToken *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "propertiesToUpdate"), "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v22 = self;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Unsupported Expression with the XPC Store: %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

          return 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = objc_msgSend(v11, "constantValue") == 0;
        else
          v18 = objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
        v8 += v18;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v7)
        continue;
      break;
    }
    v19 = v8;
    self = v22;
  }
  else
  {
    v19 = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)NSBatchUpdateRequestEncodingToken;
  v20 = -[NSBatchUpdateRequestEncodingToken init](&v23, sel_init);
  if (v20)
  {
    v20->_entityName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "entityName"), "copy");
    v20->_predicate = (NSPredicate *)objc_msgSend((id)objc_msgSend(a3, "predicate"), "copy");
    v20->_columnsToUpdate = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "propertiesToUpdate"), "copy");
    v20->_resultType = objc_msgSend(a3, "resultType");
    v20->_nullValueCount = v19;
    v20->_includeSubEntities = objc_msgSend(a3, "includesSubentities");
    v20->_secure = objc_msgSend(a3, "_secureOperation");
  }
  return v20;
}

- (void)dealloc
{
  objc_super v3;

  self->_entityName = 0;
  self->_predicate = 0;

  self->_columnsToUpdate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchUpdateRequestEncodingToken;
  -[NSBatchUpdateRequestEncodingToken dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSBatchUpdateRequestEncodingToken)initWithCoder:(id)a3
{
  NSBatchUpdateRequestEncodingToken *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NSBatchUpdateRequestEncodingToken;
  v4 = -[NSBatchUpdateRequestEncodingToken init](&v14, sel_init);
  if (v4)
  {
    v4->_entityName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityName"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_predicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("predicate"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    if (objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "count"))
      v12 = (void *)objc_msgSend(v12, "setByAddingObjectsFromSet:", objc_msgSend(a3, "allowedClasses"));
    v4->_columnsToUpdate = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("columnsToUpdate"));
    v4->_nullValueCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("nullValueCount"));
    v4->_resultType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("resultType"));
    v4->_includeSubEntities = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("includeSubEntities"));
    v4->_secure = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("secure"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  NSDictionary *columnsToUpdate;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "encodeObject:forKey:", self->_entityName, CFSTR("entityName"));
  v19 = a3;
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_columnsToUpdate, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  columnsToUpdate = self->_columnsToUpdate;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](columnsToUpdate, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(columnsToUpdate);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = -[NSDictionary objectForKey:](self->_columnsToUpdate, "objectForKey:", v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          _NSCoreDataLog(1, (uint64_t)CFSTR("Unsupported Expression for the XPC Store: %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);
        else
          objc_msgSend(v5, "setObject:forKey:", v12, objc_msgSend(v11, "name"));
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](columnsToUpdate, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  objc_msgSend(v19, "encodeObject:forKey:", v5, CFSTR("columnsToUpdate"));

  objc_msgSend(v19, "encodeInteger:forKey:", self->_nullValueCount, CFSTR("nullValueCount"));
  objc_msgSend(v19, "encodeInteger:forKey:", self->_resultType, CFSTR("resultType"));
  objc_msgSend(v19, "encodeBool:forKey:", self->_includeSubEntities, CFSTR("includeSubEntities"));
  objc_msgSend(v19, "encodeBool:forKey:", self->_secure, CFSTR("secure"));
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSDictionary)columnsToUpdate
{
  return self->_columnsToUpdate;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (int64_t)nullValueCount
{
  return self->_nullValueCount;
}

- (BOOL)includeSubEntities
{
  return self->_includeSubEntities;
}

- (BOOL)secure
{
  return self->_secure;
}

@end
