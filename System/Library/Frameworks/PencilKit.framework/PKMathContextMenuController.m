@implementation PKMathContextMenuController

+ (PKMathContextMenuController)controllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6
{
  id v14;
  id v15;
  id v16;
  PKMathContextMenuController *v17;
  PKMathContextMenuController *v18;
  void *v19;
  UIContextMenuInteraction *interaction;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  objc_opt_self();
  v17 = objc_alloc_init(PKMathContextMenuController);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mathItem, a6);

    v18->_tapBounds.origin.x = a1;
    v18->_tapBounds.origin.y = a2;
    v18->_tapBounds.size.width = a3;
    v18->_tapBounds.size.height = a4;
    objc_storeWeak((id *)&v18->_view, v15);
    objc_storeWeak((id *)&v18->_delegate, v14);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", v18);
    objc_storeStrong((id *)&v18->_interaction, v19);

    interaction = v18->_interaction;
  }
  else
  {

    interaction = 0;
  }
  objc_msgSend(v15, "addInteraction:", interaction);

  return v18;
}

+ (id)mathResultControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = objc_opt_self();
  +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v17, v16, v15, v14);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    *(_QWORD *)(v18 + 56) = 0;
    *(_BYTE *)(v18 + 8) = 1;
  }
  return (id)v18;
}

+ (id)mathSolvingControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 supportCopy:(uint64_t)a5 view:(void *)a6 delegate:(char)a7
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = objc_opt_self();
  +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v19, v18, v17, v16);
  v20 = objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    *(_QWORD *)(v20 + 56) = 1;
    *(_BYTE *)(v20 + 8) = a7;
  }
  return (id)v20;
}

+ (id)mathCopyControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = objc_opt_self();
  +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v17, v16, v15, v14);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    *(_QWORD *)(v18 + 56) = 2;
    *(_BYTE *)(v18 + 8) = 1;
  }
  return (id)v18;
}

+ (_QWORD)mathErrorControllerForItem:(CGFloat)a3 token:(CGFloat)a4 tapBounds:(uint64_t)a5 errorString:(void *)a6 view:(void *)a7 delegate:(void *)a8
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  const char *v25;

  v18 = a7;
  v19 = a8;
  v20 = a10;
  v21 = a9;
  v22 = a6;
  v23 = objc_opt_self();
  +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v23, v22, v21, v20);
  v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v24[7] = 3;
    objc_setProperty_nonatomic_copy(v24, v25, v19, 64);
  }
  -[PKMathResultAttribution setDate:]((uint64_t)v24, v18);

  return v24;
}

+ (id)insertGraphControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 alsoShowAddToExisiting:(uint64_t)a5 view:(void *)a6 delegate:(char)a7
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = objc_opt_self();
  +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v19, v18, v17, v16);
  v20 = objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    *(_QWORD *)(v20 + 56) = 4;
    *(_BYTE *)(v20 + 9) = a7;
  }
  return (id)v20;
}

