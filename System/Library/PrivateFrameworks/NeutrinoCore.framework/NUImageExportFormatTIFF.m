@implementation NUImageExportFormatTIFF

- (NUImageExportFormatTIFF)init
{
  NUImageExportFormatTIFF *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUImageExportFormatTIFF;
  result = -[NUImageExportFormatTIFF init](&v3, sel_init);
  result->_preserveAlpha = 1;
  result->_pixelType = 0;
  result->_compression = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
  {
    *((_QWORD *)result + 2) = self->_pixelType;
    *((_QWORD *)result + 3) = self->_compression;
    *((_BYTE *)result + 8) = self->_preserveAlpha;
  }
  return result;
}

- (id)fileType
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
}

- (id)pixelFormat
{
  if (!self->_pixelType)
  {
    +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8");
    self = (NUImageExportFormatTIFF *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (int)depth
{
  return 8;
}

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initWithCapacity:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_compression);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CBD078]);

  v7 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBD090]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NUImageExportFormatTIFF depth](self, "depth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBCA08]);

}

- (int64_t)pixelType
{
  return self->_pixelType;
}

- (void)setPixelType:(int64_t)a3
{
  self->_pixelType = a3;
}

- (int64_t)compression
{
  return self->_compression;
}

- (void)setCompression:(int64_t)a3
{
  self->_compression = a3;
}

- (BOOL)preserveAlpha
{
  return self->_preserveAlpha;
}

- (void)setPreserveAlpha:(BOOL)a3
{
  self->_preserveAlpha = a3;
}

@end
