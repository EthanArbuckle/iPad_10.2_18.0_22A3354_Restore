@implementation HMDThreadNetworkStatusReport

- (HMDThreadNetworkStatusReport)initWithNumAdvertisedBRs:(unint64_t)a3 numAppleBRs:(unint64_t)a4 numThirdPartyBRs:(unint64_t)a5 numThreadNetworks:(unint64_t)a6 maxSimuIPPrefixesDetected:(unint64_t)a7 txTotal:(unint64_t)a8 txSuccess:(unint64_t)a9 txDelayAvg:(unint64_t)a10 rxTotal:(unint64_t)a11 rxSuccess:(unint64_t)a12 reportDuration:(unint64_t)a13
{
  HMDThreadNetworkStatusReport *result;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HMDThreadNetworkStatusReport;
  result = -[HMDThreadNetworkStatusReport init](&v20, sel_init);
  if (result)
  {
    result->_numAdvertisedBRs = a3;
    result->_numAppleBRs = a4;
    result->_numThirdPartyBRs = a5;
    result->_numThreadNetworks = a6;
    result->_maxSimuIPPrefixesDetected = a7;
    result->_txTotal = a8;
    result->_txSuccess = a9;
    result->_txDelayAvg = a10;
    result->_rxTotal = a11;
    result->_rxSuccess = a12;
    result->_reportDuration = a13;
  }
  return result;
}

- (unint64_t)numAdvertisedBRs
{
  return self->_numAdvertisedBRs;
}

- (unint64_t)numAppleBRs
{
  return self->_numAppleBRs;
}

- (unint64_t)numThirdPartyBRs
{
  return self->_numThirdPartyBRs;
}

- (unint64_t)numThreadNetworks
{
  return self->_numThreadNetworks;
}

- (unint64_t)maxSimuIPPrefixesDetected
{
  return self->_maxSimuIPPrefixesDetected;
}

- (unint64_t)txTotal
{
  return self->_txTotal;
}

- (unint64_t)txSuccess
{
  return self->_txSuccess;
}

- (unint64_t)txDelayAvg
{
  return self->_txDelayAvg;
}

- (unint64_t)rxTotal
{
  return self->_rxTotal;
}

- (unint64_t)rxSuccess
{
  return self->_rxSuccess;
}

- (unint64_t)reportDuration
{
  return self->_reportDuration;
}

@end
