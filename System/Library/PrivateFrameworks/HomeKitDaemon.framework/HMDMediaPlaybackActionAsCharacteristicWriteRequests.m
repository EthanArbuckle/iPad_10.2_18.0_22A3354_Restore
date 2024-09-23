@implementation HMDMediaPlaybackActionAsCharacteristicWriteRequests

- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)initWithAction:(id)a3 characteristicWriteRequests:(id)a4
{
  id v7;
  id v8;
  HMDMediaPlaybackActionAsCharacteristicWriteRequests *v9;
  HMDMediaPlaybackActionAsCharacteristicWriteRequests *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaPlaybackActionAsCharacteristicWriteRequests;
  v9 = -[HMDMediaPlaybackActionAsCharacteristicWriteRequests init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_residualAction, a3);
    objc_storeStrong((id *)&v10->_characteristicWriteRequests, a4);
  }

  return v10;
}

- (HMDMediaPlaybackAction)residualAction
{
  return (HMDMediaPlaybackAction *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)characteristicWriteRequests
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicWriteRequests, 0);
  objc_storeStrong((id *)&self->_residualAction, 0);
}

@end
