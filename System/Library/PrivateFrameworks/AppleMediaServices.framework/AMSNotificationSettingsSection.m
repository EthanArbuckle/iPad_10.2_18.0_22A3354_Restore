@implementation AMSNotificationSettingsSection

- (AMSNotificationSettingsSection)initWithTitle:(id)a3 footer:(id)a4 items:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSNotificationSettingsSection *v12;
  AMSNotificationSettingsSection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSNotificationSettingsSection;
  v12 = -[AMSNotificationSettingsSection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_footer, a4);
    objc_storeStrong((id *)&v13->_items, a5);
  }

  return v13;
}

- (AMSNotificationSettingsSection)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AMSNotificationSettingsSection *v5;
  void *v6;
  NSString *v7;
  NSString *footer;
  void *v9;
  NSString *v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSArray *items;
  void *v15;
  NSString *v16;
  NSString *title;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSNotificationSettingsSection;
  v5 = -[AMSNotificationSettingsSection init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disclaimer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    footer = v5->_footer;
    v5->_footer = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    identifier = v5->_identifier;
    v5->_identifier = v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("settings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_101);
    v13 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    title = v5->_title;
    v5->_title = v16;

  }
  return v5;
}

AMSNotificationSettingsItem *__67__AMSNotificationSettingsSection_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSNotificationSettingsItem *v3;

  v2 = a2;
  v3 = -[AMSNotificationSettingsItem initWithDictionaryRepresentation:]([AMSNotificationSettingsItem alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("sectionId");
  -[AMSNotificationSettingsSection identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("title");
  -[AMSNotificationSettingsSection title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("footer");
  -[AMSNotificationSettingsSection footer](self, "footer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("items");
  -[AMSNotificationSettingsSection items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)footer
{
  return self->_footer;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_footer, 0);
}

@end
