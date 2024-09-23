@implementation EKUIContextMenuActions

+ (id)_allActionInfos
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_allActionInfos_onceToken != -1)
    dispatch_once(&_allActionInfos_onceToken, block);
  return (id)_allActionInfos_actions;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke(uint64_t a1)
{
  EKUIContextMenuActionInfo *v2;
  uint64_t v3;
  EKUIContextMenuActionInfo *v4;
  EKUIContextMenuActionInfo *v5;
  EKUIContextMenuActionInfo *v6;
  EKUIContextMenuActionInfo *v7;
  EKUIContextMenuActionInfo *v8;
  EKUIContextMenuActionInfo *v9;
  EKUIContextMenuActionInfo *v10;
  EKUIContextMenuActionInfo *v11;
  EKUIContextMenuActionInfo *v12;
  EKUIContextMenuActionInfo *v13;
  EKUIContextMenuActionInfo *v14;
  EKUIContextMenuActionInfo *v15;
  EKUIContextMenuActionInfo *v16;
  EKUIContextMenuActionInfo *v17;
  EKUIContextMenuActionInfo *v18;
  EKUIContextMenuActionInfo *v19;
  id v20;
  EKUIContextMenuActionInfo *v21;
  EKUIContextMenuActionInfo *v22;
  uint64_t v23;
  void *v24;
  EKUIContextMenuActionInfo *v25;
  EKUIContextMenuActionInfo *v26;
  EKUIContextMenuActionInfo *v27;
  EKUIContextMenuActionInfo *v28;
  EKUIContextMenuActionInfo *v29;
  EKUIContextMenuActionInfo *v30;
  EKUIContextMenuActionInfo *v31;
  EKUIContextMenuActionInfo *v32;
  EKUIContextMenuActionInfo *v33;
  EKUIContextMenuActionInfo *v34;
  EKUIContextMenuActionInfo *v35;
  EKUIContextMenuActionInfo *v36;
  EKUIContextMenuActionInfo *v37;
  EKUIContextMenuActionInfo *v38;
  EKUIContextMenuActionInfo *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[4];
  uint64_t v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[4];
  uint64_t v48;
  _QWORD v49[5];
  _QWORD v50[4];
  uint64_t v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[4];
  uint64_t v56;
  _QWORD v57[5];
  _QWORD v58[4];
  uint64_t v59;
  _QWORD v60[5];
  _QWORD v61[4];
  uint64_t v62;
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[4];
  uint64_t v66;
  _QWORD v67[25];

  v67[23] = *MEMORY[0x1E0C80C00];
  v2 = [EKUIContextMenuActionInfo alloc];
  v3 = MEMORY[0x1E0C809B0];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_2;
  v65[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  v66 = *(_QWORD *)(a1 + 32);
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3;
  v64[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  v64[4] = v66;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_4;
  v63[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v63[4] = v66;
  v39 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v2, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x400000, 1, 6, 0, v65, v64, v63);
  v67[0] = v39;
  v38 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x800000, 1, 6, 0, &__block_literal_global_51, &__block_literal_global_82, &__block_literal_global_89);
  v67[1] = v38;
  v4 = [EKUIContextMenuActionInfo alloc];
  v61[0] = v3;
  v61[1] = 3221225472;
  v61[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_96;
  v61[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  v62 = *(_QWORD *)(a1 + 32);
  v60[0] = v3;
  v60[1] = 3221225472;
  v60[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_107;
  v60[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v60[4] = v62;
  v37 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v4, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 1, 1, 2, 0, &__block_literal_global_95, v61, v60);
  v67[2] = v37;
  v5 = [EKUIContextMenuActionInfo alloc];
  v58[0] = v3;
  v58[1] = 3221225472;
  v58[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_110;
  v58[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  v59 = *(_QWORD *)(a1 + 32);
  v57[0] = v3;
  v57[1] = 3221225472;
  v57[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_121;
  v57[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v57[4] = v59;
  v36 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v5, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 2, 1, 2, 1, &__block_literal_global_109, v58, v57);
  v67[3] = v36;
  v6 = [EKUIContextMenuActionInfo alloc];
  v55[0] = v3;
  v55[1] = 3221225472;
  v55[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_124;
  v55[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  v56 = *(_QWORD *)(a1 + 32);
  v54[0] = v3;
  v54[1] = 3221225472;
  v54[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_9;
  v54[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v54[4] = v56;
  v35 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v6, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 4, 1, 2, 2, &__block_literal_global_123, v55, v54);
  v67[4] = v35;
  v7 = [EKUIContextMenuActionInfo alloc];
  v53[0] = v3;
  v53[1] = 3221225472;
  v53[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_12;
  v53[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v53[4] = *(_QWORD *)(a1 + 32);
  v34 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v7, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 128, 1, 1, 2, &__block_literal_global_135, &__block_literal_global_136, v53);
  v67[5] = v34;
  v8 = [EKUIContextMenuActionInfo alloc];
  v52[0] = v3;
  v52[1] = 3221225472;
  v52[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_15;
  v52[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v52[4] = *(_QWORD *)(a1 + 32);
  v33 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v8, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 256, 1, 1, 3, &__block_literal_global_143, &__block_literal_global_144, v52);
  v67[6] = v33;
  v32 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 8, 1, 1, 0, &__block_literal_global_152_0, &__block_literal_global_153, &__block_literal_global_159);
  v67[7] = v32;
  v31 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 32, 1, 1, 1, &__block_literal_global_161, &__block_literal_global_162, &__block_literal_global_165);
  v67[8] = v31;
  v30 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x200000, 1, 4, 0, &__block_literal_global_166, &__block_literal_global_169, &__block_literal_global_180);
  v67[9] = v30;
  v29 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x100000, 1, 4, 1, &__block_literal_global_181, &__block_literal_global_182, &__block_literal_global_193);
  v67[10] = v29;
  v9 = [EKUIContextMenuActionInfo alloc];
  v50[1] = 3221225472;
  v50[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_28;
  v50[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  v51 = *(_QWORD *)(a1 + 32);
  v49[0] = v3;
  v49[1] = 3221225472;
  v49[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_30;
  v49[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v49[4] = v51;
  v50[0] = v3;
  v28 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v9, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 2048, 0, 5, 0, v50, &__block_literal_global_194, v49);
  v67[11] = v28;
  v10 = [EKUIContextMenuActionInfo alloc];
  v47[1] = 3221225472;
  v47[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_31;
  v47[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  v48 = *(_QWORD *)(a1 + 32);
  v46[0] = v3;
  v46[1] = 3221225472;
  v46[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_33;
  v46[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v46[4] = v48;
  v47[0] = v3;
  v27 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v10, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 4096, 0, 5, 1, v47, &__block_literal_global_203_0, v46);
  v67[12] = v27;
  v11 = [EKUIContextMenuActionInfo alloc];
  v45[0] = v3;
  v45[1] = 3221225472;
  v45[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_36;
  v45[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v45[4] = *(_QWORD *)(a1 + 32);
  v26 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v11, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x2000, 0, 5, 2, &__block_literal_global_210, &__block_literal_global_212, v45);
  v67[13] = v26;
  v25 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x4000, 0, 5, 3, &__block_literal_global_217, &__block_literal_global_219, &__block_literal_global_226);
  v67[14] = v25;
  v12 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x80000, 1, 0, 0, &__block_literal_global_230, &__block_literal_global_235, &__block_literal_global_243);
  v67[15] = v12;
  v13 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x8000, 1, 0, 1, &__block_literal_global_299, &__block_literal_global_301, &__block_literal_global_316);
  v67[16] = v13;
  v14 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 1024, 1, 0, 2, &__block_literal_global_320, &__block_literal_global_322, &__block_literal_global_328);
  v67[17] = v14;
  v15 = [EKUIContextMenuActionInfo alloc];
  v44[0] = v3;
  v44[1] = 3221225472;
  v44[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_340;
  v44[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v44[4] = *(_QWORD *)(a1 + 32);
  v16 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v15, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 512, 1, 1, 4, &__block_literal_global_333_0, &__block_literal_global_335, v44);
  v67[18] = v16;
  v17 = [EKUIContextMenuActionInfo alloc];
  v42[1] = 3221225472;
  v42[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_341;
  v42[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  v43 = *(_QWORD *)(a1 + 32);
  v41[0] = v3;
  v41[1] = 3221225472;
  v41[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_352;
  v41[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v41[4] = v43;
  v42[0] = v3;
  v18 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v17, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 16, 1, 7, 1, v42, &__block_literal_global_343, v41);
  v67[19] = v18;
  v19 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:]([EKUIContextMenuActionInfo alloc], "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x10000, 1, 7, 0, &__block_literal_global_354, &__block_literal_global_357, &__block_literal_global_363);
  v67[20] = v19;
  v20 = -[EKUIContextMenuActionInfo initCalendarMenuPlaceholderInGroup:positionInGroup:]([EKUIContextMenuActionInfo alloc], "initCalendarMenuPlaceholderInGroup:positionInGroup:", 3, 1);
  v67[21] = v20;
  v21 = [EKUIContextMenuActionInfo alloc];
  v40[0] = v3;
  v40[1] = 3221225472;
  v40[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_378;
  v40[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v40[4] = *(_QWORD *)(a1 + 32);
  v22 = -[EKUIContextMenuActionInfo initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:](v21, "initWithAction:showsInEditMenu:group:positionInGroup:shouldShowBlock:configureUIActionBlock:actionBlock:", 0x40000, 0, 3, 2, &__block_literal_global_369, &__block_literal_global_371, v40);
  v67[22] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 23);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)_allActionInfos_actions;
  _allActionInfos_actions = v23;

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "remindersAllTogglable:", v3);

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  LODWORD(v6) = objc_msgSend(v6, "remindersAllCompleted:", a2);
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!(_DWORD)v6)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Complete - context menu"), CFSTR("Mark as Completed"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      EventKitUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Complete - edit menu"), CFSTR("Complete"), 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (_QWORD *)MEMORY[0x1E0D0C960];
      goto LABEL_6;
    }
    v12 = (_QWORD *)MEMORY[0x1E0D0C960];
LABEL_9:
    v13 = v15;
    goto LABEL_10;
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Uncomplete - context menu"), CFSTR("Mark as Incomplete"), 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    v12 = (_QWORD *)MEMORY[0x1E0D0CA38];
    goto LABEL_9;
  }
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Uncomplete - edit menu"), CFSTR("Mark as Incomplete"), 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (_QWORD *)MEMORY[0x1E0D0CA38];
LABEL_6:

  v13 = (id)v11;
LABEL_10:
  v16 = v13;
  objc_msgSend(v7, "setTitle:", v13);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v14);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v4, "remindersAllCompleted:", v6) ^ 1;
  objc_msgSend(v5, "EKUI_editor");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "markReminders:completed:editor:", v6, v7, v8);
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isReminderIntegrationEvent");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show in Reminders"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:configuration:completionHandler:", v6, 0, &__block_literal_global_93_0);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when Open in Reminders tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_94(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsParticipationStatusModifications");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_96(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = objc_msgSend(v6, "_menuStateForStatus:events:", 2, a2);
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Accept - context menu"), CFSTR("Accept"), 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 && v8 == 1)
  {
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Accept - edit menu checked"), CFSTR("✓ Accept"), 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v11;
  }
  else
  {
    v12 = v14;
  }
  v15 = v12;
  objc_msgSend(v7, "setTitle:", v12);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v13);

  objc_msgSend(v7, "setState:", v8);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_107(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_saveStatus:forEvent:presentationController:", 2, v6, v5);

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_108(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsParticipationStatusModifications");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_110(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = objc_msgSend(v6, "_menuStateForStatus:events:", 4, a2);
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Maybe - context menu"), CFSTR("Maybe"), 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 && v8 == 1)
  {
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Maybe - edit menu checked"), CFSTR("✓ Maybe"), 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v11;
  }
  else
  {
    v12 = v14;
  }
  v15 = v12;
  objc_msgSend(v7, "setTitle:", v12);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("questionmark.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v13);

  objc_msgSend(v7, "setState:", v8);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_121(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_saveStatus:forEvent:presentationController:", 4, v6, v5);

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_7_122(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsParticipationStatusModifications");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_124(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = objc_msgSend(v6, "_menuStateForStatus:events:", 3, a2);
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Decline - context menu"), CFSTR("Decline"), 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 && v8 == 1)
  {
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Decline - edit menu checked"), CFSTR("✓ Decline"), 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v11;
  }
  else
  {
    v12 = v14;
  }
  v15 = v12;
  objc_msgSend(v7, "setTitle:", v12);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v13);

  objc_msgSend(v7, "setState:", v8);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_saveStatus:forEvent:presentationController:", 3, v6, v5);

}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isSelfOrganizedInvitation"))
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isProposedTimeEvent") & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v6, "countOfAttendeeProposedTimes") == 1;

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Accept New Time - context menu"), CFSTR("Accept New Time"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_acceptProposedTimeForEvent:presentationController:", v6, v5);

}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isSelfOrganizedInvitation"))
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isProposedTimeEvent") & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v6, "countOfAttendeeProposedTimes") == 1;

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Reject New Time - context menu"), CFSTR("Reject New Time"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attendees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v14, "setCommentChanged:", 0);
          objc_msgSend(v14, "setStatusChanged:", 0);
          objc_msgSend(v14, "setProposedStartDateChanged:", 0);
          objc_msgSend(v14, "setProposedStartDateStatus:", 3);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isOrWasPartOfRecurringSeries"))
    v16 = 4;
  else
    v16 = 0;

  v17 = *(void **)(a1 + 32);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "EKUI_editor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_performSaveWithEvent:span:editor:", v18, v16, v19);

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "events");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "allowsParticipationStatusModifications", (_QWORD)v12) & 1) == 0)
        {
          objc_msgSend(v7, "calendar");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "type");

          if (v9 == 5)
            continue;
        }
        v10 = 0;
        goto LABEL_13;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_13:

  return v10;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = a2;
  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("add_x_suggested_events_to_calendar"), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "count");

  objc_msgSend(v4, "localizedStringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v10);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar.badge.plus"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v11);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "suggestionInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setChangedFields:", 0);

        objc_msgSend(v7, "eventStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "acceptSuggestedEvent:", v7);

        v10 = (void *)MEMORY[0x1E0D0C430];
        objc_msgSend(v7, "suggestionInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logEventConfirmedDetailsWithUniqueKey:", v12);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "events");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "allowsParticipationStatusModifications", (_QWORD)v12) & 1) == 0)
        {
          objc_msgSend(v7, "calendar");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "type");

          if (v9 == 5)
            continue;
        }
        v10 = 0;
        goto LABEL_13;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_13:

  return v10;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v11 = a3;
  v5 = a2;
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ignore_x_suggested_events"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v9);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v10);

  objc_msgSend(v11, "setAttributes:", 2);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "suggestionInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setChangedFields:", 0);

        v9 = (void *)MEMORY[0x1E0D0C430];
        objc_msgSend(v7, "suggestionInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logEventRejectedDetailsWithUniqueKey:", v11);

        objc_msgSend(v7, "eventStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deleteSuggestedEvent:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasRecurrenceRules"),
        v5,
        v6)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "eventViewDelegateShouldShowNextOccurrenceOfEvent:forward:", v7, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_23(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
  {
    v7 = CFSTR("Previous - context menu");
    v8 = CFSTR("Previous");
  }
  else
  {
    v7 = CFSTR("Show Previous Occurrence - context menu");
    v8 = CFSTR("Go to Previous Occurrence");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v9);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.backward.circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v10);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventViewDelegateShowNextOccurrenceOfEvent:forward:", v5, 0);

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasRecurrenceRules"),
        v5,
        v6)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "eventViewDelegateShouldShowNextOccurrenceOfEvent:forward:", v7, 1);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_26(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
  {
    v7 = CFSTR("Next - context menu");
    v8 = CFSTR("Next");
  }
  else
  {
    v7 = CFSTR("Show Next Occurrence - context menu");
    v8 = CFSTR("Go to Next Occurrence");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v9);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.forward.circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v10);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventViewDelegateShowNextOccurrenceOfEvent:forward:", v5, 1);

}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isExternallyOrganizedInvitation"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_organizerContactForEvent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show Organizer - context menu"), CFSTR("Show Organizer"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_30(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_organizerContactForEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("contact://show?id=%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openSensitiveURL:withOptions:", v10, 0);

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isExternallyOrganizedInvitation"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_organizerContactForEvent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = 0;
      }
      else
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "_canEmailOrganizerForEvent:", v10);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Email Organizer - context menu"), CFSTR("Email Organizer"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("envelope"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presentMailViewControllerSendingToOrganizer:event:presentationController:", 1, v6, v5);

}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_34(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", v3, 0);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Email Participants - context menu"), CFSTR("Email Participants"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("envelope"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presentMailViewControllerSendingToOrganizer:event:presentationController:", 0, v6, v5);

}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_37(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[EKUITextSendingManager canSendMessageToRecipientsOnEvent:](EKUITextSendingManager, "canSendMessageToRecipientsOnEvent:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Message Participants - context menu"), CFSTR("Message Participants"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  EKUITextSendingManager *v6;
  void *v7;
  EKUITextSendingManager *v8;
  void *v9;
  EKUITextSendingManager *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  EKUITextSendingManager *v14;

  v4 = a2;
  v5 = a3;
  v6 = [EKUITextSendingManager alloc];
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKUITextSendingManager initWithEvent:](v6, "initWithEvent:", v7);

  -[EKUITextSendingManager viewController](v8, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModalPresentationStyle:", 2);

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__17;
  v13[4] = __Block_byref_object_dispose__17;
  v10 = v8;
  v14 = v10;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_227;
  v12[3] = &unk_1E601BC70;
  v12[4] = v13;
  -[EKUITextSendingManager setMessageSendingComplete:](v10, "setMessageSendingComplete:", v12);
  -[EKUITextSendingManager viewController](v10, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v11, 1, 0);

  _Block_object_dispose(v13, 8);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_227(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_229(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v4, "pasteboardManager"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "calendarToPasteTo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = objc_msgSend(MEMORY[0x1E0D0CDD0], "allEventsValidForAction:fromEvents:", 2, v3);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_234(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Duplicate - context menu"), CFSTR("Duplicate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.badge.plus"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_242(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "pasteboardManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EEEC1FB8))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "duplicateEvents:withDateMode:delegate:", v6, 3, v4);

    }
  }
  else
  {
    v5 = 0;
  }

}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_298(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "virtualConference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "joinMethods");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "conferenceURLForDisplay");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 != 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_300(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  v4 = a3;
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualConference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "joinMethods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conferenceURLForDisplay");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "virtualConference");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "joinMethods");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isBroadcast");

  if ((_DWORD)v17)
  {
    EventKitUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("Watch Broadcast - context menu");
    v21 = CFSTR("Watch Broadcast");
  }
  else
  {
    v22 = objc_msgSend(v11, "cal_hasSchemeTel");
    EventKitUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v22)
    {
      v20 = CFSTR("Call In - context menu");
      v21 = CFSTR("Call In");
    }
    else
    {
      v20 = CFSTR("Join Meeting - context menu");
      v21 = CFSTR("Join Meeting");
    }
  }
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTitle:", v23);
  objc_msgSend(MEMORY[0x1E0D0CD38], "synchronousTitleForURL:incomplete:", v11, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDiscoverabilityTitle:", v24);

  objc_msgSend(MEMORY[0x1E0D0CD38], "synchronousOutlineIconForURL:isBroadcast:outImageName:incomplete:", v11, v17, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v25);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_7_315(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualConference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "joinMethods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conferenceURLForDisplay");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "openURL:configuration:completionHandler:", v8, 0, &__block_literal_global_318);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_317(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when url link in context menu tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_319(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geoLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPrediction") ^ 1;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_321(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Open in Maps - context menu"), CFSTR("Open in Maps"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_327(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CAA0A8];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:", 0, v3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:configuration:completionHandler:", v5, 0, &__block_literal_global_331);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_330(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when maps link in context menu tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_332(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "allowsParticipationStatusModifications"))
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "proposedStartDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_334(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Cancel Proposed Time - context menu"), CFSTR("Cancel Proposed Time"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  objc_msgSend(v6, "setAttributes:", 2);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_340(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProposedStartDate:", 0);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "EKUI_editor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_performSaveWithEvent:span:editor:", v10, 0, v9);
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_341(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "eventsAllDeletable:", v3);

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_342(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v4 = a3;
  if (objc_msgSend(v10, "count") == 1)
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Delete - context menu"), CFSTR("Delete"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("delete_x_events"), &stru_1E601DFA8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v6, objc_msgSend(v10, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v8);

  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v9);

  objc_msgSend(v4, "setAttributes:", 2);
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_352(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteEvents:presentationController:", a2, a3);
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_7_353(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "events");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "calendar", (_QWORD)v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "calendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "isEqual:", v9);

        if (!v10)
        {
          v15 = 0;
          v11 = v2;
          goto LABEL_17;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
        continue;
      break;
    }
  }

  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isSubscribed"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isSubscribedHolidayCalendar") & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp");

  }
  else
  {
    v15 = 0;
  }

