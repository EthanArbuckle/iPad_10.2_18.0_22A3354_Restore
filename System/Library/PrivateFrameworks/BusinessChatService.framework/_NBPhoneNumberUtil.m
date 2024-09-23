@implementation _NBPhoneNumberUtil

+ (_NBPhoneNumberUtil)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36___NBPhoneNumberUtil_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_253EC0AA8 != -1)
    dispatch_once(&qword_253EC0AA8, block);
  return (_NBPhoneNumberUtil *)(id)_MergedGlobals_40;
}

- (id)errorWithObject:(id)a3 withDomain:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = *MEMORY[0x24BDD0FC8];
  v7 = a4;
  objc_msgSend(v5, "dictionaryWithObject:forKey:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)entireRegularExpressionWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  NSMutableDictionary *entireStringRegexCache;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a3;
  -[NSLock lock](self->_entireStringCacheLock, "lock");
  entireStringRegexCache = self->_entireStringRegexCache;
  if (!entireStringRegexCache)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = self->_entireStringRegexCache;
    self->_entireStringRegexCache = v9;

    entireStringRegexCache = self->_entireStringRegexCache;
  }
  -[NSMutableDictionary objectForKey:](entireStringRegexCache, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = v7;
    v13 = v12;
    if (objc_msgSend(v12, "rangeOfString:", CFSTR("^")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^(?:%@)$"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", v13, 0, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_entireStringRegexCache, "setObject:forKey:", v11, v12);

  }
  -[NSLock unlock](self->_entireStringCacheLock, "unlock");

  return v11;
}

- (id)regularExpressionWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSMutableDictionary *regexPatternCache;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;

  v8 = a3;
  -[NSLock lock](self->_lockPatternCache, "lock");
  regexPatternCache = self->_regexPatternCache;
  if (!regexPatternCache)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = self->_regexPatternCache;
    self->_regexPatternCache = v10;

    regexPatternCache = self->_regexPatternCache;
  }
  -[NSMutableDictionary objectForKey:](regexPatternCache, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v8, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_regexPatternCache, "setObject:forKey:", v12, v8);
  }
  -[NSLock unlock](self->_lockPatternCache, "unlock");

  return v12;
}

- (id)componentsSeparatedByRegex:(id)a3 regex:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", a3, a4, CFSTR("<SEP>"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("<SEP>"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", &stru_24C39D888);
  return v6;
}

- (int)stringPositionByRegex:(id)a3 regex:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_7;
  v8 = objc_msgSend(v6, "length");
  v9 = -1;
  if (!v7 || !v8)
    goto LABEL_10;
  if (!objc_msgSend(v7, "length"))
  {
LABEL_7:
    v9 = -1;
    goto LABEL_10;
  }
  v14 = 0;
  -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", v7, 0, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "range");

  }
  else
  {
    v9 = -1;
  }

LABEL_10:
  return v9;
}

- (int)indexOfStringByString:(id)a3 target:(id)a4
{
  return objc_msgSend(a3, "rangeOfString:", a4);
}

- (id)replaceFirstStringByRegex:(id)a3 regex:(id)a4 withTemplate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_msgSend(v8, "copy");
  v20 = 0;
  -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", v10, 0, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v13;
    v16 = v14;
    v17 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v12, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, v15, v16, v9);
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v18;
  }

  return v11;
}

- (id)replaceStringByRegex:(id)a3 regex:(id)a4 withTemplate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;

  v8 = a3;
  v9 = a5;
  v20 = 0;
  -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", a4, 0, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") != 1)
  {
    if ((unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v8, "length"), v9);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v17 = (void *)v18;
      goto LABEL_8;
    }
LABEL_6:
    v18 = objc_msgSend(v8, "copy");
    goto LABEL_7;
  }
  v12 = objc_msgSend(v10, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  v14 = v12;
  v15 = v13;
  v16 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, v14, v15, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v17;
}

- (id)matchFirstByRegex:(id)a3 regex:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v11 = 0;
  v6 = a3;
  -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", a4, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)matchesByRegex:(id)a3 regex:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v6 = a3;
  -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", a4, 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)matchedStringByRegex:(id)a3 regex:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_NBPhoneNumberUtil matchesByRegex:regex:](self, "matchesByRegex:regex:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "range", (_QWORD)v18);
        objc_msgSend(v6, "substringWithRange:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)isStartingStringByRegex:(id)a3 regex:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0;
  -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", a4, 0, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "range", (_QWORD)v14))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)stringByReplacingOccurrencesString:(id)a3 withMap:(id)a4 removeNonMatches:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int16 v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v10 = objc_msgSend(v7, "length");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    while (1)
    {
      v18 = 0;
      v18 = objc_msgSend(v7, "characterAtIndex:", v12);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        break;
      if (!a5)
      {
        v15 = v9;
        v16 = v13;
        goto LABEL_7;
      }
LABEL_8:

      if (v11 == ++v12)
        goto LABEL_9;
    }
    v15 = v9;
    v16 = v14;
LABEL_7:
    objc_msgSend(v15, "appendString:", v16);
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (BOOL)isAllDigits:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "decimalDigitCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)getNationalSignificantNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "nationalNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "italianLeadingZero"))
  {
    objc_msgSend(v3, "numberOfLeadingZeros");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "integerValue") < 0)
    {
      objc_msgSend(&stru_24C39D888, "stringByPaddingToLength:withString:startingAtIndex:", 0, CFSTR("0"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "numberOfLeadingZeros");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&stru_24C39D888, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v7, "integerValue"), CFSTR("0"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "nationalNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

+ (void)initialize
{
  void *v2;
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____NBPhoneNumberUtil;
  objc_msgSendSuper2(&v3, sel_initialize);
  v2 = (void *)GEO_MOBILE_COUNTRIES;
  GEO_MOBILE_COUNTRIES = (uint64_t)&unk_24C3B8550;

}

- (_NBPhoneNumberUtil)init
{
  _NBPhoneNumberUtil *v2;
  NSLock *v3;
  NSLock *lockPatternCache;
  NSLock *v5;
  NSLock *entireStringCacheLock;
  _NBMetadataHelper *v7;
  _NBMetadataHelper *helper;
  _NBRegExMatcher *v9;
  _NBRegExMatcher *matcher;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NBPhoneNumberUtil;
  v2 = -[_NBPhoneNumberUtil init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lockPatternCache = v2->_lockPatternCache;
    v2->_lockPatternCache = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    entireStringCacheLock = v2->_entireStringCacheLock;
    v2->_entireStringCacheLock = v5;

    v7 = objc_alloc_init(_NBMetadataHelper);
    helper = v2->_helper;
    v2->_helper = v7;

    v9 = objc_alloc_init(_NBRegExMatcher);
    matcher = v2->_matcher;
    v2->_matcher = v9;

    -[_NBPhoneNumberUtil initRegularExpressionSet](v2, "initRegularExpressionSet");
    -[_NBPhoneNumberUtil initNormalizationMappings](v2, "initNormalizationMappings");
  }
  return v2;
}

- (void)initRegularExpressionSet
{
  id v3;
  void *v4;
  NSRegularExpression *v5;
  NSRegularExpression *CAPTURING_DIGIT_PATTERN;
  NSRegularExpression *v7;
  id v8;
  NSRegularExpression *VALID_ALPHA_PHONE_PATTERN;
  id v10;
  id v11;

  if (self->_CAPTURING_DIGIT_PATTERN)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("([%@])"), 0x24C39F268);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", v4, 0, &v11);
    v5 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v3 = v11;
    CAPTURING_DIGIT_PATTERN = self->_CAPTURING_DIGIT_PATTERN;
    self->_CAPTURING_DIGIT_PATTERN = v5;

  }
  if (!self->_VALID_ALPHA_PHONE_PATTERN)
  {
    v10 = v3;
    -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", CFSTR("(?:.*?[A-Za-z]){3}.*"), 0, &v10);
    v7 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    VALID_ALPHA_PHONE_PATTERN = self->_VALID_ALPHA_PHONE_PATTERN;
    self->_VALID_ALPHA_PHONE_PATTERN = v7;

    v3 = v8;
  }
  if (initRegularExpressionSet_onceToken != -1)
    dispatch_once(&initRegularExpressionSet_onceToken, &__block_literal_global_10);

}

- (NSDictionary)DIGIT_MAPPINGS
{
  if (qword_253EC0AE8 != -1)
    dispatch_once(&qword_253EC0AE8, &__block_literal_global_82);
  return (NSDictionary *)(id)qword_253EC0AF0;
}

- (void)initNormalizationMappings
{
  if (initNormalizationMappings_onceToken != -1)
    dispatch_once(&initNormalizationMappings_onceToken, &__block_literal_global_199);
}

- (id)extractPossibleNumber:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  __CFString *v7;
  int v8;
  uint64_t v9;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v4, qword_253EC0AB8);
  if ((v5 & 0x80000000) != 0)
  {
    v7 = &stru_24C39D888;
  }
  else
  {
    objc_msgSend(v4, "substringFromIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v6, qword_253EC0AC8, &stru_24C39D888);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v8 = -[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v7, qword_253EC0AC0);
    if (v8 >= 1)
    {
      -[__CFString substringWithRange:](v7, "substringWithRange:", 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (__CFString *)v9;
    }
  }

  return v7;
}

- (BOOL)isViablePhoneNumber:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "length") >= 2
    && -[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", qword_253EC0AE0, v4);

  return v5;
}

- (id)normalize:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", CFSTR("(?:.*?[A-Za-z]){3}.*"), v4))
    -[_NBPhoneNumberUtil normalizeHelper:normalizationReplacements:removeNonMatches:](self, "normalizeHelper:normalizationReplacements:removeNonMatches:", v4, qword_253EC0B00, 1);
  else
    -[_NBPhoneNumberUtil normalizeDigitsOnly:](self, "normalizeDigitsOnly:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)normalizeSB:(id *)a3
{
  if (a3)
  {
    -[_NBPhoneNumberUtil normalize:](self, "normalize:", *a3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)normalizeDigitsOnly:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil DIGIT_MAPPINGS](self, "DIGIT_MAPPINGS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil stringByReplacingOccurrencesString:withMap:removeNonMatches:](self, "stringByReplacingOccurrencesString:withMap:removeNonMatches:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)normalizeDiallableCharsOnly:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil stringByReplacingOccurrencesString:withMap:removeNonMatches:](self, "stringByReplacingOccurrencesString:withMap:removeNonMatches:", v4, qword_253EC0AF8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)convertAlphaCharactersInNumber:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil stringByReplacingOccurrencesString:withMap:removeNonMatches:](self, "stringByReplacingOccurrencesString:withMap:removeNonMatches:", v4, qword_253EC0B00, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)getLengthOfGeographicalAreaCode:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  LODWORD(self) = -[_NBPhoneNumberUtil getLengthOfGeographicalAreaCode:](self, "getLengthOfGeographicalAreaCode:", v5);

  return (int)self;
}

- (int)getLengthOfGeographicalAreaCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  -[_NBPhoneNumberUtil getRegionCodeForNumber:](self, "getRegionCodeForNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getMetadataForRegion:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  objc_msgSend(v7, "nationalPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else if ((objc_msgSend(v4, "italianLeadingZero") & 1) == 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!-[_NBPhoneNumberUtil isNumberGeographical:](self, "isNumberGeographical:", v4))
    goto LABEL_7;
  v9 = -[_NBPhoneNumberUtil getLengthOfNationalDestinationCode:](self, "getLengthOfNationalDestinationCode:", v4);
LABEL_8:

  return v9;
}

- (int)getLengthOfNationalDestinationCode:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  LODWORD(self) = -[_NBPhoneNumberUtil getLengthOfNationalDestinationCode:](self, "getLengthOfNationalDestinationCode:", v5);

  return (int)self;
}

- (int)getLengthOfNationalDestinationCode:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v5);

  if (v6)
  {
    v7 = (id)objc_msgSend(v4, "copy");
    objc_msgSend(v7, "setExtension:", 0);
  }
  else
  {
    v7 = v4;
  }
  -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil componentsSeparatedByRegex:regex:](self, "componentsSeparatedByRegex:regex:", v8, CFSTR("\\D+"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      objc_msgSend(v10, "removeObjectAtIndex:", 0);
  }
  if ((unint64_t)objc_msgSend(v10, "count") >= 3)
  {
    objc_msgSend(v4, "countryCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
LABEL_11:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "isEqualToString:", CFSTR("AR"), (_QWORD)v23) & 1) != 0)
          break;
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v18)
            goto LABEL_11;
          goto LABEL_17;
        }
      }

      if (-[_NBPhoneNumberUtil getNumberType:](self, "getNumberType:", v4) != 1)
        goto LABEL_20;
      objc_msgSend(v10, "objectAtIndex:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v21, "length") + 1;
    }
    else
    {
LABEL_17:

LABEL_20:
      objc_msgSend(v10, "objectAtIndex:", 1, (_QWORD)v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v21, "length");
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)getCountryMobileTokenFromCountryCode:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = (void *)qword_253EC0B10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_24C39D888;

  return v6;
}

- (id)normalizeHelper:(id)a3 normalizationReplacements:(id)a4 removeNonMatches:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "length");
  v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (v9)
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v7, "substringWithRange:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uppercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        break;
      if (!a5)
      {
        v15 = v10;
        v16 = v12;
        goto LABEL_7;
      }
LABEL_8:

      if (v9 == ++v11)
        goto LABEL_9;
    }
    v15 = v10;
    v16 = v14;
LABEL_7:
    objc_msgSend(v15, "appendString:", v16);
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (BOOL)formattingRuleHasFirstGroupOnly:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v4, CFSTR("^\\(?\\$1\\)?"));
  v6 = objc_msgSend(v4, "length");

  if (v6)
    v7 = v5 < 0;
  else
    v7 = 0;
  return !v7;
}

- (BOOL)isNumberGeographical:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;

  v4 = a3;
  v5 = -[_NBPhoneNumberUtil getNumberType:](self, "getNumberType:", v4);
  v6 = (void *)GEO_MOBILE_COUNTRIES;
  objc_msgSend(v4, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "containsObject:", v7);
  if (v5 == 1)
    v9 = v8;
  else
    v9 = 0;
  return (v5 | 2) == 2 || v9;
}

- (BOOL)isValidRegionCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v4) && isNan(v4))
  {
    -[_NBPhoneNumberUtil helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getMetadataForRegion:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasValidCountryCallingCode:(id)a3
{
  void *v3;
  BOOL v4;

  +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)format:(id)a3 numberFormat:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)format:(id)a3 numberFormat:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;

  v6 = a3;
  objc_msgSend(v6, "nationalNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToNumber:", &unk_24C3B8508))
    goto LABEL_4;
  objc_msgSend(v6, "rawInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v8);

  if (!v9)
    goto LABEL_5;
  objc_msgSend(v6, "rawInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v7))
  {
LABEL_4:

LABEL_5:
    objc_msgSend(v6, "countryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      if (-[_NBPhoneNumberUtil hasValidCountryCallingCode:](self, "hasValidCountryCallingCode:", v10))
      {
        +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil maybeGetFormattedExtension:metadata:numberFormat:](self, "maybeGetFormattedExtension:metadata:numberFormat:", v6, v13, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil formatNsn:metadata:phoneNumberFormat:carrierCode:](self, "formatNsn:metadata:phoneNumberFormat:carrierCode:", v11, v13, a4, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:](self, "prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:", v10, a4, v15, v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
      v16 = v11;
    }
    else
    {
      -[_NBPhoneNumberUtil prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:](self, "prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:", v10, 0, v11, &stru_24C39D888);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v16;
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (id)formatByPattern:(id)a3 numberFormat:(int64_t)a4 userDefinedFormats:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a3;
  v10 = a5;
  -[_NBPhoneNumberUtil formatByPattern:numberFormat:userDefinedFormats:](self, "formatByPattern:numberFormat:userDefinedFormats:", v9, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)formatByPattern:(id)a3 numberFormat:(int64_t)a4 userDefinedFormats:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  void *v31;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_NBPhoneNumberUtil hasValidCountryCallingCode:](self, "hasValidCountryCallingCode:", v10))
  {
    +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "count"))
    {
      objc_msgSend(v13, "objectAtIndex:", 0);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v30 = (void *)v14;
    -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v10, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil chooseFormattingPatternForNumber:nationalNumber:](self, "chooseFormattingPatternForNumber:nationalNumber:", v9, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v31 = v13;
    if (v17)
    {
      v29 = v9;
      v19 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v18, "nationalPrefixFormattingRule");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v20, "length"))
      {
        objc_msgSend(v16, "nationalPrefix");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length"))
        {
          -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v20, CFSTR("\\$NP"), v21);
          v28 = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v22, CFSTR("\\$FG"), CFSTR("\\$1"));
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v21 = v28;
          v23 = v19;
          v24 = v20;
        }
        else
        {
          v24 = &stru_24C39D888;
          v23 = v19;
        }
        objc_msgSend(v23, "setNationalPrefixFormattingRule:", v24, v28);

      }
      -[_NBPhoneNumberUtil formatNsnUsingPattern:formattingPattern:numberFormat:carrierCode:](self, "formatNsnUsingPattern:formattingPattern:numberFormat:carrierCode:", v11, v19, a4, 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v29;
    }
    else
    {
      v25 = v11;
    }
    -[_NBPhoneNumberUtil maybeGetFormattedExtension:metadata:numberFormat:](self, "maybeGetFormattedExtension:metadata:numberFormat:", v8, v16, a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:](self, "prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:", v10, a4, v25, v26);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v11;
  }

  return v15;
}

- (id)formatNationalNumberWithCarrierCode:(id)a3 carrierCode:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  -[_NBPhoneNumberUtil formatNationalNumberWithCarrierCode:carrierCode:](self, "formatNationalNumberWithCarrierCode:carrierCode:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formatNationalNumberWithCarrierCode:(id)a3 carrierCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_NBPhoneNumberUtil hasValidCountryCallingCode:](self, "hasValidCountryCallingCode:", v8))
  {
    -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil maybeGetFormattedExtension:metadata:numberFormat:](self, "maybeGetFormattedExtension:metadata:numberFormat:", v6, v11, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil formatNsn:metadata:phoneNumberFormat:carrierCode:](self, "formatNsn:metadata:phoneNumberFormat:carrierCode:", v9, v11, 2, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:](self, "prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:", v8, 2, v13, v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v9;
  }

  return v14;
}

- (id)getMetadataForRegionOrCallingCode:(id)a3 regionCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[_NBPhoneNumberUtil helper](self, "helper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", 0x24C39F288) & 1) != 0)
    objc_msgSend(v8, "getMetadataForNonGeographicalRegion:", v6);
  else
    objc_msgSend(v8, "getMetadataForRegion:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formatNationalNumberWithPreferredCarrierCode:(id)a3 fallbackCarrierCode:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  -[_NBPhoneNumberUtil formatNationalNumberWithCarrierCode:carrierCode:](self, "formatNationalNumberWithCarrierCode:carrierCode:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formatNationalNumberWithPreferredCarrierCode:(id)a3 fallbackCarrierCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "preferredDomesticCarrierCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "preferredDomesticCarrierCode");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  -[_NBPhoneNumberUtil formatNationalNumberWithCarrierCode:carrierCode:](self, "formatNationalNumberWithCarrierCode:carrierCode:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)formatNumberForMobileDialing:(id)a3 regionCallingFrom:(id)a4 withFormatting:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;

  v6 = a5;
  v9 = a3;
  v10 = a4;
  -[_NBPhoneNumberUtil formatNumberForMobileDialing:regionCallingFrom:withFormatting:](self, "formatNumberForMobileDialing:regionCallingFrom:withFormatting:", v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)formatNumberForMobileDialing:(id)a3 regionCallingFrom:(id)a4 withFormatting:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  _NBPhoneNumberUtil *v19;
  void *v20;
  uint64_t v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_NBPhoneNumberUtil hasValidCountryCallingCode:](self, "hasValidCountryCallingCode:", v10))
  {
    v11 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v11, "setExtension:", &stru_24C39D888);
    -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v12))
    {
      if (-[_NBPhoneNumberUtil canBeInternationallyDialled:](self, "canBeInternationallyDialled:", v11))
      {
        -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v11, v5);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v15 = &stru_24C39D888;
LABEL_28:

        goto LABEL_29;
      }
      v15 = &stru_24C39D888;
      if (v5)
        goto LABEL_26;
      goto LABEL_16;
    }
    v13 = -[_NBPhoneNumberUtil getNumberType:](self, "getNumberType:", v11);
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("CO")) || v13)
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("BR")) && v13 <= 2)
      {
        objc_msgSend(v11, "preferredDomesticCarrierCode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v17))
        {
          -[_NBPhoneNumberUtil formatNationalNumberWithPreferredCarrierCode:fallbackCarrierCode:](self, "formatNationalNumberWithPreferredCarrierCode:fallbackCarrierCode:", v11, &stru_24C39D888);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = &stru_24C39D888;
        }

        if (v5)
          goto LABEL_26;
        goto LABEL_16;
      }
      if ((objc_msgSend(v10, "unsignedIntegerValue") == 1
         || (objc_msgSend(v12, "isEqualToString:", 0x24C39F288) & 1) != 0
         || objc_msgSend(v12, "isEqualToString:", CFSTR("MX")) && v13 <= 2)
        && -[_NBPhoneNumberUtil canBeInternationallyDialled:](self, "canBeInternationallyDialled:", v11))
      {
        v19 = self;
        v20 = v11;
        v21 = 1;
      }
      else
      {
        v19 = self;
        v20 = v11;
        v21 = 2;
      }
      -[_NBPhoneNumberUtil format:numberFormat:](v19, "format:numberFormat:", v20, v21);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_NBPhoneNumberUtil formatNationalNumberWithCarrierCode:carrierCode:](self, "formatNationalNumberWithCarrierCode:carrierCode:", v11, CFSTR("3"));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (__CFString *)v14;
    if (v5)
    {
LABEL_26:
      v18 = v15;
      v15 = v18;
      goto LABEL_27;
    }
