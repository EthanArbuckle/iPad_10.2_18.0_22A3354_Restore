@implementation ACHRemoteTemplateAvailabilityListener

- (ACHRemoteTemplateAvailabilityListener)init
{
  ACHRemoteTemplateAvailabilityListener *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACHRemoteTemplateAvailabilityListener;
  v2 = -[ACHRemoteTemplateAvailabilityListener init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__unprotectedNanoUserDefaultsDidSyncWithNotification_, *MEMORY[0x24BE40978], 0);

  }
  return v2;
}

- (void)_unprotectedNanoUserDefaultsDidSyncWithNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE408E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "hk_firstObjectPassingTest:", &__block_literal_global_14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      ACHLogTemplates();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Remote template availability on paired device definitions synced. Posting notification.", v7, 2u);
      }

      notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE01568], "UTF8String"));
    }

  }
}

uint64_t __93__ACHRemoteTemplateAvailabilityListener__unprotectedNanoUserDefaultsDidSyncWithNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasSuffix:", *MEMORY[0x24BE01250]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "hasSuffix:", *MEMORY[0x24BE01258]);

  return v3;
}

- (BOOL)_isKeyACHAvailabilityStateKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", *MEMORY[0x24BE01250]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasSuffix:", *MEMORY[0x24BE01258]);

  return v4;
}

@end
