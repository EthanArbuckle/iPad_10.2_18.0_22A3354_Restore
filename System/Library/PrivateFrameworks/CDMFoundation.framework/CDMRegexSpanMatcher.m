@implementation CDMRegexSpanMatcher

- (CDMRegexSpanMatcher)initWithCachePath:(id)a3
{
  id v4;
  CDMRegexSpanMatcher *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSArray *regexEntries;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMRegexSpanMatcher;
  v5 = -[CDMRegexSpanMatcher init](&v12, sel_init);
  if (v5)
  {
    if (!v4)
    {
      NSTemporaryDirectory();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByStandardizingPath");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("regex.jsonl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CDMRegexSpanMatcher initWithCachePath:]";
      v15 = 2112;
      v16 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Loading CDMRegexSpanMatcher data from %@", buf, 0x16u);
    }

    +[CDMRegexSpanMatcher readRegexAssetFromPath:](CDMRegexSpanMatcher, "readRegexAssetFromPath:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    regexEntries = v5->_regexEntries;
    v5->_regexEntries = (NSArray *)v9;

  }
  return v5;
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  id v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  objc_class *v11;
  char *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  int v61;
  NSObject *v62;
  void *v63;
  __objc2_class **v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  __objc2_class *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  int v73;
  int v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v87;
  unint64_t v88;
  os_signpost_id_t spid;
  id v90;
  NSArray *obj;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  unsigned int v99;
  __CFString *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t buf[4];
  const char *v116;
  __int16 v117;
  const __CFString *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v90 = a4;
  v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v8 = (id)CDMLogContext;
  v9 = v8;
  spid = v7;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v116 = v12;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SpanMatcher", "%{public}@", buf, 0xCu);

  }
  if (-[NSArray count](self->_regexEntries, "count"))
  {
    v88 = v10;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v93 = -[__CFString length](v14, "length");
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      v114 = 0u;
      obj = self->_regexEntries;
      v94 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
      if (v94)
      {
        v97 = 0;
        v98 = 0;
        v92 = *(_QWORD *)v112;
        v96 = v13;
        v100 = v15;
        v101 = v6;
        while (1)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v112 != v92)
            {
              v17 = v16;
              objc_enumerationMutation(obj);
              v16 = v17;
            }
            v95 = v16;
            v104 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v16);
            objc_msgSend(v104, "regularExpression");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "matchesInString:options:range:", v15, 0, 0, v93);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v109 = 0u;
            v110 = 0u;
            v107 = 0u;
            v108 = 0u;
            v103 = v19;
            v106 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
            if (v106)
            {
              v105 = *(_QWORD *)v108;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v108 != v105)
                    objc_enumerationMutation(v103);
                  v21 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v20);
                  CDMOSLoggerForCategory(0);
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    v23 = objc_msgSend(v21, "range");
                    -[__CFString substringWithRange:](v15, "substringWithRange:", v23, v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "label");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v21, "range");
                    v28 = objc_msgSend(v21, "range");
                    objc_msgSend(v21, "range");
                    *(_DWORD *)buf = 136316418;
                    v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                    v117 = 2112;
                    v118 = v15;
                    v119 = 2112;
                    v120 = v25;
                    v121 = 2112;
                    v122 = v26;
                    v123 = 2048;
                    v124 = v27;
                    v125 = 2048;
                    v126 = v29 + v28;
                    _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s For utterance <%@>, CDMRegexSpanMatcher matched text: <%@>, label: <%@>, start index: <%zu>, end index: <%zu>", buf, 0x3Eu);

                  }
                  v30 = objc_msgSend(v6, "tokenIndexFromCharacterIndex:", objc_msgSend(v21, "range"));
                  v31 = objc_msgSend(v21, "range");
                  objc_msgSend(v21, "range");
                  v33 = objc_msgSend(v6, "tokenIndexFromCharacterIndex:", v31 + v32 - 1);
                  v34 = (v33 + 1);
                  if (v33 != -1)
                  {
                    objc_msgSend(v6, "tokens");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = objc_msgSend(v35, "count");

                    if (v36 >= v34)
                    {
                      v38 = objc_msgSend(v21, "range");
                      -[__CFString substringWithRange:](v15, "substringWithRange:", v38, v39);
                      v40 = objc_claimAutoreleasedReturnValue();
                      v41 = v104;
                      objc_msgSend(v104, "label");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = objc_msgSend(v21, "range");
                      v44 = objc_msgSend(v21, "range");
                      objc_msgSend(v21, "range");
                      LODWORD(v87) = 8;
                      v46 = (void *)v40;
                      +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:](CDMProtoSpanMatcherHelper, "buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:", v42, v40, v30, v34, v43, (v45 + v44), v87);
                      v102 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v104, "label");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("ordinal"));

                      if (v48)
                      {
                        v6 = v101;
                        if ((unint64_t)objc_msgSend(v21, "numberOfRanges") <= 1)
                        {
                          CDMOSLoggerForCategory(0);
                          v49 = objc_claimAutoreleasedReturnValue();
                          v15 = v100;
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 136315138;
                            v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                            v50 = v49;
                            v51 = "%s CDMRegexSpanMatcher created an ordinal match with one or fewer ranges, which indica"
                                  "tes that capture groups were not used in the regex definition";
                            goto LABEL_49;
                          }
                          goto LABEL_32;
                        }
                        v55 = objc_msgSend(v21, "rangeAtIndex:", 1);
                        v15 = v100;
                        if (v55 == 0x7FFFFFFFFFFFFFFFLL
                          || (v57 = v56, v56 == 0x7FFFFFFFFFFFFFFFLL)
                          || (v58 = v55, v55 + v56 > (unint64_t)-[__CFString length](v100, "length")))
                        {
                          CDMOSLoggerForCategory(0);
                          v49 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 136315138;
                            v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                            v50 = v49;
                            v51 = "%s CDMRegexSpanMatcher created an ordinal match that cannot be resolved to a position "
                                  "in the utterance";
LABEL_49:
                            _os_log_debug_impl(&dword_21A2A0000, v50, OS_LOG_TYPE_DEBUG, v51, buf, 0xCu);
                          }