LABEL_16:
    -[_NBPhoneNumberUtil normalizeHelper:normalizationReplacements:removeNonMatches:](self, "normalizeHelper:normalizationReplacements:removeNonMatches:", v15, qword_253EC0AF8, 1);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v16 = v18;
    goto LABEL_28;
  }
  objc_msgSend(v8, "rawInput");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v15))
  {
    objc_msgSend(v8, "rawInput");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_24C39D888;
  }
LABEL_29:

  return v16;
}

- (id)formatOutOfCountryCallingNumber:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  -[_NBPhoneNumberUtil formatOutOfCountryCallingNumber:regionCallingFrom:](self, "formatOutOfCountryCallingNumber:regionCallingFrom:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formatOutOfCountryCallingNumber:(id)a3 regionCallingFrom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _BOOL4 v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  if (-[_NBPhoneNumberUtil isValidRegionCode:](self, "isValidRegionCode:", v7))
  {
    objc_msgSend(v6, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_NBPhoneNumberUtil hasValidCountryCallingCode:](self, "hasValidCountryCallingCode:", v9))
    {
      if (objc_msgSend(v9, "unsignedIntegerValue") == 1)
      {
        if (-[_NBPhoneNumberUtil isNANPACountry:](self, "isNANPACountry:", v7))
        {
          v11 = (void *)MEMORY[0x24BDD17C8];
          -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v6, 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v9, v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
          goto LABEL_22;
        }
LABEL_11:
        -[_NBPhoneNumberUtil helper](self, "helper");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "getMetadataForRegion:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "internationalPrefix");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v18;
        v33 = v19;
        if (-[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", CFSTR("[\\d]+(?:[~\\u2053\\u223C\\uFF5E][\\d]+)?"), v19))
        {
          v20 = v19;
        }
        else
        {
          objc_msgSend(v18, "preferredInternationalPrefix");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v21);

          if (!v22)
          {
            v23 = &stru_24C39D888;
            goto LABEL_17;
          }
          objc_msgSend(v18, "preferredInternationalPrefix");
          v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        v23 = v20;
LABEL_17:
        -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v9);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v9, v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil formatNsn:metadata:phoneNumberFormat:carrierCode:](self, "formatNsn:metadata:phoneNumberFormat:carrierCode:", v10, v24, 1, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil maybeGetFormattedExtension:metadata:numberFormat:](self, "maybeGetFormattedExtension:metadata:numberFormat:", v6, v24, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@%@"), v23, v9, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:](self, "prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:", v9, 1, v25, v26);
        v34 = v10;
        v28 = (__CFString *)v23;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString length](v28, "length"))
          v30 = v27;
        else
          v30 = v29;
        v13 = v30;

        v10 = v34;
        goto LABEL_21;
      }
      -[_NBPhoneNumberUtil getCountryCodeForValidRegion:error:](self, "getCountryCodeForValidRegion:error:", v7, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v9, "isEqualToNumber:", v15);

      if (!v16)
        goto LABEL_11;
      -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v6, 2);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v10;
    }
    v13 = v14;
    goto LABEL_21;
  }
  -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v6, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v13;
}

- (id)prefixNumberWithCountryCallingCode:(id)a3 phoneNumberFormat:(int64_t)a4 formattedNationalNumber:(id)a5 formattedExtension:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@+%@-%@%@"), CFSTR("tel:"), v9, v10, v11);
  }
  else if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+%@ %@%@"), v9, v10, v11, v15);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v10, v11, v14, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+%@%@%@"), v9, v10, v11, v15);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)formatInOriginalFormat:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  -[_NBPhoneNumberUtil formatInOriginalFormat:regionCallingFrom:](self, "formatInOriginalFormat:regionCallingFrom:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formatInOriginalFormat:(id)a3 regionCallingFrom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rawInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v8))
  {
    v9 = -[_NBPhoneNumberUtil hasFormattingPatternForNumber:](self, "hasFormattingPatternForNumber:", v6);

    if (!v9)
    {
      objc_msgSend(v6, "rawInput");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v15 = (id)v10;
      goto LABEL_27;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "countryCodeSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v6, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v6, "countryCodeSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  switch(v13)
  {
    case 10:
      -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v6, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "substringFromIndex:", 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[_NBPhoneNumberUtil formatOutOfCountryCallingNumber:regionCallingFrom:](self, "formatOutOfCountryCallingNumber:regionCallingFrom:", v6, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 1:
      -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v6, 1);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v15 = (id)v14;
      goto LABEL_21;
    default:
      objc_msgSend(v6, "countryCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[_NBPhoneNumberUtil getNddPrefixForRegion:stripNonDigits:](self, "getNddPrefixForRegion:stripNonDigits:", v16, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBPhoneNumberUtil format:numberFormat:](self, "format:numberFormat:", v6, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18
        && objc_msgSend(v18, "length")
        && (objc_msgSend(v6, "rawInput"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = -[_NBPhoneNumberUtil rawInputContainsNationalPrefix:nationalPrefix:regionCode:](self, "rawInputContainsNationalPrefix:nationalPrefix:regionCode:", v20, v18, v16), v20, !v21))
      {
        -[_NBPhoneNumberUtil helper](self, "helper");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "getMetadataForRegion:", v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "numberFormats");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil chooseFormattingPatternForNumber:nationalNumber:](self, "chooseFormattingPatternForNumber:nationalNumber:", v31, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v38 = v29;
          objc_msgSend(v32, "nationalPrefixFormattingRule");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "rangeOfString:", CFSTR("$1"));
          if (v34
            && v34 != 0x7FFFFFFFFFFFFFFFLL
            && (objc_msgSend(v33, "substringWithRange:", 0, v34),
                v35 = (void *)objc_claimAutoreleasedReturnValue(),
                v33,
                -[_NBPhoneNumberUtil normalizeDigitsOnly:](self, "normalizeDigitsOnly:", v35),
                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                v35,
                objc_msgSend(v33, "length")))
          {
            v37 = (void *)objc_msgSend(v32, "copy");
            objc_msgSend(v37, "setNationalPrefixFormattingRule:", 0);
            v39[0] = v37;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[_NBPhoneNumberUtil formatByPattern:numberFormat:userDefinedFormats:](self, "formatByPattern:numberFormat:userDefinedFormats:", v6, 2, v36);
            v15 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v15 = v19;
          }

          v29 = v38;
        }
        else
        {
          v15 = v19;
        }

      }
      else
      {
        v15 = v19;
      }

      break;
  }

LABEL_21:
  objc_msgSend(v6, "rawInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v15 && objc_msgSend(v22, "length"))
  {
    -[_NBPhoneNumberUtil normalizeHelper:normalizationReplacements:removeNonMatches:](self, "normalizeHelper:normalizationReplacements:removeNonMatches:", v15, qword_253EC0AF8, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil normalizeHelper:normalizationReplacements:removeNonMatches:](self, "normalizeHelper:normalizationReplacements:removeNonMatches:", v23, qword_253EC0AF8, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isEqualToString:", v25) & 1) == 0)
    {
      v26 = v23;

      v15 = v26;
    }

  }
LABEL_27:

  return v15;
}

- (BOOL)rawInputContainsNationalPrefix:(id)a3 nationalPrefix:(id)a4 regionCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;

  v8 = a4;
  v9 = a5;
  -[_NBPhoneNumberUtil normalizeDigitsOnly:](self, "normalizeDigitsOnly:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_NBPhoneNumberUtil isStartingStringByRegex:regex:](self, "isStartingStringByRegex:regex:", v10, v8))
    goto LABEL_3;
  objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v8, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v11, v9, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  v14 = -[_NBPhoneNumberUtil isValidNumber:](self, "isValidNumber:", v12);

  if (v13)
LABEL_3:
    v14 = 0;

  return v14;
}

- (BOOL)hasUnexpectedItalianLeadingZero:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;

  v4 = a3;
  if (objc_msgSend(v4, "italianLeadingZero"))
  {
    objc_msgSend(v4, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[_NBPhoneNumberUtil isLeadingZeroPossible:](self, "isLeadingZeroPossible:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasFormattingPatternForNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberFormats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil chooseFormattingPatternForNumber:nationalNumber:](self, "chooseFormattingPatternForNumber:nationalNumber:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10 != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)formatOutOfCountryKeepingAlphaChars:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  -[_NBPhoneNumberUtil formatOutOfCountryKeepingAlphaChars:regionCallingFrom:](self, "formatOutOfCountryKeepingAlphaChars:regionCallingFrom:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formatOutOfCountryKeepingAlphaChars:(id)a3 regionCallingFrom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rawInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    objc_msgSend(v6, "countryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_NBPhoneNumberUtil hasValidCountryCallingCode:](self, "hasValidCountryCallingCode:", v10))
    {
      v11 = v9;
      v18 = v11;
LABEL_29:

      v9 = v11;
      goto LABEL_30;
    }
    -[_NBPhoneNumberUtil normalizeHelper:normalizationReplacements:removeNonMatches:](self, "normalizeHelper:normalizationReplacements:removeNonMatches:", v9, qword_253EC0B08, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "length") >= 4)
    {
      objc_msgSend(v12, "substringWithRange:", 0, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_NBPhoneNumberUtil indexOfStringByString:target:](self, "indexOfStringByString:target:", v11, v13);

      if (v14 != -1)
      {
        objc_msgSend(v11, "substringFromIndex:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v15;
      }
    }
    -[_NBPhoneNumberUtil helper](self, "helper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getMetadataForRegion:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "unsignedIntegerValue") == 1)
    {
      if (-[_NBPhoneNumberUtil isNANPACountry:](self, "isNANPACountry:", v7))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v10, v11);
        v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

        goto LABEL_29;
      }
      if (v17)
        goto LABEL_17;
    }
    else if (v17)
    {
      -[_NBPhoneNumberUtil getCountryCodeForValidRegion:error:](self, "getCountryCodeForValidRegion:error:", v7, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v10, "isEqualToNumber:", v19);

      if (v20)
      {
        objc_msgSend(v17, "numberFormats");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil chooseFormattingPatternForNumber:nationalNumber:](self, "chooseFormattingPatternForNumber:nationalNumber:", v21, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = (void *)objc_msgSend(v22, "copy");
          objc_msgSend(v23, "setPattern:", CFSTR("(\\d+)(.*)"));
          objc_msgSend(v23, "setFormat:", CFSTR("$1$2"));
          -[_NBPhoneNumberUtil formatNsnUsingPattern:formattingPattern:numberFormat:carrierCode:](self, "formatNsnUsingPattern:formattingPattern:numberFormat:carrierCode:", v11, v23, 2, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = v11;
        }

        goto LABEL_28;
      }
LABEL_17:
      objc_msgSend(v17, "internationalPrefix");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v12;
      if (-[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", CFSTR("[\\d]+(?:[~\\u2053\\u223C\\uFF5E][\\d]+)?"), v24))
      {
        v25 = v24;
      }
      else
      {
        objc_msgSend(v17, "preferredInternationalPrefix");
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v26 = v25;

      goto LABEL_22;
    }
    v31 = v12;
    v26 = &stru_24C39D888;
LABEL_22:
    -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v10, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil maybeGetFormattedExtension:metadata:numberFormat:](self, "maybeGetFormattedExtension:metadata:numberFormat:", v6, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v26, "length"))
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@%@"), v26, v10, v11, v29);
    else
      -[_NBPhoneNumberUtil prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:](self, "prefixNumberWithCountryCallingCode:phoneNumberFormat:formattedNationalNumber:formattedExtension:", v10, 1, v11, v29);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v31;
    goto LABEL_28;
  }
  -[_NBPhoneNumberUtil formatOutOfCountryCallingNumber:regionCallingFrom:](self, "formatOutOfCountryCallingNumber:regionCallingFrom:", v6, v7);
  v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v18;
}

- (id)formatNsn:(id)a3 metadata:(id)a4 phoneNumberFormat:(int64_t)a5 carrierCode:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "intlNumberFormats");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (a5 == 2 || !v14)
  {
    objc_msgSend(v11, "numberFormats");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v13;
  }
  v16 = v15;
  -[_NBPhoneNumberUtil chooseFormattingPatternForNumber:nationalNumber:](self, "chooseFormattingPatternForNumber:nationalNumber:", v15, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[_NBPhoneNumberUtil formatNsnUsingPattern:formattingPattern:numberFormat:carrierCode:](self, "formatNsnUsingPattern:formattingPattern:numberFormat:carrierCode:", v10, v17, a5, v12);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v10;
  }
  v19 = v18;

  return v19;
}

