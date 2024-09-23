void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __isEphemeralMultiUser_block_invoke()
{
  void *v0;
  NSObject *v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isEphemeralMultiUser_ephemeralMultiUser = objc_msgSend(v0, "isSharedIPad");

  if (isEphemeralMultiUser_ephemeralMultiUser)
  {
    if (__osLog)
      v1 = __osLog;
    else
      v1 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v2[0] = 67109120;
      v2[1] = isEphemeralMultiUser_ephemeralMultiUser;
      _os_log_impl(&dword_1AF533000, v1, OS_LOG_TYPE_DEFAULT, "isEphemeralMultiUser(): ephemeralMultiUser = %d\n", (uint8_t *)v2, 8u);
    }
  }
}

void __isFaceIDPlatform_block_invoke()
{
  io_registry_entry_t v0;
  NSObject *v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/arm-io/pearl-sep");
  if (v0)
  {
    isFaceIDPlatform_faceIDPlatform = 1;
    IOObjectRelease(v0);
  }
  if (__osLog)
    v1 = __osLog;
  else
    v1 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = isFaceIDPlatform_faceIDPlatform;
    _os_log_impl(&dword_1AF533000, v1, OS_LOG_TYPE_DEFAULT, "isFaceIDPlatform(): faceIDPlatform = %d\n", (uint8_t *)v2, 8u);
  }
}

void __initializeOSLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_t v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v0 = os_log_create("com.apple.BiometricKit", "Framework-Internal");
  v1 = (void *)__osLog;
  __osLog = (uint64_t)v0;

  if (!__osLog)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __initializeOSLog_block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  v10 = os_log_create("com.apple.BiometricKit", "Framework-API");
  v11 = (void *)__osLogTrace;
  __osLogTrace = (uint64_t)v10;

  if (!__osLogTrace)
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v12)
      __initializeOSLog_block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

void sub_1AF5354A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF535B60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF535C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF53611C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF5362F8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF5364CC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t isFaceIDPlatform()
{
  if (isFaceIDPlatform_onceToken != -1)
    dispatch_once(&isFaceIDPlatform_onceToken, &__block_literal_global_2);
  return isFaceIDPlatform_faceIDPlatform;
}

uint64_t isEphemeralMultiUser()
{
  if (isEphemeralMultiUser_onceToken != -1)
    dispatch_once(&isEphemeralMultiUser_onceToken, &__block_literal_global_46);
  return isEphemeralMultiUser_ephemeralMultiUser;
}

void sub_1AF537294(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 184));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF537480(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

BiometricKitEnrollProgressInfo *GenerateEnrollProgressInfo(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  BiometricKitEnrollProgressInfo *v7;
  BiometricKitEnrollProgressInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  double *v20;
  BiometricKitEnrollProgressMergedComponent *v21;
  BiometricKitEnrollProgressMergedComponent *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v39;
  NSObject *v40;
  __int128 v41;
  int v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (*(_DWORD *)a1 == -1)
  {
    if (__osLog)
      v39 = __osLog;
    else
      v39 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "((int32_t)report->message) != -1";
      v46 = 2048;
      v47 = 0;
      v48 = 2080;
      v49 = &unk_1AF575226;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
      v52 = 1024;
      v53 = 128;
      _os_log_impl(&dword_1AF533000, v39, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 0;
    v8 = 0;
  }
  else
  {
    v7 = objc_alloc_init(BiometricKitEnrollProgressInfo);
    v8 = v7;
    switch(*(_DWORD *)a1)
    {
      case 0:
        -[BiometricKitEnrollProgressInfo setMessage:](v7, "setMessage:", 0);
        goto LABEL_5;
      case 1:
        -[BiometricKitEnrollProgressInfo setMessage:](v7, "setMessage:", 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("BKEPDNewComponentID"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 4));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("BKEPDNewNodeID"));

        goto LABEL_5;
      case 2:
        -[BiometricKitEnrollProgressInfo setMessage:](v7, "setMessage:", 2);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("BKEPDExtendedComponentID"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 4));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("BKEPDNewNodeID"));

        goto LABEL_22;
      case 3:
        -[BiometricKitEnrollProgressInfo setMessage:](v7, "setMessage:", 3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("BKEPDResultComponentID"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 4));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("BKEPDNewNodeID"));

        __makeCoordinates((double *)(a1 + 16));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("BKEPDNewNodeCoordinates"));
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v16)
        {
          v18 = v16;
          v42 = a2;
          v43 = v5;
          if (*(int *)(a1 + 40) >= 1)
          {
            v19 = 0;
            v20 = (double *)(a1 + 56);
            *(_QWORD *)&v17 = 136316162;
            v41 = v17;
            do
            {
              v21 = objc_alloc_init(BiometricKitEnrollProgressMergedComponent);
              v22 = v21;
              if (v21)
              {
                -[BiometricKitEnrollProgressMergedComponent setComponentID:](v21, "setComponentID:", *((int *)v20 - 2));
                __makeCoordinates(v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[BiometricKitEnrollProgressMergedComponent setTransformationCoordinates:](v22, "setTransformationCoordinates:", v23);

              }
              else
              {
                if (__osLog)
                  v24 = __osLog;
                else
                  v24 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v41;
                  v45 = "result";
                  v46 = 2048;
                  v47 = 0;
                  v48 = 2080;
                  v49 = &unk_1AF575226;
                  v50 = 2080;
                  v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
                  v52 = 1024;
                  v53 = 92;
                  _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
              }
              objc_msgSend(v18, "insertObject:atIndex:", v22, v19, v41);

              ++v19;
              v20 += 4;
            }
            while (v19 < *(int *)(a1 + 40));
          }
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v18);

          if (v27)
          {
            objc_msgSend(v6, "setObject:forKey:", v27, CFSTR("BKEPDMergedInComponents"));

          }
          a2 = v42;
          v5 = v43;
        }
        else
        {
          if (__osLog)
            v40 = __osLog;
          else
            v40 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v45 = "ma";
            v46 = 2048;
            v47 = 0;
            v48 = 2080;
            v49 = &unk_1AF575226;
            v50 = 2080;
            v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
            v52 = 1024;
            v53 = 106;
            _os_log_impl(&dword_1AF533000, v40, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        break;
      case 4:
        -[BiometricKitEnrollProgressInfo setMessage:](v7, "setMessage:", 4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v25, CFSTR("BKEPDExtendedComponentID"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 4));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v26, CFSTR("BKEPDNewNodeID"));

LABEL_22:
        __makeCoordinates((double *)(a1 + 16));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("BKEPDNewNodeCoordinates"));
        break;
      default:
LABEL_5:
        v11 = 0;
        break;
    }
    if (*(_DWORD *)(a1 + 9652) != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v28, CFSTR("BKEPDRemovedNodeID"));

      if (*(_DWORD *)(a1 + 9656) != -1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v29, CFSTR("BKEPDRemovedComponentID"));

      }
    }
    if (*(double *)(a1 + 9664) != -1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v30, CFSTR("BKTDLargestCompArea"));

    }
    v31 = *(unsigned __int16 *)(a1 + 9660);
    if (v31 != 0xFFFF)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(__int16)v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v32, CFSTR("BKTDLargestCompNodes"));

    }
    if (*(double *)(a1 + 9680) != -1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v33, CFSTR("BKTDTotalArea"));

    }
    v34 = *(unsigned __int16 *)(a1 + 9672);
    if (v34 != 0xFFFF)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(__int16)v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v35, CFSTR("BKTDTotalNodes"));

    }
    if (*(_DWORD *)(a1 + 9688) != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v36, CFSTR("BKEPDRedundantNode"));

    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitEnrollProgressInfo setMessageDetails:](v8, "setMessageDetails:", v37);

    -[BiometricKitEnrollProgressInfo setProgress:](v8, "setProgress:", a2);
    -[BiometricKitEnrollProgressInfo setCaptureImage:](v8, "setCaptureImage:", v5);
    -[BiometricKitEnrollProgressInfo setRenderedImage:](v8, "setRenderedImage:", 0);
    -[BiometricKitEnrollProgressInfo setCurrentPrimaryComponentID:](v8, "setCurrentPrimaryComponentID:", *(int *)(a1 + 9648));
  }

  return v8;
}

BiometricKitEnrollProgressCoordinates *__makeCoordinates(double *a1)
{
  BiometricKitEnrollProgressCoordinates *v2;
  BiometricKitEnrollProgressCoordinates *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(BiometricKitEnrollProgressCoordinates);
  v3 = v2;
  if (v2)
  {
    -[BiometricKitEnrollProgressCoordinates setX:](v2, "setX:", *a1);
    -[BiometricKitEnrollProgressCoordinates setY:](v3, "setY:", a1[1]);
    -[BiometricKitEnrollProgressCoordinates setAngle:](v3, "setAngle:", a1[2]);
  }
  else
  {
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "result";
      v8 = 2048;
      v9 = 0;
      v10 = 2080;
      v11 = &unk_1AF575226;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitEnrollProgressInfo.m";
      v14 = 1024;
      v15 = 79;
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
  }
  return v3;
}

id GenerateTemplateTopologyInfo()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  double *v4;
  uint64_t v5;
  int *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  _BYTE v21[496];
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  int v29;

  v0 = MEMORY[0x1E0C80A78]();
  v18 = v1;
  v3 = v2;
  v4 = (double *)v0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (*(int *)v4 >= 1)
  {
    v5 = 0;
    v6 = (int *)(v4 + 7);
    do
    {
      v22 = 0;
      memset(&v21[16], 0, 480);
      *(_OWORD *)v21 = 0u;
      v7 = *((_DWORD *)v4 + 8);
      v20 = *((_QWORD *)v6 - 2);
      v8 = *(v6 - 2);
      v23 = v7;
      *(_DWORD *)v21 = v8;
      *(_OWORD *)&v21[8] = *(_OWORD *)v6;
      *(_QWORD *)&v21[24] = *((_QWORD *)v6 + 2);
      v24 = -1;
      v28 = 0xBFF0000000000000;
      v27 = -1;
      v26 = 0xBFF0000000000000;
      v25 = -1;
      v29 = -1;
      GenerateEnrollProgressInfo((uint64_t)&v20, 255, *(void **)(v3 + 8 * v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v19, "addObject:", v9);

      ++v5;
      v6 += 10;
    }
    while (v5 < *(int *)v4);
  }
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4[1]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("BKTDLargestCompArea"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v4 + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("BKTDLargestCompNodes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4[3]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("BKTDTotalArea"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v4 + 4));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("BKTDTotalNodes"));

    if (*((_DWORD *)v4 + 9) != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("BKTemplateUpdated"));

    }
    v16 = objc_retainAutorelease(v10);
    *v18 = v16;

  }
  return v19;
}

