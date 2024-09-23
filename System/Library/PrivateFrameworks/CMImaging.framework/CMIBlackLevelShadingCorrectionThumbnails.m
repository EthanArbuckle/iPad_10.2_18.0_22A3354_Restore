@implementation CMIBlackLevelShadingCorrectionThumbnails

- (BOOL)_decompressImageFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSDictionary *dict_from_metadata;
  NSDictionary *metadata;
  NSString *metadataFileSystemLocation;
  BOOL v10;
  void *v12;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  if (!v4)
  {
    fig_log_get_emitter();
LABEL_9:
    FigDebugAssert3();
    v10 = 0;
    goto LABEL_6;
  }
  v6 = objc_retainAutorelease(v4);
  if (bfpn_create_correction_model_from_fdr((__CVBuffer *)objc_msgSend(v6, "bytes"), (__CVBuffer *)objc_msgSend(v6, "length"), 0, &v12)|| !v12|| (dict_from_metadata = (NSDictionary *)bfpn_correction_create_dict_from_metadata((unsigned __int16 *)v12)) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_9;
  }
  metadata = self->_metadata;
  self->_metadata = dict_from_metadata;

  objc_storeStrong((id *)&self->_compressedData, v6);
  metadataFileSystemLocation = self->_metadataFileSystemLocation;
  self->_metadataFileSystemLocation = 0;

  v10 = 1;
LABEL_6:
  free(v12);

  return v10;
}

- (id)_init
{
  CMIBlackLevelShadingCorrectionThumbnails *v2;
  CMIBlackLevelShadingCorrectionThumbnails *v3;
  CMIBlackLevelShadingCorrectionThumbnails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMIBlackLevelShadingCorrectionThumbnails;
  v2 = -[CMIBlackLevelShadingCorrectionThumbnails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_encodingOptions = 7;
    v4 = v2;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v3;
}

- (void)_deferredSetupWithPixelBufferProviderIfneeded
{
  uint64_t (**pixelBufferProvider)(id, SEL);
  uint64_t v4;
  __CVBuffer *v5;
  id v6;

  if (!self->_metadata)
  {
    pixelBufferProvider = (uint64_t (**)(id, SEL))self->_pixelBufferProvider;
    if (pixelBufferProvider)
    {
      v4 = pixelBufferProvider[2](pixelBufferProvider, a2);
      if (v4)
      {
        v5 = (__CVBuffer *)v4;
        -[CMIBlackLevelShadingCorrectionThumbnails _setupWithPixelBuffer:](self, "_setupWithPixelBuffer:", v4);
        CVPixelBufferRelease(v5);
      }
      v6 = self->_pixelBufferProvider;
      self->_pixelBufferProvider = 0;

    }
  }
}

- (void)_setupWithPixelBuffer:(__CVBuffer *)a3
{
  NSDictionary *v5;
  NSDictionary *metadata;
  NSData *v7;
  NSData *compressedData;
  NSString *v9;
  NSString *metadataFileSystemLocation;

  if (a3)
  {
    v5 = (NSDictionary *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0D061B8], 0);
    metadata = self->_metadata;
    self->_metadata = v5;

    v7 = (NSData *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0D061B0], 0);
    compressedData = self->_compressedData;
    self->_compressedData = v7;

    v9 = (NSString *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0D061C0], 0);
    metadataFileSystemLocation = self->_metadataFileSystemLocation;
    self->_metadataFileSystemLocation = v9;

  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (CMIBlackLevelShadingCorrectionThumbnails)initWithPixelBuffer:(__CVBuffer *)a3
{
  CMIBlackLevelShadingCorrectionThumbnails *v5;
  CMIBlackLevelShadingCorrectionThumbnails *v6;

  if (a3)
  {
    v5 = -[CMIBlackLevelShadingCorrectionThumbnails _init](self, "_init");
    v6 = v5;
    if (v5)
    {
      -[CMIBlackLevelShadingCorrectionThumbnails _setupWithPixelBuffer:](v5, "_setupWithPixelBuffer:", a3);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v6;
}

- (CMIBlackLevelShadingCorrectionThumbnails)initWithPixelBufferProvider:(id)a3
{
  id v4;
  CMIBlackLevelShadingCorrectionThumbnails *v5;
  uint64_t v6;
  id pixelBufferProvider;

  v4 = a3;
  if (v4)
  {
    v5 = -[CMIBlackLevelShadingCorrectionThumbnails _init](self, "_init");
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      pixelBufferProvider = v5->_pixelBufferProvider;
      v5->_pixelBufferProvider = (id)v6;

    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    v5 = 0;
  }

  return v5;
}

- (CMIBlackLevelShadingCorrectionThumbnails)initWithCompressedData:(id)a3
{
  id v4;
  CMIBlackLevelShadingCorrectionThumbnails *v5;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  v5 = -[CMIBlackLevelShadingCorrectionThumbnails _init](self, "_init");
  self = v5;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_4;
  }
  if (!-[CMIBlackLevelShadingCorrectionThumbnails _decompressImageFromData:](v5, "_decompressImageFromData:", v4))
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (CMIBlackLevelShadingCorrectionThumbnails)initWithMetadataPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSDictionary *dict_from_metadata;
  NSDictionary *metadata;

  v5 = a3;
  if (!v5)
    goto LABEL_10;
  self = -[CMIBlackLevelShadingCorrectionThumbnails _init](self, "_init");
  if (!self)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_12:

    self = 0;
    goto LABEL_7;
  }
  v7 = v6;
  if ((unint64_t)objc_msgSend(v6, "length") <= 0xCFB7
    || (v7 = objc_retainAutorelease(v7),
        dict_from_metadata = (NSDictionary *)bfpn_correction_create_dict_from_metadata((unsigned __int16 *)objc_msgSend(v7, "bytes")),
        metadata = self->_metadata,
        self->_metadata = dict_from_metadata,
        metadata,
        !self->_metadata))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_metadataFileSystemLocation, a3);
  self = self;

