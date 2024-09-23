@implementation VCScreenShare

- (VCScreenShare)initWithConfig:(id)a3 pid:(id)a4 captureSourceID:(id)a5
{
  VCScreenShare *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCScreenShare *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCScreenShare;
  v8 = -[VCScreenShare init](&v18, sel_init);
  if (v8)
  {
    if ((VCScreenShare *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315650;
      v20 = v10;
      v21 = 2080;
      v22 = "-[VCScreenShare initWithConfig:pid:captureSourceID:]";
      v23 = 1024;
      v24 = 34;
      v12 = " [%s] %s:%d ";
      v13 = v11;
      v14 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCScreenShare performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316162;
      v20 = v15;
      v21 = 2080;
      v22 = "-[VCScreenShare initWithConfig:pid:captureSourceID:]";
      v23 = 1024;
      v24 = 34;
      v25 = 2112;
      v26 = v9;
      v27 = 2048;
      v28 = v8;
      v12 = " [%s] %s:%d %@(%p) ";
      v13 = v16;
      v14 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_13:
    -[VCScreenShare setConfig:pid:captureSourceID:](v8, "setConfig:pid:captureSourceID:", a3, a4, a5);
    -[VCScreenShare setScreenVirtualDisplayLabelforConfig:](v8, "setScreenVirtualDisplayLabelforConfig:", a3);
    -[VCScreenShare setPrivateContentCaptureAllowedForConfig:](v8, "setPrivateContentCaptureAllowedForConfig:", a3);
  }
  return v8;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCScreenShare *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCScreenShare *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCScreenShare dealloc]";
        v16 = 1024;
        v17 = 43;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCScreenShare performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCScreenShare dealloc]";
        v16 = 1024;
        v17 = 43;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCScreenShare setClientPID:](self, "setClientPID:", 0);
  -[VCScreenShare setSelectiveScreenUUID:](self, "setSelectiveScreenUUID:", 0);
  -[VCScreenShare setExcludedApplicationBundleIDs:](self, "setExcludedApplicationBundleIDs:", 0);
  -[VCScreenShare setClientBundleID:](self, "setClientBundleID:", 0);

  v11.receiver = self;
  v11.super_class = (Class)VCScreenShare;
  -[VCScreenShare dealloc](&v11, sel_dealloc);
}

- (void)updateScreenCaptureWithConfig:(id)a3
{
  NSNumber *v5;

  v5 = -[VCScreenShare clientPID](self, "clientPID");
  -[VCScreenShare setConfig:pid:captureSourceID:](self, "setConfig:pid:captureSourceID:", a3, v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_captureSourceID));
}

