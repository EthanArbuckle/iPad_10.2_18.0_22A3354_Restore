@implementation AUAudioUnit

+ (id)__presetFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("aupreset")) & 1) == 0)
    __assert_rtn("+[AUAudioUnit(PresetHandling) __presetFromPath:]", "AUAudioUnitPresetHandling.mm", 14, "[[pathString pathExtension] isEqualToString:@\"aupreset\"]");

  objc_msgSend(v3, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if ((unint64_t)objc_msgSend(v8, "count") <= 1)
    __assert_rtn("+[AUAudioUnit(PresetHandling) __presetFromPath:]", "AUAudioUnitPresetHandling.mm", 18, "chunks.count > 1");
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v8, "count") - 1);
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByRemovingPercentEncoding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setName:", v11);
  objc_msgSend(v12, "setNumber:", (int)-objc_msgSend(v9, "intValue"));

  return v12;
}

+ (id)__sanitizeFileName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0x50)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/\\"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formUnionWithCharacterSet:", v7);

    objc_msgSend(MEMORY[0x1E0CB3500], "illegalCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formUnionWithCharacterSet:", v8);

    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formUnionWithCharacterSet:", v9);

    if (objc_msgSend(v3, "rangeOfCharacterFromSet:", v6) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formUnionWithCharacterSet:", v10);

      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("|$()<>{}.#'\"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formUnionWithCharacterSet:", v11);

      objc_msgSend(v6, "invertedSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)__sanitizePresetNumber:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "number"))
  {
    v3 = -1;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "number") >= 1)
  {
    v3 = -objc_msgSend(v4, "number");
LABEL_5:
    objc_msgSend(v4, "setNumber:", v3);
  }

}

+ (id)__userPresetPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v5 = a3;
  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/AUPresets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) != 0
    || ((objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 0, 0, a4), v11, !a4)? (v13 = v12): (v13 = 0), (v13 & 1) != 0))
  {
    if (v5)
    {
      objc_msgSend(v5, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[AUAudioUnit __sanitizeFileName:](AUAudioUnit, "__sanitizeFileName:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && objc_msgSend(v15, "length"))
      {
        +[AUAudioUnit __sanitizePresetNumber:](AUAudioUnit, "__sanitizePresetNumber:", v5);
        v16 = (void *)MEMORY[0x1E0CB3940];
        if (objc_msgSend(v5, "number") < 0)
          v17 = -objc_msgSend(v5, "number");
        else
          v17 = objc_msgSend(v5, "number");
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@_%ld.aupreset"), v8, v15, v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = v8;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)_saveUserPreset:(id)a3 state:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2932DA8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isSubsetOfSet:", v13);

    if ((v14 & 1) != 0)
    {
      +[AUAudioUnit __userPresetPath:error:](AUAudioUnit, "__userPresetPath:error:", v7, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v7, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("name"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v7, "number"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("preset-number"));

        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "writeToFile:options:error:", v15, 1, a5);

        v19 = *a5 == 0;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB2D50];
        v25 = CFSTR("Illegal file name for user preset!");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -66742, v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v15 = 0;
        v19 = 0;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("Missing key in preset state map!");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -66741, v15);
      v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)_deleteUserPreset:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
  {
    +[AUAudioUnit __userPresetPath:error:](AUAudioUnit, "__userPresetPath:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a4) = objc_msgSend(v7, "removeItemAtPath:error:", v6, a4);

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2D50];
      v12[0] = CFSTR("Illegal file name for user preset!");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -66742, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }

  }
  return (char)a4;
}

+ (id)_presetStateFor:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  if (a4)
  {
    +[AUAudioUnit __userPresetPath:error:](AUAudioUnit, "__userPresetPath:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 0, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (*a4)
    {
      a4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v13, v14, a4);
      a4 = (id *)objc_claimAutoreleasedReturnValue();
    }

  }
  return a4;
}

+ (void)_loadUserPresets:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  if (a4)
  {
    v13 = v5;
    +[AUAudioUnit __userPresetPath:error:](AUAudioUnit, "__userPresetPath:error:", 0, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF ENDSWITH '.aupreset'"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke;
      v17[3] = &unk_1E2918F80;
      v12 = v6;
      v18 = v12;
      objc_msgSend(v10, "sortedArrayUsingComparator:", v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke_2;
      v14[3] = &unk_1E2918FA8;
      v15 = v12;
      v16 = v13;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

    }
    v5 = v13;
  }

}

+ (id)_monitorUserPresets:(id)a3 callback:(id)a4
{
  NSObject *v5;
  id v6;
  id v7;
  int v8;
  unsigned int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD aBlock[4];
  int v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
    __assert_rtn("+[AUAudioUnit(PresetHandling) _monitorUserPresets:callback:]", "AUAudioUnitPresetHandling.mm", 177, "presetMonitoringQueue");
  +[AUAudioUnit __userPresetPath:error:](AUAudioUnit, "__userPresetPath:error:", 0, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0x8000);
  v9 = v8;
  if ((v8 & 0x80000000) == 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__AUAudioUnit_PresetHandling___monitorUserPresets_callback___block_invoke;
    aBlock[3] = &__block_descriptor_36_e5_v8__0l;
    v17 = v8;
    v10 = _Block_copy(aBlock);
    v11 = dispatch_source_create(MEMORY[0x1E0C80DE8], v9, 2uLL, v5);
    if (v11)
    {
LABEL_19:
      dispatch_source_set_event_handler(v11, v6);
      dispatch_source_set_cancel_handler(v11, v10);
      dispatch_resume(v11);
LABEL_20:

      goto LABEL_21;
    }
    if (kAUExtensionScope)
    {
      v12 = *(id *)kAUExtensionScope;
      if (!v12)
      {
LABEL_18:
        ((void (*))v10[2].isa)(v10);
        goto LABEL_19;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "AUAudioUnitPresetHandling.mm";
      v20 = 1024;
      v21 = 191;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_18EE07000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create dispatch source to monitor folder: %@", buf, 0x1Cu);
    }

    goto LABEL_18;
  }
  if (!kAUExtensionScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_11;
  }
  v10 = *(id *)kAUExtensionScope;
  if (v10)
  {
LABEL_11:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "AUAudioUnitPresetHandling.mm";
      v20 = 1024;
      v21 = 181;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_18EE07000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not open preset folder: %@", buf, 0x1Cu);
    }
    v11 = 0;
    goto LABEL_20;
  }
  v11 = 0;
LABEL_21:

  return v11;
}

uint64_t __60__AUAudioUnit_PresetHandling___monitorUserPresets_callback___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10;
  objc_msgSend(v11, "attributesOfItemAtPath:error:", v12, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  if (v14)
  {
    v15 = -1;
  }
  else
  {
    v16 = *MEMORY[0x1E0CB2A38];
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2A38]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "compare:", v18);

    if (v19 == 1)
      v15 = -1;
    else
      v15 = 1;
  }

  return v15;
}

void __54__AUAudioUnit_PresetHandling___loadUserPresets_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AUAudioUnit __presetFromPath:](AUAudioUnit, "__presetFromPath:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

float __32__AUAudioUnit_XPC_parameterTree__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  _QWORD *v9;
  uint64_t v10;
  void *v12;
  _BYTE v13[24];
  _BYTE *v14;
  id v15;
  float v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_message((uint64_t)&v12, WeakRetained);

  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_proxy(&v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "address");
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::reply((uint64_t)&v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getParameter:sequenceNumber:reply:", v6, 0, v7);

  v8 = v16;
  v9 = v14;
  if (v14 == v13)
  {
    v10 = 4;
    v9 = v13;
    goto LABEL_5;
  }
  if (v14)
  {
    v10 = 5;
LABEL_5:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }

  return v8;
}

id __32__AUAudioUnit_XPC_parameterTree__block_invoke_2(uint64_t a1, void *a2, int *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  double v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v16;
  _BYTE v17[24];
  _BYTE *v18;
  id v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_message(&v16, WeakRetained);

  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_proxy(&v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v8 = *a3;
  else
    v8 = 0;
  v9 = objc_msgSend(v5, "address");
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::reply((uint64_t)&v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = v8;
  objc_msgSend(v7, "parameterStringFromValue:currentValue:address:reply:", a3 == 0, v9, v10, v11);

  v12 = v20;
  v13 = v18;
  if (v18 == v17)
  {
    v14 = 4;
    v13 = v17;
    goto LABEL_8;
  }
  if (v18)
  {
    v14 = 5;
LABEL_8:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

  return v12;
}

float __32__AUAudioUnit_XPC_parameterTree__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  float v11;
  _QWORD *v12;
  uint64_t v13;
  void *v15;
  _BYTE v16[24];
  _BYTE *v17;
  id v18;
  float v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_message((uint64_t)&v15, WeakRetained);

  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_proxy(&v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "address");
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::reply((uint64_t)&v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameterValueFromString:address:reply:", v6, v9, v10);

  v11 = v19;
  v12 = v17;
  if (v17 == v16)
  {
    v13 = 4;
    v12 = v16;
    goto LABEL_5;
  }
  if (v17)
  {
    v13 = 5;
LABEL_5:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }

  return v11;
}

id __32__AUAudioUnit_XPC_parameterTree__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v14;
  _BYTE v15[24];
  _BYTE *v16;
  id v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_message(&v14, WeakRetained);

  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_proxy(&v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::reply((uint64_t)&v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameterNode:displayNameWithLength:reply:", v8, a3, v9);

  v10 = v18;
  v11 = v16;
  if (v16 == v15)
  {
    v12 = 4;
    v11 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v12 = 5;
LABEL_5:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }

  return v10;
}

uint64_t __38__AUAudioUnit_XPC_internalRenderBlock__block_invoke(uint64_t a1, int *a2, const AudioTimeStamp *a3, uint64_t a4, unsigned int a5, unsigned int *a6, AURenderEventAllocator *a7, uint64_t a8)
{
  uint64_t v8;
  int v14;
  auoop::PipeSubPool *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  caulk::pooled_semaphore_mutex *v32;
  unsigned int v33;
  char v34;
  unsigned int v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  caulk::concurrent::message *v39;
  unsigned int v40;
  char *v41;
  unsigned int v42;
  uint64_t v43;
  const void **v44;
  void **v45;
  void *v46;
  void *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  float mSampleTime;
  int v57;
  unsigned int v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  int v65;
  unsigned int v66;
  int v67;
  int v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  unsigned int v75;
  unsigned int v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  char v81;
  uint64_t v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  unsigned int (*v87)(_QWORD, uint64_t, uint64_t);
  unsigned int (*v88)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v89;
  int v90;
  unsigned int (*v91)(_QWORD, AudioTimeStamp *, uint64_t *, uint64_t *, uint64_t, char *, uint64_t, uint64_t);
  unsigned int (*v92)(_QWORD, AudioTimeStamp *, uint64_t *, uint64_t, char *, uint64_t, uint64_t);
  int v93;
  int v94;
  int v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  double v99;
  uint64_t v100;
  double v101;
  char v102;
  uint64_t v103;
  double v104;
  int v105;
  int v106;
  uint64_t v107;
  double v108;
  char v109;
  uint64_t v110;
  uint64_t message;
  caulk::concurrent::message *v112;
  _DWORD *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  caulk::concurrent::message *v117;
  _DWORD *v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unsigned int v127;
  unsigned int v128;
  uint64_t v129;
  unint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  AudioTimeStamp v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 72))
  {
    v14 = *(unsigned __int8 *)(a1 + 40);
    v132 = (unint64_t)audioipc::current_render_context((audioipc *)a1);
    v15 = *(auoop::PipeSubPool **)v8;
    v16 = auoop::PipeSubPool::acquirePipeSlot(*(auoop::PipeSubPool **)v8, &v132, 1);
    v17 = *(_QWORD *)(v16 + 8);
    if (!*(_BYTE *)v17)
    {
      v23 = 4294956429;
      goto LABEL_18;
    }
    v18 = v132;
    v19 = atomic_load((unsigned __int8 *)(v17 + 2));
    if ((v19 & 1) != 0)
    {
      v24 = *a6;
      v23 = 4294900547;
      if ((_DWORD)v24)
      {
        v25 = 0;
        v26 = (void **)(a6 + 4);
        do
        {
          if (*v26)
          {
            bzero(*v26, *((unsigned int *)v26 - 1));
            v24 = *a6;
          }
          ++v25;
          v26 += 2;
        }
        while (v25 < v24);
      }
      goto LABEL_18;
    }
    if (*(_DWORD *)(v17 + 220) <= a5)
    {
      v23 = 4294956419;
      goto LABEL_18;
    }
    v20 = *(_QWORD *)(v17 + 80);
    v21 = *(_DWORD *)(v8 + 56);
    *(_DWORD *)(v20 + 4108) = v21;
    v129 = v20;
    *(_QWORD *)(v20 + 4112) = v18;
    v22 = *a2;
    if ((*a2 & 0x8000) != 0)
    {
      v27 = AUOOPRenderingClient::computeTimeoutSeconds((AUOOPRenderingClient *)v17, (const AUOOPRenderClientUser *)*(unsigned __int8 *)(v8 + 60), a3, a4);
      *(_DWORD *)(v129 + 4168 + 4 * *(unsigned int *)(v17 + 216) + 148) = *a2;
      v28 = *(_OWORD *)&a3->mSampleTime;
      v29 = *(_OWORD *)&a3->mRateScalar;
      v30 = *(_OWORD *)&a3->mSMPTETime.mHours;
      *(_OWORD *)(v129 + 4200) = *(_OWORD *)&a3->mSMPTETime.mSubframes;
      *(_OWORD *)(v129 + 4216) = v30;
      *(_OWORD *)(v129 + 4168) = v28;
      *(_OWORD *)(v129 + 4184) = v29;
      *(_DWORD *)(v129 + 4312) = a4;
      AUOOPRenderingClient::copyEventsToSharedMemory(v17, a7, v27, 1);
      v23 = 0;
      goto LABEL_18;
    }
    if (*(_DWORD *)(v17 + 224) < a4)
    {
      v23 = 4294956422;
LABEL_18:
      atomic_store(0, (unsigned __int8 *)v16);
      caulk::semaphore::signal((auoop::PipeSubPool *)((char *)v15 + 100));
      return v23;
    }
    if (a3->mSampleTime == *(double *)(v17 + 232) && v21 == *(_DWORD *)(v17 + 240))
      goto LABEL_37;
    *(_QWORD *)(v17 + 208) = a8;
    if (v14)
    {
      v32 = (caulk::pooled_semaphore_mutex *)(v17 + 164);
      caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)(v17 + 164));
      *(Float64 *)(v17 + 232) = a3->mSampleTime;
      *(_DWORD *)(v17 + 240) = *(_DWORD *)(v8 + 56);
      if (*(_DWORD *)(v17 + 216))
      {
        v33 = 0;
        v34 = 0;
        do
        {
          v34 |= AUOOPRenderingClient::pullOneInput((AUOOPRenderingClient *)v17, v33++, a3, a4) == 0;
          v35 = *(_DWORD *)(v17 + 216);
        }
        while (v33 < v35);
        v36 = (v35 == 0) | v34;
        v32 = (caulk::pooled_semaphore_mutex *)(v17 + 164);
        if ((v36 & 1) == 0 && !*(_BYTE *)(v8 + 61))
        {
          caulk::pooled_semaphore_mutex::_unlock((caulk::pooled_semaphore_mutex *)(v17 + 164));
          v23 = 4294956420;
          goto LABEL_18;
        }
      }
      caulk::pooled_semaphore_mutex::_unlock(v32);
      v37 = a5;
      v22 = *a2;
      v120 = -1;
    }
    else
    {
      v37 = a5;
      v120 = a5;
    }
    *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v17 + 216) + v37) + 4316) = v22;
    caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)(v17 + 160));
    if (!*(_BYTE *)v17)
    {
      LODWORD(v39) = 0;
      v23 = 4294956421;
      goto LABEL_35;
    }
    v23 = 4294900551;
    v38 = *(_QWORD *)(v17 + 80);
    if (*(_BYTE *)(v38 + 4304))
    {
      LODWORD(v39) = 0;
      v23 = 4294900549;
      goto LABEL_35;
    }
    *(_DWORD *)(v38 + 4248) = 0;
    v55 = *(_QWORD *)(v8 + 24);
    if (v55)
    {
      v135 = 0;
      v136.mSampleTime = 4.0;
      v134 = 0;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, AudioTimeStamp *, uint64_t *, uint64_t, uint64_t *, uint64_t))(v55 + 16))(v55, v38 + 4240, &v136, &v135, v38 + 4232, &v134, v38 + 4264))goto LABEL_101;
      mSampleTime = v136.mSampleTime;
      *(float *)(v38 + 4256) = mSampleTime;
      *(_DWORD *)(v38 + 4260) = v135;
      *(_DWORD *)(v38 + 4252) = v134;
      v57 = *(_DWORD *)(v38 + 4248) | 0x300;
    }
    else
    {
      v87 = *(unsigned int (**)(_QWORD, uint64_t, uint64_t))(v17 + 176);
      if (v87 && !v87(*(_QWORD *)(v17 + 168), v38 + 4232, v38 + 4240))
        *(_DWORD *)(v38 + 4248) |= 0x100u;
      v88 = *(unsigned int (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 184);
      if (!v88 || v88(*(_QWORD *)(v17 + 168), v38 + 4252, v38 + 4256, v38 + 4260, v38 + 4264))
      {
LABEL_101:
        v89 = *(_QWORD *)(v8 + 32);
        if (v89)
        {
          v136.mSampleTime = 0.0;
          if (!(*(unsigned int (**)(uint64_t, AudioTimeStamp *, uint64_t, uint64_t, uint64_t))(v89 + 16))(v89, &v136, v38 + 4272, v38 + 4280, v38 + 4288))goto LABEL_120;
          v90 = *(_DWORD *)(v38 + 4248) | LOBYTE(v136.mSampleTime) & 0xF | 0x400;
          goto LABEL_119;
        }
        LOBYTE(v136.mSampleTime) = 0;
        LOBYTE(v135) = 0;
        LOBYTE(v134) = 0;
        v133 = 0;
        v91 = *(unsigned int (**)(_QWORD, AudioTimeStamp *, uint64_t *, uint64_t *, uint64_t, char *, uint64_t, uint64_t))(v17 + 200);
        if (v91 && !v91(*(_QWORD *)(v17 + 168), &v136, &v135, &v134, v38 + 4272, &v133, v38 + 4280, v38 + 4288))
        {
          v95 = *(_DWORD *)(v38 + 4248);
          v94 = v95 | 0x400;
          *(_DWORD *)(v38 + 4248) = v95 | 0x400;
          if (LOBYTE(v136.mSampleTime))
          {
            v94 = v95 | 0x402;
            *(_DWORD *)(v38 + 4248) = v95 | 0x402;
          }
          if ((_BYTE)v135)
          {
            v94 |= 4u;
            goto LABEL_114;
          }
        }
        else
        {
          v92 = *(unsigned int (**)(_QWORD, AudioTimeStamp *, uint64_t *, uint64_t, char *, uint64_t, uint64_t))(v17 + 192);
          if (!v92 || v92(*(_QWORD *)(v17 + 168), &v136, &v134, v38 + 4272, &v133, v38 + 4280, v38 + 4288))
            goto LABEL_120;
          v93 = *(_DWORD *)(v38 + 4248);
          v94 = v93 | 0x400;
          *(_DWORD *)(v38 + 4248) = v93 | 0x400;
          if (LOBYTE(v136.mSampleTime))
          {
            v94 = v93 | 0x402;
LABEL_114:
            *(_DWORD *)(v38 + 4248) = v94;
          }
        }
        if ((_BYTE)v134)
        {
          v94 |= 1u;
          *(_DWORD *)(v38 + 4248) = v94;
        }
        if (v133)
        {
          v90 = v94 | 8;
LABEL_119:
          *(_DWORD *)(v38 + 4248) = v90;
        }
LABEL_120:
        *(_QWORD *)(v38 + 4296) = mach_absolute_time();
        v96 = *(_OWORD *)&a3->mSampleTime;
        v97 = *(_OWORD *)&a3->mRateScalar;
        v98 = *(_OWORD *)&a3->mSMPTETime.mHours;
        *(_OWORD *)(v38 + 4200) = *(_OWORD *)&a3->mSMPTETime.mSubframes;
        *(_OWORD *)(v38 + 4216) = v98;
        *(_OWORD *)(v38 + 4168) = v96;
        *(_OWORD *)(v38 + 4184) = v97;
        *(_DWORD *)(v38 + 4312) = a4;
        v99 = AUOOPRenderingClient::computeTimeoutSeconds((AUOOPRenderingClient *)v17, (const AUOOPRenderClientUser *)*(unsigned __int8 *)(v8 + 60), a3, a4);
        AUOOPRenderingClient::copyEventsToSharedMemory(v17, a7, v99, 0);
        if ((v120 & 0x80000000) == 0)
        {
          kdebug_trace();
          v100 = *(_QWORD *)(v17 + 80);
          v125 = v17 + 8;
          if (!audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::can_send(v17 + 8, v101)|| ((*(_BYTE *)(v100 + 4104) = 2, *(_DWORD *)(v100 + 4120) = v120, v99 <= 0.0)? (v102 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait(v125)): (v102 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait_with_timeout(v125, v99)), (v102 & 1) == 0))
          {
            v110 = _os_log_pack_size();
            message = caulk::deferred_logger::create_message((caulk::deferred_logger *)gCADefaultDeferredLog, v110 + 88, 2);
            if (message)
            {
              v112 = (caulk::concurrent::message *)message;
              v113 = (_DWORD *)_os_log_pack_fill();
              *v113 = 67109120;
              v113[1] = -66745;
              caulk::concurrent::messenger::enqueue(*(caulk::concurrent::messenger **)(gCADefaultDeferredLog + 16), v112);
            }
            kdebug_trace();
            LODWORD(v39) = 0;
LABEL_35:
            caulk::pooled_semaphore_mutex::_unlock((caulk::pooled_semaphore_mutex *)(v17 + 160));
            if ((_DWORD)v23)
              goto LABEL_18;
            v40 = a5;
            if ((_DWORD)v39)
            {
LABEL_38:
              v41 = audioipc::SharedAudioBuffers::immutableBufferList((audioipc::SharedAudioBuffers *)(v17 + 104), v40, a4);
              v42 = **(_DWORD **)v41;
              if (*a6 >= v42)
                v43 = v42;
              else
                v43 = *a6;
              if ((_DWORD)v43)
              {
                v44 = (const void **)(*(_QWORD *)v41 + 16);
                v45 = (void **)(a6 + 4);
                do
                {
                  v46 = *v45;
                  v47 = (void *)*v44;
                  if (*v45)
                  {
                    if (v46 != v47)
                      memcpy(v46, v47, *((unsigned int *)v44 - 1));
                  }
                  else
                  {
                    *v45 = v47;
                  }
                  v44 += 2;
                  v45 += 2;
                  --v43;
                }
                while (v43);
              }
              v48 = *(_QWORD *)(v17 + 88);
              v127 = *(_DWORD *)(v48 + 4);
              if (v127 && *(_QWORD *)(v8 + 40))
              {
                v49 = 0;
                v50 = 0;
                v51 = 0;
                v52 = v48 + 8;
                while (1)
                {
                  v53 = *(_BYTE *)(v52 + v50);
                  v51 |= (unint64_t)(v53 & 0x7F) << v49;
                  ++v50;
                  if ((v53 & 0x80) == 0)
                    break;
                  v49 += 7;
                  if (v50 == 10)
                  {
                    v54 = 10;
                    goto LABEL_58;
                  }
                }
                v54 = v50;
LABEL_58:
                v58 = 0;
                v121 = *(_QWORD *)(v17 + 88);
                v123 = v48 + 9;
                do
                {
                  if (v58)
                  {
                    v59 = 0;
                    v60 = 0;
                    v61 = 0;
                    while (1)
                    {
                      v62 = *(_BYTE *)(v52 + v58 + v60);
                      v61 |= (unint64_t)(v62 & 0x7F) << v59;
                      ++v60;
                      if ((v62 & 0x80) == 0)
                        break;
                      v59 += 7;
                      if (v60 == 10)
                      {
                        v54 = 10;
                        goto LABEL_65;
                      }
                    }
                    v54 = v60;
                  }
LABEL_65:
                  v63 = 0;
                  v64 = 0;
                  v65 = 0;
                  v66 = v58;
                  while (1)
                  {
                    v67 = *(char *)(v123 + v58 + (unint64_t)v54 + v64);
                    v65 |= (unint64_t)(v67 & 0x7F) << v63;
                    ++v64;
                    if ((v67 & 0x80000000) == 0)
                      break;
                    v63 += 7;
                    if (v64 == 5)
                    {
                      v68 = 5;
                      goto LABEL_70;
                    }
                  }
                  v68 = v64;
LABEL_70:
                  (*(void (**)(void))(*(_QWORD *)(v8 + 40) + 16))();
                  v58 = v66 + v54 + v68 + v65 + 1;
                }
                while (v58 < v127);
                *(_DWORD *)(v121 + 4) = 0;
              }
              v69 = *(_QWORD *)(v17 + 96);
              v128 = *(_DWORD *)(v69 + 4);
              if (v128 && *(_QWORD *)(v8 + 48))
              {
                v70 = 0;
                v71 = 0;
                v72 = 0;
                v73 = v69 + 8;
                while (1)
                {
                  v74 = *(_BYTE *)(v73 + v71);
                  v72 |= (unint64_t)(v74 & 0x7F) << v70;
                  ++v71;
                  if ((v74 & 0x80) == 0)
                    break;
                  v70 += 7;
                  if (v71 == 10)
                  {
                    v75 = 10;
                    goto LABEL_79;
                  }
                }
                v75 = v71;
LABEL_79:
                v76 = 0;
                v122 = *(_QWORD *)(v17 + 96);
                v124 = v69 + 9;
                do
                {
                  if (v76)
                  {
                    v77 = 0;
                    v78 = 0;
                    v79 = 0;
                    while (1)
                    {
                      v80 = *(_BYTE *)(v73 + v76 + v78);
                      v79 |= (unint64_t)(v80 & 0x7F) << v77;
                      ++v78;
                      if ((v80 & 0x80) == 0)
                        break;
                      v77 += 7;
                      if (v78 == 10)
                      {
                        v75 = 10;
                        goto LABEL_86;
                      }
                    }
                    v75 = v78;
                  }
LABEL_86:
                  v81 = 0;
                  v82 = 0;
                  v83 = 0;
                  v84 = v76;
                  while (1)
                  {
                    v85 = *(char *)(v124 + v76 + (unint64_t)v75 + v82);
                    v83 |= (unint64_t)(v85 & 0x7F) << v81;
                    ++v82;
                    if ((v85 & 0x80000000) == 0)
                      break;
                    v81 += 7;
                    if (v82 == 5)
                    {
                      v86 = 5;
                      goto LABEL_91;
                    }
                  }
                  v86 = v82;
LABEL_91:
                  (*(void (**)(void))(*(_QWORD *)(v8 + 48) + 16))();
                  v76 = v84 + v75 + v86 + v83 + 1;
                }
                while (v76 < v128);
                *(_DWORD *)(v122 + 4) = 0;
              }
              v23 = 0;
              *a2 = *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v17 + 216) + a5) + 4316);
              goto LABEL_18;
            }
LABEL_37:
            v40 = *(_DWORD *)(v17 + 216) + a5;
            goto LABEL_38;
          }
          kdebug_trace();
          while (1)
          {
            v106 = *(unsigned __int8 *)(v100 + 4105);
            if (v106 != 102)
              break;
            *(_QWORD *)&v136.mFlags = 0;
            memset(&v136.mWordClockTime, 0, 32);
            v136.mSampleTime = (double)*(uint64_t *)(v100 + 4136);
            v136.mHostTime = *(_QWORD *)(v100 + 4144);
            v136.mRateScalar = *(Float64 *)(v100 + 4152);
            v136.mFlags = *(_DWORD *)(v100 + 4160);
            AUOOPRenderingClient::pullOneInput((AUOOPRenderingClient *)v17, *(_DWORD *)(v100 + 4128), &v136, *(unsigned int *)(v100 + 4132));
            v107 = *(_QWORD *)(v17 + 80);
            if (audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::can_send(v125, v108))
            {
              *(_BYTE *)(v107 + 4104) = 3;
              v109 = v99 <= 0.0
                   ? audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait(v125)
                   : audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait_with_timeout(v125, v99);
              if ((v109 & 1) != 0)
                continue;
            }
            LODWORD(v39) = 0;
            goto LABEL_35;
          }
          if (v106 != 101)
          {
            v119 = _os_log_pack_size();
            v39 = (caulk::concurrent::message *)caulk::deferred_logger::create_message((caulk::deferred_logger *)gCADefaultDeferredLog, v119 + 88, 2);
            if (v39)
            {
              *(_WORD *)_os_log_pack_fill() = 0;
              caulk::concurrent::messenger::enqueue(*(caulk::concurrent::messenger **)(gCADefaultDeferredLog + 16), v39);
              LODWORD(v39) = 0;
            }
            v114 = 4294967246;
LABEL_156:
            *(_DWORD *)(*(_QWORD *)(v17 + 80) + 4) = 0;
            v23 = v114;
            goto LABEL_35;
          }
          LODWORD(v39) = 0;
          v114 = *(unsigned int *)(v100 + 4124);
LABEL_151:
          if ((_DWORD)v114 == -66745)
            goto LABEL_35;
          goto LABEL_156;
        }
        kdebug_trace();
        v103 = *(_QWORD *)(v17 + 80);
        if (audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::can_send(v17 + 8, v104)&& ((*(_BYTE *)(v103 + 4104) = 1, v99 <= 0.0)? (v105 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait(v17 + 8)): (v105 = audioipc::ipc_node_base<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::signal_wait_with_timeout(v17 + 8, v99)), v105))
        {
          LODWORD(v39) = *(unsigned __int8 *)(v103 + 4106);
          v114 = *(unsigned int *)(v103 + 4124);
          if (!(_DWORD)v114)
          {
LABEL_150:
            kdebug_trace();
            goto LABEL_151;
          }
          v126 = v114;
        }
        else
        {
          LODWORD(v39) = 0;
          v126 = 4294900551;
        }
        v115 = _os_log_pack_size();
        v116 = caulk::deferred_logger::create_message((caulk::deferred_logger *)gCADefaultDeferredLog, v115 + 88, 2);
        if (v116)
        {
          v117 = (caulk::concurrent::message *)v116;
          v118 = (_DWORD *)_os_log_pack_fill();
          *v118 = 67109120;
          v114 = v126;
          v118[1] = v126;
          caulk::concurrent::messenger::enqueue(*(caulk::concurrent::messenger **)(gCADefaultDeferredLog + 16), v117);
        }
        else
        {
          v114 = v126;
        }
        goto LABEL_150;
      }
      v57 = *(_DWORD *)(v38 + 4248) | 0x200;
    }
    *(_DWORD *)(v38 + 4248) = v57;
    goto LABEL_101;
  }
  return 4294956429;
}

