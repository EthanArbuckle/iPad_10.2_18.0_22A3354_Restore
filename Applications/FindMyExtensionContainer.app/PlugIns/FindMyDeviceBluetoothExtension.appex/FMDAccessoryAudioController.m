@implementation FMDAccessoryAudioController

- (FMDAccessoryAudioController)init
{
  FMDAccessoryAudioController *v2;
  id v3;
  NSObject *v4;
  FMDBluetoothSessionInterface *v5;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[8];
  objc_super v16;
  _QWORD v17[2];

  v16.receiver = self;
  v16.super_class = (Class)FMDAccessoryAudioController;
  v2 = -[FMDAccessoryAudioController init](&v16, "init");
  v3 = sub_100007584();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: init", v15, 2u);
  }

  if (v2)
  {
    v5 = objc_opt_new(FMDBluetoothSessionInterface);
    -[FMDAccessoryAudioController setBluetoothSessionInterface:](v2, "setBluetoothSessionInterface:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController bluetoothSessionInterface](v2, "bluetoothSessionInterface"));
    objc_msgSend(v6, "startSession");

    v7 = objc_alloc_init((Class)NSMutableArray);
    -[FMDAccessoryAudioController setMonitoredAccessories:](v2, "setMonitoredAccessories:", v7);

    v8 = objc_opt_new(NSMutableDictionary);
    -[FMDAccessoryAudioController setMonitoredAccessoriesCompletionBlocks:](v2, "setMonitoredAccessoriesCompletionBlocks:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    v17[0] = AVSystemController_ActiveAudioRouteDidChangeNotification;
    v17[1] = AVSystemController_PickableRoutesDidChangeNotification;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    objc_msgSend(v9, "setAttribute:forKey:error:", v10, AVSystemController_SubscribeToNotificationsAttribute, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "routeChanged:", AVSystemController_ActiveAudioRouteDidChangeNotification, v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, "pickableRoutesChangedNotification:", AVSystemController_PickableRoutesDidChangeNotification, v9);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAVRouteControllerFactory routeController](FMDAVRouteControllerFactory, "routeController"));
    objc_msgSend(v13, "initializeNotifications");

  }
  return v2;
}

- (void)startPlayingSoundForAccessory:(id)a3 channels:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  int v30;
  uint64_t v31;
  void *v32;
  OriginalSwitchesState *v33;
  double v34;
  id v35;
  NSObject *v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  unsigned int v41;
  void *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  unsigned int v48;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)os_transaction_create(objc_msgSend(CFSTR("PlaySoundTransaction"), "UTF8String"));
  -[FMDAccessoryAudioController setSoundTransaction:](self, "setSoundTransaction:", v11);

  if (-[FMDAccessoryAudioController isSoundPlaying](self, "isSoundPlaying"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioRoutingIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "audioRoutingIdentifier"));
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    if (v15)
    {
      v16 = sub_100007584();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Sound already playing updating pan", buf, 2u);
      }

      -[FMDAccessoryAudioController setPanForChannels:](self, "setPanForChannels:", v9);
      if (v10)
        v10[2](v10, 0);
    }
    else
    {
      v20 = objc_alloc((Class)NSError);
      v21 = kFMDAccessoryPlaySoundErrorDomain;
      v43 = NSLocalizedFailureReasonErrorKey;
      v44 = CFSTR("FMDAccessoryAudioController only one sound can play at the time, stop sound before playing");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
      v23 = objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 1, v22);

      if (v10)
        ((void (**)(id, id))v10)[2](v10, v23);

    }
  }
  else
  {
    -[FMDAccessoryAudioController setLastAccessory:](self, "setLastAccessory:", v8);
    v18 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController setupAudioSession](self, "setupAudioSession"));
    if (v18)
    {
      v19 = (void *)v18;
      v10[2](v10, v18);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioRoutingIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController routeForAccessoryIdentifier:](self, "routeForAccessoryIdentifier:", v24));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController pickRoute:](self, "pickRoute:", v25));
      v26 = sub_100007584();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v28 = v27;
      if (v19)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_100012E20();

        ((void (**)(id, void *))v10)[2](v10, v19);
      }
      else
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = *(double *)&v25;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController accessory currently picked route = %@", buf, 0xCu);
        }

        -[FMDAccessoryAudioController setMaxVolumeForRoute:](self, "setMaxVolumeForRoute:", v25);
        v30 = v29;
        v31 = -[FMDAccessoryAudioController bypassAllListeningModesForAccessory:](self, "bypassAllListeningModesForAccessory:", v8);
        -[FMDAccessoryAudioController setOriginalRoute:](self, "setOriginalRoute:", v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalState](self, "originalState"));

        if (!v32)
        {
          v33 = objc_opt_new(OriginalSwitchesState);
          LODWORD(v34) = v30;
          -[OriginalSwitchesState setVolume:](v33, "setVolume:", v34);
          -[OriginalSwitchesState setListeningMode:](v33, "setListeningMode:", v31);
          -[FMDAccessoryAudioController setOriginalState:](self, "setOriginalState:", v33);

        }
        v35 = sub_100007584();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalState](self, "originalState"));
          objc_msgSend(v37, "volume");
          v39 = v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalState](self, "originalState"));
          v41 = objc_msgSend(v40, "listeningMode");
          *(_DWORD *)buf = 134218240;
          v46 = v39;
          v47 = 1024;
          v48 = v41;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Original state - volume: %f listeningMode: %u", buf, 0x12u);

        }
        v10[2](v10, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioURL"));
        -[FMDAccessoryAudioController playSound:channels:](self, "playSound:channels:", v42, v9);

      }
    }

  }
}