__CFString *getUUIDString(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  unsigned __int8 uu[8];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    *(_QWORD *)uu = 0;
    v6 = 0;
    objc_msgSend(v1, "getUUIDBytes:", uu);
    if (uuid_is_null(uu))
    {
      v3 = CFSTR("0");
    }
    else
    {
      objc_msgSend(v2, "UUIDString");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1AF53A7EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF53A9A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF53AB44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF53AC84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF53AD14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF53BB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53D6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53D8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53DB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53DD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53DF54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF53E1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53E3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53E604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53E82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53F21C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF53F554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF53F780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF53F9B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF53FC3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF53FEC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF540120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF54039C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF540664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5408DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF540B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF540E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1AF541278(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF5414A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5416C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5418EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF541B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF541D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF541F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF542410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5426B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5428B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF542B00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF542D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF542F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF54312C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF543364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF5435DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF543844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF543AB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF543D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF544070(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF5443A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF544988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF544D84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF544FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF5452BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF545584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF545874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF545B60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  _Unwind_Resume(exception_object);
}

void sub_1AF545F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5461B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _BKLogEventOrCode(uint64_t a1)
{
  id v2;
  _QWORD block[5];

  if (_BKLogEventOrCode_onceToken != -1)
    dispatch_once(&_BKLogEventOrCode_onceToken, &__block_literal_global_0);
  if (_BKLogEventOrCode_isDaemon)
  {
    -[objc_class logger](NSClassFromString(CFSTR("BiometricKitEventLogger")), "logger");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logEventOrCode:", a1);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___BKLogEventOrCode_block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_BKLogEventOrCode_queue, block);
  }
}

void BKLogEvent(unsigned int a1)
{
  _BKLogEventOrCode(a1);
}

void BKLogCode(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a1;
  v6 = *MEMORY[0x1E0C80C00];
  if ((a1 - 15) <= 0xFFFFFFF1)
  {
    if (__osLog)
      v4 = __osLog;
    else
      v4 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "illegal class %d\n\n", (uint8_t *)v5, 8u);
    }
    v3 = 15;
  }
  _BKLogEventOrCode(a2 | (unint64_t)(v3 << 32));
}

void sub_1AF547294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF547A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5488AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5490D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF549984(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AF549FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF54A6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF54AE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

double ConvertTransToNodeArea(int a1, int a2)
{
  return 100.0 / (double)a1 * (100.0 / (double)a1) * (double)(16 * a2);
}

double ComponentSetInit(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

double ComponentSetRelease(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  double result;

  if (*a1 >= 1)
  {
    v2 = 0;
    do
      free(*(void **)(*((_QWORD *)a1 + 1) + 8 * v2++));
    while (v2 < *a1);
  }
  free(*((void **)a1 + 1));
  if (a1[5] >= 1)
  {
    v3 = 0;
    do
      free(*(void **)(*((_QWORD *)a1 + 5) + 8 * v3++));
    while (v3 < a1[5]);
  }
  free(*((void **)a1 + 5));
  result = 0.0;
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

double ConvertVectorForGUI(double *a1, double *a2)
{
  double v2;
  double v3;
  double result;

  v2 = a1[1];
  v3 = a1[2] + 1.57079633;
  *a2 = *a1 * 6.123234e-17 + 0.0 - v2;
  result = v3 + -1.57079633;
  a2[1] = *a1 + 0.0 + v2 * 6.123234e-17;
  a2[2] = result;
  return result;
}

uint64_t ComponentSetUpdate()
{
  uint64_t v0;
  __int16 *v1;
  uint64_t v2;
  unsigned int *v3;
  double *v4;
  __int16 *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  _WORD *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  char *v22;
  char *v23;
  unsigned int v24;
  char *v25;
  char *v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  int v36;
  uint64_t v37;
  unsigned __int16 *v38;
  void *v39;
  uint64_t v40;
  int v41;
  uint64_t *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  double v46;
  __double2 v47;
  double v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  int v52;
  double v53;
  double v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  float64x2_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  double *v70;
  double v71;
  __double2 v72;
  double v73;
  double v74;
  double v75;
  double *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  __double2 v82;
  double v83;
  uint64_t v84;
  double v85;
  __double2 v86;
  double v87;
  double v88;
  float64_t v89;
  int32x2_t v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  int v98;
  NSObject *v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  __int16 *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  int v113;
  double *v114;
  int v115;
  _DWORD *v116;
  int v117;
  uint64_t v118;
  double *v119;
  double *v120;
  double v121;
  __double2 v122;
  double v123;
  double v124;
  double v125;
  double v126;
  uint64_t v127;
  char v128;
  int v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double *v135;
  double v136;
  double v137;
  double v138;
  __double2 v139;
  uint64_t v140;
  NSObject *v141;
  uint64_t LargestComponent;
  uint64_t v143;
  double v144;
  double v145;
  double v146;
  uint64_t v147;
  double *v148;
  double v149;
  double v150;
  double v151;
  NSObject *v152;
  NSObject *v153;
  NSObject *v155;
  uint64_t v156;
  NSObject *v157;
  NSObject *v158;
  NSObject *v159;
  uint64_t v160;
  NSObject *v161;
  NSObject *v162;
  uint64_t v163;
  NSObject *v164;
  NSObject *v165;
  NSObject *v166;
  NSObject *v167;
  double v168;
  uint64_t v169;
  os_log_t logb;
  NSObject *log;
  NSObject *loga;
  __int16 *v173;
  float64x2_t v174;
  double *v175;
  int v176;
  __int16 v177;
  __int16 v178;
  uint64_t v179;
  unsigned int *v180;
  _OWORD v181[2];
  _OWORD v182[598];
  __int16 v183;
  uint64_t v184;
  __int16 v185;
  uint64_t v186;
  uint8_t buf[4];
  const char *v188;
  __int16 v189;
  uint64_t v190;
  __int16 v191;
  const char *v192;
  __int16 v193;
  const char *v194;
  __int16 v195;
  int v196;
  uint64_t v197;

  v0 = MEMORY[0x1E0C80A78]();
  v3 = (unsigned int *)v0;
  v197 = *MEMORY[0x1E0C80C00];
  memset(v182, 0, 480);
  memset(v181, 0, sizeof(v181));
  if (*(_BYTE *)(v0 + 56))
  {
    if (__osLog)
      v106 = __osLog;
    else
      v106 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      goto LABEL_148;
    *(_DWORD *)buf = 136316162;
    v188 = "!set->structureIsInconsistent";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 884;
    goto LABEL_147;
  }
  v4 = (double *)v2;
  v5 = v1;
  v6 = v1[3];
  v7 = v1[4];
  ++*(_DWORD *)(v0 + 52);
  if (v2)
  {
    *(_DWORD *)(v2 + 40) = 0;
    *(_QWORD *)v2 = -1;
    *(_DWORD *)(v2 + 9656) = -1;
    *(_QWORD *)(v2 + 9648) = -1;
    *(_DWORD *)(v2 + 8) = -1;
  }
  if (!v1[23])
  {
    if (__osLog)
      v106 = __osLog;
    else
      v106 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      goto LABEL_148;
    *(_DWORD *)buf = 136316162;
    v188 = "inInfoTable->resampleScale100 != 0";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 890;
LABEL_147:
    _os_log_impl(&dword_1AF533000, v106, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_148:
    v107 = 22;
LABEL_149:
    *((_BYTE *)v3 + 56) = 1;
    return v107;
  }
  v8 = __TranslateNodePlacement((uint64_t)v1, (uint64_t)v181);
  if ((_DWORD)v8)
  {
    v107 = v8;
    if (__osLog)
      v152 = __osLog;
    else
      v152 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      goto LABEL_149;
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 893;
LABEL_315:
    _os_log_impl(&dword_1AF533000, v152, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_149;
  }
  *((_WORD *)v3 + 24) = v6;
  *((_WORD *)v3 + 25) = v7;
  v180 = v3;
  if (v7 == -1)
    goto LABEL_41;
  if (v7 >= v5[2])
  {
    if (__osLog)
      v153 = __osLog;
    else
      v153 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v188 = "delNode < inInfoTable->count";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 906;
LABEL_253:
    _os_log_impl(&dword_1AF533000, v153, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    return 0;
  }
  if ((_DWORD)v6 != v7)
  {
    if (__osLog)
      v153 = __osLog;
    else
      v153 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v188 = "insNode == delNode";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 908;
    goto LABEL_253;
  }
  v9 = *v3;
  if ((int)v9 >= 1)
  {
    v10 = (uint64_t *)*((_QWORD *)v3 + 1);
    v11 = v10;
    v12 = *v3;
    while (1)
    {
      v13 = (_WORD *)*v11;
      if (*(unsigned __int16 *)(*v11 + 26) == (unsigned __int16)v6)
        break;
      ++v11;
      if (!--v12)
        goto LABEL_13;
    }
    if (v4)
      *((_DWORD *)v4 + 2413) = (__int16)v13[12];
    if ((unsigned __int16)v13[14] != (unsigned __int16)v6)
      goto LABEL_40;
    v15 = 0;
    do
    {
      v16 = *v10;
      if ((_WORD *)*v10 != v13 && *(unsigned __int16 *)(v16 + 28) == (unsigned __int16)v6)
      {
        v17 = *(__int16 *)(v16 + 26);
        if (v17 != -1 && (!v15 || *(__int16 *)(v15 + 26) > v17))
          v15 = *v10;
      }
      ++v10;
      --v9;
    }
    while (v9);
    if (v15)
    {
      v18 = __RebaseComponent(v3, (uint64_t)v13, v15);
      if ((_DWORD)v18)
      {
        v107 = v18;
        v163 = __osLog;
        v164 = MEMORY[0x1E0C81028];
        if (__osLog)
          v165 = __osLog;
        else
          v165 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v188 = "!result";
          v189 = 2048;
          v190 = 0;
          v191 = 2080;
          v192 = (const char *)&unk_1AF575226;
          v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          v195 = 1024;
          v196 = 625;
          _os_log_impl(&dword_1AF533000, v165, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          v163 = __osLog;
        }
        if (v163)
          v166 = v163;
        else
          v166 = v164;
        if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v188 = "!result";
          v189 = 2048;
          v190 = 0;
          v191 = 2080;
          v192 = (const char *)&unk_1AF575226;
          v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          v195 = 1024;
          v196 = 910;
          _os_log_impl(&dword_1AF533000, v166, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_149;
      }
      if (*(__int16 *)(*(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * (__int16)v13[15]) + 26) > 1)
        goto LABEL_40;
      v19 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 136316162;
      v188 = "set->components[removedVertex->componentIndex]->mapiNodeCount > 1";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 626;
    }
    else
    {
      v20 = (__int16)v13[15];
      if (v4)
        *((_DWORD *)v4 + 2414) = v20;
      v13[14] = -1;
      if (*(_WORD *)(*(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * v20) + 26) == 1)
        goto LABEL_40;
      v19 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 136316162;
      v188 = "set->components[removedVertex->componentIndex]->mapiNodeCount == 1";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 636;
    }
    _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_40:
    v21 = *(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * (__int16)v13[15]);
    --*(_WORD *)(v21 + 26);
    v13[13] = -1;
    goto LABEL_41;
  }
LABEL_13:
  if (__osLog)
    v14 = __osLog;
  else
    v14 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v188 = "removedVertex";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 609;
    _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_41:
  if ((_DWORD)v6 == -1)
  {
    ++v3[4];
    if (v4)
      *(_DWORD *)v4 = 0;
    goto LABEL_206;
  }
  if ((int)v6 >= v5[2])
  {
    if (__osLog)
      v153 = __osLog;
    else
      v153 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v188 = "insNode < inInfoTable->count";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 919;
    goto LABEL_253;
  }
  if (*v3 == v3[1])
  {
    v22 = (char *)malloc_type_realloc(*((void **)v3 + 1), 8 * (int)(*v3 + 16), 0x2004093837F09uLL);
    if (!v22)
    {
      v156 = __osLog;
      v157 = MEMORY[0x1E0C81028];
      if (__osLog)
        v158 = __osLog;
      else
        v158 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v188 = "tmp != ((void *)0)";
        v189 = 2048;
        v190 = 0;
        v191 = 2080;
        v192 = (const char *)&unk_1AF575226;
        v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        v195 = 1024;
        v196 = 389;
        _os_log_impl(&dword_1AF533000, v158, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        v156 = __osLog;
      }
      if (v156)
        v159 = v156;
      else
        v159 = v157;
      if (!os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        goto LABEL_287;
      *(_DWORD *)buf = 136316162;
      v188 = "!result";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 486;
      goto LABEL_286;
    }
    *((_QWORD *)v3 + 1) = v22;
    v23 = &v22[8 * v3[1]];
    *((_OWORD *)v23 + 6) = 0u;
    *((_OWORD *)v23 + 7) = 0u;
    *((_OWORD *)v23 + 4) = 0u;
    *((_OWORD *)v23 + 5) = 0u;
    *((_OWORD *)v23 + 2) = 0u;
    *((_OWORD *)v23 + 3) = 0u;
    *(_OWORD *)v23 = 0u;
    *((_OWORD *)v23 + 1) = 0u;
    v3[1] += 16;
  }
  v24 = v3[5];
  if (v24 != v3[6])
    goto LABEL_49;
  v25 = (char *)malloc_type_realloc(*((void **)v3 + 5), 8 * (int)(v24 + 16), 0x2004093837F09uLL);
  if (!v25)
  {
    v160 = __osLog;
    v161 = MEMORY[0x1E0C81028];
    if (__osLog)
      v162 = __osLog;
    else
      v162 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v188 = "tmp != ((void *)0)";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 406;
      _os_log_impl(&dword_1AF533000, v162, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      v160 = __osLog;
    }
    if (v160)
      v159 = v160;
    else
      v159 = v161;
    if (!os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
      goto LABEL_287;
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 489;
LABEL_286:
    _os_log_impl(&dword_1AF533000, v159, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_287:
    v107 = 12;
LABEL_310:
    if (__osLog)
      v152 = __osLog;
    else
      v152 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      goto LABEL_149;
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 921;
    goto LABEL_315;
  }
  *((_QWORD *)v3 + 5) = v25;
  v26 = &v25[8 * v3[6]];
  *((_OWORD *)v26 + 6) = 0u;
  *((_OWORD *)v26 + 7) = 0u;
  *((_OWORD *)v26 + 4) = 0u;
  *((_OWORD *)v26 + 5) = 0u;
  *((_OWORD *)v26 + 2) = 0u;
  *((_OWORD *)v26 + 3) = 0u;
  *(_OWORD *)v26 = 0u;
  *((_OWORD *)v26 + 1) = 0u;
  v3[6] += 16;
LABEL_49:
  v27 = (double *)malloc_type_calloc(0x20uLL, 1uLL, 0xA5575ADDuLL);
  if (!v27)
  {
    if (__osLog)
      v155 = __osLog;
    else
      v155 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      goto LABEL_309;
    *(_DWORD *)buf = 136316162;
    v188 = "newVertex != ((void *)0)";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 492;
LABEL_308:
    _os_log_impl(&dword_1AF533000, v155, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_309:
    v107 = 12;
    goto LABEL_310;
  }
  v28 = (uint64_t)v27;
  v29 = (int)*v3;
  v30 = *v3;
  *(_QWORD *)(*((_QWORD *)v3 + 1) + 8 * v29) = v27;
  *((_WORD *)v27 + 12) = v29;
  v31 = (v29 + 1);
  *v3 = v31;
  v32 = (double *)&v181[2 * v6];
  v33 = v32[1];
  *v27 = v33;
  v34 = v32[2];
  v27[1] = v34;
  v35 = v32[3];
  v27[2] = v35;
  v36 = *((unsigned __int16 *)v32 + 16);
  *((_WORD *)v27 + 14) = v36;
  *((_WORD *)v27 + 13) = v6;
  if (v36 != (unsigned __int16)v6)
  {
    *((_WORD *)v27 + 15) = -1;
    if ((int)v30 < 1)
      goto LABEL_64;
    v42 = (uint64_t *)*((_QWORD *)v3 + 1);
    while (1)
    {
      v43 = *v42;
      if (*(unsigned __int16 *)(*v42 + 26) == v36)
        break;
      ++v42;
      if (!--v30)
        goto LABEL_64;
    }
    LODWORD(v40) = *(__int16 *)(v43 + 30);
    *((_WORD *)v27 + 15) = *(_WORD *)(v43 + 30);
    if ((v40 & 0x80000000) != 0)
    {
LABEL_64:
      if (__osLog)
        v44 = __osLog;
      else
        v44 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        goto LABEL_77;
      *(_DWORD *)buf = 136316162;
      v188 = "newVertex->componentIndex > -1";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 555;
LABEL_69:
      _os_log_impl(&dword_1AF533000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_77;
    }
    v41 = 0;
LABEL_72:
    v45 = *(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * (__int16)v40);
    ++*(_WORD *)(v45 + 24);
    ++*(_WORD *)(v45 + 26);
    if (v4)
    {
      *((_DWORD *)v4 + 1) = *(__int16 *)(v28 + 24);
      *((_DWORD *)v4 + 2) = (__int16)v40;
      v46 = *(double *)(v45 + 16);
      v47 = __sincos_stret(v46);
      v4[4] = v46 + *(double *)(v28 + 16);
      v48 = *(double *)(v28 + 8);
      v4[2] = *(double *)v45 + v47.__cosval * *(double *)v28 - v47.__sinval * v48;
      v4[3] = *(double *)(v45 + 8) + v47.__sinval * *(double *)v28 + v47.__cosval * v48;
      if (v41)
        v49 = 1;
      else
        v49 = 2;
      *(_DWORD *)v4 = v49;
    }
    goto LABEL_77;
  }
  if (SLOWORD(v181[0]) < 1)
  {
LABEL_56:
    *((_WORD *)v27 + 15) = v3[5];
    v39 = malloc_type_calloc(0x20uLL, 1uLL, 0x204D495uLL);
    v40 = *(__int16 *)(v28 + 30);
    *(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * v40) = v39;
    if (*(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * v40))
    {
      ++v3[5];
      v41 = 1;
      goto LABEL_72;
    }
    if (__osLog)
      v155 = __osLog;
    else
      v155 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      goto LABEL_309;
    *(_DWORD *)buf = 136316162;
    v188 = "set->components[newVertex->componentIndex] != ((void *)0)";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 536;
    goto LABEL_308;
  }
  v37 = 0;
  v38 = (unsigned __int16 *)v182;
  while (v6 == v37 || *v38 != (unsigned __int16)v6)
  {
    ++v37;
    v38 += 16;
    if (LOWORD(v181[0]) == v37)
      goto LABEL_56;
  }
  if ((v30 & 0x80000000) != 0)
  {
LABEL_169:
    if (__osLog)
      v44 = __osLog;
    else
      v44 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_77;
    *(_DWORD *)buf = 136316162;
    v188 = "v";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 512;
    goto LABEL_69;
  }
  v129 = (unsigned __int16)v37;
  v130 = (uint64_t *)*((_QWORD *)v3 + 1);
  v131 = v130;
  v132 = v31;
  while (*(unsigned __int16 *)(*v131 + 26) != v129)
  {
    ++v131;
    if (!--v132)
      goto LABEL_169;
  }
  v133 = *(__int16 *)(*v131 + 28);
  while (1)
  {
    v134 = *v130;
    if (*(unsigned __int16 *)(*v130 + 26) == (unsigned __int16)v133)
      break;
    ++v130;
    if (!--v31)
    {
      if (__osLog)
        v44 = __osLog;
      else
        v44 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v188 = "oldBaseVertex";
        v189 = 2048;
        v190 = 0;
        v191 = 2080;
        v192 = (const char *)&unk_1AF575226;
        v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        v195 = 1024;
        v196 = 514;
        goto LABEL_69;
      }
      goto LABEL_77;
    }
  }
  if ((_DWORD)v133 == -1)
  {
    if (__osLog)
      v44 = __osLog;
    else
      v44 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v188 = "oldBaseVertex->mapiNodeIndex != -1";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 515;
      goto LABEL_69;
    }
  }
  else
  {
    *((_WORD *)v27 + 15) = *(_WORD *)(v134 + 30);
    if (fabs(v33) < 0.1 && fabs(v34) < 0.1 && vabdd_f64(v35 / 6.28318531, floor(v35 / 6.28318531)) < 0.01)
    {
      v135 = (double *)&v181[2 * v133];
      v136 = v135[1];
      v137 = v135[2];
      v138 = v135[3];
      v139 = __sincos_stret(v138);
      *(double *)v28 = -(v137 * v139.__sinval + v139.__cosval * v136);
      *(double *)(v28 + 8) = -(v137 * v139.__cosval + -v139.__sinval * v136);
      *(double *)(v28 + 16) = -v138;
      v140 = __RebaseComponent(v3, v134, v28);
      if (!(_DWORD)v140)
      {
        v41 = 0;
        LOWORD(v40) = *(_WORD *)(v28 + 30);
        goto LABEL_72;
      }
      v107 = v140;
      if (__osLog)
        v167 = __osLog;
      else
        v167 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v188 = "!result";
        v189 = 2048;
        v190 = 0;
        v191 = 2080;
        v192 = (const char *)&unk_1AF575226;
        v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        v195 = 1024;
        v196 = 527;
        _os_log_impl(&dword_1AF533000, v167, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_310;
    }
    if (__osLog)
      v44 = __osLog;
    else
      v44 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v188 = "__VectorIsZero(&newVertex->coordinates)";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 518;
      goto LABEL_69;
    }
  }
LABEL_77:
  v50 = *v3;
  if ((int)*v3 >= 1)
  {
    v175 = v4;
    v51 = 0;
    v52 = 0;
    v53 = 0.1;
    v54 = 6.28318531;
    v174 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
    while (1)
    {
      v55 = (uint64_t *)*((_QWORD *)v3 + 1);
      v56 = v55[v51];
      v57 = *(__int16 *)(v56 + 28);
      if (v57 != -1 && *(unsigned __int16 *)(v56 + 26) == (unsigned __int16)v57)
      {
        v58 = (unint64_t)&v181[2 * v57];
        v59 = *(unsigned __int16 *)(v58 + 32);
        if (v59 != (unsigned __int16)v57)
          break;
      }
LABEL_124:
      if (++v51 >= (int)v50)
      {
        v4 = v175;
        if (v175)
        {
          if (v52)
          {
            v108 = *((unsigned int *)v175 + 10);
            if ((int)v108 >= 1)
            {
              v109 = v5;
              v110 = 0;
              v111 = 0;
              v112 = 0;
              v113 = *((_DWORD *)v175 + 2);
              while (1)
              {
                v114 = &v175[4 * v110];
                v117 = *((_DWORD *)v114 + 13);
                v116 = (_DWORD *)v114 + 13;
                v115 = v117;
                v118 = v108;
                v119 = v175 + 9;
                if (v117 != v113)
                {
                  do
                  {
                    if (v115 == *((_DWORD *)v119 - 6))
                    {
                      if (*((_DWORD *)v119 - 5) == v113)
                      {
                        v120 = &v175[4 * v110];
                        v121 = *v119;
                        v122 = __sincos_stret(*v119);
                        v123 = v120[8];
                        v124 = v121 + v120[9];
                        v125 = v120[7];
                        v126 = *(v119 - 1) + v122.__sinval * v125 + v122.__cosval * v123;
                        v120[7] = *(v119 - 2) + v122.__cosval * v125 - v122.__sinval * v123;
                        v120[8] = v126;
                        v120[9] = v124;
                        *v116 = v113;
                        v112 = 1;
                        goto LABEL_160;
                      }
                      v127 = 1;
                      goto LABEL_161;
                    }
                    v119 += 4;
                    --v118;
                  }
                  while (v118);
                  v3 = v180;
                  if ((v112 & 1) == 0)
                  {
                    v105 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v188 = "foundNew";
                      v189 = 2048;
                      v190 = 0;
                      v191 = 2080;
                      v192 = "Unable to find component in report";
                      v193 = 2080;
                      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                      v195 = 1024;
                      v196 = 793;
                      goto LABEL_141;
                    }
                  }
                  goto LABEL_142;
                }
LABEL_160:
                v127 = v111;
LABEL_161:
                ++v110;
                v111 = v127;
                if (v110 == v108)
                {
                  v110 = 0;
                  v111 = 0;
                  v128 = v112 & v127;
                  v112 = 0;
                  if ((v128 & 1) == 0)
                    break;
                }
              }
              v3 = v180;
              v5 = v109;
              if ((v127 & 1) != 0)
                goto LABEL_142;
            }
          }
        }
        goto LABEL_206;
      }
    }
    v176 = v52;
    v60 = (float64x2_t *)(v58 | 8);
    v61 = v50;
    v62 = (uint64_t *)*((_QWORD *)v3 + 1);
    v63 = v50;
    while (1)
    {
      v64 = *v62;
      if (*(unsigned __int16 *)(*v62 + 26) == v59)
        break;
      ++v62;
      if (!--v63)
      {
        if (__osLog)
          v105 = __osLog;
        else
          v105 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v188 = "baseVertex";
          v189 = 2048;
          v190 = 0;
          v191 = 2080;
          v192 = (const char *)&unk_1AF575226;
          v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          v195 = 1024;
          v196 = 741;
LABEL_141:
          _os_log_impl(&dword_1AF533000, v105, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_142;
        }
        goto LABEL_142;
      }
    }
    v65 = *(__int16 *)(v64 + 30);
    v66 = *(unsigned __int16 *)(v56 + 30);
    if (v66 == *(unsigned __int16 *)(v64 + 30))
    {
      if (__osLog)
        v141 = __osLog;
      else
        v141 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
        goto LABEL_200;
      *(_DWORD *)buf = 136316162;
      v188 = "mergeBaseVertex->componentIndex != baseVertex->componentIndex";
      v189 = 2048;
      v190 = 0;
      v191 = 2080;
      v192 = (const char *)&unk_1AF575226;
      v193 = 2080;
      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v195 = 1024;
      v196 = 657;
    }
    else
    {
      v173 = v5;
      v179 = *(__int16 *)(v64 + 30);
      v67 = (__int16)v66;
      v68 = (__int16)v66;
      if (v175)
      {
        v69 = *((int *)v175 + 10);
        if ((int)v69 >= 300)
        {
          if (__osLog)
            v141 = __osLog;
          else
            v141 = MEMORY[0x1E0C81028];
          v3 = v180;
          if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v188 = "outReport->mergedComponentCount < 300";
            v189 = 2048;
            v190 = 0;
            v191 = 2080;
            v192 = (const char *)&unk_1AF575226;
            v193 = 2080;
            v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
            v195 = 1024;
            v196 = 662;
            goto LABEL_199;
          }
          goto LABEL_200;
        }
        *((_DWORD *)v175 + 10) = v69 + 1;
        v3 = v180;
        if ((*(_DWORD *)v175 & 0xFFFFFFFE) != 2)
        {
          if (__osLog)
            v141 = __osLog;
          else
            v141 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
            goto LABEL_200;
          *(_DWORD *)buf = 136316162;
          v188 = "(outReport->message == MSG_EXTEND_COMPONENT) || (outReport->message == MSG_MERGE_COMPONENTS)";
          v189 = 2048;
          v190 = 0;
          v191 = 2080;
          v192 = (const char *)&unk_1AF575226;
          v193 = 2080;
          v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
          v195 = 1024;
          v196 = 665;
          goto LABEL_199;
        }
        *(_DWORD *)v175 = 3;
        logb = (os_log_t)&v175[4 * v69];
        LODWORD(logb[6].isa) = v68;
        HIDWORD(logb[6].isa) = v65;
        v169 = *((_QWORD *)v180 + 5);
        v70 = *(double **)(v169 + 8 * v65);
        v71 = v70[2];
        v177 = v65;
        v72 = __sincos_stret(v71);
        v73 = v60->f64[1];
        v74 = v71 + v60[1].f64[0];
        v75 = *v70 + v72.__cosval * v60->f64[0] - v72.__sinval * v73;
        v168 = v70[1] + v72.__sinval * v60->f64[0] + v72.__cosval * v73;
        v76 = *(double **)(v169 + 8 * v67);
        v77 = *v76;
        v78 = v76[1];
        v79 = v54;
        v80 = v53;
        v81 = v76[2];
        v82 = __sincos_stret(v74);
        LOWORD(v65) = v177;
        v83 = v74 + v81;
        v53 = v80;
        v54 = v79;
        *(double *)&logb[7].isa = v75 + v82.__cosval * v77 - v82.__sinval * v78;
        *(double *)&logb[8].isa = v168 + v82.__sinval * v77 + v82.__cosval * v78;
        *(double *)&logb[9].isa = v83;
      }
      if (fabs(*(double *)v56) >= v53
        || fabs(*(double *)(v56 + 8)) >= v53
        || vabdd_f64(*(double *)(v56 + 16) / v54, floor(*(double *)(v56 + 16) / v54)) >= 0.01)
      {
        if (__osLog)
          v141 = __osLog;
        else
          v141 = MEMORY[0x1E0C81028];
        v3 = v180;
        if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          goto LABEL_200;
        *(_DWORD *)buf = 136316162;
        v188 = "__VectorIsZero(&mergeBaseVertex->coordinates)";
        v189 = 2048;
        v190 = 0;
        v191 = 2080;
        v192 = (const char *)&unk_1AF575226;
        v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        v195 = 1024;
        v196 = 681;
      }
      else
      {
        v178 = v65;
        do
        {
          v84 = *v55;
          if (*(unsigned __int16 *)(*v55 + 30) == (unsigned __int16)v67)
          {
            v85 = v60[1].f64[0];
            v86 = __sincos_stret(v85);
            v87 = *(double *)(v84 + 8);
            v88 = v85 + *(double *)(v84 + 16);
            v89 = v60->f64[1] + v86.__sinval * *(double *)v84 + v86.__cosval * v87;
            *(double *)v84 = v60->f64[0] + v86.__cosval * *(double *)v84 - v86.__sinval * v87;
            *(float64_t *)(v84 + 8) = v89;
            *(double *)(v84 + 16) = v88;
            *(_WORD *)(v84 + 28) = *(_WORD *)(v64 + 28);
          }
          ++v55;
          --v61;
        }
        while (v61);
        v90 = vmovn_s64(vcgtq_f64(v174, vabdq_f64(*(float64x2_t *)v56, *v60)));
        if ((v90.i32[0] & v90.i32[1] & 1) != 0)
        {
          v91 = vabdd_f64(*(double *)(v56 + 16), v60[1].f64[0]) / v54;
          if (vabdd_f64(v91, floor(v91)) < 0.01)
          {
            v92 = 0;
            v3 = v180;
            do
            {
              v93 = *(_QWORD *)(*((_QWORD *)v3 + 1) + 8 * v92);
              if (*(unsigned __int16 *)(v93 + 30) == (unsigned __int16)v68)
              {
                v94 = *((_QWORD *)v3 + 5);
                v95 = *(_QWORD *)(v94 + 8 * v67);
                v96 = *(__int16 *)(v95 + 24);
                if (v96 <= 0)
                {
                  v99 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
                  log = v99;
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v188 = "set->components[replaceComponentIndex]->nodeCount > 0";
                    v189 = 2048;
                    v190 = 0;
                    v191 = 2080;
                    v192 = (const char *)&unk_1AF575226;
                    v193 = 2080;
                    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                    v195 = 1024;
                    v196 = 701;
                    _os_log_impl(&dword_1AF533000, log, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                    v94 = *((_QWORD *)v180 + 5);
                    v95 = *(_QWORD *)(v94 + 8 * v67);
                    LOWORD(v96) = *(_WORD *)(v95 + 24);
                  }
                }
                *(_WORD *)(v95 + 24) = v96 - 1;
                v97 = *(_QWORD *)(v94 + 8 * v179);
                ++*(_WORD *)(v97 + 24);
                if (*(__int16 *)(v93 + 26) != -1)
                {
                  v98 = *(__int16 *)(v95 + 26);
                  if (v98 <= 0)
                  {
                    v100 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
                    loga = v100;
                    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v188 = "set->components[replaceComponentIndex]->mapiNodeCount > 0";
                      v189 = 2048;
                      v190 = 0;
                      v191 = 2080;
                      v192 = (const char *)&unk_1AF575226;
                      v193 = 2080;
                      v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                      v195 = 1024;
                      v196 = 706;
                      _os_log_impl(&dword_1AF533000, loga, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                      v101 = *((_QWORD *)v180 + 5);
                      v95 = *(_QWORD *)(v101 + 8 * v67);
                      LOWORD(v98) = *(_WORD *)(v95 + 26);
                      v97 = *(_QWORD *)(v101 + 8 * v179);
                    }
                  }
                  *(_WORD *)(v95 + 26) = v98 - 1;
                  ++*(_WORD *)(v97 + 26);
                }
                *(_WORD *)(v93 + 30) = v178;
                v3 = v180;
                v50 = *v180;
              }
              ++v92;
            }
            while (v92 < (int)v50);
            v102 = *(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * v67);
            if (*(_WORD *)(v102 + 24))
            {
              if (__osLog)
                v103 = __osLog;
              else
                v103 = MEMORY[0x1E0C81028];
              v5 = v173;
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v188 = "set->components[replaceComponentIndex]->nodeCount == 0";
                v189 = 2048;
                v190 = 0;
                v191 = 2080;
                v192 = (const char *)&unk_1AF575226;
                v193 = 2080;
                v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                v195 = 1024;
                v196 = 713;
                _os_log_impl(&dword_1AF533000, v103, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                v102 = *(_QWORD *)(*((_QWORD *)v3 + 5) + 8 * v67);
              }
            }
            else
            {
              v5 = v173;
            }
            if (*(_WORD *)(v102 + 26))
            {
              v104 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v188 = "set->components[replaceComponentIndex]->mapiNodeCount == 0";
                v189 = 2048;
                v190 = 0;
                v191 = 2080;
                v192 = (const char *)&unk_1AF575226;
                v193 = 2080;
                v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
                v195 = 1024;
                v196 = 714;
                _os_log_impl(&dword_1AF533000, v104, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
            }
            if (*(unsigned __int16 *)(v64 + 30) == *(unsigned __int16 *)(v56 + 30))
            {
              v52 = v176 + 1;
              v50 = *v3;
              goto LABEL_124;
            }
            if (__osLog)
              v141 = __osLog;
            else
              v141 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v188 = "baseVertex->componentIndex == mergeBaseVertex->componentIndex";
              v189 = 2048;
              v190 = 0;
              v191 = 2080;
              v192 = (const char *)&unk_1AF575226;
              v193 = 2080;
              v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              v195 = 1024;
              v196 = 717;
              goto LABEL_199;
            }
LABEL_200:
            if (__osLog)
              v105 = __osLog;
            else
              v105 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v188 = "!result";
              v189 = 2048;
              v190 = 0;
              v191 = 2080;
              v192 = (const char *)&unk_1AF575226;
              v193 = 2080;
              v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              v195 = 1024;
              v196 = 743;
              goto LABEL_141;
            }
LABEL_142:
            if (__osLog)
              v106 = __osLog;
            else
              v106 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v188 = "!result";
              v189 = 2048;
              v190 = 0;
              v191 = 2080;
              v192 = (const char *)&unk_1AF575226;
              v193 = 2080;
              v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              v195 = 1024;
              v196 = 926;
              goto LABEL_147;
            }
            goto LABEL_148;
          }
        }
        if (__osLog)
          v141 = __osLog;
        else
          v141 = MEMORY[0x1E0C81028];
        v3 = v180;
        if (!os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          goto LABEL_200;
        *(_DWORD *)buf = 136316162;
        v188 = "__VectorEquals(&mergeBaseVertex->coordinates,mergeVector)";
        v189 = 2048;
        v190 = 0;
        v191 = 2080;
        v192 = (const char *)&unk_1AF575226;
        v193 = 2080;
        v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        v195 = 1024;
        v196 = 694;
      }
    }
LABEL_199:
    _os_log_impl(&dword_1AF533000, v141, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_200;
  }
LABEL_206:
  LargestComponent = __FindLargestComponent(v3, 1, v3 + 8);
  if ((_DWORD)LargestComponent)
  {
    v107 = LargestComponent;
    if (__osLog)
      v152 = __osLog;
    else
      v152 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      goto LABEL_149;
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 945;
    goto LABEL_315;
  }
  v143 = __FindLargestComponent(v3, 0, v3 + 7);
  if ((_DWORD)v143)
  {
    v107 = v143;
    if (__osLog)
      v152 = __osLog;
    else
      v152 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      goto LABEL_149;
    *(_DWORD *)buf = 136316162;
    v188 = "!result";
    v189 = 2048;
    v190 = 0;
    v191 = 2080;
    v192 = (const char *)&unk_1AF575226;
    v193 = 2080;
    v194 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v195 = 1024;
    v196 = 948;
    goto LABEL_315;
  }
  if (!v4)
    return 0;
  *((_DWORD *)v4 + 2412) = v3[8];
  v144 = v4[3];
  v145 = v4[4] + 1.57079633;
  v146 = v4[2];
  v4[2] = v146 * 6.123234e-17 + 0.0 - v144;
  v4[3] = v146 + 0.0 + v144 * 6.123234e-17;
  v4[4] = v145 + -1.57079633;
  v147 = *((unsigned int *)v4 + 10);
  if ((int)v147 >= 1)
  {
    v148 = v4 + 9;
    do
    {
      v149 = *(v148 - 1);
      v150 = *v148 + 1.57079633;
      v151 = *(v148 - 2);
      *(v148 - 2) = v151 * 6.123234e-17 + 0.0 - v149;
      *(v148 - 1) = v151 + 0.0 + v149 * 6.123234e-17;
      *v148 = v150 + -1.57079633;
      v148 += 4;
      --v147;
    }
    while (v147);
  }
  v107 = 0;
  *((_WORD *)v4 + 4830) = v183;
  *((_QWORD *)v4 + 1208) = v184;
  *((_WORD *)v4 + 4836) = v185;
  *((_QWORD *)v4 + 1210) = v186;
  *((_DWORD *)v4 + 2422) = v5[1529] & 1;
  return v107;
}

uint64_t __TranslateNodePlacement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __double2 v15;
  __int16 v16;
  uint64_t i;
  uint64_t v18;
  unsigned __int16 v19;
  double *v20;
  int v21;
  double *v22;
  int v23;
  uint64_t v24;
  int v25;
  double v26;
  __double2 v27;
  double v28;
  double v29;
  double v30;
  uint64_t result;
  double v32;
  NSObject *v33;
  int v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      return 22;
    v34 = 136316162;
    v35 = "inNodePlacement";
    v36 = 2048;
    v37 = 0;
    v38 = 2080;
    v39 = &unk_1AF575226;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v42 = 1024;
    v43 = 138;
    goto LABEL_23;
  }
  if (*(_WORD *)a1 != 3060)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      return 22;
    v34 = 136316162;
    v35 = "inNodePlacement->structSize == sizeof(*inNodePlacement)";
    v36 = 2048;
    v37 = 0;
    v38 = 2080;
    v39 = &unk_1AF575226;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v42 = 1024;
    v43 = 139;
    goto LABEL_23;
  }
  if (*(_WORD *)(a1 + 2) != 3)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      return 22;
    v34 = 136316162;
    v35 = "inNodePlacement->version == 3";
    v36 = 2048;
    v37 = 0;
    v38 = 2080;
    v39 = &unk_1AF575226;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v42 = 1024;
    v43 = 140;
    goto LABEL_23;
  }
  if (!a2)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      return 22;
    v34 = 136316162;
    v35 = "outNodePlacement";
    v36 = 2048;
    v37 = 0;
    v38 = 2080;
    v39 = &unk_1AF575226;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v42 = 1024;
    v43 = 142;
LABEL_23:
    _os_log_impl(&dword_1AF533000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v34, 0x30u);
    return 22;
  }
  v4 = *(__int16 *)(a1 + 4);
  *(_WORD *)a2 = v4;
  *(_DWORD *)(a2 + 2) = *(_DWORD *)(a1 + 6);
  v5 = *(__int16 *)(a1 + 46);
  if (v4 >= 1)
  {
    v6 = (double)v5;
    v7 = v4;
    v8 = a2 + 16;
    v9 = (_BYTE *)(a1 + 56);
    v10 = v4;
    do
    {
      v11 = (double)*((__int16 *)v9 - 3) * 100.0 / v6;
      *(double *)(v8 - 8) = v11;
      v12 = (double)*((__int16 *)v9 - 2) * 100.0 / v6;
      *(double *)v8 = v12;
      v13 = (double)*((__int16 *)v9 - 4) * 3.14159265;
      v14 = v13 * 0.00390625;
      *(double *)(v8 + 8) = v13 * 0.00390625;
      if ((*v9 & 1) != 0)
      {
        v15 = __sincos_stret(v13 * 0.00390625);
        *(double *)(v8 - 8) = -(v12 * v15.__sinval + v15.__cosval * v11);
        *(double *)v8 = -(v12 * v15.__cosval + -v15.__sinval * v11);
        *(double *)(v8 + 8) = -v14;
      }
      v16 = *((_WORD *)v9 - 1);
      v9 += 10;
      *(_WORD *)(v8 + 16) = v16;
      v8 += 32;
      --v10;
    }
    while (v10);
    for (i = 0; i != v7; ++i)
    {
      v18 = a2 + 32 * i;
      v21 = *(__int16 *)(v18 + 32);
      v20 = (double *)(v18 + 32);
      v19 = v21;
      if ((v21 & 0x80000000) == 0)
      {
        v22 = v20 - 3;
        v23 = 300;
        while (1)
        {
          v24 = a2 + 32 * (__int16)v19;
          v25 = *(unsigned __int16 *)(v24 + 32);
          if (v25 == v19)
            break;
          v26 = *(double *)(v24 + 24);
          v27 = __sincos_stret(v26);
          v28 = *(v20 - 2);
          v29 = v26 + *(v20 - 1);
          v30 = *(double *)(v24 + 16) + v27.__sinval * *v22 + v27.__cosval * v28;
          *v22 = *(double *)(v24 + 8) + v27.__cosval * *v22 - v27.__sinval * v28;
          *(v20 - 2) = v30;
          *(v20 - 1) = v29;
          *(_WORD *)v20 = v25;
          v19 = v25;
          if (!--v23)
          {
            if (__osLog)
              v33 = __osLog;
            else
              v33 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = 136316162;
              v35 = "found";
              v36 = 2048;
              v37 = 0;
              v38 = 2080;
              v39 = &unk_1AF575226;
              v40 = 2080;
              v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              v42 = 1024;
              v43 = 181;
              goto LABEL_23;
            }
            return 22;
          }
        }
      }
    }
  }
  result = 0;
  *(_WORD *)(a2 + 9608) = *(_WORD *)(a1 + 3048);
  v32 = 100.0 / (double)v5 * (100.0 / (double)v5);
  *(double *)(a2 + 9616) = v32 * (double)(16 * *(__int16 *)(a1 + 3050));
  *(_WORD *)(a2 + 9624) = *(_WORD *)(a1 + 3052);
  *(double *)(a2 + 9632) = v32 * (double)(16 * *(__int16 *)(a1 + 3054));
  return result;
}

uint64_t __FindLargestComponent(unsigned int *a1, int a2, _DWORD *a3)
{
  unsigned __int16 *v6;
  __int128 v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  NSObject *v24;
  NSObject *v25;
  NSObject *log;
  __int128 v27;
  _DWORD *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned __int16 *)malloc_type_calloc((int)a1[5], 2uLL, 0x1000040BDFB0063uLL);
  if (v6)
  {
    v8 = v6;
    v9 = *a1;
    v10 = a1[5];
    if ((int)v9 < 1)
    {
LABEL_9:
      if (v10 < 1)
      {
        v22 = 0;
      }
      else
      {
        v28 = a3;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = MEMORY[0x1E0C81028];
        *(_QWORD *)&v7 = 136316162;
        do
        {
          v16 = v12;
          v17 = v8[v12];
          v18 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8 * v12);
          if (a2)
            v19 = 26;
          else
            v19 = 24;
          if (v17 != *(__int16 *)(v18 + v19))
          {
            v20 = (__osLog ? __osLog : v15);
            log = v20;
            v27 = v7;
            v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
            v7 = v27;
            v15 = MEMORY[0x1E0C81028];
            if (v21)
            {
              *(_DWORD *)buf = v27;
              v30 = "histogram[i] == (mapiNodesOnly?set->components[i]->mapiNodeCount:set->components[i]->nodeCount)";
              v31 = 2048;
              v32 = 0;
              v33 = 2080;
              v34 = &unk_1AF575226;
              v35 = 2080;
              v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
              v37 = 1024;
              v38 = 832;
              _os_log_impl(&dword_1AF533000, log, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              v7 = v27;
              v15 = MEMORY[0x1E0C81028];
              v17 = v8[v16];
              v10 = a1[5];
            }
          }
          if (v17 > v14)
          {
            v14 = v17;
            v13 = v16;
          }
          v12 = v16 + 1;
        }
        while (v10 > (__int16)(v16 + 1));
        v22 = v13;
        a3 = v28;
      }
      *a3 = v22;
    }
    else
    {
      v11 = *((_QWORD *)a1 + 1);
      while (v10 > *(__int16 *)(*(_QWORD *)v11 + 30))
      {
        if (!a2 || *(__int16 *)(*(_QWORD *)v11 + 26) != -1)
          ++v6[*(__int16 *)(*(_QWORD *)v11 + 30)];
        v11 += 8;
        if (!--v9)
          goto LABEL_9;
      }
      if (__osLog)
        v24 = __osLog;
      else
        v24 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v30 = "v->componentIndex < set->componentCount";
        v31 = 2048;
        v32 = 0;
        v33 = 2080;
        v34 = &unk_1AF575226;
        v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
        v37 = 1024;
        v38 = 824;
        _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    free(v8);
    return 0;
  }
  else
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v30 = "histogram != ((void *)0)";
      v31 = 2048;
      v32 = 0;
      v33 = 2080;
      v34 = &unk_1AF575226;
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v37 = 1024;
      v38 = 819;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 12;
  }
}

uint64_t FindRectangleForComponent(unsigned int *a1, unsigned __int16 a2, _WORD *a3, _WORD *a4, _WORD *a5, _WORD *a6)
{
  uint64_t v6;
  double **v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  double v13;

  v6 = *a1;
  if ((int)v6 < 1)
  {
    v11 = 0.0;
    v10 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v7 = (double **)*((_QWORD *)a1 + 1);
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      v12 = *v7;
      if (*((unsigned __int16 *)*v7 + 15) == a2)
      {
        v13 = v12[1];
        if (v11 > *v12)
          v11 = *v12;
        if (v10 < *v12)
          v10 = *v12;
        if (v9 > v13)
          v9 = v12[1];
        if (v8 < v13)
          v8 = v12[1];
      }
      ++v7;
      --v6;
    }
    while (v6);
  }
  *a3 = (int)(v11 + -1.0);
  *a4 = (int)(v9 + -1.0);
  *a5 = (int)(v10 + 1.0);
  *a6 = (int)(v8 + 1.0);
  return 0;
}

uint64_t GenerateTemplateTopology()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  _OWORD v13[600];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  _DWORD v28[300];
  uint64_t v29;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = v0;
  v29 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, 512);
  bzero(v28, 0x4B0uLL);
  v12 = 0;
  if (!v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 22;
    v18 = 136316162;
    v19 = "inInfoTable";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v26 = 1024;
    v27 = 1077;
    goto LABEL_24;
  }
  if (!v2)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 22;
    v18 = 136316162;
    v19 = "outResult";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v26 = 1024;
    v27 = 1078;
