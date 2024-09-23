@implementation CPLFingerprintSchemeV2

- (CPLFingerprintSchemeV2)initWithBoundaryKey:(id)a3
{
  id v5;
  CPLFingerprintSchemeV2 *v6;
  uint64_t v7;
  NSData *boundaryKey;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLFingerprintSchemeV2;
  v6 = -[CPLFingerprintScheme init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    boundaryKey = v6->_boundaryKey;
    v6->_boundaryKey = (NSData *)v7;

    if (objc_msgSend(v5, "length") != 32)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Invalid boundary key %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, v12, 363, CFSTR("Invalid boundary key %@"), v5);

      abort();
    }
  }

  return v6;
}

- (void)_createSignatureGenerator
{
  return (void **)MMCSSignatureGeneratorCreateWithBoundaryKey();
}

- (BOOL)isMMCSv2
{
  return 1;
}

- (id)fingerprintSchemeDescription
{
  return CFSTR("MMCSv2");
}

- (NSData)boundaryKey
{
  return self->_boundaryKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundaryKey, 0);
}

@end
