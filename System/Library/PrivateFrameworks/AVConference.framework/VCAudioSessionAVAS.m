@implementation VCAudioSessionAVAS

- (BOOL)setUpCMSessionToAVAudioSessionMapping
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
  NSDictionary *v12;
  _QWORD v14[10];
  _QWORD v15[11];

  v15[10] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C89770];
  v4 = *MEMORY[0x1E0D491F0];
  v14[0] = *MEMORY[0x1E0D491C0];
  v14[1] = v4;
  v5 = *MEMORY[0x1E0C89780];
  v15[0] = v3;
  v15[1] = v5;
  v6 = *MEMORY[0x1E0C89778];
  v7 = *MEMORY[0x1E0D49090];
  v14[2] = *MEMORY[0x1E0D491D0];
  v14[3] = v7;
  v8 = *MEMORY[0x1E0C89748];
  v15[2] = v6;
  v15[3] = v8;
  v9 = *MEMORY[0x1E0C89688];
  v10 = *MEMORY[0x1E0D48F00];
  v14[4] = *MEMORY[0x1E0D48F58];
  v14[5] = v10;
  v11 = *MEMORY[0x1E0C89690];
  v15[4] = v9;
  v15[5] = v11;
  v14[6] = &unk_1E9EF6350;
  v14[7] = &unk_1E9EF6380;
  v15[6] = &unk_1E9EF6368;
  v15[7] = &unk_1E9EF6398;
  v14[8] = CFSTR("AirTunes");
  v14[9] = CFSTR("HeadphonesBT");
  v15[8] = &unk_1E9EF63B0;
  v15[9] = &unk_1E9EF63C8;
  v12 = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
  self->_cmSessionToAVAudioSessionMapping = v12;
  return v12 != 0;
}

- (BOOL)setUpGenericSessionProperties
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSSet *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = *MEMORY[0x1E0D498C0];
  v8[0] = *MEMORY[0x1E0D49638];
  v8[1] = v4;
  v5 = *MEMORY[0x1E0D49B80];
  v8[2] = *MEMORY[0x1E0D497D8];
  v8[3] = v5;
  v6 = (NSSet *)objc_msgSend(v3, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4));
  self->_genericSessionProperties = v6;
  return v6 != 0;
}

+ (SEL)selectorForNotification:(id)a3
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)*MEMORY[0x1E0C896D0], "isEqualToString:"))
    return sel_handleAudioSessionInputMuteChangeNotification_;
  if (objc_msgSend((id)*MEMORY[0x1E0C896F0], "isEqualToString:", a3))
    return sel_handleAudioSessionInterruption_;
  if (objc_msgSend((id)*MEMORY[0x1E0C897A8], "isEqualToString:", a3))
    return sel_handleOutputSampleRateChange_;
  if (objc_msgSend((id)*MEMORY[0x1E0C89730], "isEqualToString:", a3))
    return sel_handleAudioSessionMediaServicesWereLostNotification_;
  if (objc_msgSend((id)*MEMORY[0x1E0C89738], "isEqualToString:", a3))
    return sel_handleAudioSessionMediaServicesWereResetNotification_;
  if (objc_msgSend((id)*MEMORY[0x1E0C89870], "isEqualToString:", a3))
    return sel_handleAudioSessionRouteChangeNotification_;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCAudioSessionAVAS selectorForNotification:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v9 = 136316418;
        v10 = v7;
        v11 = 2080;
        v12 = "+[VCAudioSessionAVAS selectorForNotification:]";
        v13 = 1024;
        v14 = 126;
        v15 = 2112;
        v16 = v6;
        v17 = 2048;
        v18 = a1;
        v19 = 2112;
        v20 = a3;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unrecognized notification=%@, returning NULL selector", (uint8_t *)&v9, 0x3Au);
      }
    }
  }
  return 0;
}

- (BOOL)setUpNotificationsArray
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSOrderedSet *v7;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E40]);
  v4 = *MEMORY[0x1E0C896F0];
  v9[0] = *MEMORY[0x1E0C896D0];
  v9[1] = v4;
  v5 = *MEMORY[0x1E0C89730];
  v9[2] = *MEMORY[0x1E0C897A8];
  v9[3] = v5;
  v6 = *MEMORY[0x1E0C89870];
  v9[4] = *MEMORY[0x1E0C89738];
  v9[5] = v6;
  v7 = (NSOrderedSet *)objc_msgSend(v3, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6));
  self->_avAudioSessionNotifications = v7;
  return v7 != 0;
}

- (VCAudioSessionAVAS)initWithMode:(int)a3
{
  VCAudioSessionAVAS *v3;
  VCAudioSessionAVAS *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioSessionAVAS;
  v3 = -[VCAudioSession initWithMode:](&v6, sel_initWithMode_, *(_QWORD *)&a3);
  v4 = v3;
  if (v3
    && (!-[VCAudioSessionAVAS setUpCMSessionToAVAudioSessionMapping](v3, "setUpCMSessionToAVAudioSessionMapping")
     || !-[VCAudioSessionAVAS setUpGenericSessionProperties](v4, "setUpGenericSessionProperties")
     || !-[VCAudioSessionAVAS setUpNotificationsArray](v4, "setUpNotificationsArray")))
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *muteStateChangedHandlerQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCAudioSessionAVAS destroyAudioSession](self, "destroyAudioSession");
  _Block_release(self->_muteStateChangedHandler);
  muteStateChangedHandlerQueue = self->_muteStateChangedHandlerQueue;
  if (muteStateChangedHandlerQueue)
    dispatch_release(muteStateChangedHandlerQueue);

  v4.receiver = self;
  v4.super_class = (Class)VCAudioSessionAVAS;
  -[VCAudioSession dealloc](&v4, sel_dealloc);
}

- (void)resetOverrideRoute
{
  AVAudioSession *avAudioSession;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  AVAudioSession *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVAudioSession *v18;
  __int16 v19;
  AVAudioSession *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  avAudioSession = self->_avAudioSession;
  if (avAudioSession)
  {
    v10 = 0;
    if (-[AVAudioSession overrideOutputAudioPort:error:](avAudioSession, "overrideOutputAudioPort:error:", 0, &v10))
      v4 = v10 == 0;
    else
      v4 = 0;
    if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v7 = self->_avAudioSession;
        *(_DWORD *)buf = 136316418;
        v12 = v5;
        v13 = 2080;
        v14 = "-[VCAudioSessionAVAS resetOverrideRoute]";
        v15 = 1024;
        v16 = 181;
        v17 = 2048;
        v18 = v7;
        v19 = 2112;
        v20 = v7;
        v21 = 2112;
        v22 = v10;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d _avAudioSession=%p [%@] overrideOutputAudioPort:AVAudioSessionPortOverrideNone failed with error=%@", buf, 0x3Au);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = v8;
      v13 = 2080;
      v14 = "-[VCAudioSessionAVAS resetOverrideRoute]";
      v15 = 1024;
      v16 = 175;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error no AVAudioSession", buf, 0x1Cu);
    }
  }
}

- (BOOL)setSessionProperty:(id)a3 value:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  AVAudioSession *avAudioSession;
  char v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  AVAudioSession *v14;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  AVAudioSession *v24;
  __int16 v25;
  AVAudioSession *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_avAudioSession)
  {
    v16 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        *(_DWORD *)buf = 136316674;
        v18 = v7;
        v19 = 2080;
        v20 = "-[VCAudioSessionAVAS setSessionProperty:value:]";
        v21 = 1024;
        v22 = 192;
        v23 = 2048;
        v24 = avAudioSession;
        v25 = 2112;
        v26 = avAudioSession;
        v27 = 2112;
        v28 = a3;
        v29 = 2112;
        v30 = a4;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _avAudioSession=%p [%@] setting propertyKey=%@ to propertyValue=%@", buf, 0x44u);
      }
    }
    v10 = -[AVAudioSession setMXSessionProperty:value:error:](self->_avAudioSession, "setMXSessionProperty:value:error:", a3, a4, &v16);
    if (v16)
      v11 = 0;
    else
      v11 = v10;
    if (!v11 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v14 = self->_avAudioSession;
        *(_DWORD *)buf = 136316930;
        v18 = v12;
        v19 = 2080;
        v20 = "-[VCAudioSessionAVAS setSessionProperty:value:]";
        v21 = 1024;
        v22 = 199;
        v23 = 2048;
        v24 = v14;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = a3;
        v29 = 2112;
        v30 = a4;
        v31 = 2112;
        v32 = v16;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d _avAudioSession=%p [%@] setting propertyKey=%@ with propertyValue=%@ failed with error=%@", buf, 0x4Eu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSessionAVAS setSessionProperty:value:].cold.1();
    }
    return 0;
  }
  return v11;
}

- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v29;
  char v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (self->_avAudioSession)
  {
    if (!a3 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:].cold.2();
    }
    v35 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v37 = v6;
        v38 = 2080;
        v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
        v40 = 1024;
        v41 = 217;
        v42 = 2112;
        v43 = a3;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Batch set properties=%@", buf, 0x26u);
      }
    }
    v30 = -[AVAudioSession setMXProperties:propertyErrors:](self->_avAudioSession, "setMXProperties:propertyErrors:", a3, &v35, 304);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v35;
    v33 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v55;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v55 != v32)
            objc_enumerationMutation(obj);
          v34 = v8;
          v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v10 = (void *)objc_msgSend(v9, "allKeys");
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v50 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v15), "unsignedIntValue")|| !objc_msgSend(a3, "objectForKeyedSubscript:", v15))
                {
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._currentAudioSessionProperties, "setObject:forKeyedSubscript:", 0, v15);
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                  {
                    v16 = VRTraceErrorLogLevelToCSTR();
                    v17 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      v18 = objc_msgSend(a3, "objectForKeyedSubscript:", v15);
                      *(_DWORD *)buf = 136316162;
                      v37 = v16;
                      v38 = 2080;
                      v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
                      v40 = 1024;
                      v41 = 227;
                      v42 = 2112;
                      v43 = v15;
                      v44 = 2112;
                      v45 = v18;
                      v19 = v17;
                      v20 = " [%s] %s:%d Failed to set property=%@ value=%@";
LABEL_27:
                      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x30u);
                      continue;
                    }
                  }
                }
                else
                {
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._currentAudioSessionProperties, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v15), v15);
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v21 = VRTraceErrorLogLevelToCSTR();
                    v22 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      v23 = objc_msgSend(a3, "objectForKeyedSubscript:", v15);
                      *(_DWORD *)buf = 136316162;
                      v37 = v21;
                      v38 = 2080;
                      v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
                      v40 = 1024;
                      v41 = 224;
                      v42 = 2112;
                      v43 = v15;
                      v44 = 2112;
                      v45 = v23;
                      v19 = v22;
                      v20 = " [%s] %s:%d Succeeded in setting property=%@ value=%@";
                      goto LABEL_27;
                    }
                  }
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
            }
            while (v12);
          }
          v8 = v34 + 1;
        }
        while (v34 + 1 != v33);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
      }
      while (v33);
    }
    v24 = v30;
    if ((v30 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v27 = *(Class *)((char *)&self->super.super.super.isa + v29);
        *(_DWORD *)buf = 136316418;
        v37 = v25;
        v38 = 2080;
        v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
        v40 = 1024;
        v41 = 233;
        v42 = 2048;
        v43 = v27;
        v44 = 2112;
        v45 = (uint64_t)v27;
        v46 = 2112;
        v47 = v35;
        _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d _avAudioSession=%p [%@] failed to batch set property keys with errors=%@", buf, 0x3Au);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:].cold.1();
    }
    return 0;
  }
  return v24;
}

- (BOOL)hasStarted
{
  return self->_avAudioSession != 0;
}

- (BOOL)isInputAvailable
{
  AVAudioSession *avAudioSession;

  avAudioSession = self->_avAudioSession;
  if (avAudioSession)
    LOBYTE(avAudioSession) = -[AVAudioSession isInputAvailable](avAudioSession, "isInputAvailable");
  return (char)avAudioSession;
}

- (BOOL)isInputSupported
{
  NSString *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  AVAudioSession *avAudioSession;
  uint64_t v8;
  NSObject *v9;
  AVAudioSession *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  AVAudioSession *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[VCAudioSessionAVAS isInputAvailable](self, "isInputAvailable"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      LOBYTE(v4) = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v4;
      avAudioSession = self->_avAudioSession;
      v12 = 136315906;
      v13 = v5;
      v14 = 2080;
      v15 = "-[VCAudioSessionAVAS isInputSupported]";
      v16 = 1024;
      v17 = 249;
      v18 = 2112;
      v19 = avAudioSession;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No input available avAudioSession=%@", (uint8_t *)&v12, 0x26u);
    }
    LOBYTE(v4) = 0;
    return v4;
  }
  v3 = -[AVAudioSession category](self->_avAudioSession, "category");
  v4 = -[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x1E0C89688])
    || -[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x1E0C896A0]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_avAudioSession;
      v12 = 136316418;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCAudioSessionAVAS isInputSupported]";
      v16 = 1024;
      v17 = 255;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v3;
      v22 = 1024;
      v23 = v4;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Configured avAudioSession=%@ with category=%@, categorySupportsInput=%{BOOL}d", (uint8_t *)&v12, 0x36u);
    }
  }
  return v4;
}

- (void)setSpeakerProperty:(id)a3
{
  -[VCAudioSessionAVAS setSessionProperty:value:](self, "setSessionProperty:value:", *MEMORY[0x1E0D49638], objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49638]));
}

- (id)avAudioSessionKeyFromCMSessionKey:(id)a3
{
  id result;

  result = -[NSDictionary objectForKeyedSubscript:](self->_cmSessionToAVAudioSessionMapping, "objectForKeyedSubscript:");
  if (!result)
    return a3;
  return result;
}

- (unint64_t)avAudioSessionAllowedRouteTypesFromCMSession:(id)a3
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSDictionary *cmSessionToAVAudioSessionMapping;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSDictionary *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (!v5)
    return 0;
  v7 = v5;
  v8 = 0;
  v9 = *(_QWORD *)v30;
  *(_QWORD *)&v6 = 136316162;
  v17 = v6;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(a3);
      v11 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
      v12 = -[VCAudioSessionAVAS avAudioSessionKeyFromCMSessionKey:](self, "avAudioSessionKeyFromCMSessionKey:", v11, v17);
      if (v12 == v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            cmSessionToAVAudioSessionMapping = self->_cmSessionToAVAudioSessionMapping;
            *(_DWORD *)buf = v17;
            v19 = v13;
            v20 = 2080;
            v21 = "-[VCAudioSessionAVAS avAudioSessionAllowedRouteTypesFromCMSession:]";
            v22 = 1024;
            v23 = 273;
            v24 = 2112;
            v25 = v11;
            v26 = 2112;
            v27 = cmSessionToAVAudioSessionMapping;
            _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d AllowedRouteType=%@ not found in mapping=%@", buf, 0x30u);
          }
        }
      }
      else
      {
        v8 |= objc_msgSend(v12, "unsignedIntegerValue");
      }
    }
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  }
  while (v7);
  return v8;
}

- (void)dispatchedSetVPBlockConfigurationProperties:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = micro();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCAudioSessionAVAS dispatchedSetVPBlockConfigurationProperties:]";
      v12 = 1024;
      v13 = 283;
      v14 = 1024;
      v15 = v3;
      v16 = 2048;
      v17 = vcvtmd_u64_f64(v5);
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Dispatching scheduled=%d VPBlock update to set network uplink clock now (time=%llu sec), ", (uint8_t *)&v8, 0x2Cu);
    }
  }
  -[VCAudioSessionAVAS setVPBlockConfigurationProperties:](self, "setVPBlockConfigurationProperties:", self->super._vpBlock);
}

- (void)scheduleDeferredNetworkUplinkClockUpdate
{
  uint64_t v3;
  NSObject *v4;
  unint64_t networkUplinkClockScheduledTime;
  unint64_t v6;
  dispatch_time_t v7;
  NSObject *dispatchQueue;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_pendingVPBlockUpdate = 1;
  self->_networkUplinkClockScheduledTime = vcvtmd_u64_f64(micro());
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      networkUplinkClockScheduledTime = self->_networkUplinkClockScheduledTime;
      *(_DWORD *)buf = 136315906;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCAudioSessionAVAS scheduleDeferredNetworkUplinkClockUpdate]";
      v14 = 1024;
      v15 = 290;
      v16 = 2048;
      v17 = networkUplinkClockScheduledTime;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting network uplink clock property on VPBlock now (time=%llu sec)", buf, 0x26u);
    }
  }
  v6 = self->_networkUplinkClockScheduledTime;
  v7 = dispatch_time(0, 30000000000);
  dispatchQueue = self->super._dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__VCAudioSessionAVAS_scheduleDeferredNetworkUplinkClockUpdate__block_invoke;
  v9[3] = &unk_1E9E52960;
  v9[4] = self;
  v9[5] = v6;
  dispatch_after(v7, dispatchQueue, v9);
}

uint64_t __62__VCAudioSessionAVAS_scheduleDeferredNetworkUplinkClockUpdate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 384))
  {
    if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(result + 376))
      return objc_msgSend((id)result, "dispatchedSetVPBlockConfigurationProperties:", 0);
  }
  return result;
}

- (BOOL)handleNetworkUplinkClockConfigurationUpdate:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  -[NSMutableDictionary setValue:forKey:](self->super._vpBlock, "setValue:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "network uplink clock uses baseband"));
  if (!self->super._deferredNetworkUplinkClockEnabled)
    return -[VCAudioSessionAVAS setVPBlockConfigurationProperties:](self, "setVPBlockConfigurationProperties:", self->super._vpBlock);
  -[VCAudioSessionAVAS scheduleDeferredNetworkUplinkClockUpdate](self, "scheduleDeferredNetworkUplinkClockUpdate");
  return 1;
}

- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self->_avAudioSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      -[VCAudioSessionAVAS applyRequestedProperty:defaultValue:].cold.1();
    }
LABEL_40:
    LOBYTE(v12) = 0;
    return v12;
  }
  v7 = -[NSDictionary objectForKeyedSubscript:](-[VCAudioSession audioSessionProperties](self, "audioSessionProperties"), "objectForKeyedSubscript:", a3);
  if (v7)
    a4 = v7;
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      -[VCAudioSessionAVAS applyRequestedProperty:defaultValue:].cold.2();
    }
    goto LABEL_40;
  }
  v22 = 0;
  v8 = -[VCAudioSessionAVAS avAudioSessionKeyFromCMSessionKey:](self, "avAudioSessionKeyFromCMSessionKey:", a4);
  if (-[NSSet containsObject:](self->_genericSessionProperties, "containsObject:", a3))
  {
LABEL_6:
    v9 = -[VCAudioSessionAVAS setSessionProperty:value:](self, "setSessionProperty:value:", a3, a4);
    goto LABEL_7;
  }
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D49528]))
  {
    if (!objc_msgSend(v8, "isEqualToString:", a4))
    {
      v9 = -[AVAudioSession setMode:error:](self->_avAudioSession, "setMode:error:", v8, &v22);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v13 = *MEMORY[0x1E0D494F8];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D494F8]))
  {
    v9 = -[AVAudioSession setCategory:error:](self->_avAudioSession, "setCategory:error:", v8, &v22);
  }
  else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D495F8]))
  {
    v9 = -[AVAudioSession setInterruptionPriority:error:](self->_avAudioSession, "setInterruptionPriority:error:", objc_msgSend(v8, "integerValue"), &v22);
  }
  else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D49820]))
  {
    v9 = -[AVAudioSession setActivationContext:error:](self->_avAudioSession, "setActivationContext:error:", a4, &v22);
  }
  else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D494C8]))
  {
    v14 = -[VCAudioSessionAVAS avAudioSessionAllowedRouteTypesFromCMSession:](self, "avAudioSessionAllowedRouteTypesFromCMSession:", a4);
    if (v14)
    {
      v9 = -[AVAudioSession setCategory:withOptions:error:](self->_avAudioSession, "setCategory:withOptions:error:", -[VCAudioSessionAVAS avAudioSessionKeyFromCMSessionKey:](self, "avAudioSessionKeyFromCMSessionKey:", -[NSMutableDictionary objectForKeyedSubscript:](self->super._currentAudioSessionProperties, "objectForKeyedSubscript:", v13)), v14, &v22);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v24 = v19;
          v25 = 2080;
          v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
          v27 = 1024;
          v28 = 357;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No allowed route types, nothing to do", buf, 0x1Cu);
        }
      }
      v9 = 1;
    }
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v24 = v15;
          v25 = 2080;
          v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
          v27 = 1024;
          v28 = 368;
          v29 = 2112;
          v30 = a3;
          v31 = 2112;
          v32 = a4;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d propertyKey=%@ is NOT explicitly mapped, value=%@", buf, 0x30u);
        }
      }
      goto LABEL_36;
    }
    v9 = -[VCAudioSessionAVAS handleNetworkUplinkClockConfigurationUpdate:](self, "handleNetworkUplinkClockConfigurationUpdate:", a4);
  }
