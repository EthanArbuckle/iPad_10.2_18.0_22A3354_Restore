@implementation AVPointCloudData

+ (void)initialize
{
  objc_opt_class();
}

- (id)debugDescription
{
  uint64_t v3;
  int64_t v4;
  void *v5;

  -[AVPointCloudData pointCloudFormatType](self, "pointCloudFormatType");
  v3 = AVStringForOSType();
  v4 = -[AVPointCloudData pointCount](self, "pointCount");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("'%@' %d points"), v3, v4);
  if ((int)v4 >= 1)
    objc_msgSend(v5, "appendFormat:", CFSTR(", bank:%d"), *(unsigned __int8 *)-[AVPointCloudData bankIdentifiers](self, "bankIdentifiers"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v5);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVPointCloudData debugDescription](self, "debugDescription"));
}

- (void)dealloc
{
  __CVBuffer *dataBuffer;
  objc_super v4;

  dataBuffer = self->_dataBuffer;
  if (dataBuffer)
    CFRelease(dataBuffer);
  v4.receiver = self;
  v4.super_class = (Class)AVPointCloudData;
  -[AVPointCloudData dealloc](&v4, sel_dealloc);
}

- (ADJasperPointCloud)jasperPointCloud
{
  ADJasperPointCloud *result;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  result = self->_jasperPointCloud;
  if (!result)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__1;
    v10 = __Block_byref_object_dispose__1;
    v4 = (void *)getADJasperPointCloudClass_softClass;
    v11 = getADJasperPointCloudClass_softClass;
    if (!getADJasperPointCloudClass_softClass)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __getADJasperPointCloudClass_block_invoke;
      v5[3] = &unk_1E42165D0;
      v5[4] = &v6;
      __getADJasperPointCloudClass_block_invoke((uint64_t)v5);
      v4 = (void *)v7[5];
    }
    _Block_object_dispose(&v6, 8);
    result = (ADJasperPointCloud *)(id)objc_msgSend(v4, "makeWithDataBuffer:", self->_dataBuffer);
    self->_jasperPointCloud = result;
  }
  return result;
}

- (unsigned)pointCloudFormatType
{
  __CVBuffer *dataBuffer;

  dataBuffer = self->_dataBuffer;
  if (dataBuffer)
    LODWORD(dataBuffer) = CVDataBufferGetPixelFormatType();
  return dataBuffer;
}

- (int64_t)pointCount
{
  return (int)-[ADJasperPointCloud length](-[AVPointCloudData jasperPointCloud](self, "jasperPointCloud"), "length");
}

- (uint64_t)points
{
  if (objc_msgSend(a1, "pointCloudFormatType") == 1785950320)
    return objc_msgSend((id)objc_msgSend(a1, "jasperPointCloud"), "points");
  else
    return 0;
}

- (const)confidenceScores
{
  if (-[AVPointCloudData pointCloudFormatType](self, "pointCloudFormatType") == 1785950320)
    return (const float *)-[ADJasperPointCloud confidences](-[AVPointCloudData jasperPointCloud](self, "jasperPointCloud"), "confidences");
  else
    return 0;
}

- (uint64_t)pointsAndConfidenceScores
{
  objc_msgSend(a1, "pointCloudFormatType");
  return 0;
}

- (const)spotIdentifiers
{
  if (-[AVPointCloudData pointCloudFormatType](self, "pointCloudFormatType") == 1785950320)
    return (const char *)-[ADJasperPointCloud spotIds](-[AVPointCloudData jasperPointCloud](self, "jasperPointCloud"), "spotIds");
  else
    return 0;
}

- (const)bankIdentifiers
{
  if (-[AVPointCloudData pointCloudFormatType](self, "pointCloudFormatType") == 1785950320)
    return (const char *)-[ADJasperPointCloud bankIds](-[AVPointCloudData jasperPointCloud](self, "jasperPointCloud"), "bankIds");
  else
    return 0;
}

- (__CVBuffer)pointCloudDataBuffer
{
  return self->_dataBuffer;
}

- (int64_t)projectorMode
{
  return self->_projectorMode;
}

- (AVPointCloudData)initWithDataBuffer:(__CVBuffer *)a3
{
  AVPointCloudData *v4;
  __CVBuffer *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPointCloudData;
  v4 = -[AVPointCloudData init](&v8, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (__CVBuffer *)CFRetain(a3);
    else
      v5 = 0;
    v4->_dataBuffer = v5;
    v6 = (void *)CVBufferCopyAttachment(v5, (CFStringRef)*MEMORY[0x1E0D04138], 0);
    if (v6)
      v6 = (void *)CFAutorelease(v6);
    v4->_projectorMode = (int)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D050B8]), "intValue");
  }
  return v4;
}

@end
