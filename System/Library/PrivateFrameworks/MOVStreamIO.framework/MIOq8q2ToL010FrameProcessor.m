@implementation MIOq8q2ToL010FrameProcessor

- (MIOq8q2ToL010FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  MIOq8q2ToL010FrameProcessor *v4;
  CMVideoDimensions Dimensions;
  const __CFDictionary *v6;
  opaqueCMFormatDescription *v7;
  CVPixelBufferRef texture;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MIOq8q2ToL010FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v10, sel_initWithInputFormatDescription_);
  if (v4)
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
    texture = 0;
    v11 = *MEMORY[0x24BDC5668];
    v12[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Dimensions.width, *(uint64_t *)&Dimensions >> 32, 0x4C303130u, v6, &texture);
    v7 = +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:](MOVStreamIOUtility, "createFormatDescriptionFromPixelBuffer:", texture);
    v4->_formatDescForEncoding = v7;
    CFRetain(v7);
    CVPixelBufferRelease(texture);
    -[MIOFrameProcessor setFormatDescriptionNeedsUpdate:](v4, "setFormatDescriptionNeedsUpdate:", 1);

  }
  return v4;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescForEncoding;
  objc_super v4;

  formatDescForEncoding = self->_formatDescForEncoding;
  if (formatDescForEncoding)
    CFRelease(formatDescForEncoding);
  v4.receiver = self;
  v4.super_class = (Class)MIOq8q2ToL010FrameProcessor;
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

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  id v8;
  size_t Width;
  size_t Height;
  MIOPixelBufferPool *pool;
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
  id *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[8];

  v36[6] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pool = self->_pool;
  if (!pool)
  {
    v35[0] = *MEMORY[0x24BDC5628];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)-((double)Width - ceil((double)Width * 0.015625) * 64.0));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v28;
    v35[1] = *MEMORY[0x24BDC5650];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Height);
    v30 = a5;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v29;
    v35[2] = *MEMORY[0x24BDC5668];
    v33 = *MEMORY[0x24BDD8E40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[MIOq8q2ToL010FrameProcessor bufferCacheMode](self, "bufferCacheMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDC56B8];
    v36[2] = v13;
    v36[3] = &unk_24CA5BC28;
    v15 = *MEMORY[0x24BDC5708];
    v35[3] = v14;
    v35[4] = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Width);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v16;
    v35[5] = *MEMORY[0x24BDC5610];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)-((double)Height - ceil((double)Height * 0.015625) * 64.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = *MEMORY[0x24BDC56F0];
    v32 = &unk_24CA5BC40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:]([MIOPixelBufferPool alloc], "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v18, v19, 0);
    v21 = self->_pool;
    self->_pool = v20;

    if (!self->_pool)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for q8q2 stream."), 19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v30)
        *v30 = objc_retainAutorelease(v25);

      goto LABEL_13;
    }

    pool = self->_pool;
    a5 = v30;
  }
  -[MIOPixelBufferPool flush](pool, "flush");
  v22 = -[MIOPixelBufferPool getPixelBuffer](self->_pool, "getPixelBuffer");
  if (!v22)
  {
    NSLog(CFSTR("Running out of buffers!"));
    __assert_rtn("-[MIOq8q2ToL010FrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOq8q2ToL010FrameProcessor.mm", 107, "0");
  }
  if (!+[MIOPixelBufferUtility transferq8q2PixelBuffer:toL010PixelBuffer:](MIOPixelBufferUtility, "transferq8q2PixelBuffer:toL010PixelBuffer:", a3, v22))
  {
    CVPixelBufferRelease(v22);
    CVPixelBufferRelease(a3);
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot convert q8q2 to L010 buffer."), 20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(v23);

LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  self->_formatDescForEncoding = -[MIOFrameProcessor updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:](self, "updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:", v22, self->_formatDescForEncoding);
LABEL_14:

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
