@implementation AADeviceConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AADeviceConfig)init
{
  AADeviceConfig *v2;
  AADeviceConfig *v3;
  AADeviceConfig *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AADeviceConfig;
  v2 = -[AADeviceConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_spatialAudioMode = 255;
    v4 = v2;
  }

  return v3;
}

- (AADeviceConfig)initWithCoder:(id)a3
{
  id v4;
  AADeviceConfig *v5;
  id v6;
  AADeviceConfig *v7;

  v4 = a3;
  v5 = -[AADeviceConfig init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_acceptReplyPlayPauseConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_aclPriority = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_adaptiveVolumeConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_allowsAutoRoute = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_audioRouteHidden = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_autoANCStrength = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_clickHoldModeLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_clickHoldModeRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_conversationDetectConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_crownRotationDirection = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_declineDismissSkipConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_doubleTapActionLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_doubleTapActionRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_enableSiriMultitone = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_endCallConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_headGestureToggle = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_enableHeartRateMonitor = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_listeningMode = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_listeningModeConfigs = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_listeningModeOffAllowed = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_microphoneMode = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_muteControlConfig = 0;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent())
      v5->_placementMode = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_relinquishAudioRoute = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_selectiveSpeechListeningConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_smartRoutingMode = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_spatialAudioAllowed = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_spatialAudioMode = 0;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t autoANCStrength;
  uint64_t listeningMode;
  uint64_t listeningModeConfigs;
  NSString *name;
  int spatialAudioMode;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_acceptReplyPlayPauseConfig)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_aclPriority)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_adaptiveVolumeConfig)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_allowsAutoRoute)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_audioRouteHidden)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  autoANCStrength = self->_autoANCStrength;
  if ((_DWORD)autoANCStrength)
  {
    objc_msgSend(v10, "encodeInt64:forKey:", autoANCStrength, CFSTR("aaS"));
    v4 = v10;
  }
  if (self->_clickHoldModeLeft)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_clickHoldModeRight)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_conversationDetectConfig)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_crownRotationDirection)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_declineDismissSkipConfig)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_doubleTapActionLeft)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_doubleTapActionRight)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_enableSiriMultitone)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_endCallConfig)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_headGestureToggle)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_enableHeartRateMonitor)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  listeningMode = self->_listeningMode;
  if ((_DWORD)listeningMode)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", listeningMode, CFSTR("lsmd"));
    v4 = v10;
  }
  listeningModeConfigs = self->_listeningModeConfigs;
  if ((_DWORD)listeningModeConfigs)
  {
    objc_msgSend(v10, "encodeInt64:forKey:", listeningModeConfigs, CFSTR("lsmc"));
    v4 = v10;
  }
  if (self->_listeningModeOffAllowed)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_microphoneMode)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_muteControlConfig)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v10, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v10;
  }
  if (self->_placementMode)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_relinquishAudioRoute)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_selectiveSpeechListeningConfig)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_smartRoutingMode)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  if (self->_spatialAudioAllowed)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    v4 = v10;
  }
  spatialAudioMode = self->_spatialAudioMode;
  if (spatialAudioMode && spatialAudioMode != 255)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", spatialAudioMode, CFSTR("samd"));
    v4 = v10;
  }

}

