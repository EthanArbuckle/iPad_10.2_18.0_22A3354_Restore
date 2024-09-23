@implementation OSLogPreferencesListDirectory

void __OSLogPreferencesListDirectory_block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "hasSuffix:", CFSTR(".plist"));
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

@end
