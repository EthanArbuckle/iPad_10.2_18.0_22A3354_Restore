@implementation HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent

- (HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent)initWitheMACAddress:(id)a3 connectionState:(int64_t)a4
{
  id v7;
  HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent *v8;
  HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent;
  v8 = -[HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eMACAddressAsString, a3);
    v9->_connectionState = a4;
  }

  return v9;
}

- (NSString)eMACAddressAsString
{
  return self->_eMACAddressAsString;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eMACAddressAsString, 0);
}

@end
