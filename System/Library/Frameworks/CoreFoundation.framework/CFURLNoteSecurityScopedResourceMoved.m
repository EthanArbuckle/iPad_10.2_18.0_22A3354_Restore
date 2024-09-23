@implementation CFURLNoteSecurityScopedResourceMoved

void *___CFURLNoteSecurityScopedResourceMoved_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreServicesInternal.framework/CoreServicesInternal", 256);
  if (result)
  {
    result = dlsym(result, "_FSURLNoteSecurityScopedResourceMovedWithFileIdentifier");
    _CFURLNoteSecurityScopedResourceMoved__NS_FSURLNoteSecurityScopedResourceMovedWithFileIdentifier = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))result;
  }
  return result;
}

@end
