@implementation HapticDictionaryReader

- (id)readAndVerifyVersion:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  NSObject *v10;
  NSObject *v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v17;
  NSObject *v18;
  id v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CHHapticPatternKeyVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (kHAPIScope)
    {
      v11 = *(id *)kHAPIScope;
      if (!v11)
      {
LABEL_18:
        LODWORD(v12) = 1.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
        v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v15 = v14;
        goto LABEL_20;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315650;
      v21 = "HapticDictionaryReader.mm";
      v22 = 1024;
      v23 = 38;
      v24 = 2080;
      v25 = "-[HapticDictionaryReader readAndVerifyVersion:error:]";
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Missing or malformed version key - assuming v1.0", (uint8_t *)&v20, 0x1Cu);
    }

    goto LABEL_18;
  }
  objc_msgSend(v6, "floatValue");
  v8 = v7;
  if (v7 <= 1.1 && v7 >= 1.0)
  {
    if (kHAPIScope)
    {
      if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
      {
        v17 = *(id *)kHAPIScope;
        if (v17)
        {
          v18 = v17;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v20 = 136315906;
            v21 = "HapticDictionaryReader.mm";
            v22 = 1024;
            v23 = 48;
            v24 = 2080;
            v25 = "-[HapticDictionaryReader readAndVerifyVersion:error:]";
            v26 = 2048;
            v27 = v8;
            _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern version %.1f", (uint8_t *)&v20, 0x26u);
          }

        }
      }
    }
    v14 = v6;
    goto LABEL_19;
  }
  if (!kHAPIScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_29:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315906;
      v21 = "HapticDictionaryReader.mm";
      v22 = 1024;
      v23 = 44;
      v24 = 2080;
      v25 = "-[HapticDictionaryReader readAndVerifyVersion:error:]";
      v26 = 2048;
      v27 = v8;
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unsupported version number: %.1f", (uint8_t *)&v20, 0x26u);
    }

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return v15;
}

- (id)parseConfiguration:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CHHapticPatternKeyConfiguration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HapticDictionaryReader_parseConfiguration_error___block_invoke;
  v10[3] = &unk_1E695FE60;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = v7;
  return v8;
}

void __51__HapticDictionaryReader_parseConfiguration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  const CALog::Scope *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CHHapticPatternKeyLocality))
  {
    v7 = v6;
    if (objc_msgSend(v7, "length"))
    {
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v8 = *(id *)kHAPIScope;
          if (v8)
          {
            v9 = v8;
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              v23 = 136315906;
              v24 = "HapticDictionaryReader.mm";
              v25 = 1024;
              v26 = 64;
              v27 = 2080;
              v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              v29 = 2112;
              v30 = v7;
              _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern Locality: '%@'", (uint8_t *)&v23, 0x26u);
            }

          }
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, CFSTR("Locality"));
    }
LABEL_43:

    goto LABEL_44;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticPatternKeyPriority))
  {
    v10 = v6;
    if (objc_msgSend(v10, "length"))
    {
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v11 = *(id *)kHAPIScope;
          if (v11)
          {
            v12 = v11;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              v23 = 136315906;
              v24 = "HapticDictionaryReader.mm";
              v25 = 1024;
              v26 = 71;
              v27 = 2080;
              v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              v29 = 2112;
              v30 = v10;
              _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern Priority: '%@'", (uint8_t *)&v23, 0x26u);
            }

          }
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, CFSTR("Priority"));
    }
    goto LABEL_43;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticPatternKeyHapticPowerUsage))
  {
    v13 = v6;
    if (objc_msgSend(v13, "length"))
    {
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v14 = *(id *)kHAPIScope;
          if (v14)
          {
            v15 = v14;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              v23 = 136315906;
              v24 = "HapticDictionaryReader.mm";
              v25 = 1024;
              v26 = 78;
              v27 = 2080;
              v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              v29 = 2112;
              v30 = v13;
              _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern HapticPowerUsage: '%@'", (uint8_t *)&v23, 0x26u);
            }

          }
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v13, CFSTR("HapticPowerUsage"));
    }
    goto LABEL_43;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticPatternKeyAudioPowerUsage))
  {
    v16 = v6;
    if (objc_msgSend(v16, "length"))
    {
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v17 = *(id *)kHAPIScope;
          if (v17)
          {
            v18 = v17;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v23 = 136315906;
              v24 = "HapticDictionaryReader.mm";
              v25 = 1024;
              v26 = 85;
              v27 = 2080;
              v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              v29 = 2112;
              v30 = v16;
              _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern AudioPowerUsage: '%@'", (uint8_t *)&v23, 0x26u);
            }

          }
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v16, CFSTR("AudioPowerUsage"));
    }
    goto LABEL_43;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticPatternKeyUsageCategory))
  {
    v19 = v6;
    if (objc_msgSend(v19, "length"))
    {
      CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v23 = 136315906;
        v24 = "HapticDictionaryReader.mm";
        v25 = 1024;
        v26 = 92;
        v27 = 2080;
        v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
        v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern UsageCategory: '%@'", (uint8_t *)&v23, 0x26u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v19, CFSTR("UsageCategory"));
    }
    goto LABEL_43;
  }
