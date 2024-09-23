@implementation HKPIIRedactor

+ (id)redactorWithNames:(id)a3 error:(id *)a4
{
  id v6;
  HKPIIRedactor *v7;
  uint64_t v8;
  NSDataDetector *dataDetectorAll;
  void *v10;
  uint64_t v11;
  NSDataDetector *dataDetectorSkipLink;
  void *v13;
  uint64_t v14;
  NSDataDetector *dataDetectorSkipPhoneNumbers;
  void *v16;
  uint64_t v17;
  NSDataDetector *dataDetectorSkipLinkSkipPhoneNumbers;
  void *v19;
  uint64_t v20;
  NSSet *names;
  uint64_t v22;
  NSRegularExpression *fullWordRegex;
  void *v24;
  uint64_t v25;
  NSRegularExpression *SSNRegex;
  void *v27;
  uint64_t v28;
  NSRegularExpression *longNumberRegex;
  HKPIIRedactor *v30;

  v6 = a3;
  v7 = objc_alloc_init(HKPIIRedactor);
  if (!v7)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 2104, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  dataDetectorAll = v7->_dataDetectorAll;
  v7->_dataDetectorAll = (NSDataDetector *)v8;

  -[HKPIIRedactor dataDetectorAll](v7, "dataDetectorAll");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 2072, a4);
  v11 = objc_claimAutoreleasedReturnValue();
  dataDetectorSkipLink = v7->_dataDetectorSkipLink;
  v7->_dataDetectorSkipLink = (NSDataDetector *)v11;

  -[HKPIIRedactor dataDetectorSkipLink](v7, "dataDetectorSkipLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 56, a4);
  v14 = objc_claimAutoreleasedReturnValue();
  dataDetectorSkipPhoneNumbers = v7->_dataDetectorSkipPhoneNumbers;
  v7->_dataDetectorSkipPhoneNumbers = (NSDataDetector *)v14;

  -[HKPIIRedactor dataDetectorSkipPhoneNumbers](v7, "dataDetectorSkipPhoneNumbers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 24, a4);
  v17 = objc_claimAutoreleasedReturnValue();
  dataDetectorSkipLinkSkipPhoneNumbers = v7->_dataDetectorSkipLinkSkipPhoneNumbers;
  v7->_dataDetectorSkipLinkSkipPhoneNumbers = (NSDataDetector *)v17;

  -[HKPIIRedactor dataDetectorSkipLinkSkipPhoneNumbers](v7, "dataDetectorSkipLinkSkipPhoneNumbers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_10;
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  names = v7->_names;
  v7->_names = (NSSet *)v20;

  objc_msgSend(a1, "_redactFullWordRegexWithError:", a4);
  v22 = objc_claimAutoreleasedReturnValue();
  fullWordRegex = v7->_fullWordRegex;
  v7->_fullWordRegex = (NSRegularExpression *)v22;

  -[HKPIIRedactor fullWordRegex](v7, "fullWordRegex");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    goto LABEL_10;
  objc_msgSend(a1, "_SSNRegularExpressionWithError:", a4);
  v25 = objc_claimAutoreleasedReturnValue();
  SSNRegex = v7->_SSNRegex;
  v7->_SSNRegex = (NSRegularExpression *)v25;

  -[HKPIIRedactor SSNRegex](v7, "SSNRegex");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(a1, "_longNumberRegexWithError:", a4);
    v28 = objc_claimAutoreleasedReturnValue();
    longNumberRegex = v7->_longNumberRegex;
    v7->_longNumberRegex = (NSRegularExpression *)v28;

    -[HKPIIRedactor longNumberRegex](v7, "longNumberRegex");
    v30 = (HKPIIRedactor *)objc_claimAutoreleasedReturnValue();

    if (v30)
      v30 = v7;
  }
  else
  {
LABEL_10:
    v30 = 0;
  }

  return v30;
}

- (id)redactedStringWithString:(id)a3
{
  return -[HKPIIRedactor redactedStringWithString:options:redactedCount:](self, "redactedStringWithString:options:redactedCount:", a3, 0, 0);
}

- (id)redactedStringWithString:(id)a3 redactedCount:(unint64_t *)a4
{
  return -[HKPIIRedactor redactedStringWithString:options:redactedCount:](self, "redactedStringWithString:options:redactedCount:", a3, 0, a4);
}

- (id)redactedStringWithString:(id)a3 options:(unint64_t)a4
{
  return -[HKPIIRedactor redactedStringWithString:options:redactedCount:](self, "redactedStringWithString:options:redactedCount:", a3, a4, 0);
}

- (id)redactedStringWithString:(id)a3 options:(unint64_t)a4 redactedCount:(unint64_t *)a5
{
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 1) != 0)
  {
    v9 = 0;
    if ((a4 & 4) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = -[HKPIIRedactor _redactDataDetectorTypesFromString:options:](self, "_redactDataDetectorTypesFromString:options:", v8, a4);
  if ((a4 & 4) == 0)
LABEL_5:
    v9 += -[HKPIIRedactor _redactNamesFromString:](self, "_redactNamesFromString:", v8);
LABEL_6:
  if ((a4 & 2) != 0)
  {
    if ((a4 & 8) != 0)
      goto LABEL_8;
LABEL_12:
    v9 += -[HKPIIRedactor _redactLongNumbersFromString:](self, "_redactLongNumbersFromString:", v8);
    if (!a5)
      return v8;
    goto LABEL_9;
  }
  v9 += -[HKPIIRedactor _redactSSNsFromString:](self, "_redactSSNsFromString:", v8);
  if ((a4 & 8) == 0)
    goto LABEL_12;
LABEL_8:
  if (a5)
LABEL_9:
    *a5 = v9;
  return v8;
}

- (unint64_t)_redactDataDetectorTypesFromString:(id)a3 options:(unint64_t)a4
{
  char v4;
  char v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a4;
  v6 = ~(_BYTE)a4;
  v7 = a3;
  if ((v6 & 0x30) != 0)
  {
    if ((v4 & 0x10) != 0)
    {
      -[HKPIIRedactor dataDetectorSkipLink](self, "dataDetectorSkipLink");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v4 & 0x20) != 0)
        -[HKPIIRedactor dataDetectorSkipPhoneNumbers](self, "dataDetectorSkipPhoneNumbers");
      else
        -[HKPIIRedactor dataDetectorAll](self, "dataDetectorAll");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[HKPIIRedactor dataDetectorSkipLinkSkipPhoneNumbers](self, "dataDetectorSkipLinkSkipPhoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_msgSend(v8, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("█████"));

  return v10;
}

- (unint64_t)_redactSSNsFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[HKPIIRedactor SSNRegex](self, "SSNRegex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HKPIIRedactor SSNRegex](self, "SSNRegex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), CFSTR("█████"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_SSNRegularExpressionWithError:(id *)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\b(?!219(?:-|)?09(?:-|)?9999|078(?:-|)?05(?:-|)?1120)(?!666|000|9\\d{2})\\d{3}(?:-|)?(?!00)\\d{2}(?:-|)?(?!0{4})\\d{4}\\b"), 64, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (unint64_t)_redactNamesFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKPIIRedactor names](self, "names");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[HKPIIRedactor names](self, "names", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v7)
    {
      v13 = 0;
      goto LABEL_15;
    }
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
        if ((unint64_t)objc_msgSend(v12, "length") >= 2)
          v9 += objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", v12, CFSTR("xxREPLACExx"), 385, 0, objc_msgSend(v4, "length"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);

    if (v9)
    {
      -[HKPIIRedactor fullWordRegex](self, "fullWordRegex");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), CFSTR("█████"));
LABEL_15:

      goto LABEL_16;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

+ (id)_redactFullWordRegexWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b(?:\\.|\\w)*%@(?:\\.|\\w)*\\b"), CFSTR("xxREPLACExx"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v4, 64, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (unint64_t)_redactLongNumbersFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKPIIRedactor longNumberRegex](self, "longNumberRegex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    -[HKPIIRedactor longNumberRegex](self, "longNumberRegex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "length");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __46__HKPIIRedactor__redactLongNumbersFromString___block_invoke;
    v24[3] = &unk_1E37EDAF8;
    v9 = v6;
    v25 = v9;
    v26 = &v27;
    objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v4, 0, 0, v8, v24);

    v19 = v28[3];
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "rangeValue");
          v16 = v15;
          objc_msgSend(&stru_1E37FD4C0, "stringByPaddingToLength:withString:startingAtIndex:", v15, CFSTR("█"), 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "replaceCharactersInRange:withString:", v14, v16, v17);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      }
      while (v11);
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __46__HKPIIRedactor__redactLongNumbersFromString___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "resultType") == 1024 && (unint64_t)objc_msgSend(v9, "numberOfRanges") >= 2)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      while (1)
      {
        v6 = objc_msgSend(v9, "rangeAtIndex:", v4);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL && !v5)
          break;
        v7 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v6, v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v4;
        v3 = 1;
        if (v4 >= objc_msgSend(v9, "numberOfRanges"))
          goto LABEL_11;
      }
      ++v4;
    }
    while (v4 < objc_msgSend(v9, "numberOfRanges", 0x7FFFFFFFFFFFFFFFLL));
    if ((v3 & 1) == 0)
      goto LABEL_12;
