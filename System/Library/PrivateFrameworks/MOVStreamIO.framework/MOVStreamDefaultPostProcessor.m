@implementation MOVStreamDefaultPostProcessor

- (MOVStreamDefaultPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  MOVStreamDefaultPostProcessor *v6;
  MOVStreamDefaultPostProcessor *v7;
  MOVStreamDefaultPostProcessor *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)MOVStreamDefaultPostProcessor;
  v6 = -[MOVStreamDefaultPostProcessor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[MOVStreamDefaultPostProcessor setOriginalPixelFormat:](v6, "setOriginalPixelFormat:", v5);
    -[MOVStreamDefaultPostProcessor setBufferCacheMode:](v7, "setBufferCacheMode:", v4);
    v8 = v7;
  }

  return v7;
}

- (MOVStreamDefaultPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3
{
  uint64_t v3;
  MOVStreamDefaultPostProcessor *v4;
  MOVStreamDefaultPostProcessor *v5;
  MOVStreamDefaultPostProcessor *v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)MOVStreamDefaultPostProcessor;
  v4 = -[MOVStreamDefaultPostProcessor init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[MOVStreamDefaultPostProcessor setOriginalPixelFormat:](v4, "setOriginalPixelFormat:", v3);
    -[MOVStreamDefaultPostProcessor setBufferCacheMode:](v5, "setBufferCacheMode:", 0);
    v6 = v5;
  }

  return v5;
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  if (-[MOVStreamDefaultPostProcessor shouldRemovePaddingOfPixelBuffer:metadata:](self, "shouldRemovePaddingOfPixelBuffer:metadata:", a3, v8))
  {
    a3 = -[MOVStreamDefaultPostProcessor pixelBufferWithoutPaddingFromPixelBuffer:error:](self, "pixelBufferWithoutPaddingFromPixelBuffer:error:", a3, a5);
  }
  else if (-[MOVStreamDefaultPostProcessor shouldChangeBytesPerRowOfPixelBuffer:](self, "shouldChangeBytesPerRowOfPixelBuffer:", a3))
  {
    -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = -[MOVStreamDefaultPostProcessor pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:](self, "pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:", v9, a3, a5);

  }
  else
  {
    CVPixelBufferRetain(a3);
  }

  return a3;
}

- (void)dealloc
{
  MOVStreamFrameConverter *converter;
  objc_super v4;

  converter = self->_converter;
  self->_converter = 0;

  v4.receiver = self;
  v4.super_class = (Class)MOVStreamDefaultPostProcessor;
  -[MOVStreamDefaultPostProcessor dealloc](&v4, sel_dealloc);
}

- (unint64_t)minimumBytesPerRowForPixelBuffer:(__CVBuffer *)a3
{
  double BytesPerPixel;

  BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(a3);
  return (unint64_t)(BytesPerPixel * (double)CVPixelBufferGetWidth(a3));
}

- (BOOL)shouldChangeBytesPerRowOfPixelBuffer:(__CVBuffer *)a3
{
  void *v5;
  size_t PlaneCount;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  size_t v13;
  BOOL v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  char v22;
  NSObject *v23;
  uint8_t v25[16];
  uint8_t buf[16];

  -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_11;
  PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1)
    v7 = 1;
  else
    v7 = PlaneCount;
  -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 < v7)
    {
      v11 = +[MIOLog debugEnabled](MIOLog, "debugEnabled");
      if (!v11)
        return v11;
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_DEBUG, "ExactBytesPerRow count doesn't match pixel buffers plane count!", buf, 2u);
      }

LABEL_11:
      LOBYTE(v11) = 0;
      return v11;
    }
  }
  else
  {

  }
  v13 = 0;
  v14 = 1;
  while (1)
  {
    -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((isKindOfClass & 1) != 0)
    {
      v19 = objc_msgSend(v17, "unsignedIntegerValue");
      goto LABEL_18;
    }
    objc_opt_class();
    v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) == 0)
      break;
    -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v21, "unsignedIntegerValue");

LABEL_18:
    if (CVPixelBufferGetBytesPerRowOfPlane(a3, v13) == v19)
    {
      v14 = v7 > ++v13;
      if (v7 != v13)
        continue;
    }
    v22 = 1;
    goto LABEL_24;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_ERROR, "Invalid ExactBytesPerRow value type!", v25, 2u);
  }

  v22 = 0;
