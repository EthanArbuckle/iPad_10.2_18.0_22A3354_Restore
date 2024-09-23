@implementation DDRevealBridge

+ (BOOL)_revealItem:(id)a3 view:(id)a4 location:(CGPoint)a5 menuInteraction:(id)a6 context:(id)a7
{
  double y;
  double x;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  DDLookupAction *v18;
  void *v19;
  DDLookupAction *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  DDLookupAction *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  DDRVInteractionDelegate *v30;
  void *v31;

  y = a5.y;
  x = a5.x;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void *)objc_msgSend(a7, "copy");
  if (v12)
  {
    v16 = 0;
    switch(objc_msgSend(v12, "normalizedType"))
    {
      case 1:
        objc_msgSend(v12, "normalizedURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v17;
        if (!v17 || (dd_urlLooksSuspicious(v17) & 1) != 0)
          goto LABEL_21;
        +[DDContextMenuAction defaultActionWithURL:context:](DDContextMenuAction, "defaultActionWithURL:context:", v16, v15);
        v18 = (DDLookupAction *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 2:
        objc_msgSend(v12, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "length") || !+[DDParsecAction isAvailable](DDLookupAction, "isAvailable"))
          goto LABEL_16;
        v20 = [DDLookupAction alloc];
        v21 = objc_msgSend(v12, "highlightRange");
        v18 = -[DDLookupAction initWithQueryString:range:context:](v20, "initWithQueryString:range:context:", v19, v21, v22, v15);
        break;
      case 3:
        objc_msgSend(v12, "ddResult");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "coreResult");

        if (!v24)
          goto LABEL_12;
        +[DDContextMenuAction defaultActionWithResult:context:](DDContextMenuAction, "defaultActionWithResult:context:", v24, v15);
        v18 = (DDLookupAction *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        if (!v18)
          goto LABEL_21;
        goto LABEL_19;
      case 6:
        objc_msgSend(v12, "query");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 && +[DDParsecAction isAvailable](DDLookupAction, "isAvailable"))
        {
          v25 = [DDLookupAction alloc];
          objc_msgSend(v12, "reportAnIssueExtendedBlock");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "reportAnIssueMetadataFetchingBlock");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[DDLookupAction initWithRVQuery:reportAnIssueBlock:metadataFetchingBlock:context:](v25, "initWithRVQuery:reportAnIssueBlock:metadataFetchingBlock:context:", v19, v26, v27, v15);

        }
        else
        {
LABEL_16:
          v18 = 0;
        }
        break;
      default:
        goto LABEL_21;
    }

    v16 = 0;
LABEL_18:
    v24 = 0;
    if (v18)
    {
LABEL_19:
      if (v24)
      {
        +[DDDetectionController sharedController](DDDetectionController, "sharedController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "interactionDidStartForResult:", v24);
      }
      else
      {
        if (!v16)
        {
LABEL_27:
          v30 = -[DDRVInteractionDelegate initWithItem:]([DDRVInteractionDelegate alloc], "initWithItem:", v12);
          +[DDDetectionController sharedController](DDDetectionController, "sharedController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "performAction:inView:interactionDelegate:", v18, v13, v30);

          goto LABEL_28;
        }
        +[DDDetectionController sharedController](DDDetectionController, "sharedController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "interactionDidStartForURL:", v16);
      }

      goto LABEL_27;
    }
  }
  else
  {
LABEL_12:
    v16 = 0;
  }
LABEL_21:
  if (v14)
  {
    objc_msgSend(v14, "_presentMenuAtLocation:", x, y);
LABEL_28:
    v29 = 1;
    goto LABEL_29;
  }
  v29 = 0;
LABEL_29:

  return v29;
}

+ (BOOL)performDefaultActionForRVItem:(id)a3 view:(id)a4 location:(CGPoint)a5 fallbackMenuInteraction:(id)a6 context:(id)a7
{
  return +[DDRevealBridge _revealItem:view:location:menuInteraction:context:](DDRevealBridge, "_revealItem:view:location:menuInteraction:context:", a3, a4, a6, a7, a5.x, a5.y);
}

+ (id)contextMenuConfigurationWithRVItem:(id)a3 view:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  return +[DDContextMenuAction contextMenuConfigurationWithRVItem:inView:context:menuIdentifier:](DDContextMenuAction, "contextMenuConfigurationWithRVItem:inView:context:menuIdentifier:", a3, a4, a5, a6);
}

