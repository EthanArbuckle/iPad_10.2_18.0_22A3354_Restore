@implementation NSObject(AXATV_Extras)

- (id)_atvaccessibilityGeometricNearestHeader
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &__block_literal_global_13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_atvaccessibilityClosestElementAbove:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_atvaccessibilityClosestElementAbove:()AXATV_Extras
{
  id v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "accessibilityFrame");
  v6 = v5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "accessibilityFrame", (_QWORD)v20);
        if (v14 >= 0.0 && v14 <= v6)
        {
          if (v10)
          {
            v16 = v14;
            objc_msgSend(v10, "accessibilityFrame");
            if (v16 > v17)
            {
              v18 = v13;

              v10 = v18;
            }
          }
          else
          {
            v10 = v13;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_atvaccessibilityAncestorHasAXID:()AXATV_Extras
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = a1;
  if (v5)
  {
    while (1)
    {
      objc_msgSend(v5, "accessibilityIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "containsObject:", v6))
        break;
      objc_msgSend(v5, "accessibilityContainer");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
      if (!v7)
        goto LABEL_6;
    }
    v5 = v5;

  }
LABEL_6:

  return v5;
}

- (id)_atvAccessibilityITMLAccessibilityContentWithElement:()AXATV_Extras
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  const __CFString *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(v29, "children");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v40 = 0;
        v41 = &v40;
        v42 = 0x2050000000;
        v9 = (void *)getIKViewElementClass_softClass_0;
        v43 = getIKViewElementClass_softClass_0;
        if (!getIKViewElementClass_softClass_0)
        {
          v35 = MEMORY[0x1E0C809B0];
          v36 = 3221225472;
          v37 = __getIKViewElementClass_block_invoke_0;
          v38 = &unk_1E76AB358;
          v39 = &v40;
          __getIKViewElementClass_block_invoke_0((uint64_t)&v35);
          v9 = (void *)v41[3];
        }
        v10 = objc_retainAutorelease(v9);
        _Block_object_dispose(&v40, 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v8;
          objc_msgSend(v11, "accessibilityText");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            goto LABEL_10;
          v40 = 0;
          v41 = &v40;
          v42 = 0x2050000000;
          v14 = (void *)getIKImageElementClass_softClass;
          v43 = getIKImageElementClass_softClass;
          if (!getIKImageElementClass_softClass)
          {
            v35 = MEMORY[0x1E0C809B0];
            v36 = 3221225472;
            v37 = __getIKImageElementClass_block_invoke;
            v38 = &unk_1E76AB358;
            v39 = &v40;
            __getIKImageElementClass_block_invoke((uint64_t)&v35);
            v14 = (void *)v41[3];
          }
          v15 = objc_retainAutorelease(v14);
          _Block_object_dispose(&v40, 8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_16;
          +[AXATVUtils sharedInstance](AXATVUtils, "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "url");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accessibilityLabelForResourceURL:", v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
LABEL_10:
            if ((objc_msgSend(v4, "containsString:", v12, v27) & 1) == 0)
            {
              v27 = v12;
              v28 = CFSTR("__AXStringForVariablesSentinel");
              __AXStringForVariables();
              v13 = objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            }
          }
          else
          {
LABEL_16:
            v18 = objc_msgSend(v11, "tv_elementType", v27, v28);
            if (v18 == 43)
            {
              v12 = 0;
            }
            else
            {
              if (v18 == 39)
              {
                objc_msgSend(v11, "attributes");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("value"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "floatValue");

                +[AXATVUtils sharedInstance](AXATVUtils, "sharedInstance");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "atvaccessibilityLocalizedString:", CFSTR("tv.progress.format"));
                v22 = objc_claimAutoreleasedReturnValue();

                v23 = (void *)MEMORY[0x1E0CB3940];
                AXFormatFloatWithPercentage();
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringWithFormat:", v22, v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                v27 = v25;
                v28 = CFSTR("__AXStringForVariablesSentinel");
                __AXStringForVariables();
                v13 = objc_claimAutoreleasedReturnValue();

              }
              else
              {
                objc_msgSend(a1, "_atvAccessibilityITMLAccessibilityContentWithElement:", v11);
                v22 = objc_claimAutoreleasedReturnValue();
                v27 = (void *)v22;
                v28 = CFSTR("__AXStringForVariablesSentinel");
                __AXStringForVariables();
                v13 = objc_claimAutoreleasedReturnValue();

              }
              v12 = 0;
              v4 = (void *)v22;
LABEL_22:

              v4 = (void *)v13;
            }
          }

          continue;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v5);
  }

  return v4;
}

- (id)_atvaccessibilityITMLAccessibilityContent
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "performSelector:", sel_tv_AccessibilityText);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "tv_associatedIKViewElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      goto LABEL_10;
  }
  else
  {
    v3 = 0;
    if (v2)
      goto LABEL_10;
  }
  objc_msgSend(v3, "accessibilityText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "_atvAccessibilityITMLAccessibilityContentWithElement:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getIKTextElementClass_softClass;
  v13 = getIKTextElementClass_softClass;
  if (!getIKTextElementClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getIKTextElementClass_block_invoke;
    v9[3] = &unk_1E76AB358;
    v9[4] = &v10;
    __getIKTextElementClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_accessibilityBadgeTextForTextElement:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v6;
  }

  return v2;
}

- (id)_atvaccessibilityITMLClass
{
  void *v2;
  void *v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "tv_associatedIKViewElement");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityBadgeTextForTextElement:()AXATV_Extras
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "badges");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = CFSTR("badge");
    v7 = CFSTR("accessibilityText");
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      v22 = v4;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9), "safeValueForKey:", v6, v20, v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeValueForKey:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          v20 = v11;
          v21 = CFSTR("__AXStringForVariablesSentinel");
          __AXStringForVariables();
          v12 = v5;
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "safeValueForKey:", CFSTR("url"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[AXATVUtils sharedInstance](AXATVUtils, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accessibilityLabelForResourceURL:", v12);
          v14 = v8;
          v15 = v7;
          v16 = v6;
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = v17;
          v21 = CFSTR("__AXStringForVariablesSentinel");
          __AXStringForVariables();
          v18 = objc_claimAutoreleasedReturnValue();

          v6 = v16;
          v7 = v15;
          v8 = v14;
          v4 = v22;
          v5 = (void *)v18;
        }

        ++v9;
      }
      while (v4 != v9);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
