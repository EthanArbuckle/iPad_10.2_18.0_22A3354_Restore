@implementation CCUIMainViewController

- (BOOL)runTest:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  const __CFString *v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v39[5];
  __CFString *v40;
  id v41;
  id v42;
  uint64_t *v43;
  char v44;
  char v45;
  _QWORD aBlock[5];
  id v47;
  id v48;
  __CFString *v49;
  unint64_t v50;
  _QWORD v51[5];
  __CFString *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v37 = a5;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = 0;
  v35 = v7;
  v36 = v8;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ControlCenterBringup")))
  {
    +[CCUIPPTTest testWithName:beginSignpost:endSignpost:](CCUIPPTTest, "testWithName:beginSignpost:endSignpost:", CFSTR("animation"), 1, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCUIPPTRootTest testWithName:](CCUIPPTRootTest, "testWithName:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_controlCenterBringupEventStream");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v54[5];
    v54[5] = v12;

    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
LABEL_3:
    v19 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ControlCenterBringupOverSafari")))
  {
    +[CCUIPPTTest testWithName:beginSignpost:endSignpost:](CCUIPPTTest, "testWithName:beginSignpost:endSignpost:", CFSTR("animation"), 1, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCUIPPTRootTest testWithName:](CCUIPPTRootTest, "testWithName:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_controlCenterBringupEventStream");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v54[5];
    v54[5] = v20;

    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 2;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ControlCenterBringupOnLockScreen")))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("ControlCenterDismiss")))
      {
        +[CCUIPPTTest testWithName:beginSignpost:endSignpost:](CCUIPPTTest, "testWithName:beginSignpost:endSignpost:", CFSTR("animation"), 3, 4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CCUIPPTRootTest testWithName:](CCUIPPTRootTest, "testWithName:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_controlCenterDismissEventStream");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v54[5];
        v54[5] = v31;

        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 1;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ControlCenterShowOrbActions")))
      {
        +[CCUIPPTTest testWithName:beginSignpost:endSignpost:](CCUIPPTTest, "testWithName:beginSignpost:endSignpost:", CFSTR("animation"), 5, 6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CCUIPPTRootTest testWithName:](CCUIPPTRootTest, "testWithName:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke;
        v51[3] = &unk_1E8CFC608;
        v51[4] = self;
        v52 = CFSTR("com.apple.control-center.QuickNoteModule");
        v14 = _Block_copy(v51);

        v17 = 0;
        v16 = CFSTR("com.apple.control-center.QuickNoteModule");
        v15 = 1;
        v18 = 1;
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ControlCenterDismissOrbActions")))
        {
          v25 = 0;
          v26 = 0;
          v14 = 0;
          v11 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_15;
        }
        +[CCUIPPTTest testWithName:beginSignpost:endSignpost:](CCUIPPTTest, "testWithName:beginSignpost:endSignpost:", CFSTR("animation"), 7, 8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CCUIPPTRootTest testWithName:](CCUIPPTRootTest, "testWithName:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_controlCenterDismissOrbActionsEventStream");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v54[5];
        v54[5] = v33;

        v14 = 0;
        v16 = CFSTR("com.apple.control-center.QuickNoteModule");
        v17 = 1;
        v15 = 1;
        v18 = 1;
      }
      goto LABEL_3;
    }
    +[CCUIPPTTest testWithName:beginSignpost:endSignpost:](CCUIPPTTest, "testWithName:beginSignpost:endSignpost:", CFSTR("animation"), 1, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCUIPPTRootTest testWithName:](CCUIPPTRootTest, "testWithName:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_controlCenterBringupEventStream");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v54[5];
    v54[5] = v22;

    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
LABEL_8:

  if (v10)
  {
    if (v15)
    {
      v24 = -[CCUIMainViewController _fetchModuleEnabledState:](self, "_fetchModuleEnabledState:", v16);
      if (v24 != 3)
        -[CCUIMainViewController _forceModuleEnabled:](self, "_forceModuleEnabled:", v16);
    }
    else
    {
      v24 = 0;
    }
    v27 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_2;
    aBlock[3] = &unk_1E8CFC658;
    aBlock[4] = self;
    v26 = v10;
    v47 = v26;
    v11 = v11;
    v48 = v11;
    v49 = (__CFString *)v16;
    v50 = v24;
    v28 = _Block_copy(aBlock);
    v39[0] = v27;
    v39[1] = 3221225472;
    v39[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_4;
    v39[3] = &unk_1E8CFC6D0;
    v44 = v18;
    v39[4] = self;
    v14 = v14;
    v43 = &v53;
    v45 = v17;
    v40 = (__CFString *)v16;
    v41 = v14;
    v29 = v28;
    v42 = v29;
    objc_msgSend(v37, "prepareForControlCenterPPTHostState:completionHandler:", v19, v39);

    v25 = 1;
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
LABEL_15:

  _Block_object_dispose(&v53, 8);
  return v25;
}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_controlCenterShowOrbActionsEventStream:", *(_QWORD *)(a1 + 40));
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_3;
  v9[3] = &unk_1E8CFC630;
  v9[4] = v4;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v4, "runTest:subtests:eventStream:completionHandler:", v5, v6, a2, v9);

}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:withCompletionHandler:", 0, 0);
  if (*(_QWORD *)(a1 + 40))
  {
    if (*(_QWORD *)(a1 + 48) != 3)
      return objc_msgSend(*(id *)(a1 + 32), "_disableModule:");
  }
  return result;
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_4(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  _QWORD v10[2];
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_5;
    v11[3] = &unk_1E8CFC6A8;
    v3 = &v13;
    v4 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_BYTE *)(a1 + 73);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v13 = v4;
    v11[4] = v5;
    v12 = v6;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v2, "presentAnimated:withCompletionHandler:", 0, v11);

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_9;
    v9[3] = &unk_1E8CFC680;
    v3 = (id *)v10;
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v10[0] = v7;
    v10[1] = v8;
    objc_msgSend(v2, "dismissAnimated:withCompletionHandler:", 0, v9);
  }

}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v2 = dispatch_time(0, 1000000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_6;
  v6[3] = &unk_1E8CFC6A8;
  v3 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_BYTE *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v6[4] = v4;
  v7 = v5;
  v9 = *(id *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v6);

}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  if (*(_BYTE *)(a1 + 72))
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "_controlCenterShowOrbActionsEventStream:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_7;
    v10[3] = &unk_1E8CFC680;
    v8 = *(id *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v6, "_playEventStream:withCompletion:", v7, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_7(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = dispatch_time(0, 1000000000);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_8;
  v5[3] = &unk_1E8CFC680;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v5);

}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_9(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = dispatch_time(0, 1000000000);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_10;
  v5[3] = &unk_1E8CFC680;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v5);

}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

+ (id)_controlCenterBringupEventStream
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  double MaxX;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Class RCPSyntheticEventStreamClass;
  uint64_t *v26;
  double MidX;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(double *, void *);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(double *, void *);
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  if (LoadRecap_loadPredicate != -1)
    dispatch_once(&LoadRecap_loadPredicate, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keyWindowForScreen:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (SBFEffectiveHomeButtonType() == 2
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "userInterfaceIdiom"),
        v13,
        v14 == 1))
  {
    v55.origin.x = v6;
    v55.origin.y = v8;
    v55.size.width = v10;
    v55.size.height = v12;
    MaxX = CGRectGetMaxX(v55);
    v56.origin.x = v6;
    v56.origin.y = v8;
    v56.size.width = v10;
    v56.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, MaxX, CGRectGetMinY(v56));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    v17 = v16;
    v19 = v18;
    v57.origin.x = v6;
    v57.origin.y = v8;
    v57.size.width = v10;
    v57.size.height = v12;
    v20 = CGRectGetMaxX(v57);
    v58.origin.x = v6;
    v58.origin.y = v8;
    v58.size.width = v10;
    v58.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, v20, CGRectGetMaxY(v58));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    v22 = v21;
    v24 = v23;
    RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke;
    v50 = &__block_descriptor_64_e34_v16__0___RCPEventStreamComposer__8l;
    v51 = v17;
    v52 = v19;
    v53 = v22;
    v54 = v24;
    v26 = &v47;
  }
  else
  {
    v59.origin.x = v6;
    v59.origin.y = v8;
    v59.size.width = v10;
    v59.size.height = v12;
    MidX = CGRectGetMidX(v59);
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.width = v10;
    v60.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, MidX, CGRectGetMaxY(v60));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    v29 = v28;
    v31 = v30;
    v61.origin.x = v6;
    v61.origin.y = v8;
    v61.size.width = v10;
    v61.size.height = v12;
    v32 = CGRectGetMidX(v61);
    v62.origin.x = v6;
    v62.origin.y = v8;
    v62.size.width = v10;
    v62.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, v32, CGRectGetMinY(v62));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    v34 = v33;
    v36 = v35;
    RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke_2;
    v42 = &__block_descriptor_64_e34_v16__0___RCPEventStreamComposer__8l;
    v43 = v29;
    v44 = v31;
    v45 = v34;
    v46 = v36;
    v26 = &v39;
  }
  -[objc_class eventStreamWithEventActions:](RCPSyntheticEventStreamClass, "eventStreamWithEventActions:", v26, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

uint64_t __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.25);
}

uint64_t __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.25);
}

+ (id)_controlCenterDismissEventStream
{
  if (LoadRecap_loadPredicate != -1)
    dispatch_once(&LoadRecap_loadPredicate, &__block_literal_global_1);
  return (id)-[objc_class eventStreamWithCLIArguments:](getRCPSyntheticEventStreamClass(), "eventStreamWithCLIArguments:", &unk_1E8D18860);
}

- (CGPoint)_centerPointOfModuleWithIdentifier:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  UIRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)_controlCenterShowOrbActionsEventStream:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class RCPSyntheticEventStreamClass;
  void *v15;
  _QWORD v17[6];

  -[CCUIMainViewController _centerPointOfModuleWithIdentifier:](self, "_centerPointOfModuleWithIdentifier:", a3);
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_keyWindowForScreen:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:toView:", 0, v4, v6);
  objc_msgSend(v9, "_convertPointToSceneReferenceSpace:");
  v11 = v10;
  v13 = v12;
  RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__CCUIMainViewController_PPT___controlCenterShowOrbActionsEventStream___block_invoke;
  v17[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v17[4] = v11;
  v17[5] = v13;
  -[objc_class eventStreamWithEventActions:](RCPSyntheticEventStreamClass, "eventStreamWithEventActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __71__CCUIMainViewController_PPT___controlCenterShowOrbActionsEventStream___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  id v4;

  v2 = *(double *)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "touchDown:", v2, v3);
  objc_msgSend(v4, "advanceTime:", 3.0);
  objc_msgSend(v4, "liftUpAtAllActivePoints");

}

+ (id)_controlCenterDismissOrbActionsEventStream
{
  void *v2;
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class RCPSyntheticEventStreamClass;
  void *v15;
  _QWORD v17[6];
  CGRect v18;
  CGRect v19;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keyWindowForScreen:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v9 = CGRectGetWidth(v18) * 0.1;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  objc_msgSend(v4, "convertPoint:toView:", 0, v9, CGRectGetHeight(v19) * 0.1);
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  v11 = v10;
  v13 = v12;
  RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__CCUIMainViewController_PPT___controlCenterDismissOrbActionsEventStream__block_invoke;
  v17[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v17[4] = v11;
  v17[5] = v13;
  -[objc_class eventStreamWithEventActions:](RCPSyntheticEventStreamClass, "eventStreamWithEventActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __73__CCUIMainViewController_PPT___controlCenterDismissOrbActionsEventStream__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tap:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

+ (void)_playEventStream:(id)a3 withCompletion:(id)a4
{
  id v5;
  Class (__cdecl *v6)();
  id v7;
  id v8;
  Class RCPInlinePlayerClass;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (Class (__cdecl *)())getRCPPlayerPlaybackOptionsClass;
  v7 = a3;
  v8 = objc_alloc_init(v6());
  RCPInlinePlayerClass = getRCPInlinePlayerClass();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CCUIMainViewController_PPT___playEventStream_withCompletion___block_invoke;
  v11[3] = &unk_1E8CFC738;
  v12 = v5;
  v10 = v5;
  -[objc_class playEventStream:options:completion:](RCPInlinePlayerClass, "playEventStream:options:completion:", v7, v8, v11);

}

uint64_t __63__CCUIMainViewController_PPT___playEventStream_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)_fetchModuleEnabledState:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  unint64_t v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  if (v3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    objc_msgSend(MEMORY[0x1E0D14548], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__CCUIMainViewController_PPT___fetchModuleEnabledState___block_invoke;
    v10[3] = &unk_1E8CFC760;
    v12 = &v13;
    v6 = v4;
    v11 = v6;
    objc_msgSend(v5, "getEnabledStateOfModuleWithIdentifier:completionHandler:", v3, v10);

    v7 = dispatch_time(0, 5000000000);
    v8 = 0;
    if (!dispatch_group_wait(v6, v7))
      v8 = v14[3];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __56__CCUIMainViewController_PPT___fetchModuleEnabledState___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)_forceModuleEnabled:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  BOOL v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  objc_msgSend(MEMORY[0x1E0D14548], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__CCUIMainViewController_PPT___forceModuleEnabled___block_invoke;
  v10[3] = &unk_1E8CFC788;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "requestEnableModuleWithIdentifier:force:completionHandler:", v3, 1, v10);

  v7 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v6, v7))
    v8 = 0;
  else
    v8 = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __51__CCUIMainViewController_PPT___forceModuleEnabled___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_disableModule:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0D14548];
    v4 = a3;
    objc_msgSend(v3, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestDisableModuleWithIdentifier:completionHandler:", v4, 0);

  }
}

- (void)runTest:(id)a3 subtests:(id)a4 eventStream:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;
  NSObject *v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _QWORD *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[6];
  char v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v36 = a5;
  v35 = a6;
  if (LoadRecap_loadPredicate_0 != -1)
    dispatch_once(&LoadRecap_loadPredicate_0, &__block_literal_global_65);
  objc_msgSend((id)objc_opt_class(), "_executeAndCleanupBlocksForAllSignposts");
  if (gSignpostListener)
    v13 = gSignpostListener == (_QWORD)self;
  else
    v13 = 1;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIMainViewController+PPTInternal.m"), 32, CFSTR("Invalid start state for test"));

  }
  objc_storeStrong((id *)&gSignpostListener, self);
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3810000000;
  v59[3] = &unk_1CFC12C7F;
  v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__1;
  v57[4] = __Block_byref_object_dispose__1;
  v14 = (void *)MEMORY[0x1E0C99E88];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke;
  v54[3] = &unk_1E8CFC8B8;
  v56 = v59;
  v15 = v11;
  v55 = v15;
  objc_msgSend(v14, "scheduledTimerWithTimeInterval:repeats:block:", 0, v54, 10.0);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_group_create();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v12;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        dispatch_group_enter(v16);
        v21 = (void *)objc_opt_class();
        v22 = objc_msgSend(v20, "beginSignpost");
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_2;
        v48[3] = &unk_1E8CFC540;
        v48[4] = v20;
        v23 = v15;
        v49 = v23;
        objc_msgSend(v21, "_addBlockForSignpost:block:", v22, v48);
        v24 = (void *)objc_opt_class();
        v25 = objc_msgSend(v20, "endSignpost");
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_3;
        v45[3] = &unk_1E8CFC568;
        v45[4] = v20;
        v46 = v23;
        v47 = v16;
        objc_msgSend(v24, "_addBlockForSignpost:block:", v25, v45);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v17);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_4;
  aBlock[3] = &unk_1E8CFC8E0;
  v43 = v59;
  v44 = v57;
  v26 = v15;
  v41 = v26;
  v27 = v35;
  v42 = v27;
  v28 = _Block_copy(aBlock);
  if (objc_msgSend(v26, "endSignpost"))
    objc_msgSend((id)objc_opt_class(), "_addBlockForSignpost:block:", objc_msgSend(v26, "endSignpost"), v28);
  else
    dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v28);
  if (objc_msgSend(v26, "beginSignpost"))
  {
    v29 = (void *)objc_opt_class();
    v30 = objc_msgSend(v26, "beginSignpost");
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_6;
    v38[3] = &unk_1E8CFC3D0;
    v39 = v26;
    objc_msgSend(v29, "_addBlockForSignpost:block:", v30, v38);
    v31 = v39;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "startedTest:", v32);

  }
  v33 = objc_alloc_init(getRCPPlayerPlaybackOptionsClass_0());
  -[objc_class playEventStream:options:completion:](getRCPInlinePlayerClass_0(), "playEventStream:options:completion:", v36, v33, &__block_literal_global_3);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);

}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failedTest:withFailure:withResults:", v5, CFSTR("Signpost timeout"), 0);

    v6 = (void *)gSignpostListener;
    gSignpostListener = 0;

  }
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedSubTest:forTest:", v2, v3);

}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedSubTest:forTest:", v3, v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_4(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "invalidate");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_5;
    v8[3] = &unk_1E8CFC738;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "finishedTest:extraResults:withTeardownBlock:", v7, 0, v8);

  }
}

