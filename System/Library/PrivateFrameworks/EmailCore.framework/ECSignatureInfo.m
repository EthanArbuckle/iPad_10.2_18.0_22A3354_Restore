@implementation ECSignatureInfo

- (ECSignatureInfo)initWithSignerInfo:(id)a3
{
  id v5;
  ECSignatureInfo *v6;
  ECSignatureInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECSignatureInfo;
  v6 = -[ECSignatureInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signerInfo, a3);
    v7->_encryptionCertificateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  __SecCertificate *encryptionCertificate;
  objc_super v4;

  encryptionCertificate = self->_encryptionCertificate;
  if (encryptionCertificate)
    CFRelease(encryptionCertificate);
  v4.receiver = self;
  v4.super_class = (Class)ECSignatureInfo;
  -[ECSignatureInfo dealloc](&v4, sel_dealloc);
}

- (NSArray)addresses
{
  -[ECSignatureInfo signingCertificate](self, "signingCertificate");
  return (NSArray *)(id)SecCertificateCopyRFC822Names();
}

- (__SecCertificate)signingCertificate
{
  return (__SecCertificate *)-[MSCMSSignerInfo signerCertificate](self->_signerInfo, "signerCertificate");
}

- (__SecCertificate)preferredEncryptionCertificate
{
  os_unfair_lock_s *p_encryptionCertificateLock;
  __SecCertificate *encryptionCertificate;
  void *v5;
  objc_class *v6;
  void *v7;
  __SecCertificate *v8;

  p_encryptionCertificateLock = &self->_encryptionCertificateLock;
  os_unfair_lock_lock(&self->_encryptionCertificateLock);
  encryptionCertificate = self->_encryptionCertificate;
  os_unfair_lock_unlock(p_encryptionCertificateLock);
  if (!encryptionCertificate)
  {
    v5 = (void *)*MEMORY[0x1E0D4D6B0];
    v6 = (objc_class *)objc_opt_class();
    -[ECSignatureInfo _protectedAttributeOfType:class:]((uint64_t)self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__SecCertificate *)objc_msgSend(v7, "encryptionCertificate");
    if (v8
      || (v8 = -[ECSignatureInfo signingCertificate](self, "signingCertificate"),
          encryptionCertificate = 0,
          (SecCertificateGetKeyUsage() & 0x14) != 0)
      && v8)
    {
      os_unfair_lock_lock(p_encryptionCertificateLock);
      encryptionCertificate = self->_encryptionCertificate;
      if (!encryptionCertificate)
      {
        self->_encryptionCertificate = v8;
        CFRetain(v8);
        encryptionCertificate = v8;
      }
      os_unfair_lock_unlock(p_encryptionCertificateLock);
    }

  }
  return encryptionCertificate;
}

- (id)_protectedAttributeOfType:(objc_class *)a3 class:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "protectedAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__ECSignatureInfo__protectedAttributeOfType_class___block_invoke;
    v10[3] = &unk_1E7120BC0;
    v11 = v5;
    objc_msgSend(v6, "ef_firstObjectPassingTest:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = (void *)objc_msgSend([a3 alloc], "initWithAttribute:error:", v7, 0);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)smimeCapabilities
{
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D4D6B8];
  v4 = (objc_class *)objc_opt_class();
  -[ECSignatureInfo _protectedAttributeOfType:class:]((uint64_t)self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "capabilities", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "OIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return (NSArray *)v8;
}

- (NSDate)signingDate
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)*MEMORY[0x1E0D4D6C0];
  v4 = (objc_class *)objc_opt_class();
  -[ECSignatureInfo _protectedAttributeOfType:class:]((uint64_t)self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signingTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

uint64_t __51__ECSignatureInfo__protectedAttributeOfType_class___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "attributeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signerInfo, 0);
}

@end
