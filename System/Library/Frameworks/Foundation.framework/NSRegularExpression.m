@implementation NSRegularExpression

+ (NSRegularExpression)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error
{
  return (NSRegularExpression *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPattern:options:error:", pattern, options, error);
}

- (NSRegularExpression)initWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error
{
  NSRegularExpression *v9;
  NSString *v10;
  unint64_t v11;
  UniChar *CharactersPtr;
  _BOOL4 v13;
  _BOOL4 v14;
  URegularExpression *internal;
  BOOL v16;
  UniChar *v18;
  NSString *v19;
  UErrorCode status;
  objc_super v21;
  UParseError pe;
  _BYTE v23[512];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!pattern)
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0));
  }
  v21.receiver = self;
  v21.super_class = (Class)NSRegularExpression;
  v9 = -[NSRegularExpression init](&v21, sel_init);
  if (v9)
  {
    status = U_ZERO_ERROR;
    memset(&pe, 0, sizeof(pe));
    v10 = pattern;
    if ((options & 4) != 0)
      v10 = +[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", pattern);
    v11 = -[NSString length](v10, "length");
    CharactersPtr = (UniChar *)CFStringGetCharactersPtr((CFStringRef)v10);
    v13 = CharactersPtr == 0;
    if (!CharactersPtr)
    {
      if (v11 <= 0x100)
      {
        CharactersPtr = (UniChar *)v23;
        -[NSString getCharacters:range:](v10, "getCharacters:range:", v23, 0, v11);
        v13 = 0;
        goto LABEL_10;
      }
      v18 = (UniChar *)malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
      if (!v18)
      {
LABEL_21:
        if (v9->_internal)
        {
          v9->_pattern = (NSString *)-[NSString copy](pattern, "copy");
          v9->_options = options;
        }
        else
        {

          return 0;
        }
        return v9;
      }
      CharactersPtr = v18;
      -[NSString getCharacters:range:](v10, "getCharacters:range:", v18, 0, v11);
    }
    if (v11 >= 0x7FFFFFFF)
    {
      v14 = 0;
      internal = (URegularExpression *)v9->_internal;
LABEL_11:
      if (internal)
        v16 = !v14;
      else
        v16 = 0;
      if (!v16)
      {
        if (error)
        {
          *error = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 2048, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v10, CFSTR("NSInvalidValue"), 0));
          internal = (URegularExpression *)v9->_internal;
        }
        if (internal)
        {
          uregex_close(internal);
          v9->_internal = 0;
        }
      }
      if (v13)
        free(CharactersPtr);
      goto LABEL_21;
    }
LABEL_10:
    internal = uregex_open(CharactersPtr, v11, (4 * options) & 0x20 | (2 * (options & 3)) | (options >> 1) & 8 | (options >> 5) & 1 | (((options >> 6) & 1) << 8), &pe, &status);
    v9->_internal = internal;
    v14 = status > U_ZERO_ERROR;
    goto LABEL_11;
  }
  return v9;
}

- (void)dealloc
{
  URegularExpression *internal;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  internal = (URegularExpression *)self->_internal;
  if (internal)
  {
    uregex_close(internal);
    self->_internal = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSRegularExpression;
  -[NSRegularExpression dealloc](&v4, sel_dealloc);
}

- (NSString)stringByReplacingMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  NSRegularExpression *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  void *v30;
  NSUInteger v31;
  NSArray *obj;
  NSString *v33;
  NSString *v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  length = range.length;
  location = range.location;
  v40 = *MEMORY[0x1E0C80C00];
  v34 = +[NSString string](NSMutableString, "string");
  v13 = -[NSString length](string, "length");
  v33 = templ;
  if (!templ)
  {
    v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v30);
  }
  v14 = v13;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = -[NSRegularExpression matchesInString:options:range:](self, "matchesInString:options:range:", string, options & 0xFFFFFFFFFFFFFFFCLL, location, length);
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (v15)
  {
    v16 = v15;
    v31 = v14;
    v17 = self;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v37;
    do
    {
      v21 = 0;
      v22 = v18;
      v23 = v19;
      do
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v21);
        v18 = objc_msgSend(v24, "range");
        v19 = v25;
        v26 = -[NSRegularExpression replacementStringForResult:inString:offset:template:](v17, "replacementStringForResult:inString:offset:template:", v24, string, 0, v33);
        v27 = v18 - (v22 + v23);
        if (v18 > v22 + v23)
          -[NSString appendString:](v34, "appendString:", -[NSString substringWithRange:](string, "substringWithRange:", v22 + v23, v27));
        -[NSString appendString:](v34, "appendString:", v26, v27);
        ++v21;
        v22 = v18;
        v23 = v19;
      }
      while (v16 != v21);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    }
    while (v16);
    v28 = v18 + v19;
    v14 = v31;
  }
  else
  {
    v28 = 0;
  }
  if (v14 > v28)
    -[NSString appendString:](v34, "appendString:", -[NSString substringWithRange:](string, "substringWithRange:"));
  return v34;
}

