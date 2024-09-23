@implementation CNContact(UI)

- (uint64_t)_gkCompositeName
{
  return objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a1, 0);
}

@end
