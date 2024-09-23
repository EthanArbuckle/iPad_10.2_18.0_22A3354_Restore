@implementation CRKASMCertificateParserResult

- (CRKASMCertificateParserResult)initWithUserIdentifier:(id)a3 validationError:(id)a4
{
  id v6;
  id v7;
  CRKASMCertificateParserResult *v8;
  uint64_t v9;
  NSString *userIdentifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKASMCertificateParserResult;
  v8 = -[CRKASMCertificateParserResult init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    userIdentifier = v8->_userIdentifier;
    v8->_userIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_validationError, a4);
  }

  return v8;
}

+ (id)resultForCertificate:(id)a3 expectedCommonNamePrefix:(id)a4 expectedUserIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v14 = &unk_24DA07B48;
    v15 = 2;
LABEL_9:
    CRKErrorWithCodeAndUserInfo(v15, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "certificate:hasCommonNameWithPrefix:", v8, v9) & 1) == 0)
  {
    v15 = 34;
    v14 = 0;
    goto LABEL_9;
  }
  +[CRKASMCertificateUserIdentifierExtractor userIdentifierFromCertificate:](CRKASMCertificateUserIdentifierExtractor, "userIdentifierFromCertificate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v16 = 34;
LABEL_13:
    CRKErrorWithCodeAndUserInfo(v16, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ((objc_msgSend(v11, "isEqualToString:", v10) & 1) == 0)
  {
    v16 = 36;
    goto LABEL_13;
  }
  if ((objc_msgSend(v8, "isTemporallyValid") & 1) == 0)
  {
    v16 = 33;
    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUserIdentifier:validationError:", v12, v13);

  return v17;
}

- (BOOL)isCertificateValidWithError:(id *)a3
{
  void *v5;

  -[CRKASMCertificateParserResult validationError](self, "validationError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v5)
  {
    -[CRKASMCertificateParserResult validationError](self, "validationError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 == 0;
}

+ (BOOL)certificate:(id)a3 hasCommonNameWithPrefix:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "commonNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasPrefix:", v5) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSError)validationError
{
  return self->_validationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationError, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
