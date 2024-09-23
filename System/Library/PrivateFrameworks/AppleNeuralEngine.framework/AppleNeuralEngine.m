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

void sub_1D3354BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3355684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D33565DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D33566C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3356D44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3356DE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3356EB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3357440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D33577B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3357944(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3357AB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3358FA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D335907C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _ANEDaemonInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCCE6F0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  commonInitialization(v0);
  return v0;
}

void commonInitialization(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = a1;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_compileModel_sandboxExtension_options_qos_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_compileModel_sandboxExtension_options_qos_withReply_, 1, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_loadModel_sandboxExtension_options_qos_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_loadModel_sandboxExtension_options_qos_withReply_, 1, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_loadModelNewInstance_options_modelInstParams_qos_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_loadModelNewInstance_options_modelInstParams_qos_withReply_, 1, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_unloadModel_options_qos_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_reportTelemetryToPPS_playload_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_reportTelemetryToPPS_playload_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_compiledModelExistsFor_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_purgeCompiledModel_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_compiledModelExistsMatchingHash_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_purgeCompiledModelMatchingHash_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_prepareChainingWithModel_options_chainingReq_qos_withReply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_prepareChainingWithModel_options_chainingReq_qos_withReply_, 2, 0);

}

void sub_1D335A16C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1D335AD6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D335AE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1D335B0AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1D335B158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ANEGetValidateNetworkSupportedVersion()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "getValidateNetworkVersion");

  }
  else if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    +[_ANELog framework](_ANELog, "framework");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ANEGetValidateNetworkSupportedVersion_cold_2(v3, v4, v5);

    v2 = 0;
  }
  else
  {
    v2 = ANECGetValidateNetworkSupportedVersion();
  }
  +[_ANELog framework](_ANELog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    ANEGetValidateNetworkSupportedVersion_cold_1();

  return v2;
}

