@implementation CLKTextProvider

+ (CLKTextProvider)localizableTextProviderWithStringsFileTextKey:(NSString *)textKey
{
  return (CLKTextProvider *)objc_msgSend(a1, "localizableTextProviderWithStringsFileTextKey:shortTextKey:", textKey, 0);
}

+ (CLKTextProvider)localizableTextProviderWithStringsFileTextKey:(NSString *)textKey shortTextKey:(NSString *)shortTextKey
{
  NSString *v5;
  NSString *v6;
  CLKLocalizableSimpleTextProvider *v7;

  v5 = shortTextKey;
  v6 = textKey;
  v7 = -[CLKLocalizableSimpleTextProvider initWithTextKey:shortTextKey:]([CLKLocalizableSimpleTextProvider alloc], "initWithTextKey:shortTextKey:", v6, v5);

  return (CLKTextProvider *)v7;
}

+ (CLKTextProvider)localizableTextProviderWithStringsFileFormatKey:(NSString *)formatKey textProviders:(NSArray *)textProviders
{
  NSArray *v5;
  NSString *v6;
  CLKLocalizableCompoundTextProvider *v7;

  v5 = textProviders;
  v6 = formatKey;
  v7 = -[CLKLocalizableCompoundTextProvider initWithFormatKey:textProviders:]([CLKLocalizableCompoundTextProvider alloc], "initWithFormatKey:textProviders:", v6, v5);

  return (CLKTextProvider *)v7;
}

+ (CLKTextProvider)textProviderWithFormat:(NSString *)format
{
  va_list va;

  va_start(va, format);
  objc_msgSend(a1, "textProviderWithFormat:arguments:", format, va);
  return (CLKTextProvider *)(id)objc_claimAutoreleasedReturnValue();
}

+ (CLKTextProvider)textProviderWithFormat:(id)a3 arguments:(char *)a4
{
  id v5;
  CLKCompoundTextProvider *v6;

  v5 = a3;
  v6 = -[CLKCompoundTextProvider initWithFormat:arguments:]([CLKCompoundTextProvider alloc], "initWithFormat:arguments:", v5, a4);

  return (CLKTextProvider *)v6;
}

- (id)initPrivate
{
  CLKTextProvider *v2;
  CLKTextProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKTextProvider;
  v2 = -[CLKTextProvider init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CLKTextProvider _commonInit](v2, "_commonInit");
  return v3;
}

+ (CLKTextProvider)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKTextProvider;
  return (CLKTextProvider *)objc_msgSendSuper2(&v3, "new");
}

- (void)_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *updateHandlersByToken;
  id v5;

  self->_paused = 1;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  updateHandlersByToken = self->_updateHandlersByToken;
  self->_updateHandlersByToken = v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__localeChanged, *MEMORY[0x24BDBCA70], 0);

}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  __26__CLKTextProvider_dealloc__block_invoke((uint64_t)self, self->_secondTimerToken);
  __26__CLKTextProvider_dealloc__block_invoke(v3, self->_minuteTimerToken);
  __26__CLKTextProvider_dealloc__block_invoke(v4, self->_30fpsTimerToken);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDBCA70], 0);

  v6.receiver = self;
  v6.super_class = (Class)CLKTextProvider;
  -[CLKTextProvider dealloc](&v6, sel_dealloc);
}

void __26__CLKTextProvider_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void (**v4)(_QWORD);
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __26__CLKTextProvider_dealloc__block_invoke_2;
    v5[3] = &unk_24CBF9F60;
    v6 = v2;
    v4 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v5);
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
      v4[2](v4);
    else
      dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
}

void __26__CLKTextProvider_dealloc__block_invoke_2(uint64_t a1)
{
  id v2;

  +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopUpdatesForToken:", *(_QWORD *)(a1 + 32));

}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[CLKTextProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
  }
}

- (id)attributedString
{
  return (id)objc_opt_new();
}

