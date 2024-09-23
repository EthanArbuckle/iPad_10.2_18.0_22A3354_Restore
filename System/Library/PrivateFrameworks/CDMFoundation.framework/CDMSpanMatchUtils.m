@implementation CDMSpanMatchUtils

+ (BOOL)isSamePosition:(id)a3 spanB:(id)a4 asrMapA:(id)a5 asrMapB:(id)a6 cdmTokenChainA:(id)a7 cdmTokenChainB:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  BOOL v51;
  int v52;
  void *v53;
  const char *v54;
  int v55;
  void *v56;
  const char *v57;
  int v58;
  int v59;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *log;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  _BYTE v78[18];
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_msgSend(v13, "startTokenIndex");
  objc_msgSend(v17, "tokens");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 <= v19)
  {
    CDMOSLoggerForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    v52 = objc_msgSend(v13, "startTokenIndex");
    objc_msgSend(v17, "tokens");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
    v77 = 1024;
    *(_DWORD *)v78 = v52;
    *(_WORD *)&v78[4] = 2048;
    *(_QWORD *)&v78[6] = objc_msgSend(v53, "count");
    v54 = "%s [WARN]: spanA.startTokenIndex=%u is out of range with tokens.count=%zd";
LABEL_24:
    _os_log_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_INFO, v54, buf, 0x1Cu);

    goto LABEL_28;
  }
  objc_msgSend(v17, "tokens");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v13, "startTokenIndex"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "begin");

  v25 = objc_msgSend(v13, "endTokenIndex") - 1;
  objc_msgSend(v17, "tokens");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 <= v25)
  {
    CDMOSLoggerForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v55 = objc_msgSend(v13, "endTokenIndex") - 1;
      objc_msgSend(v17, "tokens");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
      v77 = 1024;
      *(_DWORD *)v78 = v55;
      *(_WORD *)&v78[4] = 2048;
      *(_QWORD *)&v78[6] = objc_msgSend(v56, "count");
      v57 = "%s [WARN]: (spanA.endTokenIndex - 1)=%u is out of range with tokens.count=%zd";
LABEL_27:
      _os_log_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_INFO, v57, buf, 0x1Cu);

    }
