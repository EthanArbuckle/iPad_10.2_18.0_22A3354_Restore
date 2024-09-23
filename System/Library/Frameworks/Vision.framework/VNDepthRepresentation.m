@implementation VNDepthRepresentation

- (id)_initWithAVDepthData:(id)a3 orientation:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  VNDepthRepresentation *v7;
  uint64_t v8;
  AVDepthData *depthData;
  uint64_t v10;
  AVDepthData *v11;
  objc_super v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNDepthRepresentation;
  v7 = -[VNDepthRepresentation init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "depthDataByConvertingToDepthDataType:", 1717855600);
    v8 = objc_claimAutoreleasedReturnValue();
    depthData = v7->_depthData;
    v7->_depthData = (AVDepthData *)v8;

    -[AVDepthData depthDataByApplyingExifOrientation:](v7->_depthData, "depthDataByApplyingExifOrientation:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v7->_depthData;
    v7->_depthData = (AVDepthData *)v10;

    v7->_orientation = v4;
  }

  return v7;
}

- (__n128)cameraIntrinsics
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 8), "cameraCalibrationData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "intrinsicMatrix");
  v4 = v2;

  return (__n128)v4;
}

- (BOOL)highQuality
{
  return -[AVDepthData depthDataQuality](self->_depthData, "depthDataQuality") == AVDepthDataQualityHigh;
}

- (BOOL)absoluteAccuracy
{
  return -[AVDepthData depthDataAccuracy](self->_depthData, "depthDataAccuracy") == AVDepthDataAccuracyAbsolute;
}

- (NSData)lensDistortionData
{
  void *v2;
  void *v3;

  -[AVDepthData cameraCalibrationData](self->_depthData, "cameraCalibrationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lensDistortionLookupTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (__CVBuffer)depthBuffer
{
  return -[AVDepthData depthDataMap](self->_depthData, "depthDataMap");
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthData, 0);
}

+ (id)depthRepresentationForDepthData:(id)a3 orientation:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[VNDepthRepresentation _initWithAVDepthData:orientation:]([VNDepthRepresentation alloc], "_initWithAVDepthData:orientation:", v5, v4);

  return v6;
}

+ (id)depthRepresentationForImageSource:(CGImageSource *)a3 orientation:(unsigned int)a4
{
  uint64_t v4;
  CFDictionaryRef v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v6 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a3, 0, (CFStringRef)*MEMORY[0x1E0CBC700]);
  if (!v6)
  {
    v6 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a3, 0, (CFStringRef)*MEMORY[0x1E0CBC708]);
    if (!v6)
      return 0;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v7 = (void *)getAVDepthDataClass_softClass;
  v16 = getAVDepthDataClass_softClass;
  if (!getAVDepthDataClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getAVDepthDataClass_block_invoke;
    v12[3] = &unk_1E4548FA8;
    v12[4] = &v13;
    __getAVDepthDataClass_block_invoke((uint64_t)v12);
    v7 = (void *)v14[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v8, "depthDataFromDictionaryRepresentation:error:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VNDepthRepresentation _initWithAVDepthData:orientation:]([VNDepthRepresentation alloc], "_initWithAVDepthData:orientation:", v9, v4);

  return v10;
}

@end
