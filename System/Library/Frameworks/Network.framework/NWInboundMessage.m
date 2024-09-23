@implementation NWInboundMessage

- (NSData)content
{
  id v2;
  void *v3;
  id v4;

  -[NWMessage internalContent](self, "internalContent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return (NSData *)v3;
}

@end