- (id)attributedTextAndSize:(CGSize *)a3 forMaxWidth:(double)a4 withStyle:(id)a5 now:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, uint64_t);
  void *v18;
  CLKTextProvider *v19;
  id v20;

  v10 = a5;
  if (a4 >= 0.00000011920929)
  {
    -[CLKTextProvider _startSessionWithDate:](self, "_startSessionWithDate:", a6);
    -[CLKTextProvider _sessionCacheKey](self, "_sessionCacheKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTextProvider _cacheForKey:](self, "_cacheForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __67__CLKTextProvider_attributedTextAndSize_forMaxWidth_withStyle_now___block_invoke;
    v18 = &unk_24CBFABA0;
    v19 = self;
    v20 = v10;
    objc_msgSend(v13, "attributedStringAndSize:forMaxWidth:withStyle:generator:", a3, v20, &v15, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTextProvider _endSession](self, "_endSession", v15, v16, v17, v18, v19);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __67__CLKTextProvider_attributedTextAndSize_forMaxWidth_withStyle_now___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_sessionAttributedTextForIndex:withStyle:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 75))
  {
    objc_msgSend((id)v4, "_italicize:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v5;

    v3 = v6;
    return v3;
  }
  if (*(_BYTE *)(v4 + 76))
  {
    objc_msgSend((id)v4, "_monospacedNumbers:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (*(_QWORD *)(v4 + 96))
  {
    objc_msgSend((id)v4, "_addTrackingAttribute:tracking:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v3;
}

- (CGSize)minimumSizeWithStyle:(id)a3 now:(id)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v7 = 0.0;
  v8 = 0.0;
  v4 = -[CLKTextProvider attributedTextAndSize:forMaxWidth:withStyle:now:](self, "attributedTextAndSize:forMaxWidth:withStyle:now:", &v7, a3, a4, 0.00000011920929);
  v5 = v7;
  v6 = v8;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  -[CLKTextProvider _sessionCacheKey](self, "_sessionCacheKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKTextProvider _cacheForKey:](self, "_cacheForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__CLKTextProvider_sessionAttributedTextForIndex_withStyle___block_invoke;
  v12[3] = &unk_24CBFABA0;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v8, "attributedStringForIndex:withStyle:generator:", a3, v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __59__CLKTextProvider_sessionAttributedTextForIndex_withStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionAttributedTextForIndex:withStyle:", a2, *(_QWORD *)(a1 + 40));
}

- (void)finalize
{
  self->_finalized = 1;
}

- (id)finalizedCopy
{
  CLKTextProvider *v2;

  if (self->_finalized)
  {
    v2 = self;
  }
  else
  {
    v2 = (CLKTextProvider *)-[CLKTextProvider copy](self, "copy");
    -[CLKTextProvider finalize](v2, "finalize");
  }
  return v2;
}

- (id)startUpdatesWithHandler:(id)a3
{
  void *v4;
  unint64_t nextUpdateToken;
  id v6;
  void *v7;
  NSMutableDictionary *updateHandlersByToken;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  nextUpdateToken = self->_nextUpdateToken;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", nextUpdateToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  updateHandlersByToken = self->_updateHandlersByToken;
  ++self->_nextUpdateToken;
  v9 = (void *)objc_msgSend(v6, "copy");

  -[NSMutableDictionary setObject:forKey:](updateHandlersByToken, "setObject:forKey:", v9, v7);
  -[CLKTextProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
  return v7;
}

- (void)stopUpdatesForToken:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_updateHandlersByToken, "removeObjectForKey:", a3);
  -[CLKTextProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  +[CLKCompoundTextProvider compoundTextProviderCurrentlyFormattingOnThisThread](CLKCompoundTextProvider, "compoundTextProviderCurrentlyFormattingOnThisThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v8 = 0;
    objc_msgSend(v3, "addTextProvider:andGetPlaceholderString:", self, &v8);
    v5 = v8;
  }
  else
  {
    -[CLKTextProvider _description](self, "_description");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorExists:(BOOL *)a4
{
  return -[CLKTextProvider _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:](self, "_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:", a3, 0, a4);
}

- (id)_timeFormatByRemovingDesignatorOfTimeFormat:(id)a3
{
  return -[CLKTextProvider _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:](self, "_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:", a3, 1, 0);
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 andRemovingDesignator:(BOOL)a4 designatorExists:(BOOL *)a5
{
  _BOOL4 v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  BOOL *v40;
  id v41;
  _BOOL4 v42;
  _BOOL4 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v6 = a4;
  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD1500], "_componentsFromFormatString:", v7);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v10)
  {
    v11 = v10;
    v40 = a5;
    v41 = v7;
    v12 = *(_QWORD *)v45;
    v13 = *MEMORY[0x24BDBCA80];
    v14 = *MEMORY[0x24BDBCA88];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "hasPrefix:", CFSTR("a")) & 1) != 0)
          {
            v19 = objc_msgSend(v9, "indexOfObject:", v16);

            goto LABEL_13;
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v11)
        continue;
      break;
    }
    v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
    a5 = v40;
    v7 = v41;
    v8 = 0x24BDD1000;
  }
  else
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (a5)
    *a5 = v19 != 0x7FFFFFFFFFFFFFFFLL;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_41;
  if (!CLKDesignatorRequiresWhitespace() || v6)
  {
    if (v19)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v19 - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA80]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "BOOLValue"))
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA88]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v24 = v7;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v25);
        v42 = v6;
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v24;
        v20 = objc_msgSend(v26, "length") == 0;

        v6 = v42;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
    if (v19 < objc_msgSend(v9, "count") - 1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v19 + 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA80]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "BOOLValue"))
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA88]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v30 = v7;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v31);
        v43 = v6;
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v30;
        v33 = objc_msgSend(v32, "length") == 0;

        v6 = v43;
      }
      else
      {
        v33 = 0;
      }

      if (v20)
      {
LABEL_36:
        v34 = (void *)objc_msgSend(v9, "mutableCopy");
        v35 = v34;
        if (v33)
        {
          objc_msgSend(v34, "removeObjectAtIndex:", v19 + 1);
          if (!v6)
          {
LABEL_38:
            if (!v20)
            {
LABEL_40:
              v36 = v35;

              objc_msgSend(*(id *)(v8 + 1280), "_formatStringFromComponents:", v36);
              v37 = objc_claimAutoreleasedReturnValue();

              v7 = (id)v37;
              v9 = v36;
              goto LABEL_41;
            }
LABEL_39:
            objc_msgSend(v35, "removeObjectAtIndex:", v19 - 1);
            goto LABEL_40;
          }
        }
        else if (!v6)
        {
          goto LABEL_38;
        }
        objc_msgSend(v35, "removeObjectAtIndex:", v19);
        if (!v20)
          goto LABEL_40;
        goto LABEL_39;
      }
      goto LABEL_34;
    }
  }
  else
  {
    v20 = 0;
  }
  v33 = 0;
  if (v20)
    goto LABEL_36;
