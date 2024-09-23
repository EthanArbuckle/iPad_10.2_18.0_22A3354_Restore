@implementation PKToolPicker

+ (BOOL)isActiveToolPickerVisibleForWindow:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "activeToolPickerForWindow:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isVisible") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "_isAnimatingToVisible");

  return v4;
}

+ (id)activeToolPickerForWindow:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)_allToolPickers;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "toolPicker", (_QWORD)v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "_isActiveToolPickerForWindow:", v3) & 1) != 0)
        break;

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (BOOL)_hasResponderRegisteredForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
    goto LABEL_16;
  v8 = *(_QWORD *)v16;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        objc_msgSend(v10, "view");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "window");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          LOBYTE(v7) = 1;
          goto LABEL_16;
        }
      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
      continue;
    break;
  }
LABEL_16:

  return v7;
}

- (id)_currentFirstResponder
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_toolPickerVisibility)
  {
    -[PKToolPickerVisibility currentFirstResponder](self->_toolPickerVisibility, "currentFirstResponder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKToolPicker _interaction](self, "_interaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hostingWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstResponder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_delegateForSelector:(SEL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  -[PKToolPicker _temporarySelectionDelegate](self, "_temporarySelectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKToolPicker _temporarySelectionDelegate](self, "_temporarySelectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKToolPicker _delegate](self, "_delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PKToolPicker _delegate](self, "_delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (BOOL)_wantsVisibleForFirstResponder:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = +[PKToolPicker _internalClassWantsToolPicker:visibleForResponder:](PKToolPicker, "_internalClassWantsToolPicker:visibleForResponder:", self, v4);
  v6 = +[PKToolPicker _textInputWantsToolPickerVisible:forFirstResponder:](PKToolPicker, "_textInputWantsToolPickerVisible:forFirstResponder:", self, v4);
  v7 = 1;
  if (!v5 && !v6)
  {
    v8 = objc_opt_class();
    PKDynamicCast(v8, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (id)v9;
      v7 = 0;
      do
      {
        -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          switch(objc_msgSend(v12, "integerValue"))
          {
            case 0:
              v7 |= v10 == v4;
              break;
            case 1:
              v7 = 1;
              break;
            case 2:
              v7 &= v10 != v4;
              break;
            case 3:
              v7 = 0;
              break;
            default:
              break;
          }
        }
        objc_msgSend(v10, "superview");
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v13;
      }
      while (v13);
    }
    else
    {
      -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if ((unint64_t)objc_msgSend(v15, "integerValue") >= 2)
          v7 = 0;
        else
          v7 = -1;
      }
      else
      {
        v7 = 0;
      }

    }
  }

  return v7 & 1;
}

+ (void)_cycleToolPickersForResponder:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (id)_allToolPickers;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "toolPicker", (_QWORD)v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            objc_msgSend(v2, "_responderWindow");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v8, v9, 0, 1, 0);
            -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v8, 0, 0, 1, 0);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)_setVisibleInWindow:(uint64_t)a3 animated:(uint64_t)a4 notify:(void *)a5 completion:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD);
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  int v18;
  void *v19;
  NSObject *v20;
  int v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  int v56;
  _QWORD v57[5];
  id v58;
  void (**v59)(_QWORD);
  char v60;
  char v61;
  _QWORD v62[5];
  id v63;
  void (**v64)(_QWORD);
  char v65;
  char v66;
  _QWORD aBlock[4];
  id v68;
  const __CFString *v69;
  void *v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  _BYTE v74[10];
  _DWORD v75[4];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  v11 = v10;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke;
    aBlock[3] = &unk_1E7777F58;
    v12 = v10;
    v68 = v12;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (__canBecomeVisible && (objc_msgSend((id)a1, "_isLockedHidden") & 1) == 0)
    {
      v14 = objc_msgSend((id)a1, "_isEnabled");
      if (!v9 || (v14 & 1) != 0)
        goto LABEL_11;
    }
    else if (!v9)
    {
      goto LABEL_11;
    }

    v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = +[PKToolPicker _canBecomeVisible](PKToolPicker, "_canBecomeVisible");
      v17 = objc_msgSend((id)a1, "_isLockedHidden");
      v18 = objc_msgSend((id)a1, "_isEnabled");
      *(_DWORD *)buf = 134218752;
      v72 = a1;
      v73 = 1024;
      *(_DWORD *)v74 = v16;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = v17;
      LOWORD(v75[0]) = 1024;
      *(_DWORD *)((char *)v75 + 2) = v18;
      _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, skip making tool picker visible, canBecomeVisible: %{BOOL}d, isLockedHidden: %{BOOL}d, isEnabled: %{BOOL}d", buf, 0x1Eu);
    }

    v9 = 0;
LABEL_11:
    if ((objc_msgSend((id)a1, "_visibilityUpdatesEnabled") & 1) == 0)
    {
      v20 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend((id)a1, "_visibilityUpdatesEnabled");
        *(_DWORD *)buf = 134218240;
        v72 = a1;
        v73 = 1024;
        *(_DWORD *)v74 = v21;
        _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, skip updating tool picker visibility, _visibilityUpdatesEnabled: %{BOOL}d", buf, 0x12u);
      }

      goto LABEL_18;
    }
    if (objc_msgSend((id)a1, "_visibilityUpdatesEnabled"))
    {
      v19 = *(void **)(a1 + 32);
      if (v19)
      {
        objc_msgSend(v19, "setVisibleInWindow:animated:notify:completion:", v9, a3, a4, v12);
LABEL_53:

        goto LABEL_54;
      }
    }
    if (objc_msgSend((id)a1, "_squeezePaletteVisible"))
    {
      v22 = objc_msgSend((id)a1, "isVisible");
      if (v9)
      {
        if ((v22 & 1) == 0)
        {
          v20 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v72 = a1;
            v73 = 1024;
            *(_DWORD *)v74 = 1;
            _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p can't become visible, isSqueezePaletteVisible: %{BOOL}d", buf, 0x12u);
          }
LABEL_18:

          v13[2](v13);
          goto LABEL_53;
        }
      }
    }
    objc_msgSend((id)a1, "calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary");
    objc_msgSend(v9, "windowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaletteViewInteraction paletteViewInteractionForWindow:windowScene:](PKPaletteViewInteraction, "paletteViewInteractionForWindow:windowScene:", v9, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "setDelegate:", a1);
      objc_msgSend((id)a1, "_paletteViewDelegateProxy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "paletteView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDelegate:", v25);

    }
    objc_msgSend((id)a1, "_interaction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 == v27)
    {
      objc_msgSend(v24, "paletteView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updateUndoRedo");

      v13[2](v13);
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend(v9, "windowScene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = a3;
    if (v28)
      goto LABEL_29;
    objc_msgSend((id)a1, "_interaction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "window");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "windowScene");
    v32 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v32;
    a3 = v53;

    if (v28)
    {
LABEL_29:
      v69 = CFSTR("PKToolPickerNotificationWindowSceneUserInfoKey");
      v70 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      if (v24)
      {
LABEL_30:
        objc_msgSend(v24, "hostingWindow");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "firstResponder");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
    }
    else
    {
      v54 = 0;
      v33 = 1;
      if (v24)
        goto LABEL_30;
    }
    objc_msgSend((id)a1, "_interaction");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hostingWindow");
    v36 = v28;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstResponder");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v36;
    a3 = v53;
LABEL_34:

    if ((_DWORD)a4)
    {
      v56 = objc_msgSend((id)a1, "_visibilityUpdatesEnabled");
      if (v24)
      {
LABEL_36:
        objc_msgSend((id)a1, "_setInteraction:", v24);
        objc_msgSend((id)a1, "_setInputViewVisible:", 1);
        objc_msgSend((id)a1, "set_wasVisibleBeforeResponderChanges:", 1);
        v38 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v72 = a1;
          v73 = 2112;
          *(_QWORD *)v74 = v55;
          *(_WORD *)&v74[8] = 1024;
          v75[0] = a4;
          _os_log_impl(&dword_1BE213000, v38, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction should show palette, currentFirstResponder: %@, notify: %{BOOL}d", buf, 0x1Cu);
        }

        objc_msgSend((id)a1, "set_toolPickerVisible:", 1);
        v39 = MEMORY[0x1E0C809B0];
        if (v56)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v40 = v28;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "postNotificationName:object:userInfo:", CFSTR("PKToolPickerWillShowNotification"), a1, v54);

          v28 = v40;
          a3 = v53;
          *(_BYTE *)(a1 + 92) = 1;
          objc_msgSend((id)a1, "_notifyVisibilityDidChangeIsAnimationFinished:", 0);
        }
        v62[0] = v39;
        v62[1] = 3221225472;
        v62[2] = __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_64;
        v62[3] = &unk_1E7777D80;
        v62[4] = a1;
        v65 = v56;
        v42 = v54;
        v63 = v54;
        v66 = a4;
        v64 = v13;
        objc_msgSend(v24, "showPaletteViewAnimated:completion:", a3, v62);

LABEL_51:
        objc_msgSend((id)a1, "_setInteraction:", v24, v52);

        goto LABEL_52;
      }
    }
    else
    {
      v56 = 0;
      if (v24)
        goto LABEL_36;
    }
    if ((v33 & 1) != 0)
      goto LABEL_44;
    objc_msgSend((id)a1, "_interaction");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "paletteView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "delegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_paletteViewDelegateProxy");
    v52 = v28;
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v45 == v46;
    v28 = v52;
    if (v47)
    {
      v49 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v72 = a1;
        v73 = 2112;
        *(_QWORD *)v74 = v55;
        *(_WORD *)&v74[8] = 1024;
        v75[0] = a4;
        _os_log_impl(&dword_1BE213000, v49, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction should hide palette, currentFirstResponder: %@, notify: %{BOOL}d", buf, 0x1Cu);
      }

      objc_msgSend((id)a1, "set_toolPickerVisible:", 0);
      v50 = MEMORY[0x1E0C809B0];
      v42 = v54;
      if (v56)
        objc_msgSend((id)a1, "_notifyVisibilityDidChangeIsAnimationFinished:", 0);
      objc_msgSend((id)a1, "_interaction", v52);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v50;
      v57[1] = 3221225472;
      v57[2] = __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_65;
      v57[3] = &unk_1E7777D80;
      v57[4] = a1;
      v60 = v56;
      v58 = v54;
      v61 = a4;
      v59 = v13;
      objc_msgSend(v51, "hidePaletteViewAnimated:completion:", v53, v57);

      v28 = v52;
    }
    else
    {
LABEL_44:
      v42 = v54;
      if (!v9)
      {
        objc_msgSend((id)a1, "_setInputViewVisible:", 0);
        objc_msgSend((id)a1, "set_toolPickerVisible:", 0);
        objc_msgSend((id)a1, "_selectionContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setSelectionMask:", 0);

        v13[2](v13);
      }
    }
    goto LABEL_51;
  }
LABEL_54:

}

+ (id)_toolPickersForWindow:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (!v2 || (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "_isRemoteInputHostWindow") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "firstResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v3 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)_allToolPickers, "count"));
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = (id)_allToolPickers;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "toolPicker", (_QWORD)v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11 && objc_msgSend(v11, "_wantsVisibleForFirstResponder:", v4))
              objc_msgSend(v3, "addObject:", v12);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (id)_windowSceneForToolPicker:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[4];
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, sizeof(v8));
  objc_msgSend(a3, "_firstRespondersForVisibleUI", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", v8, v9, 16))
  {
    objc_msgSend(**((id **)&v8[0] + 1), "_responderWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_windowForToolPicker:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary");
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(MEMORY[0x1E0DC3BC0], "_scenesIncludingInternalForPK:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v58;
    v7 = &off_1E776F000;
    v40 = v4;
    v37 = *(_QWORD *)v58;
    do
    {
      v8 = 0;
      v38 = v5;
      do
      {
        if (*(_QWORD *)v58 != v6)
          objc_enumerationMutation(v4);
        v39 = v8;
        v9 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v8);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v9, "_allWindows", v35);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v54;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v54 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              if (objc_msgSend(v15, "isKeyWindow"))
              {
                v51 = 0u;
                v52 = 0u;
                v49 = 0u;
                v50 = 0u;
                +[PKToolPicker _toolPickersForWindow:]((uint64_t)v7[489], v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = 0;
                  v20 = *(_QWORD *)v50;
                  while (2)
                  {
                    v21 = 0;
                    v22 = v19;
                    do
                    {
                      if (*(_QWORD *)v50 != v20)
                        objc_enumerationMutation(v16);
                      v19 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * v21);

                      if (v19 == v3)
                      {
LABEL_44:
                        v33 = v15;

                        v4 = v40;
                        goto LABEL_46;
                      }
                      ++v21;
                      v22 = v19;
                    }
                    while (v18 != v21);
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
                    if (v18)
                      continue;
                    break;
                  }

                  v4 = v40;
                  v6 = v37;
                }

                v7 = &off_1E776F000;
                goto LABEL_25;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_25:

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v9, "_allWindows");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v46;
          v35 = *(_QWORD *)v46;
          while (2)
          {
            v26 = 0;
            v36 = v24;
            do
            {
              if (*(_QWORD *)v46 != v25)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v26);
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              +[PKToolPicker _toolPickersForWindow:]((uint64_t)v7[489], v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
              if (v27)
              {
                v28 = v27;
                v29 = 0;
                v30 = *(_QWORD *)v42;
LABEL_32:
                v31 = 0;
                v32 = v29;
                while (1)
                {
                  if (*(_QWORD *)v42 != v30)
                    objc_enumerationMutation(v16);
                  v29 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v31);

                  if (v29 == v3)
                    goto LABEL_44;
                  ++v31;
                  v32 = v29;
                  if (v28 == v31)
                  {
                    v28 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
                    if (v28)
                      goto LABEL_32;

                    v4 = v40;
                    v24 = v36;
                    v6 = v37;
                    v25 = v35;
                    break;
                  }
                }
              }

              ++v26;
              v7 = &off_1E776F000;
            }
            while (v26 != v24);
            v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
            if (v24)
              continue;
            break;
          }
        }

        v8 = v39 + 1;
      }
      while (v39 + 1 != v38);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      v33 = 0;
    }
    while (v5);
  }
  else
  {
    v33 = 0;
  }
LABEL_46:

  return v33;
}

+ (void)_dockToolPickerForWindowScene:(uint64_t)a3 toAutoHideCornerAnimated:
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:](PKPaletteViewInteraction, "existingPaletteViewInteractionForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138478083;
    v9 = v4;
    v10 = 2113;
    v11 = v5;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Dock toolPicker for windowScene: %{private}@, paletteViewInteraction: %{private}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v5, "paletteHostView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dockPaletteToAutoHideCornerAnimated:", a3);

}

- (void)addObserver:(id)observer
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = observer;
  -[PKToolPicker _observers](self, "_observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "setRulerActive:", -[PKToolPicker isRulerActive](self, "isRulerActive"));
    objc_msgSend(v6, "_addObserver:", self);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138477827;
      v9 = v4;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Notify selected tool did change, addObserver: %{private}@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v4, "toolPickerSelectedToolItemDidChange:", self);
  }
  if (-[PKToolPicker isVisible](self, "isVisible") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "toolPickerVisibilityDidChange:", self);

}