LABEL_7:
  if (!v9 || v22)
  {
LABEL_36:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v24 = v17;
        v25 = 2080;
        v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
        v27 = 1024;
        v28 = 375;
        v29 = 2112;
        v30 = a3;
        v31 = 2112;
        v32 = a4;
        v33 = 2112;
        v34 = v22;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Setting propertyKey=%@ failed, value=%@, error=%@", buf, 0x3Au);
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._currentAudioSessionProperties, "setObject:forKeyedSubscript:", 0, a3);
    goto LABEL_40;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v24 = v10;
      v25 = 2080;
      v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
      v27 = 1024;
      v28 = 372;
      v29 = 2112;
      v30 = a3;
      v31 = 2112;
      v32 = a4;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Property propertyKey=%@ successfully set value=%@", buf, 0x30u);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._currentAudioSessionProperties, "setObject:forKeyedSubscript:", a4, a3);
  LOBYTE(v12) = 1;
  return v12;
}

- (void)applyAudioSessionMediaPropertiesForSystemAudio
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _avAudioSession is nil, cannot set media properties for system audio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4
{
  int playbackMode;
  BOOL v5;

  playbackMode = self->super._playbackMode;
  if (!playbackMode)
  {
    v5 = a3 == 2;
    if (a3 == 4)
      v5 = 1;
    *a4 = v5;
    if (a3 == 4 || a3 == 2)
      -[VCAudioSessionAVAS setSessionProperty:value:](self, "setSessionProperty:value:", *MEMORY[0x1E0D49938], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
  }
  return playbackMode == 0;
}

- (BOOL)setSampleRate:(double)a3
{
  double v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  double v10;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  AVAudioSession *avAudioSession;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  AVAudioSession *v19;
  double v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->super._isTetheredDisplayMode)
    a3 = 48000.0;
  -[AVAudioSession preferredOutputSampleRate](self->_avAudioSession, "preferredOutputSampleRate");
  v6 = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v23 = v7;
      v24 = 2080;
      v25 = "-[VCAudioSessionAVAS setSampleRate:]";
      v26 = 1024;
      v27 = 428;
      v28 = 2048;
      v29 = v6;
      v30 = 2048;
      v31 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Getting: preferredOutputSampleRate currentPreferredSampleRate=%f -> wanted sampleRate=%f", buf, 0x30u);
    }
  }
  if (a3 == v6)
    goto LABEL_16;
  v21 = 0.0;
  v9 = -[AVAudioSession setPreferredSampleRate:error:](self->_avAudioSession, "setPreferredSampleRate:error:", &v21, a3);
  v10 = v21;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v9 && *(_QWORD *)&v10 == 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        *(_DWORD *)buf = 136316418;
        v23 = v13;
        v24 = 2080;
        v25 = "-[VCAudioSessionAVAS setSampleRate:]";
        v26 = 1024;
        v27 = 437;
        v28 = 2048;
        v29 = *(double *)&avAudioSession;
        v30 = 2112;
        v31 = *(double *)&avAudioSession;
        v32 = 2048;
        v33 = a3;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d avAudioSession=%p [%@] setPreferredOutputSampleRate with sampleRate=%f", buf, 0x3Au);
      }
    }
LABEL_16:
    LOBYTE(v16) = 1;
    return v16;
  }
  if (ErrorLogLevelForModule >= 3)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v16)
      return v16;
    v19 = self->_avAudioSession;
    *(_DWORD *)buf = 136316418;
    v23 = v17;
    v24 = 2080;
    v25 = "-[VCAudioSessionAVAS setSampleRate:]";
    v26 = 1024;
    v27 = 435;
    v28 = 2048;
    v29 = *(double *)&v19;
    v30 = 2112;
    v31 = *(double *)&v19;
    v32 = 2112;
    v33 = v21;
    _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d avAudioSession=%p [%@] setPreferredSampleRate failed with error=%@", buf, 0x3Au);
  }
  LOBYTE(v16) = 0;
  return v16;
}

- (void)setOptimizedTelephonyHandoverSettings:(BOOL)a3 networkUplinkClockUsesBaseband:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->super._useOptimizedHandoversForTelephony)
  {
    v4 = a4;
    v5 = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCAudioSessionAVAS setOptimizedTelephonyHandoverSettings:networkUplinkClockUsesBaseband:]";
        v14 = 1024;
        v15 = 446;
        v16 = 1024;
        v17 = v5;
        v18 = 1024;
        v19 = v4;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting optimized handover settings for Telephony. audioClockDeviceEnabled=%d, networkUplinkClockUsesBaseband=%d", (uint8_t *)&v10, 0x28u);
      }
    }
    -[VCAudioSessionAVAS setAudioClockDeviceEnabled:](self, "setAudioClockDeviceEnabled:", v5);
    if (v5)
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "network uplink clock uses baseband");
      -[NSMutableDictionary setValue:forKey:](self->super._vpBlock, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4), v9);
    }
  }
}

- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5
{
  AVAudioSession *avAudioSession;
  _BOOL4 v7;
  double v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  int ErrorLogLevelForModule;
  uint64_t v21;
  NSObject *v22;
  AVAudioSession *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  int v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  uint64_t v31;
  NSObject *v32;
  AVAudioSession *v33;
  uint64_t v34;
  NSObject *v35;
  AVAudioSession *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  NSObject *v41;
  AVAudioSession *v42;
  signed int v43;
  uint64_t v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  _BYTE v56[18];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  avAudioSession = self->_avAudioSession;
  if (avAudioSession)
  {
    v7 = a5;
    if (self->super._isTetheredDisplayMode)
      a4 = 48000.0;
    if (a5)
      goto LABEL_47;
    -[AVAudioSession sampleRate](avAudioSession, "sampleRate");
    a4 = v10;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v46 = v11;
        v47 = 2080;
        v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
        v49 = 1024;
        v50 = 470;
        v51 = 2048;
        v52 = a4;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Route or AvailableSampleRate Changed: AVAudioSession CurrentHardwareSampleRate=%f", buf, 0x26u);
      }
    }
    if (self->super._hardwareSampleRate != a4)
    {
LABEL_47:
      if (VCFeatureFlagManager_UseBlockDurationHinting())
      {
        -[AVAudioSession IOBufferDuration](self->_avAudioSession, "IOBufferDuration");
        v14 = v13;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v46 = v15;
            v47 = 2080;
            v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
            v49 = 1024;
            v50 = 477;
            v51 = 2048;
            v52 = v14;
            v53 = 2048;
            v54 = a3;
            v55 = 2048;
            *(double *)v56 = 1.0 / a4;
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current ioBufferDuration=%f Desired duration=%f Error=%f", buf, 0x3Au);
          }
        }
        if (!v7 && vabdd_f64(v14, a3) < 1.0 / a4)
          goto LABEL_36;
        v44 = 0;
        v17 = -[AVAudioSession setPreferredIOBufferDuration:error:](self->_avAudioSession, "setPreferredIOBufferDuration:error:", &v44, a3);
        v18 = v44;
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (!v17 || v18 != 0)
        {
          if (ErrorLogLevelForModule < 3)
            goto LABEL_36;
          v40 = VRTraceErrorLogLevelToCSTR();
          v41 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_36;
          v42 = self->_avAudioSession;
          *(_DWORD *)buf = 136316674;
          v46 = v40;
          v47 = 2080;
          v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
          v49 = 1024;
          v50 = 481;
          v51 = 2048;
          v52 = *(double *)&v42;
          v53 = 2112;
          v54 = *(double *)&v42;
          v55 = 2048;
          *(double *)v56 = a3;
          *(_WORD *)&v56[8] = 2112;
          *(_QWORD *)&v56[10] = v44;
          v37 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferDuration=%f failed with error=%@";
          v38 = v41;
          v39 = 68;
          goto LABEL_44;
        }
        if (ErrorLogLevelForModule < 7)
          goto LABEL_36;
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        v23 = self->_avAudioSession;
        *(_DWORD *)buf = 136316674;
        v46 = v21;
        v47 = 2080;
        v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
        v49 = 1024;
        v50 = 482;
        v51 = 2048;
        v52 = *(double *)&v23;
        v53 = 2112;
        v54 = *(double *)&v23;
        v55 = 2048;
        *(double *)v56 = a3;
        *(_WORD *)&v56[8] = 1024;
        *(_DWORD *)&v56[10] = v7;
        v24 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferDuration=%f force=%{BOOL}d succeeded";
        v25 = v22;
        v26 = 64;
      }
      else
      {
        v43 = llround(a4 * a3);
        -[VCAudioSession forceBufferFrames:](self, "forceBufferFrames:", &v43);
        v44 = 0;
        v27 = -[AVAudioSession setPreferredIOBufferFrameSize:error:](self->_avAudioSession, "setPreferredIOBufferFrameSize:error:", v43, &v44);
        v28 = v44;
        v29 = VRTraceGetErrorLogLevelForModule();
        if (v27)
          v30 = v28 == 0;
        else
          v30 = 0;
        if (!v30)
        {
          if (v29 < 3)
            goto LABEL_36;
          v34 = VRTraceErrorLogLevelToCSTR();
          v35 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_36;
          v36 = self->_avAudioSession;
          *(_DWORD *)buf = 136316674;
          v46 = v34;
          v47 = 2080;
          v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
          v49 = 1024;
          v50 = 492;
          v51 = 2048;
          v52 = *(double *)&v36;
          v53 = 2112;
          v54 = *(double *)&v36;
          v55 = 1024;
          *(_DWORD *)v56 = v43;
          *(_WORD *)&v56[4] = 2112;
          *(_QWORD *)&v56[6] = v44;
          v37 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferFrameSize=%d failed with error=%@";
          v38 = v35;
          v39 = 64;
LABEL_44:
          _os_log_error_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
          goto LABEL_36;
        }
        if (v29 < 7)
          goto LABEL_36;
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        v33 = self->_avAudioSession;
        *(_DWORD *)buf = 136316674;
        v46 = v31;
        v47 = 2080;
        v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
        v49 = 1024;
        v50 = 493;
        v51 = 2048;
        v52 = *(double *)&v33;
        v53 = 2112;
        v54 = *(double *)&v33;
        v55 = 1024;
        *(_DWORD *)v56 = v43;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v7;
        v24 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferFrameSize=%d force=%{BOOL}d succeeded";
        v25 = v32;
        v26 = 60;
      }
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_36:
      self->super._hardwareSampleRate = a4;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioSessionAVAS setBlockSize:sampleRate:force:].cold.1();
  }
}

