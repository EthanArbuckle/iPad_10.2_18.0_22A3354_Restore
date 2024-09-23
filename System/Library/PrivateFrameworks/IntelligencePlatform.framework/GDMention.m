@implementation GDMention

- (GDMention)initWithSpan:(id)a3 entityClass:(id)a4 score:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  GDMention *v13;
  uint64_t v14;
  GDSpan *span;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *entityClass;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSArray *entityClasses;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSNumber *score;
  objc_super v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)GDMention;
  v13 = -[GDMention init](&v31, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    span = v13->_span;
    v13->_span = (GDSpan *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    entityClass = v13->_entityClass;
    v13->_entityClass = (NSString *)v18;

    v22 = (void *)objc_msgSend_copy(v9, v20, v21);
    v32[0] = v22;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v32, 1);
    v24 = objc_claimAutoreleasedReturnValue();
    entityClasses = v13->_entityClasses;
    v13->_entityClasses = (NSArray *)v24;

    v28 = objc_msgSend_copy(v10, v26, v27);
    score = v13->_score;
    v13->_score = (NSNumber *)v28;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  GDSpan *span;
  id v5;
  void *v6;
  const char *v7;
  NSArray *entityClasses;
  void *v9;
  const char *v10;
  NSNumber *score;
  const char *v12;
  id v13;

  span = self->_span;
  v5 = a3;
  NSStringFromSelector(sel_span);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)span, v6);

  entityClasses = self->_entityClasses;
  NSStringFromSelector(sel_entityClasses);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)entityClasses, v9);

  score = self->_score;
  NSStringFromSelector(sel_score);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)score, v13);

}

- (GDMention)initWithCoder:(id)a3
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
  GDMention *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
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

  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_entityClasses);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18
      || (objc_msgSend_error(v4, v19, v20), v35 = (void *)objc_claimAutoreleasedReturnValue(), v35, !v35))
    {
      v21 = objc_opt_class();
      NSStringFromSelector(sel_score);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24
        || (objc_msgSend_error(v4, v25, v26), v36 = (void *)objc_claimAutoreleasedReturnValue(), v36, !v36))
      {
        self = (GDMention *)(id)objc_msgSend_initWithSpan_entityClasses_score_(self, v25, (uint64_t)v8, v18, v24);
        v27 = self;
      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    objc_msgSend_error(v4, v9, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39[0] = CFSTR("GDMention span is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v39, &v38, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, (uint64_t)CFSTR("GDErrorDomain"), 9, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v34, (uint64_t)v33);

    }
    v27 = 0;
  }

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)MEMORY[0x1E0DE7D20](v7, sel_initWithSpan_entityClass_score_, self->_span);
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
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_span(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entityClasses(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_score(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValue(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v15, (uint64_t)CFSTR("<GDMention: span: %@, entityClasses: %@, score: %@>"), v5, v8, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (GDMention)initWithSpan:(id)a3 entityClasses:(id)a4 score:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  GDMention *v13;
  uint64_t v14;
  GDSpan *span;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *entityClass;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *entityClasses;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber *score;
  objc_super v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)GDMention;
  v13 = -[GDMention init](&v33, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    span = v13->_span;
    v13->_span = (GDSpan *)v14;

    if (objc_msgSend_count(v9, v16, v17))
    {
      objc_msgSend_objectAtIndexedSubscript_(v9, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_copy(v19, v20, v21);
      entityClass = v13->_entityClass;
      v13->_entityClass = (NSString *)v22;

    }
    else
    {
      v19 = v13->_entityClass;
      v13->_entityClass = 0;
    }

    v26 = objc_msgSend_copy(v9, v24, v25);
    entityClasses = v13->_entityClasses;
    v13->_entityClasses = (NSArray *)v26;

    v30 = objc_msgSend_copy(v10, v28, v29);
    score = v13->_score;
    v13->_score = (NSNumber *)v30;

  }
  return v13;
}

- (GDSpan)span
{
  return self->_span;
}

- (NSString)entityClass
{
  return self->_entityClass;
}

- (NSArray)entityClasses
{
  return self->_entityClasses;
}

- (NSNumber)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_entityClasses, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_span, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
