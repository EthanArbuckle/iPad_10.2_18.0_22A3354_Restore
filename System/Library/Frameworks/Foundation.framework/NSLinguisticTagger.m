@implementation NSLinguisticTagger

+ (NSArray)availableTagSchemesForUnit:(NSLinguisticTaggerUnit)unit language:(NSString *)language
{
  CFLocaleRef v5;
  CFLocaleRef v6;
  void *v7;

  v5 = CFLocaleCreate(0, (CFLocaleIdentifier)language);
  if (v5)
  {
    v6 = v5;
    if (qword_1ECD0A598 != -1)
      dispatch_once(&qword_1ECD0A598, &__block_literal_global_426);
    if (_MergedGlobals_142)
      v7 = (void *)off_1ECD0A460(unit, v6);
    else
      v7 = 0;
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return (NSArray *)v7;
}

+ (NSArray)availableTagSchemesForLanguage:(NSString *)language
{
  return (NSArray *)objc_msgSend(a1, "availableTagSchemesForUnit:language:", 0, language);
}

- (NSLinguisticTagger)initWithTagSchemes:(NSArray *)tagSchemes options:(NSUInteger)opts
{
  NSLinguisticTagger *v6;
  void *v7;
  void *v8;
  NSCharacterSet *v9;
  NSCharacterSet *v10;
  NSCharacterSet *v11;
  NSMutableCharacterSet *v12;
  NSCharacterSet *v13;
  NSMutableCharacterSet *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NSLinguisticTagger;
  v6 = -[NSLinguisticTagger init](&v16, sel_init);
  v6->_schemes = (NSArray *)-[NSArray copy](tagSchemes, "copy");
  v6->_options = opts;
  if (qword_1ECD0A468 != -1)
    dispatch_once(&qword_1ECD0A468, &__block_literal_global_67);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", tagSchemes);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((objc_msgSend(v7, "containsObject:", CFSTR("Language")) & 1) == 0)
    objc_msgSend(v7, "addObject:", CFSTR("Language"));
  if ((objc_msgSend(v7, "containsObject:", CFSTR("Script")) & 1) == 0)
    objc_msgSend(v7, "addObject:", CFSTR("Script"));
  if ((opts & 0x20000000) != 0)
    objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("LSTMLanguageIdentifier"));
  if ((opts & 0x10000000) != 0)
    objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("SmartTokenBreak"));
  if (qword_1ECD0A598 != -1)
    dispatch_once(&qword_1ECD0A598, &__block_literal_global_426);
  if (_MergedGlobals_142)
    v6->_reserved = (void *)off_1ECD0A478(v7, v8);
  objc_msgSend((id)qword_1ECD0A470, "lock");
  v9 = (NSCharacterSet *)qword_1ECD0A480;
  if (!qword_1ECD0A480)
  {
    v9 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
    qword_1ECD0A480 = (uint64_t)v9;
  }
  if (!qword_1ECD0A488)
    qword_1ECD0A488 = -[NSCharacterSet invertedSet](v9, "invertedSet");
  v10 = (NSCharacterSet *)qword_1ECD0A490;
  if (!qword_1ECD0A490)
  {
    v10 = +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet");
    qword_1ECD0A490 = (uint64_t)v10;
  }
  if (!qword_1ECD0A498)
    qword_1ECD0A498 = -[NSCharacterSet invertedSet](v10, "invertedSet");
  if (!qword_1ECD0A4A0)
    qword_1ECD0A4A0 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("\r\f\n\u2029"));
  v11 = (NSCharacterSet *)qword_1ECD0A4A8;
  if (!qword_1ECD0A4A8)
  {
    v11 = +[NSCharacterSet punctuationCharacterSet](NSCharacterSet, "punctuationCharacterSet");
    qword_1ECD0A4A8 = (uint64_t)v11;
  }
  if (!qword_1ECD0A4B0)
    qword_1ECD0A4B0 = -[NSCharacterSet invertedSet](v11, "invertedSet");
  if (!qword_1ECD0A4B8)
  {
    v12 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet](NSMutableCharacterSet, "whitespaceAndNewlineCharacterSet");
    -[NSMutableCharacterSet formUnionWithCharacterSet:](v12, "formUnionWithCharacterSet:", qword_1ECD0A4A8);
    -[NSMutableCharacterSet invert](v12, "invert");
    qword_1ECD0A4B8 = -[NSMutableCharacterSet copy](v12, "copy");
  }
  v13 = (NSCharacterSet *)qword_1ECD0A4C0;
  if (!qword_1ECD0A4C0)
  {
    v13 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(".?!。！．？｡"));
    qword_1ECD0A4C0 = (uint64_t)v13;
  }
  if (!qword_1ECD0A4C8)
    qword_1ECD0A4C8 = -[NSCharacterSet invertedSet](v13, "invertedSet");
  if (!qword_1ECD0A4D0)
    qword_1ECD0A4D0 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("'’"));
  if (!qword_1ECD0A4D8)
    qword_1ECD0A4D8 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("-'\"()«»‐‑‒–—―‘’‚‛“”„‟‹›「」『』"));
  if (!qword_1ECD0A4E0)
    qword_1ECD0A4E0 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("'\"«»‘’‚‛“”„‟‹›「」『』"));
  if (!qword_1ECD0A4E8)
    qword_1ECD0A4E8 = +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet");
  if (!qword_1ECD0A4F0)
  {
    v14 = +[NSMutableCharacterSet punctuationCharacterSet](NSMutableCharacterSet, "punctuationCharacterSet");
    -[NSMutableCharacterSet formUnionWithCharacterSet:](v14, "formUnionWithCharacterSet:", qword_1ECD0A4E8);
    -[NSMutableCharacterSet invert](v14, "invert");
    qword_1ECD0A4F0 = -[NSMutableCharacterSet copy](v14, "copy");
  }
  if (!qword_1ECD0A4F8)
    qword_1ECD0A4F8 = +[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet");
  if (!qword_1ECD0A500)
    qword_1ECD0A500 = objc_retain(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("([{</@-=–—")));
  if (!qword_1ECD0A508)
    qword_1ECD0A508 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("nstNST"));
  objc_msgSend((id)qword_1ECD0A470, "unlock");
  return v6;
}

NSLock *__49__NSLinguisticTagger_initWithTagSchemes_options___block_invoke()
{
  NSLock *result;

  result = objc_alloc_init(NSLock);
  qword_1ECD0A470 = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  void *reserved;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  reserved = self->_reserved;
  if (reserved)
    CFRelease(reserved);
  v4.receiver = self;
  v4.super_class = (Class)NSLinguisticTagger;
  -[NSLinguisticTagger dealloc](&v4, sel_dealloc);
}

- (id)description
{
  NSMutableString *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSLinguisticTagger;
  v3 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@\n"), -[NSLinguisticTagger description](&v5, sel_description));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("    tag schemes %@\n"), self->_schemes);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("    string %p has %lu characters\n"), self->_string, -[NSString length](self->_string, "length"));
  return v3;
}

- (NSArray)tagSchemes
{
  return self->_schemes;
}

