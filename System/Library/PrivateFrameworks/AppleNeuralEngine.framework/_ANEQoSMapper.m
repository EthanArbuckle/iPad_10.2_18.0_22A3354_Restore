@implementation _ANEQoSMapper

+ (unsigned)aneDefaultTaskQoS
{
  return 21;
}

+ (int)programPriorityForQoS:(unsigned int)a3
{
  unsigned int v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "aneRealTimeTaskQoS") == a3)
    return 2;
  HIDWORD(v7) = a3 - 9;
  LODWORD(v7) = a3 - 9;
  v6 = v7 >> 2;
  if (v6 < 7 && ((0x5Du >> v6) & 1) != 0)
    return dword_1D338B208[v6];
  +[_ANELog daemon](_ANELog, "daemon");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_1D3352000, v8, OS_LOG_TYPE_INFO, "%@: %d => Invalid qos requested", (uint8_t *)&v10, 0x12u);

  }
  return 5;
}

+ (unint64_t)queueIndexForQoS:(unsigned int)a3
{
  unsigned int v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "aneRealTimeTaskQoS") == a3)
    return 2;
  HIDWORD(v7) = a3 - 9;
  LODWORD(v7) = a3 - 9;
  v6 = v7 >> 2;
  if (v6 < 7 && ((0x5Du >> v6) & 1) != 0)
    return qword_1D338B1D0[v6];
  +[_ANELog daemon](_ANELog, "daemon");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_1D3352000, v8, OS_LOG_TYPE_INFO, "%@: %d => Invalid qos requested", (uint8_t *)&v10, 0x12u);

  }
  return 5;
}

+ (unsigned)aneRealTimeTaskQoS
{
  return 0;
}

+ (int)realTimeProgramPriority
{
  return 2;
}

+ (id)dispatchQueueArrayByMappingPrioritiesWithTag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  dispatch_queue_t v11;
  void *v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D824DB90]();
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(".p%d"), i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, (dispatch_qos_class_t)+[_ANEQoSMapper qosForProgramPriority:](_ANEQoSMapper, "qosForProgramPriority:", i), 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v7);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), v9);
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v11, i);

  }
  v12 = (void *)objc_msgSend(v5, "copy");

  objc_autoreleasePoolPop(v4);
  return v12;
}

+ (unsigned)qosForProgramPriority:(int)a3
{
  int v3;

  v3 = a3 - 4;
  if (a3 < 4)
    return 33;
  if (v3 > 2)
    return 21;
  return dword_1D338B224[v3];
}

+ (unsigned)aneUserInteractiveTaskQoS
{
  return 33;
}

+ (unsigned)aneUserInitiatedTaskQoS
{
  return 25;
}

+ (unsigned)aneUtilityTaskQoS
{
  return 17;
}

+ (unsigned)aneBackgroundTaskQoS
{
  return 9;
}

+ (unint64_t)realTimeQueueIndex
{
  return 2;
}

@end
