@implementation CPLResourceIdentity

- (CPLResourceIdentity)initWithCoder:(id)a3
{
  id v4;
  CPLResourceIdentity *v5;
  CPLResourceIdentity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLResourceIdentity;
  v5 = -[CPLResourceIdentity init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLResourceIdentity)initWithFileURL:(id)a3
{
  id v4;
  CPLResourceIdentity *v5;
  uint64_t v6;
  NSURL *fileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLResourceIdentity;
  v5 = -[CPLResourceIdentity init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

  }
  return v5;
}

- (id)stableHashForMaster
{
  NSString *stableHash;
  void *v4;
  int v5;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  if (!self->_fingerPrint)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to compute stable hash for master without a fingerprint", v11, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 72, CFSTR("Trying to compute stable hash for master without a fingerprint"));

    abort();
  }
  stableHash = self->_stableHash;
  if (!stableHash)
  {
    +[CPLFingerprintScheme fingerprintSchemeForFingerprint:](CPLFingerprintScheme, "fingerprintSchemeForFingerprint:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isForStableHash");

    if (!v5)
      return 0;
    stableHash = self->_fingerPrint;
  }
  return stableHash;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CPLResourceIdentity fingerPrint](self, "fingerPrint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSURL path](self->_fileURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: filePath: %@ fingerPrint: %@  size: %.0fx%.0f fileUTI: %@"), v4, v5, self->_fingerPrint, *(_QWORD *)&self->_imageDimensions.width, *(_QWORD *)&self->_imageDimensions.height, self->_fileUTI);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)identityForStorage
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  CPLResourceIdentity *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CPLResourceIdentity fingerPrint](self, "fingerPrint");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = self;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Can't create identity for storage for an identity without finger print: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 99, CFSTR("Can't create identity for storage for an identity without finger print: %@"), self);

    abort();
  }
  v5 = (void *)v4;
  -[CPLResourceIdentity fileUTI](self, "fileUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("CPLUNKNOWN");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (void)setFingerPrint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)stableHash
{
  return self->_stableHash;
}

- (void)setStableHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (CGSize)imageDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_imageDimensions.width;
  height = self->_imageDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageDimensions:(CGSize)a3
{
  self->_imageDimensions = a3;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (NSString)fileUTI
{
  return self->_fileUTI;
}

- (void)setFileUTI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileUTI, 0);
  objc_storeStrong((id *)&self->_stableHash, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

+ (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[CPLFingerprintScheme fingerprintSchemeForNewMasterAsset](CPLFingerprintScheme, "fingerprintSchemeForNewMasterAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fingerPrintForFileAtURL:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[CPLFingerprintScheme fingerprintSchemeForNewMasterAsset](CPLFingerprintScheme, "fingerprintSchemeForNewMasterAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fingerPrintForData:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fingerPrintForFD:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = *(_QWORD *)&a3;
  +[CPLFingerprintScheme fingerprintSchemeForNewMasterAsset](CPLFingerprintScheme, "fingerprintSchemeForNewMasterAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fingerPrintForFD:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isValidMMCSV2Signature:(id)a3
{
  return +[CPLFingerprintScheme isMMCSv2Signature:](CPLFingerprintScheme, "isMMCSv2Signature:", a3);
}

+ (id)identityFromStoredIdentity:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("."));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    v7 = 0;
  }
  else
  {
    v8 = v5;
    objc_msgSend(v4, "substringToIndex:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", v8 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9 && objc_msgSend(v9, "length") && (objc_msgSend(v7, "isEqualToString:", CFSTR("CPLUNKNOWN")) & 1) == 0)
    {
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setFingerPrint:", v6);
  objc_msgSend(v11, "setFileUTI:", v10);

  return v11;
}

+ (id)fileUTIForExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    v5 = 0;
LABEL_6:
    v6 = (id)*MEMORY[0x1E0CEC4A0];

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = v4;
  if (objc_msgSend(v4, "isDynamic"))
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)extensionForFileUTI:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredFilenameExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)storageNameForFingerPrint:(id)a3 fileUTI:(id)a4 bucket:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "hasPrefix:", CFSTR(".")))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "%@ is not a valid finger print", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v19, 157, CFSTR("%@ is not a valid finger print"), v9);

    abort();
  }
  if (objc_msgSend(v9, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  if (a5)
  {
    if ((unint64_t)objc_msgSend(v9, "length") < 4)
    {
      v12 = objc_retainAutorelease(v9);
    }
    else
    {
      objc_msgSend(v9, "substringToIndex:", 3);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a5 = v12;
  }
  objc_msgSend(a1, "extensionForFileUTI:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("cpl"), "stringByAppendingString:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cplStringByAppendingPathExtension:fallbackExtension:", v13, CFSTR("cplunknown"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)identityForStorageName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "hasPrefix:", CFSTR("cpl")))
  {
    v11 = 0;
    v6 = v5;
    goto LABEL_11;
  }
  objc_msgSend(v5, "substringFromIndex:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "rangeOfString:", CFSTR("_")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (!objc_msgSend(v7, "length"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Storage name should always have an extension (%@)", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v16, 188, CFSTR("Storage name should always have an extension (%@)"), v6);
LABEL_22:

    abort();
  }
  if (!objc_msgSend(v8, "length"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Storage name should always have a finger print (%@)", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v16, 189, CFSTR("Storage name should always have a finger print (%@)"), v6);
    goto LABEL_22;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("cplunknown")) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFileUTI:", v12);

  objc_msgSend(v11, "setFingerPrint:", v8);
LABEL_11:

  return v11;
}

@end