- (id)_tagSchemeForScheme:(id)a3
{
  const __CFString *v4;

  if (!-[NSArray containsObject:](self->_schemes, "containsObject:"))
    return 0;
  v4 = CFSTR("TokenType");
  if ((objc_msgSend(CFSTR("TokenType"), "isEqualToString:", a3) & 1) == 0)
  {
    v4 = CFSTR("LexicalClass");
    if ((objc_msgSend(CFSTR("LexicalClass"), "isEqualToString:", a3) & 1) == 0)
    {
      v4 = CFSTR("NameType");
      if ((objc_msgSend(CFSTR("NameType"), "isEqualToString:", a3) & 1) == 0)
      {
        v4 = CFSTR("NameTypeOrLexicalClass");
        if ((objc_msgSend(CFSTR("NameTypeOrLexicalClass"), "isEqualToString:", a3) & 1) == 0)
        {
          v4 = CFSTR("Lemma");
          if ((objc_msgSend(CFSTR("Lemma"), "isEqualToString:", a3) & 1) == 0)
          {
            v4 = CFSTR("Language");
            if ((objc_msgSend(CFSTR("Language"), "isEqualToString:", a3) & 1) == 0)
            {
              v4 = CFSTR("Script");
              if ((objc_msgSend(CFSTR("Script"), "isEqualToString:", a3) & 1) == 0)
              {
                v4 = CFSTR("PossibleClasses");
                if ((objc_msgSend(CFSTR("PossibleClasses"), "isEqualToString:", a3) & 1) == 0)
                {
                  v4 = CFSTR("InternalClass");
                  if (!objc_msgSend(CFSTR("InternalClass"), "isEqualToString:", a3))
                    return 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return (id)v4;
}

+ (BOOL)supportsLanguage:(id)a3
{
  if (a3)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en"), CFSTR("fr"), CFSTR("de"), CFSTR("es"), CFSTR("it"), CFSTR("pt"), CFSTR("ru"), CFSTR("tr"), CFSTR("ja"), 0), "containsObject:", a3);
  else
    return 0;
}

- (void)setString:(NSString *)string
{
  NSString *v5;
  id tokenArray;
  id orthographyArray;
  void *reserved;

  v5 = self->_string;
  if (v5 != string)
  {

    self->_string = string;
  }
  tokenArray = self->_tokenArray;
  if (tokenArray)
  {

    self->_tokenArray = 0;
  }
  orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {

    self->_orthographyArray = 0;
  }
  reserved = self->_reserved;
  if (reserved)
    off_1ECD0A510(reserved, string);
}

- (NSString)string
{
  return self->_string;
}

- (void)stringEditedInRange:(NSRange)newRange changeInLength:(NSInteger)delta
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  id tokenArray;
  unint64_t v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  id v17;
  uint64_t v18;
  id orthographyArray;
  uint64_t v20;
  void *reserved;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;

  length = newRange.length;
  location = newRange.location;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = newRange.length - delta;
  v22 = 0;
  v23 = 0;
  tokenArray = self->_tokenArray;
  if (tokenArray)
  {
    v10 = objc_msgSend(tokenArray, "count");
    if (location < v10
      && (v11 = (void *)objc_msgSend(self->_tokenArray, "objectAtIndex:effectiveRange:", location, &v22)) != 0)
    {
      v12 = v8;
      v13 = location;
      if ((objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
      {
        v14 = location - v22;
        if (location < v22)
          v14 = 0;
        v15 = v14 + v8;
        if (v22 >= location)
          v13 = location;
        else
          v13 = v22;
        if (v23 + v22 <= v15 + v13)
          v12 = v15;
        else
          v12 = v23 + v22 - v13;
      }
    }
    else
    {
      v12 = v8;
      v13 = location;
    }
    if (v8)
    {
      if (v8 + location <= v10)
      {
        v16 = (void *)objc_msgSend(self->_tokenArray, "objectAtIndex:effectiveRange:", v8 + location - 1, &v22);
        if (v16)
        {
          if ((objc_msgSend(v16, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0
            && v23 + v22 > v13 + v12)
          {
            v12 = v23 + v22 - v13;
          }
        }
      }
    }
    v17 = self->_tokenArray;
    v18 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    if (v12)
      objc_msgSend(v17, "replaceObjectsInRange:withObject:length:", v13, v12, v18, v12 + delta);
    else
      objc_msgSend(v17, "insertObject:range:", v18, v13, delta);
  }
  orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {
    v20 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    if (v8)
      objc_msgSend(orthographyArray, "replaceObjectsInRange:withObject:length:", location, v8, v20, length);
    else
      objc_msgSend(orthographyArray, "insertObject:range:", v20, location, length);
  }
  reserved = self->_reserved;
  if (reserved)
    off_1ECD0A518(reserved, location, length, delta);
}

- (void)_setOrthography:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const __CFString *v7;
  CFLocaleRef v8;

  if (self->_reserved)
  {
    length = a4.length;
    location = a4.location;
    v7 = (const __CFString *)objc_msgSend(a3, "dominantLanguage");
    if (v7)
      v8 = CFLocaleCreate(0, v7);
    else
      v8 = 0;
    off_1ECD0A520(self->_reserved, v8, location, length);
    if (v8)
      CFRelease(v8);
  }
}

- (void)_nativeSetOrthography:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  unint64_t orthographyArray;
  NSMutableRLEArray *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  unint64_t v18;
  id v19;
  void *v20;
  NSUInteger v21;
  uint64_t v22;
  id v23;
  void *v24;

  length = a4.length;
  location = a4.location;
  v9 = -[NSString length](self->_string, "length");
  if (v9 < length || location > v9 - length)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v24);
  }
  if (length)
  {
    orthographyArray = (unint64_t)self->_orthographyArray;
    if ((unint64_t)a3 | orthographyArray)
    {
      if (!orthographyArray)
      {
        v12 = -[NSRLEArray init](+[NSMutableRLEArray allocWithZone:](NSMutableRLEArray, "allocWithZone:", -[NSLinguisticTagger zone](self, "zone")), "init");
        self->_orthographyArray = v12;
        -[NSMutableRLEArray insertObject:range:](v12, "insertObject:range:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), 0, -[NSString length](self->_string, "length"));
        orthographyArray = (unint64_t)self->_orthographyArray;
      }
      v13 = objc_msgSend((id)orthographyArray, "count");
      v14 = location + length;
      if (location + length >= v13)
        v14 = v13;
      if (location)
        v15 = 0;
      else
        v15 = v14;
      v16 = v14 - location;
      if (location < v13)
        v17 = location;
      else
        v17 = 0;
      if (location < v13)
        v18 = v16;
      else
        v18 = v15;
      v19 = self->_orthographyArray;
      if (a3)
      {
        v20 = v19;
        v21 = v17;
        v22 = v18;
        v23 = a3;
      }
      else
      {
        v23 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v20 = v19;
        v21 = v17;
        v22 = v18;
      }
      objc_msgSend(v20, "replaceObjectsInRange:withObject:length:", v21, v22, v23, v18);
    }
  }
}

- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;

  length = range.length;
  location = range.location;
  -[NSLinguisticTagger _nativeSetOrthography:range:](self, "_nativeSetOrthography:range:");
  if (self->_reserved)
    -[NSLinguisticTagger _setOrthography:range:](self, "_setOrthography:range:", orthography, location, length);
}

- (void)_detectOrthographyIfNeededAtIndex:(unint64_t)a3
{
  id orthographyArray;
  void *v6;
  void *reserved;
  const void *v8;
  uint64_t v9;
  const void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;

  orthographyArray = self->_orthographyArray;
  if (!orthographyArray
    || objc_msgSend(orthographyArray, "count") <= a3
    || (v6 = (void *)objc_msgSend(self->_orthographyArray, "objectAtIndex:effectiveRange:", a3, 0),
        objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"))))
  {
    reserved = self->_reserved;
    if (reserved)
    {
      v8 = (const void *)off_1ECD0A528(reserved, 2, a3, CFSTR("Script"));
      v9 = off_1ECD0A528(self->_reserved, 2, a3, CFSTR("Language"));
      v10 = (const void *)v9;
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {
        if (!v8)
        {
          if (!v9)
            return;
          goto LABEL_12;
        }
      }
      else
      {
        v12 = -[NSString paragraphRangeForRange:](self->_string, "paragraphRangeForRange:", a3, 0);
        v14 = v13;
        v15 = (void *)off_1ECD0A530(self->_reserved, 2, a3);
        v17 = v15;
        if (!v15 || (v18 = objc_msgSend(v15, "objectForKey:", v8), v16 = (uint64_t)v17, !v18))
          v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10, v16), v8);
        -[NSLinguisticTagger _nativeSetOrthography:range:](self, "_nativeSetOrthography:range:", +[NSOrthography _orthographyWithDominantScript:languageMap:](NSOrthography, "_orthographyWithDominantScript:languageMap:", v8, v16), v12, v14);
        if (v17)
          CFRelease(v17);
      }
      CFRelease(v8);
      if (!v10)
        return;
LABEL_12:
      CFRelease(v10);
    }
  }
}

- (NSOrthography)orthographyAtIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveRange
{
  id orthographyArray;
  NSUInteger v9;
  NSOrthography *v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v15;

  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v15);
  }
  if (self->_reserved)
    -[NSLinguisticTagger _detectOrthographyIfNeededAtIndex:](self, "_detectOrthographyIfNeededAtIndex:", charIndex);
  orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {
    v9 = objc_msgSend(orthographyArray, "count");
    if (v9 > charIndex)
    {
      v10 = (NSOrthography *)objc_msgSend(self->_orthographyArray, "objectAtIndex:effectiveRange:", charIndex, effectiveRange);
      goto LABEL_14;
    }
    if (effectiveRange)
    {
      v12 = v9;
      v13 = -[NSString length](self->_string, "length");
      v10 = 0;
      if (v13 <= charIndex)
      {
        effectiveRange->location = charIndex;
        effectiveRange->length = 1;
      }
      else
      {
        effectiveRange->location = v12;
        effectiveRange->length = v13 - v12;
      }
      goto LABEL_14;
    }
  }
  else if (effectiveRange)
  {
    v11 = -[NSString length](self->_string, "length");
    v10 = 0;
    effectiveRange->location = 0;
    effectiveRange->length = v11;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:
  if (-[NSOrthography isEqual:](v10, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
    return 0;
  else
    return v10;
}

- (_NSRange)_sentenceRangeForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  void *reserved;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = -[NSString length](-[NSLinguisticTagger string](self, "string"), "length");
  v8 = location + length;
  if (location + length > v7)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v13);
  }
  if (v7)
  {
    reserved = self->_reserved;
    if (reserved)
    {
      v17 = 0;
      v18 = 0;
      v19 = 0;
      off_1ECD0A538(&v17, reserved, 1, location);
      location = v17;
      v10 = v18;
      if (length)
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        off_1ECD0A538(&v14, self->_reserved, 1, v8 - 1);
        if (v15 + v14 <= v10 + location)
          length = v10;
        else
          length = v15 + v14 - location;
      }
      else
      {
        length = v18;
      }
    }
  }
  else
  {
    location = 0;
    length = 0;
  }
  v11 = location;
  v12 = length;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)_tagAtIndex:(unint64_t)a3 scheme:(id)a4 tokenRange:(_NSRange *)a5 sentenceRange:(_NSRange *)a6
{
  id v12;
  id v13;
  void *reserved;
  void *v15;
  id v16;
  void *v18;
  _NSRange v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_string, "length") <= a3)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v18);
  }
  v12 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", a4);
  if (!v12)
    return 0;
  v13 = v12;
  reserved = self->_reserved;
  if (!reserved)
    return 0;
  v15 = (void *)off_1ECD0A528(reserved, 0, a3, v13);
  v16 = tagForNLTag(v15);
  if (v15)
    CFRelease(v15);
  if (a5)
  {
    v19 = (_NSRange)0;
    v20 = 0;
    off_1ECD0A538(&v19, self->_reserved, 0, a3);
    *a5 = v19;
  }
  if (a6)
  {
    v19 = (_NSRange)0;
    v20 = 0;
    off_1ECD0A538(&v19, self->_reserved, 1, a3);
    *a6 = v19;
  }
  return v16;
}

