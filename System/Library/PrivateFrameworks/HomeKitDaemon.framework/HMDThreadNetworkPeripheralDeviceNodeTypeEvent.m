@implementation HMDThreadNetworkPeripheralDeviceNodeTypeEvent

- (HMDThreadNetworkPeripheralDeviceNodeTypeEvent)initWithPeripheralDeviceNodeType:(int64_t)a3
{
  HMDThreadNetworkPeripheralDeviceNodeTypeEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDThreadNetworkPeripheralDeviceNodeTypeEvent;
  result = -[HMDThreadNetworkPeripheralDeviceNodeTypeEvent init](&v5, sel_init);
  if (result)
    result->_peripheralDeviceNodeType = a3;
  return result;
}

- (int64_t)peripheralDeviceNodeType
{
  return self->_peripheralDeviceNodeType;
}

@end
