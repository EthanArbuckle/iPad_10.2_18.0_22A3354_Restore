@implementation HMDBulletinCharacteristicTuple

- (HMDBulletinCharacteristicTuple)initWithServiceContextID:(id)a3 currentType:(id)a4 targetValue:(id)a5 targetStateNumber:(id)a6 changedByThisDevice:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDBulletinCharacteristicTuple *v17;
  HMDBulletinCharacteristicTuple *v18;
  uint64_t v19;
  NSDate *lastPostingTime;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDBulletinCharacteristicTuple;
  v17 = -[HMDBulletinCharacteristicTuple init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_serviceContextID, a3);
    objc_storeStrong((id *)&v18->_currentType, a4);
    objc_storeStrong(&v18->_targetValue, a5);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v19 = objc_claimAutoreleasedReturnValue();
    lastPostingTime = v18->_lastPostingTime;
    v18->_lastPostingTime = (NSDate *)v19;

    objc_storeStrong((id *)&v18->_targetStateNumber, a6);
    v18->_changedByThisDevice = a7;
  }

  return v18;
}

- (void)updatePostingTime
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinCharacteristicTuple setLastPostingTime:](self, "setLastPostingTime:", v3);

}

- (NSString)serviceContextID
{
  return self->_serviceContextID;
}

- (NSString)currentType
{
  return self->_currentType;
}

- (id)targetValue
{
  return self->_targetValue;
}

- (NSDate)lastPostingTime
{
  return self->_lastPostingTime;
}

- (void)setLastPostingTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastPostingTime, a3);
}

- (NSNumber)targetStateNumber
{
  return self->_targetStateNumber;
}

- (BOOL)changedByThisDevice
{
  return self->_changedByThisDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetStateNumber, 0);
  objc_storeStrong((id *)&self->_lastPostingTime, 0);
  objc_storeStrong(&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_currentType, 0);
  objc_storeStrong((id *)&self->_serviceContextID, 0);
}

+ (id)tupleWithServiceContextID:(id)a3 currentType:(id)a4 targetValue:(id)a5 targetStateNumber:(id)a6 changedByThisDevice:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  HMDBulletinCharacteristicTuple *v15;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[HMDBulletinCharacteristicTuple initWithServiceContextID:currentType:targetValue:targetStateNumber:changedByThisDevice:]([HMDBulletinCharacteristicTuple alloc], "initWithServiceContextID:currentType:targetValue:targetStateNumber:changedByThisDevice:", v14, v13, v12, v11, v7);

  return v15;
}

@end
