@implementation NSFetchIndexDescription

- (uint64_t)_isMappedSinglePropertyIndex
{
  void *v2;

  if (a1
    && objc_msgSend(*(id *)(a1 + 16), "count") == 1
    && (v2 = (void *)objc_msgSend(*(id *)(a1 + 16), "firstObject"), !objc_msgSend(v2, "collationType")))
  {
    return objc_msgSend(v2, "isAscending");
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_checkElements:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = objc_msgSend(a2, "count") ? objc_msgSend((id)objc_msgSend(a2, "firstObject"), "collationType") : 0;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v19;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v19 != v5)
            objc_enumerationMutation(a2);
          v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
          v8 = (void *)objc_msgSend(v7, "property");
          if (v8)
          {
            v9 = v8;
            v10 = objc_msgSend(v8, "_propertyType");
            if ((unint64_t)(v10 - 4) >= 3 && v10 != 2)
            {
              v12 = (void *)MEMORY[0x1E0C99DA0];
              v13 = *MEMORY[0x1E0C99778];
              v22 = CFSTR("Property");
              v23 = v9;
              v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
              v15 = CFSTR("Unsupported property type for index.");
              v16 = v12;
              v17 = v13;
              goto LABEL_21;
            }
            if (v3 != objc_msgSend(v7, "collationType"))
            {
              v16 = (void *)MEMORY[0x1E0C99DA0];
              v17 = *MEMORY[0x1E0C99778];
              v15 = CFSTR("Can't mix and match collation types.");
              v14 = 0;
LABEL_21:
              objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, v14));
            }
          }
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSArray)elements
{
  return self->_elements;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchIndexDescription)initWithCoder:(id)a3
{
  NSFetchIndexDescription *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *elements;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  void (*v32)(uint64_t);
  void *v33;
  _QWORD *v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)NSFetchIndexDescription;
  v4 = -[NSFetchIndexDescription init](&v35, sel_init);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v32 = __41__NSFetchIndexDescription_initWithCoder___block_invoke;
    v33 = &unk_1E1EDD520;
    v34 = v5;
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), CFSTR("NSIndexName"));
    v4->_name = v8;
    if (v8 && (-[NSString isNSString](v8, "isNSString") & 1) == 0)
    {
      v22 = &unk_1E1F4AAC0;
      goto LABEL_28;
    }
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = 0x1E0C99000uLL;
    v12 = objc_opt_class();
    v13 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, v12, objc_opt_class(), 0), CFSTR("NSIndexElements"));
    v4->_elements = v13;
    if (v13)
    {
      if (!-[NSArray isNSArray](v13, "isNSArray"))
      {
        v22 = &unk_1E1F4AAE8;
        goto LABEL_28;
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      elements = v4->_elements;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v28;
        while (2)
        {
          v17 = v11;
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(elements);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4AB10));

              goto LABEL_29;
            }
          }
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          v11 = v17;
          if (v15)
            continue;
          break;
        }
      }
    }
    v19 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSEntity"));
    v4->_entity = (NSEntityDescription *)v19;
    if (!v19)
      goto LABEL_23;
    if (v5)
      v20 = (void *)v5[3];
    else
      v20 = 0;
    objc_msgSend(v20, "addObject:", v19);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v22 = &unk_1E1F4AB60;
    else
      v22 = &unk_1E1F4AB38;
    if (v5 != 0 && (isKindOfClass & 1) != 0)
    {
      if (v5[2] || v5[1])
      {
LABEL_23:
        v23 = (void *)MEMORY[0x1E0C99E60];
        v24 = objc_opt_class();
        v4->_partialIndexPredicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0), CFSTR("NSPartialIndexPredicate"));
        if (v5)
          v25 = (void *)v5[3];
        else
          v25 = 0;
        objc_msgSend(v25, "addObject:", v4);
LABEL_30:
        v32((uint64_t)v31);
        return v4;
      }
      v22 = &unk_1E1F4AB60;
    }
LABEL_28:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, v22));

LABEL_29:
    v4 = 0;
    goto LABEL_30;
  }
  return v4;
}

void __41__NSFetchIndexDescription_initWithCoder___block_invoke(uint64_t a1)
{

}

