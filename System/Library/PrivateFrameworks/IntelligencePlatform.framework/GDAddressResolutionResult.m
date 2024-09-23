@implementation GDAddressResolutionResult

- (void)encodeWithCoder:(id)a3
{
  NSArray *rankedEntities;
  id v4;
  const char *v5;
  id v6;

  rankedEntities = self->_rankedEntities;
  v4 = a3;
  NSStringFromSelector(sel_rankedEntities);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)rankedEntities, v6);

}

- (GDAddressResolutionResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  GDAddressResolutionResult *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend_setWithObjects_(v5, v9, v6, v7, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rankedEntities);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    self = (GDAddressResolutionResult *)(id)objc_msgSend_initWithRankedEntities_(self, v14, (uint64_t)v13);
    v16 = self;
  }
  else
  {
    objc_msgSend_error(v4, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("GDAddressResolutionResult rankedEntities could not be decoded");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v26, &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, (uint64_t)CFSTR("GDErrorDomain"), 9, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v23, (uint64_t)v22);

    }
    v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_allocWithZone_(GDAddressResolutionResult, a2, (uint64_t)a3);
  return (id)objc_msgSend_initWithRankedEntities_(v4, v5, (uint64_t)self->_rankedEntities);
}

- (BOOL)isEqual:(id)a3
{
  GDAddressResolutionResult *v4;
  const char *v5;
  char isEqualToAddressResolutionResult;

  v4 = (GDAddressResolutionResult *)a3;
  if (v4 == self)
  {
    isEqualToAddressResolutionResult = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToAddressResolutionResult = objc_msgSend_isEqualToAddressResolutionResult_(self, v5, (uint64_t)v4);
    else
      isEqualToAddressResolutionResult = 0;
  }

  return isEqualToAddressResolutionResult;
}

- (BOOL)isEqualToAddressResolutionResult:(id)a3
{
  GDAddressResolutionResult *v4;
  const char *v5;
  uint64_t v6;
  GDAddressResolutionResult *v7;
  NSArray *rankedEntities;
  void *v9;
  const char *v10;
  char isEqualToArray;

  v4 = (GDAddressResolutionResult *)a3;
  v7 = v4;
  if (v4 == self)
  {
    isEqualToArray = 1;
  }
  else if (v4)
  {
    rankedEntities = self->_rankedEntities;
    objc_msgSend_rankedEntities(v4, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToArray = objc_msgSend_isEqualToArray_(rankedEntities, v10, (uint64_t)v9);

  }
  else
  {
    isEqualToArray = 0;
  }

  return isEqualToArray;
}

- (unint64_t)hash
{
  uint64_t v2;

  return objc_msgSend_hash(self->_rankedEntities, a2, v2);
}

- (GDAddressResolutionResult)initWithRankedEntities:(id)a3
{
  id v5;
  GDAddressResolutionResult *v6;
  GDAddressResolutionResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAddressResolutionResult;
  v6 = -[GDAddressResolutionResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rankedEntities, a3);

  return v7;
}

- (NSString)topRankedMdId
{
  uint64_t v2;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  if (objc_msgSend_count(self->_rankedEntities, a2, v2))
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_rankedEntities, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mdId(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (NSString)topRankedContactId
{
  uint64_t v2;
  NSArray *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_count(self->_rankedEntities, a2, v2))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = self->_rankedEntities;
    v8 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend_contactId(v11, v6, v7, (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend_length(v12, v13, v14);

          if (v15)
          {
            objc_msgSend_contactId(v11, v6, v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v8 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (id)description
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v3 = (void *)objc_opt_new();
  objc_msgSend_appendString_(v3, v4, (uint64_t)CFSTR("<GDAddressResolutionResult:"));
  objc_msgSend_appendString_(v3, v5, (uint64_t)CFSTR("rankedEntities: ["));
  if (objc_msgSend_count(self->_rankedEntities, v6, v7))
  {
    v9 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_rankedEntities, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v3, v14, (uint64_t)CFSTR("'%@'"), v13);

      if (v9 < objc_msgSend_count(self->_rankedEntities, v15, v16) - 1)
        objc_msgSend_appendString_(v3, v17, (uint64_t)CFSTR(","));
      ++v9;
    }
    while (v9 < objc_msgSend_count(self->_rankedEntities, v17, v18));
  }
  objc_msgSend_appendString_(v3, v8, (uint64_t)CFSTR("]>"));
  return v3;
}

- (NSArray)rankedEntities
{
  return self->_rankedEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedEntities, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
