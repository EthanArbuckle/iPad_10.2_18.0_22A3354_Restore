@implementation CLKCompoundTextProvider

- (CLKCompoundTextProvider)initWithFormat:(id)a3 arguments:(char *)a4
{
  id v6;
  CLKCompoundTextProvider *v7;
  NSMutableArray *v8;
  NSMutableArray *textProviders;
  NSMutableArray *v10;
  NSMutableArray *segments;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKCompoundTextProvider;
  v7 = -[CLKTextProvider initPrivate](&v13, sel_initPrivate);
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    textProviders = v7->_textProviders;
    v7->_textProviders = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    segments = v7->_segments;
    v7->_segments = v10;

    -[CLKCompoundTextProvider _processFormat:arguments:](v7, "_processFormat:arguments:", v6, a4);
  }

  return v7;
}

- (CLKCompoundTextProvider)initWithSegments:(id)a3 textProviders:(id)a4
{
  id v6;
  id v7;
  CLKCompoundTextProvider *v8;
  uint64_t v9;
  NSMutableArray *textProviders;
  uint64_t v11;
  NSMutableArray *segments;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKCompoundTextProvider;
  v8 = -[CLKTextProvider initPrivate](&v14, sel_initPrivate);
  if (v8)
  {
    v9 = objc_msgSend(v7, "mutableCopy");
    textProviders = v8->_textProviders;
    v8->_textProviders = (NSMutableArray *)v9;

    v11 = objc_msgSend(v6, "mutableCopy");
    segments = v8->_segments;
    v8->_segments = (NSMutableArray *)v11;

  }
  return v8;
}

+ (id)compoundProviderWithLocalizedFormat:(id)a3 localizedTextProviders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __CFString *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  __int128 v32;
  id v33;
  id v34;
  int v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17A8], "localizedScannerWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  if ((objc_msgSend(v8, "isAtEnd") & 1) != 0)
  {
    v12 = &stru_24CBFCB28;
    goto LABEL_33;
  }
  v33 = a1;
  v34 = v6;
  v13 = 0;
  v12 = &stru_24CBFCB28;
  *(_QWORD *)&v11 = 138412546;
  v32 = v11;
  do
  {
    v36 = 0;
    objc_msgSend(v8, "scanUpToString:intoString:", CFSTR("%"), &v36, v32);
    v14 = v36;
    if (v14)
    {
      -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v15;
    }
    if (!objc_msgSend(v8, "scanString:intoString:", CFSTR("%"), 0))
    {
LABEL_21:
      v19 = 0;
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "scanString:intoString:", CFSTR("@"), 0))
    {
      if (objc_msgSend(v7, "count") <= (unint64_t)v13)
      {
        CLKLoggingObjectForDomain(4);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v34;
          _os_log_impl(&dword_2114F4000, v21, OS_LOG_TYPE_DEFAULT, "Error: Format string '%@' has more %% conversions than data arguments", buf, 0xCu);
        }
        goto LABEL_23;
      }
      objc_msgSend(v9, "addObject:", v12);

      v16 = v7;
      v17 = v13;
    }
    else
    {
      if (objc_msgSend(v8, "scanString:intoString:", CFSTR("%"), 0))
      {
        -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("%"));
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = 0;
        v12 = (__CFString *)v20;
        goto LABEL_24;
      }
      v35 = 0;
      if (!objc_msgSend(v8, "scanInt:", &v35))
      {
        CLKLoggingObjectForDomain(4);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v34;
          v23 = v21;
          v24 = "Error: Format string '%@' contains unsupported format";
          v25 = 12;
LABEL_29:
          _os_log_error_impl(&dword_2114F4000, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
        }
LABEL_23:

        v19 = 1;
        goto LABEL_24;
      }
      if (!objc_msgSend(v8, "scanString:intoString:", CFSTR("$@"), 0))
        goto LABEL_21;
      v22 = v35;
      if (v35 < 1 || objc_msgSend(v7, "count") < v22)
      {
        CLKLoggingObjectForDomain(4);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          v38 = v34;
          v39 = 1024;
          LODWORD(v40) = v35;
          v23 = v21;
          v24 = "Error: Format string '%@' contains position '%i' that exceeds data arguments";
          v25 = 18;
          goto LABEL_29;
        }
        goto LABEL_23;
      }
      objc_msgSend(v9, "addObject:", v12);

      v17 = v35 - 1;
      v16 = v7;
    }
    objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

    v19 = 0;
    ++v13;
    v12 = &stru_24CBFCB28;
LABEL_24:

  }
  while ((objc_msgSend(v8, "isAtEnd") & 1) == 0 && !v19);
  if ((v19 & 1) != 0)
  {
    v26 = 0;
    v6 = v34;
    goto LABEL_40;
  }
  v6 = v34;
  a1 = v33;
