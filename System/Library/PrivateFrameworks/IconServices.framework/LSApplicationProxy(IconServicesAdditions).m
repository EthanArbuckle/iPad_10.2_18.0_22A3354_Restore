@implementation LSApplicationProxy(IconServicesAdditions)

- (id)__IS_iconDataForVariant:()IconServicesAdditions withOptions:
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "__IS_iconResourceLocator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "supportsAlternateIconNames"))
  {
    objc_msgSend(v7, "bundleIconsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(a1, "alternateIconName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(a1, "__IS_iconDataForVariant:preferredIconName:withOptions:", a3, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)__IS_iconDataForVariant:()IconServicesAdditions preferredIconName:withOptions:
{
  id v8;
  ISIcon *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = -[ISIcon initWithResourceProxy:]([ISIcon alloc], "initWithResourceProxy:", a1);
  +[ISImageDescriptor imageDescriptorWithIconVariant:options:](ISImageDescriptor, "imageDescriptorWithIconVariant:options:", a3, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferedResourceName:", v8);

  -[ISIcon prepareImageForDescriptor:](v9, "prepareImageForDescriptor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bitmapData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