- (id)chooseFormattingPatternForNumber:(id)a3 nationalNumber:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  BOOL v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "leadingDigitsPatterns", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          objc_msgSend(v13, "leadingDigitsPatterns");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v7, v17);

          if (v18)
            continue;
        }
        objc_msgSend(v13, "pattern");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", v19, v7);

        if (v20)
        {
          v21 = v13;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_13:

  return v21;
}

- (id)formatNsnUsingPattern:(id)a3 formattingPattern:(id)a4 numberFormat:(int64_t)a5 carrierCode:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "domesticCarrierCodeFormattingRule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 2)
  {
    if (+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v12)
      && objc_msgSend(v14, "length"))
    {
      -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v14, CFSTR("\\$CC"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBPhoneNumberUtil replaceFirstStringByRegex:regex:withTemplate:](self, "replaceFirstStringByRegex:regex:withTemplate:", v13, CFSTR("(\\$\\d)"), v15);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "pattern");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v10, v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v11, "nationalPrefixFormattingRule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v15))
    {
      -[_NBPhoneNumberUtil replaceFirstStringByRegex:regex:withTemplate:](self, "replaceFirstStringByRegex:regex:withTemplate:", v13, CFSTR("(\\$\\d)"), v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pattern");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v10, v20, v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v11, "nationalPrefixFormattingRule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "pattern");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v10, v21, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^%@"), qword_253EC0AD8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v18, v22, &stru_24C39D888);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v15, qword_253EC0AD8, CFSTR("-"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

  return v18;
}

- (id)getExampleNumber:(id)a3 error:(id *)a4
{
  return -[_NBPhoneNumberUtil getExampleNumberForType:type:error:](self, "getExampleNumberForType:type:error:", a3, 0, a4);
}

- (id)getExampleNumberForType:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  if (-[_NBPhoneNumberUtil isValidRegionCode:](self, "isValidRegionCode:", v8))
  {
    -[_NBPhoneNumberUtil helper](self, "helper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getMetadataForRegion:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil getNumberDescByType:type:](self, "getNumberDescByType:type:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "exampleNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v12);

    if ((_DWORD)v9)
    {
      objc_msgSend(v11, "exampleNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v13, v8, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)getExampleNumberForNonGeoEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = a3;
  -[_NBPhoneNumberUtil helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getMetadataForNonGeographicalRegion:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_18;
  objc_msgSend(v8, "mobile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exampleNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v10);

  if (v11)
  {
    objc_msgSend(v8, "mobile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "tollFree");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exampleNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v14);

    if (v15)
    {
      objc_msgSend(v8, "tollFree");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "sharedCost");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "exampleNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v17);

      if (v18)
      {
        objc_msgSend(v8, "sharedCost");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v8, "voip");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "exampleNumber");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v20);

        if (v21)
        {
          objc_msgSend(v8, "voip");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v8, "voicemail");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "exampleNumber");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v23);

          if (v24)
          {
            objc_msgSend(v8, "voicemail");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v8, "uan");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "exampleNumber");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v26);

            if (v27)
            {
              objc_msgSend(v8, "uan");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v8, "premiumRate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "exampleNumber");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v29);

              if (!v30)
              {
LABEL_18:
                v34 = 0;
                goto LABEL_19;
              }
              objc_msgSend(v8, "premiumRate");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
  }
  v31 = v12;
  objc_msgSend(v12, "exampleNumber");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+%@%@"), v6, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v33, 0x24C39F208, a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v34;
}

- (id)maybeGetFormattedExtension:(id)a3 metadata:(id)a4 numberFormat:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v9);

  if (v10)
  {
    if (a5 == 3)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "extension");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR(";ext=");
    }
    else
    {
      objc_msgSend(v8, "preferredExtnPrefix");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v16);

      v11 = (void *)MEMORY[0x24BDD17C8];
      if (v17)
      {
        objc_msgSend(v8, "preferredExtnPrefix");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "extension");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v13, v18);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
        goto LABEL_10;
      }
      objc_msgSend(v7, "extension");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR(" ext. ");
    }
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v14, v12);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v15 = &stru_24C39D888;
LABEL_10:

  return v15;
}

- (id)getNumberDescByType:(id)a3 type:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 0:
    case 2:
      objc_msgSend(v5, "fixedLine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_6;
      objc_msgSend(v6, "fixedLine");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v5, "mobile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_6;
      objc_msgSend(v6, "mobile");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(v5, "tollFree");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(v5, "premiumRate");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(v5, "sharedCost");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(v5, "voip");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(v5, "personalNumber");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      objc_msgSend(v5, "pager");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      objc_msgSend(v5, "uan");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      objc_msgSend(v5, "voicemail");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_6:
      objc_msgSend(v6, "generalDesc");
      v8 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v10 = (void *)v8;

  return v10;
}

- (int64_t)getNumberType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[_NBPhoneNumberUtil getRegionCodeForNumber:](self, "getRegionCodeForNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_NBPhoneNumberUtil getNumberTypeHelper:metadata:](self, "getNumberTypeHelper:metadata:", v8, v7);

  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (int64_t)getNumberTypeHelper:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  int64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  void *v22;
  BOOL v23;
  void *v24;
  BOOL v25;
  void *v26;
  _BOOL4 v27;
  char v28;
  void *v30;
  _BOOL4 v31;
  void *v32;
  _BOOL4 v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "generalDesc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v8))
    goto LABEL_22;
  objc_msgSend(v7, "premiumRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v9);

  if (v10)
  {
    v11 = 4;
    goto LABEL_23;
  }
  objc_msgSend(v7, "tollFree");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v12);

  if (v13)
  {
    v11 = 3;
    goto LABEL_23;
  }
  objc_msgSend(v7, "sharedCost");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v14);

  if (v15)
  {
    v11 = 5;
    goto LABEL_23;
  }
  objc_msgSend(v7, "voip");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v16);

  if (v17)
  {
    v11 = 6;
    goto LABEL_23;
  }
  objc_msgSend(v7, "personalNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v18);

  if (v19)
  {
    v11 = 7;
    goto LABEL_23;
  }
  objc_msgSend(v7, "pager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v20);

  if (v21)
  {
    v11 = 8;
    goto LABEL_23;
  }
  objc_msgSend(v7, "uan");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v22);

  if (v23)
  {
    v11 = 9;
    goto LABEL_23;
  }
  objc_msgSend(v7, "voicemail");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v24);

  if (v25)
  {
    v11 = 10;
    goto LABEL_23;
  }
  objc_msgSend(v7, "fixedLine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v26);

  v28 = objc_msgSend(v7, "sameMobileAndFixedLinePattern");
  if (v27)
  {
    if ((v28 & 1) != 0)
    {
      v11 = 2;
    }
    else
    {
      objc_msgSend(v7, "mobile");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v30);

      if (v31)
        v11 = 2;
      else
        v11 = 0;
    }
    goto LABEL_23;
  }
  if ((v28 & 1) != 0)
  {
LABEL_22:
    v11 = -1;
    goto LABEL_23;
  }
  objc_msgSend(v7, "mobile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v6, v32);

  if (v33)
    v11 = 1;
  else
    v11 = -1;
LABEL_23:

  return v11;
}

- (BOOL)isNumberMatchingDesc:(id)a3 numberDesc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "possibleLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v7, "possibleLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v8);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    objc_msgSend(v7, "nationalNumberPattern");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", v13, v6);

    goto LABEL_6;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (BOOL)isValidNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_NBPhoneNumberUtil getRegionCodeForNumber:](self, "getRegionCodeForNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[_NBPhoneNumberUtil isValidNumberForRegion:regionCode:](self, "isValidNumberForRegion:regionCode:", v4, v5);

  return (char)self;
}

- (BOOL)isValidNumberForRegion:(id)a3 regionCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && ((objc_msgSend(CFSTR("001"), "isEqualToString:", v7) & 1) != 0
     || (-[_NBPhoneNumberUtil getCountryCodeForValidRegion:error:](self, "getCountryCodeForValidRegion:error:", v7, 0),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v9, "isEqualToNumber:", v11),
         v11,
         v12)))
  {
    objc_msgSend(v10, "generalDesc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nationalNumberPattern");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v15);

    if (v16)
      v17 = -[_NBPhoneNumberUtil getNumberTypeHelper:metadata:](self, "getNumberTypeHelper:metadata:", v14, v10) != -1;
    else
      v17 = (unint64_t)(objc_msgSend(v14, "length") - 3) < 0xE;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)getRegionCodeForNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "count"))
    {
      if (objc_msgSend(v7, "count") == 1)
        objc_msgSend(v7, "objectAtIndex:", 0);
      else
        -[_NBPhoneNumberUtil getRegionCodeForNumberFromRegionList:regionCodes:](self, "getRegionCodeForNumberFromRegionList:regionCodes:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getRegionCodeForNumberFromRegionList:(id)a3 regionCodes:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  id v17;

  v6 = a4;
  -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  -[_NBPhoneNumberUtil helper](self, "helper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    for (i = 0; v8 != i; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getMetadataForRegion:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leadingDigits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v13);

      if (v14)
      {
        objc_msgSend(v12, "leadingDigits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v7, v15);

        if (!v16)
          goto LABEL_9;
      }
      else if (-[_NBPhoneNumberUtil getNumberTypeHelper:metadata:](self, "getNumberTypeHelper:metadata:", v7, v12) != -1)
      {
LABEL_9:
        v17 = v11;

        goto LABEL_10;
      }

    }
  }
  v17 = 0;
LABEL_10:

  return v17;
}

- (id)getRegionCodeForCountryCode:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("ZZ");
  }
  v6 = v5;

  return v6;
}

- (id)getRegionCodesForCountryCode:(id)a3
{
  return +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", a3);
}