void __28__AUAudioUnit_XPC_didCrash___block_invoke(uint64_t a1)
{
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  postNotificationIfNotPosted<caulk::weak_ref<AUAudioUnit_XPC>>(&to, *(void **)(a1 + 32));
}

void __32__AUAudioUnit_XPC_didInvalidate__block_invoke(uint64_t a1)
{
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  postNotificationIfNotPosted<caulk::weak_ref<AUAudioUnit_XPC>>(&to, *(void **)(a1 + 32));
}

void __45__AUAudioUnit_XPC__invalidatePipePoolAndUser__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[109];
    if (v2)
    {
      v8 = WeakRetained;
      std::recursive_mutex::lock((std::recursive_mutex *)v2);
      v3 = *(_QWORD *)(v2 + 80);
      for (i = *(_QWORD *)(v2 + 88); v3 != i; v3 += 8)
      {
        v5 = *(_QWORD *)(*(_QWORD *)v3 + 120);
        v6 = *(_QWORD *)(*(_QWORD *)v3 + 128);
        while (v5 != v6)
        {
          v7 = *(_QWORD *)(v5 + 8);
          if (v7)
          {
            atomic_store(1u, (unsigned __int8 *)(v7 + 2));
            audioipc::rt_sender<(audioipc::ipcnode_options)0,audioipc::eventlink_primitive,caulk::ipc::mapped_memory>::stop(v7 + 8);
          }
          v5 += 32;
        }
      }
      std::recursive_mutex::unlock((std::recursive_mutex *)v2);
      WeakRetained = v8;
    }
  }

}

void __38__AUAudioUnit_XPC__doOpen_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  caulk::strong<AURemoteMessageChannel>((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "didCrash:", v5);

}

- (AUAudioUnit)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[AUAudioUnit init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Don't call %@."), v4);

  return 0;
}

- (AUAudioUnit)initWithComponentDescription:(AudioComponentDescription *)componentDescription options:(AudioComponentInstantiationOptions)options error:(NSError *)outError
{
  AudioComponent Next;
  uint64_t (***v10)(_QWORD);
  int v11;
  BOOL v12;
  NSError *v13;
  char *v14;
  AUAudioUnit *v15;
  __int128 v16;
  void *v17;
  UInt32 componentFlagsMask;
  void *v19;
  void *v20;
  BOOL v21;
  os_log_t v22;
  _QWORD *v24;
  NSObject *v25;
  AUAudioUnit *v26;
  objc_super v27;
  _QWORD aBlock[6];
  __int128 v29;
  UInt32 v30;
  AudioComponentInstantiationOptions v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  CADeprecated::TSingleton<AUAudioUnitProperties>::instance();
  if (!-[AUAudioUnit isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v27.receiver = self;
    v27.super_class = (Class)AUAudioUnit;
    v14 = -[AUAudioUnit init](&v27, sel_init);
    v15 = (AUAudioUnit *)v14;
    if (v14)
    {
      v16 = *(_OWORD *)&componentDescription->componentType;
      *((_DWORD *)v14 + 142) = componentDescription->componentFlagsMask;
      *(_OWORD *)(v14 + 552) = v16;
      *((_DWORD *)v14 + 12) = 512;
      *((_QWORD *)v14 + 7) = 128;
      v17 = (void *)*((_QWORD *)v14 + 43);
      *((_QWORD *)v14 + 43) = 0;

      v15->_isLoadedInProcess = 1;
      v15->_requestViewControllerSynchronously = 0;
      v15->_hostMIDIProtocol = 0;
      v15->_shouldUseMIDI2 = 1;
    }
    return v15;
  }

  Next = AudioComponentFindNext(0, componentDescription);
  if (!Next)
  {
    if (outError)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -3000, 0);
      v13 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    return 0;
  }
  v10 = (uint64_t (***)(_QWORD))(**(uint64_t (***)(AudioComponent))Next)(Next);
  if (v10)
  {
    v11 = *(_DWORD *)((**v10)(v10) + 48);
    v12 = (v11 & 8) == 0;
    if ((v11 & 8) != 0 && !AllowUnsafeMainThreadServicing("-[AUAudioUnit initWithComponentDescription:options:error:]"))
    {
      if (outError)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10863, 0);
        v13 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v15 = 0;
        *outError = v13;
        return v15;
      }
      return 0;
    }
  }
  else
  {
    v12 = 1;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__5799;
  v42 = __Block_byref_object_dispose__5800;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5799;
  v36 = __Block_byref_object_dispose__5800;
  v37 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke;
  aBlock[3] = &unk_1E2920E60;
  componentFlagsMask = componentDescription->componentFlagsMask;
  v29 = *(_OWORD *)&componentDescription->componentType;
  v30 = componentFlagsMask;
  v31 = options;
  aBlock[4] = &v38;
  aBlock[5] = &v32;
  v19 = _Block_copy(aBlock);
  v20 = v19;
  if (v12)
    v21 = Synchronously((uint64_t)v19);
  else
    v21 = Synchronously_ServicingMainRunLoop((uint64_t)v19);
  if (!v21)
  {
    if (gAudioComponentLogCategory)
    {
      v22 = *(os_log_t *)gAudioComponentLogCategory;
    }
    else
    {
      v24 = (_QWORD *)operator new();
      v24[1] = 0;
      v22 = os_log_create("com.apple.coreaudio", "audiocomp");
      *v24 = v22;
      gAudioComponentLogCategory = (uint64_t)v24;
    }
    v25 = objc_retainAutorelease(v22);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "AUAudioUnit.mm";
      v46 = 1024;
      v47 = 551;
      _os_log_impl(&dword_18EE07000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d Timeout running task synchronously", buf, 0x12u);
    }
  }
  if (outError)
    *outError = (NSError *)objc_retainAutorelease((id)v33[5]);
  v26 = (AUAudioUnit *)(id)v39[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v26;
}

- (void)setLoadedOutOfProcess
{
  self->_isLoadedInProcess = 0;
}

- (AUAudioUnit)initWithComponentDescription:(AudioComponentDescription *)componentDescription error:(NSError *)outError
{
  AudioComponentDescription v5;

  v5 = *componentDescription;
  return -[AUAudioUnit initWithComponentDescription:options:error:](self, "initWithComponentDescription:options:error:", &v5, 0, outError);
}

- (void)dealloc
{
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  APComponent *ptr;
  unsigned int *v7;
  unsigned int v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  objc_super v11;

  if (self->_renderResourcesAllocated)
  {
    self->_renderResourcesAllocated = 0;
    -[AUAudioUnit internalDeallocateRenderResources](self, "internalDeallocateRenderResources");
  }
  -[AUAudioUnit resolveComponent](self, "resolveComponent");
  cntrl = self->_component.__cntrl_;
  if (cntrl)
  {
    v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4)
    {
      v5 = v4;
      ptr = self->_component.__ptr_;
      if (ptr)
      {
        v7 = (unsigned int *)((char *)ptr + 136);
        do
          v8 = __ldaxr(v7);
        while (__stlxr(v8 - 1, v7));
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  -[AUAudioUnit tearDownExtension](self, "tearDownExtension");

  v11.receiver = self;
  v11.super_class = (Class)AUAudioUnit;
  -[AUAudioUnit dealloc](&v11, sel_dealloc);
}

- (void)invalidateAudioUnit
{
  char *v3;
  char v4;

  v3 = (char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead + 4;
  v4 = 1;
  caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                       + 4));
  self->_realtimeState.contextChangeGenerator.var0.__val_.mObserver = 0;
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v3);
}

- (OpaqueAudioComponentInstance)audioUnit
{
  return 0;
}

- (void)resolveComponent
{
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  APComponent *ptr;
  unint64_t *p_shared_owners;
  unint64_t v8;
  AudioComponent Next;
  uint64_t v10;
  __shared_weak_count *v11;
  APComponent *v12;
  unint64_t *v13;
  unint64_t v14;
  __shared_weak_count *v15;

  cntrl = self->_component.__cntrl_;
  if (cntrl)
  {
    v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4)
    {
      v5 = v4;
      ptr = self->_component.__ptr_;
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (v8)
      {
        if (ptr)
          return;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
        if (ptr)
          return;
      }
    }
  }
  Next = AudioComponentFindNext(0, &self->_componentDescription);
  if (Next)
  {
    v10 = (**(uint64_t (***)(AudioComponent))Next)(Next);
    if (v10)
    {
      v12 = *(APComponent **)(v10 + 8);
      v11 = *(__shared_weak_count **)(v10 + 16);
      if (v11)
      {
        v13 = (unint64_t *)((char *)v11 + 16);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      v15 = self->_component.__cntrl_;
      self->_component.__ptr_ = v12;
      self->_component.__cntrl_ = v11;
      if (v15)
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v15);
    }
  }
}

