@implementation VCMediaStreamSendGroupConfig

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroupConfig;
  -[VCMediaStreamGroupConfig dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldSynchronizeWithSourceRTPTimestamps
{
  return self->_shouldSynchronizeWithSourceRTPTimestamps;
}

- (void)setShouldSynchronizeWithSourceRTPTimestamps:(BOOL)a3
{
  self->_shouldSynchronizeWithSourceRTPTimestamps = a3;
}

- (unsigned)streamGroupMode
{
  return self->_streamGroupMode;
}

- (void)setStreamGroupMode:(unsigned int)a3
{
  self->_streamGroupMode = a3;
}

- (unsigned)redundancyMode
{
  return self->_redundancyMode;
}

- (void)setRedundancyMode:(unsigned int)a3
{
  self->_redundancyMode = a3;
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (void)setRedundancyPercentage:(unsigned int)a3
{
  self->_redundancyPercentage = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (BOOL)streamGroupRedundancyControlEnabled
{
  return self->_streamGroupRedundancyControlEnabled;
}

- (void)setStreamGroupRedundancyControlEnabled:(BOOL)a3
{
  self->_streamGroupRedundancyControlEnabled = a3;
}

- (VCRedundancyControllerProtocol)redundancyController
{
  return self->_redundancyController;
}

- (void)setRedundancyController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

@end
