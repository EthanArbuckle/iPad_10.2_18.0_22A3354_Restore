@implementation NSLookupMatch

- (NSLookupMatch)initWithType:(unint64_t)a3 range:(_NSRange)a4 score:(double)a5
{
  NSUInteger length;
  NSUInteger location;
  NSLookupMatch *result;
  objc_super v10;
  uint64_t v11;

  length = a4.length;
  location = a4.location;
  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSLookupMatch;
  result = -[NSLookupMatch init](&v10, sel_init);
  if (result)
  {
    result->_matchType = a3;
    result->_range.location = location;
    result->_range.length = length;
    result->_score = a5;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSLookupMatch;
  -[NSLookupMatch dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSString *v3;
  uint64_t v4;
  NSRange v6;

  v6.location = -[NSLookupMatch range](self, "range");
  v3 = NSStringFromRange(v6);
  -[NSLookupMatch score](self, "score");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %0.2f"), v3, v4);
}

+ (id)matchesInString:(id)a3 types:(unint64_t)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  char v7;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  id v18;
  SEL v19;
  NSDataDetector *v20;
  NSLinguisticTagger *v21;
  NSAssertionHandler *v23;
  id v24;
  const char *v25;
  NSString *v26;
  id v27;
  const char *v28;
  NSString *v29;
  NSString *v30;
  NSString *v31;
  NSAssertionHandler *v32;
  _QWORD v33[7];
  _QWORD v34[7];
  uint64_t v35;
  _QWORD v36[6];
  NSRange v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;

  length = a5.length;
  location = a5.location;
  v7 = a4;
  v36[4] = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSLookupMatch.m"), 68, CFSTR("Invalid parameter: string is nil"));
  v12 = objc_msgSend(a3, "length");
  if (location > v12)
  {
    v23 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v37.location = 0;
    v37.length = v12;
    v24 = a1;
    v25 = a2;
    v26 = NSStringFromRange(v37);
    v38.location = location;
    v38.length = length;
    v30 = v26;
    a2 = v25;
    a1 = v24;
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v24, CFSTR("NSLookupMatch.m"), 70, CFSTR("Invalid range: string range %@ does not contain search range %@"), v30, NSStringFromRange(v38));
  }
  v13 = location + length;
  if (location + length > v12)
  {
    v32 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v39.location = 0;
    v39.length = v12;
    v27 = a1;
    v28 = a2;
    v29 = NSStringFromRange(v39);
    v40.location = location;
    v40.length = length;
    v31 = v29;
    a2 = v28;
    a1 = v27;
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v27, CFSTR("NSLookupMatch.m"), 71, CFSTR("Invalid range: string range %@ does not contain search range %@"), v31, NSStringFromRange(v40));
  }
  if (location >= 0x100)
    v14 = location - 256;
  else
    v14 = 0;
  v15 = v13 + 256;
  if (v13 + 256 >= v12)
    v15 = v12;
  v16 = v15 - v14;
  v17 = MEMORY[0x1E0C809B0];
  if ((v7 & 2) != 0)
  {
    v18 = a1;
    v19 = a2;
    v35 = 0;
    v20 = +[NSDataDetector dataDetectorWithTypes:error:](NSDataDetector, "dataDetectorWithTypes:error:", 6200, &v35);
    if (!v20)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v19, v18, CFSTR("NSLookupMatch.m"), 84, CFSTR("Failed to create NSDataDetector"));
    v17 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __45__NSLookupMatch_matchesInString_types_range___block_invoke;
    v34[3] = &unk_1E0F4EFA0;
    v34[5] = location;
    v34[6] = length;
    v34[4] = v11;
    -[NSDataDetector enumerateMatchesInString:options:range:usingBlock:](v20, "enumerateMatchesInString:options:range:usingBlock:", a3, 8, v14, v16, v34);
  }
  if ((v7 & 1) != 0)
  {
    v36[0] = CFSTR("TokenType");
    v36[1] = CFSTR("Language");
    v36[2] = CFSTR("NameType");
    v36[3] = CFSTR("LexicalClass");
    v21 = -[NSLinguisticTagger initWithTagSchemes:options:]([NSLinguisticTagger alloc], "initWithTagSchemes:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4), 30);
    -[NSLinguisticTagger setString:](v21, "setString:", a3);
    v33[0] = v17;
    v33[1] = 3221225472;
    v33[2] = __45__NSLookupMatch_matchesInString_types_range___block_invoke_2;
    v33[3] = &unk_1E0F4EFC8;
    v33[5] = location;
    v33[6] = length;
    v33[4] = v11;
    -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:](v21, "enumerateTagsInRange:scheme:options:usingBlock:", v14, v16, CFSTR("TokenType"), 30, v33);
  }
  objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_18);
  return v11;
}

