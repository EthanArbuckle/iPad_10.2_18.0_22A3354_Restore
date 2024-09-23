@implementation NSString(DALeastInfoURLExtension)

- (id)da_absoluteURLForChildLeastInfoRepresentationRelativeToParentURL:()DALeastInfoURLExtension
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v4, "user");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "da_urlBySettingUsername:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
  }
  objc_msgSend(v5, "absoluteURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
