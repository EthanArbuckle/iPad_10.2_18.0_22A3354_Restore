@implementation CNContactsUIBundle

void __CNContactsUIBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ContactsUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CNContactsUIBundle___bundle;
  CNContactsUIBundle___bundle = v0;

}

@end
