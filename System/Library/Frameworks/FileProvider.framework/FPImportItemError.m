@implementation FPImportItemError

- (FPImportItemError)initWithItemIdentifier:(id)a3 error:(id)a4 retryCount:(int64_t)a5
{
  id v9;
  id v10;
  FPImportItemError *v11;
  FPImportItemError *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPImportItemError;
  v11 = -[FPImportItemError init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemIdentifier, a3);
    objc_storeStrong((id *)&v12->_error, a4);
    v12->_retryCount = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("_itemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("_error"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_retryCount, CFSTR("_retryCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diagnosticAttributes, CFSTR("_diagnosticAttributes"));

}

- (FPImportItemError)initWithCoder:(id)a3
{
  id v4;
  FPImportItemError *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  NSFileProviderDiagnosticAttributesDescriptor *diagnosticAttributes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPImportItemError;
  v5 = -[FPImportItemError init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    v5->_retryCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_retryCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_diagnosticAttributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSFileProviderDiagnosticAttributesDescriptor *)v10;

  }
  return v5;
}

- (id)json
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemIdentifier, CFSTR("itemIdentifier"));
  -[NSError fp_prettyDescription](self->_error, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorDescription"));

  -[NSError domain](self->_error, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSError code](self->_error, "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_retryCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("retryCount"));

  -[NSError underlyingErrors](self->_error, "underlyingErrors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("underlyingErrorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("underlyingErrorCode"));

  }
  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes
{
  return self->_diagnosticAttributes;
}

- (void)setDiagnosticAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
