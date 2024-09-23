@implementation IDSEngramKeyFetchMetric

- (IDSEngramKeyFetchMetric)initWithKeyFetchError:(id)a3
{
  id v5;
  IDSEngramKeyFetchMetric *v6;
  IDSEngramKeyFetchMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSEngramKeyFetchMetric;
  v6 = -[IDSEngramKeyFetchMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyFetchError, a3);

  return v7;
}

- (NSString)name
{
  return (NSString *)CFSTR("EngramKeyFetch");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_keyFetchError(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domain(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    CFDictionarySetValue(v3, CFSTR("ErrorDomain"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_keyFetchError(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_code(v16, v17, v18, v19);
  objc_msgSend_numberWithInteger_(v12, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    CFDictionarySetValue(v3, CFSTR("ErrorCode"), v23);

  return (NSDictionary *)v3;
}

- (NSError)keyFetchError
{
  return self->_keyFetchError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFetchError, 0);
}

@end