LABEL_28:
    v51 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v17, "tokens");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v13, "endTokenIndex") - 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v29, "end");

  LODWORD(v28) = objc_msgSend(v14, "startTokenIndex");
  objc_msgSend(v18, "tokens");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31 <= v28)
  {
    CDMOSLoggerForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    v58 = objc_msgSend(v14, "startTokenIndex");
    objc_msgSend(v18, "tokens");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
    v77 = 1024;
    *(_DWORD *)v78 = v58;
    *(_WORD *)&v78[4] = 2048;
    *(_QWORD *)&v78[6] = objc_msgSend(v53, "count");
    v54 = "%s [WARN]: spanB.startTokenIndex=%u is out of range with tokens.count=%zd";
    goto LABEL_24;
  }
  objc_msgSend(v18, "tokens");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", objc_msgSend(v14, "startTokenIndex"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v33, "begin");

  v34 = objc_msgSend(v14, "endTokenIndex") - 1;
  objc_msgSend(v18, "tokens");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36 <= v34)
  {
    CDMOSLoggerForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v59 = objc_msgSend(v14, "endTokenIndex") - 1;
      objc_msgSend(v18, "tokens");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
      v77 = 1024;
      *(_DWORD *)v78 = v59;
      *(_WORD *)&v78[4] = 2048;
      *(_QWORD *)&v78[6] = objc_msgSend(v56, "count");
      v57 = "%s [WARN]: (spanB.endTokenIndex - 1)=%u is out of range with tokens.count=%zd";
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  objc_msgSend(v18, "tokens");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", objc_msgSend(v14, "endTokenIndex") - 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "end");

  CDMOSLoggerForCategory(0);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
    v77 = 2048;
    *(_QWORD *)v78 = v24;
    *(_WORD *)&v78[8] = 2048;
    *(_QWORD *)&v78[10] = v73;
    v79 = 2048;
    v80 = v71;
    v81 = 2048;
    v82 = v39;
    v83 = 2112;
    v84 = v15;
    v85 = 2112;
    v86 = v16;
    _os_log_debug_impl(&dword_21A2A0000, v40, OS_LOG_TYPE_DEBUG, "%s Used span's start/end token index + CDMTokenChain's indices to find the ASR character indices. spanACharIndexBegin=%ld, spanACharIndexEnd=%ld, spanBCharIndexBegin=%ld, spanBCharIndexEnd=%ld, asrMapA=%@, asrMapB=%@", buf, 0x48u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v24);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v41);
  v42 = objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v73);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v69 = v44;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v71);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v45);
    v46 = objc_claimAutoreleasedReturnValue();

    v74 = (void *)v46;
    if (v46)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v39);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v72 = (void *)v48;
      if (v48)
      {
        CDMOSLoggerForCategory(0);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v74;
        v44 = v69;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
          v77 = 2112;
          *(_QWORD *)v78 = v42;
          *(_WORD *)&v78[8] = 2112;
          *(_QWORD *)&v78[10] = v69;
          v79 = 2112;
          v80 = (uint64_t)v74;
          v81 = 2112;
          v82 = (uint64_t)v72;
          _os_log_debug_impl(&dword_21A2A0000, v49, OS_LOG_TYPE_DEBUG, "%s Found spanAAsrTimingBegin=%@, spanAAsrTimingEnd=%@, spanBAsrTimingBegin=%@, spanBAsrTimingEnd=%@", buf, 0x34u);
        }

        if (-[NSObject isEqualToNumber:](v42, "isEqualToNumber:", v74)
          && objc_msgSend(v69, "isEqualToNumber:", v72))
        {
          CDMOSLoggerForCategory(0);
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "input");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "input");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "label");
            v63 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316418;
            v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
            v77 = 2112;
            *(_QWORD *)v78 = v68;
            *(_WORD *)&v78[8] = 2112;
            *(_QWORD *)&v78[10] = v66;
            v79 = 2112;
            v80 = v63;
            v64 = (void *)v63;
            v81 = 2112;
            v82 = (uint64_t)v42;
            v83 = 2112;
            v84 = v69;
            _os_log_debug_impl(&dword_21A2A0000, log, OS_LOG_TYPE_DEBUG, "%s These 2 spans are considered the same per ASR timing info. spanTopAsr=[%@], spanAltAsr=[%@], label=[%@], asrTiming{Begin/End}=%@/%@", buf, 0x3Eu);

          }
          v51 = 1;
        }
        else
        {
          CDMOSLoggerForCategory(0);
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "input");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "input");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "label");
            v61 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316930;
            v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
            v77 = 2112;
            *(_QWORD *)v78 = v67;
            *(_WORD *)&v78[8] = 2112;
            *(_QWORD *)&v78[10] = v65;
            v79 = 2112;
            v80 = v61;
            v62 = (void *)v61;
            v81 = 2112;
            v82 = (uint64_t)v42;
            v83 = 2112;
            v84 = v69;
            v85 = 2112;
            v86 = v74;
            v87 = 2112;
            v88 = v72;
            _os_log_debug_impl(&dword_21A2A0000, log, OS_LOG_TYPE_DEBUG, "%s These 2 spans are NOT considered the same per ASR timing info. spanTopAsr=[%@], spanAltAsr=[%@], label=[%@], spanAAsrTiming{Begin/End}=%@/%@, spanBAsrTiming{Begin/End}=%@/%@", buf, 0x52u);

          }
          v51 = 0;
        }

      }
      else
      {
        v51 = 0;
        v50 = v74;
        v44 = v69;
      }

    }
    else
    {
      v51 = 0;
      v50 = 0;
      v44 = v69;
    }

  }
  else
  {
    v51 = 0;
  }

LABEL_29:
  return v51;
}

+ (double)calculateAsrConfidenceForCharIndexBegin:(int64_t)a3 charIndexEnd:(int64_t)a4 asrTimingMap:(id)a5 asrHypothesis:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  double v28;
  __int128 v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  double v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (objc_msgSend(v10, "asrTokensCount"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0.0;
    if (v12 && v14)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v10, "asrTokens");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      v15 = -1.0;
      if (v17)
      {
        v19 = v17;
        v31 = v9;
        v20 = 0;
        v21 = *(_QWORD *)v33;
        v22 = 0.0;
        *(_QWORD *)&v18 = 136315394;
        v30 = v18;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v16);
            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if (!objc_msgSend(v24, "hasConfidenceScore", v30))
              goto LABEL_20;
            v25 = objc_msgSend(v24, "startMilliSeconds");
            if (v25 >= (int)objc_msgSend(v12, "intValue"))
            {
              v26 = objc_msgSend(v24, "endMilliSeconds");
              if (v26 > (int)objc_msgSend(v14, "intValue"))
                goto LABEL_17;
              CDMOSLoggerForCategory(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v30;
                v37 = "+[CDMSpanMatchUtils calculateAsrConfidenceForCharIndexBegin:charIndexEnd:asrTimingMap:asrHypothesis:]";
                v38 = 2112;
                v39 = *(double *)&v24;
                _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s Average ASR confidence calculation includes token=%@", buf, 0x16u);
              }

              objc_msgSend(v24, "confidenceScore");
              v22 = v22 + v28;
              ++v20;
            }
          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v19)
            continue;
          break;
        }
