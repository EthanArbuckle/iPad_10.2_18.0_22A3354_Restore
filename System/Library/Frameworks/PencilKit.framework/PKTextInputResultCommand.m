@implementation PKTextInputResultCommand

- (uint64_t)initWithQueryItem:(void *)a3 handwritingShot:(uint64_t)a4 immediateCommitType:(double)a5 applyAfterDelay:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  dispatch_time_t v21;
  objc_super v23;
  _QWORD block[4];
  id v25;
  id location;

  v10 = a2;
  v11 = a3;
  if (a1)
  {
    v23.receiver = (id)a1;
    v23.super_class = (Class)PKTextInputResultCommand;
    v12 = objc_msgSendSuper2(&v23, sel_init);
    a1 = (uint64_t)v12;
    if (v12)
    {
      *((_QWORD *)v12 + 3) = 0;
      objc_storeStrong((id *)v12 + 4, a2);
      objc_storeStrong((id *)(a1 + 40), a3);
      *(_QWORD *)(a1 + 64) = a4;
      objc_msgSend(v10, "correctionResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "inputTarget");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inputTargetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v11, "textInputElementContentForRecognitionIdentifier:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v16;

      }
      objc_msgSend(v10, "correctionResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v10, "correctionResult");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(a1 + 112) = objc_msgSend(v19, "affectedRange");
        *(_QWORD *)(a1 + 120) = v20;

      }
      else
      {
        *(_OWORD *)(a1 + 112) = xmmword_1BE4FE230;
      }

      *(_BYTE *)(a1 + 11) = 1;
      if (a5 <= 0.0)
      {
        -[PKTextInputResultCommand _setCommandState:](a1, 2);
      }
      else
      {
        -[PKTextInputResultCommand _setCommandState:](a1, 1);
        objc_initWeak(&location, (id)a1);
        v21 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __59__PKTextInputResultCommand__scheduleBecomeReadyAfterDelay___block_invoke;
        block[3] = &unk_1E7777588;
        objc_copyWeak(&v25, &location);
        dispatch_after(v21, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }

    }
  }

  return a1;
}

- (id)description
{
  void *v3;
  unint64_t commandState;
  const __CFString *v5;
  unint64_t immediateCommitType;
  const __CFString *v7;
  CHTextInputQueryItem *v8;
  PKTextInputHandwritingShot *v9;
  PKTextInputElementContent *targetElementContent;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKTextInputResultCommand;
  -[PKTextInputResultCommand description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    commandState = self->_commandState;
    if (commandState > 7)
      v5 = &stru_1E777DEE8;
    else
      v5 = off_1E777CA00[commandState];
    immediateCommitType = self->_immediateCommitType;
    if (immediateCommitType > 3)
      v7 = &stru_1E777DEE8;
    else
      v7 = off_1E777CA70[immediateCommitType];
    v8 = self->_queryItem;
    v9 = self->_handwritingShot;
    targetElementContent = self->_targetElementContent;
  }
  else
  {
    v9 = 0;
    v8 = 0;
    targetElementContent = 0;
    v5 = CFSTR("SettingUp");
    v7 = CFSTR("None");
  }
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" state: %@, immediateCommitType: %@, queryItem: %@, handwritingShot: %@, targetElementContent: %@"), v5, v7, v8, v9, targetElementContent);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)beginApplyingResultCommandWithInputTargetState:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  id *v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  int v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  PKTextInputTargetState *v37;
  uint64_t v38;
  _BYTE *v39;
  BOOL v40;
  void *v41;
  void *v42;
  id v43;
  id *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  _QWORD *v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  uint64_t v58;
  _QWORD *v59;
  void *v60;
  _QWORD *v61;
  void *v62;
  _QWORD block[4];
  id v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD *v69;
  id v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  _QWORD *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  _QWORD *v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_setProperty_nonatomic_copy((id)a1, newValue, newValue, 56);
  objc_msgSend(*(id *)(a1 + 32), "correctionResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(a1 + 48);
  v5 = v4;
  if (v4)
    v6 = (void *)*((_QWORD *)v4 + 1);
  else
    v6 = 0;
  v7 = v6;

  -[PKTextInputElement coordinateSpace]((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  objc_msgSend(WeakRetained, "resultCommandSupportedElementDelegate:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v3, "resultType");
    NSStringFromRange(*(NSRange *)(a1 + 112));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    v72 = a1;
    v73 = 2048;
    v74 = (_QWORD *)v12;
    v75 = 2112;
    v76 = v13;
    v77 = 2112;
    v78 = v7;
    v79 = 2048;
    v80 = v14;
    _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "ResultCommand %p: beginApplying, correctionType: %ld, affectedRange: %@, element: %@, shot: %p", buf, 0x34u);

  }
  if (v7 && v8)
  {
    if (!v3)
    {
      v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v59 = *(_QWORD **)(a1 + 32);
        v60 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v72 = a1;
        v73 = 2048;
        v74 = v59;
        v75 = 2112;
        v76 = v60;
        v61 = v59;
        _os_log_error_impl(&dword_1BE213000, v17, OS_LOG_TYPE_ERROR, "ResultCommand %p: failed because correctionResult is nil. QueryItem: %p. Shot: <%@>", buf, 0x20u);

      }
      goto LABEL_16;
    }
    if (objc_msgSend(v3, "resultType") != 1
      || (objc_msgSend(v3, "textResult"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      v16 = 1;
      goto LABEL_17;
    }
    v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v53 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v54 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v72 = a1;
      v73 = 2112;
      v74 = v53;
      v75 = 2112;
      v76 = v54;
      v55 = "ResultCommand %p: failed because text result is nil. Error: %@. Shot: <%@>";
      v56 = v17;
      v57 = 32;
LABEL_49:
      _os_log_error_impl(&dword_1BE213000, v56, OS_LOG_TYPE_ERROR, v55, buf, v57);

    }
  }
  else
  {
    v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v53 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v58 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      v72 = a1;
      v73 = 2048;
      v74 = v7;
      v75 = 2048;
      v76 = v8;
      v77 = 2112;
      v78 = v53;
      v79 = 2112;
      v80 = v58;
      v55 = "ResultCommand %p: failed because of nil target element: %p or coordinate space: %p. Error: %@. Shot: <%@>";
      v56 = v17;
      v57 = 52;
      goto LABEL_49;
    }
  }

LABEL_16:
  v16 = 0;
LABEL_17:
  v18 = (id *)*(id *)(a1 + 56);
  v19 = v18;
  if (!v18)
  {
    v20 = 0;
    goto LABEL_32;
  }
  v20 = v18[2];
  if (v20)
  {
    v62 = v3;
    v21 = v8;
    v22 = v10;
    v23 = v19[6];
    v24 = objc_msgSend(v23, "length");

    if (!v24)
      goto LABEL_31;
    if (!v16)
    {
LABEL_27:
      v34 = v19[4];
      objc_msgSend(v34, "textInputElementForRecognitionIdentifier:", v20);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35 && objc_msgSend(v35, "activePreviewRange") != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v36, "notifyTextInputTextWillChange");
        objc_msgSend(v36, "clearActivePreview");
        objc_msgSend(v36, "notifyTextInputTextDidChange");
      }

      goto LABEL_31;
    }
    v25 = *(_QWORD *)(a1 + 48);
    if (v25)
    {
      v26 = *(id *)(v25 + 8);
      v27 = v26;
      if (v26)
      {
        v28 = (void *)*((_QWORD *)v26 + 14);
LABEL_24:
        v29 = v28;

        if (!v29)
          goto LABEL_27;
        v30 = v19[2];
        v31 = objc_msgSend(v30, "isEqualToNumber:", v29);

        if (!v31)
          goto LABEL_27;
        objc_msgSend(*(id *)(a1 + 32), "correctionResult");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "resultType");

        if (v33 != 1)
          goto LABEL_27;
LABEL_31:
        v10 = v22;
        v8 = v21;
        v3 = v62;
        goto LABEL_32;
      }
    }
    else
    {
      v27 = 0;
    }
    v28 = 0;
    goto LABEL_24;
  }
