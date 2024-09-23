@implementation NUAssertionPolicyDebuggerWarning

- (void)notifyAssertion:(id)a3
{
  void *v3;
  char v4;
  id v5;

  v5 = a3;
  if (+[NUUtilities runningUnderDebugger](NUUtilities, "runningUnderDebugger"))
  {
    if (objc_msgSend(v5, "isWarning"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__skipWarningAssertions"));

      if ((v4 & 1) == 0)
        raise(2);
    }
  }

}

@end
