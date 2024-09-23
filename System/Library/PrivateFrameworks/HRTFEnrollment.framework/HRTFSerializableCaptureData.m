@implementation HRTFSerializableCaptureData

- (__CVBuffer)colorPixelBuffer
{
  return -[_SerializableCVPixelBuffer pixelBuffer](self->_serializableColorPixelBuffer, "pixelBuffer");
}

- (__CVBuffer)depthPixelBuffer
{
  return -[_SerializableCVPixelBuffer pixelBuffer](self->_serializableDepthPixelBuffer, "pixelBuffer");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFSerializableCaptureData)initWithColorPixelBuffer:(__n128)a3 depthPixelBuffer:(__n128)a4 colorIntrinsics:(__n128)a5 depthIntrinsics:(__n128)a6 distortionLookupTable:(__n128)a7 referenceDimensions:(CGFloat)a8 distortionCenter:(CGFloat)a9 timestamp:(uint64_t)a10
{
  id v25;
  HRTFSerializableCaptureData *v26;
  _SerializableCVPixelBuffer *v27;
  _SerializableCVPixelBuffer *serializableColorPixelBuffer;
  _SerializableCVPixelBuffer *v29;
  _SerializableCVPixelBuffer *serializableDepthPixelBuffer;
  uint64_t v31;
  IOSurface *colorSurface;
  uint64_t v33;
  IOSurface *depthSurface;
  objc_super v42;

  v25 = a13;
  v42.receiver = a1;
  v42.super_class = (Class)HRTFSerializableCaptureData;
  v26 = -[HRTFSerializableCaptureData init](&v42, sel_init);
  if (v26)
  {
    v27 = -[_SerializableCVPixelBuffer initWithCVPixelBufferRef:]([_SerializableCVPixelBuffer alloc], "initWithCVPixelBufferRef:", a11);
    serializableColorPixelBuffer = v26->_serializableColorPixelBuffer;
    v26->_serializableColorPixelBuffer = v27;

    v29 = -[_SerializableCVPixelBuffer initWithCVPixelBufferRef:]([_SerializableCVPixelBuffer alloc], "initWithCVPixelBufferRef:", a12);
    serializableDepthPixelBuffer = v26->_serializableDepthPixelBuffer;
    v26->_serializableDepthPixelBuffer = v29;

    CVPixelBufferGetIOSurface(a11);
    v31 = objc_claimAutoreleasedReturnValue();
    colorSurface = v26->_colorSurface;
    v26->_colorSurface = (IOSurface *)v31;

    CVPixelBufferGetIOSurface(a12);
    v33 = objc_claimAutoreleasedReturnValue();
    depthSurface = v26->_depthSurface;
    v26->_depthSurface = (IOSurface *)v33;

    *(__n128 *)v26->_anon_20 = a2;
    *(__n128 *)&v26->_anon_20[16] = a3;
    *(__n128 *)&v26->_anon_20[32] = a4;
    *(__n128 *)v26->_anon_50 = a5;
    *(__n128 *)&v26->_anon_50[16] = a6;
    *(__n128 *)&v26->_anon_50[32] = a7;
    objc_storeStrong((id *)&v26->_distortionLookupTable, a13);
    v26->_referenceDimensions.width = a8;
    v26->_referenceDimensions.height = a9;
    v26->_distortionCenter.x = a14;
    v26->_distortionCenter.y = a15;
    v26->_timestamp = a16;
  }

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  IOSurface *colorSurface;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  colorSurface = self->_colorSurface;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", colorSurface, CFSTR("ColorSurface"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_depthSurface, CFSTR("DepthSurface"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serializableColorPixelBuffer, CFSTR("ColorPixelBuffer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serializableDepthPixelBuffer, CFSTR("DepthPixelBuffer"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", self->_anon_20, 48);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("ColorIntrinsics"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", self->_anon_50, 48);

  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("DepthIntrinsics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_distortionLookupTable, CFSTR("DistortionLUT"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_referenceDimensions, 16);

  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("RefDimensions"));
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_distortionCenter, 16);

  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("DistortionCenter"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("Timestamp"));

}