LABEL_24:
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    return 22;
  }
  v4 = __TranslateNodePlacement(v3, (uint64_t)v13);
  if ((_DWORD)v4)
  {
    v8 = v4;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      return v8;
    v18 = 136316162;
    v19 = "result == 0";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v26 = 1024;
    v27 = 1081;
LABEL_36:
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    return v8;
  }
  v5 = __GenerateTemplateTopology((uint64_t)v13, (_DWORD *)v2, (uint64_t)v28, &v12);
  if ((_DWORD)v5)
  {
    v8 = v5;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      return v8;
    v18 = 136316162;
    v19 = "result == 0";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v26 = 1024;
    v27 = 1084;
    goto LABEL_36;
  }
  if (v12 < 2)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    for (i = 1; i != v12; ++i)
    {
      if (v28[v6] < v28[i])
        v6 = i;
    }
  }
  v8 = 0;
  *(_DWORD *)(v2 + 4) = v14;
  *(_QWORD *)(v2 + 8) = v15;
  *(_DWORD *)(v2 + 16) = v16;
  *(_QWORD *)(v2 + 24) = v17;
  *(_DWORD *)(v2 + 32) = v6;
  *(_DWORD *)(v2 + 36) = -1;
  return v8;
}

uint64_t __GenerateTemplateTopology(uint64_t a1, _DWORD *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  int v13;
  int v14;
  double v15;
  double v16;
  uint64_t result;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  _DWORD v29[300];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  bzero(v29, 0x4B0uLL);
  if (!a1)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      return 22;
    v19 = 136316162;
    v20 = "convertedTopology";
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = &unk_1AF575226;
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v27 = 1024;
    v28 = 1025;
    goto LABEL_24;
  }
  if (!a2)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      return 22;
    v19 = 136316162;
    v20 = "outResult";
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = &unk_1AF575226;
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v27 = 1024;
    v28 = 1026;