uint64_t __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)gSignpostListener;
  gSignpostListener = 0;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedTest:", v2);

}

+ (id)_blocksBySignpost
{
  if (_blocksBySignpost_onceToken != -1)
    dispatch_once(&_blocksBySignpost_onceToken, &__block_literal_global_9);
  return (id)_blocksBySignpost_blocksBySignpost;
}

void __56__CCUIMainViewController_PPTInternal___blocksBySignpost__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_blocksBySignpost_blocksBySignpost;
  _blocksBySignpost_blocksBySignpost = v0;

}

+ (void)_addBlockForSignpost:(unint64_t)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_blocksBySignpost");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = _Block_copy(v6);
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "arrayByAddingObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v12, v13);

  objc_sync_exit(v7);
}

+ (void)_executeAndCleanupBlocksForAllSignposts
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_blocksBySignpost");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    v6 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  objc_msgSend(v3, "removeAllObjects");
  objc_sync_exit(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

+ (void)_executeBlocksForSignpost:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_blocksBySignpost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_takeObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)didReceiveSignpost:(unint64_t)a3
{
  objc_msgSend((id)objc_opt_class(), "_executeBlocksForSignpost:", a3);
}

+ (id)_presentationProviderForDevice
{
  objc_class *v2;
  void *v3;
  uint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D14538], "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationGesture");

  if (v4 == 1)
    v2 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v2);
}

- (CCUIMainViewController)initWithSystemAgent:(id)a3
{
  id v4;
  void *v5;
  CCUIMainViewController *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_presentationProviderForDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CCUIMainViewController _initWithSystemAgent:presentationProvider:](self, "_initWithSystemAgent:presentationProvider:", v4, v5);

  return v6;
}

- (id)_initWithSystemAgent:(id)a3 presentationProvider:(id)a4
{
  id v6;
  id v7;
  CCUIMainViewController *v8;
  CCUIModuleInstanceManager *v9;
  CCUIModuleSettingsManager *v10;
  CCUIStatusLabelViewController *v11;
  CCUIStatusLabelViewController *statusLabelViewController;
  uint64_t v13;
  CCUIAnimationRunner *primaryAnimationRunner;
  uint64_t v15;
  CCUIAnimationRunner *secondaryAnimationRunner;
  uint64_t v17;
  CCUIAnimationRunner *editingAnimationRunner;
  uint64_t v19;
  NSHashTable *blockingGestureRecognizers;
  void *v21;
  uint64_t v22;
  CCSControlCenterOperationService *controlCenterOperationService;
  void *v24;
  void *v25;
  uint64_t v26;
  FBSDisplayLayoutMonitor *layoutMonitor;
  CCUISensorActivityDataProvider *v28;
  CCUISensorActivityDataProvider *sensorActivityDataProvider;
  _TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *v30;
  _TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *gameModeActivityDataProvider;
  uint64_t v32;
  SFAskToAirDropReceiverControllerProtocol *askToAirDropController;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)CCUIMainViewController;
  v8 = -[CCUIMainViewController initWithNibName:bundle:](&v38, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = -[CCUIModuleInstanceManager initWithSystemAgent:]([CCUIModuleInstanceManager alloc], "initWithSystemAgent:", v6);
    -[CCUIMainViewController setModuleInstanceManager:](v8, "setModuleInstanceManager:", v9);
    -[CCUIModuleInstanceManager setContextDelegate:](v9, "setContextDelegate:", v8);
    -[CCUIModuleInstanceManager addObserver:](v9, "addObserver:", v8);
    v10 = objc_alloc_init(CCUIModuleSettingsManager);
    -[CCUIMainViewController setModuleSettingsManager:](v8, "setModuleSettingsManager:", v10);
    v11 = objc_alloc_init(CCUIStatusLabelViewController);
    statusLabelViewController = v8->_statusLabelViewController;
    v8->_statusLabelViewController = v11;

    -[CCUIMainViewController setDefinesPresentationContext:](v8, "setDefinesPresentationContext:", 1);
    objc_storeStrong((id *)&v8->_presentationProvider, a4);
    -[CCUIOverlayPresentationProvider setViewProvider:](v8->_presentationProvider, "setViewProvider:", v8);
    -[CCUIOverlayPresentationProvider setMetricsProvider:](v8->_presentationProvider, "setMetricsProvider:", v8);
    +[CCUIAnimationRunner runner](CCUIAnimationRunner, "runner");
    v13 = objc_claimAutoreleasedReturnValue();
    primaryAnimationRunner = v8->_primaryAnimationRunner;
    v8->_primaryAnimationRunner = (CCUIAnimationRunner *)v13;

    +[CCUIAnimationRunner runner](CCUIAnimationRunner, "runner");
    v15 = objc_claimAutoreleasedReturnValue();
    secondaryAnimationRunner = v8->_secondaryAnimationRunner;
    v8->_secondaryAnimationRunner = (CCUIAnimationRunner *)v15;

    +[CCUIAnimationRunner runner](CCUIAnimationRunner, "runner");
    v17 = objc_claimAutoreleasedReturnValue();
    editingAnimationRunner = v8->_editingAnimationRunner;
    v8->_editingAnimationRunner = (CCUIAnimationRunner *)v17;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v19 = objc_claimAutoreleasedReturnValue();
    blockingGestureRecognizers = v8->_blockingGestureRecognizers;
    v8->_blockingGestureRecognizers = (NSHashTable *)v19;

    -[CCUIMainViewController statusLabelViewController](v8, "statusLabelViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v8);

    objc_msgSend(MEMORY[0x1E0D14540], "sharedService");
    v22 = objc_claimAutoreleasedReturnValue();
    controlCenterOperationService = v8->_controlCenterOperationService;
    v8->_controlCenterOperationService = (CCSControlCenterOperationService *)v22;

    -[CCSControlCenterOperationService setDelegate:](v8->_controlCenterOperationService, "setDelegate:", v8);
    v24 = (void *)MEMORY[0x1E0D230D0];
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "monitorWithConfiguration:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v8->_layoutMonitor;
    v8->_layoutMonitor = (FBSDisplayLayoutMonitor *)v26;

    v28 = objc_alloc_init(CCUISensorActivityDataProvider);
    sensorActivityDataProvider = v8->_sensorActivityDataProvider;
    v8->_sensorActivityDataProvider = v28;

    v30 = -[CCUIGameModeActivityDataProvider initWithDelegate:]([_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider alloc], "initWithDelegate:", v8);
    gameModeActivityDataProvider = v8->_gameModeActivityDataProvider;
    v8->_gameModeActivityDataProvider = v30;

    v8->_showingRootView = 1;
    if (_os_feature_enabled_impl())
    {
      SFCreateAskToAirDropReceiverController();
      v32 = objc_claimAutoreleasedReturnValue();
      askToAirDropController = v8->_askToAirDropController;
      v8->_askToAirDropController = (SFAskToAirDropReceiverControllerProtocol *)v32;

      objc_initWeak(&location, v8);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __68__CCUIMainViewController__initWithSystemAgent_presentationProvider___block_invoke;
      v35[3] = &unk_1E8CFCB48;
      objc_copyWeak(&v36, &location);
      -[SFAskToAirDropReceiverControllerProtocol setPendingOrActiveConnectionsChangedHandler:](v8->_askToAirDropController, "setPendingOrActiveConnectionsChangedHandler:", v35);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    objc_storeWeak((id *)&v8->_systemAgent, v6);

  }
  return v8;
}

void __68__CCUIMainViewController__initWithSystemAgent_presentationProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_askToAirDropPendingOrActiveConnectionsDidChange");

}

- (int64_t)_interfaceOrientation
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CCUIMainViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  if (v4 <= 1)
    return 1;
  else
    return v4;
}

- (id)_safeStatusLabelViewContainerView
{
  void *v4;
  void *v6;

  -[CCUIMainViewController _statusLabelViewContainerView](self, "_statusLabelViewContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIMainViewController.m"), 213, CFSTR("The status label view's container view should have been created"));

  }
  return v4;
}

- (void)_becomeActive
{
  void *v3;

  if (!self->_active)
  {
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "willBecomeActive");

  }
  self->_active = 1;
  -[CCUIMainViewController _setupPanGestureFailureRequirements](self, "_setupPanGestureFailureRequirements");
}

- (id)_statusLabelViewContainerView
{
  CCUIHeaderPocketView *headerPocketView;

  headerPocketView = self->_headerPocketView;
  if (!headerPocketView)
    headerPocketView = (CCUIHeaderPocketView *)self->_containerView;
  return headerPocketView;
}

- (id)_pagingViewContainerView
{
  return self->_containerView;
}

- (id)_safePagingViewContainerView
{
  void *v4;
  void *v6;

  -[CCUIMainViewController _pagingViewContainerView](self, "_pagingViewContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIMainViewController.m"), 237, CFSTR("The paging view's container view should have been created"));

  }
  return v4;
}

- (unint64_t)moduleRowCount
{
  return -[CCUIPagingViewController moduleRowCount](self->_pagingViewController, "moduleRowCount");
}

- (UIView)pagingView
{
  return (UIView *)-[CCUIPagingViewController view](self->_pagingViewController, "view");
}

- (void)setPresentationState:(unint64_t)a3
{
  void *v5;
  unint64_t presentationState;
  const __CFString *v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_presentationState != a3)
  {
    v5 = (void *)*MEMORY[0x1E0D146A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
    {
      presentationState = self->_presentationState;
      if (presentationState > 3)
        v7 = CFSTR("<invalid>");
      else
        v7 = off_1E8CFCE00[presentationState];
      if (a3 > 3)
        v8 = CFSTR("<invalid>");
      else
        v8 = off_1E8CFCE00[a3];
      *(_DWORD *)v11 = 138543618;
      *(_QWORD *)&v11[4] = v7;
      *(_WORD *)&v11[12] = 2114;
      *(_QWORD *)&v11[14] = v8;
      v9 = v5;
      _os_log_impl(&dword_1CFB7D000, v9, OS_LOG_TYPE_DEFAULT, "Transitioning presentation state: fromState=%{public}@, toState=%{public}@", v11, 0x16u);

    }
    self->_presentationState = a3;
    -[CCUIMainViewController delegate](self, "delegate", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "controlCenterViewController:didChangePresentationState:", self, self->_presentationState);

  }
}

- (void)setTransitionState:(unint64_t)a3
{
  void *v5;
  unint64_t transitionState;
  const __CFString *v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_transitionState != a3)
  {
    v5 = (void *)*MEMORY[0x1E0D146A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
    {
      transitionState = self->_transitionState;
      if (transitionState > 2)
        v7 = CFSTR("<invalid>");
      else
        v7 = off_1E8CFCDE8[transitionState];
      if (a3 > 2)
        v8 = CFSTR("<invalid>");
      else
        v8 = off_1E8CFCDE8[a3];
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v9 = v5;
      _os_log_impl(&dword_1CFB7D000, v9, OS_LOG_TYPE_DEFAULT, "Transitioning transition state: fromState=%{public}@, toState=%{public}@", (uint8_t *)&v10, 0x16u);

    }
    self->_transitionState = a3;
  }
}

- (void)setReachabilityActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 reachabilityActive;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_reachabilityActive != a3)
  {
    v3 = a3;
    v5 = *MEMORY[0x1E0D146A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
    {
      reachabilityActive = self->_reachabilityActive;
      *(_DWORD *)buf = 67109376;
      v12 = reachabilityActive;
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1CFB7D000, v5, OS_LOG_TYPE_DEFAULT, "Toggling reachability active: from=%{BOOL}d, to=%{BOOL}d", buf, 0xEu);
    }
    self->_reachabilityActive = v3;
    -[CCUIMainViewController _scrollView](self, "_scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScrollEnabled:", !v3);

    -[CCUIMainViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reachabilitySpringAnimationBehaviorForControlCenterViewController:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__CCUIMainViewController_setReachabilityActive___block_invoke;
    v10[3] = &unk_1E8CFC3D0;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringBehavior:tracking:animations:completion:", v9, 0, v10, 0);

  }
}

uint64_t __48__CCUIMainViewController_setReachabilityActive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 32), "_updateHotPocket:animated:", 0, 0);
}

- (BOOL)isHomeGestureDismissalAllowed
{
  return 1;
}

- (void)reachabilityAnimationDidEnd
{
  unint64_t v3;

  if (!self->_reachabilityActive)
  {
    v3 = -[CCUIMainViewController presentationState](self, "presentationState");
    if (-[CCUIMainViewController transitionState](self, "transitionState") != 1 && v3 - 1 <= 1)
      -[CCUIMainViewController _replaceBackgroundViewContentsWithSnapshotIfNecessary:](self, "_replaceBackgroundViewContentsWithSnapshotIfNecessary:", 1);
  }
}

- (void)setCurrentTransitionUUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *currentTransitionUUID;
  NSUUID *v7;
  NSUUID *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    currentTransitionUUID = self->_currentTransitionUUID;
    v9 = 138543618;
    v10 = currentTransitionUUID;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1CFB7D000, v5, OS_LOG_TYPE_DEFAULT, "Changed transition UUID: from=%{public}@, to=%{public}@", (uint8_t *)&v9, 0x16u);
  }
  v7 = (NSUUID *)objc_msgSend(v4, "copy");
  v8 = self->_currentTransitionUUID;
  self->_currentTransitionUUID = v7;

}

- (void)setSensorActivityDataProvider:(id)a3
{
  CCUISensorActivityDataProvider *v4;
  NSObject *v5;
  CCUISensorActivityDataProvider *sensorActivityDataProvider;
  uint8_t v7[16];

  v4 = (CCUISensorActivityDataProvider *)a3;
  v5 = *MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CFB7D000, v5, OS_LOG_TYPE_DEFAULT, "Updated sensor activity data provider", v7, 2u);
  }
  sensorActivityDataProvider = self->_sensorActivityDataProvider;
  self->_sensorActivityDataProvider = v4;

  if (!-[CCUIMainViewController presentationState](self, "presentationState"))
    -[CCUIMainViewController _updateSensorActivityStatusForHeaderPocketView](self, "_updateSensorActivityStatusForHeaderPocketView");
}

- (void)willOpenExpandedSensorAttributionViewController
{
  id v3;

  -[CCUIMainViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "willOpenExpandedModuleForControlCenterViewController:", self);

}

