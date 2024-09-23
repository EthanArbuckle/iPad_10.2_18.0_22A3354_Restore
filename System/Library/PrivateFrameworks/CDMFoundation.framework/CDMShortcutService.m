@implementation CDMShortcutService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMShortcutRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)setup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *denyList;
  void *v11;

  v4 = a3;
  self->super.super._serviceState = 2;
  objc_msgSend(v4, "dynamicConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.autoshortcuts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dynamicConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMShortcutService loadDenyListFromBundle:languageCode:](self, "loadDenyListFromBundle:languageCode:", v6, v8);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  denyList = self->_denyList;
  self->_denyList = v9;

  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)buildEmptyShortcutUserParse
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BE9E160]);
  v3 = (void *)MEMORY[0x24BE9E320];
  v4 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v3, "convertFromUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdA:", v5);

  objc_msgSend(v2, "setProbability:", 1.0);
  v6 = objc_alloc_init(MEMORY[0x24BE9E0E8]);
  objc_msgSend(v2, "setRepetitionResult:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BE9E0D8]);
  objc_msgSend(v7, "setAlgorithm:", 1);
  objc_msgSend(v7, "setParserId:", 5);
  objc_msgSend(v2, "setParser:", v7);

  return v2;
}

- (id)buildParseWithDelegatedUserDialogAct
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BE9E0A8]);
  objc_msgSend(v3, "setAsrHypothesisIndex:", 0);
  objc_msgSend(v3, "setExternalParserId:", CFSTR("com.apple.siri.nlv3"));
  v4 = objc_alloc_init(MEMORY[0x24BE9E158]);
  objc_msgSend(v4, "setDelegated:", v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);
  -[CDMShortcutService buildEmptyShortcutUserParse](self, "buildEmptyShortcutUserParse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserDialogActs:", v5);

  return v6;
}

- (id)handleVoiceCommandFollowUp:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v20;
  BOOL v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CDMShortcutService *v42;
  id obj;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  if (!objc_msgSend(v45, "hasLegacyNlContext"))
    goto LABEL_9;
  objc_msgSend(v45, "legacyNlContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "strictPrompt"))
  {
    objc_msgSend(v45, "legacyNlContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "dictationPrompt");

    if (v6)
      goto LABEL_5;
LABEL_9:
    if (objc_msgSend(v45, "hasNlContext"))
    {
      objc_msgSend(v45, "nlContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemDialogActs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = self;
      if (v13)
      {
        v41 = v13;
        if (objc_msgSend(v13, "count"))
        {
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          obj = v13;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          if (!v14)
            goto LABEL_22;
          v15 = *(_QWORD *)v51;
LABEL_14:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v51 != v15)
              objc_enumerationMutation(obj);
            v17 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * v16);
            if ((objc_msgSend(v17, "hasGaveOptions") & 1) != 0
              || (objc_msgSend(v17, "hasOffered") & 1) != 0
              || objc_msgSend(v17, "hasPrompted"))
            {
              break;
            }

            if (v14 == ++v16)
            {
              v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
              if (!v14)
              {
LABEL_22:

                v13 = v41;
                goto LABEL_23;
              }
              goto LABEL_14;
            }
          }
          if (+[SiriNLUTypesUtils isSdaAskRepeat:](SiriNLUTypesUtils, "isSdaAskRepeat:", v17))
          {
            -[CDMShortcutService buildEmptyShortcutUserParse](self, "buildEmptyShortcutUserParse");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_62:

            goto LABEL_28;
          }
          objc_msgSend(v45, "nlContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "activeTasks");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = +[CDMFeatureFlags isShortcutsNLv4FollowupEnabled](CDMFeatureFlags, "isShortcutsNLv4FollowupEnabled");
          if (v40)
            v22 = v21;
          else
            v22 = 1;
          if ((v22 & 1) != 0 || !objc_msgSend(v40, "count"))
          {
            v18 = 0;
          }
          else
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v44 = v40;
            v23 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v47 != v24)
                    objc_enumerationMutation(v44);
                  v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                  if (v26)
                  {
                    objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "task");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = v27 == 0;

                    if (!v28)
                    {
                      objc_msgSend(v26, "task");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "nodes");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v30)
                      {
                        objc_msgSend(v29, "edges");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v31)
                          goto LABEL_54;
                        objc_msgSend(v29, "nodes");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v32, "count") != 2)
                          goto LABEL_52;
                        objc_msgSend(v29, "edges");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = objc_msgSend(v33, "count") == 1;

                        if (v34)
                        {
                          objc_msgSend(v29, "nodes");
                          v30 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
                          v31 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v31, "usoElementId") == 1)
                          {
                            objc_msgSend(v29, "nodes");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v35, "usoElementId") == 1808)
                            {
                              objc_msgSend(v29, "edges");
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
                              v38 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v38, "label");
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              v37 = objc_msgSend(v36, "usoElementId") == 861;

                              if (v37)
                              {
                                -[CDMShortcutService buildParseWithDelegatedUserDialogAct](v42, "buildParseWithDelegatedUserDialogAct");
                                v18 = (void *)objc_claimAutoreleasedReturnValue();

                                goto LABEL_59;
                              }
                              goto LABEL_55;
                            }