- (NSArray)matchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSArray *v10;
  _QWORD v12[6];

  length = range.length;
  location = range.location;
  v12[5] = *MEMORY[0x1E0C80C00];
  v10 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__NSRegularExpression_NSMatching__matchesInString_options_range___block_invoke;
  v12[3] = &unk_1E0F525F0;
  v12[4] = v10;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFFFFCLL, location, length, v12);
  return v10;
}

- (NSString)replacementStringForResult:(NSTextCheckingResult *)result inString:(NSString *)string offset:(NSInteger)offset template:(NSString *)templ
{
  NSUInteger v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v23;
  unint64_t v24;
  NSUInteger v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  unint64_t v33;
  uint64_t v34;
  void *v36;
  NSString *v37;
  NSTextCheckingResult *v38;

  v11 = -[NSTextCheckingResult numberOfRanges](result, "numberOfRanges");
  v38 = result;
  if (!result || !string || !templ)
  {
    v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v36);
  }
  v12 = v11;
  v13 = &unk_1ECD06000;
  if (!replacementStringForResult_inString_offset_template__characterSet)
    replacementStringForResult_inString_offset_template__characterSet = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("\\$"));
  v14 = -[NSString rangeOfCharacterFromSet:](templ, "rangeOfCharacterFromSet:");
  if (v15)
  {
    v16 = v14;
    v17 = v15;
    v37 = string;
    templ = +[NSString stringWithString:](NSMutableString, "stringWithString:", templ);
    v18 = -[NSString length](templ, "length");
    if (v12 < 0xB)
    {
      v21 = 1;
    }
    else
    {
      v19 = 10;
      v20 = 1;
      do
      {
        v21 = v20 + 1;
        v19 *= 10;
      }
      while (v19 < v12 && v20++ < 0x13);
    }
    do
    {
      v23 = -[NSString characterAtIndex:](templ, "characterAtIndex:", v16);
      if (v23 == 36)
      {
        v24 = v16 + v17;
        if (v18 >= v16 + v17 + v21)
          v25 = v16 + v17 + v21;
        else
          v25 = v18;
        if (v24 < v25)
        {
          v26 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            v27 = -[NSString characterAtIndex:](templ, "characterAtIndex:", v24);
            if ((v27 - 58) < 0xFFFFFFF6)
              break;
            v28 = 10 * v26;
            if (v26 == 0x7FFFFFFFFFFFFFFFLL)
              v28 = 0;
            v26 = (v27 - 48) + v28;
            ++v24;
          }
          while (v24 < v25);
          if (v26 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v13 = (_QWORD *)&unk_1ECD06000;
          }
          else
          {
            if (v26 >= v12)
            {
              v17 = 0;
              v29 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              v29 = -[NSTextCheckingResult rangeAtIndex:](v38, "rangeAtIndex:", v26);
              v17 = v30;
            }
            if (v29 == 0x7FFFFFFFFFFFFFFFLL)
              v31 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v31 = v29 + offset;
            v13 = &unk_1ECD06000;
            v32 = &stru_1E0F56070;
            if (v31 != 0x7FFFFFFFFFFFFFFFLL && v17)
              v32 = -[NSString substringWithRange:](v37, "substringWithRange:");
            v33 = v24 - v16;
            -[NSString replaceCharactersInRange:withString:](templ, "replaceCharactersInRange:withString:", v16, v33, v32);
            v18 = v18 - v33 + v17;
          }
        }
      }
      else if (v23 == 92)
      {
        -[NSString deleteCharactersInRange:](templ, "deleteCharactersInRange:", v16, v17);
        v18 -= v17;
        v17 = 1;
      }
      if (v18 <= v17 + v16)
        break;
      v16 = -[NSString rangeOfCharacterFromSet:options:range:](templ, "rangeOfCharacterFromSet:options:range:", v13[150], 0, v17 + v16, v18 - (v17 + v16));
      v17 = v34;
    }
    while (v34);
  }
  return templ;
}