- (void)didCloseExpandedSensorAttributionViewController
{
  id v3;

  -[CCUIMainViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didCloseExpandedModuleForControlCenterViewController:", self);

}

- (void)didTriggerEditButtonPrimaryAction
{
  -[CCUIMainViewController setEditing:](self, "setEditing:", 1);
}

- (void)didTriggerPowerButtonPrimaryAction
{
  id v3;

  -[CCUIMainViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRequestPowerDownTransientOverlayForControlCenterViewController:", self);

}

- (BOOL)isSensorAttributionViewControllerExpanded
{
  return -[CCUIHeaderPocketView isSensorAttributionViewControllerExpanded](self->_headerPocketView, "isSensorAttributionViewControllerExpanded");
}

- (BOOL)canDismissPresentedContent
{
  void *v3;
  BOOL v4;

  -[CCUIMainViewController pagingViewController](self, "pagingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "canDismissPresentedContent") & 1) != 0
    || -[CCUIMainViewController isSensorAttributionViewControllerExpanded](self, "isSensorAttributionViewControllerExpanded");

  return v4;
}

- (void)expandModuleWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CCUIMainViewController pagingViewController](self, "pagingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expandModuleWithIdentifier:", v4);

}

- (void)dismissPresentedContent
{
  -[CCUIMainViewController dismissPresentedContentWithCompletionHandler:](self, "dismissPresentedContentWithCompletionHandler:", 0);
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  -[CCUIMainViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", 1, a3);
}

- (void)dismissExpandedModuleAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (-[CCUIMainViewController isSensorAttributionViewControllerExpanded](self, "isSensorAttributionViewControllerExpanded"))
  {
    -[CCUIHeaderPocketView dismissSensorAttributionExpandedView:completion:](self->_headerPocketView, "dismissSensorAttributionExpandedView:completion:", v4, v7);
  }
  else
  {
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissExpandedModuleAnimated:completion:", v4, v7);

  }
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (-[CCUIMainViewController isSensorAttributionViewControllerExpanded](self, "isSensorAttributionViewControllerExpanded"))
  {
    -[CCUIHeaderPocketView dismissSensorAttributionExpandedView:completion:](self->_headerPocketView, "dismissSensorAttributionExpandedView:completion:", v4, v7);
  }
  else
  {
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissPresentedContentAnimated:completion:", v4, v7);

  }
}

- (void)displayWillTurnOff
{
  id v3;

  if (-[CCUIMainViewController _appearState](self, "_appearState") == 2)
  {
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayWillTurnOff");

  }
}

- (void)presentAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  id v16;
  void (**v17)(_QWORD);
  uint8_t buf[4];
  _BOOL4 v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v7 = -[CCUIMainViewController presentationState](self, "presentationState");
  v8 = (void *)*MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 3)
      v9 = CFSTR("<invalid>");
    else
      v9 = off_1E8CFCE00[v7];
    *(_DWORD *)buf = 67109378;
    v19 = v4;
    v20 = 2114;
    v21 = v9;
    v10 = v8;
    _os_log_impl(&dword_1CFB7D000, v10, OS_LOG_TYPE_DEFAULT, "Requested presentation: animated=%{BOOL}d, presentationState=%{public}@", buf, 0x12u);

  }
  if (v7 == 2)
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    -[CCUIMainViewController _beginPresentationAnimated:interactive:](self, "_beginPresentationAnimated:interactive:", v4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E8CFCB98;
    aBlock[4] = self;
    v12 = v11;
    v16 = v12;
    v17 = v6;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (v4)
      (*((void (**)(void *))v13 + 2))(v13);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v13);

  }
}

void __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  +[CCUIOverlayTransitionState fullyPresentedState](CCUIOverlayTransitionState, "fullyPresentedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E8CFCB70;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_updatePresentationForTransitionState:withCompletionHander:", v3, v6);

}

uint64_t __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, int a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543874;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    v13 = 1024;
    v14 = a3;
    _os_log_impl(&dword_1CFB7D000, v6, OS_LOG_TYPE_DEFAULT, "Presentation complete: presentationUUID=%{public}@, finished=%{BOOL}d, retargeted=%{BOOL}d", (uint8_t *)&v9, 0x18u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_endPresentationWithUUID:", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_beginPresentationAnimated:(BOOL)a3 interactive:(BOOL)a4
{
  _BOOL4 v4;
  NSObject **v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CCUIStatusBarStyleSnapshot *v20;
  CCUIStatusBarStyleSnapshot *hostStatusBarStyleSnapshot;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[6];
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v4 = a4;
  v27 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = (NSObject **)MEMORY[0x1E0D146A8];
  v7 = *MEMORY[0x1E0D146A8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0D146A8]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_PRESENTATION_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  if (gSignpostListener)
    objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 1);
  v8 = -[CCUIMainViewController presentationState](self, "presentationState");
  if (v4)
    v9 = 1;
  else
    v9 = 2;
  v10 = -[CCUIMainViewController transitionState](self, "transitionState");
  v11 = *v6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v8 > 3)
      v12 = CFSTR("<invalid>");
    else
      v12 = off_1E8CFCE00[v8];
    v13 = CFSTR("animating");
    if (v4)
      v13 = CFSTR("interactive");
    v14 = v13;
    *(_DWORD *)buf = 67110402;
    v32 = v27;
    v33 = 1024;
    v34 = v4;
    v35 = 2114;
    v36 = v12;
    v37 = 2114;
    v38 = v14;
    v39 = 1024;
    v40 = v8 != 1;
    v41 = 1024;
    v42 = v10 != v9;
    v15 = v11;
    _os_log_impl(&dword_1CFB7D000, v15, OS_LOG_TYPE_DEFAULT, "Begin presentation: animated=%{BOOL}d, interactive=%{BOOL}d, currentState=%{public}@, transitionState=%{public}@, presentationStateWillChange=%{BOOL}d, transitionStateWillChange=%{BOOL}d", buf, 0x2Eu);

  }
  if (v8 != 1 || v10 != v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = -[CCUIOverlayPresentationProvider headerMode](self->_presentationProvider, "headerMode");
    else
      v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIMainViewController setCurrentTransitionUUID:](self, "setCurrentTransitionUUID:", v17);

    -[CCUIMainViewController setTransitionState:](self, "setTransitionState:", v9);
    -[CCUIMainViewController _updateAskToAirDropModuleVisibility](self, "_updateAskToAirDropModuleVisibility");
    if ((v16 & 0xFFFFFFFFFFFFFFFELL) != 2 || v8)
    {
      -[CCUIMainViewController setPresentationState:](self, "setPresentationState:", 1);
      if (v8)
      {
        if (v8 != 3)
        {
LABEL_28:
          if (v8 != 1)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              -[CCUIOverlayPresentationProvider prepareForPresentation](self->_presentationProvider, "prepareForPresentation");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v27)
              {
                -[CCUIAnimationRunner runAnimationBatch:withCompletionBlock:](self->_primaryAnimationRunner, "runAnimationBatch:withCompletionBlock:", v23, 0);
              }
              else
              {
                v25 = (void *)MEMORY[0x1E0DC3F10];
                v28[0] = MEMORY[0x1E0C809B0];
                v28[1] = 3221225472;
                v28[2] = __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_3;
                v28[3] = &unk_1E8CFC540;
                v28[4] = self;
                v29 = v23;
                objc_msgSend(v25, "performWithoutAnimation:", v28);

              }
            }
            -[UIViewController ccui_safelyBeginAppearanceTransitionForChildViewControllers:animated:](self, "ccui_safelyBeginAppearanceTransitionForChildViewControllers:animated:", 1, v27);
          }
          goto LABEL_35;
        }
LABEL_27:
        -[MTMaterialView bs_setHitTestingDisabled:](self->_backgroundView, "bs_setHitTestingDisabled:", 0);
        goto LABEL_28;
      }
    }
    else
    {
      -[CCUIMainViewController hostStatusBarStyleProvider](self, "hostStatusBarStyleProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hostStatusBarStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (CCUIStatusBarStyleSnapshot *)objc_msgSend(v19, "copy");
      hostStatusBarStyleSnapshot = self->_hostStatusBarStyleSnapshot;
      self->_hostStatusBarStyleSnapshot = v20;

      -[CCUIMainViewController setPresentationState:](self, "setPresentationState:", 1);
    }
    -[CCUIMainViewController _becomeActive](self, "_becomeActive");
    -[CCUIMainViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 0);

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke;
    v30[3] = &unk_1E8CFCBE8;
    v30[4] = self;
    v30[5] = v16;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v30);
    goto LABEL_27;
  }
LABEL_35:
  -[CCUIMainViewController currentTransitionUUID](self, "currentTransitionUUID");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "overlayHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:orientationHint:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_interfaceOrientation"));

  if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "_interfaceOrientation") - 1) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v3 = (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  else
  {
    v3 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 2)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "isHidden") | v3) != 1)
    {
      v8 = objc_alloc(+[CCUIStatusBar statusBarClass](CCUIStatusBar, "statusBarClass"));
      v9 = objc_msgSend(v8, "initWithFrame:showForegroundView:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 1032);
      *(_QWORD *)(v10 + 1032) = v9;

      objc_msgSend(*(id *)(a1 + 32), "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032), 0);

      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 1032);
      v35[0] = *MEMORY[0x1E0DC5A08];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setEnabledPartIdentifiers:", v14);

      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 1032);
      objc_msgSend(*(id *)(v15 + 1128), "leadingStyleRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setStyleRequest:", v17);

      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 1032);
      objc_msgSend(*(id *)(v18 + 1128), "avoidanceFrame");
      objc_msgSend(v19, "setAvoidanceFrame:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "hiddenPartIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v20;
      if (v20)
      {
        v21 = *(void **)(*(_QWORD *)(a1 + 32) + 1032);
        v34 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDisabledPartIdentifiers:", v22);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "statusBar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "overlayData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setOverlayData:", v24);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "actionsByPartIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_2;
        v33[3] = &unk_1E8CFCBC0;
        v33[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v33);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "statusBar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "prepareForPresentation");

      goto LABEL_14;
    }
    v6 = *(_QWORD *)(a1 + 40);
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareForPresentation");
LABEL_14:

  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutIfNeeded");

  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 1120);
  *(_QWORD *)(v29 + 1120) = 0;

  v31 = *(void **)(a1 + 32);
  +[CCUIOverlayTransitionState fullyDismissedState](CCUIOverlayTransitionState, "fullyDismissedState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_updatePresentationForTransitionState:withCompletionHander:", v32, 0);

}

uint64_t __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAction:forPartWithIdentifier:", a3, a2);
}

uint64_t __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "runAnimationBatch:withCompletionBlock:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_replaceBackgroundViewContentsWithSnapshotIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 IsReduceTransparencyEnabled;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v6 = -[MTMaterialView isContentReplacedWithSnapshot](self->_backgroundView, "isContentReplacedWithSnapshot");
  if (v3 && IsReduceTransparencyEnabled && (v6 & 1) == 0 && !self->_reachabilityActive)
  {
    -[MTMaterialView setContentReplacedWithSnapshot:](self->_backgroundView, "setContentReplacedWithSnapshot:", 1);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v10, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView layer](self->_backgroundView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContents:", v9);

    -[CCUIHeaderPocketView setCustomBackgroundView:](self->_headerPocketView, "setCustomBackgroundView:", v10);
  }
  else if (!v3 && ((v6 ^ 1) & 1) == 0)
  {
    -[MTMaterialView setContentReplacedWithSnapshot:](self->_backgroundView, "setContentReplacedWithSnapshot:", 0);
    -[CCUIHeaderPocketView setCustomBackgroundView:](self->_headerPocketView, "setCustomBackgroundView:", 0);
  }
}

- (void)_endPresentationWithUUID:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  os_log_t *v7;
  os_log_t v8;
  const __CFString *v9;
  os_log_t v10;
  const __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _BYTE v15[24];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CCUIMainViewController currentTransitionUUID](self, "currentTransitionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CCUIMainViewController presentationState](self, "presentationState");
  v7 = (os_log_t *)MEMORY[0x1E0D146A8];
  if (v4 && objc_msgSend(v5, "isEqual:", v4))
  {
    v8 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 > 3)
        v9 = CFSTR("<invalid>");
      else
        v9 = off_1E8CFCE00[v6];
      *(_DWORD *)v15 = 138543874;
      *(_QWORD *)&v15[4] = v4;
      *(_WORD *)&v15[12] = 2114;
      *(_QWORD *)&v15[14] = v5;
      *(_WORD *)&v15[22] = 2114;
      v16 = v9;
      v13 = v8;
      _os_log_impl(&dword_1CFB7D000, v13, OS_LOG_TYPE_DEFAULT, "End presentation: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v15, 0x20u);

    }
    -[CCUIMainViewController setCurrentTransitionUUID:](self, "setCurrentTransitionUUID:", 0, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
    -[CCUIMainViewController setTransitionState:](self, "setTransitionState:", 0);
    -[CCUIMainViewController setPresentationState:](self, "setPresentationState:", 2);
    if (v6 != 2)
    {
      -[UIViewController ccui_safelyEndAppearanceTransitionForChildViewControllers](self, "ccui_safelyEndAppearanceTransitionForChildViewControllers");
      -[CCUIMainViewController _replaceBackgroundViewContentsWithSnapshotIfNecessary:](self, "_replaceBackgroundViewContentsWithSnapshotIfNecessary:", 1);
    }
  }
  else
  {
    v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 > 3)
        v11 = CFSTR("<invalid>");
      else
        v11 = off_1E8CFCE00[v6];
      *(_DWORD *)v15 = 138543874;
      *(_QWORD *)&v15[4] = v4;
      *(_WORD *)&v15[12] = 2114;
      *(_QWORD *)&v15[14] = v5;
      *(_WORD *)&v15[22] = 2114;
      v16 = v11;
      v12 = v10;
      _os_log_impl(&dword_1CFB7D000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring end presentation as UUID is stale: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v15, 0x20u);

    }
  }
  v14 = *v7;
  if (os_signpost_enabled(*v7))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_PRESENTATION_END", " enableTelemetry=YES ", v15, 2u);
  }
  kdebug_trace();
  if (gSignpostListener)
    objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 2);

}

