@implementation CRKASMCertificateUserIdentifierExtractor

+ (id)userIdentifierFromCertificate:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "allUserIdentifiersFromCertificate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pickIdentifierFromIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pickIdentifierFromIdentifiers:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_CRKLogASM_onceToken_10 != -1)
      dispatch_once(&_CRKLogASM_onceToken_10, &__block_literal_global_21);
    v5 = _CRKLogASM_logObj_10;
    if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_10, OS_LOG_TYPE_ERROR))
      +[CRKASMCertificateUserIdentifierExtractor pickIdentifierFromIdentifiers:].cold.1((uint64_t)v4, v5);

  }
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)allUserIdentifiersFromCertificate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "commonNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        +[CRKASMCertificateCommonName commonNameWithString:](CRKASMCertificateCommonName, "commonNameWithString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "userIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

+ (void)pickIdentifierFromIdentifiers:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Certificate contains multiple user identifiers: [%@]", (uint8_t *)&v2, 0xCu);
}

@end