LABEL_34:
  if (v33 || v6)
    goto LABEL_36;
LABEL_41:
  v38 = v7;

  return v38;
}

- (id)_sessionCacheKey
{
  return 0;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  return 0;
}

- (BOOL)_validate
{
  return 1;
}

- (id)_description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKTextProvider;
  -[CLKTextProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_updateFrequency
{
  return 0;
}

- (id)_italicize:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = *MEMORY[0x24BEBD270];
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBD270], 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  +[CLKFont fontWithDescriptor:size:](CLKFont, "fontWithDescriptor:size:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addAttribute:value:range:", v4, v8, 0, objc_msgSend(v3, "length"));
  return v3;
}

- (id)_monospacedNumbers:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = *MEMORY[0x24BEBD270];
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBD270], 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BEBE188];
  v7 = *MEMORY[0x24BEBE1A0];
  v14[0] = *MEMORY[0x24BEBE1B0];
  v14[1] = v7;
  v15[0] = &unk_24CC17788;
  v15[1] = &unk_24CC177A0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pointSize");
  +[CLKFont fontWithDescriptor:size:](CLKFont, "fontWithDescriptor:size:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:value:range:", v4, v12, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (id)_addTrackingAttribute:(id)a3 tracking:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x24BEBD2E0], v5, 0, v7);

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

