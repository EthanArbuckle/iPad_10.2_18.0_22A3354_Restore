@implementation MRUStringsProvider

+ (id)localizedStringWithKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "mediaRemoteUIBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E581FBA8, CFSTR("MediaControls"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)spatialButtonTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_SPATIAL_AUDIO_TITLE"));
}

+ (NSString)notPlaying
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("MEDIA_CONTROLS_EMPTY_STATE_TITLE"));
}

+ (NSString)scrubberLive
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("SCRUBBER_LIVE"));
}

+ (NSString)controlOtherSpeakers
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("CONTROL_OTHER_SPEAKERS"));
}

+ (NSString)controlOtherSpeakersMultipleLines
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("CONTROL_OTHER_SPEAKERS_MULTIPLE_LINES"));
}

+ (NSString)loading
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_LOADING_TITLE"));
}

+ (NSString)connecting
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_CONNECTING_TITLE"));
}

+ (NSString)notConnected
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_NOT_CONNECTED_TITLE"));
}

+ (NSString)controlsUnavailable
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("MEDIA_CONTROLS_CONTROLS_UNAVAILABLE"));
}

+ (NSString)airplayTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AIRPLAY_TITLE"));
}

+ (NSString)airPlayErrorTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AIRPLAY_ERROR_TITLE"));
}

+ (NSString)airplayErrorExternalDisplay
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AIRPLAY_ERROR_EXTERNAL_DISPLAY"));
}

+ (NSString)ok
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("OK_BUTTON_TITLE"));
}

+ (NSString)cancel
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("CANCEL"));
}

+ (NSString)explicitBadge
{
  return (NSString *)CFSTR("🅴");
}

+ (id)composedBy:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:", CFSTR("COMPOSED_BY_TITLE_%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)airPlayConnectionErrorMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("AIRPLAY_CONNECTION_ERROR_MESSAGE"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)transportLikeTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("LIKE_TRACK_DEFAULT_TITLE"));
}

+ (NSString)transportDislikeTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("DISLIKE_TRACK_DEFAULT_TITLE"));
}

+ (NSString)transportBookmarkTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BOOKMARK_TRACK_DEFAULT_TITLE"));
}

+ (NSString)routingHeaderSpeakersAndTVsTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_HEADER_SPEAKERS_AND_TVS_TITLE"));
}

+ (NSString)routingFooterShowMoreTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_FOOTER_SHOW_MORE_TITLE"));
}

+ (NSString)routingHijackConfirmTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_HIJACK_CONFIRM_TITLE"));
}

+ (NSString)routingHijackCancelTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_HIJACK_CANCEL_TITLE"));
}

+ (NSString)routingHijackSpeakerTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_HIJACK_SPEAKER_TITLE"));
}

+ (NSString)routingHijackSpeakerMessage
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_HIJACK_SPEAKER_MESSAGE"));
}

+ (NSString)routingHijackTVTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_HIJACK_TV_TITLE"));
}

+ (NSString)routingHijackTVMessage
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTING_HIJACK_TV_MESSAGE"));
}

+ (id)routingInUseOnPairedDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ROUTING_IN_USE_ON_PAIRED_DEVICE"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)routingHijackLocalTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ROUTING_HIJACK_LOCAL_TITLE"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)routingHijackLocalMessagePresentingApp:(id)a3 busyRouteName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ROUTING_HIJACK_LOCAL_MESSAGE"), CFSTR("%@ %@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSString)corianderTopOfListIndicator
{
  return (NSString *)CFSTR("Coriander: ");
}

+ (NSString)audioShaingActionTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SHARING_ACTION_TITLE"));
}

+ (NSString)audioSharingDisabledCarPlay
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SHARING_DISABLED_CARPLAY"));
}

+ (NSString)audioSharingDisabledCarPlaySameOwner
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SHARING_DISABLED_CARPLAY_SAME_OWNER"));
}

+ (NSString)audioShaingDisabledCarKit
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SHARING_DISABLED_CARKIT"));
}

+ (NSString)audioSharingDisabledCarKitSameOwner
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SHARING_DISABLED_CARKIT_SAME_OWNER"));
}

