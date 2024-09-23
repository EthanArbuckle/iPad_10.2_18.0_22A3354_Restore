@implementation JFXReaderWriterExportController

- (id)fileTypeFromExtension
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;

  -[JFXExportController exportPath](self, "exportPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mp4")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("MP4")))
  {
    v4 = (id *)MEMORY[0x24BDF8498];
  }
  else
  {
    v4 = (id *)MEMORY[0x24BDF8548];
  }
  objc_msgSend(*v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)applyCompositionAspectRatioToAVPresetSize:(CGSize)a3 compositionSize:(CGSize)a4
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = a4.width / a4.height;
  if (a4.width / a4.height == 1.0)
  {
    v7 = a3.height;
  }
  else if (a4.width / a4.height >= 1.0)
  {
    if (v6 <= 1.0)
    {
      v8 = a4.height;
      v9 = a4.width;
      JFXLog_export();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[JFXReaderWriterExportController applyCompositionAspectRatioToAVPresetSize:compositionSize:].cold.1(v10, v9, v8, v6);

    }
    else
    {
      height = a3.width * (1.0 / v6);
    }
    v7 = width;
  }
  else
  {
    v7 = a3.width * v6;
    height = width;
  }
  v11 = height;
  result.height = v11;
  result.width = v7;
  return result;
}

- (id)JFX_videoCompressionSettingsFromAssistant:(id)a3
{
  id v3;
  id v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (id)*MEMORY[0x24BDB1F40];
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB1970]) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x24BDB1F50];
LABEL_7:
    v6 = *v5;

    v4 = v6;
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB1978]) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x24BDB1F58];
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB1958]))
  {
    v5 = (id *)MEMORY[0x24BDB1F48];
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x24BDB25F8], "outputSettingsAssistantWithPreset:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)videoCompressionSettings:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  int v50;
  void *v51;
  void *v52;
  _QWORD block[4];
  id v54;

  height = a3.height;
  width = a3.width;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__JFXReaderWriterExportController_videoCompressionSettings___block_invoke_2;
  block[3] = &unk_24EE580C8;
  v54 = &__block_literal_global_62;
  if (videoCompressionSettings__onceToken != -1)
    dispatch_once(&videoCompressionSettings__onceToken, block);
  -[JFXExportController currentPreset](self, "currentPreset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)videoCompressionSettings__presetToVideoSettingsLUT, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend((id)videoCompressionSettings__presetToVideoSettingsLUT, "objectForKeyedSubscript:", *MEMORY[0x24BDB1950]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v6, "isEqualToString:", JFXAssetExportPresetHEVC1280x720HDR) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", JFXAssetExportPresetHEVC1920x1080HDR) & 1) != 0)
  {
    v50 = 1;
LABEL_8:
    v8 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "isEqualToString:", JFXAssetExportPresetHEVC1280x720) & 1) != 0)
  {
    v50 = 0;
    goto LABEL_8;
  }
  v8 = objc_msgSend(v6, "isEqualToString:", JFXAssetExportPresetHEVC1920x1080);
  v50 = 0;
