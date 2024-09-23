@implementation AXSSDocumentTextRuleBasic

- (void)setAvoidWords:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  NSArray *avoidWords;
  AXSSDocumentTextRuleBasic *v17;
  id obj;
  _QWORD v19[5];
  uint64_t v20;
  int *v21;
  uint64_t v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_new();
  v17 = self;
  -[AXSSDocumentTextRuleBasic avoidPhrases](self, "avoidPhrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AXSSDocumentTextRuleBasic avoidPhrases](self, "avoidPhrases");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v8 = (void *)objc_opt_new();
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0;
        v21 = (int *)&v20;
        v22 = 0x2020000000;
        v23 = 0;
        v14 = objc_msgSend(v13, "length");
        v19[0] = v11;
        v19[1] = 3221225472;
        v19[2] = __43__AXSSDocumentTextRuleBasic_setAvoidWords___block_invoke;
        v19[3] = &unk_24E0773D8;
        v19[4] = &v20;
        objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v14, 3, v19);
        if (v21[6] >= 2)
          v15 = v8;
        else
          v15 = (void *)v5;
        objc_msgSend(v15, "addObject:", v13);
        _Block_object_dispose(&v20, 8);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  avoidWords = v17->_avoidWords;
  v17->_avoidWords = (NSArray *)v5;

  -[AXSSDocumentTextRuleBasic setAvoidPhrases:](v17, "setAvoidPhrases:", v8);
}

uint64_t __43__AXSSDocumentTextRuleBasic_setAvoidWords___block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  void *v47;
  _BOOL8 v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[7];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  _BOOL8 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  length = a4.length;
  location = a4.location;
  v67 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v46 = a5;
  v12 = a7;
  v47 = v11;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v11, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[AXSSDocumentTextRuleBasic caseSensitive](self, "caseSensitive");
    -[AXSSDocumentTextRuleBasic avoidWords](self, "avoidWords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
    v62[3] = &unk_24E077400;
    v45 = v13;
    v63 = v45;
    v64 = !v14;
    v49 = v64;
    v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v62);

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = 0;
    }
    else
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setOffendingText:", v47);
      objc_msgSend(v17, "setRange:", location, length);
      v19 = (void *)objc_opt_class();
      -[AXSSDocumentTextRuleBasic suggestedWords](self, "suggestedWords");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "matchReplacementArrayCapitalization:withSource:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSuggestions:", v22);

      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v47, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("The term '%@' may not be the best choice. Consider one of the following terms."), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNote:", v25);

      objc_msgSend(v17, "setKind:", 4);
    }
    -[AXSSDocumentTextRuleBasic avoidPhrases](self, "avoidPhrases");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[AXSSDocumentTextRuleBasic avoidPhrases](self, "avoidPhrases");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v52)
      {
        v51 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v59 != v51)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            v30 = objc_msgSend(v29, "length");
            if (v30 + location < objc_msgSend(v12, "length"))
            {
              objc_msgSend(v12, "string");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "substringWithRange:", location, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (!objc_msgSend(v29, "compare:options:", v32, 1))
              {
                v54 = 0;
                v55 = &v54;
                v56 = 0x2020000000;
                v57 = 0;
                objc_msgSend(v12, "string");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v12, "length");
                v53[0] = MEMORY[0x24BDAC760];
                v53[1] = 3221225472;
                v53[2] = __110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke_2;
                v53[3] = &unk_24E077428;
                v53[5] = location;
                v53[6] = v30;
                v53[4] = &v54;
                objc_msgSend(v33, "enumerateSubstringsInRange:options:usingBlock:", location, v34 - location, 3, v53);

                if (*((_BYTE *)v55 + 24))
                {
                  objc_msgSend(v12, "string");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "substringWithRange:", location, v30);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v29, "compare:options:", v36, v49))
                  {
                    v37 = v17;
                  }
                  else
                  {
                    v37 = (void *)objc_opt_new();

                    objc_msgSend(v12, "attributedSubstringFromRange:", location, v30);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "setOffendingText:", v38);

                    objc_msgSend(v37, "setRange:", location, v30);
                    v39 = (void *)objc_opt_class();
                    -[AXSSDocumentTextRuleBasic suggestedWords](self, "suggestedWords");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "string");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "matchReplacementArrayCapitalization:withSource:", v40, v41);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "setSuggestions:", v42);

                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The term '%@' may not be the best choice. Consider one of the following terms."), v29);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "setNote:", v43);

                    objc_msgSend(v37, "setKind:", 4);
                  }

                  v17 = v37;
                }
                _Block_object_dispose(&v54, 8);
              }

            }
          }
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        }
        while (v52);
      }

    }
    objc_msgSend(v17, "setSeverity:", -[AXSSDocumentTextRule severity](self, "severity"));
    if (v17)
    {
      v65 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

BOOL __110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) == 0;
}