- (HRTFSerializableCaptureData)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  id v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  HRTFSerializableCaptureData *v32;
  objc_super v34;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ColorSurface"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("DepthSurface"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("ColorPixelBuffer"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("DepthPixelBuffer"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("ColorIntrinsics"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("DepthIntrinsics"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("DistortionLUT"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("RefDimensions"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("DistortionCenter"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("Timestamp")))
  {
    v34.receiver = self;
    v34.super_class = (Class)HRTFSerializableCaptureData;
    v5 = -[HRTFSerializableCaptureData init](&v34, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ColorSurface"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)*((_QWORD *)v5 + 22);
      *((_QWORD *)v5 + 22) = v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DepthSurface"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v5 + 23);
      *((_QWORD *)v5 + 23) = v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ColorPixelBuffer"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)*((_QWORD *)v5 + 1);
      *((_QWORD *)v5 + 1) = v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DepthPixelBuffer"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ColorIntrinsics"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length") != 48)
        -[HRTFSerializableCaptureData initWithCoder:].cold.4();
      v15 = objc_retainAutorelease(v14);
      v16 = (_OWORD *)objc_msgSend(v15, "bytes");
      v18 = v16[1];
      v17 = v16[2];
      *((_OWORD *)v5 + 2) = *v16;
      *((_OWORD *)v5 + 3) = v18;
      *((_OWORD *)v5 + 4) = v17;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DepthIntrinsics"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "length") != 48)
        -[HRTFSerializableCaptureData initWithCoder:].cold.3();
      v20 = objc_retainAutorelease(v19);
      v21 = (_OWORD *)objc_msgSend(v20, "bytes");
      v23 = v21[1];
      v22 = v21[2];
      *((_OWORD *)v5 + 5) = *v21;
      *((_OWORD *)v5 + 6) = v23;
      *((_OWORD *)v5 + 7) = v22;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DistortionLUT"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)*((_QWORD *)v5 + 16);
      *((_QWORD *)v5 + 16) = v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RefDimensions"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "length") != 16)
        -[HRTFSerializableCaptureData initWithCoder:].cold.2();
      v27 = objc_retainAutorelease(v26);
      *(_OWORD *)(v5 + 136) = *(_OWORD *)objc_msgSend(v27, "bytes");
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DistortionCenter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "length") != 16)
        -[HRTFSerializableCaptureData initWithCoder:].cold.1();
      v29 = objc_retainAutorelease(v28);
      *(_OWORD *)(v5 + 152) = *(_OWORD *)objc_msgSend(v29, "bytes");
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Timestamp"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      *((_QWORD *)v5 + 21) = v31;

    }
    self = v5;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (IOSurface)colorSurface
{
  return self->_colorSurface;
}

- (IOSurface)depthSurface
{
  return self->_depthSurface;
}

- (__n128)colorIntrinsics
{
  return a1[2];
}

- (__n128)depthIntrinsics
{
  return a1[5];
}

- (NSData)distortionLookupTable
{
  return self->_distortionLookupTable;
}

- (CGSize)referenceDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceDimensions.width;
  height = self->_referenceDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)distortionCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_distortionCenter.x;
  y = self->_distortionCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthSurface, 0);
  objc_storeStrong((id *)&self->_colorSurface, 0);
  objc_storeStrong((id *)&self->_distortionLookupTable, 0);
  objc_storeStrong((id *)&self->_serializableDepthPixelBuffer, 0);
  objc_storeStrong((id *)&self->_serializableColorPixelBuffer, 0);
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 323, "data.length == sizeof(CGPoint)");
}

- (void)initWithCoder:.cold.2()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 319, "data.length == sizeof(CGSize)");
}

- (void)initWithCoder:.cold.3()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 313, "data.length == sizeof(simd_float3x3)");
}

- (void)initWithCoder:.cold.4()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 309, "data.length == sizeof(simd_float3x3)");
}

@end