LABEL_9:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kJFXVideoSettingsSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CGSizeValue");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kJFXVideoSettingsFrameReordering"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kJFXVideoSettingsProfileLevel"));
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kJFXVideoSettingsEntropyMode"));
  v17 = objc_claimAutoreleasedReturnValue();
  v51 = v6;
  v18 = objc_msgSend((id)objc_opt_class(), "videoDataRateForPreset:size:", v6, width, height);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXReaderWriterExportController applyCompositionAspectRatioToAVPresetSize:compositionSize:](self, "applyCompositionAspectRatioToAVPresetSize:compositionSize:", v11, v13, width, height);
  v21 = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BDB2368]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDB2310]);

  v25 = (id *)MEMORY[0x24BDB22A0];
  if (!v8)
    v25 = (id *)MEMORY[0x24BDB2298];
  v26 = *v25;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BDB2268]);
  v27 = 3;
  if (v17)
    v27 = 4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v27 + v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v16;
  objc_msgSend(v28, "setObject:forKey:", v16, *MEMORY[0x24BDB2348]);
  if ((v8 & 1) == 0 && v17)
    objc_msgSend(v28, "setObject:forKey:", v17, *MEMORY[0x24BDB2308]);
  if (v50)
  {
    objc_msgSend(v28, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF95F8], *MEMORY[0x24BDF9280]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", *MEMORY[0x24BDBD268], *MEMORY[0x24BDF9318]);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v29, *MEMORY[0x24BDB2250]);

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v30, *MEMORY[0x24BDB2248]);

  }
  v31 = (void *)objc_msgSend(v28, "copy");
  objc_msgSend(v19, "setObject:forKey:", v31, *MEMORY[0x24BDB22C8]);

  objc_msgSend(MEMORY[0x24BE79028], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "preferredExportColorSpace");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v8 & 1) != 0 || !objc_msgSend(v33, "isHDRSpace"))
  {
    v34 = (void *)v17;
  }
  else
  {
    v34 = (void *)v17;
    objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v35 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v35;
  }
  v36 = (void *)objc_opt_new();
  objc_msgSend(v33, "nclcTriplet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "colorPrimary");
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BDB22B8]);

  objc_msgSend(v33, "nclcTriplet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "transferFunction");
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, *MEMORY[0x24BDB2360]);

  objc_msgSend(v33, "nclcTriplet");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "ycbcrMatrix");
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v42, *MEMORY[0x24BDB2370]);

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BDB22C0]);
  JFXLog_DebugExport();
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);

  if (v44)
  {
    JFXLog_DebugExport();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[JFXReaderWriterExportController videoCompressionSettings:].cold.3();

    JFXLog_DebugExport();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      -[JFXReaderWriterExportController videoCompressionSettings:].cold.2(self);

    JFXLog_DebugExport();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      -[JFXReaderWriterExportController videoCompressionSettings:].cold.1();

  }
  v48 = (void *)objc_msgSend(v19, "copy");

  return v48;
}

id __60__JFXReaderWriterExportController_videoCompressionSettings___block_invoke(double a1, double a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v19[0] = CFSTR("kJFXVideoSettingsSize");
  *(double *)v18 = a1;
  *(double *)&v18[1] = a2;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v18, "{CGSize=dd}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v19[1] = CFSTR("kJFXVideoSettingsFrameReordering");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = CFSTR("kJFXVideoSettingsProfileLevel");
  v20[1] = v13;
  v20[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v11)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("kJFXVideoSettingsEntropyMode"));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __60__JFXReaderWriterExportController_videoCompressionSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[10];
  _QWORD v15[12];

  v15[10] = *MEMORY[0x24BDAC8D0];
  v14[0] = JFXAssetExportPresetLowQuality;
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(640.0, 360.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v13;
  v14[1] = *MEMORY[0x24BDB1970];
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(640.0, 480.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  v14[2] = *MEMORY[0x24BDB1978];
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(960.0, 540.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v2;
  v14[3] = *MEMORY[0x24BDB1950];
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(1280.0, 720.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v3;
  v14[4] = JFXAssetExportPresetHEVC1280x720;
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(1280.0, 720.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v4;
  v14[5] = JFXAssetExportPresetHEVC1280x720HDR;
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(1280.0, 720.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v5;
  v14[6] = *MEMORY[0x24BDB1958];
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(1920.0, 1080.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v6;
  v14[7] = JFXAssetExportPresetHEVC1920x1080;
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(1920.0, 1080.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v7;
  v14[8] = JFXAssetExportPresetHEVC1920x1080HDR;
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(1920.0, 1080.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v8;
  v14[9] = *MEMORY[0x24BDB1960];
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(3840.0, 2160.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)videoCompressionSettings__presetToVideoSettingsLUT;
  videoCompressionSettings__presetToVideoSettingsLUT = v10;

}

- (id)audioCompressionSettings
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = (void *)objc_opt_class();
  -[JFXExportController currentPreset](self, "currentPreset", 6619138, (unsigned __int128)0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "audioDataRateForPreset:", v4);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1633772320);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x24BDB1780]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x24BDB17A0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 44100);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x24BDB17B8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x24BDB1770]);

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v14, 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v11, *MEMORY[0x24BDB1768]);

  v12 = (void *)objc_msgSend(v6, "copy");
  return v12;
}

- (id)videoDecompressionSettingsForVideoCompressionSettings:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDB2368]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (!v6)
  {
    JFXLog_export();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[JFXReaderWriterExportController videoDecompressionSettingsForVideoCompressionSettings:].cold.2();

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDB2310]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  if (!v9)
  {
    JFXLog_export();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[JFXReaderWriterExportController videoDecompressionSettingsForVideoCompressionSettings:].cold.1();

  }
  v30 = v4;
  v11 = v9;
  v12 = v6;
  -[JFXExportController composition](self, "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "compositionOutputColorSpace");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v31, "jfx_getCVPixelFormatForExport");
  v15 = ((v9 + 15) & 0x1FFFFFFF0) - v9;
  v29 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BDC56B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDC5708];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BDC5650];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 4096);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BDC56C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BDC5610];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 128);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v16, v28, v17, v18, v19, v20, v21, v22, v23, v24, v25, *MEMORY[0x24BDC55D0], 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (int64_t)mapAssetReaderStatusToExportStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4)
    return a3 + 1;
  else
    return 0;
}

