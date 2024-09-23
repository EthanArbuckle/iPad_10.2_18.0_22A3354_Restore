@implementation CFNetwork

void *____CFNetwork__CFURLCreateDataAndPropertiesFromResource_block_invoke()
{
  void *result;

  result = __CFLookupCFNetworkFunction("_CFURLCreateDataAndPropertiesFromResource");
  __CFNetwork__CFURLCreateDataAndPropertiesFromResource_dyfunc = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))result;
  return result;
}

void *____CFNetwork__CFURLWriteDataAndPropertiesToResource_block_invoke()
{
  void *result;

  result = __CFLookupCFNetworkFunction("_CFURLWriteDataAndPropertiesToResource");
  __CFNetwork__CFURLWriteDataAndPropertiesToResource_dyfunc = result;
  return result;
}

void *____CFNetwork__CFURLDestroyResource_block_invoke()
{
  void *result;

  result = __CFLookupCFNetworkFunction("_CFURLDestroyResource");
  __CFNetwork__CFURLDestroyResource_dyfunc = (uint64_t (*)(_QWORD, _QWORD))result;
  return result;
}

@end
