@implementation MRCompanionLinkClientEvent

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_storeStrong((id *)&self->_eventID, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_uid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end
