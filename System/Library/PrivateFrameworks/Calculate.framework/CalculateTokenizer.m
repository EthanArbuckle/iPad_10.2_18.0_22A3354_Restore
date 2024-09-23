@implementation CalculateTokenizer

- (CalculateTokenizer)init
{
  return -[CalculateTokenizer initWithUnits:](self, "initWithUnits:", 0);
}

- (CalculateTokenizer)initWithUnits:(id)a3
{
  id v5;
  CalculateTokenizer *v6;
  CalculateTokenizer *v7;
  uint64_t v8;
  NSMutableArray *peekTokens;
  uint64_t v10;
  NSMutableArray *wordBreakIndices;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalculateTokenizer;
  v6 = -[CalculateTokenizer init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unitsInfo, a3);
    v8 = objc_opt_new();
    peekTokens = v7->_peekTokens;
    v7->_peekTokens = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    wordBreakIndices = v7->_wordBreakIndices;
    v7->_wordBreakIndices = (NSMutableArray *)v10;

    v7->_needsUpdate = 1;
    v7->_findDeclaredVariables = 1;
  }

  return v7;
}

- (void)dealloc
{
  unsigned __int16 *variableBuffer;
  objc_super v4;

  variableBuffer = self->_variableBuffer;
  if (variableBuffer)
  {
    free(variableBuffer);
    self->_variableBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CalculateTokenizer;
  -[CalculateTokenizer dealloc](&v4, sel_dealloc);
}

- (void)_loadIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  Trie *v6;
  Trie *v7;
  Trie *trie;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CalculateTokenizer__loadIfNeeded__block_invoke;
  block[3] = &unk_1E6EA05D0;
  block[4] = self;
  if (_loadIfNeeded_onceToken != -1)
    dispatch_once(&_loadIfNeeded_onceToken, block);
  if (!self->_trie)
  {
    if (self->_unitsInfo)
    {
      +[AvailableUnitRanks shared](AvailableUnitRanks, "shared");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ranksWithLocales:cachedOnly:", self->_locales, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4;
      }
      else
      {
        +[CalculateTokenizer symbolsTrie](CalculateTokenizer, "symbolsTrie");
        v6 = (Trie *)objc_claimAutoreleasedReturnValue();
      }
      trie = self->_trie;
      self->_trie = v6;

    }
    else
    {
      +[CalculateTokenizer symbolsTrie](CalculateTokenizer, "symbolsTrie");
      v7 = (Trie *)objc_claimAutoreleasedReturnValue();
      v3 = self->_trie;
      self->_trie = v7;
    }

  }
}

- (void)reset
{
  CalculateToken *lastToken;
  CalculateToken *prevToken2;
  CalculateToken *prevToken;
  NSSet *declaredVariables;

  self->_peekIndex = self->_startIndex;
  -[NSMutableArray removeAllObjects](self->_peekTokens, "removeAllObjects");
  lastToken = self->_lastToken;
  self->_lastToken = 0;

  prevToken2 = self->_prevToken2;
  self->_prevToken2 = 0;

  prevToken = self->_prevToken;
  self->_prevToken = 0;

  *(_WORD *)&self->_isGraphable = 0;
  declaredVariables = self->_declaredVariables;
  self->_declaredVariables = 0;

  -[CalculateTokenizer setWordBreakIndicesIndex:](self, "setWordBreakIndicesIndex:", 0);
}

- (void)setString:(id)a3
{
  id v5;
  unint64_t v6;

  self->_needsUpdate = 1;
  objc_storeStrong((id *)&self->_string, a3);
  v5 = a3;
  v6 = objc_msgSend(v5, "length");

  self->_stringLength = v6;
  self->_startIndex = 0;
}

- (_NSRange)range
{
  NSUInteger stringLength;
  NSUInteger startIndex;
  _NSRange result;

  stringLength = self->_stringLength;
  startIndex = self->_startIndex;
  result.length = stringLength;
  result.location = startIndex;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_needsUpdate = 1;
  self->_stringLength = a3.location + a3.length;
  self->_startIndex = a3.location;
}

- (void)setNumberFormatter:(id)a3
{
  self->_needsUpdate = 1;
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void)addVariable:(id)a3
{
  unint64_t v4;
  unint64_t longestVariable;
  BOOL v6;
  void *v7;
  int v8;
  $E1550EF9BCC3EE645A51253FF5CA9614 *p_singleLetterVariables;
  uint64_t v10;
  BOOL *v11;
  uint64_t v12;
  void *v13;
  NSMutableSet *lowercasedVariables;
  NSMutableSet *v15;
  NSMutableSet *v16;
  unint64_t v17;
  unsigned __int16 *variableBuffer;
  id v19;

  v19 = a3;
  v4 = objc_msgSend(v19, "length");
  longestVariable = self->_longestVariable;
  if (v4 > longestVariable)
    self->_longestVariable = v4;
  v6 = objc_msgSend(v19, "length") == 1;
  v7 = v19;
  if (v6)
  {
    v8 = objc_msgSend(v19, "characterAtIndex:", 0);
    p_singleLetterVariables = &self->_singleLetterVariables;
    v10 = (v8 - 97);
    if (v10 > 0x19)
    {
      v12 = (v8 - 65);
      v7 = v19;
      if (v12 > 0x19)
        goto LABEL_11;
      v11 = &p_singleLetterVariables->letters[v12];
      if (*v11)
        goto LABEL_11;
    }
    else
    {
      v11 = &p_singleLetterVariables->letters[v10];
      v7 = v19;
      if (*v11)
        goto LABEL_11;
    }
    *v11 = 1;
    ++self->_singleLetterVariables.count;
  }
LABEL_11:
  objc_msgSend(v7, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", v13) & 1) == 0)
  {
    lowercasedVariables = self->_lowercasedVariables;
    if (!lowercasedVariables)
    {
      v15 = (NSMutableSet *)objc_opt_new();
      v16 = self->_lowercasedVariables;
      self->_lowercasedVariables = v15;

      lowercasedVariables = self->_lowercasedVariables;
    }
    -[NSMutableSet addObject:](lowercasedVariables, "addObject:", v13);
  }
  v17 = self->_longestVariable;
  if (v17 > (int)longestVariable)
  {
    variableBuffer = self->_variableBuffer;
    if (variableBuffer)
      self->_variableBuffer = (unsigned __int16 *)malloc_type_realloc(variableBuffer, 2 * v17 + 2, 0x1000040BDFB0063uLL);
  }

}

- (void)addDeclaredVariable:(id)a3
{
  NSMutableSet *lowercasedVariables;
  NSMutableSet *v5;
  NSMutableSet *v6;
  NSSet *declaredVariables;
  NSSet *v8;
  NSSet *v9;
  id v10;

  if (self->_findDeclaredVariables)
  {
    objc_msgSend(a3, "lowercaseString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CalculateTokenizer addVariable:](self, "addVariable:");
    lowercasedVariables = self->_lowercasedVariables;
    if (!lowercasedVariables)
    {
      v5 = (NSMutableSet *)objc_opt_new();
      v6 = self->_lowercasedVariables;
      self->_lowercasedVariables = v5;

      lowercasedVariables = self->_lowercasedVariables;
    }
    -[NSMutableSet addObject:](lowercasedVariables, "addObject:", v10);
    declaredVariables = self->_declaredVariables;
    if (!declaredVariables)
    {
      v8 = (NSSet *)objc_opt_new();
      v9 = self->_declaredVariables;
      self->_declaredVariables = v8;

      declaredVariables = self->_declaredVariables;
    }
    -[NSSet addObject:](declaredVariables, "addObject:", v10);

  }
}

- (void)setVariables:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *variables;
  NSMutableSet *lowercasedVariables;
  unsigned __int16 *variableBuffer;
  NSDictionary *v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_needsUpdate = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (NSDictionary *)v4;
  else
    v5 = 0;
  variables = self->_variables;
  self->_variables = v5;

  lowercasedVariables = self->_lowercasedVariables;
  self->_lowercasedVariables = 0;

  self->_longestVariable = 0;
  variableBuffer = self->_variableBuffer;
  if (variableBuffer)
  {
    free(variableBuffer);
    self->_variableBuffer = 0;
  }
  v9 = self->_variables;
  if (v9)
  {
    *(_OWORD *)self->_singleLetterVariables.letters = 0u;
    *(_OWORD *)&self->_singleLetterVariables.letters[16] = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[CalculateTokenizer addVariable:](self, "addVariable:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
        }
        while (v12 != v14);
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

    self->_variableBuffer = (unsigned __int16 *)malloc_type_calloc(self->_longestVariable + 1, 2uLL, 0x1000040BDFB0063uLL);
  }

}

- (void)setIsLaTeX:(BOOL)a3
{
  self->_needsUpdate = 1;
  self->_isLaTeX = a3;
}

- (void)update
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  NSNumberFormatter *v14;
  void *v15;
  NSString *v16;
  NSString *groupingSeparator;
  NSString *v18;
  NSString *decimalSeparator;
  NSString *v20;
  NSString *currencyGroupingSeparator;
  NSString *v22;
  NSString *currencyDecimalSeparator;
  NSMutableCharacterSet *v24;
  NSMutableCharacterSet *localizedGroupingSet;
  NSMutableCharacterSet *v26;
  NSMutableCharacterSet *localizedDecimalSet;
  const __CFAllocator *v28;
  __CFString *v29;
  __CFStringTokenizer *v30;
  unint64_t v31;
  void (**v32)(void *, unint64_t, CFIndex);
  CFIndex v33;
  CFRange CurrentTokenRange;
  void *v35;
  void *v36;
  NSNumberFormatter *v37;
  void *v38;
  int v39;
  unint64_t v40;
  void *v41;
  id v42;
  _QWORD aBlock[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CFRange v50;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    -[CalculateTokenizer _loadIfNeeded](self, "_loadIfNeeded");
    -[CalculateTokenizer wordBreakIndices](self, "wordBreakIndices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllObjects");

    -[CalculateTokenizer locales](self, "locales");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
    {
      +[Localize systemLocales](Localize, "systemLocales");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v45 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if ((objc_msgSend(v12, "usesWhitespace") & 1) == 0)
          {
            v13 = v12;

            v6 = v13;
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

    v14 = self->_numberFormatter;
    if (!v14)
    {
      objc_msgSend(v7, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CalculateResult performSelector:withObject:](CalculateResult, "performSelector:withObject:", sel_defaultNumberFormatter_, v15);
      v14 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();

    }
    -[NSNumberFormatter groupingSeparator](v14, "groupingSeparator");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    groupingSeparator = self->_groupingSeparator;
    self->_groupingSeparator = v16;

    -[NSNumberFormatter decimalSeparator](v14, "decimalSeparator");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    decimalSeparator = self->_decimalSeparator;
    self->_decimalSeparator = v18;

    -[NSNumberFormatter currencyGroupingSeparator](v14, "currencyGroupingSeparator");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    currencyGroupingSeparator = self->_currencyGroupingSeparator;
    self->_currencyGroupingSeparator = v20;

    -[NSNumberFormatter currencyDecimalSeparator](v14, "currencyDecimalSeparator");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    currencyDecimalSeparator = self->_currencyDecimalSeparator;
    self->_currencyDecimalSeparator = v22;

    v24 = (NSMutableCharacterSet *)objc_opt_new();
    localizedGroupingSet = self->_localizedGroupingSet;
    self->_localizedGroupingSet = v24;

    if (self->_groupingSeparator)
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedGroupingSet, "addCharactersInString:");
    if (self->_currencyGroupingSeparator)
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedGroupingSet, "addCharactersInString:");
    if (-[NSString isEqualToString:](self->_groupingSeparator, "isEqualToString:", CFSTR("’"))
      || -[NSString isEqualToString:](self->_currencyGroupingSeparator, "isEqualToString:", CFSTR("’")))
    {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedGroupingSet, "addCharactersInString:", CFSTR("'"));
    }
    if (-[NSString rangeOfCharacterFromSet:](self->_groupingSeparator, "rangeOfCharacterFromSet:", nbspSet) != 0x7FFFFFFFFFFFFFFFLL
      || -[NSString rangeOfCharacterFromSet:](self->_currencyGroupingSeparator, "rangeOfCharacterFromSet:", nbspSet) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedGroupingSet, "addCharactersInString:", CFSTR(" "));
    }
    if (!-[NSString isEqualToString:](self->_decimalSeparator, "isEqualToString:", CFSTR(","))
      && !-[NSString isEqualToString:](self->_currencyDecimalSeparator, "isEqualToString:", CFSTR(",")))
    {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedGroupingSet, "addCharactersInString:", CFSTR(","));
    }
    v26 = (NSMutableCharacterSet *)objc_opt_new();
    localizedDecimalSet = self->_localizedDecimalSet;
    self->_localizedDecimalSet = v26;

    if (self->_decimalSeparator)
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedDecimalSet, "addCharactersInString:");
    if (self->_currencyDecimalSeparator)
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedDecimalSet, "addCharactersInString:");
    if (-[NSString rangeOfCharacterFromSet:](self->_decimalSeparator, "rangeOfCharacterFromSet:", nbspSet) != 0x7FFFFFFFFFFFFFFFLL
      || -[NSString rangeOfCharacterFromSet:](self->_currencyDecimalSeparator, "rangeOfCharacterFromSet:", nbspSet) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedDecimalSet, "addCharactersInString:", CFSTR(" "));
    }
    if (!-[NSString isEqualToString:](self->_groupingSeparator, "isEqualToString:", CFSTR("."))
      && !-[NSString isEqualToString:](self->_currencyGroupingSeparator, "isEqualToString:", CFSTR(".")))
    {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedDecimalSet, "addCharactersInString:", CFSTR("."));
    }
    v28 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    -[CalculateTokenizer string](self, "string");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v50.location = self->_startIndex;
    v50.length = self->_stringLength - v50.location;
    v30 = CFStringTokenizerCreate(v28, v29, v50, 0, (CFLocaleRef)v6);

    v31 = -[CalculateTokenizer startIndex](self, "startIndex");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __28__CalculateTokenizer_update__block_invoke;
    aBlock[3] = &unk_1E6EA0488;
    aBlock[4] = self;
    v32 = (void (**)(void *, unint64_t, CFIndex))_Block_copy(aBlock);
    while (CFStringTokenizerAdvanceToNextToken(v30))
    {
      v33 = -[CalculateTokenizer stringLength](self, "stringLength");
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
      if (CurrentTokenRange.location != -1)
        v33 = CurrentTokenRange.location + CurrentTokenRange.length;
      v32[2](v32, v31, v33);
      v31 = v33;
    }
    -[CalculateTokenizer wordBreakIndices](self, "wordBreakIndices");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count"))
    {
      -[CalculateTokenizer wordBreakIndices](self, "wordBreakIndices");
      v41 = v6;
      v42 = v7;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastObject");
      v37 = v14;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "intValue");
      v40 = -[CalculateTokenizer stringLength](self, "stringLength");

      v14 = v37;
      v6 = v41;
      v7 = v42;

      if (v40 <= v39)
        goto LABEL_49;
    }
    else
    {

    }
    v32[2](v32, v31, -[CalculateTokenizer stringLength](self, "stringLength"));
