@implementation CDMProtoSpanMatcherHelper

+ (id)ascendingStartIndexComparator
{
  return &__block_literal_global_9241;
}

+ (id)descendingLengthComparator
{
  return &__block_literal_global_200;
}

+ (id)voiceCommandSpanComparator
{
  return &__block_literal_global_201;
}

+ (void)enumerateTokenChain:(id)a3 useNormalizedValues:(BOOL)a4 withCallback:(id)a5
{
  id v6;
  void *v7;
  __int128 v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  unint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  __int128 v41;
  id v42;
  void (**v43)(id, void *, uint64_t, uint64_t, unint64_t, uint64_t, char *);
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v43 = (void (**)(id, void *, uint64_t, uint64_t, unint64_t, uint64_t, char *))a5;
  objc_msgSend(v6, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    *(_QWORD *)&v8 = 136316162;
    v41 = v8;
    v42 = v6;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v41);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isSignificant");

      if (v11)
      {
        v50 = 0;
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count") > v9 && !v50)
        {
          v13 = v9;
          while (1)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isSignificant");

            if ((v15 & 1) == 0)
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
              v26 = objc_claimAutoreleasedReturnValue();
              -[NSObject value](v26, "value");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "appendString:", v27);
              goto LABEL_14;
            }
            objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "begin");
            objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "end");
            objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v19 - objc_msgSend(v20, "begin");

            v45 = (int)v13 - (int)v9 + 1;
            if (a4)
              break;
            objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "getHasCleanValues");

            if (!v23)
              break;
            objc_msgSend(v6, "normalizedString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "length");

            if (v21 + v17 > v25)
            {
              CDMOSLoggerForCategory(0);
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v6, "normalizedString");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "normalizedString");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "length");
                *(_DWORD *)buf = v41;
                v53 = "+[CDMProtoSpanMatcherHelper enumerateTokenChain:useNormalizedValues:withCallback:]";
                v54 = 2048;
                v55 = v17;
                v56 = 2048;
                v57 = v21;
                v58 = 2112;
                v59 = v27;
                v60 = 2048;
                v61 = v29;
                _os_log_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping this callback as charRange.location=%lu + charRange.length=%lu would be out-of-bound for text=[%@] with length=%lu", buf, 0x34u);

                goto LABEL_14;
              }
              goto LABEL_15;
            }
            objc_msgSend(v6, "normalizedString");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "substringWithRange:", v17, v21);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v43[2](v43, v40, v17, v21, v9, v45, &v50);
LABEL_28:
            if (objc_msgSend(v7, "count") <= ++v13 || v50)
              goto LABEL_30;
          }
          objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "normalizedValues");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

          if (v32)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "normalizedValues");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v47 != v37)
                    objc_enumerationMutation(v34);
                  objc_msgSend(v12, "appendString:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
              }
              while (v36);
            }

            v43[2](v43, v12, v17, v21, v9, v45, &v50);
            v6 = v42;
            goto LABEL_28;
          }
          CDMOSLoggerForCategory(0);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v53 = "+[CDMProtoSpanMatcherHelper enumerateTokenChain:useNormalizedValues:withCallback:]";
            v54 = 2112;
            v55 = (uint64_t)v27;
            _os_log_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_INFO, "%s [WARN]: A significant token: (%@) does not have normalized values. This won't break but should not happen", buf, 0x16u);
LABEL_14:

          }
LABEL_15:

          goto LABEL_28;
        }
LABEL_30:

      }
      ++v9;
    }
    while (objc_msgSend(v7, "count") > v9);
  }

}

+ (id)buildMatchingSpanProtoWithLabel:(id)a3 inputStringForDebug:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 startCharIndex:(unsigned int)a7 endCharIndex:(unsigned int)a8 spanMatcherName:(int)a9
{
  void *v9;
  id v10;

  objc_msgSend(a1, "buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:spanMatcherName:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a9, *(_QWORD *)&a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BE9E180]);
  objc_msgSend(v9, "setUsoGraph:", v10);

  return v9;
}

+ (id)buildMatchingSpanProtoWithLabel:(id)a3 inputStringForDebug:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 spanMatcherName:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v11;
  id v12;
  id v13;
  id v14;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v11 = (objc_class *)MEMORY[0x24BE9E230];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(v14, "setLabel:", v13);

  objc_msgSend(v14, "setInput:", v12);
  objc_msgSend(v14, "setStartTokenIndex:", v9);
  objc_msgSend(v14, "setEndTokenIndex:", v8);
  objc_msgSend(v14, "addMatcherNames:", v7);
  return v14;
}

