@implementation VCTelephonyInterface

- (VCTelephonyInterface)init
{
  VCTelephonyInterface *v2;
  NSObject *CustomRootQueue;
  dispatch_queue_t v4;
  uint64_t v5;
  CoreTelephonyClient *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCTelephonyInterface *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VCTelephonyInterface;
  v2 = -[VCTelephonyInterface init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v2);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCTelephonyInterface.notificationQueue", 0, CustomRootQueue);
    v2->_notificationQueue = (OS_dispatch_queue *)v4;
    if (!v4)
    {
      if ((VCTelephonyInterface *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTelephonyInterface init].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCTelephonyInterface performSelector:](v2, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v19 = v10;
            v20 = 2080;
            v21 = "-[VCTelephonyInterface init]";
            v22 = 1024;
            v23 = 79;
            v24 = 2112;
            v25 = v7;
            v26 = 2048;
            v27 = v2;
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create queue", buf, 0x30u);
          }
        }
      }
      goto LABEL_24;
    }
    v5 = _CTServerConnectionCreateOnTargetQueue();
    v2->_connection = (__CTServerConnection *)v5;
    if (!v5)
    {
      if ((VCTelephonyInterface *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTelephonyInterface init].cold.3();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)-[VCTelephonyInterface performSelector:](v2, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v19 = v13;
            v20 = 2080;
            v21 = "-[VCTelephonyInterface init]";
            v22 = 1024;
            v23 = 90;
            v24 = 2112;
            v25 = v8;
            v26 = 2048;
            v27 = v2;
            _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) _CTServerConnectionCreateOnTargetQueue failed", buf, 0x30u);
          }
        }
      }
    }
    v6 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_notificationQueue);
    v2->_coreTelephonyClient = v6;
    -[CoreTelephonyClient setDelegate:](v6, "setDelegate:", v2);
    if (!v2->_coreTelephonyClient)
    {
      if ((VCTelephonyInterface *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTelephonyInterface init].cold.2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[VCTelephonyInterface performSelector:](v2, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v19 = v15;
            v20 = 2080;
            v21 = "-[VCTelephonyInterface init]";
            v22 = 1024;
            v23 = 97;
            v24 = 2112;
            v25 = v9;
            v26 = 2048;
            v27 = v2;
            _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CoreTelephonyClient init failed", buf, 0x30u);
          }
        }
      }
    }
    if (!v2->_connection && !v2->_coreTelephonyClient)
    {

LABEL_24:
      return 0;
    }
  }
  return v2;
}

uint64_t __28__VCTelephonyInterface_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleTelephonyNotification:withInfo:", a2, a3);
}

- (VCTelephonyInterface)initWithTelephonySubscriptionSlot:(int64_t)a3
{
  VCTelephonyInterface *v4;
  VCTelephonyInterface *v5;

  v4 = -[VCTelephonyInterface init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_subscriptionSlot = a3;
    v4->_ctSubscriptionSlot = +[VCTelephonyInterface ctSubscriptionSlotForSubscriptionSlot:](VCTelephonyInterface, "ctSubscriptionSlotForSubscriptionSlot:", a3);
    v5->_ctSubscriptionContext = (CTXPCServiceSubscriptionContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E28]), "initWithSlot:", v5->_ctSubscriptionSlot);
  }
  return v5;
}

- (void)dealloc
{
  __CTServerConnection *connection;
  NSObject *notificationQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VCTelephonyInterface unregisterForNotifications](self, "unregisterForNotifications");
  connection = self->_connection;
  if (connection)
    CFRelease(connection);
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
    dispatch_release(notificationQueue);

  objc_storeWeak(&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)VCTelephonyInterface;
  -[VCTelephonyInterface dealloc](&v5, sel_dealloc);
}

