@implementation MTRManualSetupPayloadParser

- (MTRManualSetupPayloadParser)initWithDecimalStringRepresentation:(NSString *)decimalStringRepresentation
{
  NSString *v4;
  MTRManualSetupPayloadParser *v5;
  NSString *v6;
  objc_super v8;

  v4 = decimalStringRepresentation;
  v8.receiver = self;
  v8.super_class = (Class)MTRManualSetupPayloadParser;
  v5 = -[MTRManualSetupPayloadParser init](&v8, sel_init);
  v6 = v5->_decimalStringRepresentation;
  v5->_decimalStringRepresentation = v4;

  return v5;
}

- (MTRSetupPayload)populatePayload:(NSError *)error
{
  char *v4;
  char *v5;

  v4 = sub_234043A74([MTRSetupPayload alloc], self->_decimalStringRepresentation);
  v5 = v4;
  if (error && !v4)
  {
    sub_2340017B8((uint64_t)MTRError, 4);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return (MTRSetupPayload *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decimalStringRepresentation, 0);
}

@end