- (void)removeObserver:(id)observer
{
  id v4;
  id v5;

  v4 = observer;
  -[PKToolPicker _observers](self, "_observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_saveStateIfNecessary
{
  id v2;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveOptionsIfNecessary");

}

+ (void)_setCanBecomeVisible:(BOOL)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (__canBecomeVisible != a3)
  {
    __canBecomeVisible = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = (id)_allToolPickers;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "toolPicker", (_QWORD)v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            +[PKToolPicker _windowForToolPicker:](PKToolPicker, "_windowForToolPicker:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "_setVisibleInWindow:", v9);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

+ (BOOL)_canBecomeVisible
{
  return __canBecomeVisible;
}

- (void)setVisible:(BOOL)visible forFirstResponder:(UIResponder *)responder
{
  _BOOL4 v4;
  UIResponder *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  PKToolPicker *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  UIResponder *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v4 = visible;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = responder;
  -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v8 != 0) != v4)
  {
    v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PKToolPicker _currentFirstResponder](self, "_currentFirstResponder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218754;
      v14 = self;
      v15 = 1024;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, should setVisible %{BOOL}d for responder: %@, current: %@", (uint8_t *)&v13, 0x26u);

    }
  }
  -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
    objc_msgSend(v11, "setObject:forKey:", &unk_1E77EB868, v6);
  else
    objc_msgSend(v11, "removeObjectForKey:", v6);

  if (-[UIResponder isFirstResponder](v6, "isFirstResponder"))
    -[PKToolPicker _updateToolPickerVisibility](self, "_updateToolPickerVisibility");

}

- (void)setVisibility:(int64_t)a3 whenFirstResponderIsDescendantOf:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  switch(a3)
  {
    case 2:
      -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v9);
LABEL_8:

      break;
    case 1:
      -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = &unk_1E77EB898;
      goto LABEL_7;
    case 0:
      -[PKToolPicker _firstRespondersForVisibleUI](self, "_firstRespondersForVisibleUI");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = &unk_1E77EB880;
LABEL_7:
      objc_msgSend(v6, "setObject:forKey:", v8, v9);
      goto LABEL_8;
  }
  -[PKToolPicker _updateToolPickerVisibility](self, "_updateToolPickerVisibility");

}

- (void)_handleFirstResponderDidChangeNotification:(id)a3
{
  PKToolPicker *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int v21;
  PKToolPicker *v22;
  __int16 v23;
  _WORD v24[9];

  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  v4 = (PKToolPicker *)a3;
  v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKToolPicker _currentFirstResponder](self, "_currentFirstResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v4;
    v23 = 2112;
    *(_QWORD *)v24 = v6;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "first responder did change notification: %@, firstResponder: %@", (uint8_t *)&v21, 0x16u);

  }
  -[PKToolPicker userInfo](v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("_UIWindowHostDidPromoteFirstResponderUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[PKToolPicker userInfo](v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || v11)
  {
    -[PKToolPicker _paletteView](self, "_paletteView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isExtendedColorPickerVisible");

    if (PKIsPhoneDevice() && (-[PKToolPicker isVisible](self, "isVisible") & v13) == 1)
    {
      v14 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = -[PKToolPicker isVisible](self, "isVisible");
        v21 = 134218496;
        v22 = self;
        v23 = 1024;
        *(_DWORD *)v24 = v15;
        v24[2] = 1024;
        *(_DWORD *)&v24[3] = 1;
        v16 = "Skip processing FR notification, toolPicker: %p, isVisible: %{BOOL}d, isExtendedColorPickerVisible: %{BOOL}d";
LABEL_16:
        _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v21, 0x18u);
      }
    }
    else
    {
      if (!PKIsVisionDevice())
        goto LABEL_18;
      -[PKToolPicker _paletteView](self, "_paletteView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "palettePopoverPresentingController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "presentedViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19 || !-[PKToolPicker isVisible](self, "isVisible"))
      {
LABEL_18:
        +[PKToolPicker _windowForToolPicker:](PKToolPicker, "_windowForToolPicker:", self);
        v14 = objc_claimAutoreleasedReturnValue();
        -[PKToolPicker _setVisibleInWindow:](self, "_setVisibleInWindow:", v14);
        goto LABEL_19;
      }
      v14 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = -[PKToolPicker isVisible](self, "isVisible");
        v21 = 134218496;
        v22 = self;
        v23 = 1024;
        *(_DWORD *)v24 = v20;
        v24[2] = 1024;
        *(_DWORD *)&v24[3] = 1;
        v16 = "Skip processing FR notification, toolPicker: %p, isVisible: %{BOOL}d, hasPresentedViewController: %{BOOL}d";
        goto LABEL_16;
      }
    }

LABEL_19:
    goto LABEL_20;
  }
  if ((_UIApplicationIsExtension() & 1) == 0)
    -[PKToolPicker _setVisibleInWindow:](self, "_setVisibleInWindow:", 0);
LABEL_20:

}

- (PKDrawingPaletteView)_paletteView
{
  void *v2;
  void *v3;

  if (self->_toolPickerVisibility)
  {
    -[PKToolPickerVisibility paletteView](self->_toolPickerVisibility, "paletteView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKToolPicker _interaction](self, "_interaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paletteView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PKDrawingPaletteView *)v2;
}

- (PKToolPickerDelegate)delegate
{
  return (PKToolPickerDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (PKTool)selectedTool
{
  return self->_selectedTool;
}

- (void)setSelectedTool:(PKTool *)selectedTool
{
  -[PKToolPicker _setSelectedTool:saveState:updateUI:updateLastSelectedTool:](self, "_setSelectedTool:saveState:updateUI:updateLastSelectedTool:", selectedTool, 1, 1, 1);
}

- (void)_setSelectedTool:(id)a3 saveState:(BOOL)a4 updateUI:(BOOL)a5
{
  -[PKToolPicker _setSelectedTool:saveState:updateUI:updateLastSelectedTool:](self, "_setSelectedTool:saveState:updateUI:updateLastSelectedTool:", a3, a4, a5, 1);
}

- (void)_setSelectedTool:(id)a3 saveState:(BOOL)a4 updateUI:(BOOL)a5 updateLastSelectedTool:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  PKTool *v11;
  PKTool *v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *mutableTools;
  PKTool *v19;
  uint64_t v20;
  NSObject *v21;
  NSMutableArray *v22;
  NSObject *v23;
  PKTool *v24;
  NSObject *v25;
  PKTool *selectedTool;
  void *v27;
  _QWORD v28[4];
  PKTool *v29;
  uint64_t v30;
  uint8_t buf[4];
  PKTool *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = (PKTool *)a3;
  v12 = v11;
  if (v11)
  {
    if (-[PKTool _isRulerTool](v11, "_isRulerTool"))
    {
      v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Can't select a ruler tool.", buf, 2u);
      }

      -[PKToolPicker setRulerActive:](self, "setRulerActive:", -[PKToolPicker isRulerActive](self, "isRulerActive") ^ 1);
    }
    else
    {
      v15 = -[PKToolPicker _indexOfTool:](self, "_indexOfTool:", v12);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_17;
      v16 = objc_opt_class();
      PKDynamicCast(v16, v12);
      v17 = objc_claimAutoreleasedReturnValue();
      mutableTools = self->_mutableTools;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __75__PKToolPicker__setSelectedTool_saveState_updateUI_updateLastSelectedTool___block_invoke;
      v28[3] = &unk_1E7777C68;
      v19 = v12;
      v29 = v19;
      v30 = v17;
      v27 = (void *)v17;
      v20 = -[NSMutableArray indexOfObjectPassingTest:](mutableTools, "indexOfObjectPassingTest:", v28);
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = self->_mutableTools;
          *(_DWORD *)buf = 138412546;
          v32 = v19;
          v33 = 2112;
          v34 = v22;
          _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEFAULT, "Can't select tool: %@. Tool not found in tools: %@", buf, 0x16u);
        }
      }
      else
      {
        -[NSMutableArray objectAtIndex:](self->_mutableTools, "objectAtIndex:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_mutableTools, "replaceObjectAtIndex:withObject:", v20, v19);
        v23 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v32 = v19;
          v33 = 2112;
          v34 = v21;
          v35 = 2048;
          v36 = v20;
          _os_log_impl(&dword_1BE213000, v23, OS_LOG_TYPE_DEFAULT, "An equal but not identical tool: %@, replaced tool: %@, at index: %lu", buf, 0x20u);
        }

      }
      v15 = 0x7FFFFFFFFFFFFFFFLL;

      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_17:
        if (self->_selectedTool != v12)
        {
          -[PKToolPicker _setSelectionMask:updateUI:](self, "_setSelectionMask:updateUI:", 0, 0);
          if (v6)
            objc_storeStrong((id *)&self->_lastSelectedTool, self->_selectedTool);
          v24 = self->_selectedTool;
          objc_storeStrong((id *)&self->_selectedTool, a3);
          -[NSMutableArray replaceObjectAtIndex:withObject:](self->_mutableTools, "replaceObjectAtIndex:withObject:", v15, v12);
          v25 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            selectedTool = self->_selectedTool;
            *(_DWORD *)buf = 138478083;
            v32 = v24;
            v33 = 2113;
            v34 = selectedTool;
            _os_log_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEFAULT, "Did change selected tool from %{private}@ to %{private}@", buf, 0x16u);
          }

          -[PKToolPicker _dismissPopovers](self, "_dismissPopovers");
          if (v7)
            -[PKToolPicker _updateUI](self, "_updateUI");
          if (v8)
            -[PKToolPicker _saveToolPickerState](self, "_saveToolPickerState");
          -[PKToolPicker _notifySelectedToolDidChange](self, "_notifySelectedToolDidChange");

        }
      }
    }
  }
  else
  {
    v14 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "Can't select a nil tool.", buf, 2u);
    }

  }
}

uint64_t __75__PKToolPicker__setSelectedTool_saveState_updateUI_updateLastSelectedTool___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isEraserInk");

  if (!v5)
  {
    if (!*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "ink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inkType");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "inkType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "isEqual:", v16);

LABEL_20:
      goto LABEL_21;
    }
    v8 = objc_opt_class();
    PKDynamicCast(v8, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = 0;
      goto LABEL_21;
    }
    objc_msgSend(*(id *)(a1 + 40), "customIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    v13 = v12;
    if (v11 == v12)
    {

    }
    else
    {
      v7 = 0;
      v14 = v12;
      v15 = (unint64_t)v11;
      if (!v11 || !v12)
      {
LABEL_19:

        goto LABEL_20;
      }
      v7 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!(_DWORD)v7)
        goto LABEL_20;
    }
    objc_msgSend(*(id *)(a1 + 40), "_configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    v19 = v18;
    v14 = (void *)v19;
    if (v15 | v19)
    {
      v7 = 0;
      if (v15 && v19)
        v7 = objc_msgSend((id)v15, "isEqual:", v19);
    }
    else
    {
      v7 = 1;
    }

    goto LABEL_19;
  }
  objc_msgSend(v3, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isEraserInk");
LABEL_21:

  return v7;
}

- (void)_notifySelectedToolDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKToolPicker _observers](self, "_observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v17 = v9;
          _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Notify selected tool did change, observer: %{private}@", buf, 0xCu);
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "toolPickerSelectedToolItemDidChange:", self);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "toolPickerSelectedToolDidChange:", self);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

}

- (BOOL)_wasVisibleBeforeResponderChanges
{
  -[PKToolPicker calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary](self, "calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary");
  return self->_wasVisibleBeforeResponderChanges;
}

- (void)calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary
{
  __CFRunLoopObserver *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;

  if (!-[PKToolPicker _didCalculateVisibleBeforeResponderChanges](self, "_didCalculateVisibleBeforeResponderChanges"))
  {
    -[PKToolPicker set_didCalculateVisibleBeforeResponderChanges:](self, "set_didCalculateVisibleBeforeResponderChanges:", 1);
    self->_wasVisibleBeforeResponderChanges = -[PKToolPicker isVisible](self, "isVisible");
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __84__PKToolPicker_calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary__block_invoke;
    v5[3] = &unk_1E7777C90;
    objc_copyWeak(&v6, &location);
    v3 = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v3, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v3);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __84__PKToolPicker_calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "set_didCalculateVisibleBeforeResponderChanges:", 0);

}

- (void)setRulerActive:(BOOL)rulerActive
{
  NSObject *v4;
  BOOL *p_rulerActive;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (rulerActive)
  {
    if (PKIsVisionDevice())
    {
      v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_INFO, "Can't enable the ruler on this platform.", buf, 2u);
      }
      goto LABEL_19;
    }
    p_rulerActive = &self->_rulerActive;
    if (self->_rulerActive)
      return;
    v6 = -[PKToolPicker _showsRuler](self, "_showsRuler");
    v7 = 0;
  }
  else
  {
    p_rulerActive = &self->_rulerActive;
    if (!self->_rulerActive)
      return;
    v6 = 0;
    v7 = 1;
  }
  *p_rulerActive = v6;
  if (v7 == v6)
    return;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKToolPicker _observers](self, "_observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "copy");

  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "toolPickerIsRulerActiveDidChange:", self);
      }
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }
LABEL_19:

}

- (BOOL)_showsRuler
{
  return -[PKToolPicker _hasToolPassingTest:](self, "_hasToolPassingTest:", &__block_literal_global_4);
}

uint64_t __27__PKToolPicker__showsRuler__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isRulerTool");
}

- (void)_setShowsRuler:(BOOL)a3
{
  NSObject *v4;
  PKRulerTool *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (!a3)
  {
    if (!-[PKToolPicker _showsRuler](self, "_showsRuler"))
      return;
    -[NSMutableArray indexesOfObjectsPassingTest:](self->_mutableTools, "indexesOfObjectsPassingTest:", &__block_literal_global_48);
    v5 = (PKRulerTool *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__PKToolPicker__setShowsRuler___block_invoke_2;
    v6[3] = &unk_1E7777D18;
    v6[4] = self;
    -[PKRulerTool enumerateIndexesUsingBlock:](v5, "enumerateIndexesUsingBlock:", v6);
    goto LABEL_11;
  }
  if (!PKIsVisionDevice())
  {
    if (-[PKToolPicker _showsRuler](self, "_showsRuler"))
      return;
    v5 = objc_alloc_init(PKRulerTool);
    -[PKToolPicker _insertTool:atIndex:updateUI:](self, "_insertTool:atIndex:updateUI:", v5, -[NSMutableArray count](self->_mutableTools, "count") - 4, 0);
LABEL_11:

    -[PKToolPicker _updateUI](self, "_updateUI");
    -[PKToolPicker _saveToolPickerState](self, "_saveToolPickerState");
    return;
  }
  v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_INFO, "Can't enable the ruler on this platform.", buf, 2u);
  }

}

uint64_t __31__PKToolPicker__setShowsRuler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isRulerTool");
}

void __31__PKToolPicker__setShowsRuler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_removeTool:updateUI:", v3, 0);

}

- (int64_t)_numberOfToolsAfterRuler
{
  int64_t result;

  result = -[NSMutableArray indexOfObjectPassingTest:](self->_mutableTools, "indexOfObjectPassingTest:", &__block_literal_global_50);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return 4;
  return result;
}

uint64_t __40__PKToolPicker__numberOfToolsAfterRuler__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isRulerTool");
}

- (void)_setNumberOfToolsAfterRuler:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  PKRulerTool *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  if (PKIsVisionDevice())
  {
    v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Can't enable the ruler on this platform.", buf, 2u);
    }

  }
  else
  {
    -[NSMutableArray indexesOfObjectsPassingTest:](self->_mutableTools, "indexesOfObjectsPassingTest:", &__block_literal_global_51);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__PKToolPicker__setNumberOfToolsAfterRuler___block_invoke_2;
    v8[3] = &unk_1E7777D18;
    v8[4] = self;
    objc_msgSend(v6, "enumerateIndexesUsingBlock:", v8);

    v7 = objc_alloc_init(PKRulerTool);
    -[PKToolPicker _insertTool:atIndex:updateUI:](self, "_insertTool:atIndex:updateUI:", v7, -[NSMutableArray count](self->_mutableTools, "count") - a3, 0);
    -[PKToolPicker _updateUI](self, "_updateUI");
    -[PKToolPicker _saveToolPickerState](self, "_saveToolPickerState");

  }
}

uint64_t __44__PKToolPicker__setNumberOfToolsAfterRuler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isRulerTool");
}

void __44__PKToolPicker__setNumberOfToolsAfterRuler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_removeTool:updateUI:", v3, 0);

}