LABEL_24:
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    return 22;
  }
  v8 = 0;
  v9 = 0;
  v10 = a1 + 16;
  v11 = (double *)(a2 + 18);
  do
  {
    v12 = *(__int16 *)(v10 + 16);
    if (v12 == -1)
      break;
    *((_DWORD *)v11 - 7) = v8;
    if (v8 == v12)
    {
      v13 = v9++;
      v14 = 1;
    }
    else
    {
      v13 = v29[v12];
      v14 = 2;
    }
    *((_DWORD *)v11 - 8) = v14;
    v29[v8] = v13;
    *((_DWORD *)v11 - 6) = v13;
    v15 = *(double *)v10;
    v16 = *(double *)(v10 + 8) + 1.57079633;
    *(v11 - 2) = *(double *)(v10 - 8) * 6.123234e-17 + 0.0 - *(double *)v10;
    *(v11 - 1) = *(double *)(v10 - 8) + 0.0 + v15 * 6.123234e-17;
    *v11 = v16 + -1.57079633;
    if (a3)
      ++*(_DWORD *)(a3 + 4 * v13);
    ++v8;
    v10 += 32;
    v11 += 5;
  }
  while (v8 != 300);
  *a2 = v8;
  result = 0;
  if (a4)
    *a4 = v9;
  return result;
}

