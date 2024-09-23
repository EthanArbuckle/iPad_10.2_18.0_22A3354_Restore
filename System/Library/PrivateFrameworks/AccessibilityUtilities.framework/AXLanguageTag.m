@implementation AXLanguageTag

+ (AXLanguageTag)tagWithDialects:(id)a3 range:(_NSRange)a4 content:(id)a5 predictedByTagger:(BOOL)a6
{
  _BOOL8 v6;
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  AXLanguageTag *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(AXLanguageTag);
  -[AXLanguageTag setContent:](v12, "setContent:", v11);
  -[AXLanguageTag setRange:](v12, "setRange:", location, length);
  -[AXLanguageTag setWasPredicted:](v12, "setWasPredicted:", v6);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v18, "langMap", (_QWORD)v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isAmbiguous");

        if (v20)
          -[AXLanguageTag addAmbiguousDialect:](v12, "addAmbiguousDialect:", v18);
        else
          -[AXLanguageTag addUnambiguousDialect:](v12, "addUnambiguousDialect:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  return v12;
}

- (BOOL)hasAmbigiousDialects
{
  void *v2;
  BOOL v3;

  -[AXLanguageTag ambiguousDialects](self, "ambiguousDialects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (AXDialectMap)preferredAmbiguousDialect
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AXLanguageTag ambiguousDialects](self, "ambiguousDialects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AXLanguageTag ambiguousDialects](self, "ambiguousDialects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (AXDialectMap *)v6;
}

- (AXDialectMap)preferredUnambiguousDialect
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AXLanguageTag unambiguousDialects](self, "unambiguousDialects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AXLanguageTag unambiguousDialects](self, "unambiguousDialects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (AXDialectMap *)v6;
}

- (NSString)contentSubstring
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = -[AXLanguageTag range](self, "range");
  v5 = v3 + v4;
  -[AXLanguageTag content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v5 > v7)
  {
    AXLogSpokenContentTextProcessing();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AXLanguageTag contentSubstring].cold.1(self, v8);

  }
  v9 = -[AXLanguageTag range](self, "range");
  v11 = v9 + v10;
  -[AXLanguageTag content](self, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v11 <= v13)
  {
    -[AXLanguageTag content](self, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[AXLanguageTag range](self, "range");
    objc_msgSend(v15, "substringWithRange:", v16, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return (NSString *)v14;
}

- (AXDialectMap)dialect
{
  void *v3;
  void *v4;
  void *v5;

  -[AXLanguageTag unambiguousDialects](self, "unambiguousDialects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXLanguageTag preferredUnambiguousDialect](self, "preferredUnambiguousDialect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXLanguageTag preferredAmbiguousDialect](self, "preferredAmbiguousDialect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AXLanguageTag preferredAmbiguousDialect](self, "preferredAmbiguousDialect");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return (AXDialectMap *)v4;
}

- (void)addUnambiguousDialect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[AXLanguageTag unambiguousDialects](self, "unambiguousDialects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[AXLanguageTag setUnambiguousDialects:](self, "setUnambiguousDialects:", v6);

  }
  -[AXLanguageTag unambiguousDialects](self, "unambiguousDialects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addAmbiguousDialect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[AXLanguageTag ambiguousDialects](self, "ambiguousDialects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[AXLanguageTag setAmbiguousDialects:](self, "setAmbiguousDialects:", v6);

  }
  -[AXLanguageTag ambiguousDialects](self, "ambiguousDialects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addAmbiguousDialects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AXLanguageTag addAmbiguousDialect:](self, "addAmbiguousDialect:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addPredictedSecondaryDialects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[AXLanguageTag predictedSecondaryDialects](self, "predictedSecondaryDialects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[AXLanguageTag setPredictedSecondaryDialects:](self, "setPredictedSecondaryDialects:", v6);

  }
  -[AXLanguageTag predictedSecondaryDialects](self, "predictedSecondaryDialects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionOrderedSet:", v4);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXLanguageTag dialect](self, "dialect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specificLanguageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageTag contentSubstring](self, "contentSubstring");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("$"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canBeSpokenByDialect:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[AXLanguageTag contentSubstring](self, "contentSubstring");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "canSpeakString:allowsTransliteration:", v5, 0);

  return v6;
}

- (BOOL)canBeSpokenByLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialectForLanguageID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[AXLanguageTag canBeSpokenByDialect:](self, "canBeSpokenByDialect:", v6);
  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_NSRange *)(v5 + 48) = self->_range;
  WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  objc_storeWeak((id *)(v5 + 16), WeakRetained);

  v7 = -[NSMutableOrderedSet mutableCopyWithZone:](self->_unambiguousDialects, "mutableCopyWithZone:", a3);
  v8 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v7;

  v9 = -[NSMutableOrderedSet mutableCopyWithZone:](self->_ambiguousDialects, "mutableCopyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  *(_BYTE *)(v5 + 8) = self->_wasPredicted;
  return (id)v5;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)content
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_content);
}

- (void)setContent:(id)a3
{
  objc_storeWeak((id *)&self->_content, a3);
}

- (NSMutableOrderedSet)unambiguousDialects
{
  return self->_unambiguousDialects;
}

- (void)setUnambiguousDialects:(id)a3
{
  objc_storeStrong((id *)&self->_unambiguousDialects, a3);
}

- (NSMutableOrderedSet)ambiguousDialects
{
  return self->_ambiguousDialects;
}

- (void)setAmbiguousDialects:(id)a3
{
  objc_storeStrong((id *)&self->_ambiguousDialects, a3);
}

- (BOOL)wasPredicted
{
  return self->_wasPredicted;
}

- (void)setWasPredicted:(BOOL)a3
{
  self->_wasPredicted = a3;
}

- (NSMutableOrderedSet)predictedSecondaryDialects
{
  return self->_predictedSecondaryDialects;
}

- (void)setPredictedSecondaryDialects:(id)a3
{
  objc_storeStrong((id *)&self->_predictedSecondaryDialects, a3);
}

- (BOOL)createdFromNewline
{
  return self->_createdFromNewline;
}

- (void)setCreatedFromNewline:(BOOL)a3
{
  self->_createdFromNewline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedSecondaryDialects, 0);
  objc_storeStrong((id *)&self->_ambiguousDialects, 0);
  objc_storeStrong((id *)&self->_unambiguousDialects, 0);
  objc_destroyWeak((id *)&self->_content);
}

- (void)contentSubstring
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_18C62B000, a2, OS_LOG_TYPE_FAULT, "The range of the tagged chunk is greater than the content. Something went awry %@", (uint8_t *)&v4, 0xCu);

}

@end