- (BOOL)setVPBlockConfigurationProperties:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[VCAudioSessionAVAS setSessionProperty:value:](self, "setSessionProperty:value:", *MEMORY[0x1E0D49CE8], a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v8 = "<nil>";
      v10 = 136316162;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCAudioSessionAVAS setVPBlockConfigurationProperties:]";
      v14 = 1024;
      v15 = 503;
      v16 = 2080;
      v17 = v8;
      v18 = 1024;
      v19 = v5;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_VPBlockConfiguration vpBlockDict=%s, success=%{BOOL}d", (uint8_t *)&v10, 0x2Cu);
    }
  }
  self->_pendingVPBlockUpdate = 0;
  return v5;
}

- (void)applyClientPid
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 523;
  v5 = v0;
  v6 = v1;
  v7 = v0;
  v8 = 0;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCAudioSessionProperty_ClientPID processId=%d, success=%{BOOL}d", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

- (BOOL)applyAudioSessionMediaProperties:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioSessionAVAS applyAudioSessionMediaProperties:]";
      v13 = 1024;
      v14 = 527;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  -[VCAudioSessionAVAS applyClientPid](self, "applyClientPid");
  v8.receiver = self;
  v8.super_class = (Class)VCAudioSessionAVAS;
  return -[VCAudioSession applyAudioSessionMediaProperties:](&v8, sel_applyAudioSessionMediaProperties_, a3);
}

- (BOOL)startInternal
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  AVAudioSession *avAudioSession;
  _BOOL4 isMicrophoneMuted;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  AVAudioSession *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  BOOL v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  AVAudioSession *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  AVAudioSession *v30;
  AVAudioSession *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  BOOL v35;
  AVAudioSession *v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  VCAudioSessionAVAS *v48;
  __int16 v49;
  _BYTE v50[18];
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!self->_isMuteStateCached)
    goto LABEL_14;
  -[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:](self, "dispatchedApplyMicrophoneMute:", self->_isMicrophoneMuted);
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_13;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    avAudioSession = self->_avAudioSession;
    isMicrophoneMuted = self->_isMicrophoneMuted;
    *(_DWORD *)buf = 136316162;
    v40 = v4;
    v41 = 2080;
    v42 = "-[VCAudioSessionAVAS startInternal]";
    v43 = 1024;
    v44 = 537;
    v45 = 2112;
    v46 = avAudioSession;
    v47 = 1024;
    LODWORD(v48) = isMicrophoneMuted;
    v8 = " [%s] %s:%d AVAudioSession=%@ applying pre-cached mute state=%{BOOL}d on inital setActive call";
    v9 = v5;
    v10 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_13;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v13 = self->_avAudioSession;
    v14 = self->_isMicrophoneMuted;
    *(_DWORD *)buf = 136316674;
    v40 = v11;
    v41 = 2080;
    v42 = "-[VCAudioSessionAVAS startInternal]";
    v43 = 1024;
    v44 = 537;
    v45 = 2112;
    v46 = (void *)v3;
    v47 = 2048;
    v48 = self;
    v49 = 2112;
    *(_QWORD *)v50 = v13;
    *(_WORD *)&v50[8] = 1024;
    *(_DWORD *)&v50[10] = v14;
    v8 = " [%s] %s:%d %@(%p) AVAudioSession=%@ applying pre-cached mute state=%{BOOL}d on inital setActive call";
    v9 = v12;
    v10 = 64;
  }
  _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_13:
  self->_isMuteStateCached = 0;
LABEL_14:
  v38 = 0;
  v15 = -[AVAudioSession setActive:error:](self->_avAudioSession, "setActive:error:", 1, &v38);
  v16 = v38 == 0;
  v17 = v15 && v16;
  if (v15 && v16)
    v18 = 7;
  else
    v18 = 3;
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if (v18 > (int)VRTraceGetErrorLogLevelForModule())
      goto LABEL_33;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    v22 = *MEMORY[0x1E0CF2758];
    if (v17)
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      v23 = self->_avAudioSession;
      *(_DWORD *)buf = 136316674;
      v40 = v20;
      v41 = 2080;
      v42 = "-[VCAudioSessionAVAS startInternal]";
      v43 = 1024;
      v44 = 545;
      v45 = 2048;
      v46 = v23;
      v47 = 2112;
      v48 = (VCAudioSessionAVAS *)v23;
      v49 = 1024;
      *(_DWORD *)v50 = 1;
      *(_WORD *)&v50[4] = 2112;
      *(_QWORD *)&v50[6] = v38;
      v24 = " [%s] %s:%d AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
      v25 = v21;
      v26 = 64;
LABEL_29:
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      goto LABEL_33;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v37 = self->_avAudioSession;
      *(_DWORD *)buf = 136316674;
      v40 = v20;
      v41 = 2080;
      v42 = "-[VCAudioSessionAVAS startInternal]";
      v43 = 1024;
      v44 = 545;
      v45 = 2048;
      v46 = v37;
      v47 = 2112;
      v48 = (VCAudioSessionAVAS *)v37;
      v49 = 1024;
      *(_DWORD *)v50 = v15;
      *(_WORD *)&v50[4] = 2112;
      *(_QWORD *)&v50[6] = v38;
      v32 = " [%s] %s:%d AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
      v33 = v21;
      v34 = 64;
      goto LABEL_38;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if (v18 <= (int)VRTraceGetErrorLogLevelForModule())
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      v29 = *MEMORY[0x1E0CF2758];
      if (v17)
      {
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_33;
        v30 = self->_avAudioSession;
        *(_DWORD *)buf = 136317186;
        v40 = v27;
        v41 = 2080;
        v42 = "-[VCAudioSessionAVAS startInternal]";
        v43 = 1024;
        v44 = 545;
        v45 = 2112;
        v46 = (void *)v19;
        v47 = 2048;
        v48 = self;
        v49 = 2048;
        *(_QWORD *)v50 = v30;
        *(_WORD *)&v50[8] = 2112;
        *(_QWORD *)&v50[10] = v30;
        v51 = 1024;
        v52 = 1;
        v53 = 2112;
        v54 = v38;
        v24 = " [%s] %s:%d %@(%p) AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
        v25 = v28;
        v26 = 84;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v31 = self->_avAudioSession;
        *(_DWORD *)buf = 136317186;
        v40 = v27;
        v41 = 2080;
        v42 = "-[VCAudioSessionAVAS startInternal]";
        v43 = 1024;
        v44 = 545;
        v45 = 2112;
        v46 = (void *)v19;
        v47 = 2048;
        v48 = self;
        v49 = 2048;
        *(_QWORD *)v50 = v31;
        *(_WORD *)&v50[8] = 2112;
        *(_QWORD *)&v50[10] = v31;
        v51 = 1024;
        v52 = v15;
        v53 = 2112;
        v54 = v38;
        v32 = " [%s] %s:%d %@(%p) AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
        v33 = v28;
        v34 = 84;
LABEL_38:
        _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
      }
    }
  }
LABEL_33:
  v35 = !v15 && self->super._isInterrupted;
  self->super._isInterrupted = v35;
  return v15;
}

- (void)destroyAudioSession
{

  self->_avAudioSession = 0;
}

- (void)setAudioClockDeviceEnabled:(BOOL)a3
{
  const __CFString *v5;
  uint64_t v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int audioSessionId;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->super._useOptimizedHandoversForTelephony)
  {
    if (a3)
      v5 = CFSTR("NetworkUplinkClock_UID");
    else
      v5 = &stru_1E9E58EE0;
    v14 = 0;
    -[AVAudioSession setAudioClockDevice:error:](self->_avAudioSession, "setAudioClockDevice:error:", v5, &v14);
    v6 = v14;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v6)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          audioSessionId = self->super._audioSessionId;
          *(_DWORD *)buf = 136316162;
          v16 = v11;
          v17 = 2080;
          v18 = "-[VCAudioSessionAVAS setAudioClockDeviceEnabled:]";
          v19 = 1024;
          v20 = 564;
          v21 = 2112;
          v22 = v5;
          v23 = 1024;
          v24 = audioSessionId;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed setting audio clock deviceUID=%@ on sessionID=%d", buf, 0x2Cu);
        }
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = self->super._audioSessionId;
          *(_DWORD *)buf = 136316162;
          v16 = v8;
          v17 = 2080;
          v18 = "-[VCAudioSessionAVAS setAudioClockDeviceEnabled:]";
          v19 = 1024;
          v20 = 566;
          v21 = 2112;
          v22 = v5;
          v23 = 1024;
          v24 = v10;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully set the audio clock device=%@ on sessionID=%d", buf, 0x2Cu);
        }
      }
      self->super._audioClockDeviceEnabled = a3;
    }
  }
}

