@implementation QLPreviewControllerView

- (QLPreviewControllerView)init
{
  QLPreviewControllerView *v2;
  QLPreviewControllerView *v3;
  void *v4;
  QLPreviewControllerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLPreviewControllerView;
  v2 = -[QLPreviewControllerView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[QLPreviewControllerView setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("QLPreviewControllerView"));
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      -[QLPreviewControllerView setFrame:](v3, "setFrame:");

      -[QLPreviewControllerView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    }
    v5 = v3;
  }

  return v3;
}

@end
