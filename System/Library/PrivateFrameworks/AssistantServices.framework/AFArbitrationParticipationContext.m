@implementation AFArbitrationParticipationContext

- (AFMyriadRecord)ownAdvertisement
{
  return self->_ownAdvertisement;
}

- (void)setOwnAdvertisement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)advertisements
{
  return self->_advertisements;
}

- (void)setAdvertisements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)decisionIsWon
{
  return self->_decisionIsWon;
}

- (void)setDecisionIsWon:(BOOL)a3
{
  self->_decisionIsWon = a3;
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setRequestStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)voiceTriggerDate
{
  return self->_voiceTriggerDate;
}

- (void)setVoiceTriggerDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CDASchemaCDAScoreBoosters)scoreBoosters
{
  return self->_scoreBoosters;
}

- (void)setScoreBoosters:(id)a3
{
  objc_storeStrong((id *)&self->_scoreBoosters, a3);
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(unsigned __int8)a3
{
  self->_deviceClass = a3;
}

- (NSNumber)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)lastActivationTime
{
  return self->_lastActivationTime;
}

- (void)setLastActivationTime:(double)a3
{
  self->_lastActivationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_scoreBoosters, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_advertisements, 0);
  objc_storeStrong((id *)&self->_ownAdvertisement, 0);
}

@end
