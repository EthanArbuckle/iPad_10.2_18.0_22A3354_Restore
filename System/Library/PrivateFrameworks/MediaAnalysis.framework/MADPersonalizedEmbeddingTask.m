@implementation MADPersonalizedEmbeddingTask

+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    +[MADTextEncoderResource sharedResource:](MADTextEncoderResource, "sharedResource:", objc_msgSend(v6, "revision"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activateResource:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      VCPSignPostLog();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_signpost_id_generate(v10);

      VCPSignPostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CSUTextEncoder_loadResources", ", buf, 2u);
      }

      objc_msgSend(v7, "textEncoder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v15 = objc_msgSend(v14, "loadResources:", &v28);
      v16 = v28;

      if ((v15 & 1) != 0)
      {
        VCPSignPostLog();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_END, v11, "CSUTextEncoder_loadResources", ", buf, 2u);
        }

        objc_msgSend(v9, "reset");
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "description");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v23;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to pre-warm text encoder (%@)", buf, 0xCu);

        }
        if (a4)
        {
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v29 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to pre-warm text encoder"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v26);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v36) = objc_msgSend(v6, "revision");
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid personalized embedding revision specified (%d)", buf, 8u);
      }
      if (!a4)
      {
        v15 = 0;
        goto LABEL_28;
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid personalized embedding revision specified"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v9);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_28:
    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Pre-warming attempted for invalid request (%@)", buf, 0xCu);

  }
  if (a4)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Pre-warming attempted for invalid request"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v34 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v7);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v15 = 0;
LABEL_29:

  return v15;
}

- (int64_t)revision
{
  void *v2;
  int64_t v3;

  -[MADMultiModalProcessingSubtask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "revision");

  return v3;
}

- (id)gallery
{
  VUWGallery *gallery;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  VUWGallery *v11;
  id v12;
  VUWGallery *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  gallery = self->_gallery;
  if (gallery)
    return gallery;
  objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vcp_visionCacheStorageDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("VUIndex.sqlite"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    VCPSignPostLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    VCPSignPostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VUWGallery_initWithPath", ", buf, 2u);
    }

    v21 = 0;
    v11 = (VUWGallery *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC73D8]), "initWithPath:error:", v6, &v21);
    v12 = v21;
    v13 = self->_gallery;
    self->_gallery = v11;

    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "VUWGallery_initWithPath", ", buf, 2u);
    }

    if (!self->_gallery
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load VU Gallery (%@)", buf, 0xCu);

    }
    gallery = self->_gallery;
    return gallery;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibraryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v19;
    v24 = 2112;
    v25 = v20;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@: no VUIndex URL for library %@", buf, 0x16u);

  }
  return 0;
}

+ (id)embeddingFromMultiArray:(id)a3 normalize:(BOOL)a4 version:(unint64_t)a5
{
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "dataType");
  if (v8 == 65552)
  {
    v9 = 1;
    v10 = 1;
    goto LABEL_5;
  }
  if (v8 == 65568)
  {
    v9 = 0;
    v10 = 2;
LABEL_5:
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__45;
    v23 = __Block_byref_object_dispose__45;
    v24 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__MADPersonalizedEmbeddingTask_embeddingFromMultiArray_normalize_version___block_invoke;
    v18[3] = &unk_1E6B16828;
    v18[4] = buf;
    objc_msgSend(v7, "getBytesWithHandler:", v18);
    if (v6)
    {
      +[VCPTextEncoder applyL2Norm:isFP16:](VCPTextEncoder, "applyL2Norm:isFP16:", *((_QWORD *)v20 + 5), v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)v20 + 5);
      *((_QWORD *)v20 + 5) = v11;

    }
    v13 = objc_alloc(MEMORY[0x1E0D476B8]);
    v14 = *((_QWORD *)v20 + 5);
    objc_msgSend(v7, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithVersion:data:type:shape:", a5, v14, v10, v15);

    _Block_object_dispose(buf, 8);
    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v7, "dataType");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported embedding data type (%d)", buf, 8u);
  }
  v16 = 0;
LABEL_12:

  return v16;
}

void __74__MADPersonalizedEmbeddingTask_embeddingFromMultiArray_normalize_version___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (int)processEntitySegment:(id)a3 tokenEmbeddingType:(int64_t)a4 textEncoderInput:(id *)a5 ageType:(unsigned __int16 *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MADPersonalizedEmbeddingTask gallery](self, "gallery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D18918]);
    objc_msgSend(v10, "entityUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v11, "tokenEmbeddingsForTag:client:type:error:", v13, 0, a4, &v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v34;
    objc_msgSend(v12, "setEmbedding:", v14);

    objc_msgSend(v12, "embedding");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = v16 == 0;

    if ((_DWORD)v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "entityUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v28;
        v38 = 2112;
        v39 = v29;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to resolve entity %@ (%@)", buf, 0x16u);

      }
      v27 = -18;
    }
    else
    {
      objc_storeStrong(a5, v12);
      objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "librarySpecificFetchOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFetchLimit:", 1);
      v18 = (void *)MEMORY[0x1E0CD16C8];
      objc_msgSend(v10, "entityUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fetchPersonsWithLocalIdentifiers:options:", v21, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "count"))
      {
        v23 = (void *)MEMORY[0x1E0CD1520];
        objc_msgSend(v22, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fetchFacesForPerson:options:", v24, v17);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "count"))
        {
          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *a6 = objc_msgSend(v26, "ageType");

        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "entityUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v31;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to fetch Photos face (%@)", buf, 0xCu);

        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "entityUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v30;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to fetch Photos person (%@)", buf, 0xCu);

      }
      v27 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create VUWGallery", buf, 2u);
    }
    v27 = -18;
  }

  return v27;
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