LABEL_49:
    CFRelease(v30);
    -[CalculateTokenizer reset](self, "reset");

  }
}

- (void)setLocales:(id)a3
{
  self->_needsUpdate = 1;
  objc_storeStrong((id *)&self->_locales, a3);
  -[CalculateTokenizer setTrie:](self, "setTrie:", 0);
}

- (void)_findNextToken
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  unsigned __int16 *variableBuffer;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  _BYTE *v31;
  unint64_t v32;
  id v33;
  int v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  id v47;
  int v48;
  uint64_t v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  unint64_t v53;
  void *v54;
  int v55;
  void *v56;
  _QWORD *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  unint64_t v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  BOOL v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  unint64_t v86;
  void *v87;
  char v88;
  void *v89;
  uint64_t v90;
  uint64_t (*v91)(_QWORD *, uint64_t, uint64_t, _QWORD);
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  unint64_t v101;
  void *v102;
  void *v103;
  id v104;
  void (**v105)(id, uint64_t, _QWORD);
  void *v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  unint64_t v115;
  id v116;
  void *v117;
  Trie *trie;
  Trie *v119;
  int v120;
  uint64_t v121;
  BOOL v122;
  void *v123;
  Trie *v124;
  Trie *v125;
  id v126;
  id v127;
  char v128;
  unint64_t v129;
  id v130;
  unint64_t v131;
  unint64_t v132;
  id v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  _QWORD v137[5];
  id v138;
  _QWORD v139[5];
  id v140;
  uint64_t *v141;
  _QWORD *v142;
  uint64_t *v143;
  _QWORD *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  _QWORD *v148;
  uint64_t *v149;
  uint64_t *v150;
  _QWORD *v151;
  uint64_t *v152;
  uint64_t *v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t (*v162)(uint64_t, uint64_t);
  void (*v163)(uint64_t);
  id v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t (*v168)(uint64_t, uint64_t);
  void (*v169)(uint64_t);
  id v170;
  uint64_t v171;
  int *v172;
  uint64_t v173;
  int v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  char v178;
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  char v182;
  _QWORD v183[3];
  char v184;
  _QWORD v185[3];
  char v186;
  _QWORD v187[3];
  char v188;
  _QWORD v189[3];
  char v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  BOOL v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  int v198;
  _QWORD v199[5];
  uint64_t v200;
  _QWORD v201[3];
  _QWORD v202[12];
  int v203;
  uint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t (*v207)(uint64_t, uint64_t);
  void (*v208)(uint64_t);
  id v209;
  uint64_t v210;
  _QWORD v211[3];
  uint64_t v212;
  uint64_t *v213;
  uint64_t v214;
  uint64_t (*v215)(uint64_t, uint64_t);
  void (*v216)(uint64_t);
  id v217;
  _QWORD v218[6];
  _QWORD aBlock[5];
  __int128 v220;
  __int128 v221;
  void (*v222)(uint64_t);
  id v223;
  uint64_t v224;

  v224 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdate)
    -[CalculateTokenizer update](self, "update");
  v3 = -[CalculateTokenizer peekIndex](self, "peekIndex");
  if (v3 >= -[CalculateTokenizer stringLength](self, "stringLength"))
    return;
  while (1)
  {
    -[CalculateTokenizer wordBreakIndices](self, "wordBreakIndices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", -[CalculateTokenizer wordBreakIndicesIndex](self, "wordBreakIndicesIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");
    v7 = -[CalculateTokenizer peekIndex](self, "peekIndex");

    if (v7 < v6)
      break;
    -[CalculateTokenizer setWordBreakIndicesIndex:](self, "setWordBreakIndicesIndex:", -[CalculateTokenizer wordBreakIndicesIndex](self, "wordBreakIndicesIndex") + 1);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CalculateTokenizer__findNextToken__block_invoke;
  aBlock[3] = &unk_1E6EA0620;
  aBlock[4] = self;
  v133 = _Block_copy(aBlock);
  v131 = -[CalculateTokenizer stringLength](self, "stringLength");
  v135 = -[CalculateTokenizer peekIndex](self, "peekIndex");
  -[CalculateTokenizer wordBreakIndices](self, "wordBreakIndices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", -[CalculateTokenizer wordBreakIndicesIndex](self, "wordBreakIndicesIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  v134 = v10;
  if (!self->_prevToken
    && (-[NSString characterAtIndex:](self->_string, "characterAtIndex:", v135) & 0xFFFFFFDF) - 65 <= 0x19)
  {
    *(_QWORD *)&v220 = 0;
    *((_QWORD *)&v220 + 1) = &v220;
    *(_QWORD *)&v221 = 0x2020000000;
    BYTE8(v221) = 0;
    v212 = 0;
    v213 = &v212;
    v214 = 0x2020000000;
    LOBYTE(v215) = 0;
    -[CalculateTokenizer string](self, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v218[0] = MEMORY[0x1E0C809B0];
    v218[1] = 3221225472;
    v218[2] = __36__CalculateTokenizer__findNextToken__block_invoke_2;
    v218[3] = &unk_1E6EA0648;
    v218[4] = &v220;
    v218[5] = &v212;
    +[Trie enumerateCharactersInKey:range:usingBlock:]((uint64_t)Trie, v11, v10, v131 - v10, v218);

    if (*(_BYTE *)(*((_QWORD *)&v220 + 1) + 24) && *((_BYTE *)v213 + 24))
    {
      v12 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v133
                                                         + 2))(v133, 39, v10, 0, 0));
      _Block_object_dispose(&v212, 8);
      _Block_object_dispose(&v220, 8);
      goto LABEL_88;
    }
    _Block_object_dispose(&v212, 8);
    _Block_object_dispose(&v220, 8);
  }
  v13 = v135;
  v14 = v10 - v135;
  v129 = v14;
  if (v10 > v135 && (v14 <= self->_longestVariable || v14 == 1 || v14 <= self->_singleLetterVariables.count))
  {
    v15 = -[NSString characterAtIndex:](self->_string, "characterAtIndex:", v135);
    v13 = v135;
    if ((v15 & 0xFFFFFFDF) - 65 <= 0x19)
    {
      if (v129 != 1 && v129 > self->_longestVariable)
      {
LABEL_19:
        if (self->_variables && self->_variableBuffer)
        {
          -[NSString getCharacters:range:](self->_string, "getCharacters:range:");
          v220 = 0u;
          v221 = 0u;
          v13 = v135;
          if (v10 == v135)
          {
            v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v133;
            do
            {
LABEL_43:
              v32 = v13 + 1;
              v33 = (id)v16[2](v16, 39, v13 + 1, 0, 0);
              v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v133;
              v13 = v32;
            }
            while (v10 != v32);
            goto LABEL_89;
          }
          variableBuffer = self->_variableBuffer;
          v27 = v10 - v135;
          if (v129 <= 1)
            v27 = 1;
          v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v133;
          while (1)
          {
            v29 = *variableBuffer++;
            v28 = v29;
            if ((v29 - 97) >= 0x1A)
            {
              if ((v28 - 65) >= 0x1A)
                goto LABEL_45;
              v30 = (v28 - 65);
            }
            else
            {
              v30 = (v28 - 97);
            }
            if (!self->_singleLetterVariables.letters[v30])
              break;
            v31 = (char *)&v220 + v30;
            if (*v31)
              break;
            *v31 = 1;
            if (!--v27)
              goto LABEL_43;
          }
        }
        goto LABEL_45;
      }
      -[NSString substringWithRange:](self->_string, "substringWithRange:", v135, v129);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDictionary objectForKey:](self->_variables, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {

      }
      else if ((-[NSMutableSet containsObject:](self->_lowercasedVariables, "containsObject:", v18) & 1) == 0)
      {
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("x")) & 1) == 0)
        {

          v13 = v135;
          goto LABEL_19;
        }
        v20 = 52;
LABEL_27:
        v21 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v133
                                                           + 2))(v133, v20, v10, 0, 0));
        -[NSMutableArray lastObject](self->_peekTokens, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isMaybeX");

        if (v23)
        {
          -[CalculateTokenizer _findNextToken](self, "_findNextToken");
          -[NSMutableArray lastObject](self->_peekTokens, "lastObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (!v24 || objc_msgSend(v24, "tokenType") == 1)
            -[CalculateTokenizer _findNextToken](self, "_findNextToken");

        }
        goto LABEL_88;
      }
      v20 = 39;
      goto LABEL_27;
    }
  }
