@implementation ARVideoFormat

- (ARVideoFormat)initWithCaptureDevice:(id)a3 format:(id)a4
{
  id v7;
  id v8;
  ARVideoFormat *v9;
  ARVideoFormat *v10;
  NSArray *frameRatesByPowerUsage;
  uint64_t v12;
  NSString *captureDeviceType;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ARVideoFormat;
  v9 = -[ARVideoFormat init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_deviceFormat, a4);
    frameRatesByPowerUsage = v10->_frameRatesByPowerUsage;
    v10->_frameRatesByPowerUsage = (NSArray *)&unk_1E66CEAA8;

    v10->_captureDevicePosition = objc_msgSend(v7, "position");
    objc_msgSend(v7, "deviceType");
    v12 = objc_claimAutoreleasedReturnValue();
    captureDeviceType = v10->_captureDeviceType;
    v10->_captureDeviceType = (NSString *)v12;

  }
  return v10;
}

- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5
{
  return -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:](self, "initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:", a4, a5, &unk_1E66CEAC0, a3.width, a3.height);
}

- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5 frameRatesByPowerUsage:(id)a6
{
  return -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:](self, "initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:", a4, a5, &unk_1E66CEAD8, 875704422, a3.width, a3.height);
}

- (ARVideoFormat)initWithImageResolution:(CGSize)a3 captureDevicePosition:(int64_t)a4 captureDeviceType:(id)a5 frameRatesByPowerUsage:(id)a6 pixelFormat:(unsigned int)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  ARVideoFormat *v16;
  ARVideoFormat *v17;
  objc_super v19;

  height = a3.height;
  width = a3.width;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ARVideoFormat;
  v16 = -[ARVideoFormat init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_imageResolution.width = width;
    v16->_imageResolution.height = height;
    objc_storeStrong((id *)&v16->_frameRatesByPowerUsage, a6);
    v17->_captureDevicePosition = a4;
    objc_storeStrong((id *)&v17->_captureDeviceType, a5);
    v17->_pixelFormat = a7;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 8), self->_device);
    objc_storeStrong((id *)(v6 + 16), self->_deviceFormat);
    objc_storeStrong((id *)(v6 + 72), self->_depthDataFormat);
    v7 = -[NSArray copyWithZone:](self->_frameRatesByPowerUsage, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v7;

    *(CGSize *)(v6 + 32) = self->_imageResolution;
    *(_QWORD *)(v6 + 48) = self->_captureDevicePosition;
    objc_storeStrong((id *)(v6 + 56), self->_captureDeviceType);
    *(_DWORD *)(v6 + 24) = self->_pixelFormat;
  }
  return (id)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARVideoFormat)initWithCoder:(id)a3
{
  id v4;
  ARVideoFormat *v5;
  uint64_t v6;
  NSArray *frameRatesByPowerUsage;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  NSString *captureDeviceType;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARVideoFormat;
  v5 = -[ARVideoFormat init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("frameRatesByPowerUsage"));
    v6 = objc_claimAutoreleasedReturnValue();
    frameRatesByPowerUsage = v5->_frameRatesByPowerUsage;
    v5->_frameRatesByPowerUsage = (NSArray *)v6;

    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("imageResolution"));
    v5->_imageResolution.width = v8;
    v5->_imageResolution.height = v9;
    v5->_captureDevicePosition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("captureDevicePosition"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureDeviceType"));
    v10 = objc_claimAutoreleasedReturnValue();
    captureDeviceType = v5->_captureDeviceType;
    v5->_captureDeviceType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelFormat"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pixelFormat = objc_msgSend(v12, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *frameRatesByPowerUsage;
  id v5;
  id v6;

  frameRatesByPowerUsage = self->_frameRatesByPowerUsage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", frameRatesByPowerUsage, CFSTR("frameRatesByPowerUsage"));
  -[ARVideoFormat imageResolution](self, "imageResolution");
  objc_msgSend(v5, "encodeSize:forKey:", CFSTR("imageResolution"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_captureDevicePosition, CFSTR("captureDevicePosition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_captureDeviceType, CFSTR("captureDeviceType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pixelFormat);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("pixelFormat"));

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AVCaptureDevice description](self->_device, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureDeviceFormat description](self->_deviceFormat, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%li"), v4, v5, -[ARVideoFormat framesPerSecond](self, "framesPerSecond"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  _DWORD *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  int64_t captureDevicePosition;
  NSString *captureDeviceType;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = v5;
    if (self->_device == (AVCaptureDevice *)*((_QWORD *)v5 + 1)
      && self->_deviceFormat == (AVCaptureDeviceFormat *)*((_QWORD *)v5 + 2)
      && self->_depthDataFormat == (AVCaptureDeviceFormat *)*((_QWORD *)v5 + 9)
      && -[NSArray isEqualToArray:](self->_frameRatesByPowerUsage, "isEqualToArray:", *((_QWORD *)v5 + 8)))
    {
      -[ARVideoFormat imageResolution](self, "imageResolution");
      v8 = v7;
      v10 = v9;
      objc_msgSend(v6, "imageResolution");
      v12 = 0;
      if (v8 != v13 || v10 != v11)
        goto LABEL_13;
      captureDevicePosition = self->_captureDevicePosition;
      if (captureDevicePosition == objc_msgSend(v6, "captureDevicePosition"))
      {
        captureDeviceType = self->_captureDeviceType;
        objc_msgSend(v6, "captureDeviceType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqual:](captureDeviceType, "isEqual:", v16))
          v12 = self->_pixelFormat == v6[6];
        else
          v12 = 0;

        goto LABEL_13;
      }
    }
    v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (NSInteger)framesPerSecond
{
  void *v2;
  NSInteger v3;

  -[NSArray firstObject](self->_frameRatesByPowerUsage, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSInteger v11;
  void *v12;
  void *v13;

  -[ARVideoFormat imageResolution](self, "imageResolution");
  v4 = v3;
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARVideoFormat pixelFormat](self, "pixelFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ARVideoFormat framesPerSecond](self, "framesPerSecond");
  -[ARVideoFormat captureDeviceType](self, "captureDeviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p imageResolution=(%.0f, %.0f) pixelFormat=(%@) framesPerSecond=(%li) captureDeviceType=%@ captureDevicePosition=(%li)>"), v9, self, v4, v6, v10, v11, v12, -[ARVideoFormat captureDevicePosition](self, "captureDevicePosition"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (AVCaptureDevice)device
{
  return self->_device;
}

- (AVCaptureDeviceFormat)deviceFormat
{
  return self->_deviceFormat;
}

- (CGSize)imageResolution
{
  AVCaptureDeviceFormat *deviceFormat;
  double width;
  double height;
  CMVideoDimensions Dimensions;
  CGSize result;

  deviceFormat = self->_deviceFormat;
  if (deviceFormat)
  {
    if (CMFormatDescriptionGetMediaSubType(-[AVCaptureDeviceFormat formatDescription](deviceFormat, "formatDescription")) == 1785950320)
    {
      width = *MEMORY[0x1E0C9D820];
      height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      Dimensions = CMVideoFormatDescriptionGetDimensions(-[AVCaptureDeviceFormat formatDescription](self->_deviceFormat, "formatDescription"));
      width = (double)Dimensions.width;
      height = (double)Dimensions.height;
    }
  }
  else
  {
    width = self->_imageResolution.width;
    height = self->_imageResolution.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isRecommendedForHighResolutionFrameCapturing
{
  void *v3;
  void *v4;
  int v5;

  if (-[ARVideoFormat captureDevicePosition](self, "captureDevicePosition") == AVCaptureDevicePositionBack)
  {
    -[ARVideoFormat captureDeviceType](self, "captureDeviceType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89FA0]))
    {
      -[ARVideoFormat deviceFormat](self, "deviceFormat");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isVideoBinned") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isVideoHDRSupported
{
  void *v2;
  char v3;

  -[ARVideoFormat deviceFormat](self, "deviceFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVideoHDRSupported");

  return v3;
}

- (NSString)pixelFormat
{
  AVCaptureDeviceFormat *deviceFormat;
  FourCharCode MediaSubType;

  deviceFormat = self->_deviceFormat;
  if (deviceFormat)
    MediaSubType = CMFormatDescriptionGetMediaSubType(-[AVCaptureDeviceFormat formatDescription](deviceFormat, "formatDescription"));
  else
    MediaSubType = self->_pixelFormat;
  AROSTypeToString(MediaSubType);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isX420PixelFormat
{
  void *v2;
  void *v3;
  char v4;

  -[ARVideoFormat pixelFormat](self, "pixelFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AROSTypeToString(0x78343230u);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)has4KVideoResolution
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[ARVideoFormat imageResolution](self, "imageResolution");
  v3 = v2;
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "hiResVideoDimensions");
  return v5 == v7 && v3 == v6;
}

- (void)setFrameRatesByPowerUsage:(id)a3
{
  objc_storeStrong((id *)&self->_frameRatesByPowerUsage, a3);
}

- (void)setDepthDataFormat:(id)a3
{
  objc_storeStrong((id *)&self->_depthDataFormat, a3);
}

- (ARVideoFormat)videoFormatWithUnthrottledLowPowerUsageFramerate
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)-[ARVideoFormat copy](self, "copy");
  -[NSArray objectAtIndexedSubscript:](self->_frameRatesByPowerUsage, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_frameRatesByPowerUsage, "objectAtIndexedSubscript:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  -[NSArray objectAtIndexedSubscript:](self->_frameRatesByPowerUsage, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v3[8];
  v3[8] = v7;

  return (ARVideoFormat *)v3;
}

- (ARVideoFormat)videoFormatWithDepthDataFormat:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[ARVideoFormat copy](self, "copy");
  v6 = (void *)v5[9];
  v5[9] = v4;

  return (ARVideoFormat *)v5;
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7
{
  return (id)objc_msgSend(a1, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:needsHDRSupport:pixelFormat:", a3, a4, a5, a7, 0, 875704422, a6);
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8
{
  return (id)objc_msgSend(a1, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:needsHDRSupport:pixelFormat:", a3, a4, a5, a7, a8, 875704422, a6);
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRate:(double)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8 pixelFormat:(unsigned int)a9
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  CMVideoDimensions Dimensions;
  int v25;
  int v28;
  int v29;
  BOOL v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  id v44;
  ARVideoFormat *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSArray *frameRatesByPowerUsage;
  objc_class *v51;
  void *v52;
  void *v53;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  int v61;
  _BOOL4 v62;
  _BOOL4 v63;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[3];
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  _QWORD v89[4];

  v63 = a8;
  v62 = a7;
  v89[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = (void *)MEMORY[0x1E0C8B0A8];
  v66 = v12;
  v89[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "discoverySessionWithDeviceTypes:mediaType:position:", v14, *MEMORY[0x1E0C8A808], a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "devices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "count"))
  {
    _ARLogGeneral_10();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromAVCaptureDevicePosition(a3);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v82 = v52;
      v83 = 2048;
      v84 = a1;
      v85 = 2114;
      v86 = v66;
      v87 = 2114;
      v88 = v53;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No image capture device found in bestVideoFormatForDevicePosition. (%{public}@ / %{public}@)", buf, 0x2Au);

    }
    v45 = 0;
    goto LABEL_56;
  }
  if (ARDeviceSupportsMulticamMode() && (ARUserDefaultsMulticamModeEnabled() & 1) != 0)
    v61 = 1;
  else
    v61 = ARDeviceSupportsJasper();
  objc_msgSend(v16, "firstObject");
  v17 = objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[NSObject formats](v17, "formats");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (!v67)
  {
    v21 = 0;
    v20 = 0;
    v19 = 0;
    v45 = 0;
LABEL_53:

    goto LABEL_55;
  }
  v55 = v17;
  v56 = v16;
  v57 = v15;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v60 = *(_QWORD *)v75;
  v58 = v18;
  v59 = (id)*MEMORY[0x1E0C89F90];
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v75 != v60)
        objc_enumerationMutation(v18);
      v69 = v22;
      v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v22);
      Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v23, "formatDescription", v55));
      if (v63)
        v25 = objc_msgSend(v23, "isVideoHDRSupported");
      else
        v25 = 1;
      if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v23, "formatDescription")) == a9
        && Dimensions.width == a5.var0
        && Dimensions.height == a5.var1)
      {
        v28 = v25;
      }
      else
      {
        v28 = 0;
      }
      v29 = v28 & (objc_msgSend(v23, "isVideoBinned") ^ v62 ^ 1);
      if (v61)
        v29 &= objc_msgSend(v23, "isMultiCamSupported");
      if (v29)
        v30 = v59 == v66;
      else
        v30 = 0;
      if (v30)
      {
        +[ARVideoFormat bestDepthFormatForDeviceFormat:](ARVideoFormat, "bestDepthFormatForDeviceFormat:", v23);
        v31 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v31;
        if (!v31)
          goto LABEL_45;
      }
      else if (!v29)
      {
        goto LABEL_45;
      }
      v68 = v20;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v23, "videoSupportedFrameRateRanges");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v71 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            objc_msgSend(v37, "maxFrameRate");
            if (v38 >= a6)
            {
              objc_msgSend(v37, "maxFrameRate");
              if (v39 <= 120.0)
              {
                if (!v21
                  || (objc_msgSend(v37, "maxFrameRate"), v41 = v40, objc_msgSend(v21, "maxFrameRate"), v41 <= v42))
                {
                  v43 = v23;

                  v44 = v37;
                  v19 = v43;
                  v21 = v44;
                }
              }
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        }
        while (v34);
      }

      v20 = v68;
      v18 = v58;
LABEL_45:
      v22 = v69 + 1;
    }
    while (v69 + 1 != v67);
    v67 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  }
  while (v67);

  if (v19)
  {
    v17 = v55;
    v45 = -[ARVideoFormat initWithCaptureDevice:format:]([ARVideoFormat alloc], "initWithCaptureDevice:format:", v55, v19);
    objc_storeStrong((id *)&v45->_depthDataFormat, v20);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v46 = objc_claimAutoreleasedReturnValue();
    v78[0] = v46;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v47;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
    v49 = objc_claimAutoreleasedReturnValue();
    frameRatesByPowerUsage = v45->_frameRatesByPowerUsage;
    v45->_frameRatesByPowerUsage = (NSArray *)v49;

    v18 = (void *)v46;
    v16 = v56;
    v15 = v57;
    goto LABEL_53;
  }
  v45 = 0;
  v16 = v56;
  v15 = v57;
  v17 = v55;
LABEL_55:

LABEL_56:
  return v45;
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRates:(id)a6 videoBinned:(BOOL)a7
{
  uint64_t v8;

  LODWORD(v8) = 875704422;
  return +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:needsHDRSupport:pixelFormat:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:needsHDRSupport:pixelFormat:", a3, a4, a5, a6, a7, 0, v8);
}

+ (id)bestVideoFormatForDevicePosition:(int64_t)a3 deviceType:(id)a4 resolution:(id)a5 frameRates:(id)a6 videoBinned:(BOOL)a7 needsHDRSupport:(BOOL)a8 pixelFormat:(unsigned int)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v16;
  id v17;
  void *v18;
  id *v19;

  v9 = a8;
  v10 = a7;
  v16 = a6;
  v17 = a4;
  objc_msgSend(v16, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(a1, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:needsHDRSupport:pixelFormat:", a3, v17, a5, v10, v9, a9);
  v19 = (id *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_storeStrong(v19 + 8, a6);

  return v19;
}

+ (id)bestTimeOfFlightFormatForDevicePosition:(int64_t)a3 depthSensorNumberOfPointsMode:(int64_t)a4 frameRates:(id)a5
{
  NSArray *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *frameRatesByPowerUsage;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void *v30;
  int NumberOfPoints;
  int v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  char v40;
  id v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  NSObject *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  int64_t v58;
  int64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  ARVideoFormat *v64;
  NSObject *v65;
  objc_class *v66;
  void *v67;
  NSArray *v69;
  id v70;
  void *v71;
  void *v72;
  NSObject *v73;
  uint64_t v75;
  void *v76;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[3];
  _BYTE v90[128];
  _BYTE v91[128];
  id v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  int64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v6 = (NSArray *)a5;
  v7 = (id)*MEMORY[0x1E0C89F80];
  if (v6)
  {
    _ARLogSensor_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
      -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
      -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      *(_DWORD *)buf = 138544386;
      v94 = v10;
      v95 = 2048;
      v96 = a1;
      v97 = 2048;
      v98 = v13;
      v99 = 2048;
      v100 = v16;
      v101 = 2048;
      v102 = v18;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat jasper frame rates set to %f, %f, %f", buf, 0x34u);

    }
  }
  else
  {
    v6 = (NSArray *)&unk_1E66CEAF0;
  }
  v19 = (void *)MEMORY[0x1E0C8B0A8];
  v92 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "discoverySessionWithDeviceTypes:mediaType:position:", v20, *MEMORY[0x1E0C8A7E8], a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "devices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v71 = v22;
    v72 = v21;
    objc_msgSend(v22, "firstObject");
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v73 = objc_claimAutoreleasedReturnValue();
    -[NSObject formats](v73, "formats");
    frameRatesByPowerUsage = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(frameRatesByPowerUsage, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
    if (v24)
    {
      v25 = v24;
      v69 = v6;
      v70 = v7;
      v26 = 0;
      v80 = 0;
      v27 = *(_QWORD *)v86;
      v28 = -1;
      v75 = *(_QWORD *)v86;
      v76 = frameRatesByPowerUsage;
      do
      {
        v29 = 0;
        v78 = v25;
        do
        {
          if (*(_QWORD *)v86 != v27)
            objc_enumerationMutation(frameRatesByPowerUsage);
          v30 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v29);
          if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v30, "formatDescription", v69)) == 1785950320)
          {
            v79 = v29;
            objc_msgSend(v30, "formatDescription");
            NumberOfPoints = CMPointCloudFormatDescriptionGetNumberOfPoints();
            v32 = NumberOfPoints;
            if (v28 == -1)
              v28 = NumberOfPoints;
            v81 = 0u;
            v82 = 0u;
            if (a4 == 1)
              v33 = NumberOfPoints > v28;
            else
              v33 = NumberOfPoints < v28;
            v83 = 0uLL;
            v84 = 0uLL;
            objc_msgSend(v30, "videoSupportedFrameRateRanges");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v82;
              do
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v82 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
                  if (v26)
                    v40 = v33;
                  else
                    v40 = 1;
                  if ((v40 & 1) != 0)
                    goto LABEL_27;
                  if (v32 == v28)
                  {
                    objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "maxFrameRate");
                    v44 = v43;
                    objc_msgSend(v80, "maxFrameRate");
                    if (v44 > v45)
                    {
LABEL_27:
                      v41 = v30;

                      v42 = v39;
                      v26 = v41;
                      v80 = v42;
                    }
                    v28 = v32;
                    continue;
                  }
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
              }
              while (v36);
            }

            v27 = v75;
            frameRatesByPowerUsage = v76;
            v25 = v78;
            v29 = v79;
          }
          ++v29;
        }
        while (v29 != v25);
        v25 = objc_msgSend(frameRatesByPowerUsage, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      }
      while (v25);

      if (!v26)
      {
        v64 = 0;
        v6 = v69;
        v7 = v70;
        goto LABEL_49;
      }
      objc_msgSend(v80, "maxFrameRate");
      v47 = v46;
      v48 = v69;
      -[NSArray objectAtIndexedSubscript:](v69, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      v51 = v50;

      v7 = v70;
      if (v47 < v51)
      {
        v52 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v80, "maxFrameRate");
        objc_msgSend(v52, "numberWithDouble:");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        _ARLogSensor_2();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (objc_class *)objc_opt_class();
          NSStringFromClass(v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](v69, "objectAtIndexedSubscript:", 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "doubleValue");
          v59 = v58;
          objc_msgSend(v53, "doubleValue");
          *(_DWORD *)buf = 138544130;
          v94 = v56;
          v95 = 2048;
          v96 = a1;
          v97 = 2048;
          v98 = v59;
          v99 = 2048;
          v100 = v60;
          _os_log_impl(&dword_1B3A68000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Requested time of flight framerate: %f. Returning best available framerate: %f.", buf, 0x2Au);

        }
        v89[0] = v53;
        -[NSArray objectAtIndexedSubscript:](v69, "objectAtIndexedSubscript:", 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v89[1] = v61;
        -[NSArray objectAtIndexedSubscript:](v69, "objectAtIndexedSubscript:", 2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v89[2] = v62;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 3);
        v63 = objc_claimAutoreleasedReturnValue();

        v48 = (void *)v63;
      }
      v64 = -[ARVideoFormat initWithCaptureDevice:format:]([ARVideoFormat alloc], "initWithCaptureDevice:format:", v73, v26);
      v6 = v48;
      frameRatesByPowerUsage = v64->_frameRatesByPowerUsage;
      v64->_frameRatesByPowerUsage = v6;
    }
    else
    {
      v80 = 0;
      v26 = 0;
      v64 = 0;
    }

LABEL_49:
    v22 = v71;
    v21 = v72;
    v65 = v73;
    goto LABEL_50;
  }
  _ARLogGeneral_10();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
  {
    v66 = (objc_class *)objc_opt_class();
    NSStringFromClass(v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v94 = v67;
    v95 = 2048;
    v96 = a1;
    v97 = 2048;
    v98 = a3;
    _os_log_impl(&dword_1B3A68000, v65, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No point cloud capture device found. (%ld)", buf, 0x20u);

  }
  v64 = 0;
LABEL_50:

  return v64;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForDevicePosition:deviceType:frameRate:", a3, v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;

  v5 = a5;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForDevicePosition:deviceType:videoBinned:frameRate:", a3, v7, v5, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 frameRate:(double)a5
{
  id v7;
  void *v8;
  __CFString **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a4;
  v8 = v7;
  if (a3 == 2)
  {
    v9 = ARFrontFacingImageSensorVideoBinnedUserDefaultsKey;
  }
  else
  {
    if (a3 != 1)
      goto LABEL_10;
    if ((id)*MEMORY[0x1E0C89FA0] != v7)
    {
      if ((id)*MEMORY[0x1E0C89F98] == v7)
      {
        v9 = ARBackFacingUltraWideImageSensorVideoBinnedUserDefaultsKey;
        goto LABEL_8;
      }
LABEL_10:
      v12 = 1;
      goto LABEL_11;
    }
    v9 = ARBackFacingWideImageSensorVideoBinnedUserDefaultsKey;
  }
LABEL_8:
  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_10;
  v11 = v10;
  v12 = objc_msgSend(v10, "BOOLValue");

LABEL_11:
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForDevicePosition:deviceType:videoBinned:frameRate:", a3, v8, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)supportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5 frameRate:(double)a6
{
  _BOOL8 v7;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v9 = a4;
  if (supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__onceToken != -1)
    dispatch_once(&supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__onceToken, &__block_literal_global_31);
  dispatch_semaphore_wait((dispatch_semaphore_t)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats;
    supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats = v10;

  }
  v12 = CFSTR("non-binned");
  if (v7)
    v12 = CFSTR("binned");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@:%li:%f"), v9, v12, a3, *(_QWORD *)&a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore);
    v15 = v14;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_querySupportedVideoFormatsForDevicePosition:deviceType:videoBinned:frameRate:", a3, v9, v7, a6);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
      objc_msgSend((id)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__cachedSupportedVideoFormats, "setObject:forKey:", v15, v13);
    dispatch_semaphore_signal((dispatch_semaphore_t)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore);
  }

  return v15;
}

void __89__ARVideoFormat_supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore;
  supportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate__semaphore = (uint64_t)v0;

}

+ (id)_querySupportedVideoFormatsForDevicePosition:(int64_t)a3 deviceType:(id)a4 videoBinned:(BOOL)a5 frameRate:(double)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  __CFString **v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  NSObject *v41;
  objc_class *v42;
  _QWORD *v43;
  id v44;
  double v45;
  double v46;
  NSObject *v47;
  objc_class *v48;
  id v49;
  objc_class *v50;
  id v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  void *v55;
  id v56;
  int v57;
  char v59;
  char v60;
  int v61;
  int v62;
  double v63;
  _BOOL8 v64;
  void *v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  FourCharCode MediaSubType;
  uint64_t v71;
  unint64_t Dimensions;
  int32_t v73;
  unint64_t v74;
  _BOOL4 v76;
  BOOL v77;
  char v78;
  _BOOL4 v80;
  _BOOL4 v82;
  _BOOL4 v84;
  _BOOL4 v85;
  int v86;
  BOOL v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i;
  void *v94;
  double v95;
  double v96;
  ARVideoFormat *v97;
  void *frameRatesByPowerUsage;
  void *v99;
  NSArray *v100;
  NSArray *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  NSArray *v105;
  void *v106;
  ARVideoFormat *v107;
  double v108;
  ARVideoFormat *v109;
  id v110;
  NSArray *v111;
  NSArray *v112;
  void *v113;
  uint64_t v114;
  ARVideoFormat *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t j;
  NSObject *v122;
  objc_class *v123;
  id v124;
  uint64_t v125;
  void *v126;
  int v127;
  id v128;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  int64_t v141;
  ARVideoFormat *v142;
  void *v143;
  void *v144;
  int v145;
  _BOOL4 v146;
  id v147;
  char v148;
  unsigned __int8 v149;
  int v150;
  uint64_t v151;
  void *v152;
  void *v153;
  id obj;
  int v155;
  void *v156;
  int v157;
  id v158;
  int v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[128];
  _QWORD v180[3];
  _BYTE v181[128];
  _BYTE v182[128];
  uint8_t v183[128];
  uint8_t buf[4];
  id v185;
  __int16 v186;
  id v187;
  __int16 v188;
  _BYTE v189[10];
  int64_t v190;
  __int16 v191;
  uint64_t v192;
  _QWORD v193[3];
  _QWORD v194[4];

  v146 = a5;
  v194[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v10 = (void *)MEMORY[0x1E0C8B0A8];
  v194[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "discoverySessionWithDeviceTypes:mediaType:position:", v11, *MEMORY[0x1E0C8A808], a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v136 = v12;
  objc_msgSend(v12, "devices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = a3;
  if (objc_msgSend(v13, "count"))
  {
    v147 = v8;
    objc_msgSend(v13, "firstObject");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_QWORD *)MEMORY[0x1E0C89F98];
    v134 = v13;
    if (a3 == 1)
    {
      if ((id)*MEMORY[0x1E0C89FA0] == v8)
      {
        +[ARKitUserDefaults resolutionDictionaryForKey:](ARKitUserDefaults, "resolutionDictionaryForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.resolution"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = ARBackFacingWideImageSensorFrameRateUserDefaultsKey;
        goto LABEL_14;
      }
      if ((id)*MEMORY[0x1E0C89F98] == v8)
      {
        +[ARKitUserDefaults resolutionDictionaryForKey:](ARKitUserDefaults, "resolutionDictionaryForKey:", CFSTR("com.apple.arkit.imagesensor.back.ultrawide.resolution"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = ARBackFacingUltraWideImageSensorFrameRateUserDefaultsKey;
LABEL_14:
        +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", *v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = 0;
        goto LABEL_23;
      }
    }
    else if (a3 == 2)
    {
      +[ARKitUserDefaults resolutionDictionaryForKey:](ARKitUserDefaults, "resolutionDictionaryForKey:", CFSTR("com.apple.arkit.imagesensor.front.resolution"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.imagesensor.front.frameRate"));
      v21 = objc_claimAutoreleasedReturnValue();
      ARFaceTrackingDevice();
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if (v22 == v8)
      {
        +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.imagesensor.face.frameRateNormal"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.imagesensor.face.frameRateLow"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.imagesensor.face.frameRateLowest"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        v143 = 0;
        if (v24 && v25 && v26)
        {
          v193[0] = v24;
          v193[1] = v25;
          v193[2] = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 3);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          _ARLogSensor_2();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v30 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            v32 = v31;
            objc_msgSend(v25, "doubleValue");
            v34 = v33;
            objc_msgSend(v27, "doubleValue");
            *(_DWORD *)buf = 138544386;
            v185 = v30;
            v186 = 2048;
            v187 = a1;
            v188 = 2048;
            *(_QWORD *)v189 = v32;
            *(_WORD *)&v189[8] = 2048;
            v190 = v34;
            v191 = 2048;
            v192 = v35;
            _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat face tracking frame rates set to %f, %f, %f by user defaults", buf, 0x34u);

            v14 = (_QWORD *)MEMORY[0x1E0C89F98];
          }

        }
      }
      else
      {
        v143 = 0;
      }
      a3 = v141;
      v23 = (void *)v21;
LABEL_23:
      objc_opt_class();
      v133 = v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v15;
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("width"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("height"));
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v38;
        v40 = 0;
        v155 = 0;
        if (v37 && v38)
        {
          v40 = objc_msgSend(v37, "intValue");
          v155 = objc_msgSend(v39, "intValue");
          _ARLogSensor_2();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = v14;
            v44 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v185 = v44;
            v186 = 2048;
            v187 = a1;
            v188 = 1024;
            *(_DWORD *)v189 = v40;
            *(_WORD *)&v189[4] = 1024;
            *(_DWORD *)&v189[6] = v155;
            _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution set to %i, %i by user defaults", buf, 0x22u);

            v14 = v43;
          }

        }
        a3 = v141;
      }
      else
      {
        v155 = 0;
        v40 = 0;
      }
      v132 = v23;
      if (v23)
      {
        objc_msgSend(v23, "doubleValue");
        v46 = v45;
        _ARLogSensor_2();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v185 = v49;
          v186 = 2048;
          v187 = a1;
          a3 = v141;
          v188 = 2048;
          *(double *)v189 = v46;
          _os_log_impl(&dword_1B3A68000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by user defaults", buf, 0x20u);

        }
      }
      else
      {
        v46 = 0.0;
        if (a6 <= 0.0)
          goto LABEL_39;
        _ARLogSensor_2();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v185 = v51;
          v186 = 2048;
          v187 = a1;
          a3 = v141;
          v188 = 2048;
          *(double *)v189 = a6;
          _os_log_impl(&dword_1B3A68000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by SPI", buf, 0x20u);

        }
        v46 = a6;
      }

LABEL_39:
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v52 = objc_claimAutoreleasedReturnValue();
      if (a3 == 1)
        v53 = ARDeviceIsiPad();
      else
        v53 = 0;
      ARDeviceString();
      v54 = objc_claimAutoreleasedReturnValue();
      v153 = (void *)v52;
      v131 = (void *)v54;
      if (a3 == 2)
      {
        v55 = (void *)v54;
        ARFaceTrackingDevice();
        v56 = (id)objc_claimAutoreleasedReturnValue();
        if (v56 == v147)
          v57 = objc_msgSend(v55, "hasPrefix:", CFSTR("D22")) ^ 1;
        else
          LOBYTE(v57) = 0;
        v53 |= v57;

      }
      v8 = v147;
      v130 = *v14;
      if (a3 == 2 && *v14 == (_QWORD)v147)
        v59 = 1;
      else
        v59 = v53;
      v60 = ARShouldSupport1440pAndAutofocus();
      if (a3 == 1)
      {
        v150 = ARShouldSupport1440pAndAutofocus() ^ 1;
        v61 = ARShouldSupport1440pAndAutofocus() ^ 1;
      }
      else
      {
        LOBYTE(v61) = 1;
        LOBYTE(v150) = 1;
      }
      v149 = v61;
      v62 = v155;
      v140 = (void *)objc_opt_new();
      if (v46 <= 0.0)
      {
        v64 = v146;
        if (v143)
        {
          objc_msgSend(v143, "firstObject");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "doubleValue");
          v63 = v66;

          v145 = 0;
          v46 = v63;
        }
        else
        {
          v63 = 30.0;
          v145 = 1;
        }
      }
      else
      {
        v145 = 0;
        v63 = v46;
        v64 = v146;
      }
      if (ARDeviceSupportsMulticamMode() && (ARUserDefaultsMulticamModeEnabled() & 1) != 0)
        v159 = 1;
      else
        v159 = ARDeviceSupportsJasper();
      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      v138 = objc_msgSend(&unk_1E66CEB08, "countByEnumeratingWithState:objects:count:", &v175, v183, 16);
      if (v138)
      {
        v142 = 0;
        v148 = v60 & v59 ^ 1;
        v137 = *(_QWORD *)v176;
        v158 = (id)*MEMORY[0x1E0C89F90];
        v157 = v40;
        v144 = v9;
LABEL_67:
        v67 = 0;
        while (1)
        {
          if (*(_QWORD *)v176 != v137)
            objc_enumerationMutation(&unk_1E66CEB08);
          v139 = v67;
          v161 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v67);
          v171 = 0u;
          v172 = 0u;
          v173 = 0u;
          v174 = 0u;
          objc_msgSend(v152, "formats");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v162 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
          if (v162)
          {
            v160 = *(_QWORD *)v172;
            do
            {
              v68 = 0;
              do
              {
                if (*(_QWORD *)v172 != v160)
                  objc_enumerationMutation(obj);
                v69 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v68);
                MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v69, "formatDescription"));
                v71 = objc_msgSend(v161, "unsignedIntegerValue");
                Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v69, "formatDescription"));
                v73 = Dimensions;
                v74 = HIDWORD(Dimensions);
                if (v40)
                {
                  v76 = v40 == (_DWORD)Dimensions && v62 == HIDWORD(Dimensions);
                }
                else
                {
                  v77 = (_DWORD)Dimensions == 1280 && HIDWORD(Dimensions) == 720;
                  v76 = v77;
                  v78 = v148;
                  if (v77)
                    v78 = 1;
                  v80 = (_DWORD)Dimensions == 1440 && HIDWORD(Dimensions) == 1080;
                  if ((v78 & 1) == 0)
                    v76 = v80;
                  v82 = (_DWORD)Dimensions == 1920 && HIDWORD(Dimensions) == 1080;
                  if (((v76 | v150) & 1) == 0)
                    v76 = v82;
                  v84 = (_DWORD)Dimensions == 1920 && HIDWORD(Dimensions) == 1440;
                  if (((v76 | v149) & 1) == 0)
                    v76 = v84;
                }
                v85 = v71 == MediaSubType && v76;
                v86 = v85 & (objc_msgSend(v69, "isVideoBinned") ^ v64 ^ 1);
                if (v159)
                  v86 &= objc_msgSend(v69, "isMultiCamSupported");
                if (v86)
                  v87 = v158 == v8;
                else
                  v87 = 0;
                if (v87)
                {
                  +[ARVideoFormat bestDepthFormatForDeviceFormat:](ARVideoFormat, "bestDepthFormatForDeviceFormat:", v69);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v88)
                    goto LABEL_170;
                }
                else
                {
                  if (!v86)
                    goto LABEL_171;
                  v88 = 0;
                }
                v169 = 0u;
                v170 = 0u;
                v167 = 0u;
                v168 = 0u;
                objc_msgSend(v69, "videoSupportedFrameRateRanges");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
                if (!v90)
                  goto LABEL_169;
                v91 = v90;
                v92 = *(_QWORD *)v168;
                while (2)
                {
                  for (i = 0; i != v91; ++i)
                  {
                    if (*(_QWORD *)v168 != v92)
                      objc_enumerationMutation(v89);
                    v94 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
                    objc_msgSend(v94, "maxFrameRate");
                    if (v95 >= v63)
                    {
                      if (v46 > 0.0 || (objc_msgSend(v94, "maxFrameRate"), v96 <= 120.0))
                      {
                        v97 = -[ARVideoFormat initWithCaptureDevice:format:]([ARVideoFormat alloc], "initWithCaptureDevice:format:", v152, v69);
                        objc_storeStrong((id *)&v97->_depthDataFormat, v88);
                        v156 = v88;
                        if (v46 > 0.0)
                        {
                          v99 = v153;
                          if (v143)
                          {
                            v101 = v143;
                            frameRatesByPowerUsage = v97->_frameRatesByPowerUsage;
                            v97->_frameRatesByPowerUsage = v101;
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
                            frameRatesByPowerUsage = (void *)objc_claimAutoreleasedReturnValue();
                            v180[0] = frameRatesByPowerUsage;
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
                            v102 = (void *)objc_claimAutoreleasedReturnValue();
                            v180[1] = v102;
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                            v180[2] = v103;
                            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 3);
                            v104 = objc_claimAutoreleasedReturnValue();
                            v105 = v97->_frameRatesByPowerUsage;
                            v97->_frameRatesByPowerUsage = (NSArray *)v104;

                            v99 = v153;
                          }
                        }
                        else
                        {
                          frameRatesByPowerUsage = v97->_frameRatesByPowerUsage;
                          v99 = v153;
                          if (v63 == 30.0)
                          {
                            v100 = (NSArray *)&unk_1E66CEB20;
                          }
                          else if (v141 == 2)
                          {
                            v100 = (NSArray *)&unk_1E66CEB38;
                          }
                          else
                          {
                            v100 = (NSArray *)&unk_1E66CEB50;
                          }
                          v97->_frameRatesByPowerUsage = v100;
                        }

                        v151 = v73 * (int)v74;
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ARVideoFormat framesPerSecond](v97, "framesPerSecond") * v151);
                        v106 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v99, "containsObject:", v106) & 1) != 0)
                        {
                          v8 = v147;
                          v88 = v156;
                        }
                        else
                        {
                          objc_msgSend(v144, "addObject:", v97);
                          objc_msgSend(v99, "addObject:", v106);
                          v88 = v156;
                          if (v73 == 1920 && (_DWORD)v74 == 1440)
                          {
                            v107 = v97;

                            v142 = v107;
                          }
                          else if (v73 == 1440)
                          {
                            v8 = v147;
                            if ((_DWORD)v74 == 1080)
                              objc_msgSend(v140, "addObject:", v97);
                            goto LABEL_157;
                          }
                          v8 = v147;
                        }
LABEL_157:
                        if (v145)
                        {
                          objc_msgSend(v94, "maxFrameRate");
                          if (v108 >= 60.0)
                          {
                            v109 = -[ARVideoFormat initWithCaptureDevice:format:]([ARVideoFormat alloc], "initWithCaptureDevice:format:", v152, v69);
                            objc_storeStrong((id *)&v109->_depthDataFormat, v88);
                            if (v141 == 2
                              && (ARFaceTrackingDevice(),
                                  v110 = (id)objc_claimAutoreleasedReturnValue(),
                                  v110,
                                  v110 == v8))
                            {
                              v111 = v109->_frameRatesByPowerUsage;
                              v112 = (NSArray *)&unk_1E66CEB68;
                            }
                            else
                            {
                              v111 = v109->_frameRatesByPowerUsage;
                              v112 = (NSArray *)&unk_1E66CEB80;
                            }
                            v109->_frameRatesByPowerUsage = v112;

                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ARVideoFormat framesPerSecond](v109, "framesPerSecond") * v151);
                            v113 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((objc_msgSend(v153, "containsObject:", v113) & 1) == 0)
                            {
                              objc_msgSend(v144, "addObject:", v109);
                              objc_msgSend(v153, "addObject:", v113);
                              if (v73 == 1440 && (_DWORD)v74 == 1080)
                                objc_msgSend(v140, "addObject:", v109);
                            }

                          }
                        }

                        goto LABEL_168;
                      }
                    }
                  }
                  v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
                  if (v91)
                    continue;
                  break;
                }
                v8 = v147;
