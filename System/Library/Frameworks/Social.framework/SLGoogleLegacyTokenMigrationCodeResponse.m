@implementation SLGoogleLegacyTokenMigrationCodeResponse

- (SLGoogleLegacyTokenMigrationCodeResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  SLGoogleLegacyTokenMigrationCodeResponse *v10;
  SLGoogleLegacyTokenMigrationCodeResponse *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  NSString *code;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SLGoogleLegacyTokenMigrationCodeResponse;
  v10 = -[SLGoogleLegacyTokenMigrationResponse initWithData:urlResponse:error:](&v32, sel_initWithData_urlResponse_error_, a3, v9, a5);
  v11 = v10;
  if (!a5)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99D20]);
        v13 = (void *)MEMORY[0x1E0CB3670];
        objc_msgSend(v9, "allHeaderFields");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E7592238);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cookiesWithResponseHeaderFields:forURL:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v29 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v22, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("oauth_code"));

              if (v24)
              {
                _SLLog(v5, 5, CFSTR("Successfully got an auth code"));
                objc_msgSend(v22, "value");
                v25 = objc_claimAutoreleasedReturnValue();
                code = v11->_code;
                v11->_code = (NSString *)v25;

                goto LABEL_14;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            if (v19)
              continue;
            break;
          }
        }
LABEL_14:

      }
    }
  }

  return v11;
}

- (NSString)code
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_code, 0);
}

@end
