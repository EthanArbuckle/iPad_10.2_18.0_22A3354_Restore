@implementation _NSKVOCompatibility

+ (void)_noteProcessHasUsedKVOSwiftOverlay
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
    objc_msgSend(a1, "_setRequiresSilencingExceptions:", 1);
}

+ (void)_setRequiresSilencingExceptions:(BOOL)a3
{
  atomic_store(a3, _NSKVO51127338RequiresSilencingExceptions);
}

+ (BOOL)_releasesObservationBlockOnInvalidation
{
  return dyld_program_sdk_at_least();
}

@end
