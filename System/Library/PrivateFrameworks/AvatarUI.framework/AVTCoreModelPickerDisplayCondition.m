@implementation AVTCoreModelPickerDisplayCondition

+ (id)displayConditionFromDictionnary:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (!a3)
    return 0;
  v4 = kAVTEditingModelDefinitionsDisplayConditionSectionIndexKey;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsDisplayConditionValueKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1, "conditionValueFromString:", v8);
  return -[AVTCoreModelPickerDisplayCondition initWithTargetSectionIndex:value:]([AVTCoreModelPickerDisplayCondition alloc], "initWithTargetSectionIndex:value:", v7, v9);
}

+ (unint64_t)conditionValueFromString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("showColorSlider")) ^ 1;
}

- (AVTCoreModelPickerDisplayCondition)initWithTargetSectionIndex:(unint64_t)a3 value:(unint64_t)a4
{
  AVTCoreModelPickerDisplayCondition *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTCoreModelPickerDisplayCondition;
  result = -[AVTCoreModelPickerDisplayCondition init](&v7, sel_init);
  if (result)
  {
    result->_targetSectionIndex = a3;
    result->_value = a4;
  }
  return result;
}

- (unint64_t)targetSectionIndex
{
  return self->_targetSectionIndex;
}

- (unint64_t)value
{
  return self->_value;
}

@end
