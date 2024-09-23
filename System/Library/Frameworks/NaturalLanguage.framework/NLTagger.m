@implementation NLTagger

+ (NSArray)availableTagSchemesForUnit:(NLTokenUnit)unit language:(NLLanguage)language
{
  CFLocaleRef v4;
  void *v5;
  CFLocaleRef v6;
  uint64_t v7;

  v4 = CFLocaleCreate(0, (CFLocaleIdentifier)language);
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
  {
    v6 = v4;
    v7 = NLTaggerCopyAvailableTagSchemes();
    CFRelease(v6);
    if (v7)
      v5 = (void *)v7;
  }
  return (NSArray *)v5;
}

+ (id)availableTagSchemesForLanguage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "availableTagSchemesForUnit:language:", 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(a1, "availableTagSchemesForUnit:language:", 1, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(a1, "availableTagSchemesForUnit:language:", 2, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  objc_msgSend(a1, "availableTagSchemesForUnit:language:", 3, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v10);
  objc_msgSend(v6, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)registerForAssetNotifications
{
  if (registerForAssetNotifications_onceToken != -1)
    dispatch_once(&registerForAssetNotifications_onceToken, &__block_literal_global_1);
}

uint64_t __41__NLTagger_registerForAssetNotifications__block_invoke()
{
  const char *v0;
  int out_token;

  out_token = 0;
  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.LinguisticData.new-asset-installed"), "UTF8String");
  return notify_register_dispatch(v0, &out_token, MEMORY[0x1E0C80D38], &__block_literal_global_5);
}

void __41__NLTagger_registerForAssetNotifications__block_invoke_2()
{
  id v0;

  +[NLTaggerAssetRequest checkAssetRequests](NLTaggerAssetRequest, "checkAssetRequests");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("NLAssetsHaveChanged"), 0);

}

- (NLTagger)initWithTagSchemes:(NSArray *)tagSchemes
{
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *schemes;
  objc_super v11;

  v4 = tagSchemes;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", CFSTR("Language")) & 1) == 0)
    objc_msgSend(v5, "addObject:", CFSTR("Language"));
  if ((objc_msgSend(v5, "containsObject:", CFSTR("Script")) & 1) == 0)
    objc_msgSend(v5, "addObject:", CFSTR("Script"));
  v7 = (void *)NLTaggerCreate();
  +[NLTagger registerForAssetNotifications](NLTagger, "registerForAssetNotifications");
  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)NLTagger;
    self = -[NLTagger init](&v11, sel_init);
    if (self)
    {
      v8 = (NSArray *)-[NSArray copy](v4, "copy");
      schemes = self->_schemes;
      self->_schemes = v8;

      self->_tagger = v7;
    }
  }

  return self;
}

- (void)dealloc
{
  void *tagger;
  objc_super v4;

  tagger = self->_tagger;
  if (tagger)
    CFRelease(tagger);
  v4.receiver = self;
  v4.super_class = (Class)NLTagger;
  -[NLTagger dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)NLTagger;
  -[NLTagger description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("    tag schemes %@\n"), self->_schemes);
  objc_msgSend(v5, "appendFormat:", CFSTR("    string %p has %lu characters\n"), self->_string, -[NSString length](self->_string, "length"));
  return v5;
}

- (NSArray)tagSchemes
{
  return self->_schemes;
}