LABEL_52:
                          }

LABEL_54:
                        }
                      }
LABEL_55:

                      continue;
                    }
                  }
                }
                v23 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
              }
              while (v23);
            }
            v18 = 0;
LABEL_59:

          }
          goto LABEL_62;
        }
      }
LABEL_23:

    }
    -[CDMShortcutService buildEmptyShortcutUserParse](self, "buildEmptyShortcutUserParse");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }

LABEL_5:
  if (+[CDMFeatureFlags isShortcutsNLv4FollowupEnabled](CDMFeatureFlags, "isShortcutsNLv4FollowupEnabled"))
  {
    goto LABEL_27;
  }
  objc_msgSend(v45, "legacyNlContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasPreviousDomainName") & 1) == 0)
  {

    goto LABEL_27;
  }
  objc_msgSend(v45, "legacyNlContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previousDomainName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("voiceCommands"));

  if (!v10)
  {
LABEL_27:
    v18 = 0;
    goto LABEL_28;
  }
  -[CDMShortcutService buildParseWithDelegatedUserDialogAct](self, "buildParseWithDelegatedUserDialogAct");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_25:
  v18 = (void *)v11;
LABEL_28:

  return v18;
}

- (id)filterExactMatchVoiceCommandSpans:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CDMShortcutService voiceCommandPredicate](CDMShortcutService, "voiceCommandPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315138;
      v12 = "-[CDMShortcutService filterExactMatchVoiceCommandSpans:]";
      _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Have overlapping voiceCommandName spans, taking the longest one. When tie, prioritizes SiriVocab span", (uint8_t *)&v11, 0xCu);
    }

    +[CDMProtoSpanMatcherHelper voiceCommandSpanComparator](CDMProtoSpanMatcherHelper, "voiceCommandSpanComparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)filterVoiceCommandPrefixMatchingSpans:(id)a3 voiceCommandSpan:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(SELF.label == %@ OR SELF.label== %@) AND SELF.endTokenIndex <= %d"), CFSTR("voiceTrigger"), CFSTR("voiceCommandNamePrefix"), objc_msgSend(v6, "startTokenIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtoSpanMatcherHelper ascendingStartIndexComparator](CDMProtoSpanMatcherHelper, "ascendingStartIndexComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterVoiceCommandSuffixMatchingSpans:(id)a3 voiceCommandSpan:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(SELF.label == %@) AND SELF.startTokenIndex >= %d"), CFSTR("voiceCommandNameSuffix"), objc_msgSend(v6, "endTokenIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtoSpanMatcherHelper ascendingStartIndexComparator](CDMProtoSpanMatcherHelper, "ascendingStartIndexComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldSpanComboProduceParse:(id)a3 prefixSpans:(id)a4 suffixSpans:(id)a5 tokenChain:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  char v21;
  void *v22;
  BOOL v23;
  void *v24;
  BOOL v25;
  unint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  int v44;
  id v45;
  id v46;

  v9 = a3;
  v10 = a4;
  v45 = a5;
  v11 = a6;
  v12 = v11;
  if (!v9)
    goto LABEL_25;
  v46 = v9;
  objc_msgSend(v11, "tokens");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "tokenIndex");

  objc_msgSend(v12, "tokens");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v17, "tokenIndex");

  v18 = objc_msgSend(v9, "startTokenIndex");
  v19 = objc_msgSend(v9, "endTokenIndex");
  v20 = (_DWORD)v13 + 1;
  if (v18 == v15 && v19 == v20)
    goto LABEL_4;
  v44 = v19;
  if (!objc_msgSend(v10, "count"))
  {
    v21 = v18 == v15;
    if (v18 != v15 || v44 == v20)
      goto LABEL_26;
LABEL_17:
    if (objc_msgSend(v45, "count"))
    {
      objc_msgSend(v45, "lastObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "endTokenIndex");

      if (v36 == v20)
      {
        objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:secondSpan:tokenChain:](CDMProtoSpanMatcherHelper, "isTrailingSpanAdjacent:secondSpan:tokenChain:", v9, v37, v12);

        v39 = 1;
        while (objc_msgSend(v45, "count") > v39 && v38)
        {
          v40 = v39 - 1;
          objc_msgSend(v45, "objectAtIndexedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndexedSubscript:", v40 + 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:secondSpan:tokenChain:](CDMProtoSpanMatcherHelper, "isTrailingSpanAdjacent:secondSpan:tokenChain:", v41, v42, v12);

          v39 = v40 + 2;
          v9 = v46;
        }
        if (v38)
        {
LABEL_4:
          v21 = 1;
          goto LABEL_26;
        }
      }
    }
LABEL_25:
    v21 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:secondSpan:tokenChain:](CDMProtoSpanMatcherHelper, "isTrailingSpanAdjacent:secondSpan:tokenChain:", v22, v9, v12);

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "startTokenIndex") == v15;

  for (i = 1; objc_msgSend(v10, "count") > i && v25 && !v23; ++i)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", i - 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "label");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isEqualToString:", CFSTR("voiceTrigger")))
    {

    }
    else
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "label");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("voiceTrigger"));

      if ((v31 & 1) != 0)
      {
        v21 = 0;
        goto LABEL_23;
      }
    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", i - 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:secondSpan:tokenChain:](CDMProtoSpanMatcherHelper, "isTrailingSpanAdjacent:secondSpan:tokenChain:", v32, v33, v12);

    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:secondSpan:tokenChain:](CDMProtoSpanMatcherHelper, "isTrailingSpanAdjacent:secondSpan:tokenChain:", v34, v46, v12);

  }
  v21 = v25 && v23;
  if (!v25 || !v23)
  {
LABEL_23:
    v9 = v46;
    goto LABEL_26;
  }
  v9 = v46;
  if (v44 != v20)
    goto LABEL_17;