LABEL_32:

  v37 = objc_alloc_init(PKTextInputTargetState);
  v38 = a1 + 104;
  objc_storeStrong((id *)(a1 + 104), v37);

  v39 = *(id *)(a1 + 56);
  if (v39)
    v40 = v39[8] != 0;
  else
    v40 = 0;
  if (*(_QWORD *)v38)
    *(_BYTE *)(*(_QWORD *)v38 + 8) = v40;

  if (v16)
  {
    if ((-[PKTextInputElement isFocused]((uint64_t)v7) & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_2;
      block[3] = &unk_1E777BD10;
      v64 = v10;
      v65 = a1;
      v66 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else if (-[PKTextInputElement shouldPostponeFocusing](v7)
           && (*(_BYTE *)(a1 + 10) = 1, !*(_QWORD *)(a1 + 64)))
    {
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_36;
      v67[3] = &unk_1E7778020;
      v67[4] = a1;
      dispatch_async(MEMORY[0x1E0C80D38], v67);
    }
    else
    {
      -[PKTextInputResultCommand _setCommandState:](a1, 3);
      objc_msgSend(*(id *)(a1 + 32), "strokeIdentifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "strokeProvider");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(v43, "resultCommandCanvasController:", a1);
      v44 = (id *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "startingPointForSlicesWithIdentifiers:", v41);
      v46 = v45;
      v48 = v47;
      -[PKTextInputCanvasController canvasCoordinateSpace](v44);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v49, v8, v46, v48, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v52 = v51;

      -[PKTextInputElement updateWithFocusedTextInput:]((uint64_t)v7, 0);
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke;
      v68[3] = &unk_1E777C808;
      v68[4] = a1;
      v69 = v7;
      v70 = v10;
      -[PKTextInputElement focusElementIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:completion:]((uint64_t)v69, 0, v68, v50, v52);

    }
  }
  else
  {
    -[PKTextInputResultCommand _finishApplyingResultWithSuccess:cancelled:](a1, 0, 0);
  }

}

- (void)_setCommandState:(uint64_t)a1
{
  id WeakRetained;

  if (a1)
  {
    *(_QWORD *)(a1 + 24) = a2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "resultCommandStateDidChange:", a1);

  }
}

void __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = a1[4];
    if (v4)
      v5 = *(_QWORD *)(v4 + 48);
    else
      v5 = 0;
    -[PKTextInputElementContent loadDataIfNeededWithTextInput:](v5, v3);
  }
  -[PKTextInputElement updateWithFocusedTextInput:](a1[5], v3);
  v6 = (void *)a1[6];
  if (!v6)
  {
    v13 = 0;
    if (!v3)
      goto LABEL_14;
    goto LABEL_12;
  }
  v7 = a1[4];
  if (v7)
  {
    v8 = *(id *)(v7 + 48);
    v9 = v8;
    if (v8)
    {
      v10 = (void *)*((_QWORD *)v8 + 2);
      goto LABEL_9;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = 0;
LABEL_9:
  v11 = v10;
  v12 = objc_msgSend(v6, "isSupportedForTextInputTraits:", v11);

  v13 = v12 ^ 1;
  if (!v3)
    goto LABEL_14;
LABEL_12:
  if ((v13 & 1) == 0)
  {
    -[PKTextInputResultCommand _applyResultCommandPhase2](a1[4]);
    goto LABEL_16;
  }
LABEL_14:
  v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = CFSTR("Yes");
    if (v3)
      v16 = CFSTR("Yes");
    else
      v16 = CFSTR("No");
    v17 = a1[4];
    v18 = a1[5];
    v19 = 134218754;
    if (v13)
      v15 = CFSTR("No");
    v20 = v17;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v18;
    _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "ResultCommand %p: Failed to focus element, returned focusedTextInput: %@, is supported: %@. Element: %@", (uint8_t *)&v19, 0x2Au);
  }

  -[PKTextInputResultCommand _finishApplyingResultWithSuccess:cancelled:](a1[4], 0, 0);
LABEL_16:

}

