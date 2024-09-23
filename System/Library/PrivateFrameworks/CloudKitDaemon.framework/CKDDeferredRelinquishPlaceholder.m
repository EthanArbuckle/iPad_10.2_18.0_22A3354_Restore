@implementation CKDDeferredRelinquishPlaceholder

- (CKDDeferredRelinquishPlaceholder)initWithExistingWaiter:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDDeferredRelinquishPlaceholder *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *underlyingCKShortDescription;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDDeferredRelinquishPlaceholder;
  v7 = -[CKDDeferredRelinquishPlaceholder init](&v13, sel_init);
  if (v7)
  {
    v7->_qualityOfService = objc_msgSend_qualityOfService(v4, v5, v6);
    objc_msgSend_ckShortDescription(v4, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    underlyingCKShortDescription = v7->_underlyingCKShortDescription;
    v7->_underlyingCKShortDescription = (NSString *)v10;

  }
  return v7;
}

- (id)ckShortDescription
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_underlyingCKShortDescription(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("Deferred relinquish of %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p; %@>"), v5, self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSString)underlyingCKShortDescription
{
  return self->_underlyingCKShortDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingCKShortDescription, 0);
}

@end
