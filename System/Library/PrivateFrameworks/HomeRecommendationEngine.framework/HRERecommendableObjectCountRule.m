@implementation HRERecommendableObjectCountRule

- (HRERecommendableObjectCountRule)initWithAccessoryType:(id)a3 allowedCount:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  HRERecommendableObjectCountRule *result;
  objc_super v7;

  length = a4.length;
  location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)HRERecommendableObjectCountRule;
  result = -[HRERecommendableObjectTypeRule initWithRequiredType:](&v7, sel_initWithRequiredType_, a3);
  if (result)
  {
    result->_allowedCount.location = location;
    result->_allowedCount.length = length;
  }
  return result;
}

+ (id)ruleWithAccessoryType:(id)a3 allowedCount:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  HRERecommendableObjectCountRule *v7;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = -[HRERecommendableObjectCountRule initWithAccessoryType:allowedCount:]([HRERecommendableObjectCountRule alloc], "initWithAccessoryType:allowedCount:", v6, location, length);

  return v7;
}

- (BOOL)passesWithHomeObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "hre_matchingTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HRERecommendableObjectTypeRule requiredType](self, "requiredType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "containsObject:", v11);

        v7 += v12;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v13 = -[HRERecommendableObjectCountRule allowedCount](self, "allowedCount");
  v16 = v7 >= v13 && v7 - v13 < v14;

  return v16;
}

- (_NSRange)allowedCount
{
  _NSRange *p_allowedCount;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_allowedCount = &self->_allowedCount;
  location = self->_allowedCount.location;
  length = p_allowedCount->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
