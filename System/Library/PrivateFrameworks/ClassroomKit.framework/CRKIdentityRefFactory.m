@implementation CRKIdentityRefFactory

- (CRKIdentityRefFactory)init
{
  void *v3;
  CRKIdentityRefFactory *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKIdentityRefFactory initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (CRKIdentityRefFactory)initWithConfiguration:(id)a3
{
  id v4;
  CRKIdentityRefFactory *v5;
  uint64_t v6;
  CRKIdentityConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKIdentityRefFactory;
  v5 = -[CRKIdentityRefFactory init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (CRKIdentityConfiguration *)v6;

  }
  return v5;
}

- (__SecIdentity)makeIdentityRefWithError:(id *)a3
{
  void *v5;
  const void *v6;
  const __CFDictionary *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t SelfSignedCertificate;
  __SecIdentity *v12;
  void *v13;
  SecKeyRef v15;
  SecKeyRef publicKey;

  -[CRKIdentityRefFactory configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKIdentityRefFactory CMSHashingAlgorithmForSecAlgorithm:](self, "CMSHashingAlgorithmForSecAlgorithm:", objc_msgSend(v5, "hashingAlgorithm"));

  if (v6)
  {
    v15 = 0;
    publicKey = 0;
    -[CRKIdentityRefFactory keyParameters](self, "keyParameters");
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = SecKeyGeneratePair(v7, &publicKey, &v15);

    objc_msgSend(MEMORY[0x24BDD1540], "crk_errorForSecurityOSStatus:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (a3)
      {
        SelfSignedCertificate = 0;
        v12 = 0;
        *a3 = objc_retainAutorelease(v9);
LABEL_11:

        -[CRKIdentityRefFactory safeRelease:](self, "safeRelease:", publicKey);
        -[CRKIdentityRefFactory safeRelease:](self, "safeRelease:", v15);
        -[CRKIdentityRefFactory safeRelease:](self, "safeRelease:", SelfSignedCertificate);
        return v12;
      }
      SelfSignedCertificate = 0;
    }
    else
    {
      -[CRKIdentityRefFactory subject](self, "subject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKIdentityRefFactory certificateParametersWithCMSAlgorithm:](self, "certificateParametersWithCMSAlgorithm:", v6);
      SelfSignedCertificate = SecGenerateSelfSignedCertificate();

      if (SelfSignedCertificate)
      {
        v12 = (__SecIdentity *)SecIdentityCreate();
        goto LABEL_11;
      }
    }
    v12 = 0;
    goto LABEL_11;
  }
  if (!a3)
    return 0;
  CRKErrorWithCodeAndUserInfo(2, &unk_24DA07B70);
  v12 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (void)safeRelease:(void *)a3
{
  if (a3)
    CFRelease(a3);
}

- (id)subject
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
  _QWORD v13[2];
  void *v14;
  _QWORD v15[2];
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v15[0] = *MEMORY[0x24BDE93E0];
  -[CRKIdentityRefFactory configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v13[0] = *MEMORY[0x24BDE93D0];
  -[CRKIdentityRefFactory configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)keyParameters
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9050];
  v14[0] = *MEMORY[0x24BDE9080];
  v4 = *MEMORY[0x24BDE9048];
  v13[0] = v3;
  v13[1] = v4;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CRKIdentityRefFactory configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "keySizeInBits"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  v13[2] = *MEMORY[0x24BDE90A0];
  -[CRKIdentityRefFactory configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)certificateParametersWithCMSAlgorithm:(const void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24DA07E98, *MEMORY[0x24BDE9218]);
  v14 = CFSTR("rfc822name");
  -[CRKIdentityRefFactory configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDE94E0]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", a3, *MEMORY[0x24BDE91E8]);
  -[CRKIdentityRefFactory configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "createsCertificateAuthority");

  if ((_DWORD)v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24DA07EB0, *MEMORY[0x24BDE91F8]);
  -[CRKIdentityRefFactory configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "addsClientAuthAndServerAuthEKUs");

  if (v11)
    -[CRKIdentityRefFactory addClientAndServerAuthEKUsToParameters:](self, "addClientAndServerAuthEKUsToParameters:", v5);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (void)addClientAndServerAuthEKUsToParameters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _BYTE v9[22];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v9 = xmmword_218D5020E;
  *(_QWORD *)&v9[14] = 0x10307050501062BLL;
  v3 = (void *)MEMORY[0x24BDBCE50];
  v4 = a3;
  objc_msgSend(v3, "dataWithBytes:length:", v9, 22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("2.5.29.37");
  v8 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDE9210]);

}

- (const)CMSHashingAlgorithmForSecAlgorithm:(unsigned int)a3
{
  const void *result;
  const void **v4;

  result = 0;
  switch(a3)
  {
    case 3u:
      v4 = (const void **)MEMORY[0x24BDE91B8];
      goto LABEL_7;
    case 4u:
      v4 = (const void **)MEMORY[0x24BDE91C0];
      goto LABEL_7;
    case 6u:
      v4 = (const void **)MEMORY[0x24BDE91C8];
      goto LABEL_7;
    case 7u:
      v4 = (const void **)MEMORY[0x24BDE91D0];
      goto LABEL_7;
    case 8u:
      v4 = (const void **)MEMORY[0x24BDE91D8];
LABEL_7:
      result = *v4;
      break;
    default:
      return result;
  }
  return result;
}

- (CRKIdentityConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
