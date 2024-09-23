@implementation UIImageView

- (NSString)imageBundleIdentifier
{
  return (NSString *)objc_getAssociatedObject(self, "imageBundleIdentifier");
}

- (void)setImageBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_setAssociatedObject(self, "imageBundleIdentifier", v6, (void *)3);
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "scale");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2));
    -[UIImageView setImage:](self, "setImage:", v5);

  }
}

@end