uint64_t GenerateMatchTemplateTopology()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int16 *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t TemplateTopology;
  int v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __double2 v22;
  uint64_t v23;
  double v24;
  NSObject *v26;
  NSObject *v27;
  _BYTE v28[9608];
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = (__int16 *)v0;
  v43 = *MEMORY[0x1E0C80C00];
  bzero(v28, 0x25A8uLL);
  if (!v3)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    *(_DWORD *)buf = 136316162;
    v34 = "inInfoTable";
    v35 = 2048;
    v36 = 0;
    v37 = 2080;
    v38 = &unk_1AF575226;
    v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v41 = 1024;
    v42 = 1117;
    goto LABEL_34;
  }
  if (!v2)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    *(_DWORD *)buf = 136316162;
    v34 = "outResult";
    v35 = 2048;
    v36 = 0;
    v37 = 2080;
    v38 = &unk_1AF575226;
    v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v41 = 1024;
    v42 = 1118;
    goto LABEL_34;
  }
  v4 = __TranslateNodePlacement((uint64_t)(v3 + 6), (uint64_t)v28);
  if ((_DWORD)v4)
  {
    v23 = v4;
    if (__osLog)
      v27 = __osLog;
    else
      v27 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "result == 0";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_1AF575226;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v41 = 1024;
      v42 = 1121;
LABEL_28:
      _os_log_impl(&dword_1AF533000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v5 = v3[29];
    v6 = v3[4];
    v7 = v3[5];
    v8 = v3[3];
    TemplateTopology = __GenerateTemplateTopology((uint64_t)v28, (_DWORD *)v2, 0, 0);
    if (!(_DWORD)TemplateTopology)
    {
      v10 = (*(_DWORD *)v2)++;
      v11 = v2 + 40 * v10;
      *(_DWORD *)(v11 + 40) = 4;
      *(_DWORD *)(v11 + 44) = v10;
      if (v3[2] < 300)
      {
        v12 = (double)v6 * 100.0 / (double)v5;
        v13 = (double)v7 * 100.0 / (double)v5;
        v14 = (double)v8 * 3.14159265 * 0.00390625;
        v15 = v2 + 40 + 40 * v3[2];
        v16 = *(_DWORD *)(v15 + 8);
        v17 = v2 + 40 + 40 * v10;
        *(_DWORD *)(v17 + 8) = v16;
        v18 = v12 * 6.123234e-17 + 0.0 - v13;
        v19 = v12 + 0.0 + v13 * 6.123234e-17;
        v20 = v14 + 1.57079633 + -1.57079633;
        v21 = *(double *)(v15 + 32);
        v22 = __sincos_stret(v21);
        v23 = 0;
        v24 = *(double *)(v15 + 24);
        *(double *)(v17 + 16) = *(double *)(v15 + 16) + v22.__cosval * v18 - v22.__sinval * v19;
        *(double *)(v17 + 24) = v24 + v22.__sinval * v18 + v22.__cosval * v19;
        *(double *)(v17 + 32) = v20 + v21;
        *(_DWORD *)(v2 + 32) = v16;
        *(_DWORD *)(v2 + 4) = v29;
        *(_QWORD *)(v2 + 8) = v30;
        *(_DWORD *)(v2 + 16) = v31;
        *(_QWORD *)(v2 + 24) = v32;
        *(_DWORD *)(v2 + 36) = v3[9] != -1;
        return v23;
      }
      if (__osLog)
        v26 = __osLog;
      else
        v26 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        return 22;
      *(_DWORD *)buf = 136316162;
      v34 = "inInfoTable->matchNode < 300";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_1AF575226;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v41 = 1024;
      v42 = 1137;
LABEL_34:
      _os_log_impl(&dword_1AF533000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      return 22;
    }
    v23 = TemplateTopology;
    if (__osLog)
      v27 = __osLog;
    else
      v27 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "result == 0";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_1AF575226;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
      v41 = 1024;
      v42 = 1128;
      goto LABEL_28;
    }
  }
  return v23;
}