- (AudioComponent)component
{
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  APComponent *ptr;
  unint64_t *p_shared_owners;
  unint64_t v8;

  -[AUAudioUnit resolveComponent](self, "resolveComponent");
  cntrl = self->_component.__cntrl_;
  if (!cntrl)
    return 0;
  v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v4)
    return 0;
  v5 = v4;
  ptr = self->_component.__ptr_;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v8 = __ldaxr(p_shared_owners);
  while (__stlxr(v8 - 1, p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  return (AudioComponent)ptr;
}

- (NSString)componentName
{
  NSString *componentName;
  NSString *v4;
  __CFString *v6;

  componentName = self->_componentName;
  if (!componentName)
  {
    v6 = 0;
    Impl_AudioGetComponentInfo(-[AUAudioUnit component](self, "component"), 0, (const __CFString **)&v6);
    if (v6)
    {
      v4 = self->_componentName;
      self->_componentName = &v6->isa;

    }
    componentName = self->_componentName;
  }
  return componentName;
}

- (NSString)audioUnitName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;

  -[AUAudioUnit componentName](self, "componentName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(": "));
  if (v4)
  {
    objc_msgSend(v2, "substringFromIndex:", v3 + v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v2;
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)manufacturerName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  -[AUAudioUnit componentName](self, "componentName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(": "));
  if (v4)
  {
    objc_msgSend(v2, "substringToIndex:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E2923288;
  }

  return (NSString *)v5;
}

- (uint32_t)componentVersion
{
  AUAudioUnit *v2;

  v2 = self;
  LODWORD(self) = self->_componentVersion;
  if (!(_DWORD)self)
  {
    self = -[AUAudioUnit component](v2, "component");
    if (self)
    {
      self = (AUAudioUnit *)(*(uint64_t (**)(AUAudioUnit *))self->super.isa)(self);
      if (self)
        LODWORD(self) = *(_DWORD *)((*(uint64_t (**)(AUAudioUnit *))self->super.isa)(self) + 56);
    }
    v2->_componentVersion = self;
  }
  return self;
}

- (void)eventSchedule
{
  return &self->_realtimeState.eventSchedule.mScheduledParameterRefresher;
}

- (void)scheduledParameterRefresher
{
  unsigned __int8 v2;
  unsigned __int8 v4;
  void *v5;
  __guard *v6;

  if (self->_isLoadedInProcess)
  {
    if ((v2 & 1) != 0
    {
      return &AUScheduledParameterRefresher2::hostInstance(void)::global;
    }
    v5 = &AUScheduledParameterRefresher2::hostInstance(void)::global;
    AUScheduledParameterRefresher2::AUScheduledParameterRefresher2((AUScheduledParameterRefresher2 *)&AUScheduledParameterRefresher2::hostInstance(void)::global);
  }
  else
  {
    if ((v4 & 1) != 0
    {
      return &AUScheduledParameterRefresher2::remoteServiceInstance(void)::global;
    }
    v5 = &AUScheduledParameterRefresher2::remoteServiceInstance(void)::global;
    AUScheduledParameterRefresher2::AUScheduledParameterRefresher2((AUScheduledParameterRefresher2 *)&AUScheduledParameterRefresher2::remoteServiceInstance(void)::global);
  }
  __cxa_guard_release(v6);
  return v5;
}

- (void)auv2GetParameterSynchronizer
{
  return &self->_anon_f8[24];
}

- (AURenderBlock)renderBlock
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  RealtimeState *p_realtimeState;
  AUAudioUnit *v12;
  void *v13;

  -[AUAudioUnit internalRenderBlock](self, "internalRenderBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AUAudioUnit renderContextObserver](self, "renderContextObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    if (v4)
    {
      std::optional<RenderContextChangeGenerator>::emplace[abi:ne180100]<void({block_pointer} {__strong}&)(AudioUnitRenderContext const*),void>((RenderContextChangeGenerator *)&self->_anon_f8[48], &v13);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = 2;
      else
        v5 = 3;
    }
    *(_DWORD *)&self->_anon_f8[72] = v5;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__AUAudioUnit_renderBlock__block_invoke;
    v9[3] = &unk_1E2920E88;
    p_realtimeState = &self->_realtimeState;
    v12 = self;
    v10 = v3;
    v7 = _Block_copy(v9);
    v6 = _Block_copy(v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deliverV2Parameters:(const AURenderEvent *)next
{
  void *v4;
  double v5;
  void *v6;
  id i;

  -[AUAudioUnit parameterTree](self, "parameterTree");
  for (i = (id)objc_claimAutoreleasedReturnValue(); next; next = next->head.next)
  {
    if (next->head.eventType == AURenderEventParameter && next->MIDIEventsList.eventList.packet[0].wordCount)
    {
      objc_msgSend(i, "parameterWithAddress:", next->parameter.parameterAddress);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      if (v4)
      {
        *(AUValue *)&v5 = next->parameter.value;
        objc_msgSend(v4, "setValue:originator:", 10, v5);
      }

    }
  }

}

- (AUInternalRenderBlock)internalRenderBlock
{
  return 0;
}

- (AUScheduleParameterBlock)scheduleParameterBlock
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__AUAudioUnit_scheduleParameterBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v32__0q8I16Q20f28l;
  aBlock[4] = &self->_realtimeState;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

- (void)setV2Parameter:(unint64_t)a3 value:(float)a4 bufferOffset:(unsigned int)a5 sequenceNumber:(unsigned int)a6
{
  unint64_t v10;
  char *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  AUScheduledParameterRefresher2 **p_mScheduledParameterRefresher;
  unint64_t v17;
  int v18;
  unsigned __int8 *p_auv2GetParameterSynchronizer;
  unsigned __int8 v20;
  uint64_t v21;
  id mObserver;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v10 = a5 | 0xFFFFFFFE00000000;
  v11 = (char *)XAtomicPoolAllocator::alloc((XAtomicPoolAllocator *)self->_realtimeState.eventSchedule.mAddedEventQueue.mEnqueueHead.__a_.__a_value);
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = v10;
  v11[16] = 1;
  *(_DWORD *)(v11 + 17) = 0;
  *((_DWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 3) = a3;
  *((float *)v11 + 8) = a4;
  *((_DWORD *)v11 + 9) = a6;
  *((_QWORD *)v11 + 5) = pthread_self();
  v12 = (unint64_t *)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8];
  v13 = *(_QWORD *)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8];
  atomic_store(v13, (unint64_t *)v11);
  v14 = __ldaxr((unint64_t *)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8]);
  if (v14 == v13)
  {
    if (!__stlxr((unint64_t)v11, v12))
    {
      v15 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    __clrex();
  }
  v15 = 0;
LABEL_6:
  p_mScheduledParameterRefresher = &self->_realtimeState.eventSchedule.mScheduledParameterRefresher;
  if ((v15 & 1) == 0)
  {
    while (1)
    {
      atomic_store(v14, (unint64_t *)v11);
      v17 = __ldaxr(v12);
      if (v17 != v14)
        break;
      if (__stlxr((unint64_t)v11, v12))
        goto LABEL_11;
      v18 = 1;
LABEL_12:
      v14 = v17;
      if (v18)
        goto LABEL_13;
    }
    __clrex();
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
LABEL_13:
  p_auv2GetParameterSynchronizer = (unsigned __int8 *)&self->_realtimeState.auv2GetParameterSynchronizer;
  do
    v20 = __ldaxr(p_auv2GetParameterSynchronizer);
  while (__stlxr(1u, p_auv2GetParameterSynchronizer));
  if ((v20 & 1) == 0)
  {
    v21 = *(_QWORD *)self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding;
    mObserver = self->_realtimeState.contextChangeGenerator.var0.__val_.mObserver;
    v23 = PreviousRenderTime::parameterWatchdogFireTime((PreviousRenderTime *)&self->_realtimeState.renderBlockType);
    v25 = v24;
    v26 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*MEMORY[0x1E0DDB688] + 16))(*MEMORY[0x1E0DDB688], 72, 8);
    *(_DWORD *)(v26 + 16) = 0;
    *(_QWORD *)(v26 + 24) = v21;
    *(_QWORD *)(v26 + 32) = mObserver;
    *(_QWORD *)(v26 + 40) = p_mScheduledParameterRefresher;
    *(_QWORD *)(v26 + 48) = v23;
    *(_QWORD *)(v26 + 56) = v25;
    *(_QWORD *)v26 = &off_1E290B430;
    *(_QWORD *)(v26 + 8) = 0;
    caulk::concurrent::messenger::enqueue((caulk::concurrent::messenger *)(v21 + 128), (caulk::concurrent::message *)v26);
  }
}

- (float)getV2Parameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  float v13;
  float v14;

  if (a4)
  {
    v6 = *(_QWORD *)&self->_anon_f8[24];
    if (HIDWORD(v6))
LABEL_16:
      std::terminate();
    v7 = *(_QWORD *)&a4;
    if ((int)(v6 - a4) < 0)
    {
      v8 = 0;
      v9 = (unint64_t *)&self->_anon_f8[24];
      while (1)
      {
        v10 = __ldaxr(v9);
        if (v10 != (v8 & 0xFFFFFFFF00000000 | v6))
          break;
        if (__stlxr(v6 | (unint64_t)(v7 << 32), v9))
          goto LABEL_9;
        caulk::semaphore::timed_wait((caulk::semaphore *)&self->_anon_f8[32], -1.0);
        v6 = atomic_load(v9);
        v8 = HIDWORD(v6);
        if (HIDWORD(v6))
          goto LABEL_16;
LABEL_11:
        if ((int)v6 - (int)v7 >= 0)
          goto LABEL_12;
      }
      __clrex();
LABEL_9:
      v8 = v10 & 0xFFFFFFFF00000000;
      LODWORD(v6) = v10;
      goto LABEL_11;
    }
  }
LABEL_12:
  -[AUAudioUnit parameterTree](self, "parameterTree");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parameterWithAddress:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "setLocalValueStale:", 1);
    objc_msgSend(v12, "value");
    v14 = v13;
  }
  else
  {
    v14 = 0.0;
  }

  return v14;
}

- (BOOL)isMusicDeviceOrEffect
{
  OSType componentType;
  BOOL result;

  componentType = self->_componentDescription.componentType;
  result = 1;
  if ((componentType - 1635085670 > 0xF || ((1 << (componentType - 102)) & 0x8009) == 0)
    && componentType != 1635086953
    && componentType != 1635086957)
  {
    return 0;
  }
  return result;
}

- (AUScheduleMIDIEventBlock)scheduleMIDIEventBlock
{
  RealtimeState *p_realtimeState;
  MIDIProtocolID v4;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  _QWORD v20[5];
  std::__shared_weak_count *v21;
  RealtimeState *v22;
  _QWORD aBlock[5];
  std::__shared_weak_count *v24;
  RealtimeState *v25;
  _QWORD v26[5];

  if (!-[AUAudioUnit isMusicDeviceOrEffect](self, "isMusicDeviceOrEffect"))
    return 0;
  p_realtimeState = &self->_realtimeState;
  if (self->_renderResourcesAllocated)
    v4 = *(_DWORD *)&self->_anon_f8[76];
  else
    v4 = -[AUAudioUnit AudioUnitMIDIProtocol](self, "AudioUnitMIDIProtocol");
  if (self->_shouldUseMIDI2 && v4)
  {
    if (v4 == kMIDIProtocol_2_0)
    {
      v6 = (std::__shared_weak_count *)operator new(0x840uLL);
      v6->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      v6->__shared_weak_owners_ = 0;
      v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917A98;
      bzero(&v6[1], 0x824uLL);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3321888768;
      v20[2] = __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_27;
      v20[3] = &__block_descriptor_56_ea8_32c85_ZTSNSt3__110shared_ptrIN4MIDI19LegacyMIDIConverterINS1_22MIDI_1_to_2_TranslatorEEEEE_e18_v36__0q8C16q20r_28l;
      v20[4] = v6 + 1;
      v21 = v6;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      v22 = p_realtimeState;
      v9 = _Block_copy(v20);
      v16 = v21;
      if (v21)
      {
        v17 = (unint64_t *)&v21->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      goto LABEL_28;
    }
    if (v4 == kMIDIProtocol_1_0)
    {
      v6 = (std::__shared_weak_count *)operator new(0x20uLL);
      v6->__shared_owners_ = 0;
      v7 = (unint64_t *)&v6->__shared_owners_;
      v6->__shared_weak_owners_ = 0;
      v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917A60;
      LOBYTE(v6[1].__vftable) = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3321888768;
      aBlock[2] = __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_2;
      aBlock[3] = &__block_descriptor_56_ea8_32c81_ZTSNSt3__110shared_ptrIN4MIDI19LegacyMIDIConverterINS1_18IdentityTranslatorEEEEE_e18_v36__0q8C16q20r_28l;
      aBlock[4] = v6 + 1;
      v24 = v6;
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
      v25 = p_realtimeState;
      v9 = _Block_copy(aBlock);
      v10 = v24;
      if (v24)
      {
        v11 = (unint64_t *)&v24->__shared_owners_;
        do
          v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      do
        v13 = __ldaxr(v7);
      while (__stlxr(v13 - 1, v7));
LABEL_28:
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
      goto LABEL_31;
    }
    v9 = &__block_literal_global_5782;
  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke;
    v26[3] = &__block_descriptor_40_e18_v36__0q8C16q20r_28l;
    v26[4] = &self->_realtimeState;
    v9 = _Block_copy(v26);
  }
LABEL_31:
  v19 = _Block_copy(v9);

  return v19;
}

- (AUMIDIEventListBlock)scheduleMIDIEventListBlock
{
  RealtimeState *p_realtimeState;
  MIDIProtocolID v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  void *v15;
  _QWORD aBlock[5];
  std::__shared_weak_count *v17;
  RealtimeState *v18;
  MIDIProtocolID v19;
  _QWORD v20[5];

  if (!self->_shouldUseMIDI2 || !-[AUAudioUnit isMusicDeviceOrEffect](self, "isMusicDeviceOrEffect"))
  {
    v9 = 0;
    return v9;
  }
  p_realtimeState = &self->_realtimeState;
  if (self->_renderResourcesAllocated)
  {
    v4 = *(_DWORD *)&self->_anon_f8[76];
    if (v4)
      goto LABEL_5;
LABEL_18:
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke;
    v20[3] = &__block_descriptor_40_e61_i28__0q8C16r__MIDIEventList_iI_1_MIDIEventPacket_QI_64I____20l;
    v20[4] = &self->_realtimeState;
    v15 = _Block_copy(v20);
    v9 = _Block_copy(v15);

    return v9;
  }
  v4 = -[AUAudioUnit AudioUnitMIDIProtocol](self, "AudioUnitMIDIProtocol");
  if (!v4)
    goto LABEL_18;
LABEL_5:
  v5 = (std::__shared_weak_count *)operator new(0xB40uLL);
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917AD0;
  bzero(&v5[1], 0xB24uLL);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3321888768;
  aBlock[2] = __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke_2;
  aBlock[3] = &__block_descriptor_60_ea8_32c55_ZTSNSt3__110shared_ptrIN4MIDI20DynamicMIDIConverterEEE_e61_i28__0q8C16r__MIDIEventList_iI_1_MIDIEventPacket_QI_64I____20l;
  aBlock[4] = v5 + 1;
  v17 = v5;
  do
    v7 = __ldxr(p_shared_owners);
  while (__stxr(v7 + 1, p_shared_owners));
  v19 = v4;
  v18 = p_realtimeState;
  v8 = _Block_copy(aBlock);
  v9 = _Block_copy(v8);

  v10 = v17;
  if (v17)
  {
    v11 = (unint64_t *)&v17->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return v9;
}

- (NSArray)MIDIOutputNames
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSInteger)tokenByAddingRenderObserver:(AURenderObserver)observer
{
  NodeStack *p_mPendingList;
  unsigned int v5;
  signed int v6;
  id v7;
  NSInteger v8;
  NSInteger v10;
  id v11;

  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  do
  {
    v5 = __ldxr((unsigned int *)&RenderObserverList::sToken);
    v6 = v5 + 1;
  }
  while (__stxr(v6, (unsigned int *)&RenderObserverList::sToken));
  RenderObserver::RenderObserver(&v10, v6, observer, 0, 0);
  TThreadSafeList<RenderObserver>::deferred_add((uint64_t)p_mPendingList, (uint64_t)&v10);
  LOBYTE(self->_realtimeState.eventSchedule.mAUv2GetParameterSynchronizer) = 1;
  v8 = v10;
  v7 = v11;
  v11 = 0;

  return v8;
}

- (void)removeRenderObserver:(NSInteger)token
{
  NodeStack *p_mPendingList;
  id v4;
  uint64_t v5;
  id v6;

  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  RenderObserver::RenderObserver(&v5, token, 0, 0, 0);
  TThreadSafeList<RenderObserver>::deferred_remove((uint64_t)p_mPendingList, (uint64_t)&v5);
  v4 = v6;
  v6 = 0;

}

- (void)addRenderObserver:(void *)a3 userData:(void *)a4
{
  NodeStack *p_mPendingList;
  id v6;
  uint64_t v7;
  id v8;

  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  RenderObserver::RenderObserver(&v7, 0, 0, (uint64_t)a3, (uint64_t)a4);
  TThreadSafeList<RenderObserver>::deferred_add((uint64_t)p_mPendingList, (uint64_t)&v7);
  LOBYTE(self->_realtimeState.eventSchedule.mAUv2GetParameterSynchronizer) = 1;
  v6 = v8;
  v8 = 0;

}

- (void)removeRenderObserver:(void *)a3 userData:(void *)a4
{
  NodeStack *p_mPendingList;
  id v5;
  uint64_t v6;
  id v7;

  p_mPendingList = &self->_realtimeState.renderObserverList.mObservers.mPendingList;
  RenderObserver::RenderObserver(&v6, 0, 0, (uint64_t)a3, (uint64_t)a4);
  TThreadSafeList<RenderObserver>::deferred_remove((uint64_t)p_mPendingList, (uint64_t)&v6);
  v5 = v7;
  v7 = 0;

}

- (BOOL)allocateRenderResourcesAndReturnError:(NSError *)outError
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t SlotForKey;
  unint64_t v17;
  void *v18;
  AUAudioUnit *v19;
  uint64_t v20;
  void *v21;
  int *a_value;
  unsigned __int128 *v23;

  if (self->_renderResourcesAllocated)
    return 1;
  -[AUAudioUnit outputBusses](self, "outputBusses", outError);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "format");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sampleRate");
    v6 = v9;

  }
  v10 = -[AUAudioUnit scheduledParameterRefresher](self, "scheduledParameterRefresher");
  std::mutex::lock((std::mutex *)(v10 + 368));
  v11 = (uint64_t *)atomic_load((unint64_t *)v10 + 41);
  v12 = *((_DWORD *)v10 + 80) + 1;
  *((_DWORD *)v10 + 80) = v12;
  if (!v11)
  {
    v15 = 8;
    goto LABEL_9;
  }
  v13 = 16 * v12;
  v14 = *((_DWORD *)v11 + 2);
  if (v13 / v14 >= 0xB)
  {
    v15 = 2 * v14;
LABEL_9:
    v11 = (uint64_t *)caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::rehash((unint64_t *)v10 + 36, v15);
  }
  SlotForKey = caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::table_impl::findSlotForKey(v11, (uint64_t)self);
  if ((SlotForKey & 1) != 0)
  {
    --*((_DWORD *)v10 + 80);
  }
  else
  {
    v17 = operator new();
    *(_DWORD *)v17 = 0x10000;
    *(_QWORD *)(v17 + 8) = self;
    *(_DWORD *)(v17 + 16) = 0;
    atomic_store(v17, (unint64_t *)&v11[HIDWORD(SlotForKey) + 2]);
    caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::emptyReleasePool((uint64_t)(v10 + 288));
  }
  std::mutex::unlock((std::mutex *)(v10 + 368));
  v18 = -[AUAudioUnit scheduledParameterRefresher](self, "scheduledParameterRefresher");
  v19 = self;
  v19->_realtimeState.contextChangeGenerator.var0.__val_.mObserver = v19;
  -[AUAudioUnit renderBlock](v19, "renderBlock");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)&v19->_realtimeState.contextChangeGenerator.__engaged_;
  *(_QWORD *)&v19->_realtimeState.contextChangeGenerator.__engaged_ = v20;

  *(_QWORD *)&v19->_realtimeState.renderBlockType = v6;
  *(_QWORD *)v19->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding = v18;
  a_value = (int *)v19->_realtimeState.eventSchedule.mAddedEventQueue.mEnqueueHead.__a_.__a_value;
  if (a_value[24] <= 511)
  {
    do
      XAtomicPoolAllocator::allocChunk((XAtomicPoolAllocator *)a_value);
    while (a_value[24] < 512);
  }
  if (a_value[52] <= 511)
  {
    do
      XAtomicPoolAllocator::allocChunk((XAtomicPoolAllocator *)(a_value + 28));
    while (a_value[52] < 512);
  }
  if (a_value[80] <= 511)
  {
    do
      XAtomicPoolAllocator::allocChunk((XAtomicPoolAllocator *)(a_value + 56));
    while (a_value[80] < 512);
  }
  v23 = (unsigned __int128 *)&v19->_anon_f8[8];
  do
    __ldaxp(v23);
  while (__stlxp(0, v23));

  *(_DWORD *)&v19->_anon_f8[76] = -[AUAudioUnit AudioUnitMIDIProtocol](v19, "AudioUnitMIDIProtocol");
  self->_renderResourcesAllocated = 1;

  return 1;
}

- (void)deallocateRenderResources
{
  if (self->_renderResourcesAllocated)
  {
    self->_renderResourcesAllocated = 0;
    -[AUAudioUnit internalDeallocateRenderResources](self, "internalDeallocateRenderResources");
  }
}

- (void)internalDeallocateRenderResources
{
  char *v3;
  AUAudioUnit *v4;
  unint64_t v5;
  unint64_t SlotForKey;
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  int v10;
  int v13;
  unsigned int v14;
  unsigned int v15;
  id transportStateBlock;
  id musicalContextBlock;
  id MIDIOutputEventBlock;
  id MIDIOutputEventListBlock;
  id MIDIOutputEventHostBlock;
  id MIDIOutputEventListHostBlock;
  char *v23;
  uint64_t v24;
  std::unique_lock<std::mutex> v25;

  v23 = (char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead + 4;
  LOBYTE(v24) = 1;
  caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                       + 4));
  AUEventSchedule::uninitialize((AUEventSchedule *)&self->_realtimeState.eventSchedule.mScheduledParameterRefresher);
  v3 = -[AUAudioUnit scheduledParameterRefresher](self, "scheduledParameterRefresher", v23, v24);
  v4 = self;
  AUScheduledParameterRefresher::performPendingMessages((AUScheduledParameterRefresher *)v3);
  v25.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v3 + 368);
  v25.__owns_ = 1;
  std::mutex::lock((std::mutex *)(v3 + 368));
  v5 = atomic_load((unint64_t *)v3 + 41);
  if (v5)
  {
    SlotForKey = caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::table_impl::findSlotForKey((uint64_t *)v5, (uint64_t)v4);
    if ((SlotForKey & 1) != 0)
    {
      v8 = v7;
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v5 + 8 * HIDWORD(SlotForKey) + 16));
      if (v7)
      {
        v9 = atomic_load((unsigned int *)v3 + 84);
        if (v9 >= 1)
        {
          do
          {
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(50);
            v10 = atomic_load((unsigned int *)v3 + 84);
          }
          while (v10 > 0);
        }
        if ((unsigned __int16)atomic_load(v8))
        {
          std::unique_lock<std::mutex>::unlock(&v25);
          while ((unsigned __int16)atomic_load(v8))
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(500);
          std::unique_lock<std::mutex>::lock(&v25);
          v5 = atomic_load((unint64_t *)v3 + 41);
        }
        caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::element_t::release(v8);
        v13 = *((_DWORD *)v3 + 80) - 1;
        *((_DWORD *)v3 + 80) = v13;
        if (v5)
        {
          v14 = 16 * v13;
          v15 = *(_DWORD *)(v5 + 8);
          if (v14 / v15 <= 2 && v15 >= 9)
            caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::rehash((unint64_t *)v3 + 36, v15 >> 1);
        }
      }
    }
  }
  caulk::concurrent::guarded_lookup_hash_table<void *,int,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(void *)>>::emptyReleasePool((uint64_t)(v3 + 288));
  if (v25.__owns_)
    std::mutex::unlock(v25.__m_);

  transportStateBlock = v4->_transportStateBlock;
  v4->_transportStateBlock = 0;

  musicalContextBlock = v4->_musicalContextBlock;
  v4->_musicalContextBlock = 0;

  MIDIOutputEventBlock = v4->_MIDIOutputEventBlock;
  v4->_MIDIOutputEventBlock = 0;

  MIDIOutputEventListBlock = v4->_MIDIOutputEventListBlock;
  v4->_MIDIOutputEventListBlock = 0;

  MIDIOutputEventHostBlock = v4->_MIDIOutputEventHostBlock;
  v4->_MIDIOutputEventHostBlock = 0;

  MIDIOutputEventListHostBlock = v4->_MIDIOutputEventListHostBlock;
  v4->_MIDIOutputEventListHostBlock = 0;

  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v23);
}

