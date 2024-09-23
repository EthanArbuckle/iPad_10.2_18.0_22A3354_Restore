@implementation BLSBacklightSceneUpdateBacklightRampAction

- (BLSBacklightSceneUpdateBacklightRampAction)initWithCompletion:(id)a3
{
  void *v4;
  BLSBacklightSceneUpdateBacklightRampAction *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueue:", MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "setTimeout:", dispatch_time(0, 2500000000));
  v7.receiver = self;
  v7.super_class = (Class)BLSBacklightSceneUpdateBacklightRampAction;
  v5 = -[BLSBacklightSceneUpdateBacklightRampAction initWithInfo:responder:](&v7, sel_initWithInfo_responder_, 0, v4);

  return v5;
}

@end
