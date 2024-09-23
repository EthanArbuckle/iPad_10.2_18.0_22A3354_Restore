@implementation GDRankerResult

- (GDRankerResult)initWithSpan:(id)a3 rankedEntities:(id)a4 entityClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  GDRankerResult *v13;
  uint64_t v14;
  GDSpan *span;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *rankedItems;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *entityClass;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GDRankerResult;
  v13 = -[GDRankerResult init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    span = v13->_span;
    v13->_span = (GDSpan *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    rankedItems = v13->_rankedItems;
    v13->_rankedItems = (NSArray *)v18;

    v22 = objc_msgSend_copy(v10, v20, v21);
    entityClass = v13->_entityClass;
    v13->_entityClass = (NSString *)v22;

  }
  return v13;
}

- (GDRankerResult)initWithRankedEntities:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  GDRankerResult *v7;
  uint64_t v8;
  NSArray *rankedItems;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDRankerResult;
  v7 = -[GDRankerResult init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    rankedItems = v7->_rankedItems;
    v7->_rankedItems = (NSArray *)v8;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  GDSpan *span;
  id v5;
  void *v6;
  const char *v7;
  NSArray *rankedItems;
  void *v9;
  const char *v10;
  NSString *entityClass;
  const char *v12;
  id v13;

  span = self->_span;
  v5 = a3;
  NSStringFromSelector(sel_span);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)span, v6);

  rankedItems = self->_rankedItems;
  NSStringFromSelector(sel_rankedItems);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)rankedItems, v9);

  entityClass = self->_entityClass;
  NSStringFromSelector(sel_entityClass);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)entityClass, v13);

}

- (GDRankerResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  GDRankerResult *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_span);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || (objc_msgSend_error(v4, v9, v10), v28 = (void *)objc_claimAutoreleasedReturnValue(), v28, !v28))
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_rankedItems);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v21 = objc_opt_class();
      NSStringFromSelector(sel_entityClass);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24
        || (objc_msgSend_error(v4, v25, v26), v36 = (void *)objc_claimAutoreleasedReturnValue(), v36, !v36))
      {
        self = (GDRankerResult *)(id)objc_msgSend_initWithSpan_rankedEntities_entityClass_(self, v25, (uint64_t)v8, v18, v24);
        v27 = self;
      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      objc_msgSend_error(v4, v19, v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB2D50];
        v39[0] = CFSTR("GDRankerResult rankedEntities is nil");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v39, &v38, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v31, v33, (uint64_t)CFSTR("GDErrorDomain"), 9, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_failWithError_(v4, v35, (uint64_t)v34);

      }
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithSpan_rankedEntities_entityClass_(v7, v8, (uint64_t)self->_span, self->_rankedItems, self->_entityClass);
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_span(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rankedItems(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("<GDRankerResult: span: %@, entities: %@>"), v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (GDSpan)span
{
  return self->_span;
}

- (NSString)entityClass
{
  return self->_entityClass;
}

- (NSArray)rankedItems
{
  return self->_rankedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedItems, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_span, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
