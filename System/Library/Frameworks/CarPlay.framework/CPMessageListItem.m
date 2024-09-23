@implementation CPMessageListItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMessageListItem)initWithConversationIdentifier:(NSString *)conversationIdentifier text:(NSString *)text leadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration trailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration detailText:(NSString *)detailText trailingText:(NSString *)trailingText
{
  CPMessageListItemTrailingConfiguration *v15;
  NSString *v16;
  NSString *v17;
  CPMessageListItem *v18;
  uint64_t v19;
  NSUUID *identifier;
  CPMessageListItemLeadingConfiguration *v22;
  NSString *v23;
  NSString *v24;
  objc_super v25;

  v24 = conversationIdentifier;
  v23 = text;
  v22 = leadingConfiguration;
  v15 = trailingConfiguration;
  v16 = detailText;
  v17 = trailingText;
  v25.receiver = self;
  v25.super_class = (Class)CPMessageListItem;
  v18 = -[CPMessageListItem init](&v25, sel_init);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v18->_identifier;
    v18->_identifier = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_text, text);
    objc_storeStrong((id *)&v18->_conversationIdentifier, conversationIdentifier);
    objc_storeStrong((id *)&v18->_leadingConfiguration, leadingConfiguration);
    objc_storeStrong((id *)&v18->_trailingConfiguration, trailingConfiguration);
    objc_storeStrong((id *)&v18->_detailText, detailText);
    objc_storeStrong((id *)&v18->_trailingText, trailingText);
    v18->_enabled = 1;
  }

  return v18;
}

- (CPMessageListItem)initWithFullName:(NSString *)fullName phoneOrEmailAddress:(NSString *)phoneOrEmailAddress leadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration trailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration detailText:(NSString *)detailText trailingText:(NSString *)trailingText
{
  CPMessageListItemTrailingConfiguration *v15;
  NSString *v16;
  NSString *v17;
  CPMessageListItem *v18;
  uint64_t v19;
  NSUUID *identifier;
  CPMessageListItemLeadingConfiguration *v22;
  NSString *v23;
  NSString *v24;
  objc_super v25;

  v24 = fullName;
  v23 = phoneOrEmailAddress;
  v22 = leadingConfiguration;
  v15 = trailingConfiguration;
  v16 = detailText;
  v17 = trailingText;
  v25.receiver = self;
  v25.super_class = (Class)CPMessageListItem;
  v18 = -[CPMessageListItem init](&v25, sel_init);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v18->_identifier;
    v18->_identifier = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_text, fullName);
    objc_storeStrong((id *)&v18->_phoneOrEmailAddress, phoneOrEmailAddress);
    objc_storeStrong((id *)&v18->_leadingConfiguration, leadingConfiguration);
    objc_storeStrong((id *)&v18->_trailingConfiguration, trailingConfiguration);
    objc_storeStrong((id *)&v18->_detailText, detailText);
    objc_storeStrong((id *)&v18->_trailingText, trailingText);
    v18->_enabled = 1;
  }

  return v18;
}