+ (id)accessoryBatteryLevelSingle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ACCESSORY_BATTERY_LEVEL_SINGLE"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)accessoryBatteryLevelLeft:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ACCESSORY_BATTERY_LEVEL_LEFT"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)accessoryBatteryLevelRight:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ACCESSORY_BATTERY_LEVEL_RIGHT"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)accessoryBatteryLevelCombinedLeft:(id)a3 right:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ACCESSORY_BATTERY_LEVEL_COMBINED"), CFSTR("%@ %@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)accessoryBatteryLevelCase:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ACCESSORY_BATTERY_LEVEL_CASE"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)volumeSpeaker
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_SPEAKER"));
}

+ (NSString)volumeSharing
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_SHARING"));
}

+ (NSString)volumeCarplay
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_CARPLAY"));
}

+ (NSString)volumeHearingDevice
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_HEARING_DEVICE"));
}

+ (NSString)volumeHeadphones
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_HEADPHONES"));
}

+ (NSString)volumeBluetooth
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_BLUETOOTH"));
}

+ (NSString)volumeAirPods
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_AIRPODS"));
}

+ (NSString)volumeBeats
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_BEATS"));
}

+ (NSString)volumeBeatsSolo
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_BEATS_SOLO"));
}

+ (NSString)volumeBeatsSoloPro
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_BEATS_SOLO_PRO"));
}

+ (NSString)volumeBeatsStudio
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_BEATS_STUDIO"));
}

+ (NSString)volumeBeatsX
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_BEATS_X"));
}

+ (NSString)volumePowerbeats
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_POWERBEATS"));
}

+ (NSString)volumeBeatsFlex
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_BEATS_FLEX"));
}

+ (NSString)volumeB494
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:inTable:", CFSTR("VOLUME_B494"), CFSTR("MediaControls-B494"));
}

+ (NSString)volumeAirPlay
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_AIRPLAY"));
}

+ (NSString)volumeAppleTV
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_APPLE_TV"));
}

+ (id)volumeTV
{
  return (id)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_TV"));
}

+ (NSString)volumeHomePod
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VOLUME_HOMEPOD"));
}

+ (id)volumeTVWithDeviceCount:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "localizedStringWithKey:count:", CFSTR("MATCHPOINT_TV"), a3);
}

+ (NSString)spatializeStereoButtonTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("SPATIALIZE_STEREO_TITLE"));
}

+ (NSString)spatialButtonSubtitleOn
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_SPATIAL_AUDIO_ON"));
}

+ (NSString)spatialButtonSubtitleOff
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_SPATIAL_AUDIO_OFF"));
}

+ (NSString)spatialButtonSubtitleHeadTracked
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_SPATIAL_HEAD_TRACKED"));
}

+ (NSString)spatialButtonNotAvailable
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_SPATIAL_NOT_AVAILABLE"));
}

+ (NSString)bestAvailableAudioFormatMulitchannel
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BEST_AVAILABLE_AUDIO_FORMAT_MULTICHANNEL"));
}

+ (NSString)bestAvailableAudioFormatAtmos
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BEST_AVAILABLE_AUDIO_FORMAT_ATMOS"));
}

+ (NSString)audioSessionRenderingModeMonoStereo
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SESSION_RENDERING_MODE_MONO_STEREO"));
}

+ (NSString)audioSessionRenderingModeSurround
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SESSION_RENDERING_MODE_SURROUND"));
}

+ (NSString)audioSessionRenderingModeSpatialAudio
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SESSION_RENDERING_MODE_SPATIAL_AUDIO"));
}

+ (NSString)audioSessionRenderingModeDolbyAudio
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SESSION_RENDERING_MODE_DOLBY_AUDIO"));
}

+ (NSString)audioSessionRenderingModeDolbyAtmos
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("AUDIO_SESSION_RENDERING_MODE_DOLBY_ATMOS"));
}

+ (NSString)listeningModeTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_NOISE_CONTROL_TITLE"));
}

+ (NSString)listeningModeNoiseCancellation
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_NOISE_CANCELLATION_TITLE"));
}

+ (NSString)listeningModeOff
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_OFF_TITLE"));
}

+ (NSString)listeningModeAutomatic
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_AUTOMATIC_TITLE"));
}

+ (NSString)listeningModeTransparency
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_TRANSPARENCY_TITLE"));
}

+ (NSString)listeningModeErrorMessage
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR"));
}

+ (NSString)listeningModeErrorMessageB507
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR_B507"));
}

+ (NSString)listeningModeErrorMessageB515
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("BLUETOOTH_LISTENING_MODE_REQUIRES_ON_HEAD_B515"));
}

+ (NSString)listeningModeErrorMessageB494
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:inTable:", CFSTR("BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR_B494"), CFSTR("MediaControls-B494"));
}

