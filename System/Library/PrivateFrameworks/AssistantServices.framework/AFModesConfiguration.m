@implementation AFModesConfiguration

- (AFModesConfiguration)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFModesConfigurationMutation *);
  AFModesConfiguration *v5;
  AFModesConfiguration *v6;
  _AFModesConfigurationMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *modeOverrideValue;
  objc_super v12;

  v4 = (void (**)(id, _AFModesConfigurationMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFModesConfiguration;
  v5 = -[AFModesConfiguration init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFModesConfigurationMutation initWithBase:]([_AFModesConfigurationMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFModesConfigurationMutation isDirty](v7, "isDirty"))
    {
      v6->_isEyesFree = -[_AFModesConfigurationMutation getIsEyesFree](v7, "getIsEyesFree");
      v6->_isUIFree = -[_AFModesConfigurationMutation getIsUIFree](v7, "getIsUIFree");
      v6->_isForCarDND = -[_AFModesConfigurationMutation getIsForCarDND](v7, "getIsForCarDND");
      v6->_isInAmbient = -[_AFModesConfigurationMutation getIsInAmbient](v7, "getIsInAmbient");
      v6->_isMapsNavigationActive = -[_AFModesConfigurationMutation getIsMapsNavigationActive](v7, "getIsMapsNavigationActive");
      v6->_isVoiceTriggerRequest = -[_AFModesConfigurationMutation getIsVoiceTriggerRequest](v7, "getIsVoiceTriggerRequest");
      v6->_isConnectedToCarPlay = -[_AFModesConfigurationMutation getIsConnectedToCarPlay](v7, "getIsConnectedToCarPlay");
      v6->_isRequestMadeWithPhysicalDeviceInteraction = -[_AFModesConfigurationMutation getIsRequestMadeWithPhysicalDeviceInteraction](v7, "getIsRequestMadeWithPhysicalDeviceInteraction");
      v6->_isAudioAccessoryButtonActivation = -[_AFModesConfigurationMutation getIsAudioAccessoryButtonActivation](v7, "getIsAudioAccessoryButtonActivation");
      v6->_isSiriAutoPrompt = -[_AFModesConfigurationMutation getIsSiriAutoPrompt](v7, "getIsSiriAutoPrompt");
      v6->_isFlexibleFollowup = -[_AFModesConfigurationMutation getIsFlexibleFollowup](v7, "getIsFlexibleFollowup");
      v6->_isMediaPlaying = -[_AFModesConfigurationMutation getIsMediaPlaying](v7, "getIsMediaPlaying");
      v6->_userTypedInSiri = -[_AFModesConfigurationMutation getUserTypedInSiri](v7, "getUserTypedInSiri");
      -[_AFModesConfigurationMutation getModeOverrideValue](v7, "getModeOverrideValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      modeOverrideValue = v6->_modeOverrideValue;
      v6->_modeOverrideValue = (NSString *)v9;

      v6->_isDeviceUnlocked = -[_AFModesConfigurationMutation getIsDeviceUnlocked](v7, "getIsDeviceUnlocked");
      v6->_isDeviceScreenON = -[_AFModesConfigurationMutation getIsDeviceScreenON](v7, "getIsDeviceScreenON");
      v6->_isInPocket = -[_AFModesConfigurationMutation getIsInPocket](v7, "getIsInPocket");
      v6->_liftToWakeDetected = -[_AFModesConfigurationMutation getLiftToWakeDetected](v7, "getLiftToWakeDetected");
      v6->_userInitiatedWakeDetected = -[_AFModesConfigurationMutation getUserInitiatedWakeDetected](v7, "getUserInitiatedWakeDetected");
      v6->_deviceMotion = -[_AFModesConfigurationMutation getDeviceMotion](v7, "getDeviceMotion");
      v6->_deviceRaised = -[_AFModesConfigurationMutation getDeviceRaised](v7, "getDeviceRaised");
      v6->_faceDetected = -[_AFModesConfigurationMutation getFaceDetected](v7, "getFaceDetected");
      v6->_touchScreenDetected = -[_AFModesConfigurationMutation getTouchScreenDetected](v7, "getTouchScreenDetected");
      v6->_buttonPressDetected = -[_AFModesConfigurationMutation getButtonPressDetected](v7, "getButtonPressDetected");
      v6->_flatDevicePosture = -[_AFModesConfigurationMutation getFlatDevicePosture](v7, "getFlatDevicePosture");
      v6->_deviceOrientation = -[_AFModesConfigurationMutation getDeviceOrientation](v7, "getDeviceOrientation");
      v6->_isInWorkout = -[_AFModesConfigurationMutation getIsInWorkout](v7, "getIsInWorkout");
      v6->_isBacklightOn = -[_AFModesConfigurationMutation getIsBacklightOn](v7, "getIsBacklightOn");
      v6->_isInWaterLock = -[_AFModesConfigurationMutation getIsInWaterLock](v7, "getIsInWaterLock");
      v6->_isInSleepLock = -[_AFModesConfigurationMutation getIsInSleepLock](v7, "getIsInSleepLock");
      v6->_isInTheaterMode = -[_AFModesConfigurationMutation getIsInTheaterMode](v7, "getIsInTheaterMode");
      v6->_isOnWrist = -[_AFModesConfigurationMutation getIsOnWrist](v7, "getIsOnWrist");
    }

  }
  return v6;
}

- (AFModesConfiguration)init
{
  return -[AFModesConfiguration initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFModesConfiguration)initWithIsEyesFree:(BOOL)a3 isUIFree:(BOOL)a4 isForCarDND:(BOOL)a5 isInAmbient:(BOOL)a6 isMapsNavigationActive:(BOOL)a7 isVoiceTriggerRequest:(BOOL)a8 isConnectedToCarPlay:(BOOL)a9 isRequestMadeWithPhysicalDeviceInteraction:(BOOL)a10 isAudioAccessoryButtonActivation:(BOOL)a11 isSiriAutoPrompt:(BOOL)a12 isFlexibleFollowup:(BOOL)a13 isMediaPlaying:(BOOL)a14 userTypedInSiri:(BOOL)a15 modeOverrideValue:(id)a16 isDeviceUnlocked:(BOOL)a17 isDeviceScreenON:(BOOL)a18 isInPocket:(BOOL)a19 liftToWakeDetected:(BOOL)a20 userInitiatedWakeDetected:(BOOL)a21 deviceMotion:(int64_t)a22 deviceRaised:(int64_t)a23 faceDetected:(int64_t)a24 touchScreenDetected:(int64_t)a25 buttonPressDetected:(int64_t)a26 flatDevicePosture:(int64_t)a27 deviceOrientation:(int64_t)a28 isInWorkout:(int64_t)a29 isBacklightOn:(int64_t)a30 isInWaterLock:(int64_t)a31 isInSleepLock:(int64_t)a32 isInTheaterMode:(int64_t)a33 isOnWrist:(int64_t)a34
{
  id v36;
  id v37;
  AFModesConfiguration *v38;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int64_t v53;
  BOOL v54;
  BOOL v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  BOOL v59;
  BOOL v60;
  BOOL v61;
  BOOL v62;
  BOOL v63;
  BOOL v64;
  BOOL v65;
  BOOL v66;
  BOOL v67;
  BOOL v68;
  BOOL v69;
  BOOL v70;
  BOOL v71;

  v36 = a16;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __588__AFModesConfiguration_initWithIsEyesFree_isUIFree_isForCarDND_isInAmbient_isMapsNavigationActive_isVoiceTriggerRequest_isConnectedToCarPlay_isRequestMadeWithPhysicalDeviceInteraction_isAudioAccessoryButtonActivation_isSiriAutoPrompt_isFlexibleFollowup_isMediaPlaying_userTypedInSiri_modeOverrideValue_isDeviceUnlocked_isDeviceScreenON_isInPocket_liftToWakeDetected_userInitiatedWakeDetected_deviceMotion_deviceRaised_faceDetected_touchScreenDetected_buttonPressDetected_flatDevicePosture_deviceOrientation_isInWorkout_isBacklightOn_isInWaterLock_isInSleepLock_isInTheaterMode_isOnWrist___block_invoke;
  v45[3] = &unk_1E3A32110;
  v54 = a3;
  v55 = a4;
  v56 = a5;
  v57 = a6;
  v58 = a7;
  v59 = a8;
  v60 = a9;
  v61 = a10;
  v62 = a11;
  v63 = a12;
  v64 = a13;
  v65 = a14;
  v66 = a15;
  v46 = v36;
  v67 = a17;
  v68 = a18;
  v69 = a19;
  v70 = a20;
  v71 = a21;
  v47 = *(_OWORD *)&a22;
  v48 = *(_OWORD *)&a24;
  v49 = *(_OWORD *)&a26;
  v50 = *(_OWORD *)&a28;
  v51 = *(_OWORD *)&a30;
  v52 = *(_OWORD *)&a32;
  v53 = a34;
  v37 = v36;
  v38 = -[AFModesConfiguration initWithBuilder:](self, "initWithBuilder:", v45);

  return v38;
}

- (id)description
{
  return -[AFModesConfiguration _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  unint64_t deviceMotion;
  __CFString *v5;
  _BOOL4 isEyesFree;
  _BOOL4 isUIFree;
  _BOOL4 isForCarDND;
  _BOOL4 isInAmbient;
  _BOOL4 isMapsNavigationActive;
  _BOOL4 isVoiceTriggerRequest;
  _BOOL4 isConnectedToCarPlay;
  _BOOL4 isRequestMadeWithPhysicalDeviceInteraction;
  unint64_t deviceRaised;
  __CFString *v15;
  unint64_t faceDetected;
  __CFString *v17;
  unint64_t touchScreenDetected;
  __CFString *v19;
  unint64_t buttonPressDetected;
  __CFString *v21;
  unint64_t flatDevicePosture;
  __CFString *v23;
  unint64_t deviceOrientation;
  __CFString *v25;
  unint64_t isInWorkout;
  __CFString *v27;
  unint64_t isBacklightOn;
  __CFString *v29;
  unint64_t isInWaterLock;
  __CFString *v31;
  unint64_t isInSleepLock;
  __CFString *v33;
  unint64_t isInTheaterMode;
  __CFString *v35;
  unint64_t isOnWrist;
  __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  _BOOL4 userInitiatedWakeDetected;
  _BOOL4 liftToWakeDetected;
  const __CFString *v65;
  __CFString *v66;
  _BOOL4 isInPocket;
  const __CFString *v68;
  _BOOL4 isDeviceScreenON;
  const __CFString *v70;
  _BOOL4 isDeviceUnlocked;
  const __CFString *v72;
  _BOOL4 userTypedInSiri;
  const __CFString *v74;
  _BOOL4 isMediaPlaying;
  const __CFString *v76;
  _BOOL4 isFlexibleFollowup;
  const __CFString *v78;
  _BOOL4 isSiriAutoPrompt;
  const __CFString *v80;
  _BOOL4 isAudioAccessoryButtonActivation;
  __CFString *v82;
  __CFString *v83;
  __CFString *v84;
  NSString *modeOverrideValue;
  __CFString *v86;
  id v87;
  void *v88;
  __CFString *v89;
  __CFString *v90;
  void *v91;
  objc_super v92;

  v87 = objc_alloc(MEMORY[0x1E0CB3940]);
  v92.receiver = self;
  v92.super_class = (Class)AFModesConfiguration;
  -[AFModesConfiguration description](&v92, sel_description);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  deviceMotion = self->_deviceMotion;
  if (deviceMotion > 3)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E3A34588[deviceMotion];
  isEyesFree = self->_isEyesFree;
  isUIFree = self->_isUIFree;
  isForCarDND = self->_isForCarDND;
  isInAmbient = self->_isInAmbient;
  isMapsNavigationActive = self->_isMapsNavigationActive;
  isVoiceTriggerRequest = self->_isVoiceTriggerRequest;
  isConnectedToCarPlay = self->_isConnectedToCarPlay;
  isRequestMadeWithPhysicalDeviceInteraction = self->_isRequestMadeWithPhysicalDeviceInteraction;
  isAudioAccessoryButtonActivation = self->_isAudioAccessoryButtonActivation;
  isSiriAutoPrompt = self->_isSiriAutoPrompt;
  isFlexibleFollowup = self->_isFlexibleFollowup;
  isMediaPlaying = self->_isMediaPlaying;
  userTypedInSiri = self->_userTypedInSiri;
  modeOverrideValue = self->_modeOverrideValue;
  isDeviceUnlocked = self->_isDeviceUnlocked;
  isDeviceScreenON = self->_isDeviceScreenON;
  isInPocket = self->_isInPocket;
  userInitiatedWakeDetected = self->_userInitiatedWakeDetected;
  liftToWakeDetected = self->_liftToWakeDetected;
  v90 = v5;
  deviceRaised = self->_deviceRaised;
  if (deviceRaised > 2)
    v15 = CFSTR("(unknown)");
  else
    v15 = off_1E3A345C8[deviceRaised];
  v89 = v15;
  faceDetected = self->_faceDetected;
  if (faceDetected > 2)
    v17 = CFSTR("(unknown)");
  else
    v17 = off_1E3A345C8[faceDetected];
  v86 = v17;
  touchScreenDetected = self->_touchScreenDetected;
  if (touchScreenDetected > 2)
    v19 = CFSTR("(unknown)");
  else
    v19 = off_1E3A345C8[touchScreenDetected];
  v84 = v19;
  buttonPressDetected = self->_buttonPressDetected;
  if (buttonPressDetected > 2)
    v21 = CFSTR("(unknown)");
  else
    v21 = off_1E3A345C8[buttonPressDetected];
  v83 = v21;
  flatDevicePosture = self->_flatDevicePosture;
  if (flatDevicePosture > 2)
    v23 = CFSTR("(unknown)");
  else
    v23 = off_1E3A345C8[flatDevicePosture];
  v66 = v23;
  deviceOrientation = self->_deviceOrientation;
  if (deviceOrientation > 6)
    v25 = CFSTR("(unknown)");
  else
    v25 = off_1E3A311B8[deviceOrientation];
  v62 = v25;
  isInWorkout = self->_isInWorkout;
  if (isInWorkout > 2)
    v27 = CFSTR("(unknown)");
  else
    v27 = off_1E3A345C8[isInWorkout];
  v61 = v27;
  isBacklightOn = self->_isBacklightOn;
  if (isBacklightOn > 2)
    v29 = CFSTR("(unknown)");
  else
    v29 = off_1E3A345C8[isBacklightOn];
  v60 = v29;
  isInWaterLock = self->_isInWaterLock;
  if (isInWaterLock > 2)
    v31 = CFSTR("(unknown)");
  else
    v31 = off_1E3A345C8[isInWaterLock];
  v59 = v31;
  isInSleepLock = self->_isInSleepLock;
  if (isInSleepLock > 2)
    v33 = CFSTR("(unknown)");
  else
    v33 = off_1E3A345C8[isInSleepLock];
  v58 = v33;
  isInTheaterMode = self->_isInTheaterMode;
  if (isInTheaterMode > 2)
    v35 = CFSTR("(unknown)");
  else
    v35 = off_1E3A345C8[isInTheaterMode];
  v57 = v35;
  isOnWrist = self->_isOnWrist;
  if (isOnWrist > 2)
    v37 = CFSTR("(unknown)");
  else
    v37 = off_1E3A345C8[isOnWrist];
  if (userInitiatedWakeDetected)
    v38 = CFSTR("YES");
  else
    v38 = CFSTR("NO");
  if (liftToWakeDetected)
    v39 = CFSTR("YES");
  else
    v39 = CFSTR("NO");
  v65 = v39;
  if (isInPocket)
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  v68 = v40;
  if (isDeviceScreenON)
    v41 = CFSTR("YES");
  else
    v41 = CFSTR("NO");
  v70 = v41;
  if (isDeviceUnlocked)
    v42 = CFSTR("YES");
  else
    v42 = CFSTR("NO");
  v72 = v42;
  if (userTypedInSiri)
    v43 = CFSTR("YES");
  else
    v43 = CFSTR("NO");
  v74 = v43;
  if (isMediaPlaying)
    v44 = CFSTR("YES");
  else
    v44 = CFSTR("NO");
  v76 = v44;
  if (isFlexibleFollowup)
    v45 = CFSTR("YES");
  else
    v45 = CFSTR("NO");
  v78 = v45;
  if (isSiriAutoPrompt)
    v46 = CFSTR("YES");
  else
    v46 = CFSTR("NO");
  v80 = v46;
  if (isAudioAccessoryButtonActivation)
    v47 = CFSTR("YES");
  else
    v47 = CFSTR("NO");
  if (isRequestMadeWithPhysicalDeviceInteraction)
    v48 = CFSTR("YES");
  else
    v48 = CFSTR("NO");
  if (isConnectedToCarPlay)
    v49 = CFSTR("YES");
  else
    v49 = CFSTR("NO");
  if (isVoiceTriggerRequest)
    v50 = CFSTR("YES");
  else
    v50 = CFSTR("NO");
  if (isMapsNavigationActive)
    v51 = CFSTR("YES");
  else
    v51 = CFSTR("NO");
  if (isInAmbient)
    v52 = CFSTR("YES");
  else
    v52 = CFSTR("NO");
  if (isForCarDND)
    v53 = CFSTR("YES");
  else
    v53 = CFSTR("NO");
  if (isUIFree)
    v54 = CFSTR("YES");
  else
    v54 = CFSTR("NO");
  if (isEyesFree)
    v55 = CFSTR("YES");
  else
    v55 = CFSTR("NO");
  v82 = v37;
  v88 = (void *)objc_msgSend(v87, "initWithFormat:", CFSTR("%@ {isEyesFree = %@, isUIFree = %@, isForCarDND = %@, isInAmbient = %@, isMapsNavigationActive = %@, isVoiceTriggerRequest = %@, isConnectedToCarPlay = %@, isRequestMadeWithPhysicalDeviceInteraction = %@, isAudioAccessoryButtonActivation = %@, isSiriAutoPrompt = %@, isFlexibleFollowup = %@, isMediaPlaying = %@, userTypedInSiri = %@, modeOverrideValue = %@, isDeviceUnlocked = %@, isDeviceScreenON = %@, isInPocket = %@, liftToWakeDetected = %@, userInitiatedWakeDetected = %@, deviceMotion = %@, deviceRaised = %@, faceDetected = %@, touchScreenDetected = %@, buttonPressDetected = %@, flatDevicePosture = %@, deviceOrientation = %@, isInWorkout = %@, isBacklightOn = %@, isInWaterLock = %@, isInSleepLock = %@, isInTheaterMode = %@, isOnWrist = %@}"), v91, v55, v54, v53, v52, v51, v50, v49, v48, v47, v80, v78, v76, v74, modeOverrideValue, v72,
                  v70,
                  v68,
                  v65,
                  v38,
                  v90,
                  v89,
                  v86,
                  v84,
                  v83,
                  v66,
                  v62,
                  v61,
                  v60,
                  v59,
                  v58,
                  v57,
                  v82);

  return v88;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEyesFree);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v66, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUIFree);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v65, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isForCarDND);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v64, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInAmbient);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v63, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMapsNavigationActive);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v62, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVoiceTriggerRequest);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v61, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isConnectedToCarPlay);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v60, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRequestMadeWithPhysicalDeviceInteraction);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v59, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAudioAccessoryButtonActivation);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v58, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSiriAutoPrompt);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v57, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFlexibleFollowup);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v12 ^ objc_msgSend(v56, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMediaPlaying);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v55, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userTypedInSiri);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v54, "hash");
  v16 = v15 ^ -[NSString hash](self->_modeOverrideValue, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceUnlocked);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 ^ objc_msgSend(v53, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceScreenON);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13 ^ v17 ^ objc_msgSend(v52, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInPocket);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v51, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_liftToWakeDetected);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 ^ objc_msgSend(v50, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userInitiatedWakeDetected);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 ^ objc_msgSend(v49, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceMotion);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 ^ objc_msgSend(v48, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceRaised);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 ^ objc_msgSend(v47, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_faceDetected);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18 ^ v23 ^ objc_msgSend(v46, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_touchScreenDetected);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v45, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_buttonPressDetected);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 ^ objc_msgSend(v44, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_flatDevicePosture);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 ^ objc_msgSend(v43, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceOrientation);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 ^ objc_msgSend(v42, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInWorkout);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28 ^ objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isBacklightOn);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v30 ^ objc_msgSend(v31, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInWaterLock);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v24 ^ v32 ^ objc_msgSend(v33, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInSleepLock);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInTheaterMode);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v36 ^ objc_msgSend(v37, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isOnWrist);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v34 ^ v38 ^ objc_msgSend(v39, "hash");

  return v40;
}

