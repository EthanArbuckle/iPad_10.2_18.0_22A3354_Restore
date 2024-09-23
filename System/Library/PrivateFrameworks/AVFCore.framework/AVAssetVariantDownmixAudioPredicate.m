@implementation AVAssetVariantDownmixAudioPredicate

- (AVAssetVariantDownmixAudioPredicate)initWithDownmixAudio:(BOOL)a3 mediaSelectionOption:(id)a4
{
  _BOOL8 v5;
  SEL v7;
  objc_super v9;

  v5 = a3;
  v7 = NSSelectorFromString(CFSTR("isDownmixMediaOption:"));
  v9.receiver = self;
  v9.super_class = (Class)AVAssetVariantDownmixAudioPredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithAttributeSelector:mediaSelectionOption:value:operatorType:](&v9, sel_initWithAttributeSelector_mediaSelectionOption_value_operatorType_, v7, a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), 4);
}

@end
