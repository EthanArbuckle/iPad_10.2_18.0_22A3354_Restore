@implementation HMIVideoFrame

- (HMIVideoFrame)initWithJPEGData:(id)a3 size:(CGSize)a4 presentationTimeStamp:(id *)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  void *v11;
  HMIVideoFrame *v12;
  HMIVideoFrame *v13;
  int64_t var3;
  HMIVideoFrame *v16;
  SEL v17;
  __CVBuffer *v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v19;
  objc_super v20;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  if (v10)
  {
    v11 = v10;
    v20.receiver = self;
    v20.super_class = (Class)HMIVideoFrame;
    v12 = -[HMIVideoFrame init](&v20, sel_init);
    v13 = v12;
    if (v12)
    {
      var3 = a5->var3;
      *(_OWORD *)&v12->_presentationTimeStamp.value = *(_OWORD *)&a5->var0;
      v12->_presentationTimeStamp.epoch = var3;
      objc_storeStrong((id *)&v12->_data, a3);
      v13->_size.width = width;
      v13->_size.height = height;
      v13->_store = 1;
    }

    return v13;
  }
  else
  {
    v16 = (HMIVideoFrame *)_HMFPreconditionFailure();
    return -[HMIVideoFrame initWithPixelBuffer:presentationTimeStamp:](v16, v17, v18, v19);
  }
}

- (HMIVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4
{
  HMIVideoFrame *v6;
  HMIVideoFrame *v7;
  int64_t var3;
  CGFloat v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMIVideoFrame;
  v6 = -[HMIVideoFrame init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    var3 = a4->var3;
    *(_OWORD *)&v6->_presentationTimeStamp.value = *(_OWORD *)&a4->var0;
    v6->_presentationTimeStamp.epoch = var3;
    v6->_size.width = HMICVPixelBufferGetSize(a3);
    v7->_size.height = v9;
    v7->_pixelBuffer = (__CVBuffer *)CFRetain(a3);
    v7->_store = 0;
  }
  return v7;
}

- (HMIVideoFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer;
  CMTime v7;

  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CMSampleBufferGetPresentationTimeStamp(&v7, a3);
  return -[HMIVideoFrame initWithPixelBuffer:presentationTimeStamp:](self, "initWithPixelBuffer:presentationTimeStamp:", ImageBuffer, &v7);
}

- (id)redactedCopy
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _BYTE v11[24];

  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFrame size](self, "size");
  v6 = v5;
  v8 = v7;
  -[HMIVideoFrame presentationTimeStamp](self, "presentationTimeStamp");
  v9 = (void *)objc_msgSend(v3, "initWithJPEGData:size:presentationTimeStamp:", v4, v11, v6, v8);

  return v9;
}

