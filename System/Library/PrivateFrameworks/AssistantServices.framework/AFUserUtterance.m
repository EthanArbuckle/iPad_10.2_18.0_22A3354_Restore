@implementation AFUserUtterance

- (AFUserUtterance)initWithPhrases:(id)a3 correctionIdentifier:(id)a4
{
  id v6;
  id v7;
  AFUserUtterance *v8;
  uint64_t v9;
  NSDictionary *correctionIdentifier;
  uint64_t v11;
  NSMutableArray *phrases;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  v8 = -[AFUserUtterance init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    correctionIdentifier = v8->_correctionIdentifier;
    v8->_correctionIdentifier = (NSDictionary *)v9;

    v11 = objc_msgSend(v6, "copy");
    phrases = v8->_phrases;
    v8->_phrases = (NSMutableArray *)v11;

  }
  return v8;
}

- (AFUserUtterance)initWithPhrases:(id)a3 utterances:(id)a4
{
  id v6;
  id v7;
  AFUserUtterance *v8;
  uint64_t v9;
  NSMutableArray *phrases;
  uint64_t v11;
  NSMutableArray *utterances;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  v8 = -[AFUserUtterance init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    phrases = v8->_phrases;
    v8->_phrases = (NSMutableArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    utterances = v8->_utterances;
    v8->_utterances = (NSMutableArray *)v11;

  }
  return v8;
}

- (AFUserUtterance)initWithPhrases:(id)a3 sentenceConfidence:(int64_t)a4 utterances:(id)a5 correctionIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  AFUserUtterance *v13;
  uint64_t v14;
  NSDictionary *correctionIdentifier;
  uint64_t v16;
  NSMutableArray *phrases;
  uint64_t v18;
  NSMutableArray *utterances;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AFUserUtterance;
  v13 = -[AFUserUtterance init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    correctionIdentifier = v13->_correctionIdentifier;
    v13->_correctionIdentifier = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    phrases = v13->_phrases;
    v13->_phrases = (NSMutableArray *)v16;

    v18 = objc_msgSend(v11, "copy");
    utterances = v13->_utterances;
    v13->_utterances = (NSMutableArray *)v18;

    v13->_sentenceConfidence = a4;
  }

  return v13;
}

- (AFUserUtterance)initWithTokens:(id)a3 correctionIdentifier:(id)a4
{
  id v6;
  id v7;
  AFUserUtterance *v8;
  uint64_t v9;
  NSDictionary *correctionIdentifier;
  uint64_t v11;
  NSMutableArray *tokens;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  v8 = -[AFUserUtterance init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    correctionIdentifier = v8->_correctionIdentifier;
    v8->_correctionIdentifier = (NSDictionary *)v9;

    v11 = objc_msgSend(v6, "copy");
    tokens = v8->_tokens;
    v8->_tokens = (NSMutableArray *)v11;

  }
  return v8;
}

- (AFUserUtterance)initWithString:(id)a3 correctionIdentifier:(id)a4
{
  id v6;
  id v7;
  AFUserUtterance *v8;
  uint64_t v9;
  NSDictionary *correctionIdentifier;
  uint64_t v11;
  NSString *text;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  v8 = -[AFUserUtterance init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    correctionIdentifier = v8->_correctionIdentifier;
    v8->_correctionIdentifier = (NSDictionary *)v9;

    v11 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v11;

  }
  return v8;
}

- (int64_t)numberOfAlternativeUtterances
{
  return -[NSMutableArray count](self->_utterances, "count");
}

