@implementation ASDProgress

- (id)copyWithZone:(_NSZone *)a3
{
  ASDProgress *v5;
  uint64_t v6;
  NSString *bundleID;

  v5 = -[ASDProgress init](+[ASDProgress allocWithZone:](ASDProgress, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v5->_completedUnitCount = self->_completedUnitCount;
  v5->_reportRemotely = self->_reportRemotely;
  v5->_totalUnitCount = self->_totalUnitCount;
  v5->_downloadCompletedUnitCount = self->_downloadCompletedUnitCount;
  v5->_downloadTotalUnitCount = self->_downloadTotalUnitCount;
  v5->_installCompletedUnitCount = self->_installCompletedUnitCount;
  v5->_installTotalUnitCount = self->_installTotalUnitCount;
  v5->_postProcessCompletedUnitCount = self->_postProcessCompletedUnitCount;
  v5->_postProcessTotalUnitCount = self->_postProcessTotalUnitCount;
  v5->_hasPostProcessing = self->_hasPostProcessing;
  v5->_essentialBackgroundAssetDownloadEstimate = self->_essentialBackgroundAssetDownloadEstimate;
  v5->_phase = self->_phase;
  v5->_secondsRemaining = self->_secondsRemaining;
  v5->_throughput = self->_throughput;
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ASDProgress;
  -[ASDProgress description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {bundleID = %@; fractionCompleted = %.2f; reportRemotely = %d}"),
    v4,
    self->_bundleID,
    (double)self->_completedUnitCount / (double)self->_totalUnitCount,
    self->_reportRemotely);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("A"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_completedUnitCount, CFSTR("B"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_reportRemotely, CFSTR("C"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_totalUnitCount, CFSTR("D"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_downloadCompletedUnitCount, CFSTR("E"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_downloadTotalUnitCount, CFSTR("F"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_installCompletedUnitCount, CFSTR("G"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_installTotalUnitCount, CFSTR("H"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_postProcessCompletedUnitCount, CFSTR("K"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_postProcessTotalUnitCount, CFSTR("L"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasPostProcessing, CFSTR("M"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_essentialBackgroundAssetDownloadEstimate, CFSTR("N"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_phase, CFSTR("I"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_secondsRemaining, CFSTR("O"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("J"), self->_throughput);

}

- (ASDProgress)initWithCoder:(id)a3
{
  id v4;
  ASDProgress *v5;
  uint64_t v6;
  NSString *bundleID;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDProgress;
  v5 = -[ASDProgress init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("A"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_completedUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("B"));
    v5->_reportRemotely = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("C"));
    v5->_totalUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("D"));
    v5->_downloadCompletedUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("E"));
    v5->_downloadTotalUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("F"));
    v5->_installCompletedUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("G"));
    v5->_installTotalUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("H"));
    v5->_postProcessCompletedUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("K"));
    v5->_postProcessTotalUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("L"));
    v5->_hasPostProcessing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("M"));
    v5->_essentialBackgroundAssetDownloadEstimate = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("N"));
    v5->_phase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("I"));
    v5->_secondsRemaining = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("O"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("J"));
    v5->_throughput = v8;
  }

  return v5;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (BOOL)reportRemotely
{
  return self->_reportRemotely;
}

- (void)setReportRemotely:(BOOL)a3
{
  self->_reportRemotely = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (int64_t)downloadCompletedUnitCount
{
  return self->_downloadCompletedUnitCount;
}

- (void)setDownloadCompletedUnitCount:(int64_t)a3
{
  self->_downloadCompletedUnitCount = a3;
}

- (int64_t)downloadTotalUnitCount
{
  return self->_downloadTotalUnitCount;
}

- (void)setDownloadTotalUnitCount:(int64_t)a3
{
  self->_downloadTotalUnitCount = a3;
}

- (int64_t)installCompletedUnitCount
{
  return self->_installCompletedUnitCount;
}

- (void)setInstallCompletedUnitCount:(int64_t)a3
{
  self->_installCompletedUnitCount = a3;
}

- (int64_t)installTotalUnitCount
{
  return self->_installTotalUnitCount;
}

- (void)setInstallTotalUnitCount:(int64_t)a3
{
  self->_installTotalUnitCount = a3;
}

- (int64_t)postProcessCompletedUnitCount
{
  return self->_postProcessCompletedUnitCount;
}

- (void)setPostProcessCompletedUnitCount:(int64_t)a3
{
  self->_postProcessCompletedUnitCount = a3;
}

- (int64_t)postProcessTotalUnitCount
{
  return self->_postProcessTotalUnitCount;
}

- (void)setPostProcessTotalUnitCount:(int64_t)a3
{
  self->_postProcessTotalUnitCount = a3;
}

- (BOOL)hasPostProcessing
{
  return self->_hasPostProcessing;
}

- (void)setHasPostProcessing:(BOOL)a3
{
  self->_hasPostProcessing = a3;
}

- (int64_t)essentialBackgroundAssetDownloadEstimate
{
  return self->_essentialBackgroundAssetDownloadEstimate;
}

- (void)setEssentialBackgroundAssetDownloadEstimate:(int64_t)a3
{
  self->_essentialBackgroundAssetDownloadEstimate = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (int64_t)secondsRemaining
{
  return self->_secondsRemaining;
}

- (void)setSecondsRemaining:(int64_t)a3
{
  self->_secondsRemaining = a3;
}

- (double)throughput
{
  return self->_throughput;
}

- (void)setThroughput:(double)a3
{
  self->_throughput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
