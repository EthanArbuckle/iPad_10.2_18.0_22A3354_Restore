@implementation _LTCombinedTranslationResult

- (_LTCombinedTranslationResult)initWithParagraphResults:(id)a3 localePair:(id)a4
{
  id v6;
  id v7;
  _LTCombinedTranslationResult *v8;
  uint64_t v9;
  NSArray *paragraphResults;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  _LTLocalePair *localePair;
  void *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  NSArray *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  _LTCombinedTranslationResult *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  uint8_t buf[4];
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)_LTCombinedTranslationResult;
  v8 = -[_LTCombinedTranslationResult init](&v45, sel_init);
  if (!v8)
  {
LABEL_19:
    v33 = 0;
    goto LABEL_31;
  }
  v9 = objc_msgSend(v6, "copy");
  paragraphResults = v8->_paragraphResults;
  v8->_paragraphResults = (NSArray *)v9;

  if (!-[NSArray count](v8->_paragraphResults, "count"))
  {
    v32 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[_LTCombinedTranslationResult initWithParagraphResults:localePair:].cold.1(v32);
    goto LABEL_19;
  }
  v39 = v7;
  objc_msgSend(v7, "targetLocale");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](v8->_paragraphResults, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "route");

  -[NSArray firstObject](v8->_paragraphResults, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isFinal");

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = v8->_paragraphResults;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    v38 = v6;
LABEL_5:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v19);
      objc_msgSend(v20, "locale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", v40);

      if ((v22 & 1) == 0)
      {
        v34 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[_LTCombinedTranslationResult initWithParagraphResults:localePair:].cold.4(v34, v20);
        goto LABEL_26;
      }
      if (objc_msgSend(v20, "route") != v12)
        break;
      if (v14 != objc_msgSend(v20, "isFinal"))
      {
        v36 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[_LTCombinedTranslationResult initWithParagraphResults:localePair:].cold.2(v14, v36, v20);
LABEL_26:
        v33 = 0;
        v6 = v38;
        v7 = v39;
        goto LABEL_30;
      }
      if (v17 == ++v19)
      {
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        v6 = v38;
        if (v17)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    v35 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[_LTCombinedTranslationResult initWithParagraphResults:localePair:].cold.3(v35, v20);
    goto LABEL_26;
  }
LABEL_13:

  v7 = v39;
  v23 = objc_msgSend(v39, "copy");
  localePair = v8->_localePair;
  v8->_localePair = (_LTLocalePair *)v23;

  v8->_route = v12;
  v8->_isFinal = v14;
  -[NSArray _ltCompactMap:](v8->_paragraphResults, "_ltCompactMap:", &__block_literal_global);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  +[_LTDisambiguableResult combineResults:joinedWithString:](_LTDisambiguableResult, "combineResults:joinedWithString:", v15, CFSTR("\n\n"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hasDisambiguations");
  v27 = _LTOSLogDisambiguation();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v26)
  {
    if (v28)
    {
      v29 = v8->_paragraphResults;
      v30 = v27;
      v31 = -[NSArray count](v29, "count");
      *(_DWORD *)buf = 134217984;
      v47 = v31;
      _os_log_impl(&dword_235438000, v30, OS_LOG_TYPE_INFO, "Creating combined disambiguable result from %zu paragraphs since there are disambiguations somewhere", buf, 0xCu);

    }
    objc_storeStrong((id *)&v8->_disambiguableResult, v25);
  }
  else if (v28)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235438000, v27, OS_LOG_TYPE_INFO, "Not creating combined disambiguable result for combined translation result since nothing in the result has disambiguations", buf, 2u);
  }
  v33 = v8;

LABEL_30:
LABEL_31:

  return v33;
}

- (NSAttributedString)translatedText
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *paragraphResults;
  void *v12;
  void *v13;
  _QWORD v14[5];

  -[_LTCombinedTranslationResult disambiguableResult](self, "disambiguableResult");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = +[_LTDisambiguableResult isGenderDisambiguationEnabled](_LTDisambiguableResult, "isGenderDisambiguationEnabled"), v4, v5))
  {
    v6 = objc_alloc(MEMORY[0x24BDD1458]);
    -[_LTCombinedTranslationResult disambiguableResult](self, "disambiguableResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithString:", v8);

    return (NSAttributedString *)v9;
  }
  else
  {
    paragraphResults = self->_paragraphResults;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __46___LTCombinedTranslationResult_translatedText__block_invoke;
    v14[3] = &unk_250693278;
    v14[4] = self;
    -[NSArray _ltCompactMap:](paragraphResults, "_ltCompactMap:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "lt_attributedStringByJoiningComponents:withString:", v12, CFSTR("\n\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSAttributedString *)v13;
  }
}

