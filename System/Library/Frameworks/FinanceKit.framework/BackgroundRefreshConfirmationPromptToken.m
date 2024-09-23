@implementation BackgroundRefreshConfirmationPromptToken

- (FKFullyQualifiedAccountIdentifier)fqaid
{
  return (FKFullyQualifiedAccountIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_fqaid));
}

- (int64_t)sequenceNumber
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_sequenceNumber);
}

- (BackgroundRefreshConfirmationPromptToken)initWithFullyQualifiedAccountIdentifier:(id)a3 sequenceNumber:(int64_t)a4
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_fqaid) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_sequenceNumber) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BankConnectMessagesManager.BackgroundRefreshConfirmationPromptToken();
  v5 = a3;
  return -[BackgroundRefreshConfirmationPromptToken init](&v7, sel_init);
}

- (BackgroundRefreshConfirmationPromptToken)init
{
  BackgroundRefreshConfirmationPromptToken *result;

  result = (BackgroundRefreshConfirmationPromptToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
