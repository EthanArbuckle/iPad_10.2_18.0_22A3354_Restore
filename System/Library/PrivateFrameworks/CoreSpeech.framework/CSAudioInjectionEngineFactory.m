@implementation CSAudioInjectionEngineFactory

+ (id)engineWithDeviceType:(int64_t)a3 streamHandleId:(unint64_t)a4
{
  __objc2_class **v4;

  if ((unint64_t)(a3 - 5) > 3)
    v4 = off_1E7C216D8;
  else
    v4 = off_1E7C26CD8[a3 - 5];
  return (id)objc_msgSend(objc_alloc(*v4), "initWithStreamHandleId:", a4);
}

@end
