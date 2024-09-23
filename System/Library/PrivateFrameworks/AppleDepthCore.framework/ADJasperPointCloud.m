@implementation ADJasperPointCloud

+ (unint64_t)requiredStorageBytesForLength:(int)a3 additionalDataSize:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7[12];

  v7[11] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  calculateOffsetsForLength(a3, v7, &v6);
  return v6 + a4;
}

- (int)length
{
  JasperPointCloudDataHeader *m_header;

  m_header = self->_pc.m_header;
  if (m_header)
    return *((_DWORD *)m_header + 2);
  else
    return 0;
}

- (id).cxx_construct
{
  self->_pc.m_ownedStorage.__ptr_.__value_ = 0;
  self->_pc.m_header = 0;
  if (InitAttributes(void)::once != -1)
    dispatch_once(&InitAttributes(void)::once, &__block_literal_global_1100);
  return self;
}

- (ADJasperPointCloud)initWithDataBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  __IOSurface *IOSurface;
  __IOSurface *v6;
  OSType PixelFormat;
  void *BaseAddress;
  ADJasperPointCloud *v9;

  v3 = a3;
  if (a3)
  {
    IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
    v6 = IOSurface;
    if (IOSurface
      && (PixelFormat = IOSurfaceGetPixelFormat(IOSurface),
          PixelFormat == +[ADJasperPointCloud pixelFormat](ADJasperPointCloud, "pixelFormat")))
    {
      IOSurfaceLock(v6, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v6);
      v9 = -[ADJasperPointCloud initWithPreparedStorage:storageSize:](self, "initWithPreparedStorage:storageSize:", BaseAddress, CVDataBufferGetDataSize());
      IOSurfaceUnlock(v6, 0, 0);
      if (v9)
      {
        v9->_dataBuffer = CVBufferRetain(v3);
        appledepth::JasperPointCloud::applyPerformanceOverrides((appledepth::JasperPointCloud *)&v9->_pc);
      }
      self = v9;
      v3 = (__CVBuffer *)self;
    }
    else
    {
      v3 = 0;
    }
  }

  return (ADJasperPointCloud *)v3;
}