- (void)stopPlayingForAccessory:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a4;
  if (-[FMDAccessoryAudioController isSoundPlaying](self, "isSoundPlaying"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000ACBC;
    v6[3] = &unk_100021548;
    v6[4] = self;
    v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

- (void)playSound:(id)a3 channels:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  int v26;
  int v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = sub_100007584();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Play sound for channels %@", buf, 0xCu);
  }

  v10 = v6;
  v32 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAudioPlayerFactory initWithContentsOfURL:error:](FMDAudioPlayerFactory, "initWithContentsOfURL:error:", v10, &v32));
  v12 = v32;
  -[FMDAccessoryAudioController setAudioPlayer:](self, "setAudioPlayer:", v11);

  if (v12)
  {
    v13 = sub_100007584();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v10;
      v35 = 2112;
      v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error reading the sound URL %@ falling back to default %@", buf, 0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pathForResource:ofType:", CFSTR("accessory_locateSound"), CFSTR("wav")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));
    v31 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAudioPlayerFactory initWithContentsOfURL:error:](FMDAudioPlayerFactory, "initWithContentsOfURL:error:", v17, &v31));
    v19 = v31;

    -[FMDAccessoryAudioController setAudioPlayer:](self, "setAudioPlayer:", v18);
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
  objc_msgSend(v20, "setNumberOfLoops:", -1);

  -[FMDAccessoryAudioController setPanForChannels:](self, "setPanForChannels:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
  objc_msgSend(v21, "prepareToPlay");

  -[FMDAccessoryAudioController setIsSoundPlaying:](self, "setIsSoundPlaying:", 1);
  -[FMDAccessoryAudioController setWasSoundPlayed:](self, "setWasSoundPlayed:", 1);
  LODWORD(v22) = 1.0;
  -[FMDAccessoryAudioController setVolumeTargetValue:](self, "setVolumeTargetValue:", v22);
  -[FMDAccessoryAudioController rampUpDuration](self, "rampUpDuration");
  -[FMDAccessoryAudioController setFadeDuration:](self, "setFadeDuration:");
  -[FMDAccessoryAudioController rampUpDuration](self, "rampUpDuration");
  if (v23 <= 0.0)
  {
    -[FMDAccessoryAudioController volumeTargetValue](self, "volumeTargetValue");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
    LODWORD(v29) = v27;
    objc_msgSend(v28, "setVolume:", v29);

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
    LODWORD(v25) = 0;
    objc_msgSend(v24, "setVolume:", v25);

    -[FMDAccessoryAudioController fade](self, "fade");
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
  objc_msgSend(v30, "play");

}

- (void)stopSound
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;

  v3 = sub_100007584();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping sound", (uint8_t *)&v29, 2u);
  }

  if (-[FMDAccessoryAudioController wasSoundPlayed](self, "wasSoundPlayed"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalState](self, "originalState"));

    if (v5)
    {
      -[FMDAccessoryAudioController setWasSoundPlayed:](self, "setWasSoundPlayed:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalState](self, "originalState"));
      objc_msgSend(v6, "volume");
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalRoute](self, "originalRoute"));
      LODWORD(v10) = v8;
      -[FMDAccessoryAudioController setVolume:forRoute:](self, "setVolume:forRoute:", v9, v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalState](self, "originalState"));
      v12 = objc_msgSend(v11, "listeningMode");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
      -[FMDAccessoryAudioController restoreListeningMode:forAccessory:](self, "restoreListeningMode:forAccessory:", v12, v13);

      v14 = sub_100007584();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController originalState](self, "originalState"));
        objc_msgSend(v16, "volume");
        v29 = 134217984;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AccessoryAudioController volume set back to original %f", (uint8_t *)&v29, 0xCu);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      objc_msgSend(v18, "stop");

      -[FMDAccessoryAudioController setAudioPlayer:](self, "setAudioPlayer:", 0);
      -[FMDAccessoryAudioController setSoundTransaction:](self, "setSoundTransaction:", 0);
      -[FMDAccessoryAudioController setOriginalState:](self, "setOriginalState:", 0);
      -[FMDAccessoryAudioController setOriginalRoute:](self, "setOriginalRoute:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController delegate](self, "delegate"));
      objc_msgSend(v19, "soundDidStop");

      if (qword_10002D800)
      {
        v20 = sub_100007584();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Stopping fade timer", (uint8_t *)&v29, 2u);
        }

        dispatch_source_cancel((dispatch_source_t)qword_10002D800);
        v22 = (void *)qword_10002D800;
        qword_10002D800 = 0;

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
      -[FMDAccessoryAudioController setLastAccessory:](self, "setLastAccessory:", 0);
      if (objc_msgSend(v23, "conformsToProtocol:", &OBJC_PROTOCOL___FMDAccessory))
      {
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accessoryIdentifier"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringValue"));
        objc_msgSend(v25, "soundStoppedForAccessoryIdentifier:", v27);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      objc_msgSend(v28, "setActive:withOptions:error:", 0, 1, 0);

    }
  }
}