LABEL_32:

                          v59 = v102;
LABEL_41:

                          goto LABEL_42;
                        }
                        -[__CFString substringWithRange:](v100, "substringWithRange:", v58, v57);
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        v77 = objc_msgSend(v76, "integerValue");

                        if (v77 == 0x7FFFFFFFFFFFFFFFLL)
                        {
                          CDMOSLoggerForCategory(0);
                          v49 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 136315138;
                            v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                            _os_log_impl(&dword_21A2A0000, v49, OS_LOG_TYPE_INFO, "%s CDMRegexSpanMatcher invalid ordinal value matched", buf, 0xCu);
                          }
                          goto LABEL_32;
                        }
                        objc_msgSend(v104, "label");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        v78 = objc_msgSend(v21, "range");
                        v79 = objc_msgSend(v21, "range");
                        objc_msgSend(v21, "range");
                        +[CDMVocUsoGraphMapper buildVocUSOGraphForRegexOrdinal:withVocLabel:withInput:withStartCharIndex:withEndCharIndex:](CDMVocUsoGraphMapper, "buildVocUSOGraphForRegexOrdinal:withVocLabel:withInput:withStartCharIndex:withEndCharIndex:", v77, v53, v46, v78, (v80 + v79));
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        v59 = v102;
                        objc_msgSend(v102, "setUsoGraph:", v71);
LABEL_40:

                        -[NSObject addObject:](v96, "addObject:", v59);
                        v15 = v100;
                        goto LABEL_41;
                      }
                      v6 = v101;
                      v52 = objc_msgSend(v101, "nonWhiteSpaceCountFromToken:toToken:", v30, v34);
                      objc_msgSend(v104, "label");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v104, "label");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v99 = v52;
                      if (objc_msgSend(v54, "isEqualToString:", CFSTR("integer")))
                      {

LABEL_34:
                        v63 = v97;
                        v62 = v98;
                        if (v98 && v97)
                        {
                          v64 = off_24DCA1000;
                        }
                        else
                        {
                          objc_msgSend(v101, "locale");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          +[CDMRegexSpanMatcher getNumberFormatter:](CDMRegexSpanMatcher, "getNumberFormatter:", v65);
                          v66 = objc_claimAutoreleasedReturnValue();

                          +[CDMRegexSpanMatcher getNumberFormatterForOutput](CDMRegexSpanMatcher, "getNumberFormatterForOutput");
                          v67 = objc_claimAutoreleasedReturnValue();

                          v64 = off_24DCA1000;
                          v6 = v101;
                          v63 = (void *)v67;
                          v62 = v66;
                        }
                        v68 = v64[26];
                        v41 = v104;
                        objc_msgSend(v104, "label");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        v97 = v63;
                        v98 = v62;
                        -[__objc2_class getNumberString:numberFormatter:numberFormatterForOutput:integerOnly:](v68, "getNumberString:numberFormatter:numberFormatterForOutput:integerOnly:", v46, v62, v63, objc_msgSend(v69, "isEqualToString:", CFSTR("integer")));
                        v70 = objc_claimAutoreleasedReturnValue();

                        v53 = (void *)v70;
                      }
                      else
                      {
                        objc_msgSend(v104, "label");
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("decimal"));

                        if (v61)
                          goto LABEL_34;
                      }
                      objc_msgSend(v41, "label");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      v72 = objc_msgSend(v21, "range");
                      v73 = objc_msgSend(v21, "range");
                      objc_msgSend(v21, "range");
                      +[CDMVocUsoGraphMapper buildVocUSOGraphWithVocLabel:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:](CDMVocUsoGraphMapper, "buildVocUSOGraphWithVocLabel:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v71, v53, v46, v72, (v74 + v73), v99);
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      v59 = v102;
                      objc_msgSend(v102, "setUsoGraph:", v75);

                      goto LABEL_40;
                    }
                  }
                  v37 = CDMLogContext;
                  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                    v117 = 2112;
                    v118 = CFSTR("spanmatch");
                    v119 = 1024;
                    LODWORD(v120) = v34;
                    _os_log_impl(&dword_21A2A0000, v37, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nInvalid end token index for regex span matcher, endTokenIdx=%d", buf, 0x1Cu);
                  }