- (BOOL)isEqual:(id)a3
{
  AFModesConfiguration *v4;
  AFModesConfiguration *v5;
  _BOOL4 isEyesFree;
  _BOOL4 isUIFree;
  _BOOL4 isForCarDND;
  _BOOL4 isInAmbient;
  _BOOL4 isMapsNavigationActive;
  _BOOL4 isVoiceTriggerRequest;
  _BOOL4 isConnectedToCarPlay;
  _BOOL4 isRequestMadeWithPhysicalDeviceInteraction;
  _BOOL4 isAudioAccessoryButtonActivation;
  _BOOL4 isSiriAutoPrompt;
  _BOOL4 isFlexibleFollowup;
  _BOOL4 isMediaPlaying;
  _BOOL4 userTypedInSiri;
  _BOOL4 isDeviceUnlocked;
  _BOOL4 isDeviceScreenON;
  _BOOL4 isInPocket;
  _BOOL4 liftToWakeDetected;
  _BOOL4 userInitiatedWakeDetected;
  int64_t deviceMotion;
  int64_t deviceRaised;
  int64_t faceDetected;
  int64_t touchScreenDetected;
  int64_t buttonPressDetected;
  int64_t flatDevicePosture;
  int64_t deviceOrientation;
  int64_t isInWorkout;
  int64_t isBacklightOn;
  int64_t isInWaterLock;
  int64_t isInSleepLock;
  int64_t isInTheaterMode;
  int64_t isOnWrist;
  NSString *v37;
  NSString *modeOverrideValue;
  BOOL v39;

  v4 = (AFModesConfiguration *)a3;
  if (self == v4)
  {
    v39 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isEyesFree = self->_isEyesFree;
      if (isEyesFree != -[AFModesConfiguration isEyesFree](v5, "isEyesFree"))
        goto LABEL_39;
      isUIFree = self->_isUIFree;
      if (isUIFree != -[AFModesConfiguration isUIFree](v5, "isUIFree"))
        goto LABEL_39;
      isForCarDND = self->_isForCarDND;
      if (isForCarDND != -[AFModesConfiguration isForCarDND](v5, "isForCarDND"))
        goto LABEL_39;
      isInAmbient = self->_isInAmbient;
      if (isInAmbient != -[AFModesConfiguration isInAmbient](v5, "isInAmbient"))
        goto LABEL_39;
      isMapsNavigationActive = self->_isMapsNavigationActive;
      if (isMapsNavigationActive != -[AFModesConfiguration isMapsNavigationActive](v5, "isMapsNavigationActive"))
        goto LABEL_39;
      isVoiceTriggerRequest = self->_isVoiceTriggerRequest;
      if (isVoiceTriggerRequest != -[AFModesConfiguration isVoiceTriggerRequest](v5, "isVoiceTriggerRequest"))
        goto LABEL_39;
      isConnectedToCarPlay = self->_isConnectedToCarPlay;
      if (isConnectedToCarPlay != -[AFModesConfiguration isConnectedToCarPlay](v5, "isConnectedToCarPlay"))
        goto LABEL_39;
      isRequestMadeWithPhysicalDeviceInteraction = self->_isRequestMadeWithPhysicalDeviceInteraction;
      if (isRequestMadeWithPhysicalDeviceInteraction != -[AFModesConfiguration isRequestMadeWithPhysicalDeviceInteraction](v5, "isRequestMadeWithPhysicalDeviceInteraction"))goto LABEL_39;
      isAudioAccessoryButtonActivation = self->_isAudioAccessoryButtonActivation;
      if (isAudioAccessoryButtonActivation != -[AFModesConfiguration isAudioAccessoryButtonActivation](v5, "isAudioAccessoryButtonActivation"))goto LABEL_39;
      isSiriAutoPrompt = self->_isSiriAutoPrompt;
      if (isSiriAutoPrompt != -[AFModesConfiguration isSiriAutoPrompt](v5, "isSiriAutoPrompt"))
        goto LABEL_39;
      isFlexibleFollowup = self->_isFlexibleFollowup;
      if (isFlexibleFollowup != -[AFModesConfiguration isFlexibleFollowup](v5, "isFlexibleFollowup"))
        goto LABEL_39;
      isMediaPlaying = self->_isMediaPlaying;
      if (isMediaPlaying != -[AFModesConfiguration isMediaPlaying](v5, "isMediaPlaying"))
        goto LABEL_39;
      userTypedInSiri = self->_userTypedInSiri;
      if (userTypedInSiri != -[AFModesConfiguration userTypedInSiri](v5, "userTypedInSiri"))
        goto LABEL_39;
      isDeviceUnlocked = self->_isDeviceUnlocked;
      if (isDeviceUnlocked != -[AFModesConfiguration isDeviceUnlocked](v5, "isDeviceUnlocked"))
        goto LABEL_39;
      isDeviceScreenON = self->_isDeviceScreenON;
      if (isDeviceScreenON != -[AFModesConfiguration isDeviceScreenON](v5, "isDeviceScreenON"))
        goto LABEL_39;
      isInPocket = self->_isInPocket;
      if (isInPocket != -[AFModesConfiguration isInPocket](v5, "isInPocket"))
        goto LABEL_39;
      liftToWakeDetected = self->_liftToWakeDetected;
      if (liftToWakeDetected != -[AFModesConfiguration liftToWakeDetected](v5, "liftToWakeDetected"))
        goto LABEL_39;
      userInitiatedWakeDetected = self->_userInitiatedWakeDetected;
      if (userInitiatedWakeDetected != -[AFModesConfiguration userInitiatedWakeDetected](v5, "userInitiatedWakeDetected"))goto LABEL_39;
      deviceMotion = self->_deviceMotion;
      if (deviceMotion != -[AFModesConfiguration deviceMotion](v5, "deviceMotion"))
        goto LABEL_39;
      deviceRaised = self->_deviceRaised;
      if (deviceRaised != -[AFModesConfiguration deviceRaised](v5, "deviceRaised"))
        goto LABEL_39;
      faceDetected = self->_faceDetected;
      if (faceDetected != -[AFModesConfiguration faceDetected](v5, "faceDetected"))
        goto LABEL_39;
      touchScreenDetected = self->_touchScreenDetected;
      if (touchScreenDetected != -[AFModesConfiguration touchScreenDetected](v5, "touchScreenDetected"))
        goto LABEL_39;
      buttonPressDetected = self->_buttonPressDetected;
      if (buttonPressDetected != -[AFModesConfiguration buttonPressDetected](v5, "buttonPressDetected"))
        goto LABEL_39;
      flatDevicePosture = self->_flatDevicePosture;
      if (flatDevicePosture != -[AFModesConfiguration flatDevicePosture](v5, "flatDevicePosture"))
        goto LABEL_39;
      deviceOrientation = self->_deviceOrientation;
      if (deviceOrientation == -[AFModesConfiguration deviceOrientation](v5, "deviceOrientation")
        && (isInWorkout = self->_isInWorkout, isInWorkout == -[AFModesConfiguration isInWorkout](v5, "isInWorkout"))
        && (isBacklightOn = self->_isBacklightOn,
            isBacklightOn == -[AFModesConfiguration isBacklightOn](v5, "isBacklightOn"))
        && (isInWaterLock = self->_isInWaterLock,
            isInWaterLock == -[AFModesConfiguration isInWaterLock](v5, "isInWaterLock"))
        && (isInSleepLock = self->_isInSleepLock,
            isInSleepLock == -[AFModesConfiguration isInSleepLock](v5, "isInSleepLock"))
        && (isInTheaterMode = self->_isInTheaterMode,
            isInTheaterMode == -[AFModesConfiguration isInTheaterMode](v5, "isInTheaterMode"))
        && (isOnWrist = self->_isOnWrist, isOnWrist == -[AFModesConfiguration isOnWrist](v5, "isOnWrist")))
      {
        -[AFModesConfiguration modeOverrideValue](v5, "modeOverrideValue");
        v37 = (NSString *)objc_claimAutoreleasedReturnValue();
        modeOverrideValue = self->_modeOverrideValue;
        v39 = modeOverrideValue == v37 || -[NSString isEqual:](modeOverrideValue, "isEqual:", v37);

      }
      else
      {
LABEL_39:
        v39 = 0;
      }

    }
    else
    {
      v39 = 0;
    }
  }

  return v39;
}

