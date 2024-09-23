@implementation _CLMicroLocationSourceIdAndSourceData

- (_CLMicroLocationSourceIdAndSourceData)initWithSourceIdsIdentifier:(id)a3 sourceData:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _CLMicroLocationSourceIdAndSourceData *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_CLMicroLocationSourceIdAndSourceData;
  v9 = -[_CLMicroLocationSourceIdAndSourceData init](&v14, sel_init);
  if (v9)
  {
    v9->_sourceIdsIdentifier = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v9->_sourceData = (NSArray *)objc_msgSend_copy(a4, v10, v11, v12);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLMicroLocationSourceIdAndSourceData;
  -[_CLMicroLocationSourceIdAndSourceData dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (void *)objc_msgSend_sourceIdsIdentifier(self, v9, v10, v11);
  v15 = (id)objc_msgSend_copyWithZone_(v12, v13, (uint64_t)a3, v14);
  v19 = (void *)objc_msgSend_sourceData(self, v16, v17, v18);
  v22 = (id)objc_msgSend_copyWithZone_(v19, v20, (uint64_t)a3, v21);
  return (id)objc_msgSend_initWithSourceIdsIdentifier_sourceData_(v8, v23, (uint64_t)v15, (uint64_t)v22);
}

- (_CLMicroLocationSourceIdAndSourceData)initWithCoder:(id)a3
{
  _CLMicroLocationSourceIdAndSourceData *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CLMicroLocationSourceIdAndSourceData;
  v4 = -[_CLMicroLocationSourceIdAndSourceData init](&v15, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_sourceIdsIdentifier = (NSString *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("sourceId"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v4->_sourceData = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v13, v12, (uint64_t)CFSTR("sourceData"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_sourceIdsIdentifier, (uint64_t)CFSTR("sourceId"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_sourceData, (uint64_t)CFSTR("sourceData"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("sourceIdentifier: %@\n"), v2, self->_sourceIdsIdentifier);
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (void *)objc_msgSend_sourceData(self, v6, v7, v8);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v9);
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = objc_msgSend_description(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v17), v12, v13, v14);
        v22 = objc_msgSend_stringWithFormat_(v18, v20, (uint64_t)CFSTR("\t%@\n"), v21, v19);
        objc_msgSend_appendString_(v5, v23, v22, v24);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v15);
  }
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%@%@"), v14, v4, v5);
}

- (NSString)sourceIdsIdentifier
{
  return self->_sourceIdsIdentifier;
}

- (NSArray)sourceData
{
  return self->_sourceData;
}

@end
