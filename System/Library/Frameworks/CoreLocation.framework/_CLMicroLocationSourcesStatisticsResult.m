@implementation _CLMicroLocationSourcesStatisticsResult

- (_CLMicroLocationSourcesStatisticsResult)initWithSourcesData:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _CLMicroLocationSourcesStatisticsResult *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CLMicroLocationSourcesStatisticsResult;
  v7 = -[_CLMicroLocationSourcesStatisticsResult init](&v9, sel_init);
  if (v7)
    v7->_sourcesData = (NSArray *)objc_msgSend_copy(a3, v4, v5, v6);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLMicroLocationSourcesStatisticsResult;
  -[_CLMicroLocationSourcesStatisticsResult dealloc](&v3, sel_dealloc);
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

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (void *)objc_msgSend_sourcesData(self, v9, v10, v11);
  v15 = (id)objc_msgSend_copyWithZone_(v12, v13, (uint64_t)a3, v14);
  return (id)objc_msgSend_initWithSourcesData_(v8, v16, (uint64_t)v15, v17);
}

- (_CLMicroLocationSourcesStatisticsResult)initWithCoder:(id)a3
{
  _CLMicroLocationSourcesStatisticsResult *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CLMicroLocationSourcesStatisticsResult;
  v4 = -[_CLMicroLocationSourcesStatisticsResult init](&v13, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v10 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v7, 0);
    v4->_sourcesData = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, (uint64_t)CFSTR("sourcesData"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_sourcesData, (uint64_t)CFSTR("sourcesData"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (void *)objc_msgSend_sourcesData(self, v4, v5, v6);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v7);
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = objc_msgSend_description(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v15), v10, v11, v12);
        v20 = objc_msgSend_stringWithFormat_(v16, v18, (uint64_t)CFSTR("%@\n"), v19, v17);
        objc_msgSend_appendString_(v3, v21, v20, v22);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v13);
  }
  return v3;
}

- (NSArray)sourcesData
{
  return self->_sourcesData;
}

@end
