void sub_1A359CEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FBLogScene()
{
  if (FBLogScene_onceToken != -1)
    dispatch_once(&FBLogScene_onceToken, &__block_literal_global_24);
  return (id)FBLogScene___logObj;
}

BOOL FBSceneLayerTypeMaskContainsType(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 - 1) > 3)
    v2 = 0;
  else
    v2 = qword_1A3619AA8[a2 - 1];
  return (v2 & a1) != 0;
}

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

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

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

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8590C4C](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8590C4C](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A359F05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 240), 8);
  _Unwind_Resume(a1);
}

id FBLogProcessScene()
{
  if (FBLogProcessScene_onceToken != -1)
    dispatch_once(&FBLogProcessScene_onceToken, &__block_literal_global_6);
  return (id)FBLogProcessScene___logObj;
}

uint64_t FBSceneLifecycleStateForSettings(void *a1)
{
  if (a1)
  {
    if (objc_msgSend(a1, "isForeground"))
      return 2;
    else
      return 1;
  }
  else
  {
    return 0;
  }
}

__CFString *_FBSceneActionToString(unsigned int a1)
{
  if (a1 < 4)
    return off_1E4A13468[(char)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(invalid - %d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL _FBSceneActionIsSignificant(unsigned int a1)
{
  return a1 > 1;
}

__CFString *FBSceneLifecycleStateDescription(unsigned int a1)
{
  if (a1 < 3)
    return off_1E4A13070[(char)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(Unknown:%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id _descriptionForObject(void *a1)
{
  id v1;
  NSObject *v2;
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = a1;
  FBLogAppDataStore();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (!v3)
  {
    _publicDescriptionForObject(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v4 = v1;
  if ((objc_msgSend(v4, "isNSNumber") & 1) != 0
    || (objc_msgSend(v4, "isNSDate") & 1) != 0
    || (id)*MEMORY[0x1E0C9B0D0] == v4)
  {
    _publicDescriptionForObject(v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isNSString"))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<NSString: %p; \"%@\">"), v4, v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_5;
    }
    if (!objc_msgSend(v4, "isNSData"))
    {
      if (!v4)
      {
        v6 = 0;
        goto LABEL_5;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)objc_msgSend(v4, "classForCoder"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v9, v4, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSData: %p; length = %lu>"),
      v4,
      objc_msgSend(v4, "length"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_5:

LABEL_7:
  return v6;
}

__CFString *_publicDescriptionForObject(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v8;

  v1 = a1;
  v2 = v1;
  if ((id)*MEMORY[0x1E0C9B0D0] == v1)
  {
    v6 = CFSTR("<null>");
    goto LABEL_16;
  }
  if ((objc_msgSend(v1, "isNSNumber") & 1) == 0 && !objc_msgSend(v2, "isNSDate"))
  {
    if (objc_msgSend(v2, "isNSString"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSString; length = %lu>"),
        objc_msgSend(v2, "length"));
    }
    else if (objc_msgSend(v2, "isNSData"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSData; length = %lu>"),
        objc_msgSend(v2, "length"));
    }
    else if (objc_msgSend(v2, "isNSArray"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSArray; count = %lu>"), objc_msgSend(v2, "count"));
    }
    else
    {
      if (!objc_msgSend(v2, "isNSDictionary"))
      {
        if (!v2)
        {
          v6 = 0;
          goto LABEL_16;
        }
        v8 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromClass((Class)objc_msgSend(v2, "classForCoder"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v4);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSDictionary; count = %lu>"),
        objc_msgSend(v2, "count"));
    }
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)objc_msgSend(v2, "classForCoder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %@>"), v4, v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_5:
LABEL_16:

  return v6;
}

void sub_1A35A2A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A35A3018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35A37E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromFBWatchdogBehavior(unint64_t a1)
{
  if (a1 < 3)
    return off_1E4A13BC8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownWatchdogBehavior (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A35A86BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

id FBAnalyticsLogHangTracerEvent(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t AppIdentifier;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_10;
  objc_msgSend(v3, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmbeddedApplication");

  if (!v6)
    goto LABEL_10;
  objc_getAssociatedObject(v3, &FBAnalyticsLogHangTracerEvent___FBAnalyticsHangTracerID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AppIdentifier = objc_msgSend(v7, "unsignedLongLongValue");

  if (!AppIdentifier)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    AppIdentifier = HTAppActivationGenerateAppIdentifier();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", AppIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v3, &FBAnalyticsLogHangTracerEvent___FBAnalyticsHangTracerID, v9, (void *)1);

  }
  if (a2 == 1)
  {
    v26 = 3;
    v10 = 1;
    goto LABEL_12;
  }
  if (a2 != 2)
  {
    if (a2 == 3)
    {
      v10 = 0;
      v26 = 0;
      goto LABEL_12;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_28;
  }
  v26 = 5;
  v10 = 1;
LABEL_12:
  v32[0] = *MEMORY[0x1E0D287F8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "pid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D287E0];
  v33[0] = v12;
  v33[1] = v4;
  v14 = *MEMORY[0x1E0D28800];
  v32[1] = v13;
  v32[2] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "isForeground"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 != 1)
  {
    if (a2 != 3)
      goto LABEL_21;
    objc_msgSend(v3, "exitContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "exitReason");
    if (v18 == 16)
    {
      v19 = (void *)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v19, "setObject:forKey:", *MEMORY[0x1E0D287F0], &unk_1E4A2DAA0);
    }
    else
    {
      if (v18 != 2)
      {
LABEL_20:

        goto LABEL_21;
      }
      v19 = (void *)objc_msgSend(v16, "mutableCopy");
      v20 = *MEMORY[0x1E0D287F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D287D8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v20, v21);

    }
    v16 = v19;
    goto LABEL_20;
  }
  HTAppActivationEvent();
LABEL_21:
  v22 = HTAppActivationEvent();
  if (v22)
    v23 = v10;
  else
    v23 = 0;
  if (v23 == 1)
  {
    v24 = v22;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __FBAnalyticsLogHangTracerEvent_block_invoke;
    v27[3] = &unk_1E4A12408;
    v28 = v16;
    v29 = v24;
    v30 = AppIdentifier;
    v31 = v26;
    v11 = (void *)MEMORY[0x1A8590C4C](v27);

  }
  else
  {
    v11 = 0;
  }

LABEL_28:
  return v11;
}

id FBSystemAppBundleID()
{
  if (FBSystemAppBundleID_onceToken != -1)
    dispatch_once(&FBSystemAppBundleID_onceToken, &__block_literal_global_5);
  return (id)FBSystemAppBundleID___BundleID;
}

void sub_1A35AC844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35AD574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FBWorkspaceLogTransaction()
{
  if (FBWorkspaceLogTransaction_onceToken != -1)
    dispatch_once(&FBWorkspaceLogTransaction_onceToken, &__block_literal_global_3);
  return (id)FBWorkspaceLogTransaction___logObj;
}

__CFString *FBProcessLaunchIntentDescription(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1E4A124B8[a1];
}

id FBLogProcess()
{
  if (FBLogProcess_onceToken != -1)
    dispatch_once(&FBLogProcess_onceToken, &__block_literal_global_4);
  return (id)FBLogProcess___logObj;
}

__CFString *NSStringFromFBProcessTaskState(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E4A140F0[a1];
}

__CFString *NSStringFromFBProcessVisibility(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E4A14110[a1];
}

void sub_1A35B3EBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1A35B5050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35B52B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromFBSceneContentState(unint64_t a1)
{
  if (a1 < 3)
    return off_1E4A144F0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A35B8EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromProcessWatchdogEvent(unint64_t a1)
{
  if (a1 < 5)
    return off_1E4A12618[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(invalid - %d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A35BA120(_Unwind_Exception *a1)
{
  fbs_release();
  _Unwind_Resume(a1);
}

void sub_1A35BAB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FBLogProcessWorkspace()
{
  if (FBLogProcessWorkspace_onceToken != -1)
    dispatch_once(&FBLogProcessWorkspace_onceToken, &__block_literal_global_8);
  return (id)FBLogProcessWorkspace___logObj;
}

__CFString *NSStringFromFBWorkspaceAssertionState(unsigned int a1)
{
  if (a1 < 0xB)
    return *(&off_1E4A146F0 + (char)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t FBWorkspaceAssertionStateCombine(int a1, unsigned int a2)
{
  uint64_t v2;
  _BYTE *v3;

  switch(a1)
  {
    case 0:
      if (a2 >= 0xB)
        goto LABEL_20;
      return a2;
    case 1:
      if (a2 >= 0xB)
        goto LABEL_20;
      v2 = (char)a2;
      v3 = &unk_1A3619B13;
      goto LABEL_22;
    case 2:
      if (a2 >= 0xB)
        goto LABEL_20;
      v2 = (char)a2;
      v3 = &unk_1A3619B1E;
      goto LABEL_22;
    case 3:
      if (a2 >= 0xB)
        goto LABEL_20;
      v2 = (char)a2;
      v3 = &unk_1A3619B29;
      goto LABEL_22;
    case 4:
      if (a2 >= 0xB)
        goto LABEL_20;
      v2 = (char)a2;
      v3 = &unk_1A3619B34;
      goto LABEL_22;
    case 5:
      if (a2 >= 0xB)
        goto LABEL_20;
      v2 = (char)a2;
      v3 = &unk_1A3619B3F;
      goto LABEL_22;
    case 6:
      if (a2 >= 0xB)
        goto LABEL_20;
      LOBYTE(a2) = 6;
      return a2;
    case 7:
      if (a2 >= 0xB)
        goto LABEL_20;
      v2 = (char)a2;
      v3 = &unk_1A3619B4A;
      goto LABEL_22;
    case 8:
      if (a2 >= 0xB)
        goto LABEL_20;
      v2 = (char)a2;
      v3 = &unk_1A3619B55;
      goto LABEL_22;
    case 9:
LABEL_20:
      if (a2 >= 0xB)
        goto LABEL_23;
      v2 = (char)a2;
      v3 = &unk_1A3619B60;
LABEL_22:
      LOBYTE(a2) = v3[v2];
      break;
    case 10:
LABEL_23:
      if ((((_BYTE)a2 - 3) & 0xFC) != 0)
        LOBYTE(a2) = 10;
      else
        LOBYTE(a2) = 6;
      break;
    default:
      return a2;
  }
  return a2;
}

void sub_1A35BD790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35C09E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

objc_class *getUIWindowClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getUIWindowClass_softClass;
  v6 = getUIWindowClass_softClass;
  if (!getUIWindowClass_softClass)
  {
    UIKitLibraryCore();
    Class = objc_getClass("UIWindow");
    v4[3] = (uint64_t)Class;
    getUIWindowClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1A35C0A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

_FBDefaultFencingProvider *FBGetFencingProvider()
{
  return +[_FBDefaultFencingProvider sharedInstance](_FBDefaultFencingProvider, "sharedInstance");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return objc_opt_class();
}

void sub_1A35C10A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBLSBacklightClass_block_invoke(uint64_t a1)
{
  Class result;

  BacklightServicesLibrary();
  result = objc_getClass("BLSBacklight");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBLSBacklightClass_block_invoke_cold_1();
  getBLSBacklightClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BacklightServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!BacklightServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4A11F08;
    v2 = 0;
    BacklightServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BacklightServicesLibraryCore_frameworkLibrary)
    BacklightServicesLibrary_cold_1(&v0);
}

Class __getBLSRuntimeClass_block_invoke(uint64_t a1)
{
  Class result;

  BacklightServicesLibrary();
  result = objc_getClass("BLSRuntime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBLSRuntimeClass_block_invoke_cold_1();
  getBLSRuntimeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A35C3CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return objc_opt_class();
}

uint64_t ManagedConfigurationLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  v6 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E4A122A0;
    v8 = *(_OWORD *)&off_1E4A122B0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ManagedConfigurationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A35C4E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = ManagedConfigurationLibraryCore();
  if (!result)
    ManagedConfigurationLibrary_cold_1(&v1);
  return result;
}

id getMCProfileConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMCProfileConnectionClass_softClass;
  v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E4A11EE8;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A35C4F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCProfileConnectionClass_block_invoke_cold_1();
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NSStringFromFBSystemShellState(unint64_t a1)
{
  uint64_t result;
  void *v2;

  if (a1 < 3)
    return *((_QWORD *)&off_1E4A12390 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexplained system shell state defined: %d"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSStringFromFBSystemShellState_cold_1((uint64_t)v2);
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

void sub_1A35C5FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35C64D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FBWorkspaceLogCommon()
{
  if (FBWorkspaceLogCommon_onceToken != -1)
    dispatch_once(&FBWorkspaceLogCommon_onceToken, &__block_literal_global_2);
  return (id)FBWorkspaceLogCommon___logObj;
}

id FBWorkspaceLogTransactionVerbose()
{
  if (FBWorkspaceLogTransactionVerbose_onceToken != -1)
    dispatch_once(&FBWorkspaceLogTransactionVerbose_onceToken, &__block_literal_global_5_0);
  return (id)FBWorkspaceLogTransactionVerbose___logObj;
}

id FBWorkspaceLogScene()
{
  if (FBWorkspaceLogScene_onceToken != -1)
    dispatch_once(&FBWorkspaceLogScene_onceToken, &__block_literal_global_7);
  return (id)FBWorkspaceLogScene___logObj;
}

id FBWorkspaceLogSceneHost()
{
  if (FBWorkspaceLogSceneHost_onceToken != -1)
    dispatch_once(&FBWorkspaceLogSceneHost_onceToken, &__block_literal_global_9);
  return (id)FBWorkspaceLogSceneHost___logObj;
}

id FBWorkspaceLogSceneLayout()
{
  if (FBWorkspaceLogSceneLayout_onceToken != -1)
    dispatch_once(&FBWorkspaceLogSceneLayout_onceToken, &__block_literal_global_11);
  return (id)FBWorkspaceLogSceneLayout___logObj;
}

id FBWorkspaceLogSnapshot()
{
  if (FBWorkspaceLogSnapshot_onceToken != -1)
    dispatch_once(&FBWorkspaceLogSnapshot_onceToken, &__block_literal_global_13);
  return (id)FBWorkspaceLogSnapshot___logObj;
}

id FBWorkspaceLogSceneDeactivation()
{
  if (FBWorkspaceLogSceneDeactivation_onceToken != -1)
    dispatch_once(&FBWorkspaceLogSceneDeactivation_onceToken, &__block_literal_global_15);
  return (id)FBWorkspaceLogSceneDeactivation___logObj;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void FBAnalyticsLogWatchdogEvent(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  unint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v7 && v8 && v10)
  {
    objc_msgSend(v7, "executablePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "sceneSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isForeground"))
        v16 = 2;
      else
        v16 = 1;

    }
    else
    {
      v16 = 0;
    }
    v18 = objc_msgSend(v8, "event") - 1;
    if (v18 <= 3)
    {
      v19 = off_1E4A12428[v18];
      if (v16)
      {
        if (v16 == 2)
          v20 = CFSTR("com.apple.frontboard.watchdog-terminate.foreground.%@");
        else
          v20 = CFSTR("com.apple.frontboard.watchdog-terminate.background.%@");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v20, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ADClientAddValueForScalarKey();

      }
      if (v13)
      {
        FBLogWatchdog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v22))
        {
          *(_DWORD *)buf = 138543874;
          v30 = v13;
          v31 = 2114;
          v32 = v19;
          v33 = 2114;
          v34 = v12;
          _os_signpost_emit_with_name_impl(&dword_1A359A000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "WatchdogKill", " enableTelemetry=YES BundleIdOverride=%{public, signpost.description:attribute}@ event=%{public, signpost.telemetry:string1}@ ExecutableURLKey=%{public, signpost.description:attribute}@", buf, 0x20u);
        }

      }
    }
    v24 = v12;
    v25 = v13;
    v26 = v8;
    v27 = v11;
    v28 = v9;
    v23 = v13;
    v17 = v12;
    AnalyticsSendEventLazy();

  }
  else
  {
    FBLogWatchdog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      FBAnalyticsLogWatchdogEvent_cold_1(v17);
  }

}

id FBFrameworkBundle()
{
  if (FBFrameworkBundle___once != -1)
    dispatch_once(&FBFrameworkBundle___once, &__block_literal_global_1);
  return (id)FBFrameworkBundle___bundle;
}

void __FB_REPORT_MAIN_THREAD_VIOLATION__(int a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  FBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a1)
    v6 = OS_LOG_TYPE_FAULT;
  else
    v6 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v4, v6))
  {
    *(_DWORD *)buf = 136446210;
    v9 = a2;
    _os_log_impl(&dword_1A359A000, v5, v6, "Use of SPI %{public}s is restricted to the main thread.", buf, 0xCu);
  }

  if ((a1 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("soft"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __FB_REPORT_MAIN_THREAD_VIOLATION___cold_1((uint64_t)v7);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CBE04);
  }
}

void sub_1A35CC914(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A35CD520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNFHardwareManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getNFHardwareManagerClass_softClass;
  v7 = getNFHardwareManagerClass_softClass;
  if (!getNFHardwareManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getNFHardwareManagerClass_block_invoke;
    v3[3] = &unk_1E4A11EE8;
    v3[4] = &v4;
    __getNFHardwareManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A35CD674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35CD7E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A35CD92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A35CDE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A35CEA74(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void FBOpenAppSystemServiceExecuteCallOut(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v24 = v5;
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v24;
    if ((isKindOfClass & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (objc_class *)objc_msgSend(v24, "classForCoder");
      if (!v20)
        v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("instance"), v21, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        FBOpenAppSystemServiceExecuteCallOut_cold_5();
LABEL_27:
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35CF8E8);
    }
  }

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBOpenAppSystemServiceExecuteCallOut_cold_1();
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("missing thread-local storage on %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBOpenAppSystemServiceExecuteCallOut_cold_2();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CF954);
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("FBOpenAppSystemServiceInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBCurrentOpenAppSystemServiceInstanceKey should be nil when not in a callout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBOpenAppSystemServiceExecuteCallOut_cold_4();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CF9A4);
  }
  if (v24)
  {
    v10 = (void *)MEMORY[0x1A8590A90](objc_msgSend(v8, "setObject:forKey:", v24, CFSTR("FBOpenAppSystemServiceInstance")));
    v4[2](v4);
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("FBOpenAppSystemServiceInstance"));
  }
  else
  {
    v11 = (void *)MEMORY[0x1A8590A90]();
    v4[2](v4);
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("FBOpenAppSystemServiceInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBCurrentOpenAppSystemServiceInstanceKey should be nil when not in a callout"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBOpenAppSystemServiceExecuteCallOut_cold_3();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CF9F4);
  }

}

void *__getAKSEventsRegisterSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AppleKeyStoreLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4A12B90;
    v5 = 0;
    AppleKeyStoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleKeyStoreLibraryCore_frameworkLibrary)
    __getAKSEventsRegisterSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)AppleKeyStoreLibraryCore_frameworkLibrary, "AKSEventsRegister");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAKSEventsRegisterSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNFHardwareManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!NearFieldLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4A12BA8;
    v5 = 0;
    NearFieldLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NearFieldLibraryCore_frameworkLibrary)
    __getNFHardwareManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NFHardwareManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNFHardwareManagerClass_block_invoke_cold_2();
  getNFHardwareManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreBluetoothLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreBluetoothLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E4A12BC0;
    v3 = 0;
    CoreBluetoothLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreBluetoothLibraryCore_frameworkLibrary)
    CoreBluetoothLibrary_cold_1(&v1);
  return CoreBluetoothLibraryCore_frameworkLibrary;
}

Class __getCBControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreBluetoothLibrary();
  result = objc_getClass("CBController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCBControllerClass_block_invoke_cold_1();
  getCBControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NearbyInteractionLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!NearbyInteractionLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E4A12BD8;
    v3 = 0;
    NearbyInteractionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NearbyInteractionLibraryCore_frameworkLibrary)
    NearbyInteractionLibrary_cold_1(&v1);
  return NearbyInteractionLibraryCore_frameworkLibrary;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

id FBWorkspaceDomainInitialize()
{
  return +[FBWorkspaceDomain sharedInstance]();
}

void sub_1A35D5A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35D7704(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_17()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

void sub_1A35DA528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35DCAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
  id *v44;
  id *v45;

  objc_destroyWeak(v45);
  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A35DECDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35DF458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35DF924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35E0794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A35E0BC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

void sub_1A35E0E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A35E2234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromFBSceneErrorCode(unint64_t a1)
{
  if (a1 < 5)
    return off_1E4A13580[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown:%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id FBSceneErrorCreate(unint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a2;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromFBSceneErrorCode(a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0D22A98]);

  objc_msgSend(v8, "setObject:forKey:", v7, *MEMORY[0x1E0CB2D68]);
  if (v5)
    objc_msgSend(v8, "setObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSceneErrorDomain"), a1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return objc_opt_class();
}

void sub_1A35E471C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A35E48C4(_Unwind_Exception *a1)
{
  fbs_release();
  _Unwind_Resume(a1);
}

const __CFString *FBSceneLayerTypeDescription(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("(unknown)");
  else
    return off_1E4A13B80[a1];
}

__CFString *NSStringFromFBSceneLayerTypeMask(char a1)
{
  int8x8_t v1;
  void *v3;
  id v4;
  uint64_t *v5;
  uint8x8_t v6;
  int v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, int);
  void *v13;
  id v14;
  char v15;

  v1 = (int8x8_t)(a1 & 0x1A);
  if (*(_QWORD *)&v1 == 26)
    return CFSTR("all");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __NSStringFromFBSceneLayerTypeMask_block_invoke;
  v13 = &unk_1E4A13B60;
  v4 = v3;
  v14 = v4;
  v5 = &v10;
  if (v1)
  {
    v15 = 0;
    v6 = (uint8x8_t)vcnt_s8(v1);
    v6.i16[0] = vaddlv_u8(v6);
    v7 = v6.i32[0];
    if (v6.i32[0])
    {
      v8 = 0;
      do
      {
        if (((1 << v8) & *(_QWORD *)&v1) != 0)
        {
          ((void (*)(uint64_t *))v12)(v5);
          if (v15)
            break;
          --v7;
        }
        if (v8 > 0x3E)
          break;
        ++v8;
      }
      while (v7 > 0);
    }
  }

  if (objc_msgSend(v4, "count", v10, v11))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("none");
  }

  return v9;
}

uint64_t FBSceneLayerTypeMaskForType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_1A3619AA8[a1 - 1];
}

const __CFString *NSStringFromFBProcessExitReason(uint64_t a1)
{
  const __CFString *result;

  if (a1 > 15)
  {
    if (a1 > 63)
    {
      if (a1 == 64)
        return CFSTR("launch-failed");
      if (a1 == 128)
        return CFSTR("other");
    }
    else
    {
      if (a1 == 16)
        return CFSTR("jetsam");
      if (a1 == 32)
        return CFSTR("fairplay");
    }
    return CFSTR("(invalid)");
  }
  else
  {
    result = CFSTR("unknown");
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("voluntary");
        break;
      case 2:
        result = CFSTR("watchdog");
        break;
      case 4:
        result = CFSTR("crash");
        break;
      case 8:
        result = CFSTR("signal");
        break;
      default:
        return CFSTR("(invalid)");
    }
  }
  return result;
}

void _handleApplicationsRegisteredNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a2;
  v7 = objc_opt_class();
  v8 = a5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "bs_safeArrayForKey:", CFSTR("bundleIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bs_objectsOfClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___handleApplicationsRegisteredNotification_block_invoke;
  v15[3] = &unk_1E4A11FD0;
  v16 = v6;
  v17 = v12;
  v13 = v12;
  v14 = v6;
  objc_msgSend(v14, "_performAfterDeferredWork:", v15);

}

uint64_t ___handleApplicationsRegisteredNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleApplicationInstalled:", *(_QWORD *)(a1 + 40));
}

__CFString *FBServiceClientAuthenticatorErrorCodeDescription(int __errnum)
{
  void *v2;

  v2 = 0;
  if (__errnum > 12)
  {
    if (__errnum != 13 && __errnum != 22)
      return (__CFString *)v2;
    goto LABEL_7;
  }
  if (__errnum)
  {
    if (__errnum != 3)
      return (__CFString *)v2;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", strerror(__errnum), 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return (__CFString *)v2;
  }
  return CFSTR("(none)");
}

void OUTLINED_FUNCTION_9_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id FBLogSceneMutation()
{
  if (FBLogSceneMutation_onceToken != -1)
    dispatch_once(&FBLogSceneMutation_onceToken, &__block_literal_global_2_0);
  return (id)FBLogSceneMutation___logObj;
}

void OUTLINED_FUNCTION_9_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_10_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id _pathForIdentifierAndBuffer(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id result;
  void *v7;

  v3 = a1;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x1A)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier is too long"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _pathForIdentifierAndBuffer_cold_1((uint64_t)v7);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v4 = 1;
    if (a2)
      v4 = 2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/FBW%d:%@"), v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  return result;
}

void sub_1A35FF048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_17_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id FBSystemShellInitialize(void *a1)
{
  void (**v1)(id, FBMutableSystemShellInitializationOptions *);
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FBMutableSystemShellInitializationOptions *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id *v25;
  void *v26;
  _FBDarkBootHelper *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *context;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  BSSetMainThreadPriorityFixedForUI();
  v2 = objc_alloc(MEMORY[0x1E0D87C98]);
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("SystemShell-Initialize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithExplanation:target:attributes:", CFSTR("FBSystemShellInitialize"), v3, v5);

  context = (void *)MEMORY[0x1A8590A90](objc_msgSend(v6, "acquireWithError:", 0));
  objc_msgSend(MEMORY[0x1E0D23048], "extendAutomaticBootstrapCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(FBMutableSystemShellInitializationOptions);
  if (v1)
    v1[2](v1, v8);
  kdebug_trace();
  +[FBSystemShell _createSingletonWithOptions:](FBSystemShell, "_createSingletonWithOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (-[FBSystemShellInitializationOptions initializeDisplayManager](v8, "initializeDisplayManager"))
  {
    +[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  kdebug_trace();
  v11 = +[FBServiceFacilityServer sharedInstance](FBServiceFacilityServer, "sharedInstance");
  v12 = +[FBApplicationDataStoreRepositoryServer sharedInstance](FBApplicationDataStoreRepositoryServer, "sharedInstance");
  if (-[FBSystemShellInitializationOptions initializeDisplayManager](v8, "initializeDisplayManager"))
    v13 = +[FBMainDisplayLayoutPublisher sharedInstance](FBMainDisplayLayoutPublisher, "sharedInstance");
  v14 = +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
  v15 = +[FBSystemAppProxyServiceServer sharedInstance](FBSystemAppProxyServiceServer, "sharedInstance");
  v16 = +[FBInterfaceOrientationService sharedInstance](FBInterfaceOrientationService, "sharedInstance");
  -[FBSystemShellInitializationOptions registerAdditionalServicesBlock](v8, "registerAdditionalServicesBlock");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    (*(void (**)(uint64_t))(v17 + 16))(v17);
  +[FBServiceFacilityServer sharedInstance](FBServiceFacilityServer, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "run");

  +[FBServiceFacilityServer sharedInstance](FBServiceFacilityServer, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "noteMilestoneReached:", *MEMORY[0x1E0D22E90]);

  kdebug_trace();
  kdebug_trace();
  objc_msgSend(v9, "_startSystemShellService");
  kdebug_trace();
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0D231A8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startService");

  +[FBServiceFacilityServer sharedInstance](FBServiceFacilityServer, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "noteMilestoneReached:", *MEMORY[0x1E0D22E80]);

  v23 = +[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance");
  v24 = +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  +[FBWorkspaceDomain sharedInstance]();
  v25 = (id *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceDomain startListener](v25);

  if (-[FBSystemShellInitializationOptions initializeDisplayManager](v8, "initializeDisplayManager"))
    objc_msgSend(v10, "postBookendConnections");
  kdebug_trace();
  kdebug_trace();
  +[FBServiceFacilityServer sharedInstance](FBServiceFacilityServer, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "noteMilestoneReached:", *MEMORY[0x1E0D22E88]);

  kdebug_trace();
  kdebug_trace();
  if (-[FBSystemShellInitializationOptions resetDarkBootState](v8, "resetDarkBootState"))
  {
    v27 = objc_alloc_init(_FBDarkBootHelper);
    -[_FBDarkBootHelper clearBootedDark](v27, "clearBootedDark");

  }
  if (-[FBSystemShellInitializationOptions initializeDisplayManager](v8, "initializeDisplayManager"))
  {
    +[FBMainDisplayLayoutPublisher sharedInstance](FBMainDisplayLayoutPublisher, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ Loading"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "transitionAssertionWithReason:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __FBSystemShellInitialize_block_invoke;
  v40[3] = &unk_1E4A12068;
  v34 = v9;
  v41 = v34;
  v42 = v7;
  v35 = v6;
  v43 = v35;
  v44 = v33;
  v36 = v33;
  v37 = v7;
  objc_msgSend(v34, "_addBlockToExecuteWhenReady:", v40);
  objc_msgSend(v34, "_initializationComplete");
  if (-[FBSystemShellInitializationOptions initializeReadyForInteraction](v8, "initializeReadyForInteraction"))
    objc_msgSend(v34, "readyForInteraction");

  objc_autoreleasePoolPop(context);
  return v34;
}

BOOL FBWorkspaceAssertionStateIsForeground(int a1)
{
  return (a1 - 3) < 8;
}

uint64_t UIKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UIKitLibraryCore_frameworkLibrary;
  v6 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E4A14748;
    v8 = *(_OWORD *)&off_1E4A14758;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UIKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A35FFD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getUIApplicationClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getUIApplicationClass_softClass;
  v6 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    UIKitLibraryCore();
    Class = objc_getClass("UIApplication");
    v4[3] = (uint64_t)Class;
    getUIApplicationClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1A35FFDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getUIApplicationSceneSpecificationClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getUIApplicationSceneSpecificationClass_softClass;
  v6 = getUIApplicationSceneSpecificationClass_softClass;
  if (!getUIApplicationSceneSpecificationClass_softClass)
  {
    UIKitLibraryCore();
    Class = objc_getClass("UIApplicationSceneSpecification");
    v4[3] = (uint64_t)Class;
    getUIApplicationSceneSpecificationClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1A35FFE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getUIApplicationSceneTransitionContextClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getUIApplicationSceneTransitionContextClass_softClass;
  v6 = getUIApplicationSceneTransitionContextClass_softClass;
  if (!getUIApplicationSceneTransitionContextClass_softClass)
  {
    UIKitLibraryCore();
    Class = objc_getClass("UIApplicationSceneTransitionContext");
    v4[3] = (uint64_t)Class;
    getUIApplicationSceneTransitionContextClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1A35FFF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __getBLSBacklightClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBLSBacklightClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FBMainDisplayLayoutPublisher.m"), 24, CFSTR("Unable to find class %s"), "BLSBacklight");

  __break(1u);
}

void BacklightServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BacklightServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FBMainDisplayLayoutPublisher.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBLSRuntimeClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBLSRuntimeClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FBMainDisplayLayoutPublisher.m"), 25, CFSTR("Unable to find class %s"), "BLSRuntime");

  __break(1u);
}

void ManagedConfigurationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ManagedConfigurationSoftLinking.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ManagedConfigurationSoftLinking.m"), 14, CFSTR("Unable to find class %s"), "MCProfileConnection");

  __break(1u);
}

void NSStringFromFBSystemShellState_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull NSStringFromFBSystemShellState(FBSystemShellState)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("FBSystemShell.m");
  v7 = 1024;
  v8 = 39;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

void FBAnalyticsLogWatchdogEvent_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A359A000, log, OS_LOG_TYPE_ERROR, "Invalid parameters for sending watchdog termination to Core Analytics", v1, 2u);
}

void __FB_REPORT_MAIN_THREAD_VIOLATION___cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __FB_REPORT_MAIN_THREAD_VIOLATION__(BOOL, const char *)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("FBBase.m");
  v7 = 1024;
  v8 = 32;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

void FBOpenAppSystemServiceExecuteCallOut_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBOpenAppSystemServiceExecuteCallOut(NSString *__strong, __strong dispatch_block_t)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_1(&dword_1A359A000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_5_1();
}

void FBOpenAppSystemServiceExecuteCallOut_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBOpenAppSystemServiceExecuteCallOut(NSString *__strong, __strong dispatch_block_t)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_1(&dword_1A359A000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_5_1();
}

void FBOpenAppSystemServiceExecuteCallOut_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBOpenAppSystemServiceExecuteCallOut(NSString *__strong, __strong dispatch_block_t)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_1(&dword_1A359A000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_5_1();
}

void FBOpenAppSystemServiceExecuteCallOut_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBOpenAppSystemServiceExecuteCallOut(NSString *__strong, __strong dispatch_block_t)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_1(&dword_1A359A000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_5_1();
}

void FBOpenAppSystemServiceExecuteCallOut_cold_5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBOpenAppSystemServiceExecuteCallOut(NSString *__strong, __strong dispatch_block_t)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_1(&dword_1A359A000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_5_1();
}

void __getAKSEventsRegisterSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleKeyStoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FBSystemService.m"), 54, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNFHardwareManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *NearFieldLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FBSystemService.m"), 63, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNFHardwareManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNFHardwareManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FBSystemService.m"), 64, CFSTR("Unable to find class %s"), "NFHardwareManager");

  __break(1u);
}

void CoreBluetoothLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreBluetoothLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FBSystemService.m"), 68, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCBControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCBControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FBSystemService.m"), 69, CFSTR("Unable to find class %s"), "CBController");

  __break(1u);
}

void NearbyInteractionLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *NearbyInteractionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FBSystemService.m"), 76, CFSTR("%s"), *a1);

  __break(1u);
}

void _pathForIdentifierAndBuffer_cold_1(uint64_t a1)
{
  void *v2;
  uint8_t v3[12];
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_pathForIdentifierAndBuffer(NSString *__strong, BOOL)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  v4 = 2114;
  v5 = CFSTR("FBWorkspaceConnectionsStateStore.m");
  v6 = 1024;
  v7 = 54;
  v8 = 2114;
  v9 = a1;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v3, 0x26u);

}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDuration()
{
  return MEMORY[0x1E0D00B98]();
}

uint64_t BSAbsoluteMachTimeNow()
{
  return MEMORY[0x1E0D229C8]();
}

uint64_t BSAtomicGetFlag()
{
  return MEMORY[0x1E0D229D0]();
}

uint64_t BSAtomicSetFlag()
{
  return MEMORY[0x1E0D229D8]();
}

uint64_t BSAuditTokenRepresentsPlatformBinary()
{
  return MEMORY[0x1E0D229E0]();
}

uint64_t BSConvertRectFromOrientationToOrientation()
{
  return MEMORY[0x1E0D229E8]();
}

uint64_t BSCreateDeserializedCFValueFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D229F0]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D229F8]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionary()
{
  return MEMORY[0x1E0D22A00]();
}

uint64_t BSDeserializeCFValueFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22A10]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22A28]();
}

uint64_t BSDispatchBlockCreateWithCurrentQualityOfService()
{
  return MEMORY[0x1E0D22A30]();
}

uint64_t BSDispatchBlockCreateWithQualityOfService()
{
  return MEMORY[0x1E0D22A38]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D22A40]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1E0D22A48]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D22A50]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D22A60]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D22A68]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1E0D22A70]();
}

