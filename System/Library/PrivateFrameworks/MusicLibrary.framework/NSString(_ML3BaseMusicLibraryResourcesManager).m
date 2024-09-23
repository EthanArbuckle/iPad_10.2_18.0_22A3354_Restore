@implementation NSString(_ML3BaseMusicLibraryResourcesManager)

- (id)relativePathFromBasePath:()_ML3BaseMusicLibraryResourcesManager
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "stringByStandardizingPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAbsolutePath") && objc_msgSend(v5, "hasPrefix:", v4))
  {
    v6 = objc_msgSend(v4, "length");
    if (objc_msgSend(v5, "length") <= v6)
      v7 = v6;
    else
      v7 = v6 + 1;
    objc_msgSend(v5, "substringFromIndex:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

@end