- (AFModesConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  AFModesConfiguration *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  void *v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isEyesFree"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isUIFree"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isForCarDND"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isInAmbient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isMapsNavigationActive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isVoiceTriggerRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isConnectedToCarPlay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isRequestMadeWithPhysicalDeviceInteraction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isAudioAccessoryButtonActivation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isSiriAutoPrompt"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isFlexibleFollowup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isMediaPlaying"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::userTypedInSiri"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::modeOverrideValue"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isDeviceUnlocked"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isDeviceScreenON"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isInPocket"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::liftToWakeDetected"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::userInitiatedWakeDetected"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::deviceMotion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v22, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::deviceRaised"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v23, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::faceDetected"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v24, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::touchScreenDetected"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v25, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::buttonPressDetected"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v26, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::flatDevicePosture"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::deviceOrientation"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isInWorkout"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isBacklightOn"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isInWaterLock"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isInSleepLock"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isInTheaterMode"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFModesConfiguration::isOnWrist"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v41, "integerValue");
  BYTE4(v46) = v52;
  BYTE3(v46) = v53;
  BYTE2(v46) = v54;
  BYTE1(v46) = v55;
  LOBYTE(v46) = v56;
  BYTE6(v45) = v58;
  BYTE5(v45) = v59;
  BYTE4(v45) = v60;
  BYTE3(v45) = v61;
  BYTE2(v45) = v62;
  BYTE1(v45) = v63;
  LOBYTE(v45) = v64;
  v43 = -[AFModesConfiguration initWithIsEyesFree:isUIFree:isForCarDND:isInAmbient:isMapsNavigationActive:isVoiceTriggerRequest:isConnectedToCarPlay:isRequestMadeWithPhysicalDeviceInteraction:isAudioAccessoryButtonActivation:isSiriAutoPrompt:isFlexibleFollowup:isMediaPlaying:userTypedInSiri:modeOverrideValue:isDeviceUnlocked:isDeviceScreenON:isInPocket:liftToWakeDetected:userInitiatedWakeDetected:deviceMotion:deviceRaised:faceDetected:touchScreenDetected:buttonPressDetected:flatDevicePosture:deviceOrientation:isInWorkout:isBacklightOn:isInWaterLock:isInSleepLock:isInTheaterMode:isOnWrist:](self, "initWithIsEyesFree:isUIFree:isForCarDND:isInAmbient:isMapsNavigationActive:isVoiceTriggerRequest:isConnectedToCarPlay:isRequestMadeWithPhysicalDeviceInteraction:isAudioAccessoryButtonActivation:isSiriAutoPrompt:isFlexibleFollowup:isMediaPlaying:userTypedInSiri:modeOverrideValue:isDeviceUnlocked:isDeviceScreenON:isInPocket:liftToWakeDetected:userInitiatedWakeDetected:deviceMotion:deviceRaised:faceDetected:touchScreenDetected:buttonPressDetected:flatDevicePosture:deviceOrientation:isInWorkout:isBacklightOn:isInWaterLock:isInSleepLock:isInTheaterMode:isOnWrist:", v70, v69, v68, v67, v66, v65, v45, v57, v46, v51, v50, v49, v48,
          v47,
          v28,
          v30,
          v32,
          v34,
          v36,
          v38,
          v40,
          v42);

  return v43;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 isEyesFree;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  isEyesFree = self->_isEyesFree;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", isEyesFree);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFModesConfiguration::isEyesFree"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUIFree);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFModesConfiguration::isUIFree"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isForCarDND);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFModesConfiguration::isForCarDND"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInAmbient);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("AFModesConfiguration::isInAmbient"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMapsNavigationActive);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("AFModesConfiguration::isMapsNavigationActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVoiceTriggerRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("AFModesConfiguration::isVoiceTriggerRequest"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isConnectedToCarPlay);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("AFModesConfiguration::isConnectedToCarPlay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRequestMadeWithPhysicalDeviceInteraction);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("AFModesConfiguration::isRequestMadeWithPhysicalDeviceInteraction"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAudioAccessoryButtonActivation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v15, CFSTR("AFModesConfiguration::isAudioAccessoryButtonActivation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSiriAutoPrompt);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v16, CFSTR("AFModesConfiguration::isSiriAutoPrompt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFlexibleFollowup);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v17, CFSTR("AFModesConfiguration::isFlexibleFollowup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMediaPlaying);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v18, CFSTR("AFModesConfiguration::isMediaPlaying"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userTypedInSiri);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v19, CFSTR("AFModesConfiguration::userTypedInSiri"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_modeOverrideValue, CFSTR("AFModesConfiguration::modeOverrideValue"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceUnlocked);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v20, CFSTR("AFModesConfiguration::isDeviceUnlocked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceScreenON);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v21, CFSTR("AFModesConfiguration::isDeviceScreenON"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInPocket);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v22, CFSTR("AFModesConfiguration::isInPocket"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_liftToWakeDetected);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v23, CFSTR("AFModesConfiguration::liftToWakeDetected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userInitiatedWakeDetected);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v24, CFSTR("AFModesConfiguration::userInitiatedWakeDetected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceMotion);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v25, CFSTR("AFModesConfiguration::deviceMotion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceRaised);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v26, CFSTR("AFModesConfiguration::deviceRaised"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_faceDetected);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v27, CFSTR("AFModesConfiguration::faceDetected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_touchScreenDetected);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v28, CFSTR("AFModesConfiguration::touchScreenDetected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_buttonPressDetected);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v29, CFSTR("AFModesConfiguration::buttonPressDetected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_flatDevicePosture);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v30, CFSTR("AFModesConfiguration::flatDevicePosture"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceOrientation);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v31, CFSTR("AFModesConfiguration::deviceOrientation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInWorkout);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v32, CFSTR("AFModesConfiguration::isInWorkout"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isBacklightOn);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v33, CFSTR("AFModesConfiguration::isBacklightOn"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInWaterLock);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v34, CFSTR("AFModesConfiguration::isInWaterLock"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInSleepLock);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v35, CFSTR("AFModesConfiguration::isInSleepLock"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isInTheaterMode);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v36, CFSTR("AFModesConfiguration::isInTheaterMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isOnWrist);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v37, CFSTR("AFModesConfiguration::isOnWrist"));

}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (BOOL)isUIFree
{
  return self->_isUIFree;
}