- (id)getCountryCodeForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  if (-[_NBPhoneNumberUtil isValidRegionCode:](self, "isValidRegionCode:", v4))
  {
    v9 = 0;
    -[_NBPhoneNumberUtil getCountryCodeForValidRegion:error:](self, "getCountryCodeForValidRegion:error:", v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v9)
      v7 = &unk_24C3B8508;
    else
      v7 = v5;

  }
  else
  {
    v7 = &unk_24C3B8508;
  }

  return v7;
}

- (id)getCountryCodeForValidRegion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[_NBPhoneNumberUtil helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getMetadataForRegion:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid region code:%@"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, *MEMORY[0x24BDD0FC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("INVALID_REGION_CODE"), 0, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v9 = &unk_24C3B8520;
  }

  return v9;
}

- (id)getNddPrefixForRegion:(id)a3 stripNonDigits:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a4;
  v6 = a3;
  -[_NBPhoneNumberUtil helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getMetadataForRegion:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "nationalPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      if (v4)
      {
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), &stru_24C39D888);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      v11 = v9;
      v9 = v11;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isNANPACountry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "uppercaseString", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v12, "isEqualToString:", v13);

        v9 |= v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return (v3 != 0) & v9;
}

- (BOOL)isLeadingZeroPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "leadingZeroPossible");
  else
    v7 = 0;

  return v7;
}

- (BOOL)isAlphaNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  id v11;

  v4 = a3;
  if (-[_NBPhoneNumberUtil isViablePhoneNumber:](self, "isViablePhoneNumber:", v4))
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(v5, "copy");
    v11 = v6;
    v7 = -[_NBPhoneNumberUtil maybeStripExtension:](self, "maybeStripExtension:", &v11);
    v8 = v11;

    v9 = -[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", CFSTR("(?:.*?[A-Za-z]){3}.*"), v8);
    v4 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isPossibleNumber:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  LOBYTE(self) = -[_NBPhoneNumberUtil isPossibleNumber:](self, "isPossibleNumber:", v5);

  return (char)self;
}

- (BOOL)isPossibleNumber:(id)a3
{
  return -[_NBPhoneNumberUtil isPossibleNumberWithReason:](self, "isPossibleNumberWithReason:", a3) == 1;
}

- (int64_t)validateNumberLength:(id)a3 metadata:(id)a4
{
  return -[_NBPhoneNumberUtil validateNumberLength:metadata:type:](self, "validateNumberLength:metadata:type:", a3, a4, -1);
}

- (int64_t)validateNumberLength:(id)a3 metadata:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  -[_NBPhoneNumberUtil getNumberDescByType:type:](self, "getNumberDescByType:type:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "possibleLength");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "possibleLength");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "generalDesc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "possibleLength");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "possibleLengthLocalOnly");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 2)
  {
    -[_NBPhoneNumberUtil getNumberDescByType:type:](self, "getNumberDescByType:type:", v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_NBPhoneNumberUtil descHasPossibleNumberData:](self, "descHasPossibleNumberData:", v15);

    if (v16)
    {
      v17 = -[_NBPhoneNumberUtil validateNumberLength:metadata:type:](self, "validateNumberLength:metadata:type:", v8, v9, 1);
      goto LABEL_30;
    }
    -[_NBPhoneNumberUtil getNumberDescByType:type:](self, "getNumberDescByType:type:", v9, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_NBPhoneNumberUtil descHasPossibleNumberData:](self, "descHasPossibleNumberData:", v18))
    {
      objc_msgSend(v18, "possibleLength");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v18, "possibleLength");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v9, "generalDesc");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "possibleLength");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v14, "count");
      objc_msgSend(v18, "possibleLengthLocalOnly");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "sortedArrayUsingSelector:", sel_compare_);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v26;
      }

      v14 = v25;
      v12 = (void *)v23;
    }

  }
  objc_msgSend(v12, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToNumber:", &unk_24C3B8520);

  if ((v28 & 1) != 0)
  {
    v17 = -1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "containsObject:", v29) & 1) != 0)
    {
      v17 = 5;
    }
    else
    {
      objc_msgSend(v12, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "compare:", v29);
      if (v31)
      {
        if (v31 == 1)
        {
          v17 = 3;
        }
        else
        {
          objc_msgSend(v12, "lastObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "compare:", v29);

          if (v33 == -1)
          {
            v17 = 4;
          }
          else
          {
            v17 = 1;
            objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v34, "containsObject:", v29))
              v17 = -1;

          }
        }
      }
      else
      {
        v17 = 1;
      }

    }
  }
LABEL_30:

  return v17;
}

- (int64_t)testNumberLength:(id)a3 desc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "possibleLength");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleLengthLocalOnly");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v10);

  if ((v6 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "unsignedIntegerValue") == v9)
    {
      v11 = 1;
    }
    else if (objc_msgSend(v12, "unsignedIntegerValue") <= v9)
    {
      v13 = objc_msgSend(v7, "count") - 1;
      if (v13 >= objc_msgSend(v7, "count")
        || (objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "integerValue"),
            v14,
            v15 >= v9))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", v16))
          v11 = 1;
        else
          v11 = 4;

      }
      else
      {
        v11 = 4;
      }
    }
    else
    {
      v11 = 3;
    }

  }
  return v11;
}

- (int64_t)isPossibleNumberWithReason:(id)a3 error:(id *)a4
{
  id v5;
  int64_t v6;

  v5 = a3;
  v6 = -[_NBPhoneNumberUtil isPossibleNumberWithReason:](self, "isPossibleNumberWithReason:", v5);

  return v6;
}

- (int64_t)isPossibleNumberWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_NBPhoneNumberUtil hasValidCountryCallingCode:](self, "hasValidCountryCallingCode:", v6))
  {
    -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generalDesc");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_NBPhoneNumberUtil testNumberLength:desc:](self, "testNumberLength:desc:", v5, v9);

  }
  else
  {
    v10 = 2;
  }

  return v10;
}

- (BOOL)isPossibleNumberString:(id)a3 regionDialingFrom:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[_NBPhoneNumberUtil isPossibleNumber:](self, "isPossibleNumber:", v10);
  return (char)self;
}

- (BOOL)truncateTooLongNumber:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[_NBPhoneNumberUtil isValidNumber:](self, "isValidNumber:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v4, "nationalNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      v8 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)(double)(objc_msgSend(v7, "unsignedLongLongValue") / 0xAuLL));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v6, "setNationalNumber:", v9);

      if ((objc_msgSend(v7, "isEqualToNumber:", &unk_24C3B8508) & 1) != 0
        || -[_NBPhoneNumberUtil isPossibleNumberWithReason:](self, "isPossibleNumberWithReason:", v6) == 3)
      {
        break;
      }
      if (-[_NBPhoneNumberUtil isValidNumber:](self, "isValidNumber:", v6))
      {
        objc_msgSend(v4, "setNationalNumber:", v7);
        v5 = 1;
        goto LABEL_9;
      }
    }
    v5 = 0;
LABEL_9:

  }
  return v5;
}

- (id)extractCountryCode:(id)a3 nationalNumber:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
    goto LABEL_13;
  objc_msgSend(v5, "substringToIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("0"));

  if ((v7 & 1) != 0)
    goto LABEL_13;
  v8 = objc_msgSend(v5, "length");
  v9 = objc_msgSend(v5, "hasPrefix:", CFSTR("+"));
  v10 = 3;
  if (v9)
    v10 = 4;
  v11 = v10 >= v8 ? v8 : v10;
  if (v11)
  {
    v12 = 0;
    while (1)
    {
      v13 = v12 + 1;
      objc_msgSend(v5, "substringWithRange:", 0, v12 + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "integerValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_NBMetadataHelper regionCodeFromCountryCode:](_NBMetadataHelper, "regionCodeFromCountryCode:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        if (objc_msgSend(v16, "count"))
          break;
      }

      ++v12;
      if (v11 == v13)
        goto LABEL_13;
    }
    if (a4)
    {
      v19 = *a4;
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "substringFromIndex:", v12 + 1);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v19)
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v19, v21);
      else
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@"), v21, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
LABEL_13:
    v15 = &unk_24C3B8508;
  }

  return v15;
}

- (id)getSupportedRegions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[_NBMetadataHelper CCode2CNMap](_NBMetadataHelper, "CCode2CNMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_384);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)maybeExtractCountryCode:(id)a3 metadata:(id)a4 nationalNumber:(id *)a5 keepRawInput:(BOOL)a6 phoneNumber:(id *)a7 error:(id *)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  int64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  id v46;
  id v47;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = &unk_24C3B8508;
  if (a5 && a7 && objc_msgSend(v14, "length"))
  {
    v17 = (void *)objc_msgSend(v14, "copy");
    if (v15)
    {
      objc_msgSend(v15, "internationalPrefix");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
        v19 = (const __CFString *)v18;
      else
        v19 = CFSTR("NonMatch");
    }
    else
    {
      v19 = &stru_24C39D888;
    }
    v47 = v17;
    v45 = (__CFString *)v19;
    v20 = -[_NBPhoneNumberUtil maybeStripInternationalPrefixAndNormalize:possibleIddPrefix:](self, "maybeStripInternationalPrefixAndNormalize:possibleIddPrefix:", &v47);
    v21 = v47;

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*a7, "setCountryCodeSource:", v22);

    }
    if (v20 != 20)
    {
      if ((unint64_t)objc_msgSend(v21, "length") > 2)
      {
        -[_NBPhoneNumberUtil extractCountryCode:nationalNumber:](self, "extractCountryCode:nationalNumber:", v21, a5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v35, "isEqualToNumber:", &unk_24C3B8508) & 1) != 0)
        {
          v36 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INVALID_COUNTRY_CODE:%@"), v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "dictionaryWithObject:forKey:", v37, *MEMORY[0x24BDD0FC8]);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (a8)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("INVALID_COUNTRY_CODE"), 0, v38);
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }

          v16 = &unk_24C3B8508;
        }
        else
        {
          objc_msgSend(*a7, "setCountryCode:", v35);
          v16 = v35;
        }

      }
      else
      {
        v32 = (void *)MEMORY[0x24BDBCE70];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TOO_SHORT_AFTER_IDD:%@"), v21);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "dictionaryWithObject:forKey:", v33, *MEMORY[0x24BDD0FC8]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (a8)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TOO_SHORT_AFTER_IDD"), 0, v34);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }

        v16 = &unk_24C3B8508;
      }
      goto LABEL_33;
    }
    if (v15)
    {
      objc_msgSend(v15, "countryCode");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "copy");
      if (objc_msgSend(v24, "hasPrefix:", v23))
      {
        v42 = v23;
        v41 = v24;
        objc_msgSend(v24, "substringFromIndex:", objc_msgSend(v23, "length"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "generalDesc");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "nationalNumberPattern");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v25;
        -[_NBPhoneNumberUtil maybeStripNationalPrefixAndCarrierCode:metadata:carrierCode:](self, "maybeStripNationalPrefixAndCarrierCode:metadata:carrierCode:", &v46, v15, 0);
        v26 = v21;
        v27 = v46;

        v40 = v27;
        v28 = v27;
        v21 = v26;
        v29 = (void *)objc_msgSend(v28, "copy");
        if (!-[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", v44, v21)
          && -[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", v44, v29)
          || -[_NBPhoneNumberUtil testNumberLength:desc:](self, "testNumberLength:desc:", v21, v43) == 4)
        {
          objc_msgSend(*a5, "stringByAppendingString:", v29);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 10);
            v30 = v29;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*a7, "setCountryCodeSource:", v31);

            v29 = v30;
          }
          objc_msgSend(*a7, "setCountryCode:", v16);

          goto LABEL_33;
        }

        v24 = v41;
        v23 = v42;
      }

    }
    v16 = &unk_24C3B8508;
    objc_msgSend(*a7, "setCountryCode:", &unk_24C3B8508);
