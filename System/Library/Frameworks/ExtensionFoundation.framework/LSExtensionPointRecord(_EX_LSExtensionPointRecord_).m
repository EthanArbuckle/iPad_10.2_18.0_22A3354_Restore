@implementation LSExtensionPointRecord(_EX_LSExtensionPointRecord_)

- (id)_EX_parentAppRecord
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "parentAppRecord");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_EX_initWithIdentifier:()_EX_LSExtensionPointRecord_ platform:parentAppRecord:error:
{
  id v10;
  id v11;
  char v12;
  id v13;
  uint64_t v14;
  void *v15;

  v10 = a5;
  v11 = a3;
  v12 = objc_opt_respondsToSelector();
  v13 = a1;
  if ((v12 & 1) != 0)
    v14 = objc_msgSend(v13, "initWithIdentifier:platform:parentAppRecord:error:", v11, a4, v10, a6);
  else
    v14 = objc_msgSend(v13, "initWithIdentifier:platform:error:", v11, a4, a6);
  v15 = (void *)v14;

  return v15;
}

@end