- (void)setPanForChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  double v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("left")) & 1) != 0)
          v11 = -1;
        else
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("right"));
        v7 += v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v12 = sub_100007584();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[FMDAccessoryAudioController isSoundPlaying](self, "isSoundPlaying");
    *(_DWORD *)buf = 67109634;
    v23 = v14;
    v24 = 1024;
    v25 = v7;
    v26 = 2112;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Audio Player pan %i %i %@", buf, 0x18u);
  }

  *(float *)&v15 = (float)v7;
  -[FMDAccessoryAudioController setPanTargetValue:](self, "setPanTargetValue:", v15);
  if (-[FMDAccessoryAudioController isSoundPlaying](self, "isSoundPlaying"))
  {
    -[FMDAccessoryAudioController fade](self, "fade");
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
    *(float *)&v17 = (float)v7;
    objc_msgSend(v16, "setPan:", v17);

  }
}

- (id)routeForAccessoryIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v22 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAVRouteControllerFactory routeController](FMDAVRouteControllerFactory, "routeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryAudioController _audioCategory](FMDAccessoryAudioController, "_audioCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pickableRoutesForCategory:", v4));

  v6 = sub_100007584();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryAudioController _audioCategory](FMDAccessoryAudioController, "_audioCategory"));
    *(_DWORD *)buf = 138412546;
    v29 = v8;
    v30 = 2112;
    v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Category %@ Pickables routes %@", buf, 0x16u);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeID"));
        if (v16)
        {
          v17 = (void *)v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeID"));
          v19 = objc_msgSend(v18, "rangeOfString:", v22);

          if (v19 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = v15;

            v12 = v20;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)pickedRoute
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAVRouteControllerFactory routeController](FMDAVRouteControllerFactory, "routeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryAudioController _audioCategory](FMDAccessoryAudioController, "_audioCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pickableRoutesForCategory:", v3));

  v5 = sub_100007584();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Pickables routes %@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "currentlyPicked", (_QWORD)v16))
        {
          v14 = v13;

          v10 = v14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)pickRoute:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAVRouteControllerFactory routeController](FMDAVRouteControllerFactory, "routeController"));
  v5 = objc_msgSend(v4, "setPickedRoute:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = sub_100007584();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100012E84();

    v9 = objc_alloc((Class)NSError);
    v10 = kFMDAccessoryPlaySoundErrorDomain;
    v13 = NSLocalizedFailureReasonErrorKey;
    v14 = CFSTR("FMDAccessoryAudioController cannot route audio to accessory. Aborting");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v6 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 0, v11);

  }
  return v6;
}