LABEL_17:
  return v15;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_356(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = a2;
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Unsubscribe from This Calendar - context menu"), CFSTR("Unsubscribe from This Calendar"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v6);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKDisplayedTitleForCalendar();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscoverabilityTitle:", v9);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v10);

  objc_msgSend(v11, "setAttributes:", 2);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_9_362(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_10_364;
  aBlock[3] = &unk_1E60197E8;
  v12 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  +[EKUIRecurrenceAlertController presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:](EKUIRecurrenceAlertController, "presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:", 0, v4, 0, v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)_presentedAlert;
  _presentedAlert = v9;

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_10_364(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)_presentedAlert;
  _presentedAlert = 0;

  if (a2 != 3)
  {
    if (a2 == 5)
    {
      v5 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details, and reporting it as junk", (uint8_t *)&v9, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D0CE18], "unsubscribeFromCalendar:reportAsJunk:", *(_QWORD *)(a1 + 32), 1);
    }
    else
    {
      v7 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details", (uint8_t *)&v9, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D0CE18], "unsubscribeFromCalendar:", *(_QWORD *)(a1 + 32));
    }
  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_368(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasAttendees"))
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "calendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "supportsAvailabilityRequests");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_370(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show Availability - context menu"), CFSTR("Show Availability"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.fill.questionmark"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_378(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIAvailabilityViewController presentAvailabilityViewControllerForEvent:fromViewController:](EKUIAvailabilityViewController, "presentAvailabilityViewControllerForEvent:fromViewController:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_380;
  v10[3] = &unk_1E601BEB8;
  objc_copyWeak(v12, &location);
  v12[1] = *(id *)(a1 + 32);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "setSaveBlock:", v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_380(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "modifiedStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStartDate:", v8);

  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "modifiedEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEndDateUnadjustedForLegacyClients:", v10);

  v11 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_performSaveWithEvent:span:editor:", v6, a3, v12);

}

+ (int64_t)_menuStateForStatus:(int64_t)a3 events:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  _BOOL4 v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
    goto LABEL_12;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  v10 = 1;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "participationStatus") == a3;
      v10 &= v12;
      v8 |= v12;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v7);
  v13 = (v8 & 1) != 0 ? 2 : 0;
  if (v10)