- (id)description
{
  return -[AADeviceConfig descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  int clickHoldModeLeft;
  int clickHoldModeRight;
  id v15;
  id v16;
  id v17;
  int crownRotationDirection;
  const __CFString *v19;
  __CFString *v20;
  id v21;
  id v22;
  int doubleTapActionLeft;
  int doubleTapActionRight;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  NSString *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v47;
  __CFString *v48;
  void *v49;

  objc_msgSend((id)objc_opt_class(), "description");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v4 = 0;

  if (self->_acceptReplyPlayPauseConfig)
  {
    NSAppendPrintF_safe();
    v5 = v4;

    v4 = v5;
  }
  if (self->_aclPriority)
  {
    NSAppendPrintF_safe();
    v6 = v4;

    v4 = v6;
  }
  if (self->_adaptiveVolumeConfig)
  {
    NSAppendPrintF_safe();
    v7 = v4;

    v4 = v7;
  }
  if (self->_allowsAutoRoute)
  {
    NSAppendPrintF_safe();
    v8 = v4;

    v4 = v8;
  }
  if (self->_audioRouteHidden)
  {
    NSAppendPrintF_safe();
    v9 = v4;

    v4 = v9;
  }
  if (self->_autoANCStrength)
  {
    NSAppendPrintF_safe();
    v11 = v4;

    v4 = v11;
  }
  if (self->_bobbleConfig)
  {
    NSAppendPrintF_safe();
    v12 = v4;

    v4 = v12;
  }
  clickHoldModeLeft = self->_clickHoldModeLeft;
  clickHoldModeRight = self->_clickHoldModeRight;
  if (clickHoldModeLeft | clickHoldModeRight)
  {
    NSAppendPrintF_safe();
    v15 = v4;

    if (clickHoldModeLeft)
    {
      NSAppendPrintF_safe();
      v16 = v15;

      v15 = v16;
    }
    if (clickHoldModeRight)
    {
      NSAppendPrintF_safe();
      v4 = v15;

    }
    else
    {
      v4 = v15;
    }
  }
  if (self->_conversationDetectConfig)
  {
    NSAppendPrintF_safe();
    v17 = v4;

    v4 = v17;
  }
  crownRotationDirection = self->_crownRotationDirection;
  if (self->_crownRotationDirection)
  {
    v19 = CFSTR("?");
    if (crownRotationDirection == 1)
      v19 = CFSTR("BackToFront");
    if (crownRotationDirection == 2)
      v20 = CFSTR("FrontToBack");
    else
      v20 = (__CFString *)v19;
    v48 = v20;
    NSAppendPrintF_safe();
    v21 = v4;

    v4 = v21;
  }
  if (self->_declineDismissSkipConfig)
  {
    NSAppendPrintF_safe();
    v22 = v4;

    v4 = v22;
  }
  doubleTapActionLeft = self->_doubleTapActionLeft;
  doubleTapActionRight = self->_doubleTapActionRight;
  if (doubleTapActionLeft | doubleTapActionRight)
  {
    NSAppendPrintF_safe();
    v25 = v4;

    if (doubleTapActionLeft)
    {
      NSAppendPrintF_safe();
      v26 = v25;

      v25 = v26;
    }
    if (doubleTapActionRight)
    {
      NSAppendPrintF_safe();
      v4 = v25;

    }
    else
    {
      v4 = v25;
    }
  }
  if (self->_enableSiriMultitone)
  {
    NSAppendPrintF_safe();
    v27 = v4;

    v4 = v27;
  }
  if (self->_endCallConfig)
  {
    NSAppendPrintF_safe();
    v28 = v4;

    v4 = v28;
  }
  if (self->_headGestureToggle)
  {
    NSAppendPrintF_safe();
    v29 = v4;

    v4 = v29;
  }
  if (self->_headGestureProxCardShown)
  {
    NSAppendPrintF_safe();
    v30 = v4;

    v4 = v30;
  }
  if (self->_enableHeartRateMonitor)
  {
    NSAppendPrintF_safe();
    v31 = v4;

    v4 = v31;
  }
  if (self->_listeningMode)
  {
    NSAppendPrintF_safe();
    v32 = v4;

    v4 = v32;
  }
  if (self->_listeningModeConfigs)
  {
    CUPrintFlags32();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v33 = v4;

    v4 = v33;
  }
  if (self->_listeningModeOffAllowed)
  {
    NSAppendPrintF_safe();
    v34 = v4;

    v4 = v34;
  }
  if (self->_microphoneMode)
  {
    NSAppendPrintF_safe();
    v35 = v4;

    v4 = v35;
  }
  if (self->_muteControlConfig)
  {
    NSAppendPrintF_safe();
    v36 = v4;

    v4 = v36;
  }
  v37 = self->_name;
  if (v37)
  {
    NSAppendPrintF_safe();
    v38 = v4;

    v4 = v38;
  }

  if (self->_placementMode)
  {
    NSAppendPrintF_safe();
    v39 = v4;

    v4 = v39;
  }
  if (self->_relinquishAudioRoute)
  {
    NSAppendPrintF_safe();
    v40 = v4;

    v4 = v40;
  }
  if (self->_selectiveSpeechListeningConfig)
  {
    NSAppendPrintF_safe();
    v41 = v4;

    v4 = v41;
  }
  if (self->_smartRoutingMode)
  {
    NSAppendPrintF_safe();
    v42 = v4;

    v4 = v42;
  }
  if (self->_spatialAudioAllowed)
  {
    NSAppendPrintF_safe();
    v43 = v4;

    v4 = v43;
  }
  if (self->_spatialAudioMode != 255)
  {
    NSAppendPrintF_safe();
    v44 = v4;

    v4 = v44;
  }
  v45 = v4;

  return v45;
}

- (BOOL)needsUpdateToAAController
{
  return self->_autoANCStrength || self->_enableHeartRateMonitor || self->_enableSiriMultitone != 0;
}

- (BOOL)needsUpdateToDeviceCloudRecord
{
  return self->_headGestureToggle
      || self->_acceptReplyPlayPauseConfig
      || self->_declineDismissSkipConfig
      || _os_feature_enabled_impl() && self->_listeningModeOffAllowed;
}

- (unsigned)acceptReplyPlayPauseConfig
{
  return self->_acceptReplyPlayPauseConfig;
}

- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3
{
  self->_acceptReplyPlayPauseConfig = a3;
}

- (char)aclPriority
{
  return self->_aclPriority;
}

- (void)setAclPriority:(char)a3
{
  self->_aclPriority = a3;
}

- (unsigned)adaptiveVolumeConfig
{
  return self->_adaptiveVolumeConfig;
}

- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3
{
  self->_adaptiveVolumeConfig = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_autoANCStrength = a3;
}

- (char)allowsAutoRoute
{
  return self->_allowsAutoRoute;
}

- (void)setAllowsAutoRoute:(char)a3
{
  self->_allowsAutoRoute = a3;
}

- (char)audioRouteHidden
{
  return self->_audioRouteHidden;
}

- (void)setAudioRouteHidden:(char)a3
{
  self->_audioRouteHidden = a3;
}

- (unsigned)bobbleConfig
{
  return self->_bobbleConfig;
}

- (void)setBobbleConfig:(unsigned __int8)a3
{
  self->_bobbleConfig = a3;
}

- (unsigned)clickHoldModeLeft
{
  return self->_clickHoldModeLeft;
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  self->_clickHoldModeLeft = a3;
}

- (unsigned)clickHoldModeRight
{
  return self->_clickHoldModeRight;
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  self->_clickHoldModeRight = a3;
}

- (unsigned)conversationDetectConfig
{
  return self->_conversationDetectConfig;
}

- (void)setConversationDetectConfig:(unsigned __int8)a3
{
  self->_conversationDetectConfig = a3;
}

- (unsigned)crownRotationDirection
{
  return self->_crownRotationDirection;
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  self->_crownRotationDirection = a3;
}

- (unsigned)declineDismissSkipConfig
{
  return self->_declineDismissSkipConfig;
}

- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3
{
  self->_declineDismissSkipConfig = a3;
}

- (char)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (void)setDoubleTapActionLeft:(char)a3
{
  self->_doubleTapActionLeft = a3;
}

- (char)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (void)setDoubleTapActionRight:(char)a3
{
  self->_doubleTapActionRight = a3;
}

- (char)enableSiriMultitone
{
  return self->_enableSiriMultitone;
}

- (void)setEnableSiriMultitone:(char)a3
{
  self->_enableSiriMultitone = a3;
}

- (unsigned)endCallConfig
{
  return self->_endCallConfig;
}

- (void)setEndCallConfig:(unsigned __int8)a3
{
  self->_endCallConfig = a3;
}

- (char)headGestureToggle
{
  return self->_headGestureToggle;
}

- (void)setHeadGestureToggle:(char)a3
{
  self->_headGestureToggle = a3;
}

- (char)headGestureProxCardShown
{
  return self->_headGestureProxCardShown;
}

- (void)setHeadGestureProxCardShown:(char)a3
{
  self->_headGestureProxCardShown = a3;
}

- (char)enableHeartRateMonitor
{
  return self->_enableHeartRateMonitor;
}

- (void)setEnableHeartRateMonitor:(char)a3
{
  self->_enableHeartRateMonitor = a3;
}

- (int)listeningMode
{
  return self->_listeningMode;
}

- (void)setListeningMode:(int)a3
{
  self->_listeningMode = a3;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  self->_listeningModeConfigs = a3;
}

- (char)listeningModeOffAllowed
{
  return self->_listeningModeOffAllowed;
}

- (void)setListeningModeOffAllowed:(char)a3
{
  self->_listeningModeOffAllowed = a3;
}

- (char)microphoneMode
{
  return self->_microphoneMode;
}

- (void)setMicrophoneMode:(char)a3
{
  self->_microphoneMode = a3;
}

- (unsigned)muteControlConfig
{
  return self->_muteControlConfig;
}

- (void)setMuteControlConfig:(unsigned __int8)a3
{
  self->_muteControlConfig = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (char)placementMode
{
  return self->_placementMode;
}

- (void)setPlacementMode:(char)a3
{
  self->_placementMode = a3;
}

- (char)relinquishAudioRoute
{
  return self->_relinquishAudioRoute;
}

- (void)setRelinquishAudioRoute:(char)a3
{
  self->_relinquishAudioRoute = a3;
}

- (unsigned)selectiveSpeechListeningConfig
{
  return self->_selectiveSpeechListeningConfig;
}

- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3
{
  self->_selectiveSpeechListeningConfig = a3;
}

- (char)smartRoutingMode
{
  return self->_smartRoutingMode;
}

- (void)setSmartRoutingMode:(char)a3
{
  self->_smartRoutingMode = a3;
}

- (char)spatialAudioAllowed
{
  return self->_spatialAudioAllowed;
}

- (void)setSpatialAudioAllowed:(char)a3
{
  self->_spatialAudioAllowed = a3;
}

- (int)spatialAudioMode
{
  return self->_spatialAudioMode;
}

- (void)setSpatialAudioMode:(int)a3
{
  self->_spatialAudioMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
