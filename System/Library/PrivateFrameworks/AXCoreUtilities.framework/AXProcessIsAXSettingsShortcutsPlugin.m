@implementation AXProcessIsAXSettingsShortcutsPlugin

void __AXProcessIsAXSettingsShortcutsPlugin_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts"));

  if (v1)
    AXProcessIsAXSettingsShortcutsPlugin__AXProcessIsAXSettingsShortcutsPlugin = 1;
}

@end
