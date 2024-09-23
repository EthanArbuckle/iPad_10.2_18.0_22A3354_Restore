@implementation LSResourceProxy(IconServicesAdditions)

- (id)__IS_iconDataForVariant:()IconServicesAdditions withOptions:
{
  ISIcon *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = -[ISIcon initWithResourceProxy:]([ISIcon alloc], "initWithResourceProxy:", a1);
  +[ISImageDescriptor imageDescriptorWithIconVariant:options:](ISImageDescriptor, "imageDescriptorWithIconVariant:options:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIcon prepareImageForDescriptor:](v6, "prepareImageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bitmapData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)__IS_iconResourceLocator
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "iconResourceLocator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (uint64_t)__IS_canProvideResourceLocator
{
  return objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_iconResourceLocator);
}

@end