- (int)processImageSegment:(id)a3 resource:(id)a4 textEncoderInput:(id *)a5 faceObservation:(id *)a6 ageType:(unsigned __int16 *)a7
{
  id v9;
  __IOSurface *v10;
  CVReturn v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  int v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t i;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  NSObject *v71;
  os_signpost_id_t v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  char v77;
  id v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  NSObject *v89;
  os_signpost_id_t v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  NSObject *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  id v102;
  id v103;
  NSObject *v104;
  const char *v105;
  void *v106;
  id v108;
  id v109;
  uint64_t v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  unsigned __int16 *v115;
  void *v119;
  id v120;
  id v121;
  id v122;
  id v123[2];
  id v124;
  id v125;
  CFTypeRef cf;
  id v127;
  void *v128;
  uint8_t buf[4];
  double v130;
  __int16 v131;
  double v132;
  _QWORD v133[4];

  v133[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v120 = a4;
  cf = 0;
  objc_msgSend(v9, "surface");
  v10 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  v11 = CVPixelBufferCreateWithIOSurface(0, v10, 0, (CVPixelBufferRef *)&cf);
  v115 = a7;

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
    v125 = 0;
    v119 = v12;
    v13 = objc_msgSend(v12, "setRevision:error:", 3737841670, &v125);
    v14 = v125;
    if ((v13 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = -18;
LABEL_97:

        goto LABEL_98;
      }
      objc_msgSend(v14, "description");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v130 = *(double *)&v59;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to configure face detection (%@)", buf, 0xCu);

      v11 = -18;
LABEL_96:
      v12 = v119;
      goto LABEL_97;
    }
    v124 = v14;
    v114 = objc_alloc_init(MEMORY[0x1E0CEDDC8]);
    v15 = objc_msgSend(v114, "setRevision:error:", 3737841669, &v124);
    v16 = v124;

    if ((v15 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "description");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v130 = *(double *)&v60;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to configure face attributes (%@)", buf, 0xCu);

      }
      v11 = -18;
      goto LABEL_95;
    }
    v111 = objc_alloc_init(MEMORY[0x1E0CEE040]);
    v17 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v112 = (void *)objc_msgSend(v17, "initWithCVPixelBuffer:options:session:", cf, MEMORY[0x1E0C9AA70], v111);
    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_generate(v18);

    VCPSignPostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v130 = *(double *)&v22;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);

    }
    v133[0] = v12;
    v133[1] = v114;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 2);
    v123[1] = v16;
    v110 = objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v112, "performRequests:error:");
    v24 = v16;

    if ((v23 & 1) == 0)
    {
      v61 = (void *)v110;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to perform face detection", buf, 2u);
      }
      v11 = -18;
      goto LABEL_94;
    }
    VCPSignPostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v130 = *(double *)&v27;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, v19, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);

    }
    objc_msgSend(v12, "results");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count") == 0;

    if (v29)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No face detected, falling back to non-personalized embedding", buf, 2u);
      }
      v62 = *a5;
      *a5 = 0;

      v63 = *a6;
      *a6 = 0;

      v11 = 0;
      goto LABEL_93;
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "results");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v130) = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Face count: %d", buf, 8u);

    }
    v123[0] = v24;
    v108 = objc_alloc_init(MEMORY[0x1E0CEDE28]);
    v32 = objc_msgSend(v108, "setRevision:error:", 3737841669, v123);
    v109 = v123[0];

    if ((v32 & 1) == 0)
    {
      v64 = v108;
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = -18;
LABEL_92:

        v24 = v109;
LABEL_93:
        v61 = (void *)v110;
LABEL_94:

        v16 = v24;
LABEL_95:

        v14 = v16;
        goto LABEL_96;
      }
      objc_msgSend(v109, "description");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v130 = *(double *)&v65;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to configure face printing (%@)", buf, 0xCu);

      v11 = -18;
