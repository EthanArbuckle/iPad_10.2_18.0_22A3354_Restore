@implementation VKWalkAssistManager

- (VKWalkAssistManager)init
{
  VKWalkAssistManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  AVAudioPlayer *audioPlayer;
  NSObject *v8;
  VKWalkAssistHapticEngine *v9;
  VKWalkAssistHapticEngine *hapticEngine;
  VKWalkAssistHeadingManager *v11;
  VKWalkAssistHeadingManager *headingManager;
  VKToneGenerator *v13;
  VKWalkAssistFeedbackProcessor *v14;
  VKWalkAssistFeedbackProcessor *feedbackProcessor;
  VKWalkAssistStatus *v16;
  VKWalkAssistStatus *assistStatus;
  VKWalkAssistManager *v18;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)VKWalkAssistManager;
  v2 = -[VKWalkAssistManager init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("point_reached"), CFSTR("aiff"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1848]), "initWithContentsOfURL:error:", v4, &v20);
    v6 = v20;
    audioPlayer = v2->_audioPlayer;
    v2->_audioPlayer = (AVAudioPlayer *)v5;

    if (v6)
    {
      AXLogTemp();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_232B35000, v8, OS_LOG_TYPE_INFO, "Cannot read audio file: %@", buf, 0xCu);
      }

    }
    v9 = objc_alloc_init(VKWalkAssistHapticEngine);
    hapticEngine = v2->_hapticEngine;
    v2->_hapticEngine = v9;

    v11 = -[VKWalkAssistHeadingManager initWithHapticEngineDelegate:]([VKWalkAssistHeadingManager alloc], "initWithHapticEngineDelegate:", v2->_hapticEngine);
    headingManager = v2->_headingManager;
    v2->_headingManager = v11;

    v13 = -[VKToneGenerator initWithHapticEngineDelegate:]([VKToneGenerator alloc], "initWithHapticEngineDelegate:", v2->_hapticEngine);
    v14 = -[VKWalkAssistFeedbackProcessor initWithToneGenerator:]([VKWalkAssistFeedbackProcessor alloc], "initWithToneGenerator:", v13);
    feedbackProcessor = v2->_feedbackProcessor;
    v2->_feedbackProcessor = v14;

    v16 = -[VKWalkAssistStatus initWithArrivalRadius:delegate:]([VKWalkAssistStatus alloc], "initWithArrivalRadius:delegate:", v2, 8.0);
    assistStatus = v2->_assistStatus;
    v2->_assistStatus = v16;

    v18 = v2;
  }

  return v2;
}

- (void)start
{
  void *v3;
  void *v4;

  -[VKWalkAssistManager setRunning:](self, "setRunning:", 1);
  -[VKWalkAssistManager hapticEngine](self, "hapticEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[VKWalkAssistManager feedbackProcessor](self, "feedbackProcessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldPlayAudio:", 1);

  -[VKWalkAssistManager _startObservingNavigationUpdates](self, "_startObservingNavigationUpdates");
}

- (void)stop
{
  void *v3;
  void *v4;

  -[VKWalkAssistManager setRunning:](self, "setRunning:", 0);
  -[VKWalkAssistManager hapticEngine](self, "hapticEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[VKWalkAssistManager feedbackProcessor](self, "feedbackProcessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopProcessing");

  -[VKWalkAssistManager _stopObservingNavigationUpdates](self, "_stopObservingNavigationUpdates");
}

- (BOOL)isInWalkingNavigatingState
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE6B568], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInNavigatingState"))
  {
    objc_msgSend(MEMORY[0x24BE6B568], "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "navigationTransportType") == 2;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_startObservingNavigationUpdates
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6B568], "sharedService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

}

- (void)_stopObservingNavigationUpdates
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6B568], "sharedService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (id)_startRouteLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE6B568], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "steps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pointAtRouteCoordinate:", objc_msgSend(v7, "startRouteCoordinate"));
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "maneuverRoadName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKWalkAssistManager setStartRouteRoadName:](self, "setStartRouteRoadName:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B560]), "initWithLatitude:longitude:", v9, v11);
  return v13;
}

- (void)_queueAssistStatusAnnouncement:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[VKWalkAssistManager lastAssistStatusAnnouncement](self, "lastAssistStatusAnnouncement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", v8);

    if ((v5 & 1) == 0)
    {
      +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearOutputQueue");

      +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queueOutput:", v8);

    }
  }
  -[VKWalkAssistManager setLastAssistStatusAnnouncement:](self, "setLastAssistStatusAnnouncement:", v8);

}

