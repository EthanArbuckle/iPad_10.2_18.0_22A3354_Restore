@implementation FigCaptureSourceFormat

- (id)formatDictionary
{
  return (id)-[NSDictionary copy](self->_formatDictionary, "copy");
}

- (FigCaptureSourceFormat)initWithFigCaptureStreamFormatDictionary:(id)a3 pixelFormatOverride:(unsigned int)a4
{
  FigCaptureSourceFormat *v6;
  FigCaptureSourceFormat *v7;
  NSDictionary *v8;
  objc_super v10;

  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)FigCaptureSourceFormat;
    v6 = -[FigCaptureSourceFormat init](&v10, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_pixelFormatOverride = a4;
      v8 = (NSDictionary *)objc_msgSend(a3, "copy");
      v7->_formatDictionary = v8;
      if (!-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("Name")))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Format is missing FigCaptureSourceFormatKey_Name.")), 0));
      v7->_uniqueID = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%c%c%c%c"), -[NSDictionary objectForKeyedSubscript:](v7->_formatDictionary, "objectForKeyedSubscript:", CFSTR("Name")), -[FigCaptureSourceFormat format](v7, "format") >> 24, (-[FigCaptureSourceFormat format](v7, "format") >> 16), ((unsigned __int16)-[FigCaptureSourceFormat format](v7, "format") >> 8), -[FigCaptureSourceFormat format](v7, "format"));
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (unsigned)format
{
  if (self->_pixelFormatOverride)
    return self->_pixelFormatOverride;
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "unsignedIntValue");
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue") << 32));
}

- (FigCaptureSourceFormat)initWithFigCaptureStreamFormatDictionary:(id)a3
{
  return -[FigCaptureSourceFormat initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:](self, "initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceFormat;
  -[FigCaptureSourceFormat dealloc](&v3, sel_dealloc);
}

- (BOOL)isDefaultActiveFormat
{
  int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", CFSTR("DefaultActiveFormat")), "BOOLValue");
  if (v3)
    LOBYTE(v3) = self->_pixelFormatOverride == 0;
  return v3;
}

- (BOOL)isExperimental
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", CFSTR("Experimental")), "BOOLValue");
}

- (float)minSupportedFrameRate
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoMinFrameRate")), "floatValue");
  return result;
}

- (float)maxSupportedFrameRate
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoMaxFrameRate")), "floatValue");
  return result;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (opaqueCMFormatDescription)formatDescription
{
  $2825F4736939C4A6D3AD43837233062D v3;
  uint64_t v4;
  const __CFDictionary *v5;
  opaqueCMFormatDescription *result;
  CFTypeRef arg;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  arg = 0;
  v3 = -[FigCaptureSourceFormat dimensions](self, "dimensions");
  if (-[FigCaptureSourceFormat format](self, "format") == 1785950320)
  {
    v8[0] = *MEMORY[0x1E0CA4A58];
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureSourceFormat maxPoints](self, "maxPoints"));
    v8[1] = *MEMORY[0x1E0CA2240];
    v9[0] = v4;
    v9[1] = MEMORY[0x1E0C9AA70];
    v5 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], -[FigCaptureSourceFormat mediaType](self, "mediaType"), -[FigCaptureSourceFormat format](self, "format"), v5, (CMFormatDescriptionRef *)&arg);
  }
  else
  {
    CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], -[FigCaptureSourceFormat format](self, "format"), v3.var0, v3.var1, 0, (CMVideoFormatDescriptionRef *)&arg);
  }
  result = (opaqueCMFormatDescription *)arg;
  if (arg)
    return (opaqueCMFormatDescription *)CFAutorelease(arg);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NSDictionary *formatDictionary;

  if (a3 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || self->_pixelFormatOverride != *((_DWORD *)a3 + 6))
      return 0;
    formatDictionary = self->_formatDictionary;
    if (formatDictionary != *((NSDictionary **)a3 + 1))
      return -[NSDictionary isEqual:](formatDictionary, "isEqual:");
  }
  return 1;
}

- ($2825F4736939C4A6D3AD43837233062D)soleHighResStillImageDimensions
{
  NSArray *v2;

  v2 = -[FigCaptureSourceFormat highResStillImageDimensions](self, "highResStillImageDimensions");
  -[NSArray count](v2, "count");
  return ($2825F4736939C4A6D3AD43837233062D)objc_msgSend(-[NSArray firstObject](v2, "firstObject"), "dimensions");
}

- ($2825F4736939C4A6D3AD43837233062D)defaultHighResStillImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)objc_msgSend(-[NSArray firstObject](-[FigCaptureSourceFormat highResStillImageDimensions](self, "highResStillImageDimensions"), "firstObject"), "dimensions");
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), NSStringFromClass(v4), self, -[FigCaptureSourceFormat formatDescription](self, "formatDescription"));
}

- (unsigned)mediaType
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not supported on FigCaptureSourceFormat base class.")), 0));
}

- (int)maxPoints
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", CFSTR("MaxPoints")), "intValue");
}

- (NSArray)highResStillImageDimensions
{
  return self->_highResStillImageDimensions;
}

@end
