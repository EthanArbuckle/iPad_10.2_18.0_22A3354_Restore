@implementation HSPCDetectedPairedAccessoryViewController

- (HSPCDetectedPairedAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  HSPCDetectedPairedAccessoryViewController *v12;
  HSPCDetectedPairedAccessoryViewController *v13;
  uint64_t v14;
  void *v15;
  id v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "category"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "categoryType"));

  v11 = objc_msgSend(objc_alloc((Class)HUHomeAccessoryTileView), "initWithFrame:categoryType:", v10, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v18.receiver = self;
  v18.super_class = (Class)HSPCDetectedPairedAccessoryViewController;
  v12 = -[HSPCDetectedViewController initWithCenterContentView:](&v18, "initWithCenterContentView:", v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardDetectedPairedAccessoryCardTitle"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[HSPCDetectedPairedAccessoryViewController setTitle:](v13, "setTitle:", v15);

    v16 = -[HSPCDetectedPairedAccessoryViewController addProminentDismissButtonWithTitleKey:](v13, "addProminentDismissButtonWithTitleKey:", CFSTR("HUOkTitle"));
  }

  return v13;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8398);
}

- (id)config
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (id)coordinator
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
