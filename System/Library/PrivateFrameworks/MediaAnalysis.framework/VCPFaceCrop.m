@implementation VCPFaceCrop

- (VCPFaceCrop)initWithLocalIdentifier:(id)a3 faceCropData:(id)a4
{
  id v7;
  id v8;
  VCPFaceCrop *v9;
  VCPFaceCrop *v10;
  uint64_t v11;
  NSData *faceCropData;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCPFaceCrop;
  v9 = -[VCPFaceCrop init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localIdentifier, a3);
    v11 = objc_msgSend(v8, "copy");
    faceCropData = v10->_faceCropData;
    v10->_faceCropData = (NSData *)v11;

  }
  return v10;
}

- (VCPFaceCrop)initWithFaceCropData:(id)a3 originatingFace:(id)a4
{
  id v6;
  id v7;
  VCPFaceCrop *v8;
  VCPFaceCrop *v9;
  NSString *localIdentifier;
  uint64_t v11;
  NSData *faceCropData;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCPFaceCrop;
  v8 = -[VCPFaceCrop init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = 0;

    v11 = objc_msgSend(v6, "copy");
    faceCropData = v9->_faceCropData;
    v9->_faceCropData = (NSData *)v11;

    objc_storeStrong((id *)&v9->_originatingFace, a4);
  }

  return v9;
}

+ (id)generateFaceCropsForFace:(id)a3 resourceURL:(id)a4 groupingIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  VCPFaceCrop *v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  VCPFaceCrop *v38;
  VCPFaceCrop *v39;
  void *v40;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  double v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (!v7 || !v8 || !v9)
    goto LABEL_35;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v7, "bodyCenterX");
    if (v12 == 0.0 && (objc_msgSend(v7, "bodyCenterY"), v13 == 0.0) && (objc_msgSend(v7, "bodyWidth"), v14 == 0.0))
    {
      objc_msgSend(v7, "bodyHeight");
      v15 = v55 != 0.0;
    }
    else
    {
      v15 = 1;
    }
    if (objc_msgSend(v7, "detectionType") == 3)
    {
      if (!v15)
      {
LABEL_11:
        objc_msgSend(v7, "normalizedFaceRect");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
        objc_msgSend(v7, "centerX");
        v25 = v24;
        objc_msgSend(v7, "centerY");
        v27 = v26;
        objc_msgSend(v7, "size");
        *(_DWORD *)buf = 134219520;
        v58 = v25;
        v59 = 2048;
        v60 = v27;
        v61 = 2048;
        v62 = v28;
        v63 = 2048;
        v64 = v17;
        v65 = 2048;
        v66 = v19;
        v67 = 2048;
        v68 = v21;
        v69 = 2048;
        v70 = v23;
        v29 = MEMORY[0x1E0C81028];
        v30 = "[FaceCropGeneration] face (centerX:%.2f, centerY:%.2f, size:%.2f) -> normalizedRect: (x:%.2f, y:%.2f, widt"
              "h:%.2f, height:%.2f)";
        v31 = 72;
        goto LABEL_29;
      }
    }
    else if (objc_msgSend(v7, "detectionType") != 4 || !v15)
    {
      goto LABEL_11;
    }
    objc_msgSend(v7, "normalizedBodyRect");
    v17 = v42;
    v19 = v43;
    v21 = v44;
    v23 = v45;
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    objc_msgSend(v7, "bodyCenterX");
    v47 = v46;
    objc_msgSend(v7, "bodyCenterY");
    v49 = v48;
    objc_msgSend(v7, "bodyWidth");
    v51 = v50;
    objc_msgSend(v7, "bodyHeight");
    *(_DWORD *)buf = 134219776;
    v58 = v47;
    v59 = 2048;
    v60 = v49;
    v61 = 2048;
    v62 = v51;
    v63 = 2048;
    v64 = v52;
    v65 = 2048;
    v66 = v17;
    v67 = 2048;
    v68 = v19;
    v69 = 2048;
    v70 = v21;
    v71 = 2048;
    v72 = v23;
    v29 = MEMORY[0x1E0C81028];
    v30 = "[FaceCropGeneration] body (bodyCenterX:%.2f, bodyCenterY:%.2f, bodyWidth:%.2f, bodyHeight: %.2f) -> normalized"
          "Rect: (x:%.2f, y:%.2f, width:%.2f, height:%.2f)";
    v31 = 82;
LABEL_29:
    _os_log_impl(&dword_1B6C4A000, v29, OS_LOG_TYPE_DEBUG, v30, buf, v31);
    goto LABEL_15;
  }
  objc_msgSend(v7, "normalizedFaceRect");
  v17 = v32;
  v19 = v33;
  v21 = v34;
  v23 = v35;
LABEL_15:
  v56 = 0;
  v36 = +[VCPFaceCropUtils newFaceCropFromImageURL:withNormalizedFaceRect:groupingIdentifier:error:](VCPFaceCropUtils, "newFaceCropFromImageURL:withNormalizedFaceRect:groupingIdentifier:error:", v8, v10, &v56, v17, v19, v21, v23);
  v37 = v56;
  if (v36)
  {
    v38 = -[VCPFaceCrop initWithFaceCropData:originatingFace:]([VCPFaceCrop alloc], "initWithFaceCropData:originatingFace:", v36, v7);
    v11 = v38;
    if (v38)
    {
      v39 = v38;
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v53;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPFaceCrop][%@] Failed to create VCPFaceCrop instance", buf, 0xCu);

    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v58 = v40;
      v59 = 2112;
      v60 = v37;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPFaceCrop][%@] Failed to generate FaceCrop data - %@", buf, 0x16u);

    }
    v11 = 0;
  }

LABEL_35:
  return v11;
}

- (id)faceCropData
{
  return self->_faceCropData;
}

- (id)originatingFace
{
  return self->_originatingFace;
}

- (CGSize)imageDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedImageDimensions.width;
  height = self->_cachedImageDimensions.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:error:](VCPFaceCropUtils, "faceCropDimensionsFromFaceCrop:error:", self->_faceCropData, 0);
    self->_cachedImageDimensions.width = width;
    self->_cachedImageDimensions.height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  VCPPhotosFace *originatingFace;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)VCPFaceCrop;
  -[VCPFaceCrop description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("  state            : %d\n"), -[VCPFaceCrop state](self, "state"));
  originatingFace = self->_originatingFace;
  if (originatingFace)
  {
    -[VCPPhotosFace localIdentifier](originatingFace, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  originating face : %@\n"), v7);

  }
  return v5;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (signed)state
{
  return self->_state;
}

- (void)setState:(signed __int16)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingFace, 0);
  objc_storeStrong((id *)&self->_faceCropData, 0);
}

@end
