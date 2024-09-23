@implementation MFRecentComposeRecipient

- (MFRecentComposeRecipient)initWithRecentContact:(id)a3
{
  id v5;
  const void *v6;
  uint64_t RecordID;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MFRecentComposeRecipient *v11;
  MFRecentComposeRecipient *v12;
  MFRecentComposeRecipient *v13;
  objc_super v15;

  v5 = a3;
  v6 = (const void *)objc_msgSend(v5, "person");
  RecordID = ABRecordGetRecordID(v6);
  v8 = objc_msgSend(v5, "property");
  v9 = objc_msgSend(v5, "matchedIdentifier");
  objc_msgSend(v5, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)MFRecentComposeRecipient;
  v11 = -[MFComposeRecipient initWithRecord:recordID:property:identifier:address:](&v15, sel_initWithRecord_recordID_property_identifier_address_, v6, RecordID, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recent, a3);
    v13 = v12;
  }

  return v12;
}

- (BOOL)isRemovableFromSearchResults
{
  return self->super._recordID == -1;
}

- (id)recentContact
{
  return self->_recent;
}

- (id)preferredSendingAddress
{
  return (id)-[CRRecentContact lastSendingAddress](self->_recent, "lastSendingAddress");
}

- (id)placeholderName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RECENT_PLACEHOLDER_NAME"), &stru_1E5A6A588, CFSTR("Main"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "recentContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRecentComposeRecipient recentContact](self, "recentContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipient address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> \"%@\"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MFRecentComposeRecipient)initWithCoder:(id)a3
{
  void *v4;
  MFRecentComposeRecipient *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("recent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFRecentComposeRecipient initWithRecentContact:](self, "initWithRecentContact:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_recent, CFSTR("recent"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recent, 0);
}

@end
