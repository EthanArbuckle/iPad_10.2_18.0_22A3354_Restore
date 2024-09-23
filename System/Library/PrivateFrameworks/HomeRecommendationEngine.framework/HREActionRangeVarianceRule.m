@implementation HREActionRangeVarianceRule

- (id)_initWithType:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id result;
  objc_super v7;

  length = a4.length;
  location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)HREActionRangeVarianceRule;
  result = -[HRECharacteristicActionVarianceRule _initWithType:](&v7, sel__initWithType_, a3);
  if (result)
  {
    *((_QWORD *)result + 3) = location;
    *((_QWORD *)result + 4) = length;
  }
  return result;
}

+ (id)rangeVarianceWithType:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v7, location, length);

  return v8;
}

+ (id)rangeVarianceWithType:(id)a3 max:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v6, 0, a4 + 1);

  return v7;
}

+ (id)rangeVarianceWithType:(id)a3 min:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v6, a4, -1);

  return v7;
}

+ (id)rangeVarianceWithType:(id)a3 min:(unint64_t)a4 max:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v8, a4, a5 - a4 + 1);

  return v9;
}

- (BOOL)passesForAction:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HREActionRangeVarianceRule;
  if (-[HRECharacteristicActionVarianceRule passesForAction:](&v8, sel_passesForAction_, v4))
  {
    objc_msgSend(v4, "targetValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HREActionRangeVarianceRule passesWithTargetValue:](self, "passesWithTargetValue:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)passesWithTargetValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    v9 = -[HREActionRangeVarianceRule allowedTargetValues](self, "allowedTargetValues");
    v12 = v8 >= v9 && v8 - v9 < v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_NSRange)allowedTargetValues
{
  _NSRange *p_allowedTargetValues;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_allowedTargetValues = &self->_allowedTargetValues;
  location = self->_allowedTargetValues.location;
  length = p_allowedTargetValues->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
