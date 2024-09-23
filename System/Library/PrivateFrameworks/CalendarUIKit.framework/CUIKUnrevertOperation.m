@implementation CUIKUnrevertOperation

- (Class)_inverseOperationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