LABEL_12:
    v13 = 1;

  return v13;
}

+ (id)_filteredSortedActionInfosForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5
{
  id v8;
  id v9;
  ShouldShowBlockParameters *v10;
  void *v11;
  void *v12;
  ShouldShowBlockParameters *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  ShouldShowBlockParameters *v22;
  BOOL v23;

  v8 = a4;
  v9 = a3;
  v10 = -[ShouldShowBlockParameters initWithEvents:presentationController:]([ShouldShowBlockParameters alloc], "initWithEvents:presentationController:", v9, v8);

  objc_msgSend(a1, "_allActionInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3880];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __96__EKUIContextMenuActions__filteredSortedActionInfosForEvents_presentationController_isEditMenu___block_invoke;
  v21 = &unk_1E601BEE0;
  v23 = a5;
  v22 = v10;
  v13 = v10;
  objc_msgSend(v12, "predicateWithBlock:", &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v14, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_389);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __96__EKUIContextMenuActions__filteredSortedActionInfosForEvents_presentationController_isEditMenu___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t (**v5)(_QWORD, _QWORD);

  v3 = a2;
  if (objc_msgSend(v3, "action") == 0x20000)
  {
    v4 = 1;
  }
  else if (*(_BYTE *)(a1 + 40) && !objc_msgSend(v3, "showsInEditMenu"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "shouldShowBlock");
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = v5[2](v5, *(_QWORD *)(a1 + 32));

  }
  return v4;
}

uint64_t __96__EKUIContextMenuActions__filteredSortedActionInfosForEvents_presentationController_isEditMenu___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "group");
  if (v6 < objc_msgSend(v5, "group"))
  {
LABEL_5:
    v8 = -1;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "group");
  if (v7 <= objc_msgSend(v5, "group"))
  {
    v9 = objc_msgSend(v4, "positionInGroup");
    if (v9 >= objc_msgSend(v5, "positionInGroup"))
    {
      v11 = objc_msgSend(v4, "positionInGroup");
      v8 = v11 > objc_msgSend(v5, "positionInGroup");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

+ (id)_createCalendarsMenuForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5 overrideActionBlock:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  char v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  BOOL v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id val;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  BOOL v60;
  id location;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v48 = a4;
  v49 = a6;
  v13 = a7;
  v50 = v12;
  if (a5)
  {
    v14 = 0;
  }
  else
  {
    val = a1;
    v47 = v13;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "source");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v18 = v12;
    v19 = 0;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v63;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v63 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v23, "calendar");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "source");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqual:", v51);

          if (!v26
            || !objc_msgSend(v23, "allowsCalendarModifications")
            || (v27 = objc_msgSend(v23, "hasAttendees"),
                objc_msgSend(v23, "isExternallyOrganizedInvitation"))
            && !objc_msgSend(v23, "allowsParticipationStatusModifications")
            || (objc_msgSend(v23, "isIntegrationEvent") & 1) != 0)
          {
            v14 = 0;
            goto LABEL_24;
          }
          objc_msgSend(v23, "calendar");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v28);

          v19 |= v27;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        if (v20)
          continue;
        break;
      }
    }

    v29 = objc_msgSend(v17, "count");
    v30 = v29 == 1;
    if ((v19 & 1) != 0 || objc_msgSend(v51, "isDelegate"))
      v31 = v51;
    else
      v31 = 0;
    v32 = v31;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "eventStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D0CD28], "calendarsLimitedToSource:writability:onlyUnmanagedAccounts:forEvents:entityType:inEventStore:", v32, 2, 0, v18, 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, val);
    if (v29 == 1)
    {
      objc_msgSend(v17, "anyObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKDisplayedTitleForCalendar();
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("x_calendars_selected"), &stru_1E601DFA8, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringWithFormat:", v39, objc_msgSend(v17, "count"));
      v37 = objc_claimAutoreleasedReturnValue();

    }
    v40 = v30;
    v41 = v32;
    v42 = (void *)v37;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke;
    v58[3] = &unk_1E601BF48;
    v59 = v17;
    v60 = v40;
    v52[0] = v44;
    v52[1] = 3221225472;
    v52[2] = __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke_2;
    v52[3] = &unk_1E601BF70;
    objc_copyWeak(&v57, &location);
    v55 = v49;
    v53 = v48;
    v54 = v18;
    v56 = v47;
    +[EKUICalendarMenu calendarSubmenuWithSubtitle:calendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:](EKUICalendarMenu, "calendarSubmenuWithSubtitle:calendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:", v42, v35, v34, v43, v58, v52);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);

    v18 = v41;
