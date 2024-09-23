@implementation HMICameraVideoFrame

- (HMICameraVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x24BDC0D88];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  return -[HMICameraVideoFrame initWithPixelBuffer:presentationTime:frameId:fragmentSequenceNumber:](self, "initWithPixelBuffer:presentationTime:frameId:fragmentSequenceNumber:", a3, &v4, 0, 0);
}

- (HMICameraVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 frameId:(unint64_t)a5 fragmentSequenceNumber:(unint64_t)a6
{
  HMICameraVideoFrame *v10;
  int64_t var3;
  NSData *jpegData;
  CGFloat v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMICameraVideoFrame;
  v10 = -[HMICameraVideoFrame init](&v15, sel_init);
  if (v10)
  {
    v10->_pixelBuffer = CVPixelBufferRetain(a3);
    var3 = a4->var3;
    *(_OWORD *)&v10->_presentationTime.value = *(_OWORD *)&a4->var0;
    v10->_presentationTime.epoch = var3;
    v10->_frameId = a5;
    v10->_fragmentSequenceNumber = a6;
    jpegData = v10->_jpegData;
    v10->_jpegData = 0;

    v10->_size.width = HMICVPixelBufferGetSize(a3);
    v10->_size.height = v13;
  }
  return v10;
}

- (HMICameraVideoFrame)initWithJPEGData:(id)a3 presentationTime:(id *)a4 frameId:(unint64_t)a5 fragmentSequenceNumber:(unint64_t)a6 size:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  HMICameraVideoFrame *v15;
  HMICameraVideoFrame *v16;
  __int128 v17;
  objc_super v19;

  height = a7.height;
  width = a7.width;
  v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMICameraVideoFrame;
  v15 = -[HMICameraVideoFrame init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_pixelBuffer = 0;
    v17 = *(_OWORD *)&a4->var0;
    v15->_presentationTime.epoch = a4->var3;
    *(_OWORD *)&v15->_presentationTime.value = v17;
    v15->_frameId = a5;
    v15->_fragmentSequenceNumber = a6;
    objc_storeStrong((id *)&v15->_jpegData, a3);
    v16->_size.width = width;
    v16->_size.height = height;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)HMICameraVideoFrame;
  -[HMICameraVideoFrame dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  __CFString *v3;
  void *v4;
  CMTime time;

  -[HMICameraVideoFrame presentationTime](self, "presentationTime");
  v3 = (__CFString *)CMTimeCopyDescription(0, &time);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Frame %lu @ %@"), -[HMICameraVideoFrame frameId](self, "frameId"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_presentationTime, 24, 1, 0);
  return result;
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

- (unint64_t)frameId
{
  return self->_frameId;
}

- (unint64_t)fragmentSequenceNumber
{
  return self->_fragmentSequenceNumber;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (NSData)jpegData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMotionDetections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_jpegData, 0);
}

- (HMICameraVideoFrame)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __IOSurface *v7;
  HMICameraVideoFrame *v8;
  void *v9;
  unint64_t v10;
  int v11;
  __int128 v13;
  uint64_t v14;
  CVPixelBufferRef pixelBufferOut;
  __int128 v16;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMICVF.fi"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMICVF.fsn"));
  v16 = 0uLL;
  v17 = 0;
  if (v4)
    objc_msgSend(v4, "decodeCMTimeForKey:", CFSTR("HMICVF.pt"));
  pixelBufferOut = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMICVF.pb"));
  v7 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, 0, &pixelBufferOut);
    v13 = v16;
    v14 = v17;
    v8 = -[HMICameraVideoFrame initWithPixelBuffer:presentationTime:frameId:fragmentSequenceNumber:](self, "initWithPixelBuffer:presentationTime:frameId:fragmentSequenceNumber:", pixelBufferOut, &v13, v5, v6);
    if (pixelBufferOut)
      CFRelease(pixelBufferOut);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMICVF.jd"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("HMICVF.jsw"));
    v11 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("HMICVF.jsh"));
    v13 = v16;
    v14 = v17;
    v8 = -[HMICameraVideoFrame initWithJPEGData:presentationTime:frameId:fragmentSequenceNumber:size:](self, "initWithJPEGData:presentationTime:frameId:fragmentSequenceNumber:size:", v9, &v13, v5, v6, (double)v10, (double)(unint64_t)v11);

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  _BYTE v11[24];

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMICameraVideoFrame frameId](self, "frameId"), CFSTR("HMICVF.fi"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMICameraVideoFrame fragmentSequenceNumber](self, "fragmentSequenceNumber"), CFSTR("HMICVF.fsn"));
  -[HMICameraVideoFrame presentationTime](self, "presentationTime");
  objc_msgSend(v4, "encodeCMTime:forKey:", v11, CFSTR("HMICVF.pt"));
  if (-[HMICameraVideoFrame pixelBuffer](self, "pixelBuffer"))
  {
    CVPixelBufferGetIOSurface(-[HMICameraVideoFrame pixelBuffer](self, "pixelBuffer"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("HMICameraVideoFrame pixel buffer is not backed by an IOSurface"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    v6 = (void *)v5;
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMICVF.pb"));

  }
  else
  {
    -[HMICameraVideoFrame jpegData](self, "jpegData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMICVF.jd"));

    -[HMICameraVideoFrame size](self, "size");
    objc_msgSend(v4, "encodeInteger:forKey:", (uint64_t)v8, CFSTR("HMICVF.jsw"));
    -[HMICameraVideoFrame size](self, "size");
    objc_msgSend(v4, "encodeInteger:forKey:", (uint64_t)v9, CFSTR("HMICVF.jsh"));
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  HMICameraVideoFrame *v4;
  HMICameraVideoFrame *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  CMTime v24;
  CMTime time1;

  v4 = (HMICameraVideoFrame *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HMICameraVideoFrame frameId](self, "frameId");
      v7 = -[HMICameraVideoFrame frameId](v5, "frameId");
      v8 = -[HMICameraVideoFrame fragmentSequenceNumber](self, "fragmentSequenceNumber");
      v9 = -[HMICameraVideoFrame fragmentSequenceNumber](v5, "fragmentSequenceNumber");
      -[HMICameraVideoFrame size](self, "size");
      v11 = v10;
      -[HMICameraVideoFrame size](v5, "size");
      v13 = v12;
      -[HMICameraVideoFrame size](self, "size");
      v15 = v14;
      -[HMICameraVideoFrame size](v5, "size");
      v17 = 0;
      if (v6 == v7 && v8 == v9 && v11 == v13 && v15 == v16)
      {
        -[HMICameraVideoFrame jpegData](self, "jpegData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

        }
        else
        {
          -[HMICameraVideoFrame jpegData](v5, "jpegData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
LABEL_13:
            -[HMICameraVideoFrame presentationTime](self, "presentationTime");
            if (v5)
              -[HMICameraVideoFrame presentationTime](v5, "presentationTime");
            else
              memset(&v24, 0, sizeof(v24));
            v17 = CMTimeCompare(&time1, &v24) == 0;
            goto LABEL_18;
          }
        }
        -[HMICameraVideoFrame jpegData](self, "jpegData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMICameraVideoFrame jpegData](v5, "jpegData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToData:", v21);

        if (v22)
          goto LABEL_13;
        v17 = 0;
      }
LABEL_18:

      goto LABEL_19;
    }
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  long double v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v29[3];

  v3 = -[HMICameraVideoFrame frameId](self, "frameId");
  v4 = -[HMICameraVideoFrame fragmentSequenceNumber](self, "fragmentSequenceNumber");
  -[HMICameraVideoFrame presentationTime](self, "presentationTime");
  v5 = HMIHashCMTime(v29);
  -[HMICameraVideoFrame size](self, "size");
  v7 = -v6;
  if (v6 >= 0.0)
    v7 = v6;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = fmod(v8, 1.84467441e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0)
    v14 = v13;
  else
    v14 = v12;
  -[HMICameraVideoFrame size](self, "size");
  if (v15 < 0.0)
    v15 = -v15;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = fmod(v16, 1.84467441e19);
  v19 = 2654435761u * (unint64_t)v18;
  v20 = v19 + (unint64_t)v17;
  if (v17 <= 0.0)
    v20 = 2654435761u * (unint64_t)v18;
  v21 = v19 - (unint64_t)fabs(v17);
  if (v17 >= 0.0)
    v21 = v20;
  if (v3 >= 0)
    v22 = v3;
  else
    v22 = -v3;
  v23 = 2654435761 * v22;
  if (v4 >= 0)
    v24 = v4;
  else
    v24 = -v4;
  v25 = (2654435761 * v24) ^ v23 ^ v21 ^ v5 ^ v14;
  -[HMICameraVideoFrame jpegData](self, "jpegData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25 ^ objc_msgSend(v26, "hash");

  return v27;
}

@end
