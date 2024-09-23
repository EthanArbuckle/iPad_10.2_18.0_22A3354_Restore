@implementation AWSampleLogData

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)samplingInterval
{
  return self->_samplingInterval;
}

- (void)setSamplingInterval:(unint64_t)a3
{
  self->_samplingInterval = a3;
}

- (BOOL)pollingClient
{
  return self->_pollingClient;
}

- (void)setPollingClient:(BOOL)a3
{
  self->_pollingClient = a3;
}

- (unint64_t)cumulativeSamplingTime
{
  return self->_cumulativeSamplingTime;
}

- (void)setCumulativeSamplingTime:(unint64_t)a3
{
  self->_cumulativeSamplingTime = a3;
}

- (unint64_t)samplingStartTime
{
  return self->_samplingStartTime;
}

- (void)setSamplingStartTime:(unint64_t)a3
{
  self->_samplingStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