- (void)_setShouldHideHoverPreviewToggle:(BOOL)a3
{
  if (self->__shouldHideHoverPreviewToggle != a3)
  {
    self->__shouldHideHoverPreviewToggle = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (UIBarButtonItem)accessoryItem
{
  return -[PKPaletteBarButton barButtonItem](self->_accessoryBarButton, "barButtonItem");
}

- (void)setAccessoryItem:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  PKPaletteBarButton *v8;
  PKPaletteBarButton *v9;
  PKPaletteBarButton *accessoryBarButton;
  id v11;

  v4 = a3;
  -[PKPaletteBarButton barButtonItem](self->_accessoryBarButton, "barButtonItem");
  v5 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v11 = (id)v6;
    if (v6 && v5)
    {
      v7 = objc_msgSend((id)v5, "isEqual:", v6);

      v6 = (unint64_t)v11;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      if (!v11)
      {
        accessoryBarButton = self->_accessoryBarButton;
        self->_accessoryBarButton = 0;

        goto LABEL_9;
      }
    }
    v8 = -[PKPaletteBarButton initWithBarButtonItem:]([PKPaletteBarButton alloc], "initWithBarButtonItem:", v11);
    v9 = self->_accessoryBarButton;
    self->_accessoryBarButton = v8;

    -[PKPaletteBarButton setAccessibilityIdentifier:](self->_accessoryBarButton, "setAccessibilityIdentifier:", CFSTR("Plus-Button"));
LABEL_9:
    -[PKToolPicker _updateUI](self, "_updateUI");
    v6 = (unint64_t)v11;
  }
LABEL_10:

}

- (void)_setShowsPlusButton:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  if (self->__showsPlusButton != a3)
  {
    self->__showsPlusButton = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "pk_plusButtonImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v4, "initWithImage:menu:", v5, self->__plusButtonMenu);

    }
    else
    {
      v6 = 0;
    }
    -[PKToolPicker setAccessoryItem:](self, "setAccessoryItem:", v6);

  }
}

- (void)_setPlusButtonMenu:(id)a3
{
  UIMenu *v5;
  PKPaletteBarButton *accessoryBarButton;
  void *v7;
  UIMenu *v8;

  v5 = (UIMenu *)a3;
  if (self->__plusButtonMenu != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__plusButtonMenu, a3);
    accessoryBarButton = self->_accessoryBarButton;
    if (accessoryBarButton)
    {
      -[PKPaletteBarButton barButtonItem](accessoryBarButton, "barButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMenu:", v8);

    }
    -[PKToolPicker _updateUI](self, "_updateUI");
    v5 = v8;
  }

}

- (void)_setPlusButtonViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->__plusButtonViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__plusButtonViewController, a3);
    -[PKToolPicker _updateUI](self, "_updateUI");
    v5 = v6;
  }

}

- (void)_setShowsTextButton:(BOOL)a3
{
  if (self->__showsTextButton != a3)
  {
    self->__showsTextButton = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setTextButtonViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->__textButtonViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__textButtonViewController, a3);
    -[PKToolPicker _updateUI](self, "_updateUI");
    v5 = v6;
  }

}

- (void)_setShowsShapeButton:(BOOL)a3
{
  if (self->__showsShapeButton != a3)
  {
    self->__showsShapeButton = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setShapeButtonViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->__shapeButtonViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__shapeButtonViewController, a3);
    -[PKToolPicker _updateUI](self, "_updateUI");
    v5 = v6;
  }

}

- (UIView)_contextualEditingView
{
  void *v3;
  void *v4;

  if (-[PKToolPicker isVisible](self, "isVisible"))
  {
    -[PKToolPicker _paletteView](self, "_paletteView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contextualEditingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIView *)v4;
}

- (unint64_t)_edgeForContextualEditingView
{
  unint64_t v3;
  int64_t v4;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[PKToolPicker _palettePosition](self, "_palettePosition") - 1;
  v4 = -[PKToolPicker _palettePosition](self, "_palettePosition");
  if (v3 > 3)
  {
    if ((unint64_t)(v4 - 5) > 3)
    {
      return 4;
    }
    else
    {
      -[PKToolPicker _paletteView](self, "_paletteView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PKToolPicker _palettePosition](self, "_palettePosition") - 5;
      if (v7 > 3)
        v8 = -1;
      else
        v8 = qword_1BE4FBE90[v7];
      v9 = objc_msgSend(v6, "edgeLocationToDockFromCorner:", v8);

      return v9;
    }
  }
  else if ((unint64_t)(v4 - 1) >= 4)
  {
    return 0;
  }
  else
  {
    return qword_1BE4FBEB0[v4 - 1];
  }
}

- (void)_setLassoToolEditingViewVisible:(BOOL)a3
{
  if (self->_lassoToolEditingViewVisible != a3)
  {
    self->_lassoToolEditingViewVisible = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (UIView)_lassoToolEditingView
{
  void *v3;
  void *v4;

  if (-[PKToolPicker isVisible](self, "isVisible"))
  {
    -[PKToolPicker _paletteView](self, "_paletteView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lassoToolEditingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIView *)v4;
}

- (void)_setWantsEllipsisButtonVisibleInCompactSize:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[PKToolPicker _canShowEllipsisButtonInCompactSize](self, "_canShowEllipsisButtonInCompactSize"))
  {
    if (self->__wantsEllipsisButtonVisibleInCompactSize != v3)
    {
      self->__wantsEllipsisButtonVisibleInCompactSize = v3;
      -[PKToolPicker _updateUI](self, "_updateUI");
    }
  }
}

- (void)_setWantsBottomLineDividerVisibleInCompactSize:(BOOL)a3
{
  if (self->__wantsBottomLineDividerVisibleInCompactSize != a3)
  {
    self->__wantsBottomLineDividerVisibleInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setIgnoresSafeAreaInsetsInCompactSize:(BOOL)a3
{
  if (self->__ignoresSafeAreaInsetsInCompactSize != a3)
  {
    self->__ignoresSafeAreaInsetsInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setEdgeInsetsInCompactSize:(NSDirectionalEdgeInsets)a3
{
  if (self->__edgeInsetsInCompactSize.leading != a3.leading
    || self->__edgeInsetsInCompactSize.top != a3.top
    || self->__edgeInsetsInCompactSize.trailing != a3.trailing
    || self->__edgeInsetsInCompactSize.bottom != a3.bottom)
  {
    self->__edgeInsetsInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setInterItemToolsSpacingInCompactSize:(double)a3
{
  if (vabdd_f64(self->__interItemToolsSpacingInCompactSize, a3) >= 0.00999999978)
  {
    self->__interItemToolsSpacingInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setInterItemUndoRedoButtonsSpacingInCompactSize:(double)a3
{
  if (self->__interItemUndoRedoButtonsSpacingInCompactSize != a3)
  {
    self->__interItemUndoRedoButtonsSpacingInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setUseEqualSpacingLayoutInCompactSize:(BOOL)a3
{
  if (self->__useEqualSpacingLayoutInCompactSize != a3)
  {
    self->__useEqualSpacingLayoutInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (BOOL)_interactionIsValid
{
  void *v2;
  BOOL v3;

  -[PKToolPicker _interaction](self, "_interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)_scalingFactor
{
  void *v3;
  double v4;
  double v5;

  if (!-[PKToolPicker isVisible](self, "isVisible"))
    return 1.0;
  -[PKToolPicker _paletteView](self, "_paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteScaleFactor");
  v5 = v4;

  return v5;
}

- (void)_notifyScaleFactorDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKToolPicker _observers](self, "_observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "_toolPickerDidChangeScaleFactor:", self);
          v10 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v9;
            _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Tool picker scale factor change notified to observer: %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v6);
  }

}

- (BOOL)isVisible
{
  PKToolPickerVisibility *toolPickerVisibility;

  toolPickerVisibility = self->_toolPickerVisibility;
  if (toolPickerVisibility)
    return -[PKToolPickerVisibility toolPickerVisible](toolPickerVisibility, "toolPickerVisible");
  else
    return -[PKToolPicker _toolPickerVisible](self, "_toolPickerVisible");
}

- (id)_windowScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (self->_toolPickerVisibility)
  {
    -[PKToolPickerVisibility windowScene](self->_toolPickerVisibility, "windowScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKToolPicker _interaction](self, "_interaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_setVisibilityUpdatesEnabled:(BOOL)a3
{
  NSObject *v4;
  int v5;
  PKToolPicker *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->__visibilityUpdatesEnabled != a3)
  {
    self->__visibilityUpdatesEnabled = a3;
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134218240;
      v6 = self;
      v7 = 1024;
      v8 = -[PKToolPicker _visibilityUpdatesEnabled](self, "_visibilityUpdatesEnabled");
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, visibility updates did change, visibilityUpdatesEnabled: %{BOOL}d", (uint8_t *)&v5, 0x12u);
    }

    -[PKToolPicker _updateToolPickerVisibility](self, "_updateToolPickerVisibility");
  }
}

- (void)_performWithVisibilityUpdatesEnabled:(BOOL)a3 block:(id)a4
{
  _BOOL8 v4;
  _BOOL8 visibilityUpdatesEnabled;
  void (**v7)(_QWORD);

  v4 = a3;
  visibilityUpdatesEnabled = self->__visibilityUpdatesEnabled;
  v7 = (void (**)(_QWORD))a4;
  -[PKToolPicker _setVisibilityUpdatesEnabled:](self, "_setVisibilityUpdatesEnabled:", v4);
  v7[2](v7);

  -[PKToolPicker _setVisibilityUpdatesEnabled:](self, "_setVisibilityUpdatesEnabled:", visibilityUpdatesEnabled);
}

+ (void)_performWithVisibilityUpdatesEnabled:(BOOL)a3 window:(id)a4 block:(id)a5
{
  _BOOL8 v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = a4;
  v7 = (void (**)(_QWORD))a5;
  if (v10
    && (+[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v10),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    objc_msgSend(v8, "_performWithVisibilityUpdatesEnabled:block:", v6, v7);

  }
  else
  {
    v7[2](v7);
  }

}

- (void)_updateToolPickerVisibility
{
  -[PKToolPicker _updateToolPickerVisibilityWithContext:completion:](self, 0, 0);
}

- (void)_updateToolPickerVisibilityWithContext:(void *)a3 completion:
{
  _BYTE *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "_interaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isActive"))
    {
      v8 = objc_msgSend(a1, "_isInputViewVisible");

      if ((v8 & 1) == 0)
      {
        objc_msgSend(a1, "_setVisibleInWindow:", 0);
        goto LABEL_24;
      }
    }
    else
    {

    }
    if ((objc_msgSend(a1, "_isContextMenuPresented") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      +[PKToolPicker _windowForToolPicker:](PKToolPicker, "_windowForToolPicker:", a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v5)
    {
      v10 = v5[8] == 0;
      if ((objc_msgSend(a1, "_isContextMenuPresented") & 1) == 0 && v5[9])
      {
        objc_msgSend(a1, "_windowScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          +[PKToolPicker _windowSceneForToolPicker:](PKToolPicker, "_windowSceneForToolPicker:", a1);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        if ((objc_msgSend(a1, "isVisible") & 1) == 0 && !v14)
        {
          v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v16 = 0;
          }

        }
        if (objc_msgSend(a1, "_squeezePaletteVisible"))
        {

          v9 = 0;
        }

        v10 = 0;
      }
    }
    else
    {
      objc_msgSend(a1, "_isContextMenuPresented");
      v10 = 1;
    }
    -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)a1, v9, 1, v10, v6);

  }
LABEL_24:

}

- (void)_updateToolPickerVisibilityContextMenuPresentedDidChange:(BOOL)a3
{
  PKToolPickerVisibilityContext *v5;
  PKToolPickerVisibilityContext *v6;

  v5 = objc_alloc_init(PKToolPickerVisibilityContext);
  if (v5)
    v5->_contextMenuPresentedDidChange = a3;
  v6 = v5;
  -[PKToolPicker _updateToolPickerVisibilityWithContext:completion:](self, v5, 0);

}

- (BOOL)_squeezePaletteVisible
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  -[PKToolPicker _windowScene](self, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[PKToolPicker _windowSceneForToolPicker:](PKToolPicker, "_windowSceneForToolPicker:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_paletteViewVisible");

  return v8;
}

- (void)_setVisibleInWindow:(id)a3
{
  -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)self, a3, 1, 1, 0);
}

uint64_t __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_64(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) = 0;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyVisibilityDidChangeIsAnimationFinished:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PKToolPickerDidShowNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 57);
    v7 = 134218240;
    v8 = v4;
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction did show palette, notify: %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_65(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_selectionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectionMask:", 0);

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyVisibilityDidChangeIsAnimationFinished:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("PKToolPickerDidHideNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(unsigned __int8 *)(a1 + 57);
    v8 = 134218240;
    v9 = v5;
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction did hide palette, notify: %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_notifyVisibilityDidChangeIsAnimationFinished:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKToolPicker _observers](self, "_observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "_toolPickerVisibilityDidChange:isAnimationFinished:", self, v3);
        }
        else if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "toolPickerVisibilityDidChange:", self);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_setInteraction:(id)a3
{
  PKPaletteViewInteraction *v5;
  PKPaletteViewInteraction *interaction;
  void *v7;
  void *v8;
  PKPaletteViewInteraction *v9;

  v5 = (PKPaletteViewInteraction *)a3;
  if (self->__interaction != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->__interaction, a3);
    if (self->__interaction)
    {
      -[PKToolPicker _restoreToolPickerStateNotify:](self, "_restoreToolPickerStateNotify:", 1);
      interaction = self->__interaction;
    }
    else
    {
      interaction = 0;
    }
    -[PKPaletteViewInteraction hostingWindow](interaction, "hostingWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKToolPicker _setPresentationController:](self, "_setPresentationController:", v8);

    v5 = v9;
  }

}

- (void)_updateUI
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  PKGenerationTool *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _BOOL4 v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 rulerActive;
  void *v19;
  int v20;
  int v21;
  uint8_t v22[16];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v3 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_fault_impl(&dword_1BE213000, v3, OS_LOG_TYPE_FAULT, "This should only be called from the main thread!", v22, 2u);
    }

  }
  -[PKToolPicker _updateHandwritingToolInstallation](self, "_updateHandwritingToolInstallation");
  if (!_os_feature_enabled_impl() || PKIsDeviceLocked())
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_variant_has_internal_diagnostics())
      goto LABEL_12;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.TestApp")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ZoomTestApp")) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PaperKitTestApp")))
    {

    }
    else
    {
      v20 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.pencilkit.MultiDrawingCanvasTestApp"));

      if (!v20)
        goto LABEL_13;
    }
  }
  +[PKGenerationModelAvailabilityController sharedInstance](PKGenerationModelAvailabilityController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isGenerationModelAvailable"))
  {
LABEL_12:

    goto LABEL_13;
  }
  v8 = -[PKToolPicker _hasGenerationTool](self, "_hasGenerationTool");

  if (!v8)
  {
    v9 = objc_alloc_init(PKGenerationTool);
    -[PKToolPicker _insertTool:atIndex:](self, "_insertTool:atIndex:", v9, -[PKToolPicker _numberOfToolsAfterRuler](self, "_numberOfToolsAfterRuler"));
LABEL_21:

    goto LABEL_22;
  }
LABEL_13:
  if (_os_feature_enabled_impl() && !PKIsDeviceLocked())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifier");
      v9 = (PKGenerationTool *)objc_claimAutoreleasedReturnValue();

      if (!os_variant_has_internal_diagnostics())
        goto LABEL_21;
      if ((-[PKGenerationTool isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.TestApp")) & 1) != 0
        || (-[PKGenerationTool isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.ZoomTestApp")) & 1) != 0
        || -[PKGenerationTool isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.PaperKitTestApp")))
      {

      }
      else
      {
        v21 = -[PKGenerationTool isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.pencilkit.MultiDrawingCanvasTestApp"));

        if (!v21)
          goto LABEL_22;
      }
    }
    +[PKGenerationModelAvailabilityController sharedInstance](PKGenerationModelAvailabilityController, "sharedInstance");
    v9 = (PKGenerationTool *)objc_claimAutoreleasedReturnValue();
    if ((-[PKGenerationTool isGenerationModelAvailable](v9, "isGenerationModelAvailable") & 1) != 0)
      goto LABEL_21;
    v14 = -[PKToolPicker _hasGenerationTool](self, "_hasGenerationTool");

    if (v14)
    {
      v15 = -[PKToolPicker _indexOfGenerationTool](self, "_indexOfGenerationTool");
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableArray objectAtIndex:](self->_mutableTools, "objectAtIndex:", v15);
        v9 = (PKGenerationTool *)objc_claimAutoreleasedReturnValue();
        -[PKToolPicker _removeTool:updateUI:](self, "_removeTool:updateUI:", v9, 0);
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  -[PKTool ink](self->_selectedTool, "ink");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "_isHandwritingInk"))
  {
    rulerActive = self->_rulerActive;

    if (rulerActive)
      -[PKToolPicker setRulerActive:](self, "setRulerActive:", 0);
  }
  else
  {

  }
  if (self->_rulerActive && !-[PKToolPicker _showsRuler](self, "_showsRuler"))
    -[PKToolPicker setRulerActive:](self, "setRulerActive:", 0);
  -[PKToolPicker _paletteView](self, "_paletteView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKToolPicker _updatePaletteView:](self, "_updatePaletteView:", v19);

}

- (void)_updateHandwritingToolInstallation
{
  int v3;
  _BOOL4 v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  if (self->__showsHandwritingTool)
    v3 = objc_msgSend((id)objc_opt_class(), "_canShowHandwritingTool");
  else
    v3 = 0;
  v4 = -[PKToolPicker _hasHandwritingTool](self, "_hasHandwritingTool");
  v5 = !v4;
  if ((v3 & 1) != 0 || (v5 & 1) != 0)
  {
    if (((v3 ^ 1 | v4) & 1) != 0)
    {
      if (((v3 ^ 1 | v5) & 1) == 0)
      {
        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recognitionLocaleIdentifier");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        -[PKToolPicker _handwritingTool](self, "_handwritingTool");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v10);

        if ((v9 & 1) == 0)
        {
          -[PKToolPicker _removeHandwritingTool](self, "_removeHandwritingTool");
          -[PKToolPicker _insertHandwritingTool](self, "_insertHandwritingTool");
        }

      }
    }
    else
    {
      -[PKToolPicker _insertHandwritingTool](self, "_insertHandwritingTool");
    }
  }
  else
  {
    -[PKToolPicker _removeHandwritingTool](self, "_removeHandwritingTool");
  }
}

- (void)_insertHandwritingTool
{
  void *v3;
  PKHandwritingTool *v4;
  id v5;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recognitionLocaleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PKHandwritingTool initWithLocaleIdentifier:]([PKHandwritingTool alloc], "initWithLocaleIdentifier:", v5);
  -[PKToolPicker _insertTool:atIndex:updateUI:](self, "_insertTool:atIndex:updateUI:", v4, self->_indexForHandwritingTool, 0);

}

- (void)_removeHandwritingTool
{
  void *v3;
  _QWORD v4[5];

  -[NSMutableArray indexesOfObjectsPassingTest:](self->_mutableTools, "indexesOfObjectsPassingTest:", &__block_literal_global_74);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PKToolPicker__removeHandwritingTool__block_invoke_2;
  v4[3] = &unk_1E7777D18;
  v4[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);

}

uint64_t __38__PKToolPicker__removeHandwritingTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHandwritingInk");

  return v3;
}

void __38__PKToolPicker__removeHandwritingTool__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_removeTool:updateUI:", v3, 0);

}

- (void)_updatePaletteView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "updateUndoRedo");
    objc_msgSend(v5, "_setShouldTrackHoverLocationForPencilTapActions:", -[PKToolPicker _shouldTrackHoverLocationForPencilTapActions](self, "_shouldTrackHoverLocationForPencilTapActions"));
    -[PKToolPicker _paletteAccessibilityIdentifier](self, "_paletteAccessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v6);

    objc_msgSend(v5, "setPencilInteractionEnabledWhenNotVisible:", -[PKToolPicker _isPencilInteractionEnabledWhenNotVisible](self, "_isPencilInteractionEnabledWhenNotVisible"));
    objc_msgSend(v5, "setColorUserInterfaceStyle:", -[PKToolPicker colorUserInterfaceStyle](self, "colorUserInterfaceStyle"));
    objc_msgSend(v5, "setOverrideUserInterfaceStyle:", -[PKToolPicker overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    objc_msgSend(v5, "setShouldHideHoverPreviewToggle:", -[PKToolPicker _shouldHideHoverPreviewToggle](self, "_shouldHideHoverPreviewToggle"));
    objc_msgSend(v5, "setFingerDrawsOptionEnabled:", -[PKToolPicker showsDrawingPolicyControls](self, "showsDrawingPolicyControls"));
    objc_msgSend(v5, "setWantsClearBackgroundColorInCompactSize:", -[PKToolPicker _wantsClearBackgroundColorInCompactSize](self, "_wantsClearBackgroundColorInCompactSize"));
    objc_msgSend(v5, "setWantsUndoRedoButtonsVisibleInCompactSize:", -[PKToolPicker _wantsUndoRedoButtonsVisibleInCompactSize](self, "_wantsUndoRedoButtonsVisibleInCompactSize"));
    objc_msgSend(v5, "setWantsEllipsisButtonVisibleInCompactSize:", -[PKToolPicker _wantsEllipsisButtonVisibleInCompactSize](self, "_wantsEllipsisButtonVisibleInCompactSize"));
    objc_msgSend(v5, "setWantsBottomLineDividerVisibleInCompactSize:", -[PKToolPicker _wantsBottomLineDividerVisibleInCompactSize](self, "_wantsBottomLineDividerVisibleInCompactSize"));
    objc_msgSend(v5, "setIgnoresSafeAreaInsetsInCompactSize:", -[PKToolPicker _ignoresSafeAreaInsetsInCompactSize](self, "_ignoresSafeAreaInsetsInCompactSize"));
    -[PKToolPicker _edgeInsetsInCompactSize](self, "_edgeInsetsInCompactSize");
    objc_msgSend(v5, "setEdgeInsetsInCompactSize:");
    objc_msgSend(v5, "setUseEqualSpacingLayoutInCompactSize:", -[PKToolPicker _useEqualSpacingLayoutInCompactSize](self, "_useEqualSpacingLayoutInCompactSize"));
    -[PKToolPicker _tools](self, "_tools");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTools:", v7);

    -[PKToolPicker _interItemToolsSpacingInCompactSize](self, "_interItemToolsSpacingInCompactSize");
    objc_msgSend(v5, "setInterItemToolsSpacingInCompactSize:");
    -[PKToolPicker _interItemUndoRedoButtonsSpacingInCompactSize](self, "_interItemUndoRedoButtonsSpacingInCompactSize");
    objc_msgSend(v5, "setInterItemUndoRedoButtonsSpacingInCompactSize:");
    objc_msgSend(v5, "setWantsUndoRedoButtonsShadowInCompactSize:", -[PKToolPicker _wantsUndoRedoButtonsVisibleInCompactSize](self, "_wantsUndoRedoButtonsVisibleInCompactSize"));
    objc_msgSend(v5, "setWantsMulticolorSwatchShadowInCompactSize:", -[PKToolPicker _wantsUndoRedoButtonsVisibleInCompactSize](self, "_wantsUndoRedoButtonsVisibleInCompactSize"));
    if (self)
    {
      v8 = -[PKToolPicker _indexOfTool:](self, "_indexOfTool:", self->_selectedTool);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_fault_impl(&dword_1BE213000, v9, OS_LOG_TYPE_FAULT, "_selectedTool must be in the tool picker's array of tools.", v21, 2u);
        }

        v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v5, "selectToolAtIndex:", v8);
    -[PKToolPicker _selectionContext](self, "_selectionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEditingStrokeSelection:", objc_msgSend(v10, "selectionMask") & 1);

    -[PKToolPicker _selectionContext](self, "_selectionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEditingTextSelection:", ((unint64_t)objc_msgSend(v11, "selectionMask") >> 1) & 1);

    -[PKToolPicker _selectionContext](self, "_selectionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEditingExternalElementsSelection:", ((unint64_t)objc_msgSend(v12, "selectionMask") >> 2) & 1);

    if (-[PKToolPicker _isLassoToolEditingViewVisible](self, "_isLassoToolEditingViewVisible"))
      v13 = -[PKTool _isLassoTool](self->_selectedTool, "_isLassoTool");
    else
      v13 = 0;
    objc_msgSend(v5, "setShowsLassoToolEditingView:", v13);
    objc_msgSend(v5, "setLassoToolEditingViewIdentifier:", self->_lassoToolEditingViewIdentifier);
    -[PKToolPicker _selectionContext](self, "_selectionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColorSwatchesVisible:", objc_msgSend(v14, "colorSwatchesVisible"));

    -[PKToolPicker _selectionContext](self, "_selectionContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersLargeContextualEditingUI:", objc_msgSend(v15, "prefersLargeContextualEditingUI"));

    objc_msgSend(v5, "setShowsPlusButton:", self->_accessoryBarButton != 0);
    if (self->_accessoryBarButton)
      objc_msgSend(v5, "_setPlusButton:");
    -[PKToolPicker _plusButtonViewController](self, "_plusButtonViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlusButtonViewController:", v16);

    objc_msgSend(v5, "setShowsTextButton:", -[PKToolPicker _showsTextButton](self, "_showsTextButton"));
    -[PKToolPicker _textButtonViewController](self, "_textButtonViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextButtonViewController:", v17);

    objc_msgSend(v5, "setShowsShapeButton:", -[PKToolPicker _showsShapeButton](self, "_showsShapeButton"));
    -[PKToolPicker _shapeButtonViewController](self, "_shapeButtonViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShapeButtonViewController:", v18);

    -[PKToolPicker _presentationController](self, "_presentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentationController:", v19);

    -[PKToolPicker _annotationDelegate](self, "_annotationDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnnotationDelegate:", v20);

    objc_msgSend(v5, "setShadowVisible:", -[PKToolPicker _shadowVisible](self, "_shadowVisible"));
  }

}

- (id)_paletteAccessibilityIdentifier
{
  __CFString *v3;

  v3 = CFSTR("Drawing-Palette");
  if (-[PKToolPicker _wantsUndoRedoButtonsVisibleInCompactSize](self, "_wantsUndoRedoButtonsVisibleInCompactSize")
    && !-[PKToolPicker _showsRuler](self, "_showsRuler"))
  {
    v3 = CFSTR("ScrapPaper-Drawing-Palette");
  }
  return v3;
}

- (BOOL)_hasHandwritingTool
{
  return -[PKToolPicker _hasToolPassingTest:](self, "_hasToolPassingTest:", &__block_literal_global_75);
}

uint64_t __35__PKToolPicker__hasHandwritingTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHandwritingInk");

  return v3;
}

- (BOOL)_hasEraserTool
{
  return -[PKToolPicker _hasToolPassingTest:](self, "_hasToolPassingTest:", &__block_literal_global_76);
}

uint64_t __30__PKToolPicker__hasEraserTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isEraserInk");

  return v3;
}

- (BOOL)_hasLassoTool
{
  return -[PKToolPicker _hasToolPassingTest:](self, "_hasToolPassingTest:", &__block_literal_global_77);
}

uint64_t __29__PKToolPicker__hasLassoTool__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isLassoTool");
}

- (BOOL)_hasGenerationTool
{
  return -[PKToolPicker _hasToolPassingTest:](self, "_hasToolPassingTest:", &__block_literal_global_78);
}

uint64_t __34__PKToolPicker__hasGenerationTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isGenerationTool");

  return v3;
}

- (BOOL)_hasToolPassingTest:(id)a3
{
  id v4;
  NSMutableArray *mutableTools;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  mutableTools = self->_mutableTools;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PKToolPicker__hasToolPassingTest___block_invoke;
  v8[3] = &unk_1E7777E28;
  v9 = v4;
  v6 = v4;
  LOBYTE(mutableTools) = -[NSMutableArray indexOfObjectPassingTest:](mutableTools, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)mutableTools;
}

uint64_t __36__PKToolPicker__hasToolPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)_indexOfGenerationTool
{
  return -[PKToolPicker _indexOfToolPassingTest:](self, "_indexOfToolPassingTest:", &__block_literal_global_79);
}

uint64_t __38__PKToolPicker__indexOfGenerationTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isGenerationTool");

  return v3;
}

