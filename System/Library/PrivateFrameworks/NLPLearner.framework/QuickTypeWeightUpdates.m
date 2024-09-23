@implementation QuickTypeWeightUpdates

- (NSData)weightUpdates
{
  return self->_weightUpdates;
}

- (void)setWeightUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_weightUpdates, a3);
}

- (NSNumber)l2Norm
{
  return self->_l2Norm;
}

- (void)setL2Norm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)maxNorm
{
  return self->_maxNorm;
}

- (void)setMaxNorm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)privacyDiagnosticReport
{
  return self->_privacyDiagnosticReport;
}

- (void)setPrivacyDiagnosticReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)weightUpdatesDiagnosticReport
{
  return self->_weightUpdatesDiagnosticReport;
}

- (void)setWeightUpdatesDiagnosticReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightUpdatesDiagnosticReport, 0);
  objc_storeStrong((id *)&self->_privacyDiagnosticReport, 0);
  objc_storeStrong((id *)&self->_maxNorm, 0);
  objc_storeStrong((id *)&self->_l2Norm, 0);
  objc_storeStrong((id *)&self->_weightUpdates, 0);
}

@end
