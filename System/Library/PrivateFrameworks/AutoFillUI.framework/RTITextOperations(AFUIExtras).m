@implementation RTITextOperations(AFUIExtras)

- (void)_assertOrInsertText:()AFUIExtras documentTraits:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "isSingleLineDocument")
    || !objc_msgSend(v6, "_isExplicitAutoFillInvocation"))
  {
    objc_msgSend(a1, "setTextToAssert:", v8);
  }
  else
  {
    objc_msgSend(a1, "keyboardOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertText:", v8);

  }
}

@end
