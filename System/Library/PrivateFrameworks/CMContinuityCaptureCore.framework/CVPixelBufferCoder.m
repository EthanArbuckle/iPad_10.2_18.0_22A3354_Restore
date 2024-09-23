@implementation CVPixelBufferCoder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CFRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVPixelBufferCoder;
  -[CVPixelBufferCoder dealloc](&v4, sel_dealloc);
}

- (CVPixelBufferCoder)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferCoder *v4;
  CVPixelBufferCoder *v5;
  CVPixelBufferCoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CVPixelBufferCoder;
  v4 = -[CVPixelBufferCoder init](&v8, sel_init);
  v5 = v4;
  v6 = 0;
  if (a3 && v4)
  {
    v4->_pixelBuffer = (__CVBuffer *)CFRetain(a3);
    v5->_transferSourceMedia = 1;
    v6 = v5;
  }

  return v6;
}

- (CVPixelBufferCoder)initWithCoder:(id)a3
{
  id v4;
  CVPixelBufferCoder *v5;
  CVPixelBufferCoder *v6;
  uint64_t v7;
  NSString *mediaName;
  void *v9;
  void *v10;
  CVPixelBufferCoder *v11;
  id v12;
  void *v13;
  const __CFDictionary *v14;
  size_t v15;
  size_t v16;
  OSType v17;
  uint64_t v18;
  id v19;
  void *v20;
  unint64_t v21;
  size_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  size_t v30;
  char *v31;
  size_t v32;
  const __CFDictionary *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  size_t dataLength;
  CMBlockBufferRef blockBufferOut;
  CVPixelBufferRef pixelBufferOut;
  objc_super v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CVPixelBufferCoder;
  v5 = -[CVPixelBufferCoder init](&v42, sel_init);
  if (!v5)
  {
    v11 = 0;
    goto LABEL_38;
  }
  v6 = v5;
  blockBufferOut = 0;
  pixelBufferOut = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PixelBufferSourceMediaName"));
  v7 = objc_claimAutoreleasedReturnValue();
  mediaName = v6->_mediaName;
  v6->_mediaName = (NSString *)v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PixelBufferSourceMedia"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_pixelBuffer = -[CVPixelBufferCoder _createPixelBufferForImage:fillWidth:fillHeight:](v6, "_createPixelBufferForImage:fillWidth:fillHeight:", v10, 1920, 1080);

    v6->_transferSourceMedia = 1;
  }
  else
  {
    v6->_transferSourceMedia = 0;
    dataLength = 0;
    v12 = objc_retainAutorelease(v4);
    v13 = (void *)objc_msgSend(v12, "decodeBytesForKey:returnedLength:", CFSTR("PixelBufferAtomData"), &dataLength);
    if (v13)
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], v13, dataLength, (CFAllocatorRef)*MEMORY[0x24BDBD258], 0, 0, dataLength, 0, &blockBufferOut)|| FigRemote_CreatePixelBufferFromSerializedAtomDataBlockBuffer())
      {
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", pixelBufferOut);
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v6->_pixelBuffer = -[CVPixelBufferCoder _createPixelBufferForImage:fillWidth:fillHeight:](v6, "_createPixelBufferForImage:fillWidth:fillHeight:", v14, 1920, 1080);
    }
    else
    {
      v15 = objc_msgSend(v12, "decodeInt64ForKey:", CFSTR("PixelBufferWidth"));
      v16 = objc_msgSend(v12, "decodeInt64ForKey:", CFSTR("PixelBufferHeight"));
      v17 = objc_msgSend(v12, "decodeInt32ForKey:", CFSTR("PixelBufferFormat"));
      v18 = *MEMORY[0x24BDC5668];
      v43[0] = *MEMORY[0x24BDC5660];
      v43[1] = v18;
      v44[0] = MEMORY[0x24BDBD1C8];
      v44[1] = MEMORY[0x24BDBD1B8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v15, v16, v17, v14, &pixelBufferOut))
      {
        if (pixelBufferOut)
        {
          CFRelease(pixelBufferOut);
          pixelBufferOut = 0;
        }
      }
      else if (pixelBufferOut)
      {
        v34 = v14;
        v35 = v4;
        v38 = 0;
        v19 = objc_retainAutorelease(v12);
        v36 = objc_msgSend(v19, "decodeBytesForKey:returnedLength:", CFSTR("PixelBufferData"), &v38);
        if (v36)
        {
          v37 = v38;
          if (v38)
          {
            objc_msgSend(v19, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PixelBufferLayout"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (unint64_t)objc_msgSend(v20, "count") >> 1;
            if (CVPixelBufferGetPlaneCount(pixelBufferOut) == (int)v21)
            {
              CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
              if (CVPixelBufferGetPlaneCount(pixelBufferOut))
              {
                v22 = 0;
                while (1)
                {
                  objc_msgSend(v20, "objectAtIndexedSubscript:", 2 * v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "unsignedIntegerValue");

                  objc_msgSend(v20, "objectAtIndexedSubscript:", (2 * v22) | 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "unsignedIntegerValue");

                  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, v22);
                  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, v22);
                  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, v22);
                  if (v24 < 1)
                    break;
                  if (v24 > v37)
                    break;
                  v30 = HeightOfPlane;
                  v31 = (char *)(v36 + v24);
                  if ((unint64_t)&v31[HeightOfPlane * v26] > v36 + v37)
                    break;
                  if (v26 == BytesPerRowOfPlane)
                  {
                    memcpy(BaseAddressOfPlane, v31, HeightOfPlane * v26);
                  }
                  else
                  {
                    if (v26 >= BytesPerRowOfPlane)
                      v32 = BytesPerRowOfPlane;
                    else
                      v32 = v26;
                    if (HeightOfPlane)
                    {
                      do
                      {
                        memcpy(BaseAddressOfPlane, v31, v32);
                        BaseAddressOfPlane += BytesPerRowOfPlane;
                        v31 += v26;
                        --v30;
                      }
                      while (v30);
                    }
                  }
                  if (CVPixelBufferGetPlaneCount(pixelBufferOut) <= ++v22)
                    goto LABEL_27;
                }
              }
              else
              {
LABEL_27:
                CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
                v6->_pixelBuffer = pixelBufferOut;
                pixelBufferOut = 0;
              }
            }

          }
        }
        v9 = 0;
        v4 = v35;
        v14 = v34;
      }
    }

  }
