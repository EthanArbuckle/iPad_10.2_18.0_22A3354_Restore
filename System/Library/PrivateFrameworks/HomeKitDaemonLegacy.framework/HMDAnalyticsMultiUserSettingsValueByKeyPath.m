@implementation HMDAnalyticsMultiUserSettingsValueByKeyPath

- (int64_t)multiUserSettingsValueInteger
{
  return self->_multiUserSettingsValueInteger;
}

- (void)setMultiUserSettingsValueInteger:(int64_t)a3
{
  self->_multiUserSettingsValueInteger = a3;
}

- (NSData)multiUserSettingsValueData
{
  return self->_multiUserSettingsValueData;
}

- (void)setMultiUserSettingsValueData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)multiUserSettingsValueString
{
  return self->_multiUserSettingsValueString;
}

- (void)setMultiUserSettingsValueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserSettingsValueString, 0);
  objc_storeStrong((id *)&self->_multiUserSettingsValueData, 0);
}

@end