LABEL_91:
      v64 = v108;
      goto LABEL_92;
    }
    objc_msgSend(v12, "results");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v114, "results");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "faceAttributes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "ageCategory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "label");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "identifier");
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 1; ; ++i)
    {
      objc_msgSend(v119, "results");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = i < objc_msgSend(v41, "count");

      if (!v42)
        break;
      objc_msgSend(v119, "results");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", i);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "boundingBox");
      v46 = v45;
      objc_msgSend(v44, "boundingBox");
      v48 = v47;
      objc_msgSend(v34, "boundingBox");
      v50 = v49;
      objc_msgSend(v34, "boundingBox");
      if (v46 * v48 <= v50 * v51)
      {
        v52 = v34;
      }
      else
      {
        v52 = v44;

        objc_msgSend(v114, "results");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", i);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "faceAttributes");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "ageCategory");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "label");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "identifier");
        v58 = objc_claimAutoreleasedReturnValue();

        v113 = (void *)v58;
      }

      v34 = v52;
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v130 = *(double *)&v34;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Largest face: %@", buf, 0xCu);
    }
    objc_msgSend(v34, "boundingBox");
    -[MADPersonalizedEmbeddingTask expandNormalizedRect:](self, "expandNormalizedRect:");
    v68 = v67;
    v69 = v66;
    if (v67 < 0.25 || v66 < 0.25)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v130 = v68;
        v131 = 2048;
        v132 = v69;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Largest face (%0.3fx%0.3f) is too small for personalization", buf, 0x16u);
      }
      v102 = *a5;
      *a5 = 0;

      v103 = *a6;
      *a6 = 0;

      v11 = 0;
      goto LABEL_90;
    }
    v128 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setInputFaceObservations:", v70);

    VCPSignPostLog();
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = os_signpost_id_generate(v71);

    VCPSignPostLog();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v130 = *(double *)&v75;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "VNCreateFaceprintRequest", "%@", buf, 0xCu);

    }
    v127 = v108;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v109;
    v77 = objc_msgSend(v112, "performRequests:error:", v76, &v122);
    v78 = v122;

    if ((v77 & 1) != 0)
    {
      VCPSignPostLog();
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = v79;
      if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
      {
        -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v130 = *(double *)&v81;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v80, OS_SIGNPOST_INTERVAL_END, v72, "VNCreateFaceprintRequest", "%@", buf, 0xCu);

      }
      objc_msgSend(v108, "results");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "count") == 0;

      if (!v83)
      {
        objc_msgSend(v108, "results");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = *a6;
        *a6 = v85;

        *v115 = +[VCPFaceUtils mad_PHValueFromVNAgeCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNAgeCategoryLabel:", v113);
        -[MADPersonalizedEmbeddingTask gallery](self, "gallery");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          v88 = objc_alloc_init(MEMORY[0x1E0D18918]);
          VCPSignPostLog();
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = os_signpost_id_generate(v89);

          VCPSignPostLog();
          v91 = objc_claimAutoreleasedReturnValue();
          v92 = v91;
          if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
          {
            -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v130 = *(double *)&v93;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v92, OS_SIGNPOST_INTERVAL_BEGIN, v90, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);

          }
          v94 = *a6;
          v121 = v78;
          objc_msgSend(v87, "tokenEmbeddingsForObservation:type:error:", v94, objc_msgSend(v120, "tokenEmbeddingType"), &v121);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v121;

          objc_msgSend(v88, "setEmbedding:", v95);
          VCPSignPostLog();
          v97 = objc_claimAutoreleasedReturnValue();
          v98 = v97;
          if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
          {
            -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v130 = *(double *)&v99;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v98, OS_SIGNPOST_INTERVAL_END, v90, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);

          }
          objc_msgSend(v88, "embedding");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v100 == 0;

          if (v101)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v96, "description");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v130 = *(double *)&v106;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to resolve entity (%@)", buf, 0xCu);

            }
            v11 = -18;
          }
          else
          {
            objc_storeStrong(a5, v88);
            v11 = 0;
          }

          v78 = v96;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create VUWGallery", buf, 2u);
          }
          v11 = -18;
        }

        goto LABEL_89;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_78:
        v11 = -18;
LABEL_89:
        v109 = v78;
LABEL_90:

        goto LABEL_91;
      }
      *(_WORD *)buf = 0;
      v104 = MEMORY[0x1E0C81028];
      v105 = "Face printing produced no observations";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_78;
      *(_WORD *)buf = 0;
      v104 = MEMORY[0x1E0C81028];
      v105 = "Failed to perform face printing";
    }
    _os_log_impl(&dword_1B6C4A000, v104, OS_LOG_TYPE_ERROR, v105, buf, 2u);
    goto LABEL_78;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create pixel buffer", buf, 2u);
  }
LABEL_98:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);

  return v11;
}

- (int)processFaceprintSegment:(id)a3 resource:(id)a4 textEncoderInput:(id *)a5 faceObservation:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  id *location;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0CEDEE0];
  objc_msgSend(v10, "faceprint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "faceObservationWithRequestRevision:boundingBox:faceprint:", 3737841670, v13, 0.0, 0.0, 1.0, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *a6;
  *a6 = v14;

  -[MADPersonalizedEmbeddingTask gallery](self, "gallery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D18918]);
    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    location = a5;
    v19 = os_signpost_id_generate(v18);

    VCPSignPostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload", a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v22;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);

    }
    v23 = *a6;
    v35 = 0;
    objc_msgSend(v16, "tokenEmbeddingsForObservation:type:error:", v23, objc_msgSend(v11, "tokenEmbeddingType"), &v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v35;
    objc_msgSend(v17, "setEmbedding:", v24);

    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v28;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v19, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);

    }
    objc_msgSend(v17, "embedding");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v25, "description");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v32;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to resolve entity (%@)", buf, 0xCu);

      }
      v31 = -18;
    }
    else
    {
      objc_storeStrong(location, v17);
      v31 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create VUWGallery", buf, 2u);
    }
    v31 = -18;
  }

  return v31;
}

- (int)processSegments:(id)a3 resource:(id)a4 keyEntitySegment:(id *)a5 keyImageSegment:(id *)a6 faceObservation:(id *)a7 personalizationIndex:(unint64_t *)a8 textEncoderInputs:(id)a9
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int64_t v15;
  uint64_t v16;
  int v17;
  void *j;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  int v32;
  int v33;
  uint32_t v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  void *v38;
  char v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  id v48;
  BOOL v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t n;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  void *v80;
  id v81;
  NSObject *v82;
  const char *v83;
  void *v85;
  char v87;
  id *location;
  id v91;
  unint64_t v92;
  id v93;
  void *v94;
  id obj;
  id v96;
  id v98;
  int v99;
  int v100;
  id v101;
  id v102;
  os_log_type_t v103[8];
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t v117[14];
  unsigned __int16 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint8_t v129[128];
  _BYTE buf[24];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v98 = a4;
  v104 = a9;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
  location = a5;
  if (v12)
  {
    v13 = *(_QWORD *)v124;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v124 != v13)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * i), "type") == 4)
        {
          v87 = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
      if (v12)
        continue;
      break;
    }
  }
  v87 = 0;
