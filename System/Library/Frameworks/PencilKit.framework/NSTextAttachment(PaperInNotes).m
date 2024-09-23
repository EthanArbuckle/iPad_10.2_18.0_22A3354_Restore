@implementation NSTextAttachment(PaperInNotes)

- (id)_paperBundleBaseURL
{
  id v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_paperBundleURL");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E98]);
  }
  return v2;
}

- (id)_paperBundleDatabaseURL
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_paperBundleURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Database"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_paperBundleAssetsURL
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_paperBundleURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Assets.bundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
