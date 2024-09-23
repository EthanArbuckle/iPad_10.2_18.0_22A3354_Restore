@implementation AFSimulatorSupportsSiriUOD

void __AFSimulatorSupportsSiriUOD_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SIMULATOR_MODEL_IDENTIFIER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if ((objc_msgSend(v2, "hasPrefix:", CFSTR("iPhone11,")) & 1) != 0
      || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPhone12,")) & 1) != 0
      || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPhone13,")) & 1) != 0
      || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPhone14,")) & 1) != 0
      || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPad11,")) & 1) != 0
      || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPad12,")) & 1) != 0
      || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPad13,")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("Watch7,"));
    }
  }
  else
  {
    v3 = 0;
  }
  AFSimulatorSupportsSiriUOD_currentSimulatorSupportsUOD = v3;
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    v6 = 136315650;
    v7 = "AFSimulatorSupportsSiriUOD_block_invoke";
    v8 = 2112;
    v9 = v2;
    if (v3)
      v5 = CFSTR("YES");
    v10 = 2112;
    v11 = v5;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Current simulator device is %@, supports UoD: %@", (uint8_t *)&v6, 0x20u);
  }

}

@end
