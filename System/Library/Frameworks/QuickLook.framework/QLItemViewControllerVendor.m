@implementation QLItemViewControllerVendor

+ (id)qlItemViewControllerForURL:(id)a3
{
  id v3;
  QLItemPresenterViewController *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(QLItemPresenterViewController);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BF88]), "initWithURL:", v3);

  -[QLItemPresenterViewController loadPreviewControllerWithContents:context:completionHandler:](v4, "loadPreviewControllerWithContents:context:completionHandler:", v5, 0, &__block_literal_global_270);
  return v4;
}

+ (id)qlItemViewControllerForItem:(id)a3
{
  id v3;
  QLItemPresenterViewController *v4;

  v3 = a3;
  v4 = objc_alloc_init(QLItemPresenterViewController);
  -[QLItemPresenterViewController loadPreviewControllerWithContents:context:completionHandler:](v4, "loadPreviewControllerWithContents:context:completionHandler:", v3, 0, &__block_literal_global_271);

  return v4;
}

@end