- (id)bestTextInterpretation
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *tokens;
  NSString *v14;
  NSString *text;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_phrases)
  {
    tokens = self->_tokens;
    if (tokens)
    {
      af_bestTokenInterpretation(tokens);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      text = self->_text;
      if (!text)
        return &stru_1E3A37708;
      v14 = text;
    }
    return v14;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_phrases;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "firstInterpretation", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tokens");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  af_bestTokenInterpretation(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rangeListOfDifferingTextFromUtteranceAtIndex:(unint64_t)a3 comparedToBaseUtteranceAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  __int128 v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3 == a4)
    return 0;
  if (-[NSMutableArray count](self->_utterances, "count") <= a3)
  {
    v25 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315394;
    v31 = "-[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:]";
    v32 = 2050;
    v33 = a3;
    v26 = "%s utterance index (%{public}lu) is out of range";
LABEL_20:
    _os_log_error_impl(&dword_19AF50000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
    return 0;
  }
  if (-[NSMutableArray count](self->_utterances, "count") <= a4)
  {
    v25 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315394;
    v31 = "-[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:]";
    v32 = 2050;
    v33 = a4;
    v26 = "%s base utterance index (%{public}lu) is out of range";
    goto LABEL_20;
  }
  -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interpretationIndices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interpretationIndices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_phrases, "count"))
  {
    v12 = 0;
    v13 = 0;
    *(_QWORD *)&v11 = 136315650;
    v28 = v11;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v13, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      objc_msgSend(v10, "objectAtIndex:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      -[NSMutableArray objectAtIndex:](self->_phrases, "objectAtIndex:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "interpretations");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 >= objc_msgSend(v19, "count"))
      {
        v24 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v31 = "-[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:]";
          v32 = 2050;
          v33 = v15;
          v34 = 2112;
          v35 = v19;
          _os_log_error_impl(&dword_19AF50000, v24, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndex (%{public}lu) is out of range of interpretations=%@", buf, 0x20u);
        }
      }
      else
      {
        objc_msgSend(v19, "objectAtIndex:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v15 != v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v12, objc_msgSend(v21, "length"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v23);

        }
        v12 += objc_msgSend(v22, "length");

      }
      ++v13;
    }
    while (v13 < -[NSMutableArray count](self->_phrases, "count"));
  }

  return v29;
}

- (id)speechTokensForUtteranceAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_utterances, "count") <= a3)
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[AFUserUtterance speechTokensForUtteranceAtIndex:]";
      v22 = 2050;
      v23 = a3;
      _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, "%s utterance index (%{public}lu) is out of range", buf, 0x16u);
    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interpretationIndices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSMutableArray count](self->_phrases, "count"))
    {
      v9 = 0;
      *(_QWORD *)&v8 = 136315650;
      v19 = v8;
      do
      {
        objc_msgSend(v7, "objectAtIndex:", v9, v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");

        -[NSMutableArray objectAtIndex:](self->_phrases, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "interpretations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 >= objc_msgSend(v13, "count"))
        {
          v16 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v21 = "-[AFUserUtterance speechTokensForUtteranceAtIndex:]";
            v22 = 2050;
            v23 = v11;
            v24 = 2112;
            v25 = v13;
            _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndex (%{public}lu) is out of range of interpretations=%@", buf, 0x20u);
          }
        }
        else
        {
          objc_msgSend(v13, "objectAtIndex:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "tokens");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v15);

        }
        ++v9;
      }
      while (v9 < -[NSMutableArray count](self->_phrases, "count"));
    }

    return v5;
  }
}

- (id)longestCommonSubsequenceBetweenList:(id)a3 andList:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v39;
  void *v40;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v45 = v5;
  v7 = objc_msgSend(v5, "count");
  v44 = v6;
  v8 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == -1)
    goto LABEL_8;
  v10 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8 + 1;
    if (v8 != -1)
    {
      do
      {
        objc_msgSend(v11, "addObject:", &unk_1E3AA5C08);
        --v12;
      }
      while (v12);
    }
    objc_msgSend(v9, "addObject:", v11);

  }
  while (v10++ != v7);
  if (v7)
  {
LABEL_8:
    v14 = 0;
    v43 = v7;
    do
    {
      while (1)
      {
        v15 = v14 + 1;
        if (v8)
          break;
        ++v14;
        if (v15 == v7)
          goto LABEL_28;
      }
      v16 = 0;
      do
      {
        objc_msgSend(v45, "objectAtIndex:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndex:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isEqualToString:", v20);

        if (v21)
        {
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v16);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberWithInt:", objc_msgSend(v24, "intValue") + 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v14 + 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:atIndexedSubscript:", v25, ++v16);

        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v14 + 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", v16);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndexedSubscript:", ++v16);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28 >= v30)
            v31 = v28;
          else
            v31 = v30;
          v24 = v31;

          objc_msgSend(v9, "objectAtIndexedSubscript:", v14 + 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:atIndexedSubscript:", v24, v16);
        }

      }
      while (v16 != v8);
      ++v14;
      v7 = v43;
    }
    while (v15 != v43);
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7 - 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 != v35)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", v8);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", --v8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37 == v39)
          continue;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 - 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "insertObject:atIndex:", v40, 0);

      }
      --v7;
    }
    while (v7 && v8);
  }
