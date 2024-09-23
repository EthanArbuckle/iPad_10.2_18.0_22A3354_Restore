@implementation CRKASMCertificateIngestor

- (CRKASMCertificateIngestor)initWithConfiguration:(id)a3
{
  id v5;
  CRKASMCertificateIngestor *v6;
  CRKASMCertificateIngestor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMCertificateIngestor;
  v6 = -[CRKASMCertificateIngestor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    if (a5)
    {
      CRKErrorWithCodeAndUserInfo(2, &unk_24DA07C60);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  if (!-[CRKASMCertificateIngestor areCertificatesValid:forUserIdentifier:error:](self, "areCertificatesValid:forUserIdentifier:error:", v8, v9, a5))goto LABEL_6;
  v10 = -[CRKASMCertificateIngestor storeCertificates:userIdentifier:error:](self, "storeCertificates:userIdentifier:error:", v8, v9, a5);
LABEL_7:

  return v10;
}

- (BOOL)areCertificatesValid:(id)a3 forUserIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (!-[CRKASMCertificateIngestor isCertificateValid:forUserIdentifier:error:](self, "isCertificateValid:forUserIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v9, a5, (_QWORD)v17))
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)isCertificateValid:(id)a3 forUserIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[CRKASMCertificateIngestor configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trustedUserCommonNamePrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRKASMCertificateParserResult resultForCertificate:expectedCommonNamePrefix:expectedUserIdentifier:](CRKASMCertificateParserResult, "resultForCertificate:expectedCommonNamePrefix:expectedUserIdentifier:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v12, "isCertificateValidWithError:", a5);
  return (char)a5;
}

- (BOOL)storeCertificates:(id)a3 userIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a4;
  v9 = a3;
  -[CRKASMCertificateIngestor configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "credentialStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addCertificates:forUserIdentifier:", v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v9, "count");

  if (a5 && v13 != v14)
  {
    CRKErrorWithCodeAndUserInfo(20, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13 == v14;
}

- (CRKASMRosterProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
