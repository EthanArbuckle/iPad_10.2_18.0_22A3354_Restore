@implementation AVAssetVariantPresentationHeightPredicate

- (AVAssetVariantPresentationHeightPredicate)initWithPresentationHeight:(double)a3 operatorType:(unint64_t)a4
{
  uint64_t v7;
  objc_super v9;

  v7 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("videoAttributes.presentationHeight"));
  v9.receiver = self;
  v9.super_class = (Class)AVAssetVariantPresentationHeightPredicate;
  return -[AVAssetVariantPresentationHeightPredicate initWithLeftExpression:rightExpression:modifier:type:options:](&v9, sel_initWithLeftExpression_rightExpression_modifier_type_options_, v7, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3)), 0, a4, 0);
}

@end
