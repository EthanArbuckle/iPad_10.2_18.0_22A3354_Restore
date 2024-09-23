@implementation CUHomeKitResolvableAccessory

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_storeStrong((id *)&self->_irkData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