- (void)_applyResultCommandPhase2
{
  _QWORD *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  void *v16;
  id WeakRetained;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  int v31;
  uint64_t v32;
  __int128 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  id v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  id *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id *v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  void *v86;
  _QWORD *v87;
  uint64_t v88;
  id *v89;
  id v90;
  _QWORD *v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  _QWORD v97[2];
  void (*v98)(uint64_t, const char *);
  void *v99;
  uint64_t v100;
  _QWORD v101[5];
  _QWORD *v102;
  _QWORD aBlock[4];
  id v104;
  id v105;
  _BYTE buf[24];
  void *v107;
  id *v108;
  id *v109;
  id v110;
  uint64_t v111;
  _QWORD *v112;
  uint8_t v113[4];
  uint64_t v114;
  __int16 v115;
  id *v116;
  uint64_t v117;
  NSRange v118;

  v117 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[PKTextInputResultCommand _setCommandState:](a1, 4);
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v98 = __53__PKTextInputResultCommand__applyResultCommandPhase2__block_invoke;
    v99 = &unk_1E7778650;
    v100 = a1;
    v2 = v97;
    v3 = *(id *)(a1 + 32);
    v4 = *(id *)(a1 + 56);
    objc_msgSend(v3, "correctionResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 48);
    v7 = v6;
    if (v6)
      v8 = (void *)v6[1];
    else
      v8 = 0;
    v9 = v8;
    v10 = *(id *)(a1 + 40);
    if (!v7
      || ((v11 = v7[3]) != 0 ? (v12 = v11 == 3) : (v12 = 1),
          v12
       || (v39 = *(_QWORD *)(a1 + 112), v40 = *(_QWORD *)(a1 + 120), v39 != 0x7FFFFFFFFFFFFFFFLL)
       && -[PKTextInputElementContent isValidRange:]((_BOOL8)v7, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120))))
    {
      switch(objc_msgSend(v5, "resultType"))
      {
        case 1:
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke;
          v107 = &unk_1E777C830;
          v108 = (id *)v9;
          v109 = (id *)v4;
          v110 = v10;
          v111 = a1;
          v112 = v2;
          -[PKTextInputResultCommand _applyTextReplacementWithCompletion:](a1, buf);

          break;
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 8:
          v90 = v10;
          v92 = v4;
          v93 = v9;
          v88 = objc_msgSend(v5, "resultType");
          v13 = MEMORY[0x1E0C809B0];
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_4;
          v101[3] = &unk_1E7778740;
          v101[4] = a1;
          v91 = v2;
          v102 = v2;
          v14 = v101;
          v15 = *(id *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 40), "inputInProgressStroke");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_strokeUUID");
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
          objc_msgSend(WeakRetained, "resultCommandFeedbackController:", a1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          aBlock[0] = v13;
          aBlock[1] = 3221225472;
          aBlock[2] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke;
          aBlock[3] = &unk_1E777C8D0;
          v94 = v18;
          v104 = v94;
          v19 = v14;
          v105 = v19;
          v20 = _Block_copy(aBlock);
          if (!v15)
            goto LABEL_79;
          v21 = *((_QWORD *)v15 + 3);
          if (!v21 || v21 == 3)
            goto LABEL_79;
          v22 = *(_QWORD *)(a1 + 112);
          v85 = *(_QWORD **)(a1 + 120);
          v87 = v19;
          v23 = objc_loadWeakRetained((id *)(a1 + 16));
          objc_msgSend(v23, "resultCommandCursorController:", a1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "makeCursorTemporarilyStrongWhileWriting");

          if (!v95)
          {
            v46 = v22;
            *(_BYTE *)(a1 + 8) = 1;
            v10 = v90;
            if (v88 == 6)
            {
              objc_setProperty_nonatomic_copy((id)a1, v25, CFSTR("DeleteGesture"), 96);
              v47 = *((id *)v15 + 1);
              objc_msgSend(v47, "notifyTextInputTextWillChange");

              objc_msgSend(v94, "setReferenceElementContent:referenceRange:feedbackType:", v15, v46, v85, 1);
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_3;
              v107 = &unk_1E777C920;
              v48 = (id *)v15;
              v108 = v48;
              v109 = (id *)a1;
              v110 = v20;
              -[PKTextInputElementContent deleteTextInRange:completion:]((uint64_t)v48, v46, (uint64_t)v85, buf);

              v4 = v92;
              v9 = v93;
            }
            else
            {
              objc_setProperty_nonatomic_copy((id)a1, v25, CFSTR("SelectGesture"), 96);
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_4;
              v107 = &unk_1E777C948;
              v108 = (id *)a1;
              v110 = v20;
              v111 = v46;
              v112 = v85;
              v109 = (id *)v15;
              -[PKTextInputElementContent selectTextInRange:completion:](v109, v46, (uint64_t)v85, buf);
              v49 = *(id *)(a1 + 48);
              v50 = v49;
              if (v49)
                v51 = (void *)*((_QWORD *)v49 + 1);
              else
                v51 = 0;
              v9 = v93;
              v89 = v51;

              v4 = v92;
              if (v46 != 0x7FFFFFFFFFFFFFFFLL && v85 && (objc_msgSend(v89, "showSelectionCommands") & 1) == 0)
              {
                -[PKTextInputElement referenceView](v89);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (v52)
                {
                  v53 = v52;
                  objc_msgSend(v52, "bounds");
                  v58 = *(id **)(a1 + 48);
                  if (v58)
                  {
                    v59 = v46;
                    v60 = v53;
                    -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:](v58, v59, (unint64_t)v85, v53);
                    v62 = v61;
                    v64 = v63;
                    v66 = v65;
                    v68 = v67;
                  }
                  else
                  {
                    v62 = v54;
                    v64 = v55;
                    v66 = v56;
                    v68 = v57;
                    v60 = v53;
                    v70 = os_log_create("com.apple.pencilkit", "PencilTextInput");
                    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v113 = 134218242;
                      v114 = a1;
                      v115 = 2112;
                      v116 = v89;
                      _os_log_error_impl(&dword_1BE213000, v70, OS_LOG_TYPE_ERROR, "ResultCommand %p: Failed to load element content, the callout menu might show up in the wrong place. Element: %@", v113, 0x16u);
                    }

                    v4 = v92;
                  }
                  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController", v85);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "showMenuFromView:rect:", v60, v62, v64, v66, v68);

                  v9 = v93;
                  v52 = v60;
                }

              }
            }
            v19 = v87;
            goto LABEL_81;
          }
          v26 = *(_QWORD *)(a1 + 56);
          if (v26)
          {
            v27 = *(id *)(v26 + 80);
            v19 = v87;
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD **)(a1 + 56);
              if (v29)
                v29 = (_QWORD *)v29[10];
              v30 = v29;
              v31 = objc_msgSend(v95, "isEqual:", v30);

              v19 = v87;
              if (v31)
              {
                v32 = *(_QWORD *)(a1 + 56);
                if (v32)
                  v33 = *(_OWORD *)(v32 + 104);
                else
                  v33 = 0uLL;
                v34 = v85;
                v35 = *(_QWORD *)(a1 + 104);
                v36 = v88;
                if (v35)
                {
                  *(_OWORD *)(v35 + 104) = v33;
                  v32 = *(_QWORD *)(a1 + 56);
                }
                if (v32)
                  v37 = *(_QWORD *)(v32 + 88);
                else
                  v37 = 0;
                v38 = *(_QWORD *)(a1 + 104);
                if (v38)
                  *(_QWORD *)(v38 + 88) = v37;
                goto LABEL_64;
              }
            }
          }
          else
          {
            v19 = v87;
          }
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v85);
          v73 = *(_QWORD *)(a1 + 104);
          if (v73)
            *(_QWORD *)(v73 + 88) = v72;
          v74 = *(id *)(a1 + 48);
          v75 = -[PKTextInputElementContent selectedRange]((uint64_t)v74);
          v77 = *(_QWORD *)(a1 + 104);
          v36 = v88;
          if (v77)
          {
            *(_QWORD *)(v77 + 104) = v75;
            *(_QWORD *)(v77 + 112) = v76;
          }

          v34 = v86;
LABEL_64:
          -[PKTextInputTargetState setInProgressGestureStrokeUUID:](*(_QWORD *)(a1 + 104), v95);
          v78 = *(_QWORD *)(a1 + 104);
          if (v36 == 6)
            v79 = v34;
          else
            v79 = 0;
          v80 = 0x7FFFFFFFFFFFFFFFLL;
          if (v36 == 6)
            v81 = v22;
          else
            v81 = 0x7FFFFFFFFFFFFFFFLL;
          if (v78)
          {
            if (v36 == 6)
              v82 = 0;
            else
              v82 = v34;
            if (v36 != 6)
              v80 = v22;
            *(_QWORD *)(v78 + 120) = v80;
            *(_QWORD *)(v78 + 128) = v82;
            v83 = *(_QWORD *)(a1 + 104);
            if (v83)
            {
              *(_QWORD *)(v83 + 136) = v81;
              *(_QWORD *)(v83 + 144) = v79;
            }
          }
          if (v36 == 2)
          {
LABEL_79:
            (*((void (**)(void *, uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))v20 + 2))(v20, 1, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
          }
          else
          {
            if (v88 == 6)
              v84 = 1;
            else
              v84 = 2;
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_2;
            v107 = &unk_1E777C8F8;
            v109 = v20;
            v110 = (id)v84;
            v111 = v22;
            v112 = v34;
            v108 = (id *)v15;
            -[PKTextInputElementContent selectTextInRange:completion:](v108, v22, (uint64_t)v34, buf);

          }
          v4 = v92;
          v9 = v93;
          v10 = v90;
LABEL_81:

          v2 = v91;
          break;
        case 7:
          v96 = v5;
          v41 = v3;
          v42 = v9;
          objc_msgSend(v10, "inputInProgressStroke");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
            goto LABEL_36;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_3;
          v107 = &unk_1E777C858;
          v108 = (id *)a1;
          v109 = v2;
          -[PKTextInputResultCommand _applyTextReplacementWithCompletion:](a1, buf);

          goto LABEL_38;
        default:
          v96 = v5;
          v41 = v3;
          v42 = v9;
LABEL_36:
          v44 = 1;
          goto LABEL_37;
      }
    }
    else
    {
      v96 = v5;
      v41 = v3;
      v42 = v9;
      v43 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v118.location = v39;
        v118.length = v40;
        NSStringFromRange(v118);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v69;
        _os_log_error_impl(&dword_1BE213000, v43, OS_LOG_TYPE_ERROR, "ResultCommand %p: Could not process result replacing range %@ because it is out of bounds.", buf, 0x16u);

      }
      v44 = 0;
LABEL_37:
      -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:]((_QWORD *)a1, 0, 0, 0, 0);
      v98((uint64_t)v2, (const char *)v44);
LABEL_38:
      v9 = v42;
      v3 = v41;
      v5 = v96;
    }

  }
}