LABEL_11:

  v15 = -[MADPersonalizedEmbeddingTask revision](self, "revision");
  *a8 = 0x7FFFFFFFFFFFFFFFLL;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v96 = obj;
  v16 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
  if (!v16)
  {
    v93 = 0;
    v91 = 0;
    v17 = 0;
    goto LABEL_151;
  }
  v92 = v15;
  v93 = 0;
  v91 = 0;
  v17 = 0;
  *(_QWORD *)v103 = *(_QWORD *)v120;
  do
  {
    v101 = (id)v16;
    for (j = 0; j != v101; j = (char *)j + 1)
    {
      if (*(_QWORD *)v120 != *(_QWORD *)v103)
        objc_enumerationMutation(v96);
      v19 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)j);
      v20 = (void *)MEMORY[0x1BCCA1B2C]();
      if (objc_msgSend(v19, "type") == 1)
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v21 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, v21, OS_LOG_TYPE_DEBUG, "Skip text input in first round ... ", buf, 2u);
          }
        }
        goto LABEL_128;
      }
      if (objc_msgSend(v19, "type") == 2)
      {
        if (v93)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_138;
          v22 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_138;
LABEL_24:
          *(_WORD *)buf = 0;
          v23 = v22;
          v24 = "Faceprints not supported with other personalizations";
LABEL_136:
          v34 = 2;
LABEL_137:
          _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_ERROR, v24, buf, v34);
          goto LABEL_138;
        }
        v27 = v19;
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v27, "entityUUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v28;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Processing entity input (%@)", buf, 0xCu);

        }
        if (*a5)
        {
          if (v92 <= 7 && ((1 << v92) & 0xE8) != 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v29 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, v29, OS_LOG_TYPE_ERROR, "Multiple entity UUIDs not supported", buf, 2u);
              }
            }
            v30 = -50;
            goto LABEL_64;
          }
        }
        else
        {
          objc_storeStrong(a5, v19);
        }
        if ((v87 & 1) == 0)
        {
          v118 = 0;
          *(_QWORD *)buf = 0;
          v30 = -[MADPersonalizedEmbeddingTask processEntitySegment:tokenEmbeddingType:textEncoderInput:ageType:](self, "processEntitySegment:tokenEmbeddingType:textEncoderInput:ageType:", v27, objc_msgSend(v98, "tokenEmbeddingType"), buf, &v118);
          if (v30)
          {

LABEL_64:
LABEL_65:
            v93 = 0;
LABEL_66:
            v32 = 0;
            v99 = v30;
            goto LABEL_139;
          }
          objc_msgSend(v98, "tokensForAgeType:", v118);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          if (v94)
          {
            if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v117 = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Applying prompt adjustment", v117, 2u);
            }
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v55 = v94;
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
            if (v56)
            {
              v57 = *(_QWORD *)v114;
              do
              {
                for (k = 0; k != v56; ++k)
                {
                  if (*(_QWORD *)v114 != v57)
                    objc_enumerationMutation(v55);
                  v59 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * k);
                  v60 = objc_alloc_init(MEMORY[0x1E0D18920]);
                  objc_msgSend(v60, "setTokenID:", v59);
                  objc_msgSend(v104, "addObject:", v60);

                }
                v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
              }
              while (v56);
            }

            v17 = 1;
          }
          objc_msgSend(v104, "addObject:", *(_QWORD *)buf);
          if (*a8 == 0x7FFFFFFFFFFFFFFFLL)
            *a8 = objc_msgSend(v104, "count") - 1;

        }
LABEL_127:
        v93 = 0;