void sub_1D335B254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *ANEValidateNetworkCreate(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  const __CFString *Value;
  const __CFString *v17;
  __CFDictionary *MutableCopy;
  __CFDictionary *v19;
  NSObject *v20;
  const __CFData *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MIL::Text::SerializerOptions *v31;
  char v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  const __CFDictionary *v40;
  void *v41;
  void *v42;
  void *Mutable;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  char v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  NSObject *v55;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61[2];
  char v62;
  void *v63[2];
  char v64;
  void *__p[2];
  char v66;
  uint64_t v67;
  id v68;
  char v69;
  _BYTE buffer[12];
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  __CFString *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;
  CFRange v78;

  v77 = *MEMORY[0x1E0C80C00];
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a2, "debugDescription");
    objc_claimAutoreleasedReturnValue();
    ANEValidateNetworkCreate_cold_5();
  }

  +[_ANEStrings vm_forceValidationOnGuestBootArg](_ANEStrings, "vm_forceValidationOnGuestBootArg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_ANEDeviceInfo isBoolBootArgSetTrue:](_ANEDeviceInfo, "isBoolBootArgSetTrue:", v5);

  if (v6)
  {
    +[_ANELog framework](_ANELog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      +[_ANEStrings vm_forceValidationOnGuestBootArg](_ANEStrings, "vm_forceValidationOnGuestBootArg");
      objc_claimAutoreleasedReturnValue();
      ANEValidateNetworkCreate_cold_4();
    }

  }
  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v6;
  else
    v9 = 1;

  if ((v9 & 1) != 0)
  {
    if (ANECGetValidateNetworkSupportedVersion() != a1)
    {
      +[_ANELog framework](_ANELog, "framework");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        ANEValidateNetworkCreate_cold_2();

    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[_ANEDeviceInfo aneSubType](_ANEDeviceInfo, "aneSubType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEDeviceInfo aneSubTypeVariant](_ANEDeviceInfo, "aneSubTypeVariant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEDeviceInfo aneSubTypeProductVariant](_ANEDeviceInfo, "aneSubTypeProductVariant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@%@"), v12, v13, v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("architecture"));
    v17 = Value;
    if (Value && CFStringCompare(Value, v15, 0))
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)a2);
      CFDictionaryReplaceValue(MutableCopy, CFSTR("architecture"), v15);
      v19 = MutableCopy;
      +[_ANELog framework](_ANELog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[__CFDictionary debugDescription](v19, "debugDescription");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buffer = 136315906;
        *(_QWORD *)&buffer[4] = "ANEValidateNetworkCreate";
        v71 = 2112;
        v72 = v17;
        v73 = 2112;
        v74 = v15;
        v75 = 2112;
        v76 = v57;
        _os_log_debug_impl(&dword_1D3352000, v20, OS_LOG_TYPE_DEBUG, "%s: updating architecture from %@ to %@, inValidationParams: %@", buffer, 0x2Au);

      }
    }
    else
    {
      v19 = 0;
    }
    CFRelease(CFSTR("architecture"));
    Mutable = (void *)ANECValidateNetworkCreate();
    if (v19)
      CFRelease(v19);

    goto LABEL_42;
  }
  *(_QWORD *)buffer = 0;
  v21 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("MIL"));
  v78.length = CFDataGetLength(v21);
  v78.location = 0;
  CFDataGetBytes(v21, v78, buffer);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CB3940];
  +[_ANEStrings vm_tmpBaseDirectory](_ANEStrings, "vm_tmpBaseDirectory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@%@"), v24, v60);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3940];
  +[_ANEStrings defaultMILFileName](_ANEStrings, "defaultMILFileName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@/%@"), v25, v27);
  v59 = (id)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0CB3940];
  +[_ANEStrings defaultWeightFileName](_ANEStrings, "defaultWeightFileName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@"), v25, v29);
  v58 = (id)objc_claimAutoreleasedReturnValue();

  v69 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (MIL::Text::SerializerOptions *)objc_msgSend(v30, "fileExistsAtPath:isDirectory:", v25, &v69);
  if ((v31 & 1) != 0)
    goto LABEL_23;
  v68 = 0;
  v32 = objc_msgSend(v30, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v68);
  v33 = v68;
  v34 = v33;
  if ((v32 & 1) != 0)
  {

LABEL_23:
    MIL::Text::SerializerOptions::Make(v31);
    v35 = v67;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v59), "cStringUsingEncoding:", 4));
    (*(void (**)(uint64_t, void **))(*(_QWORD *)v35 + 24))(v35, __p);
    if (v66 < 0)
      operator delete(__p[0]);
    v36 = v67;
    std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(objc_retainAutorelease(v58), "cStringUsingEncoding:", 4));
    (*(void (**)(uint64_t, void **))(*(_QWORD *)v36 + 128))(v36, v63);
    if (v64 < 0)
      operator delete(v63[0]);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v67 + 112))(v67, 4);
    v37 = v67;
    v38 = objc_retainAutorelease(v25);
    std::string::basic_string[abi:ne180100]<0>(v61, (char *)objc_msgSend(v38, "cStringUsingEncoding:", 4));
    (*(void (**)(uint64_t, void **))(*(_QWORD *)v37 + 56))(v37, v61);
    if (v62 < 0)
      operator delete(v61[0]);
    MIL::Text::SerializeToFile();
    v39 = (id)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("function"));
    v40 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("parameters"));
    v41 = (id)CFDictionaryGetValue(v40, CFSTR("scratchPadPath"));
    +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (void *)objc_msgSend(v42, "validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:", a1, v60, v39, v38, v41);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "fileExistsAtPath:", v38);

    if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "removeItemAtPath:error:", v38, 0);

    }
    v47 = v67;
    v67 = 0;
    if (v47)
      (*(void (**)(uint64_t))(*(_QWORD *)v47 + 8))(v47);
    v48 = 1;
    goto LABEL_41;
  }
  +[_ANELog framework](_ANELog, "framework");
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    ANEValidateNetworkCreate_cold_3((uint64_t)v34, v49);

  v48 = 0;
  Mutable = 0;
LABEL_41:

  if ((v48 & 1) == 0)
    return 0;
LABEL_42:
  if (!Mutable)
  {
    v50 = ANEGetValidateNetworkSupportedVersion();
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(Mutable, "setValue:forKey:", v51, CFSTR("resultsVersion"));

    v52 = (void *)objc_opt_new();
    objc_msgSend(v52, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("support"));
    +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v53)
      v6 = 1;

    if (v6)
      v54 = CFSTR("Unable to get validationResult");
    else
      v54 = CFSTR("Unable to get validationResult (host might be too old)");
    objc_msgSend(v52, "setValue:forKey:", v54, CFSTR("errorMsg"));
    objc_msgSend(Mutable, "setValue:forKey:", v52, CFSTR("-1"));

  }
  +[_ANELog framework](_ANELog, "framework");
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(Mutable, "debugDescription");
    objc_claimAutoreleasedReturnValue();
    ANEValidateNetworkCreate_cold_1();
  }

  return Mutable;
}

void sub_1D335BA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33)
{
  void *v33;
  void *v34;
  void *v35;

  _Unwind_Resume(a1);
}

