@implementation WBSSavedAccount(WebUIExtras)

- (id)_firstSiteMatchingSearchPattern:()WebUIExtras withTokenizer:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "userVisibleSites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
      if ((objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", a4, v12, v6, 1) & 1) != 0)goto LABEL_18;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "sites", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v15)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
      if ((objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", a4, v12, v6, 1) & 1) != 0)break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v14)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v17 = v12;
    goto LABEL_19;
  }
LABEL_17:
  v17 = 0;
LABEL_19:

  return v17;
}

- (void)safari_getTitle:()WebUIExtras detail:forTableViewCell:withSearchPattern:emphasizeUserName:
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  const __CFAllocator *v26;
  const __CFLocale *v27;
  CFStringTokenizerRef v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v58;
  id v59;
  uint64_t v60;
  int v61;
  void *v62;
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  uint64_t v66;
  void *v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  _QWORD v71[3];
  CFRange v72;

  v71[1] = *MEMORY[0x1E0C80C00];
  v59 = a5;
  v10 = a6;
  v61 = a7;
  if (a7)
  {
    objc_msgSend(a1, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "userVisibleDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "customTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    v60 = v13;
    if (!v15)
    {
      v19 = v12;
      goto LABEL_18;
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "customTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v18 = v12;
    else
      v18 = (void *)v13;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ — %@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(a1, "effectiveTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "user");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v60 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(a1, "userVisibleDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v20 = v11;
      objc_msgSend(a1, "customTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "userVisibleDomain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if ((v23 & 1) != 0)
      {
        v11 = v20;
        goto LABEL_18;
      }
      v24 = (void *)MEMORY[0x1E0CB3940];
      if (objc_msgSend(v19, "length"))
        v25 = v19;
      else
        v25 = (void *)v60;
      objc_msgSend(a1, "userVisibleDomain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ — %@"), v25, v17);
      v12 = v19;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v20;
    }
LABEL_16:

  }
LABEL_18:
  v63 = v10;
  if (objc_msgSend(v10, "length"))
  {
    v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v27 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v72.location = 0;
    v72.length = 0;
    v28 = CFStringTokenizerCreate(v26, 0, v72, 0, v27);
  }
  else
  {
    v28 = 0;
  }
  v29 = objc_msgSend(v11, "length");
  v30 = objc_alloc(MEMORY[0x1E0CB3778]);
  v31 = *MEMORY[0x1E0DC32A0];
  v58 = v11;
  if (v29)
  {
    v70 = *MEMORY[0x1E0DC32A0];
    +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v30, "initWithString:attributes:", v11, v33);

    if ((v61 & 1) != 0)
    {
      v35 = 0;
    }
    else
    {
      objc_msgSend(a1, "customTitle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "length");

      if (v40)
        v35 = 3;
      else
        v35 = 1;
    }
    +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    highlightMatchingRanges((uint64_t)v28, v34, v10, v35, v36);
  }
  else
  {
    v68[0] = *MEMORY[0x1E0DC32A0];
    +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v36;
    v68[1] = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v30, "initWithString:attributes:", v62, v38);

  }
  v41 = objc_retainAutorelease(v34);
  *a3 = v41;
  v42 = objc_msgSend(v19, "length");
  v43 = objc_alloc(MEMORY[0x1E0CB3778]);
  if (v42)
  {
    v66 = v31;
    +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:](_SFAccountManagerAppearanceValues, "subtitleFontForNarrowCellWithText:", v19);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v43, "initWithString:attributes:", v19, v45);

    if (v61)
    {
      objc_msgSend(a1, "customTitle");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "length");

      if (v48)
        v49 = 3;
      else
        v49 = 1;
    }
    else
    {
      v49 = 0;
    }
    +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:](_SFAccountManagerAppearanceValues, "subtitleFontForNarrowCellWithText:", v19);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v10;
    highlightMatchingRanges((uint64_t)v28, v46, v10, v49, v51);
    v50 = (void *)v60;
  }
  else
  {
    v64[0] = v31;
    v50 = (void *)v60;
    +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:](_SFAccountManagerAppearanceValues, "subtitleFontForNarrowCellWithText:", v60);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v51;
    v64[1] = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v43, "initWithString:attributes:", v60, v53);

    v54 = v63;
  }

  v55 = objc_retainAutorelease(v46);
  *a4 = v55;
  if (v28)
    CFRelease(v28);

}

@end