- (id)setupAudioSession
{
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;

  v2 = sub_100007584();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Setting up audio session", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v24 = 0;
  objc_msgSend(v4, "setCategory:error:", AVAudioSessionCategoryFindMyDevice, &v24);
  v5 = v24;
  if (v5)
  {
    v6 = v5;
    v7 = sub_100007584();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session's audio category %@", buf, 0xCu);
    }

    v9 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v23 = 0;
  objc_msgSend(v4, "setPreferredIOBufferDuration:error:", &v23, 0.005);
  v11 = v23;
  if (v11)
  {
    v12 = v11;
    v13 = sub_100007584();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session's I/O buffer duration %@", buf, 0xCu);
    }

  }
  v22 = 0;
  objc_msgSend(v4, "setPreferredSampleRate:error:", &v22, 44100.0);
  v15 = v22;
  if (v15)
  {
    v16 = v15;
    v17 = sub_100007584();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session's preferred sample rate %@", buf, 0xCu);
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v21 = 0;
  objc_msgSend(v19, "setActive:error:", 1, &v21);
  v9 = v21;

  if (v9)
  {
    v20 = sub_100007584();
    v6 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session active, %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (BOOL)setVolume:(float)a3 forRoute:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  unsigned __int8 v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAVRouteControllerFactory routeController](FMDAVRouteControllerFactory, "routeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryAudioController _audioCategory](FMDAccessoryAudioController, "_audioCategory"));
  *(float *)&v8 = a3;
  v9 = objc_msgSend(v6, "setVolume:forCategory:route:", v7, v5, v8);

  return v9;
}

- (float)setMaxVolumeForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  double v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  float v18;
  float v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  double v24;

  v4 = a3;
  v20 = 0.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAVRouteControllerFactory routeController](FMDAVRouteControllerFactory, "routeController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryAudioController _audioCategory](FMDAccessoryAudioController, "_audioCategory"));
  v7 = objc_msgSend(v5, "getVolume:forCategory:route:", &v20, v6, v4);

  v8 = sub_100007584();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeID"));
      *(_DWORD *)buf = 138412546;
      v22 = v11;
      v23 = 2048;
      v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AccessoryAudioController %@ original volume %f", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_100012F68(v4, v10);
  }

  LODWORD(v12) = 1.0;
  v13 = -[FMDAccessoryAudioController setVolume:forRoute:](self, "setVolume:forRoute:", v4, v12);
  v14 = sub_100007584();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeID"));
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AccessoryAudioController %@ new volume 1.0f", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    sub_100012EE8(v4, v16);
  }

  v18 = v20;
  return v18;
}