unint64_t __45__NSLookupMatch_matchesInString_types_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  NSLookupMatch *v15;
  uint64_t v16;
  uint64_t v17;
  NSLookupMatch *v18;
  unint64_t result;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  if (*(_QWORD *)(a1 + 48))
  {
    v7 = objc_msgSend(a2, "range");
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = v10 + v9;
    if (v10 + v9 >= v7 + v8)
      v12 = v7 + v8;
    else
      v12 = v10 + v9;
    v13 = v7 > v9 || v9 >= v7 + v8;
    if (!v13 || (v9 <= v7 ? (v14 = v7 >= v11) : (v14 = 1), v9 = v7, !v14))
    {
      if (v12 != v9)
        goto LABEL_15;
    }
  }
  else
  {
    v20 = *(_QWORD *)(a1 + 40);
    v21 = objc_msgSend(a2, "range");
    if (v21 <= v20 && v21 + v22 >= v20)
    {
LABEL_15:
      v15 = [NSLookupMatch alloc];
      v16 = objc_msgSend(a2, "range");
      v18 = -[NSLookupMatch initWithType:range:score:](v15, "initWithType:range:score:", 2, v16, v17, 0.5);
      -[NSLookupMatch setDataDetectorResult:](v18, "setDataDetectorResult:", a2);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);

    }
  }
  result = objc_msgSend(a2, "range");
  *a4 = result > *(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 40);
  return result;
}

void __45__NSLookupMatch_matchesInString_types_range___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  BOOL v15;
  NSLookupMatch *v17;

  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  if (!v11)
  {
    if (a3 > v10 || a3 + a4 < v10)
    {
      v11 = 0;
      goto LABEL_22;
    }
LABEL_21:
    v17 = -[NSLookupMatch initWithType:range:score:]([NSLookupMatch alloc], "initWithType:range:score:", 1, a3, a4, 0.5);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);

    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    goto LABEL_22;
  }
  if (v10 + v11 >= a3 + a4)
    v12 = a3 + a4;
  else
    v12 = v10 + v11;
  v13 = a3 > v10 || v10 >= a3 + a4;
  v14 = *(_QWORD *)(a1 + 40);
  if (!v13 || (v10 <= a3 ? (v15 = a3 >= v10 + v11) : (v15 = 1), v14 = a3, !v15))
  {
    if (v12 != v14)
      goto LABEL_21;
  }
LABEL_22:
  *a7 = a3 > v11 + v10;
}

uint64_t __45__NSLookupMatch_matchesInString_types_range___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = objc_msgSend(a2, "range");
  if (v5 < objc_msgSend(a3, "range"))
    return -1;
  v6 = objc_msgSend(a2, "range");
  if (v6 > objc_msgSend(a3, "range"))
    return 1;
  v8 = objc_msgSend(a2, "range");
  v10 = v8 + v9;
  v11 = objc_msgSend(a3, "range");
  if (v10 < v11 + v12)
    return -1;
  v13 = objc_msgSend(a2, "range");
  v15 = v13 + v14;
  v16 = objc_msgSend(a3, "range");
  return v15 > v16 + v17;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD dest[3];
  _NSRange result;

  dest[2] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_range, 16, 1, 0);
  v2 = dest[0];
  v3 = dest[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (double)score
{
  return self->_score;
}

- (NSTextCheckingResult)dataDetectorResult
{
  return (NSTextCheckingResult *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataDetectorResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)languageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLanguageIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
