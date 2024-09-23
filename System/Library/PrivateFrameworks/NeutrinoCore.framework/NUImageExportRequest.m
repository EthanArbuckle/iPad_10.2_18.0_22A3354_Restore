@implementation NUImageExportRequest

- (NUImageExportRequest)initWithComposition:(id)a3
{
  NUImageExportRequest *v3;
  uint64_t v4;
  NUColorSpace *colorSpace;
  NSDictionary *auxImages;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUImageExportRequest;
  v3 = -[NUExportRequest initWithComposition:](&v8, sel_initWithComposition_, a3);
  if (v3)
  {
    +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
    v4 = objc_claimAutoreleasedReturnValue();
    colorSpace = v3->_colorSpace;
    v3->_colorSpace = (NUColorSpace *)v4;

    auxImages = v3->_auxImages;
    v3->_auxImages = (NSDictionary *)MEMORY[0x1E0C9AA70];

    -[NURenderRequest setIsOneShot:](v3, "setIsOneShot:", 1);
  }
  return v3;
}

- (NUImageExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4
{
  id v6;
  NUImageExportRequest *v7;
  uint64_t v8;
  NUImageExportFormat *format;
  NSDictionary *auxImages;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUImageExportRequest;
  v7 = -[NUExportRequest initWithComposition:destinationURL:](&v12, sel_initWithComposition_destinationURL_, a3, v6);
  if (v7)
  {
    if (v6)
    {
      +[NUImageExportFormat defaultFormatForURL:](NUImageExportFormat, "defaultFormatForURL:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      format = v7->_format;
      v7->_format = (NUImageExportFormat *)v8;

    }
    auxImages = v7->_auxImages;
    v7->_auxImages = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v7;
}

- (NUImageExportRequest)initWithComposition:(id)a3 exportFormat:(id)a4
{
  NUImageExportFormat *v6;
  NUImageExportRequest *v7;
  NUImageExportFormat *format;

  v6 = (NUImageExportFormat *)a4;
  v7 = -[NUImageExportRequest initWithComposition:](self, "initWithComposition:", a3);
  format = v7->_format;
  v7->_format = v6;

  return v7;
}

- (NUImageExportFormat)format
{
  NUImageExportFormat *format;
  NUImageExportFormatJPEG *v4;
  NUImageExportFormat *v5;

  format = self->_format;
  if (!format)
  {
    v4 = objc_alloc_init(NUImageExportFormatJPEG);
    v5 = self->_format;
    self->_format = &v4->super;

    format = self->_format;
  }
  return format;
}

- (id)newRenderJob
{
  return -[NUImageExportJob initWithImageExportRequest:]([NUImageExportJob alloc], "initWithImageExportRequest:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUImageExportRequest;
  v4 = -[NUExportRequest copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 22, self->_colorSpace);
    -[NUImageExportRequest format](self, "format");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = v5[23];
    v5[23] = (id)v7;

    objc_storeStrong(v5 + 24, self->_imageProperties);
    objc_storeStrong(v5 + 25, self->_auxiliaryImageTypes);
    objc_storeStrong(v5 + 26, self->_auxImages);
    *((_BYTE *)v5 + 168) = self->_renderToData;
    *((_BYTE *)v5 + 169) = self->_renderWithIOSurface;
    *((_BYTE *)v5 + 170) = self->_applyOrientationAsMetadata;
  }
  return v5;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (void)setFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)renderToData
{
  return self->_renderToData;
}

- (void)setRenderToData:(BOOL)a3
{
  self->_renderToData = a3;
}

- (BOOL)renderWithIOSurface
{
  return self->_renderWithIOSurface;
}

- (void)setRenderWithIOSurface:(BOOL)a3
{
  self->_renderWithIOSurface = a3;
}

- (NSDictionary)imageProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setImageProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (BOOL)applyOrientationAsMetadata
{
  return self->_applyOrientationAsMetadata;
}

- (void)setApplyOrientationAsMetadata:(BOOL)a3
{
  self->_applyOrientationAsMetadata = a3;
}

- (NSArray)auxiliaryImageTypes
{
  return self->_auxiliaryImageTypes;
}

- (void)setAuxiliaryImageTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDictionary)auxImages
{
  return self->_auxImages;
}

- (void)setAuxImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxImages, 0);
  objc_storeStrong((id *)&self->_auxiliaryImageTypes, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
}

+ (NSArray)defaultAuxiliaryImageTypes
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("HDRGainMap");
  v6[0] = CFSTR("HDRGainMap");
  v3 = CFSTR("Disparity");
  v6[1] = CFSTR("Disparity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

@end
