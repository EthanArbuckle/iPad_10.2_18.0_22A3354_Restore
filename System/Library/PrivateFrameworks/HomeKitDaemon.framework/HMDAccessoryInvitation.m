@implementation HMDAccessoryInvitation

- (HMDAccessoryInvitation)initWithAccessory:(id)a3 identifier:(id)a4 state:(int64_t)a5
{
  id v8;
  id v9;
  HMDAccessoryInvitation *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryInvitation;
  v10 = -[HMDAccessoryInvitation init](&v13, sel_init);
  if (v10)
  {
    v11 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_identifier, v11);
    if (!v9)

    objc_storeWeak((id *)&v10->_accessory, v8);
    v10->_state = a5;
  }

  return v10;
}

- (HMDAccessoryInvitation)initWithCoder:(id)a3
{
  id v4;
  HMDAccessoryInvitation *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryInvitation;
  v5 = -[HMDAccessoryInvitation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accessoryInvitationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_accessory, v8);

    v5->_state = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("HM.accessoryInvitationState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDAccessoryInvitation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HM.accessoryInvitationIdentifier"));

  -[HMDAccessoryInvitation accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeConditionalObject:forKey:", v5, CFSTR("accessory"));

  objc_msgSend(v6, "encodeInt32:forKey:", -[HMDAccessoryInvitation state](self, "state"), CFSTR("HM.accessoryInvitationState"));
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
