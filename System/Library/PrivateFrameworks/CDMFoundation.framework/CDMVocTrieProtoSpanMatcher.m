@implementation CDMVocTrieProtoSpanMatcher

- (CDMVocTrieProtoSpanMatcher)initWithVocTriePath:(id)a3 useNormalizedValues:(BOOL)a4
{
  id v6;
  CDMVocTrieProtoSpanMatcher *v7;
  CDMVocTrie *v8;
  CDMVocTrie *trie;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMVocTrieProtoSpanMatcher;
  v7 = -[CDMVocTrieProtoSpanMatcher init](&v11, sel_init);
  if (v7)
  {
    v8 = -[CDMVocTrie initWithTriePath:]([CDMVocTrie alloc], "initWithTriePath:", v6);
    trie = v7->trie;
    v7->trie = v8;

    v7->useNormalizedValues = a4;
  }

  return v7;
}

- (BOOL)utteranceStartsWithVoiceTriggerSpan:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "startTokenIndex"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("voiceTrigger"));

  }
  return v4;
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  objc_class *v13;
  void *v14;
  CDMVocTrieProtoSpanMatcher *v15;
  _BOOL8 useNormalizedValues;
  id v17;
  os_signpost_id_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _QWORD v29[5];
  id v30;
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint8_t v38[4];
  const char *v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v10 = (id)CDMLogContext;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SpanMatcher", "%{public}@", (uint8_t *)&buf, 0xCu);

  }
  if (self->trie)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x2020000000;
    v42 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v15 = self;
    useNormalizedValues = self->useNormalizedValues;
    v29[1] = 3221225472;
    v29[2] = __68__CDMVocTrieProtoSpanMatcher_matchSpansForTokenChain_asrHypothesis___block_invoke;
    v29[3] = &unk_24DCAC8A8;
    v29[0] = MEMORY[0x24BDAC760];
    v29[4] = v15;
    v30 = v6;
    p_buf = &buf;
    v33 = &v34;
    v17 = v8;
    v31 = v17;
    +[CDMProtoSpanMatcherHelper enumerateTokenChain:useNormalizedValues:withCallback:](CDMProtoSpanMatcherHelper, "enumerateTokenChain:useNormalizedValues:withCallback:", v30, useNormalizedValues, v29);
    v18 = v9;
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24) && *((_DWORD *)v35 + 6))
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT(SELF.startTokenIndex >= %d AND SELF.endTokenIndex <= %d AND SELF.label !=%@)"), 0, *((unsigned int *)v35 + 6), CFSTR("voiceTrigger"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)CDMLogContext;
      v21 = v20;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v21, OS_SIGNPOST_INTERVAL_END, v18, "SpanMatcher", ", v38, 2u);
      }

      objc_msgSend(v17, "filteredArrayUsingPredicate:", v19);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = (id)CDMLogContext;
      v24 = v23;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v24, OS_SIGNPOST_INTERVAL_END, v9, "SpanMatcher", ", v38, 2u);
      }

      if ((unint64_t)objc_msgSend(v17, "count") < 0x65)
      {
        v22 = v17;
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v38 = 136315138;
          v39 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
          _os_log_debug_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_DEBUG, "%s VOC spans exceeding 100, sort based on identifer count to promote important spans", v38, 0xCu);
        }

        objc_msgSend((id)objc_opt_class(), "spanIdentifierCountComparator");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingComparator:", v26);
        v22 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
      _os_log_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_INFO, "%s VocTrie Invalid", (uint8_t *)&buf, 0xCu);
    }

    v22 = v8;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->trie, 0);
}

