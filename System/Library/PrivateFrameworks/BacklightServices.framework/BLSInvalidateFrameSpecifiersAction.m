@implementation BLSInvalidateFrameSpecifiersAction

- (BLSInvalidateFrameSpecifiersAction)initWithReason:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  BLSInvalidateFrameSpecifiersAction *v7;
  objc_super v9;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v9.receiver = self;
  v9.super_class = (Class)BLSInvalidateFrameSpecifiersAction;
  v7 = -[BLSInvalidateFrameSpecifiersAction initWithInfo:responder:](&v9, sel_initWithInfo_responder_, v6, 0);

  return v7;
}

- (NSString)reason
{
  void *v2;
  void *v3;

  -[BLSInvalidateFrameSpecifiersAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
