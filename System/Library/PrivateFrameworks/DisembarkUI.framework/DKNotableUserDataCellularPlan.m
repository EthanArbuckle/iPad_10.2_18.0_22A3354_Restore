@implementation DKNotableUserDataCellularPlan

- (DKNotableUserDataCellularPlan)initWithCarrierName:(id)a3 phoneNumber:(id)a4 isTransferred:(BOOL)a5
{
  id v9;
  id v10;
  DKNotableUserDataCellularPlan *v11;
  DKNotableUserDataCellularPlan *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DKNotableUserDataCellularPlan;
  v11 = -[DKNotableUserDataCellularPlan init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_carrierName, a3);
    objc_storeStrong((id *)&v12->_phoneNumber, a4);
    v12->_isTransferred = a5;
  }

  return v12;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_storeStrong((id *)&self->_carrierName, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (BOOL)isTransferred
{
  return self->_isTransferred;
}

- (void)setIsTransferred:(BOOL)a3
{
  self->_isTransferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
}

@end