- (void)dismissAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  BOOL v16;
  uint8_t buf[4];
  _BOOL4 v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v7 = -[CCUIMainViewController presentationState](self, "presentationState");
  v8 = (void *)*MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 3)
      v9 = CFSTR("<invalid>");
    else
      v9 = off_1E8CFCE00[v7];
    *(_DWORD *)buf = 67109378;
    v18 = v4;
    v19 = 2114;
    v20 = v9;
    v10 = v8;
    _os_log_impl(&dword_1CFB7D000, v10, OS_LOG_TYPE_DEFAULT, "Requested dismissal: animated=%{BOOL}d, presentationState=%{public}@", buf, 0x12u);

  }
  if (v7)
  {
    -[CCUIMainViewController _cancelDismissalPanGestures](self, "_cancelDismissalPanGestures");
    -[CCUIMainViewController setEditing:](self, "setEditing:", 0);
    -[CCUIMainViewController _beginDismissalAnimated:interactive:](self, "_beginDismissalAnimated:interactive:", v4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E8CFCC38;
    v13[4] = self;
    v14 = v11;
    v16 = v4;
    v15 = v6;
    v12 = v11;
    -[CCUIMainViewController dismissExpandedModuleAnimated:completion:](self, "dismissExpandedModuleAnimated:completion:", v4, v13);

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

void __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;
  uint8_t buf[16];

  v2 = *MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFB7D000, v2, OS_LOG_TYPE_DEFAULT, "Modules dismissed", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_deactivateReachability");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "bs_setHitTestingDisabled:", 1);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_51;
  v10 = &unk_1E8CFCC38;
  v4 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v14 = *(_BYTE *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  v5 = _Block_copy(&v7);
  v6 = v5;
  if (*(_BYTE *)(a1 + 56))
    (*((void (**)(void *))v5 + 2))(v5);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5, v7, v8, v9, v10, v11, v12);

}

void __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_51(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  char v10;

  v2 = *(void **)(a1 + 32);
  +[CCUIOverlayTransitionState fullyDismissedState](CCUIOverlayTransitionState, "fullyDismissedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E8CFCC10;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v10 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_updatePresentationForTransitionState:withCompletionHander:", v3, v6);

}

void __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, int a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    v24 = 1024;
    v25 = a2;
    v26 = 1024;
    v27 = a3;
    _os_log_impl(&dword_1CFB7D000, v6, OS_LOG_TYPE_DEFAULT, "Dismissal complete: dismissalUUID=%{public}@, finished=%{BOOL}d, retargeted=%{BOOL}d", buf, 0x18u);
  }
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "currentTransitionUUID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32)),
        v8,
        v9)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "cleanupForDismissal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 976);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[2] = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_54;
    v17[3] = &unk_1E8CFCC10;
    v17[1] = 3221225472;
    v13 = v11;
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(a1 + 48);
    v18 = v13;
    v19 = v14;
    v21 = *(_BYTE *)(a1 + 56);
    v20 = v15;
    objc_msgSend(v12, "additivelyRunAnimationBatch:withCompletionBlock:", v10, v17);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_endDismissalWithUUID:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
    v16 = *(_QWORD *)(a1 + 48);
    if (v16)
      (*(void (**)(void))(v16 + 16))();
  }
}

uint64_t __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_54(uint64_t a1, int a2, int a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543874;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    v13 = 1024;
    v14 = a3;
    _os_log_impl(&dword_1CFB7D000, v6, OS_LOG_TYPE_DEFAULT, "Dismissal cleanup complete: dismissalUUID=%{public}@, finished=%{BOOL}d, retargeted=%{BOOL}d", (uint8_t *)&v9, 0x18u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_endDismissalWithUUID:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_beginDismissalAnimated:(BOOL)a3 interactive:(BOOL)a4
{
  _BOOL4 v4;
  NSObject **v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CCUIStatusBarStyleSnapshot *v20;
  CCUIStatusBarStyleSnapshot *hostStatusBarStyleSnapshot;
  void *v22;
  _BOOL4 v24;
  _QWORD v25[5];
  uint8_t buf[4];
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v4 = a4;
  v24 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = (NSObject **)MEMORY[0x1E0D146A8];
  v7 = *MEMORY[0x1E0D146A8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0D146A8]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_DISMISSAL_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  if (gSignpostListener)
    objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 3);
  v8 = -[CCUIMainViewController presentationState](self, "presentationState");
  if (v4)
    v9 = 1;
  else
    v9 = 2;
  v10 = -[CCUIMainViewController transitionState](self, "transitionState");
  v11 = *v6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v8 > 3)
      v12 = CFSTR("<invalid>");
    else
      v12 = off_1E8CFCE00[v8];
    v13 = CFSTR("animating");
    if (v4)
      v13 = CFSTR("interactive");
    v14 = v13;
    *(_DWORD *)buf = 67110402;
    v27 = v24;
    v28 = 1024;
    v29 = v4;
    v30 = 2114;
    v31 = v12;
    v32 = 2114;
    v33 = v14;
    v34 = 1024;
    v35 = v8 != 3;
    v36 = 1024;
    v37 = v10 != v9;
    v15 = v11;
    _os_log_impl(&dword_1CFB7D000, v15, OS_LOG_TYPE_DEFAULT, "Begin dismissal: animated=%{BOOL}d, interactive=%{BOOL}d, currentState=%{public}@, transitionState=%{public}@, presentationStateWillChange=%{BOOL}d, transitionStateWillChange=%{BOOL}d", buf, 0x2Eu);

  }
  if (v8 != 3 || v10 != v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = -[CCUIOverlayPresentationProvider headerMode](self->_presentationProvider, "headerMode") & 0xFFFFFFFFFFFFFFFELL;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMainViewController setCurrentTransitionUUID:](self, "setCurrentTransitionUUID:", v17);

      -[CCUIMainViewController setTransitionState:](self, "setTransitionState:", v9);
      if (v16 == 2)
      {
        -[CCUIMainViewController hostStatusBarStyleProvider](self, "hostStatusBarStyleProvider");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hostStatusBarStyle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (CCUIStatusBarStyleSnapshot *)objc_msgSend(v19, "copy");
        hostStatusBarStyleSnapshot = self->_hostStatusBarStyleSnapshot;
        self->_hostStatusBarStyleSnapshot = v20;

        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __62__CCUIMainViewController__beginDismissalAnimated_interactive___block_invoke;
        v25[3] = &unk_1E8CFC3D0;
        v25[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v25);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMainViewController setCurrentTransitionUUID:](self, "setCurrentTransitionUUID:", v22);

      -[CCUIMainViewController setTransitionState:](self, "setTransitionState:", v9);
    }
    -[CCUIMainViewController setPresentationState:](self, "setPresentationState:", 3);
    if (v8 != 3)
    {
      -[UIViewController ccui_safelyBeginAppearanceTransitionForChildViewControllers:animated:](self, "ccui_safelyBeginAppearanceTransitionForChildViewControllers:animated:", 0, v24);
      -[CCUIMainViewController _replaceBackgroundViewContentsWithSnapshotIfNecessary:](self, "_replaceBackgroundViewContentsWithSnapshotIfNecessary:", 0);
    }
  }
  -[CCUIMainViewController currentTransitionUUID](self, "currentTransitionUUID");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __62__CCUIMainViewController__beginDismissalAnimated_interactive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1032);
  objc_msgSend(*(id *)(v1 + 1128), "leadingStyleRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStyleRequest:", v3);

}

- (void)_endDismissalWithUUID:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  os_log_t *v8;
  os_log_t v9;
  const __CFString *v10;
  os_log_t v11;
  const __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  UIStatusBar *compactLeadingStatusBar;
  void *v18;
  NSObject *v19;
  _BYTE v20[24];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CCUIMainViewController currentTransitionUUID](self, "currentTransitionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CCUIMainViewController presentationState](self, "presentationState");
  v8 = (os_log_t *)MEMORY[0x1E0D146A8];
  if (v5 && objc_msgSend(v6, "isEqual:", v5))
  {
    v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 > 3)
        v10 = CFSTR("<invalid>");
      else
        v10 = off_1E8CFCE00[v7];
      *(_DWORD *)v20 = 138543874;
      *(_QWORD *)&v20[4] = v5;
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v6;
      *(_WORD *)&v20[22] = 2114;
      v21 = v10;
      v14 = v9;
      _os_log_impl(&dword_1CFB7D000, v14, OS_LOG_TYPE_DEFAULT, "End dismissal: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v20, 0x20u);

    }
    -[CCUIMainViewController setCurrentTransitionUUID:](self, "setCurrentTransitionUUID:", 0, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
    -[CCUIMainViewController overlayHeaderView](self, "overlayHeaderView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMode:orientationHint:", 0, 0);

    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scrollToDefaultPageAnimated:completion:", 0, 0);

    -[UIStatusBar removeFromSuperview](self->_compactLeadingStatusBar, "removeFromSuperview");
    compactLeadingStatusBar = self->_compactLeadingStatusBar;
    self->_compactLeadingStatusBar = 0;

    -[CCUIMainViewController _resignActive](self, "_resignActive");
    -[CCUIMainViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    -[CCUIMainViewController setTransitionState:](self, "setTransitionState:", 0);
    -[CCUIMainViewController setPresentationState:](self, "setPresentationState:", 0);
    -[MTMaterialView bs_setHitTestingDisabled:](self->_backgroundView, "bs_setHitTestingDisabled:", 1);
    if (v7)
      -[UIViewController ccui_safelyEndAppearanceTransitionForChildViewControllers](self, "ccui_safelyEndAppearanceTransitionForChildViewControllers");
  }
  else
  {
    v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 > 3)
        v12 = CFSTR("<invalid>");
      else
        v12 = off_1E8CFCE00[v7];
      *(_DWORD *)v20 = 138543874;
      *(_QWORD *)&v20[4] = v5;
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v6;
      *(_WORD *)&v20[22] = 2114;
      v21 = v12;
      v13 = v11;
      _os_log_impl(&dword_1CFB7D000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring end dismissal as UUID is stale: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v20, 0x20u);

    }
  }
  v19 = *v8;
  if (os_signpost_enabled(*v8))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_DISMISSAL_END", " enableTelemetry=YES ", v20, 2u);
  }
  kdebug_trace();
  if (gSignpostListener)
    objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 4);

}

- (void)_updatePresentationForTransitionType:(unint64_t)a3 translation:(CGPoint)a4 interactive:(BOOL)a5
{
  id v6;

  -[CCUIOverlayPresentationProvider transitionStateForType:interactive:translation:](self->_presentationProvider, "transitionStateForType:interactive:translation:", a3, a5, a4.x, a4.y);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIMainViewController _updatePresentationForTransitionState:withCompletionHander:](self, "_updatePresentationForTransitionState:withCompletionHander:", v6, 0);

}

- (void)_updatePresentationForTransitionState:(id)a3 withCompletionHander:(id)a4
{
  CCUIOverlayPresentationProvider *presentationProvider;
  CCUIOverlayTransitionState *previousTransitionState;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  CCUIOverlayTransitionState *v13;
  CCUIOverlayTransitionState *v14;
  id v15;

  v15 = a3;
  presentationProvider = self->_presentationProvider;
  previousTransitionState = self->_previousTransitionState;
  v8 = a4;
  -[CCUIOverlayPresentationProvider animationBatchForTransitionState:previousTransitionState:](presentationProvider, "animationBatchForTransitionState:previousTransitionState:", v15, previousTransitionState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAnimationRunner additivelyRunAnimationBatch:withCompletionBlock:](self->_primaryAnimationRunner, "additivelyRunAnimationBatch:withCompletionBlock:", v9, v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIOverlayPresentationProvider secondaryAnimationBatchForTransitionState:previousTransitionState:](self->_presentationProvider, "secondaryAnimationBatchForTransitionState:previousTransitionState:", v15, self->_previousTransitionState);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAnimationRunner additivelyRunAnimationBatch:withCompletionBlock:](self->_secondaryAnimationRunner, "additivelyRunAnimationBatch:withCompletionBlock:", v10, 0);

  }
  if (-[CCUIOverlayPresentationProvider allowHotPocketDuringTransition](self->_presentationProvider, "allowHotPocketDuringTransition"))
  {
    -[CCUIMainViewController _updateHotPocketAnimated:](self, "_updateHotPocketAnimated:", 1);
    -[CCUIMainViewController _updateChevronStateForTransitionState:](self, "_updateChevronStateForTransitionState:", v15);
  }
  else
  {
    -[CCUIMainViewController _updateHotPocket:animated:](self, "_updateHotPocket:animated:", 0, 1);
  }
  v11 = +[CCUIOverlayTransitionState isSignificantTransitionFrom:to:](CCUIOverlayTransitionState, "isSignificantTransitionFrom:to:", self->_previousTransitionState, v15);
  -[CCUIMainViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "presentationProgress");
    objc_msgSend(v12, "controlCenterViewController:significantPresentationProgressChange:", self);
  }
  v13 = (CCUIOverlayTransitionState *)objc_msgSend(v15, "copyWithZone:", 0);
  v14 = self->_previousTransitionState;
  self->_previousTransitionState = v13;

}

- (void)_setPresentationPanGestureActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_presentationPanGestureActive = a3;
  -[CCUIPagingViewController interactivePagingCoordinator](self->_pagingViewController, "interactivePagingCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldExtendAreaForPagingContinuation:", v3);

}

- (void)_evaluatePresentationContinuationIntoPagingWithLocation:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  NSArray *v8;
  NSArray *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  NSArray *presentationTouchIdentifiers;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];

  y = a3.y;
  x = a3.x;
  -[CCUIOverlayTransitionState pagingProgress](self->_previousTransitionState, "pagingProgress");
  v7 = v6;
  v8 = self->_presentationTouchIdentifiers;
  v9 = v8;
  if (v7 > 0.0 && -[NSArray count](v8, "count"))
  {
    -[CCUIOverlayTransitionState presentationProgress](self->_previousTransitionState, "presentationProgress");
    v11 = v10;
    -[CCUIPagingViewController interactivePagingCoordinator](self->_pagingViewController, "interactivePagingCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 > 1.0)
    {
      -[CCUIMainViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "canBeginPagingAtLocation:inView:", v13, x, y);

      if (v14)
      {
        objc_msgSend(v12, "willBeginPagingInteractively:", 1);
        presentationTouchIdentifiers = self->_presentationTouchIdentifiers;
        self->_presentationTouchIdentifiers = 0;

        -[CCUIMainViewController delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "controlCenterViewControllerWillContinuePresentationIntoPaging:", self);
        -[CCUIMainViewController overlayPageControl](self, "overlayPageControl");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_contextId");

        v19 = *MEMORY[0x1E0D146A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_1CFB7D000, v19, OS_LOG_TYPE_DEFAULT, "Control Center transferred presentation touches into paging", v20, 2u);
        }
        BKSHIDEventTransferTouchesToDifferentCAContext();

      }
    }

  }
}

- (void)_resignActive
{
  id v2;

  self->_active = 0;
  -[CCUIMainViewController pagingViewController](self, "pagingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willResignActive");

}

- (BOOL)includesModuleWithIdentifier:(id)a3
{
  return -[CCUIMainViewController _includesModuleWithIdentifier:consideringObscureness:](self, "_includesModuleWithIdentifier:consideringObscureness:", a3, 0);
}

- (BOOL)includesVisiblyUnobscuredModuleWithIdentifier:(id)a3
{
  return -[CCUIMainViewController _includesModuleWithIdentifier:consideringObscureness:](self, "_includesModuleWithIdentifier:consideringObscureness:", a3, 1);
}