- (void)fade
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  NSObject *v25;
  int v26;
  int v27;
  void *v28;
  double v29;
  id v30;
  NSObject *v31;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  float v39;
  double v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  _BOOL4 v45;
  void *v46;
  float v47;
  float v48;
  void *v49;
  double v50;
  id v51;
  NSObject *v52;
  int v53;
  int v54;
  void *v55;
  double v56;
  id v57;
  uint64_t v58;
  id v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  dispatch_source_t v69;
  void *v70;
  NSObject *v71;
  dispatch_time_t v72;
  NSObject *v73;
  char v74;
  id v75;
  NSObject *v76;
  void *v77;
  _QWORD handler[4];
  id v79;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));

  if (v3)
  {
    -[FMDAccessoryAudioController fadeDuration](self, "fadeDuration");
    v5 = 1.0 / (v4 * 15.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
    objc_msgSend(v6, "volume");
    v8 = v7;
    -[FMDAccessoryAudioController volumeTargetValue](self, "volumeTargetValue");
    v10 = vabds_f32(v8, v9);

    v11 = v5 < v10;
    if (v5 < v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      objc_msgSend(v12, "volume");
      v14 = v13;
      -[FMDAccessoryAudioController volumeTargetValue](self, "volumeTargetValue");
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      objc_msgSend(v17, "volume");
      v19 = v18;
      v20 = v5;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      v22 = v21;
      *(float *)&v23 = -v20;
      if (v14 <= v16)
        *(float *)&v23 = v5;
      *(float *)&v23 = v19 + *(float *)&v23;
      objc_msgSend(v21, "setVolume:", v23);

      v24 = sub_100007584();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        sub_100013134(self, v25, v5);

    }
    else
    {
      -[FMDAccessoryAudioController volumeTargetValue](self, "volumeTargetValue");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      LODWORD(v29) = v27;
      objc_msgSend(v28, "setVolume:", v29);

      v30 = sub_100007584();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        sub_100013208(self);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      objc_msgSend(v33, "volume");
      v35 = v34;

      if (v35 == 0.0)
        -[FMDAccessoryAudioController stopSound](self, "stopSound");
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
    objc_msgSend(v36, "pan");
    v38 = v37;
    -[FMDAccessoryAudioController panTargetValue](self, "panTargetValue");
    v40 = vabds_f32(v38, v39);

    if (v40 <= 0.0266666667)
    {
      -[FMDAccessoryAudioController panTargetValue](self, "panTargetValue");
      v54 = v53;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      LODWORD(v56) = v54;
      objc_msgSend(v55, "setPan:", v56);

      v57 = sub_100007584();
      v52 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        sub_1000130A8(self);
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      objc_msgSend(v41, "pan");
      v43 = v42;
      -[FMDAccessoryAudioController panTargetValue](self, "panTargetValue");
      v45 = v43 > v44;

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      objc_msgSend(v46, "pan");
      v48 = v47;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController audioPlayer](self, "audioPlayer"));
      *(float *)&v50 = v48 + flt_1000176E0[v45];
      objc_msgSend(v49, "setPan:", v50);

      v51 = sub_100007584();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        sub_10001301C(self);
      v11 = 1;
    }

    v58 = qword_10002D800;
    if (v11 && qword_10002D800 == 0)
    {
      v60 = sub_100007584();
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        sub_100012FE8(v61, v62, v63, v64, v65, v66, v67, v68);

      objc_initWeak(location, self);
      v69 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, (dispatch_queue_t)&_dispatch_main_q);
      v70 = (void *)qword_10002D800;
      qword_10002D800 = (uint64_t)v69;

      v71 = qword_10002D800;
      v72 = dispatch_time(0, 0);
      dispatch_source_set_timer(v71, v72, 0x3F940AEuLL, 0);
      v73 = qword_10002D800;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000C414;
      handler[3] = &unk_100021570;
      objc_copyWeak(&v79, location);
      dispatch_source_set_event_handler(v73, handler);
      dispatch_resume((dispatch_object_t)qword_10002D800);
      objc_destroyWeak(&v79);
      objc_destroyWeak(location);
      v58 = qword_10002D800;
    }
    if (v58)
      v74 = v11;
    else
      v74 = 1;
    if ((v74 & 1) == 0)
    {
      v75 = sub_100007584();
      v76 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Stopping fade timer", (uint8_t *)location, 2u);
      }

      dispatch_source_cancel((dispatch_source_t)qword_10002D800);
      v77 = (void *)qword_10002D800;
      qword_10002D800 = 0;

    }
  }
}

- (void)startMonitoringRoutableAccessory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, id);
  void *v16;
  void *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (-[FMDAccessoryAudioController isAccessoryBeingMonitored:](self, "isAccessoryBeingMonitored:", v6))
  {
    if (v7)
    {
      v8 = objc_alloc((Class)NSError);
      v9 = kFMDAccessoryPlaySoundErrorDomain;
      v18 = NSLocalizedFailureReasonErrorKey;
      v19 = CFSTR("FMDAccessoryAudioController is already monitoring that accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v11 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 2, v10);
      v7[2](v7, v11);

    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioRoutingIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController routeForAccessoryIdentifier:](self, "routeForAccessoryIdentifier:", v12));

    if (v13)
    {
      if (v7)
        v7[2](v7, 0);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessoriesCompletionBlocks](self, "monitoredAccessoriesCompletionBlocks"));
      v15 = objc_retainBlock(v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioRoutingIdentifier"));
      objc_msgSend(v14, "setObject:forKey:", v15, v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessories](self, "monitoredAccessories"));
      objc_msgSend(v17, "addObject:", v6);

    }
  }

}

