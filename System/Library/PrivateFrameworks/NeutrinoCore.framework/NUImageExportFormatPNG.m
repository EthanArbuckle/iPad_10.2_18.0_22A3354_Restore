@implementation NUImageExportFormatPNG

- (NUImageExportFormatPNG)init
{
  NUImageExportFormatPNG *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUImageExportFormatPNG;
  result = -[NUImageExportFormatPNG init](&v3, sel_init);
  result->_preserveAlpha = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
    *((_BYTE *)result + 8) = self->_preserveAlpha;
  return result;
}

- (id)fileType
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
}

- (id)pixelFormat
{
  return +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8");
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