LABEL_45:
  v34 = 0;
  *(_QWORD *)&v220 = 0;
  *((_QWORD *)&v220 + 1) = &v220;
  *(_QWORD *)&v221 = 0x3032000000;
  *((_QWORD *)&v221 + 1) = __Block_byref_object_copy__778;
  v222 = __Block_byref_object_dispose__779;
  v223 = 0;
  v212 = 0;
  v213 = &v212;
  v214 = 0x3032000000;
  v215 = __Block_byref_object_copy__778;
  v216 = __Block_byref_object_dispose__779;
  v217 = 0;
  v35 = v131 - v13;
  v36 = 1;
  v210 = 0;
  v211[0] = &v210;
  v211[1] = 0x2020000000;
  v211[2] = 0;
  while (1)
  {
    v37 = v36;
    v204 = 0;
    v205 = &v204;
    v206 = 0x3032000000;
    v207 = __Block_byref_object_copy__778;
    v208 = __Block_byref_object_dispose__779;
    -[CalculateTokenizer trie](self, "trie");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v38)
      v40 = (void *)objc_msgSend(*(id *)(v38 + 32), "copy");
    else
      v40 = 0;
    v209 = v40;

    v165 = 0;
    v166 = &v165;
    v167 = 0x2020000000;
    v168 = 0;
    v168 = -[CalculateTokenizer wordBreakIndicesIndex](self, "wordBreakIndicesIndex");
    v159 = 0;
    v160 = &v159;
    v161 = 0x2020000000;
    v162 = (uint64_t (*)(uint64_t, uint64_t))v10;
    -[CalculateTokenizer string](self, "string");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v202[0] = MEMORY[0x1E0C809B0];
    v202[1] = 3221225472;
    v202[2] = __36__CalculateTokenizer__findNextToken__block_invoke_704;
    v202[3] = &unk_1E6EA0670;
    v203 = v34;
    v202[5] = &v212;
    v202[4] = self;
    v202[6] = &v204;
    v202[7] = &v220;
    v202[8] = &v210;
    v202[9] = &v159;
    v202[11] = v135;
    v202[10] = &v165;
    +[Trie enumerateCharactersInKey:range:usingBlock:]((uint64_t)Trie, v41, v135, v35, v202);

    objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "ranks");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "count") != 1)
    {

      goto LABEL_52;
    }
    v43 = objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "tokenType") == 2;

    if (!v43)
      break;
LABEL_52:
    _Block_object_dispose(&v159, 8);
    _Block_object_dispose(&v165, 8);
    _Block_object_dispose(&v204, 8);

    v36 = 0;
    v34 = 1;
    if ((v37 & 1) == 0)
      goto LABEL_55;
  }
  _Block_object_dispose(&v159, 8);
  _Block_object_dispose(&v165, 8);
  _Block_object_dispose(&v204, 8);

