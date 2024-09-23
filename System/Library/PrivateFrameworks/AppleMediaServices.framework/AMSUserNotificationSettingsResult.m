@implementation AMSUserNotificationSettingsResult

- (AMSUserNotificationSettingsResult)initWithServiceIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v7;
  id v8;
  AMSUserNotificationSettingsResult *v9;
  AMSUserNotificationSettingsResult *v10;
  uint64_t v11;
  NSDictionary *itemsMap;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUserNotificationSettingsResult;
  v9 = -[AMSUserNotificationSettingsResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    objc_msgSend((id)objc_opt_class(), "_itemsMapForServiceIdentifier:dictionaryRepresentation:", v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    itemsMap = v10->_itemsMap;
    v10->_itemsMap = (NSDictionary *)v11;

  }
  return v10;
}

+ (id)_itemsMapForServiceIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("results.notification-preferences.payload.%@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "ams_mapWithTransform:", &__block_literal_global_139);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

AMSPair *__92__AMSUserNotificationSettingsResult__itemsMapForServiceIdentifier_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  AMSUserNotificationSettingsItem *v10;
  AMSPair *v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = -[AMSUserNotificationSettingsItem initWithIdentifier:dictionaryRepresentation:]([AMSUserNotificationSettingsItem alloc], "initWithIdentifier:dictionaryRepresentation:", v7, v9);
  v11 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v7, v10);

  return v11;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSDictionary)itemsMap
{
  return self->_itemsMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsMap, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
