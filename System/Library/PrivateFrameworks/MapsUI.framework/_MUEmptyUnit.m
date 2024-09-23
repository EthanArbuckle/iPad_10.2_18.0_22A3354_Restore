@implementation _MUEmptyUnit

+ (id)unitFromUnit:(id)a3
{
  id v3;
  _MUEmptyUnit *v4;
  void *v5;
  _MUEmptyUnit *v6;

  v3 = a3;
  v4 = [_MUEmptyUnit alloc];
  objc_msgSend(v3, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_MUEmptyUnit initWithSymbol:](v4, "initWithSymbol:", v5);
  return v6;
}

@end