LABEL_33:
  objc_msgSend(v9, "addObject:", v12);
  v27 = objc_msgSend(v9, "count");
  v28 = objc_msgSend(v10, "count") + 1;
  CLKLoggingObjectForDomain(4);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v27 == v28)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v38 = v6;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_2114F4000, v30, OS_LOG_TYPE_DEFAULT, "Will create compound provider for '%@' with segments: %@ textProviders: %@", buf, 0x20u);
    }

    v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSegments:textProviders:", v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v38 = v6;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v10;
      _os_log_error_impl(&dword_2114F4000, v30, OS_LOG_TYPE_ERROR, "Failed to create compound provider for '%@' with segments: %@ textProviders: %@", buf, 0x20u);
    }

    v26 = 0;
  }
LABEL_40:

  return v26;
}

+ (id)compoundTextProviderCurrentlyFormattingOnThisThread
{
  if (_PthreadKey_onceToken != -1)
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  return pthread_getspecific(_PthreadKey_key);
}

- (void)addTextProvider:(id)a3 andGetPlaceholderString:(id *)a4
{
  NSMutableArray *textProviders;
  id v7;
  uint64_t v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  textProviders = self->_textProviders;
  v7 = a3;
  v8 = -[NSMutableArray count](textProviders, "count");
  v9 = self->_textProviders;
  objc_msgSend(v7, "finalizedCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](v9, "addObject:", v10);
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("Ω-♨︎-Д-⚽︎-猫"), v12, CFSTR("止"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *a4 = v13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKCompoundTextProvider;
  -[CLKTextProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)timeTravelUpdateFrequency
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_textProviders;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "timeTravelUpdateFrequency", (_QWORD)v10);
        if (v5 <= v8)
          v5 = v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_startSessionWithDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_textProviders;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_startSessionWithDate:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_sessionCacheKey
{
  NSString *sessionCacheKey;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  sessionCacheKey = self->_sessionCacheKey;
  if (!sessionCacheKey)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_textProviders;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "_sessionCacheKey");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = self->_sessionCacheKey;
            if (v10)
            {
              -[NSString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("--%@"), v9);
              v11 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v11 = v9;
            }
            v12 = self->_sessionCacheKey;
            self->_sessionCacheKey = v11;

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    sessionCacheKey = self->_sessionCacheKey;
  }
  return sessionCacheKey;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[NSMutableArray count](self->_textProviders, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_textProviders;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v11), "sessionAttributedTextForIndex:withStyle:", a3, v6, (_QWORD)v27);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {

            v14 = -[NSMutableArray count](self->_textProviders, "count");
            v13 = objc_alloc_init(MEMORY[0x24BDD1688]);
            if (v14)
            {
              for (i = 0; i != v14; ++i)
              {
                -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", i);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[CLKCompoundTextProvider _attributedStringForSegment:withStyle:](self, "_attributedStringForSegment:withStyle:", v16, v6);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "appendAttributedString:", v17);

                -[NSMutableArray objectAtIndex:](self->_textProviders, "objectAtIndex:", i);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[CLKCompoundTextProvider _replacementForTextProvider:index:withStyle:](self, "_replacementForTextProvider:index:withStyle:", v18, a3, v6);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "appendAttributedString:", v19);

              }
            }
            -[NSMutableArray lastObject](self->_segments, "lastObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CLKCompoundTextProvider _attributedStringForSegment:withStyle:](self, "_attributedStringForSegment:withStyle:", v20, v6);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "appendAttributedString:", v21);

            if ((objc_msgSend(v6, "shouldEmbedTintColors") & 1) != 0)
            {
              -[CLKTextProvider tintColor](self, "tintColor");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                v31 = *MEMORY[0x24BEBD278];
                -[CLKTextProvider tintColor](self, "tintColor");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v23;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addAttributesPreservingOriginals:range:", v24, 0, objc_msgSend(v13, "length"));

              }
            }
            goto LABEL_21;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v9)
          continue;
        break;
      }
    }

    v13 = 0;
  }
  else
  {
    -[NSMutableArray firstObject](self->_segments, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v13 = 0;
    }
    else
    {
      -[CLKCompoundTextProvider _attributedStringForSegment:withStyle:](self, "_attributedStringForSegment:withStyle:", v25, v6);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_21:

  return v13;
}

- (id)_attributedStringForSegment:(id)a3 withStyle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "uppercase"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseStringWithLocale:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  v9 = objc_alloc(MEMORY[0x24BDD1458]);
  v15 = *MEMORY[0x24BEBD270];
  objc_msgSend(v6, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v5, v11);

  objc_msgSend(v12, "_attributedStringWithOtherAttributesFromStyle:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24CBFCB28);

  return v13;
}

- (id)_replacementForTextProvider:(id)a3 index:(unint64_t)a4 withStyle:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  if ((a4 & 0x8000000000000000) != 0)
  {
    v10 = 0;
  }
  else
  {
    do
    {
      objc_msgSend(v7, "sessionAttributedTextForIndex:withStyle:", a4, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = a4-- != 0;
    }
    while (v11 && !v9);
  }
  objc_msgSend(v10, "_attributedStringWithOtherAttributesFromStyle:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24CBFCB28);

  return v12;
}

- (void)_endSession
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *sessionCacheKey;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_textProviders;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "_endSession", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  sessionCacheKey = self->_sessionCacheKey;
  self->_sessionCacheKey = 0;

}

- (BOOL)_validate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)CLKCompoundTextProvider;
  if (!-[CLKTextProvider _validate](&v14, sel__validate))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_textProviders;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "validate", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (int64_t)_updateFrequency
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_textProviders;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_updateFrequency", (_QWORD)v10);
        if (v5 <= v8)
          v5 = v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKCompoundTextProvider *v4;
  uint64_t v5;
  NSMutableArray *textProviders;
  uint64_t v7;
  NSMutableArray *segments;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLKCompoundTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (v4 != self)
  {
    v5 = -[NSMutableArray copy](self->_textProviders, "copy");
    textProviders = v4->_textProviders;
    v4->_textProviders = (NSMutableArray *)v5;

    v7 = -[NSMutableArray copy](self->_segments, "copy");
    segments = v4->_segments;
    v4->_segments = (NSMutableArray *)v7;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKCompoundTextProvider;
  if (-[CLKTextProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_textProviders, v4[16]))
  {
    v5 = CLKEqualObjects(self->_segments, v4[17]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKCompoundTextProvider;
  v3 = -[CLKTextProvider hash](&v6, sel_hash);
  v4 = &v3[-[NSMutableArray hash](self->_textProviders, "hash")];
  return (unint64_t)&v4[4 * -[NSMutableArray hash](self->_segments, "hash")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKCompoundTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_textProviders, CFSTR("_textProviders"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_segments, CFSTR("_segments"));

}

- (CLKCompoundTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKCompoundTextProvider *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *textProviders;
  NSMutableArray *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *segments;
  NSMutableArray *v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLKCompoundTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_textProviders"));
    v9 = objc_claimAutoreleasedReturnValue();
    textProviders = v5->_textProviders;
    v5->_textProviders = (NSMutableArray *)v9;

    v11 = v5->_textProviders;
    v12 = objc_opt_class();
    CLKValidateArray(v11, v12);
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_segments"));
    v16 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v16;

    v18 = v5->_segments;
    v19 = objc_opt_class();
    CLKValidateArray(v18, v19);

  }
  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)CLKCompoundTextProvider;
  v20 = a3;
  v3 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v30, sel__initWithJSONObjectRepresentation_);
  if (v3)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary must be an array - invalid value: %@"), CFSTR("textProviders"), v4);
    v5 = objc_opt_new();
    v6 = (void *)*((_QWORD *)v3 + 16);
    *((_QWORD *)v3 + 16) = v5;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(obj);
          +[CLKTextProvider providerWithJSONObjectRepresentation:](CLKTextProvider, "providerWithJSONObjectRepresentation:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v3 + 16), "addObject:", v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v7);
    }

    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("format segments"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary must be an array - invalid value: %@"), CFSTR("format segments"), v11);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary must be an array of strings - invalid object: %@"), CFSTR("format segments"), v16);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v3 + 17);
    *((_QWORD *)v3 + 17) = v17;

  }
  return v3;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKCompoundTextProvider;
  -[CLKTextProvider JSONObjectRepresentation](&v7, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCompoundTextProvider _arrayOfTextProviderJSONObjectRepresentations](self, "_arrayOfTextProviderJSONObjectRepresentations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("textProviders"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", self->_segments);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("format segments"));

  return v3;
}