LABEL_7:
  return self;
}

- (NSDictionary)metadata
{
  -[CMIBlackLevelShadingCorrectionThumbnails _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_metadata;
}

- (NSData)compressedData
{
  -[CMIBlackLevelShadingCorrectionThumbnails _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_compressedData;
}

- (NSString)metadataFileSystemLocation
{
  -[CMIBlackLevelShadingCorrectionThumbnails _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_metadataFileSystemLocation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = -[CMIBlackLevelShadingCorrectionThumbnails _init]([CMIBlackLevelShadingCorrectionThumbnails alloc], "_init");
  *((_DWORD *)v4 + 10) = self->_encodingOptions;
  v5 = objc_msgSend(self->_pixelBufferProvider, "copy");
  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  objc_storeStrong((id *)v4 + 2, self->_metadata);
  objc_storeStrong((id *)v4 + 3, self->_compressedData);
  objc_storeStrong((id *)v4 + 4, self->_metadataFileSystemLocation);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMIBlackLevelShadingCorrectionThumbnails)initWithCoder:(id)a3
{
  id v4;
  CMIBlackLevelShadingCorrectionThumbnails *v5;
  uint64_t v6;
  NSDictionary *metadata;
  uint64_t v8;
  NSData *compressedData;
  uint64_t v10;
  NSString *metadataFileSystemLocation;
  CMIBlackLevelShadingCorrectionThumbnails *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMIBlackLevelShadingCorrectionThumbnails;
  v5 = -[CMIBlackLevelShadingCorrectionThumbnails init](&v14, sel_init);
  if (v5
    && (v5->_encodingOptions = objc_msgSend(v4, "decodeIntForKey:", CFSTR("EncodingOptions")),
        objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("Metadata")),
        v6 = objc_claimAutoreleasedReturnValue(),
        metadata = v5->_metadata,
        v5->_metadata = (NSDictionary *)v6,
        metadata,
        v5->_metadata))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Compressed"));
    v8 = objc_claimAutoreleasedReturnValue();
    compressedData = v5->_compressedData;
    v5->_compressedData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MetadataFileSystemLocation"));
    v10 = objc_claimAutoreleasedReturnValue();
    metadataFileSystemLocation = v5->_metadataFileSystemLocation;
    v5->_metadataFileSystemLocation = (NSString *)v10;

    v12 = v5;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSData *compressedData;
  id v8;

  v8 = a3;
  -[CMIBlackLevelShadingCorrectionThumbnails _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  objc_msgSend(v8, "encodeInt:forKey:", self->_encodingOptions, CFSTR("EncodingOptions"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));
  if (self->_metadataFileSystemLocation && (self->_encodingOptions & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_9;
    }
    v5 = v4;
    v6 = objc_msgSend(v4, "fileExistsAtPath:", self->_metadataFileSystemLocation);

    if (v6)
      objc_msgSend(v8, "encodeObject:forKey:", self->_metadataFileSystemLocation, CFSTR("MetadataFileSystemLocation"));
  }
  if ((self->_encodingOptions & 2) != 0)
  {
    compressedData = self->_compressedData;
    if (compressedData)
      objc_msgSend(v8, "encodeObject:forKey:", compressedData, CFSTR("Compressed"));
  }
LABEL_9:

}

- (unsigned)encodingOptions
{
  return self->_encodingOptions;
}

- (void)setEncodingOptions:(unsigned int)a3
{
  self->_encodingOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataFileSystemLocation, 0);
  objc_storeStrong((id *)&self->_compressedData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_pixelBufferProvider, 0);
}

@end