LABEL_24:
  LOBYTE(v11) = v14 & v22;
  return v11;
}

- (BOOL)shouldRemovePaddingOfPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4
{
  size_t v6;
  _BOOL4 v7;

  v6 = -[MOVStreamDefaultPostProcessor minimumBytesPerRowForPixelBuffer:](self, "minimumBytesPerRowForPixelBuffer:", a3, a4);
  v7 = -[MOVStreamDefaultPostProcessor removePadding](self, "removePadding");
  if (v7)
    LOBYTE(v7) = v6 < CVPixelBufferGetBytesPerRow(a3);
  return v7;
}

- (__CVBuffer)pixelBufferWithoutPaddingFromPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  MOVStreamFrameConverter *converter;
  size_t Width;
  size_t Height;
  MOVStreamFrameConverter *v9;
  MOVStreamFrameConverter *v10;

  converter = self->_converter;
  if (!converter)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v9 = -[MOVStreamFrameConverter initWithTargetWidth:height:format:bytesPerRow:bufferCacheMode:]([MOVStreamFrameConverter alloc], "initWithTargetWidth:height:format:bytesPerRow:bufferCacheMode:", Width, Height, CVPixelBufferGetPixelFormatType(a3), -[MOVStreamDefaultPostProcessor minimumBytesPerRowForPixelBuffer:](self, "minimumBytesPerRowForPixelBuffer:", a3), self->bufferCacheMode);
    v10 = self->_converter;
    self->_converter = v9;

    converter = self->_converter;
  }
  return -[MOVStreamFrameConverter convertPixelBuffer:](converter, "convertPixelBuffer:", a3, a4);
}

- (__CVBuffer)pixelBufferWithExactBytesPerRow:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  id v8;
  size_t Width;
  size_t Height;
  void *v11;
  char isKindOfClass;
  MOVStreamFrameConverter *v13;
  uint64_t PixelFormatType;
  void *v15;
  void *v16;
  MOVStreamFrameConverter *v17;
  MOVStreamFrameConverter *converter;
  void *v19;
  char v20;
  MOVStreamFrameConverter *v21;
  uint64_t v22;
  void *v23;
  MOVStreamFrameConverter *v24;
  MOVStreamFrameConverter *v25;
  __CVBuffer *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!self->_converter)
  {
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v13 = [MOVStreamFrameConverter alloc];
      PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
      -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MOVStreamFrameConverter initWithTargetWidth:height:format:bytesPerRows:bufferCacheMode:](v13, "initWithTargetWidth:height:format:bytesPerRows:bufferCacheMode:", Width, Height, PixelFormatType, v16, self->bufferCacheMode);
      converter = self->_converter;
      self->_converter = v17;

    }
    else
    {
      -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a5, CFSTR("Invalid ExactBytesPerRow value type!"), 19);
        v26 = 0;
        goto LABEL_7;
      }
      v21 = [MOVStreamFrameConverter alloc];
      v22 = CVPixelBufferGetPixelFormatType(a4);
      -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[MOVStreamFrameConverter initWithTargetWidth:height:format:bytesPerRows:bufferCacheMode:](v21, "initWithTargetWidth:height:format:bytesPerRows:bufferCacheMode:", Width, Height, v22, v23, self->bufferCacheMode);
      v25 = self->_converter;
      self->_converter = v24;

    }
  }
  v26 = -[MOVStreamFrameConverter convertPixelBuffer:](self->_converter, "convertPixelBuffer:", a4);
LABEL_7:

  return v26;
}

- (BOOL)removePadding
{
  return self->removePadding;
}

- (void)setRemovePadding:(BOOL)a3
{
  self->removePadding = a3;
}

- (id)exactBytesPerRow
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setExactBytesPerRow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unsigned)originalPixelFormat
{
  return self->originalPixelFormat;
}

- (void)setOriginalPixelFormat:(unsigned int)a3
{
  self->originalPixelFormat = a3;
}

- (int)bufferCacheMode
{
  return self->bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  self->bufferCacheMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->exactBytesPerRow, 0);
  objc_storeStrong((id *)&self->_converter, 0);
}

@end
