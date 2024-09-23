@implementation AXAlternativeVoices

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_36);
  return (id)sharedInstance_sharedInstance;
}

void __37__AXAlternativeVoices_sharedInstance__block_invoke()
{
  AXAlternativeVoices *v0;
  void *v1;

  v0 = objc_alloc_init(AXAlternativeVoices);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (BOOL)isOldSiriVoiceIdentifier:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0DBEF18], "isOldSiriVoiceIdentifier:", a3);
}

- (BOOL)isSiriVoiceIdentifier:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0DBEF18], "isSiriVoiceIdentifier:", a3);
}

- (BOOL)isNeuralSiriVoiceIdentifier:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0DBEF18], "isNeuralSiriVoiceIdentifier:", a3);
}

- (id)nameForVoiceIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DBEF18], "nameForVoiceIdentifier:", a3);
}

@end
