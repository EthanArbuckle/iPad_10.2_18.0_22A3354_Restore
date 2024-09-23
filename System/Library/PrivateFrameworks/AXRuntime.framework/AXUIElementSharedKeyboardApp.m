@implementation AXUIElementSharedKeyboardApp

void __AXUIElementSharedKeyboardApp_block_invoke()
{
  if (AXUIElementSharedKeyboardApp_KeyboardApp)
  {
    CFRelease((CFTypeRef)AXUIElementSharedKeyboardApp_KeyboardApp);
    AXUIElementSharedKeyboardApp_KeyboardApp = 0;
  }
}

@end
