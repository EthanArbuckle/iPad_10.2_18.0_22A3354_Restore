@implementation SHCustomCatalogConfiguration

- (SHCustomCatalogConfiguration)init
{
  SHCustomCatalogConfiguration *v2;
  SHCustomCatalogConfiguration *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHCustomCatalogConfiguration;
  v2 = -[SHCatalogConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_density = 3;
    v2->_algorithm = 0;
    +[SHRange rangeWithLowerBound:upperBound:](SHRange, "rangeWithLowerBound:upperBound:", 1.0, 12.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHCatalogConfiguration setSignatureDurationRange:](v3, "setSignatureDurationRange:", v4);

    -[SHCatalogConfiguration setStreamingBufferDuration:](v3, "setStreamingBufferDuration:", 240.0);
    -[SHCustomCatalogConfiguration setSupportsSignatureTracking:](v3, "setSupportsSignatureTracking:", 0);
    v3->_numHistogramBuckets = 6;
    v3->_scoreThreshold = 1.0;
    v3->_queryThreshold = 1.0;
    v3->_boundingBox = 3;
    v3->_frequencyPenaltyMultiplier = 0.5;
    v3->_forwardPassOnly = 0;
    v3->_singlePassOnly = 0;
    v3->_refineStartEnd = 0;
  }
  return v3;
}

+ (double)maximumSearchableQuerySignatureDuration
{
  return 12.0;
}

+ (double)minimumQuerySignatureDurationForTracking
{
  return 2.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_opt_new();
  -[SHCatalogConfiguration installationID](self, "installationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstallationID:", v7);

  objc_msgSend(v5, "setDensity:", -[SHCustomCatalogConfiguration density](self, "density"));
  objc_msgSend(v5, "setAlgorithm:", -[SHCustomCatalogConfiguration algorithm](self, "algorithm"));
  objc_msgSend(v5, "setSupportsSignatureTracking:", -[SHCustomCatalogConfiguration supportsSignatureTracking](self, "supportsSignatureTracking"));
  -[SHCatalogConfiguration signatureDurationRange](self, "signatureDurationRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setSignatureDurationRange:", v9);

  -[SHCatalogConfiguration streamingBufferDuration](self, "streamingBufferDuration");
  objc_msgSend(v5, "setStreamingBufferDuration:");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHCustomCatalogConfiguration;
  v4 = a3;
  -[SHCatalogConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[SHCustomCatalogConfiguration density](self, "density", v5.receiver, v5.super_class), CFSTR("SHCatalogConfigurationDensityKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SHCustomCatalogConfiguration algorithm](self, "algorithm"), CFSTR("SHCatalogConfigurationAlgorithmKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SHCustomCatalogConfiguration supportsSignatureTracking](self, "supportsSignatureTracking"), CFSTR("SHCatalogConfigurationSupportsSignatureTrackingKey"));

}

- (SHCustomCatalogConfiguration)initWithCoder:(id)a3
{
  id v4;
  SHCustomCatalogConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SHCustomCatalogConfiguration;
  v5 = -[SHCatalogConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_density = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SHCatalogConfigurationDensityKey"));
    v5->_algorithm = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SHCatalogConfigurationAlgorithmKey"));
    v5->_supportsSignatureTracking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SHCatalogConfigurationSupportsSignatureTrackingKey"));
  }

  return v5;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int64_t)a3
{
  self->_algorithm = a3;
}

- (int64_t)density
{
  return self->_density;
}

- (void)setDensity:(int64_t)a3
{
  self->_density = a3;
}

- (BOOL)supportsSignatureTracking
{
  return self->_supportsSignatureTracking;
}

- (void)setSupportsSignatureTracking:(BOOL)a3
{
  self->_supportsSignatureTracking = a3;
}

- (int64_t)numHistogramBuckets
{
  return self->_numHistogramBuckets;
}

- (void)setNumHistogramBuckets:(int64_t)a3
{
  self->_numHistogramBuckets = a3;
}

- (float)scoreThreshold
{
  return self->_scoreThreshold;
}

- (void)setScoreThreshold:(float)a3
{
  self->_scoreThreshold = a3;
}

- (float)queryThreshold
{
  return self->_queryThreshold;
}

- (void)setQueryThreshold:(float)a3
{
  self->_queryThreshold = a3;
}

- (int64_t)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(int64_t)a3
{
  self->_boundingBox = a3;
}

- (float)frequencyPenaltyMultiplier
{
  return self->_frequencyPenaltyMultiplier;
}

- (void)setFrequencyPenaltyMultiplier:(float)a3
{
  self->_frequencyPenaltyMultiplier = a3;
}

- (BOOL)forwardPassOnly
{
  return self->_forwardPassOnly;
}

- (void)setForwardPassOnly:(BOOL)a3
{
  self->_forwardPassOnly = a3;
}

- (BOOL)singlePassOnly
{
  return self->_singlePassOnly;
}

- (void)setSinglePassOnly:(BOOL)a3
{
  self->_singlePassOnly = a3;
}

- (BOOL)refineStartEnd
{
  return self->_refineStartEnd;
}

- (void)setRefineStartEnd:(BOOL)a3
{
  self->_refineStartEnd = a3;
}

@end
