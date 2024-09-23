@implementation ZN8Espresso27EventReporterImplementation9logMetricERKNSt3

void *___ZN8Espresso27EventReporterImplementation9logMetricERKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEERKNS1_8optionalIiEESD_S9_NS_21_EspressoCompilerTypeES9__block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  int *v6;
  int *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  Espresso::EspressoReporterUtilities *v12;
  BOOL isRunningManualTests;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  v4 = *(const char **)(a1 + 32);
  if (v4[23] < 0)
    v4 = *(const char **)v4;
  if (v4)
    v5 = v4;
  else
    v5 = "";
  xpc_dictionary_set_string(v2, "computeUnit", v5);
  v6 = *(int **)(a1 + 40);
  if (*((_BYTE *)v6 + 4))
    xpc_dictionary_set_uint64(v3, "numLayers", *v6);
  v7 = *(int **)(a1 + 48);
  if (*((_BYTE *)v7 + 4))
    xpc_dictionary_set_uint64(v3, "numSegments", *v7);
  v8 = *(const char **)(a1 + 56);
  if (v8[23] < 0)
    v8 = *(const char **)v8;
  if (v8)
    v9 = v8;
  else
    v9 = "";
  xpc_dictionary_set_string(v3, "modelHash", v9);
  v10 = *(const char **)(a1 + 64);
  if (v10[23] < 0)
    v10 = *(const char **)v10;
  if (v10)
    v11 = v10;
  else
    v11 = "";
  xpc_dictionary_set_string(v3, "filePath", v11);
  xpc_dictionary_set_uint64(v3, "compilerType", *(int *)(a1 + 72));
  isRunningManualTests = Espresso::EspressoReporterUtilities::isRunningManualTests(v12);
  xpc_dictionary_set_BOOL(v3, "manualTestData", isRunningManualTests);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("XCTestBundlePath"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("XCTestBundlePath"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v3, "testBundlePath", (const char *)objc_msgSend(v17, "UTF8String"));

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    xpc_dictionary_set_string(v3, "bundleIdentifier", (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));

  return v3;
}

@end