+ (id)_lookupTextForText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    if (_lookupTextForText__onceToken != -1)
      dispatch_once(&_lookupTextForText__onceToken, &__block_literal_global_8);
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", _lookupTextForText__undesirableChars);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __37__DDRevealBridge__lookupTextForText___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithRange:", 65532, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_lookupTextForText__undesirableChars;
  _lookupTextForText__undesirableChars = v0;

  v2 = (void *)_lookupTextForText__undesirableChars;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

}

+ (BOOL)_textActionsAreAvailableForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v5 = objc_msgSend(v4, "normalizedType");
  if (v5 == 2)
    goto LABEL_4;
  if (v5 != 3)
  {
    v9 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "originalSelectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
LABEL_4:
    objc_msgSend(v4, "originalSelectedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "originalSelectedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v10 = objc_msgSend(v4, "highlightRange");
    if (v10 == 0x7FFFFFFFFFFFFFFFLL
      || (v12 = v10 + v11,
          objc_msgSend(v4, "text"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "length"),
          v13,
          v12 > v14))
    {
      v15 = 0;
      LOBYTE(v16) = 0;
      goto LABEL_26;
    }
    objc_msgSend(v4, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v4, "highlightRange");
    objc_msgSend(v19, "substringWithRange:", v21, v22);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v4, "ddResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "category");

  v9 = 0;
  if (v18 <= 6 && ((1 << v18) & 0x58) != 0)
  {
    objc_msgSend(v4, "ddResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "matchedString");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v9 = (void *)v20;

  }
LABEL_15:
  if ((unint64_t)(objc_msgSend(v9, "length") - 513) >= 0xFFFFFFFFFFFFFE00)
  {
    objc_msgSend(a1, "_lookupTextForText:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v15, "length");
    v16 = v23;
    if (v23)
    {
      if (v23 >= 0x21)
      {
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(" "));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(objc_msgSend(v24, "count") - 33) >= 0xFFFFFFFFFFFFFFE0)
        {
          objc_msgSend(v24, "componentsJoinedByString:", &stru_1E4259460);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length");

          if (v26 >= 0x21)
          {
            v30 = 0;
            v31 = &v30;
            v32 = 0x2020000000;
            v33 = 0;
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __50__DDRevealBridge__textActionsAreAvailableForItem___block_invoke;
            v29[3] = &unk_1E4258BF8;
            v29[4] = &v30;
            objc_msgSend(v27, "enumerateTokensInRange:usingBlock:", 0, v16, v29);
            LOBYTE(v16) = (unint64_t)v31[3] < 0x21;

            _Block_object_dispose(&v30, 8);
          }
          else
          {
            LOBYTE(v16) = 1;
          }
        }
        else
        {
          LOBYTE(v16) = 0;
        }

      }
      else
      {
        LOBYTE(v16) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v16) = 0;
    v15 = v9;
  }
LABEL_26:

  return v16;
}

uint64_t __50__DDRevealBridge__textActionsAreAvailableForItem___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) >= 0x20uLL)
    *a5 = 1;
  return result;
}

