@implementation RPAudioMixUtility

+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  +[RPAudioMixUtility tempFileURL](RPAudioMixUtility, "tempFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDB1C30];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__RPAudioMixUtility_mixAudioForMovie_withCompletionHandler___block_invoke;
  v11[3] = &unk_24D15DBD0;
  v12 = v7;
  v13 = v5;
  v9 = v7;
  v10 = v5;
  +[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:](RPAudioMixUtility, "mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:", v6, v9, v8, v11);

}

uint64_t __60__RPAudioMixUtility_mixAudioForMovie_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
  {
    if (__RPLogLevel <= 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        v40 = 1024;
        v41 = 33;
        v42 = 2112;
        v43 = v9;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movieURL  %@", buf, 0x1Cu);
      }
      if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        v40 = 1024;
        v41 = 34;
        v42 = 2112;
        v43 = v10;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finalMovieURL %@", buf, 0x1Cu);
      }
    }
    v29 = v9;
    objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RPAudioMixUtility exportPresetForAVAsset:](RPAudioMixUtility, "exportPresetForAVAsset:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23A8]), "initWithAsset:presetName:", v13, v26);
    v28 = v10;
    objc_msgSend(v14, "setOutputURL:", v10);
    v27 = v11;
    objc_msgSend(v14, "setOutputFileType:", v11);
    objc_msgSend(v13, "tracksWithMediaType:", *MEMORY[0x24BDB1CF0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDB25A8], "audioMixInputParameters");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setTrackID:", objc_msgSend(v22, "trackID"));
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x24BDB25A0], "audioMix");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setInputParameters:", v16);
    objc_msgSend(v14, "setAudioMix:", v24);
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
      v40 = 1024;
      v41 = 63;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting export session", buf, 0x12u);
    }
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __89__RPAudioMixUtility_mixAudioForMovie_finalMovieURL_outputFileType_withCompletionHandler___block_invoke;
    v30[3] = &unk_24D15D850;
    v31 = v14;
    v32 = v12;
    v25 = v14;
    objc_msgSend(v25, "exportAsynchronouslyWithCompletionHandler:", v30);

    v10 = v28;
    v9 = v29;
    v11 = v27;
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5818, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v13);
  }

}

void __89__RPAudioMixUtility_mixAudioForMovie_finalMovieURL_outputFileType_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _BYTE v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == 5)
  {
    if (__RPLogLevel > 1 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)v7 = 136446466;
    *(_QWORD *)&v7[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 72;
    v3 = MEMORY[0x24BDACB70];
    v4 = " [INFO] %{public}s:%d AVAssetExportSessionStatusCancelled";
    goto LABEL_9;
  }
  if (v2 == 4)
  {
    if (__RPLogLevel > 1 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)v7 = 136446466;
    *(_QWORD *)&v7[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 67;
    v3 = MEMORY[0x24BDACB70];
    v4 = " [INFO] %{public}s:%d AVAssetExportSessionFailed";
LABEL_9:
    _os_log_impl(&dword_214135000, v3, OS_LOG_TYPE_DEFAULT, v4, v7, 0x12u);
LABEL_10:
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5818, 0, *(_OWORD *)v7, *(_QWORD *)&v7[16]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    return;
  }
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v7 = 136446466;
    *(_QWORD *)&v7[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 77;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportSession returned with no errors", v7, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)tempFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_srTempPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/RPReplay_Final"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v5, v9, CFSTR(".mp4"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)videoCodecTypeForAVAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const opaqueCMFormatDescription *v6;
  FourCharCode MediaSubType;
  void *v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RPAudioMixUtility videoCodecTypeForAVAsset:].cold.2();
    v5 = 0;
    v4 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RPAudioMixUtility videoCodecTypeForAVAsset:].cold.1();
LABEL_14:
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (const opaqueCMFormatDescription *)objc_claimAutoreleasedReturnValue();
  MediaSubType = CMFormatDescriptionGetMediaSubType(v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", RPStringUtility_FourccToCStr(MediaSubType));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446722;
    v12 = "+[RPAudioMixUtility videoCodecTypeForAVAsset:]";
    v13 = 1024;
    v14 = 111;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d videoCodecType=%@", (uint8_t *)&v11, 0x1Cu);
  }
LABEL_6:
  v9 = v8;

  return v9;
}

+ (id)exportPresetForAVAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (id)*MEMORY[0x24BDB19A8];
  +[RPAudioMixUtility videoCodecTypeForAVAsset:](RPAudioMixUtility, "videoCodecTypeForAVAsset:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB22A0]))
    {
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB2298]))
      {
        if (__RPLogLevel > 1 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_7;
        v12 = 136446466;
        v13 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        v14 = 1024;
        v15 = 124;
        v9 = MEMORY[0x24BDACB70];
        v10 = " [INFO] %{public}s:%d AVAssetExportPresetHighestQuality for H264";
        v11 = 18;
      }
      else
      {
        if (__RPLogLevel > 1 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_7;
        v12 = 136446722;
        v13 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        v14 = 1024;
        v15 = 127;
        v16 = 2112;
        v17 = v6;
        v9 = MEMORY[0x24BDACB70];
        v10 = " [INFO] %{public}s:%d videoCodecType=%@, use default preset";
        v11 = 28;
      }
      _os_log_impl(&dword_214135000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, v11);
      goto LABEL_7;
    }
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136446466;
      v13 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
      v14 = 1024;
      v15 = 121;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportPresetHEVCHighestQuality for HEVC", (uint8_t *)&v12, 0x12u);
    }
    v7 = (id)*MEMORY[0x24BDB19A0];

    v4 = v7;
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[RPAudioMixUtility exportPresetForAVAsset:].cold.1();
  }
LABEL_7:

  return v4;
}

+ (void)mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d video URL is nil", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)videoCodecTypeForAVAsset:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Asset Video Track constains more than one formatDescscriptions", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)videoCodecTypeForAVAsset:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Asset should only contain 1 video track", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)exportPresetForAVAsset:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to get videoCodecType for asset", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
