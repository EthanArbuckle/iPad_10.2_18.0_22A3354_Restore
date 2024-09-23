@implementation _MFCoreTelephonySubscriptionChangeListener

- (_MFCoreTelephonySubscriptionChangeListener)init
{
  _MFCoreTelephonySubscriptionChangeListener *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *telephonyQueue;
  uint64_t v6;
  CoreTelephonyClient *client;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MFCoreTelephonySubscriptionChangeListener;
  v2 = -[_MFCoreTelephonySubscriptionChangeListener init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.email.telephony", v3);
    telephonyQueue = v2->_telephonyQueue;
    v2->_telephonyQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_telephonyQueue);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v6;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
  }
  return v2;
}

- (void)carrierBundleChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1ABB13000, v4, OS_LOG_TYPE_INFO, "SoftBank: Carrier bundle change.", v6, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_telephonyQueue);
  sInnerCanUseCodePoints = 0;
  v5 = (void *)sSoftBankTransform;
  sSoftBankTransform = 0;

  atomic_store(0, (unsigned __int8 *)&sCanUseCodePoints);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
}

@end
