@implementation HMDRemoteMessage

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5
{
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:](self, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:", a3, -1, a4, a5, 3, 0, 0.0, -1, 0);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6
{
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:](self, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", a3, a4, a5, a6, 3, 0, 0.0, -1);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 userInfo:(id)a6 headers:(id)a7 payload:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", a3, a4, a5, a8, a7, 3, 0.0, v9, -1, 0);
}

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 type:(int64_t)a6 timeout:(double)a7 secure:(BOOL)a8
{
  return -[HMDRemoteMessage initWithName:destination:payload:headers:type:timeout:secure:](self, "initWithName:destination:payload:headers:type:timeout:secure:", a3, a4, a5, 0, a6, a8, a7);
}

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 headers:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", a3, -1, a4, a5, a6, a7, a8, v10, -1, 0);
}

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 type:(int64_t)a6 timeout:(double)a7 secure:(BOOL)a8 restriction:(unint64_t)a9
{
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:](self, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:", a3, -1, a4, a5, a6, a8, a7, a9, 0);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10
{
  uint64_t v11;

  LOBYTE(v11) = a10;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", a3, a4, a5, a6, a7, a8, a9, v11, -1, 0);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:", a3, a4, a5, a6, 0, a7, a8, v10);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10
{
  uint64_t v11;

  LOBYTE(v11) = a9;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", a3, a4, a5, a6, 0, a7, a8, v11, a10, 0);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10 sendOptions:(unint64_t)a11
{
  uint64_t v12;

  LOBYTE(v12) = a9;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", a3, a4, a5, a6, 0, a7, a8, v12, a10, a11);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10 restriction:(unint64_t)a11 sendOptions:(unint64_t)a12
{
  uint64_t v13;

  LOBYTE(v13) = a10;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:collapseID:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:collapseID:", a3, a4, a5, a6, a7, a8, a9, v13, a11, a12, 0);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10 sendOptions:(unint64_t)a11 collapseID:(id)a12
{
  uint64_t v13;

  LOBYTE(v13) = a9;
  return -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:collapseID:](self, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:collapseID:", a3, a4, a5, a6, 0, a7, a8, v13, a10, a11, a12);
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10 restriction:(unint64_t)a11 sendOptions:(unint64_t)a12 collapseID:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  HMDRemoteMessage *v31;
  HMDRemoteMessage *v32;
  void *v33;
  uint64_t v34;
  NSUUID *transactionIdentifier;
  int64_t v38;
  objc_super v39;
  _QWORD v40[3];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a13;
  v24 = __ROR8__(a4 - 9, 3);
  if (v24 >= 4)
    v25 = HMDCurrentQOSWithFloor();
  else
    v25 = 8 * v24 + 9;
  v41[0] = MEMORY[0x24BDBD1C8];
  v40[0] = CFSTR("HMD.remote");
  v40[1] = CFSTR("HMD.remoteSecure");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a10, a8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v26;
  v40[2] = CFSTR("HMD.remoteTransportRestriction");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v29 = (void *)objc_msgSend(v28, "mutableCopy");
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, CFSTR("HMD.remoteCollapseID"));
    v30 = objc_msgSend(v29, "copy");

    v28 = (void *)v30;
  }
  v39.receiver = self;
  v39.super_class = (Class)HMDRemoteMessage;
  v31 = -[HMDRemoteMessage initWithName:qualityOfService:destination:userInfo:headers:payload:](&v39, sel_initWithName_qualityOfService_destination_userInfo_headers_payload_, v19, v25, v20, v28, v22, v21);
  v32 = v31;
  if (v31)
  {
    v31->_type = v38;
    if (a9 > 0.0)
    {
      -[HMDRemoteMessage internal](v31, "internal");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTimeout:", a9);

    }
    if (!v38)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v34 = objc_claimAutoreleasedReturnValue();
      transactionIdentifier = v32->_transactionIdentifier;
      v32->_transactionIdentifier = (NSUUID *)v34;

    }
    v32->_sendOptions = a12;
  }

  return v32;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _BOOL4 v23;
  __CFString *v24;

  v3 = a3;
  v5 = shouldLogPrivateInformation();
  -[HMDRemoteMessage destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, "privateDescription");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if ((shouldLogPrivateInformation() & 1) != 0)
  {
    -[HMDRemoteMessage userInfo](self, "userInfo");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = CFSTR("...");
    v9 = CFSTR("...");
  }
  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %p"), self);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_24E79DB48;
  }
  v23 = v3;
  -[HMDRemoteMessage identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage qualityOfService](self, "qualityOfService");
  HMFQualityOfServiceToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDRemoteMessage type](self, "type");
  if (v15 > 3)
    v16 = 0;
  else
    v16 = off_24E79B130[v15];
  -[HMDRemoteMessage transactionIdentifier](self, "transactionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage headers](self, "headers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Name = %@, QoS = %@, Type = %@, TransactionIdentifier = %@, Destination = %@,\nUser Info = %@,\nHeaders = %@>"), v22, v10, v12, v13, v14, v16, v17, v7, v24, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  return v19;
}

