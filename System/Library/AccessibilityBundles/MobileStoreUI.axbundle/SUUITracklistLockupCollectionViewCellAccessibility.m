@implementation SUUITracklistLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUITracklistLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[SUUITracklistLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = v3;
  v34 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v34)
  {
    v5 = 0;
    v6 = 0;
    v33 = *(_QWORD *)v40;
    v30 = v4;
    while (1)
    {
      v7 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
        NSClassFromString(CFSTR("SUUIBarRatingView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          accessibilityLocalizedString(CFSTR("popularity"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "accessibilityValue");
          v27 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v28 = CFSTR("__AXStringForVariablesSentinel");
          v26 = v9;
          __UIAXStringForVariables();
          v10 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v27;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_28;
          objc_msgSend(v8, "accessibilityLabel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "rangeOfString:", CFSTR(":")) != 0x7FFFFFFFFFFFFFFFLL && v5 == 5)
          {
            v32 = v6;
            objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v31 = v12;
            objc_msgSend(v12, "reverseObjectEnumerator");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "allObjects");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v15)
            {
              v16 = v15;
              v17 = 0;
              v18 = *(_QWORD *)v36;
              v19 = 0.0;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v36 != v18)
                    objc_enumerationMutation(v14);
                  v21 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "integerValue", v26, v27, v28);
                  v22 = 3600 * v21;
                  v23 = 60 * v21;
                  if (v17 + i != 1)
                    v23 = v21;
                  if (v17 + i != 2)
                    v22 = v23;
                  v19 = v19 + (double)v22;
                }
                v17 += v16;
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v16);
            }

            AXDurationStringForDuration();
            v24 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v24;
            v4 = v30;
            v6 = v32;
          }
          v26 = v9;
          v27 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v10 = objc_claimAutoreleasedReturnValue();
        }

        v6 = (void *)v10;
LABEL_28:
        ++v5;
        ++v7;
      }
      while (v7 != v34);
      v5 = v29 + v34;
      v34 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v34)
        goto LABEL_32;
    }
  }
  v6 = 0;
LABEL_32:

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SUUITracklistLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "isAccessibilityElement", (_QWORD)v12))
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