- (void)stopMonitoringRoutableAccessory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, id);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  NSErrorUserInfoKey v33;
  const __CFString *v34;
  uint8_t buf[4];
  id v36;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = sub_100007584();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController stopMonitoringRoutableAccessory %@", buf, 0xCu);
  }

  if (-[FMDAccessoryAudioController isAccessoryBeingMonitored:](self, "isAccessoryBeingMonitored:", v6))
  {
    v27 = v7;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessories](self, "monitoredAccessories"));
    v11 = objc_msgSend(v10, "copy");

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "audioRoutingIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioRoutingIdentifier"));
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v19)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessories](self, "monitoredAccessories"));
            objc_msgSend(v24, "removeObject:", v16);

            v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessoriesCompletionBlocks](self, "monitoredAccessoriesCompletionBlocks"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "audioRoutingIdentifier"));
            objc_msgSend(v25, "removeObjectForKey:", v26);

            goto LABEL_16;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_16:

    v7 = v27;
    if (v27)
      v27[2](v27, 0);
  }
  else if (v7)
  {
    v20 = objc_alloc((Class)NSError);
    v21 = kFMDAccessoryPlaySoundErrorDomain;
    v33 = NSLocalizedFailureReasonErrorKey;
    v34 = CFSTR("FMDAccessoryAudioController is not monitoring that accessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v23 = objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 3, v22);
    v7[2](v7, v23);

  }
}

- (void)routeChanged:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController pickedRoute](self, "pickedRoute", a3));
  v5 = sub_100007584();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Route changed notification current route: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "audioRoutingIdentifier"));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeID"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeID"));
      v12 = objc_msgSend(v11, "rangeOfString:", v8);

      if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[FMDAccessoryAudioController isSoundPlaying](self, "isSoundPlaying"))
          goto LABEL_11;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessoriesCompletionBlocks](self, "monitoredAccessoriesCompletionBlocks"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v8));

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10000CB5C;
        v20[3] = &unk_100021598;
        v21 = v18;
        v16 = v18;
        -[FMDAccessoryAudioController stopMonitoringRoutableAccessory:completion:](self, "stopMonitoringRoutableAccessory:completion:", v19, v20);

        goto LABEL_10;
      }
    }
  }
  if (-[FMDAccessoryAudioController isSoundPlaying](self, "isSoundPlaying"))
  {
    v13 = sub_100007584();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Stopping sound for accessory %@", buf, 0xCu);

    }
    -[FMDAccessoryAudioController setRampDownDuration:](self, "setRampDownDuration:", 0.0);
    v16 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
    -[FMDAccessoryAudioController stopPlayingForAccessory:completion:](self, "stopPlayingForAccessory:completion:", v16, 0);
LABEL_10:

  }
LABEL_11:

}

- (void)pickableRoutesChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v4 = sub_100007584();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController pickableRoutesChangedNotification", buf, 2u);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessories](self, "monitoredAccessories"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "audioRoutingIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController routeForAccessoryIdentifier:](self, "routeForAccessoryIdentifier:", v12));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessoriesCompletionBlocks](self, "monitoredAccessoriesCompletionBlocks"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "audioRoutingIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v15));

          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_10000CF54;
          v29[3] = &unk_100021598;
          v30 = v16;
          v17 = v16;
          -[FMDAccessoryAudioController stopMonitoringRoutableAccessory:completion:](self, "stopMonitoringRoutableAccessory:completion:", v11, v29);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController pickedRoute](self, "pickedRoute"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "audioRoutingIdentifier"));

  if (!v20
    || (v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routeID"))) == 0
    || (v22 = (void *)v21,
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routeID")),
        v24 = objc_msgSend(v23, "rangeOfString:", v20),
        v23,
        v22,
        v24 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    if (-[FMDAccessoryAudioController isSoundPlaying](self, "isSoundPlaying"))
    {
      v25 = sub_100007584();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
        *(_DWORD *)buf = 138412290;
        v36 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Stopping sound for accessory %@", buf, 0xCu);

      }
      -[FMDAccessoryAudioController setRampDownDuration:](self, "setRampDownDuration:", 0.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController lastAccessory](self, "lastAccessory"));
      -[FMDAccessoryAudioController stopPlayingForAccessory:completion:](self, "stopPlayingForAccessory:completion:", v28, 0);

    }
  }

}

- (BOOL)isAccessoryBeingMonitored:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController monitoredAccessories](self, "monitoredAccessories", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "audioRoutingIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioRoutingIdentifier"));
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (id)_audioCategory
{
  id v2;
  NSObject *v3;
  int v5;
  const __CFString *v6;

  v2 = sub_100007584();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = CFSTR("FindMyAudioDevice");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Audio Category %@", (uint8_t *)&v5, 0xCu);
  }

  return CFSTR("FindMyAudioDevice");
}