- (id)_arrayOfTextProviderJSONObjectRepresentations
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_textProviders;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "JSONObjectRepresentation", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_processFormat:(id)a3 arguments:(char *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  int NextSegment;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  char v18;
  __CFString *v19;
  void *v20;
  id v21;
  __CFString *v22;
  unint64_t v23;
  uint64_t v24;

  v21 = a3;
  if (_PthreadKey_onceToken != -1)
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  v6 = pthread_getspecific(_PthreadKey_key);
  if (_PthreadKey_onceToken != -1)
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  pthread_setspecific(_PthreadKey_key, self);
  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:locale:arguments:", v21, v8, a4);

  if (_PthreadKey_onceToken != -1)
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  pthread_setspecific(_PthreadKey_key, v6);
  v10 = -[NSMutableArray count](self->_textProviders, "count");
  v11 = (void *)-[NSMutableArray copy](self->_textProviders, "copy");
  -[NSMutableArray removeAllObjects](self->_textProviders, "removeAllObjects");
  v12 = v9;
  v23 = 0;
  v24 = 0;
  v22 = 0;
  NextSegment = _GetNextSegment(v12, v10, &v22, &v23, &v24);
  v14 = v22;
  v15 = v14;
  v20 = v12;
  if (NextSegment)
  {
    do
    {
      -[NSMutableArray addObject:](self->_segments, "addObject:", v15);
      objc_msgSend(v11, "objectAtIndex:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_textProviders, "addObject:", v16);
      objc_msgSend(v12, "substringFromIndex:", v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v15;
      v18 = _GetNextSegment(v17, v10, &v22, &v23, &v24);
      v19 = v22;

      v15 = v19;
      v12 = v17;
    }
    while ((v18 & 1) != 0);
  }
  else
  {
    v17 = v12;
    v19 = v14;
  }
  -[NSMutableArray addObject:](self->_segments, "addObject:", v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCacheKey, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_textProviders, 0);
}

@end
