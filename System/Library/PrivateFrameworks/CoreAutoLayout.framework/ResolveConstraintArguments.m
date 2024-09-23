@implementation ResolveConstraintArguments

uint64_t __ResolveConstraintArguments_block_invoke()
{
  uint64_t result;

  result = dyld_get_program_sdk_version();
  if ((_DWORD)result != 657152 && (_DWORD)result != 657408 && (_DWORD)result != 657664)
  {
    ResolveConstraintArguments_newExceptionBehaviorLocationToConstant = result > 0x80200;
    ResolveConstraintArguments_newExceptionBehaviorLanguageDirectionDependentToAbsolute = WORD1(result) > 8u;
  }
  return result;
}

@end
