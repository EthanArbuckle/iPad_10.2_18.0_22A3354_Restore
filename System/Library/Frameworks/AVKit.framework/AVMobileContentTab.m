@implementation AVMobileContentTab

- (AVMobileContentTab)initWithCustomInfoViewController:(id)a3 accessibilityIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  AVMobileContentTab *v12;
  AVMobileContentTab *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || !objc_msgSend(v11, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Empty or no title provided for info view controller in -[AVPlayerViewController customInfoViewControllers]: %@"), v7);
  v15.receiver = self;
  v15.super_class = (Class)AVMobileContentTab;
  v12 = -[AVMobileContentTab init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessibilityIdentifier, a4);
    objc_storeStrong((id *)&v13->_displayName, v11);
    objc_storeStrong((id *)&v13->_viewController, a3);
  }

  return v13;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
