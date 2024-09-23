@implementation NSDictionary

id __68__NSDictionary_FTRegAppleIDSetupUtilities____ftreg_candidateAliases__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  objc_msgSend(v2, "objectForKey:", CFSTR("uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 5051)
  {
    objc_msgSend(v5, "_stripFZIDPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