uint64_t BSDispatchTimeWithInterval()
{
  return MEMORY[0x1E0D22A78]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D22A80]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D22A88]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D22A90]();
}

uint64_t BSExecutablePathForAuditToken()
{
  return MEMORY[0x1E0D22AA0]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D22AA8]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D22AB0]();
}

uint64_t BSIntegralTransform()
{
  return MEMORY[0x1E0D22AC0]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1E0D22AC8]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1E0D22AD0]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x1E0D22AD8]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D22AE0]();
}

uint64_t BSPIDIsBeingDebugged()
{
  return MEMORY[0x1E0D22AF0]();
}

uint64_t BSPathExistsOnSystemPartition()
{
  return MEMORY[0x1E0D22AF8]();
}

uint64_t BSProcessDescriptionForPID()
{
  return MEMORY[0x1E0D22B00]();
}

uint64_t BSPthreadCurrentEffectiveQualityOfService()
{
  return MEMORY[0x1E0D22B08]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1E0D22B10]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D22B18]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22B28]();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22B30]();
}

uint64_t BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22B48]();
}

uint64_t BSSetMainThreadPriorityFixedForUI()
{
  return MEMORY[0x1E0D22B50]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D22B58]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D22B60]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D22B68]();
}

uint64_t BSSystemHasCapability()
{
  return MEMORY[0x1E0D22B70]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1E0D22B78]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1E0CD2630](retstr, m);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t FBLogAppDataStore()
{
  return MEMORY[0x1E0D22B88]();
}