LABEL_44:

}

- (id)scanForEmbeddedResources:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CHHapticPatternKeyPattern);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __51__HapticDictionaryReader_scanForEmbeddedResources___block_invoke;
        v11[3] = &unk_1E695FFC0;
        v11[4] = &v16;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
    }
    while (v4);
  }

  v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __51__HapticDictionaryReader_scanForEmbeddedResources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  CHEmbeddedAudioResourceInfo *v17;
  void *v18;
  CHEmbeddedAudioResourceInfo *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CHHapticPatternKeyEvent))
  {
    v6 = v5;
    objc_msgSend(v6, "objectForKey:", CHHapticPatternKeyEventWaveformPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    objc_msgSend(v6, "objectForKey:", CHHapticPatternKeyEventWaveformUseVolumeEnvelope);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v11, CHHapticAudioResourceKeyUseVolumeEnvelope);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKey:", CHHapticPatternKeyEventWaveformLoopEnabled);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (v12)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CHHapticAudioResourceKeyLoopEnabled);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v13, CHHapticAudioResourceKeyLoopEnabled);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (kHAPIScope)
    {
      v14 = *(id *)kHAPIScope;
      if (!v14)
      {
LABEL_19:
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v17 = [CHEmbeddedAudioResourceInfo alloc];
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[CHEmbeddedAudioResourceInfo initWithURL:options:](v17, "initWithURL:options:", v18, v12);
        objc_msgSend(v16, "addObject:", v19);

        goto LABEL_20;
      }
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v20 = 136316162;
      v21 = "HapticDictionaryReader.mm";
      v22 = 1024;
      v23 = 136;
      v24 = 2080;
      v25 = "-[HapticDictionaryReader scanForEmbeddedResources:]_block_invoke";
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding embedded audio resource path '%@', options '%@'", (uint8_t *)&v20, 0x30u);
    }

    goto LABEL_19;
  }
LABEL_21:

}

- (BOOL)parseEventsAndParameters:(id)a3 withBaseURL:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _BYTE *v32;
  uint64_t *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t v44[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const char *v49;
  uint8_t v50[128];
  _BYTE buf[40];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v27 = a4;
  v25 = a5;
  v24 = v8;
  objc_msgSend(v8, "objectForKey:", CHHapticPatternKeyPattern);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  if (v9)
  {
    v10 = 0;
    goto LABEL_11;
  }
  if (!kHAPIScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v11 = *(id *)kHAPIScope;
  if (v11)
  {
LABEL_7:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticDictionaryReader.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 156;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[HapticDictionaryReader parseEventsAndParameters:withBaseURL:reply:]";
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = CHHapticPatternKeyPattern;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Pattern dictionary is missing '%@' key", buf, 0x26u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4814, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v25 + 2))(v25, 0, 0, 0, v10);
LABEL_11:
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__0;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__0;
  v52 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v35;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v29[0] = v15;
        v29[1] = 3221225472;
        v29[2] = __69__HapticDictionaryReader_parseEventsAndParameters_withBaseURL_reply___block_invoke;
        v29[3] = &unk_1E695FFE8;
        v29[4] = self;
        v30 = v27;
        v31 = v28;
        v32 = buf;
        v33 = &v38;
        objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v29);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v28, "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count")
    && !objc_msgSend((id)v39[5], "count"))
  {
    if (kHAPIScope)
    {
      v21 = *(id *)kHAPIScope;
      if (!v21)
      {
LABEL_30:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4814, 0, v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v25 + 2))(v25, 0, 0, 0, v19);
        v18 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 136315650;
      v45 = "HapticDictionaryReader.mm";
      v46 = 1024;
      v47 = 196;
      v48 = 2080;
      v49 = "-[HapticDictionaryReader parseEventsAndParameters:withBaseURL:reply:]";
      _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Empty pattern", v44, 0x1Cu);
    }

    goto LABEL_30;
  }
  (*((void (**)(id, id, _QWORD, uint64_t, _QWORD))v25 + 2))(v25, v28, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v39[5], 0);
  v18 = 1;
  v19 = v10;
