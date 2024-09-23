@implementation WebTextIterator(DDExtensions)

- (uint64_t)dd_newQueryStopRange:()DDExtensions
{
  const __CFCharacterSet *Predefined;
  const __CFCharacterSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  int v14;
  int IsCharacterMember;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  CFStringRef v20;
  const __CFAllocator *alloc;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  v5 = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  v25 = DDScanQueryCreate();
  if ((objc_msgSend(a1, "atEnd") & 1) == 0)
  {
    alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = -1;
    do
    {
      v7 = v6++;
      v8 = objc_msgSend(a1, "currentTextLength");
      if (v8)
      {
        v9 = v8;
        v24 = v7;
        v26 = v6;
        v10 = objc_msgSend(a1, "currentTextPointer");
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        do
        {
          if (!CFCharacterSetIsCharacterMember(Predefined, *(_WORD *)(v10 + 2 * v11)))
          {
            v20 = CFStringCreateWithCharacters(alloc, (const UniChar *)objc_msgSend(a1, "currentTextPointer"), objc_msgSend(a1, "currentTextLength"));
            v6 = v26;
            DDScanQueryAddTextFragment();
            CFRelease(v20);
            goto LABEL_25;
          }
          IsCharacterMember = CFCharacterSetIsCharacterMember(v5, *(_WORD *)(v10 + 2 * v11));
          v16 = *(unsigned __int16 *)(v10 + 2 * v11);
          v17 = (v16 == 9) | v14;
          if (IsCharacterMember)
          {
            v17 = v14;
            v12 = 1;
          }
          if (v16 == 160)
            v14 = (v13 > 1) | v17;
          else
            v14 = v17;
          if (v16 == 160)
            ++v13;
          else
            v13 = 0;
          ++v11;
        }
        while (v9 != v11);
        if ((v12 & 1) != 0)
        {
          DDScanQueryAddLineBreak();
          v18 = v24;
          v6 = v26;
          if (!a3)
            goto LABEL_25;
          v19 = 4999;
        }
        else
        {
          DDScanQueryAddSeparator();
          v18 = v24;
          v6 = v26;
          if (!a3)
            goto LABEL_25;
          v19 = 9999;
        }
        if (v18 > v19)
          goto LABEL_27;
      }
      else
      {
        DDScanQueryAddSeparator();
        if (a3 && v7 > 999)
        {
LABEL_27:
          objc_msgSend(a1, "currentRange");
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          return v25;
        }
      }
LABEL_25:
      objc_msgSend(a1, "advance");
    }
    while ((objc_msgSend(a1, "atEnd") & 1) == 0);
  }
  return v25;
}

- (id)dd_collectDDRangesForQuery:()DDExtensions forResults:
{
  id v5;
  uint64_t v6;
  int QueryRangeForURLification;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t FragmentMetaData;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *context;
  id obj;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context = (void *)MEMORY[0x1A1AF30A0]();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v33)
  {
    v6 = 0;
    v31 = *(_QWORD *)v36;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        QueryRangeForURLification = DDResultGetQueryRangeForURLification();
        v9 = v8;
        v10 = (uint64_t)QueryRangeForURLification >> 16;
        FragmentMetaData = DDScanQueryGetFragmentMetaData();
        v12 = FragmentMetaData;
        if (v6 < FragmentMetaData)
        {
          v13 = FragmentMetaData - v6;
          do
          {
            objc_msgSend(a1, "advance");
            --v13;
          }
          while (v13);
          v6 = v12;
        }
        objc_msgSend(a1, "currentRange");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[DDRange rangeWithDOMRange:](DDRange, "rangeWithDOMRange:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v15, 0);
        objc_msgSend(v15, "node");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if (v10 < (uint64_t)v9 >> 16)
        {
          v19 = (uint64_t)v9 >> 16;
          do
          {
            ++v10;
            v20 = DDScanQueryGetFragmentMetaData();
            v21 = v20;
            if (v6 < v20)
            {
              v22 = v20 - v6;
              do
              {
                objc_msgSend(a1, "advance");
                --v22;
              }
              while (v22);
              v6 = v21;
            }
            objc_msgSend(a1, "currentRange");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[DDRange rangeWithDOMRange:](DDRange, "rangeWithDOMRange:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v24);

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v15, "node");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

            }
            else
            {
              isKindOfClass = 0;
            }
          }
          while (v10 != v19);
        }
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v32, "addObject:", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v26);

        }
        ++v34;
      }
      while (v34 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v33);
  }

  objc_autoreleasePoolPop(context);
  v27 = v32;

  return v27;
}

