@implementation AXElement(HoverTypingSupport)

- (BOOL)hoverTypingShouldAdjustDockedMode
{
  void *v2;
  char v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLWithAXAttribute:", 4006);

  return v3;
}

@end
