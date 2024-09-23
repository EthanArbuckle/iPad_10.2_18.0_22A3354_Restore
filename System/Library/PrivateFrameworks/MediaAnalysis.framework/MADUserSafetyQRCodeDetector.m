@implementation MADUserSafetyQRCodeDetector

+ (BOOL)enabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.sensitivecontentanalysis.testing"));
  objc_msgSend(v2, "objectForKey:", CFSTR("SensitiveContentAnalysisTestMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (id)sensitiveURLString
{
  return CFSTR("https://www.apple.com/families/");
}

- (MADUserSafetyQRCodeDetector)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADUserSafetyQRCodeDetector;
  return -[MADUserSafetyQRCodeDetector init](&v3, sel_init);
}

- (void)processPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 signpostPayload:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  NSNumber *v46;
  void *v47;
  id v48;
  NSNumber *v49;
  NSNumber *sensitivity;
  void *v51;
  id v52;
  NSNumber *v53;
  void *v54;
  void *context;
  void *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  uint8_t v64[128];
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  void *v69;
  _QWORD v70[4];

  v5 = *(_QWORD *)&a4;
  v70[1] = *MEMORY[0x1E0C80C00];
  v58 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v66 = (id)objc_opt_class();
    v8 = v66;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] start barcode detection", buf, 0xCu);

  }
  context = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0CEDE50], "mad_defaultRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)*MEMORY[0x1E0CEE278];
    v70[0] = *MEMORY[0x1E0CEE278];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v9;
    objc_msgSend(v9, "setSymbologies:", v11);

    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v58;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v16 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v57 = (void *)objc_msgSend(v16, "initWithCVPixelBuffer:orientation:options:", a3, v5, MEMORY[0x1E0C9AA70]);
    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v58;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_END, v13, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    if (v57)
    {
      VCPSignPostLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_signpost_id_generate(v19);

      VCPSignPostLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v58;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
      }

      v69 = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      v24 = objc_msgSend(v57, "performRequests:error:", v23, &v63);
      v25 = v63;

      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v58;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v20, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
      }

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v56, "results");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v28;
        if (v28)
        {
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v29 = v28;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v60;
            v53 = (NSNumber *)MEMORY[0x1E0C9AAA0];
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v60 != v31)
                  objc_enumerationMutation(v29);
                v33 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                objc_msgSend(v33, "symbology", v53, v54);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34 == v10;

                if (v35)
                {
                  objc_msgSend(v33, "payloadStringValue");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "sensitiveURLString");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v36, "isEqualToString:", v37);

                  if (v38)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      v47 = (void *)objc_opt_class();
                      *(_DWORD *)buf = 138412290;
                      v66 = v47;
                      v48 = v47;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Successfully detected the sensitive barcode!", buf, 0xCu);

                    }
                    v49 = (NSNumber *)MEMORY[0x1E0C9AAB0];
                    goto LABEL_48;
                  }
                }
              }
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
              if (v30)
                continue;
              break;
            }
          }
          else
          {
            v49 = (NSNumber *)MEMORY[0x1E0C9AAA0];
LABEL_48:
            v53 = v49;
          }

          v46 = v53;
        }
        else
        {
          v46 = (NSNumber *)MEMORY[0x1E0C9AAA0];
        }
        sensitivity = self->_sensitivity;
        self->_sensitivity = v46;

        v41 = 0;
        goto LABEL_51;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v44 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v66 = v44;
        v67 = 2112;
        v68 = v25;
        v45 = v44;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to perform vision requests, err %@", buf, 0x16u);

      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v66 = v42;
        v43 = v42;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create VNImageRequestHandler", buf, 0xCu);

      }
      v25 = 0;
    }
    v41 = 1;
LABEL_51:

    goto LABEL_52;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v56 = 0;
    v39 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v66 = v39;
    v40 = v39;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to configure VNDetectBarcodesRequest", buf, 0xCu);

    v25 = 0;
    v41 = 1;
LABEL_52:
    v9 = v56;
    goto LABEL_53;
  }
  v25 = 0;
  v41 = 1;
LABEL_53:

  objc_autoreleasePoolPop(context);
  if (!v41 && (int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v51 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v66 = v51;
    v52 = v51;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete barcode detection", buf, 0xCu);

  }
}

- (NSNumber)sensitivity
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSensitivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitivity, 0);
}

@end
