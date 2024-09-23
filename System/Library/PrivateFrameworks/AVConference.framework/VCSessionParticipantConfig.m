@implementation VCSessionParticipantConfig

- (void)dealloc
{
  void *spatialMetadata;
  __CFDictionary *spatialMetadataEntryMap;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  spatialMetadata = self->_spatialMetadata;
  if (spatialMetadata)
    CFRelease(spatialMetadata);

  -[VCSessionParticipantConfig cleanupNwActivity](self, "cleanupNwActivity");
  spatialMetadataEntryMap = self->_spatialMetadataEntryMap;
  if (spatialMetadataEntryMap)
    CFRelease(spatialMetadataEntryMap);

  v5.receiver = self;
  v5.super_class = (Class)VCSessionParticipantConfig;
  -[VCSessionParticipantConfig dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%p] idsParticipantID[%llu] participantUUID[%@] audioEnabled[%d] videoEnabled[%d] screenEnabled[%d] videoPaused[%d] videoQuality[%d] visibilityIndex[%d] prominenceIndex[%d] positionalInfo[%p] mediaStates[%p]"), NSStringFromClass(v4), self, self->_idsParticipantID, self->_uuid, self->_audioEnabled, self->_videoEnabled, self->_screenEnabled, self->_videoPaused, self->_videoQuality, self->_visibilityIndex, self->_prominenceIndex, self->_positionalInfo, self->_mediaStates);
}

- (void)spatialMetadata
{
  return self->_spatialMetadata;
}

- (void)setSpatialMetadata:(void *)a3
{
  void *spatialMetadata;
  void *v6;

  spatialMetadata = self->_spatialMetadata;
  if (spatialMetadata != a3)
  {
    if (spatialMetadata)
      CFRelease(spatialMetadata);
    if (a3)
      v6 = (void *)CFRetain(a3);
    else
      v6 = 0;
    self->_spatialMetadata = v6;
  }
}

- (void)setNwActivity:(id)a3
{
  OS_nw_activity *nwActivity;

  nwActivity = self->_nwActivity;
  if (nwActivity)
    nw_release(nwActivity);
  self->_nwActivity = (OS_nw_activity *)a3;
  if (a3)
    nw_retain(a3);
}

- (void)cleanupNwActivity
{
  OS_nw_activity *nwActivity;

  nwActivity = self->_nwActivity;
  if (nwActivity)
  {
    nw_release(nwActivity);
    self->_nwActivity = 0;
  }
}

- (__CFDictionary)spatialMetadataEntryMap
{
  return self->_spatialMetadataEntryMap;
}

- (void)setSpatialMetadataEntryMap:(__CFDictionary *)a3
{
  __CFDictionary *spatialMetadataEntryMap;

  spatialMetadataEntryMap = self->_spatialMetadataEntryMap;
  if (spatialMetadataEntryMap)
    CFRelease(spatialMetadataEntryMap);
  self->_spatialMetadataEntryMap = a3;
  if (a3)
    CFRetain(a3);
}

- (NSData)participantData
{
  return self->_participantData;
}

- (void)setParticipantData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)idsParticipantID
{
  return self->_idsParticipantID;
}

- (void)setIdsParticipantID:(unint64_t)a3
{
  self->_idsParticipantID = a3;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)screenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (BOOL)frequencyMeteringEnabled
{
  return self->_frequencyMeteringEnabled;
}

- (void)setFrequencyMeteringEnabled:(BOOL)a3
{
  self->_frequencyMeteringEnabled = a3;
}

- (BOOL)audioMuted
{
  return self->_audioMuted;
}

- (void)setAudioMuted:(BOOL)a3
{
  self->_audioMuted = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)audioPosition
{
  return self->_audioPosition;
}

- (void)setAudioPosition:(float)a3
{
  self->_audioPosition = a3;
}

- (BOOL)audioPaused
{
  return self->_audioPaused;
}

- (void)setAudioPaused:(BOOL)a3
{
  self->_audioPaused = a3;
}

- (BOOL)videoPaused
{
  return self->_videoPaused;
}

- (void)setVideoPaused:(BOOL)a3
{
  self->_videoPaused = a3;
}

- (unsigned)videoQuality
{
  return self->_videoQuality;
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  self->_videoQuality = a3;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  self->_visibilityIndex = a3;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (void)setProminenceIndex:(unsigned int)a3
{
  self->_prominenceIndex = a3;
}

- (NSData)positionalInfo
{
  return self->_positionalInfo;
}

- (void)setPositionalInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (NSDictionary)mediaStates
{
  return self->_mediaStates;
}

- (void)setMediaStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (VCSessionMediaNegotiator)mediaNegotiator
{
  return self->_mediaNegotiator;
}

- (void)setMediaNegotiator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (VCSecurityKeyManager)securityKeyManager
{
  return self->_securityKeyManager;
}

- (void)setSecurityKeyManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (unsigned)transportSessionID
{
  return self->_transportSessionID;
}

- (void)setTransportSessionID:(unsigned int)a3
{
  self->_transportSessionID = a3;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void)setIdsDestination:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_isGKVoiceChat = a3;
}

- (BOOL)isLowLatencyAudio
{
  return self->_isLowLatencyAudio;
}

- (void)setIsLowLatencyAudio:(BOOL)a3
{
  self->_isLowLatencyAudio = a3;
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (void)setSessionMode:(int64_t)a3
{
  self->_sessionMode = a3;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_isOneToOneModeEnabled;
}

- (void)setIsOneToOneModeEnabled:(BOOL)a3
{
  self->_isOneToOneModeEnabled = a3;
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (VCAudioCaptionsCoordinator)captionsCoordinator
{
  return self->_captionsCoordinator;
}

- (void)setCaptionsCoordinator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (BOOL)isUplinkRetransmissionEnabled
{
  return self->_isUplinkRetransmissionEnabled;
}

- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3
{
  self->_isUplinkRetransmissionEnabled = a3;
}

- (BOOL)isOneToOneAuthenticationTagEnabled
{
  return self->_oneToOneAuthenticationTagEnabled;
}

- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthenticationTagEnabled = a3;
}

- (BOOL)isEnhancedJBAdaptationsEnabled
{
  return self->_isEnhancedJBAdaptationsEnabled;
}

- (void)setIsEnhancedJBAdaptationsEnabled:(BOOL)a3
{
  self->_isEnhancedJBAdaptationsEnabled = a3;
}

- (BOOL)enableMaxCameraBitrateVideoQualityV2
{
  return self->_enableMaxCameraBitrateVideoQualityV2;
}

- (void)setEnableMaxCameraBitrateVideoQualityV2:(BOOL)a3
{
  self->_enableMaxCameraBitrateVideoQualityV2 = a3;
}

- (BOOL)isHigherAudioREDCutoverU1Enabled
{
  return self->_isHigherAudioREDCutoverU1Enabled;
}

- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3
{
  self->_isHigherAudioREDCutoverU1Enabled = a3;
}

- (BOOL)screenControlEnabled
{
  return self->_screenControlEnabled;
}

- (void)setScreenControlEnabled:(BOOL)a3
{
  self->_screenControlEnabled = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (BOOL)isServerRTxEnabled
{
  return self->_isServerRTxEnabled;
}

- (void)setIsServerRTxEnabled:(BOOL)a3
{
  self->_isServerRTxEnabled = a3;
}

@end