- (void)setConfig:(id)a3 pid:(id)a4 captureSourceID:(id)a5
{
  NSArray *v9;
  BOOL v10;

  self->_width = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureWidth")), "intValue");
  self->_height = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureHeight")), "intValue");
  self->_frameRate = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureFramerate")), "intValue");
  self->_screenCaptureDisplayID = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureScreenDisplayID")), "intValue");
  self->_displayMode = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureScreenDisplayMode")), "intValue");
  -[VCScreenShare setClientBundleID:](self, "setClientBundleID:", objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureClientBundleID")));
  -[VCScreenShare setClientPID:](self, "setClientPID:", a4);
  self->_isWindowed = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureScreenIsWindowed")), "BOOLValue");
  self->_isCursorCaptured = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureIsCursorCaptured")), "BOOLValue");
  -[VCScreenShare setExcludedApplicationBundleIDs:](self, "setExcludedApplicationBundleIDs:", objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureCaptureExcludedBundleIDs")));
  self->_selectiveSharingPort = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureScreenMachPort")), "unsignedIntValue");
  -[VCScreenShare setSelectiveScreenUUID:](self, "setSelectiveScreenUUID:", objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureScreenUUID")));
  self->_captureSourceID = objc_msgSend(a5, "integerValue");
  v9 = -[VCScreenShare excludedApplicationBundleIDs](self, "excludedApplicationBundleIDs");
  v10 = (-[NSArray isEqual:](v9, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0
     && -[NSArray count](-[VCScreenShare excludedApplicationBundleIDs](self, "excludedApplicationBundleIDs"), "count") != 0;
  self->_contentRepickingAllowed = v10;
}

- (void)setScreenVirtualDisplayLabelforConfig:(id)a3
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
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
  __CFString *v22;
  __int16 v23;
  VCScreenShare *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[VCScreenShare clientBundleID](self, "clientBundleID", a3))
  {
    v4 = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceEnableScreenVirtualDisplayLabel"), 0);
    if (-[NSString isEqualToString:](-[VCScreenShare clientBundleID](self, "clientBundleID"), "isEqualToString:", CFSTR("com.apple.ScreenContinuityShell"))|| v4)
    {
      v5 = +[VCDefaults copyStringValueForKey:](VCDefaults, "copyStringValueForKey:", CFSTR("screenVirtualDisplayLabelName"));
      if (v5)
        v6 = v5;
      else
        v6 = CFSTR("Continuity");
      if ((VCScreenShare *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_18;
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        v15 = 136316162;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCScreenShare setScreenVirtualDisplayLabelforConfig:]";
        v19 = 1024;
        v20 = 83;
        v21 = 2112;
        v22 = v6;
        v23 = 1024;
        LODWORD(v24) = v4;
        v10 = " [%s] %s:%d screenVirtualDisplayLabel=%@ forceEnableScreenVirtualDisplayLabel=%d";
        v11 = v9;
        v12 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCScreenShare performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_18;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        v15 = 136316674;
        v16 = v13;
        v17 = 2080;
        v18 = "-[VCScreenShare setScreenVirtualDisplayLabelforConfig:]";
        v19 = 1024;
        v20 = 83;
        v21 = 2112;
        v22 = (__CFString *)v7;
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v6;
        v27 = 1024;
        v28 = v4;
        v10 = " [%s] %s:%d %@(%p) screenVirtualDisplayLabel=%@ forceEnableScreenVirtualDisplayLabel=%d";
        v11 = v14;
        v12 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
LABEL_18:
      self->_screenVirtualDisplayLabel = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v6);

    }
  }
}

- (void)setPrivateContentCaptureAllowedForConfig:(id)a3
{
  int IsInternalOSInstalled;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  __int128 v9;
  _BOOL4 v10;
  int v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  char v15;
  _BYTE v16[34];
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  _OWORD v25[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureXpcAuthToken"));
  v7 = v6 != 0;
  if (!v6)
    goto LABEL_16;
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureXpcAuthToken"));
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v16 = v9;
  *(_OWORD *)&v16[16] = v9;
  objc_msgSend(v8, "getBytes:length:", v16, 32);
  v25[0] = *(_OWORD *)v16;
  v25[1] = *(_OWORD *)&v16[16];
  if (!+[AVConferenceXPCServer clientWithToken:hasEntitlement:](AVConferenceXPCServer, "clientWithToken:hasEntitlement:", v25, CFSTR("com.apple.avconference.screencapture.privatecontent.allow")))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = 0;
  }
  else
  {
LABEL_16:
    if (-[VCScreenShare clientBundleID](self, "clientBundleID"))
    {
      v10 = -[NSString isEqualToString:](-[VCScreenShare clientBundleID](self, "clientBundleID"), "isEqualToString:", CFSTR("com.apple.ScreenContinuityShell"));
      v11 = -[NSString isEqualToString:](-[VCScreenShare clientBundleID](self, "clientBundleID"), "isEqualToString:", CFSTR("com.apple.CoreDevice.dtremotedisplayd")) & IsInternalOSInstalled;
      v12 = -[NSString isEqualToString:](-[VCScreenShare clientBundleID](self, "clientBundleID"), "isEqualToString:", CFSTR("com.apple.VideoConference.AVConferenceTestRunneriOS")) & IsInternalOSInstalled;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 136316930;
      *(_QWORD *)&v16[4] = v13;
      *(_WORD *)&v16[12] = 2080;
      *(_QWORD *)&v16[14] = "-[VCScreenShare setPrivateContentCaptureAllowedForConfig:]";
      *(_WORD *)&v16[22] = 1024;
      *(_DWORD *)&v16[24] = 110;
      *(_WORD *)&v16[28] = 1024;
      *(_DWORD *)&v16[30] = v7;
      v17 = 1024;
      v18 = v10;
      v19 = 1024;
      v20 = v11;
      v21 = 1024;
      v22 = v12;
      v23 = 1024;
      v24 = IsInternalOSInstalled;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hasEntitlement=%d, isNearbyScreenShare=%d, isCoreDeviceScreenShare=%d, isAVCAppTestRunner=%d, isInternalBuild=%d", v16, 0x3Au);
    }
  }
  if (!v7 || v10)
    v15 = v7;
  else
    v15 = v11 | v12;
  self->_privateContentCaptureAllowed = v15;
}

- (unsigned)height
{
  return self->_height;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (unsigned)screenCaptureDisplayID
{
  return self->_screenCaptureDisplayID;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (NSNumber)clientPID
{
  return self->_clientPID;
}

- (void)setClientPID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)isWindowed
{
  return self->_isWindowed;
}

- (BOOL)isCursorCaptured
{
  return self->_isCursorCaptured;
}

- (void)setIsCursorCaptured:(BOOL)a3
{
  self->_isCursorCaptured = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)privateContentCaptureAllowed
{
  return self->_privateContentCaptureAllowed;
}

- (NSString)screenVirtualDisplayLabel
{
  return self->_screenVirtualDisplayLabel;
}

- (BOOL)contentRepickingAllowed
{
  return self->_contentRepickingAllowed;
}

- (void)setContentRepickingAllowed:(BOOL)a3
{
  self->_contentRepickingAllowed = a3;
}

- (NSArray)excludedApplicationBundleIDs
{
  return self->_excludedApplicationBundleIDs;
}

- (void)setExcludedApplicationBundleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unsigned)selectiveSharingPort
{
  return self->_selectiveSharingPort;
}

- (NSString)selectiveScreenUUID
{
  return self->_selectiveScreenUUID;
}

- (void)setSelectiveScreenUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

@end
