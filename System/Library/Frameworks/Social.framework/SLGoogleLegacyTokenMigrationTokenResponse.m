@implementation SLGoogleLegacyTokenMigrationTokenResponse

- (SLGoogleLegacyTokenMigrationTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  SLGoogleLegacyTokenMigrationTokenResponse *v7;
  SLGoogleLegacyTokenMigrationTokenResponse *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  NSString *token;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)SLGoogleLegacyTokenMigrationTokenResponse;
  v7 = -[SLGoogleLegacyTokenMigrationResponse initWithData:urlResponse:error:](&v24, sel_initWithData_urlResponse_error_, a3, a4);
  v8 = v7;
  if (!a5 && v7)
  {
    -[SLGoogleLegacyTokenMigrationResponse responseBody](v7, "responseBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v16, "hasPrefix:", CFSTR("Auth="), (_QWORD)v20))
          {
            objc_msgSend(v16, "substringFromIndex:", 5);
            v17 = objc_claimAutoreleasedReturnValue();
            token = v8->_token;
            v8->_token = (NSString *)v17;

            _SLLog(v5, 5, CFSTR("Successfully got a token"));
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v8;
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
