@implementation BCInternalAuthenticationResponse

- (BCInternalAuthenticationResponse)initWithDictionary:(id)a3
{
  id v4;
  BCInternalAuthenticationResponse *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  BCError *v26;
  NSArray *errors;
  NSString *businessIdentifier;
  NSString *v29;
  NSString *groupIdentifier;
  NSString *v31;
  const __CFString *v32;
  NSString *credentials;
  BCInternalAuthenticationResponse *v34;
  NSObject *v35;
  const char *v36;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BCInternalAuthenticationResponse;
  v5 = -[BCInternalAuthenticationResponse init](&v45, sel_init);
  if (v5)
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v7;
      _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCInternalAuthenticationResponse: initWithDictionary %@", buf, 0xCu);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("businessIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("businessIdentifier"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupIdentifier"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("credentials"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("credentials"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errors"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v18)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errors"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v10)
    {
      if (v13)
      {
        if (v19)
        {
          v38 = v16;
          v39 = v13;
          v40 = v10;
          v20 = (NSArray *)objc_opt_new();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v21 = v19;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v42 != v24)
                  objc_enumerationMutation(v21);
                v26 = -[BCError initWithDictionary:]([BCError alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
                if (v26)
                  -[NSArray addObject:](v20, "addObject:", v26);

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
            }
            while (v23);
          }

          errors = v5->_errors;
          v5->_errors = v20;

          v13 = v39;
          v10 = v40;
          v16 = v38;
        }
        businessIdentifier = v5->_businessIdentifier;
        v5->_businessIdentifier = v10;
        v29 = v10;

        groupIdentifier = v5->_groupIdentifier;
        v5->_groupIdentifier = v13;
        v31 = v13;

        v32 = CFSTR("authenticated");
        if (!v16)
          v32 = CFSTR("failed");
        v5->_status = &v32->isa;
        credentials = v5->_credentials;
        v5->_credentials = v16;

        goto LABEL_32;
      }
      LogCategory_Daemon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
LABEL_36:

        v34 = 0;
        goto LABEL_37;
      }
      *(_WORD *)buf = 0;
      v36 = "Unable to create  BCInternalAuthenticationResponse: missing 'groupIdentifier' in payload";
    }
    else
    {
      LogCategory_Daemon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v36 = "Unable to create BCInternalAuthenticationResponse: missing 'business identifier' in payload";
    }
    _os_log_error_impl(&dword_21C655000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_36;
  }
LABEL_32:
  v34 = v5;
LABEL_37:

  return v34;
}

- (BCInternalAuthenticationResponse)initWithBusinessIdentifier:(id)a3 groupIdentifier:(id)a4 credentials:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BCInternalAuthenticationResponse *v15;
  BCInternalAuthenticationResponse *v16;
  const __CFString *v17;
  BCError *v18;
  void *v19;
  void *v20;
  void *v21;
  BCError *v22;
  uint64_t v23;
  NSArray *errors;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)BCInternalAuthenticationResponse;
  v15 = -[BCInternalAuthenticationResponse init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_businessIdentifier, a3);
    objc_storeStrong((id *)&v16->_groupIdentifier, a4);
    objc_storeStrong((id *)&v16->_credentials, a5);
    v17 = CFSTR("authenticated");
    if (!v13)
      v17 = CFSTR("failed");
    v16->_status = &v17->isa;
    if (v14)
    {
      v18 = [BCError alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "code"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[BCError initWithCode:domain:message:](v18, "initWithCode:domain:message:", v19, v20, v21);

      v27[0] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
      v23 = objc_claimAutoreleasedReturnValue();
      errors = v16->_errors;
      v16->_errors = (NSArray *)v23;

    }
  }

  return v16;
}

- (id)responseMessageFor:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  BCMessageInfo *v34;
  BCMessage *v35;
  void *v36;
  id v37;
  BCInternalAuthenticationResponse *v39;
  BCInternalAuthenticationResponse *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v6 = a3;
  v7 = a4;
  v44 = v6;
  objc_msgSend(v6, "authenticationRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("success"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "replyMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receivedMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = v11;
  else
    v14 = v12;
  objc_msgSend(v14, "imageIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "imageDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = v11;
  else
    v16 = v12;
  objc_msgSend(v16, "imageDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v10;
  objc_msgSend(v10, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v39 = self;
    v18 = (void *)objc_opt_new();
    objc_msgSend(v44, "lastName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFamilyName:", v19);

    objc_msgSend(v44, "firstName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setGivenName:", v20);

    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setStyle:", 0);
    v22 = (void *)MEMORY[0x24BDD17C8];
    +[BCShared classBundle]();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SIGNED_IN"), &stru_24E0651E8, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromPersonNameComponents:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v24, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    self = v39;
  }
  -[BCInternalAuthenticationResponse status](self, "status");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("failed"));

  if (v27)
  {
    v40 = self;
    objc_msgSend(v44, "authenticationRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "labels");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("failure"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v30, "title");
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[BCShared classBundle]();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ERROR_INTERNAL_AUTHENTICATION_FAILED"), &stru_24E0651E8, 0);
      v32 = objc_claimAutoreleasedReturnValue();

      v17 = v33;
    }

    v17 = (void *)v32;
    self = v40;
  }
  v34 = -[BCMessageInfo initWithTitle:subtitle:style:alternateTitle:imageIdentifier:imageDescription:]([BCMessageInfo alloc], "initWithTitle:subtitle:style:alternateTitle:imageIdentifier:imageDescription:", v17, 0, CFSTR("icon"), 0, v43, v41);

  v35 = [BCMessage alloc];
  objc_msgSend(v7, "rootKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[BCMessage initFromOriginalMessage:rootKey:rootObject:receivedMessage:replyMessage:](v35, "initFromOriginalMessage:rootKey:rootObject:receivedMessage:replyMessage:", v7, v36, self, v12, v34);

  return v37;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_businessIdentifier, CFSTR("businessIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_status, CFSTR("status"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_credentials, CFSTR("credentials"));
  -[BCInternalAuthenticationResponse errors](self, "errors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[BCInternalAuthenticationResponse errors](self, "errors", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errors"));
  }
  return (NSDictionary *)v3;
}

- (BCError)error
{
  void *v2;
  void *v3;

  -[BCInternalAuthenticationResponse errors](self, "errors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BCError *)v3;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)businessIdentifier
{
  return self->_businessIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)credentials
{
  return self->_credentials;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_businessIdentifier, 0);
}

@end
