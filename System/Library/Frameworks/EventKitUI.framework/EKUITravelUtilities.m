@implementation EKUITravelUtilities

- (id)travelTimePopupMenuForEvent:(id)a3 selectionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  double v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "travelTime");
  v9 = v8;
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Travel time menu no travel time"), CFSTR("None"), 0);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3428];
  v13 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke;
  v35[3] = &unk_1E601C6D8;
  v14 = v6;
  v36 = v14;
  v30 = (void *)v11;
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 == 0.0)
    objc_msgSend(v15, "setState:", 1);
  v37[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1, v16);
  v17 = (char *)objc_claimAutoreleasedReturnValue();
  CalAddInlineMenuItemArrayToArray(v7, v17);

  objc_msgSend(v5, "structuredLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isStructured"))
  {
    objc_msgSend(v5, "travelStartLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "isStructured");

  }
  v31 = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 6; ++i)
  {
    v22 = *(double *)&_travelTimeDurations_0[i];
    v23 = (void *)MEMORY[0x1E0DC3428];
    CUIKDisplayStringForTravelTimeUsingShortFormat();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke_2;
    v32[3] = &unk_1E601C700;
    v25 = v14;
    v33 = v25;
    v34 = v22;
    objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v24, 0, 0, v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 == v9)
      objc_msgSend(v26, "setState:", 1);
    objc_msgSend(v20, "addObject:", v26);

  }
  CalAddInlineMenuItemArrayToArray(v7, (const char *)v20);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

uint64_t __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

@end
