@implementation _FBDefaultFencingProvider

- (void)synchronizeDrawingWithFence:(id)a3
{
  objc_class *v3;
  id v4;

  v4 = a3;
  if (UIKitLibraryCore())
  {
    v3 = getUIWindowClass();
    if (v3)
      -[objc_class _synchronizeDrawingWithFence:](v3, "_synchronizeDrawingWithFence:", v4);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_1);
  return (id)sharedInstance___instance;
}

@end
