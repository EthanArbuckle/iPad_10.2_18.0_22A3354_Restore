@implementation FigCaptureSourceInitialize

void __FigCaptureSourceInitialize_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  int v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  id obj;
  id obja;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  sVibeMitigation = -[FigCaptureSourceVibeMitigation initWithFigCaptureSourceBackings:]([FigCaptureSourceVibeMitigation alloc], "initWithFigCaptureSourceBackings:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v3 = (void *)objc_msgSend(v2, "sourceInfoDictionaries");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v40 != v6)
            objc_enumerationMutation(v3);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "objectForKeyedSubscript:", 0x1E493B9F8), "BOOLValue"))
          {
            +[FigCaptureCalibrationMonitor initializeSharedInstanceWithCaptureSourceBackings:](FigCaptureCalibrationMonitor, "initializeSharedInstanceWithCaptureSourceBackings:", v2);
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v5)
          continue;
        break;
      }
    }
  }
LABEL_12:
  v8 = *(void **)(a1 + 32);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_msgSend(v8, "sourceInfoDictionaries");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "objectForKeyedSubscript:", 0x1E493B8F8);
        v15 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
        v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Position")), "intValue");
        if (v15 <= 0xF && ((1 << v15) & 0x84AC) != 0)
        {
          v18 = v16;
          objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15));
          v19 = BWCaptureDevicePositionAndDeviceTypeToPortType(v18, v15);
          if (v19)
            objc_msgSend(v33, "addObject:", v19);
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }
  if (FigCapturePlatformSupportsExternalCameras()
    && (objc_msgSend(v9, "containsObject:", &unk_1E49FC498) & 1) == 0)
  {
    objc_msgSend(v33, "addObject:", *MEMORY[0x1E0D05A38]);
    objc_msgSend(v9, "addObject:", &unk_1E49FC498);
  }
  FigCaptureCameraStreamingPowerLogInitialize(v33, v9);

  sThermalMonitor_0 = objc_alloc_init(FigCaptureThermalMonitor);
  sPowerMonitor = objc_alloc_init(FigCapturePowerMonitor);
  objc_msgSend((id)sThermalMonitor_0, "setThermalHandler:", &__block_literal_global_116);
  objc_msgSend((id)sPowerMonitor, "setPowerHandler:", &__block_literal_global_24_1);
  v34 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obja = (id)objc_msgSend(*(id *)(a1 + 32), "sourceInfoDictionaries");
  v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v20)
  {
    v21 = v20;
    v30 = 0;
    v22 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(obja);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "objectForKeyedSubscript:", 0x1E493B8F8);
        v25 = objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
        if (v25 <= 0xC)
        {
          if (((1 << v25) & 0x4AC) != 0)
          {
            v26 = BWCaptureDevicePositionAndDeviceTypeToPortType(objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Position")), "intValue"), v25);
            if (!v26)
            {
              v28 = v29;
              LODWORD(v27) = 0;
              FigDebugAssert3();
            }
            objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SensorThermalLevelsByTemperature"), v27, v28), v26);
          }
          else if (((1 << v25) & 0x1040) != 0)
          {
            v30 = objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("PearlModuleType")), "intValue");
          }
        }
      }
      v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v21);
  }
  else
  {
    v30 = 0;
  }
  sSystemPressureMonitor = -[FigCaptureSystemPressureMonitor initWithPearlModuleType:sensorThermalLevelsByTemperatureByPortType:]([FigCaptureSystemPressureMonitor alloc], "initWithPearlModuleType:sensorThermalLevelsByTemperatureByPortType:", v30, v34);
  objc_msgSend((id)sSystemPressureMonitor, "setSystemPressureLevelChangedHandler:", &__block_literal_global_29);
  FigCaptureSourceCreateSystemStyleEnabledStorage();
}

uint64_t __FigCaptureSourceInitialize_block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  unsigned int v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  float v9;

  v3 = objc_msgSend(a2, "thermalLevel");
  v4 = objc_msgSend((id)sPowerMonitor, "powerPressureLevel");
  objc_msgSend(a2, "maxTorchLevel");
  v6 = v5;
  objc_msgSend((id)sPowerMonitor, "maxTorchLevel");
  if (v6 >= v7)
    v8 = (void *)sPowerMonitor;
  else
    v8 = a2;
  objc_msgSend(v8, "maxTorchLevel");
  return cs_handleThermalPressureOrPowerChange(v3, v4, v9);
}

