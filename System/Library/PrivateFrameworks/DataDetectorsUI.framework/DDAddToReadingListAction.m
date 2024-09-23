@implementation DDAddToReadingListAction

+ (BOOL)isAvailable
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = objc_alloc(MEMORY[0x1E0CA58A8]);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithURL:error:", v3, 0);
  objc_msgSend(v4, "bundleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
  else
    v7 = 0;

  return v7;
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Add to Reading List"));
}

- (id)iconName
{
  return CFSTR("eyeglasses");
}

- (void)performFromView:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CD5618], "defaultReadingList", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addReadingListItemWithURL:title:previewText:error:", self->super._url, 0, 0, 0);

}

@end
