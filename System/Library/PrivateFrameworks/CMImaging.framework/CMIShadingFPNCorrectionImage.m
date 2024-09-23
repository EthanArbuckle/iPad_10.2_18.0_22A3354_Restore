@implementation CMIShadingFPNCorrectionImage

- (BOOL)_decompressImageFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CFDictionaryRef dict_from_metadata;
  NSDictionary *v8;
  NSDictionary *metadata;
  NSString *pixelBufferFileSystemLocation;
  NSString *metadataFileSystemLocation;
  BOOL v12;
  CVBufferRef buffer;
  void *v15;

  v4 = a3;
  v5 = v4;
  buffer = 0;
  v15 = 0;
  if (!v4)
  {
    fig_log_get_emitter();
LABEL_10:
    FigDebugAssert3();
    CVPixelBufferRelease(buffer);
    v12 = 0;
    goto LABEL_7;
  }
  v6 = objc_retainAutorelease(v4);
  if (bfpn_create_correction_model_from_fdr((__CVBuffer *)objc_msgSend(v6, "bytes"), (__CVBuffer *)objc_msgSend(v6, "length"), &buffer, &v15)|| !buffer|| !v15|| (dict_from_metadata = bfpn_correction_create_dict_from_metadata((unsigned __int16 *)v15)) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_10;
  }
  v8 = (NSDictionary *)dict_from_metadata;
  CVBufferSetAttachment(buffer, (CFStringRef)*MEMORY[0x1E0D061B8], dict_from_metadata, kCVAttachmentMode_ShouldNotPropagate);
  metadata = self->_metadata;
  self->_pixelBuffer = buffer;
  self->_metadata = v8;

  objc_storeStrong((id *)&self->_compressedData, v6);
  pixelBufferFileSystemLocation = self->_pixelBufferFileSystemLocation;
  self->_pixelBufferFileSystemLocation = 0;

  metadataFileSystemLocation = self->_metadataFileSystemLocation;
  self->_metadataFileSystemLocation = 0;

  v12 = 1;
LABEL_7:
  free(v15);

  return v12;
}

