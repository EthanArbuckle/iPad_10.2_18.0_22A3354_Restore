@implementation AXSSDocumentTextRuleWhitespace

- (AXSSDocumentTextRuleWhitespace)init
{
  AXSSDocumentTextRuleWhitespace *v2;
  AXSSDocumentTextRuleWhitespace *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSSDocumentTextRuleWhitespace;
  v2 = -[AXSSDocumentTextRuleWhitespace init](&v5, sel_init);
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
  id v14;
  uint64_t v15;
  id v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  void *v32;
  NSUInteger v33;
  NSUInteger v34;

  length = a6.length;
  location = a6.location;
  v11 = a4.length;
  v12 = a4.location;
  v14 = a7;
  v15 = objc_msgSend(a3, "length");
  v16 = (id)MEMORY[0x24BDBD1A8];
  if (a5 && v15 && location != 0x7FFFFFFFFFFFFFFFLL && length != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v12 + v11 - location;
    objc_msgSend(v14, "attributedSubstringFromRange:", location, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)|(%@)|(%@)"), CFSTR("[:AX_ws:]*[:AX_nl:]([:AX_ws:]*[:AX_nl:][:AX_ws:]*)+[:AX_nl:]"), CFSTR("[:AX_ws:]{2,}[:AX_nl:]?"), CFSTR("[:AX_ws:]+[:AX_nl:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXSSDocumentTextRule replaceCustomRegexNotation:](AXSSDocumentTextRule, "replaceCustomRegexNotation:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v22, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v19, "length");
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __115__AXSSDocumentTextRuleWhitespace_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
    v29[3] = &unk_24E077258;
    v33 = location;
    v34 = v17;
    v30 = v14;
    v25 = v20;
    v31 = v25;
    v32 = v19;
    v26 = v19;
    objc_msgSend(v23, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v24, v29);
    v27 = v32;
    v16 = v25;

  }
  return v16;
}

void __115__AXSSDocumentTextRuleWhitespace_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  void *v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;
  NSRange v35;
  NSRange v36;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a2, "range");
  if (v4 >= 2)
  {
    v5 = *(_QWORD *)(a1 + 56) + v3;
    if (v5)
    {
      v6 = v4;
      if (v5 + v4 <= objc_msgSend(*(id *)(a1 + 32), "length"))
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = *(id *)(a1 + 40);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
LABEL_6:
          v11 = 0;
          while (1)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v35.location = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v11), "range");
            v36.location = v5;
            v36.length = v6;
            if (NSIntersectionRange(v35, v36).location != 0x7FFFFFFFFFFFFFFFLL)
              break;
            if (v9 == ++v11)
            {
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
              if (v9)
                goto LABEL_6;
              goto LABEL_12;
            }
          }
        }
        else
        {
LABEL_12:

          objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", v5, v6);
          v7 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "string");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:", v13, 0);
          v15 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:", v13, 4);
          v16 = (void *)objc_opt_new();
          objc_msgSend(v16, "setOffendingText:", v7);
          objc_msgSend(v16, "setRange:", v5, v6);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The term \"%@\" appears to have spacing issues"), *(_QWORD *)(a1 + 48));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setNote:", v17);

          objc_msgSend(v16, "setKind:", 2);
          if (v14 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL || v14 == v15)
          {
            if (v15 == v6 - 1)
            {
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
              v31 = v20;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setSuggestions:", v21);

            }
            else
            {
              objc_msgSend(v7, "string");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "substringWithRange:", 0, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v23);
              v30 = v24;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setSuggestions:", v25);

              objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
            }
          }
          else
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n\n"));
            v32 = v18;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setSuggestions:", v19);

            objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
          }

        }
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
  v4.super_class = (Class)AXSSDocumentTextRuleWhitespace;
  return -[AXSSDocumentTextRule copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  AXSSDocumentTextRuleWhitespace *v4;
  BOOL v5;
  objc_super v7;

  v4 = (AXSSDocumentTextRuleWhitespace *)a3;
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
      v7.super_class = (Class)AXSSDocumentTextRuleWhitespace;
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