LABEL_11:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
LABEL_12:

}

+ (id)_longNumberRegexWithError:(id *)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:(?:\\d{2}(?:(\\d*)\\.(\\d+)))|(?:\\d\\.\\d(\\d+))|(?:\\d{2}(\\d+)))(?:[eE][-+]?(\\d+))?"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDataDetector *dataDetectorAll;
  id v5;

  dataDetectorAll = self->_dataDetectorAll;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dataDetectorAll, CFSTR("DataDetectorAll"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataDetectorSkipLink, CFSTR("DataDetectorSkipLink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataDetectorSkipPhoneNumbers, CFSTR("DataDetectorSkipPhoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataDetectorSkipLinkSkipPhoneNumbers, CFSTR("DataDetectorSkipLinkSkipPhoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_names, CFSTR("Names"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullWordRegex, CFSTR("FullWordRegex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_SSNRegex, CFSTR("SSNRegex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_longNumberRegex, CFSTR("LongNumberRegex"));

}

- (HKPIIRedactor)initWithCoder:(id)a3
{
  id v4;
  HKPIIRedactor *v5;
  uint64_t v6;
  NSDataDetector *dataDetectorAll;
  uint64_t v8;
  NSDataDetector *dataDetectorSkipLink;
  uint64_t v10;
  NSDataDetector *dataDetectorSkipPhoneNumbers;
  uint64_t v12;
  NSDataDetector *dataDetectorSkipLinkSkipPhoneNumbers;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *names;
  uint64_t v19;
  NSRegularExpression *fullWordRegex;
  uint64_t v21;
  NSRegularExpression *SSNRegex;
  uint64_t v23;
  NSRegularExpression *longNumberRegex;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKPIIRedactor;
  v5 = -[HKPIIRedactor init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataDetectorAll"));
    v6 = objc_claimAutoreleasedReturnValue();
    dataDetectorAll = v5->_dataDetectorAll;
    v5->_dataDetectorAll = (NSDataDetector *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataDetectorSkipLink"));
    v8 = objc_claimAutoreleasedReturnValue();
    dataDetectorSkipLink = v5->_dataDetectorSkipLink;
    v5->_dataDetectorSkipLink = (NSDataDetector *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataDetectorSkipPhoneNumbers"));
    v10 = objc_claimAutoreleasedReturnValue();
    dataDetectorSkipPhoneNumbers = v5->_dataDetectorSkipPhoneNumbers;
    v5->_dataDetectorSkipPhoneNumbers = (NSDataDetector *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataDetectorSkipLinkSkipPhoneNumbers"));
    v12 = objc_claimAutoreleasedReturnValue();
    dataDetectorSkipLinkSkipPhoneNumbers = v5->_dataDetectorSkipLinkSkipPhoneNumbers;
    v5->_dataDetectorSkipLinkSkipPhoneNumbers = (NSDataDetector *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("Names"));
    v17 = objc_claimAutoreleasedReturnValue();
    names = v5->_names;
    v5->_names = (NSSet *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FullWordRegex"));
    v19 = objc_claimAutoreleasedReturnValue();
    fullWordRegex = v5->_fullWordRegex;
    v5->_fullWordRegex = (NSRegularExpression *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSNRegex"));
    v21 = objc_claimAutoreleasedReturnValue();
    SSNRegex = v5->_SSNRegex;
    v5->_SSNRegex = (NSRegularExpression *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LongNumberRegex"));
    v23 = objc_claimAutoreleasedReturnValue();
    longNumberRegex = v5->_longNumberRegex;
    v5->_longNumberRegex = (NSRegularExpression *)v23;

  }
  return v5;
}

- (NSSet)names
{
  return self->_names;
}

- (NSDataDetector)dataDetectorAll
{
  return self->_dataDetectorAll;
}

- (NSDataDetector)dataDetectorSkipLink
{
  return self->_dataDetectorSkipLink;
}

- (NSDataDetector)dataDetectorSkipPhoneNumbers
{
  return self->_dataDetectorSkipPhoneNumbers;
}

- (NSDataDetector)dataDetectorSkipLinkSkipPhoneNumbers
{
  return self->_dataDetectorSkipLinkSkipPhoneNumbers;
}

- (NSRegularExpression)fullWordRegex
{
  return self->_fullWordRegex;
}

- (NSRegularExpression)SSNRegex
{
  return self->_SSNRegex;
}

- (NSRegularExpression)longNumberRegex
{
  return self->_longNumberRegex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longNumberRegex, 0);
  objc_storeStrong((id *)&self->_SSNRegex, 0);
  objc_storeStrong((id *)&self->_fullWordRegex, 0);
  objc_storeStrong((id *)&self->_dataDetectorSkipLinkSkipPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_dataDetectorSkipPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_dataDetectorSkipLink, 0);
  objc_storeStrong((id *)&self->_dataDetectorAll, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

@end
