@implementation AVAssetVariantRenditionSpecificAudioAttributePredicate

- (AVAssetVariantRenditionSpecificAudioAttributePredicate)initWithAttributeSelector:(SEL)a3 mediaSelectionOption:(id)a4 value:(id)a5 operatorType:(unint64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v10 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", objc_msgSend(a4, "propertyList"));
  v11 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("audioAttributes"));
  v15[0] = v10;
  v12 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:selectorName:arguments:", v11, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sel_getName(a3)), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1));
  v14.receiver = self;
  v14.super_class = (Class)AVAssetVariantRenditionSpecificAudioAttributePredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithLeftExpression:rightExpression:modifier:type:options:](&v14, sel_initWithLeftExpression_rightExpression_modifier_type_options_, v12, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a5), 0, a6, 0);
}

@end