LABEL_17:

        if (v20)
        {
          CDMOSLoggerForCategory(0);
          v16 = objc_claimAutoreleasedReturnValue();
          v15 = v22 / (double)v20;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            v37 = "+[CDMSpanMatchUtils calculateAsrConfidenceForCharIndexBegin:charIndexEnd:asrTimingMap:asrHypothesis:]";
            v38 = 2048;
            v39 = v22 / (double)v20;
            _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Average ASR confidence is %f", buf, 0x16u);
          }
LABEL_20:
          v9 = v31;
          goto LABEL_21;
        }
        v15 = -1.0;
        v9 = v31;
      }
      else
      {
LABEL_21:

      }
    }

  }
  else
  {
    v15 = -1.0;
  }

  return v15;
}

+ (BOOL)matcherNameIsSupportedForAsrAlternative:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_VOCABULARY_MATCHER")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("VOC_TRIE_MATCHER"));

  return v4;
}

+ (void)addAsrConfidenceToSpans:(id)a3 tokenChain:(id)a4 asrTimingMap:(id)a5 asrHypothesis:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  float v49;
  uint64_t i;
  void *v51;
  id v52;
  void *v53;
  id v54;
  double v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a1;
  v63 = v12;
  v62 = a6;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v74;
    v60 = v14;
    v61 = v13;
    v64 = v11;
    v59 = *(_QWORD *)v74;
    while (2)
    {
      v18 = 0;
      v66 = v16;
      do
      {
        if (*(_QWORD *)v74 != v17)
          objc_enumerationMutation(v14);
        v68 = v18;
        v19 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v18);
        v20 = *(unsigned int *)objc_msgSend(v19, "matcherNames");
        if (v20 >= 9)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = off_24DCAD0B0[v20];
        }
        if (objc_msgSend(v13, "matcherNameIsSupportedForAsrAlternative:", v21))
        {
          if (objc_msgSend(v19, "hasUsoGraph"))
          {
            objc_msgSend(v19, "usoGraph");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "identifiers");
            v67 = v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            v21 = v67;
            v16 = v66;
            if (v24)
            {
              objc_msgSend(v11, "tokens");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v19, "startTokenIndex"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "begin");

              objc_msgSend(v11, "tokens");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v19, "endTokenIndex") - 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "end");

              CDMOSLoggerForCategory(0);
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v19, "label");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "input");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v79 = "+[CDMSpanMatchUtils addAsrConfidenceToSpans:tokenChain:asrTimingMap:asrHypothesis:]";
                v80 = 2112;
                v81 = v56;
                v82 = 2112;
                v83 = v57;
                _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, "%s Annotating ASR confidence on span label=%@, matchedText=%@", buf, 0x20u);

                v13 = v61;
              }

              objc_msgSend(v13, "calculateAsrConfidenceForCharIndexBegin:charIndexEnd:asrTimingMap:asrHypothesis:", v27, v30, v63, v62);
              if (v32 == -1.0)
              {
                CDMOSLoggerForCategory(0);
                v58 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315138;
                  v79 = "+[CDMSpanMatchUtils addAsrConfidenceToSpans:tokenChain:asrTimingMap:asrHypothesis:]";
                  _os_log_debug_impl(&dword_21A2A0000, v58, OS_LOG_TYPE_DEBUG, "%s ASR confidence is missing on one or more ASR tokens, not annotating the span", buf, 0xCu);
                }

                goto LABEL_31;
              }
              v33 = v32;
              objc_msgSend(v19, "usoGraph");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "identifiers");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "usoGraph");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "identifiers");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "input");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v36, "nodeIndex");
              objc_msgSend(v36, "backingAppBundleId");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v36;
              v42 = v36;
              v11 = v64;
              +[CDMSpanMatchUtils createAsrAlternativeIdentifier:nameSpace:nodeIndex:backingAppBundleId:sourceComponent:asrConfidence:](CDMSpanMatchUtils, "createAsrAlternativeIdentifier:nameSpace:nodeIndex:backingAppBundleId:sourceComponent:asrConfidence:", v39, CFSTR("asr_alternative"), v40, v41, objc_msgSend(v42, "sourceComponent"), v33);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v43);

              if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
              {
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                objc_msgSend(v19, "usoGraph");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "spans");
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
                if (v46)
                {
                  v47 = v46;
                  v48 = *(_QWORD *)v70;
                  v49 = v33;
                  do
                  {
                    for (i = 0; i != v47; ++i)
                    {
                      if (*(_QWORD *)v70 != v48)
                        objc_enumerationMutation(v45);
                      v51 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                      v52 = objc_alloc_init(MEMORY[0x24BE9E070]);
                      objc_msgSend(v19, "input");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "setAlternative:", v53);

                      v54 = objc_alloc_init(MEMORY[0x24BE9E050]);
                      *(float *)&v55 = v49;
                      objc_msgSend(v54, "setValue:", v55);
                      objc_msgSend(v52, "setProbability:", v54);

                      objc_msgSend(v51, "addAlternatives:", v52);
                    }
                    v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
                  }
                  while (v47);
                }

                v11 = v64;
              }

              v14 = v60;
              v13 = v61;
              v17 = v59;
              v16 = v66;
              v21 = v67;
            }
          }
        }

        v18 = v68 + 1;
      }
      while (v68 + 1 != v16);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_31:

}