- (NSFetchIndexDescription)initWithName:(NSString *)name elements:(NSArray *)elements
{
  NSFetchIndexDescription *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!name)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't create an index with no name"), 0));
  }
  -[NSFetchIndexDescription _checkElements:]((uint64_t)self, elements);
  v16.receiver = self;
  v16.super_class = (Class)NSFetchIndexDescription;
  v7 = -[NSFetchIndexDescription init](&v16, sel_init);
  if (v7)
  {
    v7->_name = name;
    v7->_elements = (NSArray *)-[NSArray copy](elements, "copy");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(elements);
          -[NSFetchIndexElementDescription _setIndexDescription:](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), v7);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }
  }
  return v7;
}

- (NSFetchIndexDescription)initWithName:(id)a3 predicate:(id)a4 elements:(id)a5 entity:(id)a6
{
  NSFetchIndexDescription *v10;
  NSPredicate *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)NSFetchIndexDescription;
  v10 = -[NSFetchIndexDescription init](&v21, sel_init);
  if (v10)
  {
    v10->_name = (NSString *)a3;
    v10->_elements = (NSArray *)objc_msgSend(a5, "copy");
    v11 = (NSPredicate *)a4;
    v10->_entity = (NSEntityDescription *)a6;
    v10->_partialIndexPredicate = v11;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(a5);
          -[NSFetchIndexElementDescription _setIndexDescription:](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), v10);
        }
        while (v13 != v15);
        v13 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }
  }
  return v10;
}

