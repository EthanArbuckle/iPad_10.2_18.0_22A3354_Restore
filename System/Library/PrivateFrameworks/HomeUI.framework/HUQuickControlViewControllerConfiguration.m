@implementation HUQuickControlViewControllerConfiguration

- (HUQuickControlViewControllerConfiguration)initWithHome:(id)a3
{
  id v5;
  HUQuickControlViewControllerConfiguration *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlViewControllerConfiguration;
  v6 = -[HUQuickControlViewControllerConfiguration init](&v8, sel_init);
  if (v6)
  {
    if (!v5)
      NSLog(CFSTR("home really should not be nil"));
    objc_storeStrong((id *)&v6->_home, a3);
    v6->_copyItems = 1;
  }

  return v6;
}

- (HUQuickControlViewControllerConfiguration)initWithMediaRoutingIdentifier:(id)a3
{
  HUQuickControlViewControllerConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlViewControllerConfiguration;
  v4 = -[HUQuickControlViewControllerConfiguration init](&v6, sel_init);
  if (v4)
  {
    if (!a3)
      NSLog(CFSTR("mediaRoutingIdentifier should not be nil"));
    v4->_copyItems = 1;
  }
  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (HUQuickControlItemUpdating)itemUpdater
{
  return self->_itemUpdater;
}

- (void)setItemUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_itemUpdater, a3);
}

- (BOOL)copyItems
{
  return self->_copyItems;
}

- (void)setCopyItems:(BOOL)a3
{
  self->_copyItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemUpdater, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