LABEL_33:

  }
  return v16;
}

- (BOOL)descHasPossibleNumberData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  objc_msgSend(v3, "possibleLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v3, "possibleLength");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToNumber:", &unk_24C3B8520) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)parsePrefixAsIdd:(id)a3 sourceString:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_msgSend(*a4, "copy");
    if (-[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v7, v6))
    {
      LOBYTE(a4) = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[_NBPhoneNumberUtil matchesByRegex:regex:](self, "matchesByRegex:regex:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "range");
    objc_msgSend(v7, "substringWithRange:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v12, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRegularExpression matchesInString:options:range:](self->_CAPTURING_DIGIT_PATTERN, "matchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(v15, "objectAtIndex:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "objectAtIndex:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "range");
          objc_msgSend(v13, "substringWithRange:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "length"))
          {
            -[_NBPhoneNumberUtil normalizeDigitsOnly:](self, "normalizeDigitsOnly:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("0"));

            if ((v22 & 1) != 0)
            {

              LOBYTE(a4) = 0;
LABEL_12:

              goto LABEL_13;
            }
          }

        }
      }
    }
    *a4 = (id)objc_msgSend(v13, "copy");
    LOBYTE(a4) = 1;
    goto LABEL_12;
  }
LABEL_14:

  return (char)a4;
}

- (int64_t)maybeStripInternationalPrefixAndNormalize:(id *)a3 possibleIddPrefix:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;

  v6 = a4;
  if (a3 && objc_msgSend(*a3, "length"))
  {
    if (-[_NBPhoneNumberUtil isStartingStringByRegex:regex:](self, "isStartingStringByRegex:regex:", *a3, qword_253EC0AB0))
    {
      -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", *a3, qword_253EC0AB0, &stru_24C39D888);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      *a3 = v7;
      -[_NBPhoneNumberUtil normalize:](self, "normalize:", v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    else
    {
      v9 = (void *)objc_msgSend(v6, "copy");
      -[_NBPhoneNumberUtil normalizeSB:](self, "normalizeSB:", a3);
      if (-[_NBPhoneNumberUtil parsePrefixAsIdd:sourceString:](self, "parsePrefixAsIdd:sourceString:", v9, a3))
        v8 = 5;
      else
        v8 = 20;

    }
  }
  else
  {
    v8 = 20;
  }

  return v8;
}

- (BOOL)maybeStripNationalPrefixAndCarrierCode:(id *)a3 metadata:(id)a4 carrierCode:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;

  v8 = a4;
  if (a3)
  {
    v9 = (void *)objc_msgSend(*a3, "copy");
    v10 = objc_msgSend(v9, "length");
    objc_msgSend(v8, "nationalPrefixForParsing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || !+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v11))
    {
      LOBYTE(a3) = 0;
LABEL_42:

      goto LABEL_43;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^(?:%@)"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    -[_NBPhoneNumberUtil regularExpressionWithPattern:options:error:](self, "regularExpressionWithPattern:options:error:", v12, 0, &v46);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v46;
    objc_msgSend(v13, "matchesInString:options:range:", v9, 0, 0, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14 || !objc_msgSend(v14, "count"))
    {
      LOBYTE(a3) = 0;
      v26 = v45;
LABEL_41:

      goto LABEL_42;
    }
    v38 = v13;
    v39 = v12;
    objc_msgSend(v8, "generalDesc");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nationalNumberPattern");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "range");
    objc_msgSend(v9, "substringWithRange:", v18, v19);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "numberOfRanges") - 1;
    objc_msgSend(v8, "nationalPrefixTransformRule");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v20;
    v37 = v17;
    v22 = objc_msgSend(v17, "rangeAtIndex:", v20);
    v44 = 0;
    v41 = v21;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = v22;
      v25 = v23;
      if (v22 >= objc_msgSend(v9, "length"))
      {
        v44 = 0;
      }
      else
      {
        objc_msgSend(v9, "substringWithRange:", v24, v25);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (v21
      && objc_msgSend(v21, "length")
      && +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v44))
    {
      v12 = v39;
      -[_NBPhoneNumberUtil replaceFirstStringByRegex:regex:withTemplate:](self, "replaceFirstStringByRegex:regex:withTemplate:", v9, v39, v21);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v27 = 0;
    }
    else
    {
      objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v43, "length"));
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v27 = 1;
      v12 = v39;
    }
    if (+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v42)
      && -[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", v42, v9)
      && !-[_NBPhoneNumberUtil matchesEntirely:string:](self, "matchesEntirely:string:", v42, v40))
    {
      LOBYTE(a3) = 0;
      v29 = v37;
      v13 = v38;
      v26 = v45;
      v34 = v40;
      goto LABEL_40;
    }
    if (v36)
      v28 = v27;
    else
      v28 = 0;
    if (v28 == 1)
    {
      if (!+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v44))
      {
        v33 = +[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v43);
        v29 = v37;
        v13 = v38;
        v26 = v45;
        if (!a5)
          goto LABEL_39;
        if (!v33)
          goto LABEL_39;
        v31 = *a5;
        if (!*a5)
          goto LABEL_39;
        v32 = v43;
        goto LABEL_38;
      }
      v29 = v37;
      v13 = v38;
      v26 = v45;
      if (!a5)
        goto LABEL_39;
    }
    else
    {
      if (v36 < 2)
        v30 = 1;
      else
        v30 = v27;
      v29 = v37;
      v13 = v38;
      v26 = v45;
      if (!a5 || (v30 & 1) != 0)
        goto LABEL_39;
    }
    v31 = *a5;
    if (!*a5)
    {
LABEL_39:
      v34 = v40;
      *a3 = objc_retainAutorelease(v40);
      LOBYTE(a3) = 1;
LABEL_40:

      goto LABEL_41;
    }
    v32 = v44;
LABEL_38:
    objc_msgSend(v31, "stringByAppendingString:", v32);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
LABEL_43:

  return (char)a3;
}

- (id)maybeStripExtension:(id *)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;

  if (a3)
  {
    v5 = (void *)objc_msgSend(*a3, "copy");
    v6 = -[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v5, qword_253EC0AD0);
    if ((v6 & 0x80000000) != 0
      || (v7 = v6,
          objc_msgSend(v5, "substringWithRange:", 0, v6),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = -[_NBPhoneNumberUtil isViablePhoneNumber:](self, "isViablePhoneNumber:", v8),
          v8,
          !v9))
    {
      v18 = &stru_24C39D888;
    }
    else
    {
      -[_NBPhoneNumberUtil matchFirstByRegex:regex:](self, "matchFirstByRegex:regex:", v5, qword_253EC0AD0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfRanges");
      if (v11 < 2)
      {
        v18 = &stru_24C39D888;
      }
      else
      {
        v12 = v11;
        v13 = 1;
        while (1)
        {
          v14 = objc_msgSend(v10, "rangeAtIndex:", v13);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v16 = v14;
            v17 = v15;
            if (v14 < objc_msgSend(v5, "length"))
              break;
          }
          if (v12 == ++v13)
          {
            v18 = &stru_24C39D888;
            goto LABEL_14;
          }
        }
        objc_msgSend(*a3, "substringWithRange:", v16, v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "substringWithRange:", 0, v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = &stru_24C39D888;
        objc_msgSend(&stru_24C39D888, "stringByAppendingString:", v19);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_14:

    }
  }
  else
  {
    v18 = &stru_24C39D888;
  }
  return v18;
}

- (BOOL)checkRegionForParsing:(id)a3 defaultRegion:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[_NBPhoneNumberUtil isValidRegionCode:](self, "isValidRegionCode:", a4))
    v7 = 1;
  else
    v7 = v6
      && objc_msgSend(v6, "length")
      && -[_NBPhoneNumberUtil isStartingStringByRegex:regex:](self, "isStartingStringByRegex:regex:", v6, qword_253EC0AB0);

  return v7;
}