- (void)setParameterTree:(AUParameterTree *)parameterTree
{
  objc_storeStrong((id *)&self->_parameterTree, parameterTree);
}

- (AUParameterTree)parameterTree
{
  return self->_parameterTree;
}

- (BOOL)supportsUserPresets
{
  return 0;
}

- (NSArray)parametersForOverviewWithCount:(NSInteger)count
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array", count);
}

- (void)flushEventSchedule
{
  AUScheduledParameterRefresher2 **p_mScheduledParameterRefresher;
  unsigned __int8 v4;
  AURenderEvent *v5;
  unsigned __int128 *v6;
  _QWORD v7[3];
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  int v13;

  p_mScheduledParameterRefresher = &self->_realtimeState.eventSchedule.mScheduledParameterRefresher;
  v4 = atomic_load((unsigned __int8 *)&self->_realtimeState.auv2GetParameterSynchronizer);
  if ((v4 & 1) != 0)
  {
    v13 = 0x8000;
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    v8 = (char *)0xC200000000000000;
    v12 = 1;
    memset(v7, 0, sizeof(v7));
    (*(void (**)(_QWORD, int *, char **, uint64_t, _QWORD, _QWORD *, _QWORD))(*(_QWORD *)&self->_realtimeState.contextChangeGenerator.__engaged_
                                                                                      + 16))(*(_QWORD *)&self->_realtimeState.contextChangeGenerator.__engaged_, &v13, &v8, 0x1000000, 0, v7, 0);
  }
  v8 = (char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead + 4;
  LOBYTE(v9) = 1;
  caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                       + 4));
  v5 = (AURenderEvent *)AUEventSchedule::preRender((AUEventSchedule *)p_mScheduledParameterRefresher, 0x7FFFFFFFFFFFFFFEuLL, 1u, 0);
  AUEventSchedule::postRender((AUEventSchedule *)p_mScheduledParameterRefresher, v5);
  v6 = (unsigned __int128 *)&self->_anon_f8[8];
  do
    __ldaxp(v6);
  while (__stlxp(0, v6));
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v8);
}

- (NSArray)channelCapabilities
{
  return 0;
}

- (AUAudioUnitBusArray)inputBusses
{
  return 0;
}

- (AUAudioUnitBusArray)outputBusses
{
  return 0;
}

- (NSDictionary)fullState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CASerializer v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E2932E20, CFSTR("version"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_componentDescription.componentType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_componentDescription.componentSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subtype"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_componentDescription.componentManufacturer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("manufacturer"));

  CASerializer::CASerializer(&v9, 0);
  -[AUAudioUnit parameterTree](self, "parameterTree");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_serialize:", &v9);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9.var0, CFSTR("data"));
  MEMORY[0x193FFD878](&v9);
  return (NSDictionary *)v3;
}

