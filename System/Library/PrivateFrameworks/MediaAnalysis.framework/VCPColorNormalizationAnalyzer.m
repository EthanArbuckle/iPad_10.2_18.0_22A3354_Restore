@implementation VCPColorNormalizationAnalyzer

- (VCPColorNormalizationAnalyzer)init
{
  VCPColorNormalizationAnalyzer *v2;
  uint64_t v3;
  VCPObjectPool *sessionPool;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPColorNormalizationAnalyzer;
  v2 = -[VCPColorNormalizationAnalyzer init](&v6, sel_init);
  if (v2)
  {
    +[VCPObjectPool objectPoolWithAllocator:](VCPObjectPool, "objectPoolWithAllocator:", &__block_literal_global_36);
    v3 = objc_claimAutoreleasedReturnValue();
    sessionPool = v2->_sessionPool;
    v2->_sessionPool = (VCPObjectPool *)v3;

  }
  return v2;
}

id __37__VCPColorNormalizationAnalyzer_init__block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0CEE040]);
}

- (int)analyzeCGImage:(CGImage *)a3 results:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  _BYTE v46[128];
  void *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  -[VCPObjectPool getObject](self->_sessionPool, "getObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CEDF70]);
  objc_msgSend(v34, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "initWithCGImage:options:session:", a3, MEMORY[0x1E0C9AA70], v7);

  v33 = (void *)v8;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CEDD78]);
    v10 = v9;
    if (v9)
    {
      v40 = 0;
      v11 = objc_msgSend(v9, "setRevision:error:", 3737841664, &v40);
      v12 = v40;
      if ((v11 & 1) != 0)
      {
        objc_msgSend(v10, "setMetalContextPriority:", 1);
        objc_msgSend(v10, "setPreferBackgroundProcessing:", 1);
        v32 = v10;
        if (DeviceHasANE())
        {
          objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setProcessingDevice:", v13);

        }
        v47 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v12;
        v15 = objc_msgSend(v33, "performRequests:error:", v14, &v39);
        v31 = v39;

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v10, "results");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "adjustmentKeys");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v36;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v36 != v21)
                    objc_enumerationMutation(v19);
                  v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
                  objc_msgSend(v16, "objectAtIndexedSubscript:", 0, v31);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "adjustmentValuesForKey:", v23);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v23);

                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
              }
              while (v20);
            }

            MEMORY[0x1BCCA0D34](v17, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = CFSTR("ColorNormalizationResults");
            v41 = CFSTR("colorNormalizationData");
            v42 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v27;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v29 = 0;
          }
          else
          {
            v29 = -18;
          }

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VNGeneratePhotosAdjustmentsRequest failed", buf, 2u);
            }
            v29 = -18;
            v12 = v31;
            goto LABEL_33;
          }
          v29 = -18;
        }
        v12 = v31;
        v10 = v32;
LABEL_33:

        goto LABEL_34;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v49 = 3737841664;
        v50 = 2112;
        v51 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set VNGeneratePhotosAdjustmentsRequest::setRevision %lu: %@", buf, 0x16u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create VNGeneratePhotosAdjustmentsRequest", buf, 2u);
      }
      v12 = 0;
    }
    v29 = -18;
    goto LABEL_33;
  }
  v29 = -108;
LABEL_34:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionPool, 0);
}

@end