+ (id)updatedTextInteractionMenuElements:(id)a3 withRVItem:(id)a4 view:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  BOOL v34;
  BOOL v35;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t i;
  SEL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  NSString *v50;
  void *v51;
  DDContextMenuAction *v52;
  void *v53;
  int v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  BOOL v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t m;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  BOOL v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  char v87;
  int v88;
  char v89;
  char v90;
  id v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t k;
  void *v106;
  char v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  DDSearchWebAction *v113;
  DDSearchWebAction *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  DDRVInteractionDelegate *v119;
  void *v120;
  void *v121;
  void *v122;
  DDSearchWebAction *v123;
  DDRVInteractionDelegate *v124;
  void *v125;
  unsigned int v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  BOOL v131;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  id obj;
  id obja;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  id v146;
  void *v147;
  uint64_t v148;
  DDContextMenuAction *v149;
  int v150;
  int v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _QWORD v169[4];
  DDSearchWebAction *v170;
  id v171;
  DDRVInteractionDelegate *v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  uint64_t v196;

  v196 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v138 = a4;
  v10 = a5;
  v137 = a6;
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v186, v195, 16);
  if (!v12)
    goto LABEL_11;
  v13 = v12;
  v14 = *(_QWORD *)v187;
  v148 = *MEMORY[0x1E0CEB9B8];
  v130 = *MEMORY[0x1E0D1CA38];
  v129 = *MEMORY[0x1E0D1CBA0];
LABEL_3:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v187 != v14)
      objc_enumerationMutation(v11);
    v16 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    v17 = v16;
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v148);

    if ((v19 & 1) != 0)
      break;

LABEL_9:
    if (v13 == ++v15)
    {
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v186, v195, 16);
      if (!v13)
      {
LABEL_11:

        v20 = v11;
        v21 = v138;
        goto LABEL_169;
      }
      goto LABEL_3;
    }
  }
  v135 = (void *)objc_msgSend(v11, "mutableCopy");
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  objc_msgSend(v17, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v182, v194, 16);
  v146 = v11;
  v159 = v17;
  if (!v144)
  {
    v155 = 0;
    v156 = 0;
    v22 = 0;
    v23 = 0;
    v154 = 0;
    v136 = 0;
    v139 = 0;
    v147 = 0;
    goto LABEL_47;
  }
  v155 = 0;
  v156 = 0;
  v22 = 0;
  v23 = 0;
  v154 = 0;
  v136 = 0;
  v139 = 0;
  v147 = 0;
  v142 = *(_QWORD *)v183;
  while (2)
  {
    v24 = 0;
    while (2)
    {
      v157 = v22;
      if (*(_QWORD *)v183 != v142)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * v24);
      +[DDContextMenuAction identificationStringsForMenuElement:useDefault:](DDContextMenuAction, "identificationStringsForMenuElement:useDefault:", v25, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "containsObject:", CFSTR("_define:")) & 1) != 0
        || (objc_msgSend(v26, "containsObject:", CFSTR("define:")) & 1) != 0)
      {
        v27 = v147;
        v29 = v154;
        v28 = v155;
        v30 = v25;
        v147 = v26;
        goto LABEL_20;
      }
      if ((objc_msgSend(v26, "containsObject:", CFSTR("_lookup:")) & 1) != 0
        || (objc_msgSend(v26, "containsObject:", CFSTR("lookup:")) & 1) != 0)
      {
        v30 = v23;
        v27 = v139;
        v23 = v157;
        v29 = v154;
        v28 = v155;
        v157 = v25;
        v139 = v26;
        goto LABEL_20;
      }
      if ((objc_msgSend(v26, "containsObject:", CFSTR("_translate:")) & 1) != 0
        || (objc_msgSend(v26, "containsObject:", CFSTR("translate:")) & 1) != 0)
      {
        v30 = v23;
        v27 = v136;
        v28 = v155;
        v23 = v156;
        v156 = v25;
        v29 = v154;
        v136 = v26;
        goto LABEL_20;
      }
      v30 = v23;
      if ((objc_msgSend(v26, "containsObject:", CFSTR("_findSelected:")) & 1) != 0)
      {
        v27 = v154;
        v23 = v155;
        v28 = v25;
        v29 = v26;
        goto LABEL_20;
      }
      v27 = v154;
      v33 = v155;
      v23 = v155;
      v28 = v25;
      v29 = v26;
      if (objc_msgSend(v26, "containsObject:", CFSTR("findSelected:")))
      {
LABEL_20:
        v31 = v26;

        v32 = v25;
        v33 = v28;
        v154 = v29;
      }

      v23 = v30;
      v22 = v157;
      if (v30)
        v34 = v157 == 0;
      else
        v34 = 1;
      v35 = v34 || v156 == 0;
      v155 = v33;
      if (!v35 && v33 != 0)
      {
        v11 = v146;
        v17 = v159;
        goto LABEL_47;
      }
      ++v24;
      v11 = v146;
      v17 = v159;
      if (v144 != v24)
        continue;
      break;
    }
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v182, v194, 16);
    v144 = v37;
    if (v37)
      continue;
    break;
  }
