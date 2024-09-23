@implementation CHSMutableRemoteDevice

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->super._name;
  self->super._name = v4;

}

- (void)setRelationshipID:(id)a3
{
  NSUUID *v4;
  NSUUID *relationshipID;
  id v6;

  v6 = a3;
  v4 = (NSUUID *)objc_msgSend(v6, "copy");
  relationshipID = self->super._relationshipID;
  self->super._relationshipID = v4;

}

- (void)setDeviceID:(id)a3
{
  NSString *v4;
  NSString *deviceID;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  deviceID = self->super._deviceID;
  self->super._deviceID = v4;

}

- (void)setCurrentSupportedVersion:(int64_t)a3
{
  self->super._currentSupportedVersion = a3;
}

- (void)setMinSupportedVersion:(int64_t)a3
{
  self->super._minSupportedVersion = a3;
}

- (void)setIsPossibleSource:(BOOL)a3
{
  self->super._isPossibleSource = a3;
}

- (void)setPairingState:(int64_t)a3
{
  self->super._pairingState = a3;
}

- (void)setLastConnectionDate:(id)a3
{
  NSDate *v4;
  NSDate *lastConnectionDate;
  id v6;

  v6 = a3;
  v4 = (NSDate *)objc_msgSend(v6, "copy");
  lastConnectionDate = self->super._lastConnectionDate;
  self->super._lastConnectionDate = v4;

}

@end