- (unint64_t)_indexOfToolPassingTest:(id)a3
{
  id v4;
  NSMutableArray *mutableTools;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  mutableTools = self->_mutableTools;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PKToolPicker__indexOfToolPassingTest___block_invoke;
  v9[3] = &unk_1E7777E28;
  v10 = v4;
  v6 = v4;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](mutableTools, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __40__PKToolPicker__indexOfToolPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)_palettePosition
{
  void *v3;
  void *v4;
  int64_t v5;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKToolPicker _paletteView](self, "_paletteView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "palettePosition");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setPresentationController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__presentationController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__presentationController, obj);
    -[PKToolPicker _updateUI](self, "_updateUI");
    v5 = obj;
  }

}

- (void)_setAnnotationDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__annotationDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__annotationDelegate, obj);
    -[PKToolPicker _updateUI](self, "_updateUI");
    v5 = obj;
  }

}

- (void)_setShadowVisible:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 shadowVisible;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->__shadowVisible != a3)
  {
    self->__shadowVisible = a3;
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      shadowVisible = self->__shadowVisible;
      v6[0] = 67109120;
      v6[1] = shadowVisible;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "shadow visibility state did change: %{BOOL}d", (uint8_t *)v6, 8u);
    }

    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setBackgroundVisible:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 backgroundVisible;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->__backgroundVisible != a3)
  {
    self->__backgroundVisible = a3;
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      backgroundVisible = self->__backgroundVisible;
      v6[0] = 67109120;
      v6[1] = backgroundVisible;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "background visibility state did change: %{BOOL}d", (uint8_t *)v6, 8u);
    }

    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (BOOL)_isToolStatePersistenceEnabled
{
  int v3;
  char v4;
  BOOL result;

  v3 = objc_msgSend((id)objc_opt_class(), "_defaultValueForToolStatePersistenceEnabled");
  v4 = !-[PKToolPicker _useNewAutosaveNameBehavior](self, "_useNewAutosaveNameBehavior");
  result = v4 & v3;
  if ((v4 & 1) == 0)
  {
    if (v3)
      return self->_stateAutosaveName != 0;
  }
  return result;
}

- (void)_setWantsClearBackgroundColorInCompactSize:(BOOL)a3
{
  if (self->__wantsClearBackgroundColorInCompactSize != a3)
  {
    self->__wantsClearBackgroundColorInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)_setWantsUndoRedoButtonsVisibleInCompactSize:(BOOL)a3
{
  if (self->__wantsUndoRedoButtonsVisibleInCompactSize != a3)
  {
    self->__wantsUndoRedoButtonsVisibleInCompactSize = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)setStateAutosaveName:(NSString *)stateAutosaveName
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;
  NSString *v10;
  NSObject *v11;
  NSString *v12;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = stateAutosaveName;
  v5 = self->_stateAutosaveName;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v8)
        goto LABEL_13;
    }
    else
    {

    }
    v9 = (NSString *)-[NSString copy](v7, "copy");
    v10 = self->_stateAutosaveName;
    self->_stateAutosaveName = v9;

    v11 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_stateAutosaveName;
      v13 = 138477827;
      v14 = v12;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Did change state autosave name to: %{private}@", (uint8_t *)&v13, 0xCu);
    }

    if (-[PKToolPicker _useNewAutosaveNameBehavior](self, "_useNewAutosaveNameBehavior") && !self->_stateAutosaveName)
      -[PKToolPicker _restoreToolPickerStateFromRepresentation:notify:](self, "_restoreToolPickerStateFromRepresentation:notify:", self->_originalToolPickerStateRepresentation, 1);
    else
      -[PKToolPicker _restoreToolPickerStateNotify:](self, "_restoreToolPickerStateNotify:", 1);
  }
LABEL_13:

}

- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  if (self->_overrideUserInterfaceStyle != overrideUserInterfaceStyle)
  {
    self->_overrideUserInterfaceStyle = overrideUserInterfaceStyle;
    -[PKToolPicker _updateUI](self, "_updateUI");
    -[PKToolPicker _updateUserInterfaceStyle](self, "_updateUserInterfaceStyle");
  }
}

- (void)setColorUserInterfaceStyle:(UIUserInterfaceStyle)colorUserInterfaceStyle
{
  if (self->_colorUserInterfaceStyle != colorUserInterfaceStyle)
  {
    self->_colorUserInterfaceStyle = colorUserInterfaceStyle;
    -[PKToolPicker _updateUI](self, "_updateUI");
    -[PKToolPicker _updateUserInterfaceStyle](self, "_updateUserInterfaceStyle");
  }
}

- (void)setShowsDrawingPolicyControls:(BOOL)showsDrawingPolicyControls
{
  if (self->_showsDrawingPolicyControls != showsDrawingPolicyControls)
  {
    self->_showsDrawingPolicyControls = showsDrawingPolicyControls;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (CGRect)frameObscuredInView:(UIView *)view
{
  UIView *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  v4 = view;
  if (!v4)
    goto LABEL_5;
  -[PKToolPicker _paletteView](self, "_paletteView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  -[PKToolPicker _paletteView](self, "_paletteView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "useCompactSize");

  if ((v8 & 1) != 0)
  {
    -[PKToolPicker _paletteView](self, "_paletteView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKToolPicker _paletteView](self, "_paletteView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "convertRect:toView:", v4);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[UIView bounds](v4, "bounds");
    v34.origin.x = v19;
    v34.origin.y = v20;
    v34.size.width = v21;
    v34.size.height = v22;
    v31.origin.x = v12;
    v31.origin.y = v14;
    v31.size.width = v16;
    v31.size.height = v18;
    v32 = CGRectIntersection(v31, v34);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
  }
  else
  {
LABEL_5:
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGSize)_contentSize
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  if (-[PKToolPicker isVisible](self, "isVisible")
    && (-[PKToolPicker _paletteView](self, "_paletteView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "useCompactSize"),
        v3,
        !v4))
  {
    -[PKToolPicker _paletteView](self, "_paletteView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "palettePosition");
    if ((unint64_t)(v8 - 1) > 3)
      v9 = 0;
    else
      v9 = qword_1BE4FBEB0[v8 - 1];

    -[PKToolPicker _paletteView](self, "_paletteView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paletteSizeForEdge:", v9);
    v5 = v11;
    v6 = v12;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v13 = v5;
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_enableTapInteractionForWindow:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    if (!PKIsVisionDevice())
    {
      -[PKToolPicker set_pencilInteractionEnabledWhenNotVisible:](self, "set_pencilInteractionEnabledWhenNotVisible:", 1);
      -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)self, v4, 0, 0, 0);
      -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)self, 0, 0, 0, 0);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Unable to enable tap interaction for nil window", v6, 2u);
    }

  }
}

- (void)_disableTapInteractionWhenNotVisible
{
  -[PKToolPicker set_pencilInteractionEnabledWhenNotVisible:](self, "set_pencilInteractionEnabledWhenNotVisible:", 0);
}

+ (void)updateAllToolPickersWithGenerationToolAvailability
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_80);
}

void __66__PKToolPicker_updateAllToolPickersWithGenerationToolAvailability__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v0 = (id)_allToolPickers;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v7;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v4), "toolPicker", (_QWORD)v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_updateUI");

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v2);
  }

}

+ (id)_existingToolPickerForWindow:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)_allToolPickers;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "toolPicker", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "_isActiveToolPickerForWindow:", v4))
        {
          v12 = v10;
LABEL_16:

          goto LABEL_17;
        }
        if (v4)
        {
          objc_msgSend(a1, "existingPaletteViewForWindow:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && (objc_msgSend(v10, "_hasResponderRegisteredForWindow:", v4) & 1) != 0)
          {
            v13 = v10;

            goto LABEL_16;
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (BOOL)_isActiveToolPickerForWindow:(id)a3
{
  id v4;
  void *v5;
  PKToolPickerVisibility *toolPickerVisibility;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    toolPickerVisibility = self->_toolPickerVisibility;
    if (toolPickerVisibility)
    {
      v7 = -[PKToolPickerVisibility isActiveToolPickerForWindow:](toolPickerVisibility, "isActiveToolPickerForWindow:", v4);
    }
    else
    {
      +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:](PKPaletteViewInteraction, "existingPaletteViewInteractionForWindowScene:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[PKToolPicker _interaction](self, "_interaction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 == v8;

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)existingPaletteViewForWindow:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:](PKPaletteViewInteraction, "existingPaletteViewInteractionForWindowScene:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (PKToolPicker)sharedToolPickerForWindow:(UIWindow *)window
{
  UIWindow *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKToolPicker *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = window;
  -[UIWindow windowScene](v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)_perCanvasToolPickers;
    if (!_perCanvasToolPickers)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)_perCanvasToolPickers;
      _perCanvasToolPickers = v6;

      v5 = (void *)_perCanvasToolPickers;
    }
    objc_msgSend(v5, "objectForKey:", v4);
    v8 = (PKToolPicker *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[PKPaletteViewInteraction paletteViewInteractionForWindow:windowScene:](PKPaletteViewInteraction, "paletteViewInteractionForWindow:windowScene:", v3, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v8 = objc_alloc_init(PKToolPicker);
        -[PKToolPicker setStateAutosaveName:](v8, "setStateAutosaveName:", CFSTR("com.apple.PencilKit.shared"));
        -[PKToolPicker _setInteraction:](v8, "_setInteraction:", v9);
        -[PKToolPicker _updateUI](v8, "_updateUI");
        objc_msgSend((id)_perCanvasToolPickers, "setObject:forKey:", v8, v4);
        objc_msgSend(v9, "setDelegate:", v8);
      }
      else
      {
        v8 = 0;
      }

    }
    -[PKToolPicker _interaction](v8, "_interaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paletteView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[PKToolPicker _paletteViewDelegateProxy](v8, "_paletteViewDelegateProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKToolPicker _interaction](v8, "_interaction");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v14, "paletteView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDelegate:", v13);

      -[PKToolPicker _paletteView](v8, "_paletteView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend(v16, "isAnnotationSupportEnabled");

      if ((v14 & 1) == 0)
        -[PKToolPicker setColorUserInterfaceStyle:](v8, "setColorUserInterfaceStyle:", 0);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKToolPicker)init
{
  void *v2;
  void *v3;
  void *v4;
  PKToolPickerEraserItem *v5;
  PKToolPickerEraserItem *v6;
  PKToolPickerLassoItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKToolPickerRulerItem *v14;
  PKToolPicker *v15;
  void *v17;
  _QWORD v19[10];

  v19[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.pen"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.monoline"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.marker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v5 = [PKToolPickerEraserItem alloc];
  +[PKInkingTool defaultWidthForInkType:](PKInkingTool, "defaultWidthForInkType:", CFSTR("com.apple.ink.eraser"));
  v6 = -[PKToolPickerEraserItem initWithEraserType:width:](v5, "initWithEraserType:width:", 1);
  v19[3] = v6;
  v7 = objc_alloc_init(PKToolPickerLassoItem);
  v19[4] = v7;
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.pencil"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v8;
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.crayon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v9;
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.fountainpen"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v10;
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.watercolor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!PKIsVisionDevice())
  {
    v14 = objc_alloc_init(PKToolPickerRulerItem);
    objc_msgSend(v13, "insertObject:atIndex:", v14, 5);

  }
  v15 = -[PKToolPicker initWithToolItems:](self, "initWithToolItems:", v13, v17);

  return v15;
}

- (PKToolPicker)initWithToolItems:(id)a3
{
  id v4;
  char *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  int v31;
  __CFString *v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  PKToolPickerWeak *v48;
  void *v49;
  uint64_t v50;
  double v51;
  PKToolPickerPaletteViewDelegateProxy *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  uint8_t buf[4];
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKToolPicker;
  v5 = -[PKToolPicker init](&v61, sel_init);
  if (v5)
  {
    v6 = -[PKToolPickerItemManager initWithToolItems:]((id *)[PKToolPickerItemManager alloc], v4);
    v7 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v6;

    v5[91] = 1;
    v5[112] = 1;
    v5[106] = 1;
    +[PKContentVersionUtility sharedUtility]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 18) = -[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v8);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v10;

    v5[90] = 1;
    v5[87] = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v12;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v14 = *((_QWORD *)v5 + 7);
    if (v14)
      v15 = (void *)objc_msgSend(*(id *)(v14 + 16), "copy", (_QWORD)v57);
    else
      v15 = 0;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v58 != v18)
            objc_enumerationMutation(v15);
          v20 = *(id **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v21 = (void *)*((_QWORD *)v5 + 1);
          objc_msgSend(v20, "_tool", (_QWORD)v57);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);

          if (v20)
            objc_msgSend(v20[1], "addObject:", v5);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v17);
    }

    v23 = objc_msgSend(*((id *)v5 + 1), "indexOfObjectPassingTest:", &__block_literal_global_95);
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      v24 = 0;
    else
      v24 = v23;
    v5[80] = v23 != 0x7FFFFFFFFFFFFFFFLL;
    *((_QWORD *)v5 + 2) = v24;
    v25 = objc_msgSend(*((id *)v5 + 1), "indexOfObjectPassingTest:", &__block_literal_global_96, (_QWORD)v57);
    v26 = (void *)*((_QWORD *)v5 + 1);
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v26, "firstObject");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v63 = v27;
        _os_log_error_impl(&dword_1BE213000, v28, OS_LOG_TYPE_ERROR, "Unable to find a suitable tool to select by default, select: %{private}@", buf, 0xCu);
      }

      v29 = (void *)*((_QWORD *)v5 + 15);
      *((_QWORD *)v5 + 15) = v27;
    }
    else
    {
      objc_msgSend(v26, "objectAtIndex:");
      v30 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)*((_QWORD *)v5 + 15);
      *((_QWORD *)v5 + 15) = v30;
    }

    v31 = objc_msgSend((id)objc_opt_class(), "_defaultValueForToolStatePersistenceEnabled");
    if (objc_msgSend(v5, "_useNewAutosaveNameBehavior"))
    {
      if (v31)
        v32 = CFSTR("PKPaletteNamedDefaults");
      else
        v32 = 0;
      objc_storeStrong((id *)v5 + 16, v32);
    }
    *((_WORD *)v5 + 48) = 257;
    v5[110] = PKIsVisionDevice();
    v5[109] = PKIsVisionDevice();
    v5[111] = PKIsVisionDevice();
    if (PKIsVisionDevice())
      *(int64x2_t *)(v5 + 152) = vdupq_n_s64(1uLL);
    v5[108] = PKIsVisionDevice();
    v5[99] = 0;
    v5[100] = PKIsPadDevice();
    v5[101] = PKIsPadDevice();
    *((_WORD *)v5 + 51) = 1;
    v33 = *(_OWORD *)(MEMORY[0x1E0DC3298] + 16);
    *((_OWORD *)v5 + 18) = *MEMORY[0x1E0DC3298];
    *((_OWORD *)v5 + 19) = v33;
    *(_WORD *)(v5 + 83) = 1;
    *((_QWORD *)v5 + 35) = 0x4028000000000000;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)*((_QWORD *)v5 + 23);
    *((_QWORD *)v5 + 23) = v34;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v36;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v5, sel__handleFirstResponderDidChangeNotification_, *MEMORY[0x1E0DC5AF8], 0);

    if (!PKIsVisionDevice())
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObserver:selector:name:object:", v5, sel__handleWindowDidBecomeKeyNotification_, *MEMORY[0x1E0DC5608], 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v5, sel__handleHandwritingEducationPaneSettingsDidChange_, CFSTR("PKHandwritingEducationPaneSettingsDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v5, sel__recognitionLocaleIdentifierDidChange_, CFSTR("PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v5, sel__hasSeenPencilPairingUIDidChange_, *MEMORY[0x1E0DC5988], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v5, sel__textInputResponderDidReloadNotification_, *MEMORY[0x1E0DC5558], 0);

    v44 = (void *)_allToolPickers;
    if (!_allToolPickers)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)_allToolPickers;
      _allToolPickers = v45;

      v44 = (void *)_allToolPickers;
    }
    objc_msgSend(v44, "indexesOfObjectsPassingTest:", &__block_literal_global_112);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_allToolPickers, "removeObjectsAtIndexes:", v47);
    v48 = objc_alloc_init(PKToolPickerWeak);
    -[PKToolPickerWeak setToolPicker:](v48, "setToolPicker:", v5);
    objc_msgSend((id)_allToolPickers, "addObject:", v48);
    objc_msgSend(v5, "_tools");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");
    v51 = 7.0;
    if (v50 < 8)
      v51 = 5.0;
    *((double *)v5 + 34) = v51;

    v52 = -[PKToolPickerPaletteViewDelegateProxy initWithToolPicker:]([PKToolPickerPaletteViewDelegateProxy alloc], "initWithToolPicker:", v5);
    v53 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v52;

    objc_msgSend(v5, "_toolsState");
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v54;

    objc_msgSend(v5, "_restoreToolPickerStateNotify:", 0);
  }

  return (PKToolPicker *)v5;
}

uint64_t __34__PKToolPicker_initWithToolItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHandwritingInk");

  return v3;
}

uint64_t __34__PKToolPicker_initWithToolItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isRulerTool") ^ 1;
}

BOOL __34__PKToolPicker_initWithToolItems___block_invoke_110(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "toolPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKToolPicker;
  -[PKToolPicker dealloc](&v4, sel_dealloc);
}

- (PKToolPickerItemManager)_toolItemManager
{
  return self->_toolItemManager;
}

- (PKToolPickerItem)selectedToolItem
{
  void *v2;

  -[PKToolPickerItemManager itemForTool:]((id *)&self->_toolItemManager->super.isa, self->_selectedTool);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.pen"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PKToolPickerItem *)v2;
}

- (void)setSelectedToolItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKToolPicker setSelectedToolItemIdentifier:](self, "setSelectedToolItemIdentifier:", v4);

}

- (NSString)selectedToolItemIdentifier
{
  void *v2;
  void *v3;

  -[PKToolPicker selectedToolItem](self, "selectedToolItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSelectedToolItemIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[PKToolPickerItemManager toolForIdentifier:]((uint64_t)self->_toolItemManager, (uint64_t)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[PKToolPicker _setSelectedTool:saveState:updateUI:updateLastSelectedTool:](self, "_setSelectedTool:saveState:updateUI:updateLastSelectedTool:", v4, 1, 1, 1);
      v4 = v5;
    }

  }
}

- (NSArray)toolItems
{
  return (NSArray *)-[PKToolPickerItemManager toolItemsForTools:]((id *)&self->_toolItemManager->super.isa, self->_mutableTools);
}

- (void)_setEnabled:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 enabled;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->__enabled != a3)
  {
    self->__enabled = a3;
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      enabled = self->__enabled;
      v6[0] = 67109120;
      v6[1] = enabled;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Tool picker enabled state changed to: %{BOOL}d", (uint8_t *)v6, 8u);
    }

    -[PKToolPicker _updateToolPickerVisibility](self, "_updateToolPickerVisibility");
  }
}

- (void)_setWantsExternalVisibility:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (!PKIsVisionDevice())
  {
    v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
    }

  }
}

- (BOOL)_isLockedHidden
{
  return self->_wantsToolPickerHiddenCount > 0;
}

- (void)_lockHidden
{
  NSObject *v3;
  int64_t wantsToolPickerHiddenCount;
  int v5;
  PKToolPicker *v6;
  __int16 v7;
  int64_t v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ++self->_wantsToolPickerHiddenCount;
  v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    wantsToolPickerHiddenCount = self->_wantsToolPickerHiddenCount;
    v5 = 134218496;
    v6 = self;
    v7 = 2048;
    v8 = wantsToolPickerHiddenCount;
    v9 = 1024;
    v10 = -[PKToolPicker isVisible](self, "isVisible");
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "ToolPicker: %p, locking tool picker visibility hidden, count: %ld, isVisible: %{BOOL}d", (uint8_t *)&v5, 0x1Cu);
  }

  if (-[PKToolPicker isVisible](self, "isVisible"))
    -[PKToolPicker _updateToolPickerVisibility](self, "_updateToolPickerVisibility");
}

