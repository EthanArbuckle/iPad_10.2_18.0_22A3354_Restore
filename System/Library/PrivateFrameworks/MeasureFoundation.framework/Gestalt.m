@implementation Gestalt

void __26__Gestalt_jasperAvailable__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "stringAnswerToQuestion:", CFSTR("dJvRNnysMoubdy0ZCK2aRQ"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    v3 = (void *)v1;
    LOBYTE(v1) = objc_msgSend(MEMORY[0x24BDFD9B0], "supportsFrameSemantics:", 8);
    v2 = v3;
  }
  jasperAvailable_jasperAvailable = v1;

}

+ (id)stringAnswerToQuestion:(__CFString *)a3
{
  return (id)MGGetStringAnswer();
}

+ (BOOL)internalInstall
{
  if (internalInstall_onceToken != -1)
    dispatch_once(&internalInstall_onceToken, &__block_literal_global);
  return internalInstall_internalInstall;
}

uint64_t __26__Gestalt_internalInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  internalInstall_internalInstall = result;
  return result;
}

+ (BOOL)jasperAvailable
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__Gestalt_jasperAvailable__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (jasperAvailable_onceToken != -1)
    dispatch_once(&jasperAvailable_onceToken, block);
  return jasperAvailable_jasperAvailable;
}

+ (BOOL)hasAppleNeuralEngine
{
  if (hasAppleNeuralEngine_onceToken != -1)
    dispatch_once(&hasAppleNeuralEngine_onceToken, &__block_literal_global_4);
  return hasAppleNeuralEngine_hasAppleNeuralEngine;
}

uint64_t __31__Gestalt_hasAppleNeuralEngine__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasAppleNeuralEngine_hasAppleNeuralEngine = result;
  return result;
}

@end
