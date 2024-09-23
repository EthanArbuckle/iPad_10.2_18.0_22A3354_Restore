@implementation AXProcessIsWidgetRenderer

void __AXProcessIsWidgetRenderer_block_invoke()
{
  void *v0;
  int v1;

  AXProcessGetName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("WidgetRenderer_Default"));

  if (v1)
    AXProcessIsWidgetRenderer__AXProcessIsWidgetRenderer = 1;
}

@end
