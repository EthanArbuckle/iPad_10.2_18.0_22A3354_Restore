@implementation AVAudioMixEffect

- (AVAudioMixEffect)init
{
  AVAudioMixEffect *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAudioMixEffect;
  v3 = -[AVAudioMixEffect init](&v6, sel_init);
  if (v3)
  {
    v4 = objc_opt_class();
    AVRequireConcreteObject(v3, a2, v4);
  }
  return v3;
}

@end
