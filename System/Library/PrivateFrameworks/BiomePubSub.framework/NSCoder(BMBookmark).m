@implementation NSCoder(BMBookmark)

+ (id)bm_allowedClassesForSecureCodingBMBookmark
{
  void *v0;
  void *v1;

  +[BMBookmarkClasses sharedInstance](BMBookmarkClasses, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allowedClassesForSecureCodingBMBookmark");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)bm_allowClassesForSecureCodingBMBookmark:()BMBookmark
{
  id v3;
  id v4;

  v3 = a3;
  +[BMBookmarkClasses sharedInstance](BMBookmarkClasses, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowClassesForSecureCodingBMBookmark:", v3);

}

@end