- (BOOL)getCarrierBundleValue:(id *)a3 forKey:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v7, "addObject:", CFSTR("IMSConfig"));
  objc_msgSend(v7, "addObject:", CFSTR("Media"));
  objc_msgSend(v7, "addObject:", CFSTR("VoiceOnAP"));
  objc_msgSend(v7, "addObject:", CFSTR("RateAdaptationAlgorithms"));
  objc_msgSend(v7, "addObject:", a4);
  v11[0] = 0;
  if (!self->_ctSubscriptionContext)
    return 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1, v11[0]);
  v9 = (void *)-[CoreTelephonyClient context:getCarrierBundleValue:error:](self->_coreTelephonyClient, "context:getCarrierBundleValue:error:", self->_ctSubscriptionContext, v7, v11);

  if (!v9)
    return 0;
  *a3 = v9;
  return 1;
}

- (unsigned)validateCarrierBundleConfigParameters:(id)a3 forKey:(id)a4 defaultValue:(unsigned int)a5 minValue:(unsigned int)a6 maxValue:(unsigned int)a7
{
  void *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v12 = a5;
  if (v11 && (v13 = objc_msgSend(v11, "intValue"), v12 = v13, v13 >= a6) && v13 <= a7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316162;
        v20 = v14;
        v21 = 2080;
        v22 = "-[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:]";
        v23 = 1024;
        v24 = 167;
        v25 = 2112;
        v26 = a4;
        v27 = 1024;
        v28 = v12;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Key=%@ present in carrier bundle, value=%d", (uint8_t *)&v19, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316418;
        v20 = v16;
        v21 = 2080;
        v22 = "-[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:]";
        v23 = 1024;
        v24 = 171;
        v25 = 2112;
        v26 = a4;
        v27 = 1024;
        v28 = v12;
        v29 = 1024;
        v30 = a5;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Key=%@ either not present in carrier bundle or out of range, value=%d default value=%d", (uint8_t *)&v19, 0x32u);
      }
    }
    return a5;
  }
  return v12;
}