- (NSTextCheckingResult)firstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  NSTextCheckingResult *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__NSRegularExpression_NSMatching__firstMatchInString_options_range___block_invoke;
  v7[3] = &unk_1E0F52618;
  v7[4] = &v8;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFFFFCLL, range.location, range.length, v7);
  v5 = (NSTextCheckingResult *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSUInteger)numberOfMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  NSUInteger v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__NSRegularExpression_NSMatching__numberOfMatchesInString_options_range___block_invoke;
  v7[3] = &unk_1E0F52618;
  v7[4] = &v8;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFDFFCLL | 0x2000, range.location, range.length, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  NSRange result;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3010000000;
  v13 = &unk_1823C230D;
  v14 = xmmword_1822B5320;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__NSRegularExpression_NSMatching__rangeOfFirstMatchInString_options_range___block_invoke;
  v9[3] = &unk_1E0F52618;
  v9[4] = &v10;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFFFFCLL, range.location, range.length, v9);
  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)enumerateMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range usingBlock:(void *)block
{
  NSUInteger length;
  unint64_t location;
  __int16 v9;
  NSUInteger v13;
  NSUInteger v14;
  unint64_t v15;
  uint64_t v16;
  const URegularExpression *internal;
  NSUInteger v18;
  UText *v19;
  unsigned int *p_checkout;
  NSUInteger v21;
  int64_t v22;
  int v24;
  NSComplexRegularExpressionCheckingResult *v25;
  int Next;
  int v27;
  int64_t v29;
  id v30;
  unint64_t v31;
  int64_t *v32;
  int64_t v33;
  int64_t v34;
  _BOOL4 v37;
  int64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  NSString *v49;
  void *v50;
  _QWORD *v51;
  unint64_t v52;
  __int16 v53;
  void *v54;
  NSRegularExpression *v55;
  UErrorCode v56;
  unsigned __int8 v57;
  void *context;
  int64_t v59;
  uint64_t v60;
  UErrorCode v61;
  UErrorCode status;
  _QWORD v63[65];

  length = range.length;
  location = range.location;
  v9 = options;
  v63[63] = *MEMORY[0x1E0C80C00];
  v13 = -[NSString length](string, "length");
  v14 = -[NSRegularExpression numberOfCaptureGroups](self, "numberOfCaptureGroups");
  v57 = 0;
  v56 = U_ZERO_ERROR;
  if (!string)
  {
    v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2));
    v50 = (void *)MEMORY[0x1E0C99DA0];
    v51 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_119;
  }
  if (v13 < length || location > v13 - length)
  {
    v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2));
    v50 = (void *)MEMORY[0x1E0C99DA0];
    v51 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_119:
    objc_exception_throw((id)objc_msgSend(v50, "exceptionWithName:reason:userInfo:", *v51, v49, 0));
  }
  v15 = v14;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v9 & 4) != 0)
    v16 = location;
  context = block;
  v59 = v16;
  v60 = 0;
  v55 = self;
  internal = (const URegularExpression *)self->_internal;
  v18 = -[NSString length](string, "length");
  v19 = 0;
  v61 = U_ZERO_ERROR;
  if (location > 0x7FFFFFFE)
    goto LABEL_83;
  if (location + length > v18)
    goto LABEL_83;
  v19 = (UText *)CFStringOpenUText();
  if (!v19)
    goto LABEL_83;
  v54 = block;
  p_checkout = (unsigned int *)&v55->_checkout;
  v21 = 0x7FFFFFFF - location;
  if (!((location + length) >> 31))
    v21 = length;
  v22 = v21 + location;
  status = U_ZERO_ERROR;
  while (!__ldaxr(p_checkout))
  {
    v24 = 1;
    if (!__stlxr(1u, p_checkout))
      goto LABEL_14;
  }
  v24 = 0;
  __clrex();
  internal = uregex_clone(internal, &status);