- (id)dd_doUrlificationForQuery:()DDExtensions forResults:referenceDate:document:DOMWasModified:relevantResults:URLificationBlock:
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  const __CFString *Type;
  void *SubResults;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  CFTimeZoneRef v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t QueryRangeForURLification;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  int v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  unsigned int v113;
  __CFString *v114;
  id v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  BOOL v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  BOOL v126;
  uint64_t v128;
  uint64_t MatchedString;
  uint64_t v130;
  void *v131;
  id v133;
  CFTimeZoneRef cf;
  void *context;
  BOOL v136;
  uint64_t v137;
  void (**v138)(id, uint64_t, uint64_t, id, CFTypeRef);
  id v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v146;
  uint64_t v147;
  void *v148;
  char v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  char v161;
  void *v162;
  BOOL v163;
  id v164;
  void *v165;
  void *v166;
  BOOL v167;
  id v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v173;
  id obj;
  id v175;
  unsigned __int8 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v139 = a5;
  v146 = a6;
  v138 = a9;
  v133 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v175 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v177 = 0u;
  v178 = 0u;
  v179 = 0u;
  v180 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v181, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v178;
    v17 = (const __CFString *)*MEMORY[0x1E0D1CB58];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v178 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        Type = (const __CFString *)DDResultGetType();
        if (CFStringCompare(Type, v17, 0))
        {
          objc_msgSend(v175, "addObject:", v19);
          objc_msgSend(v12, "addObject:", v20);
        }
        else
        {
          SubResults = (void *)DDResultGetSubResults();
          objc_msgSend(v175, "addObjectsFromArray:", SubResults);
          if (objc_msgSend(SubResults, "count"))
          {
            v23 = 0;
            do
            {
              objc_msgSend(v20, "indexPathByAddingIndex:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v24);

              ++v23;
            }
            while (v23 < objc_msgSend(SubResults, "count"));
          }
        }
        ++v15;

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v181, 16);
    }
    while (v14);
  }

  v25 = v175;
  objc_msgSend(a1, "dd_collectDDRangesForQuery:forResults:", a3, v175);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v133;
  if (!v26)
  {
    v124 = v133;
    v125 = 0;
    goto LABEL_131;
  }
  v28 = objc_msgSend(v175, "count");
  if (objc_msgSend(v26, "count") == v28)
  {
    v29 = CFTimeZoneCopyDefault();
    if (v28)
    {
      cf = v29;
      v30 = 0;
      v158 = 0;
      v136 = 0;
      v163 = 0;
      v31 = 0;
      v170 = 0;
      v168 = 0;
      v32 = 0;
      v33 = 4294901760;
      v130 = v28;
      v131 = v26;
      do
      {
        v34 = objc_msgSend(v25, "objectAtIndex:", v32, v128, MatchedString);
        v153 = v32;
        objc_msgSend(v26, "objectAtIndex:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = v35;
        LODWORD(v35) = objc_msgSend(v35, "isEqual:", v36);

        if ((_DWORD)v35)
        {
          if ((dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__didLog & 1) == 0)
          {
            v128 = v34;
            DDLog();
            dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__didLog = 1;
          }
        }
        else
        {
          QueryRangeForURLification = DDResultGetQueryRangeForURLification();
          v39 = QueryRangeForURLification;
          v40 = (uint64_t)(int)v33 >> 16;
          v41 = (uint64_t)(int)QueryRangeForURLification >> 16;
          if ((int)v40 >= (int)v41 && ((int)v40 > (int)v41 || SHIDWORD(v33) >= SHIDWORD(QueryRangeForURLification)))
          {
            v128 = v34;
            MatchedString = DDResultGetMatchedString();
            DDLog();
          }
          else
          {
            v154 = v30;
            v42 = v28;
            v43 = v26;
            v44 = v25;
            v45 = v33;
            v151 = (uint64_t)(int)QueryRangeForURLification >> 16;
            v137 = v38;
            objc_msgSend(v12, "objectAtIndex:", v153);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "dd_stringValue");
            v47 = objc_claimAutoreleasedReturnValue();

            v144 = (void *)v47;
            v138[2](v138, v34, v47, v139, cf);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            if (v143)
            {
              objc_msgSend(v173, "objectAtIndex:", 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v173, "lastObject");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v142 = v48;
              objc_msgSend(v48, "node");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = v49;
              objc_msgSend(v49, "node");
              v51 = objc_claimAutoreleasedReturnValue();
              v52 = MEMORY[0x1A1AF30A0]();
              v176 = 0;
              v164 = v50;
              v150 = (id)v51;
              v53 = objc_msgSend(v50, "dd_searchForLinkRemovingExistingDDLinksWithEndNode:didModifyDOM:", v51, &v176);
              v30 = v154;
              v136 = (v176 | (v136 || (v53 & 1) == 0)) != 0;
              context = (void *)v52;
              if ((v53 & 1) != 0)
              {
                v54 = v158;
              }
              else
              {
                v55 = v151;
                v54 = v158;
                if (v151 <= (uint64_t)(int)v137 >> 16)
                {
                  v56 = (uint64_t)(int)v137 >> 16;
                  v140 = v39 >> 32;
                  v161 = 1;
                  v57 = v151;
                  v156 = v56;
                  do
                  {
                    objc_msgSend(v173, "objectAtIndex:", v57 - v55);
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v160, "node");
                    v58 = (id)objc_claimAutoreleasedReturnValue();
                    if (v57 > v56)
                      v56 = v57;
                    while (v56 != v57)
                    {
                      v59 = v57 + 1;
                      objc_msgSend(v173, "objectAtIndex:", 1 - v151 + v57);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "node");
                      v61 = (id)objc_claimAutoreleasedReturnValue();

                      v57 = v59;
                      if (v61 != v58)
                      {
                        v56 = v59 - 1;
                        break;
                      }
                    }
                    v62 = v168;
                    if (v168 == v58)
                    {
                      v65 = 0;
                    }
                    else
                    {
                      if (v163 && v168 != 0)
                      {
                        objc_msgSend(v31, "substringFromIndex:", v170);
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v168, "setData:", v63);

                      }
                      v64 = v58;

                      objc_msgSend(v64, "data");
                      v65 = objc_claimAutoreleasedReturnValue();
                      v170 = 0;
                      v31 = 0;
                      v163 = 0;
                      v62 = v64;
                    }
                    v171 = (void *)v65;
                    objc_msgSend(v58, "parentNode");
                    v169 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v58 == v164)
                      v66 = objc_msgSend(v142, "startOffset") + v140;
                    else
                      v66 = 0;
                    v168 = v62;
                    if (v58 == v150)
                    {
                      v67 = objc_msgSend(v141, "startOffset") + (v137 >> 32);
                      v68 = v54;
                    }
                    else if (v171)
                    {
                      v67 = objc_msgSend(v171, "length");
                      v68 = 0;
                    }
                    else
                    {
                      v69 = objc_msgSend(v31, "length");
                      v68 = 0;
                      v67 = v69 - v170;
                    }
                    v70 = v58 == v164 && v30 == v58;
                    v159 = v54;
                    if (v70)
                      v71 = v54;
                    else
                      v71 = 0;
                    v152 = v67;
                    v147 = v67 - v68;
                    if (v30 == v58)
                      v72 = v67 - v68;
                    else
                      v72 = v67;
                    if (!dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                      v73 = v72;
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "invertedSet");
                      v75 = objc_claimAutoreleasedReturnValue();
                      v76 = (void *)dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset;
                      dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset = v75;

                      v72 = v73;
                    }
                    v77 = v66 - v71;
                    v78 = *(_DWORD *)(*(_QWORD *)(a3 + 16) + 48 * v56 + 40);
                    v166 = v31;
                    if (v171)
                    {
                      v79 = v171;
                      v80 = v77;
                    }
                    else
                    {
                      v79 = v31;
                      v80 = v77 + v170;
                    }
                    v157 = v72;
                    v81 = v72 - v77;
                    v82 = v78 & 0x18000000;
                    v165 = v79;
                    v83 = objc_msgSend(v79, "rangeOfCharacterFromSet:options:range:", dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset, 0, v80, v81);
                    if (v84)
                    {
                      v85 = v30;
                      if ((v161 & 1) != 0)
                        v86 = v83 - v80;
                      else
                        v86 = 0;
                      v87 = v81 - v86;
                      v88 = v56 != v156 && v82 == 0;
                      v89 = !v88;
                      v149 = v89;
                      if (!v88)
                      {
                        if ((v161 & 1) != 0)
                          v90 = v83;
                        else
                          v90 = v80;
                        v91 = objc_msgSend(v165, "rangeOfCharacterFromSet:options:range:", dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset, 4, v90, v87);
                        v87 = v92 - v90 + v91;
                      }
                      v93 = v166;
                      v94 = v86 + v77;
                      v155 = v85;
                      v95 = v171;
                      v96 = v87;
                      if (v94)
                      {
                        if (v171)
                          objc_msgSend(v171, "substringToIndex:", v94);
                        else
                          objc_msgSend(v166, "substringWithRange:", v170, v94);
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v146, "createTextNode:", v98);
                        v99 = (void *)objc_claimAutoreleasedReturnValue();
                        v100 = (id)objc_msgSend(v169, "insertBefore:refChild:", v99, v58);

                        v93 = v166;
                        v87 = v96;
                      }
                      if (v171)
                      {
                        v101 = v93;
                        v93 = v171;
                        v102 = v94;
                      }
                      else
                      {
                        v102 = v94 + v170;
                        v101 = v93;
                      }
                      objc_msgSend(v93, "substringWithRange:", v102, v87);
                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v146, "createTextNode:", v148);
                      v103 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v146, "createElement:", CFSTR("a"));
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      v105 = v157;
                      v162 = (void *)v103;
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                      {
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          objc_msgSend(v104, "setDir:", CFSTR("ltr"));
                        objc_msgSend(v104, "setHref:", v143);
                        if (!v170)
                        {
                          v106 = v171 ? v171 : v101;
                          if (v96 == objc_msgSend(v106, "length"))
                          {
                            objc_msgSend(v168, "parentElement");
                            v107 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v107, "getAttributeNode:", CFSTR("color"));
                            v108 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v108)
                            {
                              objc_msgSend(v108, "style");
                              v109 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v109, "cssText");
                              v110 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v104, "setAttribute:value:", CFSTR("style"), v110);

                              v103 = (uint64_t)v162;
                              v101 = v166;

                            }
                            v95 = v171;
                            v105 = v157;
                          }
                        }
                      }
                      v111 = (id)objc_msgSend(v104, "appendChild:", v103);
                      v112 = (id)objc_msgSend(v169, "insertBefore:refChild:", v104, v58);
                      objc_msgSend(v104, "setAttribute:value:", CFSTR("x-apple-data-detectors"), CFSTR("true"));
                      v113 = DDResultGetCategory() - 1;
                      if (v113 > 4)
                        v114 = 0;
                      else
                        v114 = off_1E4258790[v113];
                      objc_msgSend(v104, "setAttribute:value:", CFSTR("x-apple-data-detectors-type"), v114);
                      objc_msgSend(v104, "setAttribute:value:", CFSTR("x-apple-data-detectors-result"), v144);
                      if (v95)
                      {
                        v31 = v101;
                        v115 = v155;
                        v116 = objc_msgSend(v95, "length");
                      }
                      else
                      {
                        v115 = v155;
                        v31 = v101;
                        v116 = objc_msgSend(v101, "length") - v170;
                      }
                      v167 = v105 < v116;
                      if (v105 < v116)
                      {
                        if (v163)
                        {
                          v170 += v105;
                        }
                        else if (v31 == v95)
                        {
                          v170 = v105;
                          v31 = v95;
                        }
                        else
                        {
                          v119 = v105;
                          v120 = objc_msgSend(v95, "copy");

                          v170 = v119;
                          v31 = (void *)v120;
                        }
                      }
                      else
                      {
                        objc_msgSend(v58, "data");
                        v117 = (void *)objc_claimAutoreleasedReturnValue();
                        v118 = objc_msgSend(v117, "length");

                        if (v118)
                          objc_msgSend(v58, "setData:", &stru_1E4259460);

                        v168 = 0;
                        v170 = 0;
                        v31 = 0;
                        v95 = v171;
                      }
                      if (v115 == v58)
                      {
                        v30 = v115;
                        v97 = v160;
                        v54 = v147 + v159;
                      }
                      else
                      {
                        v30 = v58;

                        v97 = v160;
                        v54 = v152;
                      }

                      v161 = v149;
                      v163 = v167;
                    }
                    else
                    {
                      v97 = v160;
                      v161 |= v82 != 0;
                      v31 = v166;
                      v54 = v159;
                      v95 = v171;
                    }

                    v57 = v56 + 1;
                    v121 = v56 < v156;
                    v56 = (uint64_t)(int)v137 >> 16;
                    v55 = v151;
                  }
                  while (v121);
                }
              }
              v158 = v54;
              objc_autoreleasePoolPop(context);

              v33 = v137;
              v25 = v175;
              v28 = v130;
              v26 = v131;
            }
            else
            {
              v33 = v45;
              v25 = v44;
              v26 = v43;
              v28 = v42;
              v30 = v154;
            }

          }
        }

        v32 = v153 + 1;
      }
      while (v153 + 1 != v28);
      CFRelease(cf);
      if (v163)
      {
        objc_msgSend(v31, "substringFromIndex:", v170);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = v168;
        objc_msgSend(v168, "setData:", v122);

        v27 = v133;
      }
      else
      {
        v27 = v133;
        v123 = v168;
      }
      v126 = v136;
      goto LABEL_128;
    }
  }
  else
  {
    DDLog();
    v29 = CFTimeZoneCopyDefault();
  }
  CFRelease(v29);
  v30 = 0;
  v126 = 0;
  v31 = 0;
  v123 = 0;
LABEL_128:

  if (a7)
    *a7 = v126;
  v124 = v27;
  v125 = v27;

LABEL_131:
  return v125;
}

+ (id)dd_iteratorForDocument:()DDExtensions
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "body");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  v7 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "createRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectNode:", v5);
    if (v6 && (objc_msgSend(v6, "collapsed") & 1) == 0)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF678]), "initWithRange:", v6);
    else
      v7 = 0;
  }

  return v7;
}

@end