- (CPMessageListItem)initWithCoder:(id)a3
{
  id v4;
  CPMessageListItem *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSString *conversationIdentifier;
  uint64_t v12;
  NSString *phoneOrEmailAddress;
  uint64_t v14;
  CPMessageListItemLeadingConfiguration *leadingConfiguration;
  uint64_t v16;
  CPMessageListItemTrailingConfiguration *trailingConfiguration;
  uint64_t v18;
  NSString *detailText;
  uint64_t v20;
  NSString *trailingText;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPMessageListItem;
  v5 = -[CPMessageListItem init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemConversationIdentifierKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemPhoneOrEmailKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneOrEmailAddress = v5->_phoneOrEmailAddress;
    v5->_phoneOrEmailAddress = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemLeadingConfigurationKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    leadingConfiguration = v5->_leadingConfiguration;
    v5->_leadingConfiguration = (CPMessageListItemLeadingConfiguration *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemTrailingConfigurationKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    trailingConfiguration = v5->_trailingConfiguration;
    v5->_trailingConfiguration = (CPMessageListItemTrailingConfiguration *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemDetailTextKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemTrailingTextKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    trailingText = v5->_trailingText;
    v5->_trailingText = (NSString *)v20;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPMessageListItemEnabledKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CPMessageListItem text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("kCPMessageListItemTextKey"));

  -[CPMessageListItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("kCPMessageListItemIdentifierKey"));

  -[CPMessageListItem conversationIdentifier](self, "conversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("kCPMessageListItemConversationIdentifierKey"));

  -[CPMessageListItem phoneOrEmailAddress](self, "phoneOrEmailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("kCPMessageListItemPhoneOrEmailKey"));

  -[CPMessageListItem leadingConfiguration](self, "leadingConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("kCPMessageListItemLeadingConfigurationKey"));

  -[CPMessageListItem trailingConfiguration](self, "trailingConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("kCPMessageListItemTrailingConfigurationKey"));

  -[CPMessageListItem detailText](self, "detailText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("kCPMessageListItemDetailTextKey"));

  -[CPMessageListItem trailingText](self, "trailingText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("kCPMessageListItemTrailingTextKey"));

  objc_msgSend(v12, "encodeBool:forKey:", -[CPMessageListItem isEnabled](self, "isEnabled"), CFSTR("kCPMessageListItemEnabledKey"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)CPMessageListItem;
  -[CPMessageListItem description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMessageListItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMessageListItem conversationIdentifier](self, "conversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMessageListItem text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {identifier: %@, conversationIdentifier: %@, text: %@, detailText: %@, trailingText: %@, leadingConfiguration: %@, trailingConfiguration: %@}"), v4, v5, v6, v7, self->_detailText, self->_trailingText, self->_leadingConfiguration, self->_trailingConfiguration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CPMessageListItem text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CPMessageListItem conversationIdentifier](self, "conversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CPMessageListItem identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "conversationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPMessageListItem conversationIdentifier](self, "conversationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)_setNeedsUpdate
{
  id v3;

  -[CPMessageListItem listTemplate](self, "listTemplate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setItemNeedsUpdate:", self);

}

- (void)setConversationIdentifier:(NSString *)conversationIdentifier
{
  NSString *v5;

  v5 = conversationIdentifier;
  if (!-[NSString isEqualToString:](self->_conversationIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_conversationIdentifier, conversationIdentifier);
    -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)setLeadingConfiguration:(CPMessageListItemLeadingConfiguration *)leadingConfiguration
{
  objc_storeStrong((id *)&self->_leadingConfiguration, leadingConfiguration);
  -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)setTrailingConfiguration:(CPMessageListItemTrailingConfiguration *)trailingConfiguration
{
  objc_storeStrong((id *)&self->_trailingConfiguration, trailingConfiguration);
  -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)setTrailingText:(NSString *)trailingText
{
  NSString *v5;

  v5 = trailingText;
  if (!-[NSString isEqualToString:](self->_trailingText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_trailingText, trailingText);
    -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)setText:(NSString *)text
{
  NSString *v5;

  v5 = text;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, text);
    -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)setDetailText:(NSString *)detailText
{
  NSString *v5;

  v5 = detailText;
  if (!-[NSString isEqualToString:](self->_detailText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_detailText, detailText);
    -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)setPhoneOrEmailAddress:(NSString *)phoneOrEmailAddress
{
  NSString *v5;

  v5 = phoneOrEmailAddress;
  if (!-[NSString isEqualToString:](self->_phoneOrEmailAddress, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_phoneOrEmailAddress, phoneOrEmailAddress);
    -[CPMessageListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (NSString)text
{
  return self->_text;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)phoneOrEmailAddress
{
  return self->_phoneOrEmailAddress;
}

- (CPMessageListItemLeadingConfiguration)leadingConfiguration
{
  return self->_leadingConfiguration;
}

- (CPMessageListItemTrailingConfiguration)trailingConfiguration
{
  return self->_trailingConfiguration;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPListTemplate)listTemplate
{
  return (CPListTemplate *)objc_loadWeakRetained((id *)&self->_listTemplate);
}

- (void)setListTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_listTemplate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_trailingConfiguration, 0);
  objc_storeStrong((id *)&self->_leadingConfiguration, 0);
  objc_storeStrong((id *)&self->_phoneOrEmailAddress, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