- (void)setupVCMediaStreamRateAdaptationConfig:(tagVCMediaStreamRateAdaptationConfig *)a3
{
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCTelephonyInterface *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  a3->var0 = 0;
  if (-[VCTelephonyInterface getCarrierBundleValue:forKey:](self, "getCarrierBundleValue:forKey:", &v14, CFSTR("UplinkRateAdaptation")))
  {
    v5 = v14;
    a3->var0 = 1;
    if ((VCTelephonyInterface *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315906;
      v16 = v7;
      v17 = 2080;
      v18 = "-[VCTelephonyInterface setupVCMediaStreamRateAdaptationConfig:]";
      v19 = 1024;
      v20 = 181;
      v21 = 2112;
      v22 = v5;
      v9 = " [%s] %s:%d UplinkRateAdaptation config=%@";
      v10 = v8;
      v11 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCTelephonyInterface performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316418;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VCTelephonyInterface setupVCMediaStreamRateAdaptationConfig:]";
      v19 = 1024;
      v20 = 181;
      v21 = 2112;
      v22 = v6;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v5;
      v9 = " [%s] %s:%d %@(%p) UplinkRateAdaptation config=%@";
      v10 = v13;
      v11 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
    a3->var1.var0.var0 = -[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:](self, "validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:", v5, CFSTR("RateIncreaseMonitorPeriod"), 10, 1, 15);
    a3->var1.var0.var2 = -[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:](self, "validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:", v5, CFSTR("RateDecreaseMonitorPeriod"), 5, 1, 15);
    a3->var1.var0.var1 = -[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:](self, "validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:", v5, CFSTR("RateIncreaseUplinkBLERThreshold"), 0, 0, 100);
    a3->var1.var0.var3 = -[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:](self, "validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:", v5, CFSTR("RateDecreaseUplinkBLERThreshold"), 10, 0, 100);
  }
}

- (BOOL)registerForNotifications
{
  const __CFString *v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  const __CFString *v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  _BYTE v33[10];
  _BYTE v34[10];
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)*MEMORY[0x1E0CA70B0];
  v4 = _CTServerConnectionRegisterForNotification();
  v5 = v4;
  v6 = HIDWORD(v4);
  v7 = HIDWORD(v4) | v4;
  if (v4)
  {
    if ((VCTelephonyInterface *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v26 = v13;
          v27 = 2080;
          v28 = "-[VCTelephonyInterface registerForNotifications]";
          v29 = 1024;
          v30 = 194;
          v31 = 2080;
          *(_QWORD *)v32 = CFStringGetCStringPtr(v3, 0x8000100u);
          *(_WORD *)&v32[8] = 1024;
          *(_DWORD *)v33 = v5;
          *(_WORD *)&v33[4] = 1024;
          *(_DWORD *)&v33[6] = v6;
          v15 = " [%s] %s:%d _CTServerConnectionRegisterForNotification(%s) failed (%d.%d)\n";
          v16 = v14;
          v17 = 50;
LABEL_22:
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCTelephonyInterface performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316930;
          v26 = v18;
          v27 = 2080;
          v28 = "-[VCTelephonyInterface registerForNotifications]";
          v29 = 1024;
          v30 = 194;
          v31 = 2112;
          *(_QWORD *)v32 = v8;
          *(_WORD *)&v32[8] = 2048;
          *(_QWORD *)v33 = self;
          *(_WORD *)&v33[8] = 2080;
          *(_QWORD *)v34 = CFStringGetCStringPtr(v3, 0x8000100u);
          *(_WORD *)&v34[8] = 1024;
          v35 = v5;
          v36 = 1024;
          v37 = v6;
          v15 = " [%s] %s:%d %@(%p) _CTServerConnectionRegisterForNotification(%s) failed (%d.%d)\n";
          v16 = v19;
          v17 = 70;
          goto LABEL_22;
        }
      }
    }
  }
  else
  {
    v9 = _CTServerConnectionCopyAudioVocoderInfo();
    v10 = v9;
    v11 = HIDWORD(v9);
    if ((VCTelephonyInterface *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v26 = v20;
          v27 = 2080;
          v28 = "-[VCTelephonyInterface registerForNotifications]";
          v29 = 1024;
          v30 = 204;
          v31 = 1024;
          *(_DWORD *)v32 = v10;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v11;
          v15 = " [%s] %s:%d _CTServerConnectionCopyAudioVocoderInfo failed (%d.%d)\n";
          v16 = v21;
          v17 = 40;
          goto LABEL_22;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCTelephonyInterface performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v26 = v22;
          v27 = 2080;
          v28 = "-[VCTelephonyInterface registerForNotifications]";
          v29 = 1024;
          v30 = 204;
          v31 = 2112;
          *(_QWORD *)v32 = v12;
          *(_WORD *)&v32[8] = 2048;
          *(_QWORD *)v33 = self;
          *(_WORD *)&v33[8] = 1024;
          *(_DWORD *)v34 = v10;
          *(_WORD *)&v34[4] = 1024;
          *(_DWORD *)&v34[6] = v11;
          v15 = " [%s] %s:%d %@(%p) _CTServerConnectionCopyAudioVocoderInfo failed (%d.%d)\n";
          v16 = v23;
          v17 = 60;
          goto LABEL_22;
        }
      }
    }
  }
  return v7 == 0;
}

- (void)unregisterForNotifications
{
  _CTServerConnectionUnregisterForNotification();
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (VCTelephonyInterfaceDelegate)delegate
{
  return (VCTelephonyInterfaceDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)getAnbrActivationStateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCTelephonyInterface getAnbrActivationStateWithCompletionHandler:]";
      v11 = 1024;
      v12 = 229;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Querying CoreTelephony for ANBR enabled state", (uint8_t *)&v7, 0x1Cu);
    }
  }
  -[CoreTelephonyClient getAnbrActivationState:completion:](self->_coreTelephonyClient, "getAnbrActivationState:completion:", self->_ctSubscriptionContext, a3);
}

