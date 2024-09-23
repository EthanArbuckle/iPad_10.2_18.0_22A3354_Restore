@implementation AVAssetVariantAudioSampleRatePredicate

- (AVAssetVariantAudioSampleRatePredicate)initWithSampleRate:(double)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5
{
  SEL v9;
  objc_super v11;

  v9 = NSSelectorFromString(CFSTR("sampleRateForMediaOption:"));
  v11.receiver = self;
  v11.super_class = (Class)AVAssetVariantAudioSampleRatePredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithAttributeSelector:mediaSelectionOption:value:operatorType:](&v11, sel_initWithAttributeSelector_mediaSelectionOption_value_operatorType_, v9, a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3), a5);
}

@end
