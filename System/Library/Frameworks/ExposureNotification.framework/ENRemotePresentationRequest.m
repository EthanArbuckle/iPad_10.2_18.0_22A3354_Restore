@implementation ENRemotePresentationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)presentationRequestWithType:(int64_t)a3
{
  ENRemotePresentationRequest *v4;
  void *v5;

  v4 = objc_alloc_init(ENRemotePresentationRequest);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRemotePresentationRequest setReceiptId:](v4, "setReceiptId:", v5);

  -[ENRemotePresentationRequest setRequestType:](v4, "setRequestType:", a3);
  -[ENRemotePresentationRequest setDecisionInfo:](v4, "setDecisionInfo:", MEMORY[0x24BDBD1B8]);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ENRemotePresentationRequest requestType](self, "requestType"), CFSTR("requestType"));
  -[ENRemotePresentationRequest receiptId](self, "receiptId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("receiptId"));

  -[ENRemotePresentationRequest appBundleIdentifier](self, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleId"));

  -[ENRemotePresentationRequest agencyRegion](self, "agencyRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("region"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ENRemotePresentationRequest testMode](self, "testMode"), CFSTR("testMode"));
  -[ENRemotePresentationRequest decisionInfo](self, "decisionInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("decisionInfo"));

}

- (ENRemotePresentationRequest)initWithCoder:(id)a3
{
  id v4;
  ENRemotePresentationRequest *v5;
  ENRemotePresentationRequest *v6;
  ENRemotePresentationRequest *v7;
  uint64_t v8;
  NSUUID *receiptId;
  uint64_t v10;
  NSString *appBundleIdentifier;
  uint64_t v12;
  ENRegion *agencyRegion;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *decisionInfo;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ENRemotePresentationRequest init](self, "init");
  if (!v5)
  {
LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }
  v5->_requestType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiptId"));
  v6 = (ENRemotePresentationRequest *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = -[ENRemotePresentationRequest copy](v6, "copy");
    receiptId = v5->_receiptId;
    v5->_receiptId = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v10 = objc_claimAutoreleasedReturnValue();
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v12 = objc_claimAutoreleasedReturnValue();
    agencyRegion = v5->_agencyRegion;
    v5->_agencyRegion = (ENRegion *)v12;

    v14 = objc_alloc(MEMORY[0x24BDBCF20]);
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithArray:", v15, v20, v21);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("decisionInfo"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

      v7 = 0;
      goto LABEL_6;
    }
    decisionInfo = v5->_decisionInfo;
    v5->_decisionInfo = (NSDictionary *)v17;

    v5->_testMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("testMode"));
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ENRemotePresentationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = -[ENRemotePresentationRequest init](+[ENRemotePresentationRequest allocWithZone:](ENRemotePresentationRequest, "allocWithZone:"), "init");
  -[ENRemotePresentationRequest setRequestType:](v5, "setRequestType:", -[ENRemotePresentationRequest requestType](self, "requestType"));
  -[ENRemotePresentationRequest receiptId](self, "receiptId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[ENRemotePresentationRequest setReceiptId:](v5, "setReceiptId:", v7);

  -[ENRemotePresentationRequest appBundleIdentifier](self, "appBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[ENRemotePresentationRequest setAppBundleIdentifier:](v5, "setAppBundleIdentifier:", v9);

  -[ENRemotePresentationRequest agencyRegion](self, "agencyRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[ENRemotePresentationRequest setAgencyRegion:](v5, "setAgencyRegion:", v11);

  -[ENRemotePresentationRequest setTestMode:](v5, "setTestMode:", -[ENRemotePresentationRequest testMode](self, "testMode"));
  -[ENRemotePresentationRequest decisionInfo](self, "decisionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[ENRemotePresentationRequest setDecisionInfo:](v5, "setDecisionInfo:", v13);

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t requestType;
  uint64_t v7;
  void *v8;
  ENRegion *agencyRegion;
  const __CFString *appBundleIdentifier;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestType = self->_requestType;
  -[NSUUID UUIDString](self->_receiptId, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  agencyRegion = (ENRegion *)CFSTR("<>");
  appBundleIdentifier = (const __CFString *)self->_appBundleIdentifier;
  if (!appBundleIdentifier)
    appBundleIdentifier = CFSTR("<>");
  if (self->_agencyRegion)
    agencyRegion = self->_agencyRegion;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %ld %@ App %@ Region %@"), v5, requestType, v7, appBundleIdentifier, agencyRegion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (ENRegion)region
{
  ENRegion *agencyRegion;

  agencyRegion = self->_agencyRegion;
  if (agencyRegion)
    return agencyRegion;
  else
    return -[ENRegion initWithCountryCode:]([ENRegion alloc], "initWithCountryCode:", CFSTR("US"));
}

- (void)onboardingRequestCompletedWithDecision:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  NSDictionary *v7;
  NSDictionary *decisionInfo;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v3 = a3;
  v11[2] = *MEMORY[0x24BDAC8D0];
  if (-[ENRemotePresentationRequest requestType](self, "requestType") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRemotePresentationRequest.m"), 96, CFSTR("Encountered wrong request type"));

  }
  v10[0] = CFSTR("decisionType");
  v10[1] = CFSTR("decisionResult");
  v11[0] = &unk_24C396EA8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  decisionInfo = self->_decisionInfo;
  self->_decisionInfo = v7;

}

- (void)keyReleaseRequestCompletedWithDecision:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  NSDictionary *v7;
  NSDictionary *decisionInfo;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v3 = a3;
  v11[2] = *MEMORY[0x24BDAC8D0];
  if (-[ENRemotePresentationRequest requestType](self, "requestType") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRemotePresentationRequest.m"), 104, CFSTR("Encountered wrong request type"));

  }
  v10[0] = CFSTR("decisionType");
  v10[1] = CFSTR("decisionResult");
  v11[0] = &unk_24C396EC0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  decisionInfo = self->_decisionInfo;
  self->_decisionInfo = v7;

}

- (void)preApprovalRequestCompletedWithDecision:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  NSDictionary *v7;
  NSDictionary *decisionInfo;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v3 = a3;
  v11[2] = *MEMORY[0x24BDAC8D0];
  if (-[ENRemotePresentationRequest requestType](self, "requestType") != 3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRemotePresentationRequest.m"), 112, CFSTR("Encountered wrong request type"));

  }
  v10[0] = CFSTR("decisionType");
  v10[1] = CFSTR("decisionResult");
  v11[0] = &unk_24C396ED8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  decisionInfo = self->_decisionInfo;
  self->_decisionInfo = v7;

}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (NSUUID)receiptId
{
  return self->_receiptId;
}

- (void)setReceiptId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)decisionInfo
{
  return self->_decisionInfo;
}

- (void)setDecisionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ENRegion)agencyRegion
{
  return self->_agencyRegion;
}

- (void)setAgencyRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_agencyRegion, 0);
  objc_storeStrong((id *)&self->_decisionInfo, 0);
  objc_storeStrong((id *)&self->_receiptId, 0);
}

@end
