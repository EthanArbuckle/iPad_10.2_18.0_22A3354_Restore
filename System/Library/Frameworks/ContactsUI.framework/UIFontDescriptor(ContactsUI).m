@implementation UIFontDescriptor(ContactsUI)

+ (uint64_t)cnui_bodyFontDescriptor
{
  return objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (uint64_t)cnui_footnoteFontDescriptor
{
  return objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

@end