uint64_t FBLogCommon()
{
  return MEMORY[0x1E0D22B90]();
}

uint64_t FBLogInterfaceOrientationObserver()
{
  return MEMORY[0x1E0D22B98]();
}

uint64_t FBLogWatchdog()
{
  return MEMORY[0x1E0D22BA0]();
}

uint64_t FBSApplicationTerminationGroupDescription()
{
  return MEMORY[0x1E0D22C00]();
}

uint64_t FBSApplicationTerminationReasonDescription()
{
  return MEMORY[0x1E0D22C08]();
}

uint64_t FBSApplicationTerminationReasonIsGraceful()
{
  return MEMORY[0x1E0D22C10]();
}

uint64_t FBSDisplayTypeDescription()
{
  return MEMORY[0x1E0D22CA0]();
}

uint64_t FBSGetDefaultExtensions()
{
  return MEMORY[0x1E0D22CA8]();
}

uint64_t FBSOpenApplicationErrorCodeToString()
{
  return MEMORY[0x1E0D22CC0]();
}

uint64_t FBSOpenApplicationErrorCreate()
{
  return MEMORY[0x1E0D22CC8]();
}

uint64_t FBSOpenApplicationServiceErrorCodeToString()
{
  return MEMORY[0x1E0D22DB8]();
}

