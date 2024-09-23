@implementation HMAccessoryInvitation

- (HMAccessoryInvitation)initWithAccessory:(id)a3 identifier:(id)a4 state:(int64_t)a5
{
  id v8;
  id v9;
  HMAccessoryInvitation *v10;
  NSUUID *v11;
  NSUUID *identifier;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessoryInvitation;
  v10 = -[HMAccessoryInvitation init](&v14, sel_init);
  if (v10)
  {
    if (v9)
    {
      v11 = (NSUUID *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    identifier = v10->_identifier;
    v10->_identifier = v11;

    objc_storeWeak((id *)&v10->_accessory, v8);
    v10->_state = a5;
  }

  return v10;
}

- (HMAccessoryInvitation)initWithCoder:(id)a3
{
  id v4;
  HMAccessoryInvitation *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMAccessoryInvitation;
  v5 = -[HMAccessoryInvitation init](&v10, sel_init);
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

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HMAccessoryInvitation state](self, "state");
    v7 = objc_msgSend(v5, "state");
    v8 = v6 == v7;
    v9 = v6 != v7;
    if (!v8)
      self->_state = objc_msgSend(v5, "state");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
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