void *ANEValidateNetworkCreateVMHost(uint64_t a1, const void *a2, void *a3, const void *a4)
{
  MIL::Text::SerializerOptions *v7;
  MIL::Opsets::Common *v8;
  MIL::ParserOptions *MILContext;
  uint64_t v10;
  MIL::Text::SerializerOptions *v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count_vtbl *v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  __CFDictionary *Mutable;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFDictionary *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count_vtbl *v27;
  uint64_t v28;
  _QWORD v30[2];
  std::__shared_weak_count *v31;
  uint64_t v32;
  void *__p[2];
  char v34;
  uint64_t v35;
  std::__shared_weak_count_vtbl *v36;
  uint64_t v37;

  v7 = a3;
  MIL::Text::SerializerOptions::Make(v7);
  v8 = (MIL::Opsets::Common *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 104))(v37);
  MILContext = (MIL::ParserOptions *)MIL::Opsets::Common::CreateMILContext(v8);
  MIL::ParserOptions::Make(MILContext);
  v10 = v35;
  v11 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[MIL::Text::SerializerOptions cStringUsingEncoding:](v11, "cStringUsingEncoding:", 4));
  (*(void (**)(uint64_t, void **, uint64_t))(*(_QWORD *)v10 + 32))(v10, __p, 1);
  if (v34 < 0)
    operator delete(__p[0]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v35 + 64))(v35, 1);
  (*(void (**)(uint64_t, MIL::Opsets::Common *))(*(_QWORD *)v35 + 96))(v35, v8);
  v30[1] = v36;
  if (v36)
  {
    v12 = (std::__shared_weak_count *)operator new();
    v13 = v36;
    v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E9515CF0;
    v12->__shared_owners_ = 0;
    v12->__shared_weak_owners_ = 0;
    v12[1].__vftable = v13;
  }
  else
  {
    v12 = 0;
  }
  v31 = v12;
  v36 = 0;
  MIL::Text::ParseProgramFromFile();
  if (v31)
  {
    p_shared_owners = &v31->__shared_owners_;
    do
      v15 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v15 - 1, (unint64_t *)p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v17 = (void *)MEMORY[0x1E0CB3940];
  +[_ANEDeviceInfo aneSubType](_ANEDeviceInfo, "aneSubType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEDeviceInfo aneSubTypeVariant](_ANEDeviceInfo, "aneSubTypeVariant");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEDeviceInfo aneSubTypeProductVariant](_ANEDeviceInfo, "aneSubTypeProductVariant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@%@"), v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  CFDictionarySetValue(Mutable, CFSTR("architecture"), v21);
  CFDictionarySetValue(Mutable, CFSTR("function"), a2);
  v30[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(Mutable, CFSTR("MIL"), v22);
  v23 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(v23, CFSTR("scratchPadPath"), a4);
  CFDictionarySetValue(Mutable, CFSTR("parameters"), v23);
  v24 = ANEValidateNetworkCreate(a1, Mutable);
  CFRelease(Mutable);
  CFRelease(v23);

  v25 = v32;
  v32 = 0;
  if (v25)
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  v26 = v35;
  v35 = 0;
  if (v26)
    (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
  v27 = v36;
  v36 = 0;
  if (v27)
    (*((void (**)(std::__shared_weak_count_vtbl *))v27->~__shared_weak_count + 1))(v27);
  v28 = v37;
  v37 = 0;
  if (v28)
    (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);

  return v24;
}

void sub_1D335BF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  uint64_t v25;
  uint64_t v27;

  if (a23)
    (*(void (**)(uint64_t))(*(_QWORD *)a23 + 8))(a23);
  if (a24)
    (*(void (**)(uint64_t))(*(_QWORD *)a24 + 8))(a24);
  v27 = *(_QWORD *)(v25 - 88);
  *(_QWORD *)(v25 - 88) = 0;
  if (v27)
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);

  _Unwind_Resume(a1);
}

void getANEDeviceProperties(__CFString const*)::{lambda(__CFDictionary const*,__CFDictionary const*)#1}::operator() const(__CFDictionary const*,__CFDictionary const*)::{lambda(void const*,void const*,void *)#1}::__invoke(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E9515838, MEMORY[0x1E0DE42D0]);
}

void sub_1D335C160(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__shared_ptr_pointer<MIL::MILContext  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D824D998);
}

uint64_t std::__shared_ptr_pointer<MIL::MILContext  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<MIL::MILContext  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1D335C940(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D335C9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_ANEProgramForEvaluation;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1D335CA78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D335CC50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D335DB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Block_object_dispose(&STACK[0x1130], 8);
  _Block_object_dispose(&STACK[0x1150], 8);
  _Block_object_dispose(&STACK[0x1170], 8);

  _Unwind_Resume(a1);
}