- (NSArray)possibleTagsAtIndex:(NSUInteger)charIndex scheme:(NSString *)tagScheme tokenRange:(NSRangePointer)tokenRange sentenceRange:(NSRangePointer)sentenceRange scores:(NSArray *)scores
{
  double v7;
  NSNumber *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  const __CFString *v31;
  const __CFString *v32;
  NSArray *v33;
  NSUInteger v34;
  _QWORD *p_location;
  NSUInteger v36;
  NSUInteger v37;
  uint64_t v38;
  unsigned __int16 *v39;
  unint64_t v40;
  uint64_t v41;
  NSUInteger v42;
  unint64_t v44;
  unint64_t v45;
  BOOL v46;
  NSUInteger v47;
  unint64_t v50;
  id orthographyArray;
  NSString *string;
  NSUInteger v53;
  NSUInteger v54;
  void *v55;
  const __CFString *v60;
  BOOL v66;
  const __CFString *v67;
  NSString *v68;
  NSUInteger v69;
  NSUInteger v70;
  void *v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  const void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  float v96;
  __CFString *v97;
  int v98;
  uint64_t v99;
  NSString *v100;
  uint64_t v101;
  uint64_t v102;
  const void *LXLemmatizer;
  uint64_t v104;
  NSUInteger v105;
  uint64_t v106;
  NSUInteger v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t j;
  double v114;
  const __CFString *v115;
  unsigned __int8 v116;
  void *v117;
  NSString *v118;
  uint64_t v119;
  NSUInteger v120;
  id v121;
  NSUInteger v122;
  NSRange *v123;
  NSArray **v124;
  NSNumber *v125;
  NSRangePointer v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  _BYTE v131[128];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  LODWORD(v7) = 1.0;
  v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7);
  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    v117 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v117);
  }
  v16 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", tagScheme);
  if (!v16)
    return 0;
  v17 = v16;
  v125 = v15;
  v126 = tokenRange;
  v130 = 0;
  v129 = 0;
  v128 = 0;
  v127 = 0;
  v18 = -[NSLinguisticTagger _tokenDataForParagraphAtIndex:paragraphRange:tagScheme:](self, "_tokenDataForParagraphAtIndex:paragraphRange:tagScheme:", charIndex, &v129, v16);
  v19 = objc_msgSend(v18, "bytes");
  v20 = (unint64_t)objc_msgSend(v18, "length") >> 4;
  v21 = v129;
  v22 = v130;
  v23 = sentenceRangeAtIndexInTokens(charIndex, v129, v130, v19, v20, (uint64_t *)&v127);
  v25 = v21 + *(unsigned __int16 *)(v19 + 16 * v127);
  if (v25 > charIndex)
  {
    v124 = scores;
    v26 = v25 - v23;
    if (v17 == CFSTR("NameType")
      || v17 == CFSTR("LexicalClass")
      || v17 == CFSTR("NameTypeOrLexicalClass")
      || v17 == CFSTR("PossibleClasses")
      || v17 == CFSTR("InternalClass"))
    {
      v31 = CFSTR("Whitespace");
    }
    else
    {
      v31 = 0;
    }
    if (v17 == CFSTR("TokenType"))
      v32 = CFSTR("Whitespace");
    else
      v32 = v31;
    v33 = 0;
    v34 = v23;
    goto LABEL_23;
  }
  v38 = v128;
  if (v127 >= v128 + v127)
  {
    v34 = 0;
    v26 = 0;
    v33 = 0;
LABEL_48:
    p_location = &v126->location;
    goto LABEL_49;
  }
  v124 = scores;
  v123 = sentenceRange;
  v39 = (unsigned __int16 *)(v19 + 16 * v127);
  v40 = v127 + 1;
  while (1)
  {
    v41 = *v39;
    v34 = v21 + v41;
    v26 = *((unsigned __int8 *)v39 + 2);
    v42 = v21 + v41 + v26;
    if (v21 + v41 <= charIndex && v42 > charIndex)
    {
      v50 = *((unsigned __int8 *)v39 + 3);
      if ((v50 - 14) > 0x4A)
      {
        p_location = &v126->location;
        if ((v50 - 2) > 0xB)
        {
          sentenceRange = v123;
          if ((_DWORD)v50 == 1)
          {
            v33 = 0;
            if (v17 == CFSTR("LexicalClass")
              || v17 == CFSTR("TokenType")
              || v17 == CFSTR("NameType")
              || v17 == CFSTR("NameTypeOrLexicalClass")
              || v17 == CFSTR("PossibleClasses")
              || v17 == CFSTR("InternalClass"))
            {
              v32 = CFSTR("Other");
            }
            else
            {
              v32 = 0;
            }
            goto LABEL_24;
          }
        }
        else
        {
          sentenceRange = v123;
          if (v17 == CFSTR("TokenType"))
          {
LABEL_119:
            v33 = 0;
            v32 = CFSTR("Punctuation");
            goto LABEL_24;
          }
          if (v17 == CFSTR("PossibleClasses")
            || v17 == CFSTR("NameTypeOrLexicalClass")
            || v17 == CFSTR("LexicalClass")
            || v17 == CFSTR("NameType"))
          {
            v33 = 0;
            v32 = CFSTR("SentenceTerminator");
            switch((int)v50)
            {
              case 2:
                goto LABEL_24;
              case 5:
                v33 = 0;
                v32 = CFSTR("OpenQuote");
                goto LABEL_24;
              case 6:
                v33 = 0;
                v32 = CFSTR("CloseQuote");
                goto LABEL_24;
              case 7:
                v33 = 0;
                v32 = CFSTR("OpenParenthesis");
                goto LABEL_24;
              case 8:
                v33 = 0;
                v32 = CFSTR("CloseParenthesis");
                goto LABEL_24;
              case 9:
                v33 = 0;
                v32 = CFSTR("WordJoiner");
                goto LABEL_24;
              case 11:
                v33 = 0;
                v32 = CFSTR("Dash");
                goto LABEL_24;
              case 13:
                goto LABEL_119;
              default:
                goto LABEL_49;
            }
            goto LABEL_49;
          }
          if (v17 == CFSTR("InternalClass"))
          {
            v53 = v23;
            v54 = v24;
            v55 = (void *)internalTagForCategory_internalTagArray;
            if (!internalTagForCategory_internalTagArray)
            {
              v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("NONE"), CFSTR("OTHER"), CFSTR("."), CFSTR("?"), CFSTR("!"), CFSTR("“"), CFSTR("”"), CFSTR("("), CFSTR(")"), CFSTR("-"), CFSTR(","), CFSTR("--"), CFSTR(":"), CFSTR("SYM"), CFSTR("ABB"), CFSTR("ACK"), CFSTR("CC"),
                              CFSTR("CD"),
                              CFSTR("CS"),
                              CFSTR("DT"),
                              CFSTR("DTO"),
                              CFSTR("DTP"),
                              CFSTR("DTW"),
                              CFSTR("EX"),
                              CFSTR("FW"),
                              CFSTR("IN"),
                              CFSTR("JJ"),
                              CFSTR("JJR"),
                              CFSTR("JJS"),
                              CFSTR("LS"),
                              CFSTR("NN"),
                              CFSTR("NNS"),
                              CFSTR("NNP"),
                              CFSTR("NNPS"),
                              CFSTR("PRE"),
                              CFSTR("PRP"),
                              CFSTR("PRPD"),
                              CFSTR("PRPR"),
                              CFSTR("PRPS"),
                              CFSTR("PRPT"),
                              CFSTR("RB"),
                              CFSTR("RBC"),
                              CFSTR("RBN"),
                              CFSTR("RBP"),
                              CFSTR("RBR"),
                              CFSTR("RBS"),
                              CFSTR("RBW"),
                              CFSTR("RP"),
                              CFSTR("RPP"),
                              CFSTR("TO"),
                              CFSTR("UH"),
                              CFSTR("URL"),
                              CFSTR("VB"),
                              CFSTR("VBC"),
                              CFSTR("VBD"),
                              CFSTR("VBF"),
                              CFSTR("VBG"),
                              CFSTR("VBI"),
                              CFSTR("VBM"),
                              CFSTR("VBN"),
                              CFSTR("VBP"));
              internalTagForCategory_internalTagArray = (uint64_t)v55;
            }
            if (objc_msgSend(v55, "count") <= v50)
            {
              v33 = 0;
              v32 = CFSTR("NONE");
            }
            else
            {
              v32 = (const __CFString *)objc_msgSend((id)internalTagForCategory_internalTagArray, "objectAtIndex:", v50);
              v33 = 0;
            }
            sentenceRange = v123;
            v24 = v54;
            v23 = v53;
            goto LABEL_24;
          }
        }
        v33 = 0;
        goto LABEL_49;
      }
      string = self->_string;
      orthographyArray = self->_orthographyArray;
      if (v17 == CFSTR("TokenType"))
      {
        v32 = CFSTR("Word");
      }
      else if (v17 == CFSTR("NameTypeOrLexicalClass") || v17 == CFSTR("LexicalClass") || v17 == CFSTR("NameType"))
      {
        if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 0x43)
        {
          v66 = v17 == CFSTR("NameTypeOrLexicalClass") || v17 == CFSTR("NameType");
          v67 = CFSTR("PersonalName");
LABEL_140:
          if (v66)
            v32 = v67;
          else
            v32 = CFSTR("Noun");
        }
        else
        {
          switch(*((_BYTE *)v39 + 3))
          {
            case 'D':
            case 'H':
              v66 = v17 == CFSTR("NameTypeOrLexicalClass") || v17 == CFSTR("NameType");
              v67 = CFSTR("PlaceName");
              goto LABEL_140;
            case 'E':
            case 'I':
              v66 = v17 == CFSTR("NameTypeOrLexicalClass") || v17 == CFSTR("NameType");
              v67 = CFSTR("OrganizationName");
              goto LABEL_140;
            case 'F':
            case 'G':
            case 'J':
              goto LABEL_132;
            case 'K':
              goto LABEL_133;
            default:
              if ((v50 - 30) < 2)
                goto LABEL_133;
LABEL_132:
              if ((v50 & 0xFE) == 0x20)
              {
LABEL_133:
                if (v17 == CFSTR("NameType"))
                  v32 = CFSTR("OtherWord");
                else
                  v32 = CFSTR("Noun");
              }
              else
              {
                v32 = CFSTR("OtherWord");
                switch(*((_BYTE *)v39 + 3))
                {
                  case 0x10:
                  case 0x12:
                  case 0x54:
                    v115 = CFSTR("Conjunction");
                    goto LABEL_246;
                  case 0x11:
                  case 0x1D:
                  case 0x53:
                    v115 = CFSTR("Number");
                    goto LABEL_246;
                  case 0x13:
                  case 0x14:
                  case 0x15:
                  case 0x16:
                  case 0x50:
                    v115 = CFSTR("Determiner");
                    goto LABEL_246;
                  case 0x17:
                  case 0x23:
                  case 0x24:
                  case 0x25:
                  case 0x26:
                  case 0x27:
                  case 0x41:
                  case 0x42:
                  case 0x4F:
                    v115 = CFSTR("Pronoun");
                    goto LABEL_246;
                  case 0x19:
                  case 0x52:
                    v115 = CFSTR("Preposition");
                    goto LABEL_246;
                  case 0x1A:
                  case 0x1B:
                  case 0x1C:
                  case 0x4D:
                    v115 = CFSTR("Adjective");
                    goto LABEL_246;
                  case 0x22:
                  case 0x2B:
                  case 0x2F:
                  case 0x30:
                  case 0x31:
                  case 0x51:
                    v115 = CFSTR("Particle");
                    goto LABEL_246;
                  case 0x28:
                  case 0x29:
                  case 0x2A:
                  case 0x2D:
                  case 0x2E:
                  case 0x4E:
                    v115 = CFSTR("Adverb");
                    goto LABEL_246;
                  case 0x32:
                  case 0x55:
                    v115 = CFSTR("Interjection");
                    goto LABEL_246;
                  case 0x34:
                  case 0x35:
                  case 0x36:
                  case 0x37:
                  case 0x38:
                  case 0x39:
                  case 0x3A:
                  case 0x3B:
                  case 0x3C:
                  case 0x3D:
                  case 0x3E:
                  case 0x3F:
                  case 0x40:
                  case 0x4C:
                    v115 = CFSTR("Verb");
                    goto LABEL_246;
                  case 0x56:
                    v115 = CFSTR("Classifier");
                    goto LABEL_246;
                  case 0x57:
                    v115 = CFSTR("Idiom");
LABEL_246:
                    if (v17 != CFSTR("NameType"))
                      v32 = v115;
                    break;
                  default:
                    goto LABEL_143;
                }
              }
              break;
          }
        }
      }
      else if (v17 == CFSTR("InternalClass"))
      {
        v121 = self->_orthographyArray;
        v68 = self->_string;
        v69 = v23;
        v70 = v24;
        v71 = (void *)internalTagForCategory_internalTagArray;
        if (!internalTagForCategory_internalTagArray)
        {
          v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("NONE"), CFSTR("OTHER"), CFSTR("."), CFSTR("?"), CFSTR("!"), CFSTR("“"), CFSTR("”"), CFSTR("("), CFSTR(")"), CFSTR("-"), CFSTR(","), CFSTR("--"), CFSTR(":"), CFSTR("SYM"), CFSTR("ABB"), CFSTR("ACK"), CFSTR("CC"),
                          CFSTR("CD"),
                          CFSTR("CS"),
                          CFSTR("DT"),
                          CFSTR("DTO"),
                          CFSTR("DTP"),
                          CFSTR("DTW"),
                          CFSTR("EX"),
                          CFSTR("FW"),
                          CFSTR("IN"),
                          CFSTR("JJ"),
                          CFSTR("JJR"),
                          CFSTR("JJS"),
                          CFSTR("LS"),
                          CFSTR("NN"),
                          CFSTR("NNS"),
                          CFSTR("NNP"),
                          CFSTR("NNPS"),
                          CFSTR("PRE"),
                          CFSTR("PRP"),
                          CFSTR("PRPD"),
                          CFSTR("PRPR"),
                          CFSTR("PRPS"),
                          CFSTR("PRPT"),
                          CFSTR("RB"),
                          CFSTR("RBC"),
                          CFSTR("RBN"),
                          CFSTR("RBP"),
                          CFSTR("RBR"),
                          CFSTR("RBS"),
                          CFSTR("RBW"),
                          CFSTR("RP"),
                          CFSTR("RPP"),
                          CFSTR("TO"),
                          CFSTR("UH"),
                          CFSTR("URL"),
                          CFSTR("VB"),
                          CFSTR("VBC"),
                          CFSTR("VBD"),
                          CFSTR("VBF"),
                          CFSTR("VBG"),
                          CFSTR("VBI"),
                          CFSTR("VBM"),
                          CFSTR("VBN"),
                          CFSTR("VBP"));
          internalTagForCategory_internalTagArray = (uint64_t)v71;
        }
        if (objc_msgSend(v71, "count") <= v50)
          v32 = CFSTR("NONE");
        else
          v32 = (const __CFString *)objc_msgSend((id)internalTagForCategory_internalTagArray, "objectAtIndex:", v50);
        v24 = v70;
        v23 = v69;
        string = v68;
        orthographyArray = v121;
      }
      else
      {
        v32 = 0;
      }
