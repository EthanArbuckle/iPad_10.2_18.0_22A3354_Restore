@implementation _NSPersonNameComponentsStyleFormatter

- (NSSet)abbreviatedKeys
{
  return 0;
}

- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5
{
  unint64_t v7;
  unint64_t v8;
  __CFString *v9;

  if (a5)
    goto LABEL_9;
  v7 = +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:](NSPersonNameComponentsFormatter, "__inferredScriptIndexFromString:");
  v8 = +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:](NSPersonNameComponentsFormatter, "__inferredScriptIndexFromString:", a4);
  if (v7 - 2 > 3)
    goto LABEL_9;
  if (v8 - 3 < 3)
    goto LABEL_4;
  if (v8 != 2)
  {
LABEL_9:
    v9 = CFSTR(" ");
    return (id)-[__CFString copy](v9, "copy");
  }
  if (+[NSPersonNameComponentsFormatter isKatakana:](NSPersonNameComponentsFormatter, "isKatakana:", a3)
    && +[NSPersonNameComponentsFormatter isKatakana:](NSPersonNameComponentsFormatter, "isKatakana:", a4))
  {
    v9 = CFSTR("・");
    return (id)-[__CFString copy](v9, "copy");
  }
LABEL_4:
  v9 = &stru_1E0F56070;
  return (id)-[__CFString copy](v9, "copy");
}

- (_NSPersonNameComponentsStyleFormatter)initWithMasterFormatter:(id)a3
{
  _NSPersonNameComponentsStyleFormatter *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_NSPersonNameComponentsStyleFormatter;
  v5 = -[_NSPersonNameComponentsStyleFormatter init](&v7, sel_init);
  if (v5)
  {
    if (!a3)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("NSPersonNameComponentsFormatter.m"), 746, CFSTR("We should never have a nil master formatter"));
    v5->_masterFormatter = (NSPersonNameComponentsFormatter *)objc_msgSend(a3, "copy");
  }
  return v5;
}

- (BOOL)isEnabled
{
  return !-[NSPersonNameComponentsFormatter __localizedRestrictionExistsForStyle:](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "__localizedRestrictionExistsForStyle:", -[NSPersonNameComponentsFormatter style](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "style"));
}

- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4
{
  id v7;
  id v8;

  v7 = -[_NSPersonNameComponentsStyleFormatter _orderedNonEmptyKeysFromComponents:](self, "_orderedNonEmptyKeysFromComponents:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[NSPersonNameComponentsFormatter __shortStyleRestrictionExistsForComponents:shortStyle:](NSPersonNameComponentsFormatter, "__shortStyleRestrictionExistsForComponents:shortStyle:", a3, -[_NSPersonNameComponentsStyleFormatter shortNameFormat](self, "shortNameFormat"))|| !-[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](self, "fullComponentsAreValid:", a3)|| !-[_NSPersonNameComponentsStyleFormatter isEnabled](self, "isEnabled")|| -[NSPersonNameComponentsFormatter __localizedRestrictionExistsForComponents:ignoreUndeterminedComponents:](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "__localizedRestrictionExistsForComponents:ignoreUndeterminedComponents:", a3, -[_NSPersonNameComponentsStyleFormatter shouldIgnoreComponentsContainingSpecialCharacters](self, "shouldIgnoreComponentsContainingSpecialCharacters")))
  {
    v8 = 0;
  }
  else
  {
    v8 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:](self, "_formattedStringFromOrderedKeys:components:attributesByRange:", v7, a3, a4);
  }
  if (!objc_msgSend(v8, "length"))
  {
    if (-[_NSPersonNameComponentsStyleFormatter shouldFallBack](self, "shouldFallBack")
      && !-[NSPersonNameComponentsFormatter _ignoresFallbacks](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "_ignoresFallbacks")&& -[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](self, "fallbackStyleFormatter"))
    {
      return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](-[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](self, "fallbackStyleFormatter"), "stringFromComponents:attributesByRange:", a3, a4);
    }
    return 0;
  }
  return v8;
}

- (id)_orderedNonEmptyKeysFromComponents:(id)a3
{
  NSArray *v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  -[_NSPersonNameComponentsStyleFormatter setOrdering:](self, "setOrdering:", -[NSPersonNameComponentsFormatter __computedNameOrderForComponents:](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "__computedNameOrderForComponents:", a3));
  v5 = -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](self, "orderedKeysOfInterest");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76___NSPersonNameComponentsStyleFormatter__orderedNonEmptyKeysFromComponents___block_invoke;
  v7[3] = &unk_1E0F555E8;
  v7[4] = a3;
  return -[NSArray objectsAtIndexes:](-[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](self, "orderedKeysOfInterest"), "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](v5, "indexesOfObjectsPassingTest:", v7));
}