- (id)_tagSchemeForScheme:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v4 = (__CFString *)a3;
  if (-[NSArray containsObject:](self->_schemes, "containsObject:", v4))
  {
    v5 = CFSTR("TokenType");
    if ((objc_msgSend(CFSTR("TokenType"), "isEqualToString:", v4) & 1) == 0)
    {
      v5 = CFSTR("LexicalClass");
      if ((objc_msgSend(CFSTR("LexicalClass"), "isEqualToString:", v4) & 1) == 0)
      {
        v5 = CFSTR("NameType");
        if ((objc_msgSend(CFSTR("NameType"), "isEqualToString:", v4) & 1) == 0)
        {
          v5 = CFSTR("NameTypeOrLexicalClass");
          if ((objc_msgSend(CFSTR("NameTypeOrLexicalClass"), "isEqualToString:", v4) & 1) == 0)
          {
            v5 = CFSTR("Lemma");
            if ((objc_msgSend(CFSTR("Lemma"), "isEqualToString:", v4) & 1) == 0)
            {
              v5 = CFSTR("Language");
              if ((objc_msgSend(CFSTR("Language"), "isEqualToString:", v4) & 1) == 0)
              {
                v5 = CFSTR("Script");
                if ((objc_msgSend(CFSTR("Script"), "isEqualToString:", v4) & 1) == 0)
                {
                  v5 = CFSTR("Sentiment");
                  if ((objc_msgSend(CFSTR("Sentiment"), "isEqualToString:", v4) & 1) == 0)
                  {
                    v5 = CFSTR("PossibleClasses");
                    if ((objc_msgSend(CFSTR("PossibleClasses"), "isEqualToString:", v4) & 1) == 0)
                    {
                      v5 = CFSTR("InternalClass");
                      if (!objc_msgSend(CFSTR("InternalClass"), "isEqualToString:", v4))
                        v5 = v4;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setString:(NSString *)string
{
  NSString *v4;

  objc_storeStrong((id *)&self->_string, string);
  v4 = string;
  NLTaggerSetString();

}

- (NSString)string
{
  return self->_string;
}

- (_NSRange)sentenceRangeForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  -[NLTagger string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (location + length <= v6)
  {
    if (v6)
    {
      NLTaggerGetTokenAtIndex();
      if (length)
        NLTaggerGetTokenAtIndex();
    }
  }
  v7 = 0;
  v8 = 0;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)_customModelAtIndex:(unint64_t)a3 unit:(int64_t)a4 modelDictionary:(id)a5
{
  id v5;
  __CFString *v6;
  void *v7;

  v5 = a5;
  v6 = (__CFString *)NLTaggerCopyTagAtIndex();
  if (!v6)
    v6 = CFSTR("und");
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("und"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_customGazetteerAtIndex:(unint64_t)a3 unit:(int64_t)a4 gazetteerDictionary:(id)a5
{
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;

  v6 = a5;
  if (a4)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v8 = (__CFString *)NLTaggerCopyTagAtIndex();
    if (!v8)
      v8 = CFSTR("und");
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("und"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v9;
  }

  return v7;
}

- (id)_customTagDictionaryForSentence:(id)a3 options:(unint64_t)a4 model:(id)a5 gazetteer:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t i;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  void *v35;
  NSUInteger v36;
  NSRange v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[3];
  NSRange v56;
  NSRange v57;

  v50 = a4;
  v55[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v53 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = v8;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  generateTokenSequence(v8, 0, v10, v11, v49);
  v12 = objc_msgSend(v10, "count");
  if (!v12)
  {
    v43 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_26;
  }
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "predictedLabelsForTokens:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") < v13)
  {
    v18 = objc_msgSend(v16, "count");
    v19 = v13 - v18;
    if (v13 > v18)
    {
      do
      {
        objc_msgSend(v16, "addObject:", &stru_1E4A3BA10);
        --v19;
      }
      while (v19);
    }
  }
  v51 = v16;
  v47 = v10;
  v48 = v9;
  v20 = 0;
  if (v13 <= 1)
    v21 = 1;
  else
    v21 = v13;
  v22 = 0x1E0CB3000uLL;
  do
  {
    v23 = *(void **)(v22 + 2840);
    objc_msgSend(v11, "objectAtIndex:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue");
    objc_msgSend(v49, "objectAtIndex:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "valueWithRange:", v25, objc_msgSend(v26, "unsignedIntegerValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v27);

    v22 = 0x1E0CB3000;
    ++v20;
  }
  while (v21 != v20);
  v45 = v11;
  if (!v53)
    goto LABEL_24;
  for (i = 0; i < v13; ++i)
  {
    v29 = 4;
    v30 = 3;
    while (i + v30 >= v13)
    {
LABEL_16:
      --v30;
      --v29;
      if (v30 == -1)
        goto LABEL_23;
    }
    objc_msgSend(v17, "objectAtIndex:", i);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "rangeValue");
    v34 = v33;
    objc_msgSend(v17, "objectAtIndex:", i + v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v57.location = objc_msgSend(v35, "rangeValue");
    v57.length = v36;
    v56.location = v32;
    v56.length = v34;
    v37 = NSUnionRange(v56, v57);

    objc_msgSend(v52, "substringWithRange:", v37.location, v37.length);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "labelForString:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
    {

      goto LABEL_16;
    }
    v40 = (void *)v39;
    v41 = i;
    if ((v50 & 0x10) != 0)
    {
      objc_msgSend(v17, "removeObjectsInRange:", i, v30 + 1);
      objc_msgSend(v51, "removeObjectsInRange:", i, v30 + 1);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v37.location, v37.length);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertObject:atIndex:", v42, i);

      objc_msgSend(v51, "insertObject:atIndex:", v40, i);
      v13 -= v30;
    }
    else
    {
      do
      {
        objc_msgSend(v51, "replaceObjectAtIndex:withObject:", v41++, v40, v45);
        --v29;
      }
      while (v29);
    }

LABEL_23:
    ;
  }
LABEL_24:
  v54[0] = CFSTR("labels");
  v54[1] = CFSTR("ranges");
  v55[0] = v51;
  v55[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2, v45);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v47;
  v9 = v48;
  v11 = v46;
LABEL_26:

  return v43;
}

- (id)_customTagAtIndex:(unint64_t)a3 fromTagDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;

  v5 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("labels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ranges"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeValue");
      v14 = v13;

      if (a3 >= v12 && a3 - v12 < v14)
        break;
      if (v9 == ++v10)
        goto LABEL_6;
    }
    objc_msgSend(v6, "objectAtIndex:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (id)_customTagAtIndex:(unint64_t)a3 unit:(int64_t)a4 scheme:(id)a5 options:(unint64_t)a6 modelDictionary:(id)a7 gazetteerDictionary:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v41;
  id v42;

  v13 = a8;
  -[NLTagger _customModelAtIndex:unit:modelDictionary:](self, "_customModelAtIndex:unit:modelDictionary:", a3, a4, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLTagger string](self, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    switch(a4)
    {
      case 0:
        v42 = v13;
        v18 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
        v20 = v19;
        v41 = v18;
        objc_msgSend(v17, "substringWithRange:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_sequenceCaches, "objectForKey:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v21);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
          v24 = 1;
        else
          v24 = v20 == 0;
        if (v24)
        {
          v25 = (void *)v23;
          v26 = v41;
        }
        else
        {
          -[NLTagger _customGazetteerAtIndex:unit:gazetteerDictionary:](self, "_customGazetteerAtIndex:unit:gazetteerDictionary:", a3, 0, v13);
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = a6;
          v38 = (void *)v36;
          -[NLTagger _customTagDictionaryForSentence:options:model:gazetteer:](self, "_customTagDictionaryForSentence:options:model:gazetteer:", v21, v37, v14, v36);
          v39 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v39;
          if (v39 && v20 <= 0x400)
          {
            if ((unint64_t)objc_msgSend(v22, "count") >= 0x40)
              objc_msgSend(v22, "removeAllObjects");
            v26 = v41;
            if (!v22)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](self->_sequenceCaches, "setObject:forKey:", v22, v15);
            }
            objc_msgSend(v22, "setObject:forKey:", v25, v21);
          }
          else
          {
            v26 = v41;
          }

        }
        -[NLTagger _customTagAtIndex:fromTagDictionary:](self, "_customTagAtIndex:fromTagDictionary:", a3 - v26, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v42;
        goto LABEL_40;
      case 1:
        v28 = v13;
        v30 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
        goto LABEL_13;
      case 2:
        v28 = v13;
        v30 = objc_msgSend(v16, "paragraphRangeForRange:", a3, 0);
LABEL_13:
        v29 = v31;
        objc_msgSend(v17, "substringWithRange:", v30, v31);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 3:
        v28 = v13;
        v29 = objc_msgSend(v16, "length");
        v32 = v17;
LABEL_15:
        v21 = v32;
        break;
      default:
        v28 = v13;
        v29 = 0;
        v21 = 0;
        break;
    }
    -[NSMutableDictionary objectForKey:](self->_classifierCaches, "objectForKey:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v21);
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
      v34 = 1;
    else
      v34 = v29 == 0;
    if (v34)
    {
      v27 = (void *)v33;
    }
    else
    {
      objc_msgSend(v14, "predictedLabelForString:", v21);
      v35 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v35;
      if (v35 && v29 <= 0x400)
      {
        v13 = v28;
        if ((unint64_t)objc_msgSend(v22, "count") >= 0x40)
          objc_msgSend(v22, "removeAllObjects");
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](self->_classifierCaches, "setObject:forKey:", v22, v15);
        }
        objc_msgSend(v22, "setObject:forKey:", v27, v21);
        goto LABEL_40;
      }
    }
    v13 = v28;
LABEL_40:

    goto LABEL_41;
  }
  v27 = 0;
LABEL_41:

  return v27;
}

- (id)_customHypothesisDictionaryForSentence:(id)a3 options:(unint64_t)a4 model:(id)a5 gazetteer:(id)a6 maximumCount:(unint64_t)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSUInteger v38;
  NSUInteger v39;
  NSUInteger v40;
  void *v41;
  NSUInteger v42;
  NSRange v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  id v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint64_t v65;
  _QWORD v66[2];
  NSRange v67;
  NSRange v68;

  v55 = a4;
  v66[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v62 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v10;
  generateTokenSequence(v10, 0, v12, v13, v14);
  v15 = objc_msgSend(v12, "count");
  if (!v15)
  {
    v51 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_28;
  }
  v16 = v15;
  v17 = (void *)MEMORY[0x1E0C99DE8];
  v53 = v12;
  v54 = v11;
  objc_msgSend(v11, "predictedLabelHypothesesForTokens:maximumCount:", v12, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v19;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") < v16)
  {
    v21 = objc_msgSend(v19, "count");
    v22 = v16 - v21;
    if (v16 > v21)
    {
      v23 = MEMORY[0x1E0C9AA70];
      do
      {
        objc_msgSend(v20, "addObject:", v23);
        --v22;
      }
      while (v22);
    }
  }
  v56 = v20;
  v24 = 0;
  v25 = v16;
  if (v16 <= 1)
    v26 = 1;
  else
    v26 = v16;
  v27 = 0x1E0CB3000uLL;
  do
  {
    v28 = *(void **)(v27 + 2840);
    objc_msgSend(v13, "objectAtIndex:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedIntegerValue");
    objc_msgSend(v14, "objectAtIndex:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "valueWithRange:", v30, objc_msgSend(v31, "unsignedIntegerValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObject:", v32);

    v27 = 0x1E0CB3000;
    ++v24;
  }
  while (v26 != v24);
  v33 = v60;
  if (!v62 || !a7)
    goto LABEL_26;
  v34 = 0;
  v57 = v14;
  v58 = v13;
  do
  {
    v35 = 4;
    v36 = 3;
    while (v34 + v36 >= v25)
    {
LABEL_18:
      --v36;
      --v35;
      if (v36 == -1)
        goto LABEL_25;
    }
    objc_msgSend(v33, "objectAtIndex:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "rangeValue");
    v40 = v39;
    objc_msgSend(v33, "objectAtIndex:", v34 + v36);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68.location = objc_msgSend(v41, "rangeValue");
    v68.length = v42;
    v67.location = v38;
    v67.length = v40;
    v43 = NSUnionRange(v67, v68);

    objc_msgSend(v61, "substringWithRange:", v43.location, v43.length);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "labelForString:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!v45)
    {

      v33 = v60;
      goto LABEL_18;
    }
    v46 = (void *)v45;
    v65 = v45;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
    v59 = objc_claimAutoreleasedReturnValue();

    v48 = v34;
    if ((v55 & 0x10) != 0)
    {
      objc_msgSend(v60, "removeObjectsInRange:", v34, v36 + 1);
      objc_msgSend(v56, "removeObjectsInRange:", v34, v36 + 1);
      v33 = v60;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v43.location, v43.length);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "insertObject:atIndex:", v50, v34);

      v49 = (void *)v59;
      objc_msgSend(v56, "insertObject:atIndex:", v59, v34);
      v25 -= v36;
    }
    else
    {
      do
      {
        objc_msgSend(v56, "replaceObjectAtIndex:withObject:", v48++, v59);
        --v35;
      }
      while (v35);
      v49 = (void *)v59;
      v33 = v60;
    }

LABEL_25:
    v14 = v57;
    v13 = v58;
    ++v34;
  }
  while (v34 < v25);
LABEL_26:
  v63[0] = CFSTR("hypotheses");
  v63[1] = CFSTR("ranges");
  v64[0] = v56;
  v64[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v53;
  v11 = v54;
LABEL_28:

  return v51;
}

- (id)_customHypothesesAtIndex:(unint64_t)a3 fromHypothesisDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("hypotheses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ranges"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = (void *)MEMORY[0x1E0C9AA70];
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeValue");
      v15 = v14;

      if (a3 >= v13 && a3 - v13 < v15)
        break;
      if (v9 == ++v10)
        goto LABEL_9;
    }
    objc_msgSend(v6, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
LABEL_9:

  return v11;
}

- (id)_customHypothesesAtIndex:(unint64_t)a3 unit:(int64_t)a4 scheme:(id)a5 maximumCount:(unint64_t)a6 options:(unint64_t)a7 modelDictionary:(id)a8 gazetteerDictionary:(id)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v15 = a9;
  -[NLTagger _customModelAtIndex:unit:modelDictionary:](self, "_customModelAtIndex:unit:modelDictionary:", a3, a4, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[NLTagger string](self, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    switch(a4)
    {
      case 0:
        v19 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
        objc_msgSend(v18, "substringWithRange:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLTagger _customGazetteerAtIndex:unit:gazetteerDictionary:](self, "_customGazetteerAtIndex:unit:gazetteerDictionary:", a3, 0, v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLTagger _customHypothesisDictionaryForSentence:options:model:gazetteer:maximumCount:](self, "_customHypothesisDictionaryForSentence:options:model:gazetteer:maximumCount:", v21, a7, v16, v22, a6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLTagger _customHypothesesAtIndex:fromHypothesisDictionary:](self, "_customHypothesesAtIndex:fromHypothesisDictionary:", a3 - v19, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      case 1:
        v25 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
        goto LABEL_8;
      case 2:
        v25 = objc_msgSend(v17, "paragraphRangeForRange:", a3, 0);
LABEL_8:
        objc_msgSend(v18, "substringWithRange:", v25, v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        objc_msgSend(v17, "length");
        v27 = v18;
LABEL_10:
        v21 = v27;
        break;
      default:
        v21 = 0;
        break;
    }
    objc_msgSend(v16, "predictedLabelHypothesesForString:maximumCount:", v21, a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)enumerateTagsInRange:(NSRange)range unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme options:(NLTaggerOptions)options usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  NSString *v12;
  void (**v13)(void *, void *, _QWORD, NSUInteger, char *);
  NSUInteger v14;
  void *v15;
  NSUInteger v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(void *, void *, _QWORD, NSUInteger, char *);
  char v24;

  length = range.length;
  location = range.location;
  v12 = scheme;
  v13 = block;
  v14 = -[NSString length](self->_string, "length");
  if (location + length <= v14)
  {
    v16 = v14;
    -[NLTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[NSMutableDictionary objectForKey:](self->_customModelDictionaries, "objectForKey:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_customGazetteerDictionaries, "objectForKey:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (unit == NLTokenUnitDocument)
      {
        -[NLTagger tagAtIndex:unit:scheme:tokenRange:](self, "tagAtIndex:unit:scheme:tokenRange:", 0, 3, v15, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v13[2](v13, v19, 0, v16, &v24);
      }
      else
      {
        v22 = v15;
        v23 = v13;
        v20 = v18;
        v21 = v17;
        NLTaggerEnumerateTokens();

        v19 = v17;
      }

    }
  }
  else
  {
    v15 = v12;
  }

}

void __64__NLTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  double v9;
  __CFString **v10;

  v4 = (void *)MEMORY[0x1A8592E0C]();
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5
    || (objc_msgSend(*(id *)(a1 + 40), "_customTagAtIndex:unit:scheme:options:modelDictionary:gazetteerDictionary:", *a2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), v5, *(_QWORD *)(a1 + 56)), (v6 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = (void *)NLTaggerCopyTagForCurrentToken();
    tagForNLTag(v7);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (*(__CFString **)(a1 + 48) == CFSTR("Sentiment"))
  {
    v8 = v6;
    -[__CFString doubleValue](v8, "doubleValue");
    if (v9 <= 1.0)
    {
      if (v9 >= -1.0)
      {
        v6 = v8;
        if (v9 != 0.0)
        {
LABEL_12:

          goto LABEL_13;
        }
        v10 = _NLTagZero;
      }
      else
      {
        v10 = _NLTagNegativeOne;
      }
    }
    else
    {
      v10 = _NLTagPositiveOne;
    }
    v6 = *v10;

    goto LABEL_12;
  }
LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  objc_autoreleasePoolPop(v4);
}

- (NLTag)tagAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme tokenRange:(NSRangePointer)tokenRange
{
  NSString *v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = scheme;
  v11 = -[NSString length](self->_string, "length");
  if (v11 <= characterIndex)
  {
    v18 = 0;
    v13 = v10;
  }
  else
  {
    v12 = v11;
    -[NLTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSMutableDictionary objectForKey:](self->_customModelDictionaries, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_customGazetteerDictionaries, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14
        || (-[NLTagger _customTagAtIndex:unit:scheme:options:modelDictionary:gazetteerDictionary:](self, "_customTagAtIndex:unit:scheme:options:modelDictionary:gazetteerDictionary:", characterIndex, unit, v13, 0, v14, v15), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v17 = (void *)NLTaggerCopyTagAtIndex();
        tagForNLTag(v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (tokenRange)
      {
        if (unit == NLTokenUnitDocument)
        {
          tokenRange->location = 0;
          tokenRange->length = v12;
        }
        else
        {
          NLTaggerGetTokenAtIndex();
          *tokenRange = 0uLL;
        }
      }
      v18 = v16;

    }
    else
    {
      v18 = 0;
    }
  }

  return (NLTag)v18;
}

- (NSArray)tagsInRange:(NSRange)range unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme options:(NLTaggerOptions)options tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length;
  NSUInteger location;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSArray *v19;
  _QWORD v21[4];
  id v22;
  id v23;

  length = range.length;
  location = range.location;
  v13 = scheme;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (tokenRanges)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__NLTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke;
  v21[3] = &unk_1E4A3AA88;
  v16 = v14;
  v22 = v16;
  v17 = v15;
  v23 = v17;
  -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](self, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, unit, v13, options, v21);
  if (tokenRanges)
    *tokenRanges = (NSArray *)objc_retainAutorelease(v17);
  v18 = v23;
  v19 = (NSArray *)v16;

  return v19;
}

void __56__NLTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v7 = a2;
  if (v7)
    v8 = v7;
  else
    v8 = &stru_1E4A3BA10;
  v11 = (__CFString *)v8;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

- (NSDictionary)tagHypothesesAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme maximumCount:(NSUInteger)maximumCount tokenRange:(NSRangePointer)tokenRange
{
  NSString *string;
  NSString *v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSUInteger v35;
  NSUInteger v36;
  void *v37;
  NLTokenUnit v38;
  NSRange *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  string = self->_string;
  v13 = scheme;
  v14 = -[NSString length](string, "length");
  if (v14 <= characterIndex)
  {
    v33 = (id)MEMORY[0x1E0C9AA70];
    v16 = v13;
  }
  else
  {
    v15 = v14;
    -[NLTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      return (NSDictionary *)MEMORY[0x1E0C9AA70];
    -[NSMutableDictionary objectForKey:](self->_customModelDictionaries, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_customGazetteerDictionaries, "objectForKey:", v16);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (!v17
      || (-[NLTagger _customHypothesesAtIndex:unit:scheme:maximumCount:options:modelDictionary:gazetteerDictionary:](self, "_customHypothesesAtIndex:unit:scheme:maximumCount:options:modelDictionary:gazetteerDictionary:", characterIndex, unit, v16, maximumCount, 0, v17, v18), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v19;
      v41 = (void *)NLTaggerCopyHypothesesAtIndex();
      if (v41)
      {
        v35 = maximumCount;
        v36 = v15;
        v37 = v17;
        v38 = unit;
        v39 = tokenRange;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v21 = v41;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v43 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v21, "objectForKey:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "doubleValue");
              if (v28 > 0.0)
              {
                tagForNLTag(v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKey:", v27, v29);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          }
          while (v23);
        }

        unit = v38;
        tokenRange = v39;
        v15 = v36;
        v17 = v37;
        v19 = v40;
        maximumCount = v35;
      }
      v30 = objc_msgSend(v20, "count");
      if (maximumCount && !v30)
      {
        -[NLTagger tagAtIndex:unit:scheme:tokenRange:](self, "tagAtIndex:unit:scheme:tokenRange:", characterIndex, unit, v16, tokenRange);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v32, v31);

          v19 = v40;
        }

      }
    }
    if (tokenRange)
    {
      if (unit == NLTokenUnitDocument)
      {
        tokenRange->location = 0;
        tokenRange->length = v15;
      }
      else
      {
        NLTaggerGetTokenAtIndex();
        *tokenRange = 0uLL;
      }
    }
    v33 = v20;

  }
  return (NSDictionary *)v33;
}

- (NSRange)tokenRangeAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit
{
  NSUInteger v4;
  NSUInteger v5;
  NSRange result;

  if (-[NSString length](self->_string, "length") <= characterIndex)
  {
    v5 = 0;
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NLTaggerGetTokenAtIndex();
    v4 = 0;
    v5 = 0;
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSRange)tokenRangeForRange:(NSRange)range unit:(NLTokenUnit)unit
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange result;

  length = range.length;
  location = range.location;
  v6 = -[NSString length](self->_string, "length");
  if (v6 <= location)
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (location + length <= v6)
      v7 = length;
    else
      v7 = v6 - location;
    NLTaggerGetTokenAtIndex();
    v8 = 0;
    if (v7)
      NLTaggerGetTokenAtIndex();
  }
  v9 = v8;
  v10 = 0;
  result.length = v10;
  result.location = v9;
  return result;
}

- (NLLanguage)dominantLanguage
{
  void *v2;
  void *v3;

  if (-[NSString length](self->_string, "length"))
  {
    v2 = (void *)NLTaggerCopyTagAtIndex();
    tagForNLTag(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NLLanguage)v3;
}

- (id)dominantScript
{
  __CFString *v3;
  void *v4;
  uint64_t v5;

  v3 = CFSTR("Zyyy");
  if (-[NSString length](self->_string, "length"))
  {
    v4 = (void *)NLTaggerCopyTagAtIndex();
    tagForNLTag(v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v5;
  }
  return v3;
}

+ (id)dominantScriptForString:(id)a3
{
  id v3;
  NLTagger *v4;
  void *v5;
  NLTagger *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [NLTagger alloc];
  v9[0] = CFSTR("Script");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NLTagger initWithTagSchemes:](v4, "initWithTagSchemes:", v5);

  -[NLTagger setString:](v6, "setString:", v3);
  -[NLTagger dominantScript](v6, "dominantScript");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLTagger setString:](v6, "setString:", 0);

  return v7;
}

- (void)setLanguage:(NLLanguage)language range:(NSRange)range
{
  const __CFString *v4;
  CFLocaleRef v5;
  __CFString *v6;

  v4 = language;
  v6 = (__CFString *)v4;
  if (v4)
  {
    v5 = CFLocaleCreate(0, v4);
    NLTaggerSetLocaleForRange();
    if (v5)
      CFRelease(v5);
  }
  else
  {
    NLTaggerSetLocaleForRange();
  }

}

- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSOrthography *v7;
  NSOrthography *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  NSOrthography *v17;
  NLTagger *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  const char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  length = range.length;
  location = range.location;
  v7 = orthography;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  v38 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3010000000;
  v31 = "";
  v32 = xmmword_1A36F7700;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __33__NLTagger_setOrthography_range___block_invoke;
  v16[3] = &unk_1E4A3AAB0;
  v19 = &v33;
  v20 = &v28;
  v21 = &v22;
  v8 = v7;
  v17 = v8;
  v18 = self;
  -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](self, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, 0, CFSTR("Script"), 14, v16);
  v9 = v34;
  v10 = v34[5];
  if (v10)
  {
    v11 = v29[5];
    if (v11)
    {
      v12 = v29[4];
      if (location + length > v12 + v11)
      {
        v29[5] = location + length - v12;
        v10 = v9[5];
      }
      -[NSOrthography dominantLanguageForScript:](v8, "dominantLanguageForScript:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v23[5];
      v23[5] = v13;

      v15 = v23[5];
      if (v15)
        -[NLTagger setLanguage:range:](self, "setLanguage:range:", v15, v29[4], v29[5]);
    }
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v33, 8);

}

void __33__NLTagger_setOrthography_range___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v8 = a2;
  if (v8)
  {
    v19 = v8;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if ((objc_msgSend(v8, "isEqual:") & 1) == 0)
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v10 = *(_QWORD *)(v9 + 40);
        if (v10)
        {
          v11 = *(_QWORD *)(v9 + 32);
          if (a3 > v11 + v10)
            *(_QWORD *)(v9 + 40) = a3 - v11;
          objc_msgSend(*(id *)(a1 + 32), "dominantLanguageForScript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

          v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v15)
            objc_msgSend(*(id *)(a1 + 40), "setLanguage:range:", v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = xmmword_1A36F7700;
        }
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(_QWORD *)(v16 + 40);
    if (!v17)
    {
      *(_QWORD *)(v16 + 32) = a3;
      v8 = v19;
      goto LABEL_14;
    }
    v18 = *(_QWORD *)(v16 + 32);
    v8 = v19;
    if (a3 + a4 > v18 + v17)
    {
      a4 = a3 + a4 - v18;
LABEL_14:
      *(_QWORD *)(v16 + 40) = a4;
    }
  }

}

- (void)stringEditedInRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  id v5;

  -[NLTagger string](self, "string", a3.location, a3.length, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NLTagger setString:](self, "setString:", v5);

}

- (void)setModels:(NSArray *)models forTagScheme:(NLTagScheme)tagScheme
{
  NSArray *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *customModels;
  NSMutableDictionary *v10;
  NSMutableDictionary *customModelDictionaries;
  NSMutableDictionary *v12;
  NSMutableDictionary *classifierCaches;
  NSMutableDictionary *v14;
  NSMutableDictionary *sequenceCaches;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  __CFString *v23;
  NSString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = models;
  v24 = tagScheme;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_customModels)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    customModels = self->_customModels;
    self->_customModels = v8;

  }
  if (!self->_customModelDictionaries)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    customModelDictionaries = self->_customModelDictionaries;
    self->_customModelDictionaries = v10;

  }
  if (!self->_classifierCaches)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    classifierCaches = self->_classifierCaches;
    self->_classifierCaches = v12;

  }
  if (!self->_sequenceCaches)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sequenceCaches = self->_sequenceCaches;
    self->_sequenceCaches = v14;

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v6;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v21, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "language");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          v23 = CFSTR("und");
        objc_msgSend(v7, "setObject:forKey:", v21, v23);

      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  -[NSMutableDictionary setObject:forKey:](self->_customModels, "setObject:forKey:", v16, v24);
  -[NSMutableDictionary setObject:forKey:](self->_customModelDictionaries, "setObject:forKey:", v7, v24);
  -[NSMutableDictionary removeAllObjects](self->_classifierCaches, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sequenceCaches, "removeAllObjects");

}

- (NSArray)modelsForTagScheme:(NLTagScheme)tagScheme
{
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_customModels, "objectForKey:", tagScheme);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

- (void)setGazetteers:(NSArray *)gazetteers forTagScheme:(NLTagScheme)tagScheme
{
  NSArray *v6;
  CFMutableArrayRef Mutable;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __CFString *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *customGazetteers;
  NSMutableDictionary *v18;
  NSMutableDictionary *customGazetteerDictionaries;
  NSString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = gazetteers;
  v20 = tagScheme;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "language");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          v15 = CFSTR("und");
        objc_msgSend(v8, "setObject:forKey:", v14, v15);
        objc_msgSend(v14, "_addImplementationToArray:", Mutable);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  if (!self->_customGazetteers)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    customGazetteers = self->_customGazetteers;
    self->_customGazetteers = v16;

  }
  if (!self->_customGazetteerDictionaries)
  {
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    customGazetteerDictionaries = self->_customGazetteerDictionaries;
    self->_customGazetteerDictionaries = v18;

  }
  -[NSMutableDictionary setObject:forKey:](self->_customGazetteers, "setObject:forKey:", v9, v20);
  -[NSMutableDictionary setObject:forKey:](self->_customGazetteerDictionaries, "setObject:forKey:", v8, v20);
  NLTaggerSetGazetteers();
  CFRelease(Mutable);

}

- (NSArray)gazetteersForTagScheme:(NLTagScheme)tagScheme
{
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_customGazetteers, "objectForKey:", tagScheme);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

+ (void)requestAssetsForLanguage:(NLLanguage)language tagScheme:(NLTagScheme)tagScheme completionHandler:(void *)completionHandler
{
  NSString *v7;
  void *v8;
  NSString *v9;
  NLTaggerAssetRequest *v10;
  id v11;
  _QWORD v12[4];
  NLTaggerAssetRequest *v13;
  id v14;

  v7 = language;
  v8 = completionHandler;
  v9 = tagScheme;
  v10 = -[NLTaggerAssetRequest initWithLanguage:tagScheme:completionHandler:]([NLTaggerAssetRequest alloc], "initWithLanguage:tagScheme:completionHandler:", v7, v9, v8);

  +[NLTagger registerForAssetNotifications](NLTagger, "registerForAssetNotifications");
  if (v10)
  {
    if (-[NLTaggerAssetRequest isFulfilled](v10, "isFulfilled"))
    {
      (*((void (**)(void *, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
    else
    {
      if (_loadTextInput_onceToken != -1)
        dispatch_once(&_loadTextInput_onceToken, &__block_literal_global_141);
      v11 = objc_alloc_init((Class)_TILinguisticAssetDownloadClient);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__NLTagger_requestAssetsForLanguage_tagScheme_completionHandler___block_invoke;
      v12[3] = &unk_1E4A3AAD8;
      v13 = v10;
      v14 = v8;
      objc_msgSend(v11, "requestLinguisticAssetsForLanguage:completion:", v7, v12);

    }
  }

}

void __65__NLTagger_requestAssetsForLanguage_tagScheme_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isFulfilled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
      NSLog(CFSTR("Download request error: %@"), v5);
    switch(a2)
    {
      case -2:
        v9 = *(void **)(a1 + 32);
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0CB2D50];
        v14[0] = CFSTR("Asset download service is unavailable");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "completeWithResult:error:", 2, v12);

        break;
      case -1:
        v6 = *(void **)(a1 + 32);
        v7 = 2;
        v8 = v5;
        goto LABEL_9;
      case 0:
      case 2:
        v6 = *(void **)(a1 + 32);
        v7 = 1;
        v8 = 0;
LABEL_9:
        objc_msgSend(v6, "completeWithResult:error:", v7, v8);
        break;
      case 1:
        objc_msgSend(*(id *)(a1 + 32), "waitForFulfillment");
        break;
      default:
        break;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customGazetteerDictionaries, 0);
  objc_storeStrong((id *)&self->_customGazetteers, 0);
  objc_storeStrong((id *)&self->_sequenceCaches, 0);
  objc_storeStrong((id *)&self->_classifierCaches, 0);
  objc_storeStrong((id *)&self->_customModelDictionaries, 0);
  objc_storeStrong((id *)&self->_customModels, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_schemes, 0);
}

@end