- (void)queryAnbrBitrateRecommendation:(unsigned int)a3 direction:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v7 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316162;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCTelephonyInterface queryAnbrBitrateRecommendation:direction:completionHandler:]";
      v16 = 1024;
      v17 = 238;
      v18 = 1024;
      v19 = v7;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Querying CoreTelephony for the access network bitrate=%d, for direction=%ld", (uint8_t *)&v12, 0x2Cu);
    }
  }
  v11 = +[VCTelephonyInterface ctDirectionForTelephonyLinkDirection:](VCTelephonyInterface, "ctDirectionForTelephonyLinkDirection:", a4);
  -[CoreTelephonyClient queryAnbrBitrate:bitrate:direction:completion:](self->_coreTelephonyClient, "queryAnbrBitrate:bitrate:direction:completion:", self->_ctSubscriptionContext, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), v11, a5);
}

- (void)handleTelephonyNotification:(id)a3 withInfo:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    goto LABEL_9;
  v7 = VRTraceErrorLogLevelToCSTR();
  v8 = *MEMORY[0x1E0CF2758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    goto LABEL_9;
  if (!a3)
  {
    v9 = "<nil>";
    if (a4)
      goto LABEL_5;
LABEL_7:
    v10 = "<nil>";
    goto LABEL_8;
  }
  v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
  if (!a4)
    goto LABEL_7;
LABEL_5:
  v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_8:
  v11 = 136316162;
  v12 = v7;
  v13 = 2080;
  v14 = "-[VCTelephonyInterface handleTelephonyNotification:withInfo:]";
  v15 = 1024;
  v16 = 248;
  v17 = 2080;
  v18 = v9;
  v19 = 2080;
  v20 = v10;
  _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTelephonyInterface: received notification %s, info %s", (uint8_t *)&v11, 0x30u);
LABEL_9:
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70B0]))
    -[VCTelephonyInterface handleVocoderNotificationWithInfo:](self, "handleVocoderNotificationWithInfo:", a4);
}

- (void)handleVocoderNotificationWithInfo:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v7 = "<nil>";
      v11 = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[VCTelephonyInterface handleVocoderNotificationWithInfo:]";
      v15 = 1024;
      v16 = 257;
      v17 = 2080;
      v18 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTelephonyInterface: received info %s", (uint8_t *)&v11, 0x26u);
    }
  }
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA70C0]);
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA70B8]);
  v10 = -[VCTelephonyInterface translateVocoderTypeToCoreAudioType:](self, "translateVocoderTypeToCoreAudioType:", v8);
  if (v10)
    -[VCTelephonyInterfaceDelegate telephonyInterface:vocoderInfoChangedToType:sampleRate:](-[VCTelephonyInterface delegate](self, "delegate"), "telephonyInterface:vocoderInfoChangedToType:sampleRate:", self, v10, v9);
}

- (id)translateVocoderTypeToCoreAudioType:(id)a3
{
  int v4;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA7120]) & 1) != 0)
  {
    v4 = 1902341232;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  v4 = 1702261346;
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70F8]) & 1) != 0)
  {
    v4 = 1702261347;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA7100]) & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  v4 = 880176738;
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70C8]) & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70D8]) & 1) != 0)
  {
    v4 = 880179042;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70D0]) & 1) != 0)
  {
    v4 = 880176759;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA7110]) & 1) != 0)
  {
    v4 = 1718755360;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA7118]) & 1) != 0)
  {
    v4 = 1752309792;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70F0]) & 1) != 0)
  {
    v4 = 1701212704;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  v4 = 1935764850;
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70E0]) & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA7128]) & 1) != 0)
  {
    v4 = 1935767394;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA70E8]) & 1) != 0)
  {
    v4 = 1700883826;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA7108]) & 1) != 0)
  {
    v4 = 1936029299;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", FourccToCStr(v4), 1);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCTelephonyInterface translateVocoderTypeToCoreAudioType:]";
      v12 = 1024;
      v13 = 300;
      v14 = 2080;
      v15 = objc_msgSend(a3, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTelephonyInterface: translateVocoderTypeToCoreAudioType - invalid vocoder type %s", (uint8_t *)&v8, 0x26u);
    }
  }
  return 0;
}