void sub_1D335E2F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ANEProgramRequestSharedEventsStruct::~ANEProgramRequestSharedEventsStruct(ANEProgramRequestSharedEventsStruct *this)
{
  uint64_t i;

  for (i = 4072; i != 2024; i -= 32)

  do
  {

    i -= 32;
  }
  while (i != -24);
}

void sub_1D335E648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D335EB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, char a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = a2 & 1;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1D33600BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_1D3363BF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3363C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)_ANEProgramIOSurfacesMapper;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1D3363FBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1D3364294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1D3364618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  void *v30;
  void *v31;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

void sub_1D3364844(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3364B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_1D3364D54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_4_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1D3368B5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3368C34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3368F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D3369070(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3369190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3369330(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1D3369990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1D336A284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D336B014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,void *a25)
{
  void *v25;

  _Unwind_Resume(a1);
}

__n128 aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::addWeight(uint64_t a1, const void *a2, int a3, const void *a4, int a5, const void *a6, _IOSurfaceWrapper *a7, const void *a8, unsigned int a9, const void *a10, int a11, void *a12)
{
  uint64_t v18;
  __IOSurface *BaseAddress;
  char *v20;
  int v21;
  char *v22;
  __int128 v23;
  __n128 result;
  id v27;

  v27 = a12;
  v18 = operator new();
  aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::_ANEWeightSerializerDeserializer((unsigned int *)v18, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, v27);
  *(_QWORD *)(a1 + 8 * *(unsigned int *)(a1 + 32) + 40) = v18;
  BaseAddress = *(__IOSurface **)(*(_QWORD *)(a1 + 16) + 8);
  if (BaseAddress)
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  if (*(_DWORD *)a1)
    v20 = (char *)BaseAddress + *(unsigned int *)(a1 + 4);
  else
    v20 = 0;
  v21 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v21 + 1;
  v22 = &v20[28 * v21];
  v23 = *(_OWORD *)v18;
  *(_OWORD *)(v22 + 12) = *(_OWORD *)(v18 + 12);
  *(_OWORD *)v22 = v23;

  return result;
}

void sub_1D336B3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{

  _Unwind_Resume(a1);
}

__IOSurface *aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::addProcedure(uint64_t a1, uint64_t *a2)
{
  __IOSurface *result;
  char *v5;
  int v6;
  char *v7;
  uint64_t v8;

  *(_QWORD *)(a1 + 8 * *(unsigned int *)(a1 + 32) + 40) = a2;
  result = *(__IOSurface **)(*(_QWORD *)(a1 + 16) + 8);
  if (result)
    result = (__IOSurface *)IOSurfaceGetBaseAddress(result);
  if (*(_DWORD *)a1)
    v5 = (char *)result + *(unsigned int *)(a1 + 4);
  else
    v5 = 0;
  v6 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v6 + 1;
  v7 = &v5[12 * v6];
  v8 = *a2;
  *((_DWORD *)v7 + 2) = *((_DWORD *)a2 + 2);
  *(_QWORD *)v7 = v8;
  return result;
}

void sub_1D336BDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1D336C3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  _Block_object_dispose((const void *)(v17 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1D336C62C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D336C88C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D336F2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1D336FC14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D336FF70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3370398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D337070C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D337080C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D33708CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3370BA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D3370D54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D33713C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1D337163C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3371928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3371CEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Block_object_dispose((const void *)(v3 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1D3371DA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3372A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1D3373AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,void *a27,uint64_t a28,void *a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,void *a42,uint64_t a43,void *a44)
{
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  _Unwind_Resume(a1);
}

void sub_1D3374574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22,void *a23)
{
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1D3375294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,uint64_t a39,void *a40)
{
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  _Unwind_Resume(a1);
}

void sub_1D3375B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1D3375D94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D3375F84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D337627C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D337635C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D3376494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D33766A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D337698C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D3376B7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D3376D58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D337702C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D33772E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D33774B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D33776A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D33779D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1D3377D24(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x1D824D998](v1, 0x1000C4077774924);
  _Unwind_Resume(exception_object);
}

void sub_1D3377EF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3378008(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D33782AC(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  MEMORY[0x1D824D998](v1, 0x1000C4077774924);
  _Unwind_Resume(a1);
}

void sub_1D337842C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3378740(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3378908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer *aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer::_ANEModelParamsSerializerDeserializer(aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer *this, _IOSurfaceWrapper *a2)
{
  __IOSurface *v3;
  _BYTE *v4;

  *(_DWORD *)this = (_DWORD)a2;
  v3 = _IOSurfaceWrapper::alloc(a2);
  v4 = operator new(0x28uLL);
  v4[24] = 0;
  *((_QWORD *)this + 1) = v4 + 24;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = &unk_1E9515C90;
  *((_QWORD *)v4 + 4) = v3;
  *((_QWORD *)this + 2) = v4;
  *((_DWORD *)this + 1) = IOSurfaceGetID(v3);
  return this;
}

void sub_1D3378AD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

IOSurfaceRef _IOSurfaceWrapper::alloc(_IOSurfaceWrapper *this)
{
  unsigned int v1;
  _IOSurfaceWrapper *Mutable;
  IOSurfaceRef v3;

  v1 = this;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  _IOSurfaceWrapper::setIntValue(Mutable, (__CFDictionary *)*MEMORY[0x1E0CBBF10], 0);
  _IOSurfaceWrapper::setInt64Value(Mutable, (__CFDictionary *)*MEMORY[0x1E0CBBEE0], (const __CFString *)v1);
  v3 = IOSurfaceCreate(Mutable);
  CFRelease(Mutable);
  return v3;
}

void std::__shared_ptr_emplace<_IOSurfaceWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E9515C90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<_IOSurfaceWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E9515C90;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D824D998);
}

void std::__shared_ptr_emplace<_IOSurfaceWrapper>::__on_zero_shared(uint64_t a1)
{
  _IOSurfaceWrapper::~_IOSurfaceWrapper((_IOSurfaceWrapper *)(a1 + 24));
}

void _IOSurfaceWrapper::~_IOSurfaceWrapper(_IOSurfaceWrapper *this)
{
  __IOSurface *v2;

  v2 = (__IOSurface *)*((_QWORD *)this + 1);
  if (v2)
  {
    if (*(_BYTE *)this)
    {
      IOSurfaceUnlock(v2, 0, 0);
      *(_BYTE *)this = 0;
      v2 = (__IOSurface *)*((_QWORD *)this + 1);
    }
    CFRelease(v2);
    *((_QWORD *)this + 1) = 0;
  }
}

void _IOSurfaceWrapper::setIntValue(_IOSurfaceWrapper *this, __CFDictionary *a2, const __CFString *a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = (int)a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(this, a2, v5);
  CFRelease(v5);
}

void _IOSurfaceWrapper::setInt64Value(_IOSurfaceWrapper *this, __CFDictionary *a2, const __CFString *a3)
{
  CFNumberRef v5;
  const __CFString *valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(this, a2, v5);
  CFRelease(v5);
}

aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::_ANEModelInstanceParametersSerializerDeserializer(aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *this, const char *a2, int a3, int a4)
{
  __IOSurface *v6;
  _BYTE *v7;
  __IOSurface *BaseAddress;

  *(_DWORD *)this = a4;
  *((_DWORD *)this + 1) = a3 + 1;
  v6 = _IOSurfaceWrapper::alloc((_IOSurfaceWrapper *)(a3 + 1 + 12 * a4));
  v7 = operator new(0x28uLL);
  v7[24] = 0;
  *((_QWORD *)this + 2) = v7 + 24;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = &unk_1E9515C90;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 4) = v6;
  *((_QWORD *)this + 3) = v7;
  *((_DWORD *)this + 8) = 0;
  *((_DWORD *)this + 2) = IOSurfaceGetID(v6);
  BaseAddress = *(__IOSurface **)(*((_QWORD *)this + 2) + 8);
  if (BaseAddress)
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  if (!*((_DWORD *)this + 1))
    BaseAddress = 0;
  memcpy(BaseAddress, a2, *((unsigned int *)this + 1));
  return this;
}

void sub_1D3378D7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::_ANEProcedureDataSerializerDeserializer(uint64_t a1, const void *a2, int a3, int a4)
{
  __IOSurface *v6;
  _BYTE *v7;
  __IOSurface *BaseAddress;

  *(_DWORD *)a1 = a4;
  *(_DWORD *)(a1 + 4) = a3 + 1;
  v6 = _IOSurfaceWrapper::alloc((_IOSurfaceWrapper *)(a3 + 113));
  v7 = operator new(0x28uLL);
  v7[24] = 0;
  *(_QWORD *)(a1 + 16) = v7 + 24;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = &unk_1E9515C90;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 4) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 8) = IOSurfaceGetID(v6);
  BaseAddress = *(__IOSurface **)(*(_QWORD *)(a1 + 16) + 8);
  if (BaseAddress)
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  if (!*(_DWORD *)(a1 + 4))
    BaseAddress = 0;
  memcpy(BaseAddress, a2, *(unsigned int *)(a1 + 4));
  return a1;
}

