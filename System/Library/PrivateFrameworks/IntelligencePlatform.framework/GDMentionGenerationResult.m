@implementation GDMentionGenerationResult

- (GDMentionGenerationResult)initWithMentions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  GDMentionGenerationResult *v7;
  uint64_t v8;
  NSArray *mentions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDMentionGenerationResult;
  v7 = -[GDMentionGenerationResult init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    mentions = v7->_mentions;
    v7->_mentions = (NSArray *)v8;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *mentions;
  id v4;
  const char *v5;
  id v6;

  mentions = self->_mentions;
  v4 = a3;
  NSStringFromSelector(sel_mentions);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)mentions, v6);

}

- (GDMentionGenerationResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  GDMentionGenerationResult *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_setWithObjects_(v5, v8, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mentions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    self = (GDMentionGenerationResult *)(id)objc_msgSend_initWithMentions_(self, v13, (uint64_t)v12);
    v15 = self;
  }
  else
  {
    objc_msgSend_error(v4, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = CFSTR("GDMentionGenerationResult mentions is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v25, &v24, 1);
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
  return (id)objc_msgSend_initWithMentions_(v7, v8, (uint64_t)self->_mentions);
}

- (id)description
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_mentions(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<GDMentionGenerationResult: %@>"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)mentions
{
  return self->_mentions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
