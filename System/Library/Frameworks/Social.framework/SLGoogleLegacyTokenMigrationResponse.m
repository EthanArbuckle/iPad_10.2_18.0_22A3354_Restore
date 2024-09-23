@implementation SLGoogleLegacyTokenMigrationResponse

- (SLGoogleLegacyTokenMigrationResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  SLGoogleLegacyTokenMigrationResponse *v12;
  SLGoogleLegacyTokenMigrationResponse *v13;
  uint64_t v14;
  NSString *responseBody;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLGoogleLegacyTokenMigrationResponse initWithData: %@ length urlResponse: %@ error: %@"));

  v19.receiver = self;
  v19.super_class = (Class)SLGoogleLegacyTokenMigrationResponse;
  v12 = -[SLGoogleLegacyTokenMigrationResponse init](&v19, sel_init, v17, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13->_statusCode = objc_msgSend(v10, "statusCode");
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
      responseBody = v13->_responseBody;
      v13->_responseBody = (NSString *)v14;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13->_statusCode);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v5, 7, CFSTR("SLGoogleLegacyTokenMigrationResponse httpResponse status code %@"));

    }
    else
    {
      _SLLog(v5, 7, CFSTR("SLGoogleLegacyTokenMigrationResponse response is not NSHTTPURLResponse. Game over."));
    }
  }

  return v13;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)responseBody
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
