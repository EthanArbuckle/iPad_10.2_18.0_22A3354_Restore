@implementation MTRQRCodeSetupPayloadParser

- (MTRQRCodeSetupPayloadParser)initWithBase38Representation:(NSString *)base38Representation
{
  NSString *v4;
  MTRQRCodeSetupPayloadParser *v5;
  NSString *v6;
  objc_super v8;

  v4 = base38Representation;
  v8.receiver = self;
  v8.super_class = (Class)MTRQRCodeSetupPayloadParser;
  v5 = -[MTRQRCodeSetupPayloadParser init](&v8, sel_init);
  v6 = v5->_base38Representation;
  v5->_base38Representation = v4;

  return v5;
}

- (MTRSetupPayload)populatePayload:(NSError *)error
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;

  v4 = sub_23404383C([MTRSetupPayload alloc], self->_base38Representation);
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
  objc_storeStrong((id *)&self->_base38Representation, 0);
}

@end
