@implementation HMDBulletinUserAttributionTuple

- (NSNumber)targetCharacteristicInstanceID
{
  return self->_targetCharacteristicInstanceID;
}

- (void)setTargetCharacteristicInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastKnownValueUpdateTime
{
  return self->_lastKnownValueUpdateTime;
}

- (void)setLastKnownValueUpdateTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)userUUID
{
  return self->_userUUID;
}

- (void)setUserUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_targetCharacteristicInstanceID, 0);
}

@end
