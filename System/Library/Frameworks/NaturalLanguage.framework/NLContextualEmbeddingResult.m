@implementation NLContextualEmbeddingResult

- (NLContextualEmbeddingResult)initWithString:(id)a3 tokenDictionaries:(id)a4 data:(id)a5 language:(id)a6 tokenVectorDimension:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NLContextualEmbeddingResult *v16;
  uint64_t v17;
  NSString *string;
  uint64_t v19;
  NSArray *tokenDictionaries;
  uint64_t v21;
  NSData *data;
  uint64_t v23;
  NSString *language;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NLContextualEmbeddingResult;
  v16 = -[NLContextualEmbeddingResult init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    string = v16->_string;
    v16->_string = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    tokenDictionaries = v16->_tokenDictionaries;
    v16->_tokenDictionaries = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    data = v16->_data;
    v16->_data = (NSData *)v21;

    v23 = objc_msgSend(v15, "copy");
    language = v16->_language;
    v16->_language = (NSString *)v23;

    v16->_tokenVectorDimension = a7;
  }

  return v16;
}

- (NSString)string
{
  return self->_string;
}

- (NLLanguage)language
{
  return self->_language;
}

- (NSUInteger)sequenceLength
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_tokenDictionaries;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "objectForKey:", CFSTR("SubtokenRanges"), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
          v5 += objc_msgSend(v8, "count");

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sentenceVector
{
  return 0;
}

- (id)sentenceVectorData
{
  return 0;
}

- (id)_tokenVectorAtIndex:(unint64_t)a3
{
  void *v5;
  _DWORD *v6;
  double v7;
  unint64_t tokenVectorDimension;
  _DWORD *v9;
  unint64_t i;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSData bytes](self->_data, "bytes");
  tokenVectorDimension = self->_tokenVectorDimension;
  if (tokenVectorDimension)
  {
    v9 = v6;
    for (i = 0; i < tokenVectorDimension; ++i)
    {
      LODWORD(v7) = v9[i + tokenVectorDimension * a3];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

      tokenVectorDimension = self->_tokenVectorDimension;
    }
  }
  return v5;
}

- (NSArray)tokenVectorAtIndex:(NSUInteger)characterIndex tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  NSRange *v22;
  NSUInteger v23;
  NSArray *obj;
  NSUInteger v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_tokenDictionaries;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v28)
  {
    v22 = tokenRange;
    v6 = 0;
    v25 = 0;
    v29 = 0;
    v27 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "objectForKey:", CFSTR("SubtokenRanges"), v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
LABEL_8:
          v13 = 0;
          v14 = v6 + v11;
          while (1)
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(v9);
            v15 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "rangeValue");
            if (v15 <= characterIndex && v15 + v16 > characterIndex)
              break;
            if (v11 == ++v13)
            {
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              v6 = v14;
              if (v11)
                goto LABEL_8;
              goto LABEL_21;
            }
          }
          v18 = v15;
          v19 = v16;
          v6 += v13;
          -[NLContextualEmbeddingResult _tokenVectorAtIndex:](self, "_tokenVectorAtIndex:", v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v29 = v20;
            v25 = v19;
            continue;
          }
          v23 = v18;
          goto LABEL_26;
        }
        v14 = v6;
LABEL_21:

        v6 = v14;
      }
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v28)
        continue;
      break;
    }
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = v25;
    v20 = v29;
LABEL_26:
    tokenRange = v22;
  }
  else
  {
    v19 = 0;
    v20 = 0;
  }

  if (tokenRange)
  {
    tokenRange->location = v23;
    tokenRange->length = v19;
  }
  return (NSArray *)v20;
}

- (id)tokenVectorData
{
  return self->_data;
}

- (id)tokenDictionaries
{
  return self->_tokenDictionaries;
}

- (void)enumerateTokenVectorsInRange:(NSRange)range usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSArray *obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (**v37)(void *, void *, unint64_t, uint64_t, _BYTE *);
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned __int8 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  length = range.length;
  location = range.location;
  v51 = *MEMORY[0x1E0C80C00];
  v37 = block;
  v48 = 0;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = self->_tokenDictionaries;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v34)
  {
    v6 = 0;
    v33 = *(_QWORD *)v45;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v33)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v7);
      objc_msgSend(v8, "objectForKey:", CFSTR("TokenRange"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "rangeValue");
      v12 = v11;

      objc_msgSend(v8, "objectForKey:", CFSTR("SubtokenRanges"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v39 = v13;
      v14 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v14)
      {
        v15 = v14;
        v35 = v7;
        v16 = *(_QWORD *)v41;
        while (2)
        {
          v17 = 0;
          v38 = v15;
          do
          {
            v18 = v17;
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(v39);
            v19 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v17), "rangeValue");
            v21 = v20;
            if (rangesMatch(location, length, v10, v12)
              && rangesMatch(location, length, v19, v21))
            {
              -[NLContextualEmbeddingResult _tokenVectorAtIndex:](self, "_tokenVectorAtIndex:", v6 + v18);
              v22 = v16;
              v23 = v12;
              v24 = v10;
              v25 = location;
              v26 = length;
              v27 = v6;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v37[2](v37, v28, v19, v21, &v48);

              v6 = v27;
              length = v26;
              location = v25;
              v10 = v24;
              v12 = v23;
              v16 = v22;
              v15 = v38;
            }
            if (v48)
            {
              v30 = v6 + v18;
              goto LABEL_19;
            }
            v17 = v18 + 1;
          }
          while (v15 != v18 + 1);
          v15 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          v29 = v6;
          v6 += v17;
          if (v15)
            continue;
          break;
        }
        v30 = v29 + v18;
LABEL_19:
        v6 = v30 + 1;
        v7 = v35;
      }

      v31 = v48;
      if (v31)
        break;
      if (++v7 == v34)
      {
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v34)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tokenDictionaries, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