LABEL_128:
        v32 = 1;
        goto LABEL_139;
      }
      if (objc_msgSend(v19, "type") == 3)
      {
        if (v92 > 7 || ((1 << v92) & 0xE8) == 0)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_138;
          v35 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_138;
          *(_WORD *)buf = 0;
          v23 = v35;
          v24 = "Configuration does not support image inputs";
          goto LABEL_136;
        }
        if (*a6)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_138;
          v25 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_138;
          *(_WORD *)buf = 0;
          v23 = v25;
          v24 = "Multiple images not supported";
          goto LABEL_136;
        }
        if (v93)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_138;
          v22 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_138;
          goto LABEL_24;
        }
        v37 = v19;
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Processing image input", buf, 2u);
        }
        objc_storeStrong(a6, v19);
        -[MADMultiModalProcessingSubtask request](self, "request");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "bypassFaceDetection");

        if ((v39 & 1) == 0)
        {
          v118 = 0;
          *(_QWORD *)buf = 0;
          v40 = -[MADPersonalizedEmbeddingTask processImageSegment:resource:textEncoderInput:faceObservation:ageType:](self, "processImageSegment:resource:textEncoderInput:faceObservation:ageType:", v37, v98, buf, a7, &v118);
          v41 = *(void **)buf;
          if (!v40 && *(_QWORD *)buf)
          {
            objc_msgSend(v98, "tokensForAgeType:", v118);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42)
            {
              if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v117 = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Applying prompt adjustment", v117, 2u);
              }
              v111 = 0u;
              v112 = 0u;
              v109 = 0u;
              v110 = 0u;
              v85 = v42;
              v43 = v42;
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
              if (v44)
              {
                v45 = *(_QWORD *)v110;
                do
                {
                  for (m = 0; m != v44; ++m)
                  {
                    if (*(_QWORD *)v110 != v45)
                      objc_enumerationMutation(v43);
                    v47 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * m);
                    v48 = objc_alloc_init(MEMORY[0x1E0D18920]);
                    objc_msgSend(v48, "setTokenID:", v47);
                    objc_msgSend(v104, "addObject:", v48);

                  }
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
                }
                while (v44);
              }

              v17 = 1;
              v42 = v85;
            }
            objc_msgSend(v104, "addObject:", *(_QWORD *)buf, v85);
            if (*a8 == 0x7FFFFFFFFFFFFFFFLL)
              *a8 = objc_msgSend(v104, "count") - 1;

            v41 = *(void **)buf;
            v40 = 0;
          }
          v30 = v40;
          v49 = v40 != 0;

          if (v49)
          {

            goto LABEL_65;
          }
        }

        goto LABEL_127;
      }
      if (objc_msgSend(v19, "type") == 4)
      {
        if (v92 > 7 || ((1 << v92) & 0xE8) == 0)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_138;
          v50 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_138;
          *(_WORD *)buf = 0;
          v23 = v50;
          v24 = "Configuration does not support person description inputs";
          goto LABEL_136;
        }
        if (v91)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_138;
          v26 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_138;
          *(_WORD *)buf = 0;
          v23 = v26;
          v24 = "Multiple person descriptions not supported";
          goto LABEL_136;
        }
        if (v93)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v36 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, v36, OS_LOG_TYPE_ERROR, "Faceprints not supported with other personalizations", buf, 2u);
            }
          }
          v91 = 0;
          goto LABEL_138;
        }
        v61 = v19;
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v61, "text");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v62;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Processing description input (%@)", buf, 0xCu);

        }
        v91 = v61;
        v63 = objc_alloc_init(MEMORY[0x1E0D18900]);
        objc_msgSend(v91, "text");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setString:", v64);

        objc_msgSend(v104, "addObject:", v63);
        *a8 = objc_msgSend(v104, "count") - 1;

        goto LABEL_127;
      }
      if (objc_msgSend(v19, "type") != 5)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_138;
        v33 = objc_msgSend(v19, "type");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v33;
        v23 = MEMORY[0x1E0C81028];
        v24 = "Unsupported input type (%d)";
        v34 = 8;
        goto LABEL_137;
      }
      if (v92 > 7 || ((1 << v92) & 0xE8) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
          goto LABEL_138;
        v65 = MEMORY[0x1E0C81028];
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_138;
        *(_WORD *)buf = 0;
        v23 = v65;
        v24 = "Configuration does not support faceprint inputs";
        goto LABEL_136;
      }
      if (v93)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
          goto LABEL_138;
        v31 = MEMORY[0x1E0C81028];
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_138;
        *(_WORD *)buf = 0;
        v23 = v31;
        v24 = "Multiple faceprints not supported";
        goto LABEL_136;
      }
      if (*a8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v51 = v19;
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v51, "faceprint");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "originatingRequestSpecifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v53;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Processing faceprint input (%@)", buf, 0xCu);

        }
        v54 = v51;
        *(_QWORD *)buf = 0;
        v93 = v54;
        v30 = -[MADPersonalizedEmbeddingTask processFaceprintSegment:resource:textEncoderInput:faceObservation:](self, "processFaceprintSegment:resource:textEncoderInput:faceObservation:");
        if (v30)
        {

          goto LABEL_66;
        }
        objc_msgSend(v104, "addObject:", *(_QWORD *)buf);
        *a8 = objc_msgSend(v104, "count") - 1;

        goto LABEL_128;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v66 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, v66, OS_LOG_TYPE_ERROR, "Faceprints not supported with other personalizations", buf, 2u);
        }
      }
      v93 = 0;
LABEL_138:
      v32 = 0;
      v99 = -50;
LABEL_139:
      objc_autoreleasePoolPop(v20);
      if (!v32)
      {

        goto LABEL_192;
      }
    }
    v16 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
  }
  while (v16);