+ (NSString)listeningModeErrorMessageB607
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:inTable:", CFSTR("BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR_B607"), CFSTR("MediaControls-B607"));
}

+ (NSString)conversationAwarenessTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("CONVERSATION_DETECTION_TITLE"));
}

+ (NSString)conversationAwarenessOff
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("CONVERSATION_DETECTION_STATE_OFF"));
}

+ (NSString)conversationAwarenessOn
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("CONVERSATION_DETECTION_STATE_ON"));
}

+ (NSString)screenMirroring
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("MIRRORING_TITLE"));
}

+ (NSString)stopMirroring
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("MIRRORING_STOP"));
}

+ (NSString)vendorSpecificAirPlay
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VENDOR_SPECIFIC_AIRPLAY"));
}

+ (NSString)vendorSpecificGroupMultiRoutes
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VENDOR_SPECIFIC_GROUP_MULTI_ROUTES"));
}

+ (NSString)groupSessionEndTitle
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("GROUP_SESSION_END_TITLE"));
}

+ (NSString)groupSessionEndBody
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("GROUP_SESSION_END_BODY"));
}

+ (NSString)groupSessionEndConfirm
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("GROUP_SESSION_END_CONFIRM"));
}

+ (NSString)groupSessionEndCancel
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("GROUP_SESSION_END_CANCEL"));
}

+ (NSString)routeRecommendationTapToAirPlay
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_RECOMMENDATION_TAP_TO_AIRPLAY"));
}

+ (NSString)routeRecommendationAirPlayConnected
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_RECOMMENDATION_AIRPLAY_CONNECTED"));
}

+ (id)routeRecommendationAddWithFormattedExistingRouteName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_RECOMMENDATION_ADD_TO_EXISTING_%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)vendorSpecificRouteConnectWith:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VENDOR_SPECIFIC_ROUTE_CONNECT_WITH_%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)vendorSpecificRouteConnectedWith:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VENDOR_SPECIFIC_ROUTE_CONNECTED_WITH_%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)vendorSpecificGroupConnectWith:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VENDOR_SPECIFIC_GROUP_CONNECT_WITH_%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)vendorSpecificGroupConnectedWith:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedStringWithKey:", CFSTR("VENDOR_SPECIFIC_GROUP_CONNECTED_WITH_%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)routeNameEllipsisString
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_NAME_CENTER_TRUNCATING_SEPARATOR"));
}

+ (NSString)routeNamePlusSeparator
{
  return (NSString *)objc_msgSend(a1, "localizedStringWithKey:", CFSTR("ROUTE_NAME_PLUS_SEPARATOR"));
}

+ (id)routeName:(id)a3 plusCount:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ROUTE_NAME_PLUS_COUNT"), CFSTR("%@ %lu"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)routeNameArrowFormat:(id)a3 rightSideText:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ROUTE_NAME_ARROW_FORMAT"), CFSTR("%@ %@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)nowPlayingSiriSuggestion:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedUppercaseStringWithKey:expectedFormat:", CFSTR("NOW_PLAYING_SIRI_SUGGESTION"), CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)routeNameHeadphonesCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", CFSTR("ROUTE_NAME_HEADPHONES_COUNT"), CFSTR("%lu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localizedNameForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (localizedNameForBundleIdentifier__onceToken != -1)
  {
    dispatch_once(&localizedNameForBundleIdentifier__onceToken, &__block_literal_global);
    if (v4)
      goto LABEL_3;
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!v3)
    goto LABEL_9;
LABEL_3:
  objc_msgSend((id)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithApplicationIdentifier:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E581FBA8;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    objc_msgSend((id)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers, "setObject:forKey:", v10, v4);
  }
  objc_msgSend((id)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

uint64_t __55__MRUStringsProvider_localizedNameForBundleIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers;
  localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers = (uint64_t)v0;

  return objc_msgSend((id)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers, "setCountLimit:", 50);
}

+ (id)localizedUppercaseStringWithKey:(id)a3 expectedFormat:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "localizedStringWithKey:expectedFormat:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedUppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)localizedStringWithKey:(id)a3 inTable:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "mediaRemoteUIBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_1E581FBA8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)localizedStringWithKey:(id)a3 count:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a3;
  objc_msgSend(v6, "mediaRemoteUIBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_1E581FBA8, CFSTR("MediaControls"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