- (id)parse:(id)a3 defaultRegion:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  v13 = 0;
  -[_NBPhoneNumberUtil parseHelper:defaultRegion:keepRawInput:checkRegion:error:](self, "parseHelper:defaultRegion:keepRawInput:checkRegion:error:", a3, a4, 0, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (a5 && v8)
  {
    objc_msgSend(v8, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumberUtil errorWithObject:withDomain:](self, "errorWithObject:withDomain:", v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)parseWithPhoneCarrierRegion:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil countryCodeByCarrier](self, "countryCodeByCarrier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("ZZ"), "isEqualToString:", v7))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v6, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CTTelephonyNetworkInfo)telephonyNetworkInfo
{
  if (qword_253EC0B18 != -1)
    dispatch_once(&qword_253EC0B18, &__block_literal_global_398);
  return (CTTelephonyNetworkInfo *)(id)qword_253EC0B20;
}

- (id)countryCodeByCarrier
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  -[_NBPhoneNumberUtil telephonyNetworkInfo](self, "telephonyNetworkInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriberCellularProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isoCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    v5 = CFSTR("ZZ");

    v4 = v5;
  }
  return v4;
}

- (id)parseAndKeepRawInput:(id)a3 defaultRegion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (!-[_NBPhoneNumberUtil isValidRegionCode:](self, "isValidRegionCode:", v9)
    && objc_msgSend(v8, "length")
    && (objc_msgSend(v8, "hasPrefix:", CFSTR("+")) & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid country code:%@"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, *MEMORY[0x24BDD0FC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("INVALID_COUNTRY_CODE"), 0, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  -[_NBPhoneNumberUtil parseHelper:defaultRegion:keepRawInput:checkRegion:error:](self, "parseHelper:defaultRegion:keepRawInput:checkRegion:error:", v8, v9, 1, 1, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setItalianLeadingZerosForPhoneNumber:(id)a3 phoneNumber:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if ((unint64_t)objc_msgSend(v10, "length") >= 2)
  {
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("0")))
    {
      objc_msgSend(v5, "setItalianLeadingZero:", 1);
      if ((unint64_t)(objc_msgSend(v10, "length") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v6 = 1;
        while (1)
        {
          objc_msgSend(v10, "substringWithRange:", v6, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("0"));

          if (!v8)
            break;
          if (++v6 >= (unint64_t)(objc_msgSend(v10, "length") - 1))
            goto LABEL_9;
        }
        if (v6 == 1)
          goto LABEL_10;
LABEL_9:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setNumberOfLeadingZeros:", v9);

      }
    }
  }
LABEL_10:

}

- (id)parseHelper:(id)a3 defaultRegion:(id)a4 keepRawInput:(BOOL)a5 checkRegion:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _NBPhoneNumber *v17;
  __CFString *v18;
  _NBPhoneNumber *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __CFString *v28;
  _NBPhoneNumber *v29;
  id v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  uint64_t v44;
  _NBPhoneNumberUtil *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  __CFString *v60;
  int64_t v61;
  __CFString *v62;
  __CFString *v63;
  void *v64;
  unint64_t v65;
  __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v71;
  void *v72;
  _NBPhoneNumber *v73;
  _NBPhoneNumber *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  __CFString *v81;
  void *v82;
  __CFString *v83;
  id v84;
  __CFString *v85;
  id v86;
  _NBPhoneNumber *v87;
  __CFString *v88;
  id v89;
  _NBPhoneNumber *v90;
  __CFString *v91;
  __CFString *v92;
  id v93[2];

  v8 = a6;
  v9 = a5;
  v12 = a4;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", 0x24C39F228, CFSTR(" "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((unint64_t)objc_msgSend(v13, "length") >= 0xFB)
    {
      if (a7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TOO_LONG:%@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("TOO_LONG");
LABEL_7:
        -[_NBPhoneNumberUtil errorWithObject:withDomain:](self, "errorWithObject:withDomain:", v15, v16);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      goto LABEL_8;
    }
    v93[0] = &stru_24C39D888;
    -[_NBPhoneNumberUtil buildNationalNumberForParsing:nationalNumber:](self, "buildNationalNumberForParsing:nationalNumber:", v14, v93);
    v18 = (__CFString *)v93[0];
    if (-[_NBPhoneNumberUtil isViablePhoneNumber:](self, "isViablePhoneNumber:", v18))
    {
      if (!v8
        || -[_NBPhoneNumberUtil checkRegionForParsing:defaultRegion:](self, "checkRegionForParsing:defaultRegion:", v18, v12))
      {
        v19 = objc_alloc_init(_NBPhoneNumber);
        if (v9)
        {
          v20 = (void *)objc_msgSend(v14, "copy");
          -[_NBPhoneNumber setRawInput:](v19, "setRawInput:", v20);

        }
        v92 = v18;
        -[_NBPhoneNumberUtil maybeStripExtension:](self, "maybeStripExtension:", &v92);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v92;

        if (objc_msgSend(v21, "length"))
        {
          v23 = (void *)objc_msgSend(v21, "copy");
          -[_NBPhoneNumber setExtension:](v19, "setExtension:", v23);

        }
        v80 = v21;
        -[_NBPhoneNumberUtil helper](self, "helper");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "getMetadataForRegion:", v12);
        v25 = objc_claimAutoreleasedReturnValue();

        v81 = v22;
        v26 = (void *)-[__CFString copy](v22, "copy");
        v91 = &stru_24C39D888;
        v89 = 0;
        v90 = v19;
        v82 = (void *)v25;
        -[_NBPhoneNumberUtil maybeExtractCountryCode:metadata:nationalNumber:keepRawInput:phoneNumber:error:](self, "maybeExtractCountryCode:metadata:nationalNumber:keepRawInput:phoneNumber:error:", v26, v25, &v91, v9, &v90, &v89);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v91;
        v29 = v90;

        v30 = v89;
        v76 = v30;
        if (v30)
        {
          v75 = v28;
          objc_msgSend(v30, "domain");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "isEqualToString:", CFSTR("INVALID_COUNTRY_CODE")))
          {
            v32 = -[_NBPhoneNumberUtil stringPositionByRegex:regex:](self, "stringPositionByRegex:regex:", v26, qword_253EC0AB0);

            if ((v32 & 0x80000000) == 0)
            {
              -[_NBPhoneNumberUtil replaceStringByRegex:regex:withTemplate:](self, "replaceStringByRegex:regex:withTemplate:", v26, qword_253EC0AB0, &stru_24C39D888);
              v33 = objc_claimAutoreleasedReturnValue();

              v87 = v29;
              v88 = v75;
              v86 = 0;
              v72 = (void *)v33;
              -[_NBPhoneNumberUtil maybeExtractCountryCode:metadata:nationalNumber:keepRawInput:phoneNumber:error:](self, "maybeExtractCountryCode:metadata:nationalNumber:keepRawInput:phoneNumber:error:", v33, v82, &v88, v9, &v87, &v86);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v88;

              v73 = v87;
              v36 = v86;

              if (objc_msgSend(v34, "isEqualToNumber:", &unk_24C3B8508))
              {
                v37 = v36;
                if (!a7)
                {
                  v26 = v72;
                  v29 = v73;
                  v41 = v37;
                  goto LABEL_33;
                }
                objc_msgSend(v76, "description");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "domain");
                v39 = v34;
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[_NBPhoneNumberUtil errorWithObject:withDomain:](self, "errorWithObject:withDomain:", v38, v40);
                *a7 = (id)objc_claimAutoreleasedReturnValue();

                v34 = v39;
                v26 = v72;
                v29 = v73;
                v41 = v37;
LABEL_32:

LABEL_33:
                v17 = 0;
                v46 = v35;
                v27 = v34;
                v47 = v76;
LABEL_67:

                v64 = v26;
                v35 = v46;
                v52 = v27;
                v43 = v80;
                v48 = v82;
                goto LABEL_68;
              }

              v43 = v80;
              v29 = v73;
LABEL_36:

              v48 = v82;
              v74 = v29;
              if ((objc_msgSend(v34, "isEqualToNumber:", &unk_24C3B8508) & 1) != 0)
              {
                v77 = v34;
                v85 = v81;
                -[_NBPhoneNumberUtil normalizeSB:](self, "normalizeSB:", &v85);
                v49 = v85;

                -[__CFString stringByAppendingString:](v35, "stringByAppendingString:", v49);
                v50 = objc_claimAutoreleasedReturnValue();

                if (v12)
                {
                  objc_msgSend(v82, "countryCode");
                  v51 = objc_claimAutoreleasedReturnValue();

                  -[_NBPhoneNumber setCountryCode:](v74, "setCountryCode:", v51);
                  v81 = v49;
                  v35 = (__CFString *)v50;
                  v52 = (void *)v51;
                  v48 = v82;
                }
                else
                {
                  if (v9)
                    -[_NBPhoneNumber clearCountryCodeSource](v74, "clearCountryCodeSource");
                  v81 = v49;
                  v35 = (__CFString *)v50;
                  v52 = v77;
                }
              }
              else
              {
                -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v34);
                v53 = objc_claimAutoreleasedReturnValue();
                v54 = v34;
                v55 = (void *)v53;
                v56 = v54;
                if ((id)v53 != v12)
                {
                  -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:");
                  v78 = objc_claimAutoreleasedReturnValue();

                  v48 = (void *)v78;
                }

                v52 = v56;
              }
              if ((unint64_t)-[__CFString length](v35, "length") <= 1)
              {
                v29 = v74;
                if (!a7)
                {
                  v17 = 0;
                  v64 = v72;
LABEL_68:

                  v18 = v81;
                  goto LABEL_69;
                }
                v82 = v48;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TOO_SHORT_NSN:%@"), v35);
                v57 = objc_claimAutoreleasedReturnValue();
                -[_NBPhoneNumberUtil errorWithObject:withDomain:](self, "errorWithObject:withDomain:", v57, CFSTR("TOO_SHORT_NSN"));
                v17 = 0;
                *a7 = (id)objc_claimAutoreleasedReturnValue();
                v26 = v72;
                v46 = v35;
                v47 = (void *)v57;
                goto LABEL_62;
              }
              if (v48)
              {
                v79 = v52;
                v58 = (void *)-[__CFString copy](v35, "copy");
                v83 = &stru_24C39D888;
                v84 = v58;
                -[_NBPhoneNumberUtil maybeStripNationalPrefixAndCarrierCode:metadata:carrierCode:](self, "maybeStripNationalPrefixAndCarrierCode:metadata:carrierCode:", &v84, v48, &v83);
                v59 = v84;

                v60 = v83;
                v61 = -[_NBPhoneNumberUtil validateNumberLength:metadata:](self, "validateNumberLength:metadata:", v59, v48);
                if ((unint64_t)(v61 + 1) <= 6 && ((1 << (v61 + 1)) & 0x51) != 0)
                {
                  v62 = v35;
                }
                else
                {
                  v62 = (__CFString *)v59;

                  if (v9)
                  {
                    v71 = (void *)-[__CFString copy](v60, "copy");
                    -[_NBPhoneNumber setPreferredDomesticCarrierCode:](v74, "setPreferredDomesticCarrierCode:", v71);

                  }
                }

                v29 = v74;
                v52 = v79;
                v63 = v62;
              }
              else
              {
                v63 = v35;
                v29 = v74;
              }
              v75 = v63;
              v47 = (void *)-[__CFString copy](v63, "copy");
              v65 = objc_msgSend(v47, "length");
              v82 = v48;
              if (v65 > 1)
              {
                if (v65 < 0x11)
                {
                  -[_NBPhoneNumberUtil setItalianLeadingZerosForPhoneNumber:phoneNumber:](self, "setItalianLeadingZerosForPhoneNumber:phoneNumber:", v47, v29);
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v47, "longLongValue"));
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_NBPhoneNumber setNationalNumber:](v29, "setNationalNumber:", v69);

                  v17 = v29;
                  goto LABEL_65;
                }
                if (a7)
                {
                  v66 = v75;
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TOO_LONG:%@"), v75);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = CFSTR("TOO_LONG");
                  goto LABEL_61;
                }
              }
              else if (a7)
              {
                v66 = v75;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TOO_SHORT_NSN:%@"), v75);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = CFSTR("TOO_SHORT_NSN");
LABEL_61:
                -[_NBPhoneNumberUtil errorWithObject:withDomain:](self, "errorWithObject:withDomain:", v67, v68);
                *a7 = (id)objc_claimAutoreleasedReturnValue();
                v46 = v66;

                v17 = 0;
                v26 = v72;
LABEL_62:
                v27 = v52;
                goto LABEL_67;
              }
              v17 = 0;
LABEL_65:
              v26 = v72;
              v27 = v52;
              goto LABEL_66;
            }
          }
          else
          {

          }
          if (a7)
          {
            objc_msgSend(v76, "description");
            v44 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "domain");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = self;
            v41 = (void *)v44;
            -[_NBPhoneNumberUtil errorWithObject:withDomain:](v45, "errorWithObject:withDomain:", v44, v38);
            *a7 = (id)objc_claimAutoreleasedReturnValue();
            v35 = v75;
            v34 = v27;
            goto LABEL_32;
          }
          v17 = 0;
          v47 = v76;
LABEL_66:
          v46 = v75;
          goto LABEL_67;
        }
        v35 = v28;
        v34 = v27;
        v72 = v26;
        v43 = v80;
        goto LABEL_36;
      }
      if (a7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INVALID_COUNTRY_CODE:%@"), v12);
        v29 = (_NBPhoneNumber *)objc_claimAutoreleasedReturnValue();
        v42 = CFSTR("INVALID_COUNTRY_CODE");
        goto LABEL_24;
      }
    }
    else if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NOT_A_NUMBER:%@"), v18);
      v29 = (_NBPhoneNumber *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("NOT_A_NUMBER");
LABEL_24:
      -[_NBPhoneNumberUtil errorWithObject:withDomain:](self, "errorWithObject:withDomain:", v29, v42);
      v17 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_69:

      goto LABEL_70;
    }
    v17 = 0;