LABEL_31:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (!v6->_pixelBuffer)
  {

    v6 = 0;
  }
  v11 = v6;

LABEL_38:
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *mediaName;
  NSString *v8;
  void *v9;
  void *v10;
  const __CFAllocator *v11;
  int IsRangeContiguous;
  OpaqueCMBlockBuffer *v13;
  size_t v14;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;
  CMBlockBufferRef theBuffer;

  v4 = a3;
  CMGetAttachment(self->_pixelBuffer, CFSTR("preference-image-url"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  mediaName = self->_mediaName;
  if (mediaName)
  {
    v8 = mediaName;
LABEL_4:
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("PixelBufferSourceMediaName"));
    goto LABEL_5;
  }
  objc_msgSend(v5, "lastPathComponent");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_4;
LABEL_5:
  if (self->_transferSourceMedia && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "length"))
    {
      objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("PixelBufferSourceMedia"));

      goto LABEL_21;
    }

  }
  theBuffer = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!FigRemote_CreateSerializedAtomDataBlockBufferForPixelBuffer())
  {
    IsRangeContiguous = CMBlockBufferIsRangeContiguous(theBuffer, 0, 0);
    v13 = theBuffer;
    if (IsRangeContiguous)
    {
LABEL_17:
      v14 = 0;
      dataPointerOut = 0;
      if (!CMBlockBufferGetDataPointer(v13, 0, 0, &v14, &dataPointerOut))
        objc_msgSend(v4, "encodeBytes:length:forKey:", dataPointerOut, v14, CFSTR("PixelBufferAtomData"));
      goto LABEL_19;
    }
    blockBufferOut = 0;
    if (!CMBlockBufferCreateContiguous(v11, theBuffer, v11, 0, 0, 0, 0, &blockBufferOut))
    {
      if (theBuffer)
        CFRelease(theBuffer);
      v13 = blockBufferOut;
      theBuffer = blockBufferOut;
      goto LABEL_17;
    }
  }
