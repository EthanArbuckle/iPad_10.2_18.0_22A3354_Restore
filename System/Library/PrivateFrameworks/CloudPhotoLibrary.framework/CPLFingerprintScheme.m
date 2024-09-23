@implementation CPLFingerprintScheme

- (CPLFingerprintScheme)init
{
  CPLFingerprintScheme *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLFingerprintScheme;
  result = -[CPLFingerprintScheme init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[CPLFingerprintScheme fingerPrintForFD:error:](self, "fingerPrintForFD:error:", objc_msgSend(v6, "fileDescriptor"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "closeFile");
  }
  else if (a4)
  {
    v9 = *a4;
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB28A8];
    v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v12)
    {
      objc_msgSend(v9, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], objc_msgSend(v9, "code"), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v20;

        objc_msgSend(v21, "setObject:forKey:", v16, v14);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, objc_msgSend(v9, "code"), v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v22;
      }

    }
    v23 = v9;
    v8 = 0;
    *a4 = v23;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isMMCSv2
{
  return 0;
}

- (void)_createSignatureGenerator
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 208, CFSTR("%@ be implemented by subclasses"), v6);

  abort();
}

- (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  id v5;
  void **v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = -[CPLFingerprintScheme _createSignatureGenerator](self, "_createSignatureGenerator");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  MEMORY[0x1B5E086A4](v6, v8, v9, 1);
  v10 = MMCSSignatureGeneratorFinish();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v10, MEMORY[0x1B5E08674](v10), 1);
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fingerPrintForFD:(int)a3 error:(id *)a4
{
  void *v7;
  void **i;
  ssize_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  lseek(a3, 0, 0);
  v7 = malloc_type_malloc(0x20000uLL, 0xED6B4917uLL);
  for (i = -[CPLFingerprintScheme _createSignatureGenerator](self, "_createSignatureGenerator");
        ;
        MEMORY[0x1B5E086A4](i, v7, v9, 1))
  {
    v9 = read(a3, v7, 0x20000uLL);
    if (!v9)
      break;
    if (v9 == -1)
    {
      if (a4)
      {
        +[CPLErrors posixErrorForURL:](CPLErrors, "posixErrorForURL:", 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      MMCSSignatureGeneratorFinish();
      i = 0;
      break;
    }
  }
  if (v7)
    free(v7);
  if (i)
  {
    v10 = MMCSSignatureGeneratorFinish();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v10, MEMORY[0x1B5E08674](v10), 1);
    objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSString)zeroByteFileFingerprint
{
  os_unfair_lock_s *p_lock;
  _QWORD *v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLFingerprintScheme *v9;
  SEL v10;

  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __47__CPLFingerprintScheme_zeroByteFileFingerprint__block_invoke;
  v8 = &unk_1E60D6DF8;
  v9 = self;
  v10 = a2;
  v4 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  return self->_zeroByteFileFingerprint;
}

- (BOOL)allowsStreaming
{
  return !-[CPLFingerprintScheme isMMCSv2](self, "isMMCSv2");
}

- (BOOL)canMatchSignatureToFingerprint
{
  return !-[CPLFingerprintScheme isMMCSv2](self, "isMMCSv2");
}

- (BOOL)isForStableHash
{
  return !-[CPLFingerprintScheme isMMCSv2](self, "isMMCSv2");
}

- (BOOL)isValid
{
  return 1;
}

- (NSString)fingerprintSchemeDescription
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 288, CFSTR("%@ be implemented by subclasses"), v6);

  abort();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroByteFileFingerprint, 0);
}

void __47__CPLFingerprintScheme_zeroByteFileFingerprint__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[3])
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v1, "fingerPrintForData:error:", v3, &v14);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v14;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v16 = v9;
          v17 = 2112;
          v18 = v5;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "%@ failed to create zero size finger print: %@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, v13, 257, CFSTR("%@ failed to create zero size finger print: %@"), *(_QWORD *)(a1 + 32), v5);

      abort();
    }

  }
}

