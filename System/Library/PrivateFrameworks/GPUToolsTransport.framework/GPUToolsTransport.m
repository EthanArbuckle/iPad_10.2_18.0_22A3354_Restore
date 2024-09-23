DYGTMTLDeviceProfile *newProfileWithMTLDevice(void *a1)
{
  id v1;
  DYGTMTLDeviceProfile *v2;
  void *v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  size_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  DYGTMTLDeviceProfile *v25;

  v1 = a1;
  v2 = objc_alloc_init(DYGTMTLDeviceProfile);
  objc_msgSend(v1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYGTMTLDeviceProfile setName:](v2, "setName:", v3);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 17; ++i)
  {
    v6 = newProfileWithMTLDevice_availableFeatures[i];
    if (objc_msgSend(v1, "supportsFeatureSet:", v6))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

    }
  }
  v8 = (void *)objc_msgSend(v4, "copy");
  v25 = v2;
  -[DYGTMTLDeviceProfile setSupportedFeatureSets:](v2, "setSupportedFeatureSets:", v8);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "areProgrammableSamplePositionsSupported")
    && objc_msgSend(v1, "maxCustomSamplePositions"))
  {
    v10 = 1;
    do
    {
      if (objc_msgSend(v1, "supportsTextureSampleCount:", v10))
      {
        v11 = (char *)malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
        objc_msgSend(v1, "getDefaultSamplePositions:count:", v11, v10);
        v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v13 = 0;
        do
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", vcvtq_f64_f32(*(float32x2_t *)&v11[8 * v13]));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v14);

          ++v13;
        }
        while (v10 != v13);
        free(v11);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v15, v16);

      }
    }
    while (objc_msgSend(v1, "maxCustomSamplePositions") > v10++);
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYGTMTLDeviceProfile setDefaultSamplePositions:](v25, "setDefaultSamplePositions:", v18);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j != 12; ++j)
    {
      v21 = newProfileWithMTLDevice_availableGPUFamilies[j];
      if (objc_msgSend(v1, "supportsFamily:", v21))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v22);

      }
    }
    v23 = (void *)objc_msgSend(v19, "copy");
    -[DYGTMTLDeviceProfile setSupportedGPUFamilies:](v25, "setSupportedGPUFamilies:", v23);

  }
  return v25;
}

id DaemonDeviceCapabilities(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  CFArrayRef v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  void *values[2];
  __int128 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = MTLCreateSystemDefaultDevice();
  newProfileWithMTLDevice(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/System/Library/Frameworks/Metal.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)*MEMORY[0x24BDBD2A0];
    objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD2A0]);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24F828350;
  }

  *(_OWORD *)values = xmmword_24F827820;
  v18 = *(_OWORD *)off_24F827830;
  v19 = CFSTR("main-screen-scale");
  v9 = CFArrayCreate(0, (const void **)values, 5, MEMORY[0x24BDBD690]);
  v10 = (void *)MGCopyMultipleAnswers();
  CFRelease(v9);
  v14 = v3;
  v15[0] = CFSTR("gputools.contexts-info");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = v10;
  v15[1] = CFSTR("screen-dimensions");
  v15[2] = CFSTR("metal_version");
  v15[3] = CFSTR("nativePointerSize");
  v16[2] = v8;
  v16[3] = &unk_24F83C030;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void *GPUToolsVersionQuery()
{
  return &unk_24F83C0A8;
}

id DaemonCreateGuestAppTransport(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_29;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("environment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_28:

LABEL_29:
      v16 = 0;
      goto LABEL_30;
    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v45;
LABEL_6:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_27;
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_27;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v6)
            goto LABEL_6;
          break;
        }
      }
    }

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("platformPrefix"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadCapture"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadReplayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadDiagnostics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_25;
    }
  }

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("environment"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    v17 = objc_msgSend(v15, "mutableCopy");
  else
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  v19 = (void *)v17;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("DYLD_INSERT_LIBRARIES"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsSeparatedByString:", CFSTR(":"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    v23 = objc_msgSend(v21, "mutableCopy");
  else
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  v24 = (void *)v23;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("platformPrefix"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("GPUTOOLS_EXTRA_PLUGIN_PATHS"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadReplayer"));
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_37;
  v28 = (void *)v27;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadCapture"));
  v43 = v24;
  v29 = v22;
  v30 = v19;
  v31 = v20;
  v32 = v26;
  v33 = v25;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "BOOLValue");

  v25 = v33;
  v26 = v32;
  v20 = v31;
  v19 = v30;
  v22 = v29;
  v24 = v43;

  if (v35)
  {
LABEL_37:
    objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/"), "stringByAppendingPathComponent:", CFSTR("GPUToolsCapture.framework/GPUToolsCapture"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "containsObject:", v36) & 1) == 0)
      objc_msgSend(v24, "addObject:", v36);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v36, CFSTR("DYMTL_TOOLS_DYLIB_PATH"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadDiagnostics"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "BOOLValue");

  if (v38)
  {
    objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/"), "stringByAppendingPathComponent:", CFSTR("GPUToolsDiagnostics.framework/GPUToolsDiagnostics"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "containsObject:", v39) & 1) == 0)
      objc_msgSend(v24, "addObject:", v39);

  }
  v40 = objc_msgSend(v22, "count");
  if (v40 != objc_msgSend(v24, "count"))
  {
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(":"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v41, CFSTR("DYLD_INSERT_LIBRARIES"));

    v42 = objc_msgSend(v19, "copy");
    v16 = (void *)v42;
  }

LABEL_30:
  return v16;
}

void **GTTpacket_stream(void *a1)
{
  void **v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void **)malloc_type_calloc(1uLL, 0x28uLL, 0x1080040F9A837A9uLL);
  v3 = objc_opt_new();
  v4 = v2[2];
  v2[2] = (void *)v3;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a1);
  v6 = *v2;
  *v2 = (void *)v5;

  v2[1] = a1;
  return v2;
}

void GTTpacket_record(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelector:", v7);

    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRequests:", v8);

    objc_msgSend(v6, "setRequestID:", objc_msgSend(v5, "requestID"));
    objc_msgSend(*(id *)a1, "addObject:", v6);
    if ((unint64_t)objc_msgSend(*(id *)a1, "count") > *(_QWORD *)(a1 + 8))
      objc_msgSend(*(id *)a1, "removeObjectAtIndex:", 0);

  }
}

void GTTpacket_recordBatch(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (a1)
  {
    v5 = a3;
    v9 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelector:", v6);

    objc_msgSend(v5, "requests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequests:", v7);

    v8 = objc_msgSend(v5, "requestID");
    objc_msgSend(v9, "setRequestID:", v8);
    objc_msgSend(*(id *)a1, "addObject:", v9);
    if ((unint64_t)objc_msgSend(*(id *)a1, "count") > *(_QWORD *)(a1 + 8))
      objc_msgSend(*(id *)a1, "removeObjectAtIndex:", 0);

  }
}

dispatch_data_t GTTpacket_finish(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  const void *v9;
  size_t v10;
  dispatch_data_t v11;
  void *v12;
  _QWORD destructor[4];
  id v15;
  id v16;

  if (!a1)
    return (dispatch_data_t)0;
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequests:");
    objc_msgSend(*(id *)(a1 + 16), "addObject:", *(_QWORD *)(a1 + 32));
    v2 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
  v4 = (void *)MEMORY[0x24BDD1618];
  v5 = (void *)objc_msgSend(*(id *)a1, "copy");
  v16 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v6)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = (const void *)objc_msgSend(v8, "bytes");
    v10 = objc_msgSend(v8, "length");
    destructor[0] = MEMORY[0x24BDAC760];
    destructor[1] = 3221225472;
    destructor[2] = __GTTpacket_finish_block_invoke;
    destructor[3] = &unk_24F827850;
    v15 = v8;
    v11 = dispatch_data_create(v9, v10, 0, destructor);
    free((void *)a1);
    v12 = v15;
  }
  else
  {
    objc_msgSend(v7, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to encode rpacket: %@"), v12);
    v11 = 0;
  }

  return v11;
}

__CFString *GTTransportArchiveDirectory()
{
  void *v0;
  char v1;
  __CFString *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isiOSAppOnMac");

  if ((v1 & 1) != 0)
  {
    v2 = CFSTR("/tmp/com.apple.GPUToolsAgent");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", getpwnam("mobile")->pw_dir);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library/GPUTools"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void GTPoint3DDecode(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a1;
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".x"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend(v6, "decodeInt64ForKey:", v7);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".y"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  a3[1] = objc_msgSend(v6, "decodeInt64ForKey:", v8);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".z"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "decodeInt64ForKey:", v10);
  a3[2] = v9;

}

void GTPoint3DEncode(void *a1, uint64_t *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = *a2;
  v6 = a3;
  v7 = a1;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".x"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInt64:forKey:", v5, v8);

  v9 = a2[1];
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".y"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInt64:forKey:", v9, v10);

  v11 = a2[2];
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".z"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "encodeInt64:forKey:", v11, v12);
}

uint64_t GTPoint2DDecode(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", v5);

  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeInt64ForKey:", v7);
  return v6;
}

void GTPoint2DEncode(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a1;
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".x"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeInt64:forKey:", a2, v9);

  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".y"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "encodeInt64:forKey:", a3, v10);
}

unint64_t GTDispatchUIDDecode(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".dispatchIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", v5);

  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".dispatchICBIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "decodeInt32ForKey:", v7);
  return v6 | (unint64_t)(v8 << 32);
}

void GTDispatchUIDEncode(void *a1, unint64_t a2, void *a3)
{
  unint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = HIDWORD(a2);
  v6 = a3;
  v7 = a1;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".dispatchIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInt32:forKey:", a2, v8);

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".dispatchICBIndex"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "encodeInt32:forKey:", v5, v9);
}

