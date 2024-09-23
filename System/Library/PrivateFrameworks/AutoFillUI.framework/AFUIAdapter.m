@implementation AFUIAdapter

BOOL __45__AFUIAdapter_gatherRespondersFromResponder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  double v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    v5 = 0;
    if ((objc_msgSend(v3, "isHidden") & 1) == 0)
    {
      objc_msgSend(v3, "alpha");
      if (v4 != 0.0)
        v5 = 1;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

BOOL __45__AFUIAdapter_gatherRespondersFromResponder___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v5;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "_requiresKeyboardWhenFirstResponder") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "allTargets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "count") == 0;

    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __45__AFUIAdapter_gatherRespondersFromResponder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;
  id v5;
  void *v6;
  CGRect v8;
  CGRect v9;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_15:
    v4 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v2, "_requiresKeyboardWhenFirstResponder")
    || (objc_msgSend(v2, "conformsToProtocol:", &unk_25646F940) & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v2;
      objc_msgSend(v5, "allTargets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v5, "frame");
        v4 = !CGRectIsEmpty(v9);
      }
      else
      {
        v4 = 0;
      }

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    objc_msgSend(v3, "frame");
    if (CGRectIsEmpty(v8))
      goto LABEL_11;
    if ((objc_msgSend(v3, "isUserInteractionEnabled") & 1) != 0)
      goto LABEL_21;
    if (_AFUIShouldDisableDetectingNonInteractiveFields_onceToken != -1)
      dispatch_once(&_AFUIShouldDisableDetectingNonInteractiveFields_onceToken, &__block_literal_global_3);
    if (_AFUIShouldDisableDetectingNonInteractiveFields_disableDetectingNonInteractiveFields == 1)
LABEL_11:
      v4 = 0;
    else
LABEL_21:
      v4 = 1;
    goto LABEL_19;
  }
  v4 = 1;
LABEL_20:

  return v4;
}

+ (id)gatherRespondersFromResponder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v43;
  id v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gatherKeyResponders:indexOfSelf:visibilityTest:passingTest:subviewsTest:", v4, 0, &__block_literal_global_7, &__block_literal_global_9, &__block_literal_global_269);
  if ((unint64_t)objc_msgSend(v4, "count") >= 3)
  {
    v45 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v46 = v4;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v49 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            objc_msgSend(v11, "frame");
            if (!CGRectIsEmpty(v54))
            {
              objc_msgSend(v11, "bounds");
              objc_msgSend(v11, "convertRect:toView:", 0);
              v13 = v12;
              v15 = v14;
              v17 = v16;
              v19 = v18;
              objc_msgSend(v11, "window");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "window");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "windowScene");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "coordinateSpace");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "convertRect:toCoordinateSpace:", v23, v13, v15, v17, v19);
              v25 = v24;
              v27 = v26;
              v29 = v28;
              v31 = v30;

              objc_msgSend(v11, "window");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "windowScene");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "coordinateSpace");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "bounds");
              v58.origin.x = v35;
              v58.origin.y = v36;
              v58.size.width = v37;
              v58.size.height = v38;
              v55.origin.x = v25;
              v55.origin.y = v27;
              v55.size.width = v29;
              v55.size.height = v31;
              v56 = CGRectIntersection(v55, v58);
              x = v56.origin.x;
              y = v56.origin.y;
              width = v56.size.width;
              height = v56.size.height;

              v57.origin.x = x;
              v57.origin.y = y;
              v57.size.width = width;
              v57.size.height = height;
              if (CGRectIsEmpty(v57))
                objc_msgSend(v47, "addObject:", v11);
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v7);
    }

    v43 = objc_msgSend(v5, "count");
    if ((unint64_t)(v43 - objc_msgSend(v47, "count")) >= 4)
      objc_msgSend(v5, "removeObjectsInArray:", v47);

    v3 = v45;
    v4 = v46;
  }

  return v4;
}

+ (id)textSignalsForResponder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  if ((AFUIResponderIsExemptFromDetectionHints(v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "_viewControllerForAncestor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "performSelector:", sel_textField);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "placeholder");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1488], "_processLocalizedString:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v11);

        }
      }

    }
    v12 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v4, "accessibilityHint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_processLocalizedString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v14);

    v15 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v4, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_processLocalizedString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v17);

    objc_msgSend(a1, "placeholderTextForResponder:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "_processLocalizedString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v19);

    }
    v6 = (void *)objc_msgSend(v7, "copy");

  }
  return v6;
}

+ (id)placeholderTextForResponder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v3, "performSelector:", sel_placeholder);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v4 = 0;
  }

  return v4;
}

void __81__AFUIAdapter_textInputRespondersFromResponders_currentResponder_indexOfCurrent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = v5;
    if (*(id *)(a1 + 32) == v5 && *(_QWORD *)(a1 + 48))
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "count");
      v3 = v5;
      **(_QWORD **)(a1 + 48) = v4;
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

+ (id)textInputRespondersFromResponders:(id)a3 currentResponder:(id)a4 indexOfCurrent:(unint64_t *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t *v19;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCEB8];
  v9 = a3;
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __81__AFUIAdapter_textInputRespondersFromResponders_currentResponder_indexOfCurrent___block_invoke;
  v16[3] = &unk_250856A80;
  v17 = v7;
  v19 = a5;
  v11 = v10;
  v18 = v11;
  v12 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