LABEL_55:
  v44 = *(void **)(*((_QWORD *)&v220 + 1) + 40);
  v45 = v133;
  if (!v44 || objc_msgSend(v44, "tokenType") == 33)
  {
    v46 = objc_msgSend((id)v213[5], "length") + v135;
    v200 = 0;
    v201[0] = &v200;
    v201[1] = 0x2020000000;
    v201[2] = v46;
    if (objc_msgSend((id)v213[5], "rangeOfCharacterFromSet:", newlineSet) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v49 = 32;
      goto LABEL_85;
    }
    if (objc_msgSend((id)v213[5], "rangeOfCharacterFromSet:", whitespaceSet) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CalculateTokenizer string](self, "string");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v199[0] = MEMORY[0x1E0C809B0];
      v199[1] = 3221225472;
      v199[2] = __36__CalculateTokenizer__findNextToken__block_invoke_2_707;
      v199[3] = &unk_1E6EA0698;
      v199[4] = &v200;
      +[Trie enumerateCharactersInKey:range:usingBlock:]((uint64_t)Trie, v56, v135, v129, v199);

      v57 = v201;
      v49 = 1;
      goto LABEL_84;
    }
    if (objc_msgSend((id)v213[5], "rangeOfCharacterFromSet:", anyDigitSet) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend((id)v213[5], "rangeOfCharacterFromSet:", self->_localizedDecimalSet) == 0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_160;
    }
    v195 = 0;
    v196 = &v195;
    v197 = 0x2020000000;
    v198 = 0;
    v47 = (id)v213[5];
    if (objc_msgSend(v47, "rangeOfCharacterFromSet:", digitSet) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v47, "rangeOfCharacterFromSet:", symbolSet) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v47, "rangeOfCharacterFromSet:", hebrewSet) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v47, "rangeOfCharacterFromSet:", punctuationSet) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v47, "rangeOfCharacterFromSet:", devanagariDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v47, "rangeOfCharacterFromSet:", eastArabicDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(v47, "rangeOfCharacterFromSet:", wideDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
                v48 = 1;
              else
                v48 = 5;
            }
            else
            {
              v48 = 4;
            }
          }
          else
          {
            v48 = 3;
          }
        }
        else
        {
          v48 = 7;
        }
      }
      else
      {
        v48 = 6;
      }
    }
    else
    {
      v48 = 2;
    }

    v198 = v48;
    v191 = 0;
    v192 = &v191;
    v193 = 0x2020000000;
    v194 = 0;
    v194 = objc_msgSend((id)v213[5], "rangeOfCharacterFromSet:", self->_localizedDecimalSet) == 0x7FFFFFFFFFFFFFFFLL;
    v189[0] = 0;
    v189[1] = v189;
    v189[2] = 0x2020000000;
    v190 = 1;
    v187[0] = 0;
    v187[1] = v187;
    v187[2] = 0x2020000000;
    v188 = 0;
    v185[0] = 0;
    v185[1] = v185;
    v185[2] = 0x2020000000;
    v186 = 0;
    v186 = *((_BYTE *)v192 + 24);
    v183[0] = 0;
    v183[1] = v183;
    v183[2] = 0x2020000000;
    v184 = 0;
    v179 = 0;
    v180 = &v179;
    v181 = 0x2020000000;
    v182 = 0;
    if (!*((_BYTE *)v192 + 24))
      *((_DWORD *)v196 + 6) = 1;
    v204 = 0;
    v205 = &v204;
    v206 = 0x3032000000;
    v207 = __Block_byref_object_copy__778;
    v208 = __Block_byref_object_dispose__779;
    v209 = 0;
    if (self->_normalizeNumbers)
    {
      v61 = (void *)objc_opt_new();
      v62 = v61;
      if (*((_BYTE *)v192 + 24))
        objc_msgSend(v61, "appendString:", v213[5]);
      else
        objc_msgSend(v61, "appendString:", CFSTR("."));
    }
    else
    {
      v62 = 0;
    }
    v175 = 0;
    v176 = &v175;
    v177 = 0x2020000000;
    v178 = 0;
    v171 = 0;
    v172 = (int *)&v171;
    v173 = 0x2020000000;
    v174 = 0;
    v165 = 0;
    v166 = &v165;
    v167 = 0x3032000000;
    v168 = __Block_byref_object_copy__778;
    v169 = __Block_byref_object_dispose__779;
    v170 = (id)v213[5];
    v159 = 0;
    v160 = &v159;
    v161 = 0x3032000000;
    v162 = __Block_byref_object_copy__778;
    v163 = __Block_byref_object_dispose__779;
    v164 = 0;
    v155 = 0;
    v156 = &v155;
    v157 = 0x2020000000;
    v158 = v46;
    if (self->_normalizeNumbers && *((_DWORD *)v196 + 6) != 2)
      v178 = 1;
    *(_QWORD *)(v201[0] + 24) = v46;
    -[CalculateTokenizer string](self, "string");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __36__CalculateTokenizer__findNextToken__block_invoke_3;
    v139[3] = &unk_1E6EA06C0;
    v142 = v187;
    v143 = &v179;
    v144 = v183;
    v145 = &v175;
    v141 = &v195;
    v139[4] = self;
    v146 = &v171;
    v147 = &v204;
    v130 = v62;
    v140 = v130;
    v148 = v185;
    v149 = &v159;
    v150 = &v191;
    v151 = v189;
    v152 = &v165;
    v153 = &v200;
    v154 = &v155;
    +[Trie enumerateCharactersInKey:range:usingBlock:]((uint64_t)Trie, v63, v46, v131 - v46, v139);

    if (*(_QWORD *)(v201[0] + 24) == v135 + 1
      && objc_msgSend((id)v213[5], "isEqualToString:", CFSTR(".")))
    {
      v64 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(id, uint64_t, _QWORD, uint64_t, _QWORD))v133
                                                         + 2))(v133, 6, *(_QWORD *)(v201[0] + 24), v213[5], 0));
      goto LABEL_158;
    }
    if (*((_BYTE *)v180 + 24) || objc_msgSend((id)v166[5], "isEqualToString:", CFSTR(",")))
    {
      --*(_QWORD *)(v201[0] + 24);
      if (self->_normalizeNumbers)
        objc_msgSend(v130, "deleteCharactersInRange:", objc_msgSend(v130, "length") - 1, 1);
    }
    v65 = *(_QWORD *)(v201[0] + 24);
    if (v65 <= -[CalculateTokenizer peekIndex](self, "peekIndex"))
    {
      v88 = 1;
      goto LABEL_159;
    }
    -[CalculateTokenizer lastToken](self, "lastToken");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v66)
      goto LABEL_145;
    -[CalculateTokenizer lastToken](self, "lastToken");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "tokenType") == 2;

    if (!v68)
      goto LABEL_145;
    v136 = 0;
    v127 = 0;
    v128 = 0;
    while (1)
    {
      -[CalculateTokenizer lastToken](self, "lastToken");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "ranks");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "ranks");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend(v71, "count");

      if (v132 <= v136)
        break;
      -[CalculateTokenizer lastToken](self, "lastToken");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "ranks");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "ranks");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectAtIndexedSubscript:", v136);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (int)objc_msgSend(v75, "unitID") < 1;

      if (!v76)
      {
        -[CalculateTokenizer unitsInfo](self, "unitsInfo");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalculateTokenizer lastToken](self, "lastToken");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "ranks");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "ranks");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectAtIndexedSubscript:", v136);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectAtIndexedSubscript:", (int)objc_msgSend(v81, "unitID"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "typeInfo");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "isCurrency");

        if (v84)
        {
          if ((v128 & 1) == 0)
            break;
          -[CalculateTokenizer string](self, "string");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = -[CalculateTokenizer peekIndex](self, "peekIndex");
          objc_msgSend(v85, "substringWithRange:", v86, *(_QWORD *)(v201[0] + 24) - -[CalculateTokenizer peekIndex](self, "peekIndex"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v87, "isEqualToString:", CFSTR("2")) & 1) == 0
            && (objc_msgSend(v87, "isEqualToString:", CFSTR("3")) & 1) == 0)
          {
            v127 = v87;
            break;
          }
          v128 = 1;
          v127 = v87;
        }
        else
        {
          v128 = 1;
        }
      }
      ++v136;
    }
    -[CalculateTokenizer lastToken](self, "lastToken");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "text");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalculateTokenizer lastToken](self, "lastToken");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "text");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "substringFromIndex:", objc_msgSend(v97, "length") - 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v98, "rangeOfCharacterFromSet:", symbolSet) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v99 = 0;
      if (objc_msgSend(v98, "rangeOfCharacterFromSet:", punctuationSet) == 0x7FFFFFFFFFFFFFFFLL && v132 <= v136)
      {
        -[CalculateTokenizer string](self, "string");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = -[CalculateTokenizer peekIndex](self, "peekIndex");
        objc_msgSend(v100, "substringWithRange:", v101, *(_QWORD *)(v201[0] + 24) - -[CalculateTokenizer peekIndex](self, "peekIndex"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v102, "isEqualToString:", CFSTR("2")) & 1) != 0
          || objc_msgSend(v102, "isEqualToString:", CFSTR("3")))
        {
          v127 = v102;

          if (v127)
          {
            -[CalculateTokenizer peekTokens](self, "peekTokens");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            +[CalculateToken tokenWithType:range:text:ranks:](CalculateToken, "tokenWithType:range:text:ranks:", 11, -[CalculateTokenizer peekIndex](self, "peekIndex"), 0, CFSTR("^"), 0);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v103);

            v99 = v127;
            goto LABEL_147;
          }
LABEL_145:
          v104 = 0;
          v99 = 0;
          v105 = (void (**)(id, uint64_t, _QWORD))v133;
LABEL_148:
          v106 = v104;
          v105[2](v105, 3, *(_QWORD *)(v201[0] + 24));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          if (self->_normalizeNumbers)
          {
            v108 = v130;
            v109 = v108;
            if (*((_BYTE *)v176 + 24))
            {
              objc_msgSend(v108, "calc_stringByReplacingOccurrencesOfRegex:usingBlock:", CFSTR("[０-９०-९٠-٩]+"), &__block_literal_global_714);
              v110 = objc_claimAutoreleasedReturnValue();

              v109 = (void *)v110;
            }
            objc_msgSend(v107, "setNormalizedText:", v109);
            objc_msgSend(v107, "setCharacterType:", *((unsigned int *)v196 + 6));

          }
          if (v172[6] >= 1 && (unint64_t)v156[3] > *(_QWORD *)(v201[0] + 24))
          {
            -[CalculateTokenizer string](self, "string");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = *(_QWORD *)(v201[0] + 24);
            v113 = v156[3] - v112;
            v137[0] = MEMORY[0x1E0C809B0];
            v137[1] = 3221225472;
            v137[2] = __36__CalculateTokenizer__findNextToken__block_invoke_5;
            v137[3] = &unk_1E6EA0728;
            v137[4] = self;
            v114 = v133;
            v138 = v114;
            +[Trie enumerateCharactersInKey:range:usingBlock:]((uint64_t)Trie, v111, v112, v113, v137);

            v115 = v156[3];
            if (v115 > -[CalculateTokenizer peekIndex](self, "peekIndex"))
              v116 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(id, uint64_t, uint64_t, _QWORD, _QWORD))v133
                                                                  + 2))(v114, 3, v156[3], 0, 0));

          }
LABEL_158:
          v88 = 0;