- (int)bypassAllListeningModesForAccessory:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v4, "supportsChangingListeningMode"))
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController bluetoothSessionInterface](self, "bluetoothSessionInterface"));
    v6 = objc_msgSend(v5, "listeningModeForAccessory:timeout:", v4, 1.0);

    if (v6 != 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController bluetoothSessionInterface](self, "bluetoothSessionInterface"));
      objc_msgSend(v7, "updateListeningMode:accessory:", 1, v4);

    }
  }

  return v6;
}

- (void)restoreListeningMode:(int)a3 forAccessory:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v6, "supportsChangingListeningMode"))
  {
    v7 = sub_100007584();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if ((_DWORD)v4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109378;
        v10[1] = v4;
        v11 = 2112;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController restoring listening mode %u for accessory %@", (uint8_t *)v10, 0x12u);
      }

      v9 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryAudioController bluetoothSessionInterface](self, "bluetoothSessionInterface"));
      -[NSObject updateListeningMode:accessory:](v9, "updateListeningMode:accessory:", v4, v6);
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_1000132D0((uint64_t)v6, v9);
    }

  }
}

- (FMDAccessoryAudioControllerDelegate)delegate
{
  return (FMDAccessoryAudioControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)rampUpDuration
{
  return self->_rampUpDuration;
}

- (void)setRampUpDuration:(double)a3
{
  self->_rampUpDuration = a3;
}

- (double)rampDownDuration
{
  return self->_rampDownDuration;
}

- (void)setRampDownDuration:(double)a3
{
  self->_rampDownDuration = a3;
}

- (BOOL)isSoundPlaying
{
  return self->_isSoundPlaying;
}

- (void)setIsSoundPlaying:(BOOL)a3
{
  self->_isSoundPlaying = a3;
}

- (FMDAVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (OS_os_transaction)soundTransaction
{
  return self->_soundTransaction;
}

- (void)setSoundTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_soundTransaction, a3);
}

- (OS_os_transaction)discoveryTransaction
{
  return self->_discoveryTransaction;
}

- (void)setDiscoveryTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryTransaction, a3);
}

- (OriginalSwitchesState)originalState
{
  return self->_originalState;
}

- (void)setOriginalState:(id)a3
{
  objc_storeStrong((id *)&self->_originalState, a3);
}

- (FMDAVRoute)originalRoute
{
  return self->_originalRoute;
}

- (void)setOriginalRoute:(id)a3
{
  objc_storeStrong((id *)&self->_originalRoute, a3);
}

- (FMDAudioAccessory)lastAccessory
{
  return self->_lastAccessory;
}

- (void)setLastAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccessory, a3);
}

- (FMDAudioAccessory)monitoredAccessories
{
  return self->_monitoredAccessories;
}

- (void)setMonitoredAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredAccessories, a3);
}

- (NSMutableDictionary)monitoredAccessoriesCompletionBlocks
{
  return self->_monitoredAccessoriesCompletionBlocks;
}

- (void)setMonitoredAccessoriesCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredAccessoriesCompletionBlocks, a3);
}

- (BOOL)wasSoundPlayed
{
  return self->_wasSoundPlayed;
}

- (void)setWasSoundPlayed:(BOOL)a3
{
  self->_wasSoundPlayed = a3;
}

- (float)panTargetValue
{
  return self->_panTargetValue;
}

- (void)setPanTargetValue:(float)a3
{
  self->_panTargetValue = a3;
}

- (float)volumeTargetValue
{
  return self->_volumeTargetValue;
}

- (void)setVolumeTargetValue:(float)a3
{
  self->_volumeTargetValue = a3;
}

- (double)fadeDuration
{
  return self->_fadeDuration;
}

- (void)setFadeDuration:(double)a3
{
  self->_fadeDuration = a3;
}

- (FMDBluetoothSessionInterface)bluetoothSessionInterface
{
  return self->_bluetoothSessionInterface;
}

- (void)setBluetoothSessionInterface:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothSessionInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothSessionInterface, 0);
  objc_storeStrong((id *)&self->_monitoredAccessoriesCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_monitoredAccessories, 0);
  objc_storeStrong((id *)&self->_lastAccessory, 0);
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_originalState, 0);
  objc_storeStrong((id *)&self->_discoveryTransaction, 0);
  objc_storeStrong((id *)&self->_soundTransaction, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