LABEL_168:
                v64 = v146;
LABEL_169:

                v62 = v155;
LABEL_170:
                v40 = v157;
LABEL_171:
                ++v68;
              }
              while (v68 != v162);
              v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
              v162 = v114;
            }
            while (v114);
          }

          v9 = v144;
          if (objc_msgSend(v144, "count"))
            break;
          v67 = v139 + 1;
          if (v139 + 1 == v138)
          {
            v138 = objc_msgSend(&unk_1E66CEB08, "countByEnumeratingWithState:objects:count:", &v175, v183, 16);
            if (v138)
              goto LABEL_67;
            break;
          }
        }
        v13 = v134;
        v115 = v142;
        if (v142)
        {
          v116 = v140;
          if (objc_msgSend(v140, "count"))
          {
            v165 = 0u;
            v166 = 0u;
            v163 = 0u;
            v164 = 0u;
            v117 = v140;
            v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v163, v179, 16);
            if (v118)
            {
              v119 = v118;
              v120 = *(_QWORD *)v164;
              do
              {
                for (j = 0; j != v119; ++j)
                {
                  if (*(_QWORD *)v164 != v120)
                    objc_enumerationMutation(v117);
                  objc_msgSend(v144, "removeObject:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * j));
                }
                v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v163, v179, 16);
              }
              while (v119);
            }

            _ARLogGeneral_10();
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
            {
              v123 = (objc_class *)objc_opt_class();
              NSStringFromClass(v123);
              v124 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v185 = v124;
              v186 = 2048;
              v187 = a1;
              _os_log_impl(&dword_1B3A68000, v122, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing 1440x1080 video format, because 1920x1440 is supported", buf, 0x16u);

            }
            v13 = v134;
          }
LABEL_192:
          objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_58);
          ARFaceTrackingDevice();
          v125 = objc_claimAutoreleasedReturnValue();
          v126 = (void *)v125;
          if (v141 == 2
            && (id)v125 == v8
            && objc_msgSend(v152, "isGeometricDistortionCorrectionSupported"))
          {
            v127 = ARLinkedOnOrAfterAzulE();

            if (!v127)
            {
LABEL_198:
              v128 = v9;

              goto LABEL_199;
            }
            objc_msgSend((id)objc_opt_class(), "_querySupportedVideoFormatsForDevicePosition:deviceType:videoBinned:frameRate:", 2, v130, v64, a6);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObjectsFromArray:", v126);
          }

          goto LABEL_198;
        }
      }
      else
      {
        v115 = 0;
        v13 = v134;
      }
      v116 = v140;
      goto LABEL_192;
    }
    v143 = 0;
    v23 = 0;
    v15 = 0;
    goto LABEL_23;
  }
  _ARLogGeneral_10();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v185 = v19;
    v186 = 2048;
    v187 = a1;
    v188 = 2114;
    *(_QWORD *)v189 = v8;
    *(_WORD *)&v189[8] = 2048;
    v190 = a3;
    _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No image capture device found in supportedVideoFormatsForDevicePosition. (%{public}@ / %ld)", buf, 0x2Au);

  }
  v20 = v9;