LABEL_151:

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v102 = v96;
  v67 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v105, v127, 16);
  if (v67)
  {
    v68 = 0;
    v69 = *(_QWORD *)v106;
    v100 = v17 ^ 1;
    do
    {
      for (n = 0; n != v67; ++n)
      {
        if (*(_QWORD *)v106 != v69)
          objc_enumerationMutation(v102);
        v71 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * n);
        v72 = (void *)MEMORY[0x1BCCA1B2C]();
        if (objc_msgSend(v71, "type") == 1)
        {
          v73 = v71;
          objc_msgSend(v73, "text");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v74;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Processing text input (%@)", buf, 0xCu);
          }
          if (((v100 | v68) & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v77 = objc_alloc_init(MEMORY[0x1E0D18900]);
            objc_msgSend(v77, "setString:", v74);
            objc_msgSend(v104, "addObject:", v77);
          }
          else
          {
            v76 = objc_msgSend(v74, "rangeOfString:", CFSTR("baby person"));
            if (v76 == 0x7FFFFFFFFFFFFFFFLL
              && (v76 = objc_msgSend(v74, "rangeOfString:", CFSTR("toddler person")), v76 == 0x7FFFFFFFFFFFFFFFLL)
              && (v76 = objc_msgSend(v74, "rangeOfString:", CFSTR("person")), v76 == 0x7FFFFFFFFFFFFFFFLL))
            {
              v77 = objc_alloc_init(MEMORY[0x1E0D18900]);
              objc_msgSend(v77, "setString:", v74);
              objc_msgSend(v104, "addObject:", v77);
              v68 = 0;
            }
            else
            {
              v78 = v75;
              objc_msgSend(v74, "substringToIndex:", v76);
              v77 = (id)objc_claimAutoreleasedReturnValue();
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v77;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "firstHalf (%@)", buf, 0xCu);
              }
              v79 = objc_alloc_init(MEMORY[0x1E0D18900]);
              objc_msgSend(v79, "setString:", v77);
              objc_msgSend(v104, "insertObject:atIndex:", v79, 0);
              *a8 = objc_msgSend(v104, "count") - 1;
              objc_msgSend(v74, "substringFromIndex:", v76 + v78);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v80;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "secondHalf (%@)", buf, 0xCu);
              }
              v81 = objc_alloc_init(MEMORY[0x1E0D18900]);
              objc_msgSend(v81, "setString:", v80);
              objc_msgSend(v104, "addObject:", v81);

              v68 = 1;
            }
          }

        }
        objc_autoreleasePoolPop(v72);
      }
      v67 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v105, v127, 16);
    }
    while (v67);
  }

  if (!*location || !*a7)
  {
    if (v91)
    {
      if (*a7)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_188;
        *(_WORD *)buf = 0;
        v82 = MEMORY[0x1E0C81028];
        v83 = "Description and face image input not supported";
        goto LABEL_187;
      }
      if (!*location)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_188;
        *(_WORD *)buf = 0;
        v82 = MEMORY[0x1E0C81028];
        v83 = "Description requires entity input";
LABEL_187:
        _os_log_impl(&dword_1B6C4A000, v82, OS_LOG_TYPE_ERROR, v83, buf, 2u);
        goto LABEL_188;
      }
    }
    else
    {
      v91 = 0;
    }
    v99 = 0;
    goto LABEL_192;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v82 = MEMORY[0x1E0C81028];
    v83 = "Entity and face image input not supported";
    goto LABEL_187;
  }
LABEL_188:
  v99 = -50;
LABEL_192:

  return v99;
}

- (unint64_t)imageEmbeddingVersion
{
  void *v2;
  uint64_t v3;

  -[MADMultiModalProcessingSubtask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "revision");

  if ((unint64_t)(v3 - 3) >= 5)
    return 0;
  else
    return qword_1B6FBF658[v3 - 3];
}

- (int)processPixelBuffer:(__CVBuffer *)a3 imageEmbedding:(id *)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  id v34;
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = -[MADPersonalizedEmbeddingTask imageEmbeddingVersion](self, "imageEmbeddingVersion");
  if (v7)
  {
    v8 = v7;
    +[VCPMADImageEmbeddingResource sharedResourceForRevision:](VCPMADImageEmbeddingResource, "sharedResourceForRevision:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateResource:", v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageBackbone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      VCPSignPostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_signpost_id_generate(v12);

      VCPSignPostLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v16;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);

      }
      objc_msgSend(v9, "imageBackbone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v18 = objc_msgSend(v17, "analyzePixelBuffer:flags:results:cancel:", a3, 0, &v34, &__block_literal_global_71);
      v19 = v34;

      if (v18)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image encoding failed", buf, 2u);
        }
      }
      else
      {
        VCPSignPostLog();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v22;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_END, v13, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);

        }
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("attributes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("embeddings"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v27 = objc_alloc(MEMORY[0x1E0D476B8]);
            v35[0] = &unk_1E6B74C48;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v26, "length") >> 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v35[1] = v28;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v27, "initWithVersion:data:type:shape:", v8, v26, 1, v29);
            v31 = *a4;
            *a4 = v30;

            objc_msgSend(v33, "reset");
            v18 = 0;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image encoding produced no embedding", buf, 2u);
            }
            v18 = -18;
          }

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image encoding produced no embedding", buf, 2u);
          }
          v18 = -18;
        }

      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load image encoder", buf, 2u);
      }
      v18 = -18;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image encoding not supported in current configiuration", buf, 2u);
    }
    return -18;
  }
  return v18;
}

uint64_t __66__MADPersonalizedEmbeddingTask_processPixelBuffer_imageEmbedding___block_invoke()
{
  return 0;
}

- (int)processSystemSearchOutput:(id)a3 resource:(id)a4 embeddingResult:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  uint8_t v17[16];

  v8 = a3;
  v9 = a4;
  v10 = -[MADPersonalizedEmbeddingTask revision](self, "revision");
  v11 = (void *)objc_opt_class();
  objc_msgSend(v8, "CSUTextEmbedding");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "embeddingFromMultiArray:normalize:version:", v12, v10 == 1, objc_msgSend(v9, "version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *a5;
  *a5 = v13;

  if (*a5)
  {
    v15 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create output text embedding", v17, 2u);
    }
    v15 = -18;
  }

  return v15;
}

- (int)processGenerativePlaygroundsOutput:(id)a3 resource:(id)a4 entitySegment:(id)a5 imageSegment:(id)a6 faceObservation:(id)a7 personalizationIndex:(unint64_t)a8 embeddingResult:(id *)a9 hiddenLayerResult:(id *)a10 pooledEmbeddingResult:(id *)a11
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __IOSurface *v24;
  CVReturn v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_signpost_id_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  char v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  NSObject *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  NSObject *v75;
  const char *v76;
  void *v77;
  os_signpost_id_t spid;
  id spida;
  id v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v85 = a4;
  v84 = a5;
  v18 = a6;
  v19 = a7;
  objc_msgSend(v17, "additionalLayers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("spatial_embed"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v17, "additionalLayers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("hidden_embed"));
    v23 = objc_claimAutoreleasedReturnValue();

    v83 = (void *)v23;
    if (!v23)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Text encoder did not produce pooled embedding", buf, 2u);
      }
      v25 = -18;
      goto LABEL_71;
    }
    cf = 0;
    if (v18)
    {
      objc_msgSend(v18, "surface");
      v24 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      v25 = CVPixelBufferCreateWithIOSurface(0, v24, 0, (CVPixelBufferRef *)&cf);

      if (v25)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        *(_WORD *)buf = 0;
        v26 = MEMORY[0x1E0C81028];
        v27 = "Failed to create pixel buffer";
        goto LABEL_20;
      }
      v25 = -[MADPersonalizedEmbeddingTask processPixelBuffer:imageEmbedding:](self, "processPixelBuffer:imageEmbedding:", cf, a9);
      if (v25)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        *(_WORD *)buf = 0;
        v26 = MEMORY[0x1E0C81028];
        v27 = "Failed to create image embedding";
