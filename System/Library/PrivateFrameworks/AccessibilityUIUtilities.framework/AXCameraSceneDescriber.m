@implementation AXCameraSceneDescriber

- (AXCameraSceneDescriber)init
{
  AXCameraSceneDescriber *v2;
  AXCameraManager *v3;
  AXCameraManager *manager;
  uint64_t v5;
  AXMVoiceOverVisionEngine *visionEngine;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXCameraSceneDescriber;
  v2 = -[AXCameraSceneDescriber init](&v9, sel_init);
  v3 = -[AXCameraManager init]([AXCameraManager alloc], "init");
  manager = v2->_manager;
  v2->_manager = v3;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3F18]), "init");
  visionEngine = v2->_visionEngine;
  v2->_visionEngine = (AXMVoiceOverVisionEngine *)v5;

  -[AXMVoiceOverVisionEngine imageNode](v2->_visionEngine, "imageNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldProcessRemotely:", 1);

  -[AXMVoiceOverVisionEngine prewarmEngine](v2->_visionEngine, "prewarmEngine");
  return v2;
}

- (void)imageDescriptionForCurrentCameraScene:(id)a3 withPreferredLocale:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  AXCameraManager *manager;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25[0] = *MEMORY[0x1E0CF3EF0];
  v7 = (void *)MEMORY[0x1E0C99DC8];
  v8 = a4;
  objc_msgSend(v7, "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = *MEMORY[0x1E0CF3EF8];
  v26[0] = v9;
  v26[1] = &unk_1E76C2210;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMVoiceOverVisionEngine configuredOptionsDisableAllDetectors:elementOptions:textRecognitionLevel:textDetectionLocales:preferringFullCaptions:](self->_visionEngine, "configuredOptionsDisableAllDetectors:elementOptions:textRecognitionLevel:textDetectionLocales:preferringFullCaptions:", 0, 2048, 0, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDetectText:", -[AXCameraSceneDescriber includeTextDetection](self, "includeTextDetection"));
  if (-[AXCameraSceneDescriber includeTextDetection](self, "includeTextDetection"))
  {
    objc_msgSend(MEMORY[0x1E0CF3F10], "defaultOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextDetectionOptions:", v12);

  }
  else
  {
    objc_msgSend(v11, "setTextDetectionOptions:", 0);
  }
  objc_msgSend(v11, "textDetectionOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRecognitionLevel:", 1);

  objc_msgSend(v11, "setPreferredOutputLocale:", v8);
  VOTLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_1BD892000, v14, OS_LOG_TYPE_DEFAULT, "Starting camera scene detection: %@", buf, 0xCu);
  }

  manager = self->_manager;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke;
  v19[3] = &unk_1E76ABE90;
  v19[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v6;
  v16 = v6;
  v17 = v10;
  v18 = v11;
  -[AXCameraManager fetchCurrentCameraSceneBufferWithHandler:](manager, "fetchCurrentCameraSceneBufferWithHandler:", v19);

}

void __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  VOTLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = a2;
    _os_log_impl(&dword_1BD892000, v4, OS_LOG_TYPE_DEFAULT, "Got buffer: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "imageNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke_183;
  v8[3] = &unk_1E76ABE68;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v5, "triggerWithImage:options:cacheKey:resultHandler:", v6, v7, 0, v8);

}

void __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VOTLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1BD892000, v7, OS_LOG_TYPE_DEFAULT, "Got results: %@ error: %@", buf, 0x16u);
  }

  objc_msgSend(v5, "detectedFeatureDescriptionWithOptions:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectedTextDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    AXUILocalizedStringForKey(CFSTR("DetectedText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    v19 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  if (objc_msgSend(v8, "length", v18, v19))
  {
    objc_msgSend(v5, "captionFeatures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "captionTranslationLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v8, v17);

    }
  }

}

- (BOOL)includeTextDetection
{
  return self->_includeTextDetection;
}

- (void)setIncludeTextDetection:(BOOL)a3
{
  self->_includeTextDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionEngine, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