id GTBulkDataCompress(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v5 = a1;
  v6 = v5;
  switch(a2)
  {
    case 0:
      v7 = v5;
      goto LABEL_8;
    case 1:
      v8 = 0;
      goto LABEL_7;
    case 2:
      v8 = 3;
      goto LABEL_7;
    case 3:
      v8 = 1;
      goto LABEL_7;
    case 4:
      v8 = 2;
LABEL_7:
      objc_msgSend(v5, "compressedDataUsingAlgorithm:error:", v8, a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      a3 = v7;
      break;
    default:
      break;
  }

  return a3;
}

id GTBulkDataDecompress(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v5 = a1;
  v6 = v5;
  switch(a2)
  {
    case 0:
      v7 = v5;
      goto LABEL_8;
    case 1:
      v8 = 0;
      goto LABEL_7;
    case 2:
      v8 = 3;
      goto LABEL_7;
    case 3:
      v8 = 1;
      goto LABEL_7;
    case 4:
      v8 = 2;
LABEL_7:
      objc_msgSend(v5, "decompressedDataUsingAlgorithm:error:", v8, a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      a3 = v7;
      break;
    default:
      break;
  }

  return a3;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t GTTransportEnvironment_init()
{
  uint64_t result;

  GT_TRANSPORT_ENV = GetEnvDefault("MTLTRANSPORT_REPLAY_MAX_RECORD_REQUEST", 64);
  qword_255C5FDD0 = qword_255C5FDD0 & 0xFFFFFFFFFFFFFFFELL | GetEnvDefault("MTLTRANSPORT_REPLAY_RECORD_REQUEST", 1) & 1;
  result = GetEnvDefault("MTLTRANSPORT_LAUNCH_TIMEOUT", 30);
  qword_255C5FDC8 = result;
  return result;
}

uint64_t GetEnvDefault(const char *a1, uint64_t a2)
{
  char *v3;

  v3 = getenv(a1);
  if (v3)
    return strtol(v3, 0, 0);
  else
    return a2;
}

GTCaptureRequestToken *ProxyCaptureBatchRequest(void *a1, void *a2, void *a3, const char *a4)
{
  id v7;
  id v8;
  GTCaptureRequestToken *v9;
  xpc_object_t empty;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  xpc_object_t v19;
  xpc_object_t v20;
  GTCaptureRequestToken *v21;
  id v22;
  GTCaptureRequestToken *v23;
  GTCaptureRequestToken *v24;
  GTCaptureRequestToken *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  GTCaptureRequestToken *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v28 = a1;
  v7 = a2;
  v8 = a3;
  v27 = v7;
  v9 = -[GTCaptureRequestToken initWithCaptureService:andTokenId:]([GTCaptureRequestToken alloc], "initWithCaptureService:andTokenId:", v7, objc_msgSend(v7, "nextRequestID"));
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", a4);
  v26 = v9;
  xpc_dictionary_set_uint64(empty, "requestID", -[GTCaptureRequestToken tokenId](v9, "tokenId"));
  v11 = xpc_array_create_empty();
  v12 = xpc_array_create_empty();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v8, "requests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v19 = xpc_uint64_create(objc_msgSend(v18, "requestID"));
        xpc_array_append_value(v11, v19);

        v20 = xpc_nsobject_create(v18);
        xpc_array_append_value(v12, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  xpc_dictionary_set_value(empty, "_batch_requestIDs", v11);
  xpc_dictionary_set_value(empty, "_batch_requestObjs", v12);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = ___ZL24ProxyCaptureBatchRequestP19GTServiceConnectionPU30objcproto19GTMTLCaptureService11objc_objectP21GTCaptureRequestBatchPKc_block_invoke;
  v29[3] = &unk_24F827A10;
  v30 = v8;
  v21 = v26;
  v31 = v21;
  v22 = v8;
  objc_msgSend(v28, "sendMessage:replyHandler:", empty, v29);
  v23 = v31;
  v24 = v21;

  return v24;
}

GTCaptureRequestBatch *DispatchCaptureBatchRequest(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t uint64;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  GTCaptureRequestBatch *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD applier[4];
  id v22;
  id v23;

  v3 = a1;
  v4 = a2;
  uint64 = xpc_dictionary_get_uint64(v4, "requestID");
  xpc_dictionary_get_array(v4, "_batch_requestIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_array(v4, "_batch_requestObjs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", xpc_array_get_count(v6));
  v9 = MEMORY[0x24BDAC760];
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke;
  applier[3] = &unk_24F827A38;
  v22 = v7;
  v23 = v8;
  v10 = v8;
  v11 = v7;
  xpc_array_apply(v6, applier);
  v12 = -[GTCaptureRequestBatch initWithRequestID:]([GTCaptureRequestBatch alloc], "initWithRequestID:", uint64);
  v13 = (void *)objc_msgSend(v10, "copy");
  -[GTCaptureRequestBatch setRequests:](v12, "setRequests:", v13);

  gt_xpc_dictionary_create_reply(v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
  v18[3] = &unk_24F827A60;
  v19 = v14;
  v20 = v3;
  v15 = v3;
  v16 = v14;
  -[GTCaptureRequestBatch setCompletionHandler:](v12, "setCompletionHandler:", v18);

  return v12;
}

void ___ZL24ProxyCaptureBatchRequestP19GTServiceConnectionPU30objcproto19GTMTLCaptureService11objc_objectP21GTCaptureRequestBatchPKc_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *nsobject_classes;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;

  v13 = a2;
  v5 = a3;
  if (v13)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF20]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v13, "response", v9);

  }
  else
  {
    nsobject_classes = (void *)objc_opt_new();
    objc_msgSend(nsobject_classes, "setError:", v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, nsobject_classes);

  }
  objc_msgSend(*(id *)(a1 + 40), "completed");

}

uint64_t ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  GTCaptureRequestUnknown *nsobject_classes;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  nsobject_classes = (GTCaptureRequestUnknown *)xpc_array_get_nsobject_classes(*(void **)(a1 + 32), a2, v11);
  if (!nsobject_classes)
    nsobject_classes = -[GTCaptureRequest initWithRequestID:]([GTCaptureRequestUnknown alloc], "initWithRequestID:", xpc_uint64_get_value(v5));
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", nsobject_classes, a2);

  return 1;
}

uint64_t ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "response", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void DeleteAllArchives(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = v1;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v1);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, MEMORY[0x24BDBD1A8], 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "pathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("gputrace"));

        if (!v13)
          objc_msgSend(v2, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v2;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeItemAtURL:error:", v19, 0);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

}

id LocalArchiveURLFromRemoteURL(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = (objc_class *)MEMORY[0x24BDBCF48];
  v2 = a1;
  v3 = [v1 alloc];
  GTTransportArchiveDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initFileURLWithPath:isDirectory:", v4, 1);

  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id FindRemoteGTFileWriterService(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  allServicesForDeviceUDID(a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v6, (Protocol *)&unk_255D64E18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    filteredArrayByPID(v7, objc_msgSend(v5, "currentRemoteRelayPid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t GTFileTransferCompressionAlgorithmToNSDataCompressionAlgorithm(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 3)
    return 0;
  else
    return qword_22D0CE130[a1 - 2];
}

uint64_t ProcessCompressionStream(compression_stream *a1, const uint8_t *a2, size_t a3, uint8_t *a4, size_t a5, uint64_t a6, void *a7)
{
  unsigned int (**v13)(id, uint8_t *, size_t, uint64_t);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v13 = a7;
  a1->src_ptr = a2;
  a1->src_size = a3;
  if (a3)
  {
    while (compression_stream_process(a1, 0) != COMPRESSION_STATUS_ERROR)
    {
      if (!a1->dst_size)
      {
        if (!v13[2](v13, a4, a5, a6))
          goto LABEL_10;
        a1->dst_ptr = a4;
        a1->dst_size = a5;
      }
      if (!a1->src_size)
        goto LABEL_7;
    }
    if (!a6)
      goto LABEL_11;
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Compression failed: %@"), CFSTR("Failed to process compression stream"), *MEMORY[0x24BDD0FC8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.filestreamer"), 0, v16);
    *(_QWORD *)a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    a6 = 0;
  }
  else
  {
LABEL_7:
    a6 = 1;
  }
LABEL_11:

  return a6;
}

uint64_t FinalizeCompressionStream(compression_stream *a1, uint8_t *a2, size_t a3, uint64_t a4, void *a5)
{
  unsigned int (**v9)(id, uint8_t *, size_t, uint64_t);
  compression_status v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  while (1)
  {
    v10 = compression_stream_process(a1, 1);
    if (v10)
      break;
    if (!v9[2](v9, a2, a3, a4))
      goto LABEL_10;
    a1->dst_ptr = a2;
    a1->dst_size = a3;
  }
  if (v10 == COMPRESSION_STATUS_ERROR)
  {
    if (!a4)
      goto LABEL_11;
    v11 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Compression failed: %@"), CFSTR("Failed to finalize compression stream"), *MEMORY[0x24BDD0FC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.filestreamer"), 0, v13);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (v9[2](v9, a2, a3 - a1->dst_size, a4))
  {
    a1->dst_ptr = a2;
    a1->dst_size = a3;
    a4 = 1;
    goto LABEL_11;
  }
LABEL_10:
  a4 = 0;
LABEL_11:

  return a4;
}

uint64_t GTFileWriterTransferFileEntries(void *a1, void *a2, void *a3, id *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  compression_algorithm v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  int v26;
  __CFString *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint8_t *v32;
  uint8_t *v33;
  ssize_t v34;
  int v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  int v52;
  int v53;
  void *v54;
  unint64_t v55;
  size_t v56;
  uint8_t *v57;
  uint8_t *v58;
  ssize_t v59;
  size_t v60;
  char v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t (**v75)(id, uint8_t *, _QWORD, id *);
  id v76;
  void *v77;
  id v78;
  const __CFString *v79;
  uint64_t v80;
  const __CFString *v81;
  id v82;
  id v83;
  id v84;
  id obj;
  id obja;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *context;
  uint8_t *contexta;
  uint8_t *v97;
  uint64_t v98;
  void *v99;
  id v100;
  __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  _QWORD v105[16];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  compression_stream stream;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v97 = (uint8_t *)malloc_type_malloc(objc_msgSend(v10, "chunkSize"), 0x73AD97B3uLL);
  v83 = v9;
  v84 = v8;
  v82 = v10;
  v77 = v11;
  if (objc_msgSend(v10, "compressionAlgorithm"))
  {
    v12 = v8;
    v93 = v9;
    v13 = v10;
    v91 = v11;
    v78 = v12;
    if (objc_msgSend(v12, "count"))
    {
      memset(&stream, 0, sizeof(stream));
      v14 = objc_msgSend(v13, "compressionAlgorithm") - 1;
      if (v14 > 4)
        v15 = 0;
      else
        v15 = dword_22D0CE150[v14];
      v99 = v13;
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, v15) == COMPRESSION_STATUS_OK)
      {
        contexta = (uint8_t *)malloc_type_malloc(objc_msgSend(v13, "chunkSize"), 0xB778C515uLL);
        stream.src_size = 0;
        stream.dst_ptr = v97;
        stream.dst_size = objc_msgSend(v13, "chunkSize");
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v76 = v12;
        v90 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v106, v105, 16);
        if (v90)
        {
          v88 = *(_QWORD *)v107;
          obja = (id)*MEMORY[0x24BDD1128];
          v81 = (const __CFString *)*MEMORY[0x24BDD0FC8];
          while (2)
          {
            v45 = 0;
            do
            {
              if (*(_QWORD *)v107 != v88)
                objc_enumerationMutation(v76);
              v46 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v45);
              v47 = (void *)MEMORY[0x22E30C9D4]();
              v48 = objc_alloc(MEMORY[0x24BDBCF48]);
              objc_msgSend(v46, "path");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (void *)objc_msgSend(v48, "initFileURLWithPath:isDirectory:relativeToURL:", v49, 0, v93);

              v51 = objc_retainAutorelease(v50);
              v52 = open((const char *)objc_msgSend(v51, "fileSystemRepresentation"), 0);
              if (v52 < 0)
              {
                v70 = (void *)MEMORY[0x24BDD1540];
                v71 = *__error();
                v103 = v81;
                v104 = CFSTR("Failed to open file for reading");
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "errorWithDomain:code:userInfo:", obja, v71, v72);
                v43 = (id)objc_claimAutoreleasedReturnValue();

                objc_autoreleasePoolPop(v47);
                v9 = v83;
                v8 = v84;
                v10 = v82;
                if (!v43)
                  goto LABEL_77;
                goto LABEL_79;
              }
              v53 = v52;
              v54 = 0;
              v55 = 0;
              while (2)
              {
                if (v55 >= objc_msgSend(v46, "fileSize"))
                {
                  v43 = v54;
                }
                else
                {
                  v56 = objc_msgSend(v46, "fileSize") - v55;
                  if (v56 >= objc_msgSend(v99, "chunkSize"))
                    v56 = objc_msgSend(v99, "chunkSize");
                  v57 = contexta;
                  v58 = &contexta[v56];
                  while (v57 < v58)
                  {
                    v59 = read(v53, v57, v58 - v57);
                    v57 += v59;
                    if (v59 < 0)
                      goto LABEL_57;
                  }
                  if ((v56 & 0x8000000000000000) != 0)
                  {
LABEL_57:
                    v62 = (void *)MEMORY[0x24BDD1540];
                    v63 = *__error();
                    v101 = (__CFString *)v81;
                    v102 = CFSTR("Failed to read from file");
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "errorWithDomain:code:userInfo:", obja, v63, v64);
                    v43 = (id)objc_claimAutoreleasedReturnValue();

                    break;
                  }
                  v55 += v56;
                  v60 = objc_msgSend(v99, "chunkSize");
                  v100 = v54;
                  v61 = ProcessCompressionStream(&stream, contexta, v56, v97, v60, (uint64_t)&v100, v91);
                  v43 = v100;

                  v54 = v43;
                  if ((v61 & 1) != 0)
                    continue;
                }
                break;
              }
              close(v53);

              objc_autoreleasePoolPop(v47);
              if (v43)
              {

                v9 = v83;
                v8 = v84;
                v10 = v82;
LABEL_79:
                if (a4)
                {
                  v43 = objc_retainAutorelease(v43);
                  v41 = 0;
                  *a4 = v43;
                }
                else
                {
                  v41 = 0;
                }
                goto LABEL_82;
              }
              ++v45;
              v9 = v83;
              v8 = v84;
              v10 = v82;
            }
            while (v45 != v90);
            v65 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v106, v105, 16);
            v90 = v65;
            if (v65)
              continue;
            break;
          }
        }

LABEL_77:
        v41 = FinalizeCompressionStream(&stream, v97, objc_msgSend(v99, "chunkSize"), (uint64_t)a4, v91);
        v43 = 0;
LABEL_82:
        free(contexta);
        compression_stream_destroy(&stream);
        goto LABEL_83;
      }
      if (a4)
      {
        v42 = (void *)MEMORY[0x24BDD1540];
        *(_QWORD *)&v106 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Compression failed: %@"), CFSTR("Failed to initialize compression stream"));
        v43 = (id)objc_claimAutoreleasedReturnValue();
        v105[0] = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, &v106, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.filestreamer"), 0, v44);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v41 = 0;
LABEL_83:

        v13 = v99;
        goto LABEL_84;
      }
      v41 = 0;
    }
    else
    {
      v41 = 1;
    }
