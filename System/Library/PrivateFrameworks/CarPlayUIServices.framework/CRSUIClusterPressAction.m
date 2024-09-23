@implementation CRSUIClusterPressAction

- (CRSUIClusterPressAction)initWithPressType:(unint64_t)a3
{
  id v5;
  void *v6;
  CRSUIClusterPressAction *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)CRSUIClusterPressAction;
  v7 = -[CRSUIClusterPressAction initWithInfo:responder:](&v9, sel_initWithInfo_responder_, v5, 0);

  return v7;
}

- (unint64_t)actionType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CRSUIClusterPressAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

@end
