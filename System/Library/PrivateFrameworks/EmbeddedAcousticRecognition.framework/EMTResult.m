@implementation EMTResult

- (EMTResult)initWithLocale:(id)a3 tokens:(id)a4 confidence:(float)a5 lowConfidence:(BOOL)a6 metaInfo:(id)a7 romanization:(id)a8 alternativeSelectionSpans:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  EMTResult *v21;
  EMTResult *v22;
  uint64_t v23;
  NSArray *tokens;
  uint64_t v25;
  NSArray *alternativeSelectionSpans;
  id v28;
  objc_super v29;

  v28 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v29.receiver = self;
  v29.super_class = (Class)EMTResult;
  v21 = -[EMTResult init](&v29, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_locale, a3);
    v23 = objc_msgSend(v17, "copy");
    tokens = v22->_tokens;
    v22->_tokens = (NSArray *)v23;

    v22->_confidence = a5;
    v22->_lowConfidence = a6;
    objc_storeStrong((id *)&v22->_metaInfo, a7);
    objc_storeStrong((id *)&v22->_romanization, a8);
    v25 = objc_msgSend(v20, "copy");
    alternativeSelectionSpans = v22->_alternativeSelectionSpans;
    v22->_alternativeSelectionSpans = (NSArray *)v25;

  }
  return v22;
}

- (id)description
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_tokens;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    v7 = 1;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((v7 & 1) != 0)
          goto LABEL_9;
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "precededBySpace", (_QWORD)v14))
        {
          objc_msgSend(v3, "addObject:", CFSTR(" "));
LABEL_9:
          v10 = 1;
          goto LABEL_11;
        }
        v10 = 0;
LABEL_11:
        objc_msgSend(v9, "text", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v3, "addObject:", v11);
        }
        else if ((v10 & 1) != 0)
        {
          goto LABEL_16;
        }
        if (objc_msgSend(v9, "followedBySpace"))
        {
          objc_msgSend(v3, "addObject:", CFSTR(" "));
LABEL_16:
          v7 = 1;
          goto LABEL_18;
        }
        v7 = 0;
LABEL_18:

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v5)
      {

        if ((v7 & 1) == 0)
          goto LABEL_25;
        goto LABEL_23;
      }
    }
  }

LABEL_23:
  if (objc_msgSend(v3, "count", (_QWORD)v14))
    objc_msgSend(v3, "removeLastObject");
LABEL_25:
  objc_msgSend(v3, "componentsJoinedByString:", &stru_1E5D49530);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSArray *tokens;
  void *v7;
  float confidence;
  float v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    tokens = self->_tokens;
    objc_msgSend(v5, "tokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](tokens, "isEqual:", v7))
    {
      confidence = self->_confidence;
      objc_msgSend(v5, "confidence");
      v10 = confidence == v9;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  float confidence;
  unint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  confidence = self->_confidence;
  if (confidence == 0.0)
    v3 = 0;
  else
    v3 = 31 * LODWORD(confidence);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_tokens;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v3 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "hash", (_QWORD)v9) + 17 * v3;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (float)confidence
{
  return self->_confidence;
}

- (BOOL)lowConfidence
{
  return self->_lowConfidence;
}

- (NSString)metaInfo
{
  return self->_metaInfo;
}

- (NSString)romanization
{
  return self->_romanization;
}

- (NSArray)alternativeSelectionSpans
{
  return self->_alternativeSelectionSpans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSelectionSpans, 0);
  objc_storeStrong((id *)&self->_romanization, 0);
  objc_storeStrong((id *)&self->_metaInfo, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
