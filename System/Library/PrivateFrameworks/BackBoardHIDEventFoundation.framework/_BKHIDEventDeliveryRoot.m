@implementation _BKHIDEventDeliveryRoot

- (id)description
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionPaths, 0);
  objc_storeStrong((id *)&self->_deliveryChainByIdentity, 0);
  objc_storeStrong((id *)&self->_bufferingDispatchRules, 0);
  objc_storeStrong((id *)&self->_dispatchingRules, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
