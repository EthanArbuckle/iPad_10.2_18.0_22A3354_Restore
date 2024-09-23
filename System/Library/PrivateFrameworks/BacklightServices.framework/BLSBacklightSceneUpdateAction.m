@implementation BLSBacklightSceneUpdateAction

- (BLSBacklightSceneUpdateAction)initWithBacklightChangeEvent:(id)a3 animated:(BOOL)a4 touchTargetable:(BOOL)a5 isUpdateToDateSpecifier:(BOOL)a6 completion:(id)a7
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BLSBacklightSceneUpdateAction *v15;
  objc_super v17;

  v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E0D017D0];
  v11 = a7;
  v12 = objc_alloc_init(v10);
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "setObject:forSetting:", v9, 0);
  objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 1);
  objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 2);
  objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 3);
  objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setQueue:", MEMORY[0x1E0C80D38]);
  objc_msgSend(v14, "setTimeout:", dispatch_time(0, 1000000000));
  v17.receiver = self;
  v17.super_class = (Class)BLSBacklightSceneUpdateAction;
  v15 = -[BLSBacklightSceneUpdateAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v13, v14);

  return v15;
}

- (BLSBacklightChangeEvent)event
{
  void *v2;
  void *v3;

  -[BLSBacklightSceneUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BLSBacklightChangeEvent *)v3;
}

- (BOOL)isAnimated
{
  void *v2;
  char v3;

  -[BLSBacklightSceneUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 1);

  return v3;
}

- (BOOL)isTouchTargetable
{
  void *v2;
  char v3;

  -[BLSBacklightSceneUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2);

  return v3;
}

- (BOOL)isUpdateToDateSpecifier
{
  void *v2;
  char v3;

  -[BLSBacklightSceneUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3);

  return v3;
}

@end
