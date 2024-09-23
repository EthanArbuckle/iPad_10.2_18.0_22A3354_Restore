@implementation VCSessionSwitches

- (VCSessionSwitches)initWithConversationID:(id)a3
{
  VCSessionSwitches *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __CFString **v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  __CFString *v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  NSString *conversationID;
  unint64_t switches;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  NSString *v32;
  unint64_t v33;
  __int128 v35;
  objc_super v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  VCSessionSwitches *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)VCSessionSwitches;
  v4 = -[VCSessionSwitches init](&v36, sel_init);
  if (!v4)
    return v4;
  v4->_conversationID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "UUIDString"), "copy");
  v5 = objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 310);
  v6 = 0;
  *(_QWORD *)&v7 = 136315906;
  v35 = v7;
  do
  {
    v8 = &contextConfigurations[v6];
    -[__CFString UTF8String](contextConfigurations[v6 + 1], "UTF8String", v35);
    if ((_os_feature_enabled_impl() & 1) != 0)
      goto LABEL_14;
    if ((VCSessionSwitches *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v8[1];
          *(_DWORD *)buf = v35;
          v38 = v16;
          v39 = 2080;
          v40 = "-[VCSessionSwitches initWithConversationID:]";
          v41 = 1024;
          v42 = 78;
          v43 = 2112;
          v44 = v18;
          v13 = v17;
          v14 = " [%s] %s:%d ! featureflag=%@ is NOT enabled, examine if VCSessionSwitchContext contextConfigrations is setup properly!";
          v15 = 38;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v9 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSessionSwitches performSelector:](v4, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = v8[1];
          *(_DWORD *)buf = 136316418;
          v38 = v10;
          v39 = 2080;
          v40 = "-[VCSessionSwitches initWithConversationID:]";
          v41 = 1024;
          v42 = 78;
          v43 = 2112;
          v44 = v9;
          v45 = 2048;
          v46 = v4;
          v47 = 2112;
          v48 = (uint64_t)v12;
          v13 = v11;
          v14 = " [%s] %s:%d %@(%p) ! featureflag=%@ is NOT enabled, examine if VCSessionSwitchContext contextConfigratio"
                "ns is setup properly!";
          v15 = 58;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
        }
      }
    }
LABEL_14:
    +[VCSessionSwitches generateRandomNumberWithConversationID:featureString:](VCSessionSwitches, "generateRandomNumberWithConversationID:featureString:", v4->_conversationID, v8[2]);
    if (*v8)
    {
      v20 = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:normalizedRandom:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:normalizedRandom:", *v8, v8[1], "AVConference", -[__CFString UTF8String](v8[1], "UTF8String"), v19);
LABEL_16:
      v21 = v20;
      goto LABEL_21;
    }
    if (v5 && contextConfigurations[v6 + 3])
    {
      v20 = -[VCSessionSwitches trialEnablementWithClient:Context:normalizedRandom:](v4, "trialEnablementWithClient:Context:normalizedRandom:", v5, &contextConfigurations[v6], v19);
      goto LABEL_16;
    }
    v21 = 0;
LABEL_21:
    -[VCSessionSwitches setFeature:isEnabled:](v4, "setFeature:isEnabled:", contextConfigurations[v6 + 4], v21);
    v6 += 5;
  }
  while (v6 != 20);
  if ((VCSessionSwitches *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        switches = v4->_switches;
        conversationID = v4->_conversationID;
        *(_DWORD *)buf = 136316418;
        v38 = v23;
        v39 = 2080;
        v40 = "-[VCSessionSwitches initWithConversationID:]";
        v41 = 1024;
        v42 = 92;
        v43 = 2112;
        v44 = (const __CFString *)conversationID;
        v45 = 2048;
        v46 = (VCSessionSwitches *)switches;
        v47 = 2048;
        v48 = 4;
        v27 = " [%s] %s:%d _conversationID=%@, sessionSwitches=0x%llx, featureCount=%zu";
        v28 = v24;
        v29 = 58;
        goto LABEL_32;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSessionSwitches performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v33 = v4->_switches;
        v32 = v4->_conversationID;
        *(_DWORD *)buf = 136316930;
        v38 = v30;
        v39 = 2080;
        v40 = "-[VCSessionSwitches initWithConversationID:]";
        v41 = 1024;
        v42 = 92;
        v43 = 2112;
        v44 = v22;
        v45 = 2048;
        v46 = v4;
        v47 = 2112;
        v48 = (uint64_t)v32;
        v49 = 2048;
        v50 = v33;
        v51 = 2048;
        v52 = 4;
        v27 = " [%s] %s:%d %@(%p) _conversationID=%@, sessionSwitches=0x%llx, featureCount=%zu";
        v28 = v31;
        v29 = 78;
LABEL_32:
        _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      }
    }
  }
  return v4;
}