uint64_t FBSProcessPrettyDescription()
{
  return MEMORY[0x1E0D22E00]();
}

uint64_t FBSProcessResourceAllowanceGetValue()
{
  return MEMORY[0x1E0D22E08]();
}

uint64_t FBSProcessResourceAllowanceMakeWithRealTimeInterval()
{
  return MEMORY[0x1E0D22E10]();
}

uint64_t FBSProcessResourceAllowanceMakeWithScheduledTimeInterval()
{
  return MEMORY[0x1E0D22E18]();
}

uint64_t FBSProcessResourceTimeIntervalForValue()
{
  return MEMORY[0x1E0D22E28]();
}

uint64_t FBSSetServiceFacilityManager()
{
  return MEMORY[0x1E0D22EA0]();
}

uint64_t FBSSettingsSetValueForSetting()
{
  return MEMORY[0x1E0D22EA8]();
}

uint64_t FBSSettingsValueForSetting()
{
  return MEMORY[0x1E0D22EB0]();
}

uint64_t FBSWorkspaceErrorCreate()
{
  return MEMORY[0x1E0D22F18]();
}

uint64_t GetThermalState()
{
  return MEMORY[0x1E0D1BCE0]();
}

uint64_t HTAppActivationEvent()
{
  return MEMORY[0x1E0D28770]();
}

