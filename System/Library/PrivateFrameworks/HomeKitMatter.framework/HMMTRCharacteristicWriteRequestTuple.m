@implementation HMMTRCharacteristicWriteRequestTuple

- (HMMTRCharacteristicWriteRequestTuple)initWithRequestTuple:(id)a3
{
  id v5;
  HMMTRCharacteristicWriteRequestTuple *v6;
  HMMTRCharacteristicWriteRequestTuple *v7;
  HAPCharacteristicWriteRequestTuple *secondary;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRCharacteristicWriteRequestTuple;
  v6 = -[HMMTRCharacteristicWriteRequestTuple init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_characteristicHandlingType = 0;
    objc_storeStrong((id *)&v6->_primary, a3);
    secondary = v7->_secondary;
    v7->_secondary = 0;

  }
  return v7;
}

- (unint64_t)characteristicHandlingType
{
  return self->_characteristicHandlingType;
}

- (void)setCharacteristicHandlingType:(unint64_t)a3
{
  self->_characteristicHandlingType = a3;
}

- (HAPCharacteristicWriteRequestTuple)primary
{
  return self->_primary;
}

- (void)setPrimary:(id)a3
{
  objc_storeStrong((id *)&self->_primary, a3);
}

- (HAPCharacteristicWriteRequestTuple)secondary
{
  return self->_secondary;
}

- (void)setSecondary:(id)a3
{
  objc_storeStrong((id *)&self->_secondary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
}

@end