- (void)registerObserverNotifications
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  const char *v9;
  const char *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  unsigned int v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  int sessionPid;
  unsigned int audioSessionId;
  __int128 v23;
  NSOrderedSet *obj;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  _BYTE v34[10];
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = self->_avAudioSessionNotifications;
  v3 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v42;
    *(_QWORD *)&v4 = 136316418;
    v23 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v8 = *(const __CFString **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v9 = +[VCAudioSessionAVAS selectorForNotification:](VCAudioSessionAVAS, "selectorForNotification:", v8, v23);
        if (v9)
        {
          v10 = v9;
          if ((VCAudioSessionAVAS *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                sessionPid = self->super._sessionPid;
                audioSessionId = self->super._audioSessionId;
                *(_DWORD *)buf = v23;
                v26 = v19;
                v27 = 2080;
                v28 = "-[VCAudioSessionAVAS registerObserverNotifications]";
                v29 = 1024;
                v30 = 582;
                v31 = 2112;
                v32 = v8;
                v33 = 1024;
                *(_DWORD *)v34 = sessionPid;
                *(_WORD *)&v34[4] = 1024;
                *(_DWORD *)&v34[6] = audioSessionId;
                v16 = v20;
                v17 = " [%s] %s:%d Adding notification=%@ observer for _sessionPid=%d, _audioSessionId=%u";
                v18 = 50;
LABEL_16:
                _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
              }
            }
          }
          else
          {
            v11 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v11 = (const __CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v14 = self->super._sessionPid;
                v15 = self->super._audioSessionId;
                *(_DWORD *)buf = 136316930;
                v26 = v12;
                v27 = 2080;
                v28 = "-[VCAudioSessionAVAS registerObserverNotifications]";
                v29 = 1024;
                v30 = 582;
                v31 = 2112;
                v32 = v11;
                v33 = 2048;
                *(_QWORD *)v34 = self;
                *(_WORD *)&v34[8] = 2112;
                v35 = v8;
                v36 = 1024;
                v37 = v14;
                v38 = 1024;
                v39 = v15;
                v16 = v13;
                v17 = " [%s] %s:%d %@(%p) Adding notification=%@ observer for _sessionPid=%d, _audioSessionId=%u";
                v18 = 70;
                goto LABEL_16;
              }
            }
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, v10, v8, self->_avAudioSession);
          continue;
        }
      }
      v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
    }
    while (v5);
  }
}

- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4
{
  uint64_t v4;
  AVAudioSession *v7;
  uint64_t v8;
  NSObject *v9;
  AVAudioSession *avAudioSession;
  uint64_t v11;
  NSObject *v12;
  int operatingMode;
  unsigned int vpOperatingMode;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE v25[10];
  AVAudioSession *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_avAudioSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v4) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!(_DWORD)v4)
        return v4;
      -[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:].cold.1();
    }
    goto LABEL_5;
  }
  v7 = (AVAudioSession *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AE8]), "initAuxiliarySession");
  self->_avAudioSession = v7;
  if (v7)
  {
    self->super._audioSessionId = -[AVAudioSession opaqueSessionID](v7, "opaqueSessionID");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        v18 = 136316162;
        v19 = v8;
        v20 = 2080;
        v21 = "-[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:]";
        v22 = 1024;
        v23 = 599;
        v24 = 2048;
        *(_QWORD *)v25 = avAudioSession;
        *(_WORD *)&v25[8] = 2112;
        v26 = avAudioSession;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVAudioSession=%p [%@]", (uint8_t *)&v18, 0x30u);
      }
    }
    self->super._operatingMode = objc_msgSend(a3, "operatingMode");
    self->super._vpOperatingMode = objc_msgSend(a3, "vpOperatingMode");
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        operatingMode = self->super._operatingMode;
        vpOperatingMode = self->super._vpOperatingMode;
        v18 = 136316162;
        v19 = v11;
        v20 = 2080;
        v21 = "-[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:]";
        v22 = 1024;
        v23 = 603;
        v24 = 1024;
        *(_DWORD *)v25 = operatingMode;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = vpOperatingMode;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _operatingMode=%d, _vpOperatingMode=%d", (uint8_t *)&v18, 0x28u);
      }
    }
    -[VCAudioSessionAVAS setAudioClockDeviceEnabled:](self, "setAudioClockDeviceEnabled:", objc_msgSend(a3, "audioClockDeviceEnabled"));
    -[VCAudioSessionAVAS applyAudioSessionProperties](self, "applyAudioSessionProperties");
    -[AVAudioSession inputLatency](self->_avAudioSession, "inputLatency");
    -[VCAudioSessionAVAS setExternalInputAudioLatency:](self, "setExternalInputAudioLatency:");
    -[AVAudioSession outputLatency](self->_avAudioSession, "outputLatency");
    -[VCAudioSessionAVAS setExternalOutputAudioLatency:](self, "setExternalOutputAudioLatency:");
    -[VCAudioSessionAVAS registerObserverNotifications](self, "registerObserverNotifications");
    LOBYTE(v4) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:]";
        v22 = 1024;
        v23 = 595;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initAuxiliarySession failed", (uint8_t *)&v18, 0x1Cu);
      }
    }
    v4 = -[NSMutableArray count](self->super._clients, "count");
    if (v4)
    {
      -[VCAudioSessionAVAS destroyAudioSession](self, "destroyAudioSession");
LABEL_5:
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__VCAudioSessionAVAS_handleAudioSessionMediaServicesWereResetNotification___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
  -[VCAudioSession didInterruptionEnded](self, "didInterruptionEnded");
}

uint64_t __75__VCAudioSessionAVAS_handleAudioSessionMediaServicesWereResetNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _DWORD *v7;
  int v8;
  int v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 168);
  *(_DWORD *)(v2 + 168) = objc_msgSend(*(id *)(v2 + 304), "opaqueSessionID");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "name");
      v7 = *(_DWORD **)(a1 + 32);
      v8 = v7[63];
      v9 = v7[64];
      LODWORD(v7) = v7[42];
      v11 = 136316930;
      v12 = v4;
      v13 = 2080;
      v14 = "-[VCAudioSessionAVAS handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
      v15 = 1024;
      v16 = 631;
      v17 = 2112;
      v18 = v6;
      v19 = 1024;
      v20 = v8;
      v21 = 1024;
      v22 = v9;
      v23 = 1024;
      v24 = v3;
      v25 = 1024;
      v26 = (int)v7;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notification=%@ _playbackMode=%d _vpOperatingMode=%u oldAudioSessionID=%u new audioSessionID=%u", (uint8_t *)&v11, 0x3Eu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "applyAudioSessionProperties");
}

- (void)handleAudioSessionRouteChangeNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VCAudioSessionAVAS_handleAudioSessionRouteChangeNotification___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(dispatchQueue, block);
}

void __64__VCAudioSessionAVAS_handleAudioSessionRouteChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C89880]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "inputLatency");
  objc_msgSend(*(id *)(a1 + 40), "setExternalInputAudioLatency:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "outputLatency");
  objc_msgSend(*(id *)(a1 + 40), "setExternalOutputAudioLatency:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = objc_msgSend(v3, "unsignedLongValue");
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(v8 + 352);
      v10 = *(_QWORD *)(v8 + 360);
      v11 = 136316674;
      v12 = v4;
      v13 = 2080;
      v14 = "-[VCAudioSessionAVAS handleAudioSessionRouteChangeNotification:]_block_invoke";
      v15 = 1024;
      v16 = 643;
      v17 = 2112;
      v18 = v6;
      v19 = 2048;
      v20 = v7;
      v21 = 2048;
      v22 = v9;
      v23 = 2048;
      v24 = v10;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received audio route changed notification=%@, with reason=%lu new externalInputAudioLatency=%f externalOutputAudioLatency=%f", (uint8_t *)&v11, 0x44u);
    }
  }
}

- (void)applyAudioSessionProperties
{
  if (self->super._playbackMode)
    -[VCAudioSessionAVAS applyAudioSessionMediaPropertiesForSystemAudio](self, "applyAudioSessionMediaPropertiesForSystemAudio");
  else
    -[VCAudioSession applyAudioSessionPropertiesWithVPOperatingMode:](self, "applyAudioSessionPropertiesWithVPOperatingMode:", self->super._vpOperatingMode);
}

- (void)deregisterObserverNotifications
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  AVAudioSession *avAudioSession;
  __int128 v12;
  NSEnumerator *obj;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  AVAudioSession *v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = -[NSOrderedSet reverseObjectEnumerator](self->_avAudioSessionNotifications, "reverseObjectEnumerator");
  v3 = -[NSEnumerator countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v26;
    *(_QWORD *)&v4 = 136316162;
    v12 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            avAudioSession = self->_avAudioSession;
            *(_DWORD *)buf = v12;
            v15 = v9;
            v16 = 2080;
            v17 = "-[VCAudioSessionAVAS deregisterObserverNotifications]";
            v18 = 1024;
            v19 = 660;
            v20 = 2112;
            v21 = v8;
            v22 = 2112;
            v23 = avAudioSession;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Removing notification=%@ observer for avAudioSession=%@", buf, 0x30u);
          }
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v12), "removeObserver:name:object:", self, v8, self->_avAudioSession);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v5);
  }
}