LABEL_26:

  return v21 & 1;
}

- (id)handle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  CDMShortcutResponseCommand *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  siri::ontology *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  uint64_t v27;
  siri::ontology::oname::graph::ontology_init *v28;
  siri::ontology::oname::graph::ontology_init *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  siri::ontology::UsoEntityNode *StringNode;
  siri::ontology::oname::graph::ontology_init *v36;
  siri::ontology::oname::graph::ontology_init *v37;
  siri::ontology::oname::graph::ontology_init *v38;
  id v39;
  id v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  CDMShortcutResponseCommand *v48;
  uint64_t v49;
  void *v50;
  unint64_t *v51;
  unint64_t v52;
  void *v53;
  CDMShortcutResponseCommand *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  siri::ontology::oname::graph::ontology_init *TaskNode;
  void *v62;
  std::__shared_weak_count *v63;
  void *v64;
  void *v65;
  void *v66;
  CDMShortcutResponseCommand *v67;
  id v68;
  _BYTE __p[12];
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v67 = -[CDMShortcutResponseCommand initWithVoiceCommandUserParses:autoShortcutParses:]([CDMShortcutResponseCommand alloc], "initWithVoiceCommandUserParses:autoShortcutParses:", v5, v68);
  objc_msgSend(v4, "currentTurnContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMShortcutService handleVoiceCommandFollowUp:](self, "handleVoiceCommandFollowUp:", v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[__CFString userDialogActs](v7, "userDialogActs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[__CFString userDialogActs](v7, "userDialogActs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasDelegated");

      if (v11)
      {
        v12 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__p = 136315394;
          *(_QWORD *)&__p[4] = "-[CDMShortcutService handle:]";
          v70 = 2112;
          v71 = CFSTR("shortcut");
          _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nShortcut follow up request, routing to server", __p, 0x16u);
        }
        objc_msgSend(v5, "addObject:", v7);
        v13 = v67;
        goto LABEL_42;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "matchingSpans");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMShortcutService filterExactMatchVoiceCommandSpans:](self, "filterExactMatchVoiceCommandSpans:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "matchingSpans");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMShortcutService filterVoiceCommandPrefixMatchingSpans:voiceCommandSpan:](self, "filterVoiceCommandPrefixMatchingSpans:voiceCommandSpan:", v17, v16);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "matchingSpans");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMShortcutService filterVoiceCommandSuffixMatchingSpans:voiceCommandSpan:](self, "filterVoiceCommandSuffixMatchingSpans:voiceCommandSpan:", v18, v16);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "tokenChain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CDMShortcutService shouldSpanComboProduceParse:prefixSpans:suffixSpans:tokenChain:](self, "shouldSpanComboProduceParse:prefixSpans:suffixSpans:tokenChain:", v16, v66, v65, v19);

    if (v20)
    {
      -[CDMShortcutService extractShortcutDataFromSpan:](self, "extractShortcutDataFromSpan:", v16);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = CDMLogContext;
      v64 = (void *)v21;
      if (v21)
      {
        v23 = (id)CDMLogContext;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v64, "semanticValue");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "tokenChain");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringValue");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__p = 136315906;
          *(_QWORD *)&__p[4] = "-[CDMShortcutService handle:]";
          v70 = 2112;
          v71 = CFSTR("shortcut");
          v72 = 2112;
          v73 = v56;
          v74 = 2112;
          v75 = v58;
          _os_log_debug_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nFound exact match Voice Command:%@, to utterance:%@ ", __p, 0x2Au);

        }
        v63 = *(std::__shared_weak_count **)(siri::ontology::getSharedUsoVocabManager(v24) + 8);
        if (v63)
        {
          p_shared_owners = (unint64_t *)&v63->__shared_owners_;
          do
            v26 = __ldxr(p_shared_owners);
          while (__stxr(v26 + 1, p_shared_owners));
        }
        v27 = operator new();
        memset(__p, 0, sizeof(__p));
        v28 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v27, __p);
        v29 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_VoiceCommand(v28);
        siri::ontology::oname::graph::ontology_init::Reference_run(v29);
        TaskNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createTaskNode();
        siri::ontology::oname::graph::ontology_init::common_VoiceCommand(TaskNode);
        siri::ontology::UsoGraph::createEntityNode();
        objc_msgSend(v4, "tokenChain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "tokens");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v16, "startTokenIndex"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "tokenChain");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "tokens");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v16, "endTokenIndex") - 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "semanticValue");
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v34, "UTF8String"));
        LOBYTE(v73) = 1;
        StringNode = (siri::ontology::UsoEntityNode *)siri::ontology::UsoGraph::createStringNode();
        if ((_BYTE)v73 && SHIBYTE(v72) < 0)
          operator delete(*(void **)__p);

        objc_msgSend(v60, "begin");
        objc_msgSend(v59, "end");
        v36 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment(StringNode);
        siri::ontology::oname::graph::ontology_init::Argument_name(v36);
        v37 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
        siri::ontology::oname::graph::ontology_init::Argument_reference(v37);
        v38 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
        siri::ontology::oname::graph::ontology_init::Argument_task(v38);
        siri::ontology::UsoGraphNode::setSuccessor();
        objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v27);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_alloc_init(MEMORY[0x24BE9E168]);
        objc_msgSend(v39, "setTask:", v62);
        v40 = objc_alloc_init(MEMORY[0x24BE9E158]);
        objc_msgSend(v40, "setUserStatedTask:", v39);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v40);
        -[__CFString setUserDialogActs:](v7, "setUserDialogActs:", v41);
        v42 = -[CDMShortcutService hasAutoShortcutIdentifier:](self, "hasAutoShortcutIdentifier:", v16);
        v43 = v5;
        if (v42
          && (v44 = -[CDMShortcutService isPhrase:inDenyList:](self, "isPhrase:inDenyList:", v64, self->_denyList),
              v43 = v68,
              v44))
        {
          CDMOSLoggerForCategory(0);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__p = 136315394;
            *(_QWORD *)&__p[4] = "-[CDMShortcutService handle:]";
            v70 = 2112;
            v71 = v7;
            _os_log_debug_impl(&dword_21A2A0000, v45, OS_LOG_TYPE_DEBUG, "%s Ignoring AutoShortcut parse since the phrase was found in the deny list: %@", __p, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v43, "addObject:", v7, v59);
        }
        v47 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__p = 136315906;
          *(_QWORD *)&__p[4] = "-[CDMShortcutService handle:]";
          v70 = 2112;
          v71 = CFSTR("shortcut");
          v72 = 2112;
          v73 = v5;
          v74 = 2112;
          v75 = v68;
          _os_log_debug_impl(&dword_21A2A0000, v47, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nCDMShortcut VoiceCommandsUserParses: %@, AutoShortcutParses: %@", __p, 0x2Au);
        }
        v48 = v67;

        v49 = MEMORY[0x220743D5C](v27);
        MEMORY[0x22074408C](v49, 0x10A0C403D23BABBLL);
        v50 = v64;
        if (v63)
        {
          v51 = (unint64_t *)&v63->__shared_owners_;
          do
            v52 = __ldaxr(v51);
          while (__stlxr(v52 - 1, v51));
          if (!v52)
          {
            ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
            std::__shared_weak_count::__release_weak(v63);
          }
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__p = 136315394;
          *(_QWORD *)&__p[4] = "-[CDMShortcutService handle:]";
          v70 = 2112;
          v71 = CFSTR("shortcut");
          _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMatching a top level shortcut, sending it to server", __p, 0x16u);
        }
        -[CDMShortcutService buildParseWithDelegatedUserDialogAct](self, "buildParseWithDelegatedUserDialogAct");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v53);

        v54 = v67;
        v50 = 0;
      }

      v13 = v67;
    }
    else
    {
      v46 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__p = 136315394;
        *(_QWORD *)&__p[4] = "-[CDMShortcutService handle:]";
        v70 = 2112;
        v71 = CFSTR("shortcut");
        _os_log_debug_impl(&dword_21A2A0000, v46, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nNo exact match Voice Command Found", __p, 0x16u);
      }
      v13 = 0;
    }

  }
  else
  {
    v14 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__p = 136315394;
      *(_QWORD *)&__p[4] = "-[CDMShortcutService handle:]";
      v70 = 2112;
      v71 = CFSTR("shortcut");
      _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nFollow up turn with prompts/sdas, should not trigger voice commands", __p, 0x16u);
    }
    v13 = 0;
  }