- (NSString)romanization
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  void *v7;

  -[_LTCombinedTranslationResult disambiguableResult](self, "disambiguableResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_LTCombinedTranslationResult disambiguableResult](self, "disambiguableResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "romanization");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray _ltCompactMap:](self->_paragraphResults, "_ltCompactMap:", &__block_literal_global_5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSArray count](self->_paragraphResults, "count");
    if (v6 != objc_msgSend(v4, "count"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n\n"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
LABEL_7:

  return (NSString *)v7;
}

+ (id)_translatedTextWithAttributesForResult:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "alignments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(v3, "translations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v9 = v5 == 1 && v7 == 1;
  if (!v5 || v9)
  {
    v21 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[_LTCombinedTranslationResult _translatedTextWithAttributesForResult:].cold.1(v21);
    objc_msgSend(v3, "translations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sanitizedFormattedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v11, "formattedString");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      v28 = &stru_250695360;
      if (v26)
        v28 = (__CFString *)v26;
      v25 = v28;

    }
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v25);

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDD1688]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v3, "alignments", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v17 = objc_alloc(MEMORY[0x24BDD1458]);
          objc_msgSend(v16, "text");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sourceAttributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v19);

          objc_msgSend(v10, "appendAttributedString:", v20);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *paragraphResults;
  id v5;

  paragraphResults = self->_paragraphResults;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", paragraphResults, CFSTR("paragraphResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disambiguableResult, CFSTR("disambiguableResult"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localePair, CFSTR("localePair"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_route, CFSTR("route"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFinal, CFSTR("isFinal"));

}

- (_LTCombinedTranslationResult)initWithCoder:(id)a3
{
  id v4;
  _LTCombinedTranslationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *paragraphResults;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _LTDisambiguableResult *disambiguableResult;
  uint64_t v16;
  _LTLocalePair *localePair;
  _LTCombinedTranslationResult *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LTCombinedTranslationResult;
  v5 = -[_LTCombinedTranslationResult init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("paragraphResults"));
    v9 = objc_claimAutoreleasedReturnValue();
    paragraphResults = v5->_paragraphResults;
    v5->_paragraphResults = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("disambiguableResult"));
    v14 = objc_claimAutoreleasedReturnValue();
    disambiguableResult = v5->_disambiguableResult;
    v5->_disambiguableResult = (_LTDisambiguableResult *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localePair"));
    v16 = objc_claimAutoreleasedReturnValue();
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v16;

    v5->_route = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("route"));
    v5->_isFinal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinal"));
    v18 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSArray)paragraphResults
{
  return self->_paragraphResults;
}

- (int64_t)route
{
  return self->_route;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (_LTDisambiguableResult)disambiguableResult
{
  return self->_disambiguableResult;
}

- (void)setDisambiguableResult:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguableResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguableResult, 0);
  objc_storeStrong((id *)&self->_paragraphResults, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
}

- (void)initWithParagraphResults:(os_log_t)log localePair:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235438000, log, OS_LOG_TYPE_ERROR, "Not creating _LTCombinedTranslationResult instance because there are no paragraph results", v1, 2u);
}

- (void)initWithParagraphResults:(void *)a3 localePair:.cold.2(char a1, void *a2, void *a3)
{
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a1 & 1;
  v5 = a2;
  v6[0] = 67109376;
  v6[1] = objc_msgSend(a3, "isFinal");
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_235438000, v5, OS_LOG_TYPE_ERROR, "Not creating _LTCombinedTranslationResult instance because a translation result has isFinal %{BOOL}i, which is mismatched from other results with isFinal %{BOOL}i", (uint8_t *)v6, 0xEu);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithParagraphResults:(void *)a1 localePair:(void *)a2 .cold.3(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  objc_msgSend(a2, "route");
  OUTLINED_FUNCTION_1_0(&dword_235438000, v4, v5, "Not creating _LTCombinedTranslationResult instance because a translation result has route %zd, which is mismatched from other results with route %zd", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithParagraphResults:(void *)a1 localePair:(void *)a2 .cold.4(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_235438000, v5, v6, "Not creating _LTCombinedTranslationResult instance because a translation result is locale %{public}@ instead of expected locale %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0_0();
}

+ (void)_translatedTextWithAttributesForResult:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_235438000, log, OS_LOG_TYPE_DEBUG, "Skipping alignment information in translation result since there's nothing to re-align", v1, 2u);
}

@end