- (BOOL)stopSession
{
  _BOOL4 v3;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  AVAudioSession *avAudioSession;
  uint64_t v9;
  NSObject *v10;
  AVAudioSession *v11;
  unsigned int audioSessionId;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  AVAudioSession *v22;
  __int16 v23;
  AVAudioSession *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  self->_pendingVPBlockUpdate = 0;
  if (self->_avAudioSession)
  {
    -[VCAudioSessionAVAS deregisterObserverNotifications](self, "deregisterObserverNotifications");
    v14 = 0;
    v3 = -[AVAudioSession setActive:withOptions:error:](self->_avAudioSession, "setActive:withOptions:error:", 0, 1, &v14);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v5 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule > 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        *(_DWORD *)buf = 136316930;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCAudioSessionAVAS stopSession]";
        v19 = 1024;
        v20 = 689;
        v21 = 2048;
        v22 = avAudioSession;
        v23 = 2112;
        v24 = avAudioSession;
        v25 = 2048;
        v26 = 1;
        v27 = 1024;
        v28 = v3;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVAudioSession=%p [%@] setActive=NO endInterruptionStatus=%lu returned success=%{BOOL}d error=%@", buf, 0x4Au);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_avAudioSession;
        audioSessionId = self->super._audioSessionId;
        *(_DWORD *)buf = 136316162;
        v16 = v9;
        v17 = 2080;
        v18 = "-[VCAudioSessionAVAS stopSession]";
        v19 = 1024;
        v20 = 691;
        v21 = 2112;
        v22 = v11;
        v23 = 1024;
        LODWORD(v24) = audioSessionId;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Releasing AVAudioSession=%@, _audioSessionId=%u", buf, 0x2Cu);
      }
    }
    -[VCAudioSessionAVAS destroyAudioSession](self, "destroyAudioSession");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSessionAVAS stopSession].cold.1();
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)dispatchedApplyMicrophoneMute:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  uint64_t v6;
  VCAudioSessionAVAS *v7;
  BOOL v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  AVAudioSession *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  AVAudioSession *avAudioSession;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  char IsOSFaultDisabled;
  NSObject *v26;
  AVAudioSession *v27;
  uint64_t v28;
  NSObject *v29;
  AVAudioSession *v30;
  AVAudioSession *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  AVAudioSession *v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  _BYTE v46[18];
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v3 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  v36 = 0;
  v5 = -[AVAudioSession muteSessionInput:error:](self->_avAudioSession, "muteSessionInput:error:", v3, &v36);
  v6 = v36;
  v7 = (VCAudioSessionAVAS *)objc_opt_class();
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    if (v7 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      avAudioSession = self->_avAudioSession;
      *(_DWORD *)buf = 136316162;
      v38 = v18;
      v39 = 2080;
      v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
      v41 = 1024;
      v42 = 704;
      v43 = 2112;
      v44 = avAudioSession;
      v45 = 1024;
      *(_DWORD *)v46 = v3;
      v21 = " [%s] %s:%d AVAudioSession=%@ uplink successfully applied isMuted=%{BOOL}d";
      v22 = v19;
      v23 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v30 = self->_avAudioSession;
      *(_DWORD *)buf = 136316674;
      v38 = v28;
      v39 = 2080;
      v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
      v41 = 1024;
      v42 = 704;
      v43 = 2112;
      v44 = (void *)v10;
      v45 = 2048;
      *(_QWORD *)v46 = self;
      *(_WORD *)&v46[8] = 2112;
      *(_QWORD *)&v46[10] = v30;
      v47 = 1024;
      v48 = v3;
      v21 = " [%s] %s:%d %@(%p) AVAudioSession=%@ uplink successfully applied isMuted=%{BOOL}d";
      v22 = v29;
      v23 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    return;
  }
  if (v7 != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 2)
      return;
    v24 = VRTraceErrorLogLevelToCSTR();
    IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    v26 = *MEMORY[0x1E0CF2758];
    if ((IsOSFaultDisabled & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v27 = self->_avAudioSession;
        *(_DWORD *)buf = 136316930;
        v38 = v24;
        v39 = 2080;
        v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
        v41 = 1024;
        v42 = 706;
        v43 = 2112;
        v44 = (void *)v9;
        v45 = 2048;
        *(_QWORD *)v46 = self;
        *(_WORD *)&v46[8] = 2112;
        *(_QWORD *)&v46[10] = v27;
        v47 = 1024;
        v48 = v3;
        v49 = 2112;
        v50 = v36;
        v15 = " [%s] %s:%d %@(%p) AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
        v16 = v26;
        v17 = 74;
        goto LABEL_23;
      }
      return;
    }
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      return;
    v31 = self->_avAudioSession;
    *(_DWORD *)buf = 136316930;
    v38 = v24;
    v39 = 2080;
    v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
    v41 = 1024;
    v42 = 706;
    v43 = 2112;
    v44 = (void *)v9;
    v45 = 2048;
    *(_QWORD *)v46 = self;
    *(_WORD *)&v46[8] = 2112;
    *(_QWORD *)&v46[10] = v31;
    v47 = 1024;
    v48 = v3;
    v49 = 2112;
    v50 = v36;
    v32 = " [%s] %s:%d %@(%p) AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
    v33 = v26;
    v34 = 74;
LABEL_34:
    _os_log_fault_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_FAULT, v32, buf, v34);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 2)
    return;
  v11 = VRTraceErrorLogLevelToCSTR();
  v12 = VRTraceIsOSFaultDisabled();
  v13 = *MEMORY[0x1E0CF2758];
  if ((v12 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      return;
    v35 = self->_avAudioSession;
    *(_DWORD *)buf = 136316418;
    v38 = v11;
    v39 = 2080;
    v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
    v41 = 1024;
    v42 = 706;
    v43 = 2112;
    v44 = v35;
    v45 = 1024;
    *(_DWORD *)v46 = v3;
    *(_WORD *)&v46[4] = 2112;
    *(_QWORD *)&v46[6] = v36;
    v32 = " [%s] %s:%d AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
    v33 = v13;
    v34 = 54;
    goto LABEL_34;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
  {
    v14 = self->_avAudioSession;
    *(_DWORD *)buf = 136316418;
    v38 = v11;
    v39 = 2080;
    v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
    v41 = 1024;
    v42 = 706;
    v43 = 2112;
    v44 = v14;
    v45 = 1024;
    *(_DWORD *)v46 = v3;
    *(_WORD *)&v46[4] = 2112;
    *(_QWORD *)&v46[6] = v36;
    v15 = " [%s] %s:%d AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
    v16 = v13;
    v17 = 54;
LABEL_23:
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCAudioSessionAVAS_setMicrophoneMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, block);
}

void __41__VCAudioSessionAVAS_setMicrophoneMuted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BYTE v27[24];
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 252))
  {
    if (*(_QWORD *)(v2 + 304))
    {
      objc_msgSend((id)v2, "dispatchedApplyMicrophoneMute:", *(unsigned __int8 *)(a1 + 40));
      return;
    }
    *(_BYTE *)(v2 + 368) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 369) = *(_BYTE *)(a1 + 40);
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_26;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
      v18 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)v27 = 136316162;
      *(_QWORD *)&v27[4] = v15;
      *(_WORD *)&v27[12] = 2080;
      *(_QWORD *)&v27[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 721;
      WORD2(v28) = 2112;
      *(_QWORD *)((char *)&v28 + 6) = v17;
      HIWORD(v28) = 1024;
      LODWORD(v29) = v18;
      v19 = " [%s] %s:%d AVAudioSession=%@ uplink mute cached, isMuted=%{BOOL}d";
      v20 = v16;
      v21 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_26;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(v24 + 304);
      v26 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)v27 = 136316674;
      *(_QWORD *)&v27[4] = v22;
      *(_WORD *)&v27[12] = 2080;
      *(_QWORD *)&v27[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 721;
      WORD2(v28) = 2112;
      *(_QWORD *)((char *)&v28 + 6) = v14;
      HIWORD(v28) = 2048;
      v29 = v24;
      LOWORD(v30) = 2112;
      *(_QWORD *)((char *)&v30 + 2) = v25;
      WORD5(v30) = 1024;
      HIDWORD(v30) = v26;
      v19 = " [%s] %s:%d %@(%p) AVAudioSession=%@ uplink mute cached, isMuted=%{BOOL}d";
      v20 = v23;
      v21 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, v27, v21);
LABEL_26:
    objc_msgSend(*(id *)(a1 + 32), "dispatchedInvokeMuteStateChangedHandlerWithIsMuted:reason:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 369), 0, *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29, v30);
    return;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
        *(_DWORD *)v27 = 136315906;
        *(_QWORD *)&v27[4] = v4;
        *(_WORD *)&v27[12] = 2080;
        *(_QWORD *)&v27[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
        *(_WORD *)&v27[22] = 1024;
        LODWORD(v28) = 713;
        WORD2(v28) = 2112;
        *(_QWORD *)((char *)&v28 + 6) = v6;
        v7 = " [%s] %s:%d Not applying mute to the AVAudioSession=%@ because this playback mode does not support it.";
        v8 = v5;
        v9 = 38;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v27, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(v12 + 304);
        *(_DWORD *)v27 = 136316418;
        *(_QWORD *)&v27[4] = v10;
        *(_WORD *)&v27[12] = 2080;
        *(_QWORD *)&v27[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
        *(_WORD *)&v27[22] = 1024;
        LODWORD(v28) = 713;
        WORD2(v28) = 2112;
        *(_QWORD *)((char *)&v28 + 6) = v3;
        HIWORD(v28) = 2048;
        v29 = v12;
        LOWORD(v30) = 2112;
        *(_QWORD *)((char *)&v30 + 2) = v13;
        v7 = " [%s] %s:%d %@(%p) Not applying mute to the AVAudioSession=%@ because this playback mode does not support it.";
        v8 = v11;
        v9 = 58;
        goto LABEL_14;
      }
    }
  }
}

- (BOOL)microphoneMuted
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCAudioSessionAVAS_microphoneMuted__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(dispatchQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__VCAudioSessionAVAS_microphoneMuted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[20];
  _BYTE v34[14];
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 252))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
          v26 = 136315906;
          v27 = v4;
          v28 = 2080;
          v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          v30 = 1024;
          v31 = 731;
          v32 = 2112;
          *(_QWORD *)v33 = v6;
          v7 = " [%s] %s:%d Not fetching mute from the AVAudioSession=%@ because this playback mode does not support it.";
          v8 = v5;
          v9 = 38;
