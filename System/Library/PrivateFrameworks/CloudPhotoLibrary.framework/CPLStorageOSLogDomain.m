@implementation CPLStorageOSLogDomain

void ____CPLStorageOSLogDomain_block_invoke()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.transientrepository.shared");
  v1 = (void *)__CPLStorageOSLogDomain_result;
  __CPLStorageOSLogDomain_result = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_191()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.resourcestorage");
  v1 = (void *)__CPLStorageOSLogDomain_result_190;
  __CPLStorageOSLogDomain_result_190 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_492()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.transientrepository.extraction");
  v1 = (void *)__CPLStorageOSLogDomain_result_491;
  __CPLStorageOSLogDomain_result_491 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_876()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.pushrepository");
  v1 = (void *)__CPLStorageOSLogDomain_result_875;
  __CPLStorageOSLogDomain_result_875 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_1887()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.resourcestorage.filestorage");
  v1 = (void *)__CPLStorageOSLogDomain_result_1886;
  __CPLStorageOSLogDomain_result_1886 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_5321()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.idmapping");
  v1 = (void *)__CPLStorageOSLogDomain_result_5320;
  __CPLStorageOSLogDomain_result_5320 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_6737()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.downloadQueue");
  v1 = (void *)__CPLStorageOSLogDomain_result_6736;
  __CPLStorageOSLogDomain_result_6736 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_7386()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.scopes");
  v1 = (void *)__CPLStorageOSLogDomain_result_7385;
  __CPLStorageOSLogDomain_result_7385 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_7763()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.cleanuptasks");
  v1 = (void *)__CPLStorageOSLogDomain_result_7762;
  __CPLStorageOSLogDomain_result_7762 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_7909()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.changepipe");
  v1 = (void *)__CPLStorageOSLogDomain_result_7908;
  __CPLStorageOSLogDomain_result_7908 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_8098()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.transientrepository");
  v1 = (void *)__CPLStorageOSLogDomain_result_8097;
  __CPLStorageOSLogDomain_result_8097 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_9640()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.storage.view");
  v1 = (void *)__CPLStorageOSLogDomain_result_9639;
  __CPLStorageOSLogDomain_result_9639 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_9710()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.remappedrecords");
  v1 = (void *)__CPLStorageOSLogDomain_result_9709;
  __CPLStorageOSLogDomain_result_9709 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_12662()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.pendingrecordchecks");
  v1 = (void *)__CPLStorageOSLogDomain_result_12659;
  __CPLStorageOSLogDomain_result_12659 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_15511()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.cloudcache");
  v1 = (void *)__CPLStorageOSLogDomain_result_15510;
  __CPLStorageOSLogDomain_result_15510 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_17665()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.computestatequeue");
  v1 = (void *)__CPLStorageOSLogDomain_result_17664;
  __CPLStorageOSLogDomain_result_17664 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_17925()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.statusCenter");
  v1 = (void *)__CPLStorageOSLogDomain_result_17921;
  __CPLStorageOSLogDomain_result_17921 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_18816()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.storage");
  v1 = (void *)__CPLStorageOSLogDomain_result_18815;
  __CPLStorageOSLogDomain_result_18815 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_19395()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.quarantinedrecords");
  v1 = (void *)__CPLStorageOSLogDomain_result_19394;
  __CPLStorageOSLogDomain_result_19394 = (uint64_t)v0;

}

void ____CPLStorageOSLogDomain_block_invoke_19629()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.outgoingResources");
  v1 = (void *)__CPLStorageOSLogDomain_result_19628;
  __CPLStorageOSLogDomain_result_19628 = (uint64_t)v0;

}

@end
