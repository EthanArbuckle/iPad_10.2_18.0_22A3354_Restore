@implementation VCPMADServiceImagePixelBufferAsset

- (VCPMADServiceImagePixelBufferAsset)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 andIdentifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  id v13;
  VCPMADServiceImagePixelBufferAsset *v14;
  CFTypeRef v15;
  const void *v17;
  objc_super v18;

  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VCPMADServiceImagePixelBufferAsset;
  v14 = -[VCPMADServiceImageAsset initWithClientBundleID:clientTeamID:](&v18, sel_initWithClientBundleID_clientTeamID_, a6, a7);
  if (v14)
  {
    if (a3)
      v15 = CFRetain(a3);
    else
      v15 = 0;
    v17 = v15;
    CF<__CVBuffer *>::operator=((const void **)&v14->_pixelBuffer.value_, &v17);
    CF<opaqueCMSampleBuffer *>::~CF(&v17);
    v14->_orientation = a4;
    objc_storeStrong((id *)&v14->_identifier, a5);
  }

  return v14;
}

- (unint64_t)assetType
{
  return 1;
}

- (id)identifier
{
  return self->_identifier;
}

- (CGSize)resolution
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer.value_);
  Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer.value_);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return 1;
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  void *value;

  value = self->_pixelBuffer.value_;
  if (value)
    value = (void *)CFRetain(value);
  *a3 = (__CVBuffer *)value;
  *a4 = self->_orientation;
  return 0;
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
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
