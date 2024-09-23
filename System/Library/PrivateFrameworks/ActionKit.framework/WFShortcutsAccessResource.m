@implementation WFShortcutsAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.shortcuts");
}

- (unint64_t)status
{
  return 4;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  return 0;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  return 0;
}

- (id)localizedAttemptRecoveryFromErrorMessage
{
  return 0;
}

@end
