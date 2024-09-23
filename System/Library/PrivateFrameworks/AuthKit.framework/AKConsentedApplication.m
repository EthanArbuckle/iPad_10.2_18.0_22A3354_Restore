@implementation AKConsentedApplication

- (AKConsentedApplication)initWithResponseInfo:(id)a3
{
  id v4;
  AKConsentedApplication *v5;
  uint64_t v6;
  NSArray *scopes;
  uint64_t v8;
  NSString *clientID;
  uint64_t v10;
  NSString *clientName;
  NSString *origin;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *transferState;
  void *v18;
  uint64_t v19;
  NSString *primaryClientID;
  void *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  NSDate *creationDate;

  v4 = a3;
  v5 = -[AKConsentedApplication init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scopes"));
    v6 = objc_claimAutoreleasedReturnValue();
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("client_id"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("client_name"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v10;

    v5->_state = 2;
    origin = v5->_origin;
    v5->_origin = (NSString *)CFSTR("0");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("credential_state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("credential_state"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_state = objc_msgSend(v14, "integerValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transfer_state"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("transfer_state"));
      v16 = objc_claimAutoreleasedReturnValue();
      transferState = v5->_transferState;
      v5->_transferState = (NSString *)v16;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primary_client_id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("primary_client_id"));
      v19 = objc_claimAutoreleasedReturnValue();
      primaryClientID = v5->_primaryClientID;
      v5->_primaryClientID = (NSString *)v19;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("origin"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("origin"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v5->_origin;
      v5->_origin = (NSString *)v22;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("consented_date"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("consented_date"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v25, "doubleValue");
        objc_msgSend(v26, "dateWithTimeIntervalSince1970:", v27 / 1000.0);
        v28 = objc_claimAutoreleasedReturnValue();
        creationDate = v5->_creationDate;
        v5->_creationDate = (NSDate *)v28;

      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKConsentedApplication)initWithCoder:(id)a3
{
  id v4;
  AKConsentedApplication *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *scopes;
  uint64_t v11;
  NSString *clientID;
  uint64_t v13;
  NSString *clientName;
  uint64_t v15;
  NSString *transferState;
  uint64_t v17;
  NSString *primaryClientID;
  uint64_t v19;
  NSString *origin;
  uint64_t v21;
  NSDate *creationDate;

  v4 = a3;
  v5 = -[AKConsentedApplication init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("scopes"));
    v9 = objc_claimAutoreleasedReturnValue();
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client_id"));
    v11 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client_name"));
    v13 = objc_claimAutoreleasedReturnValue();
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v13;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credential_state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transfer_state"));
    v15 = objc_claimAutoreleasedReturnValue();
    transferState = v5->_transferState;
    v5->_transferState = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primary_client_id"));
    v17 = objc_claimAutoreleasedReturnValue();
    primaryClientID = v5->_primaryClientID;
    v5->_primaryClientID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("origin"));
    v19 = objc_claimAutoreleasedReturnValue();
    origin = v5->_origin;
    v5->_origin = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("consented_date"));
    v21 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *scopes;
  id v5;

  scopes = self->_scopes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scopes, CFSTR("scopes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientID, CFSTR("client_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientName, CFSTR("client_name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("credential_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferState, CFSTR("transfer_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryClientID, CFSTR("primary_client_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_origin, CFSTR("origin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("consented_date"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p {\n\tclientID: %@, \n\tclientName: %@, \n\tscopes: %@, \n\tstate: %li, \n\ttransferState: %@, \n\tprimaryClientID: %@, \n\torigin: %@, \n"), objc_opt_class(), self, self->_clientID, self->_clientName, self->_scopes, self->_state, self->_transferState, self->_primaryClientID, self->_origin);
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(id)a3
{
  objc_storeStrong((id *)&self->_transferState, a3);
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (NSString)primaryClientID
{
  return self->_primaryClientID;
}

- (void)setPrimaryClientID:(id)a3
{
  objc_storeStrong((id *)&self->_primaryClientID, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (AKAppiTunesMetadata)appiTunesMetadata
{
  return self->_appiTunesMetadata;
}

- (void)setAppiTunesMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_appiTunesMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appiTunesMetadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_primaryClientID, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_transferState, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

@end
