@implementation PKFakeTapToFocusDelegate

+ (id)_infoInProcess
{
  if (qword_1ECEE65A0 != -1)
    dispatch_once(&qword_1ECEE65A0, &__block_literal_global_169);
  return (id)qword_1ECEE6598;
}

void __42__PKFakeTapToFocusDelegate__infoInProcess__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 10);
  v1 = (void *)qword_1ECEE6590;
  qword_1ECEE6590 = v0;

  v2 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo textFieldInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0x8891053787535CDBLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, 0x19B59197E7178DCALL);

  v4 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo textFieldInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xEB605147DFE620FALL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, 0xF0BB69860FE7B106);

  v6 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0x9014357CBD5C32AALL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, 0x7838F9B1D3C01804);

  v8 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0x207FA8124C1E7C51);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, 0x7077CFFA7F89E0E4);

  v10 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xDE8D388A4E693F22, 0xDE417A374F93F3A4, 0xE6C28B1B4EAE624BLL, 64);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, 0x45E68C020940D624);

  v12 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xB2F09010117585, 0, 0, 65);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, 0xD4040AF4B530D3A4);

  v14 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xDE8D388A4E693F22, 0xE04BF7250B5CF98BLL, 0xD6C7DAA82897923ALL, 64);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, 0x740E7DD9D64E6F3ALL);

  v16 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xE457228ED2EB2668, 0xE457228ED2EB2668, 0x65329911294C9811, 64);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, 0x16C0C530235A29CELL);

  v18 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xDE8D388A4E693F22, 0xC76EF808E9F7A6CLL, 0xACABC03EA61EEB31, 64);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, 0x55F2A4B0E948E145);

  v20 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xFA1FCF624F78D43ALL);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, 0xF0B4DFE693370458);

  v22 = (void *)qword_1ECEE6590;
  v23 = objc_opt_self();
  *((_BYTE *)+[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:](v23, 0xDE8D388A4E693F22, 0x10B9926FE6F58D34, 0x5DA2AF0EB412511BLL, 64)+ 8) = 1;
  objc_msgSend(v22, "setObject:forKey:");
  v24 = (void *)qword_1ECEE6590;
  v25 = objc_opt_self();
  v26 = +[_PKFakeTapToFocusInfo controlInfoWithInteractionValue:targetValue:actionValue:controlEvents:textInputValue:](v25, 0xDE8D388A4E693F22, 0xE0667A6DCEB6885ELL, 0x49E229890D3D4237, 64);
  *((_BYTE *)v26 + 8) = 1;
  objc_msgSend(v24, "setObject:forKey:", v26, 0x16BCC6C64092E83BLL);
  v27 = (void *)qword_1ECEE6590;
  v28 = objc_opt_self();
  objc_msgSend(v27, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v28, 0x5F9FE10F790F1980, 0x73FEECA1B3E834CLL, 0), 0x171648361A91B8);
  v29 = (void *)qword_1ECEE6590;
  v30 = objc_opt_self();
  objc_msgSend(v29, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v30, 0x8C93728A528D43C8, 0, 0), 0x77F67D758E4B3E12);
  v31 = (void *)qword_1ECEE6590;
  v32 = objc_opt_self();
  objc_msgSend(v31, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v32, 0x695AE772484B8BB0, 0, 0), 0x77F6767AA7605E22);
  v33 = (void *)qword_1ECEE6590;
  v34 = objc_opt_self();
  objc_msgSend(v33, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v34, 0x4A8C1AEE2AAE961, 0, 0), 0x93BC748310DA00A5);
  v35 = (void *)qword_1ECEE6590;
  +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:]((uint64_t)_PKFakeTapToFocusInfo, 0xB2137591A3D8F82BLL, 0, 0x24C5326594B7E975);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKey:", v36, 0x8ADE1D3DFF7A57A4);

  v37 = (void *)qword_1ECEE6590;
  v38 = objc_opt_self();
  objc_msgSend(v37, "setObject:forKey:", +[_PKFakeTapToFocusInfo tapGestureInfoWithInteractionValue:firstSubviewValue:textInputValue:](v38, 0x1C421DFF5D3BFFLL, 0xDD2EA25F3EEFEE50, 0), 0x48D72B7EADA6A598);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bundleIdentifier");
  v42 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ECEE6590, "objectForKey:", objc_msgSend(v42, "hash"));
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)qword_1ECEE6598;
  qword_1ECEE6598 = v40;

}