- (void)_finishApplyingResultWithSuccess:(int)a3 cancelled:
{
  char v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id *v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  unint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = (char)a2;
  if ((a2 & 1) == 0)
    -[PKTextInputTargetState clear](*(_QWORD *)(a1 + 104), a2);
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(id *)(a1 + 32);
  -[PKMathResultAttribution setString:](v6, v7);

  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(id *)(a1 + 40);
  -[PKMathResultAttribution setDate:](v8, v9);

  v10 = (id *)*(id *)(a1 + 48);
  v11 = v10;
  if (!v10)
  {
    v13 = 0;
    goto LABEL_29;
  }
  v12 = v10[1];
  v13 = v12;
  if (!v12)
  {
LABEL_29:
    v14 = 0;
    goto LABEL_7;
  }
  v14 = (void *)*((_QWORD *)v12 + 14);
LABEL_7:
  v16 = v14;
  v17 = *(void **)(a1 + 104);
  if (v17)
    objc_setProperty_nonatomic_copy(v17, v15, v16, 16);

  v18 = *(id *)(a1 + 40);
  objc_msgSend(v18, "writingSessionIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(a1 + 104);
  if (v21)
    objc_setProperty_nonatomic_copy(v21, v19, v20, 40);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v24 = *(_QWORD *)(a1 + 104);
  if (v24)
  {
    *(_QWORD *)(v24 + 96) = v23;
    v25 = *(void **)(a1 + 104);
  }
  else
  {
    v25 = 0;
  }
  objc_setProperty_nonatomic_copy((id)a1, v22, v25, 72);
  if ((v4 & 1) != 0)
  {
    v26 = 5;
  }
  else
  {
    -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](a1, 0, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](a1, v27, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));

    if (a3)
      v26 = 7;
    else
      v26 = 6;
  }
  v28 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = *(_QWORD *)(a1 + 24);
    if (v29 > 7)
      v30 = &stru_1E777DEE8;
    else
      v30 = off_1E777CA00[v29];
    if ((unint64_t)(v26 - 5) > 2)
      v31 = &stru_1E777DEE8;
    else
      v31 = off_1E777CA40[v26 - 5];
    v32 = 134218498;
    v33 = a1;
    v34 = 2112;
    v35 = v30;
    v36 = 2112;
    v37 = v31;
    _os_log_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEFAULT, "ResultCommand %p: finishApplying. state change: %@ -> %@", (uint8_t *)&v32, 0x20u);
  }

  -[PKTextInputResultCommand _setCommandState:](a1, v26);
}

void __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_36(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    *(_BYTE *)(v1 + 11) = 0;
    -[PKTextInputResultCommand _applyResultCommandPhase2](*(_QWORD *)(a1 + 32));
  }
  else
  {
    -[PKTextInputResultCommand _applyResultCommandPhase2](0);
  }
}

void __75__PKTextInputResultCommand_beginApplyingResultCommandWithInputTargetState___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  if (!v2)
    goto LABEL_6;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = *(id *)(v3 + 48);
    v5 = v4;
    if (v4)
    {
      v6 = (void *)*((_QWORD *)v4 + 2);
      goto LABEL_5;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
LABEL_5:
  v7 = v6;
  v8 = objc_msgSend(v2, "isSupportedForTextInputTraits:", v7);

  if (!v8)
  {
    -[PKTextInputResultCommand _finishApplyingResultWithSuccess:cancelled:](*(_QWORD *)(a1 + 40), 0, 1);
    return;
  }
LABEL_6:
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    *(_BYTE *)(v9 + 11) = 1;
    v10 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v10 = 0;
  }
  -[PKTextInputResultCommand _applyResultCommandPhase2](v10);
}

- (void)cancelDelayedCommand
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = 134217984;
      v4 = a1;
      _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "ResultCommand %p: Cancel delayed result command", (uint8_t *)&v3, 0xCu);
    }

    -[PKTextInputResultCommand _setCommandState:](a1, 7);
  }
}

void __53__PKTextInputResultCommand__applyResultCommandPhase2__block_invoke(uint64_t a1, const char *a2)
{
  -[PKTextInputResultCommand _finishApplyingResultWithSuccess:cancelled:](*(_QWORD *)(a1 + 32), a2, 0);
}

void __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, void *a5, void *a6)
{
  id v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD *v31;
  id v32;
  id WeakRetained;
  id *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  char v42;
  _QWORD v43[2];
  uint64_t (*v44)(uint64_t, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v45;
  uint64_t v46;
  id v47;
  _QWORD *v48;

  v39 = a5;
  v11 = a6;
  v12 = *(_QWORD *)(a1 + 32);
  if (!v12)
  {
    v13 = 0;
    goto LABEL_9;
  }
  v13 = *(id *)(v12 + 112);
  if (!v13)
  {
LABEL_9:
    v19 = 1;
    goto LABEL_10;
  }
  v14 = *(_QWORD **)(a1 + 40);
  if (v14)
    v14 = (_QWORD *)v14[2];
  v15 = v14;
  v16 = *(_QWORD **)(a1 + 32);
  if (v16)
    v16 = (_QWORD *)v16[14];
  v17 = v16;
  v18 = objc_msgSend(v15, "isEqualToNumber:", v17);

  v19 = v18 ^ 1;
LABEL_10:

  objc_msgSend(*(id *)(a1 + 48), "writingSessionIdentifier");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = a4;
  if (v20)
  {
    v22 = (void *)v20;
    v23 = *(_QWORD **)(a1 + 40);
    if (v23)
      v23 = (_QWORD *)v23[5];
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 48), "writingSessionIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqualToNumber:", v25);

    v21 = a4;
    if (((v19 | v26 ^ 1) & 1) == 0)
    {
      v27 = *(_QWORD *)(a1 + 40);
      if (v27)
        v27 = *(_QWORD *)(v27 + 64);
      v21 = v27 + a4;
    }
  }
  -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:](*(_QWORD **)(a1 + 56), v39, v11, a4, v21);
  -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](*(_QWORD *)(a1 + 56), a3, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
  {
    v38 = v11;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_2;
    v40[3] = &unk_1E7778AC8;
    v29 = *(_QWORD *)(a1 + 56);
    v41 = *(id *)(a1 + 64);
    v42 = a2;
    v30 = v28;
    v31 = v40;
    if (v29)
    {
      v32 = *(id *)(v29 + 48);
      WeakRetained = objc_loadWeakRetained((id *)(v29 + 16));
      objc_msgSend(WeakRetained, "resultCommandCanvasController:", v29);
      v34 = (id *)objc_claimAutoreleasedReturnValue();

      -[PKTextInputCanvasController canvasCoordinateSpace](v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "useTransformStrokesAnimation");

      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      if (v37)
      {
        v44 = __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke;
        v45 = &unk_1E777C998;
        v46 = v29;
        v47 = v30;
        v48 = v31;
        -[PKTextInputElementContent requestUpdatedLastSelectionRectForCommittedTextLength:targetCoordinateSpace:completion:]((uint64_t)v32, a4, v35, v43);
      }
      else
      {
        v44 = __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke_2;
        v45 = &unk_1E777C998;
        v46 = v29;
        v47 = v30;
        v48 = v31;
        -[PKTextInputElementContent requestUpdatedApproximateCaretRectInCoordinateSpace:completion:]((uint64_t)v32, v35, v43);
      }

    }
    v11 = v38;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)_updateInputTargetStateWithUncommittedPendingText:(void *)a3 activePreviewText:(uint64_t)a4 committedTextLength:(uint64_t)a5 accumulatedCommitLength:
{
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  if (!a1)
    return;
  v9 = (void *)a1[4];
  v10 = a3;
  v11 = a2;
  objc_msgSend(v9, "correctionResult");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (_QWORD *)a1[6];
  if (v12)
    v12 = (_QWORD *)v12[1];
  v13 = v12;
  if (v11)
  {
    v14 = (_QWORD *)a1[7];
    if (v14)
      v14 = (_QWORD *)v14[2];
    v15 = v14;
    if (v13)
      v16 = (void *)v13[14];
    else
      v16 = 0;
    v17 = v16;
    v18 = objc_msgSend(v15, "isEqualToNumber:", v17);

    if (v18)
    {
      v19 = a1[7];
      if (v19)
        v20 = *(_QWORD *)(v19 + 72);
      else
        v20 = 0;
      goto LABEL_18;
    }
  }
  else if (objc_msgSend(v28, "isCharacterLevel"))
  {
    v21 = objc_msgSend(v28, "resultType");
    if (v21 == 6)
    {
      v20 = objc_msgSend(v28, "affectedRange");
      goto LABEL_18;
    }
    if (v21 == 1)
    {
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (objc_msgSend(v28, "affectedRange") != 0x7FFFFFFFFFFFFFFFLL)
        v20 = objc_msgSend(v28, "affectedRange") + a4;
      goto LABEL_18;
    }
  }
  v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

  v23 = (void *)a1[13];
  if (v23)
    objc_setProperty_nonatomic_copy(v23, v22, v11, 48);

  v25 = (void *)a1[13];
  if (v25)
    objc_setProperty_nonatomic_copy(v25, v24, v10, 56);

  v26 = a1[13];
  if (v26)
  {
    *(_QWORD *)(v26 + 64) = a5;
    v27 = a1[13];
    if (v27)
      *(_QWORD *)(v27 + 72) = v20;
  }

}

- (id)_strokeSliceIDsToRemoveForCommittedTokenColumnCount:(char)a3 forceRemoveAll:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  BOOL v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;

  if (a1)
  {
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v7, "inputInProgressStroke");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "correctionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "resultType");

    if ((a3 & 1) != 0)
    {
      v11 = 0;
      v12 = 1;
    }
    else
    {
      v14 = v10 <= 8 && (v10 & 0x1FF) != 1 && v8 == 0;
      v15 = !v14;
      v12 = v15 ^ 1;
      if (v14)
        v11 = 0;
      else
        v11 = a2;
      if ((v12 & 1) == 0 && v11 < 1)
      {
        v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_30:

        return v16;
      }
    }
    objc_msgSend(v7, "strokeProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "strokeIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v12)
    {
      v16 = v18;
      if (!v8)
      {
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      objc_msgSend(v6, "correctionResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "strokeIndexesForColumnsInRange:", 0, v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v19, "objectsAtIndexes:", v22);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = (id)MEMORY[0x1E0C9AA60];
      }

      if (!v8)
        goto LABEL_29;
    }
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __95__PKTextInputResultCommand__strokeSliceIDsToRemoveForCommittedTokenColumnCount_forceRemoveAll___block_invoke;
    v30 = &unk_1E777C970;
    v31 = v17;
    v32 = v7;
    objc_msgSend(v16, "indexesOfObjectsPassingTest:", &v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count", v27, v28, v29, v30);
    if (v24 < objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "objectsAtIndexes:", v23);
      v25 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v25;
    }

    goto LABEL_29;
  }
  return 0;
}

