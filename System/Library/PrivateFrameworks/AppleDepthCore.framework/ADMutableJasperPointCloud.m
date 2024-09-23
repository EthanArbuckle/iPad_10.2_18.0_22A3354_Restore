@implementation ADMutableJasperPointCloud

- (float)mutableEuclideanDistances
{
  return (float *)((char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 6));
}

- (CGPoint)mutableUndistortedCameraPixels
{
  return (CGPoint *)((char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 5));
}

- (char)mutableSpotIds
{
  return (char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 10);
}

- (float)mutableSignalToNoiseRatios
{
  return (float *)((char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 8));
}

- (uint64_t)mutablePoints
{
  return *(_QWORD *)(a1 + 16) + *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
}

- (float)mutableIntensities
{
  return (float *)((char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 7));
}

- (unsigned)mutableFlags
{
  return (unsigned int *)((char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 12));
}

- (char)mutableEchoIds
{
  return (char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 11);
}

- (float)mutableConfidences
{
  return (float *)((char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 3));
}

- (CGPoint)mutableCameraPixels
{
  return (CGPoint *)((char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 4));
}

- (char)mutableBankIds
{
  return (char *)self->super._pc.m_header + *((_QWORD *)self->super._pc.m_header + 9);
}

- (void)applyPerformanceOverrides
{
  appledepth::JasperPointCloud::applyPerformanceOverrides((appledepth::JasperPointCloud *)&self->super._pc);
}

- (ADMutableJasperPointCloud)initWithCapacity:(int)a3
{
  ADMutableJasperPointCloud *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ADMutableJasperPointCloud;
  result = -[ADJasperPointCloud initWithLength:](&v4, sel_initWithLength_, *(_QWORD *)&a3);
  if (result)
    *((_QWORD *)result->super._pc.m_header + 1) = 0;
  return result;
}

- (ADMutableJasperPointCloud)initWithCapacity:(int)a3 storage:(__CVBuffer *)a4
{
  ADMutableJasperPointCloud *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADMutableJasperPointCloud;
  result = -[ADJasperPointCloud initWithLength:storage:](&v5, sel_initWithLength_storage_, *(_QWORD *)&a3, a4);
  if (result)
    *((_QWORD *)result->super._pc.m_header + 1) = 0;
  return result;
}

- (int)capacity
{
  return self->super._pc.m_capacity;
}

- (void)resize:(int)a3
{
  if (self->super._pc.m_capacity >= a3)
    *((_QWORD *)self->super._pc.m_header + 1) = a3;
  else
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot resize a point cloud if capacity doesn't permit so"));
}

- (void)blacken
{
  appledepth::JasperPointCloud::blacken((appledepth::JasperPointCloud *)&self->super._pc);
}

- (void)appendPointsFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4[2];
  if (v5)
    v6 = *(_QWORD *)(v5 + 8);
  else
    v6 = 0;
  v7 = v4;
  -[ADMutableJasperPointCloud appendPointsFrom:range:](self, "appendPointsFrom:range:", v4, 0, v6);

}

- (void)appendPointsFrom:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  JasperPointCloudDataHeader *m_header;
  uint64_t v8;
  char *v9;

  length = a4.length;
  location = a4.location;
  v9 = (char *)a3;
  m_header = self->super._pc.m_header;
  if (m_header)
    v8 = *((_QWORD *)m_header + 1);
  else
    v8 = 0;
  -[ADMutableJasperPointCloud resize:](self, "resize:", (v8 + length));
  appledepth::JasperPointCloud::replacePoints((appledepth::JasperPointCloud *)&self->super._pc, v8, length, (const appledepth::JasperPointCloud *)(v9 + 8), location);

}

- (void)replacePointsInRange:(_NSRange)a3 withPointsFrom:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  char *v10;

  length = a5.length;
  location = a5.location;
  v7 = a3.length;
  v8 = a3.location;
  v10 = (char *)a4;
  if (v7 != length)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot replace a given number of points with a different number of points"));
  if ((appledepth::JasperPointCloud::replacePoints((appledepth::JasperPointCloud *)&self->super._pc, v8, v7, (const appledepth::JasperPointCloud *)(v10 + 8), location) & 1) == 0)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Range is outside of point cloud bounds"));

}

@end