- (BOOL)_includesModuleWithIdentifier:(id)a3 consideringObscureness:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGRect v20;
  CGRect v21;

  v4 = a4;
  v6 = a3;
  -[CCUIMainViewController pagingViewController](self, "pagingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moduleViewForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v8 != 0;
  if (v8 && v4)
  {
    if (objc_msgSend(v7, "expandedModuleCount") < 1
      || objc_msgSend(v7, "isModuleExpandedForIdentifier:", v6))
    {
      objc_msgSend(v8, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v8, "bounds");
        objc_msgSend(v8, "convertRect:toView:", v10);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        objc_msgSend(v10, "bounds");
        v21.origin.x = v12;
        v21.origin.y = v14;
        v21.size.width = v16;
        v21.size.height = v18;
        v9 = CGRectIntersectsRect(v20, v21) << 31 >> 31;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9 & 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  MTMaterialView *v3;
  MTMaterialView *backgroundView;
  MTMaterialView *v5;
  objc_class *v6;
  void *v7;
  MTMaterialView *v8;
  void *v9;
  MTMaterialView *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *containerView;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  CCUIPagingViewController *v20;
  CCUIPagingViewController *pagingViewController;
  CCUIPagingViewController *v22;
  void *v23;
  void *v24;
  UIPanGestureRecognizer *v25;
  UIPanGestureRecognizer *pagingViewScrollPanGesture;
  CCUIHeaderPocketView *v27;
  CCUIHeaderPocketView *v28;
  CCUIHeaderPocketView *headerPocketView;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  UIPanGestureRecognizer *v36;
  UIPanGestureRecognizer *headerPocketViewDismissalPanGesture;
  UITapGestureRecognizer *v38;
  UITapGestureRecognizer *headerPocketViewDismissalTapGesture;
  void *v40;
  CCUIFlickGestureRecognizer *v41;
  CCUIFlickGestureRecognizer *pagingViewDismissalFlickGesture;
  CCUIFlickGestureRecognizer *v43;
  CCUIFlickGestureRecognizer *v44;
  CCUIDismissalGestureRecognizer *v45;
  UIPanGestureRecognizer *pagingViewDismissalPanGesture;
  UITapGestureRecognizer *v47;
  UITapGestureRecognizer *pagingViewDismissalTapGesture;
  UILongPressGestureRecognizer *v49;
  UILongPressGestureRecognizer *editingLongPressGesture;
  void *v51;
  void *v52;
  uint64_t v53;
  id *p_headerPocketGradientMaskLayers;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  id *v60;
  id *v61;
  void *v62;
  CCUIControlDescriptorProvider *v63;
  CCUIControlIntentStore *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id location;
  objc_super v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)CCUIMainViewController;
  -[CCUIMainViewController viewDidLoad](&v74, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", objc_msgSend(MEMORY[0x1E0D14790], "_controlCenterBackgroundRecipe"));
  v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = self->_backgroundView;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView setGroupNameBase:](v5, "setGroupNameBase:", v7);

  -[MTMaterialView setZoomEnabled:](self->_backgroundView, "setZoomEnabled:", -[CCUIOverlayPresentationProvider isZoomEnabled](self->_presentationProvider, "isZoomEnabled"));
  -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:](self->_backgroundView, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", -[CCUIOverlayPresentationProvider backdropViewShouldUseAlphaTransformer](self->_presentationProvider, "backdropViewShouldUseAlphaTransformer"));
  -[MTMaterialView setIgnoresScreenClip:](self->_backgroundView, "setIgnoresScreenClip:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = self->_backgroundView;
    -[CCUIOverlayPresentationProvider customBackdropScaleAdjustment](self->_presentationProvider, "customBackdropScaleAdjustment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setBackdropScaleAdjustment:](v8, "setBackdropScaleAdjustment:", v9);

  }
  v10 = self->_backgroundView;
  -[CCUIMainViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[MTMaterialView setFrame:](v10, "setFrame:");

  -[CCUIMainViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_backgroundView);

  -[CCUIMainViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  containerView = self->_containerView;
  self->_containerView = v14;

  -[CCUIMainViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_containerView);

  -[CCUIMainViewController moduleInstanceManager](self, "moduleInstanceManager");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMainViewController moduleSettingsManager](self, "moduleSettingsManager");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_alloc_init(CCUIControlIntentStore);
  v17 = objc_alloc(MEMORY[0x1E0D101B0]);
  objc_msgSend(MEMORY[0x1E0D101C0], "visibleControls");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithOptions:", v18);

  v63 = -[CCUIControlDescriptorProvider initWithWidgetExtensionProvider:]([CCUIControlDescriptorProvider alloc], "initWithWidgetExtensionProvider:", v19);
  v20 = -[CCUIPagingViewController initWithModuleInstanceManager:moduleSettingsManager:controlIntentStore:controlDescriptorProvider:controlExtensionProvider:]([CCUIPagingViewController alloc], "initWithModuleInstanceManager:moduleSettingsManager:controlIntentStore:controlDescriptorProvider:controlExtensionProvider:", v66, v65, v64, v63, v19);
  pagingViewController = self->_pagingViewController;
  self->_pagingViewController = v20;

  -[CCUIPagingViewController setPagingDelegate:](self->_pagingViewController, "setPagingDelegate:", self);
  -[CCUIPagingViewController setContextDelegate:](self->_pagingViewController, "setContextDelegate:", self);
  v22 = self->_pagingViewController;
  -[CCUIMainViewController _safePagingViewContainerView](self, "_safePagingViewContainerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMainViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v22, v23);

  -[CCUIPagingViewController scrollView](self->_pagingViewController, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHostingDelegate:", self);
  objc_msgSend(v24, "panGestureRecognizer");
  v25 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  pagingViewScrollPanGesture = self->_pagingViewScrollPanGesture;
  self->_pagingViewScrollPanGesture = v25;

  objc_initWeak(&location, self);
  -[CCUIPagingViewController interactivePagingCoordinator](self->_pagingViewController, "interactivePagingCoordinator");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __37__CCUIMainViewController_viewDidLoad__block_invoke;
  v71[3] = &unk_1E8CFCC60;
  v60 = &v72;
  objc_copyWeak(&v72, &location);
  objc_msgSend(v62, "addPagingDidChangeHandler:", v71);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27 = [CCUIHeaderPocketView alloc];
    v28 = -[CCUIHeaderPocketView initWithFrame:moduleInstanceManager:](v27, "initWithFrame:moduleInstanceManager:", v66, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), &v72);
    headerPocketView = self->_headerPocketView;
    self->_headerPocketView = v28;

    -[CCUIHeaderPocketView setStatusBarDelegate:](self->_headerPocketView, "setStatusBarDelegate:", self);
    -[CCUIHeaderPocketView setActionsDelegate:](self->_headerPocketView, "setActionsDelegate:", self);
    -[CCUIMainViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", self->_headerPocketView);

    -[CCUIHeaderPocketView addSensorAttributionViewControllerAsChildOfViewController:](self->_headerPocketView, "addSensorAttributionViewControllerAsChildOfViewController:", self);
    -[CCUIHeaderPocketView setHeaderPocketViewDelegate:](self->_headerPocketView, "setHeaderPocketViewDelegate:", self);
  }
  -[CCUIMainViewController _safeStatusLabelViewContainerView](self, "_safeStatusLabelViewContainerView", v60);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMainViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_statusLabelViewController, v31);
  -[CCUIStatusLabelViewController view](self->_statusLabelViewController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setUserInteractionEnabled:", 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v31;
    -[CCUIStatusLabelViewController view](self->_statusLabelViewController, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setStatusLabelView:", v34);

  }
  -[CCUIMainViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_setIgnoreBackdropViewsWhenHiding:", 1);

  if (self->_headerPocketView)
  {
    if (-[CCUIOverlayPresentationProvider isPanDismissalAvailable](self->_presentationProvider, "isPanDismissalAvailable"))
    {
      v36 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handleDismissalPanGestureRecognizer_);
      headerPocketViewDismissalPanGesture = self->_headerPocketViewDismissalPanGesture;
      self->_headerPocketViewDismissalPanGesture = v36;

      -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_headerPocketViewDismissalPanGesture, "setMaximumNumberOfTouches:", 1);
      -[UIPanGestureRecognizer setDelegate:](self->_headerPocketViewDismissalPanGesture, "setDelegate:", self);
      -[CCUIHeaderPocketView addGestureRecognizer:](self->_headerPocketView, "addGestureRecognizer:", self->_headerPocketViewDismissalPanGesture);
    }
    v38 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDismissalTapGestureRecognizer_);
    headerPocketViewDismissalTapGesture = self->_headerPocketViewDismissalTapGesture;
    self->_headerPocketViewDismissalTapGesture = v38;

    -[UITapGestureRecognizer setDelegate:](self->_headerPocketViewDismissalTapGesture, "setDelegate:", self);
    -[CCUIHeaderPocketView addGestureRecognizer:](self->_headerPocketView, "addGestureRecognizer:", self->_headerPocketViewDismissalTapGesture);
    -[CCUIMainViewController _updateSensorActivityStatusForHeaderPocketView](self, "_updateSensorActivityStatusForHeaderPocketView");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIOverlayPresentationProvider flickGestureBehavior](self->_presentationProvider, "flickGestureBehavior");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = -[CCUIFlickGestureRecognizer initWithTarget:action:]([CCUIFlickGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleDismissalFlickGestureRecognizer_);
      pagingViewDismissalFlickGesture = self->_pagingViewDismissalFlickGesture;
      self->_pagingViewDismissalFlickGesture = v41;

      -[CCUIFlickGestureRecognizer setDelegate:](self->_pagingViewDismissalFlickGesture, "setDelegate:", self);
      v43 = self->_pagingViewDismissalFlickGesture;
      objc_msgSend(v40, "dismissalFlickMaximumTime");
      -[CCUIFlickGestureRecognizer setMaximumFlickTime:](v43, "setMaximumFlickTime:");
      v44 = self->_pagingViewDismissalFlickGesture;
      objc_msgSend(v40, "dismissalFlickMinimumVelocity");
      -[CCUIFlickGestureRecognizer setMinimumFlickVelocity:](v44, "setMinimumFlickVelocity:");
      -[CCUIFlickGestureRecognizer setAllowedFlickDirections:](self->_pagingViewDismissalFlickGesture, "setAllowedFlickDirections:", objc_msgSend(v40, "dismissalFlickAllowedDirections"));
      objc_msgSend(v24, "addGestureRecognizer:", self->_pagingViewDismissalFlickGesture);
    }
  }
  else
  {
    v40 = 0;
  }
  if (-[CCUIOverlayPresentationProvider isPanDismissalAvailable](self->_presentationProvider, "isPanDismissalAvailable"))
  {
    v45 = -[CCUIDismissalGestureRecognizer initWithTarget:action:]([CCUIDismissalGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleDismissalPanGestureRecognizer_);
    pagingViewDismissalPanGesture = self->_pagingViewDismissalPanGesture;
    self->_pagingViewDismissalPanGesture = &v45->super;

    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_pagingViewDismissalPanGesture, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setDelegate:](self->_pagingViewDismissalPanGesture, "setDelegate:", self);
    objc_msgSend(v24, "addGestureRecognizer:", self->_pagingViewDismissalPanGesture);
  }
  v47 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDismissalTapGestureRecognizer_);
  pagingViewDismissalTapGesture = self->_pagingViewDismissalTapGesture;
  self->_pagingViewDismissalTapGesture = v47;

  -[UITapGestureRecognizer setDelegate:](self->_pagingViewDismissalTapGesture, "setDelegate:", self);
  objc_msgSend(v24, "addGestureRecognizer:", self->_pagingViewDismissalTapGesture);
  v49 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleEditingLongPressGestureRecognizer_);
  editingLongPressGesture = self->_editingLongPressGesture;
  self->_editingLongPressGesture = v49;

  -[UILongPressGestureRecognizer setDelegate:](self->_editingLongPressGesture, "setDelegate:", self);
  -[CCUIPagingViewController setLongPressToEditGestureRecognizer:](self->_pagingViewController, "setLongPressToEditGestureRecognizer:", self->_editingLongPressGesture);
  -[CCUIMainViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addGestureRecognizer:", self->_editingLongPressGesture);

  if (self->_headerPocketView)
  {
    -[CCUIMainViewController pagingView](self, "pagingView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA9E00], "configureGradientMaskForFeatherBlurRecipe:onContentView:", 7, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    p_headerPocketGradientMaskLayers = (id *)&self->_headerPocketGradientMaskLayers;
    v55 = *p_headerPocketGradientMaskLayers;
    *p_headerPocketGradientMaskLayers = (id)v53;

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v56 = *p_headerPocketGradientMaskLayers;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    if (v57)
    {
      v58 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v68 != v58)
            objc_enumerationMutation(v56);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "setHidden:", 1);
        }
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      }
      while (v57);
    }

  }
  objc_destroyWeak(v61);

  objc_destroyWeak(&location);
}

