@implementation PHForwardingSettings

- (unsigned)callForwardingState
{
  return self->_callForwardingState;
}

- (void)setCallForwardingState:(unsigned int)a3
{
  self->_callForwardingState = a3;
}

- (NSString)callForwardingNumber
{
  return self->_callForwardingNumber;
}

- (void)setCallForwardingNumber:(id)a3
{
  objc_storeStrong((id *)&self->_callForwardingNumber, a3);
}

- (NSString)defaultCallForwardingNumber
{
  return self->_defaultCallForwardingNumber;
}

- (void)setDefaultCallForwardingNumber:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCallForwardingNumber, a3);
}

- (NSString)defaultCallForwardingNumberPreferencesKey
{
  return self->_defaultCallForwardingNumberPreferencesKey;
}

- (void)setDefaultCallForwardingNumberPreferencesKey:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCallForwardingNumberPreferencesKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCallForwardingNumberPreferencesKey, 0);
  objc_storeStrong((id *)&self->_defaultCallForwardingNumber, 0);
  objc_storeStrong((id *)&self->_callForwardingNumber, 0);
}

@end