- (void)_unlockHidden
{
  int64_t wantsToolPickerHiddenCount;
  BOOL v3;
  int64_t v4;
  NSObject *v6;
  int64_t v7;
  int v8;
  PKToolPicker *v9;
  __int16 v10;
  int64_t v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  wantsToolPickerHiddenCount = self->_wantsToolPickerHiddenCount;
  v3 = wantsToolPickerHiddenCount < 1;
  v4 = wantsToolPickerHiddenCount - 1;
  if (!v3)
  {
    self->_wantsToolPickerHiddenCount = v4;
    v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = self->_wantsToolPickerHiddenCount;
      v8 = 134218496;
      v9 = self;
      v10 = 2048;
      v11 = v7;
      v12 = 1024;
      v13 = -[PKToolPicker isVisible](self, "isVisible");
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_INFO, "ToolPicker: %p, unlocking tool picker visibility hidden, count: %ld, isVisible: %{BOOL}d", (uint8_t *)&v8, 0x1Cu);
    }

    if (!self->_wantsToolPickerHiddenCount)
      -[PKToolPicker _updateToolPickerVisibility](self, "_updateToolPickerVisibility");
  }
}

- (NSString)_paletteViewStateRestorationDefaultsKey
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PKToolPicker _useNewAutosaveNameBehavior](self, "_useNewAutosaveNameBehavior")
    && (-[PKToolPicker stateAutosaveName](self, "stateAutosaveName"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(CFSTR("PKPaletteNamedDefaults"), "isEqualToString:", v3),
        v3,
        v4))
  {
    -[PKToolPicker stateAutosaveName](self, "stateAutosaveName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("PKPaletteNamedDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKToolPicker stateAutosaveName](self, "stateAutosaveName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PKToolPicker stateAutosaveName](self, "stateAutosaveName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("-%@"), v7);

    }
  }
  return (NSString *)v5;
}

- (void)setMaximumSupportedContentVersion:(PKContentVersion)maximumSupportedContentVersion
{
  void *v4;
  uint64_t v5;
  double v6;

  self->_maximumSupportedContentVersion = maximumSupportedContentVersion;
  -[PKToolPicker _tools](self, "_tools");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = 7.0;
  if (v5 < 8)
    v6 = 5.0;
  self->__interItemToolsSpacingInCompactSize = v6;

  -[PKToolPicker _updateNewInks](self, "_updateNewInks");
  -[PKToolPicker _updateUI](self, "_updateUI");
}

- (void)_setPresentsDetached:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (!PKIsVisionDevice())
  {
    v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
    }

  }
}

- (void)_setDoneButtonVisible:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (!PKIsVisionDevice())
  {
    v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
    }

  }
}

+ (BOOL)_defaultValueForToolStatePersistenceEnabled
{
  int v2;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("PKShouldRestoreToolPickerState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v2 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PKShouldRestoreToolPickerState"));
    else
      v2 = 1;
    v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v2)
        v7 = CFSTR("YES");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Should restore tool picker state: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)_restoreToolPickerState
{
  -[PKToolPicker _restoreToolPickerStateNotify:](self, "_restoreToolPickerStateNotify:", 0);
}

- (void)_restoreToolPickerStateNotify:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  os_log_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[PKToolPicker _isToolStatePersistenceEnabled](self, "_isToolStatePersistenceEnabled");
  v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
  v7 = v6;
  if (v5)
  {
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138477827;
      v18 = v9;
      _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Restore state for name: %{private}@", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject dictionaryForKey:](v7, "dictionaryForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PKPaletteTools"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        -[PKToolPicker _restoreToolPickerStateFromRepresentation:notify:](self, "_restoreToolPickerStateFromRepresentation:notify:", v12, v3);
      }
      else
      {
        v14 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412290;
          v18 = v16;
          _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "Missing tools array to restore state for: %@", (uint8_t *)&v17, 0xCu);

        }
        v13 = 0;
      }
    }
    else
    {
      v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v15;
        _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Missing defaults dictionary to restore state for: %@", (uint8_t *)&v17, 0xCu);

      }
    }

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Tried to restore state but persistence is disabled.", (uint8_t *)&v17, 2u);
  }

}

- (void)_restoreToolPickerStateFromRepresentation:(id)a3 notify:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  PKTool *v42;
  _BOOL4 v43;
  PKToolPicker *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id obj;
  PKTool *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v43 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  -[PKToolPicker _validatedEncodedToolsArray:](self, "_validatedEncodedToolsArray:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker _keyEncodedToolsByIdentifier:](PKToolPicker, "_keyEncodedToolsByIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKToolPicker toolItems](self, "toolItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = self;
  v51 = self->_selectedTool;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v6;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v55;
    v48 = v7;
    v49 = v5;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v55 != v52)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "_tool");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ink");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.ink.custom")) & 1) != 0
            || (objc_msgSend(v5, "objectForKeyedSubscript:", v14), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v11 = 0;
              goto LABEL_15;
            }
            v16 = CFSTR("com.apple.ink.objectEraser");

            objc_msgSend(v5, "objectForKeyedSubscript:", v16);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v11 = (void *)v17;
              v14 = v16;
              goto LABEL_15;
            }
            v14 = CFSTR("com.apple.ink.eraser");

            objc_msgSend(v5, "objectForKeyedSubscript:", v14);
            v15 = objc_claimAutoreleasedReturnValue();
          }
          v11 = (void *)v15;
        }
LABEL_15:
        objc_msgSend(v9, "_tool");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v11)
        {
          v23 = v18;
          goto LABEL_32;
        }
        v20 = objc_opt_class();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("properties"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        PKDynamicCast(v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v19;
        if (v22)
        {
          objc_msgSend(v19, "ink");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v19, "ink");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "version");

          }
          else
          {
            v26 = -1;
          }

          +[PKInk inkWithIdentifier:properties:inkVersion:](PKInk, "inkWithIdentifier:properties:inkVersion:", v14, v22, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_opt_class();
          PKDynamicCast(v28, v19);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(v27, "color");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (id)objc_msgSend(v29, "copyWithScrubbedColor:", v30);

            objc_msgSend(v27, "weight");
            v23 = (void *)objc_msgSend(v31, "copyWithScrubbedWeight:");
            v32 = v19;
            goto LABEL_27;
          }
          objc_msgSend(v27, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.ink.custom"));

          v23 = v19;
          if ((v34 & 1) == 0)
          {
            v31 = v27;
            objc_msgSend(v19, "_configuration");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "supportsColor");

            if ((v36 & 1) == 0)
            {
              objc_msgSend(v19, "ink");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "color");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v31, v38);
              v47 = objc_claimAutoreleasedReturnValue();

              v31 = (id)v47;
            }
            objc_msgSend(v19, "_configuration");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKTool _toolWithInk:configuration:](PKTool, "_toolWithInk:configuration:", v31, v32);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
          }
          objc_msgSend(v19, "_toolPickerItemIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_setToolPickerItemIdentifier:", v39);

          v7 = v48;
          v5 = v49;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isSelected"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "BOOLValue");

        if (v41)
        {
          v42 = v23;

          v51 = v42;
        }

LABEL_32:
        objc_msgSend(v7, "addObject:", v23);

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v53);
  }

  -[PKToolPicker _resetTools:selectedTool:notify:](v44, "_resetTools:selectedTool:notify:", v7, v51, v43);
  -[PKToolPicker _updateUI](v44, "_updateUI");

}

+ (id)_keyEncodedToolsByIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"), (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PKDynamicCast(v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v13);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_validatedEncodedToolsArray:(id)a3
{
  id v3;
  os_log_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v4 = (os_log_t)v3;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v5)
    {
      v6 = v5;
      v30 = v3;
      v7 = *(_QWORD *)v37;
      v8 = v4;
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("properties"));
                v12 = objc_claimAutoreleasedReturnValue();
                if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  {
                    v21 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v21);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
                    v22 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v42 = v32;
                    v43 = 2112;
                    v44 = v22;
                    v23 = (void *)v22;
                    _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class for properties dictionary: %{public}@ from: %@", buf, 0x16u);

                  }
                }
                else
                {
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isSelected"));
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                    {
                      v24 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v24);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v42 = v33;
                      v43 = 2112;
                      v44 = (uint64_t)v31;
                      _os_log_error_impl(&dword_1BE213000, v15, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class for selected bit: %{public}@ from: %@", buf, 0x16u);

                    }
                  }
                  else
                  {
                    objc_msgSend(v35, "addObject:", v10);
                  }
                }
                goto LABEL_22;
              }
              v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
              if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
LABEL_21:
                v12 = v13;
LABEL_22:

                v4 = v8;
                goto LABEL_23;
              }
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v42 = v14;
              v43 = 2112;
              v44 = (uint64_t)v20;
              _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class for identifier: %{public}@ from: %@", buf, 0x16u);

            }
            else
            {
              v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
              if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                goto LABEL_21;
              -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v42 = v14;
              _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary missing identifier from: %@", buf, 0xCu);
            }

            goto LABEL_21;
          }
          v12 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v17;
            v43 = 2112;
            v44 = (uint64_t)v18;
            _os_log_error_impl(&dword_1BE213000, v12, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class: %{public}@ from: %@", buf, 0x16u);

            v4 = v8;
          }
          v11 = v12;
LABEL_23:

          ++v9;
        }
        while (v6 != v9);
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        v6 = v25;
        if (!v25)
        {
          v3 = v30;
          break;
        }
      }
    }
  }
  else
  {
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v28;
      v43 = 2112;
      v44 = (uint64_t)v29;
      _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, "Encoded tools array has wrong class: %{public}@ from: %@", buf, 0x16u);

    }
    v35 = (id)MEMORY[0x1E0C9AA60];
  }

  return v35;
}

- (void)_saveToolPickerState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[PKToolPicker _isToolStatePersistenceEnabled](self, "_isToolStatePersistenceEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject dictionaryForKey:](v3, "dictionaryForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKToolPicker _toolsState](self, "_toolsState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("PKPaletteTools"));

    -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v3, "setObject:forKey:", v6, v8);

    v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PKToolPicker _paletteViewStateRestorationDefaultsKey](self, "_paletteViewStateRestorationDefaultsKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138477827;
      v12 = v10;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Did save state for name: %{private}@", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Tried to save state but persistence is disabled.", (uint8_t *)&v11, 2u);
    }
  }

}

- (NSArray)_toolsState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PKToolPicker toolItems](self, "toolItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKToolPicker selectedToolItemIdentifier](self, "selectedToolItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "_dictionaryRepresentation", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v12);
            objc_msgSend(v15, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isSelected"));
            v16 = objc_msgSend(v15, "copy");

            v12 = (void *)v16;
          }
        }
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v17;
}

- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v5 = a5;
  v6 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "keyboardSceneDelegate inputViewSetVisibilityDidChange isVisible: %d, includedReset: %d", (uint8_t *)v10, 0xEu);
  }

  if (v6)
    v9 = 1;
  else
    v9 = v5 & ~PKIsPhoneDevice();
  -[PKToolPicker _setInputViewVisible:](self, "_setInputViewVisible:", v9);
  -[PKToolPicker _updateToolPickerVisibility](self, "_updateToolPickerVisibility");
}

- (void)paletteViewInteractionDidActivate:(id)a3
{
  -[PKToolPicker _setInputViewVisible:](self, "_setInputViewVisible:", 1);
  -[PKToolPicker _updateUI](self, "_updateUI");
}

- (void)_handleHandwritingEducationPaneSettingsDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (-[PKToolPicker isVisible](self, "isVisible", a3))
  {
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Handle handwriting education pane settings did change notification", v6, 2u);
    }

    -[PKToolPicker _paletteView](self, "_paletteView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handwritingEducationPaneSettingsDidChange");

  }
}

- (PKPaletteHostView)_paletteHostView
{
  void *toolPickerVisibility;

  toolPickerVisibility = self->_toolPickerVisibility;
  if (!toolPickerVisibility)
    toolPickerVisibility = self->__interaction;
  objc_msgSend(toolPickerVisibility, "paletteHostView");
  return (PKPaletteHostView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_updatePaletteTraitCollection:(id)a3
{
  -[PKToolPicker _updatePaletteUserInterfaceStyle:](self, "_updatePaletteUserInterfaceStyle:", objc_msgSend(a3, "userInterfaceStyle"));
}

- (void)_updatePaletteUserInterfaceStyle:(int64_t)a3
{
  -[PKPaletteViewInteraction _updatePaletteUserInterfaceStyle:](self->__interaction, "_updatePaletteUserInterfaceStyle:", a3);
  -[PKToolPicker _updateUserInterfaceStyle](self, "_updateUserInterfaceStyle");
}

- (void)_updateUserInterfaceStyle
{
  void *v2;
  void *v3;
  void *v4;

  +[PKToolPicker _windowSceneForToolPicker:](PKToolPicker, "_windowSceneForToolPicker:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateUserInterfaceStyle");

    v2 = v4;
  }

}

- (BOOL)_internalClassesAcceptingFirstResponderContainsObject:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)_internalClassWantsToolPicker:(id)a3 visibleForResponder:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "_wantsToolPickerVisible:", v5);
    goto LABEL_29;
  }
  if (!objc_msgSend(v5, "_internalClassesAcceptingFirstResponderContainsObject:", v6))
  {
    v7 = 0;
    goto LABEL_29;
  }
  v8 = v6;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "_firstRespondersForVisibleUI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v11)
  {
    v7 = 0;
    goto LABEL_28;
  }
  v12 = v11;
  v23 = v6;
  v24 = v10;
  v13 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = 0;
          goto LABEL_22;
        }
        objc_msgSend(v15, "view");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "window");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 == v19)
        {
          v20 = v5;
          v21 = objc_msgSend(v5, "_wasVisibleBeforeResponderChanges");

          if (v21)
          {
            if ((objc_msgSend(v8, "isDescendantOfView:", v17) & 1) != 0
              || (NSClassFromString(CFSTR("ICInkToolPickerResponder")),
                  objc_opt_class(),
                  (objc_opt_isKindOfClass() & 1) != 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {

              v7 = 1;
              v5 = v20;
              v6 = v23;
              v10 = v24;
              goto LABEL_28;
            }
          }
          v5 = v20;
          v10 = v24;
        }
        else
        {

        }
      }
LABEL_22:

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
      continue;
    break;
  }
  v7 = 0;
  v6 = v23;
LABEL_28:

LABEL_29:
  return v7;
}

+ (BOOL)_textInputWantsToolPickerVisible:(id)a3 forFirstResponder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.mobilenotes"));

  if (!v10)
    goto LABEL_12;
  objc_msgSend(v6, "_paletteView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowFirstResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "_paletteView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowFirstResponder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "textInputSource");

  }
  else
  {
    v15 = +[PKTextInputUtilities responderTextInputSource:](PKTextInputUtilities, "responderTextInputSource:", v7);
  }
  if (v15 != 3 || !objc_msgSend(v6, "_isHandwritingToolSelected"))
  {
    objc_msgSend(v6, "_isHandwritingToolSelected");
LABEL_12:
    LOBYTE(v18) = 0;
    goto LABEL_13;
  }
  NSClassFromString(CFSTR("ICTextView"));
  v16 = v7;
  if (!v16)
    goto LABEL_15;
  while ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v16, "nextResponder");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v17;
    if (!v17)
      goto LABEL_15;
  }
  objc_msgSend(v16, "_responderWindow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "windowScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_windowSceneForToolPicker:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 == v22)
  {
    objc_msgSend(v16, "findInteraction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v23, "isFindNavigatorVisible") ^ 1;

  }
  else
  {
LABEL_15:
    LOBYTE(v18) = 0;
  }

LABEL_13:
  return v18;
}

