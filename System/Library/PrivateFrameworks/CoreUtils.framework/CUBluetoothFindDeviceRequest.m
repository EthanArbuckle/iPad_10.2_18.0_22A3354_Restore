@implementation CUBluetoothFindDeviceRequest

- ($D91DDCA3822F03E96939068EA8DE741A)address
{
  return ($D91DDCA3822F03E96939068EA8DE741A)(*(unsigned int *)self->_address.bytes | ((unint64_t)*(unsigned __int16 *)&self->_address.bytes[4] << 32));
}

- (void)setAddress:(id)a3
{
  self->_address = ($F37A0EEEFB629DA6F1DB93542131767D)a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