+ (id)_tapGestureForView:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "gestureRecognizers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)_shouldAttachForView:(id)a3
{
  id v4;
  _QWORD *v5;
  int v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  if (v4 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend(a1, "_infoInProcess");
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isPossibleForView:focusInfo:", v4, v5);
    LOBYTE(a1) = 0;
    if (!v5 || !v6)
      goto LABEL_15;
    if (v5[3])
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hash");
      v10 = v5[3];

      if (v9 == v10)
      {
        if (!v5[4])
        {
LABEL_11:
          if (v5[5] && v5[6])
          {
            v21 = 0;
            v22 = &v21;
            v23 = 0x2020000000;
            v24 = 0;
            v16 = v4;
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __49__PKFakeTapToFocusDelegate__shouldAttachForView___block_invoke;
            v18[3] = &unk_1E777D5C8;
            v19 = v5;
            v20 = &v21;
            objc_msgSend(v16, "enumerateEventHandlers:", v18);
            LOBYTE(a1) = *((_BYTE *)v22 + 24) != 0;

            _Block_object_dispose(&v21, 8);
          }
          else
          {
            LOBYTE(a1) = 1;
          }
          goto LABEL_15;
        }
        objc_msgSend(v4, "subviews");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        a1 = (id)objc_claimAutoreleasedReturnValue();

        if (!a1)
        {
LABEL_15:

          goto LABEL_16;
        }
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hash");
        v15 = v5[4];

        if (v14 == v15)
          goto LABEL_11;
      }
    }
    LOBYTE(a1) = 0;
    goto LABEL_15;
  }
  LOBYTE(a1) = 0;
LABEL_16:

  return (char)a1;
}

void __49__PKFakeTapToFocusDelegate__shouldAttachForView___block_invoke(uint64_t a1, uint64_t a2, void *a3, const char *a4, uint64_t a5, _BYTE *a6)
{
  char v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v10 = objc_opt_respondsToSelector();
  v11 = v21;
  if ((v10 & 1) != 0)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hash");
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      v15 = *(_QWORD *)(v15 + 40);
    if (v14 == v15)
    {
      NSStringFromSelector(a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hash");
      v18 = *(_QWORD *)(a1 + 32);
      if (v18)
        v19 = *(_QWORD *)(v18 + 48);
      else
        v19 = 0;

      v11 = v21;
      if (v17 == v19)
      {
        v20 = *(_QWORD *)(a1 + 32);
        if (v20)
          *(_QWORD *)(v20 + 56) = a5;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a6 = 1;
      }
    }
    else
    {

      v11 = v21;
    }
  }

}

+ (BOOL)isPossibleForView:(id)a3 focusInfo:(id)a4
{
  id v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  char isKindOfClass;

  v5 = a3;
  v6 = (unint64_t *)a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6[2];
    if (v8 == 2)
    {
      objc_msgSend(v5, "gestureRecognizers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_msgSend(v9, "count") != 0;

      goto LABEL_7;
    }
    if (v8 > 1)
    {
      isKindOfClass = 0;
      goto LABEL_7;
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
LABEL_7:

  return isKindOfClass & 1;
}

- (PKFakeTapToFocusDelegate)initWithView:(id)a3
{
  id v4;
  PKFakeTapToFocusDelegate *v5;
  PKFakeTapToFocusDelegate *v6;
  uint64_t v7;
  _PKFakeTapToFocusInfo *focusInfo;
  uint64_t v9;
  NSUUID *elementID;
  _PKFakeTapToFocusInfo *v11;
  void *v12;
  PKFakeUITapGestureForRequirements *v13;
  PKFakeUITapGestureForRequirements *gestureForRequirements;
  id WeakRetained;
  id v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKFakeTapToFocusDelegate;
  v5 = -[PKFakeTapToFocusDelegate init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    objc_msgSend((id)objc_opt_class(), "_infoInProcess");
    v7 = objc_claimAutoreleasedReturnValue();
    focusInfo = v6->_focusInfo;
    v6->_focusInfo = (_PKFakeTapToFocusInfo *)v7;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    elementID = v6->_elementID;
    v6->_elementID = (NSUUID *)v9;

    v11 = v6->_focusInfo;
    if (v11)
    {
      if (v11->_type == 2)
      {
        objc_msgSend((id)objc_opt_class(), "_tapGestureForView:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&v6->_tapGesture, v12);

        v13 = objc_alloc_init(PKFakeUITapGestureForRequirements);
        gestureForRequirements = v6->_gestureForRequirements;
        v6->_gestureForRequirements = v13;

        -[PKFakeUITapGestureForRequirements setName:](v6->_gestureForRequirements, "setName:", CFSTR("com.apple.PencilKit.tapGestureFailure"));
        -[PKFakeUITapGestureForRequirements setAllowedTouchTypes:](v6->_gestureForRequirements, "setAllowedTouchTypes:", &unk_1E77ECEC8);
        -[PKFakeUITapGestureForRequirements setDelegate:](v6->_gestureForRequirements, "setDelegate:", v6);
        WeakRetained = objc_loadWeakRetained((id *)&v6->_view);
        objc_msgSend(WeakRetained, "addGestureRecognizer:", v6->_gestureForRequirements);

        v16 = objc_loadWeakRetained((id *)&v6->_tapGesture);
        objc_msgSend(v16, "requireGestureRecognizerToFail:", v6->_gestureForRequirements);

      }
    }
  }

  return v6;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 1;
}

- (BOOL)_scribbleInteractionIsEnabled:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)p_view);
    v7 = objc_msgSend(v6, "_containsResponder:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  UIView **p_view;
  id WeakRetained;
  id v6;
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
  double v18;
  CGRect result;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 didTargetElement:(id)a4 forTouches:(id)a5 event:(id)a6
{
  id v10;
  NSUUID *v11;
  id v12;
  id v13;
  _PKFakeTapToFocusInfo *focusInfo;
  id WeakRetained;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (NSUUID *)a4;
  v12 = a5;
  v13 = a6;
  focusInfo = self->_focusInfo;
  if (focusInfo)
  {
    if (focusInfo->_type == 2 && self->_elementID == v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_tapGesture);
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v24 = v12;
        v25 = v10;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v17 = v12;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              -[PKFakeUITapGestureForRequirements _addTouch:forEvent:](self->_gestureForRequirements, "_addTouch:forEvent:", v22, v13, v24, v25, (_QWORD)v26);
              v23 = objc_loadWeakRetained((id *)&self->_tapGesture);
              objc_msgSend(v23, "_removeTouch:forEvent:", v22, v13);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v19);
        }

        v12 = v24;
        v10 = v25;
      }
    }
  }

}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v6)(id, void *, uint64_t);
  id WeakRetained;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
  {
    v9[0] = self->_elementID;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8, 0x7FFFFFFFFFFFFFFFLL);

  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E0C9AA60], 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (BOOL)_shouldFocusBeforeObservingWithFocusInfo:(id)a3
{
  return !a3 || *((_QWORD *)a3 + 2) == 0;
}

