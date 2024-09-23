@implementation CNRecentComposeRecipientGroup

- (CNRecentComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4 recentContact:(id)a5
{
  id v9;
  CNRecentComposeRecipientGroup *v10;
  CNRecentComposeRecipientGroup *v11;
  CNRecentComposeRecipientGroup *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CNRecentComposeRecipientGroup;
  v10 = -[CNComposeRecipientGroup initWithChildren:displayString:](&v14, sel_initWithChildren_displayString_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_recentContact, a5);
    v12 = v11;
  }

  return v11;
}

- (id)label
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RECENT_GROUP"), &stru_1E62C0368, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)placeholderName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RECENT_GROUP_PLACEHOLDER"), &stru_1E62C0368, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CRRecentContact)recentContact
{
  return self->_recentContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentContact, 0);
}

@end
