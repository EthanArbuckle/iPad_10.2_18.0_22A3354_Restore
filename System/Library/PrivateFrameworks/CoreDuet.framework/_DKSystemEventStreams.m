@implementation _DKSystemEventStreams

+ (id)appInFocusStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/inFocus"));
}

+ (id)displayOrientationStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/display/orientation"));
}

+ (id)appUsageStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/usage"));
}

+ (id)appClipUsageStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/clipUsage"));
}

+ (id)appIntentsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/intents"));
}

+ (id)appLocationActivityStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/locationActivity"));
}

+ (id)appActivityStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/activity"));
}

+ (id)safariHistoryStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/safari/history"));
}

+ (id)appRelevantShortcutsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/relevantShortcuts"));
}

+ (id)discoverabilitySignalsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/discoverability/signals"));
}

+ (id)deviceIsPluggedInStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/device/isPluggedIn"));
}

+ (id)deviceActivityLevelStream
{
  void *v2;
  void *v3;

  +[_DKAnyIntegerCategory type](_DKAnyIntegerCategory, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("/activity/level"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appWebUsageStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/webUsage"));
}

+ (id)appMediaUsageStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/mediaUsage"));
}

+ (id)appInstallStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/install"));
}

+ (id)appViewedInDockStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/dockView"));
}

+ (id)widgetsViewedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/widgets/viewed"));
}

+ (id)notificationUsageStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/notification/usage"));
}

+ (id)focusModeStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/inferred/focusMode"));
}

+ (id)standbyTimerStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/standby/timer"));
}

+ (id)deviceActivityLevelFeedbackStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/activity/level/feedback"));
}

+ (id)doNotDisturbStream
{
  void *v2;
  void *v3;

  +[_DKBoolCategory type](_DKBoolCategory, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("/settings/doNotDisturb"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)airplaneModeStream
{
  void *v2;
  void *v3;

  +[_DKBoolCategory type](_DKBoolCategory, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("/system/airplaneMode"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nextEventForTopOffProtectionStream
{
  void *v2;
  void *v3;

  +[_DKAnyDoubleQuantity type](_DKAnyDoubleQuantity, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("/system/userWakingEvent"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)deviceIsLockedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/device/isLocked"));
}

+ (id)deviceIsLockedImputedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/device/isLockedImputed"));
}

+ (id)keybagIsLockedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/keybag/isLocked"));
}

+ (id)deviceBatteryPercentageStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/device/batteryPercentage"));
}

+ (id)deviceLowPowerModeStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/device/lowPowerMode"));
}

+ (id)alarmStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/clock/alarm"));
}

+ (id)timerStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/clock/timer"));
}

+ (id)airplayPredictionStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/airplay/prediction"));
}

+ (id)siriServiceStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/siri/service"));
}

+ (id)siriIntentEventStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/siri/intentEvent"));
}

+ (id)discoverabilityUsageStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/discoverability/usage"));
}

+ (id)diskSubsystemAccessStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/disk/subsystemAccess"));
}

+ (id)displayIsBacklit
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/display/isBacklit"));
}

+ (id)audioInputRouteStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/audio/inputRoute"));
}

+ (id)audioOutputRoutStream
{
  return (id)objc_msgSend((id)objc_opt_class(), "audioOutputRouteStream");
}

+ (id)audioOutputRouteStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/audio/outputRoute"));
}

+ (id)motionStream
{
  void *v2;
  void *v3;

  +[_DKAnyIntegerCategory type](_DKAnyIntegerCategory, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("/inferred/motion"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)locationVisitStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/inferred/locationVisit"));
}

+ (id)microLocationVisitStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/inferred/microLocationVisit"));
}

+ (id)locationCoordinatesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/location/coordinates"));
}

+ (id)calendarEventStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/calendar/eventTitle"));
}

+ (id)userIsFirstBacklightOnAfterWakeup
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/user/isFirstBacklightOnAfterWakeup"));
}

+ (id)carPlayIsConnectedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/carplay/isConnected"));
}

+ (id)bluetoothIsConnectedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/bluetooth/isConnected"));
}

+ (id)watchNearbyStream
{
  return +[_DKSystemEventStreams defaultPairedDeviceNearbyStream](_DKSystemEventStreams, "defaultPairedDeviceNearbyStream");
}

+ (id)defaultPairedDeviceNearbyStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/defaultPaired/nearby"));
}

+ (id)watchActiveStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/watch/active"));
}

+ (id)nowPlayingStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/media/nowPlaying"));
}

+ (id)callInProgressStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/call/inProgress"));
}

+ (id)homeKitSceneStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/homekit/scene"));
}

+ (id)homeKitAccessoryControlStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/homekit/accessoryControl"));
}

+ (id)homeKitAppViewStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/homekit/appView"));
}

+ (id)searchFeedbackStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/search/feedback"));
}

+ (id)tombstoneStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/event/tombstone"));
}

+ (id)internalQueryDataCollectionStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/internal/queryDataCollection"));
}

+ (id)pairedDeviceForecastStream
{
  void *v2;
  void *v3;

  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("PairedDeviceForecast"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)remoteDeviceInBedTimesStream
{
  void *v2;
  void *v3;

  +[_DKAnyIntegerCategory type](_DKAnyIntegerCategory, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("RemoteDeviceInBed"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appLaunchFeedbackStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/app/launchFeedback"));
}

+ (id)wifiConnectionStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/wifi/connection"));
}

+ (id)appDirectoryInteractionStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/userInteraction/appDirectory"));
}

+ (id)behavioralRuleFeaturesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/sharesheet/behavioralRuleFeatures"));
}

+ (id)peopleSuggesterOutputForSiriNLStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/peopleSuggester/siriNl"));
}

+ (id)familyPredictionStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/family/prediction"));
}

+ (id)deviceInUseProxyStream
{
  return +[_DKSystemEventStreams deviceIsLockedStream](_DKSystemEventStreams, "deviceIsLockedStream");
}

@end