- (int64_t)mapAssetWriterStatusToExportStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4)
    return a3 + 1;
  else
    return 0;
}

- (void)updateStatusAndErrorFromReader:(id)a3 andWriter:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;

  v6 = a3;
  v7 = a4;
  v8 = -[JFXReaderWriterExportController mapAssetReaderStatusToExportStatus:](self, "mapAssetReaderStatusToExportStatus:", objc_msgSend(v6, "status"));
  v9 = -[JFXReaderWriterExportController mapAssetWriterStatusToExportStatus:](self, "mapAssetWriterStatusToExportStatus:", objc_msgSend(v7, "status"));
  v10 = v9;
  if (v8 <= v9)
    v11 = v9;
  else
    v11 = v8;
  -[JFXExportController setStatus:](self, "setStatus:", v11);
  JFXLog_DebugExport();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[JFXReaderWriterExportController updateStatusAndErrorFromReader:andWriter:].cold.3(v8, v10, v12);

  if (v8 == 2 || v10 == 2)
    -[JFXExportController setStatus:](self, "setStatus:", 2);
  if (v8 == 4 || v10 == 4)
    -[JFXExportController setStatus:](self, "setStatus:", 4);
  if (-[JFXExportController status](self, "status") == 4)
  {
    objc_msgSend(v7, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    JFXLog_export();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
        -[JFXReaderWriterExportController updateStatusAndErrorFromReader:andWriter:].cold.2(v7, v14);
    }
    else if (v15)
    {
      -[JFXReaderWriterExportController updateStatusAndErrorFromReader:andWriter:].cold.1(v6, v14);
    }

  }
}

- (void)updateSessionProgress:(id)a3
{
  id v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  void *v11;
  CMTime v12;
  CMTime v13;
  CMTime time;

  v4 = a3;
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  -[JFXExportController composition](self, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "duration");
  else
    memset(&time, 0, sizeof(time));
  v9 = CMTimeGetSeconds(&time) * v6;

  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13, v9, 30);
  JFXLog_DebugExport();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[JFXReaderWriterExportController updateSessionProgress:].cold.1(v4, v10, v9);

  -[JFXReaderWriterExportController customCompositor](self, "customCompositor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  objc_msgSend(v11, "signalScheduling:playerRate:", &v12, COERCE_DOUBLE(__PAIR64__(HIDWORD(v13.value), 1.0)));

}

- (void)JFX_continueExportForNextPreset
{
  -[JFXReaderWriterExportController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_continueExportAfterDelay, 0, 0.5);
}

