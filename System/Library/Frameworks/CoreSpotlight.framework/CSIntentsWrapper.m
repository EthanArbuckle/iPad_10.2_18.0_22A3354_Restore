@implementation CSIntentsWrapper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_24);
  return (id)sharedInstance_sIntentsWrapper;
}

void __34__CSIntentsWrapper_sharedInstance__block_invoke()
{
  CSIntentsWrapper *v0;
  void *v1;

  v0 = objc_alloc_init(CSIntentsWrapper);
  v1 = (void *)sharedInstance_sIntentsWrapper;
  sharedInstance_sIntentsWrapper = (uint64_t)v0;

}

- (Class)INInteractionClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getINInteractionClass_softClass;
  v9 = getINInteractionClass_softClass;
  if (!getINInteractionClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getINInteractionClass_block_invoke;
    v5[3] = &unk_1E2401140;
    v5[4] = &v6;
    __getINInteractionClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

@end
