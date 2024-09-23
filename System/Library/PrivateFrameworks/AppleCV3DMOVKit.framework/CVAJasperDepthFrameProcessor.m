@implementation CVAJasperDepthFrameProcessor

- (CVAJasperDepthFrameProcessor)initWithCalibrationDict:(id)a3
{
  id v4;
  CVAJasperDepthFrameProcessor *v5;
  CVAJasperDepthFrameProcessor *v6;
  uint64_t v7;
  JDDepthProcessor *jdProc;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CVAJasperDepthFrameProcessor;
  v5 = -[CVAJasperDepthFrameProcessor init](&v10, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE5C378], "calibrationDataWithJasperCalibDataDictionary:", v4);
  v6 = (CVAJasperDepthFrameProcessor *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE5C370]), "initWithSystemCalibrationData:", v6);
    jdProc = v5->_jdProc;
    v5->_jdProc = (JDDepthProcessor *)v7;

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (id)process:(__CVBuffer *)a3
{
  size_t BytesPerRow;
  size_t Width;
  void *BaseAddress;
  void *v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  void *v12;
  OSType PixelFormatType;
  uint64_t v14;
  size_t Height;
  char *v16;
  size_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  Width = CVPixelBufferGetWidth(a3);
  if (BytesPerRow == Width)
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", BaseAddress, CVPixelBufferGetDataSize(a3), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JDDepthProcessor generatePointCloudFromRawFrame:](self->_jdProc, "generatePointCloudFromRawFrame:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v9;
    goto LABEL_13;
  }
  v11 = Width;
  v12 = (void *)MEMORY[0x212BC8864]();
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 1278226488)
  {
    v14 = 1;
  }
  else
  {
    if (PixelFormatType != 1278226742)
    {
      v10 = 0;
      v20 = 0;
      goto LABEL_12;
    }
    v14 = 2;
  }
  Height = CVPixelBufferGetHeight(a3);
  v16 = (char *)CVPixelBufferGetBaseAddress(a3);
  v17 = v14 * v11;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v14 * v11 * Height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (Height)
  {
    v19 = 0;
    do
    {
      memcpy((void *)(objc_msgSend(objc_retainAutorelease(v18), "mutableBytes") + v19), v16, v17);
      v16 += BytesPerRow;
      v19 += v17;
      --Height;
    }
    while (Height);
  }
  -[JDDepthProcessor generatePointCloudFromRawFrame:](self->_jdProc, "generatePointCloudFromRawFrame:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 1;
LABEL_12:
  objc_autoreleasePoolPop(v12);
  if ((v20 & 1) == 0)
  {
    v21 = v10;
    v10 = 0;
    goto LABEL_15;
  }
LABEL_13:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  v21 = 0;
LABEL_15:

  return v10;
}

- (JDDepthProcessor)jdProc
{
  return self->_jdProc;
}

- (void)setJdProc:(id)a3
{
  objc_storeStrong((id *)&self->_jdProc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jdProc, 0);
}

@end
