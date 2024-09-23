@implementation _AFPeerInfoMutation

- (_AFPeerInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFPeerInfoMutation *v6;
  _AFPeerInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFPeerInfoMutation;
  v6 = -[_AFPeerInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (BOOL)getIsDeviceOwnedByCurrentUser
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_isDeviceOwnedByCurrentUser;
  else
    return -[AFPeerInfo isDeviceOwnedByCurrentUser](self->_base, "isDeviceOwnedByCurrentUser");
}

- (void)setIsDeviceOwnedByCurrentUser:(BOOL)a3
{
  self->_isDeviceOwnedByCurrentUser = a3;
  *(_DWORD *)&self->_mutationFlags |= 3u;
}

- (id)getAssistantIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_assistantIdentifier;
  }
  else
  {
    -[AFPeerInfo assistantIdentifier](self->_base, "assistantIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assistantIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 5u;
}

- (id)getSharedUserIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_sharedUserIdentifier;
  }
  else
  {
    -[AFPeerInfo sharedUserIdentifier](self->_base, "sharedUserIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSharedUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharedUserIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 9u;
}

- (id)getIdsIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_idsIdentifier;
  }
  else
  {
    -[AFPeerInfo idsIdentifier](self->_base, "idsIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getIdsDeviceUniqueIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_idsDeviceUniqueIdentifier;
  }
  else
  {
    -[AFPeerInfo idsDeviceUniqueIdentifier](self->_base, "idsDeviceUniqueIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIdsDeviceUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsDeviceUniqueIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getRapportEffectiveIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_rapportEffectiveIdentifier;
  }
  else
  {
    -[AFPeerInfo rapportEffectiveIdentifier](self->_base, "rapportEffectiveIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRapportEffectiveIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getHomeKitAccessoryIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_homeKitAccessoryIdentifier;
  }
  else
  {
    -[AFPeerInfo homeKitAccessoryIdentifier](self->_base, "homeKitAccessoryIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getMediaSystemIdentifier
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 1) != 0)
  {
    v2 = self->_mediaSystemIdentifier;
  }
  else
  {
    -[AFPeerInfo mediaSystemIdentifier](self->_base, "mediaSystemIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMediaSystemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getMediaRouteIdentifier
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 2) != 0)
  {
    v2 = self->_mediaRouteIdentifier;
  }
  else
  {
    -[AFPeerInfo mediaRouteIdentifier](self->_base, "mediaRouteIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getIsCommunalDevice
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 4) != 0)
    return self->_isCommunalDevice;
  else
    return -[AFPeerInfo isCommunalDevice](self->_base, "isCommunalDevice");
}

- (void)setIsCommunalDevice:(BOOL)a3
{
  self->_isCommunalDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getRoomName
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 8) != 0)
  {
    v2 = self->_roomName;
  }
  else
  {
    -[AFPeerInfo roomName](self->_base, "roomName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getName
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x10) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    -[AFPeerInfo name](self->_base, "name");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x1001u;
}

- (id)getProductType
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x20) != 0)
  {
    v2 = self->_productType;
  }
  else
  {
    -[AFPeerInfo productType](self->_base, "productType");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x2001u;
}

- (id)getBuildVersion
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x40) != 0)
  {
    v2 = self->_buildVersion;
  }
  else
  {
    -[AFPeerInfo buildVersion](self->_base, "buildVersion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x4001u;
}

- (id)getUserInterfaceIdiom
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x80) != 0)
  {
    v2 = self->_userInterfaceIdiom;
  }
  else
  {
    -[AFPeerInfo userInterfaceIdiom](self->_base, "userInterfaceIdiom");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserInterfaceIdiom:(id)a3
{
  objc_storeStrong((id *)&self->_userInterfaceIdiom, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x8001u;
}

- (id)getAceVersion
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 2) & 1) != 0)
  {
    v2 = self->_aceVersion;
  }
  else
  {
    -[AFPeerInfo aceVersion](self->_base, "aceVersion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAceVersion:(id)a3
{
  objc_storeStrong((id *)&self->_aceVersion, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x10001u;
}

- (BOOL)getIsLocationSharingDevice
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 2) != 0)
    return self->_isLocationSharingDevice;
  else
    return -[AFPeerInfo isLocationSharingDevice](self->_base, "isLocationSharingDevice");
}

- (void)setIsLocationSharingDevice:(BOOL)a3
{
  self->_isLocationSharingDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x20001u;
}

- (BOOL)getIsSiriCloudSyncEnabled
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 4) != 0)
    return self->_isSiriCloudSyncEnabled;
  else
    return -[AFPeerInfo isSiriCloudSyncEnabled](self->_base, "isSiriCloudSyncEnabled");
}

- (void)setIsSiriCloudSyncEnabled:(BOOL)a3
{
  self->_isSiriCloudSyncEnabled = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x40001u;
}

- (id)getMyriadTrialTreatment
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 2) & 8) != 0)
  {
    v2 = self->_myriadTrialTreatment;
  }
  else
  {
    -[AFPeerInfo myriadTrialTreatment](self->_base, "myriadTrialTreatment");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMyriadTrialTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_myriadTrialTreatment, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x80001u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadTrialTreatment, 0);
  objc_storeStrong((id *)&self->_aceVersion, 0);
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDeviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