LABEL_28:

  return v42;
}

- (id)rangeListOfDifferingTextFromSpeechInterpretation:(id)a3 comparedToBaseUtteranceAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AFUserUtterance speechTokensForUtteranceAtIndex:](self, "speechTokensForUtteranceAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUserUtterance rangeListOfDifferingTextFromSpeechInterpretation:comparedToBaseTokenList:](self, "rangeListOfDifferingTextFromSpeechInterpretation:comparedToBaseTokenList:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)rangeListOfDifferingTextFromSpeechInterpretation:(id)a3 comparedToBaseTokenList:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUserUtterance rangeListOfDifferingTextFromTargetTokenList:comparedToBaseTokenList:](self, "rangeListOfDifferingTextFromTargetTokenList:comparedToBaseTokenList:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)rangeListOfDifferingTextFromTargetTokenList:(id)a3 comparedToBaseTokenList:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  void *v21;

  v6 = a3;
  -[AFUserUtterance longestCommonSubsequenceBetweenList:andList:](self, "longestCommonSubsequenceBetweenList:andList:", v6, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v21, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      if (v9 >= v7)
      {
        v14 = 1;
      }
      else
      {
        objc_msgSend(v21, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        v14 = v10 != v13;
        if (v10 == v13)
          ++v9;
      }
      objc_msgSend(v6, "objectAtIndex:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (!((v8 == 0) | v11 & 1))
        v8 += objc_msgSend(v15, "removeSpaceBefore") ^ 1;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v8, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v18);

      }
      v8 += v17;
      v11 = objc_msgSend(v15, "removeSpaceAfter");

      ++v10;
    }
    while (v10 < objc_msgSend(v6, "count"));
  }

  return v20;
}