uint64_t __RebaseComponent(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int v6;
  unsigned __int16 v8;
  double *v9;
  double v10;
  __double2 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __double2 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int16 *)(a2 + 30);
  if (v3 != *(unsigned __int16 *)(a3 + 30))
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    v27 = 136316162;
    v28 = "oldBase->componentIndex == newBase->componentIndex";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_1AF575226;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v35 = 1024;
    v36 = 438;
    goto LABEL_54;
  }
  v4 = *(unsigned __int16 *)(a2 + 26);
  if (v4 == 0xFFFF)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    v27 = 136316162;
    v28 = "oldBase->mapiNodeIndex != -1";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_1AF575226;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v35 = 1024;
    v36 = 441;
    goto LABEL_54;
  }
  v6 = *(unsigned __int16 *)(a3 + 26);
  if (v6 == 0xFFFF)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    v27 = 136316162;
    v28 = "newBase->mapiNodeIndex != -1";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_1AF575226;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v35 = 1024;
    v36 = 442;
    goto LABEL_54;
  }
  if (v4 != *(unsigned __int16 *)(a2 + 28))
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    v27 = 136316162;
    v28 = "oldBase->mapiNodeIndex == oldBase->mapiBaseNodeIndex";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_1AF575226;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v35 = 1024;
    v36 = 445;
    goto LABEL_54;
  }
  if (fabs(*(double *)a2) >= 0.1
    || fabs(*(double *)(a2 + 8)) >= 0.1
    || vabdd_f64(*(double *)(a2 + 16) / 6.28318531, floor(*(double *)(a2 + 16) / 6.28318531)) >= 0.01)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    v27 = 136316162;
    v28 = "__VectorIsZero(&oldBase->coordinates)";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_1AF575226;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v35 = 1024;
    v36 = 446;
    goto LABEL_54;
  }
  v8 = *(_WORD *)(a2 + 30);
  v9 = *(double **)(*((_QWORD *)a1 + 5) + 8 * (__int16)v3);
  v10 = v9[2];
  v11 = __sincos_stret(v10);
  v12 = *(double *)(a3 + 8);
  v13 = v10 + *(double *)(a3 + 16);
  v14 = v9[1] + v11.__sinval * *(double *)a3 + v11.__cosval * v12;
  *v9 = *v9 + v11.__cosval * *(double *)a3 - v11.__sinval * v12;
  v9[1] = v14;
  v9[2] = v13;
  v15 = *(double *)a3;
  v16 = *(double *)(a3 + 8);
  v17 = *(double *)(a3 + 16);
  v18 = __sincos_stret(v17);
  v19 = *a1;
  if ((int)v19 >= 1)
  {
    v20 = (uint64_t *)*((_QWORD *)a1 + 1);
    do
    {
      v21 = *v20;
      if (*(unsigned __int16 *)(*v20 + 30) == v8)
      {
        *(_WORD *)(v21 + 28) = v6;
        v22 = *(double *)(v21 + 8);
        v23 = *(double *)(v21 + 16) - v17;
        v24 = -v18.__sinval * *(double *)v21 - (v16 * v18.__cosval + -v18.__sinval * v15) + v18.__cosval * v22;
        *(double *)v21 = v18.__cosval * *(double *)v21 - (v16 * v18.__sinval + v18.__cosval * v15) + v18.__sinval * v22;
        *(double *)(v21 + 8) = v24;
        *(double *)(v21 + 16) = v23;
      }
      ++v20;
      --v19;
    }
    while (v19);
    v15 = *(double *)a3;
  }
  if (fabs(v15) >= 0.1
    || fabs(*(double *)(a3 + 8)) >= 0.1
    || vabdd_f64(*(double *)(a3 + 16) / 6.28318531, floor(*(double *)(a3 + 16) / 6.28318531)) >= 0.01)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      return 22;
    v27 = 136316162;
    v28 = "__VectorIsZero(&newBase->coordinates)";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_1AF575226;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v35 = 1024;
    v36 = 470;
    goto LABEL_54;
  }
  if (v6 == *(unsigned __int16 *)(a3 + 28))
    return 0;
  if (__osLog)
    v26 = __osLog;
  else
    v26 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = 136316162;
    v28 = "newBase->mapiNodeIndex == newBase->mapiBaseNodeIndex";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_1AF575226;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/TouchID/nodevis.c";
    v35 = 1024;
    v36 = 472;
