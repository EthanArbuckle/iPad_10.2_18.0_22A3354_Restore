@implementation CSVoiceTriggerAirPodWearerDetectionConfig

- (CSVoiceTriggerAirPodWearerDetectionConfig)initWithThreshold:(float)a3 minimumPhraseLength:(float)a4 shadowMicScoreThreshold:(float)a5 myriadThreshold:(float)a6 phrasesToSkipBoronDecisionMaking:(id)a7
{
  id v13;
  CSVoiceTriggerAirPodWearerDetectionConfig *v14;
  CSVoiceTriggerAirPodWearerDetectionConfig *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CSVoiceTriggerAirPodWearerDetectionConfig;
  v14 = -[CSVoiceTriggerAirPodWearerDetectionConfig init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_threshold = a3;
    v14->_minimumPhraseLength = a4;
    v14->_shadowMicScoreThreshold = a5;
    v14->_myriadThreshold = a6;
    objc_storeStrong((id *)&v14->_phrasesToSkipBoronDecisionMaking, a7);
  }

  return v15;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)minimumPhraseLength
{
  return self->_minimumPhraseLength;
}

- (float)shadowMicScoreThreshold
{
  return self->_shadowMicScoreThreshold;
}

- (float)myriadThreshold
{
  return self->_myriadThreshold;
}

- (NSArray)phrasesToSkipBoronDecisionMaking
{
  return self->_phrasesToSkipBoronDecisionMaking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrasesToSkipBoronDecisionMaking, 0);
}

@end