uint64_t __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_applyTextReplacementWithCompletion:(uint64_t)a1
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  int v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  uint64_t v49;
  __CFString *v50;
  SEL v51;
  id v52;
  id *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  __CFString *v75;
  __CFString *v76;
  char v77;
  void *v78;
  void *v79;
  uint64_t v80;
  __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  int v87;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  _QWORD *v106;
  _QWORD *v107;
  void *v108;
  id WeakRetained;
  id *v110;
  void *v111;
  id v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  id v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _BOOL4 v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  CGFloat v136;
  double v137;
  CGFloat v138;
  double v139;
  CGFloat v140;
  double v141;
  CGFloat v142;
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double v147;
  double v148;
  CGFloat v149;
  CGFloat v150;
  int v151;
  id *v152;
  int v153;
  id v154;
  void *v155;
  uint64_t v156;
  void *v157;
  id v158;
  char v159;
  id *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  NSObject *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  uint64_t v169;
  id v170;
  void *v171;
  _QWORD *v172;
  _QWORD *v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  id v180;
  id v181;
  void *v182;
  uint64_t v183;
  char v184;
  uint64_t v185;
  __CFString *v186;
  void (**v187)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id *v188;
  _QWORD *v189;
  id *v190;
  void *v191;
  id v192;
  void *v193;
  unint64_t v194;
  void *v195;
  int v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  char v202;
  id v203;
  __CFString *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  id v213;
  uint64_t v214;
  void *v215;
  char v216;
  char v217;
  BOOL v218;
  void *v219;
  id v220;
  uint64_t v221;
  void *v222;
  void *v223;
  _QWORD v224[4];
  id v225;
  id v226;
  void (**v227)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v228;
  _QWORD v229[4];
  id *v230;
  id v231;
  uint64_t v232;
  id v233;
  id v234;
  void (**v235)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v236;
  char v237;
  uint8_t buf[4];
  uint64_t v239;
  __int16 v240;
  void *v241;
  __int16 v242;
  id *v243;
  __int16 v244;
  uint64_t v245;
  uint64_t v246;
  CGRect v247;
  CGRect v248;

  v246 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 48);
  v5 = v4;
  if (v4)
    v6 = (void *)v4[1];
  else
    v6 = 0;
  v7 = v6;
  v8 = *(id *)(a1 + 56);
  v191 = v5;
  v187 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v3;
  v188 = v7;
  if (!v7)
    goto LABEL_11;
  v9 = v7[14];
  if (!v9)
    goto LABEL_11;
  v10 = v9;
  v11 = v8 ? (void *)v8[2] : 0;
  v12 = v11;
  v13 = v7[14];
  v14 = objc_msgSend(v12, "isEqualToNumber:", v13);

  if ((v14 & 1) != 0)
  {
    if (v8)
    {
      v218 = *((_BYTE *)v8 + 8) != 0;
      v15 = *(id *)(a1 + 32);
      v184 = 0;
      v189 = v8;
      v16 = (void *)v8[3];
      goto LABEL_13;
    }
  }
  else
  {
LABEL_11:

  }
  v15 = *(id *)(a1 + 32);
  v218 = 0;
  v189 = 0;
  v16 = 0;
  v184 = 1;
LABEL_13:
  v17 = v16;
  objc_msgSend(v15, "correctionResult");
  v221 = objc_claimAutoreleasedReturnValue();
  v185 = *(_QWORD *)(a1 + 112);
  v194 = *(_QWORD *)(a1 + 120);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(unsigned __int8 *)(a1 + 11);
  v197 = a1;
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v20, "languageSpec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = -[PKTextInputLanguageSpec uncommittedTokenColumnCount]((uint64_t)v21);
  v22 = v15;
  v192 = v17;
  v23 = objc_opt_self();
  v195 = v22;
  objc_msgSend(v22, "correctionResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textResult");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "tokenColumnCount");
  v27 = objc_msgSend(v25, "changeableTokenColumnCount");
  if (!v19)
    goto LABEL_33;
  v28 = v27;
  if (!v18 || v26 < 1)
  {
    objc_msgSend(v195, "correctionResult");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "resultType");

    if (v34 == 7)
    {
      v32 = CFSTR("SplitJoinGesture");
      v29 = (void *)v197;
      v209 = v26;
LABEL_35:
      v30 = v191;
      v31 = (void *)v221;
      goto LABEL_36;
    }
    if (v26 >= 2)
    {
      objc_msgSend(v192, "correctionResult");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "textResult");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
      if (v25 && v36)
      {
        +[PKTextInputResultCommand _tokenColumnStringsForTopTranscriptionInTextResult:](v23, v25);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v207 = v36;
        +[PKTextInputResultCommand _tokenColumnStringsForTopTranscriptionInTextResult:](v23, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v38;
        v41 = 0;
        if (objc_msgSend(v38, "count"))
        {
          v42 = 0;
          v210 = v26 + ~v28;
          v211 = v24;
          while (v42 < objc_msgSend(v39, "count"))
          {
            v43 = v21;
            v44 = v20;
            objc_msgSend(v40, "objectAtIndexedSubscript:", v42);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v39;
            objc_msgSend(v39, "objectAtIndexedSubscript:", v42);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v45, "isEqualToString:", v47);
            if ((uint64_t)v42 <= v210)
              v49 = v48;
            else
              v49 = 0;
            v41 += v49;

            if ((v49 & 1) == 0)
            {
              v39 = v46;
              v20 = v44;
              v21 = v43;
              v24 = v211;
              break;
            }
            ++v42;
            v39 = v46;
            v20 = v44;
            v21 = v43;
            v24 = v211;
            if (v42 >= objc_msgSend(v40, "count"))
              break;
          }
        }
        v183 = objc_msgSend(v40, "count");
        if (v41 >= v183 - v214)
          v37 = v183 - v214;
        else
          v37 = v41;

        v36 = v207;
      }

      v32 = CFSTR("StableWord");
      v209 = v37;
      goto LABEL_34;
    }