LABEL_14:
  uregex_setUText(internal, v19, &v61);
  if (!internal)
  {
    block = v54;
    goto LABEL_83;
  }
  uregex_setRegion64(internal, location, v22, &v61);
  if ((v9 & 1) != 0)
  {
    uregex_setMatchCallback(internal, (URegexMatchCallback *)regexMatchCallback, &context, &v61);
  }
  else if ((v9 & 4) == 0)
  {
    if ((v9 & 8) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  uregex_setFindProgressCallback(internal, (URegexFindProgressCallback *)regexFindProgressCallback, &context, &v61);
  if ((v9 & 8) != 0)
LABEL_18:
    uregex_useTransparentBounds(internal, 1, &v61);
LABEL_19:
  if ((v9 & 0x10) != 0)
    uregex_useAnchoringBounds(internal, 0, &v61);
  if (v61 < U_ILLEGAL_ARGUMENT_ERROR)
  {
    v25 = 0;
    v52 = v15 + 1;
    v53 = v9;
    while (1)
    {
      Next = uregex_findNext(internal, &v56);
      v27 = v57;
      if (!Next)
        break;
      if (v56 > U_ZERO_ERROR || v57 != 0)
        break;
      if (v60 | BYTE1(v60))
      {
        v27 = 0;
        break;
      }
      if ((v9 & 4) != 0)
      {
        v29 = uregex_start64(internal, 0, &v56);
        if (v29 > v59)
        {
          v27 = v57;
          break;
        }
        v59 = uregex_end64(internal, 0, &v56);
      }
      if ((v9 & 0x2000) == 0)
      {
        if (v15 >= 7)
          v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        else
          v30 = 0;
        v31 = 0;
        v32 = v63;
        do
        {
          v61 = U_ZERO_ERROR;
          v33 = uregex_start64(internal, v31, &v61);
          v34 = uregex_end64(internal, v31, &v61);
          v37 = v61 > U_ZERO_ERROR || v33 < 0 || v34 < v33;
          if (v37)
            v38 = 0;
          else
            v38 = v34 - v33;
          if (v37)
            v39 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v39 = v33;
          if (v15 > 6)
          {
            objc_msgSend(v30, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v39, v38));
          }
          else
          {
            *(v32 - 1) = v39;
            *v32 = v38;
          }
          ++v31;
          v32 += 2;
        }
        while (v31 <= v15);
        if (v15 > 2)
        {
          v9 = v53;
          if (v15 > 6)
          {
            v25 = -[NSComplexRegularExpressionCheckingResult initWithRangeArray:regularExpression:]([NSComplexRegularExpressionCheckingResult alloc], "initWithRangeArray:regularExpression:", v30, v55);

          }
          else
          {
            v25 = -[NSExtendedRegularExpressionCheckingResult initWithRanges:count:regularExpression:]([NSExtendedRegularExpressionCheckingResult alloc], "initWithRanges:count:regularExpression:", &status, v52, v55);
          }
        }
        else
        {
          v25 = -[NSSimpleRegularExpressionCheckingResult initWithRanges:count:regularExpression:]([NSSimpleRegularExpressionCheckingResult alloc], "initWithRanges:count:regularExpression:", &status, v52, v55);
          v9 = v53;
        }
      }
      status = U_ZERO_ERROR;
      v40 = uregex_hitEnd(internal, &status) != 0;
      v41 = uregex_requireEnd(internal, &status);
      v42 = 4 * v40;
      if (v41)
        v42 = (4 * v40) | 8;
      if (status >= U_ILLEGAL_ARGUMENT_ERROR)
        v43 = 0;
      else
        v43 = v42;
      (*((void (**)(void *, NSComplexRegularExpressionCheckingResult *, uint64_t, unsigned __int8 *))v54 + 2))(v54, v25, v43, &v57);

      if (v57)
        goto LABEL_98;
    }
    if ((v9 & 2) == 0 || v27 || (_BYTE)v60)
    {
LABEL_98:
      v61 = U_ZERO_ERROR;
      if ((v24 & 1) == 0)
      {
LABEL_116:
        uregex_close(internal);
        goto LABEL_87;
      }
    }
    else
    {
      if (v56 < U_ILLEGAL_ARGUMENT_ERROR || BYTE1(v60))
      {
        status = U_ZERO_ERROR;
        v45 = uregex_hitEnd(internal, &status) != 0;
        v46 = uregex_requireEnd(internal, &status);
        v47 = 4 * v45;
        if (v46)
          v47 = (4 * v45) | 8;
        v48 = v47 | 2;
        if (status >= U_ILLEGAL_ARGUMENT_ERROR)
          v44 = 2;
        else
          v44 = v48;
      }
      else
      {
        v44 = 18;
      }
      (*((void (**)(void *, _QWORD, uint64_t, unsigned __int8 *))v54 + 2))(v54, 0, v44, &v57);
      v61 = U_ZERO_ERROR;
      if (!v24)
        goto LABEL_116;
    }
    uregex_setText(internal, (const UChar *)&status, 0, &v61);
    if ((v9 & 1) != 0)
    {
      uregex_setMatchCallback(internal, 0, 0, &v61);
    }
    else if ((v9 & 4) == 0)
    {
      if ((v9 & 8) == 0)
        goto LABEL_102;
      goto LABEL_106;
    }
    uregex_setFindProgressCallback(internal, 0, 0, &v61);
    if ((v9 & 8) == 0)
    {
LABEL_102:
      if ((v9 & 0x10) == 0)
        goto LABEL_108;
LABEL_107:
      uregex_useAnchoringBounds(internal, 1, &v61);
      do
LABEL_108:
        __ldaxr(p_checkout);
      while (__stlxr(0, p_checkout));
      goto LABEL_87;
    }
LABEL_106:
    uregex_useTransparentBounds(internal, 0, &v61);
    if ((v9 & 0x10) == 0)
      goto LABEL_108;
    goto LABEL_107;
  }
  uregex_setText(internal, (const UChar *)&status, 0, &v61);
  if ((v9 & 1) != 0)
  {
    uregex_setMatchCallback(internal, 0, 0, &v61);
    block = v54;
  }
  else
  {
    block = v54;
    if ((v9 & 4) == 0)
    {
      if ((v9 & 8) == 0)
        goto LABEL_25;
LABEL_81:
      uregex_useTransparentBounds(internal, 0, &v61);
      if ((v9 & 0x10) == 0)
        goto LABEL_83;
      goto LABEL_82;
    }
  }
  uregex_setFindProgressCallback(internal, 0, 0, &v61);
  if ((v9 & 8) != 0)
    goto LABEL_81;
LABEL_25:
  if ((v9 & 0x10) != 0)
LABEL_82:
    uregex_useAnchoringBounds(internal, 1, &v61);
LABEL_83:
  if ((v9 & 2) != 0 && !(_BYTE)v60)
    (*((void (**)(void *, _QWORD, uint64_t, unsigned __int8 *))block + 2))(block, 0, 18, &v57);
  v61 = U_ZERO_ERROR;
LABEL_87:
  if (v19)
    utext_close(v19);
}

