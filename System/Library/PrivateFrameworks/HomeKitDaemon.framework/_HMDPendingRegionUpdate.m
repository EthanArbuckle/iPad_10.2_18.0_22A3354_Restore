@implementation _HMDPendingRegionUpdate

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[_HMDPendingRegionUpdate state](self, "state");
  HMDRegionStateString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("State"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t111 != -1)
    dispatch_once(&logCategory__hmf_once_t111, &__block_literal_global_393_224863);
  return (id)logCategory__hmf_once_v112;
}

@end