- (BOOL)isForCarDND
{
  return self->_isForCarDND;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isMapsNavigationActive
{
  return self->_isMapsNavigationActive;
}

- (BOOL)isVoiceTriggerRequest
{
  return self->_isVoiceTriggerRequest;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_isConnectedToCarPlay;
}

- (BOOL)isRequestMadeWithPhysicalDeviceInteraction
{
  return self->_isRequestMadeWithPhysicalDeviceInteraction;
}

- (BOOL)isAudioAccessoryButtonActivation
{
  return self->_isAudioAccessoryButtonActivation;
}

- (BOOL)isSiriAutoPrompt
{
  return self->_isSiriAutoPrompt;
}

- (BOOL)isFlexibleFollowup
{
  return self->_isFlexibleFollowup;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (BOOL)userTypedInSiri
{
  return self->_userTypedInSiri;
}

- (NSString)modeOverrideValue
{
  return self->_modeOverrideValue;
}

- (BOOL)isDeviceUnlocked
{
  return self->_isDeviceUnlocked;
}

- (BOOL)isDeviceScreenON
{
  return self->_isDeviceScreenON;
}

- (BOOL)isInPocket
{
  return self->_isInPocket;
}

- (BOOL)liftToWakeDetected
{
  return self->_liftToWakeDetected;
}

- (BOOL)userInitiatedWakeDetected
{
  return self->_userInitiatedWakeDetected;
}

- (int64_t)deviceMotion
{
  return self->_deviceMotion;
}

- (int64_t)deviceRaised
{
  return self->_deviceRaised;
}

- (int64_t)faceDetected
{
  return self->_faceDetected;
}

- (int64_t)touchScreenDetected
{
  return self->_touchScreenDetected;
}

- (int64_t)buttonPressDetected
{
  return self->_buttonPressDetected;
}

- (int64_t)flatDevicePosture
{
  return self->_flatDevicePosture;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (int64_t)isInWorkout
{
  return self->_isInWorkout;
}

- (int64_t)isBacklightOn
{
  return self->_isBacklightOn;
}

- (int64_t)isInWaterLock
{
  return self->_isInWaterLock;
}

- (int64_t)isInSleepLock
{
  return self->_isInSleepLock;
}

- (int64_t)isInTheaterMode
{
  return self->_isInTheaterMode;
}

- (int64_t)isOnWrist
{
  return self->_isOnWrist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeOverrideValue, 0);
}

void __588__AFModesConfiguration_initWithIsEyesFree_isUIFree_isForCarDND_isInAmbient_isMapsNavigationActive_isVoiceTriggerRequest_isConnectedToCarPlay_isRequestMadeWithPhysicalDeviceInteraction_isAudioAccessoryButtonActivation_isSiriAutoPrompt_isFlexibleFollowup_isMediaPlaying_userTypedInSiri_modeOverrideValue_isDeviceUnlocked_isDeviceScreenON_isInPocket_liftToWakeDetected_userInitiatedWakeDetected_deviceMotion_deviceRaised_faceDetected_touchScreenDetected_buttonPressDetected_flatDevicePosture_deviceOrientation_isInWorkout_isBacklightOn_isInWaterLock_isInSleepLock_isInTheaterMode_isOnWrist___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 144);
  v4 = a2;
  objc_msgSend(v4, "setIsEyesFree:", v3);
  objc_msgSend(v4, "setIsUIFree:", *(unsigned __int8 *)(a1 + 145));
  objc_msgSend(v4, "setIsForCarDND:", *(unsigned __int8 *)(a1 + 146));
  objc_msgSend(v4, "setIsInAmbient:", *(unsigned __int8 *)(a1 + 147));
  objc_msgSend(v4, "setIsMapsNavigationActive:", *(unsigned __int8 *)(a1 + 148));
  objc_msgSend(v4, "setIsVoiceTriggerRequest:", *(unsigned __int8 *)(a1 + 149));
  objc_msgSend(v4, "setIsConnectedToCarPlay:", *(unsigned __int8 *)(a1 + 150));
  objc_msgSend(v4, "setIsRequestMadeWithPhysicalDeviceInteraction:", *(unsigned __int8 *)(a1 + 151));
  objc_msgSend(v4, "setIsAudioAccessoryButtonActivation:", *(unsigned __int8 *)(a1 + 152));
  objc_msgSend(v4, "setIsSiriAutoPrompt:", *(unsigned __int8 *)(a1 + 153));
  objc_msgSend(v4, "setIsFlexibleFollowup:", *(unsigned __int8 *)(a1 + 154));
  objc_msgSend(v4, "setIsMediaPlaying:", *(unsigned __int8 *)(a1 + 155));
  objc_msgSend(v4, "setUserTypedInSiri:", *(unsigned __int8 *)(a1 + 156));
  objc_msgSend(v4, "setModeOverrideValue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setIsDeviceUnlocked:", *(unsigned __int8 *)(a1 + 157));
  objc_msgSend(v4, "setIsDeviceScreenON:", *(unsigned __int8 *)(a1 + 158));
  objc_msgSend(v4, "setIsInPocket:", *(unsigned __int8 *)(a1 + 159));
  objc_msgSend(v4, "setLiftToWakeDetected:", *(unsigned __int8 *)(a1 + 160));
  objc_msgSend(v4, "setUserInitiatedWakeDetected:", *(unsigned __int8 *)(a1 + 161));
  objc_msgSend(v4, "setDeviceMotion:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setDeviceRaised:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setFaceDetected:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setTouchScreenDetected:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setButtonPressDetected:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setFlatDevicePosture:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setDeviceOrientation:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setIsInWorkout:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v4, "setIsBacklightOn:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v4, "setIsInWaterLock:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v4, "setIsInSleepLock:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v4, "setIsInTheaterMode:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v4, "setIsOnWrist:", *(_QWORD *)(a1 + 136));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFModesConfigurationMutation *);
  _AFModesConfigurationMutation *v5;
  AFModesConfiguration *v6;
  void *v7;
  uint64_t v8;
  NSString *modeOverrideValue;

  v4 = (void (**)(id, _AFModesConfigurationMutation *))a3;
  if (v4)
  {
    v5 = -[_AFModesConfigurationMutation initWithBase:]([_AFModesConfigurationMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFModesConfigurationMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFModesConfiguration);
      v6->_isEyesFree = -[_AFModesConfigurationMutation getIsEyesFree](v5, "getIsEyesFree");
      v6->_isUIFree = -[_AFModesConfigurationMutation getIsUIFree](v5, "getIsUIFree");
      v6->_isForCarDND = -[_AFModesConfigurationMutation getIsForCarDND](v5, "getIsForCarDND");
      v6->_isInAmbient = -[_AFModesConfigurationMutation getIsInAmbient](v5, "getIsInAmbient");
      v6->_isMapsNavigationActive = -[_AFModesConfigurationMutation getIsMapsNavigationActive](v5, "getIsMapsNavigationActive");
      v6->_isVoiceTriggerRequest = -[_AFModesConfigurationMutation getIsVoiceTriggerRequest](v5, "getIsVoiceTriggerRequest");
      v6->_isConnectedToCarPlay = -[_AFModesConfigurationMutation getIsConnectedToCarPlay](v5, "getIsConnectedToCarPlay");
      v6->_isRequestMadeWithPhysicalDeviceInteraction = -[_AFModesConfigurationMutation getIsRequestMadeWithPhysicalDeviceInteraction](v5, "getIsRequestMadeWithPhysicalDeviceInteraction");
      v6->_isAudioAccessoryButtonActivation = -[_AFModesConfigurationMutation getIsAudioAccessoryButtonActivation](v5, "getIsAudioAccessoryButtonActivation");
      v6->_isSiriAutoPrompt = -[_AFModesConfigurationMutation getIsSiriAutoPrompt](v5, "getIsSiriAutoPrompt");
      v6->_isFlexibleFollowup = -[_AFModesConfigurationMutation getIsFlexibleFollowup](v5, "getIsFlexibleFollowup");
      v6->_isMediaPlaying = -[_AFModesConfigurationMutation getIsMediaPlaying](v5, "getIsMediaPlaying");
      v6->_userTypedInSiri = -[_AFModesConfigurationMutation getUserTypedInSiri](v5, "getUserTypedInSiri");
      -[_AFModesConfigurationMutation getModeOverrideValue](v5, "getModeOverrideValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      modeOverrideValue = v6->_modeOverrideValue;
      v6->_modeOverrideValue = (NSString *)v8;

      v6->_isDeviceUnlocked = -[_AFModesConfigurationMutation getIsDeviceUnlocked](v5, "getIsDeviceUnlocked");
      v6->_isDeviceScreenON = -[_AFModesConfigurationMutation getIsDeviceScreenON](v5, "getIsDeviceScreenON");
      v6->_isInPocket = -[_AFModesConfigurationMutation getIsInPocket](v5, "getIsInPocket");
      v6->_liftToWakeDetected = -[_AFModesConfigurationMutation getLiftToWakeDetected](v5, "getLiftToWakeDetected");
      v6->_userInitiatedWakeDetected = -[_AFModesConfigurationMutation getUserInitiatedWakeDetected](v5, "getUserInitiatedWakeDetected");
      v6->_deviceMotion = -[_AFModesConfigurationMutation getDeviceMotion](v5, "getDeviceMotion");
      v6->_deviceRaised = -[_AFModesConfigurationMutation getDeviceRaised](v5, "getDeviceRaised");
      v6->_faceDetected = -[_AFModesConfigurationMutation getFaceDetected](v5, "getFaceDetected");
      v6->_touchScreenDetected = -[_AFModesConfigurationMutation getTouchScreenDetected](v5, "getTouchScreenDetected");
      v6->_buttonPressDetected = -[_AFModesConfigurationMutation getButtonPressDetected](v5, "getButtonPressDetected");
      v6->_flatDevicePosture = -[_AFModesConfigurationMutation getFlatDevicePosture](v5, "getFlatDevicePosture");
      v6->_deviceOrientation = -[_AFModesConfigurationMutation getDeviceOrientation](v5, "getDeviceOrientation");
      v6->_isInWorkout = -[_AFModesConfigurationMutation getIsInWorkout](v5, "getIsInWorkout");
      v6->_isBacklightOn = -[_AFModesConfigurationMutation getIsBacklightOn](v5, "getIsBacklightOn");
      v6->_isInWaterLock = -[_AFModesConfigurationMutation getIsInWaterLock](v5, "getIsInWaterLock");
      v6->_isInSleepLock = -[_AFModesConfigurationMutation getIsInSleepLock](v5, "getIsInSleepLock");
      v6->_isInTheaterMode = -[_AFModesConfigurationMutation getIsInTheaterMode](v5, "getIsInTheaterMode");
      v6->_isOnWrist = -[_AFModesConfigurationMutation getIsOnWrist](v5, "getIsOnWrist");
    }
    else
    {
      v6 = (AFModesConfiguration *)-[AFModesConfiguration copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFModesConfiguration *)-[AFModesConfiguration copy](self, "copy");
  }

  return v6;
}

@end
