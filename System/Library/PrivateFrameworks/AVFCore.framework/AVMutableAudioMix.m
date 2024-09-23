@implementation AVMutableAudioMix

+ (AVMutableAudioMix)audioMix
{
  return (AVMutableAudioMix *)objc_alloc_init((Class)a1);
}

- (NSArray)inputParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMix;
  return -[AVAudioMix inputParameters](&v3, sel_inputParameters);
}

- (void)setInputParameters:(NSArray *)inputParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMix;
  -[AVAudioMix setInputParameters:](&v3, sel_setInputParameters_, inputParameters);
}

@end
