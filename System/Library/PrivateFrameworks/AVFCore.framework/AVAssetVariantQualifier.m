@implementation AVAssetVariantQualifier

- (AVAssetVariantQualifier)initWithVariant:(id)a3
{
  AVAssetVariantQualifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantQualifier;
  v4 = -[AVAssetVariantQualifier init](&v6, sel_init);
  if (v4)
    v4->_variant = (AVAssetVariant *)a3;
  return v4;
}

+ (AVAssetVariantQualifier)assetVariantQualifierWithPredicate:(NSPredicate *)predicate
{
  return (AVAssetVariantQualifier *)-[AVAssetVariantQualifierWithPredicate initWithFigAssetVariantQualifierWithPredicate:]([AVAssetVariantQualifierWithPredicate alloc], "initWithFigAssetVariantQualifierWithPredicate:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC3228]), "initWithPredicate:", predicate));
}

+ (AVAssetVariantQualifier)assetVariantQualifierWithVariant:(AVAssetVariant *)variant
{
  return (AVAssetVariantQualifier *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithVariant:", variant);
}

+ (id)assetVariantQualifierForMinimumValueInKeyPath:(id)a3
{
  return -[AVAssetVariantQualifierForMinimumInKeyPath initWithFigAssetVariantQualifierForMinimumInKeyPath:]([AVAssetVariantQualifierForMinimumInKeyPath alloc], "initWithFigAssetVariantQualifierForMinimumInKeyPath:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC3220]), "initWithKeyPath:", a3));
}

+ (id)assetVariantQualifierForMaximumValueInKeyPath:(id)a3
{
  return -[AVAssetVariantQualifierForMaximumInKeyPath initWithFigAssetVariantQualifierForMaximumInKeyPath:]([AVAssetVariantQualifierForMaximumInKeyPath alloc], "initWithFigAssetVariantQualifierForMaximumInKeyPath:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC3218]), "initWithKeyPath:", a3));
}

+ (NSPredicate)predicateForChannelCount:(NSInteger)channelCount mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption operatorType:(NSPredicateOperatorType)operatorType
{
  return (NSPredicate *)-[AVAssetVariantChannelCountPredicate initWithChannelCount:mediaSelectionOption:operatorType:]([AVAssetVariantChannelCountPredicate alloc], "initWithChannelCount:mediaSelectionOption:operatorType:", channelCount, mediaSelectionOption, operatorType);
}

+ (NSPredicate)predicateForBinauralAudio:(BOOL)isBinauralAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  return (NSPredicate *)-[AVAssetVariantBinauralAudioPredicate initWithBinauralAudio:mediaSelectionOption:]([AVAssetVariantBinauralAudioPredicate alloc], "initWithBinauralAudio:mediaSelectionOption:", isBinauralAudio, mediaSelectionOption);
}

+ (NSPredicate)predicateForImmersiveAudio:(BOOL)isImmersiveAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  return (NSPredicate *)-[AVAssetVariantImmersiveAudioPredicate initWithImmersiveAudio:mediaSelectionOption:]([AVAssetVariantImmersiveAudioPredicate alloc], "initWithImmersiveAudio:mediaSelectionOption:", isImmersiveAudio, mediaSelectionOption);
}

+ (NSPredicate)predicateForDownmixAudio:(BOOL)isDownmixAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  return (NSPredicate *)-[AVAssetVariantDownmixAudioPredicate initWithDownmixAudio:mediaSelectionOption:]([AVAssetVariantDownmixAudioPredicate alloc], "initWithDownmixAudio:mediaSelectionOption:", isDownmixAudio, mediaSelectionOption);
}

+ (id)predicateForAudioSampleRate:(double)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5
{
  return -[AVAssetVariantAudioSampleRatePredicate initWithSampleRate:mediaSelectionOption:operatorType:]([AVAssetVariantAudioSampleRatePredicate alloc], "initWithSampleRate:mediaSelectionOption:operatorType:", a4, a5, a3);
}

+ (NSPredicate)predicateForPresentationWidth:(CGFloat)width operatorType:(NSPredicateOperatorType)operatorType
{
  return (NSPredicate *)-[AVAssetVariantPresentationWidthPredicate initWithPresentationWidth:operatorType:]([AVAssetVariantPresentationWidthPredicate alloc], "initWithPresentationWidth:operatorType:", operatorType, width);
}

+ (NSPredicate)predicateForPresentationHeight:(CGFloat)height operatorType:(NSPredicateOperatorType)operatorType
{
  return (NSPredicate *)-[AVAssetVariantPresentationHeightPredicate initWithPresentationHeight:operatorType:]([AVAssetVariantPresentationHeightPredicate alloc], "initWithPresentationHeight:operatorType:", operatorType, height);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantQualifier;
  -[AVAssetVariantQualifier dealloc](&v3, sel_dealloc);
}

- (id)_variant
{
  return self->_variant;
}

- (id)_figAssetVariantQualifier
{
  return self->_figAssetVariantQualifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVAssetVariantQualifier initWithVariant:]([AVAssetVariantQualifier alloc], "initWithVariant:", self->_variant);
}

- (int64_t)environmentalConditions
{
  return self->_environmentalConditions;
}

- (void)setEnvironmentalConditions:(int64_t)a3
{
  self->_environmentalConditions = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_variant, CFSTR("variant"));
}

- (AVAssetVariantQualifier)initWithCoder:(id)a3
{
  AVAssetVariantQualifier *v6;
  AVAssetVariantQualifier *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v8 = self;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v9, v10, v11, v12, v13, (uint64_t)v15.receiver), 0);
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVAssetVariantQualifier;
  v6 = -[AVAssetVariantQualifier init](&v15, sel_init);
  if (v6)
    v6->_variant = (AVAssetVariant *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variant"));
  return v6;
}

@end
