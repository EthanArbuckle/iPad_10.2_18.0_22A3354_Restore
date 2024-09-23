@implementation CESRSpeechProfileEvaluationStatus

- (BOOL)isEvaluationEnabled
{
  unsigned __int8 v4;

  if (+[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall"))
    return 0;
  v4 = atomic_load((unsigned __int8 *)&self->_isEvaluationEnabled);
  return v4 & 1;
}

- (void)setEvaluationEnabled:(BOOL)a3
{
  if (!+[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall"))
    atomic_store(a3, (unsigned __int8 *)&self->_isEvaluationEnabled);
}

+ (id)sharedStatus
{
  if (sharedStatus_onceToken[0] != -1)
    dispatch_once(sharedStatus_onceToken, &__block_literal_global_3403);
  return (id)sharedStatus_sharedStatus;
}

void __49__CESRSpeechProfileEvaluationStatus_sharedStatus__block_invoke()
{
  CESRSpeechProfileEvaluationStatus *v0;
  void *v1;

  v0 = objc_alloc_init(CESRSpeechProfileEvaluationStatus);
  v1 = (void *)sharedStatus_sharedStatus;
  sharedStatus_sharedStatus = (uint64_t)v0;

}

@end