- (BOOL)isFeatureEnabled:(unint64_t)a3
{
  return (self->_switches & a3) != 0;
}

+ (float)generateRandomNumberWithConversationID:(id)a3 featureString:(id)a4
{
  __CFString *v5;
  const void *v6;
  CC_LONG v7;
  __int128 v8;
  float v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  double v32;
  CC_SHA256_CTX c;
  unsigned __int8 md[16];
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a3, a4);
  v6 = (const void *)-[__CFString cStringUsingEncoding:](v5, "cStringUsingEncoding:", 4);
  v7 = -[__CFString lengthOfBytesUsingEncoding:](v5, "lengthOfBytesUsingEncoding:", 4);
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)md = v8;
  v35 = v8;
  *(_QWORD *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v8;
  *(_OWORD *)&c.wbuf[10] = v8;
  *(_OWORD *)&c.hash[6] = v8;
  *(_OWORD *)&c.wbuf[2] = v8;
  *(_OWORD *)c.count = v8;
  *(_OWORD *)&c.hash[2] = v8;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, v6, v7);
  CC_SHA256_Final(md, &c);
  v9 = (double)*(unint64_t *)md * 5.42101086e-20;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v20 = v11;
        v21 = 2080;
        v22 = "+[VCSessionSwitches generateRandomNumberWithConversationID:featureString:]";
        v23 = 1024;
        v24 = 117;
        v25 = 2112;
        v26 = v5;
        v27 = 2048;
        v28 = v9;
        v13 = " [%s] %s:%d concatenatedString=%@, randomByUUIDAndFeature=%f";
        v14 = v12;
        v15 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v20 = v16;
        v21 = 2080;
        v22 = "+[VCSessionSwitches generateRandomNumberWithConversationID:featureString:]";
        v23 = 1024;
        v24 = 117;
        v25 = 2112;
        v26 = v10;
        v27 = 2048;
        v28 = *(double *)&a1;
        v29 = 2112;
        v30 = v5;
        v31 = 2048;
        v32 = v9;
        v13 = " [%s] %s:%d %@(%p) concatenatedString=%@, randomByUUIDAndFeature=%f";
        v14 = v17;
        v15 = 68;
        goto LABEL_11;
      }
    }
  }
  return v9;
}

+ (id)featureFlagAndDefaultNameForFeature:(unint64_t)a3
{
  uint64_t v3;

  v3 = 0;
  while (((unint64_t)contextConfigurations[v3 + 4] & a3) == 0)
  {
    v3 += 5;
    if (v3 == 20)
      return 0;
  }
  return contextConfigurations[v3 + 1];
}

- (void)setFeature:(unint64_t)a3 isEnabled:(BOOL)a4
{
  unint64_t v4;

  if (a4)
    v4 = self->_switches | a3;
  else
    v4 = self->_switches & ~a3;
  self->_switches = v4;
}

- (BOOL)trialEnablementWithClient:(id)a3 Context:(id *)a4 normalizedRandom:(double)a5
{
  unsigned int v8;
  double v9;
  uint64_t v10;

  objc_msgSend(a4->var1, "UTF8String");
  v8 = _os_feature_enabled_impl();
  objc_msgSend((id)objc_msgSend(a3, "levelForFactor:withNamespaceName:", CFSTR("samplingRate"), a4->var3), "doubleValue");
  if (v9 > a5)
    v10 = v8;
  else
    v10 = 0;
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", a4->var1, v10);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionSwitches;
  -[VCSessionSwitches dealloc](&v3, sel_dealloc);
}

- (unint64_t)switches
{
  return self->_switches;
}

@end