LABEL_159:

          _Block_object_dispose(&v155, 8);
          _Block_object_dispose(&v159, 8);

          _Block_object_dispose(&v165, 8);
          _Block_object_dispose(&v171, 8);
          _Block_object_dispose(&v175, 8);
          _Block_object_dispose(&v204, 8);

          _Block_object_dispose(&v179, 8);
          _Block_object_dispose(v183, 8);
          _Block_object_dispose(v185, 8);
          _Block_object_dispose(v187, 8);
          _Block_object_dispose(v189, 8);
          _Block_object_dispose(&v191, 8);
          _Block_object_dispose(&v195, 8);
          if ((v88 & 1) != 0)
          {
LABEL_160:
            v117 = *(void **)(*((_QWORD *)&v220 + 1) + 40);
            if (v117 && objc_msgSend(v117, "tokenType") == 33)
            {
              v49 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "tokenType");
              v57 = v211;
LABEL_84:
              v46 = *(_QWORD *)(*v57 + 24);
LABEL_85:
              v58 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(id, uint64_t, uint64_t, _QWORD, _QWORD))v133
                                                                 + 2))(v133, v49, v46, 0, 0));
            }
            else
            {
              trie = self->_trie;
              +[CalculateTokenizer symbolsTrie](CalculateTokenizer, "symbolsTrie");
              v119 = (Trie *)objc_claimAutoreleasedReturnValue();
              if (trie == v119)
              {
                v122 = self->_unitsInfo == 0;

                if (!v122)
                {
                  +[AvailableUnitRanks shared](AvailableUnitRanks, "shared");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "ranksWithLocales:", self->_locales);
                  v124 = (Trie *)objc_claimAutoreleasedReturnValue();
                  v125 = self->_trie;
                  self->_trie = v124;

                  -[CalculateTokenizer _findNextToken](self, "_findNextToken");
                  goto LABEL_86;
                }
              }
              else
              {

              }
              v46 = v134;
              if (-[CalculateTokenizer peekIndex](self, "peekIndex") + 1 != v134)
              {
                v49 = 52;
                goto LABEL_85;
              }
              v120 = characterTypeForCharacter((void *)v213[5]);
              if (v120 == 6)
              {
                v121 = 54;
              }
              else
              {
                if (v120 != 7)
                {
                  v49 = 52;
                  v46 = v134;
                  goto LABEL_85;
                }
                v121 = 53;
              }
              v126 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(id, uint64_t, uint64_t, _QWORD, _QWORD))v133
                                                                  + 2))(v133, v121, v134, 0, 0));
            }
          }
LABEL_86:
          _Block_object_dispose(&v200, 8);
          goto LABEL_87;
        }
        v99 = 0;
        v127 = v102;
      }
    }
    else
    {
      v99 = 0;
    }
LABEL_147:

    v105 = (void (**)(id, uint64_t, _QWORD))v133;
    v104 = v127;
    goto LABEL_148;
  }
  if (objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "tokenType") == 2
    || objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "tokenType") == 35)
  {
    if (objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "tokenType") == 35)
    {
      objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "ranks");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "count") == 1;

      if (v51)
      {
        v52 = *(void **)(*((_QWORD *)&v220 + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&v220 + 1) + 40) = 0;

      }
      v53 = *(_QWORD *)(v211[0] + 24);
      v45 = v133;
      if (v53 < v131)
      {
        v45 = v133;
        while (1)
        {
          -[CalculateTokenizer string](self, "string");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "characterAtIndex:", v53);

          if (v55 == 95)
            break;
          if (v55 != 32 && (unsigned __int16)(v55 - 48) >= 0xAu)
          {
            if (v55 != 40)
              goto LABEL_129;
            break;
          }
          if (v131 == ++v53)
            goto LABEL_129;
        }
        v89 = *(void **)(*((_QWORD *)&v220 + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&v220 + 1) + 40) = 0;

        v45 = v133;
      }
    }
LABEL_129:
    v90 = *(_QWORD *)(v211[0] + 24);
    v91 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t, _QWORD))v45[2];
    if (*(_QWORD *)(*((_QWORD *)&v220 + 1) + 40))
    {
      v92 = (id)v91(v45, 2, v90, 0);
      goto LABEL_87;
    }
    v60 = (void *)((uint64_t (*)(_QWORD *, uint64_t, uint64_t, _QWORD, _QWORD))v91)(v45, 35, v90, 0, 0);
  }
  else
  {
    v59 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 40), "tokenType");
    v60 = (void *)(*((uint64_t (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v133 + 2))(v133, v59, *(_QWORD *)(v211[0] + 24), 0, 0);
  }
  v93 = v60;
LABEL_87:
  _Block_object_dispose(&v210, 8);
  _Block_object_dispose(&v212, 8);

  _Block_object_dispose(&v220, 8);
LABEL_88:
  v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v133;
LABEL_89:

}

- (id)nextToken
{
  void *v3;
  void *v4;

  -[CalculateTokenizer peekToken](self, "peekToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CalculateTokenizer peekTokens](self, "peekTokens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", 0);

  }
  -[CalculateTokenizer setLastToken:](self, "setLastToken:", v3);
  return v3;
}

- (id)peekToken
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[CalculateTokenizer peekTokens](self, "peekTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[CalculateTokenizer _findNextToken](self, "_findNextToken");
  -[CalculateTokenizer peekTokens](self, "peekTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[CalculateTokenizer peekTokens](self, "peekTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)peekTokenAtOffset:(int64_t)a3
{
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  -[CalculateTokenizer peekTokens](self, "peekTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3 - objc_msgSend(v5, "count");

  if ((v6 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    do
    {
      -[CalculateTokenizer _findNextToken](self, "_findNextToken");
      ++v7;
    }
    while (v6 >= v7);
  }
  if (a3 < 0
    || (-[CalculateTokenizer peekTokens](self, "peekTokens"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9 <= a3))
  {
    v11 = 0;
  }
  else
  {
    -[CalculateTokenizer peekTokens](self, "peekTokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)peekNonWhitespaceToken
{
  void *v3;
  id v4;
  void *v5;

  -[CalculateTokenizer peekToken](self, "peekToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "tokenType") == 1)
  {
    -[CalculateTokenizer peekTokenAtOffset:](self, "peekTokenAtOffset:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (unint64_t)index
{
  return self->_index;
}

- (NSString)string
{
  return self->_string;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (BOOL)normalizeNumbers
{
  return self->_normalizeNumbers;
}

- (void)setNormalizeNumbers:(BOOL)a3
{
  self->_normalizeNumbers = a3;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (BOOL)findDeclaredVariables
{
  return self->_findDeclaredVariables;
}

- (void)setFindDeclaredVariables:(BOOL)a3
{
  self->_findDeclaredVariables = a3;
}

- (BOOL)isGraphable
{
  return self->_isGraphable;
}

- (BOOL)foundGraphableValue
{
  return self->_foundGraphableValue;
}

- (BOOL)isLaTeX
{
  return self->_isLaTeX;
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

- (void)setUnitsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitsInfo, a3);
}

- (Trie)trie
{
  return self->_trie;
}

- (void)setTrie:(id)a3
{
  objc_storeStrong((id *)&self->_trie, a3);
}

- (unint64_t)stringLength
{
  return self->_stringLength;
}

- (void)setStringLength:(unint64_t)a3
{
  self->_stringLength = a3;
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndex = a3;
}

- (unint64_t)peekIndex
{
  return self->_peekIndex;
}

- (void)setPeekIndex:(unint64_t)a3
{
  self->_peekIndex = a3;
}

- (NSMutableArray)peekTokens
{
  return self->_peekTokens;
}

- (void)setPeekTokens:(id)a3
{
  objc_storeStrong((id *)&self->_peekTokens, a3);
}

- (CalculateToken)lastToken
{
  return self->_lastToken;
}

- (void)setLastToken:(id)a3
{
  objc_storeStrong((id *)&self->_lastToken, a3);
}

- (NSMutableArray)wordBreakIndices
{
  return self->_wordBreakIndices;
}

- (void)setWordBreakIndices:(id)a3
{
  objc_storeStrong((id *)&self->_wordBreakIndices, a3);
}

- (unint64_t)wordBreakIndicesIndex
{
  return self->_wordBreakIndicesIndex;
}

- (void)setWordBreakIndicesIndex:(unint64_t)a3
{
  self->_wordBreakIndicesIndex = a3;
}

- (NSMutableSet)lowercasedVariables
{
  return self->_lowercasedVariables;
}

- (void)setLowercasedVariables:(id)a3
{
  objc_storeStrong((id *)&self->_lowercasedVariables, a3);
}

- (unint64_t)longestVariable
{
  return self->_longestVariable;
}

- (void)setLongestVariable:(unint64_t)a3
{
  self->_longestVariable = a3;
}

- (unsigned)variableBuffer
{
  return self->_variableBuffer;
}

- (void)setVariableBuffer:(unsigned __int16 *)a3
{
  self->_variableBuffer = a3;
}

- ($0F7EB6B36CDCC9CA6BC7BE76F6527CA8)singleLetterVariables
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].var0[16];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[7].var0;
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (void)setSingleLetterVariables:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[16];
  *(_OWORD *)self->_singleLetterVariables.letters = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_singleLetterVariables.letters[16] = v3;
}

- (CalculateToken)prevToken
{
  return self->_prevToken;
}

- (void)setPrevToken:(id)a3
{
  objc_storeStrong((id *)&self->_prevToken, a3);
}

- (CalculateToken)prevToken2
{
  return self->_prevToken2;
}

- (void)setPrevToken2:(id)a3
{
  objc_storeStrong((id *)&self->_prevToken2, a3);
}

- (NSString)groupingSeparator
{
  return self->_groupingSeparator;
}

- (void)setGroupingSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_groupingSeparator, a3);
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (void)setDecimalSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_decimalSeparator, a3);
}

- (NSString)currencyGroupingSeparator
{
  return self->_currencyGroupingSeparator;
}

- (void)setCurrencyGroupingSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_currencyGroupingSeparator, a3);
}

- (NSString)currencyDecimalSeparator
{
  return self->_currencyDecimalSeparator;
}

- (void)setCurrencyDecimalSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_currencyDecimalSeparator, a3);
}

- (BOOL)groupingSeparatorSpace
{
  return self->_groupingSeparatorSpace;
}

- (void)setGroupingSeparatorSpace:(BOOL)a3
{
  self->_groupingSeparatorSpace = a3;
}

- (BOOL)decimalSeparatorSpace
{
  return self->_decimalSeparatorSpace;
}

- (void)setDecimalSeparatorSpace:(BOOL)a3
{
  self->_decimalSeparatorSpace = a3;
}

- (NSMutableCharacterSet)localizedGroupingSet
{
  return self->_localizedGroupingSet;
}

- (void)setLocalizedGroupingSet:(id)a3
{
  objc_storeStrong((id *)&self->_localizedGroupingSet, a3);
}

- (NSMutableCharacterSet)localizedDecimalSet
{
  return self->_localizedDecimalSet;
}

- (void)setLocalizedDecimalSet:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDecimalSet, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDecimalSet, 0);
  objc_storeStrong((id *)&self->_localizedGroupingSet, 0);
  objc_storeStrong((id *)&self->_currencyDecimalSeparator, 0);
  objc_storeStrong((id *)&self->_currencyGroupingSeparator, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_groupingSeparator, 0);
  objc_storeStrong((id *)&self->_prevToken2, 0);
  objc_storeStrong((id *)&self->_prevToken, 0);
  objc_storeStrong((id *)&self->_lowercasedVariables, 0);
  objc_storeStrong((id *)&self->_wordBreakIndices, 0);
  objc_storeStrong((id *)&self->_lastToken, 0);
  objc_storeStrong((id *)&self->_peekTokens, 0);
  objc_storeStrong((id *)&self->_trie, 0);
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

id __36__CalculateTokenizer__findNextToken__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;

  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(*(id *)(a1 + 32), "peekIndex");
  v12 = a3 - objc_msgSend(*(id *)(a1 + 32), "peekIndex");
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "substringWithRange:", v11, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[CalculateToken tokenWithType:range:text:ranks:](CalculateToken, "tokenWithType:range:text:ranks:", a2, v11, v12, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "peekTokens");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v14);

  objc_msgSend(*(id *)(a1 + 32), "setPeekIndex:", a3);
  v16 = *(_BYTE **)(a1 + 32);
  if (v16[9] && a2 != 1 && v16[10])
    v16[11] = 1;
  if (a2 == 3 || +[CalculateToken isOpen:](CalculateToken, "isOpen:", a2))
    goto LABEL_12;
  if (a2 == 1)
    goto LABEL_30;
  if (a2 == 52 || a2 == 5)
  {
LABEL_12:
    v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "isMaybeX");
    if (a2 == 5 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "tokenType") == 39)
      v17 = 0;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "isOperand") & 1) != 0)
    {
      if (!v17)
      {
LABEL_20:
        if (a2 == 1)
          goto LABEL_30;
        goto LABEL_21;
      }
    }
    else if ((+[CalculateToken isClose:](CalculateToken, "isClose:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "tokenType")) & v17 & 1) == 0)
    {
      goto LABEL_20;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setTokenType:", 6);
    goto LABEL_20;
  }
LABEL_21:
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(*(_QWORD *)(a1 + 32) + 160));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), v14);
  v18 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v18 + 9))
  {
    if (!*(_BYTE *)(v18 + 10)
      && objc_msgSend(*(id *)(v18 + 160), "tokenType") == 31
      && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "tokenType") == 39)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "range");
      if (v19 == 1)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("y")))
        {

LABEL_29:
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
          objc_msgSend(*(id *)(a1 + 32), "addDeclaredVariable:", CFSTR("x"));
          goto LABEL_30;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Y"));

        if (v22)
          goto LABEL_29;
      }
    }
  }