+ (id)createAsrAlternativeIdentifier:(id)a3 nameSpace:(id)a4 nodeIndex:(unsigned int)a5 backingAppBundleId:(id)a6 sourceComponent:(int)a7 asrConfidence:(double)a8
{
  uint64_t v9;
  uint64_t v10;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a5;
  v13 = (objc_class *)MEMORY[0x24BE9E170];
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(v13);
  v18 = objc_alloc_init(MEMORY[0x24BE9E060]);
  objc_msgSend(v18, "setValue:", v15);

  objc_msgSend(v17, "setNamespaceA:", v18);
  objc_msgSend(v17, "setValue:", v16);

  objc_msgSend(v17, "setNodeIndex:", v10);
  objc_msgSend(v17, "setBackingAppBundleId:", v14);

  objc_msgSend(v17, "setSourceComponent:", v9);
  v19 = objc_alloc_init(MEMORY[0x24BE9E048]);
  objc_msgSend(v19, "setValue:", a8);
  objc_msgSend(v17, "setProbability:", v19);

  return v17;
}

+ (void)mergeAsrAlternativeIntoSpan:(id)a3 asrAltSpan:(id)a4 asrAltCdmTokenChain:(id)a5 asrAltHypothesis:(id)a6 asrAltTimingMap:(id)a7
{
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  double v45;
  double v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  NSObject *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  NSObject *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((-[NSObject hasUsoGraph](v13, "hasUsoGraph") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      goto LABEL_41;
    *(_DWORD *)buf = 136315394;
    v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
    v70 = 2112;
    v71 = v13;
    v26 = "%s [WARN]: Did not expect asrAltSpan without USO graph. asrAltSpan=%@";
LABEL_17:
    _os_log_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_INFO, v26, buf, 0x16u);
    goto LABEL_41;
  }
  if ((-[NSObject hasUsoGraph](v12, "hasUsoGraph") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      goto LABEL_41;
    *(_DWORD *)buf = 136315394;
    v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
    v70 = 2112;
    v71 = v12;
    v26 = "%s [WARN]: Did not expect spanDest without USO graph. spanDest=%@";
    goto LABEL_17;
  }
  v59 = v16;
  v56 = v15;
  v57 = v14;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[NSObject usoGraph](v12, "usoGraph");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v65 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if (objc_msgSend(v24, "groupIndex") > v21)
          v21 = objc_msgSend(v24, "groupIndex");
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }
  v55 = a1;

  v27 = v21 + 1;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = v13;
  -[NSObject usoGraph](v13, "usoGraph");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identifiers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
  if (v30)
  {
    v31 = v30;
    v25 = 0;
    v32 = *(_QWORD *)v61;
    do
    {
      v33 = 0;
      v34 = v25;
      do
      {
        if (*(_QWORD *)v61 != v32)
          objc_enumerationMutation(v29);
        v35 = *(NSObject **)(*((_QWORD *)&v60 + 1) + 8 * v33);
        -[NSObject setGroupIndex:](v35, "setGroupIndex:", v27);
        -[NSObject usoGraph](v12, "usoGraph");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addIdentifiers:", v35);

        CDMOSLoggerForCategory(0);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
          v70 = 2112;
          v71 = v35;
          _os_log_debug_impl(&dword_21A2A0000, v37, OS_LOG_TYPE_DEBUG, "%s Copied to spanDest (i.e. top ASR's span), identifier:%@", buf, 0x16u);
        }

        v25 = v35;
        ++v33;
        v34 = v25;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v31);
  }
  else
  {
    v25 = 0;
  }

  v14 = v57;
  objc_msgSend(v57, "tokens");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v58;
  objc_msgSend(v38, "objectAtIndexedSubscript:", -[NSObject startTokenIndex](v58, "startTokenIndex"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "begin");

  objc_msgSend(v57, "tokens");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectAtIndexedSubscript:", -[NSObject endTokenIndex](v58, "endTokenIndex") - 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "end");

  CDMOSLoggerForCategory(0);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    -[NSObject label](v58, "label");
    v53 = objc_claimAutoreleasedReturnValue();
    -[NSObject input](v58, "input");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
    v70 = 2112;
    v71 = v53;
    v72 = 2112;
    v73 = v54;
    _os_log_debug_impl(&dword_21A2A0000, v44, OS_LOG_TYPE_DEBUG, "%s Annotating ASR confidence on span label=%@, matchedText=%@", buf, 0x20u);

    v13 = v58;
  }

  v15 = v56;
  v16 = v59;
  objc_msgSend(v55, "calculateAsrConfidenceForCharIndexBegin:charIndexEnd:asrTimingMap:asrHypothesis:", v40, v43, v59, v56);
  v46 = v45;
  if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
    objc_msgSend(v55, "addEntitySpansFrom:to:confidence:", v13, v12, v46);
  if (v46 == -1.0)
  {
    CDMOSLoggerForCategory(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
      _os_log_debug_impl(&dword_21A2A0000, v47, OS_LOG_TYPE_DEBUG, "%s ASR confidence is missing on one or more ASR tokens, not annotating the span", buf, 0xCu);
    }
  }
  else
  {
    -[NSObject input](v13, "input");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[NSObject nodeIndex](v25, "nodeIndex");
    -[NSObject backingAppBundleId](v25, "backingAppBundleId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSpanMatchUtils createAsrAlternativeIdentifier:nameSpace:nodeIndex:backingAppBundleId:sourceComponent:asrConfidence:](CDMSpanMatchUtils, "createAsrAlternativeIdentifier:nameSpace:nodeIndex:backingAppBundleId:sourceComponent:asrConfidence:", v48, CFSTR("asr_alternative"), v49, v50, -[NSObject sourceComponent](v25, "sourceComponent"), v46);
    v47 = objc_claimAutoreleasedReturnValue();

    -[NSObject setGroupIndex:](v47, "setGroupIndex:", v27);
    -[NSObject usoGraph](v12, "usoGraph");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addIdentifiers:", v47);

    CDMOSLoggerForCategory(0);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
      v70 = 2112;
      v71 = v47;
      _os_log_debug_impl(&dword_21A2A0000, v52, OS_LOG_TYPE_DEBUG, "%s Added an extra asr_alternative to spanDest (i.e. top ASR's span), asrAltIdentifier:%@", buf, 0x16u);
    }

    v16 = v59;
  }

LABEL_41:
}