- (void)_setEntity:(id)a3
{
  NSArray *elements;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_entity = (NSEntityDescription *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  elements = self->_elements;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(elements);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSFetchIndexElementDescription _setIndexDescription:]((uint64_t)v9, self);
        objc_msgSend(v9, "property");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (void)dealloc
{
  objc_super v3;

  self->_elements = 0;
  self->_name = 0;

  self->_entity = 0;
  self->_partialIndexPredicate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFetchIndexDescription;
  -[NSFetchIndexDescription dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  NSArray *elements;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = -[NSString copy](self->_name, "copy");
    v4[3] = self->_entity;
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    elements = self->_elements;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(elements);
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "copy");
          objc_msgSend(v5, "addObject:", v11);
          -[NSFetchIndexElementDescription _setIndexDescription:]((uint64_t)v11, v4);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    v4[2] = v5;
    v4[4] = -[NSPredicate copy](self->_partialIndexPredicate, "copy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("NSIndexName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_elements, CFSTR("NSIndexElements"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_entity, CFSTR("NSEntity"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_partialIndexPredicate, CFSTR("NSPartialIndexPredicate"));
}

- (BOOL)isEqual:(id)a3
{
  NSString *name;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  NSArray *elements;
  uint64_t v11;
  NSPredicate *partialIndexPredicate;
  uint64_t v13;

  if (a3 == self)
    goto LABEL_21;
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  name = self->_name;
  v6 = objc_msgSend(a3, "name");
  if (name == (NSString *)v6
    || (v7 = v6, LOBYTE(v6) = 0, name) && v7 && (LODWORD(v6) = -[NSString isEqual:](name, "isEqual:"), (_DWORD)v6))
  {
    v8 = -[NSEntityDescription name](self->_entity, "name");
    v6 = objc_msgSend((id)objc_msgSend(a3, "entity"), "name");
    if (v8 == (NSString *)v6
      || (v9 = v6, LOBYTE(v6) = 0, v8) && v9 && (LODWORD(v6) = -[NSString isEqual:](v8, "isEqual:"), (_DWORD)v6))
    {
      elements = self->_elements;
      v6 = objc_msgSend(a3, "elements");
      if (elements == (NSArray *)v6
        || (v11 = v6, LOBYTE(v6) = 0, elements)
        && v11
        && (LODWORD(v6) = -[NSArray isEqual:](elements, "isEqual:"), (_DWORD)v6))
      {
        partialIndexPredicate = self->_partialIndexPredicate;
        v6 = objc_msgSend(a3, "partialIndexPredicate");
        if (partialIndexPredicate != (NSPredicate *)v6)
        {
          v13 = v6;
          LOBYTE(v6) = 0;
          if (partialIndexPredicate && v13)
            LOBYTE(v6) = -[NSPredicate isEqual:](partialIndexPredicate, "isEqual:");
          return v6;
        }
LABEL_21:
        LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSFetchIndexDescription : (%@:%@, elements: %@, predicate: %@)>"), -[NSEntityDescription name](self->_entity, "name"), self->_name, self->_elements, self->_partialIndexPredicate);
}

- (BOOL)_isEditable
{
  NSEntityDescription *entity;

  entity = self->_entity;
  return !entity || -[NSEntityDescription _isEditable](entity, "_isEditable");
}

- (void)_throwIfNotEditable
{
  -[NSEntityDescription _throwIfNotEditable](self->_entity, "_throwIfNotEditable");
}

- (void)setName:(NSString *)name
{
  NSEntityDescription *entity;
  uint64_t rootentity;
  NSString *v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[NSFetchIndexDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (!name)
  {
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("IndexDescription");
    v10[0] = self;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v8, CFSTR("Can't set an index name to nil"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  if ((-[NSString isEqual:](self->_name, "isEqual:", name) & 1) == 0)
  {
    entity = self->_entity;
    if (entity)
    {
      if ((*(_BYTE *)&entity->_entityDescriptionFlags & 4) != 0)
      {
        rootentity = (uint64_t)entity->_rootentity;
      }
      else
      {
        do
        {
          rootentity = (uint64_t)entity;
          entity = -[NSEntityDescription superentity](entity, "superentity");
        }
        while (entity);
      }
    }
    else
    {
      rootentity = 0;
    }
    -[NSEntityDescription _validateIndexNameChangeFrom:to:](rootentity, self->_name, (uint64_t)name);
    v7 = name;

    self->_name = name;
  }
}

- (void)setElements:(NSArray *)elements
{
  NSArray *v5;

  -[NSFetchIndexDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  -[NSFetchIndexDescription _checkElements:]((uint64_t)self, elements);
  v5 = (NSArray *)-[NSArray copy](elements, "copy");

  self->_elements = v5;
}

- (NSPredicate)partialIndexPredicate
{
  return self->_partialIndexPredicate;
}

- (void)setPartialIndexPredicate:(NSPredicate *)partialIndexPredicate
{
  NSPredicate *v5;

  -[NSFetchIndexDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_partialIndexPredicate != partialIndexPredicate)
  {
    v5 = partialIndexPredicate;

    self->_partialIndexPredicate = partialIndexPredicate;
  }
}

- (unint64_t)_validateCollationTypeChangeFrom:(uint64_t)a3 to:
{
  unint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    result = objc_msgSend(*(id *)(result + 16), "count");
    if (a2 != a3 && result <= 1)
    {
      v6 = *MEMORY[0x1E0C99778];
      v7 = CFSTR("Index");
      v8[0] = v5;
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v6, CFSTR("Can't change an collation type in a multi-element index"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1)));
    }
  }
  return result;
}

- (uint64_t)_isPurelyModeledIndex
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = *(void **)(result + 16);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "property"), "_propertyType") == 5)
            return 0;
        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        if (v3)
          continue;
        break;
      }
    }
    return 1;
  }
  return result;
}