- (id)textOfUtteranceAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v19;
  NSMutableArray *phrases;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_phrases || -[NSMutableArray count](self->_utterances, "count") <= a3)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interpretationIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 == -[NSMutableArray count](self->_phrases, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_phrases, "count"))
    {
      v10 = 0;
      *(_QWORD *)&v9 = 136315650;
      v21 = v9;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", v10, v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        -[NSMutableArray objectAtIndex:](self->_phrases, "objectAtIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "interpretations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 >= objc_msgSend(v14, "count"))
        {
          v17 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v23 = "-[AFUserUtterance textOfUtteranceAtIndex:]";
            v24 = 2050;
            v25 = v12;
            v26 = 2112;
            v27 = v14;
            _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndex (%{public}lu) is out of range of interpretations=%@", buf, 0x20u);
          }
        }
        else
        {
          objc_msgSend(v14, "objectAtIndex:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v16);

        }
        ++v10;
      }
      while (v10 < -[NSMutableArray count](self->_phrases, "count"));
    }
  }
  else
  {
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      phrases = self->_phrases;
      *(_DWORD *)buf = 136315650;
      v23 = "-[AFUserUtterance textOfUtteranceAtIndex:]";
      v24 = 2112;
      v25 = (unint64_t)phrases;
      v26 = 2114;
      v27 = v6;
      _os_log_error_impl(&dword_19AF50000, v19, OS_LOG_TYPE_ERROR, "%s Phrase length is not the same as interpretationIndices. Phrases=%@, interpretationIndices=%{public}@", buf, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)interpretationOfUtteranceAtIndex:(unint64_t)a3
{
  NSMutableArray *utterances;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  AFSpeechInterpretation *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  AFUserUtterance *v19;
  id v20;

  utterances = self->_utterances;
  if (!utterances || -[NSMutableArray count](utterances, "count") <= a3)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interpretationIndices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = -[NSMutableArray count](self->_phrases, "count");

  if (v8 == v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interpretationIndices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __52__AFUserUtterance_interpretationOfUtteranceAtIndex___block_invoke;
    v18 = &unk_1E3A2E498;
    v19 = self;
    v20 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v15);

    v13 = objc_alloc_init(AFSpeechInterpretation);
    -[AFSpeechInterpretation setTokens:](v13, "setTokens:", v12, v15, v16, v17, v18, v19);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)allRecognitionStringsAndScores
{
  id v3;
  __int128 v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSMutableArray *tokens;
  NSMutableArray *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[5];
  _QWORD v78[5];
  _BYTE v79[128];
  uint8_t v80[128];
  _BYTE buf[24];
  void *v82;
  id v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_phrases)
  {
    if (-[NSMutableArray count](self->_utterances, "count"))
    {
      if (-[NSMutableArray count](self->_utterances, "count"))
      {
        v5 = 0;
        *(_QWORD *)&v4 = 136315394;
        v57 = v4;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", v5, v57);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "confidenceScore");
          -[AFUserUtterance textOfUtteranceAtIndex:](self, "textOfUtteranceAtIndex:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v75[0] = CFSTR("avg");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v76[0] = v9;
            v75[1] = CFSTR("index");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v76[1] = v10;
            v75[2] = CFSTR("source");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "source"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v76[2] = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v12, v8);

          }
          else
          {
            v13 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v57;
              *(_QWORD *)&buf[4] = "-[AFUserUtterance allRecognitionStringsAndScores]";
              *(_WORD *)&buf[12] = 2050;
              *(_QWORD *)&buf[14] = v5;
              _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s No utterance text existed for utterance index %{public}lu", buf, 0x16u);
            }
          }

          ++v5;
        }
        while (v5 < -[NSMutableArray count](self->_utterances, "count"));
      }
      return v3;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v15 = self->_phrases;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    if (!v22)
      goto LABEL_67;
    v23 = v22;
    v24 = *(_QWORD *)v59;
LABEL_22:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v59 != v24)
        objc_enumerationMutation(v15);
      objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v25), "allInterpretationStringsAndScores");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "count"))
      {
        if (objc_msgSend(v26, "count"))
        {
          v27 = v3;
          v28 = v26;
          if (objc_msgSend(v28, "count"))
          {
            if (objc_msgSend(v27, "count"))
            {
              v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __af_mergedUtteranceDictionary_block_invoke;
              v82 = &unk_1E3A2E138;
              v83 = v28;
              v30 = v29;
              v84 = v30;
              objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", buf);
              v31 = v84;
              v32 = v30;

LABEL_34:
              objc_msgSend(v27, "setDictionary:", v32);

              goto LABEL_35;
            }
            v33 = v28;
          }
          else
          {
            v33 = v27;
          }
          v32 = v33;
          goto LABEL_34;
        }
      }
      else
      {
        objc_msgSend(v3, "setDictionary:", v26);
      }
LABEL_35:

      if (v23 == ++v25)
      {
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
        if (!v23)
          goto LABEL_67;
        goto LABEL_22;
      }
    }
  }
  tokens = self->_tokens;
  if (tokens)
  {
    af_bestTokenInterpretation(tokens);
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_tokens;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v71 != v20)
            objc_enumerationMutation(v16);
          v19 += objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "confidenceScore");
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v34 = v16;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v67;
      v38 = -1;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v67 != v37)
            objc_enumerationMutation(v34);
          v40 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "confidenceScore");
          if (v40 > v38)
            v38 = v40;
        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      }
      while (v36);
    }
    else
    {
      v38 = -1;
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v41 = v34;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v63;
      v45 = 1000;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v63 != v44)
            objc_enumerationMutation(v41);
          v47 = objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * k), "confidenceScore");
          if (v47 < v45)
            v45 = v47;
        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
      }
      while (v43);
    }
    else
    {
      v45 = 1000;
    }

    v48 = -[NSMutableArray count](v41, "count");
    if (v48 < 1)
      v49 = 0;
    else
      v49 = v19 / v48;
    v77[0] = CFSTR("avg");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v50;
    v77[1] = CFSTR("max");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v51;
    v77[2] = CFSTR("min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v45);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v52;
    v77[3] = CFSTR("sum");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v53;
    v77[4] = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](v41, "count"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v78[4] = v54;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 5);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v55, v15);
