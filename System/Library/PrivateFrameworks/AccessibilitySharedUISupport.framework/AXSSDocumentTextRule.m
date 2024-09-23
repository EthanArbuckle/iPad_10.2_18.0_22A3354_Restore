@implementation AXSSDocumentTextRule

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a5;
  v11 = a7;
  __assert_rtn("-[AXSSDocumentTextRule issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:]", "AXSSDocumentTextRule.m", 20, "false");
}

- (id)issuesInText:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[AXSSDocumentTextRule issuesInText:]", "AXSSDocumentTextRule.m", 26, "false");
}

+ (id)replaceCustomRegexNotation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("[:AX_ws:]"), CFSTR("[  \\t]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("[:AX_bullet:]"), CFSTR("[•▪◦◉◉◆◇◈◊○◎◘⦾⦿◦‣‧∙∘]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("[:AX_nl:]"), CFSTR("[\\n\u2028]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)matchReplacementArrayCapitalization:(id)a3 withSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "matchReplacementCapitalization:withSource:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)matchReplacementCapitalization:(id)a3 withSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "rangeOfCharacterFromSet:", v7))
    {
      v10 = (void *)objc_msgSend(v5, "mutableCopy");
      v11 = objc_msgSend(v5, "length");
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __66__AXSSDocumentTextRule_matchReplacementCapitalization_withSource___block_invoke;
      v13[3] = &unk_24E077140;
      v14 = v10;
      v12 = v10;
      objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, v13);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v5);

      goto LABEL_6;
    }

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v5);
LABEL_6:

  return v8;
}

void __66__AXSSDocumentTextRule_matchReplacementCapitalization_withSource___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v13, "capitalizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v12);

  *a7 = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setGranularity:", -[AXSSDocumentTextRule granularity](self, "granularity"));
  objc_msgSend(v4, "setSeverity:", -[AXSSDocumentTextRule severity](self, "severity"));
  return v4;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[AXSSDocumentTextRule granularity](self, "granularity");
  return -[AXSSDocumentTextRule severity](self, "severity") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AXSSDocumentTextRule *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v4 = (AXSSDocumentTextRule *)a3;
  v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v5 = -[AXSSDocumentTextRule granularity](v4, "granularity"),
          v5 != -[AXSSDocumentTextRule granularity](self, "granularity"))
      || (v6 = -[AXSSDocumentTextRule severity](v4, "severity"), v6 != -[AXSSDocumentTextRule severity](self, "severity")))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(int64_t)a3
{
  self->_granularity = a3;
}

- (int64_t)severity
{
  return self->_severity;
}

- (void)setSeverity:(int64_t)a3
{
  self->_severity = a3;
}

@end