LABEL_24:

    v13 = v47;
  }

  return v14;
}

void __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a3))
  {
    if (*(_BYTE *)(a1 + 40))
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v6, "setState:", v5);

}

void __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v27 = 0x20000;
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Context menu action %lu was picked.", buf, 0xCu);
    }
    v6 = *(_QWORD *)(a1 + 48);
    if (!v6 || ((*(uint64_t (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, 0x20000, v3) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v20 = a1;
      v8 = *(id *)(a1 + 40);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v13, "calendar");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v3, "isEqual:", v14);

            if ((v15 & 1) == 0)
            {
              objc_msgSend(v13, "calendar");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v13, "requiresCopyToMoveFromCalendar:toCalendar:", v16, v3);

              if (v17)
              {
                v18 = (void *)objc_msgSend(v13, "copyToCalendar:withOptions:", v3, 0);
                objc_msgSend(WeakRetained, "_performSaveWithEvent:span:editor:", v18, 0, v7);

              }
              else
              {
                objc_msgSend(v13, "setCalendar:", v3);
                objc_msgSend(WeakRetained, "_performSaveWithEvent:span:editor:", v13, 0, v7);
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v10);
      }

      v19 = *(_QWORD *)(v20 + 56);
      if (v19)
        (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 0x20000);

    }
  }

}

