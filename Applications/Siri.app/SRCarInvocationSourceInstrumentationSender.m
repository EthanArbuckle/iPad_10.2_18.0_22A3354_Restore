@implementation SRCarInvocationSourceInstrumentationSender

- (SRCarInvocationSourceInstrumentationSender)init
{
  SRCarInvocationSourceInstrumentationSender *v2;
  uint64_t v3;
  SRUIFInstrumentationManager *manager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRCarInvocationSourceInstrumentationSender;
  v2 = -[SRCarInvocationSourceInstrumentationSender init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager"));
    manager = v2->_manager;
    v2->_manager = (SRUIFInstrumentationManager *)v3;

  }
  return v2;
}

- (void)sendBTCarInvocationContext
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v3 = objc_alloc_init((Class)SISchemaInvocation);
  v4 = objc_alloc_init((Class)SISchemaBluetoothCarInvocationContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothPreferredCarAudioRoute"));

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("A2DP")) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceSpeaker")))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[SRCarInvocationSourceInstrumentationSender sendBTCarInvocationContext]";
    v11 = 1024;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #BTCarInvocationSourceSender The current preferred audio route is: %d", (uint8_t *)&v9, 0x12u);
  }
  objc_msgSend(v4, "setRoute:", v7);
  objc_msgSend(v3, "setBluetoothCarInvocationContext:", v4);
  -[SRUIFInstrumentationManager emitInstrumentation:](self->_manager, "emitInstrumentation:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