- (id)_defaultCache
{
  CLKTextProviderCache *defaultCache;
  CLKTextProviderCache *v4;
  CLKTextProviderCache *v5;

  defaultCache = self->_defaultCache;
  if (!defaultCache)
  {
    v4 = objc_alloc_init(CLKTextProviderCache);
    v5 = self->_defaultCache;
    self->_defaultCache = v4;

    defaultCache = self->_defaultCache;
  }
  return defaultCache;
}

- (id)_cacheForKey:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachesByKey;
  NSMutableArray *recentCacheKeys;
  NSMutableArray *v8;
  NSMutableArray *v9;
  CLKTextProviderCache *v10;

  v4 = a3;
  if (v4)
  {
    if (!self->_cachesByKey)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      cachesByKey = self->_cachesByKey;
      self->_cachesByKey = v5;

    }
    recentCacheKeys = self->_recentCacheKeys;
    if (!recentCacheKeys)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = self->_recentCacheKeys;
      self->_recentCacheKeys = v8;

      recentCacheKeys = self->_recentCacheKeys;
    }
    -[NSMutableArray removeObject:](recentCacheKeys, "removeObject:", v4);
    -[NSMutableArray insertObject:atIndex:](self->_recentCacheKeys, "insertObject:atIndex:", v4, 0);
    -[CLKTextProvider _pruneCacheKeysIfNecessary](self, "_pruneCacheKeysIfNecessary");
    -[NSMutableDictionary objectForKey:](self->_cachesByKey, "objectForKey:", v4);
    v10 = (CLKTextProviderCache *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = objc_alloc_init(CLKTextProviderCache);
      -[NSMutableDictionary setObject:forKey:](self->_cachesByKey, "setObject:forKey:", v10, v4);
    }
  }
  else
  {
    -[CLKTextProvider _defaultCache](self, "_defaultCache");
    v10 = (CLKTextProviderCache *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)_pruneCacheKeysIfNecessary
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;

  v3 = -[NSMutableArray count](self->_recentCacheKeys, "count");
  if (v3 >= 0xB)
  {
    v4 = v3;
    for (i = 10; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_recentCacheKeys, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->_cachesByKey, "removeObjectForKey:", v6);

    }
    -[NSMutableArray removeObjectsInRange:](self->_recentCacheKeys, "removeObjectsInRange:", 10, v4 - 10);
  }
}

- (void)_localeChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CLKTextProvider__localeChanged__block_invoke;
  block[3] = &unk_24CBF9F60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __33__CLKTextProvider__localeChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

}

