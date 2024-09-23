@implementation HMDCharacteristicValueUpdate

- (HMDCharacteristicValueUpdate)initWithValue:(id)a3 updateIdentifier:(id)a4 remoteDevice:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCharacteristicValueUpdate *v12;
  HMDCharacteristicValueUpdate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCharacteristicValueUpdate;
  v12 = -[HMDCharacteristicValueUpdate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_value, a3);
    objc_storeStrong((id *)&v13->_updateIdentifier, a4);
    objc_storeStrong((id *)&v13->_remoteDevice, a5);
  }

  return v13;
}

- (HMDCharacteristicValueUpdate)initWithError:(id)a3
{
  id v5;
  HMDCharacteristicValueUpdate *v6;
  HMDCharacteristicValueUpdate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicValueUpdate;
  v6 = -[HMDCharacteristicValueUpdate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (void)setValueUpdatedTime:(id)a3 stateNumber:(id)a4
{
  id v6;
  NSDate *v7;
  NSDate *valueUpdatedTime;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (NSDate *)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v7;

  if (v6)
    objc_storeStrong((id *)&self->_valueUpdatedStateNumber, a4);

}

- (id)value
{
  return self->_value;
}

- (NSString)updateIdentifier
{
  return self->_updateIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (HMDDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (NSNumber)valueUpdatedStateNumber
{
  return self->_valueUpdatedStateNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUpdatedStateNumber, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