LABEL_42:

  return v13;
}

- (id)extractShortcutDataFromSpan:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  CDMShortcutPhrase *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "usoGraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "nodes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "nodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        objc_msgSend(v11, "stringPayload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (!v13)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v8)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      objc_msgSend(v11, "stringPayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      v25 = objc_claimAutoreleasedReturnValue();

      if (!v25)
        goto LABEL_22;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v4, "identifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v20, "namespaceA");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("autoShortcutBaseTemplate"));

            if (v23)
            {
              objc_msgSend(v20, "value");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }
          }
          v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_24:

      v14 = -[CDMShortcutPhrase initWithSemanticValue:baseTemplateString:]([CDMShortcutPhrase alloc], "initWithSemanticValue:baseTemplateString:", v25, v17);
      v7 = (void *)v25;
    }
    else
    {
LABEL_11:
      v14 = 0;
    }

  }
  else
  {
LABEL_22:
    v14 = 0;
  }

  return v14;
}

- (id)loadDenyListFromBundle:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMShortcutService loadDenyListFromBundle:languageCode:]";
      v16 = "%s Didn't receive a deny list bundle, will default to empty deny list";
LABEL_9:
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
    }
LABEL_10:
    v15 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_15;
  }
  if (!v7)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMShortcutService loadDenyListFromBundle:languageCode:]";
      v16 = "%s languageCode is nil, will default to empty deny list";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deny_list/deny_list_%@.plist"), v7);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourcePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfFile:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMShortcutService validateDenyListArray:](self, "validateDenyListArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CDMShortcutService loadDenyListFromBundle:languageCode:]";
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s Did not find deny list on disk at path %@, returning empty list", buf, 0x16u);
    }

    v15 = (void *)MEMORY[0x24BDBD1A8];
  }