+ (id)menuForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5 overrideActionBlock:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id obj;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[16];
  _BYTE v61[128];
  uint64_t v62;

  v9 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v12, "count"))
  {
    v47 = v15;
    objc_msgSend(a1, "_createCalendarsMenuForEvents:presentationController:isEditMenu:overrideActionBlock:completionBlock:", v12, v13, v9, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v13;
    v45 = v9;
    objc_msgSend(a1, "_filteredSortedActionInfosForEvents:presentationController:isEditMenu:", v12, v13, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "group");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v17;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v57;
      do
      {
        v24 = 0;
        v49 = v22;
        do
        {
          if (*(_QWORD *)v57 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v24);
          v26 = objc_msgSend(v25, "action");
          if (v26 != 0x20000 || v16 != 0)
          {
            v28 = v26;
            if (objc_msgSend(v25, "group") != v19)
            {
              objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v20);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addObject:", v29);

              v19 = objc_msgSend(v25, "group");
              objc_msgSend(v20, "removeAllObjects");
            }
            if (v28 == 0x20000)
            {
              objc_msgSend(v20, "addObject:", v16);
            }
            else
            {
              v30 = (void *)MEMORY[0x1E0DC3428];
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __110__EKUIContextMenuActions_menuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke;
              v51[3] = &unk_1E601BF98;
              v51[4] = v25;
              v54 = v14;
              v31 = v23;
              v32 = v16;
              v33 = v20;
              v34 = v19;
              v35 = v14;
              v36 = v12;
              v37 = v12;
              v52 = v37;
              v53 = v48;
              v55 = v47;
              objc_msgSend(v30, "actionWithTitle:image:identifier:handler:", &stru_1E601DFA8, 0, 0, v51);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "configureUIActionBlock");
              v39 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v40 = v37;
              v12 = v36;
              v14 = v35;
              v19 = v34;
              v20 = v33;
              v16 = v32;
              v23 = v31;
              v22 = v49;
              ((void (**)(_QWORD, id, void *, _BOOL4))v39)[2](v39, v40, v38, v45);

              objc_msgSend(v20, "addObject:", v38);
            }
          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v22);
    }

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v20);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v41);

    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v46);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v47;
    v13 = v48;
  }
  else
  {
    v43 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v43, OS_LOG_TYPE_ERROR, "No events provided for EKUIContextMenuActions menuForEvents. Returning empty context menu.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, MEMORY[0x1E0C9AA60]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v42;
}