- (id)base64Encoded
{
  void *v2;
  void *v3;

  -[HMIVideoFrame data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)compressedFrameWithScale:(double)a3 quality:(double)a4 error:(id *)a5
{
  void *v5;
  double v7;
  BOOL v8;
  double v9;
  int64_t store;
  void *v14;
  double Size;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v22;
  void *v23;
  HMIVideoFrame *v24;
  double height;
  double v26;
  double v27;
  id v28;
  NSData *data;
  HMIVideoFrame *v31;
  SEL v32;
  id *v33;
  CGAffineTransform v34;
  __int128 v35;
  int64_t epoch;
  CGAffineTransform v37;

  v8 = a3 <= 0.0;
  v7 = 1.0;
  v8 = v8 || a3 > 1.0;
  if (v8)
  {
    _HMFPreconditionFailure();
  }
  else
  {
    v9 = a4;
    if (a4 > 0.0 && a4 <= 1.0)
    {
      store = self->_store;
      if (store != 1)
      {
        if (!store)
        {
          *(float *)&v7 = a3;
          *(float *)&a4 = a4;
          +[HMIVisionUtilities createJPEGDataFromPixelBuffer:scale:encodeQuality:error:](HMIVisionUtilities, "createJPEGDataFromPixelBuffer:scale:encodeQuality:error:", self->_pixelBuffer, a5, v7, a4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            Size = HMICVPixelBufferGetSize(self->_pixelBuffer);
            v17 = v16;
            CGAffineTransformMakeScale(&v37, a3, a3);
            v18 = v17 * v37.c + v37.a * Size;
            v19 = v17 * v37.d + v37.b * Size;
            v20 = objc_alloc((Class)objc_opt_class());
            v35 = *(_OWORD *)&self->_presentationTimeStamp.value;
            epoch = self->_presentationTimeStamp.epoch;
            v5 = (void *)objc_msgSend(v20, "initWithJPEGData:size:presentationTimeStamp:", v14, &v35, v18, v19);
          }
          else
          {
            v5 = 0;
          }

        }
        return v5;
      }
      if (a3 == 1.0 && a4 == 1.0)
      {
        v24 = self;
      }
      else
      {
        if (-[NSData length](self->_data, "length"))
        {
          -[HMIVideoFrame pixelBufferFrameWithError:](self, "pixelBufferFrameWithError:", a5);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "compressedFrameWithScale:quality:error:", a5, a3, v9);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v5 = 0;
          }

          return v5;
        }
        CGAffineTransformMakeScale(&v34, a3, a3);
        height = self->_size.height;
        v26 = height * v34.c + v34.a * self->_size.width;
        v27 = height * v34.d + v34.b * self->_size.width;
        v28 = objc_alloc((Class)objc_opt_class());
        data = self->_data;
        v35 = *(_OWORD *)&self->_presentationTimeStamp.value;
        epoch = self->_presentationTimeStamp.epoch;
        v24 = (HMIVideoFrame *)objc_msgSend(v28, "initWithJPEGData:size:presentationTimeStamp:", data, &v35, v26, v27);
      }
      v5 = v24;
      return v5;
    }
  }
  v31 = (HMIVideoFrame *)_HMFPreconditionFailure();
  return -[HMIVideoFrame pixelBufferFrameWithError:](v31, v32, v33);
}

- (id)pixelBufferFrameWithError:(id *)a3
{
  __CVBuffer *v6;
  __CVBuffer *v7;
  id v8;
  void *v9;
  _BYTE v10[24];

  if (-[HMIVideoFrame pixelBuffer](self, "pixelBuffer"))
    return self;
  v6 = +[HMIVisionUtilities createPixelBufferFromImageData:error:](HMIVisionUtilities, "createPixelBufferFromImageData:error:", self->_data, a3);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = objc_alloc((Class)objc_opt_class());
  -[HMIVideoFrame presentationTimeStamp](self, "presentationTimeStamp");
  v9 = (void *)objc_msgSend(v8, "initWithPixelBuffer:presentationTimeStamp:", v7, v10);
  CVPixelBufferRelease(v7);
  return v9;
}

- (NSData)data
{
  NSData *data;
  void *v4;
  id v5;
  void *v6;
  NSData *v7;
  NSData *v8;
  id v10;
  id v11;

  data = self->_data;
  if (!data)
  {
    v11 = 0;
    -[HMIVideoFrame compressedFrameWithScale:quality:error:](self, "compressedFrameWithScale:quality:error:", &v11, 1.0, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("HMIVideoFrame failed to create compressed representation."), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    v6 = v5;
    objc_msgSend(v4, "data");
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    v8 = self->_data;
    self->_data = v7;

    data = self->_data;
  }
  return data;
}

- (void)printWithHeight:(unint64_t)a3
{
  double v4;
  double v5;

  v4 = (double)a3;
  -[HMIVideoFrame size](self, "size");
  -[HMIVideoFrame printWithScale:](self, "printWithScale:", v4 / v5);
}

- (void)printWithScale:(double)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FILE *v8;
  id v9;
  id v10;

  -[HMIVideoFrame compressedFrameWithScale:quality:error:](self, "compressedFrameWithScale:quality:error:", 0, fmax(fmin(a3, 1.0), 0.1), 1.0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v10, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedDataWithOptions:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithData:encoding:", v5, 4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\x1B]1337;File=inline=1;preserveAspectRatio=1:%@\a"),
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (FILE *)*MEMORY[0x24BDAC8E8];
  v9 = objc_retainAutorelease(v7);
  fprintf(v8, "%s\n", (const char *)objc_msgSend(v9, "UTF8String"));

}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    CFRelease(pixelBuffer);
  v4.receiver = self;
  v4.super_class = (Class)HMIVideoFrame;
  -[HMIVideoFrame dealloc](&v4, sel_dealloc);
}