void sub_1D3378E38(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

unsigned int *aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::_ANEWeightSerializerDeserializer(unsigned int *a1, const void *a2, int a3, const void *a4, int a5, const void *a6, _IOSurfaceWrapper *a7, const void *a8, unsigned int a9, const void *a10, int a11, void *a12)
{
  IOSurfaceRef v20;
  _QWORD *v21;
  IOSurfaceRef v22;
  _QWORD *v23;
  __IOSurface *BaseAddress;
  __IOSurface *v25;
  size_t v26;
  char *v27;
  void *SHACode;
  void *v29;
  NSObject *v30;
  __IOSurface *v31;
  int v33;
  __IOSurface *v34;
  void *v35;
  int v36;
  char *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v39 = a12;
  *a1 = a3 + 1;
  a1[1] = a5 + 1;
  a1[2] = a9;
  a1[3] = a11 + 1;
  a1[5] = a7;
  v20 = _IOSurfaceWrapper::alloc((_IOSurfaceWrapper *)(a5 + 1 + a3 + 1 + a9 + a11 + 1));
  v21 = operator new(0x28uLL);
  v21[2] = 0;
  *v21 = &unk_1E9515C90;
  v21[1] = 0;
  *((_BYTE *)v21 + 24) = 0;
  v21[4] = v20;
  *((_QWORD *)a1 + 4) = v21 + 3;
  *((_QWORD *)a1 + 5) = v21;
  v22 = _IOSurfaceWrapper::alloc(a7);
  v23 = operator new(0x28uLL);
  v23[1] = 0;
  v23[2] = 0;
  *((_BYTE *)v23 + 24) = 0;
  *v23 = &unk_1E9515C90;
  v23[4] = v22;
  *((_QWORD *)a1 + 6) = v23 + 3;
  *((_QWORD *)a1 + 7) = v23;
  BaseAddress = *(__IOSurface **)(*((_QWORD *)a1 + 4) + 8);
  if (BaseAddress)
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  if (!*a1)
    BaseAddress = 0;
  memcpy(BaseAddress, a2, *a1);
  v25 = *(__IOSurface **)(*((_QWORD *)a1 + 4) + 8);
  if (v25)
    v25 = (__IOSurface *)IOSurfaceGetBaseAddress(v25);
  v26 = a1[1];
  if ((_DWORD)v26)
    v27 = (char *)v25 + *a1;
  else
    v27 = 0;
  memcpy(v27, a4, v26);
  if (a8)
  {
    SHACode = (void *)aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getSHACode((aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *)a1);
    memcpy(SHACode, a8, a1[2]);
  }
  if (a10)
  {
    v29 = (void *)aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getsandboxExtension((aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *)a1);
    memcpy(v29, a10, a1[3]);
  }
  a1[4] = IOSurfaceGetID(*(IOSurfaceRef *)(*((_QWORD *)a1 + 4) + 8));
  v30 = v39;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v33 = *a1;
    v34 = *(__IOSurface **)(*((_QWORD *)a1 + 4) + 8);
    if (v34)
    {
      v35 = IOSurfaceGetBaseAddress(v34);
      v36 = *a1;
      v34 = *(__IOSurface **)(*((_QWORD *)a1 + 4) + 8);
      if (v34)
        v34 = (__IOSurface *)IOSurfaceGetBaseAddress(v34);
    }
    else
    {
      v35 = 0;
      v36 = *a1;
    }
    if (a1[1])
      v37 = (char *)v34 + *a1;
    else
      v37 = 0;
    if (v36)
      v38 = v35;
    else
      v38 = 0;
    *(_DWORD *)buf = 67109634;
    v41 = v33;
    v42 = 2080;
    v43 = v38;
    v44 = 2080;
    v45 = v37;
    _os_log_debug_impl(&dword_1D3352000, v30, OS_LOG_TYPE_DEBUG, "_ANEWeightSerializerDeserializer weightSymbolSize:%u weightsymbol:%s weightsymbolURL:%s\n", buf, 0x1Cu);
  }

  v31 = *(__IOSurface **)(*((_QWORD *)a1 + 6) + 8);
  if (v31)
    v31 = (__IOSurface *)IOSurfaceGetBaseAddress(v31);
  memcpy(v31, a6, a1[5]);
  a1[6] = IOSurfaceGetID(*(IOSurfaceRef *)(*((_QWORD *)a1 + 6) + 8));

  return a1;
}