void __110__EKUIContextMenuActions_menuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    v10 = 134217984;
    v11 = objc_msgSend(v5, "action");
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Context menu action %lu was picked.", (uint8_t *)&v10, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 56);
  if (!v7
    || ((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, objc_msgSend(*(id *)(a1 + 32), "action"), 0) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionBlock");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    v9 = *(_QWORD *)(a1 + 64);
    if (v9)
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, objc_msgSend(*(id *)(a1 + 32), "action"));
  }

}

+ (id)_organizerContactForEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "organizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(v4, "unifiedContactWithEmailAddress:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v3, "phoneNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "unifiedContactWithPhoneNumber:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (BOOL)_canEmailOrganizerForEvent:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "organizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isCurrentUser") & 1) == 0)
  {
    objc_msgSend(v4, "emailAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
      v5 = objc_msgSend(MEMORY[0x1E0D46AA8], "canSendMail");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)statusButtonsActionFromContextMenuAction:(unint64_t)a3
{
  return a3 & 7;
}

+ (void)_presentMailViewControllerSendingToOrganizer:(BOOL)a3 event:(id)a4 presentationController:(id)a5
{
  id v7;
  id v8;
  EKUIEmailCompositionManager *v9;
  EKUIEmailCompositionManager *v10;
  void *v11;
  void *v12;
  EKUIEmailCompositionManager *v13;
  void *v14;
  EKUIEmailCompositionManager *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  EKUIEmailCompositionManager *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = [EKUIEmailCompositionManager alloc];
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v7, "organizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EKUIEmailCompositionManager initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:](v10, "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", v7, v12, 0, 0);

  }
  else
  {
    v13 = -[EKUIEmailCompositionManager initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:](v9, "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", v7, 0, 0, 0);
  }
  -[EKUIEmailCompositionManager viewController](v13, "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setModalPresentationStyle:", 2);

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__17;
  v18[4] = __Block_byref_object_dispose__17;
  v15 = v13;
  v19 = v15;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__EKUIContextMenuActions__presentMailViewControllerSendingToOrganizer_event_presentationController___block_invoke;
  v17[3] = &unk_1E601BC70;
  v17[4] = v18;
  -[EKUIEmailCompositionManager setMessageSendingComplete:](v15, "setMessageSendingComplete:", v17);
  -[EKUIEmailCompositionManager viewController](v15, "viewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v16, 1, 0);

  _Block_object_dispose(v18, 8);
}

void __100__EKUIContextMenuActions__presentMailViewControllerSendingToOrganizer_event_presentationController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

+ (void)_performSaveWithEvent:(id)a3 span:(int64_t)a4 editor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v13 = 0;
  LOBYTE(a4) = objc_msgSend(a5, "saveEvent:span:error:", v7, a4, &v13);
  v8 = v13;
  v9 = v8;
  if ((a4 & 1) != 0 || !v8)
    goto LABEL_9;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)*MEMORY[0x1E0CA9E60])
  {
    v11 = objc_msgSend(v9, "code");

    if (v11 != 1010)
      goto LABEL_7;
    objc_msgSend(v7, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rollback");
  }

LABEL_7:
  v12 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_ERROR, "Error saving event as part of context menu action: %@", buf, 0xCu);
  }
