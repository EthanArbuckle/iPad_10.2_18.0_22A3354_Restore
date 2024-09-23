id _log()
{
  if (_log_onceToken != -1)
    dispatch_once(&_log_onceToken, &__block_literal_global);
  return (id)_log_sLog;
}

void ___log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.NonverbalCues", "NonverbalCues");
  v1 = (void *)_log_sLog;
  _log_sLog = (uint64_t)v0;

}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

