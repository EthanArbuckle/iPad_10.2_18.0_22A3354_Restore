@implementation IDSServerMessagingIncomingContext

- (IDSServerMessagingIncomingContext)initWithFromServerStorage:(BOOL)a3 certifiedDeliveryContext:(id)a4 identifier:(id)a5
{
  return -[IDSServerMessagingIncomingContext initWithFromServerStorage:certifiedDeliveryContext:command:identifier:additionalTopLevelFields:](self, "initWithFromServerStorage:certifiedDeliveryContext:command:identifier:additionalTopLevelFields:", a3, a4, 0, a5, MEMORY[0x1E0C9AA70]);
}

- (IDSServerMessagingIncomingContext)initWithFromServerStorage:(BOOL)a3 certifiedDeliveryContext:(id)a4 command:(id)a5 identifier:(id)a6 additionalTopLevelFields:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IDSServerMessagingIncomingContext *v17;
  IDSServerMessagingIncomingContext *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IDSServerMessagingIncomingContext;
  v17 = -[IDSServerMessagingIncomingContext init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_fromServerStorage = a3;
    objc_storeStrong((id *)&v17->_certifiedDeliveryContext, a4);
    objc_storeStrong((id *)&v18->_identifier, a6);
    objc_storeStrong((id *)&v18->_command, a5);
    objc_storeStrong((id *)&v18->_additionalTopLevelFields, a7);
  }

  return v18;
}

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
  objc_msgSend(v4, "encodeBool:forKey:", -[IDSServerMessagingIncomingContext fromServerStorage](self, "fromServerStorage"), CFSTR("fromStorage"));
  -[IDSServerMessagingIncomingContext certifiedDeliveryContext](self, "certifiedDeliveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cdContext"));

  -[IDSServerMessagingIncomingContext identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[IDSServerMessagingIncomingContext command](self, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("command"));

  -[IDSServerMessagingIncomingContext additionalTopLevelFields](self, "additionalTopLevelFields");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("additionalTopLevel"));

}

- (IDSServerMessagingIncomingContext)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  IDSServerMessagingIncomingContext *v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("fromStorage"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cdContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("command"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("additionalTopLevel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[IDSServerMessagingIncomingContext initWithFromServerStorage:certifiedDeliveryContext:command:identifier:additionalTopLevelFields:](self, "initWithFromServerStorage:certifiedDeliveryContext:command:identifier:additionalTopLevelFields:", v4, v5, v7, v6, v14);
  return v15;
}

- (BOOL)fromServerStorage
{
  return self->_fromServerStorage;
}

- (void)setFromServerStorage:(BOOL)a3
{
  self->_fromServerStorage = a3;
}

- (IDSCertifiedDeliveryContext)certifiedDeliveryContext
{
  return self->_certifiedDeliveryContext;
}

- (void)setCertifiedDeliveryContext:(id)a3
{
  objc_storeStrong((id *)&self->_certifiedDeliveryContext, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (NSDictionary)additionalTopLevelFields
{
  return self->_additionalTopLevelFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTopLevelFields, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_certifiedDeliveryContext, 0);
}

@end