LABEL_9:

}

+ (void)_saveStatus:(int64_t)a3 forEvent:(id)a4 presentationController:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;
  int64_t v23;
  id v24;

  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "responseMustApplyToAll") & 1) != 0)
  {
    v10 = 4;
LABEL_6:
    objc_msgSend(v8, "setParticipationStatus:", a3);
    objc_msgSend(v8, "setInvitationStatus:", 0);
    objc_msgSend(v9, "EKUI_editor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_performSaveWithEvent:span:editor:", v8, v10, v16);

    goto LABEL_7;
  }
  if (!objc_msgSend(v8, "isOrWasPartOfRecurringSeries"))
  {
    v10 = 0;
    goto LABEL_6;
  }
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __70__EKUIContextMenuActions__saveStatus_forEvent_presentationController___block_invoke;
  v20 = &unk_1E601BFC0;
  v11 = v8;
  v21 = v11;
  v23 = a3;
  v24 = a1;
  v12 = v9;
  v22 = v12;
  v13 = _Block_copy(&v17);
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v12, 0, v11, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v17, v18, v19, v20);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)_presentedAlert;
  _presentedAlert = v14;

LABEL_7:
}

void __70__EKUIContextMenuActions__saveStatus_forEvent_presentationController___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  switch(a2)
  {
    case 1:
    case 2:
      goto LABEL_3;
    case 3:
      goto LABEL_4;
    case 4:
    case 5:
      return;
    default:
      v3 = 0;
LABEL_3:
      objc_msgSend(*(id *)(a1 + 32), "setParticipationStatus:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "setInvitationStatus:", 0);
      v4 = *(void **)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "EKUI_editor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_performSaveWithEvent:span:editor:", v5, v3, v6);

LABEL_4:
      v7 = (void *)_presentedAlert;
      _presentedAlert = 0;

      return;
  }
}

+ (void)_acceptProposedTimeForEvent:(id)a3 presentationController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_proposedDateForEvent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    objc_msgSend(v6, "setStartDate:", v8);
    objc_msgSend(v8, "dateByAddingTimeInterval:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEndDateUnadjustedForLegacyClients:", v13);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v6, "attendees");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v19;
            objc_msgSend(v20, "setCommentChanged:", 0);
            objc_msgSend(v20, "setStatusChanged:", 0);
            objc_msgSend(v20, "setProposedStartDateChanged:", 0);

          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    objc_msgSend(v6, "dismissAcceptedProposeNewTimeNotification");
    if (objc_msgSend(v6, "isOrWasPartOfRecurringSeries"))
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __77__EKUIContextMenuActions__acceptProposedTimeForEvent_presentationController___block_invoke;
      v24[3] = &unk_1E601BFE8;
      v27 = a1;
      v25 = v6;
      v26 = v7;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v26, 0, v25, v24, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)_presentedAlert;
      _presentedAlert = v21;

      v23 = v25;
    }
    else
    {
      objc_msgSend(v7, "EKUI_editor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_performSaveWithEvent:span:editor:", v6, 0, v23);
    }

  }
}

void __77__EKUIContextMenuActions__acceptProposedTimeForEvent_presentationController___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if ((unint64_t)(a2 - 3) >= 3)
  {
    if (a2 == 2)
      v3 = 2;
    else
      v3 = a2 == 1;
    v5 = (void *)_presentedAlert;
    _presentedAlert = 0;

    v6 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "EKUI_editor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performSaveWithEvent:span:editor:", v7, v3, v8);
    v2 = v8;
  }
  else
  {
    v2 = (void *)_presentedAlert;
    _presentedAlert = 0;
  }

}

+ (id)_proposedDateForEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "attendees", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          if (objc_msgSend(v10, "proposedStartDateStatus") == 1
            || !objc_msgSend(v10, "proposedStartDateStatus"))
          {
            objc_msgSend(v10, "proposedStartDateForEvent:", v3);
            v11 = objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = (void *)v11;

              goto LABEL_15;
            }
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

