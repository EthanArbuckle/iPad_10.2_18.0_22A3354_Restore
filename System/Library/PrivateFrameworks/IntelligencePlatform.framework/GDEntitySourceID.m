@implementation GDEntitySourceID

- (GDEntitySourceID)initWithValue:(id)a3
{
  return (GDEntitySourceID *)objc_msgSend_initWithValue_source_(self, a2, (uint64_t)a3, 0);
}

- (GDEntitySourceID)initWithValue:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  GDEntitySourceID *v10;
  uint64_t v11;
  NSString *value;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *source;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GDEntitySourceID;
  v10 = -[GDEntitySourceID init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    value = v10->_value;
    v10->_value = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    source = v10->_source;
    v10->_source = (NSString *)v15;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  const char *v5;
  const char *v6;
  id v7;

  value = self->_value;
  v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)value, CFSTR("value"));
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_source, CFSTR("source"));

}

- (GDEntitySourceID)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  GDEntitySourceID *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("source"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      || (objc_msgSend_error(v4, v12, v13), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, !v23))
    {
      self = (GDEntitySourceID *)(id)objc_msgSend_initWithValue_source_(self, v12, (uint64_t)v9, v14);
      v15 = self;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend_error(v4, v7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("GDEntityResolution value is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v26, &v25, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v20, (uint64_t)CFSTR("GDErrorDomain"), 9, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v22, (uint64_t)v21);

    }
    v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithValue_source_(v7, v8, (uint64_t)self->_value, self->_source);
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
  objc_msgSend_value(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_source(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("<GDEntitySourceID: %@, source: %@>"), v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
