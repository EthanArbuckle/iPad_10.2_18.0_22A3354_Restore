@implementation AXSSDocumentTextRuleBullets

- (AXSSDocumentTextRuleBullets)init
{
  AXSSDocumentTextRuleBullets *v2;
  AXSSDocumentTextRuleBullets *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSSDocumentTextRuleBullets;
  v2 = -[AXSSDocumentTextRuleBullets init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXSSDocumentTextRule setGranularity:](v2, "setGranularity:", 1);
  return v3;
}

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  id v13;
  void *v14;
  id v15;
  NSUInteger v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  NSUInteger v32;
  NSUInteger v33;

  length = a6.length;
  location = a6.location;
  v11 = a4.length;
  v12 = a4.location;
  v13 = a7;
  v14 = v13;
  v15 = 0;
  if (a5 && location != 0x7FFFFFFFFFFFFFFFLL && length != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v12 + v11 - location;
    objc_msgSend(v13, "attributedSubstringFromRange:", location, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("[:AX_nl:]([:AX_ws:]*[:AX_bullet:][:AX_ws:]*[:AX_nl:])+"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXSSDocumentTextRule replaceCustomRegexNotation:](AXSSDocumentTextRule, "replaceCustomRegexNotation:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v21, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v18, "length");
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __112__AXSSDocumentTextRuleBullets_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
    v28[3] = &unk_24E077258;
    v32 = location;
    v33 = v16;
    v29 = v14;
    v30 = v18;
    v24 = v19;
    v31 = v24;
    v25 = v18;
    objc_msgSend(v22, "enumerateMatchesInString:options:range:usingBlock:", v25, 0, 0, v23, v28);
    v26 = v31;
    v15 = v24;

  }
  return v15;
}

void __112__AXSSDocumentTextRuleBullets_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a2, "range");
  if (v4 >= 2)
  {
    v5 = *(_QWORD *)(a1 + 56) + v3;
    if (v5)
    {
      v6 = v4;
      if (v5 + v4 <= objc_msgSend(*(id *)(a1 + 32), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", v5, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_opt_new();
        objc_msgSend(v8, "setOffendingText:", v7);
        objc_msgSend(v8, "setRange:", v5, v6);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The term \"%@\" appears to have spacing issues"), *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setNote:", v9);

        objc_msgSend(v8, "setKind:", 3);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
        v12[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSuggestions:", v11);

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
      }
    }
  }
}

- (unint64_t)hash
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSSDocumentTextRuleBullets;
  return -[AXSSDocumentTextRule copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  AXSSDocumentTextRuleBullets *v4;
  BOOL v5;
  objc_super v7;

  v4 = (AXSSDocumentTextRuleBullets *)a3;
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
      v7.super_class = (Class)AXSSDocumentTextRuleBullets;
      v5 = -[AXSSDocumentTextRule isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
