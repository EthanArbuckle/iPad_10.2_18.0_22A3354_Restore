@implementation CSContinuousVoiceTriggerConfig

- (CSContinuousVoiceTriggerConfig)initWithConfigPathNDAPI:(id)a3 threshold:(float)a4 twoShotThreshold:(float)a5 twoShotDecisionWaitTime:(float)a6 voiceTriggerPhIds:(id)a7 silencePhIds:(id)a8
{
  id v15;
  id v16;
  id v17;
  CSContinuousVoiceTriggerConfig *v18;
  CSContinuousVoiceTriggerConfig *v19;
  objc_super v21;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)CSContinuousVoiceTriggerConfig;
  v18 = -[CSContinuousVoiceTriggerConfig init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_configPathNDAPI, a3);
    v19->_threshold = a4;
    v19->_twoShotThreshold = a5;
    v19->_twoShotDecisionWaitTime = a6;
    objc_storeStrong((id *)&v19->_voiceTriggerPhIds, a7);
    objc_storeStrong((id *)&v19->_silencePhIds, a8);
  }

  return v19;
}

- (NSString)configPathNDAPI
{
  return self->_configPathNDAPI;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)twoShotThreshold
{
  return self->_twoShotThreshold;
}

- (float)twoShotDecisionWaitTime
{
  return self->_twoShotDecisionWaitTime;
}

- (NSArray)voiceTriggerPhIds
{
  return self->_voiceTriggerPhIds;
}

- (NSArray)silencePhIds
{
  return self->_silencePhIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silencePhIds, 0);
  objc_storeStrong((id *)&self->_voiceTriggerPhIds, 0);
  objc_storeStrong((id *)&self->_configPathNDAPI, 0);
}

@end