LABEL_22:
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(buf, 8);
  return v18;
}

void __69__HapticDictionaryReader_parseEventsAndParameters_withBaseURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(v13, "isEqualToString:", CHHapticPatternKeyEvent))
  {
    objc_msgSend(*(id *)(a1 + 32), "parseEvent:withBaseURL:", v5, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v13, "isEqualToString:", CHHapticPatternKeyParameter))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    objc_msgSend(*(id *)(a1 + 32), "parseParam:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v6);
    goto LABEL_11;
  }
  if (objc_msgSend(v13, "isEqualToString:", CHHapticPatternKeyParameterCurve))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_msgSend(*(id *)(a1 + 32), "parseParamCurve:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v6);
    goto LABEL_11;
  }
LABEL_12:

}

- (id)parseEvent:(id)a3 withBaseURL:(id)a4
{
  NSURL *v6;
  void *v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  double v12;
  NSURL *v13;
  const CALog::Scope *v14;
  NSURL *v15;
  NSObject *v16;
  NSObject *v17;
  ExtAudioFileRef *v18;
  id v19;
  id v20;
  id v21;
  CHHapticEvent *v22;
  double v23;
  CHHapticEvent *v24;
  CHHapticEvent *v26;
  id v27;
  _QWORD v28[10];
  uint64_t v29;
  double *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  _BYTE v58[18];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = (NSURL *)a4;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = 0;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0xBFF0000000000000;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0xBFF0000000000000;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __49__HapticDictionaryReader_parseEvent_withBaseURL___block_invoke;
  v28[3] = &unk_1E6960010;
  v28[6] = &v33;
  v28[7] = &v29;
  v28[4] = self;
  v28[5] = &v49;
  v28[8] = &v37;
  v28[9] = &v43;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v28);
  v7 = (void *)v50[5];
  if (!v7)
  {
    if (kHAPIScope)
    {
      v8 = *(id *)kHAPIScope;
      if (!v8)
      {
        v9 = -4830;
        v10 = CFSTR("Missing event type");
        v11 = CFSTR("CoreHapticsMissingEventTypeException");
        goto LABEL_36;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "HapticDictionaryReader.mm";
      v57 = 1024;
      *(_DWORD *)v58 = 239;
      *(_WORD *)&v58[4] = 2080;
      *(_QWORD *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Missing event type", buf, 0x1Cu);
    }
    v9 = -4830;
    v10 = CFSTR("Missing event type");
    v11 = CFSTR("CoreHapticsMissingEventTypeException");
    goto LABEL_35;
  }
  if (v34[3] < 0.0)
  {
    if (kHAPIScope)
    {
      v8 = *(id *)kHAPIScope;
      if (!v8)
      {
        v9 = -4822;
        v10 = CFSTR("Illegal or missing event time");
        v11 = CFSTR("CoreHapticsInvalidEventTimeException");
        goto LABEL_36;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "HapticDictionaryReader.mm";
      v57 = 1024;
      *(_DWORD *)v58 = 243;
      *(_WORD *)&v58[4] = 2080;
      *(_QWORD *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal or missing event time", buf, 0x1Cu);
    }
    v9 = -4822;
    v10 = CFSTR("Illegal or missing event time");
    v11 = CFSTR("CoreHapticsInvalidEventTimeException");
    goto LABEL_35;
  }
  v12 = v30[3];
  if (v12 != -1.0 && v12 < 0.0)
  {
    if (kHAPIScope)
    {
      v8 = *(id *)kHAPIScope;
      if (!v8)
      {
        v9 = -4823;
        v10 = CFSTR("Illegal event duration");
        v11 = CFSTR("CoreHapticsInvalidEventDurationException");
        goto LABEL_36;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "HapticDictionaryReader.mm";
      v57 = 1024;
      *(_DWORD *)v58 = 247;
      *(_WORD *)&v58[4] = 2080;
      *(_QWORD *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal event duration", buf, 0x1Cu);
    }
    v9 = -4823;
    v10 = CFSTR("Illegal event duration");
    v11 = CFSTR("CoreHapticsInvalidEventDurationException");
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CHHapticEventTypeAudioCustom))
  {
    v13 = (NSURL *)v44[5];
    if (!v13)
    {
      if (kHAPIScope)
      {
        v8 = *(id *)kHAPIScope;
        if (!v8)
        {
          v9 = -4830;
          v10 = CFSTR("Missing or invalid audio resource path");
          v11 = CFSTR("CoreHapticsBadEventEntryException");
LABEL_36:
          Haptic_RaiseException(&v11->isa, &v10->isa, v9);
        }
      }
      else
      {
        v8 = MEMORY[0x1E0C81028];
        v27 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "HapticDictionaryReader.mm";
        v57 = 1024;
        *(_DWORD *)v58 = 252;
        *(_WORD *)&v58[4] = 2080;
        *(_QWORD *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
        _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Custom event is missing its audio resource path", buf, 0x1Cu);
      }
      v9 = -4830;
      v10 = CFSTR("Missing or invalid audio resource path");
      v11 = CFSTR("CoreHapticsBadEventEntryException");
LABEL_35:

      goto LABEL_36;
    }
    FullURLPathFromURL(v13, v6);
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v14);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "HapticDictionaryReader.mm";
        v57 = 1024;
        *(_DWORD *)v58 = 261;
        *(_WORD *)&v58[4] = 2080;
        *(_QWORD *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
        _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Custom event's audio resource path cannot be resolved", buf, 0x1Cu);
      }

      Haptic_RaiseException(CFSTR("CoreHapticsBadEventEntryException"), CFSTR("Invalid audio resource path"), -4830);
    }
    AudioResource::AudioResource((AudioResource *)buf, v15);
    if (AudioResource::verifyAudioFile(v18, 1))
      Haptic_RaiseException(CFSTR("CoreHapticsInvalidAudioResourceException"), CFSTR("Invalid audio resource"), -4824);
    v26 = [CHHapticEvent alloc];
    ++self->_urlIndex;
    v24 = -[CHHapticEvent initWithAudioResourceIndex:parameters:time:duration:](v26, "initWithAudioResourceIndex:parameters:time:duration:", v34[3], (double)*(unint64_t *)&v58[2] / *(double *)&v58[10]);
    AudioResource::~AudioResource((AudioResource *)buf);

  }
  else
  {
    v22 = [CHHapticEvent alloc];
    v23 = v30[3];
    if (v23 == -1.0)
      v23 = 0.0;
    v24 = -[CHHapticEvent initWithEventType:parameters:relativeTime:duration:](v22, "initWithEventType:parameters:relativeTime:duration:", v50[5], v38[5], v34[3], v23);
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v24;
}

void __49__HapticDictionaryReader_parseEvent_withBaseURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  float v10;
  double v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v17 = v5;
  if (objc_msgSend(v17, "isEqualToString:", CHHapticPatternKeyEventType))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = v6;
    v9 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
    goto LABEL_7;
  }
  if ((objc_msgSend(v17, "isEqualToString:", CHHapticPatternKeyTime) & 1) != 0
    || objc_msgSend(v17, "isEqualToString:", CFSTR("EventTime")))
  {
    v9 = v6;
    objc_msgSend(v9, "floatValue");
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 48);
LABEL_6:
    *(double *)(*(_QWORD *)(v12 + 8) + 24) = v11;
    goto LABEL_7;
  }
  if (objc_msgSend(v17, "isEqualToString:", CHHapticPatternKeyEventDuration))
  {
    v9 = v6;
    objc_msgSend(v9, "floatValue");
    v11 = v13;
    v12 = *(_QWORD *)(a1 + 56);
    goto LABEL_6;
  }
  if (objc_msgSend(v17, "isEqualToString:", CHHapticPatternKeyEventParameters))
  {
    objc_msgSend(*(id *)(a1 + 32), "parseEventParams:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 64);
  }
  else
  {
    if (!objc_msgSend(v17, "isEqualToString:", CHHapticPatternKeyEventWaveformPath))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 72);
  }
  v16 = *(_QWORD *)(v15 + 8);
  v9 = *(id *)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v14;
LABEL_7:

LABEL_8:
}

- (id)parseEventParams:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  CHHapticEventParameter *v14;
  CHHapticEventParameter *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v17;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", CHHapticPatternKeyParameterID);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          if (kHAPIScope)
          {
            v9 = *(id *)kHAPIScope;
            if (!v9)
              goto LABEL_14;
          }
          else
          {
            v9 = MEMORY[0x1E0C81028];
            v10 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v24 = "HapticDictionaryReader.mm";
            v25 = 1024;
            v26 = 288;
            v27 = 2080;
            v28 = "-[HapticDictionaryReader parseEventParams:]";
            _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event parameter has invalid or missing parameter ID", buf, 0x1Cu);
          }

LABEL_14:
          Haptic_RaiseException(CFSTR("CoreHapticsBadParameterEntryException"), CFSTR("Event parameter has invalid or missing parameter ID"), -4831);
        }
        objc_msgSend(v7, "objectForKey:", CHHapticPatternKeyParameterValue);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (kHAPIScope)
          {
            v12 = *(id *)kHAPIScope;
            if (!v12)
              goto LABEL_23;
          }
          else
          {
            v12 = MEMORY[0x1E0C81028];
            v13 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v24 = "HapticDictionaryReader.mm";
            v25 = 1024;
            v26 = 295;
            v27 = 2080;
            v28 = "-[HapticDictionaryReader parseEventParams:]";
            _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event parameter has invalid or missing parameter value", buf, 0x1Cu);
          }