uint64_t __FigCaptureSourceInitialize_block_invoke_3(uint64_t a1, void *a2)
{
  int v3;
  unsigned int v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  float v9;

  v3 = objc_msgSend((id)sThermalMonitor_0, "thermalLevel");
  v4 = objc_msgSend(a2, "powerPressureLevel");
  objc_msgSend(a2, "maxTorchLevel");
  v6 = v5;
  objc_msgSend((id)sThermalMonitor_0, "maxTorchLevel");
  if (v6 >= v7)
    v8 = (void *)sThermalMonitor_0;
  else
    v8 = a2;
  objc_msgSend(v8, "maxTorchLevel");
  return cs_handleThermalPressureOrPowerChange(v3, v4, v9);
}

void __FigCaptureSourceInitialize_block_invoke_4(uint64_t a1, int a2, int a3, int a4, void *a5)
{
  void *v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t i;
  const void *v15;
  uint64_t DerivedStorage;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  int v20;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  int v31;
  unsigned int v32;
  uint64_t v33;
  const void *v34;
  id obj;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)sAllVideoCaptureSourcesLock);
  v9 = (void *)objc_msgSend((id)sAllVideoCaptureSources, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)sAllVideoCaptureSourcesLock);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v9;
  v45 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  v10 = 0;
  if (v45)
  {
    v44 = *(_QWORD *)v52;
    if (a2 <= a3)
      v11 = a3;
    else
      v11 = a2;
    v12 = a2 != 0;
    if (a3)
      v12 |= 2u;
    v39 = v12;
    v40 = v11;
    if (v11 <= a4)
      v13 = a4;
    else
      v13 = v11;
    v37 = v12 | 4;
    v38 = v13;
    v42 = a3;
    v43 = a4;
    v41 = a2;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(obj);
        v15 = *(const void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        DerivedStorage = CMBaseObjectGetDerivedStorage();
        if (DerivedStorage)
        {
          v17 = DerivedStorage;
          v46 = v10;
          v18 = a4 != 0;
          v19 = objc_msgSend((id)objc_msgSend(*(id *)(DerivedStorage + 104), "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
          v20 = v19;
          v22 = v19 == 6 || v19 == 12;
          if (v18 && v22)
            v23 = v38;
          else
            v23 = v40;
          if (v18 && v22)
            v24 = v37;
          else
            v24 = v39;
          v25 = (void *)objc_msgSend(*(id *)(v17 + 144), "allKeys");
          if (!v25)
          {
            v25 = (void *)objc_msgSend(*(id *)(v17 + 152), "allKeys");
            if (!v25)
            {
              v26 = BWCaptureDevicePositionAndDeviceTypeToPortType(objc_msgSend((id)objc_msgSend(*(id *)(v17 + 104), "objectForKeyedSubscript:", CFSTR("Position")), "intValue"), v20);
              if (v26)
              {
                v58 = v26;
                v25 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
              }
              else
              {
                v25 = 0;
              }
            }
          }
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v48 != v29)
                  objc_enumerationMutation(v25);
                v31 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j)), "intValue");
                if ((int)v23 <= v31)
                  v32 = v31;
                else
                  v32 = v23;
                if (v31)
                  v23 = v32;
                else
                  v23 = v23;
                if (v31)
                  v24 = v24 | 8;
                else
                  v24 = v24;
              }
              v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            }
            while (v28);
          }
          v55[0] = CFSTR("Level");
          v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
          v55[1] = CFSTR("Factors");
          v56[0] = v33;
          v56[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
          v34 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
          FigSimpleMutexCheckIsNotLockedOnThisThread();
          pthread_mutex_lock(*(pthread_mutex_t **)(v17 + 48));
          objc_msgSend(*(id *)(v17 + 176), "setObject:forKeyedSubscript:", v34, CFSTR("SystemPressureState"));
          objc_msgSend(*(id *)(v17 + 80), "setSystemPressureLevel:", v23);
          objc_msgSend(*(id *)(v17 + 80), "setSystemPressureFactors:", v24);
          objc_msgSend(*(id *)(v17 + 80), "setThermalSystemPressureLevel:", v41);
          objc_msgSend(*(id *)(v17 + 80), "setPeakPowerSystemPressureLevel:", v42);
          if ((_DWORD)v23 == 4)
            objc_msgSend(*(id *)(v17 + 80), "shutDownSystemPressuredDevice");
          pthread_mutex_unlock(*(pthread_mutex_t **)(v17 + 48));
          captureSource_postNotificationWithPayload(v15, CFSTR("SystemPressureState"), v34);
          v10 = v46;
          if (v46 <= (int)v23)
            v10 = v23;
          a4 = v43;
        }
      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v45);
  }

  if (sPreviousMaxSystemPressureLevel >= 4 && v10 <= 3)
    objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "resumeSystemPressuredDevice");
  sPreviousMaxSystemPressureLevel = v10;
}

@end