LABEL_84:

    v69 = v78;
    goto LABEL_85;
  }
  v16 = v11;
  v17 = v8;
  v92 = v9;
  v94 = v10;
  v75 = v16;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = v17;
  v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v105, 16);
  if (v89)
  {
    v98 = 0;
    v87 = *(_QWORD *)v107;
    v80 = *MEMORY[0x24BDD1128];
    v79 = (const __CFString *)*MEMORY[0x24BDD0FC8];
LABEL_7:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v107 != v87)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x22E30C9D4]();
      v21 = objc_alloc(MEMORY[0x24BDBCF48]);
      objc_msgSend(v19, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initFileURLWithPath:isDirectory:relativeToURL:", v22, 0, v92);

      v24 = objc_retainAutorelease(v23);
      v25 = open((const char *)objc_msgSend(v24, "fileSystemRepresentation"), 0);
      if (v25 < 0)
      {
        v66 = (void *)MEMORY[0x24BDD1540];
        v67 = *__error();
        v104 = v79;
        stream.dst_ptr = (uint8_t *)CFSTR("Failed to open file for reading");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &stream, &v104, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithDomain:code:userInfo:", v80, v67, v68);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v20);
        v9 = v83;
        v8 = v84;
        v10 = v82;
        if (!v36)
          goto LABEL_67;
        goto LABEL_70;
      }
      v26 = v25;
      context = v20;
      if (!objc_msgSend(v19, "fileSize"))
      {
        v36 = 0;
        goto LABEL_29;
      }
      v27 = 0;
      v28 = 0;
      while (2)
      {
        v29 = objc_msgSend(v19, "fileSize") - v28;
        v30 = objc_msgSend(v94, "chunkSize");
        if (v29 >= v30 - v98)
          v31 = v30 - v98;
        else
          v31 = v29;
        v32 = &v97[v98];
        v33 = &v97[v98 + v31];
        while (v32 < v33)
        {
          v34 = read(v26, v32, v33 - v32);
          v32 += v34;
          if (v34 < 0)
            goto LABEL_27;
        }
        if ((v31 & 0x8000000000000000) != 0)
        {
LABEL_27:
          v37 = (void *)MEMORY[0x24BDD1540];
          v38 = *__error();
          v102 = v79;
          v103 = CFSTR("Failed to read from file");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithDomain:code:userInfo:", v80, v38, v39);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

          break;
        }
        if (v31 + v98 == objc_msgSend(v94, "chunkSize"))
        {
          v101 = v27;
          v35 = v75[2](v75, v97, v31 + v98, (id *)&v101);
          v36 = v101;

          if (!v35)
          {
            v98 += v31;
            break;
          }
          v98 = 0;
          v27 = v36;
        }
        else
        {
          v98 += v31;
          v36 = v27;
        }
        v28 += v31;
        if (v28 < objc_msgSend(v19, "fileSize"))
          continue;
        break;
      }
LABEL_29:
      close(v26);

      objc_autoreleasePoolPop(context);
      if (v36)
      {

        v9 = v83;
        v8 = v84;
        v10 = v82;
LABEL_70:
        if (a4)
        {
          v36 = objc_retainAutorelease(v36);
          v41 = 0;
          *a4 = v36;
        }
        else
        {
          v41 = 0;
        }
        goto LABEL_75;
      }
      if (++v18 == v89)
      {
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v105, 16);
        v9 = v83;
        v8 = v84;
        v10 = v82;
        v89 = v40;
        if (v40)
          goto LABEL_7;
        goto LABEL_65;
      }
    }
  }
  v98 = 0;
LABEL_65:

LABEL_67:
  if (v98)
  {
    v41 = v75[2](v75, v97, v98, a4);
    v36 = 0;
  }
  else
  {
    v36 = 0;
    v41 = 1;
  }
LABEL_75:

  v69 = obj;
LABEL_85:

  free(v97);
  return v41;
}

BOOL GTFileTransferOptionsValidate(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = v1;
  v3 = v1 && objc_msgSend(v1, "chunkSize") && (unint64_t)objc_msgSend(v2, "compressionAlgorithm") < 6;

  return v3;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id GetPathRelativeToBase(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  v12 = 0;
  v3 = *MEMORY[0x24BDBCBD0];
  v4 = a2;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v12, v3, 0);
  v5 = v12;
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v11, v3, 0);

  objc_msgSend(v11, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subarrayWithRange:", objc_msgSend(v7, "count"), objc_msgSend(v6, "count") - objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_9(uint64_t a1, void *a2)
{
  return a2;
}

BOOL IsServicePort(unint64_t a1)
{
  return a1 >> 30 == 0;
}

id MessagePathMerge(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  xpc_object_t empty;
  size_t count;
  size_t v8;
  size_t v9;
  size_t i;
  uint64_t uint64;
  xpc_object_t v12;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  empty = 0;
  if (v3 && v4)
  {
    empty = xpc_array_create_empty();
    count = xpc_array_get_count(v3);
    v8 = xpc_array_get_count(v5);
    v9 = count >= v8 ? v8 : count;
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        uint64 = xpc_array_get_uint64(v3, i);
        if (uint64 != xpc_array_get_uint64(v5, i))
          break;
        v12 = xpc_uint64_create(uint64);
        xpc_array_append_value(empty, v12);

      }
    }
  }

  return empty;
}

uint64_t MessagePathEndsWith(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  size_t count;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  size_t v11;
  uint64_t uint64;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v4 || !xpc_array_get_count(v4))
  {
LABEL_12:
    v7 = 1;
    goto LABEL_13;
  }
  if (v3)
  {
    count = xpc_array_get_count(v5);
    if (count <= xpc_array_get_count(v3))
    {
      if (xpc_array_get_count(v3))
      {
        v8 = 0;
        v9 = -1;
        while (v8 < xpc_array_get_count(v5))
        {
          v10 = xpc_array_get_count(v3) + v9;
          v11 = xpc_array_get_count(v5) + v9;
          uint64 = xpc_array_get_uint64(v3, v10);
          if (uint64 != xpc_array_get_uint64(v5, v11))
            goto LABEL_5;
          ++v8;
          --v9;
          v7 = 1;
          if (v8 >= xpc_array_get_count(v3))
            goto LABEL_13;
        }
      }
      goto LABEL_12;
    }
  }
LABEL_5:
  v7 = 0;
LABEL_13:

  return v7;
}

BOOL MessageHasReply(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = (xpc_dictionary_get_flag(v1, "_flags", 0) & 1) != 0 || xpc_dictionary_get_BOOL(v1, "_reply");

  return v2;
}

void MessageSetHasReply(void *a1)
{
  xpc_object_t xdict;

  xdict = a1;
  xpc_dictionary_set_flag(xdict, "_flags", 0);
  xpc_dictionary_set_BOOL(xdict, "_reply", 1);

}

BOOL MessageIsValid(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *nserror;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      v5 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Encountered an XPC error: %@"), CFSTR("Message is nil"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v6;
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = (void **)v25;
      v9 = &v24;
      goto LABEL_8;
    }
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  if (MEMORY[0x22E30CF14](v3) == MEMORY[0x24BDACFB8])
  {
    if (a2)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_error_string(v4));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Encountered an XPC error: %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 7, v15);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  if (MEMORY[0x22E30CF14](v4) != MEMORY[0x24BDACFA0])
  {
    if (a2)
    {
      v5 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Encountered an XPC error: %@"), CFSTR("Unexpected XPC object type"), *MEMORY[0x24BDD0FC8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v6;
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = &v21;
      v9 = &v20;
LABEL_8:
      objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 7, v10);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  nserror = (void *)xpc_dictionary_get_nserror(v4, "_error");
  v19 = nserror;
  v16 = nserror == 0;
  if (a2 && nserror)
    *a2 = objc_retainAutorelease(nserror);

LABEL_12:
  return v16;
}

BOOL MessageVisit(void *a1, const char *a2)
{
  id v3;
  _BOOL4 v4;
  xpc_object_t v5;

  v3 = a1;
  v4 = xpc_dictionary_string_array_contains(v3, "_visited", (uint64_t)a2);
  if (!v4)
  {
    v5 = xpc_string_create(a2);
    xpc_dictionary_array_push(v3, "_visited", v5);

  }
  return !v4;
}

GTTelemetryRequestToken *ProxyTelemetryBatchRequest(void *a1, void *a2, void *a3, const char *a4)
{
  id v7;
  id v8;
  GTTelemetryRequestToken *v9;
  xpc_object_t empty;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  xpc_object_t v19;
  xpc_object_t v20;
  GTTelemetryRequestToken *v21;
  id v22;
  GTTelemetryRequestToken *v23;
  GTTelemetryRequestToken *v24;
  GTTelemetryRequestToken *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  GTTelemetryRequestToken *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v28 = a1;
  v7 = a2;
  v8 = a3;
  v27 = v7;
  v9 = -[GTTelemetryRequestToken initWithService:andTokenId:]([GTTelemetryRequestToken alloc], "initWithService:andTokenId:", v7, objc_msgSend(v8, "requestID"));
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", a4);
  v26 = v9;
  xpc_dictionary_set_uint64(empty, "requestID", -[GTTelemetryRequestToken tokenId](v9, "tokenId"));
  v11 = xpc_array_create_empty();
  v12 = xpc_array_create_empty();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v8, "requests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v19 = xpc_uint64_create(objc_msgSend(v18, "requestID"));
        xpc_array_append_value(v11, v19);

        v20 = xpc_nsobject_create(v18);
        xpc_array_append_value(v12, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  xpc_dictionary_set_value(empty, "_batch_requestIDs", v11);
  xpc_dictionary_set_value(empty, "_batch_requestObjs", v12);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __ProxyTelemetryBatchRequest_block_invoke;
  v29[3] = &unk_24F827DA8;
  v30 = v8;
  v21 = v26;
  v31 = v21;
  v22 = v8;
  objc_msgSend(v28, "sendMessage:replyHandler:", empty, v29);
  v23 = v31;
  v24 = v21;

  return v24;
}

id DispatchTelemetryBatchRequest(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t uint64;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD applier[4];
  id v22;
  id v23;

  v3 = a1;
  v4 = a2;
  uint64 = xpc_dictionary_get_uint64(v4, "requestID");
  xpc_dictionary_get_array(v4, "_batch_requestIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_array(v4, "_batch_requestObjs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", xpc_array_get_count(v6));
  v9 = MEMORY[0x24BDAC760];
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __DispatchTelemetryBatchRequest_block_invoke;
  applier[3] = &unk_24F827DD0;
  v22 = v7;
  v23 = v8;
  v10 = v8;
  v11 = v7;
  xpc_array_apply(v6, applier);
  v12 = -[GTTelemetryRequestBatch initNoRequestID]([GTTelemetryRequestBatch alloc], "initNoRequestID");
  objc_msgSend(v12, "setRequestID:", uint64);
  v13 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v12, "setRequests:", v13);

  gt_xpc_dictionary_create_reply(v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __DispatchTelemetryBatchRequest_block_invoke_2;
  v18[3] = &unk_24F827DF8;
  v19 = v14;
  v20 = v3;
  v15 = v3;
  v16 = v14;
  objc_msgSend(v12, "setCompletionHandler:", v18);

  return v12;
}

uint64_t GTMTLDeviceCapabilitiesSize()
{
  return 0x20000;
}

void *GTMTLDeviceCapabilitiesQuery()
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __GTMTLDeviceCapabilitiesQuery_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &storage;
  if (GTMTLDeviceCapabilitiesQuery_onceToken != -1)
    dispatch_once(&GTMTLDeviceCapabilitiesQuery_onceToken, block);
  return &storage;
}

const char *GTDeviceCapabilities_fromDevice(void *a1)
{
  id v1;
  unint64_t v2;
  const char *v3;
  id v4;
  int v5;

  v1 = a1;
  GTMTLDeviceCapabilitiesQuery();
  if (qword_255C60280)
  {
    v2 = 0;
    v3 = (const char *)&storage;
    while (1)
    {
      objc_msgSend(v1, "name");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = strncmp(v3, (const char *)objc_msgSend(v4, "UTF8String"), 0x80uLL);

      if (!v5)
        break;
      ++v2;
      v3 += 584;
      if (qword_255C60280 <= v2)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v3 = 0;
  }

  return v3;
}

BOOL GTDeviceCapabilities_isAGX(uint64_t a1)
{
  unsigned int v1;

  v1 = *(_DWORD *)(a1 + 520 + *(_QWORD *)(a1 + 520) + 40) - 16777235;
  return (v1 & 7) == 0 && v1 < 3;
}

BOOL GTDeviceCapabilities_isAGX1(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 520 + *(_QWORD *)(a1 + 520);
  return *(_DWORD *)(v1 + 40) == 16777235 && (*(_DWORD *)(v1 + 44) & 0xF) == 1;
}

BOOL GTDeviceCapabilities_isAGX2(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 520 + *(_QWORD *)(a1 + 520);
  return *(_DWORD *)(v1 + 40) == 16777235 && (*(_DWORD *)(v1 + 44) & 0xF) == 2;
}

BOOL GTDeviceCapabilities_isAGX3(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 520 + *(_QWORD *)(a1 + 520);
  return *(_DWORD *)(v1 + 40) == 16777235 && (*(_DWORD *)(v1 + 44) & 0xF) == 3;
}

GTReplayRequestToken *ProxyReplayerBatchRequest(void *a1, void *a2, void *a3, const char *a4, void *a5, uint64_t a6)
{
  id v10;
  id v11;
  GTReplayRequestToken *v12;
  xpc_object_t empty;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  xpc_object_t v22;
  xpc_object_t v23;
  GTReplayRequestToken *v24;
  id v25;
  id v26;
  void *v27;
  GTReplayRequestToken *v28;
  GTReplayRequestToken *v30;
  id v31;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  GTReplayRequestToken *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v34 = a1;
  v10 = a2;
  v11 = a3;
  v31 = a5;
  v33 = v10;
  v12 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", v10, objc_msgSend(v11, "requestID"));
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", a4);
  xpc_dictionary_set_flag(empty, "_flags", 2);
  v30 = v12;
  xpc_dictionary_set_uint64(empty, "requestID", -[GTReplayRequestToken tokenId](v12, "tokenId"));
  xpc_dictionary_set_flag(empty, "flags", 0);
  v14 = xpc_array_create_empty();
  v15 = xpc_array_create_empty();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v11, "requests");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v22 = xpc_uint64_create(objc_msgSend(v21, "requestID"));
        xpc_array_append_value(v14, v22);

        v23 = xpc_nsobject_create(v21);
        xpc_array_append_value(v15, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v18);
  }

  xpc_dictionary_set_value(empty, "_batch_requestIDs", v14);
  xpc_dictionary_set_value(empty, "_batch_requestObjs", v15);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __ProxyReplayerBatchRequest_block_invoke;
  v35[3] = &unk_24F8280D8;
  v36 = v11;
  v24 = v30;
  v37 = v24;
  v38 = v31;
  v39 = a6;
  v25 = v31;
  v26 = v11;
  objc_msgSend(v34, "sendMessage:replyHandler:", empty, v35);
  v27 = v38;
  v28 = v24;

  return v28;
}

