@implementation FMDExtSoundController

- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resumeConnectionWithConfiguration:", v15));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100004F00;
  v24[3] = &unk_1000204D8;
  v17 = v11;
  v25 = v17;
  objc_msgSend(v16, "addFailureBlock:", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteObjectProxy"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100004F94;
  v21[3] = &unk_100020500;
  v22 = v16;
  v23 = v17;
  v19 = v16;
  v20 = v17;
  objc_msgSend(v18, "startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion:", v13, v12, v21, a4, a5);

}

- (void)stopPlayingSoundForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000051A4;
  v19[3] = &unk_1000204D8;
  v12 = v7;
  v20 = v12;
  objc_msgSend(v11, "addFailureBlock:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005238;
  v16[3] = &unk_100020500;
  v17 = v11;
  v18 = v12;
  v14 = v11;
  v15 = v12;
  objc_msgSend(v13, "stopPlayingForAccessory:rampDownDuration:completion:", v8, v16, a4);

}

- (void)startPlayingSoundForAccessory2:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  double v24;
  double v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = sub_100007894();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v12;
    v30 = 2048;
    v31 = a4;
    v32 = 2048;
    v33 = a5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Start playing sound for accessory: %@ duration: %f rampUpDuration: %f", buf, 0x20u);
  }

  if (v12)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000054F0;
    v20[3] = &unk_100020578;
    v24 = a5;
    v20[4] = self;
    v21 = v12;
    v22 = v13;
    v25 = a4;
    v23 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

  }
  else if (v14)
  {
    v17 = objc_alloc((Class)NSError);
    v26 = NSLocalizedFailureReasonErrorKey;
    v27 = CFSTR("Accessory cannot be nil");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v19 = objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FindMyDevice"), 1, v18);
    (*((void (**)(id, id))v14 + 2))(v14, v19);

  }
}

- (void)stopPlayingForAccessory2:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  double v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  double v24;

  v8 = a3;
  v9 = a5;
  v10 = sub_100007894();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v8;
    v23 = 2048;
    v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Stop playing sound for accessory: %@ rampDownDuration: %f", buf, 0x16u);
  }

  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005884;
    v15[3] = &unk_1000205C8;
    v18 = a4;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

  }
  else if (v9)
  {
    v12 = objc_alloc((Class)NSError);
    v19 = NSLocalizedFailureReasonErrorKey;
    v20 = CFSTR("Accessory cannot be nil");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v14 = objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FindMyDevice"), 1, v13);
    (*((void (**)(id, id))v9 + 2))(v9, v14);

  }
}

- (FMDAccessoryAudioController)accessoryAudioController
{
  FMDAccessoryAudioController *accessoryAudioController;
  FMDAccessoryAudioController *v4;
  FMDAccessoryAudioController *v5;

  accessoryAudioController = self->_accessoryAudioController;
  if (!accessoryAudioController)
  {
    v4 = objc_alloc_init(FMDAccessoryAudioController);
    v5 = self->_accessoryAudioController;
    self->_accessoryAudioController = v4;

    -[FMDAccessoryAudioController setDelegate:](self->_accessoryAudioController, "setDelegate:", self);
    accessoryAudioController = self->_accessoryAudioController;
  }
  return accessoryAudioController;
}

- (void)setTimeoutForDuration:(double)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  unsigned int v15;

  v5 = sub_100007894();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
    v12 = 134218240;
    v13 = a3;
    v14 = 1024;
    v15 = objc_msgSend(v7, "isMainThread");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Set timeout for duration: %f inMainThread: %d", (uint8_t *)&v12, 0x12u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtSoundController stopSoundTimer](self, "stopSoundTimer"));
  objc_msgSend(v8, "invalidate");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "_stopSoundTimerFired:", 0, 0, a3));
  -[FMDExtSoundController setStopSoundTimer:](self, "setStopSoundTimer:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtSoundController stopSoundTimer](self, "stopSoundTimer"));
  objc_msgSend(v10, "addTimer:forMode:", v11, NSRunLoopCommonModes);

}

- (void)_stopSoundTimerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_100007894();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stop sound timer fired", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtSoundController currentAccessory](self, "currentAccessory"));
  -[FMDExtSoundController stopPlayingSoundForAccessory:rampDownDuration:completion:](self, "stopPlayingSoundForAccessory:rampDownDuration:completion:", v6, &stru_100020608, 0.5);

}

- (void)invalidateStopSoundTimer
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100007894();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating stop sound timer", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtSoundController stopSoundTimer](self, "stopSoundTimer"));
  objc_msgSend(v5, "invalidate");

  -[FMDExtSoundController setStopSoundTimer:](self, "setStopSoundTimer:", 0);
}

- (void)setAccessoryAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryAudioController, a3);
}

- (FMDGenericAudioAccessory)currentAccessory
{
  return self->_currentAccessory;
}

- (void)setCurrentAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccessory, a3);
}

- (NSTimer)stopSoundTimer
{
  return self->_stopSoundTimer;
}

- (void)setStopSoundTimer:(id)a3
{
  objc_storeStrong((id *)&self->_stopSoundTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopSoundTimer, 0);
  objc_storeStrong((id *)&self->_currentAccessory, 0);
  objc_storeStrong((id *)&self->_accessoryAudioController, 0);
}

@end