LABEL_143:
      if (v17 != CFSTR("PossibleClasses")
        && v17 != CFSTR("Script")
        && v17 != CFSTR("Lemma")
        && v17 != CFSTR("Language")
        && v17 != CFSTR("NameTypeOrLexicalClass")
        && v17 != CFSTR("LexicalClass")
        && v17 != CFSTR("NameType"))
      {
        p_location = &v126->location;
LABEL_197:
        v104 = 0;
        v33 = 0;
        sentenceRange = v123;
LABEL_198:
        if (v124)
        {
          v105 = v23;
          if (v104)
            v106 = v104;
          else
            v106 = MEMORY[0x1E0C9AA60];
          v107 = v24;
          v108 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v106);
          v24 = v107;
          *v124 = (NSArray *)v108;
          v23 = v105;
        }
        goto LABEL_24;
      }
      v120 = v23;
      v122 = v24;
      v72 = orthographyArray;
      v73 = objc_msgSend(orthographyArray, "count");
      v74 = malloc_type_malloc(2 * *((unsigned __int8 *)v39 + 2), 0x1000040BDFB0063uLL);
      v118 = string;
      if (v74)
      {
        v75 = v74;
        -[NSString getCharacters:range:](string, "getCharacters:range:", v74, v21 + *v39, *((unsigned __int8 *)v39 + 2));
        v76 = NSOrthographyScriptIndexForCharacters((uint64_t)v75, *((unsigned __int8 *)v39 + 2), 0);
        free(v75);
      }
      else
      {
        v76 = 0;
      }
      if (v21 + (unint64_t)*v39 >= v73)
      {
        v78 = 0;
      }
      else
      {
        v77 = objc_msgSend(v72, "objectAtIndex:effectiveRange:");
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v78 = (void *)v77;
        else
          v78 = 0;
      }
      if (v76 == 2)
      {
        v79 = (void *)objc_msgSend(v78, "allScripts");
        v80 = CFSTR("Jpan");
        if ((objc_msgSend(v79, "containsObject:", CFSTR("Jpan")) & 1) == 0)
        {
          v80 = CFSTR("Kore");
          if ((objc_msgSend(v79, "containsObject:", CFSTR("Kore")) & 1) == 0)
          {
            v80 = CFSTR("Hans");
            if ((objc_msgSend(v79, "containsObject:", CFSTR("Hans")) & 1) == 0)
            {
              if (objc_msgSend(v79, "containsObject:", CFSTR("Hant")))
                v80 = CFSTR("Hant");
              else
                v80 = CFSTR("Hani");
            }
          }
        }
      }
      else
      {
        if (v76 < 2)
          goto LABEL_195;
        v81 = v76 - 32 >= 0xFFFFFFFFFFFFFFE1 ? ((_DWORD)v76 << 27) | 0x84202 : 0;
        v80 = NSOrthographyDominantScriptForFlags(v81);
        if (!v80)
          goto LABEL_195;
      }
      if (v17 == CFSTR("Lemma"))
      {
        v97 = (__CFString *)objc_msgSend(v78, "dominantLanguageForScript:", v80);
        v98 = -[__CFString isEqual:](v97, "isEqual:", CFSTR("ja"));
        v99 = v21 + *v39;
        if (v98)
        {
          v100 = -[NSString substringWithRange:](v118, "substringWithRange:", v99 + *((unsigned __int8 *)v39 + 8), *((unsigned __int8 *)v39 + 9));
        }
        else
        {
          v102 = *((unsigned __int8 *)v39 + 2);
          LXLemmatizer = getLXLemmatizer(v97);
          v100 = lemmatizerLemmaForStringWithCategory((uint64_t)LXLemmatizer, -[NSString substringWithRange:](v118, "substringWithRange:", v99, v102), *((unsigned __int8 *)v39 + 3));
        }
      }
      else
      {
        if (v17 == CFSTR("Language"))
        {
          v101 = objc_msgSend(v78, "dominantLanguageForScript:", v80);
          if (v101)
            v32 = (const __CFString *)v101;
          else
            v32 = CFSTR("und");
          goto LABEL_195;
        }
        p_location = &v126->location;
        if (v17 == CFSTR("Script"))
        {
          v32 = v80;
          goto LABEL_196;
        }
        if (v17 != CFSTR("PossibleClasses")
          && v17 != CFSTR("NameTypeOrLexicalClass")
          && v17 != CFSTR("LexicalClass")
          && v17 != CFSTR("NameType"))
        {
          goto LABEL_196;
        }
        v82 = *v39;
        v83 = *((unsigned __int8 *)v39 + 2);
        v84 = getLXLemmatizer((__CFString *)objc_msgSend(v78, "dominantLanguageForScript:", v80));
        if (!v84)
        {
          p_location = &v126->location;
          v24 = v122;
          v23 = v120;
          if (v17 != CFSTR("PossibleClasses"))
            goto LABEL_197;
          v109 = *((unsigned __int8 *)v39 + 3);
          if ((v109 & 0xFFFFFFFFFFFFFFFBLL) == 0x43
            || (v109 - 30) <= 0x2D && ((1 << (v109 - 30)) & 0x2CC000000003) != 0)
          {
            v32 = CFSTR("Noun");
            goto LABEL_197;
          }
          if ((v109 & 0xFE) == 0x20)
          {
            v32 = CFSTR("Noun");
          }
          else
          {
            v116 = v109 - 16;
            if (v116 > 0x47u)
              v32 = CFSTR("OtherWord");
            else
              v32 = off_1E0F52200[(char)v116];
          }
          goto LABEL_195;
        }
        v85 = (uint64_t)v84;
        v86 = v21 + v82;
        v87 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        lemmatizerAddTagsForString(v85, -[NSString substringWithRange:](v118, "substringWithRange:", v86, v83), (uint64_t)v87);
        v88 = (void *)objc_msgSend(v87, "keysSortedByValueUsingComparator:", &__block_literal_global_455);
        v89 = v88;
        if (v17 != CFSTR("PossibleClasses"))
        {
          v119 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v88);
          v90 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v136, 16);
          if (v91)
          {
            v92 = v91;
            v93 = 0;
            v94 = *(_QWORD *)v138;
            do
            {
              for (i = 0; i != v92; ++i)
              {
                if (*(_QWORD *)v138 != v94)
                  objc_enumerationMutation(v89);
                v93 += objc_msgSend((id)objc_msgSend(v87, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * i)), "integerValue");
              }
              v92 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v136, 16);
            }
            while (v92);
            v96 = (float)v93;
          }
          else
          {
            v96 = 0.0;
          }
          v134 = 0u;
          v135 = 0u;
          v132 = 0u;
          v133 = 0u;
          v110 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v132, v131, 16);
          if (v110)
          {
            v111 = v110;
            v112 = *(_QWORD *)v133;
            do
            {
              for (j = 0; j != v111; ++j)
              {
                if (*(_QWORD *)v133 != v112)
                  objc_enumerationMutation(v89);
                *(float *)&v114 = (float)objc_msgSend((id)objc_msgSend(v87, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * j)), "integerValue")/ v96;
                objc_msgSend(v90, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v114));
              }
              v111 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v132, v131, 16);
            }
            while (v111);
          }
          v104 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v90);
          if (v119)
            v33 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
          else
            v33 = 0;
          sentenceRange = v123;
          p_location = &v126->location;
          v24 = v122;
          v23 = v120;
          goto LABEL_198;
        }
        v100 = (NSString *)objc_msgSend(v88, "componentsJoinedByString:", CFSTR("/"));
      }
      v32 = (const __CFString *)v100;
LABEL_195:
      p_location = &v126->location;
LABEL_196:
      v24 = v122;
      v23 = v120;
      goto LABEL_197;
    }
    v44 = v22;
    if (v40 < v20)
      v44 = v39[8];
    v45 = v26 + v41;
    v46 = v44 >= v45;
    v47 = v44 - v45;
    if (v47 == 0 || !v46)
      goto LABEL_45;
    if (v42 <= charIndex && v47 + v42 > charIndex)
      break;
    v26 = v47;
    v34 = v42;
LABEL_45:
    v39 += 8;
    ++v40;
    if (!--v38)
    {
      v33 = 0;
      sentenceRange = v123;
      goto LABEL_48;
    }
  }
  if (v17 == CFSTR("NameType")
    || v17 == CFSTR("LexicalClass")
    || v17 == CFSTR("NameTypeOrLexicalClass")
    || v17 == CFSTR("PossibleClasses")
    || v17 == CFSTR("InternalClass"))
  {
    v60 = CFSTR("Whitespace");
  }
  else
  {
    v60 = 0;
  }
  if (v17 == CFSTR("TokenType"))
    v32 = CFSTR("Whitespace");
  else
    v32 = v60;
  v33 = 0;
  v26 = v47;
  v34 = v42;
  sentenceRange = v123;
LABEL_23:
  p_location = &v126->location;
LABEL_24:
  if (v32 && !v33)
  {
    v36 = v23;
    v37 = v24;
    v33 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v32);
    if (v124)
      *v124 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v125);
    v24 = v37;
    v23 = v36;
  }
LABEL_49:
  if (p_location)
  {
    *p_location = v34;
    p_location[1] = v26;
  }
  if (sentenceRange)
  {
    sentenceRange->location = v23;
    sentenceRange->length = v24;
  }
  return v33;
}

- (NSArray)tagsInRange:(NSRange)range scheme:(NSString *)tagScheme options:(NSLinguisticTaggerOptions)opts tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  NSArray *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;

  length = range.length;
  location = range.location;
  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__22;
  v26 = __Block_byref_object_dispose__22;
  v27 = 0;
  v27 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__22;
  v20 = __Block_byref_object_dispose__22;
  v21 = 0;
  if (tokenRanges)
    v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  else
    v12 = 0;
  v21 = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__NSLinguisticTagger_tagsInRange_scheme_options_tokenRanges___block_invoke;
  v15[3] = &unk_1E0F52000;
  v15[4] = &v22;
  v15[5] = &v16;
  -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:](self, "enumerateTagsInRange:scheme:options:usingBlock:", location, length, tagScheme, opts, v15);
  if (tokenRanges)
    *tokenRanges = (NSArray *)v17[5];
  v13 = (NSArray *)v23[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __61__NSLinguisticTagger_tagsInRange_scheme_options_tokenRanges___block_invoke(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  const __CFString *v7;
  uint64_t result;
  void *v9;

  if (a2)
    v7 = a2;
  else
    v7 = &stru_1E0F56070;
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v9)
    return objc_msgSend(v9, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4));
  return result;
}

- (void)enumerateTagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  void *reserved;
  void *v18;
  _QWORD v19[8];

  length = range.length;
  location = range.location;
  v19[7] = *MEMORY[0x1E0C80C00];
  if (range.location + range.length > -[NSString length](self->_string, "length"))
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v18);
  }
  v15 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", scheme);
  if (v15)
  {
    v16 = v15;
    reserved = self->_reserved;
    if (reserved)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __74__NSLinguisticTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke;
      v19[3] = &unk_1E0F52028;
      v19[4] = self;
      v19[5] = v16;
      v19[6] = block;
      off_1ECD0A540(reserved, unit, location, length, options, v19);
    }
  }
}

void __74__NSLinguisticTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x186DA8F78]();
  v3 = (void *)off_1ECD0A548(*(_QWORD *)(a1[4] + 48), a1[5]);
  tagForNLTag(v3);
  (*(void (**)(void))(a1[6] + 16))();
  if (v3)
    CFRelease(v3);
  objc_autoreleasePoolPop(v2);
}

- (NSLinguisticTag)tagAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme tokenRange:(NSRangePointer)tokenRange
{
  id v12;
  id v13;
  void *reserved;
  void *v15;
  NSString *v16;
  void *v18;
  NSRange v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v18);
  }
  v12 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", scheme);
  if (!v12)
    return 0;
  v13 = v12;
  reserved = self->_reserved;
  if (!reserved)
    return 0;
  v15 = (void *)off_1ECD0A528(reserved, unit, charIndex, v13);
  v16 = (NSString *)tagForNLTag(v15);
  if (v15)
    CFRelease(v15);
  if (tokenRange)
  {
    v19 = (NSRange)0;
    v20 = 0;
    off_1ECD0A538(&v19, self->_reserved, 0, charIndex);
    *tokenRange = v19;
  }
  return v16;
}

- (NSArray)tagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length;
  NSUInteger location;
  NSArray *v14;
  NSArray *v15;
  _QWORD v17[7];

  length = range.length;
  location = range.location;
  v17[6] = *MEMORY[0x1E0C80C00];
  v14 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (tokenRanges)
    v15 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  else
    v15 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__NSLinguisticTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke;
  v17[3] = &unk_1E0F52050;
  v17[4] = v14;
  v17[5] = v15;
  -[NSLinguisticTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](self, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, unit, scheme, options, v17);
  if (tokenRanges)
    *tokenRanges = v15;
  return v14;
}

uint64_t __66__NSLinguisticTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  const __CFString *v7;
  uint64_t result;
  void *v9;

  if (a2)
    v7 = a2;
  else
    v7 = &stru_1E0F56070;
  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  v9 = *(void **)(a1 + 40);
  if (v9)
    return objc_msgSend(v9, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4));
  return result;
}