LABEL_47:
  v158 = v22;

  v145 = v23;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v147, "arrayByAddingObjectsFromArray:", v139);
    v178 = 0u;
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v178, v193, 16);
    v40 = v155;
    if (v39)
    {
      v41 = v39;
      v42 = 0;
      v43 = *(_QWORD *)v179;
      if (!v22)
        v22 = v17;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v179 != v43)
            objc_enumerationMutation(v38);
          v42 |= objc_msgSend(v10, "canPerformAction:withSender:", NSSelectorFromString(*(NSString **)(*((_QWORD *)&v178 + 1) + 8 * i)), v22);
        }
        v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v178, v193, 16);
      }
      while (v41);
    }
    else
    {
      v42 = 0;
    }

    v45 = 0;
    if (v145 && (v42 & 1) == 0 && !v158)
    {
      v176 = 0u;
      v177 = 0u;
      v174 = 0u;
      v175 = 0u;
      v46 = objc_msgSend(&unk_1E426BF78, "countByEnumeratingWithState:objects:count:", &v174, v192, 16);
      if (v46)
      {
        v47 = v46;
        v45 = 0;
        v48 = *(_QWORD *)v175;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v175 != v48)
              objc_enumerationMutation(&unk_1E426BF78);
            if (!v45)
            {
              v50 = *(NSString **)(*((_QWORD *)&v174 + 1) + 8 * j);
              if (objc_msgSend(v10, "canPerformAction:withSender:", NSSelectorFromString(v50), v159))
              {
                v45 = NSSelectorFromString(v50);
                v42 = 1;
              }
              else
              {
                v45 = 0;
              }
            }
          }
          v47 = objc_msgSend(&unk_1E426BF78, "countByEnumeratingWithState:objects:count:", &v174, v192, 16);
        }
        while (v47);
      }
      else
      {
        v45 = 0;
      }
    }

    v17 = v159;
    v23 = v145;
  }
  else
  {
    v45 = 0;
    v42 = 1;
    v40 = v155;
  }
  v51 = 0;
  v21 = v138;
  if (!v138)
  {
    obja = 0;
    v143 = 0;
    goto LABEL_93;
  }
  obja = 0;
  v143 = 0;
  if ((v42 & 1) == 0)
    goto LABEL_93;
  v52 = -[DDContextMenuAction initWithRVItem:]([DDContextMenuAction alloc], "initWithRVItem:", v138);
  objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("kDDContextNoRoomForSubtitlesKey"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "BOOLValue");

  if (v54)
    v55 = 5;
  else
    v55 = 1;
  v173 = 0;
  v56 = -[DDContextMenuAction contextMenuConfigurationWithIdentifier:inView:context:defaultAction:menuProvider:options:](v52, "contextMenuConfigurationWithIdentifier:inView:context:defaultAction:menuProvider:options:", v148, v10, v137, 0, &v173, v55);
  v57 = v173;
  v58 = v57;
  if (!v57)
  {
    obja = 0;
LABEL_89:

    v51 = 0;
    goto LABEL_90;
  }
  v149 = v52;
  (*((void (**)(id, id))v57 + 2))(v57, v11);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "children");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "count");

  obja = v59;
  if (!v61)
  {
    v52 = v149;
    goto LABEL_89;
  }
  objc_msgSend(v59, "children");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v62, "mutableCopy");

  v51 = v63;
  if (!v63)
    goto LABEL_90;
  objc_msgSend(v63, "firstObject");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v63, "firstObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = 0;
  }

  objc_msgSend(v65, "identifier");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "hasPrefix:", CFSTR("com.apple.datadetectors.DDSearchWebAction"));

  if ((v107 & 1) != 0)
  {
    v143 = v65;
    objc_msgSend(v51, "removeObjectAtIndex:", 0);
    goto LABEL_91;
  }

  v108 = v138;
  v109 = objc_msgSend(v138, "normalizedType");
  if (v109 == 2)
  {
LABEL_188:
    objc_msgSend(v108, "originalSelectedText");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = [DDSearchWebAction alloc];
    if (v112)
    {
      v114 = -[DDSearchWebAction initWithQueryString:range:context:](v113, "initWithQueryString:range:context:", v112, 0, objc_msgSend(v112, "length"), v137);
    }
    else
    {
      objc_msgSend(v108, "text");
      v115 = v51;
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v108, "highlightRange");
      v114 = -[DDSearchWebAction initWithQueryString:range:context:](v113, "initWithQueryString:range:context:", v116, v117, v118, v137);

      v51 = v115;
    }
    v17 = v159;