- (id)_init
{
  CMIShadingFPNCorrectionImage *v2;
  CMIShadingFPNCorrectionImage *v3;
  CMIShadingFPNCorrectionImage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMIShadingFPNCorrectionImage;
  v2 = -[CMIShadingFPNCorrectionImage init](&v6, sel_init);
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

  if (!self->_pixelBuffer)
  {
    pixelBufferProvider = (uint64_t (**)(id, SEL))self->_pixelBufferProvider;
    if (pixelBufferProvider)
    {
      v4 = pixelBufferProvider[2](pixelBufferProvider, a2);
      if (v4)
      {
        v5 = (__CVBuffer *)v4;
        -[CMIShadingFPNCorrectionImage _setupWithPixelBuffer:](self, "_setupWithPixelBuffer:", v4);
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
  NSString *pixelBufferFileSystemLocation;
  NSString *v11;
  NSString *metadataFileSystemLocation;

  if (a3)
  {
    self->_pixelBuffer = CVPixelBufferRetain(a3);
    v5 = (NSDictionary *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0D061B8], 0);
    metadata = self->_metadata;
    self->_metadata = v5;

    v7 = (NSData *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0D061B0], 0);
    compressedData = self->_compressedData;
    self->_compressedData = v7;

    v9 = (NSString *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0D061C8], 0);
    pixelBufferFileSystemLocation = self->_pixelBufferFileSystemLocation;
    self->_pixelBufferFileSystemLocation = v9;

    v11 = (NSString *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0D061C0], 0);
    metadataFileSystemLocation = self->_metadataFileSystemLocation;
    self->_metadataFileSystemLocation = v11;

  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (CMIShadingFPNCorrectionImage)initWithPixelBuffer:(__CVBuffer *)a3
{
  CMIShadingFPNCorrectionImage *v5;
  CMIShadingFPNCorrectionImage *v6;

  if (a3)
  {
    v5 = -[CMIShadingFPNCorrectionImage _init](self, "_init");
    v6 = v5;
    if (v5)
    {
      -[CMIShadingFPNCorrectionImage _setupWithPixelBuffer:](v5, "_setupWithPixelBuffer:", a3);
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

- (CMIShadingFPNCorrectionImage)initWithPixelBufferProvider:(id)a3
{
  id v4;
  CMIShadingFPNCorrectionImage *v5;
  uint64_t v6;
  id pixelBufferProvider;

  v4 = a3;
  if (v4)
  {
    v5 = -[CMIShadingFPNCorrectionImage _init](self, "_init");
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

- (CMIShadingFPNCorrectionImage)initWithCompressedData:(id)a3
{
  id v4;
  CMIShadingFPNCorrectionImage *v5;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  v5 = -[CMIShadingFPNCorrectionImage _init](self, "_init");
  self = v5;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_4;
  }
  if (!-[CMIShadingFPNCorrectionImage _decompressImageFromData:](v5, "_decompressImageFromData:", v4))
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  self->_pixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMIShadingFPNCorrectionImage;
  -[CMIShadingFPNCorrectionImage dealloc](&v3, sel_dealloc);
}

- (CMIShadingFPNCorrectionImage)initWithPixelBufferPath:(id)a3 metadataPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSDictionary *dict_from_metadata;
  NSDictionary *metadata;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  __CVBuffer *v19;
  __CVBuffer *v20;
  CMIShadingFPNCorrectionImage *v21;
  unsigned int v23;
  unsigned int v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7 || (self = -[CMIShadingFPNCorrectionImage _init](self, "_init")) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
LABEL_17:
    v20 = 0;
LABEL_18:
    CVPixelBufferRelease(v20);
    v21 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_16;
  if ((unint64_t)objc_msgSend(v9, "length") <= 0xCFB7)
    goto LABEL_16;
  v10 = objc_retainAutorelease(v10);
  dict_from_metadata = (NSDictionary *)bfpn_correction_create_dict_from_metadata((unsigned __int16 *)objc_msgSend(v10, "bytes"));
  metadata = self->_metadata;
  self->_metadata = dict_from_metadata;

  if (!self->_metadata)
    goto LABEL_16;
  v10 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v10, "bytes");
  v14 = *(unsigned __int16 *)(v13 + 8);
  if (!*(_WORD *)(v13 + 8)
    || (v10 = objc_retainAutorelease(v10),
        v15 = objc_msgSend(v10, "bytes"),
        v16 = *(unsigned __int16 *)(v15 + 10),
        !*(_WORD *)(v15 + 10))
    || (v10 = objc_retainAutorelease(v10), v17 = *(unsigned int *)(objc_msgSend(v10, "bytes") + 12), !(_DWORD)v17))
  {
LABEL_16:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  v23 = v16;
  v24 = v14;
  v18 = objc_retainAutorelease(v6);
  v19 = CreatePixelBufferFromFile(objc_msgSend(v18, "UTF8String"), v17, &v24, &v23, (float)v14 / (float)v16);
  v20 = v19;
  if (!v19 || v24 != v14 || v23 != v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_18;
  }
  self->_pixelBuffer = v19;
  objc_storeStrong((id *)&self->_pixelBufferFileSystemLocation, v18);
  objc_storeStrong((id *)&self->_metadataFileSystemLocation, a4);
  self = self;
  v21 = self;
LABEL_14:

  return v21;
}

- (__CVBuffer)pixelBuffer
{
  -[CMIShadingFPNCorrectionImage _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_pixelBuffer;
}

- (NSDictionary)metadata
{
  -[CMIShadingFPNCorrectionImage _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_metadata;
}

- (NSData)compressedData
{
  -[CMIShadingFPNCorrectionImage _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_compressedData;
}

- (NSString)pixelBufferFileSystemLocation
{
  -[CMIShadingFPNCorrectionImage _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_pixelBufferFileSystemLocation;
}

- (NSString)metadataFileSystemLocation
{
  -[CMIShadingFPNCorrectionImage _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  return self->_metadataFileSystemLocation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = -[CMIShadingFPNCorrectionImage _init]([CMIShadingFPNCorrectionImage alloc], "_init");
  *((_DWORD *)v4 + 14) = self->_encodingOptions;
  v5 = objc_msgSend(self->_pixelBufferProvider, "copy");
  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  *((_QWORD *)v4 + 2) = CVPixelBufferRetain(self->_pixelBuffer);
  objc_storeStrong((id *)v4 + 3, self->_metadata);
  objc_storeStrong((id *)v4 + 4, self->_compressedData);
  objc_storeStrong((id *)v4 + 5, self->_pixelBufferFileSystemLocation);
  objc_storeStrong((id *)v4 + 6, self->_metadataFileSystemLocation);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMIShadingFPNCorrectionImage)initWithCoder:(id)a3
{
  id v4;
  CMIShadingFPNCorrectionImage *v5;
  uint64_t v6;
  NSDictionary *metadata;
  void *v8;
  uint64_t v9;
  NSData *compressedData;
  uint64_t v11;
  NSString *pixelBufferFileSystemLocation;
  id *p_pixelBufferFileSystemLocation;
  uint64_t v14;
  NSString *metadataFileSystemLocation;
  void *v16;
  void *v17;
  id v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  __CVBuffer *PixelBufferFromCFData;
  __CVBuffer *v25;
  id v26;
  CFDictionaryRef dict_from_metadata;
  __CVBuffer *PixelBufferFromFile;
  CMIShadingFPNCorrectionImage *v29;
  int v31;
  int v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CMIShadingFPNCorrectionImage;
  v5 = -[CMIShadingFPNCorrectionImage init](&v33, sel_init);
  if (!v5
    || (v5->_encodingOptions = objc_msgSend(v4, "decodeIntForKey:", CFSTR("EncodingOptions")),
        objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("Metadata")),
        v6 = objc_claimAutoreleasedReturnValue(),
        metadata = v5->_metadata,
        v5->_metadata = (NSDictionary *)v6,
        metadata,
        !v5->_metadata))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_34;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Image"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Compressed"));
  v9 = objc_claimAutoreleasedReturnValue();
  compressedData = v5->_compressedData;
  v5->_compressedData = (NSData *)v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImageFileSystemLocation"));
  v11 = objc_claimAutoreleasedReturnValue();
  p_pixelBufferFileSystemLocation = (id *)&v5->_pixelBufferFileSystemLocation;
  pixelBufferFileSystemLocation = v5->_pixelBufferFileSystemLocation;
  v5->_pixelBufferFileSystemLocation = (NSString *)v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MetadataFileSystemLocation"));
  v14 = objc_claimAutoreleasedReturnValue();
  metadataFileSystemLocation = v5->_metadataFileSystemLocation;
  v5->_metadataFileSystemLocation = (NSString *)v14;

  if (v5->_pixelBufferFileSystemLocation)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_35:
      fig_log_get_emitter();
      FigDebugAssert3();
      v25 = 0;
LABEL_39:
      CVPixelBufferRelease(v25);
      v29 = 0;
      goto LABEL_32;
    }
    v17 = v16;
    if (objc_msgSend(v16, "fileExistsAtPath:", *p_pixelBufferFileSystemLocation))
      v18 = *p_pixelBufferFileSystemLocation;
    else
      v18 = 0;
    objc_storeStrong((id *)&v5->_pixelBufferFileSystemLocation, v18);

  }
  v19 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ImageWidth"));
  if (v19 <= 0)
    goto LABEL_35;
  v20 = v19;
  v21 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ImageHeight"));
  if (v21 <= 0)
    goto LABEL_35;
  v22 = v21;
  v23 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ImagePixelFormat"));
  if (!(_DWORD)v23)
    goto LABEL_35;
  if (!v8)
  {
    if (v5->_pixelBuffer)
      goto LABEL_31;
    if (!*p_pixelBufferFileSystemLocation || !v5->_metadataFileSystemLocation)
    {
      v25 = 0;
LABEL_28:
      if (v5->_compressedData
        && -[CMIShadingFPNCorrectionImage _decompressImageFromData:](v5, "_decompressImageFromData:")
        && v5->_pixelBuffer)
      {
        goto LABEL_31;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length") == 53176)
    {
      v26 = objc_retainAutorelease(v26);
      dict_from_metadata = bfpn_correction_create_dict_from_metadata((unsigned __int16 *)objc_msgSend(v26, "bytes"));
      if (-[NSDictionary isEqualToDictionary:](v5->_metadata, "isEqualToDictionary:", dict_from_metadata))
      {
        v31 = v22;
        v32 = v20;
        PixelBufferFromFile = CreatePixelBufferFromFile(objc_msgSend(*p_pixelBufferFileSystemLocation, "UTF8String"), v23, (unsigned int *)&v32, (unsigned int *)&v31, (float)v20 / (float)v22);
        v25 = PixelBufferFromFile;
        if (PixelBufferFromFile && v32 == v20 && v31 == v22)
        {
          v5->_pixelBuffer = PixelBufferFromFile;

          if (v5->_pixelBuffer)
            goto LABEL_31;
          goto LABEL_28;
        }
        fig_log_get_emitter();
        FigDebugAssert3();

LABEL_38:
        v8 = 0;
        goto LABEL_39;
      }

    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }

LABEL_34:
    v25 = 0;
    goto LABEL_38;
  }
  v31 = v22;
  v32 = v20;
  PixelBufferFromCFData = CreatePixelBufferFromCFData(v8, v23, (unsigned int *)&v32, (unsigned int *)&v31, (float)v20 / (float)v22);
  v25 = PixelBufferFromCFData;
  if (!PixelBufferFromCFData || v32 != v20 || v31 != v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_39;
  }
  v5->_pixelBuffer = PixelBufferFromCFData;
LABEL_31:
  v29 = v5;
LABEL_32:

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  void *v7;
  void *v8;
  int v9;
  unsigned int encodingOptions;
  NSData *compressedData;
  __CVBuffer *pixelBuffer;
  size_t BytesPerRow;
  size_t v14;
  void *v15;
  char *BaseAddress;
  char *v17;
  id v18;

  v18 = a3;
  -[CMIShadingFPNCorrectionImage _deferredSetupWithPixelBufferProviderIfneeded](self, "_deferredSetupWithPixelBufferProviderIfneeded");
  objc_msgSend(v18, "encodeInt:forKey:", self->_encodingOptions, CFSTR("EncodingOptions"));
  Width = CVPixelBufferGetWidth(self->_pixelBuffer);
  Height = CVPixelBufferGetHeight(self->_pixelBuffer);
  PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  objc_msgSend(v18, "encodeInt:forKey:", Width, CFSTR("ImageWidth"));
  objc_msgSend(v18, "encodeInt:forKey:", Height, CFSTR("ImageHeight"));
  objc_msgSend(v18, "encodeInt64:forKey:", PixelFormatType, CFSTR("ImagePixelFormat"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));
  if (self->_pixelBufferFileSystemLocation && self->_metadataFileSystemLocation && (self->_encodingOptions & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_21;
    }
    v8 = v7;
    if ((objc_msgSend(v7, "fileExistsAtPath:", self->_pixelBufferFileSystemLocation) & 1) != 0)
    {
      v9 = objc_msgSend(v8, "fileExistsAtPath:", self->_metadataFileSystemLocation);

      if (v9)
      {
        objc_msgSend(v18, "encodeObject:forKey:", self->_pixelBufferFileSystemLocation, CFSTR("ImageFileSystemLocation"));
        objc_msgSend(v18, "encodeObject:forKey:", self->_metadataFileSystemLocation, CFSTR("MetadataFileSystemLocation"));
      }
    }
    else
    {

    }
  }
  encodingOptions = self->_encodingOptions;
  if ((encodingOptions & 2) != 0)
  {
    compressedData = self->_compressedData;
    if (compressedData)
    {
      objc_msgSend(v18, "encodeObject:forKey:", compressedData, CFSTR("Compressed"));
      encodingOptions = self->_encodingOptions;
    }
  }
  if ((encodingOptions & 1) != 0)
  {
    pixelBuffer = self->_pixelBuffer;
    if (pixelBuffer)
    {
      BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
      v14 = Width * (int)GetPixelBlockSizeInBytes(PixelFormatType, 0, 0, 0);
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v14 * Height);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || CVPixelBufferLockBaseAddress(self->_pixelBuffer, 1uLL))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_pixelBuffer);
        if (Height)
        {
          v17 = BaseAddress;
          do
          {
            objc_msgSend(v15, "appendBytes:length:", v17, v14);
            v17 += BytesPerRow;
            --Height;
          }
          while (Height);
        }
        CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 1uLL);
        objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("Image"));
      }

    }
  }
LABEL_21:

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
  objc_storeStrong((id *)&self->_pixelBufferFileSystemLocation, 0);
  objc_storeStrong((id *)&self->_compressedData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_pixelBufferProvider, 0);
}

@end