- (void)_maybeStartOrStopUpdates
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  CLKClockTimerToken *minuteTimerToken;
  void *v7;
  uint64_t v8;
  CLKClockTimerToken *v9;
  CLKClockTimerToken *v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  CLKClockTimerToken *v14;
  CLKClockTimerToken *v15;
  void *v16;
  CLKClockTimerToken *v17;
  void *v18;
  CLKClockTimerToken *_30fpsTimerToken;
  void *v20;
  uint64_t v21;
  CLKClockTimerToken *v22;
  CLKClockTimerToken *secondTimerToken;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;

  if (!-[NSMutableDictionary count](self->_updateHandlersByToken, "count") || self->_paused)
  {
    v3 = 0;
    v4 = 0;
    goto LABEL_4;
  }
  v11 = -[CLKTextProvider _updateFrequency](self, "_updateFrequency");
  v4 = v11 == 2;
  v3 = v11 == 3;
  if (v11 != 1)
  {
LABEL_4:
    if (self->_minuteTimerToken)
    {
      +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopUpdatesForToken:", self->_minuteTimerToken);

      minuteTimerToken = self->_minuteTimerToken;
      self->_minuteTimerToken = 0;

      if (!v4)
      {
        LOBYTE(v4) = 0;
        goto LABEL_15;
      }
    }
    else if (!v4)
    {
      goto LABEL_15;
    }
    if (self->_secondTimerToken)
    {
      if (!v3)
        goto LABEL_20;
    }
    else
    {
      objc_initWeak(&location, self);
      +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_2;
      v30[3] = &unk_24CBF9D60;
      objc_copyWeak(&v31, &location);
      v28[0] = v21;
      v28[1] = 3221225472;
      v28[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_3;
      v28[3] = &unk_24CBF9D88;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v20, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 1, v30, v28);
      v22 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      secondTimerToken = self->_secondTimerToken;
      self->_secondTimerToken = v22;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
      if (!v3)
        goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (!self->_minuteTimerToken)
  {
    objc_initWeak(&location, self);
    +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke;
    v34[3] = &unk_24CBF9D60;
    objc_copyWeak(&v35, &location);
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_33;
    v32[3] = &unk_24CBF9D88;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v12, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, v34, v32);
    v14 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    v15 = self->_minuteTimerToken;
    self->_minuteTimerToken = v14;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
LABEL_15:
  if (v4 || !self->_secondTimerToken)
  {
    if (!v3)
      goto LABEL_20;
  }
  else
  {
    +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stopUpdatesForToken:", self->_secondTimerToken);

    v17 = self->_secondTimerToken;
    self->_secondTimerToken = 0;

    if (!v3)
    {
LABEL_20:
      if (self->_30fpsTimerToken)
      {
        +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stopUpdatesForToken:", self->_30fpsTimerToken);

        _30fpsTimerToken = self->_30fpsTimerToken;
        self->_30fpsTimerToken = 0;

      }
      return;
    }
  }
LABEL_10:
  if (!self->_30fpsTimerToken)
  {
    objc_initWeak(&location, self);
    +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_4;
    v26[3] = &unk_24CBF9D60;
    objc_copyWeak(&v27, &location);
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_5;
    v24[3] = &unk_24CBF9D88;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v7, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 3, v26, v24);
    v9 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    v10 = self->_30fpsTimerToken;
    self->_30fpsTimerToken = v9;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

id __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_2(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

id __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_4(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

id __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_update
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_updateHandlersByToken, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_36_0);
  -[CLKTextProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
}

uint64_t __26__CLKTextProvider__update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  if (self->_finalized)
    return self;
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 120) = self->_timeTravelUpdateFrequency;
  objc_storeStrong((id *)(v4 + 80), self->_tintColor);
  *(_QWORD *)(v4 + 104) = self->_shrinkTextPreference;
  *(_BYTE *)(v4 + 75) = self->_italicized;
  *(_BYTE *)(v4 + 76) = self->_monospacedNumbers;
  objc_storeStrong((id *)(v4 + 96), self->_trackingAttribute);
  *(_BYTE *)(v4 + 73) = self->_ignoreUppercaseStyle;
  objc_storeStrong((id *)(v4 + 88), self->_accessibilityLabel);
  objc_storeStrong((id *)(v4 + 112), self->_fontFeatures);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t timeTravelUpdateFrequency;
  uint64_t v7;
  id v8;
  id v9;
  UIColor *tintColor;
  id v11;
  id v12;
  int64_t shrinkTextPreference;
  id v14;
  id v15;
  _BOOL8 italicized;
  id v17;
  id v18;
  _BOOL8 ignoreUppercaseStyle;
  id v20;
  id v21;
  NSString *accessibilityLabel;
  id v23;
  id v24;
  _BOOL8 monospacedNumbers;
  id v26;
  id v27;
  NSArray *fontFeatures;
  id v29;
  id v30;
  NSNumber *trackingAttribute;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  timeTravelUpdateFrequency = self->_timeTravelUpdateFrequency;
  v7 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __27__CLKTextProvider_isEqual___block_invoke;
  v51[3] = &unk_24CBFABE8;
  v8 = v4;
  v52 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", timeTravelUpdateFrequency, v51);
  tintColor = self->_tintColor;
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __27__CLKTextProvider_isEqual___block_invoke_2;
  v49[3] = &unk_24CBF9EE8;
  v11 = v8;
  v50 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", tintColor, v49);
  shrinkTextPreference = self->_shrinkTextPreference;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __27__CLKTextProvider_isEqual___block_invoke_3;
  v47[3] = &unk_24CBFABE8;
  v14 = v11;
  v48 = v14;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", shrinkTextPreference, v47);
  italicized = self->_italicized;
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __27__CLKTextProvider_isEqual___block_invoke_4;
  v45[3] = &unk_24CBFAC10;
  v17 = v14;
  v46 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", italicized, v45);
  ignoreUppercaseStyle = self->_ignoreUppercaseStyle;
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __27__CLKTextProvider_isEqual___block_invoke_5;
  v43[3] = &unk_24CBFAC10;
  v20 = v17;
  v44 = v20;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", ignoreUppercaseStyle, v43);
  accessibilityLabel = self->_accessibilityLabel;
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __27__CLKTextProvider_isEqual___block_invoke_6;
  v41[3] = &unk_24CBF9EC0;
  v23 = v20;
  v42 = v23;
  v24 = (id)objc_msgSend(v5, "appendString:counterpart:", accessibilityLabel, v41);
  monospacedNumbers = self->_monospacedNumbers;
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __27__CLKTextProvider_isEqual___block_invoke_7;
  v39[3] = &unk_24CBFAC10;
  v26 = v23;
  v40 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", monospacedNumbers, v39);
  fontFeatures = self->_fontFeatures;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __27__CLKTextProvider_isEqual___block_invoke_8;
  v37[3] = &unk_24CBF9EE8;
  v29 = v26;
  v38 = v29;
  v30 = (id)objc_msgSend(v5, "appendObject:counterpart:", fontFeatures, v37);
  trackingAttribute = self->_trackingAttribute;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __27__CLKTextProvider_isEqual___block_invoke_9;
  v35[3] = &unk_24CBF9EE8;
  v36 = v29;
  v32 = v29;
  v33 = (id)objc_msgSend(v5, "appendObject:counterpart:", trackingAttribute, v35);
  LOBYTE(v29) = objc_msgSend(v5, "isEqual");

  return (char)v29;
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
}

id __27__CLKTextProvider_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 80);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 75);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 73);
}

