@implementation STCall

- (int64_t)service
{
  return self->_service;
}

- (void)setService:(int64_t)a3
{
  self->_service = a3;
}

- (id)initiatorAddress
{
  return self->_initiatorAddress;
}

- (void)setInitiatorAddress:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorAddress, a3);
}

- (id)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setRecipientAddress:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAddress, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t service;
  const __CFString *v6;
  STContactAddress *initiatorAddress;
  void *v8;
  STContactAddress *recipientAddress;
  void *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(": %p"), self);
  objc_msgSend(v3, "appendString:", CFSTR("; service="));
  service = self->_service;
  if (service > 3)
    v6 = CFSTR("FaceTime");
  else
    v6 = off_1E3A330B8[service];
  objc_msgSend(v3, "appendString:", v6);
  objc_msgSend(v3, "appendString:", CFSTR("; initiatorAddress="));
  initiatorAddress = self->_initiatorAddress;
  if (initiatorAddress)
  {
    -[STContactAddress description](initiatorAddress, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v8);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("nil"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("; recipientAddress="));
  recipientAddress = self->_recipientAddress;
  if (recipientAddress)
  {
    -[STContactAddress description](recipientAddress, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v10);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("nil"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)_aceContextObjectValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D88308]);
  -[STCall initiatorAddress](self, "initiatorAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 2)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D88070]);
    objc_msgSend(v4, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEmailAddress:", v6);

    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEmails:", v7);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D88318]);
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumber:", v8);

    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPhones:", v7);
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STCall;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_service, CFSTR("_service"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_initiatorAddress, CFSTR("_initiatorAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recipientAddress, CFSTR("_recipientAddress"));

}

- (STCall)initWithCoder:(id)a3
{
  id v4;
  STCall *v5;
  uint64_t v6;
  STContactAddress *initiatorAddress;
  uint64_t v8;
  STContactAddress *recipientAddress;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STCall;
  v5 = -[STSiriModelObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_service = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_service"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_initiatorAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    initiatorAddress = v5->_initiatorAddress;
    v5->_initiatorAddress = (STContactAddress *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recipientAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    recipientAddress = v5->_recipientAddress;
    v5->_recipientAddress = (STContactAddress *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_initiatorAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
