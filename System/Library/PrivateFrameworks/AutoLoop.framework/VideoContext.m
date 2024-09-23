@implementation VideoContext

- (VideoContext)initWithWriter:(id)a3 pixelFormatFlags:(unsigned int)a4 colorManagement:(BOOL)a5
{
  id v9;
  VideoContext *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CIContext *ciCtx;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VideoContext;
  v10 = -[VideoContext init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99E08]);
    v19 = *MEMORY[0x1E0C9DF58];
    v20[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithDictionary:", v12);

    if (!a5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9DFC0]);

    }
    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    ciCtx = v10->ciCtx;
    v10->ciCtx = (CIContext *)v15;

    objc_storeStrong((id *)&v10->writer, a3);
    v10->pixelFormatFlags = a4;
    v10->_colorManagement = a5;

  }
  return v10;
}

- (VideoContext)initWithWriter:(id)a3 pixelFormatFlags:(unsigned int)a4
{
  return -[VideoContext initWithWriter:pixelFormatFlags:colorManagement:](self, "initWithWriter:pixelFormatFlags:colorManagement:", a3, *(_QWORD *)&a4, 0);
}

- (__CVBuffer)createPixelBuffer:(unint64_t)a3 height:(unint64_t)a4
{
  VideoWriter *writer;
  NSDictionary *pixelAttrs;
  unsigned int pixelFormat;
  NSDictionary *v10;
  NSDictionary *v11;
  uint64_t v12;
  CVPixelBufferRef pixelBufferOut;

  writer = self->writer;
  if (writer)
    return (__CVBuffer *)MEMORY[0x1E0DE7D20](writer, sel_createPixelBuffer);
  pixelAttrs = self->pixelAttrs;
  if (pixelAttrs)
  {
    pixelFormat = self->pixelFormat;
  }
  else
  {
    sub_1D4C877D4(self->pixelFormatFlags, 0);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->pixelAttrs;
    self->pixelAttrs = v10;

    if (!self->pixelAttrs)
    {
      NSLog(CFSTR("***createPixelBuffer: internal error creating pixel attr dictionary"));
      return 0;
    }
    pixelFormat = sub_1D4C88588(self->pixelFormatFlags);
    self->pixelFormat = pixelFormat;
    pixelAttrs = self->pixelAttrs;
  }
  pixelBufferOut = 0;
  v12 = CVPixelBufferCreate(0, a3, a4, pixelFormat, (CFDictionaryRef)pixelAttrs, &pixelBufferOut);
  if (!(_DWORD)v12)
    return pixelBufferOut;
  NSLog(CFSTR("***CVPixelBufferCreate error (%d)"), v12);
  return 0;
}

- (__CVBuffer)createPixelBuffer
{
  VideoWriter *writer;

  writer = self->writer;
  if (writer)
    return (__CVBuffer *)MEMORY[0x1E0DE7D20](writer, sel_createPixelBuffer);
  NSLog(CFSTR("***VideoContext error: createPixelBuffer with no VideoWriter"), a2);
  return 0;
}

- (__CVBuffer)pixelBufferFromImage:(id)a3 withAttachFrom:(__CVBuffer *)a4
{
  id v6;
  double v7;
  double v8;
  __CVBuffer *v9;

  v6 = a3;
  objc_msgSend(v6, "extent");
  v9 = -[VideoContext createPixelBuffer:height:](self, "createPixelBuffer:height:", (unint64_t)v7, (unint64_t)v8);
  if (v9)
  {
    if (a4)
      CVBufferPropagateAttachments(a4, v9);
    -[CIContext render:toCVPixelBuffer:](self->ciCtx, "render:toCVPixelBuffer:", v6, v9);
  }
  else
  {
    NSLog(CFSTR("***Error obtaining pixel buffer"));
  }

  return v9;
}

- (__CVBuffer)pixelBufferFromImage:(id)a3
{
  return -[VideoContext pixelBufferFromImage:withAttachFrom:](self, "pixelBufferFromImage:withAttachFrom:", a3, 0);
}

- (BOOL)pixelBuffer:(__CVBuffer *)a3 conformsToImage:(id)a4
{
  id v5;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  unint64_t v8;
  double v9;
  double v10;
  BOOL v11;

  v5 = a4;
  if (CVPixelBufferIsPlanar(a3))
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  }
  else
  {
    WidthOfPlane = CVPixelBufferGetWidth(a3);
    HeightOfPlane = CVPixelBufferGetHeight(a3);
  }
  v8 = HeightOfPlane;
  objc_msgSend(v5, "extent");
  if (v9 == (double)WidthOfPlane)
  {
    objc_msgSend(v5, "extent");
    v11 = v10 == (double)v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int)appendFrame:(id)a3 frameTime:(id *)a4 srcPixBuf:(__CVBuffer *)a5
{
  id v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  VideoWriter *writer;
  uint64_t v12;
  void *v13;
  int v14;
  __int128 v16;
  int64_t var3;

  v8 = a3;
  if (self->_colorManagement)
    v9 = -[VideoContext pixelBufferFromImage:withAttachFrom:](self, "pixelBufferFromImage:withAttachFrom:", v8, a5);
  else
    v9 = -[VideoContext pixelBufferFromImage:](self, "pixelBufferFromImage:", v8);
  v10 = v9;
  if (v9)
  {
    if (a5 && !self->_colorManagement)
      CVBufferPropagateAttachments(a5, v9);
    writer = self->writer;
    v16 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[VideoWriter addFrameAsPixelBuf:atFrameTime:](writer, "addFrameAsPixelBuf:atFrameTime:", v10, &v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      NSLog(CFSTR("[VideoContext appendFrame:]: error appending image: %@"), v12);
      v14 = -1;
    }
    else
    {
      v14 = 0;
    }
    CFRelease(v10);

  }
  else
  {
    NSLog(CFSTR("[VideoContext appendFrame:] error convering CIImage to CVPixelBufferRef"));
    v14 = -1;
  }

  return v14;
}

- (CIContext)ciCtx
{
  return (CIContext *)objc_getProperty(self, a2, 24, 1);
}

- (VideoWriter)writer
{
  return (VideoWriter *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)pixelFormatFlags
{
  return self->pixelFormatFlags;
}

- (NSDictionary)pixelAttrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)pixelFormat
{
  return self->pixelFormat;
}

- (BOOL)colorManagement
{
  return self->_colorManagement;
}

- (void)setColorManagement:(BOOL)a3
{
  self->_colorManagement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pixelAttrs, 0);
  objc_storeStrong((id *)&self->writer, 0);
  objc_storeStrong((id *)&self->ciCtx, 0);
}

@end