- (void)setFullState:(NSDictionary *)fullState
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  OSType componentManufacturer;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = fullState;
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unsignedIntValue") != self->_componentDescription.componentType)
    goto LABEL_8;
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "unsignedIntValue") != self->_componentDescription.componentSubType)
  {

LABEL_8:
    goto LABEL_9;
  }
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("manufacturer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");
  componentManufacturer = self->_componentDescription.componentManufacturer;

  if (v8 != componentManufacturer)
  {
LABEL_9:
    if (kAUExtensionScope)
    {
      v10 = *(id *)kAUExtensionScope;
      if (!v10)
        goto LABEL_16;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "AUAudioUnit.mm";
      v16 = 1024;
      v17 = 1166;
      _os_log_impl(&dword_18EE07000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d setFullState: preset type/subtype/manufacturer does not match", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_15;
  }
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("data"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[AUAudioUnit parameterTree](self, "parameterTree");
    v11 = objc_claimAutoreleasedReturnValue();
    -[AUAudioUnit willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("allParameterValues"));
    MEMORY[0x193FFD944](&v14, v10);
    -[NSObject _deserialize:fromSetFullState:](v11, "_deserialize:fromSetFullState:", &v14, 1);
    -[AUAudioUnit didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("allParameterValues"));
    MEMORY[0x193FFD95C](&v14);
  }
  else
  {
    if (kAUExtensionScope)
    {
      v11 = *(id *)kAUExtensionScope;
      if (!v11)
      {
        v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "AUAudioUnit.mm";
      v16 = 1024;
      v17 = 1171;
      _os_log_impl(&dword_18EE07000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d setFullState: no data", (uint8_t *)&v14, 0x12u);
    }
  }

LABEL_15:
LABEL_16:

}

- (id)cachedViewController
{
  return self->_cachedViewController;
}

- (void)setCachedViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_cachedViewController;
  UIViewController *cachedViewController;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  cachedViewController = self->_cachedViewController;
  p_cachedViewController = &self->_cachedViewController;
  if (cachedViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_cachedViewController, a3);
    v5 = v8;
  }

}

- (void)requestViewControllerWithCompletionHandler:(void *)completionHandler
{
  (*((void (**)(void *, UIViewController *))completionHandler + 2))(completionHandler, self->_cachedViewController);
}

- (BOOL)providesUserInterface
{
  uint64_t v2;

  v2 = -[AUAudioUnit methodForSelector:](self, "methodForSelector:", sel_requestViewControllerWithCompletionHandler_);
  return v2 != +[AUAudioUnit instanceMethodForSelector:](AUAudioUnit, "instanceMethodForSelector:", sel_requestViewControllerWithCompletionHandler_);
}

- (void)setupMIDIConversion
{
  MIDIProtocolID v3;
  void *v4;
  void *v5;
  id MIDIOutputEventBlock;
  void *v7;
  id v8;
  id v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  id v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  id MIDIOutputEventListBlock;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  id v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  std::__shared_weak_count *v41;
  std::__shared_weak_count *v42;
  MIDIProtocolID v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD *v48;
  std::__shared_weak_count *v49;
  _QWORD v50[4];
  id v51;
  _QWORD *v52;
  std::__shared_weak_count *v53;
  _QWORD aBlock[4];
  id v55;

  v3 = -[AUAudioUnit hostMIDIProtocol](self, "hostMIDIProtocol");
  v4 = _Block_copy(self->_MIDIOutputEventHostBlock);
  v5 = _Block_copy(self->_MIDIOutputEventListHostBlock);
  MIDIOutputEventBlock = self->_MIDIOutputEventBlock;
  if (MIDIOutputEventBlock)
  {
    self->_MIDIOutputEventBlock = 0;

  }
  if (v3 == kMIDIProtocol_2_0)
  {
    if (!v5)
      goto LABEL_31;
    v10 = (std::__shared_weak_count *)operator new(0x840uLL);
    v10->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    v10->__shared_weak_owners_ = 0;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917A98;
    bzero(&v10[1], 0x824uLL);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3321888768;
    v46[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_59;
    v46[3] = &unk_1E2918520;
    v48 = &v10[1].__vftable;
    v49 = v10;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    v47 = v5;
    v13 = _Block_copy(v46);
    v14 = self->_MIDIOutputEventBlock;
    self->_MIDIOutputEventBlock = v13;

    v15 = v49;
    if (v49)
    {
      v16 = (unint64_t *)&v49->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
LABEL_27:
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    goto LABEL_31;
  }
  if (v3 == kMIDIProtocol_1_0)
  {
    if (!v5)
      goto LABEL_31;
    v10 = (std::__shared_weak_count *)operator new(0x20uLL);
    v10->__shared_owners_ = 0;
    v19 = (unint64_t *)&v10->__shared_owners_;
    v10->__shared_weak_owners_ = 0;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917A60;
    LOBYTE(v10[1].__vftable) = 0;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3321888768;
    v50[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_2;
    v50[3] = &unk_1E29184E8;
    v52 = &v10[1].__vftable;
    v53 = v10;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
    v51 = v5;
    v21 = _Block_copy(v50);
    v22 = self->_MIDIOutputEventBlock;
    self->_MIDIOutputEventBlock = v21;

    v23 = v53;
    if (v53)
    {
      v24 = (unint64_t *)&v53->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    do
      v18 = __ldaxr(v19);
    while (__stlxr(v18 - 1, v19));
    goto LABEL_27;
  }
  if (v3)
  {
    v9 = self->_MIDIOutputEventBlock;
    self->_MIDIOutputEventBlock = &__block_literal_global_61_5754;
  }
  else
  {
    if (!v4)
      goto LABEL_31;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke;
    aBlock[3] = &unk_1E2920F30;
    v55 = v4;
    v7 = _Block_copy(aBlock);
    v8 = self->_MIDIOutputEventBlock;
    self->_MIDIOutputEventBlock = v7;

    v9 = v55;
  }

LABEL_31:
  MIDIOutputEventListBlock = self->_MIDIOutputEventListBlock;
  if (MIDIOutputEventListBlock)
  {
    self->_MIDIOutputEventListBlock = 0;

  }
  if ((v3 - 1) >= 2)
  {
    if (v3)
    {
      v38 = self->_MIDIOutputEventListBlock;
      self->_MIDIOutputEventListBlock = &__block_literal_global_64;
    }
    else
    {
      if (!v4)
        goto LABEL_50;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_2_62;
      v44[3] = &unk_1E2920F98;
      v45 = v4;
      v36 = _Block_copy(v44);
      v37 = self->_MIDIOutputEventListBlock;
      self->_MIDIOutputEventListBlock = v36;

      v38 = v45;
    }

    goto LABEL_50;
  }
  if (v5)
  {
    v27 = (std::__shared_weak_count *)operator new(0xB40uLL);
    v27->__shared_owners_ = 0;
    v28 = (unint64_t *)&v27->__shared_owners_;
    v27->__shared_weak_owners_ = 0;
    v27->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917AD0;
    bzero(&v27[1], 0xB24uLL);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3321888768;
    v39[2] = __34__AUAudioUnit_setupMIDIConversion__block_invoke_3;
    v39[3] = &unk_1E29185E8;
    v41 = v27 + 1;
    v42 = v27;
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
    v43 = v3;
    v40 = v5;
    v30 = _Block_copy(v39);
    v31 = self->_MIDIOutputEventListBlock;
    self->_MIDIOutputEventListBlock = v30;

    v32 = v42;
    if (v42)
    {
      v33 = (unint64_t *)&v42->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    do
      v35 = __ldaxr(v28);
    while (__stlxr(v35 - 1, v28));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
LABEL_50:

}

- (void)setMIDIOutputEventBlock:(AUMIDIOutputEventBlock)MIDIOutputEventBlock
{
  AUMIDIOutputEventBlock v4;
  id MIDIOutputEventHostBlock;
  BOOL v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;

  v4 = MIDIOutputEventBlock;
  v13 = v4;
  if (self->_shouldUseMIDI2)
  {
    MIDIOutputEventHostBlock = self->_MIDIOutputEventHostBlock;
    if (MIDIOutputEventHostBlock)
      v6 = MIDIOutputEventHostBlock == v4;
    else
      v6 = 1;
    if (!v6)
    {
      self->_MIDIOutputEventHostBlock = 0;

      v4 = v13;
    }
    v7 = (void *)objc_msgSend(v4, "copy");
    v8 = self->_MIDIOutputEventHostBlock;
    self->_MIDIOutputEventHostBlock = v7;

    -[AUAudioUnit setupMIDIConversion](self, "setupMIDIConversion");
  }
  else
  {
    v9 = self->_MIDIOutputEventBlock;
    if (v9)
      v10 = v9 == v4;
    else
      v10 = 1;
    if (!v10)
    {
      self->_MIDIOutputEventBlock = 0;

      v4 = v13;
    }
    v11 = (void *)objc_msgSend(v4, "copy");
    v12 = self->_MIDIOutputEventBlock;
    self->_MIDIOutputEventBlock = v11;

  }
}

- (AUMIDIOutputEventBlock)MIDIOutputEventBlock
{
  return _Block_copy(self->_MIDIOutputEventBlock);
}

- (void)setMIDIOutputEventListBlock:(AUMIDIEventListBlock)MIDIOutputEventListBlock
{
  AUMIDIEventListBlock v4;
  id MIDIOutputEventListHostBlock;
  BOOL v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;

  v4 = MIDIOutputEventListBlock;
  v13 = v4;
  if (self->_shouldUseMIDI2)
  {
    MIDIOutputEventListHostBlock = self->_MIDIOutputEventListHostBlock;
    if (MIDIOutputEventListHostBlock)
      v6 = MIDIOutputEventListHostBlock == v4;
    else
      v6 = 1;
    if (!v6)
    {
      self->_MIDIOutputEventListHostBlock = 0;

      v4 = v13;
    }
    v7 = (void *)objc_msgSend(v4, "copy");
    v8 = self->_MIDIOutputEventListHostBlock;
    self->_MIDIOutputEventListHostBlock = v7;

    -[AUAudioUnit setupMIDIConversion](self, "setupMIDIConversion");
  }
  else
  {
    v9 = self->_MIDIOutputEventListBlock;
    if (v9)
      v10 = v9 == v4;
    else
      v10 = 1;
    if (!v10)
    {
      self->_MIDIOutputEventListBlock = 0;

      v4 = v13;
    }
    v11 = (void *)objc_msgSend(v4, "copy");
    v12 = self->_MIDIOutputEventListBlock;
    self->_MIDIOutputEventListBlock = v11;

  }
}

- (AUMIDIEventListBlock)MIDIOutputEventListBlock
{
  return _Block_copy(self->_MIDIOutputEventListBlock);
}

- (void)setMaximumFramesToRender:(AUAudioFrameCount)maximumFramesToRender
{
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_renderResourcesAllocated)
  {
    self->_maximumFramesToRender = maximumFramesToRender;
    return;
  }
  if (kAUExtensionScope)
  {
    v3 = *(id *)kAUExtensionScope;
    if (!v3)
      return;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "AUAudioUnit.mm";
    v7 = 1024;
    v8 = 1417;
    _os_log_impl(&dword_18EE07000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot set maximumFramesToRender while render resources allocated.", (uint8_t *)&v5, 0x12u);
  }

}

- (AUAudioFrameCount)maximumFramesToRender
{
  return self->_maximumFramesToRender;
}

- (void)setMIDIOutputBufferSizeHint:(NSInteger)MIDIOutputBufferSizeHint
{
  self->_MIDIOutputBufferSizeHint = MIDIOutputBufferSizeHint;
}

- (NSInteger)MIDIOutputBufferSizeHint
{
  return self->_MIDIOutputBufferSizeHint;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (id)_valueForProperty:(id)a3 error:(id *)a4
{
  -[AUAudioUnit valueForKey:](self, "valueForKey:", *((_QWORD *)a3 + 1), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSIndexSet)supportedViewConfigurations:(NSArray *)availableViewConfigurations
{
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet", availableViewConfigurations);
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (MIDICIProfileState)profileStateForCable:(uint8_t)cable channel:(MIDIChannelNumber)channel
{
  uint64_t v4;
  objc_class *v5;
  id v6;

  v4 = channel;
  v5 = (objc_class *)(id)objc_opt_self();
  if (v5)
  {
    v6 = [v5 alloc];
    v5 = (objc_class *)objc_msgSend(v6, "initWithChannel:enabledProfiles:disabledProfiles:", v4, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }
  return (MIDICIProfileState *)v5;
}

- (BOOL)enableProfile:(MIDICIProfile *)profile cable:(uint8_t)cable onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  NSError *v7;

  if (outError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v7 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *outError = v7;

  }
  return 0;
}

- (BOOL)disableProfile:(MIDICIProfile *)profile cable:(uint8_t)cable onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  NSError *v7;

  if (outError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v7 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *outError = v7;

  }
  return 0;
}

- (BOOL)saveUserPreset:(AUAudioUnitPreset *)userPreset error:(NSError *)outError
{
  AUAudioUnitPreset *v6;
  BOOL v7;
  NSError *v8;

  v6 = userPreset;
  if (!-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
  {
    if (!outError)
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v8 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = 0;
    *outError = v8;
    goto LABEL_7;
  }
  if (!self->_isLoadedInProcess)
  {
    -[AUAudioUnit startUserPresetFolderMonitoring](self, "startUserPresetFolderMonitoring");
    -[AUAudioUnit fullStateForDocument](self, "fullStateForDocument");
    v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    v7 = +[AUAudioUnit _saveUserPreset:state:error:](AUAudioUnit, "_saveUserPreset:state:error:", v6, v8, outError);
LABEL_7:

    goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

- (NSDictionary)presetStateFor:(AUAudioUnitPreset *)userPreset error:(NSError *)outError
{
  AUAudioUnitPreset *v6;
  NSError *v7;

  v6 = userPreset;
  if (!-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
  {
    if (!outError)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v7 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *outError = v7;

LABEL_6:
    outError = 0;
    goto LABEL_7;
  }
  if (self->_isLoadedInProcess)
    goto LABEL_6;
  +[AUAudioUnit _presetStateFor:error:](AUAudioUnit, "_presetStateFor:error:", v6, outError);
  outError = (NSError **)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return (NSDictionary *)outError;
}

- (BOOL)deleteUserPreset:(AUAudioUnitPreset *)userPreset error:(NSError *)outError
{
  AUAudioUnitPreset *v6;
  NSError *v7;

  v6 = userPreset;
  if (-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
  {
    if (self->_isLoadedInProcess)
    {
      LOBYTE(outError) = 1;
    }
    else
    {
      -[AUAudioUnit startUserPresetFolderMonitoring](self, "startUserPresetFolderMonitoring");
      LOBYTE(outError) = +[AUAudioUnit _deleteUserPreset:error:](AUAudioUnit, "_deleteUserPreset:error:", v6, outError);
    }
  }
  else if (outError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v7 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *outError = v7;

    LOBYTE(outError) = 0;
  }

  return (char)outError;
}

- (void)startUserPresetFolderMonitoring
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *presetMonitoringQueue;
  OS_dispatch_source *v7;
  OS_dispatch_source *presetFolderWatcher;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _BYTE location[12];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_presetFolderWatcher)
  {
    if (self->_presetMonitoringQueue)
    {
LABEL_5:
      objc_initWeak((id *)location, self);
      presetMonitoringQueue = self->_presetMonitoringQueue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __46__AUAudioUnit_startUserPresetFolderMonitoring__block_invoke;
      v11[3] = &unk_1E29225C8;
      objc_copyWeak(&v12, (id *)location);
      +[AUAudioUnit _monitorUserPresets:callback:](AUAudioUnit, "_monitorUserPresets:callback:", presetMonitoringQueue, v11);
      v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
      presetFolderWatcher = self->_presetFolderWatcher;
      self->_presetFolderWatcher = v7;

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
      return;
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("AUExtension.PresetMonitoring", v3);
    v5 = self->_presetMonitoringQueue;
    self->_presetMonitoringQueue = v4;

    if (self->_presetMonitoringQueue)
    {

      goto LABEL_5;
    }
    if (kAUExtensionScope)
    {
      v9 = *(id *)kAUExtensionScope;
      if (!v9)
      {
LABEL_14:

        return;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "AUAudioUnit.mm";
      v14 = 1024;
      v15 = 1665;
      _os_log_impl(&dword_18EE07000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AUExtension.PresetMonitoring queue!", location, 0x12u);
    }

    goto LABEL_14;
  }
}

- (NSArray)userPresets
{
  NSMutableArray *userPresets;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  NSMutableArray *v9;
  id v10;

  if (!-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  userPresets = self->_userPresets;
  if (self->_isLoadedInProcess || userPresets)
    return (NSArray *)userPresets;
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = self->_userPresets;
  self->_userPresets = v5;

  v7 = self->_userPresets;
  v10 = 0;
  +[AUAudioUnit _loadUserPresets:error:](AUAudioUnit, "_loadUserPresets:error:", v7, &v10);
  v8 = v10;
  -[AUAudioUnit startUserPresetFolderMonitoring](self, "startUserPresetFolderMonitoring");
  v9 = self->_userPresets;

  return (NSArray *)v9;
}

- (os_workgroup_t)osWorkgroup
{
  return 0;
}

- (BOOL)isLoadedInProcess
{
  return self->_isLoadedInProcess;
}

- (int)remoteProcessIdentifier
{
  return 0;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)remoteProcessAuditToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return self;
}

- (BOOL)isSpeechSynthesisProvider
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getAVSpeechSynthesisProviderAudioUnitClass(void)::softClass;
  v9 = getAVSpeechSynthesisProviderAudioUnitClass(void)::softClass;
  if (!getAVSpeechSynthesisProviderAudioUnitClass(void)::softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___ZL42getAVSpeechSynthesisProviderAudioUnitClassv_block_invoke;
    v5[3] = &unk_1E29222D8;
    v5[4] = &v6;
    ___ZL42getAVSpeechSynthesisProviderAudioUnitClassv_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isLocalCachingDisabled
{
  return self->_localCachingDisabled;
}

- (void)setLocalCachingDisabled:(BOOL)a3
{
  self->_localCachingDisabled = a3;
}

- (id)messageChannelFor:(NSString *)channelName
{
  return 0;
}

- (AudioComponentDescription)componentDescription
{
  *retstr = *(AudioComponentDescription *)((char *)self + 552);
  return self;
}

- (NSString)audioUnitShortName
{
  return self->_audioUnitShortName;
}

- (BOOL)renderResourcesAllocated
{
  return self->_renderResourcesAllocated;
}

- (BOOL)allParameterValues
{
  return self->_allParameterValues;
}

- (NSInteger)virtualMIDICableCount
{
  return self->_virtualMIDICableCount;
}

- (MIDIProtocolID)AudioUnitMIDIProtocol
{
  return self->_AudioUnitMIDIProtocol;
}

- (MIDIProtocolID)hostMIDIProtocol
{
  return self->_hostMIDIProtocol;
}

- (void)setHostMIDIProtocol:(MIDIProtocolID)hostMIDIProtocol
{
  self->_hostMIDIProtocol = hostMIDIProtocol;
}

- (NSArray)factoryPresets
{
  return self->_factoryPresets;
}

- (AUAudioUnitPreset)currentPreset
{
  return self->_currentPreset;
}

- (void)setCurrentPreset:(AUAudioUnitPreset *)currentPreset
{
  objc_storeStrong((id *)&self->_currentPreset, currentPreset);
}

- (NSTimeInterval)latency
{
  return self->_latency;
}

- (NSTimeInterval)tailTime
{
  return self->_tailTime;
}

- (NSInteger)renderQuality
{
  return self->_renderQuality;
}

- (void)setRenderQuality:(NSInteger)renderQuality
{
  self->_renderQuality = renderQuality;
}

- (BOOL)shouldBypassEffect
{
  return self->_shouldBypassEffect;
}

- (void)setShouldBypassEffect:(BOOL)shouldBypassEffect
{
  self->_shouldBypassEffect = shouldBypassEffect;
}

- (BOOL)canProcessInPlace
{
  return self->_canProcessInPlace;
}

- (BOOL)isRenderingOffline
{
  return self->_renderingOffline;
}

- (void)setRenderingOffline:(BOOL)renderingOffline
{
  self->_renderingOffline = renderingOffline;
}

- (AUHostMusicalContextBlock)musicalContextBlock
{
  return self->_musicalContextBlock;
}

- (void)setMusicalContextBlock:(AUHostMusicalContextBlock)musicalContextBlock
{
  objc_setProperty_nonatomic_copy(self, a2, musicalContextBlock, 488);
}

- (AUHostTransportStateBlock)transportStateBlock
{
  return self->_transportStateBlock;
}

- (void)setTransportStateBlock:(AUHostTransportStateBlock)transportStateBlock
{
  objc_setProperty_nonatomic_copy(self, a2, transportStateBlock, 496);
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setContextName:(NSString *)contextName
{
  objc_setProperty_nonatomic_copy(self, a2, contextName, 504);
}

- (NSArray)migrateFromPlugin
{
  return self->_migrateFromPlugin;
}

- (BOOL)supportsMPE
{
  return self->_supportsMPE;
}

- (NSArray)channelMap
{
  return self->_channelMap;
}

- (void)setChannelMap:(NSArray *)channelMap
{
  objc_setProperty_nonatomic_copy(self, a2, channelMap, 520);
}

- (AUMIDICIProfileChangedBlock)profileChangedBlock
{
  return self->_profileChangedBlock;
}

- (void)setProfileChangedBlock:(AUMIDICIProfileChangedBlock)profileChangedBlock
{
  objc_setProperty_nonatomic_copy(self, a2, profileChangedBlock, 528);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (AUv3HostIdentifier)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostIdentifier, a3);
}

- (BOOL)requestViewControllerSynchronously
{
  return self->_requestViewControllerSynchronously;
}

- (void)setRequestViewControllerSynchronously:(BOOL)a3
{
  self->_requestViewControllerSynchronously = a3;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;

  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong(&self->_profileChangedBlock, 0);
  objc_storeStrong((id *)&self->_channelMap, 0);
  objc_storeStrong((id *)&self->_migrateFromPlugin, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
  objc_storeStrong(&self->_transportStateBlock, 0);
  objc_storeStrong(&self->_musicalContextBlock, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_factoryPresets, 0);
  objc_storeStrong((id *)&self->_audioUnitShortName, 0);
  objc_storeStrong(&self->_MIDIOutputEventListHostBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventHostBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventListBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventBlock, 0);
  objc_storeStrong((id *)&self->_presetFolderWatcher, 0);
  objc_storeStrong((id *)&self->_presetMonitoringQueue, 0);
  objc_storeStrong((id *)&self->_userPresets, 0);
  objc_storeStrong((id *)&self->_parameterTree, 0);
  if (self->_anon_f8[64])
    RenderContextChangeGenerator::~RenderContextChangeGenerator((RenderContextChangeGenerator *)&self->_anon_f8[48]);
  MEMORY[0x193FFDDC4](&self->_anon_f8[32]);
  AUEventSchedule::~AUEventSchedule((AUEventSchedule *)&self->_realtimeState.eventSchedule.mScheduledParameterRefresher);
  TThreadSafeList<RenderObserver>::NodeStack::free_all((uint64_t *)&self->_realtimeState.renderObserverList.mObservers.mPendingList);
  TThreadSafeList<RenderObserver>::NodeStack::free_all((uint64_t *)&self->_realtimeState.renderObserverList.mObservers.mFreeList);
  TThreadSafeList<RenderObserver>::NodeStack::free_all((uint64_t *)&self->_realtimeState.renderObserverList.mTouched);
  objc_storeStrong((id *)&self->_cachedViewController, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  cntrl = self->_component.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

- (id).cxx_construct
{
  AURenderEventNode *v3;

  self->_component.__ptr_ = 0;
  self->_component.__cntrl_ = 0;
  caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)&self->_realtimeState);
  caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)((char *)&self->_realtimeState.renderObserverList.mObservers.mActiveList.mHead
                                                                                        + 4));
  self->_realtimeState.eventSchedule.mScheduledParameterRefresher = (AUScheduledParameterRefresher2 *)&self->_anon_f8[24];
  self->_realtimeState.renderObserverList.mObservers.mPendingList.mHead = 0;
  LOBYTE(self->_realtimeState.eventSchedule.mAUv2GetParameterSynchronizer) = 0;
  self->_realtimeState.renderObserverList.mObservers.mFreeList.mHead = 0;
  *(_QWORD *)&self->_realtimeState.renderObserverList.mTouched = 0;
  v3 = (AURenderEventNode *)CADeprecated::TSingleton<AURenderEventAllocator>::instance();
  self->_realtimeState.eventSchedule.mScheduleHead = 0;
  LOBYTE(self->_realtimeState.auv2GetParameterSynchronizer.mSyncGetParamSema.mMachSem) = 0;
  *(_QWORD *)&self->_anon_f8[8] = 0;
  *(_QWORD *)&self->_anon_f8[16] = 0;
  *(_QWORD *)self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding = 0;
  *(_QWORD *)&self->_realtimeState.eventSchedule.mAddedEventQueue.mDequeueHead.padding[8] = 0;
  self->_realtimeState.eventSchedule.mAddedEventQueue.mEnqueueHead.__a_.__a_value = v3;
  self->_realtimeState.contextChangeGenerator.var0 = 0u;
  *(_OWORD *)&self->_realtimeState.contextChangeGenerator.__engaged_ = 0u;
  MEMORY[0x193FFDC98]();
  *(_QWORD *)&self->_anon_f8[24] = 0;
  caulk::semaphore::semaphore((caulk::semaphore *)&self->_anon_f8[32]);
  self->_anon_f8[48] = 0;
  self->_anon_f8[64] = 0;
  *(_QWORD *)&self->_anon_f8[72] = 0;
  return self;
}

void __46__AUAudioUnit_startUserPresetFolderMonitoring__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[43];
    WeakRetained[43] = 0;

    objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("userPresets"));
    objc_msgSend(WeakRetained, "didChangeValueForKey:", CFSTR("userPresets"));
  }

}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_2(uint64_t a1, void *a2, char a3, unsigned int a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  unsigned int v11;
  uint64_t (**v12)();
  id v13[2];
  char v14;
  unsigned int *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v8 = a4;
  v9 = _Block_copy(*(const void **)(a1 + 32));
  v12 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ34__AUAudioUnit_setupMIDIConversion_EUb3_E3__5EE;
  v13[0] = _Block_copy(v9);
  v13[1] = a2;
  v14 = a3;
  v15 = &v11;
  MIDI::LegacyMIDIConverter<MIDI::IdentityTranslator>::convertLegacyDataToEventList(a5, v8, 0, (uint64_t *)&v12);
  ((void (*)(id *))v12[3])(v13);

  return v11;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_59(uint64_t a1, void *a2, char a3, unsigned int a4, uint64_t a5)
{
  uint64_t v8;
  int *v9;
  void *v10;
  unsigned int v12;
  uint64_t (**v13)();
  id v14[2];
  char v15;
  unsigned int *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v8 = a4;
  v9 = *(int **)(a1 + 40);
  v10 = _Block_copy(*(const void **)(a1 + 32));
  v13 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ34__AUAudioUnit_setupMIDIConversion_EUb4_E3__6EE;
  v14[0] = _Block_copy(v10);
  v14[1] = a2;
  v15 = a3;
  v16 = &v12;
  MIDI::LegacyMIDIConverter<MIDI::MIDI_1_to_2_Translator>::convertLegacyDataToEventList(v9, a5, v8, 0, (uint64_t *)&v13);
  ((void (*)(id *))v13[3])(v14);

  return v12;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_2_62(uint64_t a1, uint64_t a2, char a3, _DWORD *a4)
{
  void *v7;
  unsigned int v9;
  uint64_t (**v10)();
  unsigned int *v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v7 = _Block_copy(*(const void **)(a1 + 32));
  v10 = _ZN5caulk16inplace_functionIFvPKN4MIDI16LegacyPacketListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ34__AUAudioUnit_setupMIDIConversion_EUb5_E3__7EE;
  v11 = &v9;
  v12 = a3;
  v13 = a2;
  v14 = _Block_copy(v7);
  MIDI::convertEventListToPacketList(a4, (uint64_t *)&v10);
  ((void (*)(unsigned int **))v10[3])(&v11);

  return v9;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_3(uint64_t a1, uint64_t a2, unsigned int a3, int *a4)
{
  MIDIProtocolID v5;
  int v6;
  uint64_t v7;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  MIDIEventPacket *v13;
  unint64_t v14;
  MIDIEventPacket *v15;
  UInt32 v16;
  UInt32 v17;
  UInt32 v18;
  int *v19;
  unint64_t v20;
  unsigned __int8 *v21;
  UInt32 v22;
  int v23;
  int v24;
  int v25;
  MIDITimeStamp v26;
  int v27;
  char v28;
  MIDIEventPacket *v29;
  UInt32 v30;
  int v31;
  MIDITimeStamp v32;
  MIDIEventPacket *v33;
  MIDIEventPacket *v34;
  uint64_t v35;
  MIDIEventPacket *v36;
  int v37;
  MIDITimeStamp v38;
  MIDIEventPacket *v39;
  MIDIEventPacket *v40;
  unint64_t v41;
  ByteCount v42;
  MIDIEventPacket *v43;
  MIDIEventPacket *v44;
  MIDIEventPacket *v45;
  MIDIEventPacket *v46;
  BOOL v47;
  unsigned int v48;
  _DWORD *v49;
  uint64_t v50;
  uint64_t (**v51)(void *, uint64_t, _QWORD, MIDIEventList *);
  MIDIEventPacket *v52;
  MIDIEventPacket *v53;
  BOOL v54;
  unsigned int v55;
  _DWORD *v56;
  uint64_t v57;
  uint64_t (**v58)(void *, uint64_t, _QWORD, MIDIEventList *);
  MIDIEventPacket *v59;
  unint64_t v60;
  MIDIEventPacket *v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  UInt32 v69;
  unsigned int v70;
  BOOL v71;
  MIDIEventPacket *v72;
  int v73;
  unsigned int v74;
  UInt32 v75;
  unsigned int v76;
  MIDITimeStamp v77;
  MIDIEventPacket *v78;
  unsigned int v79;
  unsigned int v80;
  UInt32 v81;
  unsigned int v82;
  unsigned int v83;
  UInt32 v84;
  MIDIEventPacket *v85;
  unsigned int v86;
  uint64_t v87;
  uint64_t v88;
  int *v89;
  unsigned __int8 v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int j;
  int v95;
  int v96;
  uint64_t v97;
  char v99;
  int v100;
  uint64_t v101;
  int v102;
  unsigned __int8 *v103;
  unsigned int v104;
  UInt32 v105;
  unsigned int i;
  uint64_t v107;
  unsigned int v108;
  BOOL v109;
  int *v111;
  char v112;
  _BYTE *v113;
  unint64_t v114;
  uint64_t v115;
  _OWORD *v116;
  int v117;
  int v118;
  int *v119;
  uint64_t (**v120)(void *, uint64_t, _QWORD, MIDIEventList *);
  uint64_t (**aBlock)(void *, uint64_t, _QWORD, int *);
  MIDITimeStamp time[2];
  MIDITimeStamp v126;
  _DWORD *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  UInt32 words[2];
  uint64_t v132;
  MIDIEventList evtlist;
  UInt32 v134[2];
  uint64_t v135;

  v5 = *(_DWORD *)(a1 + 56);
  v119 = *(int **)(a1 + 40);
  aBlock = (uint64_t (**)(void *, uint64_t, _QWORD, int *))_Block_copy(*(const void **)(a1 + 32));
  v6 = *a4;
  if (*a4 == v5)
  {
    v7 = a4[1];
    if ((_DWORD)v7)
    {
      if ((_DWORD)v7 == 1 && a4[4] <= 0x40)
      {
        v7 = aBlock[2](aBlock, a2, a3, a4);
      }
      else
      {
        v7 = 0;
        v48 = 0;
        v49 = a4 + 2;
        do
        {
          v50 = v49[2];
          v127 = v49 + 3;
          v128 = v50;
          v129 = *(_QWORD *)v49;
          v130 = 0;
          v51 = (uint64_t (**)(void *, uint64_t, _QWORD, MIDIEventList *))_Block_copy(aBlock);
          v52 = MIDIEventListInit(&evtlist, v5);
          *(_QWORD *)words = 0;
          *(_QWORD *)v134 = 0;
          v135 = 0;
          while (MIDI::EventList::PacketReader::read((uint64_t *)&v127, words, v134))
          {
            v52 = MIDIEventListAdd(&evtlist, 0x114uLL, v52, *(MIDITimeStamp *)words, MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
            if (!v52)
            {
              if (!(_DWORD)v7)
                v7 = v51[2](v51, a2, a3, &evtlist);
              memset(&evtlist, 0, sizeof(evtlist));
              v53 = MIDIEventListInit(&evtlist, v5);
              v52 = MIDIEventListAdd(&evtlist, 0x114uLL, v53, *(MIDITimeStamp *)words, MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
            }
          }
          if (evtlist.numPackets)
            v54 = (_DWORD)v7 == 0;
          else
            v54 = 0;
          if (v54)
            v7 = v51[2](v51, a2, a3, &evtlist);

          v49 += v49[2] + 3;
          ++v48;
        }
        while (v48 < a4[1]);
      }
    }
    goto LABEL_239;
  }
  if (v5 != kMIDIProtocol_2_0 || v6 != 1)
  {
    v9 = v5 == kMIDIProtocol_1_0 && v6 == 2;
    if (v9 && a4[1])
    {
      v7 = 0;
      v10 = 0;
      v11 = (uint64_t)(a4 + 2);
      v111 = v119 + 521;
      while (1)
      {
        v117 = v10;
        v12 = *(unsigned int *)(v11 + 8);
        v127 = (_DWORD *)(v11 + 12);
        v128 = v12;
        v115 = v11;
        v129 = *(_QWORD *)v11;
        v130 = 0;
        v120 = (uint64_t (**)(void *, uint64_t, _QWORD, MIDIEventList *))_Block_copy(aBlock);
        v13 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
        time[0] = 0;
        *(_QWORD *)words = 0;
        v132 = 0;
        while (MIDI::EventList::PacketReader::read((uint64_t *)&v127, time, words))
        {
          v14 = (unint64_t)words[0] >> 28;
          if (((1 << v14) & 0xA02B) != 0)
          {
            v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, time[0], MIDI::UniversalPacket::word_sizes[v14], words);
            if (!v13)
            {
              if (!(_DWORD)v7)
                v7 = v120[2](v120, a2, a3, &evtlist);
              memset(&evtlist, 0, sizeof(evtlist));
              v15 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
              v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v15, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
            }
          }
          else if ((_DWORD)v14 == 4)
          {
            v16 = HIBYTE(words[0]) & 0xF | 0x20;
            v17 = words[1];
            switch(BYTE2(words[0]) >> 4)
            {
              case 2:
              case 3:
                v19 = &v111[12 * (HIBYTE(words[0]) & 0xF)];
                v20 = ((unint64_t)words[0] >> 16) & 0xF;
                v21 = (unsigned __int8 *)v19 + 3 * v20;
                v22 = (words[0] >> 8) & 0x7F;
                v118 = words[0] & 0x7F;
                if ((words[0] & 0x100000) != 0)
                  v23 = 2;
                else
                  v23 = 1;
                if (v23 != *v21 || v22 != v21[1])
                {
                  v24 = v20 | 0xB0;
LABEL_40:
                  v112 = v23;
                  v113 = (char *)v19 + 3 * v20;
                  v114 = ((unint64_t)words[0] >> 16) & 0xF;
                  if ((words[0] & 0x100000) != 0)
                    v27 = 25344;
                  else
                    v27 = 25856;
                  v135 = 0;
                  v25 = (v16 << 24) | (v24 << 16);
                  v28 = BYTE1(words[0]) & 0x7F;
                  *(_QWORD *)v134 = v27 | v22 | v25;
                  v29 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, time[0], 1uLL, v134);
                  if (v29)
                  {
                    v26 = time[0];
                  }
                  else
                  {
                    if (!(_DWORD)v7)
                      v7 = v120[2](v120, a2, a3, &evtlist);
                    memset(&evtlist, 0, sizeof(evtlist));
                    v33 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    v26 = time[0];
                    v29 = MIDIEventListAdd(&evtlist, 0x114uLL, v33, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
                  }
                  v135 = 0;
                  *(_QWORD *)v134 = v25 | (v27 - 256) | v118;
                  v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v29, v26, 1uLL, v134);
                  if (!v13)
                  {
                    if (!(_DWORD)v7)
                      v7 = v120[2](v120, a2, a3, &evtlist);
                    memset(&evtlist, 0, sizeof(evtlist));
                    v34 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v34, v26, MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
                  }
                  *v113 = v112;
                  v35 = (uint64_t)v19 + 3 * v114;
                  *(_BYTE *)(v35 + 1) = v28;
                  *(_BYTE *)(v35 + 2) = v118;
                  goto LABEL_63;
                }
                v24 = v20 | 0xB0;
                if (v118 != *((unsigned __int8 *)v19 + 3 * v20 + 2))
                  goto LABEL_40;
                v25 = (v24 << 16) | (v16 << 24);
                v26 = time[0];
LABEL_63:
                v135 = 0;
                *(_QWORD *)v134 = v25 | (v17 >> 25) | 0x600;
                v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, v26, 1uLL, v134);
                if (!v13)
                {
                  if (!(_DWORD)v7)
                    v7 = v120[2](v120, a2, a3, &evtlist);
                  memset(&evtlist, 0, sizeof(evtlist));
                  v36 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                  v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v36, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
                }
                v37 = (v17 >> 18) & 0x7F;
                if (v37)
                {
                  v135 = 0;
                  *(_QWORD *)v134 = v37 | v25 | 0x2600u;
                  v38 = time[0];
                  v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, time[0], 1uLL, v134);
                  if (!v13)
                  {
                    if (!(_DWORD)v7)
                      v7 = v120[2](v120, a2, a3, &evtlist);
                    memset(&evtlist, 0, sizeof(evtlist));
                    v39 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    v40 = MIDIEventListAdd(&evtlist, 0x114uLL, v39, v38, MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
                    goto LABEL_86;
                  }
                }
                break;
              case 8:
              case 9:
              case 10:
              case 11:
                v18 = BYTE2(words[0]) >> 4 == 9;
                if (words[1] >> 25)
                  v18 = words[1] >> 25;
                v135 = 0;
                *(_QWORD *)v134 = words[0] & 0x7F00 | (BYTE2(words[0]) << 16) | (v16 << 24) | v18;
                v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, time[0], 1uLL, v134);
                if (!v13)
                {
                  if (!(_DWORD)v7)
                    v7 = v120[2](v120, a2, a3, &evtlist);
                  goto LABEL_85;
                }
                continue;
              case 12:
                if ((words[0] & 1) != 0)
                {
                  v135 = 0;
                  v31 = BYTE2(words[0]) << 16;
                  v41 = (v31 - 0x100000) | (v16 << 24);
                  *(_QWORD *)v134 = (v31 - 0x100000) & 0xFFFFFF80 | (v16 << 24) | (words[1] >> 8) & 0x7F;
                  v42 = MIDI::UniversalPacket::word_sizes[v41 >> 28];
                  v43 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, time[0], v42, v134);
                  if (v43)
                  {
                    v32 = time[0];
                  }
                  else
                  {
                    if (!(_DWORD)v7)
                      v7 = v120[2](v120, a2, a3, &evtlist);
                    memset(&evtlist, 0, sizeof(evtlist));
                    v44 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    v32 = time[0];
                    v43 = MIDIEventListAdd(&evtlist, 0x114uLL, v44, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
                  }
                  v135 = 0;
                  *(_QWORD *)v134 = v41 | v17 & 0x7F | 0x2000;
                  v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v43, v32, v42, v134);
                  if (!v13)
                  {
                    if (!(_DWORD)v7)
                      v7 = v120[2](v120, a2, a3, &evtlist);
                    memset(&evtlist, 0, sizeof(evtlist));
                    v45 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                    v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v45, v32, MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
                  }
                  v30 = v16 << 24;
                }
                else
                {
                  v30 = v16 << 24;
                  v31 = BYTE2(words[0]) << 16;
                  v32 = time[0];
                }
                v135 = 0;
                *(_QWORD *)v134 = v31 | v30 | HIWORD(v17) & 0x7F00;
                v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, v32, 1uLL, v134);
                if (!v13)
                {
                  if (!(_DWORD)v7)
                    v7 = v120[2](v120, a2, a3, &evtlist);
                  goto LABEL_85;
                }
                continue;
              case 13:
                v135 = 0;
                *(_QWORD *)v134 = (BYTE2(words[0]) << 16) | (v16 << 24) | (words[1] >> 25 << 8);
                v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, time[0], 1uLL, v134);
                if (!v13)
                {
                  if (!(_DWORD)v7)
                    v7 = v120[2](v120, a2, a3, &evtlist);
                  goto LABEL_85;
                }
                continue;
              case 14:
                v135 = 0;
                *(_QWORD *)v134 = (words[1] >> 10) & 0x7F00 | (words[1] >> 25) | (BYTE2(words[0]) << 16) | (v16 << 24);
                v13 = MIDIEventListAdd(&evtlist, 0x114uLL, v13, time[0], 1uLL, v134);
                if (!v13)
                {
                  if (!(_DWORD)v7)
                    v7 = v120[2](v120, a2, a3, &evtlist);
LABEL_85:
                  memset(&evtlist, 0, sizeof(evtlist));
                  v46 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
                  v40 = MIDIEventListAdd(&evtlist, 0x114uLL, v46, time[0], MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
LABEL_86:
                  v13 = v40;
                }
                continue;
              default:
                continue;
            }
          }
        }
        if (evtlist.numPackets)
          v47 = (_DWORD)v7 == 0;
        else
          v47 = 0;
        if (v47)
          v7 = v120[2](v120, a2, a3, &evtlist);

        v11 = v115 + 4 * *(unsigned int *)(v115 + 8) + 12;
        v10 = v117 + 1;
        if (v117 + 1 >= a4[1])
          goto LABEL_239;
      }
    }
LABEL_238:
    v7 = 0;
    goto LABEL_239;
  }
  if (!a4[1])
    goto LABEL_238;
  v7 = 0;
  v55 = 0;
  v56 = a4 + 2;
  v116 = v119 + 4;
  do
  {
    v57 = v56[2];
    v127 = v56 + 3;
    v128 = v57;
    v129 = *(_QWORD *)v56;
    v130 = 0;
    v58 = (uint64_t (**)(void *, uint64_t, _QWORD, MIDIEventList *))_Block_copy(aBlock);
    v59 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
    time[1] = 0;
    v126 = 0;
    time[0] = 0;
    while (MIDI::EventList::PacketReader::read((uint64_t *)&v127, &v126, time))
    {
      v60 = LODWORD(time[0]);
      if (LODWORD(time[0]) >> 28 == 2)
      {
        *(_QWORD *)words = 0;
        v132 = 0;
        v62 = BYTE2(time[0]);
        v63 = *((unsigned __int8 *)v119 + 32);
        v64 = *v119;
        v65 = BYTE2(time[0]) >> 4;
        if (!*((_BYTE *)v119 + 32))
        {
          if ((v64 & 0xFF0000) != 0)
          {
            if (((v64 ^ LODWORD(time[0])) & 0xF0000) != 0)
            {
              v63 = 1;
              *((_BYTE *)v119 + 32) = 1;
            }
            else
            {
              if (v65 == 11)
              {
                switch(BYTE1(v64))
                {
                  case 'b':
                    v95 = time[0] & 0xFF00;
                    v96 = 25344;
                    goto LABEL_225;
                  case 'c':
                    v95 = time[0] & 0xFF00;
                    v96 = 25088;
                    goto LABEL_225;
                  case 'd':
                    v95 = time[0] & 0xFF00;
                    v96 = 25856;
                    goto LABEL_225;
                  case 'e':
                    v95 = time[0] & 0xFF00;
                    v96 = 25600;
LABEL_225:
                    if (v95 != v96 && (time[0] & 0xF0DF00) != 0xB00600)
                      break;
                    goto LABEL_229;
                  default:
                    if (BYTE1(v64) == 32)
                    {
                      if ((time[0] & 0xFF00) != 0)
                        break;
LABEL_229:
                      v63 = 0;
                      *v116 = *(_OWORD *)time;
                      goto LABEL_120;
                    }
                    if (!BYTE1(v64) && (time[0] & 0xFF00) == 0x2000)
                      goto LABEL_229;
                    break;
                }
LABEL_227:
                v63 = 1;
                goto LABEL_120;
              }
              v63 = (v64 & 0xDF00) != 0 || v65 != 12;
            }
          }
          else
          {
            v63 = 1;
            if ((time[0] & 0xF00000) == 0xB00000 && v65 == 11)
            {
              if (BYTE1(time[0]) - 98 >= 4 && BYTE1(time[0]) != 32 && BYTE1(time[0]))
                goto LABEL_227;
              v63 = 0;
              *(_OWORD *)v119 = *(_OWORD *)time;
              v64 = *v119;
            }
          }
        }
LABEL_120:
        v66 = BYTE3(v60) & 0xF;
        v67 = BYTE3(v60) & 0xF | 0x40;
        if (BYTE2(v64) && v63)
        {
          *((_BYTE *)v119 + 32) = 1;
          v135 = 0;
          v134[0] = v64 & 0xFF00 | (BYTE2(v64) << 16) & 0x80FFFFFF | ((BYTE3(v60) & 0xF | 0x40) << 24);
          v68 = v64;
          v69 = v64 << 25;
          if (v68 >= 0x41)
          {
            v70 = (v68 & 0x3F) << 19;
            if (v70)
            {
              do
              {
                v69 |= v70;
                v71 = v70 > 0x3F;
                v70 >>= 6;
              }
              while (v71);
            }
          }
          v134[1] = v69;
          v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v59, v126, 2uLL, v134);
          if (!v59)
          {
            if (!(_DWORD)v7)
              v7 = v58[2](v58, a2, a3, &evtlist);
            memset(&evtlist, 0, sizeof(evtlist));
            v72 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
            v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v72, v126, MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
          }
          *v119 = 0;
          v135 = 0;
          v73 = v119[4];
          v62 = BYTE2(v60);
          v66 = BYTE3(v60) & 0xF;
          if (BYTE2(v73))
          {
            LOWORD(v134[0]) = v73 & 0xFF00;
            BYTE2(v134[0]) = BYTE2(v73);
            HIBYTE(v134[0]) = BYTE3(v60) & 0xF | 0x40;
            v74 = v73;
            v75 = v73 << 25;
            if (v74 >= 0x41)
            {
              v76 = (v74 & 0x3F) << 19;
              if (v76)
              {
                do
                {
                  v75 |= v76;
                  v71 = v76 > 0x3F;
                  v76 >>= 6;
                }
                while (v71);
              }
            }
            v134[1] = v75;
            v77 = v126;
            v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v59, v126, 2uLL, v134);
            if (!v59)
            {
              if (!(_DWORD)v7)
                v7 = v58[2](v58, a2, a3, &evtlist);
              memset(&evtlist, 0, sizeof(evtlist));
              v78 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
              v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v78, v77, MIDI::UniversalPacket::word_sizes[(unint64_t)v134[0] >> 28], v134);
            }
            *(_DWORD *)v116 = 0;
            v62 = BYTE2(v60);
            v65 = BYTE2(v60) >> 4;
            v66 = BYTE3(v60) & 0xF;
          }
          else
          {
            v65 = BYTE2(v60) >> 4;
          }
          *(_QWORD *)((char *)&v119[32 * v66 + 8 + 2 * ((v60 >> 16) & 0xF)] + 1) = 0;
        }
        v79 = (v60 >> 8) & 0x7F;
        v80 = v60 & 0x7F;
        switch(v65)
        {
          case 8:
            goto LABEL_146;
          case 9:
            if ((v60 & 0x7F) == 0)
            {
              v62 -= 16;
              v80 = 64;
            }
LABEL_146:
            v81 = (v67 << 24) | (v62 << 16) | (v79 << 8);
            words[0] = v81;
            v82 = v80 << 9;
            if (v80 >= 0x41)
            {
              v83 = 8 * (v80 & 0x3F);
              if (v83)
              {
                do
                {
                  v82 |= v83;
                  v71 = v83 > 0x3F;
                  v83 >>= 6;
                }
                while (v71);
              }
            }
            v84 = v82 << 16;
            goto LABEL_150;
          case 10:
            v81 = (v62 << 16) | (v67 << 24) | (v79 << 8);
            words[0] = v81;
            v84 = (_DWORD)v60 << 25;
            if (v80 >= 0x41)
            {
              v86 = (v60 & 0x3F) << 19;
              if (v86)
              {
                do
                {
                  v84 |= v86;
                  v71 = v86 > 0x3F;
                  v86 >>= 6;
                }
                while (v71);
              }
            }
            goto LABEL_150;
          case 11:
            v87 = (uint64_t)&v119[32 * v66 + 8] + 1;
            v88 = (v60 >> 16) & 0xF;
            if (((v60 >> 8) & 0x7F) > 0x25)
            {
              switch(v79)
              {
                case 'b':
                  v97 = v87 + 8 * v88;
                  *(_BYTE *)(v97 + 1) = 2;
                  goto LABEL_214;
                case 'c':
                  v107 = v87 + 8 * v88;
                  *(_BYTE *)(v107 + 1) = 2;
                  goto LABEL_216;
                case 'd':
                  v97 = v87 + 8 * v88;
                  *(_BYTE *)(v97 + 1) = 1;
LABEL_214:
                  *(_BYTE *)(v97 + 5) = v80;
                  break;
                case 'e':
                  v107 = v87 + 8 * v88;
                  *(_BYTE *)(v107 + 1) = 1;
LABEL_216:
                  *(_BYTE *)(v107 + 4) = v80;
                  break;
                default:
                  if (v79 != 38)
                    goto LABEL_218;
                  v99 = v60 & 0x7F;
                  v100 = v60 & 0x7F;
                  goto LABEL_203;
              }
              goto LABEL_217;
            }
            if (!v79)
            {
              *(_BYTE *)(v87 + 8 * v88 + 2) = v80;
              goto LABEL_199;
            }
            if (v79 != 6)
            {
              if (v79 != 32)
                goto LABEL_218;
              *(_BYTE *)(v87 + 8 * v88 + 3) = v80;
LABEL_199:
              *(_BYTE *)(v87 + 8 * v88) = 1;
LABEL_217:
              if (!*((_BYTE *)v119 + 32))
                continue;
              goto LABEL_218;
            }
            v99 = 0;
            v100 = 0;
            *(_BYTE *)(v87 + 8 * v88 + 6) = v80;
LABEL_203:
            v101 = v87 + 8 * v88;
            *(_BYTE *)(v101 + 7) = v99;
            if (!*((_BYTE *)v119 + 32) && *(_BYTE *)(v101 + 1))
            {
              if (*(_BYTE *)(v101 + 1) == 1)
                v102 = 32;
              else
                v102 = 48;
              v103 = (unsigned __int8 *)(v87 + 8 * v88);
              v81 = (v67 << 24) | ((v102 | v88) << 16) | (v103[4] << 8) | v103[5];
              words[0] = v81;
              v104 = v100 | (v103[6] << 7);
              v105 = v104 << 18;
              if (v104 > 0x2000)
              {
                for (i = 32 * (v104 & 0x1FFF); i; i >>= 13)
                  v105 |= i;
              }
              words[1] = v105;
              *(_OWORD *)v119 = 0u;
              *((_OWORD *)v119 + 1) = 0u;
              goto LABEL_151;
            }
LABEL_218:
            v81 = (v62 << 16) | (v67 << 24) | (v79 << 8);
            words[0] = v81;
            v84 = (_DWORD)v60 << 25;
            if (v80 >= 0x41)
            {
              v108 = (v60 & 0x3F) << 19;
              if (v108)
              {
                do
                {
                  v84 |= v108;
                  v71 = v108 > 0x3F;
                  v108 >>= 6;
                }
                while (v71);
              }
            }
LABEL_150:
            words[1] = v84;
LABEL_151:
            v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v59, v126, MIDI::UniversalPacket::word_sizes[(unint64_t)v81 >> 28], words);
            if (!v59)
            {
              if (!(_DWORD)v7)
                v7 = v58[2](v58, a2, a3, &evtlist);
              memset(&evtlist, 0, sizeof(evtlist));
              v85 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
              v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v85, v126, MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
            }
            break;
          case 12:
            v89 = &v119[32 * v66 + 2 * (WORD1(v60) & 0xF)];
            v90 = *((_BYTE *)v119 + 32) ^ 1;
            if (!*((_BYTE *)v89 + 33))
              v90 = 0;
            v81 = (v62 << 16) | (v67 << 24) | v90;
            words[0] = v81;
            HIBYTE(words[1]) = BYTE1(v60) & 0x7F;
            BYTE1(words[1]) = *((_BYTE *)v89 + 35);
            LOBYTE(words[1]) = *((_BYTE *)v89 + 36);
            *(_QWORD *)((char *)v89 + 33) = 0;
            *(_OWORD *)v119 = 0u;
            *((_OWORD *)v119 + 1) = 0u;
            goto LABEL_151;
          case 13:
            v81 = (v62 << 16) | (v67 << 24);
            words[0] = v81;
            v91 = v60 >> 8 << 25;
            if (v79 >= 0x41)
            {
              v92 = ((v60 >> 8) & 0x3F) << 19;
              if (v92)
              {
                do
                {
                  v91 |= v92;
                  v71 = v92 > 0x3F;
                  v92 >>= 6;
                }
                while (v71);
              }
            }
            words[1] = v91;
            goto LABEL_151;
          case 14:
            v81 = (v62 << 16) | (v67 << 24);
            words[0] = v81;
            v93 = v79 | (v80 << 7);
            v84 = v93 << 18;
            if (v93 > 0x2000)
            {
              for (j = 32 * (v93 & 0x1FFF); j; j >>= 13)
                v84 |= j;
            }
            goto LABEL_150;
          default:
            v81 = words[0];
            goto LABEL_151;
        }
      }
      else
      {
        v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v59, v126, MIDI::UniversalPacket::word_sizes[(unint64_t)LODWORD(time[0]) >> 28], (const UInt32 *)time);
        if (!v59)
        {
          if (!(_DWORD)v7)
            v7 = v58[2](v58, a2, a3, &evtlist);
          memset(&evtlist, 0, sizeof(evtlist));
          v61 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
          v59 = MIDIEventListAdd(&evtlist, 0x114uLL, v61, v126, MIDI::UniversalPacket::word_sizes[(unint64_t)LODWORD(time[0]) >> 28], (const UInt32 *)time);
        }
      }
    }
    if (evtlist.numPackets)
      v109 = (_DWORD)v7 == 0;
    else
      v109 = 0;
    if (v109)
      v7 = v58[2](v58, a2, a3, &evtlist);

    v56 += v56[2] + 3;
    ++v55;
  }
  while (v55 < a4[1]);
LABEL_239:

  return v7;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_63()
{
  return 4294967292;
}

uint64_t __34__AUAudioUnit_setupMIDIConversion__block_invoke_60()
{
  return 0;
}

uint64_t __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke(uint64_t a1, uint64_t a2, char a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t (**v6)();
  _QWORD v7[2];
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 4294967246;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = _ZN5caulk16inplace_functionIFvPKN4MIDI16LegacyPacketListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb1_E3__3EE;
  v7[0] = v4;
  v7[1] = a2;
  v8 = a3;
  MIDI::convertEventListToPacketList(a4, (uint64_t *)&v6);
  ((void (*)(_QWORD *))v6[3])(v7);
  return 0;
}

uint64_t __41__AUAudioUnit_scheduleMIDIEventListBlock__block_invoke_2(uint64_t a1, uint64_t a2, char a3, MIDI::EventList *this)
{
  MIDIProtocolID v4;
  int v5;
  int v6;
  uint64_t v7;
  MIDIProtocolID *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int *v11;
  _DWORD *v13;
  BOOL v15;
  char *v16;
  uint64_t v17;
  int v18;
  char v19;
  UInt32 *v20;
  uint64_t v21;
  UInt32 v22;
  MIDIEventPacket *v23;
  MIDIEventPacket *v24;
  UInt32 v25;
  UInt32 v26;
  UInt32 v27;
  UInt32 v28;
  _DWORD *v29;
  unint64_t v30;
  unsigned __int8 *v31;
  UInt32 v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  UInt32 v41;
  int v42;
  int v43;
  int v44;
  char *v45;
  AUEventSchedule *v46;
  uint64_t v47;
  MIDIEventPacket *v48;
  int v49;
  char v50;
  uint64_t v51;
  UInt32 v52;
  MIDIEventPacket *packet;
  MIDIEventPacket *v54;
  MIDIEventPacket *v55;
  uint64_t v56;
  UInt32 v57;
  MIDIEventPacket *v58;
  MIDIEventPacket *v59;
  int v60;
  char *v61;
  uint64_t v62;
  int v63;
  char v64;
  unint64_t v65;
  int v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  int v75;
  BOOL v76;
  uint64_t v77;
  UInt32 v78;
  MIDIEventPacket *v79;
  MIDIEventPacket *v80;
  UInt32 *v81;
  int v82;
  unsigned int v83;
  int v84;
  BOOL v85;
  unsigned int v86;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  UInt32 v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE *v96;
  char v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int j;
  int v102;
  int v103;
  uint64_t v104;
  char v106;
  int v107;
  uint64_t v108;
  int v109;
  unsigned __int8 *v110;
  unsigned int v111;
  UInt32 v112;
  unsigned int i;
  uint64_t v114;
  unsigned int v115;
  _DWORD *v116;
  char v117;
  _BYTE *v118;
  unint64_t v119;
  _DWORD *v120;
  char v121;
  int v122;
  UInt32 v123;
  _OWORD *v124;
  uint64_t v125;
  char *v126;
  char *v127;
  int v128;
  int v129;
  MIDIProtocolID protocol[2];
  MIDIProtocolID protocola;
  _DWORD *protocolb;
  int __src;
  _BYTE v137[7];
  unsigned int v138;
  __int128 v139;
  uint64_t v140;
  int v141;
  UInt32 words[2];
  uint64_t v143;
  unsigned __int8 v144;
  _BYTE v145[7];
  unsigned int *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  UInt32 v151[2];
  uint64_t v152;
  MIDIEventPacket *v153;
  MIDIEventList evtlist;
  __int128 v155;
  MIDIEventList v156;

  if (!this)
    return 4294967246;
  v138 = 0;
  v4 = *(_DWORD *)(a1 + 56);
  v125 = *(_QWORD *)(a1 + 48);
  v5 = *(_DWORD *)this;
  if (*(_DWORD *)this == v4)
  {
    v6 = *((_DWORD *)this + 1);
    if (!v6)
      return v138;
    if (v6 == 1 && *((_DWORD *)this + 4) <= 0x40u)
    {
      v7 = MIDI::EventList::size(this);
      v8 = (MIDIProtocolID *)this;
      if (*((_DWORD *)this + 1))
      {
        v9 = 0;
        v10 = (unsigned int *)((char *)this + 8);
        v11 = (unsigned int *)((char *)this + v7 + 8);
        do
        {
          if (v10 > v11)
            v138 = -50;
          v156.protocol = *v8;
          v156.numPackets = 1;
          memcpy(v156.packet, v10, sizeof(v156.packet));
          AUEventSchedule::midiEventList((AUEventSchedule *)(v125 + 48), a2, a3, &v156);
          v8 = (MIDIProtocolID *)this;
          v10 += v10[2] + 3;
          ++v9;
        }
        while (v9 < *((_DWORD *)this + 1));
      }
      return v138;
    }
    v44 = 0;
    v45 = (char *)this + 8;
    v46 = (AUEventSchedule *)(v125 + 48);
    protocola = *(_DWORD *)(a1 + 56);
LABEL_66:
    v128 = v44;
    v47 = *((unsigned int *)v45 + 2);
    v147 = v45 + 12;
    v148 = v47;
    v126 = v45;
    v149 = *(_QWORD *)v45;
    v150 = 0;
    v48 = MIDIEventListInit(&evtlist, v4);
    *(_QWORD *)&v155 = 0;
    *(_QWORD *)words = 0;
    v143 = 0;
    while (1)
    {
      v49 = MIDI::EventList::PacketReader::read((uint64_t *)&v147, &v155, words);
      v50 = v49;
      if (v49)
      {
        v48 = MIDIEventListAdd(&evtlist, 0x114uLL, v48, v155, MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
        if (!v48)
        {
          v51 = MIDI::EventList::size((MIDI::EventList *)&evtlist);
          if (evtlist.numPackets)
          {
            v52 = 0;
            packet = evtlist.packet;
            v54 = (MIDIEventPacket *)((char *)evtlist.packet + v51);
            do
            {
              if (packet > v54)
                v138 = -50;
              v156.protocol = evtlist.protocol;
              v156.numPackets = 1;
              memcpy(v156.packet, packet, sizeof(v156.packet));
              AUEventSchedule::midiEventList(v46, a2, a3, &v156);
              packet = (MIDIEventPacket *)((char *)packet + 4 * packet->wordCount + 12);
              ++v52;
            }
            while (v52 < evtlist.numPackets);
          }
          memset(&evtlist, 0, sizeof(evtlist));
          v55 = MIDIEventListInit(&evtlist, protocola);
          v48 = MIDIEventListAdd(&evtlist, 0x114uLL, v55, v155, MIDI::UniversalPacket::word_sizes[(unint64_t)words[0] >> 28], words);
        }
      }
      else
      {
        if (!evtlist.numPackets || (v56 = MIDI::EventList::size((MIDI::EventList *)&evtlist), !evtlist.numPackets))
        {
LABEL_82:
          v45 = &v126[4 * *((unsigned int *)v126 + 2) + 12];
          v44 = v128 + 1;
          v4 = protocola;
          if ((v128 + 1) >= *((_DWORD *)this + 1))
            return v138;
          goto LABEL_66;
        }
        v57 = 0;
        v58 = evtlist.packet;
        v59 = (MIDIEventPacket *)((char *)evtlist.packet + v56);
        do
        {
          if (v58 > v59)
            v138 = -50;
          v156.protocol = evtlist.protocol;
          v156.numPackets = 1;
          memcpy(v156.packet, v58, sizeof(v156.packet));
          AUEventSchedule::midiEventList(v46, a2, a3, &v156);
          v58 = (MIDIEventPacket *)((char *)v58 + 4 * v58->wordCount + 12);
          ++v57;
        }
        while (v57 < evtlist.numPackets);
      }
      if ((v50 & 1) == 0)
        goto LABEL_82;
    }
  }
  v13 = *(_DWORD **)(a1 + 32);
  if (v4 == kMIDIProtocol_2_0 && v5 == 1)
  {
    if (!*((_DWORD *)this + 1))
      return v138;
    v60 = 0;
    v61 = (char *)this + 8;
    protocolb = *(_DWORD **)(a1 + 32);
    v124 = v13 + 4;
    while (1)
    {
      v129 = v60;
      v62 = *((unsigned int *)v61 + 2);
      v147 = v61 + 12;
      v148 = v62;
      v127 = v61;
      v149 = *(_QWORD *)v61;
      v150 = 0;
      *(_QWORD *)words = v125;
      v143 = a2;
      v144 = a3;
      *(_DWORD *)v145 = *(_DWORD *)v137;
      *(_DWORD *)&v145[3] = *(_DWORD *)&v137[3];
      v146 = &v138;
      v141 = 2;
      v153 = MIDIEventListInit(&evtlist, kMIDIProtocol_2_0);
      v140 = 0;
      v139 = 0uLL;
      while (1)
      {
        v63 = MIDI::EventList::PacketReader::read((uint64_t *)&v147, &v140, &v139);
        v64 = v63;
        if (!v63)
          break;
        *(_QWORD *)&v156.protocol = &v153;
        v156.packet[0].timeStamp = (MIDITimeStamp)&evtlist;
        *(_QWORD *)&v156.packet[0].wordCount = &v140;
        *(_QWORD *)&v156.packet[0].words[1] = words;
        *(_QWORD *)&v156.packet[0].words[3] = &v141;
        v65 = v139;
        if (v139 >> 28 != 2)
        {
          v81 = (UInt32 *)&v139;
LABEL_126:
          _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, v81);
          goto LABEL_127;
        }
        *(_QWORD *)v151 = 0;
        v152 = 0;
        v66 = BYTE2(v139);
        v67 = *((unsigned __int8 *)v13 + 32);
        v68 = *v13;
        v69 = BYTE2(v139) >> 4;
        if (!*((_BYTE *)v13 + 32))
        {
          if ((v68 & 0xFF0000) != 0)
          {
            if (((v68 ^ v139) & 0xF0000) != 0)
            {
              v67 = 1;
              *((_BYTE *)v13 + 32) = 1;
              goto LABEL_90;
            }
            if (v69 != 11)
            {
              v67 = (v68 & 0xDF00) != 0 || v69 != 12;
              goto LABEL_90;
            }
            switch(BYTE1(v68))
            {
              case 'b':
                v102 = v139 & 0xFF00;
                v103 = 25344;
                goto LABEL_200;
              case 'c':
                v102 = v139 & 0xFF00;
                v103 = 25088;
                goto LABEL_200;
              case 'd':
                v102 = v139 & 0xFF00;
                v103 = 25856;
                goto LABEL_200;
              case 'e':
                v102 = v139 & 0xFF00;
                v103 = 25600;
LABEL_200:
                if (v102 != v103 && (v139 & 0xF0DF00) != 0xB00600)
                  break;
                goto LABEL_204;
              default:
                if (BYTE1(v68) == 32)
                {
                  if ((v139 & 0xFF00) != 0)
                    break;
LABEL_204:
                  v67 = 0;
                  *v124 = v139;
                  goto LABEL_90;
                }
                if (!BYTE1(v68) && (v139 & 0xFF00) == 0x2000)
                  goto LABEL_204;
                break;
            }
          }
          else
          {
            v67 = 1;
            if ((v139 & 0xF00000) != 0xB00000 || v69 != 11)
              goto LABEL_90;
            if (BYTE1(v139) - 98 < 4 || BYTE1(v139) == 32 || !BYTE1(v139))
            {
              v67 = 0;
              *(_OWORD *)v13 = v139;
              v68 = *v13;
              goto LABEL_90;
            }
          }
          v67 = 1;
        }
LABEL_90:
        v70 = BYTE3(v65) & 0xF;
        v71 = BYTE3(v65) & 0xF | 0x40;
        if (BYTE2(v68) && v67)
        {
          *((_BYTE *)v13 + 32) = 1;
          *((_QWORD *)&v155 + 1) = 0;
          LODWORD(v155) = v68 & 0xFF00 | (BYTE2(v68) << 16) & 0x80FFFFFF | ((BYTE3(v65) & 0xF | 0x40) << 24);
          v72 = v68;
          v73 = v68 << 25;
          if (v72 >= 0x41 && (v74 = (v72 & 0x3F) << 19) != 0)
          {
            v75 = BYTE2(v65) >> 4;
            do
            {
              v73 |= v74;
              v76 = v74 > 0x3F;
              v74 >>= 6;
            }
            while (v76);
          }
          else
          {
            v75 = BYTE2(v65) >> 4;
          }
          DWORD1(v155) = v73;
          _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
          *protocolb = 0;
          *((_QWORD *)&v155 + 1) = 0;
          v82 = protocolb[4];
          if (BYTE2(v82))
          {
            LODWORD(v155) = protocolb[4] & 0xFF00 | (BYTE2(protocolb[4]) << 16) | (v71 << 24);
            v83 = v82;
            v84 = v82 << 25;
            v85 = v83 >= 0x41;
            v86 = (v83 & 0x3F) << 19;
            if (v85 && v86 != 0)
            {
              do
              {
                v84 |= v86;
                v76 = v86 > 0x3F;
                v86 >>= 6;
              }
              while (v76);
            }
            DWORD1(v155) = v84;
            _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
            *(_DWORD *)v124 = 0;
          }
          *(_QWORD *)((char *)&protocolb[32 * v70 + 8 + 2 * ((v65 >> 16) & 0xF)] + 1) = 0;
          v69 = v75;
          v13 = protocolb;
        }
        v88 = (v65 >> 8) & 0x7F;
        v89 = v65 & 0x7F;
        switch(v69)
        {
          case 8:
            goto LABEL_120;
          case 9:
            if ((v65 & 0x7F) == 0)
            {
              v66 = BYTE2(v65) - 16;
              v89 = 64;
            }
LABEL_120:
            v151[0] = (v71 << 24) | (v66 << 16) | (v88 << 8);
            v90 = v89 << 9;
            if (v89 >= 0x41)
            {
              v91 = 8 * (v89 & 0x3F);
              if (v91)
              {
                do
                {
                  v90 |= v91;
                  v76 = v91 > 0x3F;
                  v91 >>= 6;
                }
                while (v76);
              }
            }
            v92 = v90 << 16;
            goto LABEL_124;
          case 10:
            v151[0] = (BYTE2(v65) << 16) | (v71 << 24) | (v88 << 8);
            v92 = (_DWORD)v65 << 25;
            if (v89 >= 0x41)
            {
              v93 = (v65 & 0x3F) << 19;
              if (v93)
              {
                do
                {
                  v92 |= v93;
                  v76 = v93 > 0x3F;
                  v93 >>= 6;
                }
                while (v76);
              }
            }
            goto LABEL_124;
          case 11:
            v94 = (uint64_t)&v13[32 * v70 + 8] + 1;
            v95 = (v65 >> 16) & 0xF;
            if (((v65 >> 8) & 0x7F) > 0x25)
            {
              switch(v88)
              {
                case 'b':
                  v104 = v94 + 8 * v95;
                  *(_BYTE *)(v104 + 1) = 2;
                  goto LABEL_189;
                case 'c':
                  v114 = v94 + 8 * v95;
                  *(_BYTE *)(v114 + 1) = 2;
                  goto LABEL_191;
                case 'd':
                  v104 = v94 + 8 * v95;
                  *(_BYTE *)(v104 + 1) = 1;
LABEL_189:
                  *(_BYTE *)(v104 + 5) = v89;
                  break;
                case 'e':
                  v114 = v94 + 8 * v95;
                  *(_BYTE *)(v114 + 1) = 1;
LABEL_191:
                  *(_BYTE *)(v114 + 4) = v89;
                  break;
                default:
                  if (v88 != 38)
                    goto LABEL_193;
                  v106 = v65 & 0x7F;
                  v107 = v65 & 0x7F;
                  goto LABEL_178;
              }
            }
            else
            {
              if (v88)
              {
                if (v88 == 6)
                {
                  v106 = 0;
                  v107 = 0;
                  *(_BYTE *)(v94 + 8 * v95 + 6) = v89;
LABEL_178:
                  v108 = v94 + 8 * v95;
                  *(_BYTE *)(v108 + 7) = v106;
                  if (*((_BYTE *)v13 + 32) || !*(_BYTE *)(v108 + 1))
                  {
LABEL_193:
                    v151[0] = (BYTE2(v65) << 16) | (v71 << 24) | (v88 << 8);
                    v92 = (_DWORD)v65 << 25;
                    if (v89 >= 0x41)
                    {
                      v115 = (v65 & 0x3F) << 19;
                      if (v115)
                      {
                        do
                        {
                          v92 |= v115;
                          v76 = v115 > 0x3F;
                          v115 >>= 6;
                        }
                        while (v76);
                      }
                    }
LABEL_124:
                    v151[1] = v92;
                  }
                  else
                  {
                    if (*(_BYTE *)(v108 + 1) == 1)
                      v109 = 32;
                    else
                      v109 = 48;
                    v110 = (unsigned __int8 *)(v94 + 8 * v95);
                    v151[0] = (v71 << 24) | ((v109 | v95) << 16) | (v110[4] << 8) | v110[5];
                    v111 = v107 | (v110[6] << 7);
                    v112 = v111 << 18;
                    if (v111 > 0x2000)
                    {
                      for (i = 32 * (v111 & 0x1FFF); i; i >>= 13)
                        v112 |= i;
                    }
                    v151[1] = v112;
LABEL_146:
                    *(_OWORD *)v13 = 0u;
                    *((_OWORD *)v13 + 1) = 0u;
                  }
LABEL_125:
                  v81 = v151;
                  goto LABEL_126;
                }
                if (v88 != 32)
                  goto LABEL_193;
                *(_BYTE *)(v94 + 8 * v95 + 3) = v89;
              }
              else
              {
                *(_BYTE *)(v94 + 8 * v95 + 2) = v89;
              }
              *(_BYTE *)(v94 + 8 * v95) = 1;
            }
            if (*((_BYTE *)v13 + 32))
              goto LABEL_193;
            break;
          case 12:
            v96 = &v13[32 * v70 + 2 * (WORD1(v65) & 0xF)];
            if (v96[33])
              v97 = *((_BYTE *)v13 + 32) ^ 1;
            else
              v97 = 0;
            BYTE2(v151[0]) = BYTE2(v65);
            HIBYTE(v151[0]) = BYTE3(v65) & 0xF | 0x40;
            LOBYTE(v151[0]) = v97;
            HIBYTE(v151[1]) = BYTE1(v65) & 0x7F;
            BYTE1(v151[1]) = v96[35];
            LOBYTE(v151[1]) = v96[36];
            *(_QWORD *)(v96 + 33) = 0;
            goto LABEL_146;
          case 13:
            BYTE2(v151[0]) = BYTE2(v65);
            HIBYTE(v151[0]) = BYTE3(v65) & 0xF | 0x40;
            v98 = v65 >> 8 << 25;
            if (v88 >= 0x41)
            {
              v99 = ((v65 >> 8) & 0x3F) << 19;
              if (v99)
              {
                do
                {
                  v98 |= v99;
                  v76 = v99 > 0x3F;
                  v99 >>= 6;
                }
                while (v76);
              }
            }
            v151[1] = v98;
            goto LABEL_125;
          case 14:
            BYTE2(v151[0]) = BYTE2(v65);
            HIBYTE(v151[0]) = BYTE3(v65) & 0xF | 0x40;
            v100 = v88 | (v89 << 7);
            v92 = v100 << 18;
            if (v100 > 0x2000)
            {
              for (j = 32 * (v100 & 0x1FFF); j; j >>= 13)
                v92 |= j;
            }
            goto LABEL_124;
          default:
            goto LABEL_125;
        }
LABEL_127:
        if ((v64 & 1) == 0)
          goto LABEL_205;
      }
      if (evtlist.numPackets)
      {
        v77 = MIDI::EventList::size((MIDI::EventList *)&evtlist);
        if (evtlist.numPackets)
        {
          v78 = 0;
          v79 = evtlist.packet;
          v80 = (MIDIEventPacket *)((char *)evtlist.packet + v77);
          do
          {
            if (v79 > v80)
              *v146 = -50;
            v156.protocol = evtlist.protocol;
            v156.numPackets = 1;
            memcpy(v156.packet, v79, sizeof(v156.packet));
            AUEventSchedule::midiEventList((AUEventSchedule *)(*(_QWORD *)words + 48), v143, v144, &v156);
            v79 = (MIDIEventPacket *)((char *)v79 + 4 * v79->wordCount + 12);
            ++v78;
          }
          while (v78 < evtlist.numPackets);
          goto LABEL_127;
        }
      }
LABEL_205:
      v61 = &v127[4 * *((unsigned int *)v127 + 2) + 12];
      v60 = v129 + 1;
      if ((v129 + 1) >= *((_DWORD *)this + 1))
        return v138;
    }
  }
  v15 = v4 == kMIDIProtocol_1_0 && v5 == 2;
  if (v15 && *((_DWORD *)this + 1))
  {
    __src = 0;
    v16 = (char *)this + 8;
    v116 = v13 + 521;
    while (1)
    {
      v17 = *((unsigned int *)v16 + 2);
      v147 = v16 + 12;
      v148 = v17;
      *(_QWORD *)protocol = v16;
      v149 = *(_QWORD *)v16;
      v150 = 0;
      *(_QWORD *)words = v125;
      v143 = a2;
      v144 = a3;
      *(_DWORD *)v145 = *(_DWORD *)v137;
      *(_DWORD *)&v145[3] = *(_DWORD *)&v137[3];
      v146 = &v138;
      LODWORD(v140) = 1;
      *(_QWORD *)&v139 = MIDIEventListInit(&evtlist, kMIDIProtocol_1_0);
      v152 = 0;
      v153 = 0;
      *(_QWORD *)v151 = 0;
      while (1)
      {
        v18 = MIDI::EventList::PacketReader::read((uint64_t *)&v147, &v153, v151);
        v19 = v18;
        if (!v18)
          break;
        *(_QWORD *)&v156.protocol = &v139;
        v156.packet[0].timeStamp = (MIDITimeStamp)&evtlist;
        *(_QWORD *)&v156.packet[0].wordCount = &v153;
        *(_QWORD *)&v156.packet[0].words[1] = words;
        *(_QWORD *)&v156.packet[0].words[3] = &v140;
        if (((1 << (v151[0] >> 28)) & 0xA02B) != 0)
        {
          v20 = v151;
LABEL_28:
          _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, v20);
        }
        else if (v151[0] >> 28 == 4)
        {
          v25 = HIBYTE(v151[0]) & 0xF | 0x20;
          v26 = v151[1];
          switch(BYTE2(v151[0]) >> 4)
          {
            case 2:
            case 3:
              v29 = &v116[12 * (HIBYTE(v151[0]) & 0xF)];
              v30 = ((unint64_t)v151[0] >> 16) & 0xF;
              v31 = (unsigned __int8 *)v29 + 3 * v30;
              v32 = (v151[0] >> 8) & 0x7F;
              v33 = v151[0] & 0x7F;
              if ((v151[0] & 0x100000) != 0)
                v34 = 2;
              else
                v34 = 1;
              if (v34 == *v31 && v32 == v31[1])
              {
                v35 = v30 | 0xB0;
                if (v33 == *((unsigned __int8 *)v29 + 3 * v30 + 2))
                {
                  v36 = (v35 << 16) | (v25 << 24);
                  goto LABEL_54;
                }
              }
              else
              {
                v35 = v30 | 0xB0;
              }
              if ((v151[0] & 0x100000) != 0)
                v37 = 25344;
              else
                v37 = 25856;
              v122 = (v25 << 24) | (v35 << 16);
              v38 = v37 | v122;
              v155 = v37 | v122 | v32;
              v119 = ((unint64_t)v151[0] >> 16) & 0xF;
              v120 = &v116[12 * (HIBYTE(v151[0]) & 0xF)];
              v121 = BYTE1(v151[0]) & 0x7F;
              v118 = (char *)v29 + 3 * v30;
              v117 = v34;
              _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              v155 = (v38 | v33) - 256;
              _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              *v118 = v117;
              v39 = (uint64_t)v120 + 3 * v119;
              *(_BYTE *)(v39 + 1) = v121;
              *(_BYTE *)(v39 + 2) = v33;
              v36 = v122;
LABEL_54:
              v40 = (v26 >> 18) & 0x7F;
              v155 = v36 | (v26 >> 25) | 0x600;
              _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
              if (v40)
              {
                HIDWORD(v155) = 0;
                *(_QWORD *)((char *)&v155 + 4) = 0;
                v28 = v40 | v36 | 0x2600;
                goto LABEL_62;
              }
              break;
            case 8:
            case 9:
            case 10:
            case 11:
              v27 = BYTE2(v151[0]) >> 4 == 9;
              if (v151[1] >> 25)
                v27 = v151[1] >> 25;
              HIDWORD(v155) = 0;
              *(_QWORD *)((char *)&v155 + 4) = 0;
              v28 = v27 | (BYTE2(v151[0]) << 16) | (v25 << 24) | v151[0] & 0x7F00;
              goto LABEL_62;
            case 12:
              v41 = v25 << 24;
              v42 = BYTE2(v151[0]) << 16;
              if ((v151[0] & 1) != 0)
              {
                v43 = (v42 - 0x100000) | (v25 << 24);
                v155 = (v42 - 0x100000) & 0xFFFFFF80 | (v25 << 24) | (v151[1] >> 8) & 0x7F;
                v123 = v25 << 24;
                _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
                v155 = v43 & 0xFFFFFF80 | v26 & 0x7F | 0x2000;
                _ZZN4MIDI27readUMPToSegmentedEventListINS_22MIDI_1_to_2_TranslatorENS_9EventList12PacketReaderEZZ41__AUAudioUnit_scheduleMIDIEventListBlock_EUb2_E3__4EEv14MIDIProtocolIDRT_RT0_T1_ENKUlRKNS_15UniversalPacketEE_clESD_((uint64_t)&v156, (UInt32 *)&v155);
                v41 = v123;
              }
              HIDWORD(v155) = 0;
              *(_QWORD *)((char *)&v155 + 4) = 0;
              v28 = v42 | v41 | HIWORD(v26) & 0x7F00;
              goto LABEL_62;
            case 13:
              HIDWORD(v155) = 0;
              *(_QWORD *)((char *)&v155 + 4) = 0;
              v28 = (BYTE2(v151[0]) << 16) | (v25 << 24) | (v151[1] >> 25 << 8);
              goto LABEL_62;
            case 14:
              HIDWORD(v155) = 0;
              *(_QWORD *)((char *)&v155 + 4) = 0;
              v28 = (v151[1] >> 10) & 0x7F00 | (BYTE2(v151[0]) << 16) | (v25 << 24) | (v151[1] >> 25);
LABEL_62:
              LODWORD(v155) = v28;
              v20 = (UInt32 *)&v155;
              goto LABEL_28;
            default:
              break;
          }
        }
LABEL_35:
        if ((v19 & 1) == 0)
          goto LABEL_63;
      }
      if (evtlist.numPackets)
      {
        v21 = MIDI::EventList::size((MIDI::EventList *)&evtlist);
        if (evtlist.numPackets)
          break;
      }
LABEL_63:
      v16 = (char *)(*(_QWORD *)protocol + 4 * *(unsigned int *)(*(_QWORD *)protocol + 8) + 12);
      if (++__src >= *((_DWORD *)this + 1))
        return v138;
    }
    v22 = 0;
    v23 = evtlist.packet;
    v24 = (MIDIEventPacket *)((char *)evtlist.packet + v21);
    do
    {
      if (v23 > v24)
        *v146 = -50;
      v156.protocol = evtlist.protocol;
      v156.numPackets = 1;
      memcpy(v156.packet, v23, sizeof(v156.packet));
      AUEventSchedule::midiEventList((AUEventSchedule *)(*(_QWORD *)words + 48), v143, v144, &v156);
      v23 = (MIDIEventPacket *)((char *)v23 + 4 * v23->wordCount + 12);
      ++v22;
    }
    while (v22 < evtlist.numPackets);
    goto LABEL_35;
  }
  return v138;
}

AUEventSchedule *__37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke(uint64_t a1, uint64_t a2, char a3, int64_t a4, AUEventSchedule *a5)
{
  return AUEventSchedule::midiEvents((AUEventSchedule *)(*(_QWORD *)(a1 + 32) + 48), a2, a3, a4, a5);
}

uint64_t __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_2(uint64_t a1, uint64_t a2, char a3, unsigned int a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t (**v7)();
  _QWORD v8[2];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 48);
  v7 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ37__AUAudioUnit_scheduleMIDIEventBlock_EUb_E3__1EE;
  v8[0] = v5;
  v8[1] = a2;
  v9 = a3;
  MIDI::LegacyMIDIConverter<MIDI::IdentityTranslator>::convertLegacyDataToEventList(a5, a4, 0, (uint64_t *)&v7);
  return ((uint64_t (*)(_QWORD *))v7[3])(v8);
}

uint64_t __37__AUAudioUnit_scheduleMIDIEventBlock__block_invoke_27(uint64_t a1, uint64_t a2, char a3, unsigned int a4, uint64_t a5)
{
  int *v5;
  uint64_t v6;
  uint64_t (**v8)();
  _QWORD v9[2];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *(int **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = _ZN5caulk16inplace_functionIFvPKN4MIDI9EventListEELm48ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZZ37__AUAudioUnit_scheduleMIDIEventBlock_EUb0_E3__2EE;
  v9[0] = v6;
  v9[1] = a2;
  v10 = a3;
  MIDI::LegacyMIDIConverter<MIDI::MIDI_1_to_2_Translator>::convertLegacyDataToEventList(v5, a5, a4, 0, (uint64_t *)&v8);
  return ((uint64_t (*)(_QWORD *))v8[3])(v9);
}

char *__37__AUAudioUnit_scheduleParameterBlock__block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, float a5)
{
  uint64_t v9;
  char *result;
  char v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;

  v9 = *(_QWORD *)(a1 + 32);
  result = (char *)XAtomicPoolAllocator::alloc(*(XAtomicPoolAllocator **)(v9 + 56));
  *(_QWORD *)result = 0;
  *((_QWORD *)result + 1) = a2;
  if (a3)
    v11 = 2;
  else
    v11 = 1;
  result[16] = v11;
  *(_WORD *)(result + 17) = 0;
  result[19] = 0;
  *((_DWORD *)result + 5) = a3;
  *((_QWORD *)result + 3) = a4;
  *((float *)result + 8) = a5;
  *((_DWORD *)result + 9) = 0;
  *((_QWORD *)result + 5) = 0;
  v12 = (unint64_t *)(v9 + 72);
  v13 = *(_QWORD *)(v9 + 72);
  atomic_store(v13, (unint64_t *)result);
  v14 = __ldaxr((unint64_t *)(v9 + 72));
  if (v14 != v13)
  {
    __clrex();
LABEL_8:
    while (1)
    {
      atomic_store(v14, (unint64_t *)result);
      v15 = __ldaxr(v12);
      if (v15 != v14)
        break;
      if (__stlxr((unint64_t)result, v12))
        goto LABEL_12;
      v16 = 1;
LABEL_13:
      v14 = v15;
      if (v16)
        return result;
    }
    __clrex();
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if (__stlxr((unint64_t)result, v12))
    goto LABEL_8;
  return result;
}

uint64_t __26__AUAudioUnit_renderBlock__block_invoke(uint64_t a1, unsigned int *a2, AudioTimeStamp *a3, uint64_t a4, uint64_t a5, AudioBufferList *a6)
{
  unsigned int v12;
  int v13;
  uint64_t v14;
  AURenderEvent *v15;
  AURenderEvent *v16;
  uint64_t v17;
  int v18;
  caulk::pooled_semaphore_mutex *v20;
  char v21;
  unsigned int v22[2];
  char v23;

  v12 = *a2;
  if ((*a2 & 0x8000) == 0)
  {
    v22[0] = v12 | 4;
    RenderObserverList::callAll((RenderObserverList *)(*(_QWORD *)(a1 + 40) + 8), v22, a3, a4, a5, 0);
  }
  *(_QWORD *)v22 = *(_QWORD *)(a1 + 40);
  v23 = 1;
  caulk::pooled_semaphore_mutex::_lock(*(caulk::pooled_semaphore_mutex **)v22);
  v20 = (caulk::pooled_semaphore_mutex *)(*(_QWORD *)(a1 + 40) + 4);
  v13 = caulk::pooled_semaphore_mutex::try_lock(v20);
  v21 = v13;
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v14 + 248))
    {
      RenderContextChangeGenerator::checkChange((RenderContextChangeGenerator *)(v14 + 232));
      v14 = *(_QWORD *)(a1 + 40);
    }
    v16 = (AURenderEvent *)AUEventSchedule::preRender((AUEventSchedule *)(v14 + 48), (uint64_t)a3->mSampleTime, a4, *(_DWORD *)(v14 + 256) == 3);
    if (v15)
      AUEventSchedule::dispatchV2SetParamEvents((AUEventSchedule *)(*(_QWORD *)(a1 + 40) + 48), v15, (v12 >> 15) & 1);
    if ((v12 & 0x8000) != 0 && *(_DWORD *)(*(_QWORD *)(a1 + 40) + 256) != 1)
    {
      objc_msgSend(*(id *)(a1 + 48), "deliverV2Parameters:", v16);
      v17 = 0;
    }
    else
    {
      v17 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    AUEventSchedule::postRender((AUEventSchedule *)(*(_QWORD *)(a1 + 40) + 48), v16);
  }
  else
  {
    v17 = 0;
  }
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v20);
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)v22);
  if ((v12 & 0x8000) == 0)
  {
    if ((_DWORD)v17)
      v18 = 264;
    else
      v18 = 8;
    v22[0] = *a2 | v18;
    RenderObserverList::callAll((RenderObserverList *)(*(_QWORD *)(a1 + 40) + 8), v22, a3, a4, a5, a6);
  }
  return v17;
}

void __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  __int128 v10;
  int v11;

  v3 = a2;
  v4 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  v7[1] = 3221225472;
  v5 = *(unsigned int *)(a1 + 68);
  v11 = *(_DWORD *)(a1 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke_2;
  v7[3] = &unk_1E2920E38;
  v9 = v4;
  v8 = v3;
  v6 = v3;
  +[AUAudioUnit instantiateWithComponentDescription:options:completionHandler:](AUAudioUnit, "instantiateWithComponentDescription:options:completionHandler:", &v10, v5, v7);

}

void __58__AUAudioUnit_initWithComponentDescription_options_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v9 = v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  v8 = v7;

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 connectionProvider:(function<NSXPCConnection *(NSUUID *) completionHandler:
{
  uint64_t v7;
  void (**v9)(id, uint64_t, id);
  AudioComponent Next;
  uint64_t (***v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t (***v17)(_QWORD);
  uint64_t v18;
  objc_class *v19;
  objc_class *AUOutputUnitClass;
  AUAudioUnit_RemoteV2 *v21;
  id v22;
  void *v23;
  id v24;
  unsigned int V2OutOfProcess;
  char v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  AUHostingServiceClient *v30;
  AUAudioUnit_RemoteV2 *v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  id v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int *v39;
  unsigned int v40;
  id v41;
  __int128 v42;
  UInt32 v43;
  id v44;
  __int128 v45;
  UInt32 v46;
  AUHostingServiceClient *v47;
  AudioComponentDescription v48;
  AudioComponentDescription v49;
  AUHostingServiceClient *v50;
  CFTypeRef cf;
  __int128 v52;
  UInt32 componentFlagsMask;
  _BYTE v54[24];
  _BYTE *v55;
  uint64_t v56;

  v7 = *(_QWORD *)&a4;
  v56 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, uint64_t, id))a6;
  CADeprecated::TSingleton<AUAudioUnitProperties>::instance();
  Next = AudioComponentFindNext(0, a3);
  v11 = (uint64_t (***)(_QWORD))Next;
  if (Next)
  {
    v12 = (**(uint64_t (***)(AudioComponent))Next)(Next);
    v13 = (**v11)(v11);
    if (v13)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 32))(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = 0;
        v52 = *(_OWORD *)&a3->componentType;
        componentFlagsMask = a3->componentFlagsMask;
        +[AUAudioUnit_XH instantiateWithExtension:componentDescription:instance:options:completionHandler:](AUAudioUnit_XH, "instantiateWithExtension:componentDescription:instance:options:completionHandler:", v14, &v52, 0, 0, v9);
        v16 = 0;
        goto LABEL_37;
      }
    }
    v17 = (uint64_t (***)(_QWORD))(**v11)(v11);
    if (v17 && (*(_BYTE *)((**v17)(v17) + 48) & 4) != 0 && (v18 = (**v11)(v11)) != 0)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 40))(v18);
      v19 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        AUOutputUnitClass = v19;
        v21 = 0;
        v22 = 0;