LABEL_33:
    v209 = 0;
    v32 = &stru_1E777DEE8;
LABEL_34:
    v29 = (void *)v197;
    goto LABEL_35;
  }
  v29 = (void *)v197;
  v30 = v191;
  v31 = (void *)v221;
  v209 = v26;
  if (v18 > 3)
    v32 = &stru_1E777DEE8;
  else
    v32 = off_1E777CA58[v18 - 1];
LABEL_36:

  v50 = v32;
  objc_setProperty_nonatomic_copy(v29, v51, v50, 96);
  v52 = v31;
  v53 = v30;
  v212 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v52;
  objc_msgSend(v52, "textResult");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  v190 = v53;
  v203 = v55;
  v186 = v50;
  if (v56)
  {
    objc_msgSend(v56, "transcriptionPaths");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "firstObject");
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v30 = 0;
      v59 = v53[3];
      v208 = 0;
      if (v59 && v59 != (id)3)
      {
        v60 = v185;
        if (v185)
        {
          -[PKTextInputElementContent stringInRange:]((uint64_t)v53, v185 - 1, 1);
          v61 = objc_claimAutoreleasedReturnValue();
          v60 = v185;
          v62 = v61;
        }
        else
        {
          v62 = 0;
        }
        v65 = v194 + v60;
        v66 = v194 + v60 + 1;
        v200 = (void *)v62;
        if (v66 <= -[PKTextInputElementContent contentLength]((uint64_t)v53))
        {
          -[PKTextInputElementContent stringInRange:]((uint64_t)v53, v65, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 65532);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v208 = v67;
        if (objc_msgSend(v67, "isEqualToString:", v68)
          && v65 + 2 <= (unint64_t)-[PKTextInputElementContent contentLength]((uint64_t)v53))
        {
          -[PKTextInputElementContent stringInRange:]((uint64_t)v53, v66, 1);
          v69 = objc_claimAutoreleasedReturnValue();

          v208 = (void *)v69;
        }

        v30 = v200;
      }
    }
    else
    {
      v208 = 0;
    }
    v201 = v30;
    if (objc_msgSend(v57, "tokenColumnCount") >= 1)
    {
      v205 = 0;
      v196 = 0;
      v70 = 0;
      v71 = v208;
      v198 = v54;
      v202 = !v218;
      v199 = v57;
      while (1)
      {
        v72 = objc_msgSend(v206, "indexAtPosition:", v70);
        objc_msgSend(v57, "tokenRowsAtColumnIndex:", v70);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", v72);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v219, "firstObject");
        v74 = objc_claimAutoreleasedReturnValue();
        v215 = (void *)v74;
        if (!v74)
        {
          v76 = &stru_1E777DEE8;
          goto LABEL_66;
        }
        objc_msgSend(v57, "precedingSeparatorForToken:", v74);
        v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v76 = v75;
        if (v70)
          v77 = 1;
        else
          v77 = v202;
        if ((v77 & 1) != 0)
        {
          if (v70)
            goto LABEL_66;
        }
        else
        {

          v76 = CFSTR(" ");
        }
        if (!objc_msgSend(v201, "length")
          || -[__CFString isEqualToString:](v76, "isEqualToString:", v201))
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByTrimmingCharactersInSet:](v76, "stringByTrimmingCharactersInSet:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "length");

          if (v80)
          {

            v76 = &stru_1E777DEE8;
          }
          v71 = v208;
        }
LABEL_66:
        v222 = v73;
        if (v70 == objc_msgSend(v57, "tokenColumnCount") - 1)
        {
          objc_msgSend(v57, "trailingSeparator");
          v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_78;
        }
        if (v70 != v209 - 1)
        {
          v81 = &stru_1E777DEE8;
          goto LABEL_78;
        }
        objc_msgSend(v57, "transcriptionPaths");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "firstObject");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "tokensInTranscriptionPath:atColumnIndex:", v83, v209);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v84, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v85)
        {
          v81 = &stru_1E777DEE8;
LABEL_74:
          v86 = -[__CFString length](v81, "length");
          v87 = v196;
          if (v86)
            v87 = 1;
          v196 = v87;
          goto LABEL_77;
        }
        objc_msgSend(v57, "precedingSeparatorForToken:", v85);
        v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v81)
          goto LABEL_74;
LABEL_77:
        v71 = v208;

LABEL_78:
        if (!objc_msgSend(v71, "length")
          || (-[__CFString isEqualToString:](v81, "isEqualToString:", v71) & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
              v97 = (void *)objc_claimAutoreleasedReturnValue(),
              v98 = objc_msgSend(v97, "characterIsMember:", objc_msgSend(v71, "characterAtIndex:", 0)),
              v97,
              (v98 & 1) != 0)
          || !v81)
        {

          v81 = &stru_1E777DEE8;
        }
        +[PKTextInputResultCommand _transcriptionForTokensAtColumn:row:textResult:](v212, v70, v72, v57);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70 >= v209)
        {
          v96 = v205;
          if (!v205)
          {
            objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v205 = v96;
          objc_msgSend(v96, "appendFormat:", CFSTR("%@%@%@"), v76, v88, v81);
        }
        else
        {
          if (-[__CFString length](v76, "length"))
          {
            objc_msgSend(v54, "addObject:", v76);
            objc_msgSend(v55, "addObject:", MEMORY[0x1E0C9AA60]);
          }
          v204 = v76;
          v89 = v57;
          v90 = v88;
          v91 = objc_opt_self();
          objc_msgSend(v89, "tokenRowsAtColumnIndex:", v70);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v92, "count"))
          {
            v94 = 0;
            do
            {
              +[PKTextInputResultCommand _transcriptionForTokensAtColumn:row:textResult:](v91, v70, v94, v89);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v95, "isEqualToString:", v90) & 1) == 0)
                objc_msgSend(v93, "addObject:", v95);

              ++v94;
            }
            while (v94 < objc_msgSend(v92, "count"));
          }

          v54 = v198;
          objc_msgSend(v198, "addObject:", v90);
          v55 = v203;
          objc_msgSend(v203, "addObject:", v93);
          if (-[__CFString length](v81, "length"))
          {
            objc_msgSend(v198, "addObject:", v81);
            objc_msgSend(v203, "addObject:", MEMORY[0x1E0C9AA60]);
          }

          v57 = v199;
          v71 = v208;
          v76 = v204;
        }

        if (++v70 >= objc_msgSend(v57, "tokenColumnCount"))
          goto LABEL_101;
      }
    }
    LOBYTE(v196) = 0;
    v205 = 0;
    v71 = v208;
