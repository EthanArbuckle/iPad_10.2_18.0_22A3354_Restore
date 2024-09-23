@implementation CNRecentComposeRecipient

- (CNRecentComposeRecipient)initWithRecentContact:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  CNRecentComposeRecipient *v13;
  CNRecentComposeRecipient *v14;
  CNRecentComposeRecipient *v15;
  objc_super v17;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "descriptorsForRequiredKeysForContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactWithKeysToFetch:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteContactKeyForRecentsKind(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C967C0]) & 1) != 0)
  {
    v12 = 1;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    v12 = 0;
  }
  else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C96740]))
  {
    v12 = 2;
  }
  else
  {
    v12 = 5;
  }

  v17.receiver = self;
  v17.super_class = (Class)CNRecentComposeRecipient;
  v13 = -[CNComposeRecipient initWithContact:address:kind:](&v17, sel_initWithContact_address_kind_, v7, v8, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recent, a3);
    v15 = v14;
  }

  return v14;
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RECENT_PLACEHOLDER_NAME"), &stru_1E62C0368, CFSTR("Localized"));
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
    -[CNRecentComposeRecipient recentContact](self, "recentContact");
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
  -[CNComposeRecipient address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> \"%@\"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CNRecentComposeRecipient)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CNRecentComposeRecipient *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNRecentComposeRecipient initWithRecentContact:](self, "initWithRecentContact:", v5);
  return v6;
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
