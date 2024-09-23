@implementation NUAssertionPolicyCrashReport

- (void)notifyAssertion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "isFatal"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "prettyMethodName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "lineNumber");
    objc_msgSend(v11, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentlyExecutingJobName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Assertion failure in %@, %@:%ld\n%@\n%@"), v4, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    qword_1EE864C18 = objc_msgSend(v10, "UTF8String");

  }
}

@end