+ (void)addEntitySpansFrom:(id)a3 to:(id)a4 confidence:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "usoGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spans");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v28;
    *(_QWORD *)&v13 = 136315394;
    v26 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v19 = (void *)objc_msgSend(v18, "copy", v26);
        v20 = objc_alloc_init(MEMORY[0x24BE9E070]);
        objc_msgSend(v7, "input");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAlternative:", v21);

        if (a5 != -1.0)
        {
          v22 = objc_alloc_init(MEMORY[0x24BE9E050]);
          v16 = a5;
          *(float *)&v23 = v16;
          objc_msgSend(v22, "setValue:", v23);
          objc_msgSend(v20, "setProbability:", v22);

        }
        objc_msgSend(v19, "addAlternatives:", v20);
        objc_msgSend(v8, "usoGraph");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSpans:", v19);

        CDMOSLoggerForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          v32 = "+[CDMSpanMatchUtils addEntitySpansFrom:to:confidence:]";
          v33 = 2112;
          v34 = v18;
          _os_log_debug_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_DEBUG, "%s Copied to spanDest (i.e. top ASR's span), usoEntitySpan:%@", buf, 0x16u);
        }

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v14);
  }

}

+ (BOOL)isSpanOnlyForExternalParsers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "hasUsoGraph"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = v3;
    objc_msgSend(v3, "usoGraph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v48;
      v9 = *MEMORY[0x24BEA3938];
      v10 = *MEMORY[0x24BEA38B0];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToString:", v9) & 1) != 0)
          {
            objc_msgSend(v12, "namespaceA");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v10);

            if ((v16 & 1) != 0)
            {
LABEL_36:
              v32 = 1;
              goto LABEL_37;
            }
          }
          else
          {

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v7)
          continue;
        break;
      }
    }

    if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v37, "usoGraph");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "spans");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v35)
      {
        v18 = *(_QWORD *)v44;
        v19 = *MEMORY[0x24BEA3938];
        v38 = *MEMORY[0x24BEA38B0];
        v34 = *(_QWORD *)v44;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v44 != v18)
              objc_enumerationMutation(v5);
            v36 = v20;
            v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v20);
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            objc_msgSend(v21, "properties");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v40;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v40 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                  if (objc_msgSend(v27, "hasValueString"))
                  {
                    objc_msgSend(v27, "valueString");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "value");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v29, "isEqualToString:", v19) & 1) != 0)
                    {
                      objc_msgSend(v27, "key");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = objc_msgSend(v30, "isEqualToString:", v38);

                      if ((v31 & 1) != 0)
                      {

                        goto LABEL_36;
                      }
                    }
                    else
                    {

                    }
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
              }
              while (v24);
            }

            v20 = v36 + 1;
            v18 = v34;
          }
          while (v36 + 1 != v35);
          v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v35);
      }
      v32 = 0;