LABEL_19:
  if (theBuffer)
    CFRelease(theBuffer);
LABEL_21:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__CVBuffer)_createPixelBufferForImage:(id)a3 fillWidth:(int64_t)a4 fillHeight:(int64_t)a5
{
  __CVBuffer *v7;
  __CVBuffer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __CVBuffer *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  CVReturn v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFDictionary *v24;
  void *v25;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v7 = (__CVBuffer *)a3;
  v8 = v7;
  pixelBufferOut = 0;
  if (!v7)
    goto LABEL_11;
  -[__CVBuffer extent](v7, "extent");
  v10 = v9;
  -[__CVBuffer extent](v8, "extent");
  v12 = v11;
  v13 = (double)a5 / v10;
  if ((double)a4 / v12 >= v13)
    v13 = (double)a4 / v12;
  if (v13 >= 1.0)
    goto LABEL_6;
  v14 = round(v10 * v13 * 0.5);
  v10 = v14 + v14;
  v15 = round(v12 * v13 * 0.5);
  v12 = v15 + v15;
  *(_QWORD *)&v16 = -1;
  *((_QWORD *)&v16 + 1) = -1;
  *(_OWORD *)&v28.c = v16;
  *(_OWORD *)&v28.tx = v16;
  *(_OWORD *)&v28.a = v16;
  CGAffineTransformMakeScale(&v28, (double)a4 / v12, (double)a5 / (v14 + v14));
  v27 = v28;
  -[__CVBuffer imageByApplyingTransform:](v8, "imageByApplyingTransform:", &v27);
  v17 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();

  v8 = v17;
  if (v17)
  {
LABEL_6:
    v18 = *MEMORY[0x24BDC5668];
    v32[0] = *MEMORY[0x24BDC5660];
    v32[1] = v18;
    v33[0] = MEMORY[0x24BDBD1C8];
    v33[1] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v20 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)v12, (unint64_t)v10, 0x34323076u, v19, &pixelBufferOut);

    if (!v20 && pixelBufferOut)
    {
      v21 = *MEMORY[0x24BDC54B8];
      v22 = *MEMORY[0x24BDC5570];
      v30[0] = *MEMORY[0x24BDC5490];
      v30[1] = v22;
      v23 = *MEMORY[0x24BDC55A8];
      v31[0] = v21;
      v31[1] = v23;
      v30[2] = *MEMORY[0x24BDC5510];
      v31[2] = *MEMORY[0x24BDC5538];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMSetAttachments(pixelBufferOut, v24, 1u);
      objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", MEMORY[0x24BDBD1B8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "render:toCVPixelBuffer:", v8, pixelBufferOut);

      v17 = pixelBufferOut;
      goto LABEL_12;
    }
    if (pixelBufferOut)
    {
      CFRelease(pixelBufferOut);
      v17 = 0;
      pixelBufferOut = 0;
      goto LABEL_12;
    }
LABEL_11:
    v17 = 0;
  }
LABEL_12:

  return v17;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (BOOL)transferSourceMedia
{
  return self->_transferSourceMedia;
}

- (void)setTransferSourceMedia:(BOOL)a3
{
  self->_transferSourceMedia = a3;
}

- (NSString)mediaName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMediaName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaName, 0);
}

@end