LABEL_195:

    if (v114)
    {
      v134 = v51;
      v119 = -[DDRVInteractionDelegate initWithItem:]([DDRVInteractionDelegate alloc], "initWithItem:", v138);
      v153 = (void *)MEMORY[0x1E0CEA2A8];
      -[DDSearchWebAction localizedName](v114, "localizedName");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDAction icon](v114, "icon");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDAction generateIdentifier](v114, "generateIdentifier");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v169[0] = MEMORY[0x1E0C809B0];
      v169[1] = 3221225472;
      v169[2] = __77__DDRevealBridge_updatedTextInteractionMenuElements_withRVItem_view_context___block_invoke;
      v169[3] = &unk_1E4258C20;
      v170 = v114;
      v171 = v10;
      v172 = v119;
      v123 = v114;
      v124 = v119;
      objc_msgSend(v153, "actionWithTitle:image:identifier:handler:", v120, v121, v122, v169);
      v143 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v134;
      goto LABEL_197;
    }
LABEL_90:
    v143 = 0;
    goto LABEL_91;
  }
  if (v109 != 3)
  {
    v143 = 0;
LABEL_197:
    v21 = v138;
    v17 = v159;
    goto LABEL_92;
  }
  v108 = v138;
  objc_msgSend(v138, "originalSelectedText");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "length");

  if (v111)
    goto LABEL_188;
  objc_msgSend(v138, "ddResult");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v125, "category");

  v143 = 0;
  if (v126 > 6)
    goto LABEL_197;
  v17 = v159;
  if (((1 << v126) & 0x58) != 0)
  {
    objc_msgSend(v138, "ddResult");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "matchedString");
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = -[DDSearchWebAction initWithQueryString:range:context:]([DDSearchWebAction alloc], "initWithQueryString:range:context:", v112, 0, objc_msgSend(v112, "length"), v137);
    goto LABEL_195;
  }
LABEL_91:
  v21 = v138;
LABEL_92:
  v23 = v145;