LABEL_67:

  }
  else if (self->_text)
  {
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AA70]);
  }
  return v3;
}

- (void)_updatePhraseswithSwapIndices:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  AFSpeechPhrase *v20;
  NSMutableArray *phrases;
  void *v22;
  NSMutableArray *v23;
  NSObject *v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray count](self->_phrases, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_phrases, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "integerValue");

        -[NSMutableArray objectAtIndex:](self->_phrases, "objectAtIndex:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9
          && (objc_msgSend(v10, "interpretations"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "count"),
              v12,
              v9 < v13))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "interpretations");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            v16 = 0;
            do
            {
              if (v9 == v16)
                v17 = 0;
              else
                v17 = v16;
              if (v16)
                v18 = v17;
              else
                v18 = v9;
              objc_msgSend(v15, "objectAtIndex:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v19);

              ++v16;
            }
            while (v16 < objc_msgSend(v15, "count"));
          }
          v20 = -[AFSpeechPhrase initWithInterpretations:isLowConfidence:]([AFSpeechPhrase alloc], "initWithInterpretations:isLowConfidence:", v14, objc_msgSend(v11, "isLowConfidence"));
          -[NSMutableArray addObject:](v6, "addObject:", v20);

        }
        else
        {
          -[NSMutableArray addObject:](v6, "addObject:", v11);
        }

        ++v7;
      }
      while (v7 < -[NSMutableArray count](self->_phrases, "count"));
    }
    phrases = self->_phrases;
    self->_phrases = v6;

  }
  else
  {
    v22 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v23 = self->_phrases;
      v24 = v22;
      v25 = 136315650;
      v26 = "-[AFUserUtterance _updatePhraseswithSwapIndices:]";
      v27 = 2050;
      v28 = -[NSMutableArray count](v23, "count");
      v29 = 2050;
      v30 = objc_msgSend(v4, "count");
      _os_log_error_impl(&dword_19AF50000, v24, OS_LOG_TYPE_ERROR, "%s _phrase count (%{public}ld) not match swapIndices count (%{public}ld)", (uint8_t *)&v25, 0x20u);

    }
  }

}

- (void)_updateUtteranceswithAlternativeUtteranceAtIndex:(unint64_t)a3 swapIndices:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  AFSpeechUtterance *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *v29;
  NSMutableArray *utterances;
  __int128 v31;
  AFUserUtterance *v32;
  void *v33;
  unint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_utterances, "count"))
  {
    v9 = 0;
    *(_QWORD *)&v8 = 136315650;
    v31 = v8;
    v32 = self;
    v33 = v7;
    v34 = a3;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", v9, v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 == a3 || !v9)
      {
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v10, v9);
      }
      else
      {
        objc_msgSend(v10, "interpretationIndices");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "count");
        if (v14 == objc_msgSend(v6, "count"))
        {
          if (objc_msgSend(v6, "count"))
          {
            v15 = 0;
            do
            {
              objc_msgSend(v6, "objectAtIndex:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "integerValue");

              objc_msgSend(v12, "objectAtIndex:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "integerValue");

              if (v19 == v17)
                v20 = 0;
              else
                v20 = v19;
              if (!v19)
                v20 = v17;
              if (v17 >= 1)
                v21 = v20;
              else
                v21 = v19;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:atIndexedSubscript:", v22, v15);

              ++v15;
            }
            while (v15 < objc_msgSend(v6, "count"));
          }
          v23 = -[AFSpeechUtterance initWithInterpretationIndices:confidenceScore:]([AFSpeechUtterance alloc], "initWithInterpretationIndices:confidenceScore:", v13, objc_msgSend(v11, "confidenceScore"));
          -[AFSpeechUtterance setSource:](v23, "setSource:", objc_msgSend(v11, "source"));
          v7 = v33;
          objc_msgSend(v33, "addObject:", v23);

          self = v32;
          a3 = v34;
        }
        else
        {
          v24 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            v25 = v24;
            objc_msgSend(v11, "interpretationIndices");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");
            v28 = objc_msgSend(v6, "count");
            *(_DWORD *)buf = v31;
            v36 = "-[AFUserUtterance _updateUtteranceswithAlternativeUtteranceAtIndex:swapIndices:]";
            v37 = 2050;
            v38 = v27;
            v39 = 2050;
            v40 = v28;
            _os_log_error_impl(&dword_19AF50000, v25, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndices count (%{public}ld) does not match swapIndices count (%{public}ld)", buf, 0x20u);

            a3 = v34;
            v7 = v33;
          }
          objc_msgSend(v7, "addObject:", v11);
        }

      }
      ++v9;
    }
    while (v9 < -[NSMutableArray count](self->_utterances, "count"));
  }
  v29 = (NSMutableArray *)objc_msgSend(v7, "copy");
  utterances = self->_utterances;
  self->_utterances = v29;

}