_QWORD *__110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t v7;

  v7 = result[6] + result[5];
  if (a3 + a4 == v7)
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
    *a7 = 1;
    v7 = result[6] + result[5];
  }
  if (v7 < a3 + a4)
    *a7 = 1;
  return result;
}

- (AXSSDocumentTextRuleBasic)init
{
  AXSSDocumentTextRuleBasic *v2;
  AXSSDocumentTextRuleBasic *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSSDocumentTextRuleBasic;
  v2 = -[AXSSDocumentTextRuleBasic init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXSSDocumentTextRule setGranularity:](v2, "setGranularity:", 1);
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  -[AXSSDocumentTextRuleBasic avoidWords](self, "avoidWords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXSSDocumentTextRuleBasic avoidPhrases](self, "avoidPhrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[AXSSDocumentTextRuleBasic suggestedWords](self, "suggestedWords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[AXSSDocumentTextRuleBasic note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[AXSSDocumentTextRuleBasic caseSensitive](self, "caseSensitive");

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSSDocumentTextRuleBasic;
  v4 = -[AXSSDocumentTextRule copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[AXSSDocumentTextRuleBasic avoidWords](self, "avoidWords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvoidWords:", v5);

  -[AXSSDocumentTextRuleBasic avoidPhrases](self, "avoidPhrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvoidPhrases:", v6);

  -[AXSSDocumentTextRuleBasic suggestedWords](self, "suggestedWords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedWords:", v7);

  -[AXSSDocumentTextRuleBasic note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNote:", v8);

  objc_msgSend(v4, "setCaseSensitive:", -[AXSSDocumentTextRuleBasic caseSensitive](self, "caseSensitive"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AXSSDocumentTextRuleBasic *v5;
  AXSSDocumentTextRuleBasic *v6;
  _BOOL4 v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v5 = self;
  v6 = (AXSSDocumentTextRuleBasic *)v4;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v19.receiver = v5,
          v19.super_class = (Class)AXSSDocumentTextRuleBasic,
          -[AXSSDocumentTextRule isEqual:](&v19, sel_isEqual_, v6))
      && (v7 = -[AXSSDocumentTextRuleBasic caseSensitive](v5, "caseSensitive"),
          v7 == -[AXSSDocumentTextRuleBasic caseSensitive](v6, "caseSensitive")))
    {
      -[AXSSDocumentTextRuleBasic avoidWords](v5, "avoidWords");
      v10 = objc_claimAutoreleasedReturnValue();
      -[AXSSDocumentTextRuleBasic avoidWords](v6, "avoidWords");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 | v11 && !objc_msgSend((id)v10, "isEqual:", v11))
      {
        v8 = 0;
      }
      else
      {
        -[AXSSDocumentTextRuleBasic avoidPhrases](v5, "avoidPhrases");
        v12 = objc_claimAutoreleasedReturnValue();
        -[AXSSDocumentTextRuleBasic avoidPhrases](v6, "avoidPhrases");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v12 | v13 && !objc_msgSend((id)v12, "isEqual:", v13))
        {
          v8 = 0;
        }
        else
        {
          -[AXSSDocumentTextRuleBasic suggestedWords](v5, "suggestedWords");
          v14 = objc_claimAutoreleasedReturnValue();
          -[AXSSDocumentTextRuleBasic suggestedWords](v6, "suggestedWords");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v14 | v15 && !objc_msgSend((id)v14, "isEqual:", v15))
          {
            v8 = 0;
          }
          else
          {
            v18 = v12;
            -[AXSSDocumentTextRuleBasic note](v5, "note");
            v16 = objc_claimAutoreleasedReturnValue();
            -[AXSSDocumentTextRuleBasic note](v6, "note");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v16 | v17)
              v8 = objc_msgSend((id)v16, "isEqual:", v17);
            else
              v8 = 1;

            v12 = v18;
          }

        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSArray)avoidWords
{
  return self->_avoidWords;
}

- (NSArray)avoidPhrases
{
  return self->_avoidPhrases;
}

- (void)setAvoidPhrases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)suggestedWords
{
  return self->_suggestedWords;
}

- (void)setSuggestedWords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)caseSensitive
{
  return self->_caseSensitive;
}

- (void)setCaseSensitive:(BOOL)a3
{
  self->_caseSensitive = a3;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_suggestedWords, 0);
  objc_storeStrong((id *)&self->_avoidPhrases, 0);
  objc_storeStrong((id *)&self->_avoidWords, 0);
}

@end