LABEL_93:
  v133 = v51;
  if (objc_msgSend(v21, "normalizedType") == 1)
  {
LABEL_96:
    v67 = 0;
    LOBYTE(v68) = 0;
    v69 = v156 != 0;
  }
  else
  {
    objc_msgSend(v21, "ddResult");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "category") == 2)
    {

      goto LABEL_96;
    }
    objc_msgSend(v21, "ddResult");
    v76 = v21;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v77, "category") == 1)
    {

      v67 = 0;
      LOBYTE(v68) = 0;
      v69 = v156 != 0;
      v21 = v76;
      goto LABEL_200;
    }
    objc_msgSend(v76, "ddResult");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "type");
    v68 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v68, "isEqualToString:", v130) & 1) != 0)
    {
      v151 = 0;
    }
    else
    {
      objc_msgSend(v76, "ddResult");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "type");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = objc_msgSend(v100, "isEqualToString:", v129) ^ 1;

      v11 = v146;
    }
    v23 = v145;

    LOBYTE(v68) = 0;
    v69 = v156 != 0;
    v67 = v151;
    if (v151)
    {
      v21 = v138;
      if (v156)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v167 = 0u;
          v168 = 0u;
          v165 = 0u;
          v166 = 0u;
          v101 = v136;
          v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
          if (v102)
          {
            v103 = v102;
            LODWORD(v68) = 0;
            v104 = *(_QWORD *)v166;
            do
            {
              for (k = 0; k != v103; ++k)
              {
                if (*(_QWORD *)v166 != v104)
                  objc_enumerationMutation(v101);
                LODWORD(v68) = v68 | objc_msgSend(v10, "canPerformAction:withSender:", NSSelectorFromString(*(NSString **)(*((_QWORD *)&v165 + 1) + 8 * k)), v156);
              }
              v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
            }
            while (v103);
          }
          else
          {
            LOBYTE(v68) = 0;
          }

          v69 = 1;
          v67 = 1;
          v21 = v138;
          v17 = v159;
LABEL_200:
          v23 = v145;
        }
        else
        {
          v69 = 1;
          v67 = 1;
          LOBYTE(v68) = 1;
        }
      }
    }
    else
    {
      v21 = v138;
    }
  }
  v131 = v69;
  if (!v40)
  {
    v160 = objc_msgSend(v135, "indexOfObject:", v17);
    if ((v42 & v67) == 1)
    {
      LOBYTE(v73) = 1;
      goto LABEL_119;
    }
    v78 = v158;
    if ((v68 & 1) == 0)
      goto LABEL_142;
    goto LABEL_113;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v150 = v67;
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    v70 = v154;
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v161, v190, 16);
    if (v71)
    {
      v72 = v71;
      v73 = 0;
      v74 = *(_QWORD *)v162;
      do
      {
        for (m = 0; m != v72; ++m)
        {
          if (*(_QWORD *)v162 != v74)
            objc_enumerationMutation(v70);
          v73 |= objc_msgSend(v10, "canPerformAction:withSender:", NSSelectorFromString(*(NSString **)(*((_QWORD *)&v161 + 1) + 8 * m)), v40);
        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v161, v190, 16);
      }
      while (v72);
    }
    else
    {
      LOBYTE(v73) = 0;
    }

    v21 = v138;
    v17 = v159;
    v23 = v145;
    v67 = v150;
  }
  else
  {
    LOBYTE(v73) = 1;
  }
  v160 = objc_msgSend(v135, "indexOfObject:", v17);
  if ((v42 & v67 & 1) == 0)
  {
    v78 = v158;
    if ((v73 & 1) != 0)
    {
      v79 = v135;
      objc_msgSend(v135, "replaceObjectAtIndex:withObject:", v160++, v40);
      v11 = v146;
      goto LABEL_164;
    }
    v11 = v146;
    if ((v68 & 1) == 0)
    {
LABEL_142:
      v79 = v135;
      objc_msgSend(v135, "removeObject:", v17);
      goto LABEL_164;
    }
LABEL_113:
    v79 = v135;
    objc_msgSend(v135, "replaceObjectAtIndex:withObject:", v160++, v156);
    goto LABEL_164;
  }