LABEL_54:
    _os_log_impl(&dword_1AF533000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
  }
  return 22;
}

void sub_1AF554FA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF5550FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void updateCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (__osLog)
    v10 = __osLog;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134219010;
    v13 = a1;
    v14 = 2048;
    v15 = a2;
    v16 = 2112;
    v17 = a3;
    v18 = 2048;
    v19 = a4;
    v20 = 2112;
    v21 = a5;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEBUG, "updateCallback <- notificationCenter:%p, observer:%p, name:%@, object:%p, userInfo:%@\n", (uint8_t *)&v12, 0x34u);
  }
  v11 = a2;
  objc_msgSend(v11, "synchronize");
  objc_msgSend(v11, "updateNotification");

}

void sub_1AF555310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF5553EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF555700(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF557734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AF5580EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AF55A604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AF55ABE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AF55B17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t SaveRawImageAsPGM(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  const void *v8;
  FILE *v9;
  FILE *v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(objc_retainAutorelease(*(id *)a1), "bytes");
  if (v7
    && (v8 = (const void *)v7,
        (v9 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), "w")) != 0))
  {
    v10 = v9;
    fwrite("P5\n", 3uLL, 1uLL, v9);
    if (v6)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v10, "#%s\n", (const char *)objc_msgSend(v11, "UTF8String"));

    }
    fprintf(v10, "%i %i 255\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    fwrite(v8, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12), v10);
    fclose(v10);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

FILE *LoadRawImageAsPGM(uint64_t a1, id a2)
{
  FILE *result;
  FILE *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  size_t v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  char v27[2];
  unsigned __int8 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = -1;
  v16 = -1;
  v14 = -1;
  *(_QWORD *)a1 = 0;
  result = fopen((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"), "rb");
  if (result)
  {
    v4 = result;
    if (!ReadLine(v27, result))
      return (FILE *)fclose(v4);
    if (*(unsigned __int16 *)v27 ^ 0x3550 | v28)
      return (FILE *)fclose(v4);
    if (!ReadLine(v27, v4))
      return (FILE *)fclose(v4);
    sscanf(v27, "%i%i%i", &v16, &v15, &v14);
    if (v16 < 1)
      return (FILE *)fclose(v4);
    v5 = v15;
    if (v15 == -1)
    {
      if (!ReadLine(v27, v4))
        return (FILE *)fclose(v4);
      sscanf(v27, "%i%i", &v15, &v14);
      v5 = v15;
      if (v15 < 1)
        return (FILE *)fclose(v4);
    }
    if (v14 == -1)
    {
      if (!ReadLine(v27, v4))
        return (FILE *)fclose(v4);
      sscanf(v27, "%i", &v14);
      if (v14 != 255)
        return (FILE *)fclose(v4);
      v5 = v15;
    }
    v6 = (unsigned __int128)(v5 * (__int128)v16) >> 64;
    if ((v6 & 1) != 0)
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "__os_warn_unused(__builtin_mul_overflow((width), (height), (&bufferSize))) == 0 ";
        v19 = 2048;
        v20 = v6 & 1;
        v21 = 2080;
        v22 = &unk_1AF575226;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        v25 = 1024;
        v26 = 186;
        _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      v7 = malloc_type_malloc(v16 * (uint64_t)v5, 0x8C79FD79uLL);
      if (v7)
      {
        v8 = v7;
        v9 = fread(v7, v16, v15, v4);
        v10 = v15;
        if (v9 == v15)
        {
          v11 = v16;
          *(_DWORD *)(a1 + 8) = v16;
          *(_DWORD *)(a1 + 12) = v10;
          *(_QWORD *)a1 = CFRetain((CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v8, v11 * v10));
        }
        else
        {
          if (__osLog)
            v13 = __osLog;
          else
            v13 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v18 = "bytes == height";
            v19 = 2048;
            v20 = 0;
            v21 = 2080;
            v22 = &unk_1AF575226;
            v23 = 2080;
            v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
            v25 = 1024;
            v26 = 193;
            _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          free(v8);
        }
      }
    }
    return (FILE *)fclose(v4);
  }
  return result;
}

const char *ReadLine(char *a1, FILE *a2)
{
  char *v4;
  char *v5;
  const char *v6;
  int v7;
  int v8;
  size_t v9;
  size_t v10;
  int v11;

  while (1)
  {
    v4 = fgets(a1, 1024, a2);
    if (!v4)
      break;
    v5 = v4;
    do
    {
      v6 = v5;
      v8 = *v5++;
      v7 = v8;
    }
    while (v8 && v7 < 33);
    v9 = strlen(v6);
    if (v9 == 1)
    {
      v11 = v7;
    }
    else
    {
      v10 = v9 - 2;
      do
      {
        if (v5[v10] > 32)
          break;
        v5[v10--] = 0;
      }
      while (v10 != -1);
      v11 = *(unsigned __int8 *)v6;
    }
    if (v11 != 35)
      return v6;
  }
  return 0;
}

uint64_t AppendCommentToPGM(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _BYTE *v8;
  unint64_t v9;
  _BYTE *v10;
  char *v11;
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = objc_retainAutorelease(v6);
    v8 = (_BYTE *)objc_msgSend(v7, "bytes");
    v9 = (unint64_t)&v8[objc_msgSend(v7, "length")];
    v10 = v8;
    while (1)
    {
      v11 = (char *)memchr(v10, 10, objc_msgSend(v7, "length"));
      if (!v11)
      {
        if (__osLog)
          v18 = __osLog;
        else
          v18 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v21 = "p";
          v22 = 2048;
          v23 = 0;
          v24 = 2080;
          v25 = &unk_1AF575226;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          v28 = 1024;
          v29 = 230;
          _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_18;
      }
      v10 = v11 + 1;
      if ((unint64_t)(v11 + 1) >= v9)
        break;
      if (*v10 != 35)
        goto LABEL_9;
    }
    v10 = v11;
LABEL_9:
    v12 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), "w");
    if (!v12)
      goto LABEL_18;
    v13 = v12;
    v14 = v10 - v8;
    fwrite(v8, v10 - v8, 1uLL, v12);
    if (v4)
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#"));
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v13, "#%s\n", (const char *)objc_msgSend(v15, "UTF8String"));

    }
    v16 = objc_msgSend(v7, "length");
    v17 = 1;
    fwrite(v10, v16 - v14, 1uLL, v13);
    fclose(v13);
  }
  else
  {
LABEL_18:
    v17 = 0;
  }

  return v17;
}

void RIESInit(void *a1)
{
  bzero(a1, 0x12C0uLL);
}

void RIESClear(char *a1)
{
  uint64_t v2;
  const void *v3;

  v2 = -4800;
  do
  {
    v3 = *(const void **)&a1[v2 + 4800];
    if (v3)
      CFRelease(v3);
    v2 += 16;
  }
  while (v2);
  bzero(a1, 0x12C0uLL);
}

void RIESAdd(uint64_t a1, _OWORD *a2, unsigned int a3)
{
  CFTypeRef *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x80000000) != 0)
  {
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "nodeIndex >= 0";
      v8 = 2048;
      v9 = 0;
      v10 = 2080;
      v11 = &unk_1AF575226;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      v14 = 1024;
      v15 = 277;
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
  }
  else
  {
    v4 = (CFTypeRef *)(a1 + 16 * a3);
    if (*v4)
      CFRelease(*v4);
    *(_OWORD *)v4 = *a2;
    if (*v4)
      CFRetain(*v4);
  }
}

void RIESSave(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t i;
  void *v5;
  id v6;

  DirectoryNameForIdentity(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  for (i = 0; i != 300; ++i)
  {
    if (*a1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%i.pgm"), v6, i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SaveRawImageAsPGM((uint64_t)a1, v5, 0);

    }
    a1 += 2;
  }

}

id DirectoryNameForIdentity(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/BiometricKit/biometrickitd"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void RIESLoad(uint64_t a1, void *a2)
{
  uint64_t i;
  void *v4;
  id v5;

  DirectoryNameForIdentity(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 300; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%i.pgm"), v5, i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LoadRawImageAsPGM(a1, v4);

    a1 += 16;
  }

}

void RIESDelete(void *a1)
{
  void *v1;
  id v2;

  DirectoryNameForIdentity(a1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeItemAtPath:error:", v2, 0);

}

void RIESUpdate(void *a1, _QWORD *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  DirectoryNameForIdentity(a1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%i.pgm"), v7, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a2)
  {
    SaveRawImageAsPGM((uint64_t)a2, v5, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtPath:error:", v5, 0);

  }
}

double roundMostSignificant(int a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)roundMostSignificant_formatter;
  if (!roundMostSignificant_formatter)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = (void *)roundMostSignificant_formatter;
    roundMostSignificant_formatter = (uint64_t)v4;

    objc_msgSend((id)roundMostSignificant_formatter, "setMaximumSignificantDigits:", a1);
    objc_msgSend((id)roundMostSignificant_formatter, "setUsesSignificantDigits:", 1);
    v3 = (void *)roundMostSignificant_formatter;
  }
  objc_msgSend(v3, "stringFromNumber:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

id rotateBitmap90Data8(char *a1, int a2, int a3)
{
  char *v5;
  size_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  void *v15;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 0;
    v18 = 136316162;
    v19 = "inData != ((void *)0)";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v26 = 1024;
    v27 = 376;
    goto LABEL_26;
  }
  if (a2 < 1 || a3 <= 0)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 0;
    v18 = 136316162;
    v19 = "(inW > 0) && (inH > 0)";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v26 = 1024;
    v27 = 377;
    goto LABEL_26;
  }
  v5 = a1;
  v6 = a3 * a2;
  v7 = malloc_type_malloc(v6, 0x53894718uLL);
  if (!v7)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 0;
    v18 = 136316162;
    v19 = "data8";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v26 = 1024;
    v27 = 380;
LABEL_26:
    _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    return 0;
  }
  v8 = v7;
  v9 = 0;
  v10 = a3 - 1;
  do
  {
    v11 = a2;
    v12 = v5;
    v13 = v10;
    do
    {
      v14 = *v12++;
      *((_BYTE *)v7 + v13) = v14;
      v13 += a3;
      --v11;
    }
    while (v11);
    ++v9;
    --v10;
    v5 += a2;
  }
  while (v9 != a3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);
  return v15;
}

id rotateBitmap90Data16(__int16 *a1, int a2, int a3)
{
  __int16 *v5;
  size_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int16 *v13;
  __int16 v14;
  void *v15;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 0;
    v18 = 136316162;
    v19 = "inData != ((void *)0)";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v26 = 1024;
    v27 = 410;
    goto LABEL_26;
  }
  if (a2 < 1 || a3 <= 0)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 0;
    v18 = 136316162;
    v19 = "(inW > 0) && (inH > 0)";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v26 = 1024;
    v27 = 411;
    goto LABEL_26;
  }
  v5 = a1;
  v6 = 2 * a3 * a2;
  v7 = (char *)malloc_type_malloc(v6, 0x6489FE91uLL);
  if (!v7)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 0;
    v18 = 136316162;
    v19 = "data16";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_1AF575226;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v26 = 1024;
    v27 = 414;
LABEL_26:
    _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    return 0;
  }
  v8 = v7;
  v9 = 0;
  v10 = a3 - 1;
  do
  {
    v11 = 2 * v10;
    v12 = a2;
    v13 = v5;
    do
    {
      v14 = *v13++;
      *(_WORD *)&v7[v11] = v14;
      v11 += 2 * a3;
      --v12;
    }
    while (v12);
    ++v9;
    --v10;
    v5 += a2;
  }
  while (v9 != a3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);
  return v15;
}

