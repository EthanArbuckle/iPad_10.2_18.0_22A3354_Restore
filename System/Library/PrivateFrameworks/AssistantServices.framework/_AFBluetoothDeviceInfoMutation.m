@implementation _AFBluetoothDeviceInfoMutation

- (_AFBluetoothDeviceInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFBluetoothDeviceInfoMutation *v6;
  _AFBluetoothDeviceInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothDeviceInfoMutation;
  v6 = -[_AFBluetoothDeviceInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (id)getAddress
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_address;
  }
  else
  {
    -[AFBluetoothDeviceInfo address](self->_base, "address");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
  *(_DWORD *)&self->_mutationFlags |= 3u;
}

- (id)getName
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    -[AFBluetoothDeviceInfo name](self->_base, "name");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  *(_DWORD *)&self->_mutationFlags |= 5u;
}

- (id)getDeviceUID
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_deviceUID;
  }
  else
  {
    -[AFBluetoothDeviceInfo deviceUID](self->_base, "deviceUID");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUID, a3);
  *(_DWORD *)&self->_mutationFlags |= 9u;
}

- (unsigned)getVendorID
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_vendorID;
  else
    return -[AFBluetoothDeviceInfo vendorID](self->_base, "vendorID");
}

- (void)setVendorID:(unsigned int)a3
{
  self->_vendorID = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x11u;
}

- (unsigned)getProductID
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_productID;
  else
    return -[AFBluetoothDeviceInfo productID](self->_base, "productID");
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getIsAdvancedAppleAudioDevice
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
    return self->_isAdvancedAppleAudioDevice;
  else
    return -[AFBluetoothDeviceInfo isAdvancedAppleAudioDevice](self->_base, "isAdvancedAppleAudioDevice");
}

- (void)setIsAdvancedAppleAudioDevice:(BOOL)a3
{
  self->_isAdvancedAppleAudioDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getSupportsInEarDetection
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x80) != 0)
    return self->_supportsInEarDetection;
  else
    return -[AFBluetoothDeviceInfo supportsInEarDetection](self->_base, "supportsInEarDetection");
}

- (void)setSupportsInEarDetection:(BOOL)a3
{
  self->_supportsInEarDetection = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getSupportsVoiceTrigger
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 1) != 0)
    return self->_supportsVoiceTrigger;
  else
    return -[AFBluetoothDeviceInfo supportsVoiceTrigger](self->_base, "supportsVoiceTrigger");
}

- (void)setSupportsVoiceTrigger:(BOOL)a3
{
  self->_supportsVoiceTrigger = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getSupportsJustSiri
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 2) != 0)
    return self->_supportsJustSiri;
  else
    return -[AFBluetoothDeviceInfo supportsJustSiri](self->_base, "supportsJustSiri");
}

- (void)setSupportsJustSiri:(BOOL)a3
{
  self->_supportsJustSiri = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getSupportsSpokenNotification
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 4) != 0)
    return self->_supportsSpokenNotification;
  else
    return -[AFBluetoothDeviceInfo supportsSpokenNotification](self->_base, "supportsSpokenNotification");
}

- (void)setSupportsSpokenNotification:(BOOL)a3
{
  self->_supportsSpokenNotification = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getSupportsListeningModeANC
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 8) != 0)
    return self->_supportsListeningModeANC;
  else
    return -[AFBluetoothDeviceInfo supportsListeningModeANC](self->_base, "supportsListeningModeANC");
}

- (void)setSupportsListeningModeANC:(BOOL)a3
{
  self->_supportsListeningModeANC = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x801u;
}

- (BOOL)getSupportsListeningModeTransparency
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x10) != 0)
    return self->_supportsListeningModeTransparency;
  else
    return -[AFBluetoothDeviceInfo supportsListeningModeTransparency](self->_base, "supportsListeningModeTransparency");
}

- (void)setSupportsListeningModeTransparency:(BOOL)a3
{
  self->_supportsListeningModeTransparency = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x1001u;
}

- (BOOL)getSupportsListeningModeAutomatic
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x20) != 0)
    return self->_supportsListeningModeAutomatic;
  else
    return -[AFBluetoothDeviceInfo supportsListeningModeAutomatic](self->_base, "supportsListeningModeAutomatic");
}

- (void)setSupportsListeningModeAutomatic:(BOOL)a3
{
  self->_supportsListeningModeAutomatic = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x2001u;
}

- (BOOL)getSupportsConversationAwareness
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x40) != 0)
    return self->_supportsConversationAwareness;
  else
    return -[AFBluetoothDeviceInfo supportsConversationAwareness](self->_base, "supportsConversationAwareness");
}

- (void)setSupportsConversationAwareness:(BOOL)a3
{
  self->_supportsConversationAwareness = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x4001u;
}

- (BOOL)getSupportsPersonalVolume
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x80) != 0)
    return self->_supportsPersonalVolume;
  else
    return -[AFBluetoothDeviceInfo supportsPersonalVolume](self->_base, "supportsPersonalVolume");
}

- (void)setSupportsPersonalVolume:(BOOL)a3
{
  self->_supportsPersonalVolume = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x8001u;
}

- (BOOL)getSupportsAnnounceCall
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 1) != 0)
    return self->_supportsAnnounceCall;
  else
    return -[AFBluetoothDeviceInfo supportsAnnounceCall](self->_base, "supportsAnnounceCall");
}

- (void)setSupportsAnnounceCall:(BOOL)a3
{
  self->_supportsAnnounceCall = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x10001u;
}

- (id)getHeadGestureConfiguration
{
  AFBluetoothHeadGestureConfiguration *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 2) & 2) != 0)
  {
    v2 = self->_headGestureConfiguration;
  }
  else
  {
    -[AFBluetoothDeviceInfo headGestureConfiguration](self->_base, "headGestureConfiguration");
    v2 = (AFBluetoothHeadGestureConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHeadGestureConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_headGestureConfiguration, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x20001u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headGestureConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
