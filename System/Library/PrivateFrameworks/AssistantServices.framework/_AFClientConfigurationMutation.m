@implementation _AFClientConfigurationMutation

- (_AFClientConfigurationMutation)initWithBase:(id)a3
{
  id v5;
  _AFClientConfigurationMutation *v6;
  _AFClientConfigurationMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClientConfigurationMutation;
  v6 = -[_AFClientConfigurationMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getAccessibilityState
{
  AFAccessibilityState *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_accessibilityState;
  }
  else
  {
    -[AFClientConfiguration accessibilityState](self->_base, "accessibilityState");
    v2 = (AFAccessibilityState *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAccessibilityState:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityState, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (int64_t)getDeviceRingerSwitchState
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
    return self->_deviceRingerSwitchState;
  else
    return -[AFClientConfiguration deviceRingerSwitchState](self->_base, "deviceRingerSwitchState");
}

- (void)setDeviceRingerSwitchState:(int64_t)a3
{
  self->_deviceRingerSwitchState = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (BOOL)getIsDeviceInCarDNDMode
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_isDeviceInCarDNDMode;
  else
    return -[AFClientConfiguration isDeviceInCarDNDMode](self->_base, "isDeviceInCarDNDMode");
}

- (void)setIsDeviceInCarDNDMode:(BOOL)a3
{
  self->_isDeviceInCarDNDMode = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (BOOL)getIsDeviceInStarkMode
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
    return self->_isDeviceInStarkMode;
  else
    return -[AFClientConfiguration isDeviceInStarkMode](self->_base, "isDeviceInStarkMode");
}

- (void)setIsDeviceInStarkMode:(BOOL)a3
{
  self->_isDeviceInStarkMode = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (BOOL)getSupportsCarPlayVehicleData
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_supportsCarPlayVehicleData;
  else
    return -[AFClientConfiguration supportsCarPlayVehicleData](self->_base, "supportsCarPlayVehicleData");
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  self->_supportsCarPlayVehicleData = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getIsDeviceWatchAuthenticated
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
    return self->_isDeviceWatchAuthenticated;
  else
    return -[AFClientConfiguration isDeviceWatchAuthenticated](self->_base, "isDeviceWatchAuthenticated");
}

- (void)setIsDeviceWatchAuthenticated:(BOOL)a3
{
  self->_isDeviceWatchAuthenticated = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getAreAnnouncementRequestsPermittedByPresentationWhileActive
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_areAnnouncementRequestsPermittedByPresentationWhileActive;
  else
    return -[AFClientConfiguration areAnnouncementRequestsPermittedByPresentationWhileActive](self->_base, "areAnnouncementRequestsPermittedByPresentationWhileActive");
}

- (void)setAreAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  self->_areAnnouncementRequestsPermittedByPresentationWhileActive = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (float)getOutputVolume
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_outputVolume;
  -[AFClientConfiguration outputVolume](self->_base, "outputVolume");
  return result;
}

- (void)setOutputVolume:(float)a3
{
  self->_outputVolume = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getTapToSiriAudioPlaybackRequest
{
  AFAudioPlaybackRequest *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_tapToSiriAudioPlaybackRequest;
  }
  else
  {
    -[AFClientConfiguration tapToSiriAudioPlaybackRequest](self->_base, "tapToSiriAudioPlaybackRequest");
    v2 = (AFAudioPlaybackRequest *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTapToSiriAudioPlaybackRequest:(id)a3
{
  objc_storeStrong((id *)&self->_tapToSiriAudioPlaybackRequest, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getTwoShotAudioPlaybackRequest
{
  AFAudioPlaybackRequest *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_twoShotAudioPlaybackRequest;
  }
  else
  {
    -[AFClientConfiguration twoShotAudioPlaybackRequest](self->_base, "twoShotAudioPlaybackRequest");
    v2 = (AFAudioPlaybackRequest *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTwoShotAudioPlaybackRequest:(id)a3
{
  objc_storeStrong((id *)&self->_twoShotAudioPlaybackRequest, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getDeviceSetupFlowBeginDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_deviceSetupFlowBeginDate;
  }
  else
  {
    -[AFClientConfiguration deviceSetupFlowBeginDate](self->_base, "deviceSetupFlowBeginDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeviceSetupFlowBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSetupFlowBeginDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getDeviceSetupFlowEndDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_deviceSetupFlowEndDate;
  }
  else
  {
    -[AFClientConfiguration deviceSetupFlowEndDate](self->_base, "deviceSetupFlowEndDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeviceSetupFlowEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSetupFlowEndDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSetupFlowEndDate, 0);
  objc_storeStrong((id *)&self->_deviceSetupFlowBeginDate, 0);
  objc_storeStrong((id *)&self->_twoShotAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_tapToSiriAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_accessibilityState, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
