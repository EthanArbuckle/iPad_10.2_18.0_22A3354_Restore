@implementation VCPMAMLModel

- (VCPMAMLModel)init
{

  return 0;
}

- (VCPMAMLModel)initWithModelName:(id)a3
{
  id v4;
  VCPMAMLModel *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  MLModel *model;
  MLModel *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  MLModel *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  NSString *inputFeatureName;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  int v41;
  VCPMAMLModel *v42;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  objc_super v55;
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)VCPMAMLModel;
  v5 = -[VCPMAMLModel init](&v55, sel_init);
  if (!v5)
    goto LABEL_52;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v4, CFSTR("mlmodelc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v54 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v7, &v54);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v54;
    model = v5->_model;
    v5->_model = (MLModel *)v8;

    v11 = v5->_model;
    if (v11)
    {
      -[MLModel modelDescription](v11, "modelDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inputDescriptionsByName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
      if (v15)
      {
        v44 = v9;
        v16 = *(_QWORD *)v51;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v51 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v14, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "type") == 4)
            {
              objc_msgSend(v19, "imageConstraint");
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v23 = (void *)v20;
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  v24 = objc_msgSend(v23, "pixelsWide");
                  v25 = objc_msgSend(v23, "pixelsHigh");
                  v26 = objc_msgSend(v23, "pixelFormatType");
                  *(_DWORD *)buf = 138413058;
                  v58 = (uint64_t)v18;
                  v59 = 2048;
                  v60 = v24;
                  v61 = 2048;
                  v62 = v25;
                  v63 = 2048;
                  v64 = v26;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MAMLModel] Input feature %@ %ldx%ld %ld", buf, 0x2Au);
                }
                v21 = objc_msgSend(v23, "pixelsWide");
                v15 = objc_msgSend(v23, "pixelsHigh");
                v5->_inputPixelFormat = objc_msgSend(v23, "pixelFormatType");
                v27 = objc_msgSend(v18, "copy");
                inputFeatureName = v5->_inputFeatureName;
                v5->_inputFeatureName = (NSString *)v27;

                goto LABEL_26;
              }
            }

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
          if (v15)
            continue;
          break;
        }
        v21 = 0;
LABEL_26:
        v9 = v44;
      }
      else
      {
        v21 = 0;
      }

      if (v5->_inputFeatureName && v5->_inputPixelFormat && v21 && v15)
      {
        if (v21 == v15)
        {
          v45 = v9;
          v5->_inputSize = v15;
          -[MLModel modelDescription](v5->_model, "modelDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "outputDescriptionsByName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v31 = v30;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v47;
            while (2)
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v47 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
                objc_msgSend(v31, "objectForKeyedSubscript:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v37, "type") == 5)
                {
                  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v58 = (uint64_t)v36;
                    v59 = 2112;
                    v60 = (uint64_t)v37;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MAMLModel] Output feature %@ %@", buf, 0x16u);
                  }
                  objc_storeStrong((id *)&v5->_outputFeatureName, v36);

                  goto LABEL_58;
                }

              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
              if (v33)
                continue;
              break;
            }
          }
LABEL_58:

          if (v5->_outputFeatureName)
          {
            v41 = 0;
            v9 = v45;
          }
          else
          {
            v9 = v45;
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v58 = (uint64_t)v31;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MAMLModel] Missing output feature %@", buf, 0xCu);
            }
            v41 = 1;
          }

LABEL_50:
          if (v41)
            goto LABEL_51;
LABEL_52:
          v42 = v5;
          goto LABEL_53;
        }
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_49:
          v41 = 1;
          goto LABEL_50;
        }
        *(_DWORD *)buf = 134218240;
        v58 = v21;
        v59 = 2048;
        v60 = v15;
        v38 = MEMORY[0x1E0C81028];
        v39 = "[MAMLModel] Mismatched inputImage width (%ld) and height (%ld)";
        v40 = 22;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_49;
        *(_DWORD *)buf = 138412290;
        v58 = (uint64_t)v14;
        v38 = MEMORY[0x1E0C81028];
        v39 = "[MAMLModel] Missing inputImage feature description %@";
        v40 = 12;
      }
      _os_log_impl(&dword_1B6C4A000, v38, OS_LOG_TYPE_ERROR, v39, buf, v40);
      goto LABEL_49;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v22 = v5->_model;
      *(_DWORD *)buf = 138412802;
      v58 = (uint64_t)v4;
      v59 = 2112;
      v60 = (uint64_t)v22;
      v61 = 2112;
      v62 = (uint64_t)v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@][MAMLModel] Failed to load compiled model (%@): %@", buf, 0x20u);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v58 = (uint64_t)v4;
      v59 = 2112;
      v60 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@][MAMLModel] Failed to open model file at url %@", buf, 0x16u);
    }
    v9 = 0;
  }

LABEL_51:
  v42 = 0;
LABEL_53:

  return v42;
}

+ (id)vcp_sharedModelWithModelName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPMAMLModel-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__VCPMAMLModel_vcp_sharedModelWithModelName___block_invoke;
  v9[3] = &unk_1E6B1A4A8;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "sharedInstanceWithIdentifier:andCreationBlock:", v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

VCPMAMLModel *__45__VCPMAMLModel_vcp_sharedModelWithModelName___block_invoke(uint64_t a1)
{
  return -[VCPMAMLModel initWithModelName:]([VCPMAMLModel alloc], "initWithModelName:", *(_QWORD *)(a1 + 32));
}

- (MLModel)model
{
  return self->_model;
}

- (int64_t)inputSize
{
  return self->_inputSize;
}

- (unsigned)inputPixelFormat
{
  return self->_inputPixelFormat;
}

- (NSString)inputFeatureName
{
  return self->_inputFeatureName;
}

- (NSString)outputFeatureName
{
  return self->_outputFeatureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
