@implementation NFTrustSessionInterface

+ (id)interface
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40DCF8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_listKeysWithCompletion_, 0, 1);

  return v2;
}

@end
