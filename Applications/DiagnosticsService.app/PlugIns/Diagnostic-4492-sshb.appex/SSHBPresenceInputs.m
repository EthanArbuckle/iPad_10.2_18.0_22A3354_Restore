@implementation SSHBPresenceInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  void *v4;
  char v6;

  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("acceptedDeviation"), &off_10000CDC8, &off_10000CDD8, &off_10000CDE8, &v6));
  objc_msgSend(v4, "floatValue");
  -[SSHBPresenceInputs setAcceptedDeviation:](self, "setAcceptedDeviation:");

  return v6 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  char v7;

  v7 = 0;
  v4 = a3;
  -[SSHBPresenceInputs setFrequentSampling:](self, "setFrequentSampling:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("frequentSampling"), 0, &v7));
  -[SSHBPresenceInputs setDisableGapSubtraction:](self, "setDisableGapSubtraction:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("disableGapSubtraction"), 0, &v7));
  -[SSHBPresenceInputs setSendRawData:](self, "setSendRawData:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("sendRawData"), 1, &v7));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("sampleDuration"), &off_10000CDF8, &off_10000CE08, &off_10000CE18, &v7));

  objc_msgSend(v5, "doubleValue");
  -[SSHBPresenceInputs setSampleDuration:](self, "setSampleDuration:");

  return v7 == 0;
}

- (BOOL)frequentSampling
{
  return self->_frequentSampling;
}

- (void)setFrequentSampling:(BOOL)a3
{
  self->_frequentSampling = a3;
}

- (BOOL)disableGapSubtraction
{
  return self->_disableGapSubtraction;
}

- (void)setDisableGapSubtraction:(BOOL)a3
{
  self->_disableGapSubtraction = a3;
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (double)sampleDuration
{
  return self->_sampleDuration;
}

- (void)setSampleDuration:(double)a3
{
  self->_sampleDuration = a3;
}

- (float)acceptedDeviation
{
  return self->_acceptedDeviation;
}

- (void)setAcceptedDeviation:(float)a3
{
  self->_acceptedDeviation = a3;
}

@end
