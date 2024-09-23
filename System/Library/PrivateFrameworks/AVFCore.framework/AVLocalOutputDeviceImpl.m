@implementation AVLocalOutputDeviceImpl

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_implSupportEventListener);
}

- (void)setImplEventListener:(id)a3
{
  objc_storeWeak((id *)&self->_implSupportEventListener, a3);
}

- (NSString)serialNumber
{
  return 0;
}

- (NSString)name
{
  return (NSString *)CFSTR("My Device");
}

- (NSString)modelID
{
  return 0;
}

- (NSString)manufacturer
{
  return 0;
}

- (NSData)identifyingMACAddress
{
  return 0;
}

- (NSString)firmwareVersion
{
  return 0;
}

- (int64_t)deviceType
{
  return 3;
}

- (int64_t)deviceSubType
{
  return 0;
}

- (unint64_t)deviceFeatures
{
  return 7;
}

- (NSString)ID
{
  return 0;
}

- (NSDictionary)airPlayProperties
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (unint64_t)hash
{
  return 0;
}

- (int64_t)clusterType
{
  return 0;
}

- (int64_t)configuredClusterSize
{
  return 0;
}

- (BOOL)isActivatedForContinuityScreen
{
  return 0;
}

- (NSArray)clusteredDeviceDescriptions
{
  return 0;
}

- (BOOL)isClusterLeader
{
  return 0;
}

- (NSString)clusterID
{
  return 0;
}

- (NSNumber)batteryLevel
{
  return 0;
}

- (NSNumber)caseBatteryLevel
{
  return 0;
}

- (NSNumber)leftBatteryLevel
{
  return 0;
}

- (NSNumber)rightBatteryLevel
{
  return 0;
}

- (NSNumber)supportsDataOverACLProtocol
{
  return 0;
}

- (NSNumber)isInEar
{
  return 0;
}

- (BOOL)isInUseByPairedDevice
{
  return 0;
}

- (BOOL)producesLowFidelityAudio
{
  return 0;
}

- (BOOL)isAppleAccessory
{
  return 1;
}

- (BOOL)isEligibleToBePredictedOutputDevice
{
  return 0;
}

- (NSArray)connectedPairedDevices
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)requiresAuthorization
{
  return 0;
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  return 0;
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  return 0;
}

- (BOOL)canAccessRemoteAssets
{
  return 1;
}

- (BOOL)canAccessAppleMusic
{
  return 0;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return 0;
}

- (BOOL)supportsBufferedAirPlay
{
  return 0;
}

- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;

  v5 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, 0);
  (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v5);
}

- (float)volume
{
  return 0.0;
}

- (BOOL)canSetVolume
{
  return 0;
}

- (int64_t)volumeControlType
{
  return 0;
}

- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3
{
  return 0.0;
}

- (BOOL)canMute
{
  return 0;
}

- (BOOL)isMuted
{
  return 0;
}

- (BOOL)canBeGrouped
{
  return 0;
}

- (NSString)groupID
{
  return 0;
}

- (NSString)proposedGroupID
{
  return 0;
}

- (BOOL)canBeGroupLeader
{
  return 0;
}

- (BOOL)isGroupLeader
{
  return 0;
}

- (BOOL)participatesInGroupPlayback
{
  return 0;
}

- (BOOL)groupContainsGroupLeader
{
  return 0;
}

- (NSString)logicalDeviceID
{
  return 0;
}

- (BOOL)isLogicalDeviceLeader
{
  return 0;
}

- (BOOL)canCommunicateWithAllLogicalDeviceMembers
{
  return 0;
}

- (BOOL)canRelayCommunicationChannel
{
  return 0;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return 1;
}

- (BOOL)canFetchMediaDataFromSender
{
  return 0;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return 0;
}

- (BOOL)supportsBluetoothSharing
{
  return 0;
}

- (int64_t)HAPConformance
{
  return 0;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return 0;
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  return 0;
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
  return 0;
}

- (NSString)headTrackedSpatialAudioMode
{
  return &AVOutputDeviceHeadTrackedSpatialAudioModeNever->isa;
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
  return 0;
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  return 0;
}

- (NSArray)availableBluetoothListeningModes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsConversationDetection
{
  return 0;
}

- (BOOL)isConversationDetectionEnabled
{
  return 0;
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
  return 0;
}

- (NSString)currentBluetoothListeningMode
{
  return 0;
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
  return 0;
}

- (void)configureUsingBlock:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;

  v6 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, uint64_t))a5 + 2))(a5, 1, 0, 0, v6);
}

- (BOOL)supportsFitnessDataDestination
{
  return 0;
}

- (BOOL)supportsScreenMirroringControls
{
  return 0;
}

- (NSArray)OEMIcons
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)OEMIconLabel
{
  return 0;
}

- (BOOL)OEMIconVisible
{
  return 0;
}

- (NSArray)outputDeviceHIDs
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)nightMode
{
  return 0;
}

- (BOOL)isNightModeSupported
{
  return 0;
}

- (BOOL)rightHandDrive
{
  return 0;
}

- (NSArray)limitedUIElements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)limitedUI
{
  return 0;
}

- (BOOL)carOwnsScreen
{
  return 0;
}

- (BOOL)ownsTurnByTurnNavigation
{
  return 0;
}

- (BOOL)recognizingSpeech
{
  return 0;
}

- (NSArray)supportedFeatures
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (int64_t)electronicTollCollection
{
  return 0;
}

- (int64_t)navigationAidedDriving
{
  return 0;
}

- (int64_t)transportType
{
  return 0;
}

- (NSData)MFiCertificateSerialNumber
{
  return 0;
}

- (id)requestTurnByTurnNavigationOwnership
{
  return 0;
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  return 0;
}

- (BOOL)siriForwardingEnabled
{
  return 0;
}

- (BOOL)carOwnsMainAudio
{
  return 0;
}

- (NSDictionary)displayCornerMasks
{
  return 0;
}

- (int64_t)voiceTriggerMode
{
  return 0;
}

- (int64_t)authenticationType
{
  return 0;
}

- (id)currentScreenViewAreaForScreenID:(id)a3
{
  return 0;
}

- (BOOL)isActivated
{
  return 0;
}

- (NSArray)screens
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSDictionary)outputDeviceInfo
{
  return 0;
}

- (AVOutputDeviceDelegate)delegate
{
  return 0;
}

- (AVOutputDeviceImplSupport)implEventListener
{
  return (AVOutputDeviceImplSupport *)objc_loadWeak((id *)&self->_implSupportEventListener);
}

@end