LABEL_37:

    }
    else
    {
      v32 = 0;
    }
    v3 = v37;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (void)setAsrHypothesisIndexForTopAsrSpans:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasUsoGraph"))
        {
          objc_msgSend(v8, "usoGraph");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "alignments");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v19 = 0u;
            v20 = 0u;
            v17 = 0u;
            v18 = 0u;
            objc_msgSend(v8, "usoGraph", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "alignments");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v18;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v18 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "setAsrHypothesisIndex:", 0);
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              }
              while (v14);
            }

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

}

+ (void)processAsrAlternative:(id)a3 topAsrTokenChain:(id)a4 cdmTokenChainAltAsr:(id)a5 asrMapTopAsr:(id)a6 asrMapAltAsr:(id)a7 spansTopAsr:(id)a8 asrHypothesis:(id)a9
{
  id v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t spid;
  unint64_t v38;
  id obj;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v46 = a4;
  v48 = a5;
  v45 = a6;
  v47 = a7;
  v41 = a8;
  v44 = a9;
  v15 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v16 = (id)CDMLogContext;
  v17 = v16;
  v38 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SpanMatcher", "Post-process one ASR alternative", buf, 2u);
  }
  spid = v15;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v14;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v42)
  {
    v40 = *(_QWORD *)v55;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v55 != v40)
          objc_enumerationMutation(obj);
        v43 = v18;
        v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v18);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v49 = v41;
        v20 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v51;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v51 != v22)
                objc_enumerationMutation(v49);
              v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v23);
              objc_msgSend(v19, "label");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "label");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v25, "isEqualToString:", v26) & 1) == 0)
                goto LABEL_17;
              objc_msgSend(v19, "input");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "input");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v27, "isEqualToString:", v28) & 1) != 0)
              {

LABEL_17:
                goto LABEL_18;
              }
              v29 = +[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:](CDMSpanMatchUtils, "isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:", v24, v19, v45, v47, v46, v48);

              if (v29)
              {
                CDMOSLoggerForCategory(0);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v24, "input");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "input");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "label");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  v59 = "+[CDMSpanMatchUtils processAsrAlternative:topAsrTokenChain:cdmTokenChainAltAsr:asrMapTopAsr:asrM"
                        "apAltAsr:spansTopAsr:asrHypothesis:]";
                  v60 = 2112;
                  v61 = v31;
                  v62 = 2112;
                  v63 = v32;
                  v64 = 2112;
                  v65 = v33;
                  _os_log_debug_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_DEBUG, "%s Updating UsoEntityIdentifier as these 2 spans have 1) Same spanLabel 2) Different input value 3) AND are considered the same per ASR timing info. spanTopAsr=[%@], spanAltAsr=[%@], label=[%@]", buf, 0x2Au);

                }
                +[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:](CDMSpanMatchUtils, "mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:", v24, v19, v48, v44, v47);
              }
