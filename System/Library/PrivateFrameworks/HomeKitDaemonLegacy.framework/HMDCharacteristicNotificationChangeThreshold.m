@implementation HMDCharacteristicNotificationChangeThreshold

- (HMDCharacteristicNotificationChangeThreshold)initWithCharacteristic:(id)a3 threshold:(id)a4
{
  id v7;
  id v8;
  HMDCharacteristicNotificationChangeThreshold *v9;
  HMDCharacteristicNotificationChangeThreshold *v10;
  uint64_t v11;
  NSNumber *threshold;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicNotificationChangeThreshold;
  v9 = -[HMDCharacteristicNotificationChangeThreshold init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristic, a3);
    v11 = objc_msgSend(v8, "copy");
    threshold = v10->_threshold;
    v10->_threshold = (NSNumber *)v11;

  }
  return v10;
}

- (HMDCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (NSNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end
