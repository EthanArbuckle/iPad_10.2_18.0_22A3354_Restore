@implementation CRKRequestCertificatesIDSMessage

- (CRKRequestCertificatesIDSMessage)initWithRequestIdentifier:(id)a3 controlGroupIdentifier:(id)a4 destinationDeviceIdentifier:(id)a5 sourceRole:(int64_t)a6 destinationRole:(int64_t)a7 requesterCertificate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  CRKRequestCertificatesIDSMessage *v19;
  CRKRequestCertificatesIDSMessage *v20;
  uint64_t v21;
  NSString *destinationDeviceIdentifier;
  uint64_t v23;
  NSData *requesterCertificate;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)CRKRequestCertificatesIDSMessage;
  v19 = -[CRKRequestCertificatesIDSMessage init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_requestIdentifier, a3);
    objc_storeStrong((id *)&v20->_controlGroupIdentifier, a4);
    v21 = objc_msgSend(v17, "copy");
    destinationDeviceIdentifier = v20->_destinationDeviceIdentifier;
    v20->_destinationDeviceIdentifier = (NSString *)v21;

    v20->_sourceRole = a6;
    v20->_destinationRole = a7;
    v23 = objc_msgSend(v18, "copy");
    requesterCertificate = v20->_requesterCertificate;
    v20->_requesterCertificate = (NSData *)v23;

  }
  return v20;
}

+ (id)messageWithControlGroupIdentifier:(id)a3 destinationDeviceIdentifier:(id)a4 sourceRole:(int64_t)a5 destinationRole:(int64_t)a6 requesterCertificate:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = (void *)MEMORY[0x24BDD1880];
  v13 = a7;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestIdentifier:controlGroupIdentifier:destinationDeviceIdentifier:sourceRole:destinationRole:requesterCertificate:", v16, v15, v14, a5, a6, v13);

  return v17;
}

- (int64_t)messageType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("RequestIdentifier");
  -[CRKRequestCertificatesIDSMessage requestIdentifier](self, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = CFSTR("ControlGroupIdentifier");
  -[CRKRequestCertificatesIDSMessage controlGroupIdentifier](self, "controlGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v16[2] = CFSTR("DestinationDeviceIdentifier");
  -[CRKRequestCertificatesIDSMessage destinationDeviceIdentifier](self, "destinationDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v16[3] = CFSTR("SourceRole");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKRequestCertificatesIDSMessage sourceRole](self, "sourceRole"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  v16[4] = CFSTR("DestinationRole");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKRequestCertificatesIDSMessage destinationRole](self, "destinationRole"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[CRKRequestCertificatesIDSMessage requesterCertificate](self, "requesterCertificate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CRKRequestCertificatesIDSMessage requesterCertificate](self, "requesterCertificate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("RequesterCertificate"));

  }
  v14 = (void *)objc_msgSend(v11, "copy");

  return (NSDictionary *)v14;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  objc_class *v29;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ControlGroupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DestinationDeviceIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SourceRole"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DestinationRole"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequesterCertificate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  v23 = 0;
  if (v7 && v10 && v13 && v16 && v19)
  {
    v29 = (objc_class *)a1;
    v30 = v7;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7E8]), "initWithString:", v10);
    v26 = objc_msgSend(v16, "integerValue");
    v27 = objc_msgSend(v19, "integerValue");
    v23 = 0;
    if (v24 && v25 && (v26 & 0x8000000000000000) == 0 && v26 <= 1 && (v27 & 0x8000000000000000) == 0 && v27 <= 1)
      v23 = (void *)objc_msgSend([v29 alloc], "initWithRequestIdentifier:controlGroupIdentifier:destinationDeviceIdentifier:sourceRole:destinationRole:requesterCertificate:", v24, v25, v13, v26, v27, v22);

    v7 = v30;
  }

  return v23;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (DMFControlGroupIdentifier)controlGroupIdentifier
{
  return self->_controlGroupIdentifier;
}

- (int64_t)sourceRole
{
  return self->_sourceRole;
}

- (int64_t)destinationRole
{
  return self->_destinationRole;
}

- (NSString)destinationDeviceIdentifier
{
  return self->_destinationDeviceIdentifier;
}

- (NSData)requesterCertificate
{
  return self->_requesterCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterCertificate, 0);
  objc_storeStrong((id *)&self->_destinationDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_controlGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