- (unsigned)getSampleRateFromAudioCodecInfo:(id)a3
{
  if (objc_msgSend(a3, "codec"))
  {
    if (objc_msgSend(a3, "codec") == 1)
      return 16000;
    if (objc_msgSend(a3, "codec") != 2)
      return 32000;
    if (objc_msgSend(a3, "evsBandwidth"))
    {
      if (objc_msgSend(a3, "evsBandwidth") == 1)
        return 16000;
      objc_msgSend(a3, "evsBandwidth");
      return 32000;
    }
  }
  return 8000;
}

- (void)notifyCodecModeChangeEventToCT:(_VCAudioCodecModeChangeEvent *)a3
{
  unint64_t v5;
  id v6;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", a3->payload);
  v6 = objc_alloc_init(MEMORY[0x1E0CA6CE8]);
  objc_msgSend(v6, "setCallId:", 111);
  objc_msgSend(v6, "setCodec:", +[VCPayloadUtils ctAudioCodecTypeForMediaStreamCodec:](VCPayloadUtils, "ctAudioCodecTypeForMediaStreamCodec:", v5));
  if (v5 - 1 > 1)
  {
    if (v5 <= 0x11 && ((1 << v5) & 0x20018) != 0)
    {
      objc_msgSend(v6, "setEvsBitrate:", +[VCPayloadUtils ctAudioCodecEVSBitrateForBitrate:](VCPayloadUtils, "ctAudioCodecEVSBitrateForBitrate:", a3->codecBitrate));
      objc_msgSend(v6, "setEvsBandwidth:", +[VCPayloadUtils ctAudioCodecEVSBandwidthForAudioCodecBandwidth:](VCPayloadUtils, "ctAudioCodecEVSBandwidthForAudioCodecBandwidth:", a3->codecBandwidth));
    }
  }
  else
  {
    objc_msgSend(v6, "setAmrMode:", a3->codecRateMode);
  }
  objc_msgSend(v6, "setSampleRate:", -[VCTelephonyInterface getSampleRateFromAudioCodecInfo:](self, "getSampleRateFromAudioCodecInfo:", v6));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCTelephonyInterface notifyCodecModeChangeEventToCT:]";
      v14 = 1024;
      v15 = 345;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Notifying CoreTelephony of current audio settings %@", (uint8_t *)&v10, 0x26u);
    }
  }
  -[CoreTelephonyClient setVoLTEAudioCodec:codecInfo:completion:](self->_coreTelephonyClient, "setVoLTEAudioCodec:codecInfo:completion:", self->_ctSubscriptionContext, v6, &__block_literal_global_101);

}

void __55__VCTelephonyInterface_notifyCodecModeChangeEventToCT___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCTelephonyInterface notifyCodecModeChangeEventToCT:]_block_invoke";
      v9 = 1024;
      v10 = 348;
      v11 = 2112;
      v12 = a2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreTelephony setVoLTEAudioCodec returned with error %@", (uint8_t *)&v5, 0x26u);
    }
  }
}

+ (int64_t)ctSubscriptionSlotForSubscriptionSlot:(int64_t)a3
{
  int64_t v3;
  BOOL v4;

  v3 = 1;
  if (a3 == 2)
    v3 = 2;
  if (a3)
    v4 = a3 <= 2;
  else
    v4 = 0;
  if (v4)
    return v3;
  else
    return 0;
}

+ (int)ctDirectionForTelephonyLinkDirection:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

