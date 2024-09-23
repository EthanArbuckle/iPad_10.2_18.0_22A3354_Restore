@implementation SGGuessNamingTradition

void __SGGuessNamingTradition_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  __objc2_class **v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  __CFString *v18;
  void *v19;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v23;
  int64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  CFIndex v29;
  UniChar v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  CFIndex v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  float v54;
  double v55;
  const __CFString *v56;
  void *v57;
  CFIndex v58;
  const UniChar *v59;
  const char *v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  UniChar v64;
  uint64_t v65;
  CFIndex v66;
  int64_t v67;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  CFIndex v72;
  void *v73;
  void *v74;
  void *v75;
  float v76;
  void *v77;
  uint64_t v78;
  void *v79;
  __objc2_class *v80;
  void *v81;
  void *v82;
  void *v83;
  unint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  float v88;
  void *v89;
  void *v90;
  float v91;
  unint64_t v92;
  void *v93;
  void *v94;
  float v95;
  __CFString *v96;
  int v97;
  int v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t i;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  int v112;
  int v113;
  int v114;
  uint64_t v115;
  char v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  id v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *context;
  __CFString *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  UniChar buffer[8];
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  CFStringRef theString;
  const UniChar *v163;
  const char *v164;
  uint64_t v165;
  CFIndex v166;
  int64_t v167;
  int64_t v168;
  uint64_t v169;
  CFRange v170;
  CFRange v171;

  v169 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    LODWORD(v6) = objc_msgSend(v4, "intValue");
    goto LABEL_3;
  }
  v7 = *(id *)(a1 + 32);
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  if (objc_msgSend(v7, "length"))
  {
    chineseCharSet();
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    hangulCharSet();
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    japaneseCharSet();
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    if (latinCharSet_onceToken != -1)
      dispatch_once(&latinCharSet_onceToken, &__block_literal_global_146);
    v140 = (id)latinCharSet_result;
    if (cyrillicCharSet_onceToken != -1)
      dispatch_once(&cyrillicCharSet_onceToken, &__block_literal_global_154_14539);
    v139 = (id)cyrillicCharSet_result;
    if (thaiCharSet_onceToken != -1)
      dispatch_once(&thaiCharSet_onceToken, &__block_literal_global_155_14540);
    v138 = (id)thaiCharSet_result;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = off_1E7DA6000;
    +[SGNames cjkSpacerCharacters](SGNames, "cjkSpacerCharacters");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "rangeOfString:options:", CFSTR(","), 2);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v7;
    }
    else
    {
      objc_msgSend(v7, "substringFromIndex:", v11 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    v132 = v12;
    v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v9);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "substringToIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[SGNames isCommonVietnameseSurname:](SGNames, "isCommonVietnameseSurname:", v15);

      if (v16)
      {
        v6 = 3;
        v17 = v132;
LABEL_142:

        goto LABEL_143;
      }
    }
    v18 = (__CFString *)v7;
    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v124 = v7;
    v123 = v8;
    v136 = v9;
    if (v19)
    {
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      *(_OWORD *)buffer = 0u;
      v155 = 0u;
      Length = CFStringGetLength(v18);
      theString = v18;
      v165 = 0;
      v166 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v18);
      CStringPtr = 0;
      v163 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v18, 0x600u);
      v144 = v3;
      v167 = 0;
      v168 = 0;
      v164 = CStringPtr;
      if (Length < 1)
      {
        v148 = 0;
        v149 = 0;
        v147 = 0;
        v26 = 0;
        v25 = 0;
      }
      else
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v147 = 0;
        v148 = 0;
        v149 = 0;
        v27 = 64;
        do
        {
          if ((unint64_t)v24 >= 4)
            v28 = 4;
          else
            v28 = v24;
          v29 = v166;
          if (v166 <= v24)
          {
            v30 = 0;
          }
          else if (v163)
          {
            v30 = v163[v24 + v165];
          }
          else if (v164)
          {
            v30 = v164[v165 + v24];
          }
          else
          {
            v32 = v167;
            if (v168 <= v24 || v167 > v24)
            {
              v34 = v28 + v23;
              v35 = v27 - v28;
              v36 = v24 - v28;
              v37 = v36 + 64;
              if (v36 + 64 >= v166)
                v37 = v166;
              v167 = v36;
              v168 = v37;
              if (v166 >= v35)
                v29 = v35;
              v170.length = v29 + v34;
              v170.location = v36 + v165;
              CFStringGetCharacters(theString, v170, buffer);
              v32 = v167;
            }
            v30 = buffer[v24 - v32];
          }
          v31 = v30;
          HIDWORD(v148) += objc_msgSend(v143, "characterIsMember:", v31);
          LODWORD(v149) = v149 + objc_msgSend(v142, "characterIsMember:", v31);
          HIDWORD(v149) += objc_msgSend(v141, "characterIsMember:", v31);
          v25 += objc_msgSend(v138, "characterIsMember:", v31);
          LODWORD(v148) = v148 + objc_msgSend(v140, "characterIsMember:", v31);
          HIDWORD(v147) += objc_msgSend(v136, "characterIsMember:", v31);
          LODWORD(v147) = v147 + objc_msgSend(v137, "characterIsMember:", v31);
          v26 += objc_msgSend(v139, "characterIsMember:", v31);
          ++v24;
          --v23;
          ++v27;
        }
        while (Length != v24);
      }
      v122 = v26;
      v3 = v144;
      v10 = off_1E7DA6000;
    }
    else
    {
      v148 = 0;
      v149 = 0;
      v147 = 0;
      v122 = 0;
      v25 = 0;
    }

    v38 = v18;
    context = (void *)MEMORY[0x1C3BD4F6C]();
    patterns_14444();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "rawValueForKey:", CFSTR("SpanishNameClassifierConfidenceThreshold"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "floatValue");
    v43 = v42;

    patterns_14444();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rawValueForKey:", CFSTR("SpanishNameCharacterIndicators"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    patterns_14444();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "rawValueForKey:", CFSTR("SpanishNameUnigramIndicators"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    patterns_14444();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "rawValueForKey:", CFSTR("SpanishNameBigramIndicators"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    patterns_14444();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "rawValueForKey:", CFSTR("TwoCharSpanishNameEndings"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    patterns_14444();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "rawValueForKey:", CFSTR("SpanishNameLocaleIndicators"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localeIdentifier");
    v51 = objc_claimAutoreleasedReturnValue();

    v128 = (void *)v51;
    v129 = v49;
    objc_msgSend(v49, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
    {
      objc_msgSend(v52, "floatValue");
      v55 = v54 + 0.0;
    }
    else
    {
      v55 = 0.0;
    }
    v56 = v38;
    objc_opt_self();
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v131 = (__CFString *)v56;
    v125 = a1;
    if (v57)
    {
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      *(_OWORD *)buffer = 0u;
      v155 = 0u;
      v58 = CFStringGetLength(v56);
      theString = v56;
      v165 = 0;
      v166 = v58;
      v59 = CFStringGetCharactersPtr(v56);
      v60 = 0;
      v163 = v59;
      if (!v59)
        v60 = CFStringGetCStringPtr(v56, 0x600u);
      v167 = 0;
      v168 = 0;
      v164 = v60;
      if (v58 >= 1)
      {
        v61 = 0;
        v62 = 0;
        v63 = 64;
        do
        {
          v64 = 0;
          if ((unint64_t)v62 >= 4)
            v65 = 4;
          else
            v65 = v62;
          LOWORD(v150) = 0;
          v66 = v166;
          if (v166 > v62)
          {
            if (v163)
            {
              v64 = v163[v62 + v165];
            }
            else if (v164)
            {
              v64 = v164[v165 + v62];
            }
            else
            {
              v67 = v167;
              if (v168 <= v62 || v167 > v62)
              {
                v69 = v65 + v61;
                v70 = v63 - v65;
                v71 = v62 - v65;
                v72 = v71 + 64;
                if (v71 + 64 >= v166)
                  v72 = v166;
                v167 = v71;
                v168 = v72;
                if (v166 >= v70)
                  v66 = v70;
                v171.length = v66 + v69;
                v171.location = v71 + v165;
                CFStringGetCharacters(theString, v171, buffer);
                v67 = v167;
              }
              v64 = buffer[v62 - v67];
            }
          }
          LOWORD(v150) = v64;
          v73 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v150, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "objectForKeyedSubscript:", v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            objc_msgSend(v75, "floatValue");
            v55 = v55 + v76;
          }

          objc_autoreleasePoolPop(v73);
          ++v62;
          --v61;
          ++v63;
        }
        while (v58 != v62);
      }
      v10 = off_1E7DA6000;
    }

    -[__objc2_class cleanName:](v10[21], "cleanName:", v131);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "lowercaseString");
    v78 = objc_claimAutoreleasedReturnValue();

    v127 = (void *)v78;
    -[__objc2_class stripAndReturnHonorifics:](v10[21], "stripAndReturnHonorifics:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v10[21];
    v126 = v79;
    objc_msgSend(v79, "objectAtIndexedSubscript:", 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class handleLastNameFirstOrder:](v80, "handleLastNameFirstOrder:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    tokenizeNameAfterWhitespaceNormalization(v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v83, "count"))
    {
      v84 = 0;
      do
      {
        v85 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v83, "objectAtIndexedSubscript:", v84);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "objectForKeyedSubscript:", v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        if (v87)
        {
          objc_msgSend(v87, "floatValue");
          v55 = v55 + v88;
        }
        if ((unint64_t)objc_msgSend(v86, "length") >= 3)
        {
          objc_msgSend(v86, "substringFromIndex:", objc_msgSend(v86, "length") - 2);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "objectForKeyedSubscript:", v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
          {
            objc_msgSend(v90, "floatValue");
            v55 = v55 + v91;
            v87 = v90;
          }
          else
          {
            v87 = 0;
          }
        }
        v92 = v84 + 1;
        if (objc_msgSend(v83, "count") <= v84 + 1)
        {
          v53 = v87;
        }
        else
        {
          objc_msgSend(v83, "subarrayWithRange:", v84, 2);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "_pas_componentsJoinedByString:", CFSTR(" "));
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v134, "objectForKeyedSubscript:", v94);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            objc_msgSend(v53, "floatValue");
            v55 = v55 + v95;
          }

        }
        objc_autoreleasePoolPop(v85);
        v84 = v92;
      }
      while (objc_msgSend(v83, "count") > v92);
    }

    objc_autoreleasePoolPop(context);
    v96 = v131;

    if ((forcePreferChinese & 1) != 0)
    {
      v97 = 0;
      v98 = 1;
LABEL_115:
      v17 = v132;
      goto LABEL_116;
    }
    v17 = v132;
    if ((forcePreferJapanese & 1) != 0)
    {
      v98 = 0;
      v97 = 1;
LABEL_116:
      v111 = -[__CFString length](v96, "length");
      v112 = (int)v149 > 0;
      if (SHIDWORD(v148) > 0)
        ++v112;
      if (SHIDWORD(v149) > 0)
        ++v112;
      v113 = v25;
      if (v25 <= 0)
        v114 = 0;
      else
        v114 = -1;
      if (v112 == v114 || (int)v148 <= 0)
      {
        v115 = v111 - SHIDWORD(v147);
        if (v115 == (_DWORD)v147 + HIDWORD(v148) + HIDWORD(v149))
        {
          v5 = 0;
          v8 = v123;
          v9 = v136;
          if ((SHIDWORD(v149) > 0) | v97 & (v98 ^ 1) & 1)
          {
            v6 = 2;
            a1 = v125;
            v7 = v124;
          }
          else
          {
            v116 = v98 ^ 1 | v97;
            v6 = 1;
            a1 = v125;
            v7 = v124;
            if ((v116 & 1) != 0)
            {
              if ((int)v147 + HIDWORD(v147) < 1)
                v6 = 1;
              else
                v6 = 2;
            }
          }
        }
        else
        {
          v5 = 0;
          a1 = v125;
          v8 = v123;
          v7 = v124;
          v9 = v136;
          if (v115 == (_DWORD)v147 + HIDWORD(v148) + (_DWORD)v149)
          {
            v6 = 0;
          }
          else if ((double)(v113 + (int)v147) / (double)v115 <= 0.8)
          {
            if ((double)v122 / (double)v115 <= 0.5)
            {
              if (v55 <= v43)
                v6 = 8;
              else
                v6 = 7;
            }
            else
            {
              v6 = 4;
            }
          }
          else
          {
            v6 = 6;
          }
        }
      }
      else
      {
        v6 = 5;
        v5 = 0;
        a1 = v125;
        v8 = v123;
        v7 = v124;
        v9 = v136;
      }
      goto LABEL_142;
    }
    v146 = v3;
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v150, buffer, 16);
    if (v100)
    {
      v101 = v100;
      v102 = 0;
      v97 = 0;
      v103 = *(_QWORD *)v151;
      do
      {
        for (i = 0; i != v101; ++i)
        {
          if (*(_QWORD *)v151 != v103)
            objc_enumerationMutation(v99);
          v105 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * i);
          if ((objc_msgSend(v105, "hasPrefix:", CFSTR("zh")) & 1) != 0)
            v102 = 1;
          else
            v97 |= objc_msgSend(v105, "hasPrefix:", CFSTR("ja"));
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v150, buffer, 16);
      }
      while (v101);
    }
    else
    {
      v102 = 0;
      v97 = 0;
    }

    v106 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "localeIdentifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "componentsFromLocaleIdentifier:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v109, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v110, "isEqualToString:", CFSTR("CN")) & 1) != 0)
    {
      v3 = v146;
      v96 = v131;
    }
    else
    {
      v3 = v146;
      v96 = v131;
      if ((objc_msgSend(v110, "isEqualToString:", CFSTR("HK")) & 1) == 0
        && (objc_msgSend(v110, "isEqualToString:", CFSTR("MO")) & 1) == 0
        && (objc_msgSend(v110, "isEqualToString:", CFSTR("TW")) & 1) == 0)
      {
        v97 |= objc_msgSend(v110, "isEqualToString:", CFSTR("JP"));
        if ((v102 & 1) == 0)
        {
          v98 = 0;
          goto LABEL_114;
        }
      }
    }
    v98 = v97 ^ 1;
    v97 = 0;
LABEL_114:

    goto LABEL_115;
  }
  v6 = 8;
LABEL_143:
  objc_autoreleasePoolPop(v8);

  v117 = *(void **)(a1 + 32);
  if (v117 && (unint64_t)objc_msgSend(v117, "length") <= 0x3FF)
  {
    v118 = (void *)MEMORY[0x1C3BD4F6C]();
    if (objc_msgSend(*(id *)(a1 + 32), "_pas_retainsConmingledBackingStore"))
      v119 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", *(_QWORD *)(a1 + 32));
    else
      v119 = *(id *)(a1 + 32);
    v120 = v119;
    if ((unint64_t)objc_msgSend(v3, "count") >= 0x19)
      objc_msgSend(v3, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v121, v120);

    objc_autoreleasePoolPop(v118);
  }
LABEL_3:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

}

void __SGGuessNamingTradition_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 25);
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)SGGuessNamingTradition__pasExprOnceResult;
  SGGuessNamingTradition__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

@end
