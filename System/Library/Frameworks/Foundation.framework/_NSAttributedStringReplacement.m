@implementation _NSAttributedStringReplacement

- (id)_initWithMetadata:(id)a3
{
  _NSAttributedStringReplacement *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)_NSAttributedStringReplacement;
  v4 = -[_NSAttributedStringReplacement init](&v21, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB68]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v5)
      goto LABEL_24;
    v4->_index = objc_msgSend(v5, "integerValue");
    v6 = *MEMORY[0x1E0C9AB80];
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB88]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v7 = 0;
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v8 = 0;
    if (!v7 || v8 == 0)
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v10 = objc_msgSend(v7, "integerValue");
      v11 = objc_msgSend(v8, "integerValue");
    }
    v4->_specifierRangeInFormatString.location = v10;
    v4->_specifierRangeInFormatString.length = v11;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_24;
    v12 = *MEMORY[0x1E0C9AB70];
    v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB78]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v13 = 0;
    v14 = objc_msgSend(a3, "objectForKeyedSubscript:", v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = (void *)v14;
    else
      v15 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v13 && v15)
    {
      v16 = objc_msgSend(v13, "integerValue");
      v17 = objc_msgSend(v15, "integerValue");
    }
    v4->_replacementRangeInResult.location = v16;
    v4->_replacementRangeInResult.length = v17;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4->_replacementKind = 2;
      v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB60]);
      if (v19)
      {
        v4->_argument = v19;
        v4->_replacementKind = 0;
      }
      else
      {
        v20 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB58]);
        if (v20)
        {
          v4->_argument = v20;
          v4->_replacementKind = 1;
        }
      }
    }
    else
    {
LABEL_24:

      return 0;
    }
  }
  return v4;
}

- (_NSAttributedStringReplacement)initWithIndex:(int64_t)a3 specifierRangeInFormatString:(_NSRange)a4 replacementRangeInResult:(_NSRange)a5 replacementKind:(int64_t)a6 argument:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  _NSAttributedStringReplacement *v13;
  _NSAttributedStringReplacement *v14;
  id v15;
  objc_super v17;
  uint64_t v18;

  length = a5.length;
  location = a5.location;
  v10 = a4.length;
  v11 = a4.location;
  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_NSAttributedStringReplacement;
  v13 = -[_NSAttributedStringReplacement init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_index = a3;
    v13->_specifierRangeInFormatString.length = v10;
    v13->_replacementRangeInResult.location = location;
    v13->_replacementRangeInResult.length = length;
    v13->_replacementKind = a6;
    v13->_specifierRangeInFormatString.location = v11;
    if (a7)
      v15 = a7;
    else
      v15 = 0;
    v14->_argument = v15;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringReplacement;
  -[_NSAttributedStringReplacement dealloc](&v3, sel_dealloc);
}

+ (id)_replacementsFromMetadataArray:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = -[_NSAttributedStringReplacement _initWithMetadata:]([_NSAttributedStringReplacement alloc], "_initWithMetadata:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        if (v9)
          objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v6);
  }
  return v4;
}

- (int64_t)index
{
  return self->_index;
}

- (_NSRange)specifierRangeInFormatString
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD dest[3];
  _NSRange result;

  dest[2] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_specifierRangeInFormatString, 16, 1, 0);
  v2 = dest[0];
  v3 = dest[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)replacementRangeInResult
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD dest[3];
  _NSRange result;

  dest[2] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_replacementRangeInResult, 16, 1, 0);
  v2 = dest[0];
  v3 = dest[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)argument
{
  return objc_getProperty(self, a2, 16, 1);
}

- (int64_t)replacementKind
{
  return self->_replacementKind;
}

@end