LABEL_26:
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v26, v9);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 32);
          v13 = *(_QWORD *)(v12 + 304);
          v26 = 136316418;
          v27 = v10;
          v28 = 2080;
          v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          v30 = 1024;
          v31 = 731;
          v32 = 2112;
          *(_QWORD *)v33 = v3;
          *(_WORD *)&v33[8] = 2048;
          *(_QWORD *)&v33[10] = v12;
          *(_WORD *)&v33[18] = 2112;
          *(_QWORD *)v34 = v13;
          v7 = " [%s] %s:%d %@(%p) Not fetching mute from the AVAudioSession=%@ because this playback mode does not support it.";
          v8 = v11;
          v9 = 58;
          goto LABEL_26;
        }
      }
    }
  }
  else
  {
    if (*(_QWORD *)(v2 + 304))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(v2 + 304), "isSessionInputMuted");
    }
    else if (*(_BYTE *)(v2 + 368))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v2 + 369);
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v19 = *(_QWORD *)(v17 + 304);
          LODWORD(v17) = *(unsigned __int8 *)(v17 + 368);
          v26 = 136316418;
          v27 = v15;
          v28 = 2080;
          v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          v30 = 1024;
          v31 = 739;
          v32 = 1024;
          *(_DWORD *)v33 = v18;
          *(_WORD *)&v33[4] = 2112;
          *(_QWORD *)&v33[6] = v19;
          *(_WORD *)&v33[14] = 1024;
          *(_DWORD *)&v33[16] = v17;
          v7 = " [%s] %s:%d Fetching isMicrophoneMuted=%{BOOL}d, avAudioSession=%@ isMuteStateCached=%{BOOL}d";
          v8 = v16;
          v9 = 50;
          goto LABEL_26;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_QWORD *)(a1 + 32);
          v23 = *(_QWORD *)(v22 + 304);
          v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v25 = *(unsigned __int8 *)(v22 + 368);
          v26 = 136316930;
          v27 = v20;
          v28 = 2080;
          v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          v30 = 1024;
          v31 = 739;
          v32 = 2112;
          *(_QWORD *)v33 = v14;
          *(_WORD *)&v33[8] = 2048;
          *(_QWORD *)&v33[10] = v22;
          *(_WORD *)&v33[18] = 1024;
          *(_DWORD *)v34 = v24;
          *(_WORD *)&v34[4] = 2112;
          *(_QWORD *)&v34[6] = v23;
          v35 = 1024;
          v36 = v25;
          v7 = " [%s] %s:%d %@(%p) Fetching isMicrophoneMuted=%{BOOL}d, avAudioSession=%@ isMuteStateCached=%{BOOL}d";
          v8 = v21;
          v9 = 70;
          goto LABEL_26;
        }
      }
    }
  }
}

- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__VCAudioSessionAVAS_setMuteStateChangedHandler_delegateQueue___block_invoke;
  v5[3] = &unk_1E9E53330;
  v5[5] = a4;
  v5[6] = a3;
  v5[4] = self;
  dispatch_sync(dispatchQueue, v5);
}

void __63__VCAudioSessionAVAS_setMuteStateChangedHandler_delegateQueue___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = *(const void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(const void **)(v3 + 336);
  if (v2 != v4)
  {
    _Block_release(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = _Block_copy(*(const void **)(a1 + 48));
    v3 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(NSObject **)(a1 + 40);
  v6 = *(NSObject **)(v3 + 344);
  if (v5 != v6)
  {
    if (v6)
    {
      dispatch_release(v6);
      v5 = *(NSObject **)(a1 + 40);
    }
    if (v5)
      dispatch_retain(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344) = v5;
  }
}

+ (unsigned)muteReasonFromMuteChangedInfo:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C896E0]);
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)*MEMORY[0x1E0C896D8], "isEqualToString:", v3) & 1) != 0;
}

- (void)dispatchedInvokeMuteStateChangedHandlerWithIsMuted:(BOOL)a3 reason:(unsigned __int8)a4
{
  int v4;
  _BOOL4 v5;
  id muteStateChangedHandler;
  NSObject *muteStateChangedHandlerQueue;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  OS_dispatch_queue *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  OS_dispatch_queue *v20;
  _QWORD v21[5];
  BOOL v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  _BYTE v32[10];
  _BYTE v33[10];
  __int16 v34;
  id v35;
  __int16 v36;
  OS_dispatch_queue *v37;
  uint64_t v38;

  v4 = a4;
  v5 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  muteStateChangedHandler = self->_muteStateChangedHandler;
  if (muteStateChangedHandler)
  {
    muteStateChangedHandlerQueue = self->_muteStateChangedHandlerQueue;
    if (muteStateChangedHandlerQueue)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __80__VCAudioSessionAVAS_dispatchedInvokeMuteStateChangedHandlerWithIsMuted_reason___block_invoke;
      v21[3] = &unk_1E9E57298;
      v21[4] = muteStateChangedHandler;
      v22 = v5;
      v23 = v4;
      dispatch_async(muteStateChangedHandlerQueue, v21);
      return;
    }
  }
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v12 = self->_muteStateChangedHandler;
    v13 = self->_muteStateChangedHandlerQueue;
    *(_DWORD *)buf = 136316674;
    v25 = v10;
    v26 = 2080;
    v27 = "-[VCAudioSessionAVAS dispatchedInvokeMuteStateChangedHandlerWithIsMuted:reason:]";
    v28 = 1024;
    v29 = 781;
    v30 = 1024;
    *(_DWORD *)v31 = v5;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v4;
    *(_WORD *)v32 = 2112;
    *(_QWORD *)&v32[2] = v12;
    *(_WORD *)v33 = 2112;
    *(_QWORD *)&v33[2] = v13;
    v14 = " [%s] %s:%d Attempting to propagate an isMuted=%{BOOL}d event with reason=%hhu without a handler=%@ or handler queue=%@";
    v15 = v11;
    v16 = 60;
LABEL_15:
    _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (const __CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v9 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v19 = self->_muteStateChangedHandler;
      v20 = self->_muteStateChangedHandlerQueue;
      *(_DWORD *)buf = 136317186;
      v25 = v17;
      v26 = 2080;
      v27 = "-[VCAudioSessionAVAS dispatchedInvokeMuteStateChangedHandlerWithIsMuted:reason:]";
      v28 = 1024;
      v29 = 781;
      v30 = 2112;
      *(_QWORD *)v31 = v9;
      *(_WORD *)&v31[8] = 2048;
      *(_QWORD *)v32 = self;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)v33 = v5;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v4;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      v14 = " [%s] %s:%d %@(%p) Attempting to propagate an isMuted=%{BOOL}d event with reason=%hhu without a handler=%@ o"
            "r handler queue=%@";
      v15 = v18;
      v16 = 80;
      goto LABEL_15;
    }
  }
}

uint64_t __80__VCAudioSessionAVAS_dispatchedInvokeMuteStateChangedHandlerWithIsMuted_reason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)handleAudioSessionInputMuteChangeNotification:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  char *v26;
  os_log_t *v27;
  uint64_t v28;
  NSObject *v29;
  char *v30;
  os_log_t *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  char *v35;
  os_log_t *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *dispatchQueue;
  char *v40;
  os_log_t *v41;
  uint64_t v42;
  NSObject *v43;
  char v44;
  char v45;
  _QWORD block[5];
  char v47;
  char v48;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  VCAudioSessionAVAS *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!VCFeatureFlagManager_SessionBasedMutingEnabled())
  {
    if ((VCAudioSessionAVAS *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315906;
      v52 = v12;
      v53 = 2080;
      v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
      v55 = 1024;
      v56 = 798;
      v57 = 2112;
      v58 = (const char *)a3;
      v14 = " [%s] %s:%d Dropping session input mute notification=%@ because SessionBasedMuting is NOT enabled.";
      v15 = v13;
      v16 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316418;
      v52 = v17;
      v53 = 2080;
      v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
      v55 = 1024;
      v56 = 798;
      v57 = 2112;
      v58 = (const char *)v10;
      v59 = 2048;
      v60 = self;
      v61 = 2112;
      v62 = a3;
      v14 = " [%s] %s:%d %@(%p) Dropping session input mute notification=%@ because SessionBasedMuting is NOT enabled.";
      v15 = v18;
      v16 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    return;
  }
  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C896E8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
    v8 = +[VCAudioSessionAVAS muteReasonFromMuteChangedInfo:](VCAudioSessionAVAS, "muteReasonFromMuteChangedInfo:", v5);
    if ((VCAudioSessionAVAS *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_62;
      __str = 0;
      if (v5)
        v19 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v19 = "<nil>";
      v34 = "NO";
      if (v7)
        v34 = "YES";
      asprintf(&__str, "Received mute state change notice=%s with currentMuteState=%s, muteReason=%hhu", v19, v34, v8);
      if (!__str)
        goto LABEL_62;
      v44 = v8;
      v45 = v7;
      __lasts = 0;
      v35 = strtok_r(__str, "\n", &__lasts);
      v36 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v37 = VRTraceErrorLogLevelToCSTR();
          v38 = *v36;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v52 = v37;
            v53 = 2080;
            v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
            v55 = 1024;
            v56 = 809;
            v57 = 2080;
            v58 = "";
            v59 = 2080;
            v60 = (VCAudioSessionAVAS *)v35;
            _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v35 = strtok_r(0, "\n", &__lasts);
      }
      while (v35);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (__CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_62;
      __str = 0;
      v21 = (const char *)-[__CFString UTF8String](v9, "UTF8String");
      if (v5)
        v22 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v22 = "<nil>";
      v25 = "NO";
      if (v7)
        v25 = "YES";
      asprintf(&__str, "%s(%p) Received mute state change notice=%s with currentMuteState=%s, muteReason=%hhu", v21, self, v22, v25, v8);
      if (!__str)
        goto LABEL_62;
      v44 = v8;
      v45 = v7;
      __lasts = 0;
      v26 = strtok_r(__str, "\n", &__lasts);
      v27 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *v27;
          if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v52 = v28;
            v53 = 2080;
            v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
            v55 = 1024;
            v56 = 809;
            v57 = 2080;
            v58 = "";
            v59 = 2080;
            v60 = (VCAudioSessionAVAS *)v26;
            _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v26 = strtok_r(0, "\n", &__lasts);
      }
      while (v26);
    }
    free(__str);
    LOBYTE(v8) = v44;
    LOBYTE(v7) = v45;
LABEL_62:
    dispatchQueue = self->super._dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__VCAudioSessionAVAS_handleAudioSessionInputMuteChangeNotification___block_invoke;
    block[3] = &unk_1E9E52A50;
    block[4] = self;
    v47 = v7;
    v48 = v8;
    dispatch_async(dispatchQueue, block);
    return;
  }
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      v20 = v5 ? (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "Malformed mute changed context=%s, dropping notification", v20);
      if (__str)
      {
        __lasts = 0;
        v40 = strtok_r(__str, "\n", &__lasts);
        v41 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v42 = VRTraceErrorLogLevelToCSTR();
            v43 = *v41;
            if (os_log_type_enabled(*v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v52 = v42;
              v53 = 2080;
              v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
              v55 = 1024;
              v56 = 804;
              v57 = 2080;
              v58 = "";
              v59 = 2080;
              v60 = (VCAudioSessionAVAS *)v40;
              _os_log_error_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v40 = strtok_r(0, "\n", &__lasts);
        }
        while (v40);
        goto LABEL_70;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (__CFString *)-[VCAudioSessionAVAS performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      v23 = (const char *)-[__CFString UTF8String](v11, "UTF8String");
      v24 = v5 ? (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) Malformed mute changed context=%s, dropping notification", v23, self, v24);
      if (__str)
      {
        __lasts = 0;
        v30 = strtok_r(__str, "\n", &__lasts);
        v31 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v32 = VRTraceErrorLogLevelToCSTR();
            v33 = *v31;
            if (os_log_type_enabled(*v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v52 = v32;
              v53 = 2080;
              v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
              v55 = 1024;
              v56 = 804;
              v57 = 2080;
              v58 = "";
              v59 = 2080;
              v60 = (VCAudioSessionAVAS *)v30;
              _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v30 = strtok_r(0, "\n", &__lasts);
        }
        while (v30);
LABEL_70:
        free(__str);
      }
    }
  }
}

uint64_t __68__VCAudioSessionAVAS_handleAudioSessionInputMuteChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedInvokeMuteStateChangedHandlerWithIsMuted:reason:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)handleSecureMicNotificationWithInterruptionInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C89708]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v15 = 136315650;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCAudioSessionAVAS handleSecureMicNotificationWithInterruptionInfo:]";
    v19 = 1024;
    v20 = 820;
    v10 = " [%s] %s:%d No interruption reason provided";
    v11 = v9;
    v12 = 28;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return;
  }
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 != 2)
  {
    if (ErrorLogLevelForModule < 6)
      return;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v15 = 136315906;
    v16 = v13;
    v17 = 2080;
    v18 = "-[VCAudioSessionAVAS handleSecureMicNotificationWithInterruptionInfo:]";
    v19 = 1024;
    v20 = 833;
    v21 = 2048;
    v22 = v4;
    v10 = " [%s] %s:%d Interruption reason=%lu";
    v11 = v14;
    v12 = 38;
    goto LABEL_13;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = v6;
      v17 = 2080;
      v18 = "-[VCAudioSessionAVAS handleSecureMicNotificationWithInterruptionInfo:]";
      v19 = 1024;
      v20 = 829;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d BuiltInMicMuted interruption reason", (uint8_t *)&v15, 0x1Cu);
    }
  }
  -[VCAudioClientManager secureMicrophoneEngagedNotification](+[VCAudioClientManager sharedInstance](VCAudioClientManager, "sharedInstance"), "secureMicrophoneEngagedNotification");
}