void __37__CCUIMainViewController_viewDidLoad__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  double v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "overlayHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 1.0;
  if (a2)
    v5 = 0.0;
  objc_msgSend(v3, "setAdditionalContentAlphaMultiplier:", v5);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIMainViewController;
  -[CCUIMainViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CCUIOverlayPresentationProvider layoutViews](self->_presentationProvider, "layoutViews");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIMainViewController;
  -[CCUIMainViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CCUIMainViewController _updateSensorActivityStatusForHeaderPocketView](self, "_updateSensorActivityStatusForHeaderPocketView");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CCUIMainViewController;
  v7 = a4;
  -[CCUIMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8CFCC88;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E8CFC3D0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2031617, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  if (-[CCUIMainViewController isHostedInTestApp](self, "isHostedInTestApp"))
    return 4;
  else
    return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (unint64_t)__supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isEditing
{
  void *v2;
  char v3;

  -[CCUIMainViewController pagingViewController](self, "pagingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CCUIMainViewController pagingViewController](self, "pagingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", v3);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  CCUIFlickGestureRecognizer *v4;
  CCUIFlickGestureRecognizer *v5;
  BOOL v6;
  BOOL v7;

  v4 = (CCUIFlickGestureRecognizer *)a3;
  v5 = v4;
  if (self->_pagingViewDismissalFlickGesture == v4)
  {
    v7 = -[CCUIMainViewController _dismissalFlickGestureRecognizerShouldBegin:](self, "_dismissalFlickGestureRecognizerShouldBegin:", v4);
    goto LABEL_12;
  }
  if ((CCUIFlickGestureRecognizer *)self->_headerPocketViewDismissalTapGesture == v4
    || (CCUIFlickGestureRecognizer *)self->_pagingViewDismissalTapGesture == v4)
  {
    v7 = -[CCUIMainViewController _dismissalTapGestureRecognizerShouldBegin:](self, "_dismissalTapGestureRecognizerShouldBegin:", v4);
LABEL_12:
    v6 = v7;
    goto LABEL_13;
  }
  if ((CCUIFlickGestureRecognizer *)self->_headerPocketViewDismissalPanGesture == v4
    || (CCUIFlickGestureRecognizer *)self->_pagingViewDismissalPanGesture == v4)
  {
    v7 = -[CCUIMainViewController _dismissalPanGestureRecognizerShouldBegin:](self, "_dismissalPanGestureRecognizerShouldBegin:", v4);
    goto LABEL_12;
  }
  if ((CCUIFlickGestureRecognizer *)self->_editingLongPressGesture == v4)
  {
    v7 = -[CCUIMainViewController _editingLongPressGestureRecognizerShouldBegin:](self, "_editingLongPressGestureRecognizerShouldBegin:", v4);
    goto LABEL_12;
  }
  v6 = 1;
LABEL_13:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return self->_pagingViewDismissalFlickGesture == a3
      && -[CCUIMainViewController _dismissalFlickGestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:](self, "_dismissalFlickGestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_headerPocketViewDismissalPanGesture == v6)
  {
    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIHeaderPocketView statusBar](self->_headerPocketView, "statusBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isDescendantOfView:", v11))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }
  if ((UIPanGestureRecognizer *)self->_pagingViewDismissalTapGesture == v6
    && (-[CCUIMainViewController pagingViewController](self, "pagingViewController"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEditing"),
        v12,
        !v13))
  {
    isKindOfClass = 1;
  }
  else if ((UIPanGestureRecognizer *)self->_editingLongPressGesture == v6)
  {
    objc_msgSend(v8, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_pagingViewDismissalFlickGesture != a3
      || -[CCUIMainViewController _dismissalFlickGestureRecognizer:shouldReceiveTouch:](self, "_dismissalFlickGestureRecognizer:shouldReceiveTouch:");
}

- (BOOL)scrollView:(id)a3 gestureRecognizerShouldBegin:(id)a4
{
  return self->_pagingViewScrollPanGesture != a4
      || -[CCUIMainViewController _scrollPanGestureRecognizerShouldBegin:](self, "_scrollPanGestureRecognizerShouldBegin:", a4);
}

- (void)scrollViewDidScroll:(id)a3
{
  unint64_t v4;

  v4 = -[CCUIMainViewController presentationState](self, "presentationState", a3);
  if (-[CCUIMainViewController transitionState](self, "transitionState") != 1 && v4 - 1 <= 1)
    -[CCUIMainViewController _replaceBackgroundViewContentsWithSnapshotIfNecessary:](self, "_replaceBackgroundViewContentsWithSnapshotIfNecessary:", 1);
  -[CCUIMainViewController _updateHotPocketAnimated:](self, "_updateHotPocketAnimated:", 0);
}

- (void)pagingViewController:(id)a3 didAdd:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  if (self->_active)
  {
    v5 = objc_opt_class();
    v6 = v9;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    objc_msgSend(v8, "willBecomeActive");
  }
  -[CCUIMainViewController _setupPanGestureFailureRequirements](self, "_setupPanGestureFailureRequirements");

}

- (void)pagingViewController:(id)a3 willRemove:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  if (self->_active)
  {
    v10 = v5;
    v6 = objc_opt_class();
    v7 = v10;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    objc_msgSend(v9, "willResignActive");
    v5 = v10;
  }

}

- (void)pagingViewController:(id)a3 willExpand:(id)a4
{
  id v5;

  -[CCUIMainViewController delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "willOpenExpandedModuleForControlCenterViewController:", self);
  -[CCUIMainViewController _willPresentViewControllerContainedInPages](self, "_willPresentViewControllerContainedInPages");
  self->_showingRootView = 0;

}

- (void)pagingViewController:(id)a3 didClose:(id)a4
{
  id v5;

  -[CCUIMainViewController delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didCloseExpandedModuleForControlCenterViewController:", self);
  self->_showingRootView = 1;
  -[CCUIMainViewController _updateAskToAirDropModuleVisibility](self, "_updateAskToAirDropModuleVisibility");

}

- (void)_willPresentViewControllerContainedInPages
{
  -[CCUIMainViewController presentAnimated:withCompletionHandler:](self, "presentAnimated:withCompletionHandler:", 1, 0);
  -[CCUIHeaderPocketView setAlpha:](self->_headerPocketView, "setAlpha:", 0.0);
}

- (void)_willDismissViewControllerContainedInPages
{
  -[CCUIHeaderPocketView setAlpha:](self->_headerPocketView, "setAlpha:", 1.0);
}

- (void)pagingViewController:(id)a3 editingDidChange:(BOOL)a4
{
  char v5;
  CCUIOverlayPresentationProvider *presentationProvider;
  id v7;

  v5 = objc_opt_respondsToSelector();
  presentationProvider = self->_presentationProvider;
  if ((v5 & 1) != 0)
  {
    -[CCUIOverlayPresentationProvider transitionBetweenEditing](presentationProvider, "transitionBetweenEditing");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CCUIAnimationRunner runAnimationBatch:withCompletionBlock:](self->_editingAnimationRunner, "runAnimationBatch:withCompletionBlock:", v7, 0);

  }
  else
  {
    -[CCUIOverlayPresentationProvider layoutViews](presentationProvider, "layoutViews");
  }
}

- (id)reasonToDisallowEditing:(id)a3
{
  void *v3;
  void *v4;

  -[CCUIMainViewController systemAgent](self, "systemAgent", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reasonToDisallowEditing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)pagingViewController:(id)a3 editingAccessoryViewIntrinsicSizeDidChange:(id)a4
{
  -[CCUIOverlayPresentationProvider layoutViews](self->_presentationProvider, "layoutViews", a3, a4);
}

- (BOOL)isSystemRestoringForPagingViewController:(id)a3
{
  void *v3;
  char v4;

  -[CCUIMainViewController systemAgent](self, "systemAgent", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRestoring");

  return v4;
}

- (BOOL)pagingViewController:(id)a3 shouldPauseCheckingInvalidControlsForApplicationIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  char v7;
  void *v8;

  v5 = a4;
  -[CCUIMainViewController systemAgent](self, "systemAgent");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v6, "hasApplicationPlaceholderForDisplayID:", v5);

  -[CCUIMainViewController systemAgent](self, "systemAgent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "hasApplicationForDisplayID:", v5);

  return v7 | v6;
}

- (void)statusLabelViewControllerWillBeginStatusUpdates:(id)a3
{
  -[CCUIHeaderPocketView setContentAlphaMultiplier:](self->_headerPocketView, "setContentAlphaMultiplier:", a3, 0.0);
}

- (void)statusLabelViewControllerDidFinishStatusUpdates:(id)a3
{
  -[CCUIHeaderPocketView setContentAlphaMultiplier:](self->_headerPocketView, "setContentAlphaMultiplier:", a3, 1.0);
}

- (void)handleIconElementRequestWithOperationService:(id)a3 iconElementRequest:(id)a4 completionHandler:(id)a5
{
  -[CCUIPagingViewController handleIconElementRequest:completionHandler:](self->_pagingViewController, "handleIconElementRequest:completionHandler:", a4, a5);
}

- (void)handleControlCenterOperationTypeWithOperationService:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11[2];
  id location;

  v7 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__CCUIMainViewController_handleControlCenterOperationTypeWithOperationService_operationType_completionHandler___block_invoke;
  block[3] = &unk_1E8CFCCD0;
  v11[1] = (id)a4;
  objc_copyWeak(v11, &location);
  block[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

uint64_t __111__CCUIMainViewController_handleControlCenterOperationTypeWithOperationService_operationType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "presentAnimated:withCompletionHandler:", 1, 0);

    v2 = *(_QWORD *)(a1 + 56);
  }
  switch(v2)
  {
    case 4:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "dismissSensorAttributionExpandedView:completion:", 1, &__block_literal_global_6);
      break;
    case 3:
      v5 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v5, "presentAnimated:withCompletionHandler:", 1, 0);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutIfNeeded");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "presentSensorAttributionExpandedView:", 1);
      break;
    case 2:
      v4 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v4, "dismissAnimated:withCompletionHandler:", 1, 0);

      break;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)requestIconElementStateWithOperationService:(id)a3 iconElementRequest:(id)a4 completionHandler:(id)a5
{
  -[CCUIPagingViewController requestIconElementStateForRequest:completionHandler:](self->_pagingViewController, "requestIconElementStateForRequest:completionHandler:", a4, a5);
}

- (void)moduleInstancesChangedForModuleInstanceManager:(id)a3
{
  id v3;

  -[CCUIMainViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (MTMaterialView)overlayBackgroundView
{
  return self->_backgroundView;
}

- (UIView)overlayContainerView
{
  return self->_containerView;
}

- (CCUIHeaderPocketView)overlayHeaderView
{
  return self->_headerPocketView;
}

- (NSArray)overlayHeaderLayers
{
  return self->_headerPocketGradientMaskLayers;
}

- (UIStatusBar)overlayLeadingStatusBar
{
  return self->_compactLeadingStatusBar;
}

- (UIView)overlayPageControl
{
  return -[CCUIPagingViewController pageControl](self->_pagingViewController, "pageControl");
}

- (UIView)editingAccessoryView
{
  return -[CCUIPagingViewController editingAccessoryView](self->_pagingViewController, "editingAccessoryView");
}

- (void)setOverlayStatusBarHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  id v7;

  v3 = a3;
  -[CCUIMainViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlCenterViewController:wantsHostStatusBarHidden:", self, !v3);

  if (v3)
    v6 = 0.0;
  else
    v6 = 1.0;
  -[UIStatusBar setAlpha:](self->_compactLeadingStatusBar, "setAlpha:", v6);
  -[CCUIHeaderPocketView statusBar](self->_headerPocketView, "statusBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

- (void)setOverlayPageContentAlpha:(double)a3
{
  id v4;

  -[CCUIPagingViewController interactivePagingCoordinator](self->_pagingViewController, "interactivePagingCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPageContentAlpha:", a3);

}

- (void)setOverlayPageContentScale:(double)a3
{
  id v4;

  -[CCUIPagingViewController interactivePagingCoordinator](self->_pagingViewController, "interactivePagingCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPageContentScale:", a3);

}

- (void)setOverlayPageContentTranslation:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[CCUIPagingViewController interactivePagingCoordinator](self->_pagingViewController, "interactivePagingCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPageContentTranslation:", x, y);

}

- (void)enumerateOverlayModuleViewsWithBlock:(id)a3
{
  id v5;
  CCUIPagingViewController *pagingViewController;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  pagingViewController = self->_pagingViewController;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CCUIMainViewController_enumerateOverlayModuleViewsWithBlock___block_invoke;
  v8[3] = &unk_1E8CFCCF8;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v7 = v5;
  -[CCUIPagingViewController enumerateDisplayedModuleViewsWithBlock:](pagingViewController, "enumerateDisplayedModuleViewsWithBlock:", v8);

}

void __63__CCUIMainViewController_enumerateOverlayModuleViewsWithBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, id, _QWORD *, uint64_t);
  void *v13;
  void *v14;
  _QWORD v15[4];

  v9 = a2;
  if (SBIconCoordinateIsNotFound())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("CCUIMainViewController.m"), 1239, CFSTR("Module view coordinate must be valid"));

  }
  if (SBHIconGridSizeIsEmpty())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("CCUIMainViewController.m"), 1240, CFSTR("Module view grid size must not be empty"));

  }
  v11 = a1[5];
  v12 = *(void (**)(uint64_t, id, _QWORD *, uint64_t))(v11 + 16);
  v15[0] = a3 - 1;
  v15[1] = a4 - 1;
  v15[2] = (unsigned __int16)a5;
  v15[3] = HIWORD(a5);
  v12(v11, v9, v15, v10);

}

- (CGRect)overlayBackgroundFrame
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
  CGRect result;

  -[CCUIMainViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)overlayContainerFrame
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
  CGRect result;

  -[CCUIMainViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)overlayPageCount
{
  return -[CCUIPagingViewController pageCount](self->_pagingViewController, "pageCount");
}

- (CGSize)overlayContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CCUIPagingViewController contentLayoutSize](self->_pagingViewController, "contentLayoutSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)overlayAdditionalEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (-[CCUIMainViewController isReachabilityActive](self, "isReachabilityActive"))
  {
    -[CCUIMainViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reachabilityOffsetForControlCenterViewController:", self);
    v4 = v4 + v8;

  }
  v9 = v4;
  v10 = v3;
  v11 = v5;
  v12 = v6;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (CCUIStatusBarStyleSnapshot)overlayStatusBarStyle
{
  return self->_hostStatusBarStyleSnapshot;
}

- (double)overlayReachabilityHeight
{
  void *v3;
  double v4;
  double v5;

  if (!-[CCUIMainViewController isReachabilityActive](self, "isReachabilityActive"))
    return 0.0;
  -[CCUIMainViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reachabilityOffsetForControlCenterViewController:", self);
  v5 = v4;

  return v5;
}

- (UIEdgeInsets)overlayContentLayoutInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[CCUIPagingViewController additionalContentInsets](self->_pagingViewController, "additionalContentInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setOverlayContentLayoutInset:(UIEdgeInsets)a3
{
  -[CCUIPagingViewController setAdditionalContentInsets:](self->_pagingViewController, "setAdditionalContentInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setOverlayContentLayoutOffset:(CGPoint)a3
{
  -[CCUIPagingViewController setAdditionalContentOffset:](self->_pagingViewController, "setAdditionalContentOffset:", a3.x, a3.y);
}

- (id)compactTrailingStyleRequestForStatusBar:(id)a3
{
  void *v4;
  uint64_t v5;

  -[CCUIStatusBarStyleSnapshot trailingStyleRequest](self->_hostStatusBarStyleSnapshot, "trailingStyleRequest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CCUIStatusBarStyleSnapshot isHidden](self->_hostStatusBarStyleSnapshot, "isHidden"))
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CE0]), "initWithStyle:legacy:legibilityStyle:foregroundColor:", 1, 0, _UILegibilityStyleFromStatusBarStyle(), 0);

    v4 = (void *)v5;
  }
  return v4;
}

- (CGRect)compactAvoidanceFrameForStatusBar:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CCUIStatusBarStyleSnapshot avoidanceFrame](self->_hostStatusBarStyleSnapshot, "avoidanceFrame", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)contentModuleContext:(id)a3 enqueueStatusUpdate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (self->_active)
  {
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "expandedModuleCount");

    if (!v8)
    {
      -[CCUIMainViewController statusLabelViewController](self, "statusLabelViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "moduleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enqueueStatusUpdate:forIdentifier:", v6, v10);

    }
  }

}

- (void)requestExpandModuleForContentModuleContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (self->_active)
  {
    v10 = v4;
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "expandedModuleCount");

    v4 = v10;
    if (!v6)
    {
      -[CCUIMainViewController pagingViewController](self, "pagingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "moduleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "expandModuleWithIdentifier:uniqueIdentifier:", v8, v9);

      v4 = v10;
    }
  }

}

- (void)dismissExpandedViewForContentModuleContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  if (self->_active)
  {
    v8 = v4;
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "moduleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isModuleExpandedForIdentifier:", v6);

    v4 = v8;
    if (v7)
    {
      -[CCUIMainViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", 1, 0);
      v4 = v8;
    }
  }

}

- (void)dismissControlCenterForContentModuleContext:(id)a3
{
  if (-[CCUIMainViewController isActive](self, "isActive", a3))
    -[CCUIMainViewController dismissAnimated:withCompletionHandler:](self, "dismissAnimated:withCompletionHandler:", 1, 0);
}

- (id)contentModuleContext:(id)a3 requestsSensorActivityDataForActiveSensorType:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[7];
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  if (a4 > 1)
  {
    -[CCUISensorActivityDataProvider activeSensorActivityData](self->_sensorActivityDataProvider, "activeSensorActivityData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __93__CCUIMainViewController_contentModuleContext_requestsSensorActivityDataForActiveSensorType___block_invoke;
    v17[3] = &unk_1E8CFCD20;
    v17[4] = self;
    v17[5] = &v21;
    v17[6] = a4;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

  }
  else
  {
    v20 = 0;
    v18 = 0;
    v19 = 0;
    -[CCUIMainViewController _getCameraSensorActivityData:micSensorActivityData:isInactiveMicModeSelection:](self, "_getCameraSensorActivityData:micSensorActivityData:isInactiveMicModeSelection:", &v19, &v18, &v20);
    v7 = v19;
    v8 = v18;
    v9 = v8;
    v10 = v7;
    if (!a4 || (v10 = v8, !v20))
    {
      v11 = v22;
      v12 = v10;
      v13 = (void *)v11[5];
      v11[5] = (uint64_t)v12;

    }
  }
  v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __93__CCUIMainViewController_contentModuleContext_requestsSensorActivityDataForActiveSensorType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "usedRecently") & 1) == 0
    && objc_msgSend(v8, "sensorType") == *(_QWORD *)(a1 + 48)
    && objc_msgSend(*(id *)(a1 + 32), "_isRelevantSensorActivityData:", v8))
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

- (id)contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v7;
  char v8;

  v8 = 0;
  v7 = 0;
  -[CCUIMainViewController _getCameraSensorActivityData:micSensorActivityData:isInactiveMicModeSelection:](self, "_getCameraSensorActivityData:micSensorActivityData:isInactiveMicModeSelection:", 0, &v7, &v8);
  v3 = v7;
  v4 = v3;
  if (v8)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isDevicePasscodeLockedForContentModuleContext:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;

  -[CCUIMainViewController systemAgent](self, "systemAgent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  -[CCUIMainViewController systemAgent](self, "systemAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
    v8 = objc_msgSend(v6, "isPasscodeLocked");
  else
    v8 = objc_msgSend(v6, "isUILocked");
  v9 = v8;

  return v9;
}

