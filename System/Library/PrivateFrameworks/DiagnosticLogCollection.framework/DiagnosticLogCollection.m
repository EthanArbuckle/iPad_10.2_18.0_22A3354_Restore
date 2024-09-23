uint64_t DLCSessionConnect()
{
  return 1;
}

uint64_t DLCSessionDiconnect()
{
  return 1;
}

uint64_t DLCSessionShouldLogLevel(uint64_t a1, uint64_t a2)
{
  if (a2)
    return IMShouldLogCategory();
  else
    return IMShouldLog();
}

uint64_t DLCSessionShouldLogCheckpoints()
{
  return IMShouldLog();
}

uint64_t DLCSessionBeginSession()
{
  uint64_t result;

  IMSyncLoggingsPreferences();
  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingBeginSession();
  return result;
}

uint64_t DLCSessionEndSession()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingEndSession();
  return result;
}

uint64_t DLCSessionLogCallInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if ((IMShouldLogCategory() & 1) != 0)
      return _IMLoggingLogCallInfo();
  }
  else if (IMShouldLog())
  {
    return _IMLoggingLogCallInfo();
  }
  return 0;
}

uint64_t DLCSessionNoteCheckpoint()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingNoteCheckpoint_V();
  return result;
}

uint64_t DLCSessionLogWithLevel()
{
  uint64_t result;

  result = IMShouldLogCategory();
  if ((_DWORD)result)
    return _IMLoggingLog_V();
  return result;
}

uint64_t DLCSessionLogWithLevelV()
{
  uint64_t result;

  result = IMShouldLogCategory();
  if ((_DWORD)result)
    return _IMLoggingLog_V();
  return result;
}

uint64_t DLCSessionPulse()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingPulse();
  return result;
}

uint64_t DLCSessionEvent()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingEvent();
  return result;
}

uint64_t DLCSessionPerformSnapshot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = IMShouldLog();
  if ((_DWORD)result)
  {
    v5 = (void *)MEMORY[0x20BD37044]();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, CFSTR("reasonForSnapshot"), 0);
    v6 = _IMLoggingActionWithUserInfo();
    objc_autoreleasePoolPop(v5);
    return v6;
  }
  return result;
}

uint64_t DLCSessionSetFailureReason()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingSetFailureReason();
  return result;
}

uint64_t DLCSessionSetInitiator()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingSetInitiator();
  return result;
}

uint64_t DLCSessionSetRecipient()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return _IMLoggingSetRecipient();
  return result;
}

uint64_t _DLCLogWithLevelFileAndLine()
{
  return _IMLogStringWithFileAndLine_V();
}

uint64_t DLCLogWithLevel()
{
  return _IMLogString_V();
}

uint64_t DLCLogEventWithLevel()
{
  return _IMLogEventString_V();
}

uint64_t DLCLogBacktraceWithLevel()
{
  return IMLogCurrentBacktrace_V();
}

uint64_t DLCLogBacktraceWithLevelV()
{
  return IMLogCurrentBacktrace_V();
}

uint64_t _DLCLogWithLevelV()
{
  return _IMLogString_V();
}

uint64_t DLCLogWithLevelV()
{
  return _IMLogString_V();
}

uint64_t _DLCLogEventWithLevelV()
{
  return _IMLogEventString_V();
}

uint64_t DLCLogEventWithLevelV()
{
  return _IMLogEventString_V();
}

uint64_t DLCWarn()
{
  return _IMWarnString_V();
}

uint64_t _DLCWarnV()
{
  return _IMWarnString_V();
}

uint64_t DLCWarnV()
{
  return _IMWarnString_V();
}

uint64_t DLCShouldLogLevel(uint64_t a1, uint64_t a2)
{
  if (a2)
    return IMShouldLogCategory();
  else
    return IMShouldLog();
}

