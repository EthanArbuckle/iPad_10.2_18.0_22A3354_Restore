@implementation IPv6AddressFormatter

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPv6AddressFormatter;
  return -[APFormatter isPartialStringValid:newEditingString:errorDescription:](&v6, sel_isPartialStringValid_newEditingString_errorDescription_, a3, a4, a5);
}

@end
