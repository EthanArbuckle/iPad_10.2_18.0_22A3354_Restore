@implementation BLTPBActionFactoryVersion1

- (id)actionWithBBAction:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "behavior"))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BLTPBActionFactoryVersion1;
    -[BLTPBActionFactory actionWithBBAction:](&v7, sel_actionWithBBAction_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
