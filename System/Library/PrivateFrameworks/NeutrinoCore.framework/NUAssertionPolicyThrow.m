@implementation NUAssertionPolicyThrow

- (void)notifyAssertion:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "isFatal"))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99768];
    objc_msgSend(v10, "prettyMethodName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "lineNumber");
    objc_msgSend(v10, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentlyExecutingJobName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("Assertion failure in %@, %@:%ld: %@ %@"), v5, v6, v7, v8, v9);

  }
}

@end