LABEL_15:
  return v15;
}

- (id)validateDenyListArray:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CDMShortcutService validateDenyListArray:]";
    v20 = 2112;
    v21 = v3;
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s AutoShortcut deny list content: %@", buf, 0x16u);
  }

  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            CDMOSLoggerForCategory(0);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v19 = "-[CDMShortcutService validateDenyListArray:]";
              _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: AutoShortcut deny list has invalid content, returning empty list", buf, 0xCu);
            }

            goto LABEL_19;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }

    v9 = v5;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CDMShortcutService validateDenyListArray:]";
      _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: AutoShortcut deny list is nil, returning empty list", buf, 0xCu);
    }

LABEL_19:
    v9 = (id)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (BOOL)isPhrase:(id)a3 inDenyList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "semanticValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "baseTemplateString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "baseTemplateString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "containsObject:", v10);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)hasAutoShortcutIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "usoGraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x24BEA3930];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasValue", (_QWORD)v14))
        {
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hasPrefix:", v8);

          if ((v12 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (NSArray)denyList
{
  return self->_denyList;
}

- (void)setDenyList:(id)a3
{
  objc_storeStrong((id *)&self->_denyList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyList, 0);
}

+ (id)voiceCommandPredicate
{
  if (+[CDMShortcutService voiceCommandPredicate]::onceToken != -1)
    dispatch_once(&+[CDMShortcutService voiceCommandPredicate]::onceToken, &__block_literal_global_9520);
  return (id)+[CDMShortcutService voiceCommandPredicate]::value;
}

+ (id)getCDMServiceAssetConfig
{
  CDMServiceAssetConfig *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v5 = CFSTR("com.apple.siri.nl.autoshortcuts");
  v6[0] = &unk_24DCCCAD0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v3, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

+ (BOOL)isAssetRequired
{
  return 0;
}

void __43__CDMShortcutService_voiceCommandPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.label == %@"), CFSTR("voiceCommandName"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMShortcutService voiceCommandPredicate]::value;
  +[CDMShortcutService voiceCommandPredicate]::value = v0;

}

@end
