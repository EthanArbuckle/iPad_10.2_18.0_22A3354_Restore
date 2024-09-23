@implementation NUAssertionPolicyDebuggerFatal

- (void)notifyAssertion:(id)a3
{
  id v3;

  v3 = a3;
  if (+[NUUtilities runningUnderDebugger](NUUtilities, "runningUnderDebugger")
    && objc_msgSend(v3, "isFatal"))
  {
    raise(2);
  }

}

@end
