@implementation _FTPasswordManagerCachedAuthTokenInfo

- (NSString)profileID
{
  return self->_profileID;
}

- (void)setProfileID:(id)a3
{
  objc_storeStrong((id *)&self->_profileID, a3);
}

- (NSString)selfID
{
  return self->_selfID;
}

- (void)setSelfID:(id)a3
{
  objc_storeStrong((id *)&self->_selfID, a3);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSDictionary)alertInfo
{
  return self->_alertInfo;
}

- (void)setAlertInfo:(id)a3
{
  objc_storeStrong((id *)&self->_alertInfo, a3);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_alertInfo, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_selfID, 0);
  objc_storeStrong((id *)&self->_profileID, 0);
}

@end