- (void)_getCameraSensorActivityData:(id *)a3 micSensorActivityData:(id *)a4 isInactiveMicModeSelection:(BOOL *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  -[CCUISensorActivityDataProvider activeSensorActivityData](self->_sensorActivityDataProvider, "activeSensorActivityData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_filter:", &__block_literal_global_112);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_2;
  v28[3] = &unk_1E8CFCD88;
  v28[4] = self;
  v28[5] = &v29;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v28);
  v12 = (void *)v30[5];
  if (v12)
  {
    objc_msgSend(v12, "attributionGroup");
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    v27 = 0;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_3;
    v19[3] = &unk_1E8CFCD88;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    v21 = &v22;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
    v14 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    v15 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_4;
  v18[3] = &unk_1E8CFCD88;
  v18[4] = self;
  v18[5] = &v22;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);
  v16 = (void *)v23[5];
  if (v16)
  {
    v14 = v16;
    v15 = 0;
  }
  else if (CCUIFeatureEnabled())
  {
    -[CCUISensorActivityDataProvider inactiveSensorActivityDataEligibleForMicModeSelection](self->_sensorActivityDataProvider, "inactiveSensorActivityDataEligibleForMicModeSelection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v17, "copy");

    v15 = v14 != 0;
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  _Block_object_dispose(&v22, 8);

  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)v30[5]);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease(v14);
  if (a5)
    *a5 = v15;

  _Block_object_dispose(&v29, 8);
}

uint64_t __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "usedRecently") ^ 1;
}

void __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!objc_msgSend(v8, "sensorType")
    && objc_msgSend(*(id *)(a1 + 32), "_isRelevantSensorActivityData:", v8))
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

void __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "sensorType") == 1)
  {
    objc_msgSend(v10, "attributionGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v6)
    {
      v7 = objc_msgSend(v10, "copy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      *a3 = 1;
    }
  }

}

void __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "sensorType") == 1
    && objc_msgSend(*(id *)(a1 + 32), "_isRelevantSensorActivityData:", v8))
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

- (BOOL)_isRelevantSensorActivityData:(id)a3
{
  id v3;
  void *v4;
  char ShouldBeShownForBundleID;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "sensorType") > 1)
  {
    ShouldBeShownForBundleID = 1;
  }
  else
  {
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      ShouldBeShownForBundleID = AVControlCenterModulesShouldBeShownForBundleID();
    else
      ShouldBeShownForBundleID = 0;

  }
  return ShouldBeShownForBundleID;
}

- (id)existingControlKindFromWidgetExtension:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CCUIPagingViewController iconModel](self->_pagingViewController, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconsOfClass:", objc_opt_class());
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v7 = *(_QWORD *)v28;
    v20 = *(_QWORD *)v28;
    v21 = v5;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "iconDataSourcesOfClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v15, "extensionBundleIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v4);

              if ((v17 & 1) != 0)
              {
                objc_msgSend(v15, "kind");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                v5 = v21;
                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v12)
              continue;
            break;
          }
        }

        v7 = v20;
      }
      v18 = 0;
      v5 = v21;
      v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)addIfNecessaryAndScrollToControlMatching:(id)a3 animated:(BOOL)a4
{
  -[CCUIPagingViewController addIfNecessaryAndScrollToControlMatchingDescriptor:animated:](self->_pagingViewController, "addIfNecessaryAndScrollToControlMatchingDescriptor:animated:", a3, a4);
}

- (void)beginPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5 touches:(id)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  NSArray *v13;
  NSArray *presentationTouchIdentifiers;
  id v15;
  id v16;

  y = a5.y;
  x = a5.x;
  v8 = a4.y;
  v9 = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v16 = a6;
  if (-[CCUIMainViewController presentationState](self, "presentationState") != 1
    && -[CCUIMainViewController presentationState](self, "presentationState") != 2)
  {
    -[CCUIMainViewController _setPresentationPanGestureActive:](self, "_setPresentationPanGestureActive:", 1);
    objc_msgSend(v16, "bs_compactMap:", &__block_literal_global_116);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    presentationTouchIdentifiers = self->_presentationTouchIdentifiers;
    self->_presentationTouchIdentifiers = v13;

    v15 = -[CCUIMainViewController _beginPresentationAnimated:interactive:](self, "_beginPresentationAnimated:interactive:", 1, 1);
    -[CCUIMainViewController _updateSensorActivityStatusForHeaderPocketView](self, "_updateSensorActivityStatusForHeaderPocketView");
    -[CCUIMainViewController updatePresentationWithLocation:translation:velocity:](self, "updatePresentationWithLocation:translation:velocity:", v11, v10, v9, v8, x, y);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  }

}

uint64_t __85__CCUIMainViewController_beginPresentationWithLocation_translation_velocity_touches___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a2, "_touchIdentifier"));
}

- (void)updatePresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  if (-[CCUIMainViewController presentationState](self, "presentationState", a3.x, a3.y, a4.x, a4.y, a5.x, a5.y) == 1
    && -[CCUIMainViewController transitionState](self, "transitionState") == 1)
  {
    -[CCUIMainViewController _updatePresentationForTransitionType:translation:interactive:](self, "_updatePresentationForTransitionType:translation:interactive:", 1, 1, x, y);
    -[CCUIMainViewController _evaluatePresentationContinuationIntoPagingWithLocation:](self, "_evaluatePresentationContinuationIntoPagingWithLocation:", v8, v7);
  }
}

- (void)endPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  uint64_t v10;
  BOOL v11;
  id v12;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  -[CCUIMainViewController _setPresentationPanGestureActive:](self, "_setPresentationPanGestureActive:", 0, a3.x, a3.y);
  if (-[CCUIMainViewController presentationState](self, "presentationState") == 1
    && -[CCUIMainViewController transitionState](self, "transitionState") == 1)
  {
    -[CCUIOverlayPresentationProvider transitionStateForType:interactive:translation:](self->_presentationProvider, "transitionStateForType:interactive:translation:", 1, 1, v8, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = -[CCUIOverlayPresentationProvider finalTransitionTypeForState:gestureTranslation:gestureVelocity:](self->_presentationProvider, "finalTransitionTypeForState:gestureTranslation:gestureVelocity:", v8, v7, x, y);
    if (v10)
      v11 = v10 == 2;
    else
      v11 = 1;
    if (v11)
    {
      -[CCUIMainViewController dismissAnimated:withCompletionHandler:](self, "dismissAnimated:withCompletionHandler:", 1, 0);
    }
    else if (v10 == 1)
    {
      -[CCUIMainViewController presentAnimated:withCompletionHandler:](self, "presentAnimated:withCompletionHandler:", 1, 0);
    }

  }
}

- (void)cancelPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  -[CCUIMainViewController _setPresentationPanGestureActive:](self, "_setPresentationPanGestureActive:", 0, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y);
  if (-[CCUIMainViewController presentationState](self, "presentationState") == 1)
    -[CCUIMainViewController dismissAnimated:withCompletionHandler:](self, "dismissAnimated:withCompletionHandler:", 1, 0);
}

- (BOOL)_interpretsGestureLocationAsContent:(id)a3
{
  id v4;
  void *v5;
  CCUIPagingViewController *pagingViewController;
  BOOL v7;
  CCUIHeaderPocketView *headerPocketView;
  void *v9;

  v4 = a3;
  -[CCUIMainViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pagingViewController = self->_pagingViewController;
  objc_msgSend(v4, "locationInView:", v5);
  if (-[CCUIPagingViewController interpretsLocationAsContent:in:](pagingViewController, "interpretsLocationAsContent:in:", v5))
  {
    v7 = 1;
  }
  else
  {
    headerPocketView = self->_headerPocketView;
    objc_msgSend(v4, "locationInView:", headerPocketView);
    -[CCUIHeaderPocketView hitTest:withEvent:](headerPocketView, "hitTest:withEvent:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CCUIHeaderPocketView hitTestedViewWantsToBlockGestures:](self->_headerPocketView, "hitTestedViewWantsToBlockGestures:", v9);

  }
  return v7;
}

- (BOOL)_dismissalTapGestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[CCUIMainViewController presentationState](self, "presentationState") == 3
    || !-[CCUIMainViewController presentationState](self, "presentationState"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[CCUIMainViewController _interpretsGestureLocationAsContent:](self, "_interpretsGestureLocationAsContent:", v4);
  }

  return v5;
}

- (void)_handleDismissalTapGestureRecognizer:(id)a3
{
  void *v4;
  int v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEditing");

    if (v5)
    {
      -[CCUIMainViewController pagingViewController](self, "pagingViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEditing:", 0);

    }
    else
    {
      -[CCUIMainViewController dismissAnimated:withCompletionHandler:](self, "dismissAnimated:withCompletionHandler:", 1, 0);
    }
  }
}

- (BOOL)_dismissalFlickGestureRecognizerShouldBegin:(id)a3
{
  id v4;
  double v5;
  _BOOL4 v6;

  v4 = a3;
  if (-[CCUIMainViewController _scrollViewIsScrollable](self, "_scrollViewIsScrollable"))
  {
    objc_msgSend(v4, "minimumFlickVelocity");
    v6 = !-[CCUIMainViewController _scrollPanGestureRecognizerCanBeginForGestureVelocity:](self, "_scrollPanGestureRecognizerCanBeginForGestureVelocity:", 0.0, v5);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)_dismissalFlickGestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return -[NSHashTable containsObject:](self->_blockingGestureRecognizers, "containsObject:", a4);
}

- (BOOL)_dismissalFlickGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[CCUIMainViewController _scrollViewCanAcceptDownwardsPan](self, "_scrollViewCanAcceptDownwardsPan"))
  {
    v6 = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "gestureRecognizers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          if (-[NSHashTable containsObject:](self->_blockingGestureRecognizers, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)))
          {
            v6 = 1;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_13:

  }
  return v6;
}

- (void)_handleDismissalFlickGestureRecognizer:(id)a3
{
  void *v4;
  int v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEditing");

    if (v5)
    {
      -[CCUIMainViewController pagingViewController](self, "pagingViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEditing:", 0);

    }
    else
    {
      -[CCUIMainViewController dismissAnimated:withCompletionHandler:](self, "dismissAnimated:withCompletionHandler:", 1, 0);
    }
  }
}

- (void)_cancelDismissalPanGestures
{
  -[UIPanGestureRecognizer setEnabled:](self->_pagingViewDismissalPanGesture, "setEnabled:", 0);
  -[UIPanGestureRecognizer setEnabled:](self->_pagingViewDismissalPanGesture, "setEnabled:", 1);
  -[UIPanGestureRecognizer setEnabled:](self->_headerPocketViewDismissalPanGesture, "setEnabled:", 0);
  -[UIPanGestureRecognizer setEnabled:](self->_headerPocketViewDismissalPanGesture, "setEnabled:", 1);
}

- (BOOL)_dismissalPanGestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  unint64_t v5;
  char v6;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = -[CCUIMainViewController presentationState](self, "presentationState");
  v6 = 0;
  if (v5 && v5 != 3)
  {
    if (self->_presentationPanGestureActive)
    {
LABEL_4:
      v6 = 0;
      goto LABEL_5;
    }
    if (self->_pagingViewDismissalPanGesture == v4)
    {
      if (-[CCUIMainViewController _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:", self->_headerPocketViewDismissalPanGesture)|| -[CCUIMainViewController isEditing](self, "isEditing"))
      {
        goto LABEL_4;
      }
      -[CCUIMainViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanGestureRecognizer velocityInView:](v4, "velocityInView:", v8);
      v10 = v9;
      v12 = v11;

      v13 = -[CCUIMainViewController _scrollPanGestureRecognizerCanBeginForGestureVelocity:](self, "_scrollPanGestureRecognizerCanBeginForGestureVelocity:", v10, v12);
    }
    else
    {
      if (self->_headerPocketViewDismissalPanGesture != v4)
      {
        v6 = 1;
        goto LABEL_5;
      }
      if (-[CCUIMainViewController _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:"))
        goto LABEL_4;
      v13 = -[CCUIMainViewController isSensorAttributionViewControllerExpanded](self, "isSensorAttributionViewControllerExpanded");
    }
    v6 = !v13;
  }
LABEL_5:

  return v6;
}

- (void)_handleDismissalPanGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[CCUIMainViewController _dismissalPanGestureRecognizerBegan:](self, "_dismissalPanGestureRecognizerBegan:", v4);
      break;
    case 2:
      -[CCUIMainViewController _dismissalPanGestureRecognizerChanged:](self, "_dismissalPanGestureRecognizerChanged:", v4);
      break;
    case 3:
      -[CCUIMainViewController _dismissalPanGestureRecognizerEnded:](self, "_dismissalPanGestureRecognizerEnded:", v4);
      break;
    case 4:
      -[CCUIMainViewController _dismissalPanGestureRecognizerCancelled:](self, "_dismissalPanGestureRecognizerCancelled:", v4);
      break;
    case 5:
      -[CCUIMainViewController _dismissalPanGestureRecognizerFailed:](self, "_dismissalPanGestureRecognizerFailed:", v4);
      break;
    default:
      break;
  }

}

- (void)_dismissalPanGestureRecognizerBegan:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[CCUIMainViewController _beginDismissalAnimated:interactive:](self, "_beginDismissalAnimated:interactive:", 1, 1);
  -[CCUIMainViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslation:inView:", v5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  -[CCUIMainViewController _dismissalPanGestureRecognizerChanged:](self, "_dismissalPanGestureRecognizerChanged:", v6);
}

- (void)_dismissalPanGestureRecognizerChanged:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[CCUIMainViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CCUIMainViewController _updatePresentationForTransitionType:translation:interactive:](self, "_updatePresentationForTransitionType:translation:interactive:", 2, 1, v7, v9);
}

- (void)_dismissalPanGestureRecognizerEnded:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  id v16;

  v4 = a3;
  -[CCUIMainViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CCUIMainViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v10);
  v12 = v11;
  v14 = v13;

  -[CCUIOverlayPresentationProvider transitionStateForType:interactive:translation:](self->_presentationProvider, "transitionStateForType:interactive:translation:", 2, 1, v7, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = -[CCUIOverlayPresentationProvider finalTransitionTypeForState:gestureTranslation:gestureVelocity:](self->_presentationProvider, "finalTransitionTypeForState:gestureTranslation:gestureVelocity:", v7, v9, v12, v14);
  if (v15 >= 2)
  {
    if (v15 == 2)
      -[CCUIMainViewController dismissAnimated:withCompletionHandler:](self, "dismissAnimated:withCompletionHandler:", 1, 0);
  }
  else
  {
    -[CCUIMainViewController presentAnimated:withCompletionHandler:](self, "presentAnimated:withCompletionHandler:", 1, 0);
  }

}

- (void)_dismissalPanGestureRecognizerCancelled:(id)a3
{
  -[CCUIMainViewController presentAnimated:withCompletionHandler:](self, "presentAnimated:withCompletionHandler:", 1, 0);
}

- (void)_dismissalPanGestureRecognizerFailed:(id)a3
{
  -[CCUIMainViewController presentAnimated:withCompletionHandler:](self, "presentAnimated:withCompletionHandler:", 1, 0);
}

- (BOOL)_editingLongPressGestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _BOOL4 v5;
  unint64_t v7;

  v4 = a3;
  if (-[CCUIMainViewController isEditing](self, "isEditing")
    || -[CCUIMainViewController isSensorAttributionViewControllerExpanded](self, "isSensorAttributionViewControllerExpanded")|| -[CCUIPagingViewController expandedModuleCount](self->_pagingViewController, "expandedModuleCount") > 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v7 = -[CCUIMainViewController presentationState](self, "presentationState");
    LOBYTE(v5) = 0;
    if (v7 && v7 != 3)
      v5 = !-[CCUIMainViewController _interpretsGestureLocationAsContent:](self, "_interpretsGestureLocationAsContent:", v4);
  }

  return v5;
}

