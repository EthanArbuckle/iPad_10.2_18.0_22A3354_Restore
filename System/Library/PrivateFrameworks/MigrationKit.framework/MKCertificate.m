@implementation MKCertificate

- (MKCertificate)init
{
  MKCertificate *v2;
  MKCertificate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKCertificate;
  v2 = -[MKCertificate init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKCertificate generateCertificate](v2, "generateCertificate");
  return v3;
}

- (MKCertificate)initWithPEM:(id)a3
{
  id v4;
  MKCertificate *v5;
  const void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKCertificate;
  v5 = -[MKCertificate init](&v9, sel_init);
  if (v5)
  {
    v6 = (const void *)SecCertificateCreateWithPEM();
    v7 = (void *)SecCertificateCopySHA256Digest();
    -[MKCertificate setDigest:](v5, "setDigest:", v7);

    CFRelease(v6);
  }

  return v5;
}

- (MKCertificate)initWithTrust:(__SecTrust *)a3
{
  MKCertificate *v4;
  const __CFArray *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKCertificate;
  v4 = -[MKCertificate init](&v8, sel_init);
  if (v4)
  {
    v5 = SecTrustCopyCertificateChain(a3);
    if (CFArrayGetCount(v5) >= 1)
    {
      CFArrayGetValueAtIndex(v5, 0);
      v6 = (void *)SecCertificateCopySHA256Digest();
      -[MKCertificate setDigest:](v4, "setDigest:", v6);

    }
    CFRelease(v5);
  }
  return v4;
}

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)MKCertificate;
  -[MKCertificate dealloc](&v4, sel_dealloc);
}

- (id)encodedCertificate
{
  return -[MKCertificate pemFormattedCertificateData:](self, "pemFormattedCertificateData:", self->_certificate);
}

- (void)generateCertificate
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFDictionary *v6;
  __SecKey *RandomKey;
  SecKeyRef v8;
  const __CFAllocator *v9;
  CFArrayRef v10;
  void *v11;
  void *v12;
  __SecCertificate *SelfSignedCertificate;
  CFDataRef v14;
  void *v15;
  CFTypeRef v16;
  CFTypeRef v17;
  uint64_t v18;
  void *v19;
  CFTypeRef cf;
  CFTypeRef v21;
  void *v22[2];
  void *values[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9080];
  v4 = *MEMORY[0x24BDE9048];
  v24[0] = *MEMORY[0x24BDE9050];
  v24[1] = v4;
  v25[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2048);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  RandomKey = SecKeyCreateRandomKey(v6, 0);
  v8 = SecKeyCopyPublicKey(RandomKey);
  values[0] = *(void **)MEMORY[0x24BDE93E0];
  values[1] = CFSTR("Apple Inc.");
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v17 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)values, 2, 0);
  v22[0] = *(void **)MEMORY[0x24BDE93D0];
  v22[1] = CFSTR("Move to iOS");
  v16 = CFArrayCreate(v9, (const void **)v22, 2, 0);
  cf = CFArrayCreate(v9, &v17, 1, 0);
  v21 = CFArrayCreate(v9, &v16, 1, 0);
  v10 = CFArrayCreate(v9, &cf, 2, 0);
  v18 = *MEMORY[0x24BDE9218];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2147483653);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate();
  v14 = SecCertificateCopyData(SelfSignedCertificate);
  -[MKCertificate setCertificate:](self, "setCertificate:", v14);

  v15 = (void *)SecCertificateCopySHA256Digest();
  -[MKCertificate setDigest:](self, "setDigest:", v15);

  -[MKCertificate setIdentity:](self, "setIdentity:", SecIdentityCreate());
  if (SelfSignedCertificate)
    CFRelease(SelfSignedCertificate);
  if (v10)
    CFRelease(v10);
  if (cf)
    CFRelease(cf);
  if (v21)
    CFRelease(v21);
  if (v16)
    CFRelease(v16);
  if (v17)
    CFRelease(v17);
  if (v8)
    CFRelease(v8);
  if (RandomKey)
    CFRelease(RandomKey);

}

- (id)pemFormattedCertificateData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", CFSTR("-----BEGIN CERTIFICATE-----\n"));
  -[MKCertificate _appendBase64Data:toString:](self, "_appendBase64Data:toString:", v5, v6);

  objc_msgSend(v6, "appendString:", CFSTR("\n-----END CERTIFICATE-----\n"));
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_appendBase64Data:(id)a3 toString:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 33);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

- (id)dataFromPEMFormattedData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v3, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPrefix:", CFSTR("-----"), (_QWORD)v15) & 1) == 0)
          objc_msgSend(v6, "appendString:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v6, 1);
  return v13;
}

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (NSData)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
  objc_storeStrong((id *)&self->_digest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