- (uint64_t)_isIndexForProperty:(uint64_t)a1
{
  void *v4;

  if (a1
    && objc_msgSend(*(id *)(a1 + 16), "count") == 1
    && (v4 = (void *)objc_msgSend(*(id *)(a1 + 16), "firstObject"),
        objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "property"), "name")))&& !objc_msgSend(v4, "collationType"))
  {
    return objc_msgSend(v4, "isAscending");
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_compoundIndexRepresentation
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
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
  if (!a1
    || !objc_msgSend(*(id *)(a1 + 16), "count")
    || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "firstObject"), "collationType")
    || objc_msgSend(*(id *)(a1 + 16), "count") == 1)
  {
    return 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = *(void **)(a1 + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "property");
        v10 = objc_msgSend(v9, "_propertyType");
        if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 2
          && (v10 != 5
           || !+[_PFRoutines _expressionIsCompoundIndexCompatible:]((uint64_t)_PFRoutines, (void *)objc_msgSend(v9, "expression"))))
        {
          return 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }
  v2 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *(void **)(a1 + 16);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (!v12)
    return v2;
  v13 = v12;
  v14 = *(_QWORD *)v24;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v11);
      v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "property");
      v17 = objc_msgSend(v16, "_propertyType");
      if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 2)
      {
        v18 = objc_msgSend(v16, "name");
        goto LABEL_24;
      }
      if (v17 == 5
        && +[_PFRoutines _expressionIsCompoundIndexCompatible:]((uint64_t)_PFRoutines, (void *)objc_msgSend(v16, "expression")))
      {
        v21 = objc_msgSend((id)objc_msgSend(v16, "expression"), "expressionType");
        if (v21 == 3)
        {
          v18 = objc_msgSend((id)objc_msgSend(v16, "expression"), "keyPath");
LABEL_24:
          v19 = (const __CFString *)v18;
          v20 = (void *)v2;
LABEL_25:
          objc_msgSend(v20, "addObject:", v19);
          goto LABEL_31;
        }
        if (v21 == 1)
        {
          v20 = (void *)v2;
          v19 = CFSTR("self");
          goto LABEL_25;
        }
      }
LABEL_31:
      ++v15;
    }
    while (v13 != v15);
    v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    v13 = v22;
  }
  while (v22);
  return v2;
}

- (uint64_t)_isUnique
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = *(void **)(result + 16);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v7;
      while (2)
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v7 != v3)
            objc_enumerationMutation(v1);
          v5 = *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v4);
          if (v5 && (*(_BYTE *)(v5 + 40) & 4) != 0)
            return 1;
          ++v4;
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v2 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_setIsUnique:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(void **)(result + 16);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v10;
      if (a2)
        v6 = 4;
      else
        v6 = 0;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if (v8)
            *(_DWORD *)(v8 + 40) = *(_DWORD *)(v8 + 40) & 0xFFFFFFFB | v6;
          ++v7;
        }
        while (v4 != v7);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (int64_t)_compare:(id)a3
{
  NSUInteger v5;
  NSArray *elements;
  int64_t result;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  if (!-[NSString isEqualToString:](-[NSEntityDescription name](-[NSFetchIndexDescription entity](self, "entity"), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "entity"), "name")))return -[NSString compare:](-[NSEntityDescription name](-[NSFetchIndexDescription entity](self, "entity"), "name"), "compare:", objc_msgSend((id)objc_msgSend(a3, "entity"), "name"));
  v5 = -[NSArray count](self->_elements, "count");
  if (v5 == objc_msgSend(*((id *)a3 + 2), "count"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    elements = self->_elements;
    result = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (result)
    {
      v8 = result;
      v9 = *(_QWORD *)v31;
      v23 = *(_QWORD *)v31;
      while (1)
      {
        v10 = 0;
        v24 = v8;
        while (2)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(elements);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = (void *)*((_QWORD *)a3 + 2);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (!v13)
            return -1;
          v14 = v13;
          v25 = v10;
          v15 = 0;
          v16 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v12);
              v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v11, "propertyName"), "isEqualToString:", objc_msgSend(v18, "propertyName")))
              {
                v19 = objc_msgSend(v11, "collationType");
                if (v19 != objc_msgSend(v18, "collationType"))
                {
                  v22 = objc_msgSend(v11, "collationType");
                  v21 = v22 >= objc_msgSend(v18, "collationType");
                  goto LABEL_27;
                }
                v15 = 1;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v14)
              continue;
            break;
          }
          if ((v15 & 1) == 0)
            return -1;
          v10 = v25 + 1;
          v9 = v23;
          if (v25 + 1 != v24)
            continue;
          break;
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        result = 0;
        if (!v8)
          return result;
      }
    }
  }
  else
  {
    v20 = -[NSArray count](self->_elements, "count");
    v21 = v20 >= objc_msgSend(*((id *)a3 + 2), "count");
LABEL_27:
    if (v21)
      return 1;
    else
      return -1;
  }
  return result;
}

@end
