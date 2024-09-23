@implementation CRKSendIDSMessageRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKSendIDSMessageRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CRKSendIDSMessageRequest message](self, "message", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("message"));

  -[CRKSendIDSMessageRequest destinationAddress](self, "destinationAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("destinationAddress"));

  -[CRKSendIDSMessageRequest sourceAppleID](self, "sourceAppleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceAppleID"));

  -[CRKSendIDSMessageRequest options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("options"));

}

- (CRKSendIDSMessageRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSendIDSMessageRequest *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *message;
  void *v17;
  uint64_t v18;
  NSString *destinationAddress;
  void *v20;
  uint64_t v21;
  NSString *sourceAppleID;
  void *v23;
  uint64_t v24;
  CRKIDSMessageOptions *options;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CRKSendIDSMessageRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    v29 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    v27 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v28, v27, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("message"));
    v15 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("destinationAddress"));
    v18 = objc_claimAutoreleasedReturnValue();
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v18;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("sourceAppleID"));
    v21 = objc_claimAutoreleasedReturnValue();
    sourceAppleID = v5->_sourceAppleID;
    v5->_sourceAppleID = (NSString *)v21;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("options"));
    v24 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (CRKIDSMessageOptions *)v24;

  }
  return v5;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (void)setSourceAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (void)setDestinationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CRKIDSMessageOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_sourceAppleID, 0);
}

@end