LABEL_36:
        v36 = [AUOutputUnitClass alloc];
        v42 = *(_OWORD *)&a3->componentType;
        v43 = a3->componentFlagsMask;
        v41 = v22;
        v15 = objc_msgSend(v36, "initWithComponentDescription:options:error:", &v42, v7, &v41);
        v16 = v41;

        v9[2](v9, v15, v16);
        v14 = 0;
LABEL_37:
        v37 = (unsigned int *)(v12 + 136);
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 + 1, v37));
        v39 = (unsigned int *)(v12 + 140);
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 | v7 | 0x20000000, v39));
        v21 = (AUAudioUnit_RemoteV2 *)v15;
        v22 = v16;
        goto LABEL_42;
      }
    }
    else
    {
      v24 = 0;
    }
    if (a3->componentType == 1635086197)
    {
      v21 = 0;
      AUOutputUnitClass = (objc_class *)getAUOutputUnitClass((const AudioComponentDescription *)a3->componentSubType);
      v22 = 0;
      goto LABEL_36;
    }
    (*(void (**)(CFTypeRef *__return_ptr, uint64_t))(*(_QWORD *)v12 + 104))(&cf, v12);
    V2OutOfProcess = shouldLoadV2OutOfProcess(a3, v7, (id *)&cf);
    v26 = V2OutOfProcess;
    if (!V2OutOfProcess)
    {
      objc_opt_self();
      AUOutputUnitClass = (objc_class *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v22 = 0;
      goto LABEL_32;
    }
    v49 = *a3;
    v27 = (id)cf;
    std::__function::__value_func<NSXPCConnection * ()(NSUUID *)>::__value_func[abi:ne180100]((uint64_t)v54, (uint64_t)a5);
    AUHostingServiceClient::create((uint64_t *)&v50, &v49, v27, (uint64_t)v54, 0);
    v28 = v55;
    if (v55 == v54)
    {
      v29 = 4;
      v28 = v54;
    }
    else
    {
      if (!v55)
        goto LABEL_21;
      v29 = 5;
    }
    (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_21:

    v30 = v50;
    if (v50 && (v48 = *a3, AUHostingServiceClient::loadRemotely(v50, &v48)))
    {
      v31 = [AUAudioUnit_RemoteV2 alloc];
      v50 = 0;
      v47 = v30;
      v45 = *(_OWORD *)&a3->componentType;
      v46 = a3->componentFlagsMask;
      v44 = 0;
      v21 = -[AUAudioUnit_RemoteV2 initWithXPCService:componentDescription:instance:instanceUUID:error:](v31, "initWithXPCService:componentDescription:instance:instanceUUID:error:", &v47, &v45, 0, 0, &v44);
      v22 = v44;
      std::unique_ptr<AUHostingServiceClient>::reset[abi:ne180100](&v47, 0);
      v32 = (unsigned int *)(v12 + 136);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 + 1, v32));
      v34 = (unsigned int *)(v12 + 140);
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 | v7, v34));
    }
    else
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10875, 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9[2](v9, (uint64_t)v21, v22);
    if (v50)
    {
      AUHostingServiceClient::~AUHostingServiceClient(v50);
      MEMORY[0x193FFE460]();
    }
    AUOutputUnitClass = 0;
