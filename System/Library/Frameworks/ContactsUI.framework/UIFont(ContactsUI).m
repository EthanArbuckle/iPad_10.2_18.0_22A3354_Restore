@implementation UIFont(ContactsUI)

+ (id)cnui_bodyFont
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "cnui_bodyFontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontWithDescriptor:size:", v1, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)cnui_footnoteFont
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "cnui_footnoteFontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontWithDescriptor:size:", v1, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