LABEL_20:
        _os_log_impl(&dword_1B6C4A000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
LABEL_70:
        CF<opaqueCMSampleBuffer *>::~CF(&cf);
LABEL_71:

        goto LABEL_72;
      }
    }
    if (v19)
    {
      objc_msgSend(v17, "tokenSegments");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", a8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "rangeValue");
      v32 = v31;

      VCPSignPostLog();
      v33 = objc_claimAutoreleasedReturnValue();
      spid = os_signpost_id_generate(v33);

      VCPSignPostLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v96 = v36;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VUWGallery_personalizeEmbeddingLayerImage", "%@", buf, 0xCu);

      }
      objc_msgSend(v18, "seed");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (v38)
      {
        -[MADPersonalizedEmbeddingTask gallery](self, "gallery");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = 0;
        v91 = v21;
        v61 = objc_msgSend(v60, "personalizeEmbeddingLayer:index:observation:context:type:error:", &v91, v32 + v30 - 1, v19, 0, 3, &v90);
        v42 = v91;

        v81 = v90;
        if ((v61 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v81, "description");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v96 = v65;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Embedding personalization failed (%@)", buf, 0xCu);

          }
          goto LABEL_49;
        }
      }
      else
      {
        -[MADPersonalizedEmbeddingTask gallery](self, "gallery");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v21;
        objc_msgSend(v18, "seed");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        v41 = objc_msgSend(v39, "personalizeEmbeddingLayer:index:observation:context:type:randomizeWithSeed:error:", &v93, v32 + v30 - 1, v19, 0, 3, objc_msgSend(v40, "integerValue"), &v92);
        v42 = v93;

        v81 = v92;
        if ((v41 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v81, "description");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v96 = v43;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Embedding personalization failed (%@)", buf, 0xCu);

          }
LABEL_49:

          v25 = -18;
          v21 = v42;
          goto LABEL_70;
        }
      }
      v21 = v42;
      VCPSignPostLog();
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
      {
        -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v96 = v64;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v63, OS_SIGNPOST_INTERVAL_END, spid, "VUWGallery_personalizeEmbeddingLayerImage", "%@", buf, 0xCu);

      }
      goto LABEL_54;
    }
    if (!v84)
      goto LABEL_55;
    objc_msgSend(v17, "tokenSegments");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", a8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v45, "rangeValue");
    v47 = v46;

    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v82 + v47 - 1;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Personalization index: %d", buf, 8u);
    }
    VCPSignPostLog();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_signpost_id_generate(v48);

    VCPSignPostLog();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v96 = v52;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "VUWGallery_personalizeEmbeddingLayerEntity", "%@", buf, 0xCu);

    }
    objc_msgSend(v84, "seed");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53 == 0;

    if (v54)
    {
      -[MADPersonalizedEmbeddingTask gallery](self, "gallery");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v21;
      objc_msgSend(v84, "entityUUID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 0;
      v68 = objc_msgSend(v66, "personalizeEmbeddingLayer:index:tag:client:type:error:", &v87, v47 + v82 - 1, v67, 0, 3, &v86);
      spida = v87;

      v81 = v86;
      if ((v68 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v81, "description");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v96 = v77;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Embedding personalization failed (%@)", buf, 0xCu);

        }
        goto LABEL_69;
      }
    }
    else
    {
      -[MADPersonalizedEmbeddingTask gallery](self, "gallery");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v21;
      objc_msgSend(v84, "entityUUID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "seed");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0;
      v58 = objc_msgSend(v55, "personalizeEmbeddingLayer:index:tag:client:type:randomizeWithSeed:error:", &v89, v47 + v82 - 1, v56, 0, 3, objc_msgSend(v57, "integerValue"), &v88);
      spida = v89;

      v81 = v88;
      if ((v58 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v81, "description");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v96 = v59;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Embedding personalization failed (%@)", buf, 0xCu);

        }
LABEL_69:

        v25 = -18;
        v21 = spida;
        goto LABEL_70;
      }
    }
    v21 = spida;
    VCPSignPostLog();
    v69 = objc_claimAutoreleasedReturnValue();
    v63 = v69;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v96 = v70;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v63, OS_SIGNPOST_INTERVAL_END, v49, "VUWGallery_personalizeEmbeddingLayerEntity", "%@", buf, 0xCu);

    }
LABEL_54:

