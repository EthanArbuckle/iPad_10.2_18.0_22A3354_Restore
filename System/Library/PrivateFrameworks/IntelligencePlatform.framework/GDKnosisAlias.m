@implementation GDKnosisAlias

- (GDKnosisAlias)initWithPrimary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  GDKnosisAlias *v7;
  uint64_t v8;
  NSString *primary;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDKnosisAlias;
  v7 = -[GDKnosisAlias init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    primary = v7->_primary;
    v7->_primary = (NSString *)v8;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *primary;
  id v4;
  const char *v5;
  id v6;

  primary = self->_primary;
  v4 = a3;
  NSStringFromSelector(sel_primary);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)primary, v6);

}

- (GDKnosisAlias)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  GDKnosisAlias *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_primary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = (GDKnosisAlias *)(id)objc_msgSend_initWithPrimary_(self, v9, (uint64_t)v8);
    v11 = self;
  }
  else
  {
    objc_msgSend_error(v4, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("GDKnosisAlias primary is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("GDErrorDomain"), 9, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v18, (uint64_t)v17);

    }
    v11 = 0;
  }

  return v11;
}

- (NSString)primary
{
  return self->_primary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primary, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
