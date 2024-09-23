@implementation CHUISSceneWorkspace

void __CHUISSceneWorkspace_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22988]), "initWithIdentifier:", CFSTR("com.apple.chrono"));
  v1 = (void *)CHUISSceneWorkspace___instance;
  CHUISSceneWorkspace___instance = v0;

}

@end