- (NSUInteger)numberOfCaptureGroups
{
  NSUInteger result;
  UErrorCode status;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  status = U_ZERO_ERROR;
  result = (NSUInteger)self->_internal;
  if (result)
    return uregex_groupCount((URegularExpression *)result, &status);
  return result;
}

uint64_t __73__NSRegularExpression_NSMatching__numberOfMatchesInString_options_range___block_invoke(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 3) == 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __75__NSRegularExpression_NSMatching__rangeOfFirstMatchInString_options_range___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2)
  {
    v5 = result;
    result = objc_msgSend(a2, "range");
    v6 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8);
    *(_QWORD *)(v6 + 32) = result;
    *(_QWORD *)(v6 + 40) = v7;
  }
  *a4 = 1;
  return result;
}

id __68__NSRegularExpression_NSMatching__firstMatchInString_options_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a4 = 1;
  return result;
}

uint64_t __65__NSRegularExpression_NSMatching__matchesInString_options_range___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *v5;
  NSRegularExpressionOptions v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = -[NSRegularExpression pattern](self, "pattern");
  v6 = -[NSRegularExpression options](self, "options");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSPattern"));
    objc_msgSend(a3, "encodeInt64:forKey:", v6, CFSTR("NSOptions"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5, v6);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "Q", v7);
  }
}