+ (id)firstResponderForInput
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)responderAcceptsText:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 1;
  else
    v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

+ (id)presentedRootViewControllerForResponder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)addTemporaryTextColorToTextField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "textLayoutController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *MEMORY[0x24BEBD278];
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v9[1] = *MEMORY[0x24BEBD248];
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addRenderingAttributes:forRange:", v8, v5);

  objc_msgSend(v3, "setNeedsDisplay");
}

+ (void)removeTemporaryTextColorFromTextField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "textLayoutController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BEBD248];
  v8[0] = *MEMORY[0x24BEBD278];
  v8[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeRenderingAttributes:forRange:", v7, v5);

  objc_msgSend(v3, "setNeedsDisplay");
}

+ (id)textFromResponder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)setText:(id)a3 forResponder:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setText:", v6);

}

+ (int64_t)alignmentFromTextField:(id)a3
{
  return objc_msgSend(a3, "textAlignment");
}

+ (CGRect)areaForASPFromTextField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "rightView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "leftView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  UIRectInset();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (void)configureField:(id)a3 withASPForegroundView:(id)a4 withASPBackgroundView:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v12 = a3;
  if (dyld_program_sdk_at_least())
    v9 = 3;
  else
    v9 = 1;
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  objc_msgSend(v12, "_setContentCoverViewMode:", v10);
  objc_msgSend(v12, "_setContentCoverView:", v8);

  if (v7)
    v11 = v9;
  else
    v11 = 0;
  objc_msgSend(v12, "_setBackgroundCoverViewMode:", v11);
  objc_msgSend(v12, "_setBackgroundCoverView:", v7);

}

+ (void)enumerateSignUpSignalsFromButton:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unsigned __int8 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, _BYTE *))a4;
  v33 = 0;
  objc_msgSend(v5, "titleForState:", objc_msgSend(v5, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6[2](v6, v7, &v33);
  if (!v33)
  {
    v23 = v7;
    objc_msgSend(v5, "allTargets");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "actionsForTarget:forControlEvent:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13), 64);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v26;
LABEL_11:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v6[2](v6, *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19), &v33);
            if (v33)
              break;
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
              if (v17)
                goto LABEL_11;
              break;
            }
          }
        }

        v20 = v33;
        if (v20)
          break;
        if (++v13 == v11)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v11)
            goto LABEL_6;
          break;
        }
      }
    }

    v7 = v23;
    if (!v33 && objc_msgSend(v23, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v21, "_searchForLocalizedString:foundKey:foundTable:", v23, &v24, 0);
      v22 = v24;

      if (v22)
        v6[2](v6, v22, &v33);

    }
  }

}

+ (void)enumerateSignUpSignalsFromViewControllerForResponder:(id)a3 block:(id)a4 viewControllerOut:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v11, "isFirstResponder")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "_viewControllerForAncestor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "enumerateSignUpSignalsFromViewController:block:", v9, v8);
    v10 = objc_retainAutorelease(v9);
    *a5 = v10;

  }
}

+ (void)enumerateSignUpSignalsFromViewController:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  objc_class *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  v23 = 0;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9, &v23);

  if (!v23)
  {
    objc_msgSend(v6, "childViewControllers");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "isBeingPresented", (_QWORD)v19) & 1) != 0
            || (objc_msgSend(v15, "isMovingToParentViewController") & 1) != 0
            || objc_msgSend(v15, "_appearState") == 1
            || objc_msgSend(v15, "_appearState") == 2)
          {
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v17, &v23);

            if (v23)
              goto LABEL_16;
          }
          else
          {
            objc_msgSend(a1, "enumerateSignUpSignalsFromViewController:block:", v15, v7);
          }
          ++v14;
        }
        while (v12 != v14);
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        v12 = v18;
      }
      while (v18);
    }
LABEL_16:

  }
}

+ (void)enumerateSignUpSignalsFromNavBarItem:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, id, _BYTE *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  char v19;

  v5 = a3;
  v6 = (void (**)(id, id, _BYTE *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0;
    objc_msgSend(v5, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "customView");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v9, "customView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v9, "customView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "titleForState:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_18;
      }
    }
    objc_msgSend(v9, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
LABEL_18:
        if ((objc_msgSend(v5, "isNavigationBarHidden") & 1) != 0
          || !objc_msgSend(v15, "length")
          || (v6[2](v6, v15, &v19), !v19))
        {
          if (objc_msgSend(v15, "length"))
          {
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 0;
            objc_msgSend(v16, "_searchForLocalizedString:foundKey:foundTable:", v15, &v18, 0);
            v17 = v18;

            if (v17)
              v6[2](v6, v17, &v19);

          }
        }
      }
    }

  }
}

+ (void)enumerateSignupSignalsFromAccessibility:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, void *, _BYTE *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = (void (**)(id, void *, _BYTE *))a4;
  v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  objc_msgSend(v7, "accessibilityHint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, &v11);

  if (!v11)
  {
    objc_msgSend(v7, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9, &v11);

    if (!v11)
    {
      objc_msgSend(v7, "accessibilityIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v10, &v11);

    }
  }

}

@end