- (NSRange)tokenRangeAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit
{
  void *reserved;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  NSRange result;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v11);
  }
  reserved = self->_reserved;
  if (reserved)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    off_1ECD0A538(&v12, reserved, unit, charIndex);
    v9 = v12;
    v10 = v13;
  }
  else
  {
    v10 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (NSString)dominantLanguage
{
  void *reserved;
  void *v4;
  NSString *v5;

  if (!-[NSString length](self->_string, "length"))
    return 0;
  reserved = self->_reserved;
  if (!reserved)
    return 0;
  v4 = (void *)off_1ECD0A528(reserved, 3, 0, CFSTR("Language"));
  v5 = (NSString *)tagForNLTag(v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

+ (NSLinguisticTag)tagForString:(NSString *)string atIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme orthography:(NSOrthography *)orthography tokenRange:(NSRangePointer)tokenRange
{
  NSLinguisticTagger *v14;
  NSLinguisticTagger *v15;
  NSString *v16;

  v14 = [NSLinguisticTagger alloc];
  v15 = -[NSLinguisticTagger initWithTagSchemes:options:](v14, "initWithTagSchemes:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", scheme), 0x80000000);
  -[NSLinguisticTagger setString:](v15, "setString:", string);
  if (orthography)
    -[NSLinguisticTagger setOrthography:range:](v15, "setOrthography:range:", orthography, 0, -[NSString length](string, "length"));
  v16 = -[NSLinguisticTagger tagAtIndex:unit:scheme:tokenRange:](v15, "tagAtIndex:unit:scheme:tokenRange:", charIndex, unit, scheme, tokenRange);

  return v16;
}

+ (NSArray)tagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length;
  NSUInteger location;
  NSLinguisticTagger *v15;
  NSLinguisticTagger *v16;
  NSArray *v17;

  length = range.length;
  location = range.location;
  v15 = [NSLinguisticTagger alloc];
  v16 = -[NSLinguisticTagger initWithTagSchemes:options:](v15, "initWithTagSchemes:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", scheme), 0x80000000);
  -[NSLinguisticTagger setString:](v16, "setString:", string);
  if (orthography)
    -[NSLinguisticTagger setOrthography:range:](v16, "setOrthography:range:", orthography, 0, -[NSString length](string, "length"));
  v17 = -[NSLinguisticTagger tagsInRange:unit:scheme:options:tokenRanges:](v16, "tagsInRange:unit:scheme:options:tokenRanges:", location, length, unit, scheme, options, tokenRanges);

  return v17;
}

+ (void)enumerateTagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  NSLinguisticTagger *v15;
  NSLinguisticTagger *v16;

  length = range.length;
  location = range.location;
  v15 = [NSLinguisticTagger alloc];
  v16 = -[NSLinguisticTagger initWithTagSchemes:options:](v15, "initWithTagSchemes:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", scheme), 0x80000000);
  -[NSLinguisticTagger setString:](v16, "setString:", string);
  if (orthography)
    -[NSLinguisticTagger setOrthography:range:](v16, "setOrthography:range:", orthography, 0, -[NSString length](string, "length"));
  -[NSLinguisticTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](v16, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, unit, scheme, options, block);

}

+ (NSString)dominantLanguageForString:(NSString *)string
{
  NSLinguisticTagger *v4;
  NSLinguisticTagger *v5;
  NSString *v6;

  v4 = [NSLinguisticTagger alloc];
  v5 = -[NSLinguisticTagger initWithTagSchemes:options:](v4, "initWithTagSchemes:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("Language")), 0x80000000);
  -[NSLinguisticTagger setString:](v5, "setString:", string);
  v6 = -[NSLinguisticTagger dominantLanguage](v5, "dominantLanguage");

  return v6;
}

- (BOOL)_acceptSentenceTerminatorRange:(_NSRange)a3 paragraphRange:(_NSRange)a4 tokens:(_NSLTToken *)a5 count:(unint64_t)a6 tokenIndex:(unint64_t)a7
{
  NSUInteger location;
  _NSLTToken *v11;
  int var1;
  NSString *v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  _NSLTToken *v17;
  int var2;
  uint64_t var0;
  uint64_t v20;
  unint64_t v21;
  unsigned __int8 *p_var2;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v28;

  location = a4.location;
  if (-[NSString characterAtIndex:](self->_string, "characterAtIndex:", a3.location, a3.length, a4.location, a4.length) == 46)
  {
    if (!a7)
      goto LABEL_14;
    v11 = &a5[a7 - 1];
    if (v11->var2 - 14 > 0x4A)
      goto LABEL_14;
    var1 = v11->var1;
    if (var1 + v11->var0 != a5[a7].var0)
      goto LABEL_14;
    if (var1 == 1)
      return 0;
    if (!qword_1ECD0A550)
      qword_1ECD0A550 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("mr"), CFSTR("mrs"), CFSTR("ms"), CFSTR("messrs"), CFSTR("mme"), CFSTR("mmes"), CFSTR("mlle"), CFSTR("sr"), CFSTR("sra"), CFSTR("srta"), CFSTR("dr"), CFSTR("drs"), CFSTR("pres"), CFSTR("sen"), CFSTR("atty"), CFSTR("supt"), CFSTR("amb"),
                          CFSTR("lcdo"),
                          CFSTR("ldo"),
                          CFSTR("st"),
                          CFSTR("msgr"),
                          CFSTR("fr"),
                          CFSTR("rdo"),
                          CFSTR("adm"),
                          CFSTR("col"),
                          CFSTR("maj"),
                          CFSTR("cmdr"),
                          CFSTR("cdr"),
                          CFSTR("capt"),
                          CFSTR("lieut"),
                          CFSTR("lt"),
                          CFSTR("sgt"),
                          CFSTR("cpl"),
                          CFSTR("pvt"),
                          CFSTR("jan"),
                          CFSTR("feb"),
                          CFSTR("febr"),
                          CFSTR("apr"),
                          CFSTR("jun"),
                          CFSTR("jul"),
                          CFSTR("aug"),
                          CFSTR("sep"),
                          CFSTR("oct"),
                          CFSTR("nov"),
                          CFSTR("dec"),
                          CFSTR("ph"),
                          CFSTR("eg"),
                          CFSTR("ie"),
                          CFSTR("viz"),
                          CFSTR("vs"),
                          0);
    if (!qword_1ECD0A558)
      qword_1ECD0A558 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("M"), CFSTR("Hon"), CFSTR("Rep"), CFSTR("Gov"), CFSTR("Sec"), CFSTR("Prof"), CFSTR("Ing"), CFSTR("Rev"), CFSTR("Gen"), CFSTR("Ens"), CFSTR("Spec"), CFSTR("Mar"), CFSTR("Sept"), 0);
    if (v11->var1)
    {
      v13 = -[NSString substringWithRange:](self->_string, "substringWithRange:", location + v11->var0);
      v14 = -[NSString lowercaseString](v13, "lowercaseString");
      if ((objc_msgSend((id)qword_1ECD0A558, "containsObject:", v13) & 1) != 0
        || (objc_msgSend((id)qword_1ECD0A550, "containsObject:", v14) & 1) != 0)
      {
        return 0;
      }
      v15 = objc_msgSend(CFSTR("no"), "isEqualToString:", v14) ^ 1;
    }
    else
    {
LABEL_14:
      v15 = 1;
    }
    v16 = a7 + 1;
    if (a7 + 1 < a6)
    {
      v17 = &a5[v16];
      var2 = v17->var2;
      if ((var2 - 14) > 0x4A)
      {
        if ((var2 - 2) <= 0xB)
        {
          var0 = v17->var0;
          if (a5[a7].var1 + a5[a7].var0 == (_DWORD)var0)
          {
            -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4D8, 8, location + var0, a5[v16].var1);
            if (!v20 || -[NSString characterAtIndex:](self->_string, "characterAtIndex:", location + v17->var0) == 45)
              return 0;
          }
        }
      }
      else if (a5[a7].var1 + a5[a7].var0 == v17->var0)
      {
        return 0;
      }
      v21 = a7 + 2;
      p_var2 = &a5[a7 + 1].var2;
      v23 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (*p_var2 - 14 > 0x4A)
        {
          v24 = 0;
        }
        else
        {
          v23 = location + *(unsigned __int16 *)(p_var2 - 3);
          v24 = *(p_var2 - 1);
          if (*(p_var2 - 1))
            break;
        }
        p_var2 += 16;
      }
      while (v21++ < a6);
      if (v24)
      {
        -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", +[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"), 8, v23, v24);
        if (v26)
          return 0;
        if ((v15 & 1) == 0)
        {
          -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4E8, 8, v23, v24);
          if (v28)
            return 0;
        }
      }
    }
  }
  return 1;
}

- (void)_acceptSentencesForParagraphRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;

  if ((unint64_t)qword_1ECD0A560 >= 2)
  {
    length = a3.length;
    location = a3.location;
    v6 = 0;
    v7 = 24;
    do
    {
      if (*(_BYTE *)(qword_1ECD0A568 + v7 - 21) != 2
        || -[NSLinguisticTagger _acceptSentenceTerminatorRange:paragraphRange:tokens:count:tokenIndex:](self, "_acceptSentenceTerminatorRange:paragraphRange:tokens:count:tokenIndex:", location + *(unsigned __int16 *)(qword_1ECD0A568 + v7 - 24), *(unsigned __int8 *)(qword_1ECD0A568 + v7 - 22), location, length, v6))
      {
        goto LABEL_16;
      }
      v8 = qword_1ECD0A568;
      v9 = *(unsigned __int8 *)(qword_1ECD0A568 + v7 - 22);
      if (v6 && v9 == 1)
      {
        if (*(unsigned __int8 *)(qword_1ECD0A568 + v7 - 37) - 14 <= 0x4A
          && *(unsigned __int8 *)(qword_1ECD0A568 + v7 - 38) + *(unsigned __int16 *)(qword_1ECD0A568 + v7 - 40) == *(unsigned __int16 *)(qword_1ECD0A568 + v7 - 24))
        {
          v10 = v6 - 1;
          goto LABEL_14;
        }
      }
      else if (v9 != 1)
      {
        goto LABEL_15;
      }
      v11 = *(unsigned __int8 *)(qword_1ECD0A568 + v7 - 5);
      if ((v11 - 14) > 0x4A
        || *(unsigned __int16 *)(qword_1ECD0A568 + v7 - 24) + 1 != *(unsigned __int16 *)(qword_1ECD0A568 + v7 - 8))
      {
LABEL_15:
        *(_BYTE *)(qword_1ECD0A568 + v7 - 21) = 13;
        goto LABEL_16;
      }
      v12 = qword_1ECD0A568 + v7;
      *(_BYTE *)(v12 - 21) = v11;
      *(_QWORD *)(v12 - 16) = *(_QWORD *)(v8 + v7);
      v10 = v6;
LABEL_14:
      joinTokensInRange(v8, v10, 2uLL);
LABEL_16:
      v13 = v6 + 2;
      ++v6;
      v7 += 16;
    }
    while (v13 < qword_1ECD0A560);
  }
}

- (void)_calculateSentenceRangesForParagraphRange:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  _WORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3.location + a3.length;
  if (a3.location < a3.location + a3.length)
  {
    length = a3.length;
    location = a3.location;
    v6 = 0;
    v8 = qword_1ECD0A560;
    v7 = qword_1ECD0A568;
    v9 = qword_1ECD0A570;
    v10 = a3.location;
    do
    {
      v14 = 0;
      v15 = 0;
      v11 = sentenceRangeAtIndexInTokens(v10, location, length, v7, v8, &v14);
      if (v6 < 0x100)
      {
        v13 = (_WORD *)(v9 + 8 * v6);
        *v13 = v11 - location;
        v13[1] = v12;
        v13[2] = v14;
        v13[3] = v15;
        ++v6;
      }
      v10 = v11 + v12;
    }
    while (v10 < v3);
  }
}

- (void)_analyzePunctuationTokensInRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger location;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  char v28;
  uint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  NSUInteger i;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  NSString *string;
  NSUInteger v44;
  int v45;
  unsigned int v46;
  const char *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  char v52;
  int v53;
  uint64_t v54;
  BOOL v55;
  char v56;
  int v57;
  int v58;
  char v59;
  NSString *v60;
  unint64_t v61;
  int v62;
  NSUInteger length;

  length = a4.length;
  if (a3.length)
  {
    location = a4.location;
    v5 = a3.length;
    v6 = a3.location;
    do
    {
      v8 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4A8, 0, v6, v5);
      v9 = v8;
      v10 = v6 + v5;
      if (v11)
        v12 = v8 >= v10;
      else
        v12 = 1;
      v13 = v12;
      if (v13)
        v14 = v6 + v5;
      else
        v14 = v8;
      if (v14 > v6 && (unint64_t)qword_1ECD0A560 <= 0xFFF)
      {
        v15 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
        *(_WORD *)v15 = v6 - location;
        *(_BYTE *)(v15 + 2) = v14 - v6;
        *(_BYTE *)(v15 + 3) = 88;
        *(_DWORD *)(v15 + 4) = 0;
        *(_QWORD *)(v15 + 8) = 0;
        ++qword_1ECD0A560;
      }
      if ((v13 & 1) != 0)
        return;
      v16 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4B0, 0, v14, v10 - v14);
      if (v16 >= v10 || v17 == 0)
        v6 = v10;
      else
        v6 = v16;
      if (v6 > v9)
      {
        v19 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4C0, 0, v14, v6 - v9);
        if (v20)
        {
          v21 = v19;
          v22 = v20;
          if (v19 > v9)
            -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:](self, "_analyzePunctuationTokensInRange:paragraphRange:", v14, v19 - v9, location, length);
          if (v6 > v21 + v22)
          {
            v23 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4C8, 0, v21 + v22, v6 - (v21 + v22));
            v24 = v23;
            if (v25)
              v26 = v6 > v23;
            else
              v26 = 0;
            v27 = v26;
            if ((unint64_t)qword_1ECD0A560 <= 0xFFF)
            {
              if (v27)
                v28 = v23;
              else
                v28 = v6;
              v29 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
              *(_WORD *)v29 = v21 - location;
              *(_BYTE *)(v29 + 2) = v28 - v21;
              *(_BYTE *)(v29 + 3) = 2;
              *(_DWORD *)(v29 + 4) = 0;
              *(_QWORD *)(v29 + 8) = 0;
              ++qword_1ECD0A560;
            }
            if (!v27)
              goto LABEL_101;
            v30 = v6 - v23;
            goto LABEL_100;
          }
          if ((unint64_t)qword_1ECD0A560 <= 0xFFF)
          {
            v39 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
            *(_WORD *)v39 = v21 - location;
            *(_BYTE *)(v39 + 2) = v22;
            v40 = 2;
LABEL_53:
            *(_BYTE *)(v39 + 3) = v40;
            *(_DWORD *)(v39 + 4) = 0;
            *(_QWORD *)(v39 + 8) = 0;
            ++qword_1ECD0A560;
          }
        }
        else
        {
          v31 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4D8, 0, v14, v6 - v9);
          if (v32)
          {
            v33 = v31;
            v34 = v32;
            v35 = -[NSString characterAtIndex:](self->_string, "characterAtIndex:", v31);
            v36 = v35;
            if (v33 > v9 && (unint64_t)qword_1ECD0A560 <= 0xFFF)
            {
              v37 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
              *(_WORD *)v37 = v9 - location;
              *(_BYTE *)(v37 + 2) = v33 - v9;
              *(_BYTE *)(v37 + 3) = 13;
              *(_DWORD *)(v37 + 4) = 0;
              *(_QWORD *)(v37 + 8) = 0;
              ++qword_1ECD0A560;
            }
            if ((_DWORD)v35 == 45)
            {
              for (i = v34 + v33;
                    i < v6 && -[NSString characterAtIndex:](self->_string, "characterAtIndex:", v33 + v34) == 45;
                    i = v33 + v34)
              {
                ++v34;
              }
              if (v34)
                v41 = 11;
              else
                v41 = 9;
              goto LABEL_97;
            }
            if (v35 >> 1 == 4104)
            {
              v41 = 9;
              goto LABEL_97;
            }
            if ((v35 - 8210) < 4)
            {
              v41 = 11;
              goto LABEL_97;
            }
            if ((_DWORD)v35 == 41)
            {
              v41 = 8;
              goto LABEL_97;
            }
            if ((_DWORD)v35 == 40)
            {
              v41 = 7;
              goto LABEL_97;
            }
            if (objc_msgSend((id)qword_1ECD0A4E0, "characterIsMember:", v35))
            {
              v42 = 0;
              string = self->_string;
              while (1)
              {
                if (openingStrengthForQuoteCharacter_singleQuotes[v42] == v36)
                {
                  v45 = 0;
                  v47 = "\x02\x03\x01\x04\x01\x03\x01\x04";
                  goto LABEL_73;
                }
                if (openingStrengthForQuoteCharacter_doubleQuotes[v42] == v36)
                  break;
                if (++v42 == 9)
                {
                  v44 = -[NSString length](self->_string, "length");
                  v45 = 0;
                  v46 = 2;
                  goto LABEL_76;
                }
              }
              v45 = 1;
              v47 = "\x02\x03\x01\x03\x01\x04\x01\x04";
LABEL_73:
              v46 = v47[v42];
              v44 = -[NSString length](self->_string, "length");
              if (v46 > 3)
              {
LABEL_74:
                v41 = 5;
                goto LABEL_97;
              }
              if (!v46)
              {
                v41 = 6;
                goto LABEL_97;
              }
LABEL_76:
              v60 = string;
              v61 = v44;
              v62 = v45;
              if (v33)
              {
                v48 = -[NSString characterAtIndex:](string, "characterAtIndex:", v33 - 1);
                if ((_DWORD)v48)
                {
                  v59 = objc_msgSend((id)qword_1ECD0A490, "characterIsMember:", v48);
                  goto LABEL_81;
                }
              }
              else
              {
                v48 = 0;
              }
              v59 = 1;
LABEL_81:
              v58 = objc_msgSend((id)qword_1ECD0A500, "characterIsMember:", v48);
              v49 = objc_msgSend((id)qword_1ECD0A4F8, "characterIsMember:", v48);
              if (v33 + 1 >= v61)
                v50 = 0;
              else
                v50 = -[NSString characterAtIndex:](v60, "characterAtIndex:");
              v51 = objc_msgSend((id)qword_1ECD0A4F8, "characterIsMember:", v50);
              if (v62)
              {
                if (v46 != 2)
                {
                  if ((v51 & (v49 ^ 1)) != 0)
                    v41 = 5;
                  else
                    v41 = 6;
                  if ((v49 & (v51 ^ 1)) != 0)
                    v52 = 6;
                  else
                    v52 = 5;
                  if (v46 == 3)
                    v41 = v52;
                  goto LABEL_97;
                }
                if ((v59 & 1) != 0)
                  goto LABEL_74;
                v55 = (_DWORD)v48 == 39;
LABEL_118:
                v57 = v58;
                if (v55)
                  v57 = 1;
                if (v57)
                  v41 = 5;
                else
                  v41 = 6;
                goto LABEL_97;
              }
              v53 = v51 ^ 1;
              if (((v49 ^ 1) & 1) != 0 || v53)
              {
                if (v46 == 2)
                {
                  if ((v59 & 1) != 0)
                    goto LABEL_74;
                  v55 = (_DWORD)v48 == 34;
                  goto LABEL_118;
                }
                if ((v51 & (v49 ^ 1)) != 0)
                  v56 = 5;
                else
                  v56 = 6;
                if ((v49 & v53) != 0)
                  v41 = 6;
                else
                  v41 = 5;
                if (v46 != 3)
                  v41 = v56;
LABEL_97:
                if ((unint64_t)qword_1ECD0A560 <= 0xFFF)
                {
                  v54 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
                  *(_WORD *)v54 = v33 - location;
                  *(_BYTE *)(v54 + 2) = v34;
                  *(_BYTE *)(v54 + 3) = v41;
                  *(_DWORD *)(v54 + 4) = 0;
                  *(_QWORD *)(v54 + 8) = 0;
                  ++qword_1ECD0A560;
                }
                v24 = v34 + v33;
                v30 = v6 - (v34 + v33);
                if (v6 <= v34 + v33)
                  goto LABEL_101;
LABEL_100:
                -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:](self, "_analyzePunctuationTokensInRange:paragraphRange:", v24, v30, location, length);
                goto LABEL_101;
              }
            }
            v41 = 13;
            goto LABEL_97;
          }
          if ((unint64_t)qword_1ECD0A560 <= 0xFFF)
          {
            v39 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
            *(_WORD *)v39 = v9 - location;
            *(_BYTE *)(v39 + 2) = v6 - v9;
            v40 = 13;
            goto LABEL_53;
          }
        }
      }
LABEL_101:
      v5 = v10 - v6;
    }
    while (v10 != v6);
  }
}

- (void)_analyzeTokensInInterwordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;

  if (a3.length)
  {
    length = a4.length;
    location = a4.location;
    v6 = a3.length;
    v7 = a3.location;
    do
    {
      v9 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A490, 0, v7, v6);
      v10 = v9;
      v11 = v7 + v6;
      if (v12)
        v13 = v11 > v9;
      else
        v13 = 0;
      v14 = !v13;
      if (v14)
        v15 = v11;
      else
        v15 = v9;
      if (v15 > v7)
        -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:](self, "_analyzePunctuationTokensInRange:paragraphRange:", v7, v15 - v7, location, length);
      if ((v14 & 1) != 0)
        break;
      v16 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A498, 0, v10, v11 - v10);
      v18 = v16 >= v11 || v17 == 0;
      v7 = v18 ? v11 : v16;
      v6 = v11 - v7;
    }
    while (v6);
  }
}

- (void)_analyzeTokensInWordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  char v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  v9 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4D0, 4, a3.location, a3.length);
  if (v10)
    v11 = v9 > v7;
  else
    v11 = 0;
  if (!v11)
  {
    if (!v10)
    {
LABEL_27:
      if ((unint64_t)qword_1ECD0A560 <= 0xFFF)
      {
        v25 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
        *(_WORD *)v25 = v7 - location;
        *(_BYTE *)(v25 + 2) = v6;
        *(_BYTE *)(v25 + 3) = 88;
        *(_DWORD *)(v25 + 4) = 0;
        *(_QWORD *)(v25 + 8) = 0;
        ++qword_1ECD0A560;
      }
      return;
    }
    goto LABEL_19;
  }
  v12 = v7 + v6;
  v13 = v7 + v6 - (v9 + v10);
  if (v7 + v6 > v9 + v10)
  {
    if (v13 == 2)
    {
      -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("ve"), 13, v7, v6);
      if (v37
        || (-[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("ll"), 13, v7, v6), v38)|| (-[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("re"), 13, v7, v6), v39))
      {
        v17 = -3;
        goto LABEL_47;
      }
    }
    else if (v13 == 1)
    {
      -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("s"), 13, v7, v6);
      if (v14
        || (-[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("d"), 13, v7, v6), v15)|| (-[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("m"), 13, v7, v6), v16))
      {
        -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("t"), 13, v7, v6);
        v17 = -2;
        if (!v18)
          goto LABEL_47;
        v19 = 0;
        goto LABEL_15;
      }
      -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("t"), 13, v7, v6);
      if (v45)
      {
        v19 = 1;
        v17 = 0x8000000000000001;
LABEL_15:
        -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("n"), 13, v7, v6 - 2);
        if (v20)
          v17 = -3;
        if (v19 && !v20)
          goto LABEL_19;
LABEL_47:
        v40 = v17 + v6;
        -[NSLinguisticTagger _analyzeTokensInWordRange:paragraphRange:](self, "_analyzeTokensInWordRange:paragraphRange:", v7, v40, location, length);
        if ((unint64_t)qword_1ECD0A560 <= 0xFFF)
        {
          v41 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
          *(_WORD *)v41 = v40 + v7 - location;
          *(_BYTE *)(v41 + 2) = v12 - (v40 + v7);
          *(_BYTE *)(v41 + 3) = 88;
          *(_DWORD *)(v41 + 4) = 0;
          *(_QWORD *)(v41 + 8) = 0;
          ++qword_1ECD0A560;
        }
        return;
      }
    }
  }
LABEL_19:
  v21 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4D0, 0, v7, v6);
  if (v22)
    v23 = v21 > v7;
  else
    v23 = 0;
  if (!v23 || v21 + v22 >= v7 + v6)
    goto LABEL_27;
  v26 = v21 - v7;
  if (v21 - v7 == 4)
  {
    -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("entr"), 9, v7, v6);
    if (!v42)
      goto LABEL_27;
    v36 = 5;
  }
  else if (v26 == 2)
  {
    -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("qu"), 9, v7, v6);
    if (!v43)
      goto LABEL_27;
    v36 = 3;
  }
  else
  {
    if (v26 != 1)
      goto LABEL_27;
    -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("c"), 9, v7, v6);
    if (!v27)
    {
      -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("d"), 9, v7, v6);
      if (!v28)
      {
        -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("j"), 9, v7, v6);
        if (!v29)
        {
          -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("l"), 9, v7, v6);
          if (!v30)
          {
            -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("m"), 9, v7, v6);
            if (!v31)
            {
              -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("n"), 9, v7, v6);
              if (!v32)
              {
                -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("s"), 9, v7, v6);
                if (!v33)
                {
                  -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("t"), 9, v7, v6);
                  if (!v34)
                  {
                    -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", CFSTR("y"), 9, v7, v6);
                    if (!v35)
                      goto LABEL_27;
                  }
                }
              }
            }
          }
        }
      }
    }
    v36 = 2;
  }
  if ((unint64_t)qword_1ECD0A560 <= 0xFFF)
  {
    v44 = qword_1ECD0A568 + 16 * qword_1ECD0A560;
    *(_WORD *)v44 = v7 - location;
    *(_BYTE *)(v44 + 2) = v36;
    *(_BYTE *)(v44 + 3) = 88;
    *(_DWORD *)(v44 + 4) = 0;
    *(_QWORD *)(v44 + 8) = 0;
    ++qword_1ECD0A560;
  }
  -[NSLinguisticTagger _analyzeTokensInWordRange:paragraphRange:](self, "_analyzeTokensInWordRange:paragraphRange:", v36 + v7, v6 - v36, location, length);
}

