@implementation ANSpeechUtil

- (ANSpeechUtil)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ANSpeechUtil;
  return -[ANSpeechUtil init](&v3, sel_init);
}

+ (id)sharedUtil
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ANSpeechUtil_sharedUtil__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUtil_onceToken != -1)
    dispatch_once(&sharedUtil_onceToken, block);
  return (id)sharedUtil_sharedUtil;
}

void __26__ANSpeechUtil_sharedUtil__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedUtil_sharedUtil;
  sharedUtil_sharedUtil = v0;

}

- (void)synthesizeSpeechToFileFromText:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

@end