id __27__CLKTextProvider_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_7(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 76);
}

id __27__CLKTextProvider_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 112);
}

id __27__CLKTextProvider_isEqual___block_invoke_9(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 96);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_timeTravelUpdateFrequency);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_tintColor);
  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_shrinkTextPreference);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_italicized);
  v8 = (id)objc_msgSend(v3, "appendBool:", self->_ignoreUppercaseStyle);
  v9 = (id)objc_msgSend(v3, "appendString:", self->_accessibilityLabel);
  v10 = (id)objc_msgSend(v3, "appendBool:", self->_monospacedNumbers);
  v11 = (id)objc_msgSend(v3, "appendObject:", self->_fontFeatures);
  v12 = (id)objc_msgSend(v3, "appendObject:", self->_trackingAttribute);
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t timeTravelUpdateFrequency;
  id v5;

  timeTravelUpdateFrequency = self->_timeTravelUpdateFrequency;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", timeTravelUpdateFrequency, CFSTR("updateFrequency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shrinkTextPreference != 0, CFSTR("shrinkTextPreference"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_finalized, CFSTR("finalized"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_italicized, CFSTR("italicized"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_monospacedNumbers, CFSTR("monospacedNumbers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreUppercaseStyle, CFSTR("ignoreUppercaseStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityLabel, CFSTR("_accessibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fontFeatures, CFSTR("fontFeatures"));

}

- (CLKTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKTextProvider *v5;
  CLKTextProvider *v6;
  uint64_t v7;
  UIColor *tintColor;
  uint64_t v9;
  NSNumber *trackingAttribute;
  uint64_t v11;
  NSString *accessibilityLabel;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *fontFeatures;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLKTextProvider;
  v5 = -[CLKTextProvider init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CLKTextProvider _commonInit](v5, "_commonInit");
    v6->_timeTravelUpdateFrequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateFrequency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v7 = objc_claimAutoreleasedReturnValue();
    tintColor = v6->_tintColor;
    v6->_tintColor = (UIColor *)v7;

    v6->_shrinkTextPreference = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shrinkTextPreference"));
    v6->_finalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("finalized"));
    v6->_italicized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("italicized"));
    v6->_monospacedNumbers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("monospacedNumbers"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v6->_trackingAttribute);
    v9 = objc_claimAutoreleasedReturnValue();
    trackingAttribute = v6->_trackingAttribute;
    v6->_trackingAttribute = (NSNumber *)v9;

    v6->_ignoreUppercaseStyle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreUppercaseStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessibility"));
    v11 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v6->_accessibilityLabel;
    v6->_accessibilityLabel = (NSString *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("fontFeatures"));
    v18 = objc_claimAutoreleasedReturnValue();
    fontFeatures = v6->_fontFeatures;
    v6->_fontFeatures = (NSArray *)v18;

  }
  return v6;
}

+ (CLKTextProvider)providerWithJSONObjectRepresentation:(id)a3
{
  id v3;
  NSString *v4;
  Class v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v3);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("class"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("class"), v4);
  v5 = NSClassFromString(v4);
  if ((-[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("class: %@ must be a CLKTextProvider class"), v4);
  v6 = (void *)objc_msgSend([v5 alloc], "_initWithJSONObjectRepresentation:", v3);
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tintColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithJSONObjectRepresentation:", v7);
      objc_msgSend(v6, "setTintColor:", v8);

    }
  }

  return (CLKTextProvider *)v6;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  id *v5;
  void *v6;

  v4 = a3;
  v5 = -[CLKTextProvider initPrivate](self, "initPrivate");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("accessibilityLabel"), v6);
    objc_storeStrong(v5 + 11, v6);
  }

  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("class"));

  -[UIColor JSONObjectRepresentation](self->_tintColor, "JSONObjectRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("tintColor"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_accessibilityLabel, CFSTR("accessibilityLabel"));
  return v4;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_storeStrong((id *)&self->_tintColor, tintColor);
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  objc_setProperty_nonatomic_copy(self, a2, accessibilityLabel, 88);
}