+ (void)initialize
{
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    CPLCurrentUniverseName();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configureDefaultFingerprintSchemeForUniverseWithName:", v3);

  }
}

+ (BOOL)disableInvalidFingerprintScheme
{
  return _disableInvalidFingerprintScheme;
}

+ (void)setDisableInvalidFingerprintScheme:(BOOL)a3
{
  _disableInvalidFingerprintScheme = a3;
}

+ (void)setFingerprintSchemeForNewMasterAsset:(id)a3
{
  objc_storeStrong((id *)&_defaultFingerprintScheme, a3);
}

+ (CPLFingerprintScheme)fingerprintSchemeForNewMasterAsset
{
  if (_defaultFingerprintScheme)
    return (CPLFingerprintScheme *)(id)_defaultFingerprintScheme;
  objc_msgSend(a1, "defaultFingerprintSchemeV1");
  return (CPLFingerprintScheme *)(id)objc_claimAutoreleasedReturnValue();
}

+ (void)configureDefaultFingerprintSchemeForUniverseWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v11)
  {
    objc_msgSend(CFSTR("CPLShouldUseMMCSv2FingerprintIn"), "stringByAppendingString:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v8, "BOOLValue"))
          objc_msgSend(a1, "defaultFingerprintSchemeV2");
        else
          objc_msgSend(a1, "defaultFingerprintSchemeV1");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
    v10 = (void *)_defaultFingerprintScheme;
    _defaultFingerprintScheme = v7;

  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("CPLShouldUseMMCSv2Fingerprint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (objc_msgSend(v5, "objectForKey:", CFSTR("CPLShouldUseMMCSv2")),
          v9 = objc_claimAutoreleasedReturnValue(),
          (v6 = (void *)v9) != 0))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v6, "BOOLValue"))
          objc_msgSend(a1, "defaultFingerprintSchemeV2");
        else
          objc_msgSend(a1, "defaultFingerprintSchemeV1");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
    v8 = (void *)_defaultFingerprintScheme;
    _defaultFingerprintScheme = v9;
  }

}

+ (CPLFingerprintScheme)defaultFingerprintSchemeV1
{
  if (defaultFingerprintSchemeV1_onceToken != -1)
    dispatch_once(&defaultFingerprintSchemeV1_onceToken, &__block_literal_global_3099);
  return (CPLFingerprintScheme *)(id)defaultFingerprintSchemeV1_result;
}

+ (CPLFingerprintScheme)defaultFingerprintSchemeV2
{
  void *v2;

  v2 = (void *)_overriddenFingerprintSchemeV2;
  if (!_overriddenFingerprintSchemeV2)
  {
    if (defaultFingerprintSchemeV2_onceToken != -1)
      dispatch_once(&defaultFingerprintSchemeV2_onceToken, &__block_literal_global_8);
    v2 = (void *)defaultFingerprintSchemeV2_result;
  }
  return (CPLFingerprintScheme *)v2;
}

+ (void)setDefaultFingerprintSchemeV2:(id)a3
{
  objc_storeStrong((id *)&_overriddenFingerprintSchemeV2, a3);
}

+ (id)_fingerprintSchemeForSignature:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  if (MMCSSignatureIsValidV2())
  {
    objc_msgSend(a1, "defaultFingerprintSchemeV2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (MEMORY[0x1B5E086B0](v4))
      objc_msgSend(a1, "defaultFingerprintSchemeV1");
    else
      objc_msgSend(a1, "invalidFingerprintScheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)fingerprintSchemeForSignature:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v5 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Trying to determine a fingerprint scheme without a signature", v14, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v13, 138, CFSTR("Trying to determine a fingerprint scheme without a signature"));

    abort();
  }
  v6 = v5;
  objc_msgSend(a1, "_fingerprintSchemeForSignature:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (_defaultFingerprintScheme)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (void *)_defaultFingerprintScheme;
    else
      v7 = v8;
  }
  v9 = v7;

  return v9;
}

