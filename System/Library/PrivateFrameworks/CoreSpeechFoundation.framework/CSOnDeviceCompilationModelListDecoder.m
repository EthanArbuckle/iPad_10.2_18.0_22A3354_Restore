@implementation CSOnDeviceCompilationModelListDecoder

+ (id)decodeConfigFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OnDeviceCompilationModelList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v3, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OnDeviceCompilationModelList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v10)
      goto LABEL_23;
    v12 = v10;
    v13 = *(_QWORD *)v30;
    *(_QWORD *)&v11 = 136315138;
    v28 = v11;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        objc_msgSend(v3, "dictionary", v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("OnDeviceCompilationModelList"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "isEqualToString:", CFSTR("SecondpassChecker")))
        {
          objc_msgSend(v3, "resourcePath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v6;
          v22 = v20;
          v23 = &unk_1E68A16F0;
LABEL_17:
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v23);

          goto LABEL_18;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("SpeakerRecognition")))
        {
          objc_msgSend(v3, "resourcePath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v6;
          v22 = v20;
          v23 = &unk_1E68A1708;
          goto LABEL_17;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("AFTM")))
        {
          objc_msgSend(v3, "resourcePath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v6;
          v22 = v20;
          v23 = &unk_1E68A1738;
          goto LABEL_17;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("ODLD")))
        {
          objc_msgSend(v3, "resourcePath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v6;
          v22 = v20;
          v23 = &unk_1E68A1720;
          goto LABEL_17;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("NC")))
        {
          objc_msgSend(v3, "resourcePath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v6;
          v22 = v20;
          v23 = &unk_1E68A1750;
          goto LABEL_17;
        }
        v24 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v35 = "+[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:]";
          _os_log_error_impl(&dword_1B502E000, v24, OS_LOG_TYPE_ERROR, "%s modelType specified in onDeviceCompilation list is not supported", buf, 0xCu);
        }
LABEL_18:

        ++v14;
      }
      while (v12 != v14);
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v12 = v25;
      if (!v25)
      {
LABEL_23:

        goto LABEL_27;
      }
    }
  }
  v26 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "+[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:]";
    _os_log_impl(&dword_1B502E000, v26, OS_LOG_TYPE_DEFAULT, "%s Cannot find onDeviceCompilationModelList in asset json", buf, 0xCu);
  }
  v6 = 0;
LABEL_27:

  return v6;
}

@end
