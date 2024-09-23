@implementation CSVoiceTriggerInfo

- (CSVoiceTriggerInfo)init
{
  CSVoiceTriggerInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerInfo;
  result = -[CSVoiceTriggerInfo init](&v3, sel_init);
  if (result)
    result->_firstPassRunningMode = -1;
  return result;
}

- (int64_t)firstPassRunningMode
{
  return self->_firstPassRunningMode;
}

- (void)setFirstPassRunningMode:(int64_t)a3
{
  self->_firstPassRunningMode = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8116 != -1)
    dispatch_once(&sharedInstance_onceToken_8116, &__block_literal_global_8117);
  return (id)sharedInstance_sharedInstance_8118;
}

void __36__CSVoiceTriggerInfo_sharedInstance__block_invoke()
{
  CSVoiceTriggerInfo *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerInfo);
  v1 = (void *)sharedInstance_sharedInstance_8118;
  sharedInstance_sharedInstance_8118 = (uint64_t)v0;

}

@end