+ (void)deleteEvents:(id)a3 presentationController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  EKUIIntegrationAlertDisplayer *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  EKUIIntegrationAlertDisplayer *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD aBlock[4];
  id v35;
  EKUIIntegrationAlertDisplayer *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  BOOL v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "EKUI_editor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v5);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "isProposedTimeEvent");
        v18 = v10;
        if ((v17 & 1) == 0)
        {
          v19 = objc_msgSend(v16, "CUIK_deleteActionShouldDeclineEvent");
          v18 = v9;
          if (!v19)
            continue;
        }
        objc_msgSend(v18, "addObject:", v16);
        objc_msgSend(v8, "removeObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "status");

    v22 = v21 == 3;
    if (v21 == 3)
      v23 = 19;
    else
      v23 = 18;
  }
  else
  {
    v22 = 0;
    v23 = 18;
  }
  v24 = -[EKUIIntegrationAlertDisplayer initWithViewController:options:]([EKUIIntegrationAlertDisplayer alloc], "initWithViewController:options:", v6, 1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke;
  aBlock[3] = &unk_1E601C060;
  v35 = v7;
  v36 = v24;
  v41 = v22;
  v37 = v10;
  v38 = v9;
  v39 = v8;
  v40 = v6;
  v25 = v6;
  v26 = v8;
  v27 = v9;
  v28 = v10;
  v29 = v24;
  v30 = v7;
  v31 = _Block_copy(aBlock);
  +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:forEvents:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:forEvents:withCompletionHandler:", v23, v25, v11, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)_presentedAlert;
  _presentedAlert = v32;

}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v15 = *MEMORY[0x1E0D0C9E8];
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_2;
  v7[3] = &unk_1E601C038;
  v13 = a2;
  v14 = *(_BYTE *)(a1 + 80);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 72);
  objc_msgSend(v5, "performWithOptions:block:", v6, v7);

}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  id v46;
  _QWORD aBlock[4];
  id v48;
  id v49;
  uint64_t v50;
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
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 72);
  switch(v2)
  {
    case 0:
      v2 = 2 * *(unsigned __int8 *)(a1 + 80);
      goto LABEL_5;
    case 1:
    case 2:
      goto LABEL_5;
    case 3:
    case 4:
    case 5:
      v3 = (void *)_presentedAlert;
      _presentedAlert = 0;

      return;
    default:
      v2 = 0;
LABEL_5:
      if (objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v4 = *(id *)(a1 + 32);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v60 != v7)
                objc_enumerationMutation(v4);
              objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "setProposedStartDate:", 0);
            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
          }
          while (v6);
        }

        objc_msgSend(*(id *)(a1 + 40), "saveChangesToEvents:span:", *(_QWORD *)(a1 + 32), v2);
      }
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v9 = *(id *)(a1 + 48);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v56 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              objc_msgSend(v14, "setParticipationStatus:", 3);
              objc_msgSend(v14, "setInvitationStatus:", 0);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v11);
        }

        objc_msgSend(*(id *)(a1 + 40), "saveChangesToEvents:span:", *(_QWORD *)(a1 + 48), v2);
      }
      if (!objc_msgSend(*(id *)(a1 + 56), "count"))
        goto LABEL_41;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v15 = *(id *)(a1 + 56);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (!v16)
        goto LABEL_34;
      v17 = *(_QWORD *)v52;
      break;
  }
  while (2)
  {
    for (k = 0; k != v16; ++k)
    {
      if (*(_QWORD *)v52 != v17)
        objc_enumerationMutation(v15);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "hasAttendees") & 1) != 0)
      {
        LODWORD(v16) = 1;
        goto LABEL_34;
      }
    }
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v16)
      continue;
    break;
  }
LABEL_34:

  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_3;
  aBlock[3] = &unk_1E601A7F0;
  v48 = *(id *)(a1 + 56);
  v49 = *(id *)(a1 + 40);
  v50 = v2;
  v20 = _Block_copy(aBlock);
  v21 = v20;
  if ((_DWORD)v16)
  {
    v22 = objc_msgSend(*(id *)(a1 + 56), "count");
    EventKitUIBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22 == 1)
    {
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to delete this event?"), &stru_1E601DFA8, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      EventKitUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = CFSTR("Deleting this event will remove it from your calendar and notify the invitees that this event has been deleted. You can’t undo this action.");
    }
    else
    {
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to delete these events?"), &stru_1E601DFA8, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      EventKitUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = CFSTR("Deleting these events will notify the invitees that the events have been deleted. You can’t undo this action.");
    }
    objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E601DFA8, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v25, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Delete and Notify"), &stru_1E601DFA8, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v19;
    v43 = 3221225472;
    v44 = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_4;
    v45 = &unk_1E601C010;
    v46 = v21;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 2, &v42);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v34, v42, v43, v44, v45);

    v35 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Cancel - recurrence alert controller"), CFSTR("Cancel"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "actionWithTitle:style:handler:", v37, 1, &__block_literal_global_424);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v38);

    objc_msgSend(*(id *)(a1 + 64), "presentViewController:animated:completion:", v30, 1, 0);
    v39 = (void *)_presentedAlert;
    _presentedAlert = (uint64_t)v30;
    v40 = v30;

  }
  else
  {
    (*((void (**)(void *))v20 + 2))(v20);
  }

LABEL_41:
  v41 = (void *)_presentedAlert;
  _presentedAlert = 0;

}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleEventDeletion:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "deleteEvents:span:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v9 = (void *)_presentedAlert;
  _presentedAlert = 0;

}

uint64_t __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_5()
{
  void *v0;

  v0 = (void *)_presentedAlert;
  _presentedAlert = 0;

}

+ (void)markReminders:(id)a3 completed:(BOOL)a4 editor:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "isReminderIntegrationEvent", (_QWORD)v16)
          && objc_msgSend(v15, "CUIK_reminderShouldBeEditable")
          && objc_msgSend(v15, "completed") != v6)
        {
          objc_msgSend(v15, "setCompleted:", v6);
          objc_msgSend(v9, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "saveChangesToEvents:span:", v9, 0);
}

+ (BOOL)remindersAllTogglable:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v8, "isReminderIntegrationEvent", (_QWORD)v11)
          || !objc_msgSend(v8, "CUIK_reminderShouldBeEditable"))
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
LABEL_13:

  return v9;
}

+ (BOOL)remindersAllCompleted:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "completed", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

+ (BOOL)eventsAllDeletable:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v8, "isDeletable", (_QWORD)v11)
          || objc_msgSend(v8, "isExternallyOrganizedInvitation")
          && objc_msgSend(v8, "status") != 3
          && objc_msgSend(v8, "participationStatus") != 3
          && !objc_msgSend(v8, "isOrganizedBySharedCalendarOwner")
          || objc_msgSend(v8, "isReminderIntegrationEvent")
          && !objc_msgSend(v8, "CUIK_reminderShouldBeEditable"))
        {
          v9 = 0;
          goto LABEL_18;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
LABEL_18:

  return v9;
}

@end
