@implementation CSVoiceTriggerFirstPassConfig

- (CSVoiceTriggerFirstPassConfig)initWithConfigPathNDAPI:(id)a3 threshold:(float)a4 delaySecondsForChannelSelection:(float)a5 masterChannelScoreBoost:(float)a6 processingChunkSeconds:(float)a7 processingChannelsBitset:(unint64_t)a8
{
  id v15;
  CSVoiceTriggerFirstPassConfig *v16;
  CSVoiceTriggerFirstPassConfig *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSVoiceTriggerFirstPassConfig;
  v16 = -[CSVoiceTriggerFirstPassConfig init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_configPathNDAPI, a3);
    v17->_threshold = a4;
    v17->_delaySecondsForChannelSelection = a5;
    v17->_masterChannelScoreBoost = a6;
    v17->_processingChunkSeconds = a7;
    v17->_processingChannelsBitset = a8;
  }

  return v17;
}

- (NSString)configPathNDAPI
{
  return self->_configPathNDAPI;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)delaySecondsForChannelSelection
{
  return self->_delaySecondsForChannelSelection;
}

- (float)masterChannelScoreBoost
{
  return self->_masterChannelScoreBoost;
}

- (float)processingChunkSeconds
{
  return self->_processingChunkSeconds;
}

- (unint64_t)processingChannelsBitset
{
  return self->_processingChannelsBitset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configPathNDAPI, 0);
}

@end