- (id)_tokenDataForParagraphRange:(_NSRange)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6
{
  _BOOL4 v6;
  CFIndex length;
  CFIndex location;
  __CFString *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  __CFStringTokenizer *v18;
  const __CFLocale *v19;
  CFStringTokenizerRef v20;
  CFIndex v21;
  const UniChar *CharactersPtr;
  __CFStringTokenizer *v23;
  const UniChar *v24;
  UniChar *v25;
  const UniChar *v26;
  const UniChar *v27;
  char *v28;
  const UniChar *v29;
  unsigned __int16 *v30;
  CFIndex v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  CFIndex v40;
  unint64_t v41;
  unint64_t v42;
  unsigned __int16 *v43;
  CFIndex v44;
  __CFStringTokenizer *v45;
  CFRange CurrentTokenRange;
  CFIndex v47;
  CFIndex v48;
  uint64_t v49;
  CFIndex v50;
  int v51;
  CFIndex v52;
  unint64_t v53;
  CFIndex v54;
  int v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  BOOL v69;
  CFRange v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unsigned __int16 *v79;
  unint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  BOOL v84;
  int v85;
  unsigned __int8 *v86;
  unsigned int *v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  void *v91;
  unint64_t v92;
  NSSimpleOrthography *v93;
  __CFStringTokenizer *v94;
  void *v95;
  uint64_t v96;
  unint64_t v97;
  unsigned __int16 *v98;
  CFIndex v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  CFIndex v104;
  const UniChar *v105;
  _BOOL4 v106;
  char v107;
  UniChar *v108;
  BOOL v109;
  BOOL v110;
  CFIndex v111;
  int v112;
  __CFStringTokenizer *tokenizer;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  CFIndex v117;
  CFIndex v118;
  CFStringRef *v119;
  _QWORD v120[256];
  _OWORD v121[16];
  _OWORD v122[16];
  uint64_t v123;
  CFRange v124;
  CFRange v125;
  CFRange v126;
  CFRange v127;
  CFRange v128;

  v6 = a6;
  length = a3.length;
  location = a3.location;
  v123 = *MEMORY[0x1E0C80C00];
  memset(v122, 0, sizeof(v122));
  memset(v121, 0, sizeof(v121));
  bzero(v120, 0x800uLL);
  v118 = length;
  v119 = (CFStringRef *)self;
  v124.location = location;
  v124.length = length;
  v12 = (__CFString *)CFStringTokenizerCopyBestStringLanguage((CFStringRef)self->_string, v124);
  v13 = -[__CFString hasPrefix:](v12, "hasPrefix:", CFSTR("ja"));
  v14 = -[__CFString hasPrefix:](v12, "hasPrefix:", CFSTR("zh"));
  if (v12)
    CFRelease(v12);
  qword_1ECD0A560 = 0;
  v15 = (void *)qword_1ECD0A568;
  if (!qword_1ECD0A568)
  {
    v15 = malloc_type_calloc(0x1000uLL, 0x10uLL, 0x10820401907A9A8uLL);
    qword_1ECD0A568 = (uint64_t)v15;
  }
  v16 = (void *)qword_1ECD0A570;
  if (!qword_1ECD0A570)
  {
    v16 = malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
    qword_1ECD0A570 = (uint64_t)v16;
    v15 = (void *)qword_1ECD0A568;
  }
  v17 = 0;
  if (v15 && v16)
  {
    v109 = a5;
    v110 = a4;
    if (v13)
    {
      v18 = (__CFStringTokenizer *)qword_1ECD0A578;
      if (qword_1ECD0A578)
        goto LABEL_17;
      v19 = CFLocaleCreate(0, CFSTR("ja"));
      v125.location = 0;
      v125.length = 0;
      v20 = CFStringTokenizerCreate(0, &stru_1E0F56070, v125, 0, v19);
      qword_1ECD0A578 = (uint64_t)v20;
      if (v19)
      {
        CFRelease(v19);
        v18 = (__CFStringTokenizer *)qword_1ECD0A578;
        if (!qword_1ECD0A578)
          goto LABEL_15;
LABEL_17:
        v21 = v118;
        v127.location = location;
        v127.length = v118;
        CFStringTokenizerSetString(v18, v119[3], v127);
        CharactersPtr = CFStringGetCharactersPtr(v119[3]);
        v23 = v18;
        if (CharactersPtr)
        {
          v24 = CharactersPtr;
          v25 = (UniChar *)malloc_type_malloc(2 * v118, 0x1000040BDFB0063uLL);
          if (v25)
          {
            v26 = v25;
            v27 = &v24[location];
            v28 = (char *)v25;
            v21 = v118;
            if (!v118)
              goto LABEL_49;
            goto LABEL_23;
          }
        }
        else
        {
          v29 = (const UniChar *)malloc_type_malloc(4 * v118, 0x1000040BDFB0063uLL);
          if (v29)
          {
            v26 = v29;
            -[__CFString getCharacters:range:]((id)v119[3], "getCharacters:range:", v29, location, v118);
            v28 = (char *)&v26[v118];
            v27 = v26;
            if (!v118)
              goto LABEL_49;
LABEL_23:
            v30 = (unsigned __int16 *)v27;
            v31 = v21;
            do
            {
              v33 = *v30++;
              v32 = v33;
              v34 = v33 - 65;
              v35 = v33 - 192;
              if (v33 - 216 >= 7 && v34 >= 0x1A && v35 > 0x16)
              {
                if (v32 == 376)
                {
                  LOWORD(v32) = 255;
                }
                else if ((v32 & 1) != 0)
                {
                  if (v32 - 313 < 0xF || v32 - 377 < 5 || v32 - 461 < 0xF)
                    LOWORD(v32) = v32 + 1;
                }
                else if (v32 - 256 < 0x37
                       || v32 - 330 < 0x2D
                       || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1822DA780, (uint32x4_t)vaddq_s32(vdupq_n_s32(v32), (int32x4_t)xmmword_1822DA770)))) & 1) != 0|| v32 == 500)
                {
                  LOWORD(v32) = v32 + 1;
                }
              }
              else
              {
                LOWORD(v32) = v32 + 32;
              }
              *(_WORD *)v28 = v32;
              v28 += 2;
              --v31;
            }
            while (v31);
LABEL_49:
            v108 = (UniChar *)v26;
            v115 = location + v21;
            tokenizer = v23;
            v107 = v13;
            if (!CFStringTokenizerAdvanceToNextToken(v23))
            {
              v40 = 0;
              v44 = location;
              v84 = v110;
LABEL_158:
              v91 = (void *)-[CFStringRef orthographyAtIndex:effectiveRange:](v119, "orthographyAtIndex:effectiveRange:", location, 0, v104);
              v92 = orthographyFlagsForScores(v122, (uint64_t)v121, (uint64_t)v120);
              if (!v91)
              {
                if ((_DWORD)v92)
                {
                  v93 = +[NSSimpleOrthography orthographyWithFlags:](NSSimpleOrthography, "orthographyWithFlags:", v92);
                  if (v93)
                    -[CFStringRef setOrthography:range:](v119, "setOrthography:range:", v93, location, v118);
                }
              }
              if (v115 > v44 + v40)
                -[CFStringRef _analyzeTokensInInterwordRange:paragraphRange:](v119, "_analyzeTokensInInterwordRange:paragraphRange:", v44 + v40, v115 - (v44 + v40), location, v118);
              -[CFStringRef _acceptSentencesForParagraphRange:](v119, "_acceptSentencesForParagraphRange:", location, v118);
              v94 = tokenizer;
              if (v84 || v109 || v6)
              {
                if (v91)
                {
                  v95 = (void *)objc_msgSend(v91, "dominantLanguageForScript:", CFSTR("Latn"));
                  if ((objc_msgSend(v95, "isEqualToString:", CFSTR("en")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("fr")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("de")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("es")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("it")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("pt")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("nl")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("ko")) & 1) == 0
                    && (objc_msgSend(v95, "isEqualToString:", CFSTR("ru")) & 1) == 0)
                  {
                    objc_msgSend(v95, "isEqualToString:", CFSTR("tr"));
                  }
                }
                if (qword_1ECD0A560)
                {
                  v96 = 0;
                  v97 = 0;
                  do
                  {
                    v98 = (unsigned __int16 *)(qword_1ECD0A568 + v96);
                    if (*(_BYTE *)(qword_1ECD0A568 + v96 + 3) == 88)
                    {
                      v99 = location + *v98;
                      v100 = *((unsigned __int8 *)v98 + 2);
                      -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4E8, 0, v99, v100);
                      if (v101)
                      {
                        -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4F0, 0, v99, v100);
                        if (!v102)
                          *(_BYTE *)(qword_1ECD0A568 + v96 + 3) = 17;
                      }
                    }
                    ++v97;
                    v96 += 16;
                  }
                  while (v97 < qword_1ECD0A560);
                }
                v94 = tokenizer;
                if ((v107 & 1) == 0)
                  -[CFStringRef _calculateSentenceRangesForParagraphRange:](v119, "_calculateSentenceRangesForParagraphRange:", location, v118);
              }
              v128.location = 0;
              v128.length = 0;
              CFStringTokenizerSetString(v94, &stru_1E0F56070, v128);
              free(v108);
              return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", qword_1ECD0A568, 16 * qword_1ECD0A560);
            }
            v106 = v6;
            v114 = 0;
            v40 = 0;
            v41 = 0;
            v112 = v13 | v14;
            v104 = -location;
            v105 = v27;
            v42 = location;
            v43 = (unsigned __int16 *)&v27[-location];
            v44 = v42;
            v116 = 0;
            v117 = v42;
            v45 = tokenizer;
            do
            {
              CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v45);
              v47 = CurrentTokenRange.location;
              v48 = CurrentTokenRange.length;
              if (!v112
                || (-[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1ECD0A4B8, 0, CurrentTokenRange.location, CurrentTokenRange.length), v49))
              {
                v50 = v44 + v40;
                if (CurrentTokenRange.location > v44 + v40)
                {
                  v51 = -[__CFString characterAtIndex:]((id)v119[3], "characterAtIndex:", CurrentTokenRange.location - 1);
                  if (v51 == 95 || v51 == 46)
                  {
                    v48 = CurrentTokenRange.length + 1;
                    v47 = CurrentTokenRange.location - 1;
                  }
                }
                v52 = v47;
                v53 = v48 + v47;
                if (v53 >= v115)
                {
                  v44 = v52;
                }
                else
                {
                  v44 = v52;
                  v54 = v52 + 64;
                  while (1)
                  {
                    v55 = -[__CFString characterAtIndex:]((id)v119[3], "characterAtIndex:", v53, v104, v105);
                    v56 = (v55 - 39) > 0x38
                       || ((1 << (v55 - 39)) & 0x100000000000081) == 0;
                    v57 = !v56 || v55 == 8217;
                    v58 = !v57;
                    if ((v55 - 8208) < 2 || v55 == 45)
                      break;
LABEL_77:
                    if (v58)
                      goto LABEL_102;
LABEL_95:
                    if (!CFStringTokenizerAdvanceToNextToken(tokenizer)
                      || (v70 = CFStringTokenizerGetCurrentTokenRange(tokenizer), v70.location != v53 + 1)
                      || (v71 = v70.location + v70.length, v70.location + v70.length > v54))
                    {
                      CFStringTokenizerGoToTokenAtIndex(tokenizer, v53);
                      goto LABEL_102;
                    }
                    v48 = v71 - v44;
                    v53 = v70.location + v70.length;
                    if (v71 >= v115)
                      goto LABEL_103;
                  }
                  switch(v48)
                  {
                    case 1:
                      -[__CFString rangeOfString:options:range:]((id)v119[3], "rangeOfString:options:range:", CFSTR("a"), 9, v44, v48);
                      if (v59)
                        goto LABEL_95;
                      -[__CFString rangeOfString:options:range:]((id)v119[3], "rangeOfString:options:range:", CFSTR("t"), 9, v44, v48);
                      if (v60 || !v58)
                        goto LABEL_95;
                      v48 = 1;
                      break;
                    case 2:
                      -[__CFString rangeOfString:options:range:]((id)v119[3], "rangeOfString:options:range:", CFSTR("co"), 9, v44, v48);
                      if (v62)
                        goto LABEL_95;
                      -[__CFString rangeOfString:options:range:]((id)v119[3], "rangeOfString:options:range:", CFSTR("un"), 9, v44, v48);
                      if (v63 || !v58)
                        goto LABEL_95;
                      v48 = 2;
                      break;
                    case 3:
                      -[__CFString rangeOfString:options:range:]((id)v119[3], "rangeOfString:options:range:", CFSTR("mal"), 9, v44, v48);
                      if (v65)
                        goto LABEL_95;
                      -[__CFString rangeOfString:options:range:]((id)v119[3], "rangeOfString:options:range:", CFSTR("non"), 9, v44, v48);
                      if (v66 || !v58)
                        goto LABEL_95;
                      v48 = 3;
                      break;
                    case 4:
                      -[__CFString rangeOfString:options:range:]((id)v119[3], "rangeOfString:options:range:", CFSTR("anti"), 9, v44, v48);
                      if (v68)
                        v69 = 0;
                      else
                        v69 = v58;
                      if (!v69)
                        goto LABEL_95;
                      v48 = 4;
                      break;
                    default:
                      goto LABEL_77;
                  }
                }
LABEL_102:
                v71 = v53;
LABEL_103:
                if (v44 > v50)
                  -[CFStringRef _analyzeTokensInInterwordRange:paragraphRange:](v119, "_analyzeTokensInInterwordRange:paragraphRange:", v50, v44 - v50, v117, v118);
                if (v44 < v71)
                {
                  v111 = v44;
                  v72 = v44;
                  while (1)
                  {
                    if (v71 - v72 >= 0x40)
                      v73 = 64;
                    else
                      v73 = v71 - v72;
                    v74 = NSOrthographyScriptIndexForCharacters((uint64_t)&v43[v72], v73, (uint64_t)v122);
                    ++*((_QWORD *)v121 + v74);
                    if (!qword_1ECD0A588)
                      qword_1ECD0A588 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("~#@$%^\\|<."));
                    if (qword_1ECD0A590)
                    {
                      if (!v72)
                        goto LABEL_121;
                    }
                    else
                    {
                      qword_1ECD0A590 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("~#@$%^\\|>:"));
                      if (!v72)
                        goto LABEL_121;
                    }
                    -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1ECD0A588, 12, 0, v72, v104);
                    if (v75)
                      goto LABEL_117;
