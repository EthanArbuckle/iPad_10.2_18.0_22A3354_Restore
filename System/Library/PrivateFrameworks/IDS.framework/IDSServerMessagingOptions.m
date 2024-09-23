@implementation IDSServerMessagingOptions

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
  id v8;

  v4 = a3;
  -[IDSServerMessagingOptions timeout](self, "timeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timeout"));

  -[IDSServerMessagingOptions command](self, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("command"));

  -[IDSServerMessagingOptions cancelOnClientCrash](self, "cancelOnClientCrash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cancelOnCrash"));

  -[IDSServerMessagingOptions additionalTopLevelFields](self, "additionalTopLevelFields");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("options"));

}

- (IDSServerMessagingOptions)initWithCoder:(id)a3
{
  id v4;
  IDSServerMessagingOptions *v5;
  uint64_t v6;
  NSNumber *timeout;
  uint64_t v8;
  NSNumber *command;
  uint64_t v10;
  NSNumber *cancelOnClientCrash;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *additionalTopLevelFields;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IDSServerMessagingOptions;
  v5 = -[IDSServerMessagingOptions init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeout"));
    v6 = objc_claimAutoreleasedReturnValue();
    timeout = v5->_timeout;
    v5->_timeout = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("command"));
    v8 = objc_claimAutoreleasedReturnValue();
    command = v5->_command;
    v5->_command = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelOnCrash"));
    v10 = objc_claimAutoreleasedReturnValue();
    cancelOnClientCrash = v5->_cancelOnClientCrash;
    v5->_cancelOnClientCrash = (NSNumber *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("options"));
    v18 = objc_claimAutoreleasedReturnValue();
    additionalTopLevelFields = v5->_additionalTopLevelFields;
    v5->_additionalTopLevelFields = (NSDictionary *)v18;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IDSServerMessagingOptions timeout](self, "timeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSServerMessagingOptions command](self, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSServerMessagingOptions cancelOnClientCrash](self, "cancelOnClientCrash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSServerMessagingOptions additionalTopLevelFields](self, "additionalTopLevelFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p timeout: %@, command: %@, cancelOnClientCrash: %@, additionalTopLevelFields: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_timeout, a3);
}

- (NSNumber)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (NSNumber)cancelOnClientCrash
{
  return self->_cancelOnClientCrash;
}

- (void)setCancelOnClientCrash:(id)a3
{
  objc_storeStrong((id *)&self->_cancelOnClientCrash, a3);
}

- (NSDictionary)additionalTopLevelFields
{
  return self->_additionalTopLevelFields;
}

- (void)setAdditionalTopLevelFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTopLevelFields, 0);
  objc_storeStrong((id *)&self->_cancelOnClientCrash, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
}

@end
