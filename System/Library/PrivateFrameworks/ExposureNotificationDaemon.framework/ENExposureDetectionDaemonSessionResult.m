@implementation ENExposureDetectionDaemonSessionResult

- (ENExposureDetectionDaemonSessionStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ENExposureDetectionSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)differentialPrivacyRiskParameters
{
  return self->_differentialPrivacyRiskParameters;
}

- (void)setDifferentialPrivacyRiskParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)differentialPrivacyBeaconCount
{
  return self->_differentialPrivacyBeaconCount;
}

- (void)setDifferentialPrivacyBeaconCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ENExposureClassification)exposureClassification
{
  return self->_exposureClassification;
}

- (void)setExposureClassification:(id)a3
{
  objc_storeStrong((id *)&self->_exposureClassification, a3);
}

- (int64_t)exposureClassificationStatus
{
  return self->_exposureClassificationStatus;
}

- (void)setExposureClassificationStatus:(int64_t)a3
{
  self->_exposureClassificationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureClassification, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyBeaconCount, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyRiskParameters, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