- (id)drawing
{
  id v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "contextMenuControllerDrawing:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  PKMathRecognitionItem *v6;
  PKMathRecognitionItem *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKMathRecognitionToken *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PKMathRecognitionItem *v24;
  PKMathRecognitionToken *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  PKMathContextMenuController *v31;
  id v32;
  id v33;
  PKMathRecognitionItem *v34;
  PKMathRecognitionToken *v35;
  id v36;
  id location;

  v5 = a3;
  if (self && (v6 = self->_mathItem) != 0)
  {
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[PKMathRecognitionItem uuid](v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "contextMenuController:resultForItemUUID:", self, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    -[PKMathRecognitionItem uuid](v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextMenuController:resultDrawingForItemUUID:", self, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0D168A0];
    -[PKMathRecognitionItem expression](v7, "expression");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textTranscriptionForLatex:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKMathRecognitionItem strokes](v7, "strokes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_mathToken;
    objc_initWeak(&location, self);
    v19 = (void *)MEMORY[0x1E0DC36B8];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v28[3] = &unk_1E7778F40;
    objc_copyWeak(&v36, &location);
    v20 = v17;
    v29 = v20;
    v21 = v16;
    v30 = v21;
    v31 = self;
    v22 = v13;
    v32 = v22;
    v23 = v10;
    v33 = v23;
    v24 = v7;
    v34 = v24;
    v25 = v18;
    v35 = v25;
    objc_msgSend(v19, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

id __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
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
  void *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BYTE *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BYTE *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  _QWORD v86[2];
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v54 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _PencilKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Copy"), CFSTR("Copy"), CFSTR("Localizable"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Copy Expression"), CFSTR("Copy Expression"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3428];
  v9 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v78[3] = &unk_1E7778EF0;
  objc_copyWeak(&v81, (id *)(a1 + 88));
  v79 = *(id *)(a1 + 32);
  v80 = *(id *)(a1 + 40);
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v7, v4, 0, v78);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    switch(*(_QWORD *)(v10 + 56))
    {
      case 0:
        goto LABEL_3;
      case 1:
        WeakRetained = objc_loadWeakRetained((id *)(v10 + 40));
        objc_msgSend(WeakRetained, "tintColor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("equal.circle"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "imageWithTintColor:renderingMode:", v57, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        _PencilKitBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Solve"), CFSTR("Solve"), CFSTR("Localizable"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x1E0DC3428];
        v69[0] = v9;
        v69[1] = 3221225472;
        v69[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
        v69[3] = &unk_1E7778F18;
        objc_copyWeak(&v71, (id *)(a1 + 88));
        v70 = *(id *)(a1 + 72);
        objc_msgSend(v28, "actionWithTitle:image:identifier:handler:", v27, v55, 0, v69);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          v84 = *MEMORY[0x1E0DC1140];
          v85 = v57;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v27, v30);
          objc_msgSend(v29, "setAttributedTitle:", v31);

        }
        objc_msgSend(v3, "addObject:", v29);
        v32 = objc_loadWeakRetained((id *)(a1 + 88));
        if (v32)
        {
          v33 = v32[8] == 0;

          if (!v33)
          {
            v34 = (void *)MEMORY[0x1E0DC39D0];
            v83 = v58;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "menuWithTitle:image:identifier:options:children:", &stru_1E777DEE8, 0, 0, 1, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "addObject:", v36);
          }
        }

        objc_destroyWeak(&v71);
        goto LABEL_16;
      case 2:
        objc_msgSend(v3, "addObject:", v58);
        break;
      case 3:
        _PencilKitBundle();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Dismiss Error"), CFSTR("Dismiss Error"), CFSTR("Localizable"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E0DC3428];
        v65[0] = v9;
        v65[1] = 3221225472;
        v65[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6;
        v65[3] = &unk_1E7778EF0;
        objc_copyWeak(&v68, (id *)(a1 + 88));
        v66 = *(id *)(a1 + 72);
        v67 = *(id *)(a1 + 80);
        objc_msgSend(v38, "actionWithTitle:image:identifier:handler:", v57, v55, 0, v65);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v39);

        objc_destroyWeak(&v68);
        goto LABEL_16;
      case 4:
        _PencilKitBundle();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Insert Graph"), CFSTR("Insert Graph"), CFSTR("Localizable"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chart.xyaxis.line"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0DC3428];
        v62[0] = v9;
        v62[1] = 3221225472;
        v62[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
        v62[3] = &unk_1E7778F18;
        objc_copyWeak(&v64, (id *)(a1 + 88));
        v63 = *(id *)(a1 + 72);
        objc_msgSend(v41, "actionWithTitle:image:identifier:handler:", v57, v55, 0, v62);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:");
        v42 = objc_loadWeakRetained((id *)(a1 + 88));
        if (v42)
        {
          v43 = v42[9] == 0;

          if (!v43)
          {
            _PencilKitBundle();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Add to Existing Graph"), CFSTR("Add to Existing Graph"), CFSTR("Localizable"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = (void *)MEMORY[0x1E0DC3428];
            v59[0] = v9;
            v59[1] = 3221225472;
            v59[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8;
            v59[3] = &unk_1E7778F18;
            objc_copyWeak(&v61, (id *)(a1 + 88));
            v60 = *(id *)(a1 + 72);
            objc_msgSend(v46, "actionWithTitle:image:identifier:handler:", v45, v55, 0, v59);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v47);

            objc_destroyWeak(&v61);
          }
        }
        v48 = (void *)MEMORY[0x1E0DC39D0];
        v82 = v58;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "menuWithTitle:image:identifier:options:children:", &stru_1E777DEE8, 0, 0, 1, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v50);
        objc_destroyWeak(&v64);
        goto LABEL_16;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    _PencilKitBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Remove Result"), CFSTR("Remove Result"), CFSTR("Localizable"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    _PencilKitBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Copy Result"), CFSTR("Copy Result"), CFSTR("Localizable"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3428];
    v75[0] = v9;
    v75[1] = 3221225472;
    v75[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
    v75[3] = &unk_1E7778D68;
    v76 = *(id *)(a1 + 56);
    v77 = *(id *)(a1 + 64);
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v55, v4, 0, v75);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3428];
    v72[0] = v9;
    v72[1] = 3221225472;
    v72[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    v72[3] = &unk_1E7778F18;
    objc_copyWeak(&v74, (id *)(a1 + 88));
    v73 = *(id *)(a1 + 72);
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v57, v13, 0, v72);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributes:", 2);
    v18 = (void *)MEMORY[0x1E0DC39D0];
    v87[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", &stru_1E777DEE8, 0, 0, 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0DC39D0];
    v86[0] = v58;
    v86[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuWithTitle:image:identifier:options:children:", v56, v4, 0, 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v23);
    objc_msgSend(v3, "addObject:", v20);

    objc_destroyWeak(&v74);
LABEL_16:

  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E777DEE8, 0, 0, 1, v3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v81);
  return v51;
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(id *a1)
{
  void *v2;
  id *WeakRetained;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  -[PKMathContextMenuController drawing](WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[4], "count"))
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", a1[4], v4);
    objc_msgSend(v6, "serializeTransiently");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("com.apple.drawing"));

  }
  if (objc_msgSend(a1[5], "length"))
  {
    objc_msgSend(a1[5], "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItems:", v11);

  }
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "serializeTransiently");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.drawing"));

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, v7);

  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v9);

  }
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  id v5;
  void *v6;
  id *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
    v4 = objc_loadWeakRetained(WeakRetained + 6);
  else
    v4 = 0;
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuController:removeResultForItemUUID:", v5, v6);

}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  id v5;
  void *v6;
  id *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
    v4 = objc_loadWeakRetained(WeakRetained + 6);
  else
    v4 = 0;
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuController:solveItemUUID:", v5, v6);

}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  id v5;
  id *v6;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
    v4 = objc_loadWeakRetained(WeakRetained + 6);
  else
    v4 = 0;
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "contextMenuController:dismissErrorForItem:token:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  id v5;
  void *v6;
  id *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
    v4 = objc_loadWeakRetained(WeakRetained + 6);
  else
    v4 = 0;
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuController:addGraphForItemUUID:addToExisting:", v5, v6, 0);

}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  id v5;
  void *v6;
  id *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
    v4 = objc_loadWeakRetained(WeakRetained + 6);
  else
    v4 = 0;
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuController:addGraphForItemUUID:addToExisting:", v5, v6, 1);

}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKMathRecognitionItem *v11;
  void *v12;
  _BOOL4 v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSString *v28;
  id v29;
  _QWORD *v30;
  void *v31;
  UIView **p_view;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  PKMathContextMenuPreviewView *v39;
  uint64_t v40;
  PKMathContextMenuPreviewView *v41;
  PKMathContextMenuPreviewView *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double MidX;
  id v80;
  void *v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  double MaxX;
  double v89;
  double v90;
  double v91;
  double v92;
  id v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  double MaxY;
  double v103;
  double v104;
  CGFloat MidY;
  CGFloat v106;
  CGFloat v107;
  double v108;
  double v109;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  double v114;
  id v115;
  id v116;
  id v117;
  id v118;
  void *v119;
  double v121;
  double v122;
  CGRect v123;
  double v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  CGAffineTransform v129;
  CGAffineTransform v130;
  _QWORD v131[2];
  _QWORD v132[4];
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;

  v132[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self)
  {
    v11 = 0;
    goto LABEL_39;
  }
  v11 = self->_mathItem;
  if (!v11
    || (-[PKMathContextMenuController drawing]((id *)&self->super.isa),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = -[PKMathRecognitionItem isValidForDrawing:](v11, "isValidForDrawing:", v12),
        v12,
        !v13))
  {
    self = 0;
    goto LABEL_39;
  }
  v126 = v9;
  v127 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKMathRecognitionItem uuid](v11, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contextMenuController:imageForItemUUID:", self, v15);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_errorString)
  {
    v131[0] = *MEMORY[0x1E0DC1138];
    +[PKMathContextMenuPreviewView footnoteBoldFont](PKMathContextMenuPreviewView, "footnoteBoldFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = v16;
    v131[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v132[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), self->_errorString);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageWithTintColor:renderingMode:", v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v23);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(v25, "appendAttributedString:", v24);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v19, v18);
    objc_msgSend(v25, "appendAttributedString:", v26);

    v27 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v27, "setAttributedText:", v25);
    objc_msgSend(v27, "setTextAlignment:", 1);
    objc_msgSend(v27, "setNumberOfLines:", 1);
    objc_msgSend(v27, "sizeToFit");

    v28 = self->_errorString;
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v27 = 0;
  }
  if ((self->_mode | 2) != 2)
  {
    v30 = 0;
    goto LABEL_13;
  }
  v29 = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKMathRecognitionItem uuid](v11, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contextMenuController:resultAttributionForItemUUID:", self, v31);
  v30 = (_QWORD *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_13:
  p_view = &self->_view;
  v33 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v33, "traitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceStyle");

  if (v30)
  {
    v36 = 1;
    if (v35 == 2)
      v36 = 2;
    v37 = (void *)v30[v36];
  }
  else
  {
    v37 = 0;
  }
  v38 = v37;
  v39 = [PKMathContextMenuPreviewView alloc];
  if (v30)
    v40 = v30[4];
  else
    v40 = 0;
  v41 = -[PKMathContextMenuPreviewView initWithImage:label:attributionImage:lastRefreshDate:](v39, "initWithImage:label:attributionImage:lastRefreshDate:", v128, v27, v38, v40);
  v42 = v41;
  if (v41)
  {
    v125 = v38;
    -[PKMathContextMenuPreviewView bounds](v41, "bounds");
    v44 = v43;
    v46 = v45;
    memset(&v130, 0, sizeof(v130));
    v47 = objc_loadWeakRetained((id *)&self->_delegate);
    v48 = v47;
    if (v47)
      objc_msgSend(v47, "contextMenuControllerDrawingTransform:", self);
    else
      memset(&v130, 0, sizeof(v130));
    v121 = v46;
    v122 = v44;

    x = self->_tapBounds.origin.x;
    y = self->_tapBounds.origin.y;
    width = self->_tapBounds.size.width;
    height = self->_tapBounds.size.height;
    v133.origin.x = x;
    v133.origin.y = y;
    v133.size.width = width;
    v133.size.height = height;
    if (CGRectIsNull(v133))
    {
      -[PKMathRecognitionItem bounds](v11, "bounds");
      x = v53;
      y = v54;
      width = v55;
      height = v56;
    }
    v123.origin.x = x;
    v123.origin.y = y;
    v123.size.width = width;
    v123.size.height = height;
    -[PKMathRecognitionItem bounds](v11, "bounds");
    v57 = v134.origin.x;
    v58 = v134.origin.y;
    v59 = v134.size.width;
    v60 = v134.size.height;
    v129 = v130;
    v135 = CGRectApplyAffineTransform(v134, &v129);
    v61 = v135.origin.x;
    v62 = v135.origin.y;
    v63 = v135.size.width;
    v64 = v135.size.height;
    v65 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v65, "convertRect:toView:", 0, v61, v62, v63, v64);
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;

    v74 = -[PKMathRecognitionItem isVerticalExpression](v11, "isVerticalExpression");
    v75 = v67;
    v76 = v69;
    v77 = v71;
    v78 = v73;
    if (v74)
    {
      MidX = CGRectGetMidX(*(CGRect *)&v75);
      v80 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v80, "window");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "bounds");
      v83 = v82 * 0.5;

      v84 = v57;
      v85 = v58;
      v86 = v59;
      v87 = v60;
      if (MidX <= v83)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v84);
        v89 = 1.0;
        v91 = 0.0;
        v90 = v122;
      }
      else
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v84);
        v89 = -1.0;
        v90 = v122;
        v91 = v122;
      }
      v104 = v121;
      MidY = CGRectGetMidY(v123);
      v106 = v130.tx + MidY * v130.c + v130.a * MaxX;
      v107 = v130.ty + MidY * v130.d + v130.b * MaxX;
      v108 = v106 + v89 * 8.0 - v91;
      v109 = v107 + v121 * -0.5;
    }
    else
    {
      v92 = CGRectGetMidY(*(CGRect *)&v75);
      v93 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v93, "window");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "bounds");
      v96 = v95 * 0.5;

      v97 = CGRectGetMidX(v123);
      v124 = v92;
      v98 = v57;
      v99 = v58;
      v100 = v59;
      v101 = v60;
      if (v92 < v96)
      {
        MaxY = CGRectGetMaxY(*(CGRect *)&v98);
        v103 = 1.0;
      }
      else
      {
        MaxY = CGRectGetMinY(*(CGRect *)&v98);
        v103 = -1.0;
      }
      v104 = v121;
      v90 = v122;
      v110 = v130.tx + MaxY * v130.c + v130.a * v97;
      v111 = v130.ty + MaxY * v130.d + v130.b * v97 + v103 * 8.0;
      v108 = v110 + v122 * -0.5;
      v112 = 0.0;
      if (v124 >= v96)
        v112 = -1.0;
      v109 = v111 + v121 * v112;
    }
    -[PKMathContextMenuPreviewView setFrame:](v42, "setFrame:", v108, v109, v90, v104);
    v136.origin.x = v108;
    v136.origin.y = v109;
    v136.size.width = v90;
    v136.size.height = v104;
    v113 = CGRectGetMidX(v136);
    v137.origin.x = v108;
    v137.origin.y = v109;
    v137.size.width = v90;
    v137.size.height = v104;
    v114 = CGRectGetMidY(v137);
    v115 = objc_alloc(MEMORY[0x1E0DC3D90]);
    v116 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v117 = objc_alloc(MEMORY[0x1E0DC3B88]);
    v118 = objc_loadWeakRetained((id *)p_view);
    v119 = (void *)objc_msgSend(v117, "initWithContainer:center:", v118, v113, v114);
    self = (PKMathContextMenuController *)objc_msgSend(v115, "initWithView:parameters:target:", v42, v116, v119);

    v38 = v125;
  }
  else
  {
    self = 0;
  }

  v9 = v126;
  v8 = v127;
LABEL_39:

  return self;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PKMathContextMenuController *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__PKMathContextMenuController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E7777C20;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(a5, "addCompletion:", v9);

}

void __87__PKMathContextMenuController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeInteraction:", *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v5 = 0;
    WeakRetained = 0;
  }
  v6 = WeakRetained;
  objc_msgSend(WeakRetained, "contextMenuControllerDidFinish:", v5);

}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_mathToken, 0);
  objc_storeStrong((id *)&self->_mathItem, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
