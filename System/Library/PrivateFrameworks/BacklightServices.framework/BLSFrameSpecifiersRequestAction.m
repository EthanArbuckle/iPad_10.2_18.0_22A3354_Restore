@implementation BLSFrameSpecifiersRequestAction

- (BLSFrameSpecifiersRequestAction)initWithDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BLSFrameSpecifiersRequestAction *v15;
  objc_super v17;

  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0D017D0];
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  objc_msgSend(v13, "setObject:forSetting:", v12, 1);

  if (v9)
    objc_msgSend(v13, "setObject:forSetting:", v9, 2);
  objc_msgSend(v13, "setFlag:forSetting:", BSSettingFlagForBool(), 3);
  objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setQueue:", MEMORY[0x1E0C80D38]);
  objc_msgSend(v14, "setTimeout:", dispatch_time(0, 10000000000));
  v17.receiver = self;
  v17.super_class = (Class)BLSFrameSpecifiersRequestAction;
  v15 = -[BLSFrameSpecifiersRequestAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v13, v14);

  return v15;
}

- (NSDateInterval)dateInterval
{
  void *v2;
  void *v3;

  -[BLSFrameSpecifiersRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateInterval *)v3;
}

- (NSDate)previousPresentationDate
{
  void *v2;
  void *v3;

  -[BLSFrameSpecifiersRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)shouldReset
{
  void *v2;
  char v3;

  -[BLSFrameSpecifiersRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3);

  return v3;
}

@end