LABEL_119:
  objc_msgSend(v17, "children");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)objc_msgSend(v80, "mutableCopy");

  v78 = v158;
  if (v158)
    v81 = 1;
  else
    v81 = v23 == 0;
  v82 = !v81;
  if (!v81 && v45)
  {
    v83 = (void *)MEMORY[0x1E0CEA490];
    objc_msgSend(v23, "title");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "image");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "commandWithTitle:image:action:propertyList:", v84, v85, v45, 0);
    v78 = (id)objc_claimAutoreleasedReturnValue();

    v86 = objc_msgSend(v152, "indexOfObject:", v145);
    if (v86 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v152, "replaceObjectAtIndex:withObject:", v86, v78);
    v21 = v138;
    goto LABEL_136;
  }
  if (v45)
    v82 = 0;
  if (v82 == 1)
  {
    v78 = v23;
LABEL_137:
    if (objc_msgSend(v21, "normalizedType") == 2
      && !objc_msgSend(a1, "_textActionsAreAvailableForItem:", v21))
    {
      v87 = 0;
    }
    else
    {
      v87 = 1;
      if (+[DDParsecAction isAvailable](DDLookupAction, "isAvailable"))
      {
        v88 = 0;
        goto LABEL_146;
      }
    }
    objc_msgSend(v152, "removeObject:", v78);
    v88 = 1;
  }
  else
  {
LABEL_136:
    if (v78)
      goto LABEL_137;
    v88 = 0;
    v87 = 0;
  }
LABEL_146:
  if (!(v68 & 1 | !v131))
  {
    objc_msgSend(v152, "removeObject:", v156);
    v88 = 1;
  }
  v79 = v135;
  if ((v73 & 1) == 0)
  {
    objc_msgSend(v152, "removeObject:", v40);
    v90 = v87 ^ 1;
    if (!v143)
      v90 = 1;
    if ((v90 & 1) != 0)
      goto LABEL_159;
LABEL_158:
    objc_msgSend(v152, "addObject:");
    goto LABEL_159;
  }
  if (v143)
    v89 = v87;
  else
    v89 = 0;
  if ((v89 & 1) != 0)
    goto LABEL_158;
  if (!v88)
  {
    ++v160;
    v11 = v146;
    goto LABEL_162;
  }
LABEL_159:
  v91 = v78;
  objc_msgSend(v17, "children");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "count");

  v11 = v146;
  if (v93)
  {
    v94 = v152;
    objc_msgSend(v17, "menuByReplacingChildren:", v152);
    v95 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v135, "replaceObjectAtIndex:withObject:", v160++, v95);
    v17 = (id)v95;
    v78 = v91;
    v40 = v155;
  }
  else
  {
    objc_msgSend(v135, "removeObjectAtIndex:", v160);
    v78 = v91;
    v40 = v155;
LABEL_162:
    v94 = v152;
  }

LABEL_164:
  if ((v42 & 1) != 0 && objc_msgSend(v133, "count"))
  {
    objc_msgSend(obja, "menuByReplacingChildren:", v133);
    v96 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v79, "insertObject:atIndex:", v96, v160);
    v97 = (void *)v96;
  }
  else
  {
    v97 = obja;
  }
  v20 = v79;

LABEL_169:
  return v20;
}

uint64_t __77__DDRevealBridge_updatedTextInteractionMenuElements_withRVItem_view_context___block_invoke(_QWORD *a1)
{
  return +[DDContextMenuAction performAction:fromView:alertController:interactionDelegate:](DDContextMenuAction, "performAction:fromView:alertController:interactionDelegate:", a1[4], a1[5], 0, a1[6]);
}

+ (BOOL)underlyingViewDisappeared:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[DDDetectionController sharedController](DDDetectionController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tryDismissActionInView:", v3);

  return v5;
}

@end
