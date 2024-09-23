@implementation CalUMCalendarDataContainerProvider

+ (CalUMCalendarDataContainerProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CalUMCalendarDataContainerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (CalUMCalendarDataContainerProvider *)(id)sharedInstance_sharedInstance_0;
}

void __52__CalUMCalendarDataContainerProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (id)containerForAccountIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CalUMCalendarDataContainerProvider containerInfoForAccountIdentifier:](self, "containerInfoForAccountIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accountUsesDataSeparatedContainer:(id)a3
{
  void *v3;
  char v4;

  -[CalUMCalendarDataContainerProvider containerInfoForAccountIdentifier:](self, "containerInfoForAccountIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesDataSeparatedContainer");

  return v4;
}

- (id)containerInfoForAccountIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  CalUMCalendarDataContainerInfo *v7;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C8F2B8];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "accountWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = -[CalUMCalendarDataContainerInfo initWithAccount:]([CalUMCalendarDataContainerInfo alloc], "initWithAccount:", v6);

  return v7;
}

- (id)containerInfoForAccount:(id)a3
{
  id v3;
  CalUMCalendarDataContainerInfo *v4;

  v3 = a3;
  v4 = -[CalUMCalendarDataContainerInfo initWithAccount:]([CalUMCalendarDataContainerInfo alloc], "initWithAccount:", v3);

  return v4;
}

- (id)containerInfoForPersonaIdentifier:(id)a3
{
  id v3;
  CalUMCalendarDataContainerInfo *v4;

  v3 = a3;
  v4 = -[CalUMCalendarDataContainerInfo initWithPersonaID:]([CalUMCalendarDataContainerInfo alloc], "initWithPersonaID:", v3);

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

@end
