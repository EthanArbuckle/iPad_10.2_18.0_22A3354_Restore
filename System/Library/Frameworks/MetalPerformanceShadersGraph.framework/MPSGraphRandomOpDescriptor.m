@implementation MPSGraphRandomOpDescriptor

+ (MPSGraphRandomOpDescriptor)descriptorWithDistribution:(MPSGraphRandomDistribution)distribution dataType:(MPSDataType)dataType
{
  uint64_t v4;
  MPSGraphRandomOpDescriptor *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = *(_QWORD *)&dataType;
  if ((int)dataType <= 268435487)
  {
    if (dataType == MPSDataTypeBFloat16 || dataType == MPSDataTypeFloat16)
      goto LABEL_10;
  }
  else if (dataType == MPSDataTypeFloat32 || dataType == MPSDataTypeInt32 || dataType == MPSDataTypeInt64)
  {
    goto LABEL_10;
  }
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_10:
  v6 = objc_alloc_init(MPSGraphRandomOpDescriptor);
  -[MPSGraphRandomOpDescriptor setDistribution:](v6, "setDistribution:", distribution);
  -[MPSGraphRandomOpDescriptor setDataType:](v6, "setDataType:", v4);
  -[MPSGraphRandomOpDescriptor setSamplingMethod:](v6, "setSamplingMethod:", 0);
  LODWORD(v7) = 0;
  -[MPSGraphRandomOpDescriptor setMin:](v6, "setMin:", v7);
  -[MPSGraphRandomOpDescriptor setMinInteger:](v6, "setMinInteger:", 0);
  LODWORD(v8) = 0;
  -[MPSGraphRandomOpDescriptor setMax:](v6, "setMax:", v8);
  -[MPSGraphRandomOpDescriptor setMaxInteger:](v6, "setMaxInteger:", 0);
  LODWORD(v9) = 0;
  -[MPSGraphRandomOpDescriptor setMean:](v6, "setMean:", v9);
  LODWORD(v10) = 0;
  -[MPSGraphRandomOpDescriptor setStandardDeviation:](v6, "setStandardDeviation:", v10);
  if (distribution == MPSGraphRandomDistributionUniform)
  {
    LODWORD(v11) = 0;
    -[MPSGraphRandomOpDescriptor setMin:](v6, "setMin:", v11);
    -[MPSGraphRandomOpDescriptor setMinInteger:](v6, "setMinInteger:", 0);
    LODWORD(v14) = 1.0;
    -[MPSGraphRandomOpDescriptor setMax:](v6, "setMax:", v14);
    -[MPSGraphRandomOpDescriptor setMaxInteger:](v6, "setMaxInteger:", 0x40000000);
    return v6;
  }
  if (distribution != MPSGraphRandomDistributionNormal)
  {
    if (distribution != MPSGraphRandomDistributionTruncatedNormal)
      return v6;
    LODWORD(v11) = -2.0;
    -[MPSGraphRandomOpDescriptor setMin:](v6, "setMin:", v11);
    LODWORD(v12) = 2.0;
    -[MPSGraphRandomOpDescriptor setMax:](v6, "setMax:", v12);
  }
  if ((_DWORD)v4 != 268435472
    && (_DWORD)v4 != 268435488
    && (_DWORD)v4 != -1879048176
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  LODWORD(v11) = 0;
  -[MPSGraphRandomOpDescriptor setMean:](v6, "setMean:", v11);
  LODWORD(v13) = 1.0;
  -[MPSGraphRandomOpDescriptor setStandardDeviation:](v6, "setStandardDeviation:", v13);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphRandomOpDescriptor *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = [MPSGraphRandomOpDescriptor alloc];
  -[MPSGraphRandomOpDescriptor setDistribution:](v4, "setDistribution:", self->_distribution);
  -[MPSGraphRandomOpDescriptor setDataType:](v4, "setDataType:", self->_dataType);
  *(float *)&v5 = self->_min;
  -[MPSGraphRandomOpDescriptor setMin:](v4, "setMin:", v5);
  *(float *)&v6 = self->_max;
  -[MPSGraphRandomOpDescriptor setMax:](v4, "setMax:", v6);
  -[MPSGraphRandomOpDescriptor setMinInteger:](v4, "setMinInteger:", self->_minInteger);
  -[MPSGraphRandomOpDescriptor setMaxInteger:](v4, "setMaxInteger:", self->_maxInteger);
  *(float *)&v7 = self->_mean;
  -[MPSGraphRandomOpDescriptor setMean:](v4, "setMean:", v7);
  *(float *)&v8 = self->_standardDeviation;
  -[MPSGraphRandomOpDescriptor setStandardDeviation:](v4, "setStandardDeviation:", v8);
  return v4;
}

- (MPSGraphRandomDistribution)distribution
{
  return self->_distribution;
}

- (void)setDistribution:(MPSGraphRandomDistribution)distribution
{
  self->_distribution = distribution;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (void)setDataType:(MPSDataType)dataType
{
  self->_dataType = dataType;
}

- (float)min
{
  return self->_min;
}

- (void)setMin:(float)min
{
  self->_min = min;
}

- (float)max
{
  return self->_max;
}

- (void)setMax:(float)max
{
  self->_max = max;
}

- (NSInteger)minInteger
{
  return self->_minInteger;
}

- (void)setMinInteger:(NSInteger)minInteger
{
  self->_minInteger = minInteger;
}

- (NSInteger)maxInteger
{
  return self->_maxInteger;
}

- (void)setMaxInteger:(NSInteger)maxInteger
{
  self->_maxInteger = maxInteger;
}

- (float)mean
{
  return self->_mean;
}

- (void)setMean:(float)mean
{
  self->_mean = mean;
}

- (float)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(float)standardDeviation
{
  self->_standardDeviation = standardDeviation;
}

- (MPSGraphRandomNormalSamplingMethod)samplingMethod
{
  return self->_samplingMethod;
}

- (void)setSamplingMethod:(MPSGraphRandomNormalSamplingMethod)samplingMethod
{
  self->_samplingMethod = samplingMethod;
}

@end
