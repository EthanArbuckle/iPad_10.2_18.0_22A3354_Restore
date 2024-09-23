@implementation AVTextStyleRule

+ (id)propertyListForTextStyleRules:(NSArray *)textStyleRules
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](textStyleRules, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](textStyleRules, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(textStyleRules);
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_dictionaryPlistRepresentation"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](textStyleRules, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

+ (NSArray)textStyleRulesFromPropertyList:(id)plist
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t CGColorSRGBFromArray;
  CGColor *v16;
  id v17;
  AVTextStyleRule *v18;
  id obj;
  uint64_t v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(plist, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = plist;
  v24 = objc_msgSend(plist, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v30;
    v4 = *MEMORY[0x1E0CA2C30];
    v21 = *MEMORY[0x1E0CA2DB0];
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v7 = (id)objc_msgSend(v6, "objectForKey:", v4);
        v8 = (id)objc_msgSend(v6, "objectForKey:", CFSTR("AVCGColorAttributes"));
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
        objc_msgSend(v9, "removeObjectForKey:", v4);
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("AVCGColorAttributes"));
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v9, "objectForKey:", v14);
              CGColorSRGBFromArray = FigCreateCGColorSRGBFromArray();
              if (CGColorSRGBFromArray)
              {
                v16 = (CGColor *)CGColorSRGBFromArray;
                objc_msgSend(v9, "setObject:forKey:", CGColorSRGBFromArray, v14);
                CGColorRelease(v16);
              }
            }
            v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v11);
        }
        if (v7)
        {
          if (objc_msgSend(v7, "isEqual:", v21))
            v17 = 0;
          else
            v17 = v7;
        }
        else
        {
          v17 = 0;
        }
        v18 = +[AVTextStyleRule textStyleRuleWithTextMarkupAttributes:textSelector:](AVTextStyleRule, "textStyleRuleWithTextMarkupAttributes:textSelector:", v9, v17);
        if (v18)
          -[NSArray addObject:](v22, "addObject:", v18);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }
  return v22;
}

+ (AVTextStyleRule)textStyleRuleWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes
{
  return (AVTextStyleRule *)objc_msgSend(a1, "textStyleRuleWithTextMarkupAttributes:textSelector:", textMarkupAttributes, 0);
}

+ (AVTextStyleRule)textStyleRuleWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes textSelector:(NSString *)textSelector
{
  return -[AVTextStyleRule initWithTextMarkupAttributes:textSelector:]([AVTextStyleRule alloc], "initWithTextMarkupAttributes:textSelector:", textMarkupAttributes, textSelector);
}

- (AVTextStyleRule)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99750];
  v6 = NSStringFromSelector(sel_initWithTextMarkupAttributes_textSelector_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVTextStyleRule)initWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes
{
  return -[AVTextStyleRule initWithTextMarkupAttributes:textSelector:](self, "initWithTextMarkupAttributes:textSelector:", textMarkupAttributes, 0);
}

- (AVTextStyleRule)initWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes textSelector:(NSString *)textSelector
{
  AVTextStyleRule *v6;
  AVTextStyleRuleInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTextStyleRule;
  v6 = -[AVTextStyleRule init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVTextStyleRuleInternal);
    v6->_textStyleRule = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_textStyleRule->textMarkupAttributes = textMarkupAttributes;
      v6->_textStyleRule->textSelector = textSelector;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVTextStyleRuleInternal *textStyleRule;
  objc_super v4;

  textStyleRule = self->_textStyleRule;
  if (textStyleRule)
  {

    CFRelease(self->_textStyleRule);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVTextStyleRule;
  -[AVTextStyleRule dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  NSString *textSelector;

  if (self != a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSDictionary isEqualToDictionary:](self->_textStyleRule->textMarkupAttributes, "isEqualToDictionary:", objc_msgSend(a3, "textMarkupAttributes"));
      if (!v5)
        return v5;
      v6 = objc_msgSend(a3, "textSelector");
      textSelector = self->_textStyleRule->textSelector;
      if (textSelector)
      {
        v5 = -[NSString isEqualToString:](textSelector, "isEqualToString:", v6);
        if (!v5)
          return v5;
        goto LABEL_11;
      }
      if (!v6)
      {
LABEL_11:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    LOBYTE(v5) = 0;
    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDictionary hash](self->_textStyleRule->textMarkupAttributes, "hash");
  return -[NSString hash](self->_textStyleRule->textSelector, "hash") ^ v3;
}

- (NSDictionary)textMarkupAttributes
{
  return self->_textStyleRule->textMarkupAttributes;
}

- (NSString)textSelector
{
  return self->_textStyleRule->textSelector;
}

- (id)_dictionaryPlistRepresentation
{
  void *v3;
  NSString *textSelector;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  const void *v12;
  CFTypeID v13;
  NSString *v14;
  NSString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_textStyleRule->textMarkupAttributes);
  textSelector = self->_textStyleRule->textSelector;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CA2968], *MEMORY[0x1E0CA2A20], 0);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = (const void *)objc_msgSend(v3, "objectForKey:", v11);
        if (v12)
        {
          v13 = CFGetTypeID(v12);
          if (v13 == CGColorGetTypeID())
          {
            objc_msgSend(v3, "setValue:forKey:", (id)FigCopyCGColorSRGBAsArray(), v11);
            objc_msgSend(v6, "addObject:", v11);
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  v14 = (NSString *)*MEMORY[0x1E0CA2DB0];
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("AVCGColorAttributes"));
  if (textSelector)
    v15 = textSelector;
  else
    v15 = v14;
  objc_msgSend(v3, "setObject:forKey:", v15, *MEMORY[0x1E0CA2C30]);
  return v3;
}

@end
