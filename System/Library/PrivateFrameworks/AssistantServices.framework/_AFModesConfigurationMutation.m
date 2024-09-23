@implementation _AFModesConfigurationMutation

- (_AFModesConfigurationMutation)initWithBase:(id)a3
{
  id v5;
  _AFModesConfigurationMutation *v6;
  _AFModesConfigurationMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFModesConfigurationMutation;
  v6 = -[_AFModesConfigurationMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (BOOL)getIsEyesFree
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_isEyesFree;
  else
    return -[AFModesConfiguration isEyesFree](self->_base, "isEyesFree");
}

- (void)setIsEyesFree:(BOOL)a3
{
  self->_isEyesFree = a3;
  *(_QWORD *)&self->_mutationFlags |= 3uLL;
}

- (BOOL)getIsUIFree
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_isUIFree;
  else
    return -[AFModesConfiguration isUIFree](self->_base, "isUIFree");
}

- (void)setIsUIFree:(BOOL)a3
{
  self->_isUIFree = a3;
  *(_QWORD *)&self->_mutationFlags |= 5uLL;
}

- (BOOL)getIsForCarDND
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_isForCarDND;
  else
    return -[AFModesConfiguration isForCarDND](self->_base, "isForCarDND");
}

- (void)setIsForCarDND:(BOOL)a3
{
  self->_isForCarDND = a3;
  *(_QWORD *)&self->_mutationFlags |= 9uLL;
}

- (BOOL)getIsInAmbient
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_isInAmbient;
  else
    return -[AFModesConfiguration isInAmbient](self->_base, "isInAmbient");
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x11uLL;
}

- (BOOL)getIsMapsNavigationActive
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_isMapsNavigationActive;
  else
    return -[AFModesConfiguration isMapsNavigationActive](self->_base, "isMapsNavigationActive");
}

- (void)setIsMapsNavigationActive:(BOOL)a3
{
  self->_isMapsNavigationActive = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x21uLL;
}

- (BOOL)getIsVoiceTriggerRequest
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
    return self->_isVoiceTriggerRequest;
  else
    return -[AFModesConfiguration isVoiceTriggerRequest](self->_base, "isVoiceTriggerRequest");
}

- (void)setIsVoiceTriggerRequest:(BOOL)a3
{
  self->_isVoiceTriggerRequest = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x41uLL;
}

- (BOOL)getIsConnectedToCarPlay
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x80) != 0)
    return self->_isConnectedToCarPlay;
  else
    return -[AFModesConfiguration isConnectedToCarPlay](self->_base, "isConnectedToCarPlay");
}

- (void)setIsConnectedToCarPlay:(BOOL)a3
{
  self->_isConnectedToCarPlay = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x81uLL;
}

- (BOOL)getIsRequestMadeWithPhysicalDeviceInteraction
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 1) != 0)
    return self->_isRequestMadeWithPhysicalDeviceInteraction;
  else
    return -[AFModesConfiguration isRequestMadeWithPhysicalDeviceInteraction](self->_base, "isRequestMadeWithPhysicalDeviceInteraction");
}

- (void)setIsRequestMadeWithPhysicalDeviceInteraction:(BOOL)a3
{
  self->_isRequestMadeWithPhysicalDeviceInteraction = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x101uLL;
}

- (BOOL)getIsAudioAccessoryButtonActivation
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 2) != 0)
    return self->_isAudioAccessoryButtonActivation;
  else
    return -[AFModesConfiguration isAudioAccessoryButtonActivation](self->_base, "isAudioAccessoryButtonActivation");
}

- (void)setIsAudioAccessoryButtonActivation:(BOOL)a3
{
  self->_isAudioAccessoryButtonActivation = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x201uLL;
}

- (BOOL)getIsSiriAutoPrompt
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 4) != 0)
    return self->_isSiriAutoPrompt;
  else
    return -[AFModesConfiguration isSiriAutoPrompt](self->_base, "isSiriAutoPrompt");
}

