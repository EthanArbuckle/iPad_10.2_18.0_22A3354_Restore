@implementation CRSUIClusterZoomAction

- (CRSUIClusterZoomAction)initWithZoomDirection:(int64_t)a3
{
  id v5;
  void *v6;
  CRSUIClusterZoomAction *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)CRSUIClusterZoomAction;
  v7 = -[CRSUIClusterZoomAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v9, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v5, 0, 0, 0.0);

  return v7;
}

- (int64_t)zoomDirection
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CRSUIClusterZoomAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

@end