- (NSRegularExpression)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  NSString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPattern"));
    v7 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSOptions"));
    return -[NSRegularExpression initWithPattern:options:error:](self, "initWithPattern:options:error:", v6, v7, 0);
  }
  v12[0] = 0;
  v8 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSRegularExpression"));
  if (v8 == 1)
  {
    v6 = objc_msgSend(a3, "decodeObject");
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "Q", v12, 8);
    v7 = v12[0];
    return -[NSRegularExpression initWithPattern:options:error:](self, "initWithPattern:options:error:", v6, v7, 0);
  }
  v10 = v8;
  v11 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v11, 1, v10);
  -[NSRegularExpression dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](-[NSRegularExpression pattern](self, "pattern"), "hash");
  return -[NSRegularExpression options](self, "options") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  NSRegularExpressionOptions v6;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSString isEqual:](-[NSRegularExpression pattern](self, "pattern"), "isEqual:", objc_msgSend(a3, "pattern"));
    if (v5)
    {
      v6 = -[NSRegularExpression options](self, "options");
      LOBYTE(v5) = v6 == objc_msgSend(a3, "options");
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSRegularExpression;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ 0x%lx"), -[NSRegularExpression description](&v3, sel_description), self->_pattern, self->_options);
}

- (NSString)pattern
{
  return self->_pattern;
}

- (NSRegularExpressionOptions)options
{
  return self->_options;
}

- (unint64_t)_captureGroupNumberWithName:(id)a3
{
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  const UniChar *CharactersPtr;
  UChar *v10;
  int v11;
  int32_t v12;
  UChar *v15;
  UErrorCode status;
  _BYTE v17[512];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  status = U_ZERO_ERROR;
  if (self->_internal)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v5;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  if (!CharactersPtr)
  {
    if (v8 <= 0x100)
    {
      v10 = (UChar *)v17;
      objc_msgSend(a3, "getCharacters:range:", v17, 0, v8);
      goto LABEL_11;
    }
    v15 = (UChar *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
    if (v15)
    {
      v10 = v15;
      objc_msgSend(a3, "getCharacters:range:", v15, 0, v8);
      v11 = 1;
      goto LABEL_12;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = (UChar *)CharactersPtr;
LABEL_11:
  v11 = 0;
LABEL_12:
  v12 = uregex_groupNumberFromName((URegularExpression *)self->_internal, v10, v8, &status);
  if (v12 > -1 && status < U_ILLEGAL_ARGUMENT_ERROR)
    v7 = v12;
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
    free(v10);
  return v7;
}

+ (NSString)escapedPatternForString:(NSString *)string
{
  return (NSString *)escapedString((NSMutableString *)string, (uint64_t)CFSTR("*?+[(){}^$|\\./"));
}

- (NSUInteger)replaceMatchesInString:(NSMutableString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ
{
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  void *v21;
  NSUInteger v22;
  NSArray *obj;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!templ)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v21);
  }
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = -[NSRegularExpression matchesInString:options:range:](self, "matchesInString:options:range:", string, options & 0xFFFFFFFFFFFFFFFCLL, range.location, range.length);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v26;
  do
  {
    v22 = v11;
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      v16 = objc_msgSend(v15, "range");
      v18 = v17;
      v19 = -[NSRegularExpression replacementStringForResult:inString:offset:template:](self, "replacementStringForResult:inString:offset:template:", v15, string, v12, templ);
      -[NSMutableString replaceCharactersInRange:withString:](string, "replaceCharactersInRange:withString:", v16 + v12, v18, v19);
      v12 += -[NSString length](v19, "length") - v18;
    }
    v11 = v10 + v22;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  }
  while (v10);
  return v11;
}

+ (NSString)escapedTemplateForString:(NSString *)string
{
  return (NSString *)escapedString((NSMutableString *)string, (uint64_t)CFSTR("\\$"));
}

@end