- (void)transferSampleBuffers:(id)a3 assetReader:(id)a4 assetWriterInput:(id)a5 assetWriter:(id)a6 timeRangeToExport:(id *)a7 queue:(id)a8 pass:(int64_t)a9 completionBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  JFXReaderWriterExportController *v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  int64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  char v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a10;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke;
  v28[3] = &unk_24EE5BA08;
  v35 = v40;
  v22 = v18;
  v29 = v22;
  v23 = v16;
  v30 = v23;
  v31 = self;
  v24 = *(_OWORD *)&a7->var0.var3;
  v37 = *(_OWORD *)&a7->var0.var0;
  v38 = v24;
  v39 = *(_OWORD *)&a7->var1.var1;
  v25 = v17;
  v32 = v25;
  v26 = v19;
  v33 = v26;
  v36 = a9;
  v27 = v21;
  v34 = v27;
  objc_msgSend(v22, "requestMediaDataWhenReadyOnQueue:usingBlock:", v20, v28);

  _Block_object_dispose(v40, 8);
}

uint64_t __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke(uint64_t result)
{
  uint64_t v1;
  __int128 v2;
  void *v3;
  int v4;
  void *v5;
  opaqueCMSampleBuffer *v6;
  opaqueCMSampleBuffer *v7;
  __int128 v8;
  double Seconds;
  double v10;
  NSObject *v11;
  double v12;
  float v13;
  void *v14;
  double v15;
  void *v16;
  __CVBuffer *ImageBuffer;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  NSObject *v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  __int128 v27;
  CFTypeRef v28;
  CFTypeRef v29;
  CFTypeRef value;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *key;
  uint64_t v34;
  CMTime rhs;
  CMTime v36;
  CMTime v37;
  CMTime lhs;
  CFTypeRef v39;
  _BYTE buf[48];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 80) + 8) + 24))
    return result;
  v1 = result;
  result = objc_msgSend(*(id *)(result + 32), "isReadyForMoreMediaData");
  if (!(_DWORD)result)
    return result;
  v34 = *MEMORY[0x24BDB1D50];
  key = (const __CFString *)*MEMORY[0x24BDC5490];
  v32 = (const __CFString *)*MEMORY[0x24BDC5510];
  v31 = (const __CFString *)*MEMORY[0x24BDC5570];
  value = (CFTypeRef)*MEMORY[0x24BDC54B8];
  v29 = (CFTypeRef)*MEMORY[0x24BDC5538];
  v28 = (CFTypeRef)*MEMORY[0x24BDC55A8];
  *(_QWORD *)&v2 = 134218240;
  v27 = v2;
  while (1)
  {
    objc_msgSend(*(id *)(v1 + 40), "mediaType", v27);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", v34);

    v5 = (void *)MEMORY[0x2276A1DB0]();
    if ((objc_msgSend(*(id *)(v1 + 48), "cancel") & 1) != 0)
    {
      JFXLog_DebugExport();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_1();
      goto LABEL_38;
    }
    v6 = (opaqueCMSampleBuffer *)objc_msgSend(*(id *)(v1 + 40), "copyNextSampleBuffer");
    v7 = v6;
    if (!v6)
    {
      JFXLog_DebugExport();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_2(v4, v1, v24);
LABEL_38:

      goto LABEL_39;
    }
    if (v4)
    {
      v8 = *(_OWORD *)(v1 + 112);
      *(_OWORD *)buf = *(_OWORD *)(v1 + 96);
      *(_OWORD *)&buf[16] = v8;
      *(_OWORD *)&buf[32] = *(_OWORD *)(v1 + 128);
      memset(&v37, 0, sizeof(v37));
      CMSampleBufferGetOutputPresentationTimeStamp(&v37, v6);
      memset(&v36, 0, sizeof(v36));
      lhs = v37;
      rhs = *(CMTime *)buf;
      CMTimeSubtract(&v36, &lhs, &rhs);
      lhs = v36;
      Seconds = CMTimeGetSeconds(&lhs);
      lhs = *(CMTime *)&buf[24];
      v10 = CMTimeGetSeconds(&lhs);
      JFXLog_DebugExport();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(lhs.value) = v27;
        *(CMTimeValue *)((char *)&lhs.value + 4) = v37.value;
        LOWORD(lhs.flags) = 1024;
        *(CMTimeFlags *)((char *)&lhs.flags + 2) = v37.timescale;
        _os_log_debug_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEBUG, "sampleTime=%lld scale=%d", (uint8_t *)&lhs, 0x12u);
      }

      if ((v36.flags & 1) != 0)
      {
        v12 = Seconds / v10;
        *(float *)&v12 = Seconds / v10;
        v13 = fminf(fmaxf(*(float *)&v12, 0.0), 1.0);
        *(float *)&v12 = v13;
        objc_msgSend(*(id *)(v1 + 48), "setProgress:", v12);
        v14 = *(void **)(v1 + 48);
        *(float *)&v15 = v13;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_updateSessionProgress_, v16, 1);

      }
      lhs = v37;
      rhs = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
      if (!CMTimeCompare(&lhs, &rhs))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(v7);
        v18 = CVBufferCopyAttachment(ImageBuffer, key, 0);
        v19 = CVBufferCopyAttachment(ImageBuffer, v32, 0);
        v20 = CVBufferCopyAttachment(ImageBuffer, v31, 0);
        JFXLog_DebugExport();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(lhs.value) = 138412802;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v18;
          LOWORD(lhs.flags) = 2112;
          *(_QWORD *)((char *)&lhs.flags + 2) = v19;
          HIWORD(lhs.epoch) = 2112;
          v39 = v20;
          _os_log_impl(&dword_2269A9000, v21, OS_LOG_TYPE_DEFAULT, "originalColorPrimaries=%@ originalTransferFunction=%@ originalYCbCrMatrix=%@", (uint8_t *)&lhs, 0x20u);
        }

        if (v18 || v19 || v20)
        {
          if (v18)
            CFRelease(v18);
          if (v19)
            CFRelease(v19);
          if (v20)
            CFRelease(v20);
        }
        else
        {
          CVBufferSetAttachment(ImageBuffer, key, value, kCVAttachmentMode_ShouldPropagate);
          CVBufferSetAttachment(ImageBuffer, v32, v29, kCVAttachmentMode_ShouldPropagate);
          CVBufferSetAttachment(ImageBuffer, v31, v28, kCVAttachmentMode_ShouldPropagate);
        }
      }
    }
    memset(&lhs, 0, sizeof(lhs));
    CMSampleBufferGetOutputPresentationTimeStamp(&lhs, v7);
    JFXLog_DebugExport();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("audio");
      if (v4)
        v23 = CFSTR("video");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = lhs.value;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = lhs.timescale;
      _os_log_impl(&dword_2269A9000, v22, OS_LOG_TYPE_DEFAULT, "Export added %@ sample at time %lld scale=%i", buf, 0x1Cu);
    }

    if ((objc_msgSend(*(id *)(v1 + 32), "appendSampleBuffer:", v7) & 1) == 0)
      break;
    CFRelease(v7);
    objc_autoreleasePoolPop(v5);
    result = objc_msgSend(*(id *)(v1 + 32), "isReadyForMoreMediaData");
    if ((result & 1) == 0)
      return result;
  }
  objc_msgSend(*(id *)(v1 + 48), "updateStatusAndErrorFromReader:andWriter:", *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
  JFXLog_export();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = objc_msgSend(*(id *)(v1 + 48), "status");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v26;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v7;
    _os_log_error_impl(&dword_2269A9000, v25, OS_LOG_TYPE_ERROR, "appendSampleBuffer failed error=%d %@", buf, 0x12u);
  }

  CFRelease(v7);