void sub_1D3379108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;

  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](v11);
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](v10);

  _Unwind_Resume(a1);
}

uint64_t aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getSHACode(aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *this)
{
  __IOSurface *BaseAddress;

  BaseAddress = *(__IOSurface **)(*((_QWORD *)this + 4) + 8);
  if (BaseAddress)
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  if (*((_DWORD *)this + 2))
    return (uint64_t)BaseAddress + (*((_DWORD *)this + 1) + *(_DWORD *)this);
  else
    return 0;
}

uint64_t aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getsandboxExtension(aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *this)
{
  __IOSurface *BaseAddress;

  BaseAddress = *(__IOSurface **)(*((_QWORD *)this + 4) + 8);
  if (BaseAddress)
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  if (*((_DWORD *)this + 3))
    return (uint64_t)BaseAddress + (*((_DWORD *)this + 1) + *(_DWORD *)this + *((_DWORD *)this + 2));
  else
    return 0;
}

void aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::~_ANEModelInstanceParametersSerializerDeserializer(aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *this)
{
  unint64_t v2;
  unint64_t v3;
  char *v4;
  aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer *v5;

  v2 = *((unsigned int *)this + 8);
  if ((_DWORD)v2)
  {
    v3 = 0;
    v4 = (char *)this + 40;
    do
    {
      v5 = *(aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer **)&v4[8 * v3];
      if (v5)
      {
        aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::~_ANEProcedureDataSerializerDeserializer(v5);
        MEMORY[0x1D824D998]();
        *(_QWORD *)&v4[8 * v3] = 0;
        v2 = *((unsigned int *)this + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

void aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::~_ANEProcedureDataSerializerDeserializer(aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer *this)
{
  unint64_t v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = *((unsigned int *)this + 8);
  if ((_DWORD)v2)
  {
    v3 = 0;
    v4 = (char *)this + 40;
    do
    {
      v5 = *(_QWORD *)&v4[8 * v3];
      if (v5)
      {
        std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](v5 + 48);
        std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100](v5 + 32);
        MEMORY[0x1D824D998](v5, 0x1020C4076FB8CD1);
        *(_QWORD *)&v4[8 * v3] = 0;
        v2 = *((unsigned int *)this + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

void OUTLINED_FUNCTION_1_7(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, a3, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_17(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(_QWORD *)(a4 + 14) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_20(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  int v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0x12u);
}

uint64_t OUTLINED_FUNCTION_27(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  return result;
}

id OUTLINED_FUNCTION_28(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_30@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  uint64_t v3;

  *(float *)v3 = a3;
  *(_QWORD *)(v3 + 4) = result;
  *(_WORD *)(v3 + 12) = 2048;
  *(_QWORD *)(v3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_31(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x18u);
}

void OUTLINED_FUNCTION_32(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  return result;
}

uint64_t OUTLINED_FUNCTION_34(uint64_t result, float a2)
{
  uint64_t v2;

  *(float *)v2 = a2;
  *(_QWORD *)(v2 + 4) = result;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = 1;
  return result;
}

id OUTLINED_FUNCTION_35(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_36@<X0>(uint64_t result@<X0>, int a2@<W8>, float a3@<S0>)
{
  uint64_t v3;

  *(float *)v3 = a3;
  *(_QWORD *)(v3 + 4) = result;
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_37(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2, int a3)
{
  __int16 v3;
  int v4;

  *(_DWORD *)(a2 + 14) = v4;
  *(_WORD *)(a2 + 18) = v3;
  *(_DWORD *)(a2 + 20) = a3;
}

void OUTLINED_FUNCTION_41(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t OUTLINED_FUNCTION_43(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2112;
  return result;
}

id _ANEDaemonInterfacePrivate()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCD17B0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  commonInitialization(v0);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_beginRealTimeTaskWithReply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_endRealTimeTaskWithReply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_echo_withReply_, 0, 0);

  return v0;
}

void sub_1D337AE38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t fDeviceCallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  void *v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  uint64_t v14;
  unsigned int v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1D824DB90]();
  v9 = *a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: statusType=%d : pRefCon=%p : device=%p : programInstance=%p"), "fDeviceCallback", *a4, a1, a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 0xFFFFFFFE) == 0x16)
  {
    +[_ANELog common](_ANELog, "common");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1D3352000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  else if (v9 == 21 || v9 == 18)
  {
    +[_ANELog common](_ANELog, "common");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      fDeviceCallback((uint64_t)v10, v11);
  }
  else
  {
    +[_ANELog common](_ANELog, "common");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      fDeviceCallback((uint64_t)v10, v11, v14);
  }

  v15 = *a4;
  if (*a4 == 21)
  {
    +[_ANEDataReporter addValue:forScalarKey:](_ANEDataReporter, "addValue:forScalarKey:", 1, CFSTR("ANEReset"));
    v15 = *a4;
  }
  if (v15 <= 0x15 && ((1 << v15) & 0x260000) != 0)
    +[_ANEDataReporter reportErrorMsg:status:](_ANEDataReporter, "reportErrorMsg:status:");

  objc_autoreleasePoolPop(v8);
  return 0;
}

void sub_1D337B03C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D337B2FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LoadDeviceNamed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  char *v8;
  char *v9;

  os_unfair_lock_lock_with_options();
  v6 = (void *)dylib_handle;
  if (dylib_handle)
    goto LABEL_5;
  v7 = dlopen("/System/Library/PrivateFrameworks/ANEServices.framework/ANEServices", 4);
  dylib_handle = (uint64_t)v7;
  v8 = dlerror();
  if (!v7)
    printf("dlopen error: %s\n", v8);
  v6 = (void *)dylib_handle;
  if (dylib_handle)
  {
LABEL_5:
    if (!factory_function_deviceOpen)
    {
      factory_function_deviceOpen = dlsym(v6, "H11ANEDeviceOpen");
      v9 = dlerror();
      if (v9)
        printf("dlsym err: %s\n", v9);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
    if (factory_function_deviceOpen)
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))factory_function_deviceOpen)(a1, a2, a3, fDeviceCallback);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
  }
  return 4;
}

void sub_1D337B834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D337BC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D337C368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D337C80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D337CBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D337CF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D337D2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D337DA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D337DC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D337E0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D337EACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1D337F6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_13_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

id OUTLINED_FUNCTION_17_0(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_19(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_20_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_26_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_27_0(uint64_t a1, void *a2)
{
  return a2;
}

void ANEGetValidateNetworkSupportedVersion_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1D3352000, v0, OS_LOG_TYPE_DEBUG, "%s: validateNetworkSupportedVersion=%llu", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_6();
}

void ANEGetValidateNetworkSupportedVersion_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "uint64_t ANEGetValidateNetworkSupportedVersion()";
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a1, a3, "%s: Virtual Machine environment detected but no virtualClient available.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void ANEValidateNetworkCreate_cold_1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  *v1 = 136315394;
  OUTLINED_FUNCTION_4(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  OUTLINED_FUNCTION_1_0(&dword_1D3352000, v3, v4, "%s: outValidationParams=%@", v5);

  OUTLINED_FUNCTION_2_0();
}

void ANEValidateNetworkCreate_cold_2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_7(&dword_1D3352000, v2, (uint64_t)v2, "%s: device_api_version=%llu mismatch with api_version=%llu", (uint8_t *)v3);
}

void ANEValidateNetworkCreate_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1D3352000, a2, OS_LOG_TYPE_ERROR, "%s: ANEDeviceInfo Directory can't be created error %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_6();
}

void ANEValidateNetworkCreate_cold_4()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  *v1 = 136315394;
  OUTLINED_FUNCTION_4(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  OUTLINED_FUNCTION_1_0(&dword_1D3352000, v3, v4, "%s: boot-arg %@ set, performing validation on guest", v5);

  OUTLINED_FUNCTION_2_0();
}

void ANEValidateNetworkCreate_cold_5()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  *v1 = 136315394;
  OUTLINED_FUNCTION_4(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  OUTLINED_FUNCTION_1_0(&dword_1D3352000, v3, v4, "%s: inValidationParams: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

void fDeviceCallback(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, a2, a3, "%@", (uint8_t *)&v3);
}

void fDeviceCallback(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D3352000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

uint64_t ANECGetValidateNetworkSupportedVersion()
{
  return MEMORY[0x1E0CF14D0]();
}

uint64_t ANECValidateNetworkCreate()
{
  return MEMORY[0x1E0CF1740]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C985F8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x1E0CBAD30](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD40](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1E0DE2B78]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1E0D7FE58]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1E0D7FE60]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1E0CD65E8]();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t MIL::ParserOptions::Make(MIL::ParserOptions *this)
{
  return MEMORY[0x1E0D44B38](this);
}

uint64_t MIL::Text::SerializeToFile()
{
  return MEMORY[0x1E0D44D60]();
}

uint64_t MIL::Text::SerializerOptions::Make(MIL::Text::SerializerOptions *this)
{
  return MEMORY[0x1E0D44D78](this);
}

uint64_t MIL::Text::ParseProgramFromFile()
{
  return MEMORY[0x1E0D44D88]();
}

uint64_t MIL::Opsets::Common::CreateMILContext(MIL::Opsets::Common *this)
{
  return MEMORY[0x1E0D44E38](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E9515848(__p);
}

uint64_t operator delete()
{
  return off_1E9515850();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E9515858(__sz, a2);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E9515860(__sz);
}

uint64_t operator new()
{
  return off_1E9515868();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1E0C82B20]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1E0C82B28](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x1E0C83A28]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