uint64_t DLCCollectLogsWithCompletionHandler(uint64_t result, void *a2, void *a3)
{
  __CFDictionary *v5;
  const void *v6;
  const void *v7;
  id v8;

  if (result)
  {
    v5 = (__CFDictionary *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", objc_msgSend(a2, "objectForKey:", CFSTR("DLCLogGatheringFlagsKey")), CFSTR("collectionFlags"), objc_msgSend(a2, "objectForKey:", CFSTR("DLCAlertTitleKey")), CFSTR("title"), objc_msgSend(a2, "objectForKey:", CFSTR("DLCGatheringDisplayFlagsKey")), CFSTR("displayFlags"), 0);
    v6 = (const void *)objc_msgSend(a2, "objectForKey:", CFSTR("DLCDefaultRadarComponentKey"));
    if (v6)
      CFDictionarySetValue(v5, CFSTR("radarComponent"), v6);
    v7 = (const void *)objc_msgSend(a2, "objectForKey:", CFSTR("DLCDefaultRadarComponentKey"));
    if (v7)
      CFDictionarySetValue(v5, CFSTR("radarComponentVersion"), v7);
    v8 = (id)objc_msgSend(a3, "copy");
    return _IMLoggingActionWithUserInfo();
  }
  return result;
}

void sub_20B728988(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v7;
  id v8;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("logPath"));
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("replyAction")), "integerValue") != 14 || v5 == 0)
    v7 = 0;
  else
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v5, CFSTR("DLCLogPathKey"), 0);
  v8 = (id)v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t DLCCollectLogs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (a2)
    v7 = a2;
  else
    v7 = a1;
  v8 = objc_alloc(MEMORY[0x24BDBCE70]);
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v9, CFSTR("DLCGatheringDisplayFlagsKey"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4), CFSTR("DLCLogGatheringFlagsKey"), v7, CFSTR("DLCAlertTitleKey"), 0);
  v11 = DLCCollectLogsWithCompletionHandler(a1, v10, 0);

  return v11;
}

uint64_t DLCShouldLogMessageBodies()
{
  uint64_t result;

  result = IMShouldLog();
  if ((_DWORD)result)
    return IMShouldLogMessageBodies();
  return result;
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

uint64_t IMLogCurrentBacktrace_V()
{
  return MEMORY[0x24BE50768]();
}

uint64_t IMLoggingStringForMessageData()
{
  return MEMORY[0x24BE50788]();
}

uint64_t IMShouldLog()
{
  return MEMORY[0x24BE507D8]();
}

uint64_t IMShouldLogCategory()
{
  return MEMORY[0x24BE507E0]();
}

uint64_t IMShouldLogMessageBodies()
{
  return MEMORY[0x24BE507E8]();
}

uint64_t IMSyncLoggingsPreferences()
{
  return MEMORY[0x24BE50828]();
}

uint64_t _IMLogEventString_V()
{
  return MEMORY[0x24BE50928]();
}

uint64_t _IMLogStringWithFileAndLine_V()
{
  return MEMORY[0x24BE50930]();
}

uint64_t _IMLogString_V()
{
  return MEMORY[0x24BE50938]();
}

uint64_t _IMLoggingAction()
{
  return MEMORY[0x24BE50940]();
}

uint64_t _IMLoggingActionWithUserInfo()
{
  return MEMORY[0x24BE50948]();
}

uint64_t _IMLoggingAddLogFile()
{
  return MEMORY[0x24BE50950]();
}

uint64_t _IMLoggingBeginSession()
{
  return MEMORY[0x24BE50958]();
}

uint64_t _IMLoggingEndSession()
{
  return MEMORY[0x24BE50960]();
}

uint64_t _IMLoggingEvent()
{
  return MEMORY[0x24BE50968]();
}

uint64_t _IMLoggingLogCallInfo()
{
  return MEMORY[0x24BE50978]();
}

uint64_t _IMLoggingLog_V()
{
  return MEMORY[0x24BE50980]();
}

uint64_t _IMLoggingNoteCheckpoint_V()
{
  return MEMORY[0x24BE50988]();
}

uint64_t _IMLoggingPulse()
{
  return MEMORY[0x24BE50990]();
}

uint64_t _IMLoggingSetFailureReason()
{
  return MEMORY[0x24BE50998]();
}

uint64_t _IMLoggingSetInitiator()
{
  return MEMORY[0x24BE509A0]();
}

uint64_t _IMLoggingSetRecipient()
{
  return MEMORY[0x24BE509A8]();
}

uint64_t _IMWarnString_V()
{
  return MEMORY[0x24BE509B8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