- (BOOL)ignoreUppercaseStyle
{
  return self->_ignoreUppercaseStyle;
}

- (void)setIgnoreUppercaseStyle:(BOOL)a3
{
  self->_ignoreUppercaseStyle = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)italicized
{
  return self->_italicized;
}

- (void)setItalicized:(BOOL)a3
{
  self->_italicized = a3;
}

- (BOOL)monospacedNumbers
{
  return self->_monospacedNumbers;
}

- (void)setMonospacedNumbers:(BOOL)a3
{
  self->_monospacedNumbers = a3;
}

- (NSNumber)trackingAttribute
{
  return self->_trackingAttribute;
}

- (void)setTrackingAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_trackingAttribute, a3);
}

- (int64_t)shrinkTextPreference
{
  return self->_shrinkTextPreference;
}

- (void)setShrinkTextPreference:(int64_t)a3
{
  self->_shrinkTextPreference = a3;
}

- (NSArray)fontFeatures
{
  return self->_fontFeatures;
}

- (void)setFontFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)timeTravelUpdateFrequency
{
  return self->_timeTravelUpdateFrequency;
}

- (void)setTimeTravelUpdateFrequency:(int64_t)a3
{
  self->_timeTravelUpdateFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFeatures, 0);
  objc_storeStrong((id *)&self->_trackingAttribute, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_30fpsTimerToken, 0);
  objc_storeStrong((id *)&self->_minuteTimerToken, 0);
  objc_storeStrong((id *)&self->_secondTimerToken, 0);
  objc_storeStrong((id *)&self->_updateHandlersByToken, 0);
  objc_storeStrong((id *)&self->_recentCacheKeys, 0);
  objc_storeStrong((id *)&self->_cachesByKey, 0);
  objc_storeStrong((id *)&self->_defaultCache, 0);
}

@end