LABEL_23:
          Haptic_RaiseException(CFSTR("CoreHapticsBadParameterEntryException"), CFSTR("Event parameter has invalid or missing parameter value"), -4831);
        }
        v14 = [CHHapticEventParameter alloc];
        objc_msgSend(v11, "floatValue");
        v15 = -[CHHapticEventParameter initWithParameterID:value:](v14, "initWithParameterID:value:", v8);
        objc_msgSend(v3, "addObject:", v15);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v4);
  }

  return v3;
}

- (id)parseParam:(id)a3
{
  id v3;
  CHHapticDynamicParameter *v4;
  double v5;
  CHHapticDynamicParameter *v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  const char *v10;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0xBFF0000000000000;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__HapticDictionaryReader_parseParam___block_invoke;
  v12[3] = &unk_1E6960038;
  v12[4] = &v21;
  v12[5] = &v17;
  v12[6] = &v13;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (!v22[5] || v18[3] == -1.0)
  {
    if (kHAPIScope)
    {
      v7 = *(id *)kHAPIScope;
      if (!v7)
        goto LABEL_14;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = v22[5] == 0;
      *(_DWORD *)buf = 136315906;
      v28 = "HapticDictionaryReader.mm";
      if (v9)
        v10 = "type";
      else
        v10 = "time";
      v29 = 1024;
      v30 = 330;
      v31 = 2080;
      v32 = "-[HapticDictionaryReader parseParam:]";
      v33 = 2080;
      v34 = v10;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Param is missing a %s", buf, 0x26u);
    }

LABEL_14:
    Haptic_RaiseException(CFSTR("CoreHapticsBadParameterEntryException"), CFSTR("Parameter has invalid or missing time or type key"), -4831);
  }
  v4 = [CHHapticDynamicParameter alloc];
  v5 = v14[3];
  *(float *)&v5 = v5;
  v6 = -[CHHapticDynamicParameter initWithParameterID:value:relativeTime:](v4, "initWithParameterID:value:relativeTime:", v22[5], v5, v18[3]);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v6;
}