LABEL_39:
  objc_autoreleasePoolPop(v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 72) + 16))();
}

- (void)continueExportAfterDelay
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_6(&dword_2269A9000, v0, v1, "Failed to create asset reader: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;

  objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
  objc_msgSend(*(id *)(a1 + 40), "updateStatusAndErrorFromReader:andWriter:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 40), "status") == 4)
  {
    JFXLog_export();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_2(a1);

  }
  JFXLog_DebugExport();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_1(a1, a2, v5);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_43(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if ((objc_msgSend(*(id *)(a1 + 40), "cancel") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "status") == 1)
      objc_msgSend(*(id *)(a1 + 56), "cancelReading");
    if (objc_msgSend(*(id *)(a1 + 48), "status") == 1)
      objc_msgSend(*(id *)(a1 + 48), "cancelWriting");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "exportPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v2, 0);

  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_2;
    v5[3] = &unk_24EE585C0;
    v3 = *(void **)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v3, "finishWritingWithCompletionHandler:", v5);

  }
}

uint64_t __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "updateStatusAndErrorFromReader:andWriter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "status") != 3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "exportPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "nextPreset");
  objc_msgSend(*(id *)(a1 + 32), "currentPreset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (!v4)
    return objc_msgSend(v6, "closeSessionWithStatus:", 0);
  LODWORD(v5) = 0;
  objc_msgSend(v6, "setProgress:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_JFX_continueExportForNextPreset, 0, 0);
}

- (void)cancelExportWithStatus:(int64_t)a3
{
  NSObject *v5;
  objc_super v6;

  JFXLog_DebugExport();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXReaderWriterExportController cancelExportWithStatus:].cold.1();

  -[JFXExportController setCancel:](self, "setCancel:", 1);
  v6.receiver = self;
  v6.super_class = (Class)JFXReaderWriterExportController;
  -[JFXExportController cancelExportWithStatus:](&v6, sel_cancelExportWithStatus_, a3);
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (PVVideoCompositing)customCompositor
{
  return self->_customCompositor;
}

- (void)setCustomCompositor:(id)a3
{
  objc_storeStrong((id *)&self->_customCompositor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCompositor, 0);
}

- (void)applyCompositionAspectRatioToAVPresetSize:(double)a3 compositionSize:(double)a4 .cold.1(NSObject *a1, double a2, double a3, double a4)
{
  void *v6;
  int v7;
  double v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  NSStringFromCGSize(*(CGSize *)&a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a4;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_2269A9000, a1, OS_LOG_TYPE_ERROR, "unexpected aspectRatio=%f.3 for composition size=%@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_4_1();
}

- (void)videoCompressionSettings:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDB25F8], "availableOutputSettingsPresets");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "availableOutput: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