LABEL_121:
                    v77 = v73 + v72;
                    if (v115 <= v73 + v72)
                    {
                      if (v73)
                        goto LABEL_127;
                    }
                    else
                    {
                      -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1ECD0A590, 8, v73 + v72, v115 - (v73 + v72));
                      if (v73 && !v78)
                      {
LABEL_127:
                        v79 = &v43[v72];
                        v80 = v73;
                        while (1)
                        {
                          v82 = *v79++;
                          v81 = v82;
                          if (v82 == 46 || v81 == 95)
                            break;
                          if (!--v80)
                            goto LABEL_131;
                        }
LABEL_117:
                        if (v41)
                        {
                          v76 = v116;
                          if (!v116)
                            v76 = langid_create();
                          v116 = v76;
                          v114 = langid_consume_string();
                          v41 = 0;
                          v77 = v73 + v72;
                          v42 = v73 + v72;
                        }
                        else
                        {
                          v77 = v73 + v72;
                        }
                        goto LABEL_133;
                      }
                      if (v78)
                        goto LABEL_117;
                    }
LABEL_131:
                    scoreOrthographyForCharacters((unint64_t)&v43[v72], v73, v74, (uint64_t)v120);
                    v41 = v72 - v42 + v73;
LABEL_133:
                    -[CFStringRef _analyzeTokensInWordRange:paragraphRange:](v119, "_analyzeTokensInWordRange:paragraphRange:", v72, v73, v117, v118, v104);
                    v72 = v77;
                    if (v77 >= v71)
                    {
                      v40 = v48;
                      v44 = v111;
                      goto LABEL_136;
                    }
                  }
                }
                v40 = v48;
              }
LABEL_136:
              v45 = tokenizer;
            }
            while (CFStringTokenizerAdvanceToNextToken(tokenizer));
            if (v41)
            {
              v83 = v116;
              location = v117;
              if (v115 > v42)
              {
                v6 = v106;
                if (!v116)
                  v83 = langid_create();
                v114 = langid_consume_string();
                goto LABEL_148;
              }
            }
            else
            {
              v83 = v116;
              location = v117;
            }
            v6 = v106;
LABEL_148:
            v84 = v110;
            if (v83)
            {
              v85 = numberOfLanguageCodes_numCodes;
              if (numberOfLanguageCodes_numCodes < 0)
              {
                v85 = langid_numlanguages();
                numberOfLanguageCodes_numCodes = v85;
              }
              v86 = (unsigned __int8 *)orthoIndexesForLanguageCodes();
              v87 = (unsigned int *)v114;
              if (v86 && v85 >= 1)
              {
                v88 = v85;
                do
                {
                  v90 = *v86++;
                  v89 = v90;
                  if (v90)
                    v120[v89] += *v87;
                  ++v87;
                  --v88;
                }
                while (v88);
              }
              langid_dispose();
            }
            goto LABEL_158;
          }
        }
        return 0;
      }
      v18 = v20;
      if (v20)
        goto LABEL_17;
    }
LABEL_15:
    v18 = (__CFStringTokenizer *)qword_1ECD0A580;
    if (!qword_1ECD0A580)
    {
      v126.location = 0;
      v126.length = 0;
      v18 = CFStringTokenizerCreate(0, &stru_1E0F56070, v126, 0, 0);
      qword_1ECD0A580 = (uint64_t)v18;
      if (!v18)
        return 0;
    }
    goto LABEL_17;
  }
  return v17;
}

- (void)_tokenizeParagraphAtIndex:(unint64_t)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  NSMutableRLEArray *v18;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = -[NSString length](self->_string, "length");
  if (v11 <= a3)
    return;
  v12 = v11;
  v13 = -[NSString paragraphRangeForRange:](self->_string, "paragraphRangeForRange:", a3, 0);
  v15 = v14;
  if (v14 <= 0x10000)
  {
    v16 = v13;
LABEL_6:
    if (!v15)
      return;
    goto LABEL_7;
  }
  v16 = ((a3 - v13) & 0xFFFFFFFFFFFF0000) + v13;
  v15 = v13 + v14 - v16;
  if (v15 <= 0x10000)
    goto LABEL_6;
  v15 = 0x10000;
LABEL_7:
  objc_msgSend((id)qword_1ECD0A470, "lock");
  v17 = -[NSLinguisticTagger _tokenDataForParagraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:](self, "_tokenDataForParagraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:", v16, v15, v8, v7, v6);
  objc_msgSend((id)qword_1ECD0A470, "unlock");
  if (self->_tokenArray)
  {
    if (!v17)
      return;
    goto LABEL_9;
  }
  v18 = -[NSRLEArray init](+[NSMutableRLEArray allocWithZone:](NSMutableRLEArray, "allocWithZone:", -[NSLinguisticTagger zone](self, "zone")), "init");
  self->_tokenArray = v18;
  -[NSMutableRLEArray insertObject:range:](v18, "insertObject:range:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), 0, v12);
  if (v17)
LABEL_9:
    objc_msgSend(self->_tokenArray, "replaceObjectsInRange:withObject:length:", v16, v15, v17, v15);
}

- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 requireLemmas:(BOOL)a5 requirePartsOfSpeech:(BOOL)a6 requireNamedEntities:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _NSRange v18;
  uint64_t v19;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v13 = objc_msgSend(self->_tokenArray, "count");
  v18 = (_NSRange)xmmword_1822B5320;
  if (v13 <= a3
    || (v14 = (void *)objc_msgSend(self->_tokenArray, "objectAtIndex:effectiveRange:", a3, &v18)) == 0
    || (v15 = v14, objc_msgSend(v14, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"))))
  {
    -[NSLinguisticTagger _tokenizeParagraphAtIndex:requireLemmas:requirePartsOfSpeech:requireNamedEntities:](self, "_tokenizeParagraphAtIndex:requireLemmas:requirePartsOfSpeech:requireNamedEntities:", a3, v9, v8, v7, v18);
    v16 = (void *)objc_msgSend(self->_tokenArray, "objectAtIndex:effectiveRange:", a3, &v18);
    if (objc_msgSend(v16, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
      v15 = 0;
    else
      v15 = v16;
  }
  if (a4)
    *a4 = v18;
  return v15;
}

- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 tagScheme:(id)a5
{
  id v8;
  uint64_t v9;
  _BOOL8 v10;
  id v12;

  v8 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", CFSTR("Lemma"), a4, a5);
  if (-[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", CFSTR("NameType"))
    || -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", CFSTR("NameTypeOrLexicalClass")))
  {
    v9 = 1;
  }
  else
  {
    if (!-[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", CFSTR("LexicalClass")))
    {
      v12 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", CFSTR("InternalClass"));
      v9 = 0;
      v10 = v12 != 0;
      return -[NSLinguisticTagger _tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:](self, "_tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:", a3, a4, v8 != 0, v10, v9);
    }
    v9 = 0;
  }
  v10 = 1;
  return -[NSLinguisticTagger _tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:](self, "_tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:", a3, a4, v8 != 0, v10, v9);
}

- (void)_enumerateTagsInRange:(_NSRange)a3 scheme:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v13;
  id v14;
  void *reserved;
  void *v16;
  _QWORD v17[8];
  _QWORD v18[7];

  length = a3.length;
  location = a3.location;
  v18[6] = *MEMORY[0x1E0C80C00];
  v13 = -[NSString length](self->_string, "length");
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[4] = 0;
  v18[5] = 0;
  v18[3] = &unk_1823C230D;
  if (location + length > v13)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v16);
  }
  v14 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", a4);
  if (v14)
  {
    reserved = self->_reserved;
    if (reserved)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __70__NSLinguisticTagger__enumerateTagsInRange_scheme_options_usingBlock___block_invoke;
      v17[3] = &unk_1E0F52078;
      v17[4] = self;
      v17[5] = v14;
      v17[6] = a6;
      v17[7] = v18;
      off_1ECD0A540(reserved, 0, location, length, a5, v17);
    }
  }
  _Block_object_dispose(v18, 8);
}

void __70__NSLinguisticTagger__enumerateTagsInRange_scheme_options_usingBlock___block_invoke(_QWORD *a1, unint64_t *a2, _BYTE *a3)
{
  void *v6;
  unint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x186DA8F78]();
  v7 = *a2;
  v8 = (void *)off_1ECD0A548(*(_QWORD *)(a1[4] + 48), a1[5]);
  tagForNLTag(v8);
  v11 = 0;
  if (v7 >= *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) + *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 32))
  {
    v9 = 0uLL;
    v10 = 0;
    off_1ECD0A538(&v9, *(_QWORD *)(a1[4] + 48), 1, v7);
    *(_OWORD *)(*(_QWORD *)(a1[7] + 8) + 32) = v9;
  }
  (*(void (**)(void))(a1[6] + 16))();
  if (v8)
    CFRelease(v8);
  if (v11)
    *a3 = 1;
  objc_autoreleasePoolPop(v6);
}

@end