- (id)attributeDescriptions
{
  __CFString *v3;
  objc_class *v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  $95D729B680665BEAEFA1D6FCA8238556 presentationTimeStamp;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  if (self->_store == 1)
    v3 = CFSTR("Data (JPEG)");
  else
    v3 = CFSTR("CVPixelBuffer");
  v4 = (objc_class *)MEMORY[0x24BE3F140];
  v5 = v3;
  v6 = [v4 alloc];
  presentationTimeStamp = self->_presentationTimeStamp;
  HMICMTimeDescription((CMTime *)&presentationTimeStamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Presentation Time Stamp"), v7);
  v16[0] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  HMICGSizeDescription(self->_size.width, self->_size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Size"), v10);
  v16[1] = v11;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("Store"), v5);

  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoFrame)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __IOSurface *v8;
  HMIVideoFrame *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  uint64_t v20;
  CVPixelBufferRef pixelBufferOut;
  __int128 v22;
  uint64_t v23;

  v4 = a3;
  v22 = 0uLL;
  v23 = 0;
  NSStringFromSelector(sel_presentationTimeStamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "decodeCMTimeForKey:", v5);
  }
  else
  {
    v22 = 0uLL;
    v23 = 0;
  }

  v6 = objc_opt_class();
  NSStringFromSelector(sel_surface);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = (__IOSurface *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    pixelBufferOut = 0;
    CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, 0, &pixelBufferOut);
    v19 = v22;
    v20 = v23;
    v9 = -[HMIVideoFrame initWithPixelBuffer:presentationTimeStamp:](self, "initWithPixelBuffer:presentationTimeStamp:", pixelBufferOut, &v19);
    if (pixelBufferOut)
      CFRelease(pixelBufferOut);
  }
  else
  {
    v10 = objc_opt_class();
    NSStringFromSelector(sel_data);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_size);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeSizeForKey:", v13);
    v15 = v14;
    v17 = v16;

    v19 = v22;
    v20 = v23;
    v9 = -[HMIVideoFrame initWithJPEGData:size:presentationTimeStamp:](self, "initWithJPEGData:size:presentationTimeStamp:", v12, &v19, v15, v17);

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  int64_t store;
  uint64_t v7;
  void *v8;
  void *v9;
  NSData *data;
  void *v11;
  double width;
  double height;
  id v14;
  $95D729B680665BEAEFA1D6FCA8238556 presentationTimeStamp;

  v4 = a3;
  NSStringFromSelector(sel_presentationTimeStamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  presentationTimeStamp = self->_presentationTimeStamp;
  objc_msgSend(v4, "encodeCMTime:forKey:", &presentationTimeStamp, v5);

  store = self->_store;
  if (store == 1)
  {
    data = self->_data;
    NSStringFromSelector(sel_data);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", data, v11);

    width = self->_size.width;
    height = self->_size.height;
    NSStringFromSelector(sel_size);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeSize:forKey:", v8, width, height);
LABEL_6:

    goto LABEL_7;
  }
  if (!store)
  {
    CVPixelBufferGetIOSurface(self->_pixelBuffer);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("HMIVideoFrame pixel buffer is not backed by an IOSurface"), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    v8 = (void *)v7;
    NSStringFromSelector(sel_surface);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, v9);

    goto LABEL_6;
  }
LABEL_7:

}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_presentationTimeStamp, 24, 1, 0);
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
