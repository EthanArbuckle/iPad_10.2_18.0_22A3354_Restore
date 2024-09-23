@implementation AVAssetVariantChannelCountPredicate

- (AVAssetVariantChannelCountPredicate)initWithChannelCount:(int64_t)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5
{
  SEL v9;
  objc_super v11;

  v9 = NSSelectorFromString(CFSTR("channelCountForMediaOption:"));
  v11.receiver = self;
  v11.super_class = (Class)AVAssetVariantChannelCountPredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithAttributeSelector:mediaSelectionOption:value:operatorType:](&v11, sel_initWithAttributeSelector_mediaSelectionOption_value_operatorType_, v9, a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), a5);
}

@end
