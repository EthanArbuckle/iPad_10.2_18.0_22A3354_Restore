@implementation CPLTaskOSLogDomain

void ____CPLTaskOSLogDomain_block_invoke()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.transportupdate");
  v1 = (void *)__CPLTaskOSLogDomain_result;
  __CPLTaskOSLogDomain_result = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_590()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.mingle");
  v1 = (void *)__CPLTaskOSLogDomain_result_589;
  __CPLTaskOSLogDomain_result_589 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_1264()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.uploadcomputestates");
  v1 = (void *)__CPLTaskOSLogDomain_result_1263;
  __CPLTaskOSLogDomain_result_1263 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_2374()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pullscopes");
  v1 = (void *)__CPLTaskOSLogDomain_result_2373;
  __CPLTaskOSLogDomain_result_2373 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_4721()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.cleanup");
  v1 = (void *)__CPLTaskOSLogDomain_result_4720;
  __CPLTaskOSLogDomain_result_4720 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_6109()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.reshare");
  v1 = (void *)__CPLTaskOSLogDomain_result_6108;
  __CPLTaskOSLogDomain_result_6108 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_9919()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pushtotransport");
  v1 = (void *)__CPLTaskOSLogDomain_result_9918;
  __CPLTaskOSLogDomain_result_9918 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_12182()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.mingle");
  v1 = (void *)__CPLTaskOSLogDomain_result_12181;
  __CPLTaskOSLogDomain_result_12181 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_12585()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.backgrounddownloads");
  v1 = (void *)__CPLTaskOSLogDomain_result_12584;
  __CPLTaskOSLogDomain_result_12584 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_13515()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.task");
  v1 = (void *)__CPLTaskOSLogDomain_result_13514;
  __CPLTaskOSLogDomain_result_13514 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_14906()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.updatescope");
  v1 = (void *)__CPLTaskOSLogDomain_result_14905;
  __CPLTaskOSLogDomain_result_14905 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_18671()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.processtagedscopes");
  v1 = (void *)__CPLTaskOSLogDomain_result_18670;
  __CPLTaskOSLogDomain_result_18670 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_20275()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pullfromtransport");
  v1 = (void *)__CPLTaskOSLogDomain_result_20274;
  __CPLTaskOSLogDomain_result_20274 = (uint64_t)v0;

}

void ____CPLTaskOSLogDomain_block_invoke_21247()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pushtotransport.upload");
  v1 = (void *)__CPLTaskOSLogDomain_result_21246;
  __CPLTaskOSLogDomain_result_21246 = (uint64_t)v0;

}

@end
