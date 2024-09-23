@implementation LACUserInterfaceRequest

- (LACUserInterfaceRequest)init
{
  return -[LACUserInterfaceRequest initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3
{
  return -[LACUserInterfaceRequest initWithIdentifier:evaluationRequest:contextID:](self, "initWithIdentifier:evaluationRequest:contextID:", a3, 0, 0);
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4
{
  return -[LACUserInterfaceRequest initWithIdentifier:evaluationRequest:contextID:](self, "initWithIdentifier:evaluationRequest:contextID:", a3, a4, 0);
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4 contextID:(id)a5
{
  id v8;
  id v9;
  LACUserInterfaceRequest *v10;
  LACUserInterfaceRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)LACUserInterfaceRequest;
  v10 = -[LACUserInterfaceRequest init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    -[LACUserInterfaceRequest setIdentifier:](v10, "setIdentifier:", a3);
    -[LACUserInterfaceRequest setContextID:](v11, "setContextID:", v9);
    objc_msgSend(v8, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACClientInfoProvider infoForXPCClient:evaluationOptions:](LACClientInfoProvider, "infoForXPCClient:evaluationOptions:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUserInterfaceRequest setClientInfo:](v11, "setClientInfo:", v14);

    objc_msgSend(v8, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kLACEvaluationRequestPayloadKeyInternalInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "options");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1080);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = objc_msgSend(v19, "integerValue");
    else
      v20 = 3;
    if ((v20 & 2) != 0)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AuditToken"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACUserInterfaceRequest setClientAuditTokenData:](v11, "setClientAuditTokenData:", v21);

    }
    else
    {
      -[LACUserInterfaceRequest setClientAuditTokenData:](v11, "setClientAuditTokenData:", 0);
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ProcessId"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUserInterfaceRequest setClientProcessId:](v11, "setClientProcessId:", objc_msgSend(v22, "intValue"));

    -[LACUserInterfaceRequest setIsAuditTokenApplicationIdentity:](v11, "setIsAuditTokenApplicationIdentity:", (v20 & 4) != 0);
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SiriPlugin"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUserInterfaceRequest setIsForSiri:](v11, "setIsForSiri:", objc_msgSend(v23, "BOOLValue"));

    -[LACUserInterfaceRequest setIsForSoftwareUpdate:](v11, "setIsForSoftwareUpdate:", objc_msgSend(v8, "policy") == 1010);
  }

  return v11;
}

+ (id)unknownInstance
{
  return objc_alloc_init(LACUserInterfaceRequest);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  id v20;

  v4 = a3;
  v5 = -[LACUserInterfaceRequest identifier](self, "identifier");
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[LACUserInterfaceRequest contextID](self, "contextID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contextID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[LACUserInterfaceRequest clientAuditTokenData](self, "clientAuditTokenData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clientAuditTokenData);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[LACUserInterfaceRequest clientInfo](self, "clientInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clientInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[LACUserInterfaceRequest clientProcessId](self, "clientProcessId");
  NSStringFromSelector(sel_clientProcessId);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", v13, v14);

  v15 = -[LACUserInterfaceRequest isAuditTokenApplicationIdentity](self, "isAuditTokenApplicationIdentity");
  NSStringFromSelector(sel_isAuditTokenApplicationIdentity);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[LACUserInterfaceRequest isForSiri](self, "isForSiri");
  NSStringFromSelector(sel_isForSiri);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[LACUserInterfaceRequest isForSoftwareUpdate](self, "isForSoftwareUpdate");
  NSStringFromSelector(sel_isForSoftwareUpdate);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

}

- (LACUserInterfaceRequest)initWithCoder:(id)a3
{
  id v4;
  LACUserInterfaceRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v5 = -[LACUserInterfaceRequest init](self, "init");
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setIdentifier:](v5, "setIdentifier:", objc_msgSend(v4, "decodeIntegerForKey:", v6));

  v7 = objc_opt_class();
  NSStringFromSelector(sel_contextID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setContextID:](v5, "setContextID:", v9);

  v10 = objc_opt_class();
  NSStringFromSelector(sel_clientAuditTokenData);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setClientAuditTokenData:](v5, "setClientAuditTokenData:", v12);

  v13 = objc_opt_class();
  NSStringFromSelector(sel_clientInfo);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setClientInfo:](v5, "setClientInfo:", v15);

  NSStringFromSelector(sel_clientProcessId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setClientProcessId:](v5, "setClientProcessId:", objc_msgSend(v4, "decodeIntForKey:", v16));

  NSStringFromSelector(sel_isAuditTokenApplicationIdentity);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setIsAuditTokenApplicationIdentity:](v5, "setIsAuditTokenApplicationIdentity:", objc_msgSend(v4, "decodeBoolForKey:", v17));

  NSStringFromSelector(sel_isForSiri);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setIsForSiri:](v5, "setIsForSiri:", objc_msgSend(v4, "decodeBoolForKey:", v18));

  NSStringFromSelector(sel_isForSoftwareUpdate);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "decodeBoolForKey:", v19);

  -[LACUserInterfaceRequest setIsForSoftwareUpdate:](v5, "setIsForSoftwareUpdate:", v20);
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[10];

  v37[8] = *MEMORY[0x24BDAC8D0];
  v32 = (void *)MEMORY[0x24BDD17C8];
  v31 = objc_opt_class();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[LACUserInterfaceRequest identifier](self, "identifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier: %@"), v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v35;
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[LACUserInterfaceRequest contextID](self, "contextID");
  v5 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("contextID: %@"), v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v33;
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[LACUserInterfaceRequest clientAuditTokenData](self, "clientAuditTokenData");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v7;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("clientAuditTokenData: %@"), v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v30;
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[LACUserInterfaceRequest clientInfo](self, "clientInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("clientInfo: %@"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v28;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[LACUserInterfaceRequest clientProcessId](self, "clientProcessId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("clientProcessId: %@"), v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v26;
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUserInterfaceRequest isAuditTokenApplicationIdentity](self, "isAuditTokenApplicationIdentity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("isAuditTokenApplicationIdentity: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v13;
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUserInterfaceRequest isForSiri](self, "isForSiri"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("isForSiri: %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v16;
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUserInterfaceRequest isForSoftwareUpdate](self, "isForSoftwareUpdate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("isForSoftwareUpdate: %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("; "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v31, self, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (!v34)

  return (NSString *)v22;
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_clientAuditTokenData, a3);
}

- (LACClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (int)clientProcessId
{
  return self->_clientProcessId;
}

- (void)setClientProcessId:(int)a3
{
  self->_clientProcessId = a3;
}

- (BOOL)isAuditTokenApplicationIdentity
{
  return self->_isAuditTokenApplicationIdentity;
}

- (void)setIsAuditTokenApplicationIdentity:(BOOL)a3
{
  self->_isAuditTokenApplicationIdentity = a3;
}

- (BOOL)isForSiri
{
  return self->_isForSiri;
}

- (void)setIsForSiri:(BOOL)a3
{
  self->_isForSiri = a3;
}

- (BOOL)isForSoftwareUpdate
{
  return self->_isForSoftwareUpdate;
}

- (void)setIsForSoftwareUpdate:(BOOL)a3
{
  self->_isForSoftwareUpdate = a3;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
}

@end
