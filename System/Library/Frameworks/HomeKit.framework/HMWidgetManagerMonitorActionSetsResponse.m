@implementation HMWidgetManagerMonitorActionSetsResponse

- (HMWidgetManagerMonitorActionSetsResponse)initWithIsOnByActionSetsUniqueIdentifier:(id)a3 didExecutionFailByActionSetUniqueIdentifier:(id)a4
{
  id v7;
  id v8;
  HMWidgetManagerMonitorActionSetsResponse *v9;
  HMWidgetManagerMonitorActionSetsResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMWidgetManagerMonitorActionSetsResponse;
  v9 = -[HMWidgetManagerMonitorActionSetsResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_isOnByActionSetUniqueIdentifier, a3);
    objc_storeStrong((id *)&v10->_didExecutionFailByActionSetUniqueIdentifier, a4);
  }

  return v10;
}

- (NSDictionary)isOnByActionSetUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)didExecutionFailByActionSetUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didExecutionFailByActionSetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_isOnByActionSetUniqueIdentifier, 0);
}

@end
