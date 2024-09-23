@implementation NFRemoteAdminManagerCallbacks

+ (id)interface
{
  if (qword_1ECFF61E0 != -1)
    dispatch_once(&qword_1ECFF61E0, &__block_literal_global_83);
  return (id)qword_1ECFF61D8;
}

void __42__NFRemoteAdminManagerCallbacks_interface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE407B30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFF61D8;
  qword_1ECFF61D8 = v0;

}

@end