LABEL_30:

  return v14;
}

void __36__CalculateTokenizer__findNextToken__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  BOOL v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = objc_msgSend(v9, "rangeOfCharacterFromSet:", whitespaceSet) == 0x7FFFFFFFFFFFFFFFLL;
  v8 = v9;
  if (v7)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v7 = objc_msgSend(v9, "rangeOfCharacterFromSet:", equalSet) == 0x7FFFFFFFFFFFFFFFLL;
      v8 = v9;
      if (!v7)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        goto LABEL_8;
      }
    }
    *a5 = 1;
  }
LABEL_8:

}

void __36__CalculateTokenizer__findNextToken__block_invoke_704(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  id v18;
  id v19;
  char v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v9 = a2;
  v10 = v9;
  if (*(_DWORD *)(a1 + 96) == 1)
  {
    objc_msgSend(v9, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CalculateTokenizer prepareString:](CalculateTokenizer, "prepareString:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(_QWORD *)(v13 + 40);
  v14 = (id *)(v13 + 40);
  if (!v15)
    objc_storeStrong(v14, v10);
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v35 = v10;
  if (!v16)
  {

    goto LABEL_27;
  }
  WeakRetained = objc_loadWeakRetained((id *)(v16 + 16));
  v18 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 8))
  {
    v19 = objc_loadWeakRetained((id *)(v16 + 16));
    v20 = objc_msgSend(v19, "compressed");

    if ((v20 & 1) != 0)
      goto LABEL_11;
    v18 = objc_loadWeakRetained((id *)(v16 + 16));
    -[Trie compress]((void **)v18);
  }

LABEL_11:
  v21 = -[TrieNode visit:create:](v16, v35, 0);

  if ((v21 & 1) == 0)
  {
LABEL_27:
    *a5 = 1;
    goto LABEL_28;
  }
  v22 = a3 + a4;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12)
    && v22 == *(_QWORD *)(a1 + 88) + 2
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", CFSTR("\\"))&& objc_msgSend(v35, "isEqualToString:", CFSTR(" ")))
  {
    -[TrieNode object](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v22;
  }
  if (v22 == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    -[TrieNode object](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

      if (v22 > v27)
      {
        -[TrieNode object](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) || (objc_msgSend(v28, "isLaTeX") & 1) == 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v29);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v22;
        }

      }
    }
    v30 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "wordBreakIndices");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v30 < v32)
    {
      objc_msgSend(*(id *)(a1 + 32), "wordBreakIndices");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (int)objc_msgSend(v34, "intValue");

    }
  }
LABEL_28:

}

uint64_t __36__CalculateTokenizer__findNextToken__block_invoke_2_707(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "rangeOfCharacterFromSet:", whitespaceSet);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    *a5 = 1;
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3 + a4;
  return result;
}

void __36__CalculateTokenizer__findNextToken__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;

  v27 = a2;
  if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", digitSet) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", symbolSet) == 0x7FFFFFFFFFFFFFFFLL
      && -[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", hebrewSet) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", punctuationSet) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", devanagariDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", eastArabicDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", wideDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
              v10 = 1;
            else
              v10 = 5;
          }
          else
          {
            v10 = 4;
          }
        }
        else
        {
          v10 = 3;
        }
      }
      else
      {
        v10 = 7;
      }
    }
    else
    {
      v10 = 6;
    }
  }
  else
  {
    v10 = 2;
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_DWORD *)(v11 + 24) == 1)
    *(_DWORD *)(v11 + 24) = v10;
  if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", anyDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
      && -[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
      if (!v22 || (objc_msgSend(v22, "isEqualToString:", v27) & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), a2);
        if (-[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR(",")))
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 3;
        else
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
        goto LABEL_54;
      }
    }
    else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24)
           && -[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216)) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) < 1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
        {
          objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("."));
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
            && (-[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR(".")) & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
          }
        }
        goto LABEL_54;
      }
    }
    else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24)
           && ((-[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("e")) & 1) != 0
            || -[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("E"))))
    {
      if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) < 1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        goto LABEL_37;
      }
    }
    else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (-[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", subtractSet) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
          && -[__CFString rangeOfCharacterFromSet:](v27, "rangeOfCharacterFromSet:", addSet) != 0x7FFFFFFFFFFFFFFFLL
          && *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) < 1)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
            goto LABEL_54;
          v23 = *(void **)(a1 + 40);
          v24 = CFSTR("+");
          goto LABEL_39;
        }
      }
      else if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) < 1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
          goto LABEL_54;
        v23 = *(void **)(a1 + 40);
        v24 = CFSTR("-");
        goto LABEL_39;
      }
    }
LABEL_59:
    *a5 = 1;
    v26 = v27;
    goto LABEL_60;
  }
  if (v10 != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_59;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  if (v10 != 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v13 = *(_DWORD *)(v12 + 24);
  v14 = __OFSUB__(v13, 1);
  v15 = v13 - 1;
  if (v15 < 0 == v14)
  {
    *(_DWORD *)(v12 + 24) = v15;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      if (!v16)
      {
        v17 = objc_opt_new();
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      }
      objc_msgSend(v16, "appendString:", v27);
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 40), "appendString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = 0;

      }
    }
    goto LABEL_54;
  }
LABEL_37:
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v23 = *(void **)(a1 + 40);
    v24 = v27;
LABEL_39:
    objc_msgSend(v23, "appendString:", v24);
  }
LABEL_54:
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v25 = a3 + a4;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), a2);
    v25 = a3 + a4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = a3 + a4;
  }
  v26 = v27;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = v25;
LABEL_60:

}