LABEL_70:

    goto LABEL_71;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NOT_A_NUMBER:%@"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("NOT_A_NUMBER");
    goto LABEL_7;
  }
LABEL_8:
  v17 = 0;
LABEL_71:

  return v17;
}

- (void)buildNationalNumberForParsing:(id)a3 nationalNumber:(id *)a4
{
  id v6;
  id v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;

  v6 = a3;
  if (!a4)
    goto LABEL_15;
  v23 = v6;
  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v8 = -[_NBPhoneNumberUtil indexOfStringByString:target:](self, "indexOfStringByString:target:", v23, CFSTR(";phone-context="));
  if (v8 < 1)
  {
    -[_NBPhoneNumberUtil extractPossibleNumber:](self, "extractPossibleNumber:", v23);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(CFSTR(";phone-context="), "length") + v8;
    if (objc_msgSend(v23, "characterAtIndex:", v10) == 43)
    {
      v11 = objc_msgSend(v23, "rangeOfString:options:range:", CFSTR(";"), 2, v10, objc_msgSend(v23, "length") - v10);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v23, "substringFromIndex:", v10);
      else
        objc_msgSend(v23, "substringWithRange:", v10, v11 - v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendString:", v13);

    }
    if (-[_NBPhoneNumberUtil indexOfStringByString:target:](self, "indexOfStringByString:target:", v23, CFSTR("tel:")) < 1)
      goto LABEL_12;
    v14 = -[_NBPhoneNumberUtil indexOfStringByString:target:](self, "indexOfStringByString:target:", v23, CFSTR("tel:"));
    v15 = objc_msgSend(CFSTR("tel:"), "length");
    objc_msgSend(v23, "substringWithRange:", v15 + v14, v9 - (v15 + v14));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v12;
  objc_msgSend(v7, "appendString:", v12);

LABEL_12:
  v17 = (void *)objc_msgSend(v7, "copy");
  v18 = -[_NBPhoneNumberUtil indexOfStringByString:target:](self, "indexOfStringByString:target:", v17, CFSTR(";isub="));
  if (v18 >= 1)
  {
    v19 = v18;
    v20 = objc_alloc(MEMORY[0x24BDD16A8]);
    objc_msgSend(v17, "substringWithRange:", 0, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithString:", v21);

    v7 = (id)v22;
  }
  *a4 = (id)objc_msgSend(v7, "copy");

  v6 = v23;
LABEL_15:

}

- (int64_t)isNumberMatch:(id)a3 second:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  int64_t v9;

  v7 = a3;
  v8 = a4;
  v9 = -[_NBPhoneNumberUtil isNumberMatch:second:](self, "isNumberMatch:second:", v7, v8);

  return v9;
}

- (int64_t)isNumberMatch:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  _NBPhoneNumberUtil *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = 0;
    -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v6, 0x24C39F208, &v45);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v45;
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("INVALID_COUNTRY_CODE"));

      if (!v12)
      {
        v19 = 0;
        v17 = 0;
        v15 = v8;
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v7, "countryCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBPhoneNumberUtil getRegionCodeForCountryCode:](self, "getRegionCodeForCountryCode:", v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v14 != CFSTR("ZZ"))
        {
          v44 = 0;
          -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v6, v14, &v44);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v44;

          v17 = 0;
          if (!v16)
          {
            v18 = -[_NBPhoneNumberUtil isNumberMatch:second:](self, "isNumberMatch:second:", v15, v7);
            if (v18 == 4)
              v17 = 3;
            else
              v17 = v18;
          }

          v19 = 0;
          goto LABEL_51;
        }

      }
      v43 = 0;
      -[_NBPhoneNumberUtil parseHelper:defaultRegion:keepRawInput:checkRegion:error:](self, "parseHelper:defaultRegion:keepRawInput:checkRegion:error:", v6, 0, 0, 0, &v43);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v43;

      if (v40)
      {
        v19 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      v15 = v8;
    }

  }
  else
  {
    v15 = (void *)objc_msgSend(v6, "copy");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = 0;
    -[_NBPhoneNumberUtil parse:defaultRegion:error:](self, "parse:defaultRegion:error:", v7, 0x24C39F208, &v42);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v42;
    v10 = v20;
    if (v20)
    {
      objc_msgSend(v20, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("INVALID_COUNTRY_CODE"));

      if (!v22)
      {
LABEL_48:
        v17 = 0;
        goto LABEL_51;
      }
      v23 = self;
      v24 = v7;
      v25 = v15;
    }
    else
    {
      v23 = self;
      v24 = v6;
      v25 = v19;
    }
    v17 = -[_NBPhoneNumberUtil isNumberMatch:second:](v23, "isNumberMatch:second:", v24, v25);
LABEL_51:

    goto LABEL_52;
  }
  v19 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v15, "setRawInput:", &stru_24C39D888);
  objc_msgSend(v15, "clearCountryCodeSource");
  objc_msgSend(v15, "setPreferredDomesticCarrierCode:", &stru_24C39D888);
  objc_msgSend(v19, "setRawInput:", &stru_24C39D888);
  objc_msgSend(v19, "clearCountryCodeSource");
  objc_msgSend(v19, "setPreferredDomesticCarrierCode:", &stru_24C39D888);
  objc_msgSend(v15, "extension");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(v15, "extension");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (!v29)
      objc_msgSend(v15, "setExtension:", 0);
  }
  objc_msgSend(v19, "extension");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    objc_msgSend(v19, "extension");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "length");

    if (!v33)
      objc_msgSend(v19, "setExtension:", 0);
  }
  objc_msgSend(v15, "extension");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v34))
    goto LABEL_32;
  objc_msgSend(v19, "extension");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[_NBMetadataHelper hasValue:](_NBMetadataHelper, "hasValue:", v35))
  {

LABEL_32:
LABEL_33:
    objc_msgSend(v15, "countryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "countryCode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToNumber:", &unk_24C3B8508) & 1) != 0
      || (objc_msgSend(v39, "isEqualToNumber:", &unk_24C3B8508) & 1) != 0)
    {
      objc_msgSend(v15, "setCountryCode:", &unk_24C3B8508);
      objc_msgSend(v19, "setCountryCode:", &unk_24C3B8508);
      if ((objc_msgSend(v15, "isEqual:", v19) & 1) != 0)
      {
        v17 = 3;
      }
      else if (-[_NBPhoneNumberUtil isNationalNumberSuffixOfTheOther:second:](self, "isNationalNumberSuffixOfTheOther:second:", v15, v19))
      {
        v17 = 2;
      }
      else
      {
        v17 = 1;
      }
    }
    else if ((objc_msgSend(v15, "isEqual:", v19) & 1) != 0)
    {
      v17 = 4;
    }
    else if (objc_msgSend(v10, "isEqualToNumber:", v39)
           && -[_NBPhoneNumberUtil isNationalNumberSuffixOfTheOther:second:](self, "isNationalNumberSuffixOfTheOther:second:", v15, v19))
    {
      v17 = 2;
    }
    else
    {
      v17 = 1;
    }

    goto LABEL_51;
  }
  objc_msgSend(v15, "extension");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "extension");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqualToString:", v37);

  if ((v38 & 1) != 0)
    goto LABEL_33;
  v17 = 1;
LABEL_52:

  return v17;
}

- (BOOL)isNationalNumberSuffixOfTheOther:(id)a3 second:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  objc_msgSend(a3, "nationalNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "nationalNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasSuffix:", v11) & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v11, "hasSuffix:", v8);

  return v12;
}

- (BOOL)canBeInternationallyDialled:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  LOBYTE(self) = -[_NBPhoneNumberUtil canBeInternationallyDialled:](self, "canBeInternationallyDialled:", v5);

  return (char)self;
}

- (BOOL)canBeInternationallyDialled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;

  v4 = a3;
  -[_NBPhoneNumberUtil helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberUtil getRegionCodeForNumber:](self, "getRegionCodeForNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getMetadataForRegion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_NBPhoneNumberUtil getNationalSignificantNumber:](self, "getNationalSignificantNumber:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noInternationalDialling");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = !-[_NBPhoneNumberUtil isNumberMatchingDesc:numberDesc:](self, "isNumberMatchingDesc:numberDesc:", v8, v9);

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)matchesEntirely:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("NA")) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v15 = 0;
    -[_NBPhoneNumberUtil entireRegularExpressionWithPattern:options:error:](self, "entireRegularExpressionWithPattern:options:error:", v6, 0, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "length");
    objc_msgSend(v9, "firstMatchInString:options:range:", v7, 4, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v8 = v11 && !objc_msgSend(v11, "range") && v13 == v10;

  }
  return v8;
}

- (NSLock)entireStringCacheLock
{
  return self->_entireStringCacheLock;
}

- (void)setEntireStringCacheLock:(id)a3
{
  objc_storeStrong((id *)&self->_entireStringCacheLock, a3);
}

- (NSMutableDictionary)entireStringRegexCache
{
  return self->_entireStringRegexCache;
}

- (void)setEntireStringRegexCache:(id)a3
{
  objc_storeStrong((id *)&self->_entireStringRegexCache, a3);
}

- (NSLock)lockPatternCache
{
  return self->_lockPatternCache;
}

- (void)setLockPatternCache:(id)a3
{
  objc_storeStrong((id *)&self->_lockPatternCache, a3);
}

- (NSMutableDictionary)regexPatternCache
{
  return self->_regexPatternCache;
}

- (void)setRegexPatternCache:(id)a3
{
  objc_storeStrong((id *)&self->_regexPatternCache, a3);
}

- (NSRegularExpression)CAPTURING_DIGIT_PATTERN
{
  return self->_CAPTURING_DIGIT_PATTERN;
}

- (void)setCAPTURING_DIGIT_PATTERN:(id)a3
{
  objc_storeStrong((id *)&self->_CAPTURING_DIGIT_PATTERN, a3);
}

- (NSRegularExpression)VALID_ALPHA_PHONE_PATTERN
{
  return self->_VALID_ALPHA_PHONE_PATTERN;
}

- (void)setVALID_ALPHA_PHONE_PATTERN:(id)a3
{
  objc_storeStrong((id *)&self->_VALID_ALPHA_PHONE_PATTERN, a3);
}

- (_NBMetadataHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->_helper, a3);
}

- (_NBRegExMatcher)matcher
{
  return self->_matcher;
}

- (void)setMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_matcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_VALID_ALPHA_PHONE_PATTERN, 0);
  objc_storeStrong((id *)&self->_CAPTURING_DIGIT_PATTERN, 0);
  objc_storeStrong((id *)&self->_regexPatternCache, 0);
  objc_storeStrong((id *)&self->_lockPatternCache, 0);
  objc_storeStrong((id *)&self->_entireStringRegexCache, 0);
  objc_storeStrong((id *)&self->_entireStringCacheLock, 0);
}

@end