LABEL_18:
              ++v23;
            }
            while (v21 != v23);
            v34 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
            v21 = v34;
          }
          while (v34);
        }

        v18 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v42);
  }

  v35 = (id)CDMLogContext;
  v36 = v35;
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v36, OS_SIGNPOST_INTERVAL_END, spid, "SpanMatcher", ", buf, 2u);
  }

}

+ (void)postProcessSpans:(id)a3 asrSpansMap:(id)a4 asrHypothesis:(id)a5 asrMaps:(id)a6 topAsrTokenChain:(id)a7 asrMapTopAsr:(id)a8 topAsrSpansFiltered:(id)a9
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  CDMTokenChain *v27;
  void *v28;
  CDMTokenChain *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  unint64_t v35;
  void *v36;
  double v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t spid;
  unint64_t v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v48 = a4;
  v15 = a5;
  v47 = a6;
  v46 = a7;
  v45 = a8;
  v16 = a9;
  if ((unint64_t)objc_msgSend(v14, "count") > 1)
  {
    v19 = objc_msgSend(v14, "count");
    v20 = objc_msgSend(v15, "count");
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v19 == v20)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAs"
              "rSpansFiltered:]";
        _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Processing ASR alternatives 2..n", buf, 0xCu);
      }

      v22 = os_signpost_id_generate((os_log_t)CDMLogContext);
      v23 = (id)CDMLogContext;
      v24 = v23;
      v43 = v22 - 1;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SpanMatcher", "Post-process ASR alternative(s)", buf, 2u);
      }
      spid = v22;

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v44 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      {
        v25 = 1;
        do
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = [CDMTokenChain alloc];
          objc_msgSend(v26, "tokenChain");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[CDMTokenChain initWithProtoTokenChain:](v27, "initWithProtoTokenChain:", v28);

          objc_msgSend(v26, "asrId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "asrId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKey:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          CDMOSLoggerForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = v25 + 1;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:t"
                  "opAsrSpansFiltered:]";
            v51 = 1024;
            LODWORD(v52) = v25 + 1;
            _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s Processing spans from ASR alt #%d", buf, 0x12u);
          }

          objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMSpanMatchUtils processAsrAlternative:topAsrTokenChain:cdmTokenChainAltAsr:asrMapTopAsr:asrMapAltAsr:spansTopAsr:asrHypothesis:](CDMSpanMatchUtils, "processAsrAlternative:topAsrTokenChain:cdmTokenChainAltAsr:asrMapTopAsr:asrMapAltAsr:spansTopAsr:asrHypothesis:", v33, v46, v29, v45, v31, v16, v36, spid);

          v25 = v35;
        }
        while (objc_msgSend(v14, "count") > v35);
      }
      v17 = v44;
      -[NSObject timeIntervalSinceNow](v44, "timeIntervalSinceNow");
      v38 = v37;
      CDMOSLoggerForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAs"
              "rSpansFiltered:]";
        v51 = 2048;
        v52 = -v38;
        _os_log_debug_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_DEBUG, "%s Done post-processing ASR alternatives, took %f sec", buf, 0x16u);
      }

      v40 = (id)CDMLogContext;
      v41 = v40;
      if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v41, OS_SIGNPOST_INTERVAL_END, spid, "SpanMatcher", ", buf, 2u);
      }

    }
    else if (v21)
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAsrSpansFiltered:]";
      v18 = "%s Span match requests and ASR hypothesis counts are not equal, skipping span matching for ASR alternatives";
      goto LABEL_18;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAsrSpansFiltered:]";
      v18 = "%s Moving on as there are no ASR alternatives to process";
LABEL_18:
      _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
    }
  }

}

@end
