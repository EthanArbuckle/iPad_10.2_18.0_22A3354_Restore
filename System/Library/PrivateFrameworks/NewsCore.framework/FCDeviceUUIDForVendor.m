@implementation FCDeviceUUIDForVendor

void __FCDeviceUUIDForVendor_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CB3A28]);
  FCDeviceIdentifierForVendor();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithUUIDString:", v3);
  v2 = (void *)qword_1ED0F8590;
  qword_1ED0F8590 = v1;

}

@end
