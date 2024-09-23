@implementation AMSNotificationSettingsResult

- (AMSNotificationSettingsResult)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AMSNotificationSettingsResult *v5;
  uint64_t v6;
  NSArray *sections;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSNotificationSettingsResult;
  v5 = -[AMSNotificationSettingsResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_sectionsFromDictionaryRepresentation:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;

  }
  return v5;
}

+ (id)_sectionsFromDictionaryRepresentation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v6, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

AMSNotificationSettingsSection *__71__AMSNotificationSettingsResult__sectionsFromDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSNotificationSettingsSection *v3;

  v2 = a2;
  v3 = -[AMSNotificationSettingsSection initWithDictionaryRepresentation:]([AMSNotificationSettingsSection alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