unint64_t absoluteToNanoseconds(uint64_t a1)
{
  unsigned int v2;
  kern_return_t v3;
  NSObject *v5;
  kern_return_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = dword_1ECF9A8F4;
  if (!dword_1ECF9A8F4)
  {
    v3 = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    if (v3)
    {
      v6 = v3;
      if (__osLog)
        v5 = __osLog;
      else
        v5 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v8 = "err == 0 ";
        v9 = 2048;
        v10 = v6;
        v11 = 2080;
        v12 = &unk_1AF575226;
        v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        v15 = 1024;
        v16 = 451;
        _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v2 = 1;
      dword_1ECF9A8F4 = 1;
    }
    else
    {
      v2 = dword_1ECF9A8F4;
    }
  }
  return (unint64_t)sTimebaseInfo * a1 / v2;
}

unint64_t nanosecondsToAbsolute(uint64_t a1)
{
  kern_return_t v2;
  NSObject *v4;
  kern_return_t v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!dword_1ECF9A8F4)
  {
    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    v2 = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    if (v2)
    {
      v5 = v2;
      if (__osLog)
        v4 = __osLog;
      else
        v4 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v7 = "err == 0 ";
        v8 = 2048;
        v9 = v5;
        v10 = 2080;
        v11 = &unk_1AF575226;
        v12 = 2080;
        v13 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        v14 = 1024;
        v15 = 475;
        _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      sTimebaseInfo = 1;
    }
  }
  return (unint64_t)dword_1ECF9A8F4 * a1 / sTimebaseInfo;
}

unint64_t localizeAbsolute(uint64_t a1, unsigned int *a2)
{
  unsigned int v4;

  v4 = dword_1ECF9A8F4;
  if (!dword_1ECF9A8F4)
  {
    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    v4 = dword_1ECF9A8F4;
  }
  return (unint64_t)*a2 * a1 / a2[1] * v4 / sTimebaseInfo;
}

unint64_t absoluteToMiliseconds(uint64_t a1)
{
  return absoluteToNanoseconds(a1) / 0xF4240;
}

uint64_t dictionaryGetBool(void *a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v6 && a3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v8, "BOOLValue");
        v10 = 0;
      }
      else
      {
        if (__osLog)
          v13 = __osLog;
        else
          v13 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = 136316162;
          v15 = "[value isKindOfClass:[NSNumber class]]";
          v16 = 2048;
          v17 = 0;
          v18 = 2080;
          v19 = &unk_1AF575226;
          v20 = 2080;
          v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          v22 = 1024;
          v23 = 523;
          _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
        }
        v9 = 0;
        v10 = 258;
      }

      goto LABEL_9;
    }
    v10 = 0;
LABEL_8:
    v9 = 0;
LABEL_9:
    *a3 = v9;
    goto LABEL_10;
  }
  if (__osLog)
    v12 = __osLog;
  else
    v12 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 136316162;
    v15 = "key != ((void *)0) && BOOLValue != ((void *)0)";
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = &unk_1AF575226;
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v22 = 1024;
    v23 = 518;
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
  }
  v10 = 258;
  if (a3)
    goto LABEL_8;
LABEL_10:

  return v10;
}

uint64_t dictionaryGetInteger(void *a1, void *a2, uint64_t *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v6 && a3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend((id)v7, "integerValue");

        v7 = 0;
      }
      else
      {
        if (__osLog)
          v11 = __osLog;
        else
          v11 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = 136316162;
          v13 = "[value isKindOfClass:[NSNumber class]]";
          v14 = 2048;
          v15 = 0;
          v16 = 2080;
          v17 = &unk_1AF575226;
          v18 = 2080;
          v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          v20 = 1024;
          v21 = 549;
          _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
        }

        v8 = 0;
        v7 = 258;
      }
    }
    else
    {
      v8 = *a3;
    }
    goto LABEL_7;
  }
  if (__osLog)
    v10 = __osLog;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = 136316162;
    v13 = "key != ((void *)0) && intValue != ((void *)0)";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = &unk_1AF575226;
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v20 = 1024;
    v21 = 544;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
  }
  v7 = 258;
  if (a3)
  {
    v8 = 0;
LABEL_7:
    *a3 = v8;
  }

  return v7;
}

uint64_t dictionaryGetDouble(void *a1, void *a2, uint64_t *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v6 && a3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)v7, "doubleValue");
        v9 = v8;

        v7 = 0;
      }
      else
      {
        if (__osLog)
          v12 = __osLog;
        else
          v12 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = 136316162;
          v14 = "[value isKindOfClass:[NSNumber class]]";
          v15 = 2048;
          v16 = 0;
          v17 = 2080;
          v18 = &unk_1AF575226;
          v19 = 2080;
          v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          v21 = 1024;
          v22 = 579;
          _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
        }

        v9 = 0;
        v7 = 258;
      }
    }
    else
    {
      v9 = *a3;
    }
LABEL_7:
    *a3 = v9;
    goto LABEL_8;
  }
  if (__osLog)
    v11 = __osLog;
  else
    v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = 136316162;
    v14 = "key != ((void *)0) && doubleValue != ((void *)0)";
    v15 = 2048;
    v16 = 0;
    v17 = 2080;
    v18 = &unk_1AF575226;
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v21 = 1024;
    v22 = 574;
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
  }
  v9 = 0;
  v7 = 258;
  if (a3)
    goto LABEL_7;
LABEL_8:

  return v7;
}

uint64_t dictionaryGetData(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v6 && a3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v8;
        v9 = 0;
        v8 = v7;
      }
      else
      {
        if (__osLog)
          v13 = __osLog;
        else
          v13 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = 136316162;
          v15 = "[value isKindOfClass:[NSData class]]";
          v16 = 2048;
          v17 = 0;
          v18 = 2080;
          v19 = &unk_1AF575226;
          v20 = 2080;
          v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
          v22 = 1024;
          v23 = 609;
          _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
        }
        v7 = 0;
        v9 = 258;
      }
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_7;
  }
  if (__osLog)
    v12 = __osLog;
  else
    v12 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 136316162;
    v15 = "key != ((void *)0) && dataValue != ((void *)0)";
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = &unk_1AF575226;
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
    v22 = 1024;
    v23 = 604;
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
  }
  v9 = 258;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
LABEL_7:
    v10 = objc_retainAutorelease(v7);
    *a3 = v10;

  }
  return v9;
}

uint64_t getSensorPatchVersion()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  void *CFProperty;
  const void *v4;
  uint64_t v5;
  const void *v6;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v0 = IOServiceMatching("AppleBiometricSensor");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v0);
  v2 = MatchingService;
  if (MatchingService)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("patch-version"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    v4 = CFProperty;
    if (CFProperty)
    {
      v5 = objc_msgSend(CFProperty, "integerValue");
      v6 = v4;
    }
    else
    {
      if (__osLog)
        v9 = __osLog;
      else
        v9 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 136316162;
        v11 = "property";
        v12 = 2048;
        v13 = 0;
        v14 = 2080;
        v15 = &unk_1AF575226;
        v16 = 2080;
        v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
        v18 = 1024;
        v19 = 636;
        _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
      }
      v6 = 0;
      v5 = -1;
    }
    IOObjectRelease(v2);
    if (v6)
      CFRelease(v6);
  }
  else
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "service != 0";
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = &unk_1AF575226;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      v18 = 1024;
      v19 = 633;
      _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    return -1;
  }
  return v5;
}

uint64_t isTouchIDPlatformWithFailure(_BYTE *a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((isTouchIDPlatformWithFailure_checked & 1) == 0)
  {
    v2 = MEMORY[0x1E0C81028];
    if (__osLogTrace)
      v3 = __osLogTrace;
    else
      v3 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_1AF533000, v3, OS_LOG_TYPE_DEFAULT, "isTouchIDPlatform() <-\n", (uint8_t *)v6, 2u);
    }
    isTouchIDPlatformWithFailure_checked = 1;
    isTouchIDPlatformWithFailure_result = MGGetBoolAnswer();
    if (__osLogTrace)
      v4 = __osLogTrace;
    else
      v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = isTouchIDPlatformWithFailure_result;
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_DEFAULT, "isTouchIDPlatform() -> %d\n", (uint8_t *)v6, 8u);
    }
  }
  if (a1)
    *a1 = 0;
  return isTouchIDPlatformWithFailure_result;
}

uint64_t isTouchIDPlatform()
{
  return isTouchIDPlatformWithFailure(0);
}

uint64_t getCurrentUserID()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentUser");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v2 = objc_msgSend(v1, "uid");
  }
  else
  {
    if (__osLog)
      v4 = __osLog;
    else
      v4 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136316162;
      v6 = "user";
      v7 = 2048;
      v8 = 0;
      v9 = 2080;
      v10 = &unk_1AF575226;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      v13 = 1024;
      v14 = 832;
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v5, 0x30u);
    }
    v2 = 0xFFFFFFFFLL;
  }

  return v2;
}

id getBootArgs()
{
  io_registry_entry_t v0;
  io_object_t v1;
  void *CFProperty;

  v0 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  if (v0)
  {
    v1 = v0;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, CFSTR("boot-args"), 0, 0);
    IOObjectRelease(v1);
  }
  else
  {
    CFProperty = 0;
  }
  return CFProperty;
}

uint64_t isInternalBuild()
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_52);
  return isInternalBuild_isInternal;
}

uint64_t __isInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalBuild_isInternal = result;
  return result;
}

void sub_1AF561A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF561DA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF56200C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF56210C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AF562420(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF562834(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __statusToFingerprintCaptureError(int a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 78;
  result = 0;
  switch(v1)
  {
    case 0:
      result = 6;
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      return result;
    case 7:
      result = 1;
      break;
    case 8:
      result = 2;
      break;
    case 9:
      result = 3;
      break;
    case 10:
      result = 4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t __faceDetectFeedback(uint64_t result)
{
  if ((unint64_t)(result - 2) >= 0xC)
    return 1;
  return result;
}

uint64_t __periocularMatchState(char a1)
{
  return a1 & 0x3F;
}

uint64_t __passcodeShortcutReason(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

void sub_1AF56E76C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF571618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AF5718DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

id setError(id result, _QWORD *a2)
{
  if (a2)
  {
    +[BKErrorHelper errorWithCode:](BKErrorHelper, "errorWithCode:", result);
    result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }
  return result;
}

id setErrorWithOSStatus(id result, _QWORD *a2)
{
  if (a2)
  {
    +[BKErrorHelper errorWithOSStatus:](BKErrorHelper, "errorWithOSStatus:", result);
    result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }
  return result;
}

void __initializeOSLog_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF533000, MEMORY[0x1E0C81028], a3, "Couldn't create OS Log for 'com.apple.BiometricKit.Framework-API'!\n", a5, a6, a7, a8, 0);
}

void __initializeOSLog_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF533000, MEMORY[0x1E0C81028], a3, "Couldn't create OS Log for 'com.apple.BiometricKit.Framework-Internal'!\n", a5, a6, a7, a8, 0);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