+ (id)buildUsoIdentifier:(id)a3 semantic:(id)a4 nodeIndex:(int)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  if (a5)
  {
    v5 = *(_QWORD *)&a5;
    v7 = (objc_class *)MEMORY[0x24BE9E170];
    v8 = a4;
    v9 = a3;
    v10 = objc_alloc_init(v7);
    objc_msgSend(v10, "setValue:", v8);

    v11 = objc_alloc_init(MEMORY[0x24BE9E060]);
    objc_msgSend(v11, "setValue:", v9);

    objc_msgSend(v10, "setNamespaceA:", v11);
    objc_msgSend(v10, "setSourceComponent:", 2);
    objc_msgSend(v10, "setBackingAppBundleId:", *MEMORY[0x24BEA3880]);
    objc_msgSend(v10, "setNodeIndex:", v5);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)buildUsoEntitySpan:(id)a3 semantic:(id)a4 nodeIndex:(int)a5 startIndex:(unsigned int)a6 endIndex:(unsigned int)a7 tokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  if (a5)
  {
    v8 = *(_QWORD *)&a8;
    v9 = *(_QWORD *)&a7;
    v10 = *(_QWORD *)&a6;
    v11 = *(_QWORD *)&a5;
    v13 = (objc_class *)MEMORY[0x24BE9E178];
    v14 = a4;
    v15 = a3;
    v16 = objc_alloc_init(v13);
    objc_msgSend(v16, "setNodeIndex:", v11);
    v17 = objc_alloc_init(MEMORY[0x24BE9E130]);
    objc_msgSend(v17, "setKey:", v15);

    v18 = objc_alloc_init(MEMORY[0x24BE9E060]);
    objc_msgSend(v18, "setValue:", v14);

    objc_msgSend(v17, "setValueString:", v18);
    objc_msgSend(v16, "addProperties:", v17);
    objc_msgSend(v16, "setSourceComponent:", 2);
    v19 = objc_alloc_init(MEMORY[0x24BE9E060]);
    objc_msgSend(v19, "setValue:", *MEMORY[0x24BEA3880]);
    objc_msgSend(v16, "setOriginAppId:", v19);
    v20 = objc_alloc_init(MEMORY[0x24BE9E068]);
    objc_msgSend(v20, "setValue:", v10);
    objc_msgSend(v16, "setStartIndex:", v20);
    v21 = objc_alloc_init(MEMORY[0x24BE9E068]);
    objc_msgSend(v21, "setValue:", v9);
    objc_msgSend(v16, "setEndIndex:", v21);
    v22 = objc_alloc_init(MEMORY[0x24BE9E0B8]);
    v23 = objc_alloc_init(MEMORY[0x24BE9E068]);
    objc_msgSend(v23, "setValue:", v8);
    objc_msgSend(v22, "setMatchedTokenCount:", v23);
    objc_msgSend(v16, "setMatchInfo:", v22);

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)buildUtteranceAlignments:(unsigned int)a3 endCharIndex:(unsigned int)a4 nodeIndex:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;

  if (a5)
  {
    v5 = *(_QWORD *)&a5;
    v6 = *(_QWORD *)&a4;
    v7 = *(_QWORD *)&a3;
    v8 = objc_alloc_init(MEMORY[0x24BE9E190]);
    v9 = objc_alloc_init(MEMORY[0x24BE9E198]);
    objc_msgSend(v9, "setStartIndex:", v7);
    objc_msgSend(v9, "setEndIndex:", v6);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v9, 0);
    objc_msgSend(v8, "setSpans:", v10);

    objc_msgSend(v8, "setNodeIndex:", v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)isTrailingSpanAdjacent:(id)a3 secondSpan:(id)a4 tokenChain:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  char v11;
  unsigned int v12;
  int v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "endTokenIndex");
  if (v10 == objc_msgSend(v8, "startTokenIndex"))
    goto LABEL_2;
  v12 = objc_msgSend(v7, "endTokenIndex");
  if (v12 > objc_msgSend(v8, "startTokenIndex")
    || (v13 = objc_msgSend(v7, "endTokenIndex"),
        objc_msgSend(v9, "tokens"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "count"),
        v14,
        v15 == v13))
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v16 = objc_msgSend(v7, "endTokenIndex");
  objc_msgSend(v9, "tokens");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") < (unint64_t)v16)
  {

    goto LABEL_13;
  }
  v18 = objc_msgSend(v8, "startTokenIndex");
  objc_msgSend(v9, "tokens");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 <= v18)
    goto LABEL_13;
  LODWORD(v21) = objc_msgSend(v7, "endTokenIndex");
  if (v21 >= objc_msgSend(v8, "startTokenIndex"))
  {
LABEL_2:
    v11 = 1;
    goto LABEL_14;
  }
  v21 = (int)v21;
  do
  {
    objc_msgSend(v9, "tokens");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isSignificant");

    if (v24)
      break;
    ++v21;
  }
  while (objc_msgSend(v8, "startTokenIndex") > v21);
  v11 = v24 ^ 1;
LABEL_14:

  return v11;
}

uint64_t __55__CDMProtoSpanMatcherHelper_voiceCommandSpanComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  LODWORD(v5) = objc_msgSend(v6, "endTokenIndex");
  v8 = (_DWORD)v5 - objc_msgSend(v6, "startTokenIndex");
  LODWORD(v5) = objc_msgSend(v7, "endTokenIndex");
  v9 = (_DWORD)v5 - objc_msgSend(v7, "startTokenIndex");
  if (v8 > v9)
    goto LABEL_2;
  if (v8 < v9)
  {
LABEL_4:
    v10 = 1;
    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "matcherNames") || !objc_msgSend(v7, "matcherNames"))
  {
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  if (*(_DWORD *)objc_msgSend(v6, "matcherNames") != 2 || *(_DWORD *)objc_msgSend(v7, "matcherNames") == 2)
  {
    if (*(_DWORD *)objc_msgSend(v6, "matcherNames") != 2 && *(_DWORD *)objc_msgSend(v7, "matcherNames") == 2)
      goto LABEL_4;
    goto LABEL_11;
  }
LABEL_2:
  v10 = -1;
LABEL_12:

  return v10;
}

uint64_t __55__CDMProtoSpanMatcherHelper_descendingLengthComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "startTokenIndex");
  v7 = objc_msgSend(v5, "endTokenIndex");

  v8 = objc_msgSend(v4, "startTokenIndex");
  v9 = objc_msgSend(v4, "endTokenIndex");

  if (v7 - v6 > v9 - v8)
    return -1;
  else
    return v7 - v6 < v9 - v8;
}

uint64_t __58__CDMProtoSpanMatcherHelper_ascendingStartIndexComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "startTokenIndex");
  v6 = objc_msgSend(v4, "startTokenIndex");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

@end
