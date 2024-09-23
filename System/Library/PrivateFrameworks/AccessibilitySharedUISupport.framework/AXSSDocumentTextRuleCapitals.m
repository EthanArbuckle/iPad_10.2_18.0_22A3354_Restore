@implementation AXSSDocumentTextRuleCapitals

- (AXSSDocumentTextRuleCapitals)init
{
  AXSSDocumentTextRuleCapitals *v2;
  AXSSDocumentTextRuleCapitals *v3;
  UITextChecker *v4;
  UITextChecker *textChecker;
  void *v6;
  uint64_t v7;
  NSString *textCheckerLanguage;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSSDocumentTextRuleCapitals;
  v2 = -[AXSSDocumentTextRuleCapitals init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXSSDocumentTextRule setGranularity:](v2, "setGranularity:", 1);
    v4 = (UITextChecker *)objc_alloc_init(MEMORY[0x24BEBDA38]);
    textChecker = v3->_textChecker;
    v3->_textChecker = v4;

    objc_msgSend(MEMORY[0x24BEBDA38], "availableLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    textCheckerLanguage = v3->_textCheckerLanguage;
    v3->_textCheckerLanguage = (NSString *)v7;

    if (!v3->_textCheckerLanguage)
    {
      v3->_textCheckerLanguage = (NSString *)CFSTR("en_US");

    }
  }
  return v3;
}

- (BOOL)checkSpelledCorrectly:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = 0;
  if (-[AXSSDocumentTextRuleCapitals checkSpellingOfString:includeAutocorrect:](self, "checkSpellingOfString:includeAutocorrect:", v4, 0) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v4, "length") == 3)
    {
      if (-[AXSSDocumentTextRuleCapitals checkSpellingOfString:includeAutocorrect:](self, "checkSpellingOfString:includeAutocorrect:", v4, 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@."), v4, v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[AXSSDocumentTextRuleCapitals checkSpellingOfString:includeAutocorrect:](self, "checkSpellingOfString:includeAutocorrect:", v6, 1))
        {
          v8 = 0;
        }
        else
        {
          v8 = v7 == 3;
        }
        v5 = !v8;

      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (_NSRange)checkSpellingOfString:(id)a3 includeAutocorrect:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v5 = a3;
  -[AXSSDocumentTextRuleCapitals textChecker](self, "textChecker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  -[AXSSDocumentTextRuleCapitals textCheckerLanguage](self, "textCheckerLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v5, 0, v7, 0, 0, v8);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  AXSSDocumentTextRuleCapitals *v34;
  uint64_t *v35;
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  id v43;
  void *v44;
  _QWORD v45[3];

  length = a4.length;
  location = a4.location;
  v45[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v31 = a5;
  v13 = a7;
  if (!objc_msgSend(v12, "length"))
  {
    v25 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_14;
  }
  objc_msgSend(v12, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");
  v16 = v15 == 3;
  if (v15 == 3)
    v17 = CFSTR("[A-Z]{2}[a-z]");
  else
    v17 = CFSTR("[A-Z]{2,}[a-z]{2,}");
  v43 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v17, 0, &v43);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    -[AXSSDocumentTextRuleCapitals issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:].cold.1();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = 0;
  v19 = objc_msgSend(v14, "length");
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __113__AXSSDocumentTextRuleCapitals_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
  v32[3] = &unk_24E077388;
  v35 = &v37;
  v20 = v14;
  v33 = v20;
  v34 = self;
  v36 = v16;
  objc_msgSend(v18, "enumerateMatchesInString:options:range:usingBlock:", v20, 0, 0, v19, v32);
  v21 = objc_msgSend((id)v38[5], "length");
  if (v21 < objc_msgSend(v20, "length"))
  {
    v22 = (void *)v38[5];
    objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v22, "length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appendString:", v23);

  }
  if (objc_msgSend((id)v38[5], "length") && (objc_msgSend((id)v38[5], "isEqual:", v20) & 1) == 0)
  {
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setOffendingText:", v12);
    objc_msgSend(v24, "setRange:", location, length);
    v27 = objc_alloc(MEMORY[0x24BDD1458]);
    v28 = (void *)objc_msgSend(v27, "initWithString:", v38[5]);
    v45[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSuggestions:", v29);

    objc_msgSend(v24, "setKind:", 1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The term \"%@\" appears to have capitalization issues"), v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNote:", v30);

    if (v24)
    {
      v44 = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)MEMORY[0x24BDBD1A8];
LABEL_12:

  _Block_object_dispose(&v37, 8);
LABEL_14:

  return v25;
}

void __113__AXSSDocumentTextRuleCapitals_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a2;
  v17 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v17;
  }
  v7 = objc_msgSend(v3, "range");
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
  {
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length");
    v11 = v7 - objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length");
    if (v11 + v10 < objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendString:", v12);

    }
  }
  objc_msgSend(v9, "capitalizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "checkSpelledCorrectly:", v13) & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
LABEL_15:
      v16 = v13;
      goto LABEL_16;
    }
    v14 = objc_msgSend(*(id *)(a1 + 40), "checkSpelledCorrectly:", v9);
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v14)
      goto LABEL_15;
  }
  else
  {
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  v16 = v9;
LABEL_16:
  objc_msgSend(v15, "appendString:", v16);

}

- (unint64_t)hash
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSSDocumentTextRuleCapitals;
  return -[AXSSDocumentTextRule copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  AXSSDocumentTextRuleCapitals *v4;
  BOOL v5;
  objc_super v7;

  v4 = (AXSSDocumentTextRuleCapitals *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7.receiver = self;
      v7.super_class = (Class)AXSSDocumentTextRuleCapitals;
      v5 = -[AXSSDocumentTextRule isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (UITextChecker)textChecker
{
  return self->_textChecker;
}

- (void)setTextChecker:(id)a3
{
  objc_storeStrong((id *)&self->_textChecker, a3);
}

- (NSString)textCheckerLanguage
{
  return self->_textCheckerLanguage;
}

- (void)setTextCheckerLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCheckerLanguage, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
}

- (void)issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:.cold.1()
{
  __assert_rtn("-[AXSSDocumentTextRuleCapitals issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:]", "AXSSDocumentTextRuleCapitals.m", 147, "error == nil");
}

@end