+ (id)fingerprintSchemeForFingerprint:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v5 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Trying to determine a fingerprint scheme without a fingerprint", v15, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v14, 148, CFSTR("Trying to determine a fingerprint scheme without a fingerprint"));

    abort();
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 0);
  objc_msgSend(a1, "_fingerprintSchemeForSignature:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (_defaultFingerprintScheme)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = (void *)_defaultFingerprintScheme;
    else
      v8 = v9;
  }
  v10 = v8;

  return v10;
}

+ (CPLFingerprintScheme)invalidFingerprintScheme
{
  id v2;

  if (_disableInvalidFingerprintScheme)
  {
    +[CPLFingerprintScheme defaultFingerprintSchemeV1](CPLFingerprintScheme, "defaultFingerprintSchemeV1");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (invalidFingerprintScheme_onceToken != -1)
      dispatch_once(&invalidFingerprintScheme_onceToken, &__block_literal_global_20_3074);
    v2 = (id)invalidFingerprintScheme_result;
  }
  return (CPLFingerprintScheme *)v2;
}

+ (id)normalizeBoundaryKey:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);
  if (v4 >= 0x21)
  {
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subdataWithRange:", 0, 32);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    v3 = (id)v6;
LABEL_5:

    v3 = (id)v7;
    return v3;
  }
  if (v4 != 32)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%.*s"), (32 - v4), "================================");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v3;
}

+ (BOOL)isMMCSv2Signature:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  objc_msgSend(a1, "fingerprintSchemeForSignature:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMMCSv2");

  return v4;
}

+ (BOOL)isMMCSv2Fingerprint:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  objc_msgSend(a1, "fingerprintSchemeForFingerprint:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMMCSv2");

  return v4;
}

+ (BOOL)supportsEPP
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CPLFingerprintScheme_supportsEPP__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsEPP_onceToken != -1)
    dispatch_once(&supportsEPP_onceToken, block);
  return supportsEPP_result;
}

+ (BOOL)alwaysCreateEPPMomentShares
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLAlwaysCreateEPPMomentShare"));

  return v3;
}

void __35__CPLFingerprintScheme_supportsEPP__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLShouldUseMMCSv2")) & 1) != 0
    || (objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLForceMMCSv2Support")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "alwaysCreateEPPMomentShares"))
  {
    supportsEPP_result = 1;
  }

}

void __48__CPLFingerprintScheme_invalidFingerprintScheme__block_invoke()
{
  CPLFingerprintSchemeInvalid *v0;
  void *v1;

  v0 = objc_alloc_init(CPLFingerprintSchemeInvalid);
  v1 = (void *)invalidFingerprintScheme_result;
  invalidFingerprintScheme_result = (uint64_t)v0;

}

void __50__CPLFingerprintScheme_defaultFingerprintSchemeV2__block_invoke()
{
  CPLFingerprintSchemeV2 *v0;
  void *v1;
  id v2;

  objc_msgSend(CFSTR("MYSUPERSECRECTKEYPADDEDTO32BYTES"), "dataUsingEncoding:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[CPLFingerprintSchemeV2 initWithBoundaryKey:]([CPLFingerprintSchemeV2 alloc], "initWithBoundaryKey:", v2);
  v1 = (void *)defaultFingerprintSchemeV2_result;
  defaultFingerprintSchemeV2_result = (uint64_t)v0;

}

void __50__CPLFingerprintScheme_defaultFingerprintSchemeV1__block_invoke()
{
  CPLFingerprintSchemeV1 *v0;
  void *v1;

  v0 = objc_alloc_init(CPLFingerprintSchemeV1);
  v1 = (void *)defaultFingerprintSchemeV1_result;
  defaultFingerprintSchemeV1_result = (uint64_t)v0;

}

@end