- (ADJasperPointCloud)initWithPreparedStorage:(void *)a3 storageSize:(unint64_t)a4
{
  ADJasperPointCloud *v5;
  ADJasperPointCloud *v6;
  ADJasperPointCloud *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ADJasperPointCloud;
  v5 = -[ADJasperPointCloud init](&v10, sel_init, a3, a4);
  v6 = v5;
  if (v5 && !appledepth::JasperPointCloud::initWithPreparedStorage((appledepth::JasperPointCloud *)&v5->_pc, a3))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed initializing ADJasperPointCloud from memory: contains invalid header", v9, 2u);
    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

+ (unsigned)pixelFormat
{
  return 1785950320;
}

- (const)undistortedCameraPixels
{
  return (const CGPoint *)((char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 5));
}

- (BOOL)reset
{
  char *value;
  __IOSurface *IOSurface;

  value = self->_pc.m_ownedStorage.__ptr_.__value_;
  self->_pc.m_ownedStorage.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x23B7F1D4C](value, 0x1000C8077774924);
  self->_pc.m_header = 0;
  if (self->_dataBuffer)
  {
    IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
    IOSurfaceUnlock(IOSurface, 0, 0);
    CVBufferRelease(self->_dataBuffer);
    self->_dataBuffer = 0;
  }
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[ADJasperPointCloud reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)ADJasperPointCloud;
  -[ADJasperPointCloud dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (const)cameraPixels
{
  return (const CGPoint *)((char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 4));
}

- (const)bankIds
{
  return (char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 9);
}

- (void).cxx_destruct
{
  char *value;

  objc_storeStrong((id *)&self->_additionalData, 0);
  value = self->_pc.m_ownedStorage.__ptr_.__value_;
  self->_pc.m_ownedStorage.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x23B7F1D4CLL);
}

+ (BOOL)prepareDataBuffer:(__CVBuffer *)a3 forLength:(int)a4 additionalDataSize:(unint64_t)a5
{
  __IOSurface *IOSurface;
  __IOSurface *v8;
  OSType PixelFormat;
  void *BaseAddress;
  unint64_t DataSize;
  char v12;

  if (!a3)
    return 0;
  IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
  if (!IOSurface)
    return 0;
  v8 = IOSurface;
  PixelFormat = IOSurfaceGetPixelFormat(IOSurface);
  if (PixelFormat != +[ADJasperPointCloud pixelFormat](ADJasperPointCloud, "pixelFormat"))
    return 0;
  IOSurfaceLock(v8, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(v8);
  DataSize = CVDataBufferGetDataSize();
  v12 = appledepth::JasperPointCloud::prepareStorage((uint64_t)BaseAddress, DataSize, a4, a5);
  IOSurfaceUnlock(v8, 0, 0);
  return v12;
}

+ (id)makeWithDataBuffer:(__CVBuffer *)a3
{
  return -[ADJasperPointCloud initWithDataBuffer:]([ADJasperPointCloud alloc], "initWithDataBuffer:", a3);
}

- (ADJasperPointCloud)initWithLength:(int)a3
{
  ADJasperPointCloud *v4;
  ADJasperPointCloud *v5;
  ADJasperPointCloud *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ADJasperPointCloud;
  v4 = -[ADJasperPointCloud init](&v8, sel_init);
  v5 = v4;
  if (v4)
    appledepth::JasperPointCloud::initWithLength((appledepth::JasperPointCloud *)&v4->_pc, a3, 0);
  v6 = v5;

  return v6;
}

- (ADJasperPointCloud)initWithLength:(int)a3 storage:(__CVBuffer *)a4
{
  ADJasperPointCloud *v5;
  ADJasperPointCloud *v6;
  ADJasperPointCloud *v7;

  v5 = self;
  if (a4)
  {
    if (!+[ADJasperPointCloud prepareDataBuffer:forLength:](ADJasperPointCloud, "prepareDataBuffer:forLength:", a4, *(_QWORD *)&a3))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = -[ADJasperPointCloud initWithDataBuffer:](v5, "initWithDataBuffer:", a4);
  }
  else
  {
    v6 = -[ADJasperPointCloud initWithLength:](self, "initWithLength:", *(_QWORD *)&a3);
  }
  v5 = v6;
  v7 = v5;
LABEL_7:

  return v7;
}

- (BOOL)pointCloudToCSV:(id)a3 atomically:(BOOL)a4
{
  _BOOL4 v4;
  JasperPointCloudDataHeader *m_header;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t i;
  JasperPointCloudDataHeader *v17;
  void *v18;
  void *v19;
  char v20;
  _BOOL4 v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  +[ADJasperPointCloud JasperCSVAttributeNamesCannonicalOrder](ADJasperPointCloud, "JasperCSVAttributeNamesCannonicalOrder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  m_header = self->_pc.m_header;
  if (m_header)
    v7 = *((_QWORD *)m_header + 1) + 1;
  else
    v7 = 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v24;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v14);

  v15 = 0;
  for (i = 0; ; ++i)
  {
    v17 = self->_pc.m_header;
    if (v17)
      v17 = (JasperPointCloudDataHeader *)*((_QWORD *)v17 + 1);
    if (i >= (unint64_t)v17)
      break;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u,%u,%u,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%u"), -[ADJasperPointCloud bankIds](self, "bankIds")[i], -[ADJasperPointCloud spotIds](self, "spotIds")[i], -[ADJasperPointCloud echoIds](self, "echoIds")[i], -[ADJasperPointCloud euclideanDistances](self, "euclideanDistances")[4 * i], -[ADJasperPointCloud confidences](self, "confidences")[4 * i], -[ADJasperPointCloud intensities](self, "intensities")[4 * i], -[ADJasperPointCloud signalToNoiseRatios](self, "signalToNoiseRatios")[4 * i], (_QWORD)-[ADJasperPointCloud cameraPixels](self, "cameraPixels")[v15], (_QWORD)(-[ADJasperPointCloud cameraPixels](self, "cameraPixels") + v15)[8], (_QWORD)-[ADJasperPointCloud undistortedCameraPixels](self, "undistortedCameraPixels")[v15], (_QWORD)(-[ADJasperPointCloud undistortedCameraPixels](self, "undistortedCameraPixels") + v15)[8], *(float *)(-[ADJasperPointCloud points](self, "points") + v15), *(float *)(-[ADJasperPointCloud points](self, "points") + v15 + 4), COERCE_FLOAT(*(_QWORD *)(-[ADJasperPointCloud points](self, "points") + v15 + 8)), -[ADJasperPointCloud flags](self, "flags")[4 * i]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v18);

    v15 += 16;
  }
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\r\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "writeToFile:atomically:encoding:error:", v23, v22, 1, 0);

  return v20;
}

- (BOOL)pointCloudToJSPP:(id)a3 atomically:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  unint64_t m_capacity;
  JasperPointCloudDataHeader *m_header;
  uint64_t v10;
  void *v11;
  unint64_t v13;
  unint64_t v14[12];

  v4 = a4;
  v14[11] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCE50];
  m_header = self->_pc.m_header;
  m_capacity = self->_pc.m_capacity;
  v10 = *((_QWORD *)m_header + 13);
  v13 = 0;
  calculateOffsetsForLength(m_capacity, v14, &v13);
  objc_msgSend(v7, "dataWithBytes:length:", m_header, v13 + v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v11, "writeToFile:atomically:", v6, v4);

  return v4;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  char v16;
  void *v18;
  int v19;
  void *v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSuffix:", CFSTR(".csv"));

  if (v8)
  {
    v9 = -[ADJasperPointCloud pointCloudToCSV:atomically:](self, "pointCloudToCSV:atomically:", v6, v4);
LABEL_10:
    v16 = v9;
    goto LABEL_11;
  }
  objc_msgSend(v6, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasSuffix:", CFSTR(".jspp"));

  if (v11)
  {
    v9 = -[ADJasperPointCloud pointCloudToJSPP:atomically:](self, "pointCloudToJSPP:atomically:", v6, v4);
    goto LABEL_10;
  }
  objc_msgSend(v6, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasSuffix:", CFSTR(".jpeg")))
  {

LABEL_8:
    v15 = CFSTR("public.jpeg");
LABEL_9:
    v9 = -[ADJasperPointCloud pointCloudToImageFile:uti:atomically:](self, "pointCloudToImageFile:uti:atomically:", v6, v15, v4);
    goto LABEL_10;
  }
  objc_msgSend(v6, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasSuffix:", CFSTR(".jpg"));

  if ((v14 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v6, "lowercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasSuffix:", CFSTR(".png"));

  if (v19)
  {
    v15 = CFSTR("public.png");
    goto LABEL_9;
  }
  -[ADJasperPointCloud dictionaryRepresentation](self, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    v16 = objc_msgSend(v20, "writeToFile:atomically:", v6, v4);
  else
    v16 = 0;

LABEL_11:
  return v16;
}

- (id)mutableCopy
{
  return -[ADJasperPointCloud initWithPointCloud:]([ADMutableJasperPointCloud alloc], "initWithPointCloud:", self);
}

- (ADJasperPointCloud)initWithPointCloud:(id)a3
{
  char *v4;
  ADJasperPointCloud *v5;
  ADJasperPointCloud *v6;
  ADJasperPointCloud *v7;
  objc_super v9;

  v4 = (char *)a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperPointCloud;
  v5 = -[ADJasperPointCloud init](&v9, sel_init);
  v6 = v5;
  if (v5
    && (appledepth::JasperPointCloud::initByCloning((appledepth::JasperPointCloud *)&v5->_pc, (const appledepth::JasperPointCloud *)(v4 + 8)) & 1) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (id)dictionaryRepresentation
{
  return appledepth::JasperPointCloud::createDictionaryRepresentation((appledepth::JasperPointCloud *)&self->_pc);
}

- (ADJasperPointCloud)initWithDictionaryRepresentation:(id)a3
{
  const __CFDictionary *v4;
  ADJasperPointCloud *v5;
  ADJasperPointCloud *v6;
  ADJasperPointCloud *v7;
  JasperPointCloudDataHeader *m_header;
  ADJasperPointCloud *v9;
  objc_super v11;

  v4 = (const __CFDictionary *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ADJasperPointCloud;
  v5 = -[ADJasperPointCloud init](&v11, sel_init);
  v6 = v5;
  v7 = v5;
  if (!v5
    || (appledepth::JasperPointCloud::initWithDictionaryRepresentation((appledepth::JasperPointCloud *)&v5->_pc, v4) & 1) != 0
    && (m_header = v7->_pc.m_header) != 0
    && *((_QWORD *)m_header + 1))
  {
    appledepth::JasperPointCloud::applyPerformanceOverrides((appledepth::JasperPointCloud *)&v6->_pc);
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)initByMergingPointClouds:(id)a3
{
  id v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  ADJasperPointCloud *v8;
  void *__p;
  _BYTE *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    std::vector<appledepth::JasperPointCloud const*>::vector(&__p, objc_msgSend(v4, "count"));
    if (v11 != __p)
    {
      v5 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v6 = (char *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)__p + v5) = v6 + 8;

        ++v5;
      }
      while (v5 < (v11 - (_BYTE *)__p) >> 3);
    }
    v7 = objc_msgSend(v4, "count");
    if (appledepth::JasperPointCloud::initByMerging((appledepth::JasperPointCloud *)&self->_pc, v7, (const appledepth::JasperPointCloud **)__p))
    {
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
    if (__p)
    {
      v11 = __p;
      operator delete(__p);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)size
{
  JasperPointCloudDataHeader *m_header;

  m_header = self->_pc.m_header;
  if (m_header)
    return *((_DWORD *)m_header + 2);
  else
    return 0;
}

- (const)euclideanDistances
{
  return (const float *)((char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 6));
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + 16) + *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
}

- (const)intensities
{
  return (const float *)((char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 7));
}

- (const)confidences
{
  return (const float *)((char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 3));
}

- (const)signalToNoiseRatios
{
  return (const float *)((char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 8));
}

- (const)spotIds
{
  return (char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 10);
}

- (const)echoIds
{
  return (char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 11);
}

- (const)flags
{
  return (const unsigned int *)((char *)self->_pc.m_header + *((_QWORD *)self->_pc.m_header + 12));
}

- (id)additionalData
{
  NSData *additionalData;
  JasperPointCloudDataHeader *m_header;
  uint64_t v5;
  NSData *v6;
  NSData *v7;

  additionalData = self->_additionalData;
  if (!additionalData)
  {
    m_header = self->_pc.m_header;
    v5 = *((_QWORD *)m_header + 13);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", (char *)m_header + *((_QWORD *)m_header + 14), v5, 0);
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
      v7 = self->_additionalData;
      self->_additionalData = v6;

      additionalData = self->_additionalData;
    }
    else
    {
      additionalData = 0;
    }
  }
  return additionalData;
}

- (int64_t)projectJasperPointsFilteredBy:(id)a3 croppedBy:(CGRect)a4 rotatedBy:(int64_t)a5 andScaledInto:(__CVBuffer *)a6
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int64_t v23;
  CGFloat height;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = objc_msgSend(v12, "echoMode");
  objc_msgSend(v12, "confidenceThreshold");
  v15 = v14;
  objc_msgSend(v12, "minDistance");
  v17 = v16;
  objc_msgSend(v12, "maxDistance");
  v19 = v18;
  objc_msgSend(v12, "shortRangeDepthThreshold");
  v21 = v20;
  objc_msgSend(v12, "shortRangeConfidenceThreshold");
  v23 = appledepth::JasperPointCloud::projectJasperPoints((uint64_t)&self->_pc, a5, v13, objc_msgSend(v12, "bankIDMask"), objc_msgSend(v12, "duplicateProjectedSpotsMode"), a6, 1, x, y, width, height, v15, v17, v19, v21, v22);

  return v23;
}

- (int64_t)projectJasperPointsFilteredBy:(id)a3 croppedBy:(CGRect)a4 rotatedBy:(int64_t)a5 andScaledMergingWith:(__CVBuffer *)a6
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int64_t v23;
  CGFloat height;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = objc_msgSend(v12, "echoMode");
  objc_msgSend(v12, "confidenceThreshold");
  v15 = v14;
  objc_msgSend(v12, "minDistance");
  v17 = v16;
  objc_msgSend(v12, "maxDistance");
  v19 = v18;
  objc_msgSend(v12, "shortRangeDepthThreshold");
  v21 = v20;
  objc_msgSend(v12, "shortRangeConfidenceThreshold");
  v23 = appledepth::JasperPointCloud::projectJasperPoints((uint64_t)&self->_pc, a5, v13, objc_msgSend(v12, "bankIDMask"), objc_msgSend(v12, "duplicateProjectedSpotsMode"), a6, 0, x, y, width, height, v15, v17, v19, v21, v22);

  return v23;
}

- (int64_t)projectJasperPointsCroppedBy:(CGRect)a3 rotatedBy:(int64_t)a4 andScaledInto:(__CVBuffer *)a5
{
  return appledepth::JasperPointCloud::projectJasperPoints((uint64_t)&self->_pc, a4, 3, 0xFFFFFFFFuLL, 0, a5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, 3.4028e38, 0.0, 0.0);
}

- (id)pointCloudByChangingPointOfViewFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "getTransformationTo:", v7);
  -[ADJasperPointCloud pointCloudByChangingPointOfViewByTransform:to:](self, "pointCloudByChangingPointOfViewByTransform:to:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_QWORD)pointCloudByChangingPointOfViewByTransform:(__n128)a3 to:(__n128)a4
{
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v8 = a7;
  v9 = objc_alloc((Class)objc_opt_class());
  v10 = v9;
  if (v9
    && (appledepth::JasperPointCloud::initByCloning((appledepth::JasperPointCloud *)(v9 + 1), (const appledepth::JasperPointCloud *)(a1 + 8)) & 1) != 0)
  {
    v11 = v10[2];
    if (v11)
      v12 = *(_QWORD *)(v11 + 8);
    else
      v12 = 0;
    +[ADCameraCalibration transform:points:with:outPoints:](ADCameraCalibration, "transform:points:with:outPoints:", v12, v11 + *(_QWORD *)(v11 + 16), v11 + *(_QWORD *)(v11 + 16), a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
    v14 = (_QWORD *)v10[2];
    if (v14)
      v15 = v14[1];
    else
      v15 = 0;
    objc_msgSend(v8, "project:points:outUndistortedPixels:outR:", v15, (char *)v14 + v14[2], (char *)v14 + v14[5], (char *)v14 + v14[6]);
    v16 = (_QWORD *)v10[2];
    if (v16)
      v17 = v16[1];
    else
      v17 = 0;
    objc_msgSend(v8, "distort:undistortedPixels:outDistorted:", v17, (char *)v16 + v16[5], (char *)v16 + v16[4]);
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pointCloudByApplyingFilter:(id)a3
{
  id v4;
  ADMutableJasperPointCloud *v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  ADMutableJasperPointCloud *v16;

  v4 = a3;
  v5 = -[ADMutableJasperPointCloud initWithCapacity:]([ADMutableJasperPointCloud alloc], "initWithCapacity:", -[ADJasperPointCloud length](self, "length"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "echoMode");
    objc_msgSend(v4, "confidenceThreshold");
    v8 = v7;
    objc_msgSend(v4, "minDistance");
    v10 = v9;
    objc_msgSend(v4, "maxDistance");
    v12 = v11;
    objc_msgSend(v4, "shortRangeDepthThreshold");
    v14 = v13;
    objc_msgSend(v4, "shortRangeConfidenceThreshold");
    appledepth::JasperPointCloud::initByApplyingFilters((uint64_t)&v5->super._pc, (uint64_t)&self->_pc, v6, objc_msgSend(v4, "bankIDMask"), v8, v10, v12, v14, v15);
    v16 = v5;
  }

  return v5;
}

- (__CVBuffer)createVisualizationOnImage:(__CVBuffer *)a3
{
  double v4;
  double v5;
  __CVBuffer *ConvertedPixelBufferFormat;
  float v7;
  int v8;
  unint64_t v9;
  JasperPointCloudDataHeader *v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float32x2_t v19;
  float v20;
  float v21;
  size_t v22;
  size_t v23;
  const __CFAllocator *v24;
  const __CFDictionary *BufferAttributes;
  __CVBuffer *v26;
  uint64_t v27;
  CGPoint *v28;
  CGPoint *v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  JasperPointCloudDataHeader *m_header;
  uint64_t v34;
  double v35;
  double v36;
  float v37;
  __CVBuffer *v38;
  float64x2_t v40;
  CVPixelBufferRef pixelBufferOut;

  if (a3)
  {
    v5 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    ConvertedPixelBufferFormat = PixelBufferUtils::createConvertedPixelBufferFormat(a3, (__CVBuffer *)0x42475241, 0);
    v7 = 1.0;
LABEL_19:
    v27 = operator new[]();
    v28 = (CGPoint *)operator new[]();
    v29 = v28;
    v30 = 0;
    v31 = 0;
    v32 = v7;
    m_header = self->_pc.m_header;
    if (m_header)
    {
      while (v31 < *((_QWORD *)m_header + 1))
      {
        v34 = v27 + v30;
        *(_OWORD *)v34 = *(_OWORD *)((char *)m_header + *((_QWORD *)m_header + 4) + v30);
        v35 = (v4 + *(double *)(v27 + v30 + 8)) * v32;
        *(double *)v34 = (v5 + *(double *)(v27 + v30)) * v32;
        *(double *)(v34 + 8) = v35;
        v36 = 0.0;
        if (*(float *)((char *)m_header + 4 * v31 + *((_QWORD *)m_header + 3)) > 0.8)
          v36 = *(float *)((char *)m_header + v30 + *((_QWORD *)m_header + 2) + 8) / 1000.0;
        v37 = v36;
        *((float *)&v28->x + v31++) = v37;
        v30 += 16;
      }
      v38 = (__CVBuffer *)*((_QWORD *)m_header + 1);
    }
    else
    {
      v38 = 0;
    }
    PixelBufferUtils::colorizePointCloudOnPixelBuffer(ConvertedPixelBufferFormat, v38, v27, v28, 0, 0.0, 5.0, 0.0);
    MEMORY[0x23B7F1D4C](v29, 0x1000C8052888210);
    MEMORY[0x23B7F1D4C](v27, 0x1000C80451B5BE8);
    return ConvertedPixelBufferFormat;
  }
  v8 = 0;
  v9 = 0;
  v10 = self->_pc.m_header;
  v11 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
  v12 = (float64x2_t)vdupq_n_s64(0x3810000000000000uLL);
  while (v9 < *((_QWORD *)v10 + 1))
  {
    if (*(float *)((char *)v10 + 4 * v9 + *((_QWORD *)v10 + 3)) > 0.0)
    {
      v13 = *(float64x2_t *)((char *)v10 + 16 * v9 + *((_QWORD *)v10 + 4));
      v11 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v11, v13), (int8x16_t)v13, (int8x16_t)v11);
      v12 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v12), (int8x16_t)v13, (int8x16_t)v12);
      ++v8;
    }
    ++v9;
  }
  if (!v8)
    return 0;
  v40 = v11;
  __asm { FMOV            V1.2D, #24.0 }
  v19 = vcvt_f32_f64(vaddq_f64(vsubq_f64(v12, v11), _Q1));
  v20 = v19.f32[1];
  if (v19.f32[1] >= v19.f32[0])
    v21 = v19.f32[0];
  else
    v21 = v19.f32[1];
  v7 = 1.0;
  if (v21 < 600.0)
  {
    v7 = 600.0 / v21;
    v19.f32[0] = (float)(600.0 / v21) * v19.f32[0];
    v20 = (float)(600.0 / v21) * v19.f32[1];
  }
  v22 = (unint64_t)v19.f32[0];
  v23 = (unint64_t)v20;
  pixelBufferOut = 0;
  v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  if (CVPixelBufferCreate(v24, v22, v23, 0x42475241u, BufferAttributes, &pixelBufferOut))
    ConvertedPixelBufferFormat = 0;
  else
    ConvertedPixelBufferFormat = pixelBufferOut;
  if (ConvertedPixelBufferFormat)
  {
    v4 = 12.0 - v40.f64[1];
    v5 = 12.0 - v40.f64[0];
    PixelBufferUtils::blacken(ConvertedPixelBufferFormat, v26);
    goto LABEL_19;
  }
  return ConvertedPixelBufferFormat;
}

- (__CVBuffer)createVisualization
{
  return -[ADJasperPointCloud createVisualizationOnImage:](self, "createVisualizationOnImage:", 0);
}

- (CGImage)cgImageRepresentation
{
  __CVBuffer *v2;
  __CVBuffer *v3;

  v2 = -[ADJasperPointCloud createVisualization](self, "createVisualization");
  return PixelBufferUtils::pixelBufferToCGImage(v2, v3);
}

- (id)imageRepresentationForUTI:(id)a3
{
  __CFString *v4;
  __CFData *v5;
  __CFData *v6;
  CGImageDestinationRef idst;
  CFMutableDataRef Mutable;
  CGImageRef image;

  v4 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v5 = (__CFData *)objc_claimAutoreleasedReturnValue();
  image = -[ADJasperPointCloud cgImageRepresentation](self, "cgImageRepresentation");
  Mutable = CFDataCreateMutable(0, 0);
  idst = CGImageDestinationCreateWithData(v5, v4, 1uLL, 0);
  CGImageDestinationAddImage(idst, image, 0);
  if (CGImageDestinationFinalize(idst))
    v6 = v5;
  else
    v6 = 0;
  ScopedCFObject<CGImageDestination *>::~ScopedCFObject((const void **)&idst);
  ScopedCFObject<__CFData *>::~ScopedCFObject((const void **)&Mutable);
  ScopedCFObject<CGImage *>::~ScopedCFObject((const void **)&image);

  return v6;
}

- (id)pngRepresentation
{
  return -[ADJasperPointCloud imageRepresentationForUTI:](self, "imageRepresentationForUTI:", CFSTR("public.png"));
}

- (id)jpegRepresentation
{
  return -[ADJasperPointCloud imageRepresentationForUTI:](self, "imageRepresentationForUTI:", CFSTR("public.jpeg"));
}

- (BOOL)pointCloudToImageFile:(id)a3 uti:(id)a4 atomically:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a5;
  v8 = a3;
  -[ADJasperPointCloud imageRepresentationForUTI:](self, "imageRepresentationForUTI:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "writeToFile:atomically:", v8, v5);
  else
    v11 = 0;

  return v11;
}

- (id)debugQuickLookObject
{
  return (id)debugQuickLookObjectFromCGImage(-[ADJasperPointCloud cgImageRepresentation](self, "cgImageRepresentation"));
}

+ (unint64_t)requiredStorageBytesForLength:(int)a3
{
  return +[ADJasperPointCloud requiredStorageBytesForLength:additionalDataSize:](ADJasperPointCloud, "requiredStorageBytesForLength:additionalDataSize:", *(_QWORD *)&a3, 0);
}

+ (BOOL)prepareDataBuffer:(__CVBuffer *)a3 forLength:(int)a4
{
  return +[ADJasperPointCloud prepareDataBuffer:forLength:additionalDataSize:](ADJasperPointCloud, "prepareDataBuffer:forLength:additionalDataSize:", a3, *(_QWORD *)&a4, 0);
}

+ (id)JasperCSVAttributeNamesCannonicalOrder
{
  return &unk_2507B9890;
}

+ (int64_t)getKeyForName:(id)a3
{
  id v3;
  void *v4;
  unint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[ADJasperPointCloud JasperCSVAttributeNamesCannonicalOrder](ADJasperPointCloud, "JasperCSVAttributeNamesCannonicalOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v4, "count"); ++i)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "objectAtIndexedSubscript:", i, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "lowercaseString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "lowercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if ((v12 & 1) != 0)
          {

            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  i = 15;
LABEL_13:

  return i;
}

+ (id)pointCloudFromCSV:(id)a3
{
  id v4;
  id v5;
  ADMutableJasperPointCloud *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int32x4_t v20;
  int v21;
  int v22;
  ADMutableJasperPointCloud *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  float v32;
  void *v33;
  float v34;
  void *v35;
  float v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  double v45;
  uint64_t v46;
  double v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  double *v54;
  double v55;
  uint64_t v56;
  double v57;
  void *v58;
  float v59;
  float v60;
  void *v61;
  float v62;
  float v63;
  double *v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  void *v69;
  int v70;
  void *v71;
  float v72;
  void *v73;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  uint8_t buf[4];
  void *v87;
  uint8_t v88[16];
  __int128 v89;
  _BYTE v90[28];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v85 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v4, 1, &v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v85;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "description");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v88 = 138412290;
      *(_QWORD *)&v88[4] = v73;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "error opening jasper file: %@", v88, 0xCu);

    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(v84, "componentsSeparatedByString:", CFSTR("\n"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v83, "count") > 1)
    {
      *(_QWORD *)&v7 = -1;
      *((_QWORD *)&v7 + 1) = -1;
      *(_OWORD *)&v90[12] = v7;
      v89 = v7;
      *(_OWORD *)v90 = v7;
      *(_OWORD *)v88 = v7;
      objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v77, "componentsSeparatedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v12 = MEMORY[0x24BDACB70];
      v76 = v4;
      while (v11 < objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(a1, "getKeyForName:", v13);

        if (v14 < 15)
        {
          *(_DWORD *)&v88[4 * v14] = v11;
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v87 = v15;
          _os_log_error_impl(&dword_236382000, v12, OS_LOG_TYPE_ERROR, "unknown jasper point cloud key %@. ignoring", buf, 0xCu);

        }
        ++v11;
      }
      v16 = *(_DWORD *)&v90[16];
      v17 = *(_DWORD *)&v90[20];
      v18 = *(_DWORD *)&v90[12];
      v19 = *(_DWORD *)&v88[4];
      v20.i64[0] = __PAIR64__(*(unsigned int *)&v90[12], *(unsigned int *)&v90[16]);
      v20.i64[1] = __PAIR64__(*(unsigned int *)&v88[4], *(unsigned int *)&v90[20]);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_s32(v20))) & 1) != 0
        || (v21 = *(_DWORD *)v88, v22 = *(_DWORD *)&v88[8], (*(_DWORD *)v88 | *(_DWORD *)&v88[8]) < 0)
        || (v75 = v89, (v89 & 0x80000000) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to load point cloud: file is missing essential fields", buf, 2u);
        }
        v6 = 0;
        v5 = 0;
        v4 = v76;
      }
      else
      {
        v23 = -[ADMutableJasperPointCloud initWithCapacity:]([ADMutableJasperPointCloud alloc], "initWithCapacity:", objc_msgSend(v83, "count") - 1);
        v24 = 0;
        v25 = 0;
        v78 = v16;
        v79 = v18;
        v82 = v22;
        v80 = v19;
        v81 = v21;
        v5 = 0;
        v4 = v76;
        while (1)
        {
          if (v25 >= -[ADMutableJasperPointCloud capacity](v23, "capacity"))
            goto LABEL_52;
          objc_msgSend(v83, "objectAtIndexedSubscript:", v25 + 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsSeparatedByString:", CFSTR(","));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v27, "count") == 1)
          {
            objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqualToString:", &stru_2507B2640);

            if (v29)
            {

LABEL_52:
              -[ADMutableJasperPointCloud resize:](v23, "resize:", v25);
              v6 = v23;
              goto LABEL_53;
            }
          }
          v30 = objc_msgSend(v27, "count");
          if (v30 != objc_msgSend(v10, "count"))
            break;
          objc_msgSend(v27, "objectAtIndexedSubscript:", v82);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "floatValue");
          -[ADMutableJasperPointCloud mutableEchoIds](v23, "mutableEchoIds")[v25] = (int)v32;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v81);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "floatValue");
          -[ADMutableJasperPointCloud mutableBankIds](v23, "mutableBankIds")[v25] = (int)v34;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v80);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          -[ADMutableJasperPointCloud mutableSpotIds](v23, "mutableSpotIds")[v25] = (int)v36;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v75);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatValue");
          *(_DWORD *)(-[ADMutableJasperPointCloud mutableConfidences](v23, "mutableConfidences") + 4 * v25) = v38;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v79);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "floatValue");
          *(_DWORD *)(-[ADMutableJasperPointCloud mutablePoints](v23, "mutablePoints") + v24) = v40;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v78);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "floatValue");
          *(_DWORD *)(-[ADMutableJasperPointCloud mutablePoints](v23, "mutablePoints") + v24 + 4) = v42;

          objc_msgSend(v27, "objectAtIndexedSubscript:", v17);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "floatValue");
          *(_DWORD *)(-[ADMutableJasperPointCloud mutablePoints](v23, "mutablePoints") + v24 + 8) = v44;

          v45 = NAN;
          if ((HIDWORD(v89) & 0x80000000) != 0)
          {
            v47 = NAN;
          }
          else
          {
            v46 = *(unsigned int *)v90;
            v47 = NAN;
            if ((*(_DWORD *)v90 & 0x80000000) == 0)
            {
              objc_msgSend(v27, "objectAtIndexedSubscript:");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "floatValue");
              v50 = v49;
              objc_msgSend(v27, "objectAtIndexedSubscript:", v46);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "floatValue");
              v53 = v52;

              v45 = v50;
              v47 = v53;
            }
          }
          v54 = (double *)(-[ADMutableJasperPointCloud mutableCameraPixels](v23, "mutableCameraPixels") + v24);
          *v54 = v45;
          v54[1] = v47;
          v55 = NAN;
          if ((*(_DWORD *)&v90[4] & 0x80000000) != 0)
          {
            v57 = NAN;
          }
          else
          {
            v56 = *(unsigned int *)&v90[8];
            v57 = NAN;
            if ((*(_DWORD *)&v90[8] & 0x80000000) == 0)
            {
              objc_msgSend(v27, "objectAtIndexedSubscript:");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "floatValue");
              v60 = v59;
              objc_msgSend(v27, "objectAtIndexedSubscript:", v56);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "floatValue");
              v63 = v62;

              v55 = v60;
              v57 = v63;
            }
          }
          v64 = (double *)(-[ADMutableJasperPointCloud mutableUndistortedCameraPixels](v23, "mutableUndistortedCameraPixels")+ v24);
          *v64 = v55;
          v64[1] = v57;
          if ((*(_DWORD *)&v88[12] & 0x80000000) != 0)
          {
            -[ADMutableJasperPointCloud mutableEuclideanDistances](v23, "mutableEuclideanDistances")[4 * v25] = NAN;
          }
          else
          {
            objc_msgSend(v27, "objectAtIndexedSubscript:");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "floatValue");
            *(_DWORD *)(-[ADMutableJasperPointCloud mutableEuclideanDistances](v23, "mutableEuclideanDistances")
                      + 4 * v25) = v66;

          }
          if ((DWORD1(v89) & 0x80000000) != 0)
          {
            -[ADMutableJasperPointCloud mutableIntensities](v23, "mutableIntensities")[4 * v25] = NAN;
          }
          else
          {
            objc_msgSend(v27, "objectAtIndexedSubscript:");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "floatValue");
            *(_DWORD *)(-[ADMutableJasperPointCloud mutableIntensities](v23, "mutableIntensities") + 4 * v25) = v68;

          }
          if ((DWORD2(v89) & 0x80000000) != 0)
          {
            -[ADMutableJasperPointCloud mutableSignalToNoiseRatios](v23, "mutableSignalToNoiseRatios")[4 * v25] = NAN;
          }
          else
          {
            objc_msgSend(v27, "objectAtIndexedSubscript:");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "floatValue");
            *(_DWORD *)(-[ADMutableJasperPointCloud mutableSignalToNoiseRatios](v23, "mutableSignalToNoiseRatios")
                      + 4 * v25) = v70;

          }
          if ((*(_DWORD *)&v90[24] & 0x80000000) != 0)
          {
            -[ADMutableJasperPointCloud mutableFlags](v23, "mutableFlags")[4 * v25] = 0;
          }
          else
          {
            objc_msgSend(v27, "objectAtIndexedSubscript:");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "floatValue");
            -[ADMutableJasperPointCloud mutableFlags](v23, "mutableFlags")[4 * v25] = v72;

          }
          v24 += 16;
          ++v25;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to load point cloud: number of fields in header do not match data.", buf, 2u);
        }

        v6 = 0;