- (void)navigationService:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  double v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  if (UIAccessibilityIsVoiceOverRunning() || self->_arrived)
  {
    -[VKWalkAssistManager headingManager](self, "headingManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[VKWalkAssistManager bearing](self, "bearing");
    objc_msgSend(v9, "updateHeading:bearing:", a4, v7);

  }
  else
  {
    -[VKWalkAssistManager stop](self, "stop");
    AXLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232B35000, v8, OS_LOG_TYPE_DEFAULT, "Unable to continue walk assist without VoiceOver", buf, 2u);
    }

  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL8 v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];

  v5 = a4;
  if (UIAccessibilityIsVoiceOverRunning() || self->_arrived)
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&navigationService_didUpdateMatchedLocation__LastProcessTime >= 0.5)
    {
      navigationService_didUpdateMatchedLocation__LastProcessTime = CFAbsoluteTimeGetCurrent();
      -[VKWalkAssistManager _startRouteLocation](self, "_startRouteLocation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKWalkAssistManager _bearingFromCurrentLocation:toEndLocation:](self, "_bearingFromCurrentLocation:toEndLocation:", v5, v6);
      -[VKWalkAssistManager setBearing:](self, "setBearing:");
      -[VKWalkAssistManager assistStatus](self, "assistStatus");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKWalkAssistManager headingManager](self, "headingManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKWalkAssistManager feedbackProcessor](self, "feedbackProcessor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "speed");
      v11 = v10 <= 0.35;
      objc_msgSend(v5, "coordinate");
      objc_msgSend(v5, "coordinate");
      objc_msgSend(v6, "coordinate");
      objc_msgSend(v6, "coordinate");
      GEOCalculateDistance();
      v13 = v12;
      v14 = objc_msgSend(v8, "isFacingStartLocation");
      v15 = objc_msgSend(v8, "isFacingStartLocation");
      objc_msgSend(v9, "processPulseFeedbackForDistance:shouldProcessHapticPulse:", (int)v13, v14);
      objc_msgSend(v7, "updateAssistStatusWithCurrentDistance:startRouteRoadName:isFacingStartLocation:isStationary:", self->_startRouteRoadName, v15, v11, v13);

    }
  }
  else
  {
    -[VKWalkAssistManager stop](self, "stop");
    AXLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_232B35000, v16, OS_LOG_TYPE_DEFAULT, "Unable to continue walk assist without VoiceOver", v17, 2u);
    }

  }
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  if (a4 != 2)
    -[VKWalkAssistManager stop](self, "stop", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  if (a5 < 4)
  {
    v8 = v7;
    -[VKWalkAssistManager stop](self, "stop");
LABEL_5:
    v7 = v8;
    goto LABEL_6;
  }
  if (a5 - 4 < 3)
  {
    v8 = v7;
    -[VKWalkAssistManager start](self, "start");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)navigationService:(id)a3 didReroute:(id)a4
{
  if (self->_arrived)
    -[VKWalkAssistManager setArrived:](self, "setArrived:", 0, a4);
}

- (double)_bearingFromCurrentLocation:(id)a3 toEndLocation:(id)a4
{
  id v5;
  id v6;
  double result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "coordinate");
  objc_msgSend(v6, "coordinate");

  objc_msgSend(v5, "coordinate");
  objc_msgSend(v5, "coordinate");

  GEOBearingFromCoordinateToCoordinate();
  return result;
}

- (void)didArrive:(BOOL)a3
{
  if (a3)
  {
    -[AVAudioPlayer play](self->_audioPlayer, "play");
    -[VKWalkAssistManager setArrived:](self, "setArrived:", 1);
    -[VKWalkAssistManager stop](self, "stop");
  }
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)hasArrived
{
  return self->_arrived;
}

- (void)setArrived:(BOOL)a3
{
  self->_arrived = a3;
}

- (double)bearing
{
  return self->_bearing;
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
}

- (VKWalkAssistHeadingManager)headingManager
{
  return self->_headingManager;
}

- (void)setHeadingManager:(id)a3
{
  objc_storeStrong((id *)&self->_headingManager, a3);
}

- (VKWalkAssistStatus)assistStatus
{
  return self->_assistStatus;
}

- (void)setAssistStatus:(id)a3
{
  objc_storeStrong((id *)&self->_assistStatus, a3);
}

- (VKWalkAssistFeedbackProcessor)feedbackProcessor
{
  return self->_feedbackProcessor;
}

- (void)setFeedbackProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackProcessor, a3);
}

- (VKWalkAssistHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
  objc_storeStrong((id *)&self->_hapticEngine, a3);
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (NSString)lastAssistStatusAnnouncement
{
  return self->_lastAssistStatusAnnouncement;
}

- (void)setLastAssistStatusAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_lastAssistStatusAnnouncement, a3);
}

- (NSString)startRouteRoadName
{
  return self->_startRouteRoadName;
}

- (void)setStartRouteRoadName:(id)a3
{
  objc_storeStrong((id *)&self->_startRouteRoadName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startRouteRoadName, 0);
  objc_storeStrong((id *)&self->_lastAssistStatusAnnouncement, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_feedbackProcessor, 0);
  objc_storeStrong((id *)&self->_assistStatus, 0);
  objc_storeStrong((id *)&self->_headingManager, 0);
}

@end
