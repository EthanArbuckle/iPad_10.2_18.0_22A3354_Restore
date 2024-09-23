@implementation ABAddressBookBundle

void __ABAddressBookBundle_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)ABAddressBookCopyBundleURL();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ABAddressBookBundle___bundle;
  ABAddressBookBundle___bundle = v0;

}

@end