- (id)updateDictationResult:(id)a3 withAlternativeUtteranceAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSMutableArray count](self->_utterances, "count") <= a4)
  {
    -[AFUserUtterance allPhrases](self, "allPhrases");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interpretationIndices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    if (v10 == objc_msgSend(v6, "count"))
    {
      v24 = a4;
      v11 = objc_msgSend(v8, "count");
      if (v11 >= 1)
      {
        v12 = v11;
        for (i = 0; i != v12; ++i)
        {
          objc_msgSend(v6, "objectAtIndex:", i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndex:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");

          objc_msgSend(v9, "addObject:", &unk_1E3AA5C08);
          if (v16 && v16 < objc_msgSend(v14, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "replaceObjectAtIndex:withObject:", i, v17);

          }
        }
      }
      -[AFUserUtterance _updateUtteranceswithAlternativeUtteranceAtIndex:swapIndices:](self, "_updateUtteranceswithAlternativeUtteranceAtIndex:swapIndices:", v24, v9);
      -[AFUserUtterance _updatePhraseswithSwapIndices:](self, "_updatePhraseswithSwapIndices:", v9);
      -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "confidenceScore");
      objc_msgSend(v18, "setConfidenceScore:", objc_msgSend(v19, "confidenceScore"));
      objc_msgSend(v19, "setConfidenceScore:", v20);
      -[AFUserUtterance allPhrases](self, "allPhrases");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[AFUserUtterance updateDictationResult:withAlternativeUtteranceAtIndex:]";
        v27 = 2050;
        v28 = a4;
        _os_log_error_impl(&dword_19AF50000, v22, OS_LOG_TYPE_ERROR, "%s utterance index %{public}lu out of range", buf, 0x16u);
      }
      -[AFUserUtterance allPhrases](self, "allPhrases");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v21;
}

- (NSArray)allPhrases
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)-[NSMutableArray copy](self->_phrases, "copy");
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstInterpretation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoveSpaceBefore:", 1);

  return (NSArray *)v2;
}

- (NSArray)dictationResult
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_phrases)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_phrases;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v23;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v7), "interpretations");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "text");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v15);

                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v12);
          }

          objc_msgSend(v3, "addObject:", v9);
          ++v7;
        }
        while (v7 != v5);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v5);
    }

  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (id)streamingTokens
{
  return self->_tokens;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray count](self->_phrases, "count");
  v7 = -[NSMutableArray count](self->_tokens, "count");
  -[AFUserUtterance bestTextInterpretation](self, "bestTextInterpretation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %lu phrases; %lu tokens; text: \"%@\">"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)correctionIdentifier
{
  return self->_correctionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionIdentifier, 0);
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

void __52__AFUserUtterance_interpretationOfUtteranceAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "interpretations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  objc_msgSend(v9, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

}

@end