uint64_t HTAppActivationGenerateAppIdentifier()
{
  return MEMORY[0x1E0D28778]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2858](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSStringFromBKSHIDEventAuthenticationStatus()
{
  return MEMORY[0x1E0D00C08]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

uint64_t NSStringFromBSVersionedPID()
{
  return MEMORY[0x1E0D22F28]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromFBSSceneActivityMode()
{
  return MEMORY[0x1E0D22F38]();
}

uint64_t NSStringFromFBSSceneInterruptionPolicy()
{
  return MEMORY[0x1E0D22F40]();
}

uint64_t NSStringFromFBSSceneLayerAlignment()
{
  return MEMORY[0x1E0D22F48]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x1E0C80688]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D23320]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D23330]();
}

uint64_t _class_setCustomDeallocInitiation()
{
  return MEMORY[0x1E0DE7940]();
}

uint64_t _objc_deallocOnMainThreadHelper()
{
  return MEMORY[0x1E0DE7980]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int atexit_b(void *a1)
{
  return MEMORY[0x1E0C81650](a1);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x1E0C82F00](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

uint64_t fbs_release()
{
  return MEMORY[0x1E0D23338]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C838D8](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C84210](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1E0C84238](__rqtp, __rmtp);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t reboot3()
{
  return MEMORY[0x1E0C85050]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C853A8](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1E0C853B0](a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t wd_endpoint_activate()
{
  return MEMORY[0x1E0DC8A28]();
}

uint64_t wd_endpoint_add_queue()
{
  return MEMORY[0x1E0DC8A30]();
}

uint64_t wd_endpoint_register()
{
  return MEMORY[0x1E0DC8A38]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1E0C862F0]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

