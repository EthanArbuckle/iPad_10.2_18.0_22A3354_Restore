@implementation LARight(UI)

- (void)authorizeWithLocalizedReason:()UI inPresentationContext:completion:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v8 = a5;
  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LARight _authOptionsWithLocalizedReason:presentationContext:](a1, v9, v11);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "authorizeWithOptions:completion:", v10, v8);
    v9 = (id)v10;
  }
  else
  {
    objc_msgSend(a1, "authorizeWithLocalizedReason:completion:", v9, v8);
  }

}

@end
