@implementation MSPSenderVirtualMessageStrategy

- (MSPSenderVirtualMessageStrategy)initWithDelegate:(id)a3 capabilityType:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  MSPSenderVirtualMessageStrategy *v9;
  MSPSenderVirtualMessageStrategy *v10;
  objc_super v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalInstall");

  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)MSPSenderVirtualMessageStrategy;
    v9 = -[MSPSenderMessageStrategy initWithDelegate:capabilityType:](&v12, sel_initWithDelegate_capabilityType_, v6, a4);
    if (v9)
      v9->super.super._loggingOnly = 1;
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