- (id)debugDescription
{
  return -[HMDRemoteMessage descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMDRemoteMessage descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)privateDescription
{
  return -[HMDRemoteMessage descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)isRemote
{
  return 1;
}

- (void)setSecure:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[HMDRemoteMessage userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("HMD.remoteSecure"));

  -[HMDRemoteMessage internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setUserInfo:", v8);

}

- (void)setType:(int64_t)a3
{
  void *v4;
  id v5;

  self->_type = a3;
  if (!a3)
  {
    -[HMDRemoteMessage transactionIdentifier](self, "transactionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteMessage setTransactionIdentifier:](self, "setTransactionIdentifier:", v5);

    }
  }
}

- (void)setResponseHandler:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (v4 && -[HMDRemoteMessage type](self, "type") == 3)
    -[HMDRemoteMessage setType:](self, "setType:", 0);
  v5.receiver = self;
  v5.super_class = (Class)HMDRemoteMessage;
  -[HMDRemoteMessage setResponseHandler:](&v5, sel_setResponseHandler_, v4);

}

- (void)setInternalResponseHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDRemoteMessage;
  -[HMDRemoteMessage setResponseHandler:](&v3, sel_setResponseHandler_, a3);
}

- (void)setRestriction:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDRemoteMessage userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("HMD.remoteTransportRestriction"));

  -[HMDRemoteMessage internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setUserInfo:", v8);

}

- (void)setResponseRestriction:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDRemoteMessage userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("HMD.remoteTransportResponseRestriction"));

  -[HMDRemoteMessage internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setUserInfo:", v8);

}

- (NSString)attributedMessageName
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDRemoteMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_stringForKey:", CFSTR("HMD.attributedMessageName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setAttributedMessageName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[HMDRemoteMessage userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("HMD.attributedMessageName"));
    -[HMDRemoteMessage internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setUserInfo:", v7);

  }
}

- (void)setSenderContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDRemoteMessage userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("HMD.remoteSenderContext"));
  -[HMDRemoteMessage internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v7);

}

- (void)setToID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDRemoteMessage userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("kRemoteMessageIDSToIDKey"));
  -[HMDRemoteMessage internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v7);

}

- (NSString)collapseID
{
  void *v2;
  void *v3;

  -[HMDRemoteMessage userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMD.remoteCollapseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDisallowsIDSRacing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[HMDRemoteMessage userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("HMD.remoteDisallowsIDSRacing"));

  -[HMDRemoteMessage internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInfo:", v8);

}

- (id)copyWithDestination:(id)a3
{
  id v4;
  HMDRemoteMessage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  double v11;
  double v12;
  HMDRemoteMessage *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v4 = a3;
  v5 = [HMDRemoteMessage alloc];
  -[HMDRemoteMessage name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDRemoteMessage qualityOfService](self, "qualityOfService");
  -[HMDRemoteMessage messagePayload](self, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage headers](self, "headers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDRemoteMessage type](self, "type");
  -[HMDRemoteMessage timeout](self, "timeout");
  v12 = v11;
  LOBYTE(v17) = -[HMDRemoteMessage isSecure](self, "isSecure");
  v13 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](v5, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", v6, v7, v4, v8, v9, v10, v12, v17, -[HMDRemoteMessage restriction](self, "restriction"), -[HMDRemoteMessage sendOptions](self, "sendOptions"));

  -[HMDRemoteMessage transactionIdentifier](self, "transactionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage setTransactionIdentifier:](v13, "setTransactionIdentifier:", v14);

  -[HMDRemoteMessage identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage setIdentifier:](v13, "setIdentifier:", v15);

  -[HMDRemoteMessage setDisallowsIDSRacing:](v13, "setDisallowsIDSRacing:", -[HMDRemoteMessage disallowsIDSRacing](self, "disallowsIDSRacing"));
  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)sendOptions
{
  return self->_sendOptions;
}

- (HMDHomeKitVersion)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
  objc_storeStrong((id *)&self->_sourceVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

+ (id)secureMessageWithName:(id)a3 destination:(id)a4 messagePayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:", v10, -1, v9, v8, 3, 1, 0.0, -1, 0);

  return v11;
}

+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:", v12, a4, v11, v10, 3, 1, 0.0, -1, 0);

  return v13;
}

+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 restriction:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:", v14, a4, v13, v12, 3, 1, 0.0, a7, 0);

  return v15;
}

+ (HMDRemoteMessage)messageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 restriction:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:", v14, a4, v13, v12, 3, 0, 0.0, a7, 0);

  return (HMDRemoteMessage *)v15;
}

@end
