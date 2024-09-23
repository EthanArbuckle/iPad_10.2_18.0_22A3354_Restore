@implementation CHUISWidgetRequestLaunchAction

- (CHUISWidgetRequestLaunchAction)initWithLaunchRequest:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CHUISWidgetRequestLaunchAction *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forSetting:", v6, 1);
  v9 = (void *)objc_msgSend(v8, "copy");
  v12.receiver = self;
  v12.super_class = (Class)CHUISWidgetRequestLaunchAction;
  v10 = -[CHUISWidgetRequestLaunchAction initWithInfo:responder:](&v12, sel_initWithInfo_responder_, v9, v7);

  return v10;
}

- (id)launchRequest
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[CHUISWidgetRequestLaunchAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

@end