- (void)setIsSiriAutoPrompt:(BOOL)a3
{
  self->_isSiriAutoPrompt = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x401uLL;
}

- (BOOL)getIsFlexibleFollowup
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 8) != 0)
    return self->_isFlexibleFollowup;
  else
    return -[AFModesConfiguration isFlexibleFollowup](self->_base, "isFlexibleFollowup");
}

- (void)setIsFlexibleFollowup:(BOOL)a3
{
  self->_isFlexibleFollowup = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x801uLL;
}

- (BOOL)getIsMediaPlaying
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x10) != 0)
    return self->_isMediaPlaying;
  else
    return -[AFModesConfiguration isMediaPlaying](self->_base, "isMediaPlaying");
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x1001uLL;
}

- (BOOL)getUserTypedInSiri
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x20) != 0)
    return self->_userTypedInSiri;
  else
    return -[AFModesConfiguration userTypedInSiri](self->_base, "userTypedInSiri");
}

- (void)setUserTypedInSiri:(BOOL)a3
{
  self->_userTypedInSiri = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x2001uLL;
}

- (id)getModeOverrideValue
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x40) != 0)
  {
    v2 = self->_modeOverrideValue;
  }
  else
  {
    -[AFModesConfiguration modeOverrideValue](self->_base, "modeOverrideValue");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setModeOverrideValue:(id)a3
{
  objc_storeStrong((id *)&self->_modeOverrideValue, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x4001uLL;
}

- (BOOL)getIsDeviceUnlocked
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x80) != 0)
    return self->_isDeviceUnlocked;
  else
    return -[AFModesConfiguration isDeviceUnlocked](self->_base, "isDeviceUnlocked");
}

- (void)setIsDeviceUnlocked:(BOOL)a3
{
  self->_isDeviceUnlocked = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x8001uLL;
}

- (BOOL)getIsDeviceScreenON
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 1) != 0)
    return self->_isDeviceScreenON;
  else
    return -[AFModesConfiguration isDeviceScreenON](self->_base, "isDeviceScreenON");
}

- (void)setIsDeviceScreenON:(BOOL)a3
{
  self->_isDeviceScreenON = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x10001uLL;
}

- (BOOL)getIsInPocket
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 2) != 0)
    return self->_isInPocket;
  else
    return -[AFModesConfiguration isInPocket](self->_base, "isInPocket");
}

- (void)setIsInPocket:(BOOL)a3
{
  self->_isInPocket = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x20001uLL;
}

- (BOOL)getLiftToWakeDetected
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 4) != 0)
    return self->_liftToWakeDetected;
  else
    return -[AFModesConfiguration liftToWakeDetected](self->_base, "liftToWakeDetected");
}

- (void)setLiftToWakeDetected:(BOOL)a3
{
  self->_liftToWakeDetected = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x40001uLL;
}

- (BOOL)getUserInitiatedWakeDetected
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 8) != 0)
    return self->_userInitiatedWakeDetected;
  else
    return -[AFModesConfiguration userInitiatedWakeDetected](self->_base, "userInitiatedWakeDetected");
}

- (void)setUserInitiatedWakeDetected:(BOOL)a3
{
  self->_userInitiatedWakeDetected = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x80001uLL;
}

- (int64_t)getDeviceMotion
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 0x10) != 0)
    return self->_deviceMotion;
  else
    return -[AFModesConfiguration deviceMotion](self->_base, "deviceMotion");
}

- (void)setDeviceMotion:(int64_t)a3
{
  self->_deviceMotion = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x100001uLL;
}

- (int64_t)getDeviceRaised
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 0x20) != 0)
    return self->_deviceRaised;
  else
    return -[AFModesConfiguration deviceRaised](self->_base, "deviceRaised");
}

- (void)setDeviceRaised:(int64_t)a3
{
  self->_deviceRaised = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x200001uLL;
}