void __37__HapticDictionaryReader_parseParam___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  float v10;
  double v11;
  uint64_t v12;
  float v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v14 = v5;
  if (objc_msgSend(v14, "isEqualToString:", CHHapticPatternKeyParameterID))
  {
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = v6;
    v9 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    if ((objc_msgSend(v14, "isEqualToString:", CHHapticPatternKeyTime) & 1) != 0
      || objc_msgSend(v14, "isEqualToString:", CFSTR("ParameterTime")))
    {
      v9 = v6;
      objc_msgSend(v9, "floatValue");
      v11 = v10;
      v12 = a1[5];
    }
    else
    {
      if (!objc_msgSend(v14, "isEqualToString:", CHHapticPatternKeyParameterValue))
        goto LABEL_8;
      v9 = v6;
      objc_msgSend(v9, "floatValue");
      v11 = v13;
      v12 = a1[6];
    }
    *(double *)(*(_QWORD *)(v12 + 8) + 24) = v11;
  }

LABEL_8:
}

- (id)parseParamCurve:(id)a3
{
  CHHapticParameterCurve *v3;
  CHHapticParameterCurve *v4;
  NSObject *v5;
  id v6;
  BOOL v7;
  const char *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0xBFF0000000000000;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__HapticDictionaryReader_parseParamCurve___block_invoke;
  v10[3] = &unk_1E6960060;
  v10[6] = &v17;
  v10[7] = &v11;
  v10[4] = self;
  v10[5] = &v21;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (!v22[5] || v18[3] == -1.0)
  {
    if (kHAPIScope)
    {
      v5 = *(id *)kHAPIScope;
      if (!v5)
        goto LABEL_14;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = v22[5] == 0;
      *(_DWORD *)buf = 136315906;
      v28 = "HapticDictionaryReader.mm";
      if (v7)
        v8 = "type";
      else
        v8 = "time";
      v29 = 1024;
      v30 = 359;
      v31 = 2080;
      v32 = "-[HapticDictionaryReader parseParamCurve:]";
      v33 = 2080;
      v34 = v8;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Param is missing a %s", buf, 0x26u);
    }

LABEL_14:
    Haptic_RaiseException(CFSTR("CoreHapticsBadParameterEntryException"), CFSTR("ParameterCurve has invalid or missing time or type key"), -4831);
  }
  v3 = [CHHapticParameterCurve alloc];
  v4 = -[CHHapticParameterCurve initWithParameterID:controlPoints:relativeTime:](v3, "initWithParameterID:controlPoints:relativeTime:", v22[5], v12[5], v18[3]);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v4;
}

