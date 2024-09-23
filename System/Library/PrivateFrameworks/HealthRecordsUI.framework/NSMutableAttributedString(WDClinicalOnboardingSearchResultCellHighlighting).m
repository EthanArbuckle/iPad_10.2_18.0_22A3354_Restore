@implementation NSMutableAttributedString(WDClinicalOnboardingSearchResultCellHighlighting)

+ (id)wd_stringWithString:()WDClinicalOnboardingSearchResultCellHighlighting highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v41 = a8;
  v40 = a9;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
  v20 = objc_msgSend(v14, "length");
  v39 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v19, "addAttribute:value:range:");
  if (objc_msgSend(v15, "count") == 1
    && (objc_msgSend(v15, "firstObject"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "length"),
        v21,
        !v22))
  {
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v16, 0, v20);
  }
  else
  {
    v23 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v18, 0, v20, v18, v17, v16);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v15;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v38)
    {
      v37 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (objc_msgSend(v25, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v14, "rangeOfString:options:range:", v25, 1, 0, v20);
            if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v29 = v27;
              v30 = v28;
              do
              {
                if (!v29
                  || objc_msgSend(v26, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", v29 - 1)))
                {
                  objc_msgSend(v19, "addAttribute:value:range:", v39, v40, v29, v30);
                  objc_msgSend(v19, "addAttribute:value:range:", v23, v41, v29, v30);
                }
                v29 = objc_msgSend(v14, "rangeOfString:options:range:", v25, 1, v29 + v30, v20 - (v29 + v30));
                v30 = v31;
              }
              while (v29 != 0x7FFFFFFFFFFFFFFFLL);
            }

          }
        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v38);
    }

    v16 = v35;
    v18 = v33;
    v17 = v34;
  }

  return v19;
}

@end