- (NSArray)orderedKeysOfInterest
{
  NSArray *v3;
  uint64_t v4;
  NSIndexSet *v5;
  NSArray *v6;
  _QWORD v8[6];
  BOOL v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  if (!-[_NSPersonNameComponentsStyleFormatter keysOfInterest](self, "keysOfInterest"))
    return 0;
  v3 = -[_NSPersonNameComponentsStyleFormatter orderedTemplate](self, "orderedTemplate");
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke;
  v10[3] = &unk_1E0F555E8;
  v10[4] = self;
  v5 = -[NSArray indexesOfObjectsPassingTest:](v3, "indexesOfObjectsPassingTest:", v10);
  v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke_2;
  v8[3] = &unk_1E0F55610;
  v9 = -[NSPersonNameComponentsFormatter isPhonetic](-[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"), "isPhonetic");
  v8[4] = self;
  v8[5] = v6;
  -[NSIndexSet enumerateIndexesUsingBlock:](v5, "enumerateIndexesUsingBlock:", v8);
  return v6;
}

- (NSPersonNameComponentsFormatter)masterFormatter
{
  return (NSPersonNameComponentsFormatter *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)orderedTemplate
{
  NSArray *result;
  id v4;

  result = self->_orderedTemplate;
  if (!result)
  {
    if (-[_NSPersonNameComponentsStyleFormatter ordering](self, "ordering") == 2)
      v4 = +[NSPersonNameComponentsFormatter __familyNameFirstOrdering](NSPersonNameComponentsFormatter, "__familyNameFirstOrdering");
    else
      v4 = +[NSPersonNameComponentsFormatter __givenNameFirstOrdering](NSPersonNameComponentsFormatter, "__givenNameFirstOrdering");
    result = (NSArray *)(id)objc_msgSend(v4, "copy");
    self->_orderedTemplate = result;
  }
  return result;
}

- (void)setOrdering:(int64_t)a3
{
  self->_ordering = a3;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  return 1;
}

- (BOOL)shouldFallBack
{
  return 1;
}

- (int64_t)ordering
{
  return self->_ordering;
}

- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters
{
  return 0;
}

- (_NSPersonNameComponentsStyleFormatter)fallbackStyleFormatter
{
  return (_NSPersonNameComponentsStyleFormatter *)objc_getProperty(self, a2, 16, 1);
}

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  void *v9;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__33;
  v16 = __Block_byref_object_dispose__33;
  v17 = 0;
  v17 = +[NSString string](NSMutableString, "string");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102___NSPersonNameComponentsStyleFormatter__formattedStringFromOrderedKeys_components_attributesByRange___block_invoke;
  v11[3] = &unk_1E0F55638;
  v11[4] = a4;
  v11[5] = self;
  v11[7] = a5;
  v11[8] = &v12;
  v11[6] = a3;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)setFallbackStyleFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[_NSPersonNameComponentsStyleFormatter _releaseIvars](self, "_releaseIvars");
  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsStyleFormatter;
  -[_NSPersonNameComponentsStyleFormatter dealloc](&v3, sel_dealloc);
}

- (void)_releaseIvars
{

}

- (NSSet)keysOfInterest
{
  return 0;
}

- (id)annotatedStringFromPersonNameComponents:(id)a3
{
  void *v5;
  const __CFString *v6;
  NSMutableAttributedString *v7;
  NSMutableAttributedString *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](self, "stringFromComponents:attributesByRange:", a3, v5);
  if (!v6)
  {
    if (qword_1ECD09AB0 != -1)
      dispatch_once(&qword_1ECD09AB0, &__block_literal_global_1108);
    if (byte_1ECD09A11)
      v6 = &stru_1E0F56070;
    else
      v6 = 0;
  }
  v7 = [NSMutableAttributedString alloc];
  v8 = -[NSMutableAttributedString initWithString:attributes:](v7, "initWithString:attributes:", v6, MEMORY[0x1E0C9AA70]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81___NSPersonNameComponentsStyleFormatter_annotatedStringFromPersonNameComponents___block_invoke;
  v10[3] = &unk_1E0F4D940;
  v10[4] = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  return (id)-[NSMutableAttributedString copy](v8, "copy");
}

- (NSArray)fallbackDescriptor
{
  NSArray *result;
  void *v4;
  uint64_t v5;
  _NSPersonNameComponentsStyleFormatter *v6;
  _NSPersonNameComponentsStyleFormatter *v7;
  void *v8;
  void *v9;

  result = self->_fallbackDescriptor;
  if (!result)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](self, "orderedKeysOfInterest"));
    if (v5)
      objc_msgSend(v4, "addObject:", v5);
    v6 = -[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](self, "fallbackStyleFormatter");
    if (v6)
    {
      v7 = v6;
      do
      {
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](v7, "orderedKeysOfInterest"));
        if (v8)
        {
          v9 = v8;
          if (objc_msgSend(v8, "count"))
          {
            if ((objc_msgSend(v4, "containsObject:", v9) & 1) == 0)
              objc_msgSend(v4, "addObject:", v9);
          }
        }
        v7 = -[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](v7, "fallbackStyleFormatter");
      }
      while (v7);
    }
    result = v4;
    self->_fallbackDescriptor = result;
  }
  return result;
}

@end
