@implementation C3DShouldCollectGeneratedShaders

uint64_t __C3DShouldCollectGeneratedShaders_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("com.apple.sceneKit.traceResources"));
  C3DShouldCollectGeneratedShaders::traceResources = result;
  return result;
}

@end
