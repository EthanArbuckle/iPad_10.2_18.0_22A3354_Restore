@implementation WFAppleMusicAccessResource

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.Music");
}

- (WFAppleMusicAccessResource)initWithDefinition:(id)a3
{
  WFAppleMusicAccessResource *v3;
  void *v4;
  WFAppleMusicAccessResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFAppleMusicAccessResource;
  v3 = -[WFAccessResource initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_refreshAvailabilityWithNotification, CFSTR("WFAppleMusicResourceAvailabilityChangedNotification"), 0);

    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFAppleMusicResourceAvailabilityChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)WFAppleMusicAccessResource;
  -[WFAccessResource dealloc](&v4, sel_dealloc);
}

- (unint64_t)status
{
  return 4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getMPMediaLibraryClass_softClass_25377;
  v18 = getMPMediaLibraryClass_softClass_25377;
  v9 = MEMORY[0x24BDAC760];
  if (!getMPMediaLibraryClass_softClass_25377)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getMPMediaLibraryClass_block_invoke_25378;
    v14[3] = &unk_24F8BB430;
    v14[4] = &v15;
    __getMPMediaLibraryClass_block_invoke_25378((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __79__WFAppleMusicAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v12[3] = &unk_24F8B7788;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "requestAuthorization:", v12);

}

uint64_t __79__WFAppleMusicAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("WFAppleMusicResourceAvailabilityChangedNotification"), *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 == 3, 0);
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end