+ (int64_t)telephonyLinkDirectionForCtDirection:(int)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (void)anbrActivationState:(id)a3 enabled:(BOOL)a4
{
  uint64_t v6;
  NSObject *notificationQueue;
  _QWORD block[5];
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "slotID");
  if (v6 == -[CTXPCServiceSubscriptionContext slotID](self->_ctSubscriptionContext, "slotID"))
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__VCTelephonyInterface_anbrActivationState_enabled___block_invoke;
    block[3] = &unk_1E9E521E8;
    block[4] = self;
    v9 = a4;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __52__VCTelephonyInterface_anbrActivationState_enabled___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  _BYTE v14[24];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)v14 = 136315906;
        *(_QWORD *)&v14[4] = v3;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCTelephonyInterface anbrActivationState:enabled:]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 403;
        WORD2(v15) = 1024;
        *(_DWORD *)((char *)&v15 + 6) = v5;
        v6 = " [%s] %s:%d ANBR activation state enabled=%{BOOL}d";
        v7 = v4;
        v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v14, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)v14 = 136316418;
        *(_QWORD *)&v14[4] = v9;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCTelephonyInterface anbrActivationState:enabled:]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 403;
        WORD2(v15) = 2112;
        *(_QWORD *)((char *)&v15 + 6) = v2;
        HIWORD(v15) = 2048;
        v16 = v11;
        LOWORD(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 2) = v12;
        v6 = " [%s] %s:%d %@(%p) ANBR activation state enabled=%{BOOL}d";
        v7 = v10;
        v8 = 54;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17, v18), "telephonyInterface:anbrActivationUpdate:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)anbrBitrateRecommendation:(id)a3 bitrate:(id)a4 direction:(int)a5
{
  uint64_t v5;
  uint64_t v8;
  int64_t v9;
  NSObject *notificationQueue;
  _QWORD block[7];
  int v12;
  uint64_t v13;

  v5 = *(_QWORD *)&a5;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a3, "slotID");
  if (v8 == -[CTXPCServiceSubscriptionContext slotID](self->_ctSubscriptionContext, "slotID"))
  {
    if (objc_msgSend(a4, "unsignedIntValue"))
    {
      if ((_DWORD)v5)
      {
        v9 = +[VCTelephonyInterface telephonyLinkDirectionForCtDirection:](VCTelephonyInterface, "telephonyLinkDirectionForCtDirection:", v5);
        notificationQueue = self->_notificationQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __68__VCTelephonyInterface_anbrBitrateRecommendation_bitrate_direction___block_invoke;
        block[3] = &unk_1E9E55A90;
        block[4] = self;
        block[5] = a4;
        v12 = v5;
        block[6] = v9;
        dispatch_async(notificationQueue, block);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:].cold.1();
    }
  }
}

uint64_t __68__VCTelephonyInterface_anbrBitrateRecommendation_bitrate_direction___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  int v14;
  _BYTE v16[24];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue");
        v6 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)v16 = 136316162;
        *(_QWORD *)&v16[4] = v3;
        *(_WORD *)&v16[12] = 2080;
        *(_QWORD *)&v16[14] = "-[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:]_block_invoke";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 419;
        WORD2(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 6) = v5;
        WORD5(v17) = 1024;
        HIDWORD(v17) = v6;
        v7 = " [%s] %s:%d ANBR bitrate recommendation bitrate=%d direction=%d";
        v8 = v4;
        v9 = 40;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v16, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue");
        v14 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)v16 = 136316674;
        *(_QWORD *)&v16[4] = v10;
        *(_WORD *)&v16[12] = 2080;
        *(_QWORD *)&v16[14] = "-[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:]_block_invoke";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 419;
        WORD2(v17) = 2112;
        *(_QWORD *)((char *)&v17 + 6) = v2;
        HIWORD(v17) = 2048;
        v18 = v12;
        LOWORD(v19) = 1024;
        *(_DWORD *)((char *)&v19 + 2) = v13;
        HIWORD(v19) = 1024;
        LODWORD(v20) = v14;
        v7 = " [%s] %s:%d %@(%p) ANBR bitrate recommendation bitrate=%d direction=%d";
        v8 = v11;
        v9 = 60;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18, v19, v20), "telephonyInterface:anbrRecommendation:forDirection:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue"), *(_QWORD *)(a1 + 48));
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _CTServerConnectionCreateOnTargetQueue failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)anbrBitrateRecommendation:bitrate:direction:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected bitrate recommendation, ignoring ...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)anbrBitrateRecommendation:bitrate:direction:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unknown direction is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
