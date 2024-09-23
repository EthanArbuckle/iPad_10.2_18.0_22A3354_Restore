@implementation ASVMemoryLimits

+ (unint64_t)viewerMemoryAvailableForTexturesOnHighMemoryDevices
{
  return 838860800;
}

+ (unint64_t)processMemory
{
  void *v2;
  int v3;
  int v4;
  int v5;
  NSObject *v6;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  v4 = memorystatus_control();
  if (v4)
  {
    v5 = v4;
    AssetViewerLogHandleForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v9 = v3;
      v10 = 1024;
      v11 = v5;
      _os_log_impl(&dword_1D93A7000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Failed to get memory limit info for pid %d. Errorno: %d, Limits will appear as 0MB and not fatal.\n", buf, 0xEu);
    }

  }
  return 0;
}

+ (unint64_t)viewerMemoryAvailableForTexturesOnThisDevice
{
  unint64_t v2;
  NSObject *v3;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "processMemory");
  AssetViewerLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v2;
    _os_log_impl(&dword_1D93A7000, v3, OS_LOG_TYPE_DEFAULT, "processMemory for textures is %lu", (uint8_t *)&v5, 0xCu);
  }

  if (v2 < 0x1F5)
    return 52428800;
  if (v2 < 0x2BD)
    return 157286400;
  if (v2 >= 0x465)
    return +[ASVMemoryLimits viewerMemoryAvailableForTexturesOnHighMemoryDevices](ASVMemoryLimits, "viewerMemoryAvailableForTexturesOnHighMemoryDevices");
  return 503316480;
}

+ (unint64_t)thumbnailMemoryAvailableForTextures
{
  return 52428800;
}

+ (unint64_t)currentMemoryFootprint
{
  uint64_t v2;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v28;

  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  *(_OWORD *)task_info_out = 0u;
  v6 = 0u;
  task_info_outCnt = 93;
  v2 = task_info(*MEMORY[0x1E0C83DA0], 0x16u, task_info_out, &task_info_outCnt);
  if (!(_DWORD)v2)
    return (unint64_t)(float)((float)((float)(unint64_t)v14 * 0.00097656) * 0.00097656);
  NSLog(CFSTR("Filed to get memory footprint - kr status: %d"), v2);
  return 0;
}

@end
