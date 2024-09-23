@implementation SetProperty

uint64_t __captureSession_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t SystemStyleFromDefaults;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  SystemStyleFromDefaults = *(_QWORD *)(a1 + 32);
  if (!SystemStyleFromDefaults)
    SystemStyleFromDefaults = captureSession_getSystemStyleFromDefaults();
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 624), "cinematographyPipelines"), "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 624), "cinematographyPipelines");
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          -[FigCaptureCinematographyPipeline setSmartStyle:](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7++), SystemStyleFromDefaults);
        }
        while (v5 != v7);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        v5 = result;
      }
      while (result);
    }
  }
  else if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 624), "cameraSourcePipelines"), "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 624), "cameraSourcePipelines", 0);
    result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          -[FigCaptureCameraSourcePipeline setSmartStyle:](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), SystemStyleFromDefaults);
        }
        while (v9 != v11);
        result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        v9 = result;
      }
      while (result);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 320));
    v12 = *(id *)(*(_QWORD *)(a1 + 48) + 408);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 320));
    result = objc_msgSend(v12, "setSmartStyle:", SystemStyleFromDefaults);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 584) = *(_QWORD *)(a1 + 32) != 0;
  return result;
}

void __captureDeferredPhotoProcessor_SetProperty_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v3 = *(_QWORD *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 56) != v2)
  {
    *(_BYTE *)(v3 + 56) = v2;
    if ((v2 & 1) == 0)
      captureDeferredPhotoProcessor_workloop(*(const void **)(a1 + 48));
  }
}

@end