LABEL_32:
    if (cf)
      CFRelease(cf);
    if ((v26 & 1) != 0)
    {
      v14 = 0;
LABEL_42:

      goto LABEL_43;
    }
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -3000, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v23);

LABEL_43:
}

+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)componentDescription options:(AudioComponentInstantiationOptions)options completionHandler:(void *)completionHandler
{
  _QWORD *v5;
  uint64_t v6;
  AudioComponentDescription v7;
  _BYTE v8[24];
  _BYTE *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = *componentDescription;
  v9 = 0;
  +[AUAudioUnit instantiateWithComponentDescription:options:connectionProvider:completionHandler:](AUAudioUnit, "instantiateWithComponentDescription:options:connectionProvider:completionHandler:", &v7, *(_QWORD *)&options, v8, completionHandler);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
  }
  else
  {
    if (!v9)
      return;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
}

+ (id)auAudioUnitForAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  uint64_t (***v4)(_QWORD);
  AUAudioUnitV2Bridge *v5;
  uint64_t v6;
  const AudioComponentDescription *v7;
  int v8;
  OSStatus Property;
  OSStatus v10;
  AUAudioUnitV2Bridge *v12;
  _DWORD *v13;
  _DWORD v14[2];
  uint64_t v15;
  int v16;
  _DWORD v17[2];
  uint64_t v18;
  int v19;
  UInt32 ioDataSize;
  id outData;
  uint64_t v22;
  int v23;

  if (a3
    && (v4 = (uint64_t (***)(_QWORD))(*(uint64_t (**)(OpaqueAudioComponentInstance *, SEL))(*(_QWORD *)a3 + 8))(a3, a2)) != 0)
  {
    v5 = (AUAudioUnitV2Bridge *)(**v4)(v4);
    if (v5)
    {
      v5 = (AUAudioUnitV2Bridge *)(*(uint64_t (**)(AUAudioUnitV2Bridge *))v5->super.super.isa)(v5);
      if (v5)
      {
        v6 = (*(uint64_t (**)(AUAudioUnitV2Bridge *))v5->super.super.isa)(v5);
        v8 = *(_DWORD *)(v6 + 36);
        v7 = (const AudioComponentDescription *)*(unsigned int *)(v6 + 40);
        v22 = *(_QWORD *)(v6 + 44);
        v23 = *(_DWORD *)(v6 + 52);
        outData = 0;
        ioDataSize = 8;
        Property = AudioUnitGetProperty(a3, 0x739u, 0, 0, &outData, &ioDataSize);
        if (Property == -10879)
        {
          if (v8 == 1635086197)
          {
            v12 = (AUAudioUnitV2Bridge *)objc_alloc((Class)getAUOutputUnitClass(v7));
            v17[0] = 1635086197;
            v17[1] = (_DWORD)v7;
            v18 = v22;
            v19 = v23;
            v13 = v17;
          }
          else
          {
            v12 = [AUAudioUnitV2Bridge alloc];
            v14[0] = v8;
            v14[1] = (_DWORD)v7;
            v15 = v22;
            v16 = v23;
            v13 = v14;
          }
          v5 = -[AUAudioUnitV2Bridge initWithAudioUnit:description:](v12, "initWithAudioUnit:description:", a3, v13);
        }
        else
        {
          v10 = Property;
          v5 = 0;
          if (!v10)
            v5 = (AUAudioUnitV2Bridge *)outData;
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingAllParameterValues
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("fullState"), CFSTR("fullStateForDocument"), CFSTR("currentPreset"), 0);
}

- (BOOL)shouldChangeToFormat:(AVAudioFormat *)format forBus:(AUAudioUnitBus *)bus
{
  return !self->_renderResourcesAllocated;
}

- (void)setRenderResourcesAllocated:(BOOL)flag
{
  self->_renderResourcesAllocated = flag;
}

- (AURenderContextObserver)renderContextObserver
{
  return 0;
}

+ (void)registerSubclass:(Class)cls asComponentDescription:(AudioComponentDescription *)componentDescription name:(NSString *)name version:(UInt32)version
{
  NSString *v9;
  const AudioComponentDescription *v10;
  NSString *v11;
  NSString *v12;
  uint64_t (**v13)();
  uint64_t (***v14)();
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t *p_shared_weak_owners;
  unint64_t v24;
  unint64_t v25;
  std::recursive_mutex *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  CFTypeRef cf;
  uint64_t (**v36)();
  std::__shared_weak_count *v37;
  std::recursive_mutex *v38[2];
  uint64_t (**v39)();
  std::__shared_weak_count *v40;
  uint64_t *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = name;
  GlobalComponentPluginMgr((uint64_t *)v38);
  if (!EmbeddedComponentManager::isComponentDescriptionVisible((EmbeddedComponentManager *)componentDescription->componentFlags, v10))goto LABEL_37;
  v11 = v9;
  v12 = v11;
  if (v11)
    CFRetain(v11);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v12);

  v13 = (uint64_t (**)())operator new();
  *v13 = (uint64_t (*)())off_1E2909790;
  v39 = &off_1E2915E28;
  v40 = (std::__shared_weak_count *)v13;
  v41 = (uint64_t *)&v39;
  APComponent::APComponent((uint64_t)v13, 0, 100, (uint64_t)componentDescription, 0x15u, &cf, version, (uint64_t)&v39);
  v14 = (uint64_t (***)())v41;
  if (v41 == (uint64_t *)&v39)
  {
    v15 = 4;
    v14 = &v39;
  }
  else
  {
    if (!v41)
      goto LABEL_9;
    v15 = 5;
  }
  (*v14)[v15]();
LABEL_9:
  *v13 = (uint64_t (*)())off_1E2909790;
  v13[20] = (uint64_t (*)())cls;
  v36 = v13;
  v16 = (std::__shared_weak_count *)operator new();
  v16->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917F68;
  v16->__shared_weak_owners_ = 0;
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)v13;
  v37 = v16;
  v18 = (std::__shared_weak_count *)v13[2];
  if (!v18)
  {
    do
      v22 = __ldxr(p_shared_owners);
    while (__stxr(v22 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v24 = __ldxr(p_shared_weak_owners);
    while (__stxr(v24 + 1, p_shared_weak_owners));
    v13[1] = (uint64_t (*)())v13;
    v13[2] = (uint64_t (*)())v16;
    do
LABEL_19:
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
    goto LABEL_22;
  }
  if (v18->__shared_owners_ == -1)
  {
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
    v20 = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
    v13[1] = (uint64_t (*)())v13;
    v13[2] = (uint64_t (*)())v16;
    std::__shared_weak_count::__release_weak(v18);
    goto LABEL_19;
  }
LABEL_22:
  if (cf)
    CFRelease(cf);
  v26 = v38[1];
  v39 = v36;
  v40 = v37;
  if (v37)
  {
    v27 = (unint64_t *)&v37->__shared_owners_;
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  AudioComponentMgr_Base::addComponentLocally((uint64_t)v26, (uint64_t *)&v39);
  v29 = v40;
  if (v40)
  {
    v30 = (unint64_t *)&v40->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = v37;
  if (v37)
  {
    v33 = (unint64_t *)&v37->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
LABEL_37:
  if (v38[0])
    std::recursive_mutex::unlock(v38[0]);

}

void __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setStrongInstance:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  id WeakRetained;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (v8)
  {
    objc_msgSend(WeakRetained, "completionBlock");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v8);
  }
  else
  {
    objc_msgSend(WeakRetained, "setCachedViewController:", v7);

    v11 = objc_loadWeakRetained(v9);
    objc_msgSend(v11, "completionBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_open:completion:", v14, v13);

    v12 = (void (**)(_QWORD, _QWORD))v11;
  }

}

void __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void (**v8)(id, id);
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "completionBlock");
    v8 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v8[2](v8, v5);
  }
  else
  {
    v8 = (void (**)(id, id))WeakRetained;
    objc_msgSend(v8, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_open:completion:", v10, v9);

  }
}

void __99__AUAudioUnit_XH_instantiateWithExtension_componentDescription_instance_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, WeakRetained, 0);

  }
}

void __92__AUAudioUnit_RemoteV2_initWithXPCService_componentDescription_instance_instanceUUID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