LABEL_53:

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v88 = 0;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "error parsing jasper file: no enough points", v88, 2u);
      }
      v6 = 0;
    }

  }
  return v6;
}

+ (id)pointCloudFromJSPP:(id)a3
{
  void *v3;
  ADJasperPointCloud *v4;
  id v5;
  ADJasperPointCloud *v6;
  ADJasperPointCloud *v7;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithContentsOfFile:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [ADJasperPointCloud alloc];
  v5 = objc_retainAutorelease(v3);
  v6 = -[ADJasperPointCloud initWithPreparedStorage:storageSize:](v4, "initWithPreparedStorage:storageSize:", objc_msgSend(v5, "mutableBytes"), objc_msgSend(v5, "length"));
  v7 = -[ADJasperPointCloud initWithPointCloud:]([ADJasperPointCloud alloc], "initWithPointCloud:", v6);

  return v7;
}

+ (id)pointCloudFromFile:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  ADJasperPointCloud *v9;
  void *v10;
  ADJasperPointCloud *v11;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR(".csv"));

  if (v5)
  {
    +[ADJasperPointCloud pointCloudFromCSV:](ADJasperPointCloud, "pointCloudFromCSV:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v3, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSuffix:", CFSTR(".jspp"));

  if (v8)
  {
    +[ADJasperPointCloud pointCloudFromJSPP:](ADJasperPointCloud, "pointCloudFromJSPP:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (ADJasperPointCloud *)v6;
    if (!v6)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v9 = -[ADJasperPointCloud initWithDictionaryRepresentation:]([ADJasperPointCloud alloc], "initWithDictionaryRepresentation:", v10);
  else
    v9 = 0;

  if (v9)
  {
LABEL_11:
    appledepth::JasperPointCloud::applyPerformanceOverrides((appledepth::JasperPointCloud *)&v9->_pc);
    v11 = v9;
  }
LABEL_12:

  return v9;
}

+ (id)pointCloudByMergingPointClouds:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[ADJasperPointCloud initByMergingPointClouds:]([ADJasperPointCloud alloc], "initByMergingPointClouds:", v3);

  return v4;
}

+ (id)pointCloudByMergingPointClouds:(id)a3 applyingTransforms:(id *)a4 projectingToCamera:(id)a5
{
  id v7;
  id v8;
  ADJasperPointCloud *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  double *v15;
  void *v16;
  int v17;
  uint64_t v18;
  ADJasperPointCloud *v19;
  int v20;
  JasperPointCloudDataHeader *m_header;
  void *__p;
  _BYTE *v24;

  v7 = a3;
  v8 = a5;
  v9 = [ADJasperPointCloud alloc];
  if (v9)
  {
    std::vector<appledepth::JasperPointCloud const*>::vector(&__p, objc_msgSend(v7, "count"));
    if (v24 != __p)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)__p + v10) = v11 + 8;

        ++v10;
      }
      while (v10 < (v24 - (_BYTE *)__p) >> 3);
    }
    v12 = objc_msgSend(v7, "count");
    if (appledepth::JasperPointCloud::initByMerging((appledepth::JasperPointCloud *)&v9->_pc, v12, (const appledepth::JasperPointCloud **)__p))
    {
      v13 = 0;
      v14 = 0;
      v15 = (double *)((char *)a4 + 32);
      while (v14 < objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        v18 = (uint64_t)v9->_pc.m_header + 16 * v13 + *((_QWORD *)v9->_pc.m_header + 2);
        +[ADCameraCalibration transform:points:with:outPoints:](ADCameraCalibration, "transform:points:with:outPoints:", v17, v18, v18, *(v15 - 4), *(v15 - 2), *v15, v15[2]);
        v13 += v17;
        ++v14;
        v15 += 8;
      }
      v20 = -[ADJasperPointCloud length](v9, "length");
      m_header = v9->_pc.m_header;
      objc_msgSend(v8, "project:points:outUndistortedPixels:outR:", v20, (char *)m_header + *((_QWORD *)m_header + 2), (char *)m_header + *((_QWORD *)m_header + 5), (char *)m_header + *((_QWORD *)m_header + 6));
      objc_msgSend(v8, "distort:undistortedPixels:outDistorted:", -[ADJasperPointCloud length](v9, "length"), (char *)v9->_pc.m_header + *((_QWORD *)v9->_pc.m_header + 5), (char *)v9->_pc.m_header + *((_QWORD *)v9->_pc.m_header + 4));
      v19 = v9;
    }
    else
    {
      v19 = 0;
    }
    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (void)setPerformanceOverrides:(id)a3
{
  id v3;
  ADJasperPerformanceOverride *v4;
  uint64_t *Instance;
  void *__p[2];
  char v7;

  v3 = objc_retainAutorelease(a3);
  v4 = (ADJasperPerformanceOverride *)std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "UTF8String"));
  Instance = (uint64_t *)ADJasperPerformanceOverride::getInstance(v4);
  ADJasperPerformanceOverride::initFromCsv(Instance, (std::string::size_type)__p);
  if (v7 < 0)
    operator delete(__p[0]);

}

+ (void)setEmulatedDevice:(id)a3
{
  id v3;
  void *v4;
  char *v5;
  ADJasperPerformanceOverride *v6;
  uint64_t Instance;
  std::string __str;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  else
    v5 = "";
  v6 = (ADJasperPerformanceOverride *)std::string::basic_string[abi:ne180100]<0>(&__str, v5);
  Instance = ADJasperPerformanceOverride::getInstance(v6);
  std::string::operator=((std::string *)(Instance + 8), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

}

@end