id __36__CalculateTokenizer__findNextToken__block_invoke_5(uint64_t a1, void *a2, unint64_t a3)
{
  id result;
  id v6;

  result = (id)objc_msgSend(a2, "isEqualToString:", CFSTR(","));
  if ((_DWORD)result)
  {
    if (a3 > objc_msgSend(*(id *)(a1 + 32), "peekIndex"))
      v6 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

uint64_t __36__CalculateTokenizer__findNextToken__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByApplyingTransform:reverse:", CFSTR("Fullwidth-Halfwidth; Any-Latin"), 0);
}

void __28__CalculateTokenizer_update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[3];
  int v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__CalculateTokenizer_update__block_invoke_2;
  v9[3] = &unk_1E6EA05F8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v10;
  +[Trie enumerateCharactersInKey:range:usingBlock:]((uint64_t)Trie, v6, a2, a3 - a2, v9);

  objc_msgSend(*(id *)(a1 + 32), "wordBreakIndices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  _Block_object_dispose(v10, 8);
}

void __28__CalculateTokenizer_update__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5;
  void *v6;
  int v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = objc_msgSend(v12, "rangeOfCharacterFromSet:", digitSet) == 0x7FFFFFFFFFFFFFFFLL;
  v6 = v12;
  if (!v5)
  {
    v7 = 2;
    goto LABEL_14;
  }
  if (objc_msgSend(v12, "rangeOfCharacterFromSet:", symbolSet) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v12, "rangeOfCharacterFromSet:", hebrewSet) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 6;
LABEL_13:
    v6 = v12;
    goto LABEL_14;
  }
  if (objc_msgSend(v12, "rangeOfCharacterFromSet:", punctuationSet) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 7;
    goto LABEL_13;
  }
  if (objc_msgSend(v12, "rangeOfCharacterFromSet:", devanagariDigitSet) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 3;
    goto LABEL_13;
  }
  v5 = objc_msgSend(v12, "rangeOfCharacterFromSet:", eastArabicDigitSet) == 0x7FFFFFFFFFFFFFFFLL;
  v6 = v12;
  if (v5)
  {
    v5 = objc_msgSend(v12, "rangeOfCharacterFromSet:", wideDigitSet) == 0x7FFFFFFFFFFFFFFFLL;
    v6 = v12;
    if (v5)
      v7 = 1;
    else
      v7 = 5;
  }
  else
  {
    v7 = 4;
  }
LABEL_14:

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(_DWORD *)(v8 + 24);
  if (v9 && ((~v7 & 6) == 0 || v7 != v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "wordBreakIndices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_DWORD *)(v8 + 24) = v7;

}

void __35__CalculateTokenizer__loadIfNeeded__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)newlineSet;
  newlineSet = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)whitespaceSet;
  whitespaceSet = v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)digitSet;
  digitSet = v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("०१२३४५६७८९"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)devanagariDigitSet;
  devanagariDigitSet = v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("٠١٢٣٤٥٦٧٨٩"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)eastArabicDigitSet;
  eastArabicDigitSet = v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("０１２３４５６７８９"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)wideDigitSet;
  wideDigitSet = v10;

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "formUnionWithCharacterSet:", digitSet);
  objc_msgSend(v12, "formUnionWithCharacterSet:", devanagariDigitSet);
  objc_msgSend(v12, "formUnionWithCharacterSet:", eastArabicDigitSet);
  objc_msgSend(v12, "formUnionWithCharacterSet:", wideDigitSet);
  v13 = (void *)anyDigitSet;
  anyDigitSet = (uint64_t)v12;
  v24 = v12;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("+＋➕"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)addSet;
  addSet = v14;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-﹣－➖–−"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)subtractSet;
  subtractSet = v16;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("=＝"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)equalSet;
  equalSet = v18;

  objc_msgSend((id)objc_opt_class(), "loadSymbolSet");
  objc_msgSend((id)objc_opt_class(), "loadPunctuationSet");
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 1424, 112);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)hebrewSet;
  hebrewSet = v20;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("  "));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)nbspSet;
  nbspSet = v22;

}

+ (void)loadSymbolSet
{
  if (loadSymbolSet_onceToken[0] != -1)
    dispatch_once(loadSymbolSet_onceToken, &__block_literal_global_87);
}

+ (id)symbolSet
{
  objc_msgSend(a1, "loadSymbolSet");
  return (id)symbolSet;
}

+ (void)loadPunctuationSet
{
  if (loadPunctuationSet_onceToken != -1)
    dispatch_once(&loadPunctuationSet_onceToken, &__block_literal_global_134);
}

+ (id)punctuationSet
{
  objc_msgSend(a1, "loadPunctuationSet");
  return (id)punctuationSet;
}

+ (id)nonWhitespaceLanguageSet
{
  if (nonWhitespaceLanguageSet_onceToken != -1)
    dispatch_once(&nonWhitespaceLanguageSet_onceToken, &__block_literal_global_135);
  return (id)nonWhitespaceLanguageSet_nonWhitespaceLanguageSet;
}

+ (id)symbolsTrie
{
  if (symbolsTrie_onceToken != -1)
    dispatch_once(&symbolsTrie_onceToken, &__block_literal_global_137);
  return (id)symbolsTrie_symbolsTrie;
}

+ (void)addSymbols:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(void *, uint64_t, void *);
  id v8;
  void (**v9)(void *, uint64_t, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CalculateTokenizer_addSymbols___block_invoke;
  aBlock[3] = &unk_1E6EA04D0;
  v19 = v3;
  v5 = v3;
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __33__CalculateTokenizer_addSymbols___block_invoke_2;
  v16[3] = &unk_1E6EA04F8;
  v6 = _Block_copy(aBlock);
  v17 = v6;
  v7 = (void (**)(void *, uint64_t, void *))_Block_copy(v16);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __33__CalculateTokenizer_addSymbols___block_invoke_3;
  v14[3] = &unk_1E6EA04F8;
  v15 = v6;
  v8 = v6;
  v9 = (void (**)(void *, uint64_t, void *))_Block_copy(v14);
  v7[2](v7, 4, &unk_1E6EACC68);
  v7[2](v7, 5, &unk_1E6EACC80);
  v7[2](v7, 6, &unk_1E6EACC98);
  v7[2](v7, 7, &unk_1E6EACCB0);
  v7[2](v7, 8, &unk_1E6EACCC8);
  v7[2](v7, 9, &unk_1E6EACCE0);
  v7[2](v7, 10, &unk_1E6EACCF8);
  v7[2](v7, 19, &unk_1E6EACD10);
  v7[2](v7, 20, &unk_1E6EACD28);
  v7[2](v7, 21, &unk_1E6EACD40);
  v7[2](v7, 22, &unk_1E6EACD58);
  v7[2](v7, 12, &unk_1E6EACD70);
  v7[2](v7, 36, &unk_1E6EACD88);
  v7[2](v7, 13, &unk_1E6EACDA0);
  v7[2](v7, 14, &unk_1E6EACDB8);
  v7[2](v7, 15, &unk_1E6EACDD0);
  v7[2](v7, 16, &unk_1E6EACDE8);
  v7[2](v7, 17, &unk_1E6EACE00);
  v7[2](v7, 18, &unk_1E6EACE18);
  v7[2](v7, 31, &unk_1E6EACE30);
  v7[2](v7, 33, &unk_1E6EACE48);
  v7[2](v7, 34, &unk_1E6EACE60);
  v7[2](v7, 37, &unk_1E6EACE78);
  v7[2](v7, 38, &unk_1E6EACE90);
  v7[2](v7, 27, &unk_1E6EACEA8);
  v7[2](v7, 28, &unk_1E6EACEC0);
  v7[2](v7, 29, &unk_1E6EACED8);
  v7[2](v7, 30, &unk_1E6EACEF0);
  v7[2](v7, 23, &unk_1E6EACF08);
  v7[2](v7, 24, &unk_1E6EACF20);
  v7[2](v7, 25, &unk_1E6EACF38);
  v7[2](v7, 26, &unk_1E6EACF50);
  +[CalculateTokenizer functionSet](CalculateTokenizer, "functionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 35, v11);

  v9[2](v9, 43, &unk_1E6EACF68);
  v9[2](v9, 44, &unk_1E6EACF80);
  v9[2](v9, 7, &unk_1E6EACF98);
  v9[2](v9, 6, &unk_1E6EACFB0);
  v9[2](v9, 12, &unk_1E6EACFC8);
  v9[2](v9, 37, &unk_1E6EACFE0);
  +[CalculateTokenizer laTeXFunctionSet](CalculateTokenizer, "laTeXFunctionSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 35, v13);

  v9[2](v9, 40, &unk_1E6EACFF8);
  v9[2](v9, 51, &unk_1E6EAD010);
  v9[2](v9, 41, &unk_1E6EAD028);
  v9[2](v9, 42, &unk_1E6EAD040);
  v9[2](v9, 1, &unk_1E6EAD058);
  v9[2](v9, 36, &unk_1E6EAD070);
  v9[2](v9, 13, &unk_1E6EAD088);
  v9[2](v9, 31, &unk_1E6EAD0A0);
  v9[2](v9, 45, &unk_1E6EAD0B8);
  v9[2](v9, 46, &unk_1E6EAD0D0);
  v9[2](v9, 47, &unk_1E6EAD0E8);
  v9[2](v9, 48, &unk_1E6EAD100);
  v9[2](v9, 49, &unk_1E6EAD118);
  v9[2](v9, 50, &unk_1E6EAD130);
  +[CalculateTokenizer addUnits:builtIn:](CalculateTokenizer, "addUnits:builtIn:", v5, 1);

}

+ (void)addUnits:(id)a3 builtIn:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void (*v12)(_QWORD *, const __CFString *, uint64_t, float);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[UnitsInfo converterUnits](UnitsInfo, "converterUnits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__CalculateTokenizer_addUnits_builtIn___block_invoke;
  aBlock[3] = &unk_1E6EA0520;
  v8 = v5;
  v25 = v8;
  v9 = v6;
  v26 = v9;
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __39__CalculateTokenizer_addUnits_builtIn___block_invoke_2;
  v22[3] = &unk_1E6EA0548;
  v10 = _Block_copy(aBlock);
  v23 = v10;
  v11 = _Block_copy(v22);
  if (addUnits_builtIn__onceToken[0] != -1)
    dispatch_once(addUnits_builtIn__onceToken, &__block_literal_global_426);
  v12 = (void (*)(_QWORD *, const __CFString *, uint64_t, float))v11[2];
  if (v4)
  {
    v12(v11, CFSTR("degree"), addUnits_builtIn__circ, 0.6);
  }
  else
  {
    v12(v11, CFSTR("fahrenheit"), addUnits_builtIn__circ, 0.0);
    ((void (*)(_QWORD *, const __CFString *, uint64_t, float))v11[2])(v11, CFSTR("celsius"), addUnits_builtIn__circ, 0.0);
    ((void (*)(_QWORD *, const __CFString *, uint64_t, float))v11[2])(v11, CFSTR("USD"), addUnits_builtIn__dollar, 0.2);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = (id)addUnits_builtIn__dollarCountries;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          ((void (*)(_QWORD *, _QWORD, uint64_t, float))v11[2])(v11, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), addUnits_builtIn__dollar, 1.0);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v15);
    }

  }
}