LABEL_55:
    objc_msgSend((id)objc_opt_class(), "embeddingFromMultiArray:normalize:version:", v21, 0, objc_msgSend(v85, "version"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = *a10;
    *a10 = v71;

    if (*a10)
    {
      objc_msgSend((id)objc_opt_class(), "embeddingFromMultiArray:normalize:version:", v83, 0, objc_msgSend(v85, "version"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = *a11;
      *a11 = v73;

      if (*a11)
      {
        v25 = 0;
        goto LABEL_70;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_65:
        v25 = -18;
        goto LABEL_70;
      }
      *(_WORD *)buf = 0;
      v75 = MEMORY[0x1E0C81028];
      v76 = "Failed to create pooled embedding";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_65;
      *(_WORD *)buf = 0;
      v75 = MEMORY[0x1E0C81028];
      v76 = "Failed to create output hidden layer embedding";
    }
    _os_log_impl(&dword_1B6C4A000, v75, OS_LOG_TYPE_ERROR, v76, buf, 2u);
    goto LABEL_65;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Text encoder did not produce hidden layer", buf, 2u);
  }
  v25 = -18;
LABEL_72:

  return v25;
}

- (int)processInput:(id)a3 resource:(id)a4 result:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  int v30;
  _BOOL8 v31;
  id v32;
  void *v33;
  id v34;
  uint8_t v36[8];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  unint64_t v43;
  _BYTE buf[24];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v42 = 0;
  v43 = 0;
  v40 = 0x7FFFFFFFFFFFFFFFLL;
  v41 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "segments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MADPersonalizedEmbeddingTask processSegments:resource:keyEntitySegment:keyImageSegment:faceObservation:personalizationIndex:textEncoderInputs:](self, "processSegments:resource:keyEntitySegment:keyImageSegment:faceObservation:personalizationIndex:textEncoderInputs:", v11, v9, &v43, &v42, &v41, &v40, v10);

  if (!v12)
  {
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateResource:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);

    }
    objc_msgSend(v9, "textEncoder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v20, "runOnInput:error:", v10, &v39);
    v21 = v39;

    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v24;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, v16, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);

    }
    if (v21)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to generate text embedding (%@)", buf, 0xCu);

      }
      v12 = -18;
    }
    else
    {
      objc_msgSend(v9, "textEncoder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "inferenceOutputs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "reset");
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v27, "processedInput");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v28;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "processedInput: %@", buf, 0xCu);

      }
      *(_QWORD *)buf = 0;
      v37 = 0;
      v38 = 0;
      v29 = -[MADPersonalizedEmbeddingTask revision](self, "revision");
      if (v29 <= 4 && ((1 << v29) & 0x16) != 0)
        v30 = -[MADPersonalizedEmbeddingTask processSystemSearchOutput:resource:embeddingResult:](self, "processSystemSearchOutput:resource:embeddingResult:", v27, v9, buf);
      else
        v30 = -[MADPersonalizedEmbeddingTask processGenerativePlaygroundsOutput:resource:entitySegment:imageSegment:faceObservation:personalizationIndex:embeddingResult:hiddenLayerResult:pooledEmbeddingResult:](self, "processGenerativePlaygroundsOutput:resource:entitySegment:imageSegment:faceObservation:personalizationIndex:embeddingResult:hiddenLayerResult:pooledEmbeddingResult:", v27, v9, v43, v42, v41, v40, buf, &v38, &v37);
      v12 = v30;
      if (!v30)
      {
        v31 = (v43 | v41) != 0;
        if (!(v43 | v41)
          && (int)MediaAnalysisLogLevel() >= 3
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No identity source provided; generating non-personalized text embedding",
            v36,
            2u);
        }
        v32 = objc_alloc(MEMORY[0x1E0D47748]);
        v33 = (void *)objc_msgSend(v32, "initWithEmbedding:hiddenLayer:pooledEmbedding:personalized:", *(_QWORD *)buf, v38, v37, v31);
        v34 = *a5;
        *a5 = v33;

        v12 = 0;
      }

    }
  }

  return v12;
}

- (int)run
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v33[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _BYTE buf[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MADPersonalizedEmbeddingTask running...", buf, 2u);
  }
  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v7;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADPersonalizedEmbeddingTask_run", "%@", buf, 0xCu);

  }
  v8 = -[MADPersonalizedEmbeddingTask revision](self, "revision");
  if ((unint64_t)(v8 - 1) > 2)
  {
    +[MADTextEncoderResource sharedResource:](MADTextEncoderResource, "sharedResource:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[MADMultiModalProcessingSubtask inputs](self, "inputs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v14);
            v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            *(_QWORD *)buf = 0;
            if (-[MADPersonalizedEmbeddingTask processInput:resource:result:](self, "processInput:resource:result:", v18, v9, buf))
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v33 = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Embedding generation failed", v33, 2u);
              }
              -[MADMultiModalProcessingSubtask request](self, "request");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)MEMORY[0x1E0CB35C8];
              v38 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Embedding generation failed"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setError:", v27);

              goto LABEL_35;
            }
            objc_msgSend(v11, "addObject:", *(_QWORD *)buf);

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
          if (v15)
            continue;
          break;
        }
      }

      -[MADMultiModalProcessingSubtask request](self, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setResults:", v11);

      VCPSignPostLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        -[MADMultiModalProcessingSubtask signpostPayload](self, "signpostPayload");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_END, v4, "MADPersonalizedEmbeddingTask_run", "%@", buf, 0xCu);

      }
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MADPersonalizedEmbeddingTask Complete", buf, 2u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v8;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid personalized embedding revision specified (%d)", buf, 8u);
      }
      -[MADMultiModalProcessingSubtask request](self, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid personalized embedding type specified"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setError:", v31);

    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Revision is no longer supported (%d)", buf, 8u);
    }
    -[MADMultiModalProcessingSubtask request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Revision is no longer supported (%d)"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setError:", v13);

  }
LABEL_35:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gallery, 0);
}

@end
