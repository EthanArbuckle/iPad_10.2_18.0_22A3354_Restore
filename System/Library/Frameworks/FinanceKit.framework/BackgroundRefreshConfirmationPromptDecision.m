@implementation BackgroundRefreshConfirmationPromptDecision

- (BOOL)shouldShowPrompt
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BackgroundRefreshConfirmationPromptDecision_shouldShowPrompt);
}

- (BackgroundRefreshConfirmationPromptToken)token
{
  return (BackgroundRefreshConfirmationPromptToken *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR___BackgroundRefreshConfirmationPromptDecision_token));
}

- (BackgroundRefreshConfirmationPromptDecision)init
{
  BackgroundRefreshConfirmationPromptDecision *result;

  result = (BackgroundRefreshConfirmationPromptDecision *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