- (int64_t)getFaceDetected
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 0x40) != 0)
    return self->_faceDetected;
  else
    return -[AFModesConfiguration faceDetected](self->_base, "faceDetected");
}

- (void)setFaceDetected:(int64_t)a3
{
  self->_faceDetected = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x400001uLL;
}

- (int64_t)getTouchScreenDetected
{
  if ((*((_BYTE *)&self->_mutationFlags + 2) & 0x80) != 0)
    return self->_touchScreenDetected;
  else
    return -[AFModesConfiguration touchScreenDetected](self->_base, "touchScreenDetected");
}

- (void)setTouchScreenDetected:(int64_t)a3
{
  self->_touchScreenDetected = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x800001uLL;
}

- (int64_t)getButtonPressDetected
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 1) != 0)
    return self->_buttonPressDetected;
  else
    return -[AFModesConfiguration buttonPressDetected](self->_base, "buttonPressDetected");
}

- (void)setButtonPressDetected:(int64_t)a3
{
  self->_buttonPressDetected = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x1000001uLL;
}

- (int64_t)getFlatDevicePosture
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 2) != 0)
    return self->_flatDevicePosture;
  else
    return -[AFModesConfiguration flatDevicePosture](self->_base, "flatDevicePosture");
}

- (void)setFlatDevicePosture:(int64_t)a3
{
  self->_flatDevicePosture = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x2000001uLL;
}

- (int64_t)getDeviceOrientation
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 4) != 0)
    return self->_deviceOrientation;
  else
    return -[AFModesConfiguration deviceOrientation](self->_base, "deviceOrientation");
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x4000001uLL;
}

- (int64_t)getIsInWorkout
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 8) != 0)
    return self->_isInWorkout;
  else
    return -[AFModesConfiguration isInWorkout](self->_base, "isInWorkout");
}

- (void)setIsInWorkout:(int64_t)a3
{
  self->_isInWorkout = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x8000001uLL;
}

- (int64_t)getIsBacklightOn
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 0x10) != 0)
    return self->_isBacklightOn;
  else
    return -[AFModesConfiguration isBacklightOn](self->_base, "isBacklightOn");
}

- (void)setIsBacklightOn:(int64_t)a3
{
  self->_isBacklightOn = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x10000001uLL;
}

- (int64_t)getIsInWaterLock
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 0x20) != 0)
    return self->_isInWaterLock;
  else
    return -[AFModesConfiguration isInWaterLock](self->_base, "isInWaterLock");
}

- (void)setIsInWaterLock:(int64_t)a3
{
  self->_isInWaterLock = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x20000001uLL;
}

- (int64_t)getIsInSleepLock
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 0x40) != 0)
    return self->_isInSleepLock;
  else
    return -[AFModesConfiguration isInSleepLock](self->_base, "isInSleepLock");
}

- (void)setIsInSleepLock:(int64_t)a3
{
  self->_isInSleepLock = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x40000001uLL;
}

- (int64_t)getIsInTheaterMode
{
  if ((*((_BYTE *)&self->_mutationFlags + 3) & 0x80) != 0)
    return self->_isInTheaterMode;
  else
    return -[AFModesConfiguration isInTheaterMode](self->_base, "isInTheaterMode");
}

- (void)setIsInTheaterMode:(int64_t)a3
{
  self->_isInTheaterMode = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x80000001uLL;
}

- (int64_t)getIsOnWrist
{
  if ((*(_BYTE *)(&self->_mutationFlags + 1) & 1) != 0)
    return self->_isOnWrist;
  else
    return -[AFModesConfiguration isOnWrist](self->_base, "isOnWrist");
}

- (void)setIsOnWrist:(int64_t)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->_mutationFlags | 0x100000001;
  self->_isOnWrist = a3;
  *(_QWORD *)&self->_mutationFlags = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeOverrideValue, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
