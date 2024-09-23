@implementation NSXPCConnectionImportInfo

void *__62___NSXPCConnectionImportInfo__valueForEntitlement_auditToken___block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (result)
  {
    v1 = result;
    _MergedGlobals_157 = (uint64_t (*)(_QWORD, _QWORD))dlsym(result, "SecTaskCreateWithAuditToken");
    result = dlsym(v1, "SecTaskCopyValueForEntitlement");
    off_1ECD0A918 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  }
  return result;
}

@end
