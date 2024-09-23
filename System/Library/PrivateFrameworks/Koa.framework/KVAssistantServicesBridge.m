@implementation KVAssistantServicesBridge

+ (BOOL)isSiriUODSupported
{
  void *v3;
  void *v4;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  if ((sub_1B70E8708() & 1) != 0)
    return 1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = off_1EF151F60;
  v9 = off_1EF151F60;
  if (!off_1EF151F60)
  {
    v4 = (void *)sub_1B70E87B0();
    v3 = dlsym(v4, "AFShouldRunAsrOnServerForUOD");
    v7[3] = (uint64_t)v3;
    off_1EF151F60 = v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(void))v3)();
}

+ (BOOL)isSiriMUXSupported
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = off_1EF151F68;
  v9 = off_1EF151F68;
  if (!off_1EF151F68)
  {
    v3 = (void *)sub_1B70E87B0();
    v2 = dlsym(v3, "AFDeviceSupportsSiriMUX");
    v7[3] = (uint64_t)v2;
    off_1EF151F68 = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(void))v2)();
}

+ (BOOL)isASRSupported
{
  void *v3;
  void *v4;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  if ((sub_1B70E8708() & 1) != 0)
    return 1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = off_1EF151F70;
  v9 = off_1EF151F70;
  if (!off_1EF151F70)
  {
    v4 = (void *)sub_1B70E87B0();
    v3 = dlsym(v4, "AFOfflineDictationCapable");
    v7[3] = (uint64_t)v3;
    off_1EF151F70 = v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(void))v3)();
}

+ (id)iCloudAltDSIDFromSharedUserId:(id)a3 error:(id *)a4
{
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "+[KVAssistantServicesBridge iCloudAltDSIDFromSharedUserId:error:]";
    _os_log_error_impl(&dword_1B70E7000, v4, OS_LOG_TYPE_ERROR, "%s Unexpected call to resolve iCloudAltDSID from non-tvOS platform, returning nil", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

@end
