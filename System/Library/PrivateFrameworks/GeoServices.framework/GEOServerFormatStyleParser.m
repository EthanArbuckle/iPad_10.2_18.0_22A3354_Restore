@implementation GEOServerFormatStyleParser

- (GEOServerFormatStyleParser)init
{
  GEOServerFormatStyleParser *result;

  result = (GEOServerFormatStyleParser *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOServerFormatStyleParser)initWithString:(id)a3
{
  id v4;
  GEOServerFormatStyleParser *v5;
  uint64_t v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOServerFormatStyleParser;
  v5 = -[GEOServerFormatStyleParser init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

  }
  return v5;
}

- (NSArray)styles
{
  void *v3;
  void *v4;
  NSArray *v5;

  -[GEOServerFormatStyleParser _parseIfNeeded](self, "_parseIfNeeded");
  v3 = (void *)-[NSMutableArray copy](self->_styleNames, "copy");
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (_NSRange)rangeForStyleAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[GEOServerFormatStyleParser _parseIfNeeded](self, "_parseIfNeeded");
  if (-[NSMutableArray count](self->_styleRanges, "count") <= a3)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_styleRanges, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeValue");
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)enumerateStylesWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[GEOServerFormatStyleParser _parseIfNeeded](self, "_parseIfNeeded");
  -[GEOServerFormatStyleParser styles](self, "styles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__GEOServerFormatStyleParser_enumerateStylesWithBlock___block_invoke;
  v7[3] = &unk_1E1C09600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __55__GEOServerFormatStyleParser_enumerateStylesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "rangeForStyleAtIndex:", a3) != 0x7FFFFFFFFFFFFFFFLL)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSArray)tokenRanges
{
  void *v3;
  void *v4;
  NSArray *v5;

  -[GEOServerFormatStyleParser _parseIfNeeded](self, "_parseIfNeeded");
  v3 = (void *)-[NSMutableArray copy](self->_tokenRanges, "copy");
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)enumerateTokenRangesForRemoval:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[GEOServerFormatStyleParser tokenRanges](self, "tokenRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__GEOServerFormatStyleParser_enumerateTokenRangesForRemoval___block_invoke;
  v7[3] = &unk_1E1C09628;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v7);

}

uint64_t __61__GEOServerFormatStyleParser_enumerateTokenRangesForRemoval___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "rangeValue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)attributedStringWithStyleAttributes:(id)a3 defaultAttributes:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CB3778];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithString:attributes:", self->_string, v8);

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __84__GEOServerFormatStyleParser_attributedStringWithStyleAttributes_defaultAttributes___block_invoke;
  v17 = &unk_1E1C09650;
  v18 = v6;
  v19 = v9;
  v10 = v9;
  v11 = v6;
  -[GEOServerFormatStyleParser enumerateStylesWithBlock:](self, "enumerateStylesWithBlock:", &v14);
  -[GEOServerFormatStyleParser _removeTokensFromAttributedString:](self, "_removeTokensFromAttributedString:", v10, v14, v15, v16, v17);
  v12 = (void *)objc_msgSend(v10, "copy");

  return v12;
}

void __84__GEOServerFormatStyleParser_attributedStringWithStyleAttributes_defaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "addAttributes:range:", v7, a3, a4);
    v7 = v8;
  }

}

- (void)_parseIfNeeded
{
  if (!self->_parsed)
    -[GEOServerFormatStyleParser _parse](self, "_parse");
}

- (void)_parse
{
  NSArray *v3;
  NSArray *results;
  NSObject *v5;
  NSUInteger v6;
  NSString *string;
  NSMutableArray *v8;
  NSMutableArray *styleNames;
  NSMutableArray *v10;
  NSMutableArray *styleRanges;
  NSMutableArray *v12;
  NSMutableArray *tokenRanges;
  NSMutableArray *v14;
  NSMutableArray *openStyleNames;
  NSMutableArray *v16;
  NSMutableArray *openStyleLocations;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NSObject *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  NSUInteger v33;
  __int16 v34;
  NSString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (qword_1ECDBBE18 != -1)
    dispatch_once(&qword_1ECDBBE18, &__block_literal_global_74);
  objc_msgSend((id)_MergedGlobals_226, "matchesInString:options:range:", self->_string, 0, 0, -[NSString length](self->_string, "length"));
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  results = self->_results;
  self->_results = v3;

  GEOGetFormatStyleParserLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[NSArray count](self->_results, "count");
    string = self->_string;
    *(_DWORD *)buf = 134218243;
    v33 = v6;
    v34 = 2113;
    v35 = string;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Found %lu tokens in string: %{private}@", buf, 0x16u);
  }

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  styleNames = self->_styleNames;
  self->_styleNames = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  styleRanges = self->_styleRanges;
  self->_styleRanges = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  tokenRanges = self->_tokenRanges;
  self->_tokenRanges = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  openStyleNames = self->_openStyleNames;
  self->_openStyleNames = v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  openStyleLocations = self->_openStyleLocations;
  self->_openStyleLocations = v16;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_results;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (!-[GEOServerFormatStyleParser _handleOpeningResult:](self, "_handleOpeningResult:", v23, (_QWORD)v27)
          && !-[GEOServerFormatStyleParser _handleClosingResult:](self, "_handleClosingResult:", v23))
        {
          GEOGetFormatStyleParserLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Received parsing result, but no opening or closing token found within", buf, 2u);
          }

        }
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v20);
  }

  v25 = self->_openStyleNames;
  self->_openStyleNames = 0;

  v26 = self->_openStyleLocations;
  self->_openStyleLocations = 0;

  self->_parsed = 1;
}

