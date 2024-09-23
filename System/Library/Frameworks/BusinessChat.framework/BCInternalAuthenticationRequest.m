@implementation BCInternalAuthenticationRequest

- (BCInternalAuthenticationRequest)initWithDictionary:(id)a3
{
  id v4;
  BCInternalAuthenticationRequest *v5;
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
  NSArray *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  BCAuthenticationLabels *v31;
  NSString *businessIdentifier;
  NSString *v33;
  NSString *groupIdentifier;
  NSString *v35;
  NSString *responseEncryptionKey;
  NSString *v37;
  NSArray *retrieve;
  NSArray *v39;
  NSDictionary *labels;
  BCInternalAuthenticationRequest *v41;
  NSObject *v42;
  const char *v43;
  NSArray *v45;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  BCInternalAuthenticationRequest *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)BCInternalAuthenticationRequest;
  v5 = -[BCInternalAuthenticationRequest init](&v54, sel_init);
  if (v5)
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCInternalAuthenticationRequest: initWithDictionary %@", buf, 0xCu);

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

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseEncryptionKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseEncryptionKey"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retrieve"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v18)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retrieve"));
      v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labels"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 == v21)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labels"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v23 = (NSDictionary *)objc_opt_new();
    if (v10)
    {
      if (v13)
      {
        if (v16)
        {
          if (v19)
          {
            v45 = v19;
            v46 = v16;
            v47 = v13;
            v48 = v10;
            v49 = v5;
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v24 = v22;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v51 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
                  objc_msgSend(v24, "objectForKeyedSubscript:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v30)
                  {
                    v31 = -[BCAuthenticationLabels initWithDictionary:]([BCAuthenticationLabels alloc], "initWithDictionary:", v30);
                    -[NSDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v31, v29);

                  }
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
              }
              while (v26);
            }

            v5 = v49;
            businessIdentifier = v49->_businessIdentifier;
            v49->_businessIdentifier = v48;
            v33 = v48;

            groupIdentifier = v49->_groupIdentifier;
            v49->_groupIdentifier = v47;
            v35 = v47;

            responseEncryptionKey = v49->_responseEncryptionKey;
            v49->_responseEncryptionKey = v46;
            v37 = v46;

            retrieve = v49->_retrieve;
            v49->_retrieve = v45;
            v39 = v45;

            labels = v49->_labels;
            v49->_labels = v23;

            goto LABEL_33;
          }
          LogCategory_Daemon();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "Unable to create  BCInternalAuthenticationRequest: missing 'retrieve' in payload";
            goto LABEL_42;
          }
LABEL_43:

          v41 = 0;
          goto LABEL_44;
        }
        LogCategory_Daemon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_WORD *)buf = 0;
        v43 = "Unable to create  BCInternalAuthenticationRequest: missing 'responseEncryptionKey' in payload";
      }
      else
      {
        LogCategory_Daemon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_WORD *)buf = 0;
        v43 = "Unable to create  BCInternalAuthenticationRequest: missing 'groupIdentifier' in payload";
      }
    }
    else
    {
      LogCategory_Daemon();
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_WORD *)buf = 0;
      v43 = "Unable to create BCInternalAuthenticationRequest: missing 'business identifier' in payload";
    }
LABEL_42:
    _os_log_error_impl(&dword_21C655000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
    goto LABEL_43;
  }
LABEL_33:
  v41 = v5;
LABEL_44:

  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *businessIdentifier;
  id v5;

  businessIdentifier = self->_businessIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", businessIdentifier, CFSTR("businessIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseEncryptionKey, CFSTR("responseEncryptionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_retrieve, CFSTR("retrieve"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labels, CFSTR("labels"));

}

- (BCInternalAuthenticationRequest)initWithCoder:(id)a3
{
  id v4;
  BCInternalAuthenticationRequest *v5;
  NSObject *v6;
  uint64_t v7;
  NSString *businessIdentifier;
  uint64_t v9;
  NSString *groupIdentifier;
  uint64_t v11;
  NSString *responseEncryptionKey;
  uint64_t v13;
  NSArray *retrieve;
  uint64_t v15;
  NSDictionary *labels;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BCInternalAuthenticationRequest;
  v5 = -[BCInternalAuthenticationRequest init](&v18, sel_init);
  if (v5)
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCInternalAuthenticationRequest: initWithCoder %@", buf, 0xCu);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    businessIdentifier = v5->_businessIdentifier;
    v5->_businessIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseEncryptionKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    responseEncryptionKey = v5->_responseEncryptionKey;
    v5->_responseEncryptionKey = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("retrieve"));
    v13 = objc_claimAutoreleasedReturnValue();
    retrieve = v5->_retrieve;
    v5->_retrieve = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labels"));
    v15 = objc_claimAutoreleasedReturnValue();
    labels = v5->_labels;
    v5->_labels = (NSDictionary *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
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
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_labels;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_labels, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dictionaryValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_businessIdentifier, CFSTR("businessIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_responseEncryptionKey, CFSTR("responseEncryptionKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_retrieve, CFSTR("retrieve"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("labels"));
  v13 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v13;
}

- (NSString)businessIdentifier
{
  return self->_businessIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)responseEncryptionKey
{
  return self->_responseEncryptionKey;
}

- (NSArray)retrieve
{
  return self->_retrieve;
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_retrieve, 0);
  objc_storeStrong((id *)&self->_responseEncryptionKey, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_businessIdentifier, 0);
}

@end
