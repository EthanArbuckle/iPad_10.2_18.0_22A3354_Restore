@implementation AXMScreenRecognitionCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_16);
  return (id)sharedInstance_Center;
}

void __44__AXMScreenRecognitionCenter_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Center;
  sharedInstance_Center = v0;

}

- (id)_processVisionResult:(id)a3 options:(id)a4 coagulator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  AXMediaLogMLElement();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.5(v7, v8);

  objc_msgSend(v7, "equivalenceToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equivalenceToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  objc_msgSend(v7, "equivalenceToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScreenEquivalenceToken:", v15);

  if (v14)
  {
    objc_msgSend(v10, "setSameScreenCapResult:", 1);
    AXMediaLogMLElement();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_33:

    goto LABEL_34;
  }
  v59 = v9;
  v60 = v8;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v61 = v7;
  objc_msgSend(v7, "features");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v67;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v67 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v28);
        AXMediaLogMLElement();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v29;
          _os_log_debug_impl(&dword_1B0E3B000, v30, OS_LOG_TYPE_DEBUG, "\tFeature results: %@", buf, 0xCu);
        }

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v26);
  }

  if ((objc_msgSend(v60, "disableCoagulator") & 1) != 0)
  {
    objc_msgSend(v61, "features");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortedFeatures:", v31);
  }
  else
  {
    CFAbsoluteTimeGetCurrent();
    objc_msgSend(v61, "features");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "coagulateElements:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortedFeatures:", v33);

    AXMediaLogMLElement();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.4();
  }

  AXMediaLogMLElement();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v10, "sortedFeatures");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v63;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v63 != v45)
          objc_enumerationMutation(v42);
        v47 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v46);
        AXMediaLogMLElement();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v47;
          _os_log_debug_impl(&dword_1B0E3B000, v48, OS_LOG_TYPE_DEBUG, "\tSorted results: %@", buf, 0xCu);
        }

        ++v46;
      }
      while (v44 != v46);
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v44);
  }

  objc_msgSend(v10, "sortedFeatures");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "count");

  v8 = v60;
  v7 = v61;
  v9 = v59;
  if (!v50)
  {
    AXMediaLogMLElement();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.2(v16, v51, v52, v53, v54, v55, v56, v57);
    goto LABEL_33;
  }
LABEL_34:

  return v10;
}

- ($436BAF7D86476205E6C1D891D6FE0A3A)processFeatures:(SEL)a3
{
  id v6;
  void *v7;
  double v8;
  double v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  dispatch_time_t v32;
  int v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  $436BAF7D86476205E6C1D891D6FE0A3A *result;
  _QWORD v39[5];
  id v40;
  id v41;
  NSObject *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[4];
  uint64_t buf;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (processFeatures__onceToken != -1)
    dispatch_once(&processFeatures__onceToken, &__block_literal_global_75);
  objc_msgSend((id)processFeatures____displayManager, "coreAnimationMainDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = dispatch_semaphore_create(0);
  objc_msgSend(v6, "testingImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v9 = 1.0;
  +[AXMLElementCoagulation sharedInstance](AXMLElementCoagulation, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullRect");
  objc_msgSend(v12, "setAppFrame:");
  objc_msgSend(v12, "setAppOrientation:", objc_msgSend(v6, "orientation"));
  objc_msgSend(v12, "setScreenScale:", v9);
  objc_msgSend(v12, "setIsRTL:", objc_msgSend(v6, "isRTL"));
  AXMediaLogMLElement();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[AXMScreenRecognitionCenter processFeatures:].cold.1(v6, v50);

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__7;
  v48 = __Block_byref_object_dispose__7;
  v49 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_84;
  v39[3] = &unk_1E625E158;
  v43 = &v44;
  v39[4] = self;
  v14 = v6;
  v40 = v14;
  v15 = v12;
  v41 = v15;
  v16 = v10;
  v42 = v16;
  v17 = (void *)MEMORY[0x1B5E12AE8](v39);
  objc_msgSend(v14, "testingImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (v19)
  {
    objc_msgSend((id)processFeatures____engine, "captureNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fullRect");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v31 = objc_msgSend(v14, "orientation");
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "triggerWithScreenCaptureRegion:interfaceOrientation:options:cacheKey:resultHandler:", v31, v14, v21, v17, v24, v26, v28, v30);
  }
  else
  {
    objc_msgSend((id)processFeatures____engine, "imageNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "testingImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "triggerWithImage:options:cacheKey:resultHandler:", v21, v14, v22, v17);

  }
  v32 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v16, v32);
  v33 = objc_msgSend((id)v45[5], "sameScreenCapResult");
  objc_msgSend((id)v45[5], "screenEquivalenceToken");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v45[5], "sortedFeatures");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogMLElement();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    buf = 67109120;
    _os_log_impl(&dword_1B0E3B000, v36, OS_LOG_TYPE_INFO, "Handling results for ML detection for gen: %d", (uint8_t *)&buf, 8u);
  }

  if (v33)
  {
    AXMediaLogMLElement();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B0E3B000, v37, OS_LOG_TYPE_INFO, "ML Elements same screen capture - ignoring results", (uint8_t *)&buf, 2u);
    }

    retstr->var1 = 0;
    retstr->var2 = 0;
    retstr->var0 = v34;
  }
  else
  {
    retstr->var0 = v34;
    retstr->var1 = v35;
    retstr->var2 = 0;
  }

  _Block_object_dispose(&v44, 8);
  return result;
}

