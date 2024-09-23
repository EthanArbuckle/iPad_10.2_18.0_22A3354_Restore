@implementation VCPMADServiceImageDataAsset

- (VCPMADServiceImageDataAsset)initWithImageData:(id)a3 uniformTypeIdentifier:(id)a4 identifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  id v13;
  id v14;
  id v15;
  VCPMADServiceImageDataAsset *v16;
  VCPMADServiceImageDataAsset *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VCPMADServiceImageDataAsset;
  v16 = -[VCPMADServiceImageAsset initWithClientBundleID:clientTeamID:](&v19, sel_initWithClientBundleID_clientTeamID_, a6, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_imageData, a3);
    v17->_orientation = 1;
    objc_storeStrong((id *)&v17->_identifier, a5);
    objc_storeStrong((id *)&v17->_uniformTypeIdentifier, a4);
  }

  return v17;
}

- (unint64_t)assetType
{
  return 3;
}

- (id)identifier
{
  return self->_identifier;
}

- (CGSize)resolution
{
  __CVBuffer *value;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  double Size;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGImageSource *v13;
  CGSize result;

  value = self->_pixelBuffer.value_;
  if (value)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth(value));
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight(self->_pixelBuffer.value_));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_orientation);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    Size = CGSizeWithOrientation(v4, v5, v6);
    v9 = v8;

  }
  else
  {
    v13 = CGImageSourceCreateWithData((CFDataRef)self->_imageData, 0);
    Size = CGImageSourceGetSize(v13);
    v9 = v10;
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v13);
  }
  v11 = Size;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return self->_pixelBuffer.value_ != 0;
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  CF<__CVBuffer *> *p_pixelBuffer;
  __CVBuffer *value;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  __CVBuffer *v18;
  int result;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_pixelBuffer = &self->_pixelBuffer;
  value = self->_pixelBuffer.value_;
  if (!value)
  {
    VCPSignPostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    VCPSignPostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138412290;
      *(_QWORD *)&v20[4] = v13;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPMADServiceImageDataAsset_Decode", "%@", v20, 0xCu);

    }
    +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v20 = objc_msgSend(v14, "pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:", 875704422, 0, self->_imageData, self->_uniformTypeIdentifier, 1, &self->_orientation);
    CF<__CVBuffer *>::operator=((const void **)&p_pixelBuffer->value_, (const void **)v20);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)v20);

    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
    {
      -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138412290;
      *(_QWORD *)&v20[4] = v17;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v10, "VCPMADServiceImageDataAsset_Decode", "%@", v20, 0xCu);

    }
    value = p_pixelBuffer->value_;
    if (!p_pixelBuffer->value_)
      return -18;
  }
  v18 = (__CVBuffer *)CFRetain(value);
  result = 0;
  *a3 = v18;
  *a4 = self->_orientation;
  return result;
}

- (id)documentObservations
{
  NSString *identifier;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_documentObservations
    && (int)MediaAnalysisLogLevel() >= 7
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    identifier = self->_identifier;
    v5 = 138412290;
    v6 = identifier;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[OCR][%@] Re-using cached results", (uint8_t *)&v5, 0xCu);
  }
  return self->_documentObservations;
}

- (void)setDocumentObservations:(id)a3
{
  NSArray *v4;
  NSArray *documentObservations;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  documentObservations = self->_documentObservations;
  self->_documentObservations = v4;

}

- (BOOL)hasCachedParseData
{
  return self->_hasCachedParseData;
}

- (id)cachedParseData
{
  NSString *identifier;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_hasCachedParseData
    && (int)MediaAnalysisLogLevel() >= 6
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    v5 = 138412290;
    v6 = identifier;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VS][%@] Re-using cached results", (uint8_t *)&v5, 0xCu);
  }
  return self->_cachedParseData;
}

- (void)setCachedParseData:(id)a3 overwriteExisting:(BOOL)a4
{
  NSData *v5;
  NSData *cachedParseData;
  id v7;

  v7 = a3;
  v5 = (NSData *)objc_msgSend(v7, "copy");
  cachedParseData = self->_cachedParseData;
  self->_cachedParseData = v5;

  self->_hasCachedParseData = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedParseData, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBuffer.value_);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  return self;
}

@end
