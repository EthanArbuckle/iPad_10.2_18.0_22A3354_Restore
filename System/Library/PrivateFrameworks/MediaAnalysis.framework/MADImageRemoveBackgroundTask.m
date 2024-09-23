@implementation MADImageRemoveBackgroundTask

- (MADImageRemoveBackgroundTask)initWithSignpostPayload:(id)a3
{
  id v5;
  MADImageRemoveBackgroundTask *v6;
  MADImageRemoveBackgroundTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADImageRemoveBackgroundTask;
  v6 = -[MADImageRemoveBackgroundTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_signpostPayload, a3);

  return v7;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (BOOL)canceled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v2 & 1;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (float)resourceRequirement
{
  return 1.0;
}

- (id)computeSensitivityOfPixelBuffer:(__CVBuffer *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackground|IVS] Checking image eligibility", buf, 2u);
  }
  +[MADImageSafetyClassificationResource sharedResource](MADImageSafetyClassificationResource, "sharedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateResource:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    -[MADImageRemoveBackgroundTask signpostPayload](self, "signpostPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v12;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SCMLHandler_analyzePixelBuffer", "%@", buf, 0xCu);

  }
  objc_msgSend(v5, "handler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v13, "analyzePixelBuffer:error:", a3, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    -[MADImageRemoveBackgroundTask signpostPayload](self, "signpostPayload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v18;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v9, "SCMLHandler_analyzePixelBuffer", "%@", buf, 0xCu);

  }
  objc_msgSend(v7, "reset");
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "sensitive"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackground|IVS] Failed to check eligibility (%@)", buf, 0xCu);

    }
    v19 = 0;
  }

  return v19;
}

- (BOOL)computeRegionOfInterest:(CGRect *)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  CGFloat x;
  float v34;
  float v35;
  void *v36;
  int v37;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v42;
  uint8_t buf[4];
  CGFloat v44;
  __int16 v45;
  CGFloat v46;
  __int16 v47;
  CGFloat v48;
  __int16 v49;
  CGFloat v50;
  __int16 v51;
  double v52;
  __int16 v53;
  int v54;
  uint64_t v55;
  CGRect v56;
  CGRect v57;

  v7 = *(_QWORD *)&a5;
  v55 = *MEMORY[0x1E0C80C00];
  a3->origin.x = 0.0;
  a3->origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  a3->size = _Q0;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RemoveBackground|ROI] Image is screenshot - detecting ROI", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0DC6E60], "imageWithPixelBuffer:orientation:", a4, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0DC6E98]);
  -[MADImageRemoveBackgroundTask preferredMetalDevice](self, "preferredMetalDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithImage:regionOfInterest:imageType:preferredMetalDevice:", v16, 1, v18, 0.0, 0.0, 1.0, 1.0);

  +[VCPMADVIVisualSearchResource sharedResource](VCPMADVIVisualSearchResource, "sharedResource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateResource:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v23, "refineRegionsWithRequest:error:", v19, &v42);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v42;

  objc_msgSend(v22, "reset");
  if (v25)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = *(double *)&v25;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RemoveBackground|ROI] Failed to detect screenshot ROI (%@)", buf, 0xCu);
    }
    if (a6)
    {
      v26 = (void *)objc_msgSend(v25, "copy");
      v27 = *a6;
      *a6 = v26;

    }
LABEL_10:
    v28 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v24, "refinedRegions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count") == 0;

  if (v30)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackground|ROI] Screenshot has no ROI", buf, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v24, "refinedRegions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "regionOfInterest");
  v57.origin.x = 0.0;
  v57.origin.y = 0.0;
  v57.size.width = 1.0;
  v57.size.height = 1.0;
  *a3 = CGRectIntersection(v56, v57);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    x = a3->origin.x;
    y = a3->origin.y;
    width = a3->size.width;
    height = a3->size.height;
    objc_msgSend(v32, "confidence");
    v35 = v34;
    objc_msgSend(v24, "refinedRegions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    *(_DWORD *)buf = 134219264;
    v44 = x;
    v45 = 2048;
    v46 = y;
    v47 = 2048;
    v48 = width;
    v49 = 2048;
    v50 = height;
    v51 = 2048;
    v52 = v35;
    v53 = 1024;
    v54 = v37;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RemoveBackground|ROI] Screenshot ROI: (%0.2f, %0.2f) %0.2fx%0.2f Confidence: %0.2f [1 of %d]", buf, 0x3Au);

  }
  v28 = 1;
LABEL_16:

  return v28;
}

- (id)generateMaskWithRequestHandler:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  NSString *signpostPayload;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  NSString *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  NSString *v35;
  void *v36;
  id v37;
  id v39;
  id v40;
  uint8_t buf[4];
  NSString *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = objc_alloc_init(MEMORY[0x1E0CEDF20]);
  objc_msgSend(v12, "setRevision:", 1);
  if (DeviceHasANE())
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProcessingDevice:", v13);

  }
  -[MADImageRemoveBackgroundTask preferredMetalDevice](self, "preferredMetalDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CEDFC0];
    -[MADImageRemoveBackgroundTask preferredMetalDevice](self, "preferredMetalDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceForMetalDevice:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProcessingDevice:", v17);

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v12, "processingDevice");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[MADImageRemoveBackgroundTask preferredMetalDevice](self, "preferredMetalDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v18;
      v43 = 2112;
      v44 = v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RemoveBackground|Mask] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);

    }
  }
  objc_msgSend(v12, "setRegionOfInterest:", x, y, width, height);
  VCPSignPostLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_generate(v20);

  VCPSignPostLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v42 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
  }

  v40 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v26 = objc_msgSend(v11, "performRequests:error:", v25, &v39);
  v27 = v39;

  VCPSignPostLog();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    v30 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v42 = v30;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_END, v21, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
  }

  if ((v26 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v27, "description");
      v35 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v35;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackground|Mask] Mask generation failed (%@)", buf, 0xCu);

    }
    v36 = (void *)objc_msgSend(v27, "copy");
    v37 = *a5;
    *a5 = v36;

    goto LABEL_20;
  }
  objc_msgSend(v12, "results");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count") == 0;

  if (v32)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackground|Mask] No observations produced for image", buf, 2u);
    }
LABEL_20:
    v34 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v12, "results");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v34;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (MTLDevice)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (void)setPreferredMetalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
}

@end