LABEL_101:

    v63 = v196 & 1;
    v53 = v190;
    v64 = v205;
  }
  else
  {
    v63 = 0;
    v64 = 0;
  }
  v99 = objc_retainAutorelease(v54);
  v100 = objc_retainAutorelease(v203);
  v101 = objc_retainAutorelease(v64);

  v102 = v99;
  v220 = v100;
  v103 = v101;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v100) = objc_msgSend(v104, "activePreviewEnabled");

  if (!(_DWORD)v100)
  {
    v223 = 0;
    goto LABEL_117;
  }
  v105 = v103;
  v106 = *(_QWORD **)(v197 + 48);
  v216 = v63;
  if (v106)
    v106 = (_QWORD *)v106[1];
  v107 = v106;
  v213 = *(id *)(v197 + 32);
  objc_msgSend(*(id *)(v197 + 40), "strokeProvider");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(v197 + 16));
  objc_msgSend(WeakRetained, "resultCommandCanvasController:", v197);
  v110 = (id *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputCanvasController canvasCoordinateSpace](v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v105;
  v113 = v112;
  if (!*(_BYTE *)(v197 + 11)
    || v194
    || (v114 = *(_QWORD *)(v197 + 48)) == 0
    || (v115 = *(_QWORD *)(v114 + 24), v115 == 3)
    || (v116 = v112, !v115))
  {

    v116 = 0;
  }
  if ((unint64_t)objc_msgSend(v116, "length") < 3)
  {
    v117 = v209;
LABEL_113:
    v223 = 0;
    goto LABEL_114;
  }
  v223 = v116;
  v117 = v209;
  if (!v108)
    goto LABEL_115;
  if (!v111)
    goto LABEL_115;
  -[PKTextInputElement coordinateSpace]((uint64_t)v107);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v134)
    goto LABEL_115;
  objc_msgSend(v213, "strokeIdentifiers");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "boundsForSliceIdentifiers:", v116);
  v136 = v135;
  v138 = v137;
  v140 = v139;
  v142 = v141;
  v247.origin.x = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:](*(_QWORD *)(v197 + 48), v185, v111);
  x = v247.origin.x;
  y = v247.origin.y;
  width = v247.size.width;
  height = v247.size.height;
  if (!CGRectIsNull(v247))
  {
    v148 = width + 50.0 >= 100.0 ? width + 50.0 : 100.0;
    v248.origin.x = v136;
    v248.origin.y = v138;
    v248.size.width = v140;
    v248.size.height = v142;
    v149 = y;
    v150 = height;
    v147 = x + -50.0;
    if (CGRectIntersectsRect(v248, *(CGRect *)(&v148 - 2)))
    {

      goto LABEL_113;
    }
  }
LABEL_114:
  v209 = v117;

LABEL_115:
  v63 = v216;
LABEL_117:
  v118 = *(id *)(v197 + 40);
  v119 = v195;
  objc_opt_self();
  objc_msgSend(v119, "correctionResult");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "strokeProvider");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "strokeIdentifiers");
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v118, "inputInProgressStroke");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = 0;
  if (v123 || v194 < 2)
  {
LABEL_144:

    v153 = 0;
    if (v191)
      v151 = 1;
    else
      v151 = v124;
    if (!v191)
    {
      v152 = v190;
LABEL_161:
      if (!v103)
        goto LABEL_164;
      goto LABEL_162;
    }
    v152 = v190;
    if (v124)
      goto LABEL_161;
    goto LABEL_149;
  }
  if (objc_msgSend(v122, "count") != 1)
  {
    v123 = 0;
    v124 = 0;
    goto LABEL_144;
  }
  objc_msgSend(v120, "textResult");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v125, "tokenColumnCount");

  if (v126 == 1)
  {
    objc_msgSend(v120, "textResult");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "topTranscription");
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v123, "length"))
    {
      v217 = v63;
      objc_msgSend(v123, "rangeOfComposedCharacterSequenceAtIndex:", 0);
      v129 = v128;
      v130 = objc_msgSend(v123, "length");
      objc_msgSend(v121, "boundsForSliceIdentifiers:", v122);
      v124 = 0;
      if (v129 == v130)
      {
        v133 = v131 >= v132 ? v131 : v132;
        if (v133 <= 20.0)
          v124 = 1;
      }
      v63 = v217;
    }
    else
    {
      v124 = 1;
    }
    goto LABEL_144;
  }

  v152 = v190;
  v151 = (int)v191;
  if (!v191)
  {
    v153 = 0;
    if (!v103)
      goto LABEL_164;
LABEL_162:
    *(_BYTE *)(v197 + 9) = 1;
    goto LABEL_169;
  }
LABEL_149:
  v151 = 0;
  v154 = v152[3];
  if (!v154)
  {
    v153 = 0;
    if (!v103)
      goto LABEL_164;
    goto LABEL_162;
  }
  v153 = 0;
  if (v154 == (id)3)
    goto LABEL_161;
  if ((unint64_t)objc_msgSend(v102, "count") > 1
    || (objc_msgSend(v102, "firstObject"),
        v155 = (void *)objc_claimAutoreleasedReturnValue(),
        v156 = objc_msgSend(v155, "length"),
        v155,
        v156)
    || objc_msgSend(v193, "resultType") == 7)
  {
    if ((v184 & 1) != 0)
      v157 = 0;
    else
      v157 = (void *)v189[7];
    v158 = v157;
LABEL_157:
    v153 = 1;
    goto LABEL_158;
  }
  v178 = *(_QWORD *)(v197 + 64);
  if ((v184 & 1) != 0)
    v179 = 0;
  else
    v179 = (void *)v189[7];
  v180 = v179;
  v158 = v180;
  if (v178)
    goto LABEL_157;
  if (objc_msgSend(v180, "length") || objc_msgSend(v223, "length"))
  {
    v158 = v158;
    v181 = v223;
    v182 = v181;
    if (v158 == v181)
    {
      v153 = 0;
    }
    else
    {
      v153 = 1;
      if (v181 && v158)
        v153 = objc_msgSend(v158, "isEqualToString:", v181) ^ 1;
    }

  }
  else
  {
    v153 = 0;
  }
LABEL_158:

  v151 = 0;
  if (v103)
    goto LABEL_162;
LABEL_164:
  if (v194)
    v159 = v153;
  else
    v159 = 1;
  if ((v159 & 1) == 0 && !*(_QWORD *)(v197 + 64))
    goto LABEL_162;
LABEL_169:
  if (v153)
  {
    v160 = v188;
    objc_msgSend(v188, "notifyTextInputTextWillChange");
    v229[0] = MEMORY[0x1E0C809B0];
    v229[1] = 3221225472;
    v229[2] = __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke;
    v229[3] = &unk_1E777C880;
    v230 = v188;
    v231 = v102;
    v232 = v197;
    v236 = v209;
    v237 = v63;
    v235 = v187;
    v233 = v103;
    v161 = v223;
    v234 = v223;
    v162 = v220;
    -[PKTextInputElementContent insertTextsToCommit:withAlternatives:activePreviewText:replacingRange:completion:](v152, v231, v220, v234, v185, v194, v229);

  }
  else
  {
    if (v151)
    {
      v163 = *(_QWORD *)(v197 + 64);
      v161 = v223;
      if (v163)
      {
        v164 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromRange(*(NSRange *)(v197 + 112));
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v166 = *(_QWORD *)(v197 + 40);
          *(_DWORD *)buf = 134218754;
          v239 = v197;
          v161 = v223;
          v240 = 2112;
          v241 = v165;
          v242 = 2112;
          v243 = v188;
          v244 = 2048;
          v245 = v166;
          v152 = v190;
          _os_log_impl(&dword_1BE213000, v164, OS_LOG_TYPE_DEFAULT, "ResultCommand %p: ignoring final commit of text insertion as accidental replacement, affectedRange: %@, element: %@, shot: %p", buf, 0x2Au);

        }
      }
      ((void (**)(_QWORD, BOOL, _QWORD, _QWORD, _QWORD, _QWORD))v187)[2](v187, v163 == 0, 0, 0, 0, 0);
    }
    else
    {
      objc_msgSend(*(id *)(v197 + 40), "inputInProgressStroke");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "_strokeUUID");
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      v169 = *(_QWORD *)(v197 + 56);
      if (!v169)
        goto LABEL_204;
      v170 = *(id *)(v169 + 80);
      if (!v170)
        goto LABEL_204;
      v171 = v170;
      v172 = *(_QWORD **)(v197 + 56);
      if (v172)
        v172 = (_QWORD *)v172[10];
      v173 = v172;
      v174 = objc_msgSend(v168, "isEqual:", v173);

      if (v174)
      {
        v175 = objc_msgSend(v193, "affectedRange");
        v177 = v176;
        v224[0] = MEMORY[0x1E0C809B0];
        v224[1] = 3221225472;
        v224[2] = __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke_43;
        v224[3] = &unk_1E777C8A8;
        v227 = v187;
        v228 = v209;
        v225 = v103;
        v161 = v223;
        v226 = v223;
        v152 = v190;
        -[PKTextInputElementContent selectTextInRange:completion:](v190, v175, v177, v224);

      }
      else
      {
LABEL_204:
        v161 = v223;
        ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD, id, void *))v187)[2](v187, 1, v209, 0, v103, v223);
        v152 = v190;
      }

    }
    v160 = v188;
    v162 = v220;
  }

}

