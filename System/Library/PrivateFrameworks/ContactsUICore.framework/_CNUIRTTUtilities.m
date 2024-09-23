@implementation _CNUIRTTUtilities

- (BOOL)contactIsTTYContact:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_CNUIRTTUtilities utilityProvider](self, "utilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contactIsTTYContact:", v4);

  return v6;
}

- (RTTTelephonyUtilities)utilityProvider
{
  cn_objectResultWithObjectLock();
  return (RTTTelephonyUtilities *)(id)objc_claimAutoreleasedReturnValue();
}

- (_CNUIRTTUtilities)init
{
  return -[_CNUIRTTUtilities initWithUtilityProvider:](self, "initWithUtilityProvider:", 0);
}

- (_CNUIRTTUtilities)initWithUtilityProvider:(id)a3
{
  id v5;
  _CNUIRTTUtilities *v6;
  _CNUIRTTUtilities *v7;
  _CNUIRTTUtilities *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUIRTTUtilities;
  v6 = -[_CNUIRTTUtilities init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_utilityProvider, a3);
    v8 = v7;
  }

  return v7;
}

- (id)nts_lazyUtilityProvider
{
  RTTTelephonyUtilities *utilityProvider;
  RTTTelephonyUtilities *v4;
  RTTTelephonyUtilities *v5;

  utilityProvider = self->_utilityProvider;
  if (!utilityProvider)
  {
    -[objc_class sharedUtilityProvider](getRTTTelephonyUtilitiesClass(), "sharedUtilityProvider");
    v4 = (RTTTelephonyUtilities *)objc_claimAutoreleasedReturnValue();
    v5 = self->_utilityProvider;
    self->_utilityProvider = v4;

    utilityProvider = self->_utilityProvider;
  }
  return utilityProvider;
}

- (BOOL)relayIsSupported
{
  void *v2;
  char v3;

  -[_CNUIRTTUtilities utilityProvider](self, "utilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "relayIsSupported");

  return v3;
}

- (void)setUtilityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_utilityProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityProvider, 0);
}

@end