+ (NSSet)functionSet
{
  if (functionSet_onceToken != -1)
    dispatch_once(&functionSet_onceToken, &__block_literal_global_503);
  return (NSSet *)(id)functionSet_functionSet;
}

+ (id)laTeXFunctionSet
{
  if (laTeXFunctionSet_onceToken[0] != -1)
    dispatch_once(laTeXFunctionSet_onceToken, &__block_literal_global_617);
  return (id)laTeXFunctionSet_functionSet;
}

+ (id)prepareString:(id)a3
{
  return (id)objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
}

+ (id)tokenizerWithUnits:(id)a3
{
  id v3;
  CalculateTokenizer *v4;

  v3 = a3;
  v4 = -[CalculateTokenizer initWithUnits:]([CalculateTokenizer alloc], "initWithUnits:", v3);

  return v4;
}

+ (int)displayNameExponent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("2")) & 1) != 0 || (objc_msgSend(v3, "hasSuffix:", CFSTR("²")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v4 = 3;
    if ((objc_msgSend(v3, "hasSuffix:", CFSTR("3")) & 1) == 0)
    {
      if (objc_msgSend(v3, "hasSuffix:", CFSTR("³")))
        v4 = 3;
      else
        v4 = 0;
    }
  }

  return v4;
}

void __38__CalculateTokenizer_laTeXFunctionSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("\\sqrt"), CFSTR("\\lg"), CFSTR("\\log"), CFSTR("\\ln"), CFSTR("\\cos"), CFSTR("\\sin"), CFSTR("\\tan"), CFSTR("\\arccos"), CFSTR("\\arcsin"), CFSTR("\\arctan"), CFSTR("\\cosh"), CFSTR("\\sinh"), CFSTR("\\tanh"), CFSTR("\\sec"), CFSTR("\\csc"), CFSTR("\\cot"), CFSTR("\\sech"),
    CFSTR("\\csch"),
    CFSTR("\\coth"),
    CFSTR("\\min"),
    CFSTR("\\max"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)laTeXFunctionSet_functionSet;
  laTeXFunctionSet_functionSet = v0;

}

void __33__CalculateTokenizer_functionSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("√"), CFSTR("sqrt"), CFSTR("∛"), CFSTR("cbrt"), CFSTR("ln"), CFSTR("log"), CFSTR("sin"), CFSTR("cos"), CFSTR("tan"), CFSTR("asin"), CFSTR("acos"), CFSTR("atan"), CFSTR("sinh"), CFSTR("cosh"), CFSTR("tanh"), CFSTR("asinh"), CFSTR("acosh"),
    CFSTR("atanh"),
    CFSTR("arcsin"),
    CFSTR("arccos"),
    CFSTR("arctan"),
    CFSTR("arcsind"),
    CFSTR("arccosd"),
    CFSTR("arctand"),
    CFSTR("arcsinh"),
    CFSTR("arccosh"),
    CFSTR("arctanh"),
    CFSTR("pow"),
    CFSTR("root"),
    CFSTR("fact"),
    CFSTR("exp"),
    CFSTR("flip"),
    CFSTR("sind"),
    CFSTR("cosd"),
    CFSTR("tand"),
    CFSTR("asind"),
    CFSTR("acosd"),
    CFSTR("atand"),
    CFSTR("ceil"),
    CFSTR("floor"),
    CFSTR("round"),
    CFSTR("rint"),
    CFSTR("abs"),
    CFSTR("fabs"),
    CFSTR("j0"),
    CFSTR("j1"),
    CFSTR("y0"),
    CFSTR("y1"),
    CFSTR("erf"),
    CFSTR("erfc"),
    CFSTR("fmod"),
    CFSTR("hypot"),
    CFSTR("rem"),
    CFSTR("min"),
    CFSTR("max"),
    CFSTR("lgamma"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)functionSet_functionSet;
  functionSet_functionSet = v0;

}

void __39__CalculateTokenizer_addUnits_builtIn___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, float a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  UnitRank *v17;
  uint64_t v18;
  double v19;
  UnitRank *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[Trie objectForKeyedSubscript:](*(_QWORD *)(a1 + 32), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          +[UnitRanks unitRanksWithUnitsInfo:](UnitRanks, "unitRanksWithUnitsInfo:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[Trie setObject:forKeyedSubscript:](*(_QWORD *)(a1 + 32), v15, v14);
        }
        objc_msgSend(*(id *)(a1 + 40), "infoForUnitName:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [UnitRank alloc];
        v18 = objc_msgSend(v16, "unitID");
        *(float *)&v19 = a5;
        v20 = -[UnitRank initWithUnitID:rank:locale:](v17, "initWithUnitID:rank:locale:", v18, 0, v19);
        -[UnitRank setIsLaTeX:](v20, "setIsLaTeX:", a4);
        objc_msgSend(v15, "addUnitRank:", v20);
        objc_msgSend(v15, "sort");

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

}

uint64_t __39__CalculateTokenizer_addUnits_builtIn___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__CalculateTokenizer_addUnits_builtIn___block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)addUnits_builtIn__deg;
  addUnits_builtIn__deg = (uint64_t)&unk_1E6EAD148;

  v1 = (void *)addUnits_builtIn__circ;
  addUnits_builtIn__circ = (uint64_t)&unk_1E6EAD160;

  v2 = (void *)addUnits_builtIn__dollar;
  addUnits_builtIn__dollar = (uint64_t)&unk_1E6EAD178;

  v3 = (void *)addUnits_builtIn__dollarCountries;
  addUnits_builtIn__dollarCountries = (uint64_t)&unk_1E6EAD190;

}

void __33__CalculateTokenizer_addSymbols___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  UnitRank *v14;
  double v15;
  UnitRank *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[Trie objectForKeyedSubscript:](*(_QWORD *)(a1 + 32), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          +[UnitRanks unitRanksWithUnitsInfo:](UnitRanks, "unitRanksWithUnitsInfo:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[Trie setObject:forKeyedSubscript:](*(_QWORD *)(a1 + 32), v13, v12);
        }
        v14 = [UnitRank alloc];
        LODWORD(v15) = -1.0;
        v16 = -[UnitRank initWithUnitID:rank:locale:](v14, "initWithUnitID:rank:locale:", 0, 0, v15);
        -[UnitRank setTokenType:](v16, "setTokenType:", a2);
        -[UnitRank setIsLaTeX:](v16, "setIsLaTeX:", a4);
        objc_msgSend(v13, "addUnitRank:", v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

uint64_t __33__CalculateTokenizer_addSymbols___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __33__CalculateTokenizer_addSymbols___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __33__CalculateTokenizer_symbolsTrie__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)symbolsTrie_symbolsTrie;
  symbolsTrie_symbolsTrie = v0;

  return +[CalculateTokenizer addSymbols:](CalculateTokenizer, "addSymbols:", symbolsTrie_symbolsTrie);
}

void __46__CalculateTokenizer_nonWhitespaceLanguageSet__block_invoke()
{
  void *v0;
  id v1;
  void (**v2)(void *, uint64_t, uint64_t);
  uint64_t v3;
  void *v4;
  _QWORD aBlock[4];
  id v6;

  v0 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CalculateTokenizer_nonWhitespaceLanguageSet__block_invoke_2;
  aBlock[3] = &unk_1E6EA0488;
  v6 = v0;
  v1 = v0;
  v2 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v2[2](v2, 12288, 12543);
  v2[2](v2, 65280, 65519);
  v2[2](v2, 19968, 40879);
  v2[2](v2, 3584, 3711);
  v3 = objc_msgSend(v1, "copy");
  v4 = (void *)nonWhitespaceLanguageSet_nonWhitespaceLanguageSet;
  nonWhitespaceLanguageSet_nonWhitespaceLanguageSet = v3;

}

uint64_t __46__CalculateTokenizer_nonWhitespaceLanguageSet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCharactersInRange:", a2, a3 - a2);
}

void __40__CalculateTokenizer_loadPunctuationSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)punctuationSet;
  punctuationSet = v0;

}

void __35__CalculateTokenizer_loadSymbolSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v0);

  objc_msgSend(v3, "addCharactersInString:", CFSTR("\\#*×⋅⌈⌉⌊⌋＊"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("+＋➕"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("-﹣－➖–−"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("/÷⁄／"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("(（"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR(")）"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("^"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("<≪"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR(">≫"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("<⋘"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR(">⋙"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("%٪"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("&"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("|"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("=＝"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR(","));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("!"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("πΠ𝜋𝝥𝝅𝚷"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("{"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("}"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("["));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("]"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)symbolSet;
  symbolSet = v1;

}

@end
