@implementation CATMessage

- (CATMessage)init
{
  CATMessage *v2;
  uint64_t v3;
  NSUUID *messageUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATMessage;
  v2 = -[CATMessage init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    messageUUID = v2->_messageUUID;
    v2->_messageUUID = (NSUUID *)v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATMessage)initWithCoder:(id)a3
{
  id v4;
  CATMessage *v5;
  void *v6;
  uint64_t v7;
  NSUUID *messageUUID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATMessage;
  v5 = -[CATMessage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("messageUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    messageUUID = v5->_messageUUID;
    v5->_messageUUID = (NSUUID *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CATMessage messageUUID](self, "messageUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("messageUUID"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATMessage messageUUID](self, "messageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { messageUUID = '%@' }>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (void)setMessageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_messageUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageUUID, 0);
}

- (id)cat_assertion
{
  return objc_getAssociatedObject(self, "cat_assertion");
}

- (void)setCat_assertion:(id)a3
{
  objc_setAssociatedObject(self, "cat_assertion", a3, (void *)0x301);
}

@end