- (void)_focusWithFocusInfo:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id WeakRetained;
  _QWORD *v7;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  v5 = v4[2];
  switch(v5)
  {
    case 2:
      v7 = v4;
      -[PKFakeUITapGestureForRequirements setState:](self->_gestureForRequirements, "setState:", 5);
LABEL_9:
      v4 = v7;
      break;
    case 1:
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(WeakRetained, "sendActionsForControlEvents:", v7[7]);
      goto LABEL_8;
    case 0:
LABEL_5:
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(WeakRetained, "becomeFirstResponder");
LABEL_8:

      goto LABEL_9;
  }

}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  _PKFakeTapToFocusInfo *focusInfo;
  id WeakRetained;
  void *v13;
  id v14;
  uint64_t v15;
  _BOOL4 v16;
  _PKFakeTapToFocusInfo *v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a6;
  focusInfo = self->_focusInfo;
  if (focusInfo && focusInfo->_type == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tapGesture);
    if (WeakRetained)
    {
      v13 = WeakRetained;
      v14 = objc_loadWeakRetained((id *)&self->_tapGesture);
      v15 = objc_msgSend(v14, "state");

      focusInfo = self->_focusInfo;
      if (v15 == 5)
      {
        -[PKFakeTapToFocusDelegate _focusWithFocusInfo:](self, "_focusWithFocusInfo:", focusInfo);
        v10[2](v10, 0);
        goto LABEL_10;
      }
    }
    else
    {
      focusInfo = self->_focusInfo;
    }
  }
  v16 = -[PKFakeTapToFocusDelegate _shouldFocusBeforeObservingWithFocusInfo:](self, "_shouldFocusBeforeObservingWithFocusInfo:", focusInfo);
  v17 = self->_focusInfo;
  if (v16)
  {
    -[PKFakeTapToFocusDelegate _focusWithFocusInfo:](self, "_focusWithFocusInfo:", v17);
    -[PKFakeTapToFocusDelegate _waitForFirstResponderChangeWithFocusInfo:completion:](self, "_waitForFirstResponderChangeWithFocusInfo:completion:", self->_focusInfo, v10);
  }
  else
  {
    -[PKFakeTapToFocusDelegate _waitForFirstResponderChangeWithFocusInfo:completion:](self, "_waitForFirstResponderChangeWithFocusInfo:completion:", v17, v10);
    -[PKFakeTapToFocusDelegate _focusWithFocusInfo:](self, "_focusWithFocusInfo:", self->_focusInfo);
  }
LABEL_10:

}

- (void)_waitForFirstResponderChangeWithFocusInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3042000000;
  v20 = __Block_byref_object_copy__34;
  v21 = __Block_byref_object_dispose__34;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC5AF8];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PKFakeTapToFocusDelegate__waitForFirstResponderChangeWithFocusInfo_completion___block_invoke;
  v13[3] = &unk_1E777D5F0;
  v15 = v6;
  v16 = &v17;
  v14 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, v9, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v18 + 5, v12);

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v22);

}

void __81__PKFakeTapToFocusDelegate__waitForFirstResponderChangeWithFocusInfo_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  BOOL v12;
  void *v13;
  id v14;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v4 = a1[4];
  if (v4)
  {
    if (*(_QWORD *)(v4 + 64) && v14 != 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hash");
      v9 = a1[4];
      v10 = v9 ? *(_QWORD *)(v9 + 64) : 0;

      if (v8 != v10)
      {

        v14 = 0;
      }
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[6] + 8) + 40));
  if (WeakRetained)
    v12 = v14 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObserver:", WeakRetained);

    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureForRequirements, 0);
  objc_destroyWeak((id *)&self->_tapGesture);
  objc_storeStrong((id *)&self->_elementID, 0);
  objc_storeStrong((id *)&self->_focusInfo, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
