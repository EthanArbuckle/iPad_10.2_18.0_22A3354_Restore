@implementation MIOL010ToL010Stride16FrameProcessor

- (MIOL010ToL010Stride16FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  MIOL010ToL010Stride16FrameProcessor *v4;
  MIOL010ToL010Stride16FrameProcessor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MIOL010ToL010Stride16FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v7, sel_initWithInputFormatDescription_);
  v5 = v4;
  if (v4)
  {
    v4->_formatDescForEncoding = a3;
    CFRetain(a3);
    -[MIOFrameProcessor setFormatDescriptionNeedsUpdate:](v5, "setFormatDescriptionNeedsUpdate:", 1);
    v5->_needAlignment = 0;
    v5->_firstBufferProcessed = 0;
  }
  return v5;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescForEncoding;
  objc_super v4;

  formatDescForEncoding = self->_formatDescForEncoding;
  if (formatDescForEncoding)
    CFRelease(formatDescForEncoding);
  v4.receiver = self;
  v4.super_class = (Class)MIOL010ToL010Stride16FrameProcessor;
  -[MIOFrameProcessor dealloc](&v4, sel_dealloc);
}

- (unsigned)encodedPixelFormat
{
  return 1278226736;
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
  return self->_formatDescForEncoding;
}

- (BOOL)buffer:(__CVBuffer *)a3 needsAlignmentTo:(unint64_t)a4
{
  size_t Width;
  size_t Height;
  size_t v9;
  size_t extraColumnsOnRight;

  v9 = 0;
  extraColumnsOnRight = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, &extraColumnsOnRight, 0, &v9);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  return (extraColumnsOnRight + Width) % a4 || (v9 + Height) % a4 != 0;
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  BOOL v8;
  MIOPixelBufferPool *pool;
  size_t Width;
  size_t Height;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MIOPixelBufferPool *v20;
  MIOPixelBufferPool *v21;
  __CVBuffer *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[8];

  v36[6] = *MEMORY[0x24BDAC8D0];
  v30 = a4;
  if (!self->_firstBufferProcessed)
  {
    self->_firstBufferProcessed = 1;
    v8 = -[MIOL010ToL010Stride16FrameProcessor buffer:needsAlignmentTo:](self, "buffer:needsAlignmentTo:", a3, 16);
    self->_needAlignment = v8;
    if (!v8)
      -[MIOFrameProcessor setFormatDescriptionNeedsUpdate:](self, "setFormatDescriptionNeedsUpdate:", 0);
  }
  if (!self->_needAlignment)
  {
    v22 = +[MIOPixelBufferUtility newPixelBufferRefCopy:attachmentKeysToCopy:](PixelBufferUtility, "newPixelBufferRefCopy:attachmentKeysToCopy:", a3, v30);
    goto LABEL_19;
  }
  pool = self->_pool;
  if (!pool)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v35[0] = *MEMORY[0x24BDC5628];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)-((double)Width - ceil((double)Width * 0.0625) * 16.0));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v29;
    v35[1] = *MEMORY[0x24BDC5650];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Height);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v28;
    v35[2] = *MEMORY[0x24BDC5668];
    v33 = *MEMORY[0x24BDD8E40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[MIOL010ToL010Stride16FrameProcessor bufferCacheMode](self, "bufferCacheMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDC56B8];
    v36[2] = v13;
    v36[3] = &unk_24CA5BCB8;
    v15 = *MEMORY[0x24BDC5708];
    v35[3] = v14;
    v35[4] = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Width);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v16;
    v35[5] = *MEMORY[0x24BDC5610];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)-((double)Height - ceil((double)Height * 0.0625) * 16.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = *MEMORY[0x24BDC56F0];
    v32 = &unk_24CA5BCD0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:]([MIOPixelBufferPool alloc], "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v18, v19, 0);
    v21 = self->_pool;
    self->_pool = v20;

    if (!self->_pool)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for L010 stream."), 19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a5)
        *a5 = objc_retainAutorelease(v25);

      goto LABEL_18;
    }

    pool = self->_pool;
  }
  v22 = -[MIOPixelBufferPool getPixelBuffer](pool, "getPixelBuffer");
  if (!v22)
  {
    NSLog(CFSTR("Running out of buffers!"));
    __assert_rtn("-[MIOL010ToL010Stride16FrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOL010ToL010Stride16FrameProcessor.mm", 141, "0");
  }
  if (!+[MIOPixelBufferUtility copyPixelBuffer:toPixelBuffer:](MIOPixelBufferUtility, "copyPixelBuffer:toPixelBuffer:", a3, v22))
  {
    CVPixelBufferRelease(v22);
    CVPixelBufferRelease(a3);
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot copy L010 to L010 (stride) buffer."), 20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(v23);

LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  self->_formatDescForEncoding = -[MIOFrameProcessor updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:](self, "updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:", v22, self->_formatDescForEncoding);
LABEL_19:

  return v22;
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
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
