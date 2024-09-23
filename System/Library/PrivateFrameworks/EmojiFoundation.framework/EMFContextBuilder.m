@implementation EMFContextBuilder

- (EMFContextBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMFContextBuilder;
  return -[EMFContextBuilder init](&v3, sel_init);
}

- (void)enumerateWindowsForContext:(id)a3 range:(_NSRange)a4 searchAnchors:(id)a5 usingBlock:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  __assert_rtn("-[EMFContextBuilder enumerateWindowsForContext:range:searchAnchors:usingBlock:]", "EMFContextBuilder.m", 31, "false && \"Concrete subclasses must implement this method.\");
}

@end
