@implementation MADImagePersonalizationGatingTask

- (MADImagePersonalizationGatingTask)initWithRequest:(id)a3 imageAsset:(id)a4 signpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  MADImagePersonalizationGatingTask *v12;
  MADImagePersonalizationGatingTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADImagePersonalizationGatingTask;
  v12 = -[MADImagePersonalizationGatingTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
  }

  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  objc_class *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:imageAsset:signpostPayload:", v8, v9, v10);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v17, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  self->_canceled = 1;
}

- (CGRect)expandNormalizedRect:(CGRect)a3
{
  CGRect v3;
  CGRect v5;

  v3.origin.x = a3.origin.x - a3.size.width * 0.5;
  v3.origin.y = a3.origin.y - a3.size.height * 0.5;
  v3.size.width = a3.size.width + a3.size.width;
  v3.size.height = a3.size.height + a3.size.height;
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 1.0;
  v5.size.height = 1.0;
  return CGRectIntersection(v3, v5);
}

- (int)processPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 faces:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  NSString *signpostPayload;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  NSString *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  uint8_t buf[4];
  _QWORD v52[2];
  _BYTE v53[128];
  _QWORD v54[3];

  v5 = *(_QWORD *)&a4;
  v54[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  +[MADFaceDetectionResource sharedResource](MADFaceDetectionResource, "sharedResource");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateResource:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
  v50 = 0;
  v11 = objc_msgSend(v10, "setRevision:error:", 3737841670, &v50);
  v12 = v50;
  if ((v11 & 1) != 0)
  {
    v42 = v10;
    v13 = objc_alloc(MEMORY[0x1E0CEDF70]);
    objc_msgSend(v44, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v13, "initWithCVPixelBuffer:orientation:options:session:", a3, v5, MEMORY[0x1E0C9AA70], v14);

    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v52[0] = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);
    }

    v54[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v12;
    v21 = objc_msgSend(v41, "performRequests:error:", v20, &v49);
    v40 = v49;

    if ((v21 & 1) != 0)
    {
      VCPSignPostLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        v24 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v52[0] = v24;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, v16, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);
      }

      objc_msgSend(v43, "reset");
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v10, "results");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v46 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "boundingBox");
            -[MADImagePersonalizationGatingTask expandNormalizedRect:](self, "expandNormalizedRect:");
            v34 = v33 >= 0.25 && v32 >= 0.25;
            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D476D8]), "initWithNormalizedCropRect:eligible:", v34, v30, v31, v32, v33);
            objc_msgSend(v8, "addObject:", v35);

            v26 += v34;
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v27);
      }

      objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_93);
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v36 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 67109376;
        LODWORD(v52[0]) = v36;
        WORD2(v52[0]) = 1024;
        *(_DWORD *)((char *)v52 + 6) = v26;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Total Faces: %d  Eligible Faces: %d", buf, 0xEu);
      }
      v37 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to perform face detection", buf, 2u);
      }
      v37 = -18;
    }

    v12 = v40;
    goto LABEL_32;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v42 = v10;
    objc_msgSend(v12, "description");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v52[0] = v38;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to configure face detection (%@)", buf, 0xCu);

    v37 = -18;
LABEL_32:
    v10 = v42;
    goto LABEL_33;
  }
  v37 = -18;
LABEL_33:

  return v37;
}

uint64_t __74__MADImagePersonalizationGatingTask_processPixelBuffer_orientation_faces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "normalizedCropRect");
  v7 = v6;
  objc_msgSend(v4, "normalizedCropRect");
  v9 = v8;
  objc_msgSend(v5, "normalizedCropRect");
  v11 = v10;
  objc_msgSend(v5, "normalizedCropRect");
  if (v7 * v9 < v11 * v12)
    v13 = 1;
  else
    v13 = -1;

  return v13;
}

- (int)run
{
  MADImagePersonalizationGatingRequest *request;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MADImagePersonalizationGatingRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MADImagePersonalizationGatingRequest *v13;
  void *v14;
  void *v15;
  uint8_t v17[12];
  unsigned int v18;
  uint8_t buf[8];
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MADImagePersonalizationGatingTask running...", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v18 = 0;
  if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", buf, &v18))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MADImagePersonalizationGatingTask image loading failed", v17, 2u);
    }
    request = self->_request;
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADImagePersonalizationGatingRequest setError:](request, "setError:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MADImagePersonalizationGatingTask processPixelBuffer:orientation:faces:](self, "processPixelBuffer:orientation:faces:", *(_QWORD *)buf, v18, v5))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Face detection failed", v17, 2u);
      }
      v8 = self->_request;
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Face detection failed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADImagePersonalizationGatingRequest setError:](v8, "setError:", v12);

    }
    else
    {
      v13 = self->_request;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D476E8]), "initWithFaces:", v5);
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADImagePersonalizationGatingRequest setResults:](v13, "setResults:", v15);

      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MADImagePersonalizationGatingTask complete", v17, 2u);
      }
    }
  }

  CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