void __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = a6;
  v11 = a5;
  -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](v9, 0, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(_QWORD *)(a1 + 32), v12, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
  -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:](*(_QWORD **)(a1 + 32), v11, v10, a4, a4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_removeStrokesForSliceIDs:(CGFloat)a3 destinationRect:(CGFloat)a4
{
  id v12;
  void *v13;
  void *v14;
  BOOL IsReduceMotionEnabled;
  BOOL IsNull;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  CGRect v25;

  if (a1)
  {
    v24 = *(id *)(a1 + 40);
    v12 = a2;
    objc_msgSend(v24, "strokeProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "strokesForSliceIdentifiers:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      v25.origin.x = a3;
      v25.origin.y = a4;
      v25.size.width = a5;
      v25.size.height = a6;
      IsNull = CGRectIsNull(v25);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "resultCommandCanvasController:", a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (IsNull || IsReduceMotionEnabled)
      {
        objc_msgSend(v14, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputCanvasController removeStrokes:animationDuration:]((uint64_t)v18, v20, 0.1);
      }
      else
      {
        if (*(_BYTE *)(a1 + 10))
        {
          v19 = 1;
        }
        else
        {
          +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v21, "useTransformStrokesAnimation") ^ 1;

        }
        objc_msgSend(*(id *)(a1 + 40), "languageSpec");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PKTextInputLanguageSpec strokeFadeOutDuration]((uint64_t)v22);

        objc_msgSend(v14, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputCanvasController animateAndRemoveStrokes:destinationFrame:animationDuration:useImpreciseAnimation:]((uint64_t)v18, v20, v19, a3, a4, a5, a6, v23);
      }

    }
  }
}

void __68__PKTextInputResultCommand__applyResultCommandPhase3WithCompletion___block_invoke_4(uint64_t a1)
{
  id v2;

  -[PKTextInputResultCommand _strokeSliceIDsToRemoveForCommittedTokenColumnCount:forceRemoveAll:](*(_QWORD *)(a1 + 32), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(_QWORD *)(a1 + 32), v2, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
  -[PKTextInputResultCommand _updateInputTargetStateWithUncommittedPendingText:activePreviewText:committedTextLength:accumulatedCommitLength:](*(_QWORD **)(a1 + 32), 0, 0, 0, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke(uint64_t a1, int a2)
{
  const char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "notifyTextInputTextDidChange");
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", &stru_1E777DEE8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      objc_setProperty_nonatomic_copy(v6, v4, v5, 80);
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        *(_QWORD *)(v7 + 88) = *(_QWORD *)(a1 + 80);
    }
    if (objc_msgSend(v5, "length"))
    {
      v8 = *(_QWORD *)(a1 + 48);
      if (v8)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
        v10 = *(_QWORD *)(a1 + 48);
      }
      else
      {
        v10 = 0;
        WeakRetained = 0;
      }
      objc_msgSend(WeakRetained, "resultCommandCursorController:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "makeCursorTemporarilyStrongWhileWriting");

      objc_msgSend(*(id *)(a1 + 32), "didInsertText");
    }

  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    *(_BYTE *)(v12 + 8) = 1;
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      v14 = *(_QWORD *)(v13 + 104);
      if (v14)
        *(_BYTE *)(v14 + 8) = *(_BYTE *)(a1 + 88);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __64__PKTextInputResultCommand__applyTextReplacementWithCompletion___block_invoke_43(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[7], 0, a1[4], a1[5]);
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_msgSend(*(id *)(a1 + 32), "setReferenceElementContent:referenceRange:feedbackType:", a6, a4, a5, a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a2, a1[6], a1[7], a1[8], a1[4]);
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_3(_QWORD *a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;

  v4 = (_QWORD *)a1[4];
  if (v4)
    v4 = (_QWORD *)v4[1];
  v5 = v4;
  objc_msgSend(v5, "notifyTextInputTextDidChange");

  if (a2)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "scratchOutMakesTheCursorStrong");

    if (v7)
    {
      v8 = a1[5];
      if (v8)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
        v10 = a1[5];
      }
      else
      {
        v10 = 0;
        WeakRetained = 0;
      }
      objc_msgSend(WeakRetained, "resultCommandCursorController:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "makeCursorStrong");

    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __73__PKTextInputResultCommand__applySelectOrDeleteGestureOfType_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
    WeakRetained = 0;
  }
  objc_msgSend(WeakRetained, "resultCommandCursorController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeCursorStrong");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __95__PKTextInputResultCommand__strokeSliceIDsToRemoveForCommittedTokenColumnCount_forceRemoveAll___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12[0] = v3;
  v5 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokesForSliceIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "inputInProgressStroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v8);

    v5 = v10 ^ 1u;
  }

  return v5;
}

uint64_t __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2, a3, a4, a5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __96__PKTextInputResultCommand__removeCommittedTextInsertionStrokes_committedTextLength_completion___block_invoke_2(uint64_t a1, double a2, CGFloat y, CGFloat width, CGFloat height)
{
  double x;
  CGRect v11;
  CGRect v12;

  x = a2;
  if (!CGRectIsNull(*(CGRect *)&a2))
  {
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    v12 = CGRectInset(v11, -10.0, 0.0);
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;
  }
  -[PKTextInputResultCommand _removeStrokesForSliceIDs:destinationRect:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), x, y, width, height);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __59__PKTextInputResultCommand__scheduleBecomeReadyAfterDelay___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3] == 1)
  {
    v2 = WeakRetained;
    -[PKTextInputResultCommand _setCommandState:]((uint64_t)WeakRetained, 2);
    WeakRetained = v2;
  }

}

+ (id)_tokenColumnStringsForTopTranscriptionInTextResult:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "tokenColumnCount");
  objc_msgSend(v2, "transcriptionPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PKTextInputResultCommand__tokenColumnStringsForTopTranscriptionInTextResult___block_invoke;
  v12[3] = &unk_1E777C9C0;
  v7 = v6;
  v13 = v7;
  v14 = v2;
  v8 = v2;
  objc_msgSend(v8, "enumerateTokensInTranscriptionPath:columnRange:tokenProcessingBlock:", v5, 0, v3, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

+ (id)_transcriptionForTokensAtColumn:(uint64_t)a3 row:(void *)a4 textResult:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_self();
  objc_msgSend(v6, "tokenRowsAtColumnIndex:", a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v11 + i < 1)
        {
          v15 = &stru_1E777DEE8;
        }
        else
        {
          objc_msgSend(v6, "precedingSeparatorForToken:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "string");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (__CFString *)v16;
        else
          v18 = &stru_1E777DEE8;
        v19 = v18;

        objc_msgSend(v8, "appendFormat:", CFSTR("%@%@"), v15, v19);
      }
      v11 += v10;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  return v8;
}

void __79__PKTextInputResultCommand__tokenColumnStringsForTopTranscriptionInTextResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = *(_QWORD *)(a4 + 16);
  if (v6 < 1)
  {
    v7 = &stru_1E777DEE8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "precedingSeparatorForToken:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = &stru_1E777DEE8;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v7, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 32);
  if (v6 < 1)
    objc_msgSend(v14, "addObject:", v13);
  else
    objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "count") - 1, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__inProgressInputTargetState, 0);
  objc_storeStrong((id *)&self->_commitReason, 0);
  objc_storeStrong((id *)&self->_committedText, 0);
  objc_storeStrong((id *)&self->_finalInputTargetState, 0);
  objc_storeStrong((id *)&self->_initialInputTargetState, 0);
  objc_storeStrong((id *)&self->_targetElementContent, 0);
  objc_storeStrong((id *)&self->_handwritingShot, 0);
  objc_storeStrong((id *)&self->_queryItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