void __68__CDMVocTrieProtoSpanMatcher_matchSpansForTokenChain_asrHypothesis___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  unsigned int v54;
  id obj;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v61;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
    v71 = 2112;
    v72 = v9;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Voc matcher Matching search chunk: %@", buf, 0x16u);
  }

  v51 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "entriesForText:", v9);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v61)
  {
    v59 = a5 + a6;
    v58 = a5 + a6;
    v56 = a3 + a4;
    v57 = *(_QWORD *)v65;
    v52 = a5;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v65 != v57)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v11);
        v13 = MEMORY[0x220744410]();
        objc_msgSend(*(id *)(a1 + 40), "string");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringWithRange:", a3, a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:spanMatcherName:](CDMProtoSpanMatcherHelper, "buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:spanMatcherName:", v16, v15, a5, v59, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(a1 + 32), "utteranceStartsWithVoiceTriggerSpan:", v17))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v17, "endTokenIndex");
        }
        v18 = objc_msgSend(*(id *)(a1 + 40), "nonWhiteSpaceCountFromToken:toToken:", a5, v58);
        objc_msgSend(v12, "semantic");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSemanticValue:", v19);

        objc_msgSend(v12, "usoGraph");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = (void *)v13;
        if (v20)
        {
          CDMOSLoggerForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s Voc matcher got UsoGraph from asset", buf, 0xCu);
          }

          objc_msgSend(v12, "usoGraph");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setUsoGraph:", v22);

          objc_msgSend(v12, "usoGraph");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "nodesCount");

          if (v24 == 1)
          {
            CDMOSLoggerForCategory(0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              goto LABEL_33;
            *(_DWORD *)buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            v26 = v25;
            v27 = "%s [WARN]: VOC span UsoGraph only has 1 root node, not going to attach alignments or identifiers";
LABEL_32:
            _os_log_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
            goto LABEL_33;
          }
          v54 = v18;
          objc_msgSend(v12, "usoGraph");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "nodesCount");
          v33 = objc_msgSend(v12, "nodeIndex");

          if (v32 <= v33)
          {
            CDMOSLoggerForCategory(0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              goto LABEL_33;
            *(_DWORD *)buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            v26 = v25;
            v27 = "%s [WARN]: VOC span UsoGraph node index invalid";
            goto LABEL_32;
          }
          +[CDMProtoSpanMatcherHelper buildUtteranceAlignments:endCharIndex:nodeIndex:](CDMProtoSpanMatcherHelper, "buildUtteranceAlignments:endCharIndex:nodeIndex:", a3, v56, objc_msgSend(v12, "nodeIndex"));
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v17, "usoGraph");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addAlignments:", v25);

          }
          objc_msgSend(v17, "usoGraph");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "nodes");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", (int)objc_msgSend(v12, "nodeIndex"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v37, "usoElementId") == 1206)
          {
            v38 = objc_alloc_init(MEMORY[0x24BE9E060]);
            objc_msgSend(v38, "setValue:", v15);
            objc_msgSend(v37, "setStringPayload:", v38);

          }
          v53 = v37;
          objc_msgSend(v12, "label");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "semantic");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMProtoSpanMatcherHelper buildUsoIdentifier:semantic:nodeIndex:](CDMProtoSpanMatcherHelper, "buildUsoIdentifier:semantic:nodeIndex:", v39, v40, objc_msgSend(v12, "nodeIndex"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            objc_msgSend(v17, "usoGraph");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addIdentifiers:", v41);

          }
          a5 = v52;
          if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
          {
            objc_msgSend(v12, "label");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "semantic");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            +[CDMProtoSpanMatcherHelper buildUsoEntitySpan:semantic:nodeIndex:startIndex:endIndex:tokenCount:](CDMProtoSpanMatcherHelper, "buildUsoEntitySpan:semantic:nodeIndex:startIndex:endIndex:tokenCount:", v43, v44, objc_msgSend(v12, "nodeIndex"), a3, v56, v54);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45)
            {
              objc_msgSend(v17, "usoGraph");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addSpans:", v45);

            }
            a5 = v52;
          }

        }
        else
        {
          objc_msgSend(v12, "label");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "semantic");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMVocUsoGraphMapper buildVocUSOGraphWithVocLabel:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:](CDMVocUsoGraphMapper, "buildVocUSOGraphWithVocLabel:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v28, v29, v15, a3, v56, v18);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setUsoGraph:", v30);

          CDMOSLoggerForCategory(0);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            _os_log_debug_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_DEBUG, "%s Voc matcher got (potentially empty) UsoGraph from mapper code", buf, 0xCu);
          }
        }
LABEL_33:

        objc_msgSend(v17, "label");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "isEqualToString:", CFSTR("language")))
        {

          v48 = v63;
LABEL_36:
          objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v17, 0);
          goto LABEL_38;
        }
        objc_msgSend(v17, "label");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("mediaLanguage"));

        v48 = v63;
        if (v50)
          goto LABEL_36;
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
LABEL_38:

        objc_autoreleasePoolPop(v48);
        ++v11;
      }
      while (v61 != v11);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v61);
  }

}

+ (id)getCDMServiceAssetConfig
{
  CDMServiceAssetConfig *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = CFSTR("vocTrie");
  v7 = CFSTR("com.apple.siri.nl.voc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  return v2;
}

+ (id)spanIdentifierCountComparator
{
  return &__block_literal_global_6980;
}

uint64_t __59__CDMVocTrieProtoSpanMatcher_spanIdentifierCountComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "hasUsoGraph") & 1) == 0 && !objc_msgSend(v5, "hasUsoGraph"))
  {
    v10 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "hasUsoGraph"))
    goto LABEL_9;
  if (objc_msgSend(v5, "hasUsoGraph"))
  {
    objc_msgSend(v4, "usoGraph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "spansCount");
    objc_msgSend(v5, "usoGraph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "spansCount");

    if (v7 <= v9)
    {
      objc_msgSend(v4, "usoGraph");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "spansCount");
      objc_msgSend(v5, "usoGraph");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "spansCount");

      if (v12 >= v14)
      {
        objc_msgSend(v4, "usoGraph");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "identifiersCount");
        objc_msgSend(v5, "usoGraph");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "identifiersCount");

        if (v17 <= v19)
        {
          objc_msgSend(v4, "usoGraph");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "identifiersCount");
          objc_msgSend(v5, "usoGraph");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v21 < objc_msgSend(v22, "identifiersCount");

          goto LABEL_10;
        }
        goto LABEL_6;
      }
LABEL_9:
      v10 = 1;
      goto LABEL_10;
    }
  }
LABEL_6:
  v10 = -1;
LABEL_10:

  return v10;
}

@end
