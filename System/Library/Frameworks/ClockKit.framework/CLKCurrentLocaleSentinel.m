@implementation CLKCurrentLocaleSentinel

+ (CLKCurrentLocaleSentinel)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CLKCurrentLocaleSentinel_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (CLKCurrentLocaleSentinel *)(id)sharedCurrentLocaleSentinel;
}

void __34__CLKCurrentLocaleSentinel_shared__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedCurrentLocaleSentinel;
  sharedCurrentLocaleSentinel = v1;

}

- (id)_init
{
  CLKCurrentLocaleSentinel *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKCurrentLocaleSentinel;
  v2 = -[CLKCurrentLocaleSentinel init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleLocaleChange, *MEMORY[0x24BDBCA70], 0);

  }
  return v2;
}

- (void)_handleLocaleChange
{
  id v2;

  _CLKUpdateIsLayoutRTL();
  _CLKUpdateLanguageIsTallScript();
  _CLKUpdateNumberSystem();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("CLKLocaleNumberSystemChangedNotification"), 0);

}

@end