- (void)_tellDelegateToHideToolPicker
{
  void *v3;
  id v4;

  -[PKToolPicker _delegateForSelector:](self, "_delegateForSelector:", sel__toolPicker_shouldSetVisible_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_toolPicker:shouldSetVisible:", self, 0);
    v3 = v4;
  }

}

- (PKToolPickerPopoverPresentationConfiguring)_popoverPresentationConfiguration
{
  PKToolPicker *v3;

  if (-[PKToolPicker isVisible](self, "isVisible"))
    v3 = self;
  else
    v3 = 0;
  return (PKToolPickerPopoverPresentationConfiguring *)v3;
}

- (NSArray)passthroughViews
{
  void *v2;
  void *v3;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "palettePopoverPassthroughViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)permittedArrowDirections
{
  void *v2;
  unint64_t v3;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "palettePopoverPermittedArrowDirections");

  return v3;
}

- (UIEdgeInsets)layoutSceneMargins
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "palettePopoverLayoutSceneMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

+ (BOOL)_canShowHandwritingTool
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (PKIsVisionDevice())
    return 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3AC8], "hasSeenPencilPairingUI");
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BOOLForKey:", CFSTR("PKForceShowHandwritingTool"));

  }
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.dt.xctest.tool"));

    if ((v9 & 1) != 0)
      return 1;
  }
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recognitionLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 != 0;

  return v2;
}

- (void)_setShowsHandwritingTool:(BOOL)a3
{
  int v3;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _BOOL4 showsHandwritingTool;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (PKIsVisionDevice())
  {
    v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Can't show the handwriting tool on this platform.", (uint8_t *)&v11, 2u);
    }

    self->__showsHandwritingTool = 0;
  }
  else if (self->__showsHandwritingTool != v3)
  {
    self->__showsHandwritingTool = v3;
    if (v3)
      v3 = objc_msgSend((id)objc_opt_class(), "_canShowHandwritingTool");
    v6 = -[PKToolPicker _hasHandwritingTool](self, "_hasHandwritingTool");
    v7 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      showsHandwritingTool = self->__showsHandwritingTool;
      v11 = 67109120;
      LODWORD(v12) = showsHandwritingTool;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Should show handwriting tool: %d", (uint8_t *)&v11, 8u);
    }

    if (v3 != v6)
    {
      v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFSTR("HIDDEN");
        if (v3)
          v10 = CFSTR("VISIBLE");
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Handwriting tool state: %@", (uint8_t *)&v11, 0xCu);
      }

      -[PKToolPicker _updateUI](self, "_updateUI");
      -[PKToolPicker _saveToolPickerState](self, "_saveToolPickerState");
    }
  }
}

- (id)_handwritingTool
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableArray indexOfObjectPassingTest:](self->_mutableTools, "indexOfObjectPassingTest:", &__block_literal_global_155);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_mutableTools, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

uint64_t __32__PKToolPicker__handwritingTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHandwritingInk");

  return v3;
}

- (BOOL)_isHandwritingToolSelected
{
  void *v2;
  char v3;

  -[PKTool ink](self->_selectedTool, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHandwritingInk");

  return v3;
}

- (void)_updateHandwritingInputAssistantItems
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = -[PKToolPicker _isHandwritingToolSelected](self, "_isHandwritingToolSelected");
  v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Update handwriting assistant items.", v6, 2u);
    }

    -[PKToolPicker _paletteView](self, "_paletteView");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateHandwritingAssistantItems](v4, "updateHandwritingAssistantItems");
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Can't update handwriting assistant items if handwriting tool isn't the selected tool.", buf, 2u);
  }

}

- (BOOL)_isCanvasGenerationToolSelected
{
  void *v2;
  char v3;

  -[PKTool ink](self->_selectedTool, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isGenerationTool");

  return v3;
}

- (void)_textInputResponderDidReloadNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v6, 0xCu);
  }

  -[PKToolPicker _updateHandwritingInputAssistantItems](self, "_updateHandwritingInputAssistantItems");
}

- (NSArray)_tools
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableTools, "copy");
}

- (void)_addTool:(id)a3
{
  NSMutableArray *mutableTools;
  id v5;

  mutableTools = self->_mutableTools;
  v5 = a3;
  -[PKToolPicker _insertTool:atIndex:](self, "_insertTool:atIndex:", v5, -[NSMutableArray count](mutableTools, "count"));

}

- (void)_addTool:(id)a3 updateUI:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableArray *mutableTools;
  id v7;

  v4 = a4;
  mutableTools = self->_mutableTools;
  v7 = a3;
  -[PKToolPicker _insertTool:atIndex:updateUI:](self, "_insertTool:atIndex:updateUI:", v7, -[NSMutableArray count](mutableTools, "count"), v4);

}

- (void)_insertTool:(id)a3 atIndex:(unint64_t)a4
{
  -[PKToolPicker _insertTool:atIndex:updateUI:](self, "_insertTool:atIndex:updateUI:", a3, a4, 1);
}

- (void)_insertTool:(id)a3 atIndex:(unint64_t)a4 updateUI:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (-[PKToolPicker _canInsertTool:](self, "_canInsertTool:", v8))
  {
    -[NSMutableArray insertObject:atIndex:](self->_mutableTools, "insertObject:atIndex:", v8, a4);
    if (v5)
      -[PKToolPicker _updateUI](self, "_updateUI");
    -[PKToolPickerItemManager _addTool:]((uint64_t)self->_toolItemManager, v8);
  }
  else
  {
    v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Can't insert tool: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (BOOL)_canInsertTool:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "_isLassoTool");
  v6 = -[PKToolPicker _hasLassoTool](self, "_hasLassoTool");
  if (v5)
    goto LABEL_4;
  objc_msgSend(v4, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isEraserInk");

  v6 = -[PKToolPicker _hasEraserTool](self, "_hasEraserTool");
  if (v8
    || (objc_msgSend(v4, "ink"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "_isHandwritingInk"),
        v9,
        v6 = -[PKToolPicker _hasHandwritingTool](self, "_hasHandwritingTool"),
        v10))
  {
LABEL_4:
    v11 = !v6;
  }
  else
  {
    v11 = -[PKToolPicker _indexOfTool:](self, "_indexOfTool:", v4) == 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (void)_removeTool:(id)a3
{
  -[PKToolPicker _removeTool:updateUI:](self, "_removeTool:updateUI:", a3, 1);
}

- (void)_removeTool:(id)a3 updateUI:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[PKToolPicker _canRemoveTool:](self, "_canRemoveTool:", v6))
  {
    -[NSMutableArray removeObjectAtIndex:](self->_mutableTools, "removeObjectAtIndex:", -[PKToolPicker _indexOfTool:](self, "_indexOfTool:", v6));
    if (v4)
      -[PKToolPicker _updateUI](self, "_updateUI");
    -[PKToolPickerItemManager _removeTool:]((uint64_t)self->_toolItemManager, v6);
  }
  else
  {
    v7 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Can't remove tool: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_removeToolsAtIndexes:(id)a3
{
  -[PKToolPicker _removeToolsAtIndexes:updateUI:](self, "_removeToolsAtIndexes:updateUI:", a3, 1);
}

- (void)_removeToolsAtIndexes:(id)a3 updateUI:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableArray *mutableTools;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PKToolPicker *v13;

  v4 = a4;
  mutableTools = self->_mutableTools;
  v7 = a3;
  v8 = (void *)-[NSMutableArray copy](mutableTools, "copy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__PKToolPicker__removeToolsAtIndexes_updateUI___block_invoke;
  v11[3] = &unk_1E7777F10;
  v10 = v8;
  v12 = v10;
  v13 = self;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v11);
  v9 = objc_msgSend(v7, "count");

  if (v9 && v4)
    -[PKToolPicker _updateUI](self, "_updateUI");

}

void __47__PKToolPicker__removeToolsAtIndexes_updateUI___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_removeTool:updateUI:", v3, 0);

}

- (BOOL)_canRemoveTool:(id)a3
{
  PKTool *v4;
  char v5;
  void *v6;

  v4 = (PKTool *)a3;
  if (-[PKToolPicker _indexOfTool:](self, "_indexOfTool:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else if (self->_selectedTool == v4)
  {
    -[PKTool ink](v4, "ink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_isGenerationTool");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_resetTools:(id)a3 selectedTool:(id)a4
{
  -[PKToolPicker _resetTools:selectedTool:notify:](self, "_resetTools:selectedTool:notify:", a3, a4, 1);
}

- (void)_resetTools:(id)a3 selectedTool:(id)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  PKTool *v8;
  id v9;
  PKTool **p_selectedTool;
  PKTool *v11;
  unint64_t v12;
  NSMutableArray *mutableTools;
  uint64_t v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  PKTool *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  unint64_t v23;
  NSMutableArray *v25;
  NSMutableArray *v26;
  NSObject *v27;
  PKTool *v28;
  PKTool *selectedTool;
  NSObject *v30;
  PKTool *v31;
  PKTool *v32;
  NSObject *v33;
  PKTool *v34;
  NSObject *v35;
  void *v36;
  _BOOL4 v37;
  PKTool *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  PKTool *v45;
  uint64_t v46;

  v5 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = (PKTool *)a3;
  v9 = a4;
  p_selectedTool = &self->_selectedTool;
  v11 = self->_selectedTool;
  if ((-[NSMutableArray isEqual:](self->_mutableTools, "isEqual:", v8) & 1) != 0)
  {
    v12 = -[PKToolPicker _indexOfTool:tools:](self, "_indexOfTool:tools:", v9, v8);
    mutableTools = self->_mutableTools;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray firstObject](mutableTools, "firstObject");
    else
      -[NSMutableArray objectAtIndex:](mutableTools, "objectAtIndex:");
    v14 = objc_claimAutoreleasedReturnValue();
    v32 = *p_selectedTool;
    *p_selectedTool = (PKTool *)v14;

LABEL_28:
    if (v11 != *p_selectedTool && v5)
    {
      v33 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *p_selectedTool;
        *(_DWORD *)buf = 138412290;
        v45 = v34;
        _os_log_impl(&dword_1BE213000, v33, OS_LOG_TYPE_DEFAULT, "Did reset selected tool to %@", buf, 0xCu);
      }

      -[PKToolPicker _notifySelectedToolDidChange](self, "_notifySelectedToolDidChange");
    }
    goto LABEL_36;
  }
  if (-[PKToolPicker _canResetToolsFrom:](self, "_canResetToolsFrom:", v8))
  {
    v37 = v5;
    v36 = (void *)-[NSMutableArray copy](self->_mutableTools, "copy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[PKTool count](v8, "count"));
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_mutableTools;
    self->_mutableTools = v15;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = v8;
    v17 = v8;
    v18 = -[PKTool countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v17);
          v22 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[PKToolPicker _addTool:updateUI:](self, "_addTool:updateUI:", v22, 0);
          v23 = -[PKToolPicker _indexOfTool:](self, "_indexOfTool:", v22);
          if (v22 == v9 && v23 != 0x7FFFFFFFFFFFFFFFLL)
            objc_storeStrong((id *)&self->_selectedTool, a4);
        }
        v19 = -[PKTool countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v19);
    }

    if (!-[NSMutableArray count](self->_mutableTools, "count"))
    {
      v25 = (NSMutableArray *)objc_msgSend(v36, "mutableCopy");
      v26 = self->_mutableTools;
      self->_mutableTools = v25;

      v27 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v27, OS_LOG_TYPE_DEFAULT, "Unable to restore tools. Did reset tools to last copy", buf, 2u);
      }

    }
    v5 = v37;
    if (-[PKToolPicker _indexOfTool:](self, "_indexOfTool:", self->_selectedTool) == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray firstObject](self->_mutableTools, "firstObject");
      v28 = (PKTool *)objc_claimAutoreleasedReturnValue();
      selectedTool = self->_selectedTool;
      self->_selectedTool = v28;

      v30 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = *p_selectedTool;
        *(_DWORD *)buf = 138412290;
        v45 = v31;
        _os_log_impl(&dword_1BE213000, v30, OS_LOG_TYPE_DEFAULT, "Unable to restore last selected tool. Did reset selected tool to %@", buf, 0xCu);
      }

    }
    v8 = v38;
    goto LABEL_28;
  }
  v35 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v8;
    _os_log_impl(&dword_1BE213000, v35, OS_LOG_TYPE_DEFAULT, "Can't reset tools to: %@", buf, 0xCu);
  }

LABEL_36:
}

- (BOOL)_canResetToolsFrom:(id)a3
{
  return objc_msgSend(a3, "count") != 0;
}

- (unint64_t)_indexOfTool:(id)a3
{
  return -[PKToolPicker _indexOfTool:tools:](self, "_indexOfTool:tools:", a3, self->_mutableTools);
}

- (unint64_t)_indexOfTool:(id)a3 tools:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_toolPickerItemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_toolPickerItemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) != 0)
        break;
      if (++v7 >= objc_msgSend(v6, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __38__PKToolPicker__lastSelectedToolIndex__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isLassoTool");
}

uint64_t __32__PKToolPicker__eraserToolIndex__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isEraserTool");
}

uint64_t __31__PKToolPicker__rulerToolIndex__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isRulerTool");
}

- (void)_performPencilPreferredActionSwitchEraser
{
  id v2;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performPencilPreferredActionSwitchEraser");

}

- (void)_performPencilPreferredActionSwitchPrevious
{
  id v2;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performPencilPreferredActionSwitchPrevious");

}

- (void)_performPencilPreferredActionShowColorPalette
{
  id v2;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performPencilPreferredActionShowColorPalette");

}

- (void)setSelectionMask:(unint64_t)a3
{
  -[PKToolPicker _setSelectionMask:updateUI:](self, "_setSelectionMask:updateUI:", a3, 1);
}

- (void)_setSelectionMask:(unint64_t)a3 updateUI:(BOOL)a4
{
  if (self->_selectionMask != a3)
  {
    self->_selectionMask = a3;
    if (a4)
      -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)setColorSwatchesVisible:(BOOL)a3
{
  if (self->_colorSwatchesVisible != a3)
  {
    self->_colorSwatchesVisible = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (void)setPrefersLargeContextualEditingUI:(BOOL)a3
{
  if (self->_prefersLargeContextualEditingUI != a3)
  {
    self->_prefersLargeContextualEditingUI = a3;
    -[PKToolPicker _updateUI](self, "_updateUI");
  }
}

- (BOOL)_startOpacityEditing
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKToolPicker _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v9;

    if (v11)
    {
      -[PKToolPicker _paletteView](self, "_paletteView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startOpacityEditing");

      -[PKToolPicker _paletteView](self, "_paletteView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "opacityEditingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_toolPicker:startEditingOpacityWithAccessoryView:", self, v14);

      v10 = 1;
      v4 = v11;
      goto LABEL_12;
    }
    return 0;
  }
  else
  {
LABEL_9:
    v10 = 0;
LABEL_12:

  }
  return v10;
}

- (void)_endOpacityEditing
{
  id v2;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOpacityEditing");

}

- (void)set_temporarySelectionDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__temporarySelectionDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__temporarySelectionDelegate, obj);
    -[PKToolPicker _paletteView](self, "_paletteView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateColorPickerSelectedColor");

    v5 = obj;
  }

}

- (void)_dismissPopovers
{
  id v2;

  -[PKToolPicker _paletteView](self, "_paletteView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissPalettePopoverWithCompletion:", 0);

}

- (void)_canvasViewWillBeginDrawing:(id)a3
{
  if (PKIsVisionDevice())
    -[PKToolPicker _dismissPopovers](self, "_dismissPopovers");
}

- (void)_setContextMenuPresented:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 contextMenuPresented;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->__contextMenuPresented != a3)
  {
    self->__contextMenuPresented = a3;
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      contextMenuPresented = self->__contextMenuPresented;
      v6[0] = 67109120;
      v6[1] = contextMenuPresented;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Context menu presented state did change: %d", (uint8_t *)v6, 8u);
    }

    -[PKToolPicker _updateToolPickerVisibilityContextMenuPresentedDidChange:](self, "_updateToolPickerVisibilityContextMenuPresentedDidChange:", 1);
  }
}