void __42__HapticDictionaryReader_parseParamCurve___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v13 = v5;
  if (objc_msgSend(v13, "isEqualToString:", CHHapticPatternKeyParameterID))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = v6;
    v9 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v13, "isEqualToString:", CHHapticPatternKeyTime))
  {
    v9 = v6;
    objc_msgSend(v9, "floatValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", CHHapticPatternKeyParameterCurveControlPoints))
  {
    objc_msgSend(*(id *)(a1 + 32), "parseParamCurveControlPoints:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(id *)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
    goto LABEL_7;
  }
LABEL_8:

}

- (id)parseParamCurveControlPoints:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  CHHapticParameterCurveControlPoint *v10;
  double v11;
  double v12;
  int v13;
  double v14;
  CHHapticParameterCurveControlPoint *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v21;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16, v21);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v6);
      objc_msgSend(v7, "objectForKey:", CHHapticPatternKeyTime);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        break;
      objc_msgSend(v7, "objectForKey:", CHHapticPatternKeyParameterValue);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if (kHAPIScope)
        {
          v17 = *(id *)kHAPIScope;
          if (!v17)
            goto LABEL_24;
        }
        else
        {
          v17 = MEMORY[0x1E0C81028];
          v19 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v28 = "HapticDictionaryReader.mm";
          v29 = 1024;
          v30 = 378;
          v31 = 2080;
          v32 = "-[HapticDictionaryReader parseParamCurveControlPoints:]";
          _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Parameter curve control point has invalid or missing value", buf, 0x1Cu);
        }

LABEL_24:
LABEL_25:

        v16 = 0;
        goto LABEL_26;
      }
      v10 = [CHHapticParameterCurveControlPoint alloc];
      -[NSObject doubleValue](v8, "doubleValue");
      v12 = v11;
      objc_msgSend(v9, "floatValue");
      LODWORD(v14) = v13;
      v15 = -[CHHapticParameterCurveControlPoint initWithRelativeTime:value:](v10, "initWithRelativeTime:value:", v12, v14);
      objc_msgSend(v3, "addObject:", v15);

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    if (kHAPIScope)
    {
      v8 = *(id *)kHAPIScope;
      if (!v8)
        goto LABEL_25;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "HapticDictionaryReader.mm";
      v29 = 1024;
      v30 = 372;
      v31 = 2080;
      v32 = "-[HapticDictionaryReader parseParamCurveControlPoints:]";
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Parameter curve control point has invalid or missing time", buf, 0x1Cu);
    }
    goto LABEL_24;
  }
LABEL_10:

  v16 = v3;
LABEL_26:

  return v16;
}

@end