LABEL_199:

  return v9;
}

uint64_t __95__ARVideoFormat__querySupportedVideoFormatsForDevicePosition_deviceType_videoBinned_frameRate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "imageResolution");
  v7 = v6;
  objc_msgSend(v4, "imageResolution");
  v9 = v7 * v8;
  objc_msgSend(v5, "imageResolution");
  v11 = v10;
  objc_msgSend(v5, "imageResolution");
  if (v9 >= v11 * v12)
  {
    v14 = objc_msgSend(v4, "framesPerSecond");
    if (v14 < objc_msgSend(v5, "framesPerSecond"))
      v13 = 1;
    else
      v13 = -1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

+ (id)bestDepthFormatForDeviceFormat:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int32_t width;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "supportedDepthDataFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v10, "formatDescription")) == 1717855600)
        {
          width = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v10, "formatDescription")).width;
          if (!v7
            || width > CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v7, "formatDescription")).width)
          {
            v12 = v10;

            v7 = v12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)supportedVideoFormatsForStillImageCapture
{
  return (id)objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForDevicePosition:deviceType:videoBinned:", 1, *MEMORY[0x1E0C89FA0], 0);
}

+ (CGSize)hiResVideoDimensions
{
  double v2;
  double v3;
  CGSize result;

  v2 = 3840.0;
  v3 = 2160.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)supportedVideoFormatsForHiResOrX420
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[5];

  v50[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *MEMORY[0x1E0C89FA0];
  objc_msgSend((id)objc_opt_class(), "hiResVideoDimensions");
  v5 = v4;
  v7 = v6;
  v8 = (int)v4 | ((unint64_t)(int)v6 << 32);
  objc_msgSend((id)objc_opt_class(), "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:needsHDRSupport:", 1, v3, v8, 0, 1, 30.0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v2, "addObject:", v9);
  v29 = (void *)v9;
  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.frameRate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(v10, "floatValue");
    objc_msgSend(v11, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:needsHDRSupport:", 1, v3, v8, 0, 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v2, "addObject:", v13);

  }
  v28 = v10;
  v34 = v2;
  *(double *)v47 = v5;
  *(double *)&v47[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v47, "{CGSize=dd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v14;
  v46 = xmmword_1B3BE3750;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v46, "{CGSize=dd}");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v15;
  v45 = xmmword_1B3BE3760;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v45, "{CGSize=dd}");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v17;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v42;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(obj);
        v33 = v18;
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v18);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v20 = objc_msgSend(&unk_1E66CEBC8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v38 != v22)
                objc_enumerationMutation(&unk_1E66CEBC8);
              v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
              v35 = 0.0;
              v36 = 0.0;
              objc_msgSend(v19, "getValue:size:", &v35, 16);
              LODWORD(v27) = 2016686640;
              objc_msgSend((id)objc_opt_class(), "bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:needsHDRSupport:pixelFormat:", 1, v3, (int)v35 | ((unint64_t)(int)v36 << 32), v24, 0, 0, v27);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                objc_msgSend(v34, "addObject:", v25);

            }
            v21 = objc_msgSend(&unk_1E66CEBC8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
          }
          while (v21);
        }
        ++v18;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v32);
  }

  return v34;
}

- (AVCaptureDevicePosition)captureDevicePosition
{
  return self->_captureDevicePosition;
}

- (AVCaptureDeviceType)captureDeviceType
{
  return self->_captureDeviceType;
}

- (NSArray)frameRatesByPowerUsage
{
  return self->_frameRatesByPowerUsage;
}

- (AVCaptureDeviceFormat)depthDataFormat
{
  return self->_depthDataFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthDataFormat, 0);
  objc_storeStrong((id *)&self->_frameRatesByPowerUsage, 0);
  objc_storeStrong((id *)&self->_captureDeviceType, 0);
  objc_storeStrong((id *)&self->_deviceFormat, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