void __36__GEOServerFormatStyleParser__parse__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\{s:(\\w+)\\})|(\\{\\/s:(\\w+)\\})"), 0, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)_MergedGlobals_226;
  _MergedGlobals_226 = v0;

  if (!_MergedGlobals_226)
  {
    GEOGetFormatStyleParserLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v6 = CFSTR("(\\{s:(\\w+)\\})|(\\{\\/s:(\\w+)\\})");
      v7 = 2112;
      v8 = v1;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Couldn't create regex for pattern \"%@\", error: %@", buf, 0x16u);
    }

  }
}

- (BOOL)_handleOpeningResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *openStyleLocations;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  NSRange v25;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "rangeAtIndex:", 1);
  v6 = objc_msgSend(v4, "rangeAtIndex:", 2);
  v8 = v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL;
  v9 = !v8;
  if (!v8)
  {
    -[NSString substringWithRange:](self->_string, "substringWithRange:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_openStyleNames, "addObject:", v10);
    v11 = objc_msgSend(v4, "range");
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_tokenRanges, "addObject:", v14);
    openStyleLocations = self->_openStyleLocations;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](openStyleLocations, "addObject:", v16);

    GEOGetFormatStyleParserLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v25.location = objc_msgSend(v4, "range");
      NSStringFromRange(v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, " {start style \"%@\" %@}", (uint8_t *)&v20, 0x16u);

    }
  }

  return v9;
}

- (BOOL)_handleClosingResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *tokenRanges;
  uint64_t v13;
  void *v14;
  void *v15;
  NSMutableArray *openStyleNames;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  unint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  NSRange v39;
  NSRange v40;
  NSRange v41;
  NSRange v42;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "rangeAtIndex:", 3);
  v6 = objc_msgSend(v4, "rangeAtIndex:", 4);
  v8 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v7;
      v11 = objc_msgSend(v4, "range");
      tokenRanges = self->_tokenRanges;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](tokenRanges, "addObject:", v14);

      -[NSString substringWithRange:](self->_string, "substringWithRange:", v9, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      openStyleNames = self->_openStyleNames;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __51__GEOServerFormatStyleParser__handleClosingResult___block_invoke;
      v30[3] = &unk_1E1C09678;
      v17 = v15;
      v31 = v17;
      v18 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](openStyleNames, "indexOfObjectWithOptions:passingTest:", 2, v30);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        GEOGetFormatStyleParserLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v39.location = objc_msgSend(v4, "range");
          NSStringFromRange(v39);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v17;
          v34 = 2112;
          v35 = v20;
          v21 = "Found closing token for \"%@\" at %@ before any opening token";
LABEL_12:
          _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);

        }
      }
      else
      {
        v22 = v18;
        -[NSMutableArray removeObjectAtIndex:](self->_openStyleNames, "removeObjectAtIndex:", v18);
        if (v22 < -[NSMutableArray count](self->_openStyleLocations, "count"))
        {
          -[NSMutableArray insertObject:atIndex:](self->_styleNames, "insertObject:atIndex:", v17, 0);
          -[NSMutableArray objectAtIndexedSubscript:](self->_openStyleLocations, "objectAtIndexedSubscript:", v22);
          v19 = objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeObjectAtIndex:](self->_openStyleLocations, "removeObjectAtIndex:", v22);
          v23 = -[NSObject unsignedIntegerValue](v19, "unsignedIntegerValue");
          v24 = v11 - v23;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v23, v11 - v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray insertObject:atIndex:](self->_styleRanges, "insertObject:atIndex:", v25, 0);
          GEOGetFormatStyleParserLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v40.location = objc_msgSend(v4, "range");
            NSStringFromRange(v40);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v41.location = v23;
            v41.length = v24;
            NSStringFromRange(v41);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v33 = v17;
            v34 = 2112;
            v35 = v27;
            v36 = 2112;
            v37 = v28;
            _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, " {end style \"%@\" %@, range: %@}", buf, 0x20u);

          }
          v8 = 1;
          goto LABEL_14;
        }
        GEOGetFormatStyleParserLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v42.location = objc_msgSend(v4, "range");
          NSStringFromRange(v42);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v17;
          v34 = 2112;
          v35 = v20;
          v21 = "Found closing token for \"%@\" at %@ but no opening range";
          goto LABEL_12;
        }
      }
      v8 = 0;
LABEL_14:

    }
  }

  return v8;
}

uint64_t __51__GEOServerFormatStyleParser__handleClosingResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

- (void)_removeTokensFromAttributedString:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (v4)
  {
    -[GEOServerFormatStyleParser _parseIfNeeded](self, "_parseIfNeeded");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__GEOServerFormatStyleParser__removeTokensFromAttributedString___block_invoke;
    v5[3] = &unk_1E1C096A0;
    v6 = v4;
    -[GEOServerFormatStyleParser enumerateTokenRangesForRemoval:](self, "enumerateTokenRangesForRemoval:", v5);

  }
}

uint64_t __64__GEOServerFormatStyleParser__removeTokensFromAttributedString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openStyleLocations, 0);
  objc_storeStrong((id *)&self->_openStyleNames, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_styleRanges, 0);
  objc_storeStrong((id *)&self->_styleNames, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
