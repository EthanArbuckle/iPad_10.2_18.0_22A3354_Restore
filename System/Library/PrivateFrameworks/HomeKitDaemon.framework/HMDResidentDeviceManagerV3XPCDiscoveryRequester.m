@implementation HMDResidentDeviceManagerV3XPCDiscoveryRequester

- (void)residentDeviceManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 error:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[HMDResidentDeviceManagerV3XPCDiscoveryRequester block](self, "block");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v10, v7);

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