- (void)_setOverlapsWindow:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  if (PKIsVisionDevice() && self->__overlapsMainWindow != v3)
  {
    v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
    }

  }
}

- (BOOL)_useNewAutosaveNameBehavior
{
  return dyld_program_sdk_at_least();
}

- (void)_paletteContentSizeDidChange
{
  -[PKToolPickerVisibility contentSizeDidChange](self->_toolPickerVisibility, "contentSizeDidChange");
}

- (void)_setSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4
{
  id v5;

  v5 = -[PKTool _copyWithColor:](self->_selectedTool, "_copyWithColor:", a3, a4);
  -[PKToolPicker _setSelectedTool:saveState:updateUI:updateLastSelectedTool:](self, "_setSelectedTool:saveState:updateUI:updateLastSelectedTool:", v5, 1, 1, 0);

}

- (void)_handleDidInvokeAddTextBox
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Handle did invoke add text-box", buf, 2u);
    }

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 184), "copy");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v15 = v8;
              _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Invoke add text-box on observer: %{private}@", buf, 0xCu);
            }

            objc_msgSend(v8, "_toolPickerDidInvokeAddTextBox:", a1);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      }
      while (v5);
    }

  }
}

- (void)_handleInsertStickerFromItemProvider:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v18 = v3;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Handle did invoke insert sticker from item provider: %{private}@", buf, 0xCu);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 184), "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = os_log_create("com.apple.pencilkit", "ToolPicker");
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v18 = v10;
              _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Invoke insert sticker on observer: %{private}@", buf, 0xCu);
            }

            objc_msgSend(v10, "_toolPickerDidInvokeInsertSticker:fromItemProvider:", a1, v3);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (double)_fullScreenWindowScaleFactor
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  if (!a1)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  +[PKPaletteView _makeScaleFactorPolicy](PKPaletteView, "_makeScaleFactorPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaleFactorForWindowBounds:", v3, v5, v7, v9);
  v12 = v11;

  return v12;
}

- (void)toolPickerItemDidChange:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSMutableArray *mutableTools;
  void *v9;
  void *v10;
  void *v11;
  PKTool *v12;
  PKTool *selectedTool;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "_tool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKToolPicker _indexOfTool:](self, "_indexOfTool:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    -[NSMutableArray objectAtIndexedSubscript:](self->_mutableTools, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v7) & 1) == 0)
    {
      -[PKToolPicker _dismissPopovers](self, "_dismissPopovers");
      mutableTools = self->_mutableTools;
      objc_msgSend(v14, "_tool");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray replaceObjectAtIndex:withObject:](mutableTools, "replaceObjectAtIndex:withObject:", v6, v9);

      objc_msgSend(v14, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTool _toolPickerItemIdentifier](self->_selectedTool, "_toolPickerItemIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v10, "isEqualToString:", v11);

      if ((_DWORD)v9)
      {
        objc_msgSend(v14, "_tool");
        v12 = (PKTool *)objc_claimAutoreleasedReturnValue();
        selectedTool = self->_selectedTool;
        self->_selectedTool = v12;

      }
      -[PKToolPicker _updateUI](self, "_updateUI");
      -[PKToolPicker _saveToolPickerState](self, "_saveToolPickerState");
    }

  }
}

- (void)toolPickerItemReloadImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKToolPicker _paletteView](self, "_paletteView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reloadImageForToolItem:", v4);

}

- (BOOL)_showsHandwritingTool
{
  return self->__showsHandwritingTool;
}

- (NSString)stateAutosaveName
{
  return self->_stateAutosaveName;
}

- (void)set_wasVisibleBeforeResponderChanges:(BOOL)a3
{
  self->_wasVisibleBeforeResponderChanges = a3;
}

- (BOOL)_didCalculateVisibleBeforeResponderChanges
{
  return self->_didCalculateVisibleBeforeResponderChanges;
}

- (void)set_didCalculateVisibleBeforeResponderChanges:(BOOL)a3
{
  self->_didCalculateVisibleBeforeResponderChanges = a3;
}

- (unint64_t)selectionMask
{
  return self->_selectionMask;
}

- (BOOL)colorSwatchesVisible
{
  return self->_colorSwatchesVisible;
}

- (BOOL)prefersLargeContextualEditingUI
{
  return self->_prefersLargeContextualEditingUI;
}

- (BOOL)_isLassoToolEditingViewVisible
{
  return self->_lassoToolEditingViewVisible;
}

- (BOOL)isRulerActive
{
  return self->_rulerActive;
}

- (PKContentVersion)maximumSupportedContentVersion
{
  return self->_maximumSupportedContentVersion;
}

- (UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (UIUserInterfaceStyle)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (BOOL)showsDrawingPolicyControls
{
  return self->_showsDrawingPolicyControls;
}

- (NSMapTable)_firstRespondersForVisibleUI
{
  return self->__firstRespondersForVisibleUI;
}

- (void)set_firstRespondersForVisibleUI:(id)a3
{
  objc_storeStrong((id *)&self->__firstRespondersForVisibleUI, a3);
}

- (PKPaletteViewInteraction)_interaction
{
  return self->__interaction;
}

- (BOOL)_isPencilInteractionEnabledWhenNotVisible
{
  return self->__pencilInteractionEnabledWhenNotVisible;
}

- (void)set_pencilInteractionEnabledWhenNotVisible:(BOOL)a3
{
  self->__pencilInteractionEnabledWhenNotVisible = a3;
}

- (BOOL)_toolPickerVisible
{
  return self->__toolPickerVisible;
}

- (void)set_toolPickerVisible:(BOOL)a3
{
  self->__toolPickerVisible = a3;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)set_observers:(id)a3
{
  objc_storeStrong((id *)&self->__observers, a3);
}

- (BOOL)_isInputViewVisible
{
  return self->__inputViewVisible;
}

- (void)_setInputViewVisible:(BOOL)a3
{
  self->__inputViewVisible = a3;
}

- (PKToolPickerPaletteViewDelegateProxy)_paletteViewDelegateProxy
{
  return self->__paletteViewDelegateProxy;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (UIViewController)_presentationController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__presentationController);
}

- (PKPaletteViewAnnotationDelegate)_annotationDelegate
{
  return (PKPaletteViewAnnotationDelegate *)objc_loadWeakRetained((id *)&self->__annotationDelegate);
}

- (PKToolPickerPrivateDelegate)_delegate
{
  return (PKToolPickerPrivateDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void)set_delegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (PKToolPickerPrivateDelegate)_temporarySelectionDelegate
{
  return (PKToolPickerPrivateDelegate *)objc_loadWeakRetained((id *)&self->__temporarySelectionDelegate);
}

- (BOOL)_isAnimatingToVisible
{
  return self->__animatingToVisible;
}

- (BOOL)_showsPlusButton
{
  return self->__showsPlusButton;
}

- (UIMenu)_plusButtonMenu
{
  return self->__plusButtonMenu;
}

- (UIViewController)_plusButtonViewController
{
  return self->__plusButtonViewController;
}

- (BOOL)_showsTextButton
{
  return self->__showsTextButton;
}

- (UIViewController)_textButtonViewController
{
  return self->__textButtonViewController;
}

- (BOOL)_showsShapeButton
{
  return self->__showsShapeButton;
}

- (UIViewController)_shapeButtonViewController
{
  return self->__shapeButtonViewController;
}

- (id)_signaturesViewControllerProvider
{
  return self->__signaturesViewControllerProvider;
}

- (void)_setSignaturesViewControllerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)_shadowVisible
{
  return self->__shadowVisible;
}

- (BOOL)_backgroundVisible
{
  return self->__backgroundVisible;
}

- (BOOL)_wantsClearBackgroundColorInCompactSize
{
  return self->__wantsClearBackgroundColorInCompactSize;
}

- (BOOL)_wantsUndoRedoButtonsVisibleInCompactSize
{
  return self->__wantsUndoRedoButtonsVisibleInCompactSize;
}

- (BOOL)_canShowEllipsisButtonInCompactSize
{
  return self->__canShowEllipsisButtonInCompactSize;
}

- (BOOL)_wantsEllipsisButtonVisibleInCompactSize
{
  return self->__wantsEllipsisButtonVisibleInCompactSize;
}

- (BOOL)_wantsBottomLineDividerVisibleInCompactSize
{
  return self->__wantsBottomLineDividerVisibleInCompactSize;
}

- (BOOL)_ignoresSafeAreaInsetsInCompactSize
{
  return self->__ignoresSafeAreaInsetsInCompactSize;
}

- (NSDirectionalEdgeInsets)_edgeInsetsInCompactSize
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->__edgeInsetsInCompactSize.top;
  leading = self->__edgeInsetsInCompactSize.leading;
  bottom = self->__edgeInsetsInCompactSize.bottom;
  trailing = self->__edgeInsetsInCompactSize.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (double)_interItemToolsSpacingInCompactSize
{
  return self->__interItemToolsSpacingInCompactSize;
}

- (double)_interItemUndoRedoButtonsSpacingInCompactSize
{
  return self->__interItemUndoRedoButtonsSpacingInCompactSize;
}

- (BOOL)_useEqualSpacingLayoutInCompactSize
{
  return self->__useEqualSpacingLayoutInCompactSize;
}

- (BOOL)_shouldHideHoverPreviewToggle
{
  return self->__shouldHideHoverPreviewToggle;
}

- (BOOL)_shouldTrackHoverLocationForPencilTapActions
{
  return self->__shouldTrackHoverLocationForPencilTapActions;
}

- (void)_setShouldTrackHoverLocationForPencilTapActions:(BOOL)a3
{
  self->__shouldTrackHoverLocationForPencilTapActions = a3;
}

- (BOOL)_isContextMenuPresented
{
  return self->__contextMenuPresented;
}

- (BOOL)_overlapsMainWindow
{
  return self->__overlapsMainWindow;
}

- (BOOL)_doneActionResignsFirstResponder
{
  return self->__doneActionResignsFirstResponder;
}

- (void)_setDoneActionResignsFirstResponder:(BOOL)a3
{
  self->__doneActionResignsFirstResponder = a3;
}

- (BOOL)_doneButtonVisible
{
  return self->__doneButtonVisible;
}

- (BOOL)_presentsDetached
{
  return self->__presentsDetached;
}

- (BOOL)_visibilityUpdatesEnabled
{
  return self->__visibilityUpdatesEnabled;
}

- (BOOL)_wantsExternalVisibility
{
  return self->__wantsExternalVisibility;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__signaturesViewControllerProvider, 0);
  objc_storeStrong((id *)&self->__shapeButtonViewController, 0);
  objc_storeStrong((id *)&self->__textButtonViewController, 0);
  objc_storeStrong((id *)&self->__plusButtonViewController, 0);
  objc_storeStrong((id *)&self->__plusButtonMenu, 0);
  objc_destroyWeak((id *)&self->__temporarySelectionDelegate);
  objc_destroyWeak((id *)&self->__delegate);
  objc_destroyWeak((id *)&self->__annotationDelegate);
  objc_destroyWeak((id *)&self->__presentationController);
  objc_storeStrong((id *)&self->__paletteViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->__interaction, 0);
  objc_storeStrong((id *)&self->__firstRespondersForVisibleUI, 0);
  objc_storeStrong((id *)&self->_stateAutosaveName, 0);
  objc_storeStrong((id *)&self->_selectedTool, 0);
  objc_storeStrong((id *)&self->_originalToolPickerStateRepresentation, 0);
  objc_storeStrong((id *)&self->_accessoryBarButton, 0);
  objc_storeStrong((id *)&self->_toolItemManager, 0);
  objc_storeStrong((id *)&self->_lastSelectedTool, 0);
  objc_storeStrong((id *)&self->_toolPickerVisibility, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingViewIdentifier, 0);
  objc_storeStrong((id *)&self->_mutableTools, 0);
}

+ (void)_setPrefersPencilOnlyDrawingForiWork:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (PKIsiWork())
    +[PKSettingsDaemon setPrefersPencilOnlyDrawing:](PKSettingsDaemon, "setPrefersPencilOnlyDrawing:", v3);
}

+ (BOOL)_prefersPencilHoverPreviewEnabled
{
  return objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersHoverToolPreview");
}

+ (void)_setPrefersHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = a4;
  if ((PKIsiWork() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "bundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.freeform")),
        v7,
        v6,
        v8))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__PKToolPicker_iWorkSPI___setPrefersHoverPreviewEnabled_withCompletion___block_invoke;
    v9[3] = &unk_1E7777F58;
    v10 = v5;
    +[PKSettingsDaemon setPrefersPencilHoverPreviewEnabled:withCompletion:](PKSettingsDaemon, "setPrefersPencilHoverPreviewEnabled:withCompletion:", v4, v9);

  }
}

uint64_t __72__PKToolPicker_iWorkSPI___setPrefersHoverPreviewEnabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateNewInks
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (-[PKToolPicker maximumSupportedContentVersion](self, "maximumSupportedContentVersion") < PKContentVersion2)
  {
    -[PKToolPicker _removeNewInks](self, "_removeNewInks");
  }
  else
  {
    -[PKToolPicker _addTool:atIndex:](self, "_addTool:atIndex:", CFSTR("com.apple.ink.monoline"), -[PKToolPicker _indexOfMarkerTool](self, "_indexOfMarkerTool"));
    v3 = -[PKToolPicker _indexOfPencilTool](self, "_indexOfPencilTool");
    -[PKToolPicker _tools](self, "_tools");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[PKToolPicker _removeTool:](self, "_removeTool:", v7);
    -[PKToolPicker _tools](self, "_tools");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    -[PKToolPicker _insertTool:atIndex:](self, "_insertTool:atIndex:", v7, v6);
    -[PKToolPicker _addTool:atIndex:](self, "_addTool:atIndex:", CFSTR("com.apple.ink.crayon"), v6 + 1);
    -[PKToolPicker _addTool:atIndex:](self, "_addTool:atIndex:", CFSTR("com.apple.ink.fountainpen"), v6 + 2);
    -[PKToolPicker _addTool:atIndex:](self, "_addTool:atIndex:", CFSTR("com.apple.ink.watercolor"), v6 + 3);

  }
}

- (void)_addTool:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  id v7;

  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_tool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKToolPicker _insertTool:atIndex:](self, "_insertTool:atIndex:", v6, a4);

}

- (void)_removeNewInks
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (-[PKToolPicker maximumSupportedContentVersion](self, "maximumSupportedContentVersion") == PKContentVersion1)
  {
    -[PKToolPicker _tools](self, "_tools");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_30);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[PKToolPicker _removeToolsAtIndexes:](self, "_removeToolsAtIndexes:", v9);
    v4 = -[PKToolPicker _indexOfPencilTool](self, "_indexOfPencilTool");
    v5 = -[PKToolPicker _indexOfMarkerTool](self, "_indexOfMarkerTool");
    if (v4 > v5)
    {
      v6 = v5;
      -[PKToolPicker _tools](self, "_tools");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKToolPicker _removeTool:](self, "_removeTool:", v8);
      -[PKToolPicker _insertTool:atIndex:](self, "_insertTool:atIndex:", v8, v6 + 1);

    }
  }
}

uint64_t __39__PKToolPicker_NewInks___removeNewInks__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isMonolineInk") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "_isFountainPenInk") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "ink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "_isWatercolorInk") & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v2, "ink");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "_isCrayonInk");

      }
    }

  }
  return v4;
}

- (unint64_t)_indexOfPencilTool
{
  void *v2;
  unint64_t v3;

  -[PKToolPicker _tools](self, "_tools");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_4);

  return v3;
}

uint64_t __43__PKToolPicker_NewInks___indexOfPencilTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isPencilInk");

  return v3;
}

- (unint64_t)_indexOfMarkerTool
{
  void *v2;
  unint64_t v3;

  -[PKToolPicker _tools](self, "_tools");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_5);

  return v3;
}

uint64_t __43__PKToolPicker_NewInks___indexOfMarkerTool__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isMarkerInk");

  return v3;
}

@end