void __46__AXMScreenRecognitionCenter_processFeatures___block_invoke()
{
  dispatch_semaphore_t v0;
  AXMAXElementVisionEngine *v1;
  void *v2;
  AXMDisplayManager *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  _QWORD v15[4];
  dispatch_semaphore_t v16;

  v0 = dispatch_semaphore_create(0);
  v1 = -[AXMAXElementVisionEngine initWithIdentifier:]([AXMAXElementVisionEngine alloc], "initWithIdentifier:", CFSTR("AXElementVision"));
  v2 = (void *)processFeatures____engine;
  processFeatures____engine = (uint64_t)v1;

  v3 = [AXMDisplayManager alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_2;
  v15[3] = &unk_1E625CCC0;
  v16 = v0;
  v4 = v0;
  v5 = -[AXMDisplayManager initWithCompletion:](v3, "initWithCompletion:", v15);
  v6 = (void *)processFeatures____displayManager;
  processFeatures____displayManager = v5;

  v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v7);
  objc_msgSend((id)processFeatures____displayManager, "coreAnimationMainDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  processFeatures__ScaledScreenSize_0 = v9;
  processFeatures__ScaledScreenSize_1 = v10;

  objc_msgSend((id)processFeatures____displayManager, "coreAnimationMainDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  *(double *)&processFeatures__ScaledScreenSize_0 = *(double *)&processFeatures__ScaledScreenSize_0 / v12;

  objc_msgSend((id)processFeatures____displayManager, "coreAnimationMainDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  *(double *)&processFeatures__ScaledScreenSize_1 = *(double *)&processFeatures__ScaledScreenSize_1 / v14;

}

intptr_t __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  AXMediaLogMLElement();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_84_cold_1((uint64_t)v5, (uint64_t)v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "_processVisionResult:options:coagulator:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)_processVisionResult:(uint64_t)a3 options:(uint64_t)a4 coagulator:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, a1, a3, "Equivalence token is the same", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processVisionResult:(uint64_t)a3 options:(uint64_t)a4 coagulator:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, a1, a3, "No sorted features", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processVisionResult:(uint64_t)a3 options:(uint64_t)a4 coagulator:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, a1, a3, "Sorted results", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processVisionResult:options:coagulator:.cold.4()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  CFAbsoluteTimeGetCurrent();
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

- (void)_processVisionResult:(void *)a1 options:(void *)a2 coagulator:.cold.5(void *a1, void *a2)
{
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  void *v9;

  objc_msgSend(a1, "equivalenceToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "equivalenceToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x16u);

}

- (void)processFeatures:(void *)a1 .cold.1(void *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  os_log_type_t v13;
  const char *v14;
  uint8_t *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a1, "fullRect");
  *a2 = v5;
  a2[1] = v6;
  a2[2] = v7;
  a2[3] = v8;
  objc_msgSend(v4, "valueWithBytes:objCType:", a2, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "orientation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(v11, v12, v13, v14, v15, 0x20u);

}

void __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_84_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109634;
  v3[1] = 0;
  v4 = 2112;
  v5 = a1;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "ML Gen: %d Receieved remote handler reply %@/%@", (uint8_t *)v3, 0x1Cu);
}

@end