id DispatchReplayerBatchRequest(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t uint64;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  char flag;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  char v31;
  _QWORD applier[4];
  id v33;
  id v34;
  id v35;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v10 = a2;
  uint64 = xpc_dictionary_get_uint64(v10, "requestID");
  flag = xpc_dictionary_get_flag(v10, "flags", 0);
  xpc_dictionary_get_array(v10, "_batch_requestIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_array(v10, "_batch_requestObjs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", xpc_array_get_count(v12));
  v15 = MEMORY[0x24BDAC760];
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __DispatchReplayerBatchRequest_block_invoke;
  applier[3] = &unk_24F828100;
  v34 = v14;
  v35 = v9;
  v33 = v13;
  v16 = v14;
  v17 = v9;
  v18 = v13;
  xpc_array_apply(v12, applier);
  v19 = -[GTReplayRequestBatch initNoRequestID]([GTReplayRequestBatch alloc], "initNoRequestID");
  objc_msgSend(v19, "setRequestID:", uint64);
  v20 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v19, "setRequests:", v20);

  gt_xpc_dictionary_create_reply(v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __DispatchReplayerBatchRequest_block_invoke_2;
  v27[3] = &unk_24F828128;
  v31 = flag;
  v28 = v8;
  v29 = v21;
  v30 = v7;
  v22 = v7;
  v23 = v21;
  v24 = v8;
  objc_msgSend(v19, "setCompletionHandler:", v27);

  return v19;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id allServices(void *a1)
{
  return allServicesForDevice(a1, 0);
}

id allServicesForDevice(void *a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a1;
  if (a2)
  {
    objc_msgSend(a2, "uniqueDeviceID");
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  allServicesForDeviceUDID(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id allServicesForDeviceUDID(void *a1, void *a2)
{
  id v3;
  id v4;
  xpc_object_t empty;
  void *v6;
  uint64_t v7;
  void *nsarray;
  uint64_t v10;

  v3 = a1;
  v4 = a2;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", "allServices");
  if (v4)
    xpc_dictionary_set_string(empty, "_device_dest", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  MessageSetHasReply(empty);
  v10 = 0;
  objc_msgSend(v3, "sendMessageWithReplySync:error:", empty, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_opt_class();
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }
  else
  {
    objc_msgSend(v3, "setError:", 0);
    nsarray = 0;
  }

  return nsarray;
}

id filteredArrayByService(void *a1, Protocol *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  NSStringFromProtocol(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "serviceProperties", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "protocolName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

id filteredArrayByPID(void *a1, int a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "processInfo", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "processIdentifier") == a2)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

id filteredArrayByPort(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "serviceProperties", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "servicePort") == a2)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

id newSetWithArrayMinusArray(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDBCEF0];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initWithArray:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v4);
  objc_msgSend(v6, "minusSet:", v7);

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

void xpc_dictionary_set_nsobject(void *a1, const char *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD1618];
    v8 = 0;
    v6 = a1;
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v6, a2, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  }
}

void xpc_dictionary_set_nsdata(void *a1, const char *a2, id a3)
{
  id v5;
  const void *v6;
  size_t v7;
  xpc_object_t xdict;

  if (a3)
  {
    v5 = objc_retainAutorelease(a3);
    xdict = a1;
    v6 = (const void *)objc_msgSend(v5, "bytes");
    v7 = objc_msgSend(v5, "length");

    xpc_dictionary_set_data(xdict, a2, v6, v7);
  }
}

const void *xpc_dictionary_get_nsdata(void *a1, const char *a2)
{
  const void *result;
  const void *v3;
  id v4;
  size_t length;

  length = 0;
  result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    return (const void *)objc_msgSend(v4, "initWithBytes:length:", v3, length);
  }
  return result;
}

const void *xpc_dictionary_get_nsdata_nocopy(void *a1, const char *a2)
{
  const void *result;
  const void *v3;
  id v4;
  size_t length;

  length = 0;
  result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    return (const void *)objc_msgSend(v4, "initWithBytesNoCopy:length:freeWhenDone:", v3, length, 0);
  }
  return result;
}

void *xpc_dictionary_get_nsobject(void *a1, const char *a2, uint64_t a3)
{
  void *nsdata_nocopy;
  void *v5;
  uint64_t v7;

  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy)
    goto LABEL_5;
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, nsdata_nocopy, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsobject_any(void *a1, const char *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t nsobject_classes;

  v2 = (objc_class *)MEMORY[0x24BDBCF20];
  v3 = a1;
  v4 = [v2 alloc];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  nsobject_classes = xpc_dictionary_get_nsobject_classes(v3, a2, v13);

  return nsobject_classes;
}

uint64_t xpc_dictionary_get_nsarray(void *a1, const char *a2, uint64_t a3)
{
  void *nsdata_nocopy;
  uint64_t v5;
  uint64_t v7;

  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedArrayOfObjectsOfClass:fromData:error:", a3, nsdata_nocopy, &v7);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsdictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", a3, a4, nsdata_nocopy, &v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t xpc_dictionary_get_nsobject_classes(void *a1, const char *a2, void *a3)
{
  id v5;
  void *nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  v5 = a3;
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v5, nsdata_nocopy, &v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id xpc_dictionary_get_nsdictionary_any(void *a1, const char *a2)
{
  void *nsobject_any;
  void *v3;
  id v4;

  nsobject_any = (void *)xpc_dictionary_get_nsobject_any(a1, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = nsobject_any;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

const char *xpc_error_string(void *a1)
{
  const char *result;

  result = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  if (!result)
    return "Unknown";
  return result;
}

void xpc_dictionary_set_flag(void *a1, const char *a2, char a3)
{
  uint64_t uint64;
  xpc_object_t xdict;

  xdict = a1;
  uint64 = xpc_dictionary_get_uint64(xdict, a2);
  xpc_dictionary_set_uint64(xdict, a2, uint64 | (1 << a3));

}

uint64_t xpc_dictionary_get_flag(void *a1, const char *a2, char a3)
{
  return (xpc_dictionary_get_uint64(a1, a2) >> a3) & 1;
}

void xpc_dictionary_array_push(void *a1, const char *a2, void *a3)
{
  id v5;
  void *empty;
  xpc_object_t value;

  value = a3;
  v5 = a1;
  xpc_dictionary_get_array(v5, a2);
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (!empty)
    empty = xpc_array_create_empty();
  xpc_array_append_value(empty, value);
  xpc_dictionary_set_value(v5, a2, empty);

}

BOOL xpc_dictionary_string_array_contains(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  xpc_dictionary_get_array(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && MEMORY[0x22E30CF14](v4) == MEMORY[0x24BDACF78])
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __xpc_dictionary_string_array_contains_block_invoke;
    v8[3] = &unk_24F8281D0;
    v8[4] = &v9;
    v8[5] = a3;
    xpc_array_apply(v5, v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __xpc_dictionary_string_array_contains_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  int v5;
  uint64_t result;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr)
    return 1;
  v5 = strcmp(*(const char **)(a1 + 40), string_ptr);
  result = 1;
  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

const void *xpc_array_get_nsdata_nocopy(void *a1, size_t a2)
{
  const void *result;
  const void *v3;
  id v4;
  size_t length;

  length = 0;
  result = xpc_array_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    return (const void *)objc_msgSend(v4, "initWithBytesNoCopy:length:freeWhenDone:", v3, length, 0);
  }
  return result;
}

uint64_t xpc_array_get_nsobject_classes(void *a1, size_t a2, void *a3)
{
  id v5;
  void *nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  v5 = a3;
  nsdata_nocopy = (void *)xpc_array_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v5, nsdata_nocopy, &v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

xpc_object_t xpc_nsobject_create(void *a1)
{
  id v1;
  xpc_object_t v2;
  uint64_t v4;

  if (a1)
  {
    v4 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v1 = objc_retainAutorelease(a1);
  v2 = xpc_data_create((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"));

  return v2;
}

xpc_object_t gt_xpc_dictionary_create_reply(void *a1)
{
  return xpc_dictionary_create_reply(a1);
}

_QWORD *GTUnarchivedObjectOfClassesExpectingClass(uint64_t a1, objc_class *a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", a1, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v4)
      goto LABEL_8;
    if (!*v4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD0FC8];
      v8 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromClass(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Unexpected type when unarchiving response. Expected %@ Received %@"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 9, v13);
      *v4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = v6;
LABEL_8:

  return v4;
}

uint64_t registerService(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _xpc_connection_s *v6;
  xpc_object_t empty;
  GTProcessInfo *v8;
  xpc_object_t v9;
  void *v10;
  const char *string;
  const char *v12;
  void *v13;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = a1;
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, "_cmd", "registerService:forProcess:");
    MessageSetHasReply(empty);
    xpc_dictionary_set_nsobject(empty, "serviceProperties", (uint64_t)v4);
    v8 = objc_alloc_init(GTProcessInfo);
    xpc_dictionary_set_nsobject(empty, "processInfo", (uint64_t)v8);

    v9 = xpc_connection_send_message_with_reply_sync(v6, empty);
    if (MEMORY[0x22E30CF14](v9) != MEMORY[0x24BDACFB8] && MEMORY[0x22E30CF14](v9) == MEMORY[0x24BDACFA0])
    {
      objc_msgSend(v4, "setServicePort:", xpc_dictionary_get_uint64(v9, "servicePort"));
      v10 = (void *)MEMORY[0x24BDD17C8];
      string = xpc_dictionary_get_string(v9, "deviceUDID");
      if (string)
        v12 = string;
      else
        v12 = "";
      objc_msgSend(v10, "stringWithUTF8String:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDeviceUDID:", v13);

      v5 = 1;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

GTLocalXPCConnection *GTTransportServiceDaemonConnectionNew(void *a1)
{
  dispatch_queue_t v1;
  os_log_t v2;
  NSObject *v3;
  xpc_connection_t mach_service;
  GTLocalXPCConnection *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v9[4];
  os_log_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v1 = a1;
  v2 = os_log_create("com.apple.gputools.transport", "ServiceDaemonConnection");
  if (!v1)
    v1 = dispatch_queue_create("com.apple.gputools.defaultMessageProcessing", 0);
  v3 = dispatch_queue_create("com.apple.gputools.localConnection", 0);
  mach_service = xpc_connection_create_mach_service("com.apple.gputools.service", v3, 0);

  v5 = -[GTLocalXPCConnection initWithXPCConnection:messageQueue:]([GTLocalXPCConnection alloc], "initWithXPCConnection:messageQueue:", mach_service, v1);
  objc_initWeak(&location, v5);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __GTTransportServiceDaemonConnectionNew_block_invoke;
  v12[3] = &unk_24F8282C0;
  objc_copyWeak(&v13, &location);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __GTTransportServiceDaemonConnectionNew_block_invoke_2;
  v9[3] = &unk_24F8282E8;
  v10 = v2;
  v7 = v2;
  objc_copyWeak(&v11, &location);
  -[GTLocalXPCConnection activateWithMessageHandler:andErrorHandler:](v5, "activateWithMessageHandler:andErrorHandler:", v12, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v5;
}

id GTTransportServiceDaemonConnectIfVersionNotOlderThan(void *a1, unint64_t a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  dispatch_time_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD block[4];
  id v59;
  NSObject *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v3 = a1;
  v4 = os_log_create("com.apple.gputools.transport", "ConnectionVersioning");
  GTTransportServiceDaemonConnectionNew(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__2;
    v66 = __Block_byref_object_dispose__2;
    v67 = 0;
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __GTTransportServiceDaemonConnectIfVersionNotOlderThan_block_invoke;
    block[3] = &unk_24F8278D0;
    v61 = &v62;
    v8 = v5;
    v59 = v8;
    v9 = v6;
    v60 = v9;
    dispatch_async(v7, block);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("GPUToolsTransportServiceDaemonConnectionTimeout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "doubleForKey:", CFSTR("GPUToolsTransportServiceDaemonConnectionTimeout"));
      v13 = v12;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_6(v4, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      v13 = 2.0;
    }
    v29 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    if (dispatch_group_wait(v9, v29))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_5(v4, v30, v31, v32, v33, v34, v35, v36);
    }
    else
    {
      v37 = (void *)v63[5];
      if (v37)
      {
        filteredArrayByService(v37, (Protocol *)&unk_255D65D88);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "serviceProperties");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "version");

        if (v41 >= a2)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
            GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_4(v4, v50, v51, v52, v53, v54, v55, v56);
          v28 = v8;
        }
        else
        {
          v42 = v4;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_3(v39, a2, v42);

          v28 = 0;
        }

        goto LABEL_24;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_2(v4, v43, v44, v45, v46, v47, v48, v49);
    }
    v28 = 0;
LABEL_24:

    _Block_object_dispose(&v62, 8);
    goto LABEL_25;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_1(v4, v21, v22, v23, v24, v25, v26, v27);
  v28 = 0;
LABEL_25:

  return v28;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22D095000, a1, a3, "Failed to create connection to gputoolsserviced", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22D095000, a1, a3, "No gputoolsserviced on this OS", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serviceProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218240;
  v7 = objc_msgSend(v5, "version");
  v8 = 2048;
  v9 = a2;
  _os_log_debug_impl(&dword_22D095000, a3, OS_LOG_TYPE_DEBUG, "gputoolsserviced is too old (%llu < %llu)", (uint8_t *)&v6, 0x16u);

}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22D095000, a1, a3, "Successfully connected to gputoolsserviced", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22D095000, a1, a3, "Timed out after waiting %gs for gputoolsserviced to respond", a5, a6, a7, a8, 0);
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22D095000, a1, a3, "GPUToolsTransportServiceDaemonConnectionTimeout is %gs [overridden]", a5, a6, a7, a8, 0);
}

id GTCapabilitiesRuntime_serialize(const uint8_t *a1)
{
  uint8_t *v2;
  size_t v3;
  id v4;
  void *v5;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = 2049;
  v9 = 49680;
  v2 = (uint8_t *)malloc_type_calloc(1uLL, 0xC210uLL, 0x2CC67910uLL);
  v3 = compression_encode_buffer(v2, 0xC210uLL, a1, 0xC210uLL, 0, COMPRESSION_LZFSE);
  v7 = 1;
  v8 = 1;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend(v4, "appendBytes:length:", &v8, 4);
  objc_msgSend(v4, "appendBytes:length:", &v7, 4);
  objc_msgSend(v4, "appendBytes:length:", &v10, 8);
  objc_msgSend(v4, "appendBytes:length:", &v9, 8);
  objc_msgSend(v4, "appendBytes:length:", v2, v3);
  free(v2);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

uint8_t *decodeBuffer(const uint8_t *a1, size_t a2, uint64_t a3, size_t a4, size_t a5, apr_pool_t *p)
{
  apr_size_t v10;
  uint8_t *result;
  uint8_t *v12;
  size_t v13;

  if (a4 <= a5)
    v10 = a5;
  else
    v10 = a4;
  result = (uint8_t *)apr_palloc(p, v10);
  if (result)
  {
    v12 = result;
    bzero(result, v10);
    if (a3)
    {
      v13 = compression_decode_buffer(v12, a4, a1, a2, 0, (compression_algorithm)a3);
      result = 0;
      if (v13 != a4)
        return result;
    }
    else
    {
      if (a2 < a4)
        return 0;
      memcpy(v12, a1, a4);
    }
    return v12;
  }
  return result;
}

uint64_t GTCapabilitiesHeapAccelerationStructureInfo_deserialize(void *a1, apr_pool_t *a2, _BYTE *a3)
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD v14[2];

  v14[0] = 0;
  v14[1] = 0;
  if (a3)
    *a3 = 0;
  v5 = a1;
  v6 = objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");

  if (v6 <= 3
    || (v9 = *(_DWORD *)v8, *(_DWORD *)v8 >= 2u)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || (v6 & 0xFFFFFFFFFFFFFFF0) == 0x10)
  {
LABEL_8:
    if (a3)
    {
      result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  v11 = *(_QWORD *)(v8 + 16);
  if (v11)
  {
    v12 = *(_QWORD *)(v8 + 24);
    v13 = (char *)decodeBuffer((const uint8_t *)(v8 + 32), v6 - 32, *(_QWORD *)(v8 + 8), v12 * v11, v12 * v11, a2);
    if (v13)
    {
      GTCapabilitiesHeapAccelerationStructureInfo_deserializeFromBuffer(v13, (uint64_t)v14, v12, v11, v9, a3, a2);
      return v14[0];
    }
    goto LABEL_8;
  }
  return 0;
}

char *GTCapabilitiesHeapAccelerationStructureInfo_deserializeFromBuffer(char *result, uint64_t a2, unint64_t a3, uint64_t a4, int a5, _BYTE *a6, apr_pool_t *p)
{
  char *v11;
  size_t v12;
  char *v13;
  size_t v14;
  char *v15;
  uint64_t v16;

  if (a5 == 1 && (v11 = result, v12 = 24 * a4, (result = (char *)apr_palloc(p, 24 * a4)) != 0))
  {
    v13 = result;
    bzero(result, v12);
    if (a3 >= 0x18)
      v14 = 24;
    else
      v14 = a3;
    v15 = v13;
    v16 = a4;
    do
    {
      result = (char *)memcpy(v15, v11, v14);
      v15 += 24;
      v11 += a3;
      --v16;
    }
    while (v16);
    *(_QWORD *)a2 = v13;
    *(_DWORD *)(a2 + 8) = a4;
  }
  else if (a6)
  {
    *a6 = 1;
  }
  return result;
}

uint64_t GTCapabilitiesHeapTextureInfo_deserialize(void *a1, apr_pool_t *a2, _BYTE *a3)
{
  id v5;
  unint64_t v6;
  id v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD v15[2];

  v15[0] = 0;
  v15[1] = 0;
  if (a3)
    *a3 = 0;
  v5 = a1;
  v6 = objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  v8 = (unsigned int *)objc_msgSend(v7, "bytes");

  if (v6 <= 3
    || (v9 = *v8, v9 >= 2)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || v6 - 16 <= 0x17)
  {
LABEL_8:
    if (a3)
    {
      result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  v11 = *((_QWORD *)v8 + 2);
  if (v11)
  {
    v12 = *((_QWORD *)v8 + 3);
    v13 = *((_QWORD *)v8 + 4);
    v14 = (char *)decodeBuffer((const uint8_t *)v8 + 40, v6 - 40, *((_QWORD *)v8 + 1), (v13 + v12) * v11, (v13 + v12) * v11, a2);
    if (v14)
    {
      GTCapabilitiesHeapTextureInfo_deserializeFromBuffer(v14, (uint64_t)v15, v12, v13, v11, v9, a3, a2);
      return v15[0];
    }
    goto LABEL_8;
  }
  return 0;
}

void GTCapabilitiesHeapTextureInfo_deserializeFromBuffer(char *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, _BYTE *a7, apr_pool_t *p)
{
  size_t v14;
  _QWORD *v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  apr_size_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  char *v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  _BYTE *v39;
  char *v40;
  _OWORD v42[14];
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  if (a6 != 1 || (v14 = 24 * a5, (v15 = apr_palloc(p, 24 * a5)) == 0))
  {
    v21 = 0;
    if (!a7)
      return;
    goto LABEL_35;
  }
  v16 = v15;
  v38 = a2;
  v39 = a7;
  bzero(v15, v14);
  if (a3 >= 0x10)
    v17 = 16;
  else
    v17 = a3;
  v18 = 1;
  v19 = a1;
  v20 = a5;
  do
  {
    memcpy(&v16[v18], v19, v17);
    v18 += 3;
    v19 += a3;
    --v20;
  }
  while (v20);
  v21 = 0;
  v22 = 0;
  v40 = &a1[a5 * a3];
  while (1)
  {
    v23 = 0;
    v24 = 0;
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v43 = 0;
    v45 = 0u;
    memset(v42, 0, sizeof(v42));
    v44 = 56;
    do
    {
      v24 += (*(_QWORD *)((char *)v42 + v23) + 7) & 0xFFFFFFFFFFFFFFF8;
      v23 += 8;
    }
    while (v23 != 424);
    v25 = (char *)apr_palloc(p, v24);
    if (!v25)
      break;
    v26 = v25;
    v27 = &v40[v22 * a4];
    bzero(v25, v24);
    v28 = 0;
    v29 = v26;
    do
    {
      if (((*(_QWORD *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8) != 0)
        v30 = v29;
      else
        v30 = 0;
      v29 += (*(_QWORD *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8;
      *(_QWORD *)((char *)v42 + v28) = v30;
      v28 += 8;
    }
    while (v28 != 424);
    v31 = v44;
    v44 += 56;
    *(_QWORD *)(v31 + 48) = 512;
    *(_OWORD *)v31 = GTMTLTextureDescriptorDefaults;
    *(_OWORD *)(v31 + 16) = unk_22D0CE240;
    *(_OWORD *)(v31 + 32) = xmmword_22D0CE250;
    v32 = *(_DWORD *)v27;
    *(_BYTE *)(v31 + 49) = *((_QWORD *)v27 + 1);
    *(_WORD *)(v31 + 34) = *((_QWORD *)v27 + 2);
    *(_DWORD *)(v31 + 24) = *((_QWORD *)v27 + 3);
    *(_WORD *)(v31 + 32) = *((_QWORD *)v27 + 4);
    *(_WORD *)(v31 + 30) = *((_QWORD *)v27 + 5);
    *(_BYTE *)(v31 + 45) = *((_QWORD *)v27 + 6);
    *(_BYTE *)(v31 + 47) = *((_QWORD *)v27 + 7);
    *(_WORD *)(v31 + 28) = *((_QWORD *)v27 + 8);
    v33 = 72;
    if (v32 < 3)
      v33 = 80;
    v34 = &v27[v33];
    *(_BYTE *)(v31 + 43) = *(_QWORD *)v34;
    *(_BYTE *)(v31 + 44) = *((_QWORD *)v34 + 1);
    if (v32)
    {
      *(_DWORD *)(v31 + 20) = *((_QWORD *)v34 + 2);
      if (v32 <= 3)
      {
        if (v32 == 3)
          *(_WORD *)(v31 + 36) = *((_WORD *)v34 + 16) | (16 * *((_WORD *)v34 + 12));
      }
      else
      {
        v35 = v34[24];
        *(_BYTE *)(v31 + 46) = v35;
        v36 = *((_DWORD *)v34 + 10);
        v37 = v36 | (16 * *((_DWORD *)v34 + 8));
        *(_WORD *)(v31 + 36) = v36 | (16 * *((_WORD *)v34 + 16));
        if (v32 >= 0x15)
        {
          *(_BYTE *)(v31 + 38) = *((_QWORD *)v34 + 6);
          *(_BYTE *)(v31 + 40) = *((_QWORD *)v34 + 7);
          if (v32 != 21)
          {
            *(_QWORD *)(v31 + 8) = *((_QWORD *)v34 + 8);
            *(_BYTE *)(v31 + 42) = *((_QWORD *)v34 + 9);
            if (v32 >= 0x23)
            {
              *(_DWORD *)(v31 + 16) = v34[80] | (unsigned __int16)(*((_DWORD *)v34 + 22) << 8) | (*((_DWORD *)v34 + 24) << 16) | (*((_DWORD *)v34 + 26) << 24);
              if (v32 >= 0x27)
              {
                *(_DWORD *)(v31 + 16) = *((_QWORD *)v34 + 14);
                if (v32 >= 0x2A)
                {
                  *(_WORD *)(v31 + 36) = v37 | (*((_WORD *)v34 + 60) << 8);
                  *(_QWORD *)v31 = *((_QWORD *)v34 + 16);
                  *(_BYTE *)(v31 + 48) = *((_QWORD *)v34 + 17);
                  *(_BYTE *)(v31 + 50) = *((_QWORD *)v34 + 18);
                  if (v32 >= 0x31)
                  {
                    *(_BYTE *)(v31 + 41) = *((_QWORD *)v34 + 19);
                    *(_BYTE *)(v31 + 39) = *((_QWORD *)v34 + 20);
                  }
                }
              }
            }
          }
        }
        if (v35 == 255)
          *(_BYTE *)(v31 + 46) = 0;
      }
    }
    v16[3 * v22++] = v26;
    v21 = v22 >= a5;
    if (v22 == a5)
    {
      *(_QWORD *)v38 = v16;
      *(_DWORD *)(v38 + 8) = a5;
      return;
    }
  }
  a7 = v39;
  if (v39)
  {
LABEL_35:
    if (!v21)
      *a7 = 1;
  }
}

char *GTCapabilitiesRuntime_fromDeviceSafe(void *a1, apr_pool_t *a2)
{
  id v3;
  char *v4;
  char *v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  mach_port_t v11;
  const __CFDictionary *v12;
  io_service_t MatchingService;
  kern_return_t v14;
  BOOL v15;
  kern_return_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  char v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  __int16 v121;
  char *v122;
  char *v123;
  __int128 outputStruct;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  size_t outputStructCnt;
  io_connect_t connect;

  v3 = a1;
  v4 = (char *)apr_palloc(a2, 0xC210uLL);
  v5 = v4;
  v6 = v4 + 49408;
  if (v4)
    bzero(v4, 0xC210uLL);
  v7 = v3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "name");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    snprintf(v5 + 49152, 0x100uLL, "%s", (const char *)objc_msgSend(v9, "UTF8String"));

    objc_msgSend(v8, "targetDeviceArchitecture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v6 = objc_msgSend(v10, "cpuType");
    *((_DWORD *)v6 + 1) = objc_msgSend(v10, "subType");
    *((_WORD *)v6 + 4) = objc_msgSend(v10, "version");
    v6[10] = objc_msgSend(v10, "version") >> 16;
    v6[11] = objc_msgSend(v10, "version") >> 24;
    *((_DWORD *)v6 + 3) = objc_msgSend(v10, "versionCombined");
    *((_QWORD *)v6 + 2) = objc_msgSend(v10, "driverVersion");

    if (*(_DWORD *)v6 == 16777235)
    {
      *((_OWORD *)v5 + 3090) = 0u;
      v11 = *MEMORY[0x24BDD8B18];
      v12 = IOServiceMatching("AGXAccelerator");
      MatchingService = IOServiceGetMatchingService(v11, v12);
      if (MatchingService)
      {
        connect = 0;
        v14 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 1u, &connect);
        v15 = 0;
        if (!v14)
        {
          outputStruct = 0uLL;
          outputStructCnt = 16;
          v16 = IOConnectCallStructMethod(connect, 0x10Au, 0, 0, &outputStruct, &outputStructCnt);
          v15 = v16 == 0;
          if (!v16)
            *((_OWORD *)v5 + 3090) = outputStruct;
        }
      }
      else
      {
        v15 = 0;
      }
      v6[268] = v15;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      for (i = 0; i != 9; ++i)
        v5[i + 49497] = objc_msgSend(v8, "supportsFamily:", i + 1001);
      v6[98] = objc_msgSend(v8, "supportsFamily:", 2002);
      v18 = 0;
      v6[99] = objc_msgSend(v8, "supportsFamily:", 2003);
      do
      {
        v5[v18 + 49508] = objc_msgSend(v8, "supportsFamily:", v18 + 3001);
        ++v18;
      }
      while (v18 != 3);
      v6[103] = objc_msgSend(v8, "supportsFamily:", 5001);
    }
    *((_QWORD *)v6 + 3) = -1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_QWORD *)v6 + 6) = objc_msgSend(v8, "maxThreadgroupMemoryLength");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      outputStruct = 0uLL;
      *(_QWORD *)&v126 = 0;
      objc_msgSend(v8, "maxThreadsPerThreadgroup");
      v19 = v126;
      *(_OWORD *)(v6 + 56) = outputStruct;
      *((_QWORD *)v6 + 9) = v19;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_QWORD *)v6 + 10) = objc_msgSend(v8, "maxBufferLength");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = objc_msgSend(v8, "supportsLateEvalEvent");
    else
      v20 = 0;
    v6[213] = v20;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = objc_msgSend(v8, "supportsRaytracing");
    else
      v21 = 0;
    v6[215] = v21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = objc_msgSend(v8, "supportsTileShaders");
    else
      v22 = 0;
    v6[214] = v22;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = objc_msgSend(v8, "supportsMeshShaders");
    else
      v23 = 0;
    v6[216] = v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = objc_msgSend(v8, "isMsaa32bSupported");
    else
      v24 = 0;
    v6[142] = v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = objc_msgSend(v8, "supportsBufferWithIOSurface");
    else
      v25 = 0;
    v6[219] = v25;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = objc_msgSend(v8, "supportsBGR10A2");
    else
      v26 = 0;
    v6[155] = v26;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = objc_msgSend(v8, "supportsSparseHeaps");
    else
      v27 = 0;
    v6[223] = v27;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = objc_msgSend(v8, "supportsSparseTextures");
    else
      v28 = 0;
    v6[224] = v28;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = objc_msgSend(v8, "supportsPlacementHeaps");
    else
      v29 = 0;
    v6[222] = v29;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = objc_msgSend(v8, "supportsComputeMemoryBarrier");
    else
      v30 = 0;
    v6[206] = v30;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = objc_msgSend(v8, "supportsRenderMemoryBarrier");
    else
      v31 = 0;
    v6[207] = v31;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = objc_msgSend(v8, "supportsPartialRenderMemoryBarrier");
    else
      v32 = 0;
    v6[208] = v32;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      for (j = 0; j != 16; ++j)
        v5[j + 49593] = objc_msgSend(v8, "supportsVertexAmplificationCount:", j);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      for (k = 0; k != 32; ++k)
        v5[k + 49512] = objc_msgSend(v8, "supportsTextureSampleCount:", k);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      for (m = 0; m != 16; ++m)
        v5[m + 49577] = objc_msgSend(v8, "supportsRasterizationRateMapWithLayerCount:", m);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v36 = objc_msgSend(v8, "supportsProgrammableSamplePositions");
    else
      v36 = 0;
    v6[168] = v36;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v37 = objc_msgSend(v8, "supportsGFXIndirectCommandBuffers");
    else
      v37 = 0;
    v6[209] = v37;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v38 = objc_msgSend(v8, "supportsCMPIndirectCommandBuffers");
    else
      v38 = 0;
    v6[210] = v38;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v39 = objc_msgSend(v8, "supportsIndirectDrawAndDispatch");
    else
      v39 = 0;
    v6[212] = v39;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v40 = objc_msgSend(v8, "supportsMeshShadersInICB");
    else
      v40 = 0;
    v6[211] = v40;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v41 = objc_msgSend(v8, "supportsMemorylessRenderTargets");
    else
      v41 = 0;
    v6[137] = v41;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v42 = objc_msgSend(v8, "supportsRenderTargetTextureRotation");
    else
      v42 = 0;
    v6[140] = v42;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v43 = objc_msgSend(v8, "supportsNonUniformThreadgroupSize");
    else
      v43 = 0;
    v6[217] = v43;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v44 = objc_msgSend(v8, "supportsArgumentBuffersTier2");
    else
      v44 = 0;
    v6[136] = v44;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v45 = objc_msgSend(v8, "supportsConcurrentComputeDispatch");
    else
      v45 = 0;
    v6[218] = v45;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v46 = objc_msgSend(v8, "supportsSharedStorageHeapResources");
    else
      v46 = 0;
    v6[221] = v46;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v47 = objc_msgSend(v8, "supportsSharedStorageTextures");
    else
      v47 = 0;
    v6[138] = v47;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v48 = objc_msgSend(v8, "supportsSharedTextureHandles");
    else
      v48 = 0;
    v6[139] = v48;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v49 = objc_msgSend(v8, "supportsDynamicAttributeStride");
    else
      v49 = 0;
    v6[227] = v49;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v50 = objc_msgSend(v8, "supportsNonSquareTileShaders");
    else
      v50 = 0;
    v6[228] = v50;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v51 = objc_msgSend(v8, "supportsLayeredRendering");
    else
      v51 = 0;
    v6[229] = v51;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v52 = objc_msgSend(v8, "supportsViewportAndScissorArray");
    else
      v52 = 0;
    v6[230] = v52;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v53 = objc_msgSend(v8, "supportsLinearTextureFromSharedBuffer");
    else
      v53 = 0;
    v6[143] = v53;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v54 = objc_msgSend(v8, "supportsNonPrivateDepthStencilTextures");
    else
      v54 = 0;
    v6[144] = v54;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v55 = objc_msgSend(v8, "supportsRenderToLinearTextures");
    else
      v55 = 0;
    v6[145] = v55;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v56 = objc_msgSend(v8, "supportsSeparateDepthStencil");
    else
      v56 = 0;
    v6[147] = v56;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v57 = objc_msgSend(v8, "supportsRelaxedTextureViewRequirements");
    else
      v57 = 0;
    v6[148] = v57;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v58 = objc_msgSend(v8, "supportsVariableRateRasterization");
    else
      v58 = 0;
    v6[238] = v58;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v59 = objc_msgSend(v8, "supportsExtendedVertexFormats");
    else
      v59 = 0;
    v6[231] = v59;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v60 = objc_msgSend(v8, "supportsFunctionPointers");
    else
      v60 = 0;
    v6[203] = v60;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v61 = objc_msgSend(v8, "supportsFunctionPointersFromRender");
    else
      v61 = 0;
    v6[204] = v61;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v62 = objc_msgSend(v8, "supportsFunctionPointersFromMesh");
    else
      v62 = 0;
    v6[205] = v62;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v63 = objc_msgSend(v8, "supportsDynamicLibraries");
    else
      v63 = 0;
    v6[201] = v63;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v64 = objc_msgSend(v8, "supportsRenderDynamicLibraries");
    else
      v64 = 0;
    v6[202] = v64;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v65 = objc_msgSend(v8, "supportsDepthClipMode");
    else
      v65 = 0;
    v6[239] = v65;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v66 = objc_msgSend(v8, "supportsDepthClipModeClampExtended");
    else
      v66 = 0;
    v6[240] = v66;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v67 = objc_msgSend(v8, "supportsSparseDepthAttachments");
    else
      v67 = 0;
    v6[225] = v67;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v68 = objc_msgSend(v8, "supportsLossyCompression");
    else
      v68 = 0;
    v6[146] = v68;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v69 = objc_msgSend(v8, "supportsTextureSwizzle");
    else
      v69 = 0;
    v6[149] = v69;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v70 = objc_msgSend(v8, "supportsTextureCubeArray");
    else
      v70 = 0;
    v6[150] = v70;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v71 = objc_msgSend(v8, "supportsTexture2DMultisampleArray");
    else
      v71 = 0;
    v6[151] = v71;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v72 = objc_msgSend(v8, "supportsLinearTexture2DArray");
    else
      v72 = 0;
    v6[152] = v72;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v73 = objc_msgSend(v8, "supports2DLinearTexArraySPI");
    else
      v73 = 0;
    v6[153] = v73;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v74 = objc_msgSend(v8, "supportsRGBA10A2Gamma");
    else
      v74 = 0;
    v6[154] = v74;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v75 = objc_msgSend(v8, "supportsBGR10A2");
    else
      v75 = 0;
    v6[155] = v75;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v76 = objc_msgSend(v8, "supportsSRGBwrites");
    else
      v76 = 0;
    v6[156] = v76;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v77 = objc_msgSend(v8, "supportsBfloat16Format");
    else
      v77 = 0;
    v6[157] = v77;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v78 = objc_msgSend(v8, "supportsSamplerAddressModeClampToHalfBorder");
    else
      v78 = 0;
    v6[233] = v78;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v79 = objc_msgSend(v8, "supportsCustomBorderColor");
    else
      v79 = 0;
    v6[234] = v79;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v80 = objc_msgSend(v8, "supportsSamplerCompareFunction");
    else
      v80 = 0;
    v6[235] = v80;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v81 = objc_msgSend(v8, "supportsBlackOrWhiteSamplerBorderColors");
    else
      v81 = 0;
    v6[236] = v81;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v82 = objc_msgSend(v8, "supportsMirrorClampToEdgeSamplerMode");
    else
      v82 = 0;
    v6[237] = v82;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v83 = objc_msgSend(v8, "supportsPrimitiveMotionBlur");
    else
      v83 = 0;
    v6[158] = v83;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v84 = objc_msgSend(v8, "supportsRayTracingICBs");
    else
      v84 = 0;
    v6[159] = v84;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v85 = objc_msgSend(v8, "supportsRayTracingExtendedVertexFormats");
    else
      v85 = 0;
    v6[160] = v85;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v86 = objc_msgSend(v8, "supportsHeapAccelerationStructureAllocation");
    else
      v86 = 0;
    v6[226] = v86;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v87 = objc_msgSend(v8, "supportsRayTracingPerPrimitiveData");
    else
      v87 = 0;
    v6[161] = v87;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v88 = objc_msgSend(v8, "supportsRayTracingBuffersFromTables");
    else
      v88 = 0;
    v6[162] = v88;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v89 = objc_msgSend(v8, "supportsRayTracingAccelerationStructureCPUDeserialization");
    else
      v89 = 0;
    v6[163] = v89;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v90 = objc_msgSend(v8, "supportsRayTracingMultiLevelInstancing");
    else
      v90 = 0;
    v6[164] = v90;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v91 = objc_msgSend(v8, "supportsRayTracingIndirectInstanceAccelerationStructureBuild");
    else
      v91 = 0;
    v6[165] = v91;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v92 = objc_msgSend(v8, "supportsRayTracingGPUTableUpdateBuffers");
    else
      v92 = 0;
    v6[166] = v92;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v93 = objc_msgSend(v8, "supportsRayTracingCurves");
    else
      v93 = 0;
    v6[167] = v93;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v94 = objc_msgSend(v8, "supportsBCTextureCompression");
    else
      v94 = 0;
    v6[241] = v94;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v95 = objc_msgSend(v8, "supports3DBCTextures");
    else
      v95 = 0;
    v6[242] = v95;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v96 = objc_msgSend(v8, "supportsMSAADepthResolve");
    else
      v96 = 0;
    v6[243] = v96;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v97 = objc_msgSend(v8, "supportsMSAAStencilResolve");
    else
      v97 = 0;
    v6[244] = v97;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v98 = objc_msgSend(v8, "supportsMSAADepthResolveFilter");
    else
      v98 = 0;
    v6[245] = v98;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v99 = objc_msgSend(v8, "supports32bpcMSAATextures");
    else
      v99 = 0;
    v6[246] = v99;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v100 = objc_msgSend(v8, "supports32BitMSAA");
    else
      v100 = 0;
    v6[247] = v100;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v101 = objc_msgSend(v8, "supportsNonPrivateMSAATextures");
    else
      v101 = 0;
    v6[248] = v101;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v102 = objc_msgSend(v8, "supportsCombinedMSAAStoreAndResolveAction");
    else
      v102 = 0;
    v6[249] = v102;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v103 = objc_msgSend(v8, "supportsMSAAStencilResolveFilter");
    else
      v103 = 0;
    v6[250] = v103;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v104 = objc_msgSend(v8, "supportsASTCTextureCompression");
    else
      v104 = 0;
    v6[251] = v104;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v105 = objc_msgSend(v8, "supports3DASTCTextures");
    else
      v105 = 0;
    v6[252] = v105;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v106 = objc_msgSend(v8, "supportsASTCHDRTextureCompression");
    else
      v106 = 0;
    v6[253] = v106;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v107 = objc_msgSend(v8, "supportsLimitedYUVFormats");
    else
      v107 = 0;
    v6[254] = v107;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v108 = objc_msgSend(v8, "supportsExtendedYUVFormats");
    else
      v108 = 0;
    v6[255] = v108;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v109 = objc_msgSend(v8, "supportsAlphaYUVFormats");
    else
      v109 = 0;
    v6[256] = v109;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v110 = objc_msgSend(v8, "supportsYCBCRFormats");
    else
      v110 = 0;
    v6[257] = v110;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v111 = objc_msgSend(v8, "supportsYCBCRFormatsPQ");
    else
      v111 = 0;
    v6[258] = v111;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v112 = objc_msgSend(v8, "supportsYCBCRFormats12");
    else
      v112 = 0;
    v6[259] = v112;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v113 = objc_msgSend(v8, "supportsYCBCRFormatsXR");
    else
      v113 = 0;
    v6[260] = v113;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v114 = objc_msgSend(v8, "supportsYCBCRPackedFormatsPQ");
    else
      v114 = 0;
    v6[261] = v114;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v115 = objc_msgSend(v8, "supportsYCBCRPackedFormats12");
    else
      v115 = 0;
    v6[262] = v115;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v116 = objc_msgSend(v8, "supportsYCBCRPackedFormatsXR");
    else
      v116 = 0;
    v6[263] = v116;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v117 = objc_msgSend(v8, "supportsPublicXR10Formats");
    else
      v117 = 0;
    v6[264] = v117;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v118 = objc_msgSend(v8, "supportsExtendedXR10Formats");
    else
      v118 = 0;
    v119 = 0;
    v6[265] = v118;
    do
    {
      v120 = (unsigned __int16)word_22D0CE268[v119];
      v128 = 0;
      v126 = 0u;
      v127 = 0u;
      outputStruct = 0u;
      MTLPixelFormatGetInfoForDevice();
      v121 = WORD4(outputStruct);
      v122 = &v5[12 * v120];
      *(_DWORD *)v122 = DWORD2(outputStruct);
      *((_WORD *)v122 + 2) = v120;
      if ((v121 & 0x400) == 0)
        *(_WORD *)&v5[12 * v120 + 6] = BYTE1(v127);
      if ((v121 & 0x461) == 1)
      {
        v123 = &v5[12 * v120];
        *((_WORD *)v123 + 4) = objc_msgSend(v8, "minimumLinearTextureAlignmentForPixelFormat:", v120);
        *((_WORD *)v123 + 5) = objc_msgSend(v8, "minimumTextureBufferAlignmentForPixelFormat:", v120);
      }
      ++v119;
    }
    while (v119 != 275);
    v6[267] = objc_msgSend(MEMORY[0x24BDDDAD0], "supportsDevice:", v8);
    v6[266] = objc_msgSend(MEMORY[0x24BDDDAD8], "supportsDevice:", v8);
  }
  else
  {
    v6[88] = 1;
  }

  return v5;
}

uint64_t GTCapabilitiesRuntime_heapTextureInfoCompatible(uint64_t *a1, uint64_t a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v21;
  id v23;

  v23 = a3;
  v5 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = *a1;
      v10 = *(_QWORD *)(*a1 + v6);
      if ((*(_BYTE *)(a2 + 12 * *(unsigned __int16 *)(v10 + 34)) & 1) != 0)
      {
        v11 = (objc_class *)MEMORY[0x24BDDD740];
        v12 = v23;
        v13 = objc_alloc_init(v11);
        objc_msgSend(v13, "setTextureType:", *(unsigned __int8 *)(v10 + 49));
        objc_msgSend(v13, "setPixelFormat:", *(unsigned __int16 *)(v10 + 34));
        objc_msgSend(v13, "setWidth:", *(unsigned int *)(v10 + 24));
        objc_msgSend(v13, "setHeight:", *(unsigned __int16 *)(v10 + 32));
        objc_msgSend(v13, "setDepth:", *(unsigned __int16 *)(v10 + 30));
        objc_msgSend(v13, "setMipmapLevelCount:", *(unsigned __int8 *)(v10 + 45));
        objc_msgSend(v13, "setSampleCount:", *(unsigned __int8 *)(v10 + 47));
        objc_msgSend(v13, "setArrayLength:", *(unsigned __int16 *)(v10 + 28));
        objc_msgSend(v13, "setUsage:", *(unsigned int *)(v10 + 20));
        objc_msgSend(v13, "setResourceOptions:", *(unsigned __int16 *)(v10 + 36));
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setSwizzleKey:", *(unsigned int *)(v10 + 16));
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setRotation:", *(unsigned __int8 *)(v10 + 46));
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setAllowGPUOptimizedContents:", *(_BYTE *)(v10 + 38) != 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setSparseSurfaceDefaultValue:", *(unsigned __int8 *)(v10 + 48));
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setWriteSwizzleEnabled:", *(_BYTE *)(v10 + 50) != 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "setCompressionType:", *(unsigned __int8 *)(v10 + 41));
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "setLossyCompressionMode:", *(unsigned __int8 *)(v10 + 41));
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setCompressionFootprint:", *(unsigned __int8 *)(v10 + 39));
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setCompressionMode:", *(unsigned __int8 *)(v10 + 40));
        objc_msgSend(v13, "setAllowGPUOptimizedContents:", *(_BYTE *)(v10 + 38) != 0);
        objc_msgSend(v13, "setFramebufferOnly:", *(_BYTE *)(v10 + 43) != 0);
        objc_msgSend(v13, "setIsDrawable:", *(_BYTE *)(v10 + 44) != 0);
        v14 = objc_msgSend(v12, "heapTextureSizeAndAlignWithDescriptor:", v13);
        v16 = v15;

        v17 = v9 + v6;
        v18 = *(_QWORD *)(v9 + v6 + 8);
        v19 = *(_QWORD *)(v17 + 16);

        v21 = v18 >= v16 && v19 <= v14;
        v8 &= v21;
        v5 = *((unsigned int *)a1 + 2);
      }
      ++v7;
      v6 += 24;
    }
    while (v7 < v5);
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

uint64_t GTCapabilitiesRuntime_heapAccelerationStructureInfoCompatible(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  _QWORD *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;

  v5 = a3;
  if (*(_BYTE *)(a2 + 49623) && *(_DWORD *)(a1 + 8))
  {
    v6 = 0;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = (_QWORD *)(*(_QWORD *)a1 + v6);
      if (v9[2] > (unint64_t)objc_msgSend(v5, "heapAccelerationStructureSizeAndAlignWithSize:", *v9))
        v11 = 0;
      else
        v11 = v8;
      if (v9[1] >= v10)
        v8 = v11;
      else
        v8 = 0;
      ++v7;
      v6 += 24;
    }
    while (v7 < *(unsigned int *)(a1 + 8));
    v12 = v8 & 1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

vm_address_t GTCoreAlloc(memory_object_size_t a1)
{
  vm_map_t *v2;
  kern_return_t memory_entry_64;
  mach_error_t v4;
  char *v5;
  NSObject *v6;
  const char *v7;
  kern_return_t v8;
  mach_error_t v9;
  char *v11;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  address = 0;
  object_handle = 0;
  size = a1;
  v2 = (vm_map_t *)MEMORY[0x24BDAEC58];
  memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x24BDAEC58], &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    v4 = memory_entry_64;
    gt_default_log();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v5 = mach_error_string(v4);
      *(_DWORD *)buf = 67109378;
      v16 = v4;
      v17 = 2080;
      v18 = v5;
      v6 = MEMORY[0x24BDACB70];
      v7 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl(&dword_22D095000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
    }
  }
  else
  {
    v8 = vm_map(*v2, &address, a1, 0, 1, object_handle, 0, 0, 3, 3, 1u);
    if (!v8)
    {
      mach_port_deallocate(*v2, object_handle);
      return address;
    }
    v9 = v8;
    gt_default_log();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v11 = mach_error_string(v9);
      *(_DWORD *)buf = 67109378;
      v16 = v9;
      v17 = 2080;
      v18 = v11;
      v6 = MEMORY[0x24BDACB70];
      v7 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }
  return 0;
}

uint64_t atomic_cleanup(uint64_t a1)
{
  if (hash_mutex == a1)
    hash_mutex = 0;
  return 0;
}

void apr_pool_destroy(apr_pool_t *p)
{
  apr_exit_why_e *v1;
  apr_wait_how_e v2;
  uint64_t i;
  apr_pool_t *v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  BOOL v11;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t **v20;
  unint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v31;
  unint64_t v32;
  unsigned int *v33;
  uint64_t *v34;
  __int128 v35;

  for (i = *((_QWORD *)p + 14); i; i = *((_QWORD *)p + 14))
  {
    *((_QWORD *)p + 14) = *(_QWORD *)i;
    (*(void (**)(_QWORD))(i + 16))(*(_QWORD *)(i + 8));
  }
  *((_QWORD *)p + 14) = 0;
  while (1)
  {
    v5 = (apr_pool_t *)*((_QWORD *)p + 1);
    if (!v5)
      break;
    apr_pool_destroy(v5);
  }
  while (1)
  {
    v6 = *((_QWORD *)p + 4);
    if (!v6)
      break;
    *((_QWORD *)p + 4) = *(_QWORD *)v6;
    (*(void (**)(_QWORD))(v6 + 16))(*(_QWORD *)(v6 + 8));
  }
  v7 = (unsigned int *)*((_QWORD *)p + 7);
  if (!v7)
    goto LABEL_42;
  v8 = *((_QWORD *)p + 7);
  do
  {
    if (apr_proc_wait(*(apr_proc_t **)v8, (int *)1, v1, v2) != 70006)
      *(_DWORD *)(v8 + 8) = 0;
    v8 = *(_QWORD *)(v8 + 16);
  }
  while (v8);
  v9 = v7;
  do
  {
    v10 = v9[2];
    if (v10 == 1)
    {
      apr_proc_kill((apr_proc_t *)**(unsigned int **)v9, 9);
    }
    else
    {
      v11 = v10 == 4 || v10 == 2;
      if (v11 && !apr_proc_kill((apr_proc_t *)**(unsigned int **)v9, 15))
        LODWORD(v8) = 1;
    }
    v9 = (unsigned int *)*((_QWORD *)v9 + 2);
  }
  while (v9);
  v12 = v7;
  if (!(_DWORD)v8)
    goto LABEL_36;
  v35 = xmmword_22D0CE1D0;
  select(0, 0, 0, 0, (timeval *)&v35);
  v13 = 46875;
  while (2)
  {
    v14 = 0;
    v15 = v7;
    do
    {
      v16 = v14;
      if (v15[2] == 2)
      {
        v14 = 1;
        if (apr_proc_wait(*(apr_proc_t **)v15, (int *)1, v1, v2) == 70006)
          goto LABEL_31;
        v15[2] = 0;
      }
      v14 = v16;
LABEL_31:
      v15 = (unsigned int *)*((_QWORD *)v15 + 2);
    }
    while (v15);
    if ((_DWORD)v14 && v13 <= 0x2DC6BF)
    {
      *(_QWORD *)&v35 = v13 / 0xF4240;
      *((_QWORD *)&v35 + 1) = v13 % 0xF4240;
      select(0, 0, 0, 0, (timeval *)&v35);
      v13 *= 2;
      continue;
    }
    break;
  }
  v12 = v7;
  do
  {
LABEL_36:
    if (v12[2] == 2)
      apr_proc_kill((apr_proc_t *)**(unsigned int **)v12, 9);
    v12 = (unsigned int *)*((_QWORD *)v12 + 2);
  }
  while (v12);
  do
  {
    if (v7[2])
      apr_proc_wait(*(apr_proc_t **)v7, 0, v1, v2);
    v7 = (unsigned int *)*((_QWORD *)v7 + 2);
  }
  while (v7);
LABEL_42:
  if (*(_QWORD *)p)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)p + 48) + 24);
    if (v17)
      pthread_mutex_lock((pthread_mutex_t *)(v17 + 8));
    v18 = *((_QWORD *)p + 2);
    **((_QWORD **)p + 3) = v18;
    if (v18)
      *(_QWORD *)(*((_QWORD *)p + 2) + 24) = *((_QWORD *)p + 3);
    if (v17)
      pthread_mutex_unlock((pthread_mutex_t *)(v17 + 8));
  }
  v19 = (unint64_t *)*((_QWORD *)p + 6);
  v20 = (uint64_t **)*((_QWORD *)p + 12);
  *v20[1] = 0;
  if ((apr_pool_t *)v19[4] == p)
  {
    v19[3] = 0;
  }
  else
  {
    v21 = v19[3];
    if (v21)
      pthread_mutex_lock((pthread_mutex_t *)(v21 + 8));
  }
  v22 = 0;
  v23 = *v19;
  v24 = v19[1];
  v25 = v19[2];
  do
  {
    while (1)
    {
      while (1)
      {
        v26 = (uint64_t *)v20;
        v20 = (uint64_t **)*v20;
        v27 = *((unsigned int *)v26 + 4);
        if (!v24 || v25 > v27)
          break;
        *v26 = (uint64_t)v22;
        v22 = v26;
        if (!v20)
          goto LABEL_72;
      }
      if (v27 > 0x13)
        break;
      v28 = (uint64_t *)&v19[v27];
      v29 = v28[5];
      *v26 = v29;
      if (v23 < v27 && v29 == 0)
        v23 = v27;
      v28[5] = (uint64_t)v26;
      if (v25 <= v27)
      {
        v25 = 0;
        if (!v20)
          goto LABEL_72;
      }
      else
      {
        v25 += ~v27;
        if (!v20)
          goto LABEL_72;
      }
    }
    *v26 = v19[5];
    v19[5] = (unint64_t)v26;
    v31 = v25 > v27;
    v25 += ~v27;
    if (!v31)
      v25 = 0;
  }
  while (v20);
LABEL_72:
  *v19 = v23;
  v19[2] = v25;
  v32 = v19[3];
  if (v32)
    pthread_mutex_unlock((pthread_mutex_t *)(v32 + 8));
  if (v22)
  {
    v33 = (unsigned int *)MEMORY[0x24BDAEC58];
    do
    {
      v34 = (uint64_t *)*v22;
      MEMORY[0x22E30CD70](*v33, v22, ((*((_DWORD *)v22 + 4) << 12) + 4096));
      v22 = v34;
    }
    while (v34);
  }
  if ((apr_pool_t *)v19[4] == p)
    apr_allocator_destroy((apr_allocator_t *)v19);
}

void apr_allocator_destroy(apr_allocator_t *allocator)
{
  uint64_t v2;
  unsigned int *v3;
  char *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = 0;
  v3 = (unsigned int *)MEMORY[0x24BDAEC58];
  while (1)
  {
    v4 = (char *)allocator + 8 * v2;
    v7 = (_QWORD *)*((_QWORD *)v4 + 5);
    v6 = v4 + 40;
    v5 = v7;
    if (v7)
    {
      do
      {
        *v6 = *v5;
        MEMORY[0x22E30CD70](*v3);
        v5 = (_QWORD *)*v6;
      }
      while (*v6);
    }
    if (++v2 == 20)
      JUMPOUT(0x22E30CD70);
  }
}

_QWORD *allocator_alloc(unint64_t *a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  memory_object_size_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  _QWORD *v21;
  BOOL v22;
  unint64_t v23;
  vm_address_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;

  v2 = 0;
  v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  v4 = 0x2000;
  if (v3 > 0x2000)
    v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  if (v3 >= a2)
    v5 = v4;
  else
    v5 = 0;
  if (v3 >= a2)
  {
    v6 = v4 >> 12;
    v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7))
      return 0;
    v9 = *a1;
    if (v7 <= *a1)
    {
      v14 = a1[3];
      if (v14)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        v9 = *a1;
      }
      v15 = &a1[v7];
      v17 = (_QWORD *)v15[5];
      v16 = v15 + 5;
      v2 = v17;
      v18 = v17 == 0;
      v19 = v7 < v9;
      if (v17)
        v20 = 1;
      else
        v20 = v7 >= v9;
      if (!v20)
      {
        do
        {
          v21 = (_QWORD *)v16[1];
          ++v16;
          v2 = v21;
          v18 = v21 == 0;
          v19 = v6 < v9;
          if (v21)
            v22 = 1;
          else
            v22 = v6 >= v9;
          ++v6;
        }
        while (!v22);
      }
      if (!v18)
      {
        v25 = *v2;
        *v16 = *v2;
        if (v25)
          v19 = 1;
        if (!v19)
        {
          v26 = v16 - 1;
          do
          {
            if (*v26--)
              v28 = 1;
            else
              v28 = v9 == 1;
            --v9;
          }
          while (!v28);
          *a1 = v9;
        }
        v13 = (*((_DWORD *)v2 + 4) + 1);
LABEL_43:
        v29 = a1[2] + v13;
        if (v29 >= a1[1])
          v29 = a1[1];
        a1[2] = v29;
        v30 = a1[3];
        if (v30)
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        goto LABEL_47;
      }
    }
    else
    {
      v2 = a1 + 5;
      if (!a1[5])
      {
LABEL_30:
        v24 = GTCoreAlloc(v5);
        v2 = (_QWORD *)v24;
        if (!v24)
          return v2;
        *(_DWORD *)(v24 + 16) = v7;
        *(_QWORD *)(v24 + 32) = v24 + v5;
LABEL_47:
        *v2 = 0;
        v2[3] = v2 + 5;
        return v2;
      }
      v10 = a1[3];
      if (v10)
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      while (1)
      {
        v11 = v2;
        v2 = (_QWORD *)*v2;
        if (!v2)
          break;
        v12 = *((unsigned int *)v2 + 4);
        if (v7 <= v12)
        {
          *v11 = *v2;
          v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }
    v23 = a1[3];
    if (v23)
      pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    goto LABEL_30;
  }
  return v2;
}

apr_status_t apr_pool_create_ex(apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  unint64_t *v4;
  apr_abortfunc_t v5;
  apr_pool_t *v7;
  apr_pool_t *v8;
  apr_pool_t **v9;
  uint64_t v10;
  apr_pool_t *v11;
  apr_pool_t ***v12;
  apr_pool_t *v13;
  apr_status_t v14;

  v4 = (unint64_t *)allocator;
  v5 = abort_fn;
  *newpool = 0;
  if (parent)
    v7 = parent;
  else
    v7 = (apr_pool_t *)global_pool;
  if (!abort_fn && v7)
    v5 = (apr_abortfunc_t)*((_QWORD *)v7 + 8);
  if (!allocator)
    v4 = (unint64_t *)*((_QWORD *)v7 + 6);
  v8 = (apr_pool_t *)allocator_alloc(v4, 0x1FD8uLL);
  if (v8)
  {
    *(_QWORD *)v8 = v8;
    *((_QWORD *)v8 + 1) = v8;
    v9 = (apr_pool_t **)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0;
    v9[6] = (apr_pool_t *)v4;
    v9[7] = 0;
    v9[4] = 0;
    v9[5] = 0;
    v9[10] = 0;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0;
    *v9 = v7;
    v9[1] = 0;
    if (v7)
    {
      v10 = *(_QWORD *)(*((_QWORD *)v7 + 6) + 24);
      if (v10)
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      v13 = (apr_pool_t *)*((_QWORD *)v7 + 1);
      v12 = (apr_pool_t ***)((char *)v7 + 8);
      v11 = v13;
      v9[2] = v13;
      if (v13)
        *((_QWORD *)v11 + 3) = v9 + 2;
      *v12 = v9;
      v9[3] = (apr_pool_t *)v12;
      if (v10)
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
    }
    else
    {
      v9[2] = 0;
      v9[3] = 0;
    }
    v14 = 0;
    *newpool = (apr_pool_t *)v9;
  }
  else
  {
    v14 = 12;
    if (v5)
      ((void (*)(uint64_t))v5)(12);
  }
  return v14;
}

void *__cdecl apr_palloc(apr_pool_t *p, apr_size_t size)
{
  apr_size_t v3;
  void (*v4)(uint64_t);
  void *result;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;

  v3 = (size + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < size)
  {
LABEL_2:
    v4 = (void (*)(uint64_t))*((_QWORD *)p + 8);
    if (v4)
      v4(12);
    return 0;
  }
  v6 = (_QWORD *)*((_QWORD *)p + 11);
  result = (void *)v6[3];
  if (v3 <= v6[4] - (_QWORD)result)
  {
    v6[3] = (char *)result + v3;
    return result;
  }
  v7 = (_QWORD *)*v6;
  if (v3 <= *(_QWORD *)(*v6 + 32) - *(_QWORD *)(*v6 + 24))
  {
    *(_QWORD *)v7[1] = *v7;
    *(_QWORD *)(*v7 + 8) = v7[1];
  }
  else
  {
    v7 = allocator_alloc(*((unint64_t **)p + 6), (size + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7)
      goto LABEL_2;
  }
  *((_DWORD *)v7 + 5) = 0;
  result = (void *)v7[3];
  v7[3] = (char *)result + v3;
  v8 = (_QWORD *)v6[1];
  v7[1] = v8;
  *v8 = v7;
  *v7 = v6;
  v6[1] = v7;
  *((_QWORD *)p + 11) = v7;
  v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    v10 = (uint64_t *)*v6;
    do
      v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    *v7 = *v6;
    *(_QWORD *)(*v6 + 8) = v6[1];
    v11 = (_QWORD *)v10[1];
    v6[1] = v11;
    *v11 = v6;
    *v6 = v10;
    v10[1] = (uint64_t)v6;
  }
  return result;
}

void apr_pool_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  _QWORD *v7;

  if (p)
  {
    v7 = (_QWORD *)*((_QWORD *)p + 5);
    if (v7)
      *((_QWORD *)p + 5) = *v7;
    else
      v7 = apr_palloc(p, 0x20uLL);
    v7[2] = plain_cleanup;
    v7[3] = apr_pool_cleanup_null;
    *v7 = *((_QWORD *)p + 4);
    v7[1] = data;
    *((_QWORD *)p + 4) = v7;
  }
}

apr_status_t apr_pool_cleanup_null(void *data)
{
  return 0;
}

apr_status_t apr_proc_wait(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow)
{
  int v5;
  pid_t v6;
  int v8;

  v8 = 0;
  if ((_DWORD)exitcode)
    v5 = 3;
  else
    v5 = 2;
  while (1)
  {
    v6 = waitpid(proc->pid, &v8, v5);
    if ((v6 & 0x80000000) == 0)
      break;
    if (*__error() != 4)
      return *__error();
  }
  if (!v6)
    return 70006;
  proc->pid = v6;
  if ((~v8 & 0x7F) != 0)
    return 70005;
  else
    return 20014;
}

apr_status_t apr_initialize(void)
{
  apr_status_t v1;
  vm_address_t v4;
  apr_pool_t *v5;
  apr_pool_t *v6;
  apr_status_t (__cdecl *v7)(void *);
  uint64_t v8;
  apr_status_t v9;
  uint64_t v10;
  uint64_t v11;
  apr_pool_t *newpool;

  if (initialized++)
    return 0;
  if (!apr_pools_initialized++)
  {
    global_allocator = 0;
    v4 = GTCoreAlloc(0xC8uLL);
    if (!v4)
    {
      apr_pools_initialized = 0;
      return 12;
    }
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_QWORD *)(v4 + 192) = 0;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    global_allocator = v4;
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(0x8000uLL);
    if (apr_pool_create_ex((apr_pool_t **)&global_pool, 0, 0, (apr_allocator_t *)v4))
      apr_allocator_destroy((apr_allocator_t *)global_allocator);
    v6 = (apr_pool_t *)global_pool;
    *(_QWORD *)(global_pool + 80) = "apr_global_pool";
    if (hash_mutex)
    {
LABEL_17:
      newpool = 0;
      v9 = apr_thread_mutex_create(&newpool, v6, v5);
      if (!v9)
      {
        v10 = global_allocator;
        v11 = global_pool;
        *(_QWORD *)(global_allocator + 24) = newpool;
        *(_QWORD *)(v10 + 32) = v11;
        goto LABEL_5;
      }
    }
    else
    {
      hash_mutex = (uint64_t)apr_palloc(v6, 0x38uLL);
      apr_pool_cleanup_register(v6, (const void *)hash_mutex, (apr_status_t (__cdecl *)(void *))atomic_cleanup, v7);
      v8 = 0;
      while (1)
      {
        v9 = apr_thread_mutex_create((apr_thread_mutex_t **)(hash_mutex + v8), v6, v5);
        if (v9)
          break;
        v8 += 8;
        if (v8 == 56)
        {
          LODWORD(v6) = global_pool;
          goto LABEL_17;
        }
      }
    }
    return v9;
  }
LABEL_5:
  newpool = 0;
  if (apr_pool_create_ex(&newpool, 0, 0, 0))
    return 20002;
  v1 = 0;
  *((_QWORD *)newpool + 10) = "apr_initialize";
  return v1;
}

