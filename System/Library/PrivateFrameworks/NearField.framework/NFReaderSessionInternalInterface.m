@implementation NFReaderSessionInternalInterface

+ (id)interface
{
  void *v0;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40DD58);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFReaderSessionInterface _configureInterface:](NFReaderSessionInterface, "_configureInterface:", v0);
  return v0;
}

@end
