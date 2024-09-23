@implementation _AFSharedUserInfoMutation

- (_AFSharedUserInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFSharedUserInfoMutation *v6;
  _AFSharedUserInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSharedUserInfoMutation;
  v6 = -[_AFSharedUserInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getSharedUserId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_sharedUserId;
  }
  else
  {
    -[AFSharedUserInfo sharedUserId](self->_base, "sharedUserId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSharedUserId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedUserId, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getLoggableSharedUserId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_loggableSharedUserId;
  }
  else
  {
    -[AFSharedUserInfo loggableSharedUserId](self->_base, "loggableSharedUserId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLoggableSharedUserId:(id)a3
{
  objc_storeStrong((id *)&self->_loggableSharedUserId, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getCompanionDeviceInfo
{
  AFCompanionDeviceInfo *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_companionDeviceInfo;
  }
  else
  {
    -[AFSharedUserInfo companionDeviceInfo](self->_base, "companionDeviceInfo");
    v2 = (AFCompanionDeviceInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setCompanionDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_companionDeviceInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (BOOL)getPersonalRequestsEnabled
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_personalRequestsEnabled;
  else
    return -[AFSharedUserInfo personalRequestsEnabled](self->_base, "personalRequestsEnabled");
}

- (void)setPersonalRequestsEnabled:(BOOL)a3
{
  self->_personalRequestsEnabled = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (BOOL)getCompanionLinkReady
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_companionLinkReady;
  else
    return -[AFSharedUserInfo companionLinkReady](self->_base, "companionLinkReady");
}

- (void)setCompanionLinkReady:(BOOL)a3
{
  self->_companionLinkReady = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (id)getHomeUserId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_homeUserId;
  }
  else
  {
    -[AFSharedUserInfo homeUserId](self->_base, "homeUserId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHomeUserId:(id)a3
{
  objc_storeStrong((id *)&self->_homeUserId, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (id)getICloudAltDSID
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x80000000) != 0)
  {
    v2 = self->_iCloudAltDSID;
  }
  else
  {
    -[AFSharedUserInfo iCloudAltDSID](self->_base, "iCloudAltDSID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setICloudAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudAltDSID, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x81u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_homeUserId, 0);
  objc_storeStrong((id *)&self->_companionDeviceInfo, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