- (void)_handleEditingLongPressGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[CCUIMainViewController setEditing:](self, "setEditing:", 1);
    objc_msgSend(v4, "setEnabled:", 0);
    objc_msgSend(v4, "setEnabled:", 1);
  }

}

- (BOOL)_scrollPanGestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  if (-[CCUIMainViewController presentationState](self, "presentationState") == 3
    || self->_presentationPanGestureActive
    || -[CCUIMainViewController _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:", self->_headerPocketViewDismissalPanGesture)|| -[CCUIMainViewController _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:", self->_pagingViewDismissalPanGesture))
  {
    v5 = 0;
  }
  else
  {
    -[CCUIMainViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v7);
    v9 = v8;
    v11 = v10;

    v5 = -[CCUIMainViewController _scrollPanGestureRecognizerCanBeginForGestureVelocity:](self, "_scrollPanGestureRecognizerCanBeginForGestureVelocity:", v9, v11);
  }

  return v5;
}

- (BOOL)_scrollPanGestureRecognizerCanBeginForGestureVelocity:(CGPoint)a3
{
  int v4;

  if (BSFloatGreaterThanFloat()
    && !-[CCUIMainViewController _scrollViewCanAcceptDownwardsPan](self, "_scrollViewCanAcceptDownwardsPan"))
  {
    v4 = -[CCUIMainViewController _scrollViewIsScrollable](self, "_scrollViewIsScrollable");
    if (v4)
      LOBYTE(v4) = BSFloatGreaterThanFloat() ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)_scrollViewIsScrollable
{
  void *v2;
  char v3;

  -[CCUIMainViewController _scrollView](self, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isScrollEnabled"))
  {
    objc_msgSend(v2, "contentSize");
    objc_msgSend(v2, "contentInset");
    objc_msgSend(v2, "contentInset");
    objc_msgSend(v2, "bounds");
    v3 = BSFloatGreaterThanFloat();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_scrollViewCanAcceptDownwardsPan
{
  int v3;
  void *v4;

  v3 = -[CCUIMainViewController _scrollViewIsScrollable](self, "_scrollViewIsScrollable");
  if (v3)
  {
    -[CCUIMainViewController _scrollView](self, "_scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ccui_relativeContentOffset");

    LOBYTE(v3) = BSFloatLessThanOrEqualToFloat() ^ 1;
  }
  return v3;
}

- (id)_scrollView
{
  return -[CCUIPagingViewController scrollView](self->_pagingViewController, "scrollView");
}

- (void)_updateChevronStateForTransitionState:(id)a3
{
  objc_msgSend(a3, "presentationProgress");
  -[CCUIHeaderPocketView setChevronState:](self->_headerPocketView, "setChevronState:", BSFloatGreaterThanOrEqualToFloat());
}

- (void)_updateHotPocketAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Height;
  double MinY;
  int v24;
  _BOOL4 v25;
  id v26;
  CGRect v27;
  CGRect v28;

  if (self->_headerPocketView)
  {
    v3 = a3;
    -[CCUIMainViewController pagingViewController](self, "pagingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topmostContentView");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    -[CCUIHeaderPocketView bounds](self->_headerPocketView, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v26, "bounds");
    objc_msgSend(v26, "convertRect:toView:", self->_headerPocketView);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v27.origin.x = v7;
    v27.origin.y = v9;
    v27.size.width = v11;
    v27.size.height = v13;
    Height = CGRectGetHeight(v27);
    v28.origin.x = v15;
    v28.origin.y = v17;
    v28.size.width = v19;
    v28.size.height = v21;
    MinY = CGRectGetMinY(v28);
    if (-[CCUIMainViewController transitionState](self, "transitionState") == 2
      && -[CCUIMainViewController presentationState](self, "presentationState") == 3)
    {
      v24 = -[CCUIOverlayPresentationProvider allowHotPocketDuringTransition](self->_presentationProvider, "allowHotPocketDuringTransition");
    }
    else
    {
      v24 = 1;
    }
    v25 = vabdd_f64(MinY, Height) > 0.05;
    if (MinY >= Height)
      v25 = 0;
    -[CCUIMainViewController _updateHotPocket:animated:](self, "_updateHotPocket:animated:", v25 & v24, v3);

  }
}

- (void)_updateHotPocket:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[6];
  _QWORD v18[6];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_headerPocketView)
  {
    v4 = a3;
    if (self->_showHotPocket != a3)
    {
      self->_showHotPocket = a3;
      v6 = 0.0;
      if (a3)
        v6 = 1.0;
      if (a4)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __52__CCUIMainViewController__updateHotPocket_animated___block_invoke;
        v18[3] = &unk_1E8CFCBE8;
        v18[4] = self;
        *(double *)&v18[5] = v6;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v18, 0.3);
      }
      else
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __52__CCUIMainViewController__updateHotPocket_animated___block_invoke_2;
        v17[3] = &unk_1E8CFCBE8;
        v17[4] = self;
        *(double *)&v17[5] = v6;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
      }
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = self->_headerPocketGradientMaskLayers;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        v11 = !v4;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setHidden:", v11, (_QWORD)v13);
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        }
        while (v9);
      }

    }
  }
}

uint64_t __52__CCUIMainViewController__updateHotPocket_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setBackgroundAlpha:", *(double *)(a1 + 40));
}

uint64_t __52__CCUIMainViewController__updateHotPocket_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setBackgroundAlpha:", *(double *)(a1 + 40));
}

- (void)_setupPanGestureFailureRequirements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSHashTable removeAllObjects](self->_blockingGestureRecognizers, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CCUIMainViewController pagingViewController](self, "pagingViewController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryAllTopLevelBlockingGestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSHashTable addObject:](self->_blockingGestureRecognizers, "addObject:", v9);
        -[UIPanGestureRecognizer requireGestureRecognizerToFail:](self->_pagingViewDismissalPanGesture, "requireGestureRecognizerToFail:", v9);
        -[UIPanGestureRecognizer requireGestureRecognizerToFail:](self->_pagingViewScrollPanGesture, "requireGestureRecognizerToFail:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)_gestureRecognizerIsActive:(id)a3
{
  return (unint64_t)(objc_msgSend(a3, "state") - 1) < 3;
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
  -[CCUIHeaderPocketView gameModeStateDidChange:](self->_headerPocketView, "gameModeStateDidChange:", a3);
}

- (void)_updateSensorActivityStatusForHeaderPocketView
{
  id v3;
  id v4;
  void *v5;
  os_log_t *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  CCUIHeaderPocketView *headerPocketView;
  void *v28;
  void *v29;
  CCUIHeaderPocketView *v30;
  id v31;
  id v32;
  id v33;
  char v34;
  uint8_t buf[4];
  _DWORD v36[7];

  *(_QWORD *)&v36[5] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v32 = 0;
  v33 = 0;
  -[CCUIMainViewController _getCameraSensorActivityData:micSensorActivityData:isInactiveMicModeSelection:](self, "_getCameraSensorActivityData:micSensorActivityData:isInactiveMicModeSelection:", &v33, &v32, &v34);
  v3 = v33;
  v4 = v32;
  v5 = v4;
  v6 = (os_log_t *)MEMORY[0x1E0D146A8];
  if (v3)
  {
    v7 = (void *)*MEMORY[0x1E0D146A8];
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT);
    v9 = v3;
    if (v8)
    {
      v10 = v7;
      objc_msgSend(v3, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v36 = v11;
      _os_log_impl(&dword_1CFB7D000, v10, OS_LOG_TYPE_DEFAULT, "Adding sensor usage data for CAMERA [%{public}@]", buf, 0xCu);

      v9 = v3;
    }
LABEL_7:
    v16 = v9;
    goto LABEL_8;
  }
  if (v4)
  {
    v12 = (void *)*MEMORY[0x1E0D146A8];
    v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT);
    v9 = v5;
    if (v13)
    {
      v14 = v12;
      objc_msgSend(v5, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v36 = v15;
      _os_log_impl(&dword_1CFB7D000, v14, OS_LOG_TYPE_DEFAULT, "Adding sensor usage data for MICROPHONE [%{public}@]", buf, 0xCu);

      v9 = v5;
    }
    goto LABEL_7;
  }
  v16 = 0;
LABEL_8:
  v17 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  -[CCUISensorActivityDataProvider activeSensorActivityData](self->_sensorActivityDataProvider, "activeSensorActivityData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setByAddingObjectsFromSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCUIGameModeActivityDataProvider activityData](self->_gameModeActivityDataProvider, "activityData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    objc_msgSend(v16, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v36[0] = v16 != 0;
    LOWORD(v36[1]) = 2114;
    *(_QWORD *)((char *)&v36[1] + 2) = v24;
    _os_log_impl(&dword_1CFB7D000, v23, OS_LOG_TYPE_DEFAULT, "Setting visibility of AV modules to %{BOOL}d for bundle identifer %{public}@", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0D14548], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setVisibility:forModuleWithIdentifier:completionHandler:", v16 != 0, CFSTR("com.apple.replaykit.VideoConferenceControlCenterModule"), 0);

  objc_msgSend(MEMORY[0x1E0D14548], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setVisibility:forModuleWithIdentifier:completionHandler:", v16 != 0, CFSTR("com.apple.replaykit.AudioConferenceControlCenterModule"), 0);

  headerPocketView = self->_headerPocketView;
  objc_msgSend(v16, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIHeaderPocketView setAudioVideoControlsEnabled:forBundleIdentifier:](headerPocketView, "setAudioVideoControlsEnabled:forBundleIdentifier:", v16 != 0, v28);

  -[CCUIHeaderPocketView setGameModeActivityDataProvider:](self->_headerPocketView, "setGameModeActivityDataProvider:", self->_gameModeActivityDataProvider);
  -[CCUIHeaderPocketView gameModeStateDidChange:](self->_headerPocketView, "gameModeStateDidChange:", -[CCUIGameModeActivityDataProvider gameModeState](self->_gameModeActivityDataProvider, "gameModeState"));
  -[CCUIHeaderPocketView setAudioVideoModeSelectionAttribution:](self->_headerPocketView, "setAudioVideoModeSelectionAttribution:", v16);
  -[CCUIHeaderPocketView sensorAttributionsChanged:](self->_headerPocketView, "sensorAttributionsChanged:", v21);
  if (v34)
    v29 = v5;
  else
    v29 = 0;
  v30 = self->_headerPocketView;
  v31 = v29;
  -[CCUIHeaderPocketView inactiveMicModeSelectionAttributionChanged:](v30, "inactiveMicModeSelectionAttributionChanged:", v31);
  -[CCUIHeaderPocketView layoutIfNeeded](self->_headerPocketView, "layoutIfNeeded");

}

- (void)_askToAirDropPendingOrActiveConnectionsDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFB7D000, v3, OS_LOG_TYPE_DEFAULT, "AskToAirDrop: pendingOrActiveConnectionsChanged", v4, 2u);
  }
  -[CCUIMainViewController _updateAskToAirDropModuleVisibility](self, "_updateAskToAirDropModuleVisibility");
}

- (void)_updateAskToAirDropModuleVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CCUIMainViewController askToAirDropController](self, "askToAirDropController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPendingOrActiveConnections");

  if ((unint64_t)(-[CCUIMainViewController _interfaceOrientation](self, "_interfaceOrientation") - 1) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v4 = v4;
    else
      v4 = 0;
  }
  if (-[CCUIMainViewController isShowingRootView](self, "isShowingRootView") || !(_DWORD)v4)
  {
    v7 = *MEMORY[0x1E0D146A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if ((_DWORD)v4)
        v8 = CFSTR("YES");
      v10 = 138412546;
      v11 = CFSTR("com.apple.sharing.AskToAirDropControlCenterModule");
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1CFB7D000, v7, OS_LOG_TYPE_DEFAULT, "AskToAirDrop: update module visibility with identifier:%@ visible:%@", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0D14548], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVisibility:forModuleWithIdentifier:completionHandler:", v4, CFSTR("com.apple.sharing.AskToAirDropControlCenterModule"), 0);

  }
}

- (BOOL)isHostedInTestApp
{
  return self->_hostedInTestApp;
}

- (void)setHostedInTestApp:(BOOL)a3
{
  self->_hostedInTestApp = a3;
}

- (BOOL)isReachabilityActive
{
  return self->_reachabilityActive;
}

- (CCUIControlCenterSystemAgent)systemAgent
{
  return (CCUIControlCenterSystemAgent *)objc_loadWeakRetained((id *)&self->_systemAgent);
}

- (CCUIMainViewControllerDelegate)delegate
{
  return (CCUIMainViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (unint64_t)transitionState
{
  return self->_transitionState;
}

- (CCUIHostStatusBarStyleProvider)hostStatusBarStyleProvider
{
  return (CCUIHostStatusBarStyleProvider *)objc_loadWeakRetained((id *)&self->_hostStatusBarStyleProvider);
}

- (void)setHostStatusBarStyleProvider:(id)a3
{
  objc_storeWeak((id *)&self->_hostStatusBarStyleProvider, a3);
}

- (NSUUID)currentTransitionUUID
{
  return self->_currentTransitionUUID;
}

- (CCUISensorActivityDataProvider)sensorActivityDataProvider
{
  return self->_sensorActivityDataProvider;
}

- (CCUIPagingViewController)pagingViewController
{
  return self->_pagingViewController;
}

- (void)setPagingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pagingViewController, a3);
}

- (CCUIModuleInstanceManager)moduleInstanceManager
{
  return self->_moduleInstanceManager;
}

- (void)setModuleInstanceManager:(id)a3
{
  objc_storeStrong((id *)&self->_moduleInstanceManager, a3);
}

- (CCUIModuleSettingsManager)moduleSettingsManager
{
  return self->_moduleSettingsManager;
}

- (void)setModuleSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_moduleSettingsManager, a3);
}

- (CCUIStatusLabelViewController)statusLabelViewController
{
  return self->_statusLabelViewController;
}

- (BOOL)isShowingRootView
{
  return self->_showingRootView;
}

- (SFAskToAirDropReceiverControllerProtocol)askToAirDropController
{
  return self->_askToAirDropController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_askToAirDropController, 0);
  objc_storeStrong((id *)&self->_statusLabelViewController, 0);
  objc_storeStrong((id *)&self->_moduleSettingsManager, 0);
  objc_storeStrong((id *)&self->_moduleInstanceManager, 0);
  objc_storeStrong((id *)&self->_pagingViewController, 0);
  objc_storeStrong((id *)&self->_sensorActivityDataProvider, 0);
  objc_storeStrong((id *)&self->_currentTransitionUUID, 0);
  objc_destroyWeak((id *)&self->_hostStatusBarStyleProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_systemAgent);
  objc_storeStrong((id *)&self->_controlCenterOperationService, 0);
  objc_storeStrong((id *)&self->_gameModeActivityDataProvider, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_hostStatusBarStyleSnapshot, 0);
  objc_storeStrong((id *)&self->_previousTransitionState, 0);
  objc_storeStrong((id *)&self->_blockingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_editingLongPressGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewScrollPanGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewDismissalTapGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewDismissalPanGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewDismissalFlickGesture, 0);
  objc_storeStrong((id *)&self->_headerPocketViewDismissalTapGesture, 0);
  objc_storeStrong((id *)&self->_headerPocketViewDismissalPanGesture, 0);
  objc_storeStrong((id *)&self->_presentationTouchIdentifiers, 0);
  objc_storeStrong((id *)&self->_compactLeadingStatusBar, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_headerPocketGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_headerPocketView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_editingAnimationRunner, 0);
  objc_storeStrong((id *)&self->_secondaryAnimationRunner, 0);
  objc_storeStrong((id *)&self->_primaryAnimationRunner, 0);
  objc_storeStrong((id *)&self->_presentationProvider, 0);
}

@end