- (void)handleAudioSessionInterruption:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C89718]);
  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (v4)
          v9 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        else
          v9 = "<nil>";
        v17 = 136316162;
        v18 = v7;
        v19 = 2080;
        v20 = "-[VCAudioSessionAVAS handleAudioSessionInterruption:]";
        v21 = 1024;
        v22 = 847;
        v23 = 2048;
        v24 = v6;
        v25 = 2080;
        v26 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d interruptionType=%lu, interruptInfo=%s", (uint8_t *)&v17, 0x30u);
      }
    }
    if (!v6)
    {
      -[VCAudioSession didInterruptionEnded](self, "didInterruptionEnded");
      return;
    }
    if (v6 == 1)
    {
      -[VCAudioSessionAVAS handleSecureMicNotificationWithInterruptionInfo:](self, "handleSecureMicNotificationWithInterruptionInfo:", v4);
      -[VCAudioSession didStop](self, "didStop");
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = v15;
        v19 = 2080;
        v20 = "-[VCAudioSessionAVAS handleAudioSessionInterruption:]";
        v21 = 1024;
        v22 = 858;
        v23 = 2048;
        v24 = v6;
        v12 = " [%s] %s:%d Unhandled session interruption: interruptionType=%lu";
        v13 = v16;
        v14 = 38;
        goto LABEL_18;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v10;
      v19 = 2080;
      v20 = "-[VCAudioSessionAVAS handleAudioSessionInterruption:]";
      v21 = 1024;
      v22 = 842;
      v12 = " [%s] %s:%d Interruption type id not provided.";
      v13 = v11;
      v14 = 28;
LABEL_18:
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }
}

- (void)handleOutputSampleRateChange:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCAudioSessionAVAS handleOutputSampleRateChange:]";
      v10 = 1024;
      v11 = 864;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notification that Output Sample Rate has changed", (uint8_t *)&v6, 0x1Cu);
    }
  }
  -[VCAudioSession didAvailableSampleRateChange](self, "didAvailableSampleRateChange");
  -[VCAudioSession setBlockSizeOnSampleRateChange](self, "setBlockSizeOnSampleRateChange");
}

- (void)handleAudioSessionMediaServicesWereLostNotification:(id)a3
{
  unsigned int vpOperatingMode;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  unsigned int v11;
  int playbackMode;
  AVAudioSession *avAudioSession;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  AVAudioSession *v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  vpOperatingMode = self->super._vpOperatingMode;
  if (vpOperatingMode - 4 >= 3)
  {
    if (vpOperatingMode)
      v7 = vpOperatingMode == 2;
    else
      v7 = 1;
    v6 = v7 && VCFeatureFlagManager_DaemonCrashRecovery();
  }
  else
  {
    v6 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(a3, "name");
      v11 = self->super._vpOperatingMode;
      playbackMode = self->super._playbackMode;
      avAudioSession = self->_avAudioSession;
      v16 = 136316930;
      v17 = v8;
      v18 = 2080;
      v19 = "-[VCAudioSessionAVAS handleAudioSessionMediaServicesWereLostNotification:]";
      v20 = 1024;
      v21 = 890;
      v22 = 2112;
      v23 = v10;
      v24 = 1024;
      v25 = v11;
      v26 = 1024;
      v27 = playbackMode;
      v28 = 2048;
      v29 = avAudioSession;
      v30 = 1024;
      v31 = v6;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notification=%@, _vpOperatingMode=%d, _playbackMode=%d, _avAudioSession=%p, daemonCrashRecoveryEnabled=%d", (uint8_t *)&v16, 0x42u);
    }
  }
  if (v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315650;
        v17 = v14;
        v18 = 2080;
        v19 = "-[VCAudioSessionAVAS handleAudioSessionMediaServicesWereLostNotification:]";
        v20 = 1024;
        v21 = 892;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Calling didStop.  Trying to restore connection.", (uint8_t *)&v16, 0x1Cu);
      }
    }
    -[VCAudioSession didStop](self, "didStop");
  }
  else
  {
    -[VCAudioSession serverDidDie](self, "serverDidDie");
  }
}

- (void)setupInputBeamforming
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d builtInMicPort is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  NSDictionary *micSourceFront;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSDictionary *micSourceBack;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  NSDictionary *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (a3 != 1)
  {
    if (!a3 && self->super._micSourceFront)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          micSourceFront = self->super._micSourceFront;
          v13 = 136315906;
          v14 = v5;
          v15 = 2080;
          v16 = "-[VCAudioSessionAVAS internalSelectMicrophoneWithType:]";
          v17 = 1024;
          v18 = 935;
          v19 = 2112;
          v20 = micSourceFront;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d applying front microphone preference _micSourceFront=%@", (uint8_t *)&v13, 0x26u);
        }
      }
      if ((VCMicrophonePreferencesAVAS_ApplyMicrophonePreferences(self->_avAudioSession, self->super._micSourceFront) & 1) == 0)
      {
        LOBYTE(v8) = 0;
        return v8;
      }
    }
LABEL_14:
    self->super._selectedMicrophone = a3;
    LOBYTE(v8) = 1;
    return v8;
  }
  if (!self->super._micSourceBack)
    goto LABEL_14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      micSourceBack = self->super._micSourceBack;
      v13 = 136315906;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VCAudioSessionAVAS internalSelectMicrophoneWithType:]";
      v17 = 1024;
      v18 = 939;
      v19 = 2112;
      v20 = micSourceBack;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d applying back microphone preference _micSourceBack=%@", (uint8_t *)&v13, 0x26u);
    }
  }
  v8 = VCMicrophonePreferencesAVAS_ApplyMicrophonePreferences(self->_avAudioSession, self->super._micSourceBack);
  if (v8)
    goto LABEL_14;
  return v8;
}

_BYTE *__VCAudioSessionAVAS_ScheduleNetworkUplinkClockUpdate_block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[384])
  {
    objc_msgSend(result, "dispatchedSetVPBlockConfigurationProperties:", 1);
    result = *(_BYTE **)(a1 + 32);
  }
  result[384] = 0;
  return result;
}

- (double)externalInputAudioLatency
{
  return self->_externalInputAudioLatency;
}

- (void)setExternalInputAudioLatency:(double)a3
{
  self->_externalInputAudioLatency = a3;
}

- (double)externalOutputAudioLatency
{
  return self->_externalOutputAudioLatency;
}

- (void)setExternalOutputAudioLatency:(double)a3
{
  self->_externalOutputAudioLatency = a3;
}

+ (void)selectorForNotification:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unrecognized notification=%@, returning NULL selector");
  OUTLINED_FUNCTION_3();
}

- (void)setSessionProperty:value:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _avAudioSession is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyRequestedProperties:propertyOrder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _avAudioSession is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyRequestedProperties:propertyOrder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Properties to set is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyRequestedProperty:defaultValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error: _avAudioSession is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyRequestedProperty:defaultValue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Setting propertyKey=%@ failed, value is nil.");
  OUTLINED_FUNCTION_3();
}

- (void)setBlockSize:sampleRate:force:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _avAudioSession is nil, cannot set block size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startSessionWithMediaProperties:sessionRef:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid state... ????", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session already stopped ?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
