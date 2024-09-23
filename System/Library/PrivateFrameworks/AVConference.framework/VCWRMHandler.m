@implementation VCWRMHandler

- (VCWRMHandler)init
{
  VCWRMHandler *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCWRMHandler;
  result = -[VCWRMHandler init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_localWRMLinkTypeSuggestion = -1;
  return result;
}

- (unsigned)processRemoteWRMSuggestion:(int)a3 isRemoteDuplicating:(BOOL)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  _BOOL4 isRemoteDuplicating;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
    return 0;
  if (self->_remoteWRMLinkTypeSuggestion == a3 && self->_isRemoteDuplicating == a4)
    return 1;
  self->_isRemoteDuplicating = a4;
  self->_remoteWRMLinkTypeSuggestion = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = "WiFi";
      isRemoteDuplicating = self->_isRemoteDuplicating;
      v12 = 136316162;
      v13 = v7;
      if (!a3)
        v9 = "Cellular";
      v15 = "-[VCWRMHandler processRemoteWRMSuggestion:isRemoteDuplicating:]";
      v16 = 1024;
      v11 = "without";
      v17 = 115;
      v14 = 2080;
      v18 = 2080;
      if (isRemoteDuplicating)
        v11 = "with";
      v19 = v9;
      v20 = 2080;
      v21 = v11;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Receive and cache remote iRAT suggestion to %s %s duplication", (uint8_t *)&v12, 0x30u);
    }
  }
  return 3;
}

- (int)localWRMLinkTypeSuggestion
{
  return self->_localWRMLinkTypeSuggestion;
}

- (int)remoteWRMLinkTypeSuggestion
{
  return self->_remoteWRMLinkTypeSuggestion;
}

- (BOOL)isRemoteDuplicating
{
  return self->_isRemoteDuplicating;
}

- (double)localLinkTypeSuggestionChangeTime
{
  return self->_localLinkTypeSuggestionChangeTime;
}

- (void)setLocalLinkTypeSuggestionChangeTime:(double)a3
{
  self->_localLinkTypeSuggestionChangeTime = a3;
}

@end