LABEL_42:
                  ++v20;
                }
                while (v106 != v20);
                v81 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
                v106 = v81;
              }
              while (v81);
            }

            v16 = v95 + 1;
            v13 = v96;
          }
          while (v95 + 1 != v94);
          v94 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
          if (!v94)
            goto LABEL_61;
        }
      }
      v97 = 0;
      v98 = 0;
LABEL_61:

      v84 = (id)CDMLogContext;
      v85 = v84;
      if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v85, OS_SIGNPOST_INTERVAL_END, spid, "SpanMatcher", ", buf, 2u);
      }

      v82 = v13;
      v83 = v98;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
        _os_log_impl(&dword_21A2A0000, v83, OS_LOG_TYPE_INFO, "%s CDMRegexSpanMatcher received nil utterance", buf, 0xCu);
      }
      v82 = 0;
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s CDMRegexSpanMatcher no regex entities loaded", buf, 0xCu);
    }
    v82 = 0;
  }

  return v82;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexEntries, 0);
  objc_storeStrong((id *)&self->_fileVersion, 0);
  objc_storeStrong((id *)&self->_cachedFilePath, 0);
}

+ (id)readRegexAssetFromPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v4, 4, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v15;
  if (v7)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "+[CDMRegexSpanMatcher readRegexAssetFromPath:]";
      v18 = 2112;
      v19 = v7;
      _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Error while loading CDMRegexSpanMatcher asset %@", buf, 0x16u);
    }
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v11);
    v8 = objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__CDMRegexSpanMatcher_readRegexAssetFromPath___block_invoke;
    v13[3] = &unk_24DCACC58;
    v12 = v5;
    v14 = v12;
    -[NSObject enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v13);
    v9 = v12;

  }
  return v9;
}

+ (id)getNumberFormatter:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD16F0];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v4);

    objc_msgSend(v5, "setNumberStyle:", 1);
    objc_msgSend(v5, "setLocale:", v6);
    objc_msgSend(v5, "setUsesGroupingSeparator:", 1);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)getNumberFormatterForOutput
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v2, "setLocale:", v3);
  objc_msgSend(v2, "setNumberStyle:", 1);
  objc_msgSend(v2, "setUsesGroupingSeparator:", 0);
  objc_msgSend(v2, "setMaximumFractionDigits:", 15);

  return v2;
}

+ (id)getNumberString:(id)a3 numberFormatter:(id)a4 numberFormatterForOutput:(id)a5 integerOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (!v10)
      goto LABEL_12;
    objc_msgSend(v10, "numberFromString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_12;
    v13 = v12;
    if (v6)
    {
      v14 = objc_msgSend(v12, "intValue");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v11)
        objc_msgSend(v11, "stringFromNumber:", v12);
      else
        objc_msgSend(v12, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v16)
    {
LABEL_12:
      if (v6)
      {
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_24DCAE158);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = v9;
      }
      v16 = v17;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __46__CDMRegexSpanMatcher_readRegexAssetFromPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  CDMRegexEntry *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", &stru_24DCAE158);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v9)
    {
      v10 = v9;
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "+[CDMRegexSpanMatcher readRegexAssetFromPath:]_block_invoke";
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Error while processing regex matcher file for CDMRegexSpanMatcher: %@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("label"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("regex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v12, 0, &v15);
      v10 = v15;
      if (v10)
      {
        CDMOSLoggerForCategory(0);
        v14 = (CDMRegexEntry *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "+[CDMRegexSpanMatcher readRegexAssetFromPath:]_block_invoke";
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_21A2A0000, &v14->super, OS_LOG_TYPE_INFO, "%s Error while reading regular expression for CDMRegexSpanMatcher %@", buf, 0x16u);
        }
      }
      else
      {
        v14 = -[CDMRegexEntry initWithRegex:label:]([CDMRegexEntry alloc], "initWithRegex:label:", v13, v11);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
      }

    }
  }

}

@end