apr_status_t apr_proc_kill(apr_proc_t *proc, int sig)
{
  if (kill((pid_t)proc, sig) == -1)
    return *__error();
  else
    return 0;
}

apr_status_t apr_thread_mutex_create(apr_thread_mutex_t **mutex, unsigned int flags, apr_pool_t *pool)
{
  uint64_t v3;
  char *v5;
  apr_pool_t **v6;
  apr_status_t result;
  apr_status_t (__cdecl *v8)(void *);

  v3 = *(_QWORD *)&flags;
  v5 = (char *)apr_palloc(*(apr_pool_t **)&flags, 0x48uLL);
  v6 = (apr_pool_t **)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
  }
  *(_QWORD *)v5 = v3;
  result = pthread_mutex_init((pthread_mutex_t *)(v5 + 8), 0);
  if (!result)
  {
    apr_pool_cleanup_register(*v6, v6, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup, v8);
    result = 0;
    *mutex = (apr_thread_mutex_t *)v6;
  }
  return result;
}

uint64_t thread_mutex_cleanup(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

id gt_default_log()
{
  if (gt_default_log_onceToken != -1)
    dispatch_once(&gt_default_log_onceToken, &__block_literal_global_1);
  return MEMORY[0x24BDACB70];
}

void __gt_default_log_block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_22D095000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v0, 2u);
  }
}

uint64_t GTCorePlatformGet()
{
  return 1;
}

id PrettifyFenumString(void *a1, int a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;

  v5 = a1;
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("kDYFE")))
    {
      objc_msgSend(v6, "substringFromIndex:", 5);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    v8 = objc_msgSend(v6, "rangeOfString:", CFSTR("_"));
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR(" "), 0, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(":"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = CFSTR("-");
    if (a2)
      v12 = CFSTR("+");
    v13 = &stru_24F828350;
    if (a3)
      v13 = CFSTR(":");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@[%@%@]"), v12, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x24BED8460]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x24BDBD0C8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x24BDACB48]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x24BDAE658](a1, a2);
}

pid_t getppid(void)
{
  return MEMORY[0x24BDAE6D8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x24BDAEB70](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x24BDAFC10]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB03B0](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0668](xarray, index, length);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0690](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x24BDB07A0](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0BD8](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