- (void)videoCompressionSettings:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "currentPreset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "JFX_videoCompressionSettingsFromAssistant:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v4, v5, "compare with assistant videoSettings: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_1();
}

- (void)videoCompressionSettings:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_2269A9000, v0, OS_LOG_TYPE_DEBUG, "videoSettings: %@", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)videoDecompressionSettingsForVideoCompressionSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "export height 0...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)videoDecompressionSettingsForVideoCompressionSettings:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "export width 0...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateStatusAndErrorFromReader:(void *)a1 andWriter:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_6(&dword_2269A9000, a2, v4, "assetReader.error=%{public}@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)updateStatusAndErrorFromReader:(void *)a1 andWriter:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_6(&dword_2269A9000, a2, v4, "assetWriter.error=%{public}@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)updateStatusAndErrorFromReader:(os_log_t)log andWriter:.cold.3(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "updateStatusAndError: readerStatus=%d writerStatus=%d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_4();
}

- (void)updateSessionProgress:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  float v5;
  uint64_t v6;
  int v7;
  double v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "floatValue");
  v7 = 134218240;
  v8 = v5;
  v9 = 2048;
  v10 = a3;
  OUTLINED_FUNCTION_3_1(&dword_2269A9000, a2, v6, "updateSessionProgress: progress=%f seconds=%f", (uint8_t *)&v7);
  OUTLINED_FUNCTION_4_1();
}

void __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "transferSampleBuffers: abortTransfer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_2(char a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("audio");
  v4 = *(_QWORD *)(a2 + 88);
  if ((a1 & 1) != 0)
    v3 = CFSTR("video");
  v5 = 138412546;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_3_1(&dword_2269A9000, a3, (uint64_t)a3, "transferSampleBuffers: allDone for %@ pass=%ld", (uint8_t *)&v5);
  OUTLINED_FUNCTION_4();
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  void *v5;
  int v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 72), "mediaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1D50]);
  v7 = CFSTR("audio");
  if (v6)
    v7 = CFSTR("video");
  v8 = 138412546;
  v9 = v7;
  v10 = 1024;
  v11 = a2 & 1;
  _os_log_debug_impl(&dword_2269A9000, a3, OS_LOG_TYPE_DEBUG, "single pass: transferSampleBuffers %@ done succeed=%d", (uint8_t *)&v8, 0x12u);

  OUTLINED_FUNCTION_4_1();
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 64));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "read failed on queue:\n%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)cancelExportWithStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "ReaderWriter -> cancelExport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
