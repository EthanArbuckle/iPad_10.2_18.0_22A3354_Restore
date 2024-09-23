@implementation BKUIJindoBottomContainer

- (void)setupInitialUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIJindoBottomContainer;
  -[BKUIPearlEnrollViewBottomContainer setupInitialUI](&v7, sel_setupInitialUI);
  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionDelegate:", self);

  -[BKUIPearlEnrollViewBottomContainer offScreenScrollview](self, "offScreenScrollview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionDelegate:", self);

}

- (void)_updateButtonVisibilityForScrollView:(id)a3 state:(int)a4 subState:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
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
  double v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v46 = a3;
  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_nextStateButtonTitleForState:subState:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state");

  if (v9)
    v12 = v11 != 2;
  else
    v12 = 0;
  if (v11 == 2 && v9)
  {
    -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentOperationHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "canStartEnrollmentOperation");

  }
  objc_msgSend(v46, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nextStateButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v12);

  objc_msgSend(v46, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  switch((int)v6)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      objc_msgSend(v17, "topLinkButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAlpha:", 0.0);

      objc_msgSend(v18, "nextStateButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAlpha:", (double)v12);

      objc_msgSend(v18, "bottomLinkButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 0.0;
      goto LABEL_15;
    case 3:
    case 4:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "state") == 3)
      {
        -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "currentOperationHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "shouldShowRetryUI");

      }
      else
      {
        v27 = 0;
      }

      objc_msgSend(v18, "topLinkButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_1EA281248, CFSTR("Pearl-periocular"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTitle:forState:", v40, 0);

        objc_msgSend(v18, "bottomLinkButton");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_1EA281248, CFSTR("Pearl-periocular"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setTitle:forState:", v43, 0);

        objc_msgSend(v22, "setAlpha:", 1.0);
      }
      else
      {
        -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAlpha:", (double)objc_msgSend(v44, "inBuddy"));

      }
      objc_msgSend(v18, "nextStateButton");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAlpha:", (double)v12);

      objc_msgSend(v18, "bottomLinkButton");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAlpha:", 1.0);
      goto LABEL_23;
    case 5:
    case 7:
      objc_msgSend(v17, "topLinkButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAlpha:", 1.0);

      objc_msgSend(v18, "nextStateButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAlpha:", 0.0);

      goto LABEL_14;
    case 8:
      objc_msgSend(v17, "topLinkButton");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAlpha:", 0.0);

      objc_msgSend(v18, "nextStateButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAlpha:", (double)v12);

      objc_msgSend(v18, "bottomLinkButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "currentOperationHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "glassesFound");
      goto LABEL_17;
    case 9:
      objc_msgSend(v17, "topLinkButton");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAlpha:", 0.0);

      objc_msgSend(v18, "nextStateButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAlpha:", (double)v12);

LABEL_14:
      objc_msgSend(v18, "bottomLinkButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 1.0;
LABEL_15:
      objc_msgSend(v21, "setAlpha:", v23);
      goto LABEL_24;
    case 10:
      objc_msgSend(v17, "topLinkButton");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAlpha:", 0.0);

      objc_msgSend(v18, "nextStateButton");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAlpha:", (double)v12);

      objc_msgSend(v18, "bottomLinkButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "currentOperationHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "showAddGlassesButton");
LABEL_17:
      objc_msgSend(v22, "setAlpha:", (double)v34);

LABEL_23:
LABEL_24:

      break;
    default:
      break;
  }
  -[BKUIPearlEnrollViewBottomContainer _updateButtonLayoutForScrollView:](self, "_updateButtonLayoutForScrollView:", v46);

}

- (void)buttonSelectedWithButtonTrayPosition:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  switch(a3)
  {
    case 3:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIJindoBottomContainer escapeHatchButtonForState:](self, "escapeHatchButtonForState:", objc_msgSend(v8, "state"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollViewBottomContainer buttonTray](self, "buttonTray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomLinkButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 != v11)
      {
        objc_msgSend(v12, "cancelEnroll");
        goto LABEL_11;
      }
LABEL_10:
      objc_msgSend(v12, "escapeHatchButtonPressed");
      goto LABEL_11;
    case 2:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nextStateButtonPressed:", self);
      goto LABEL_11;
    case 1:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIJindoBottomContainer escapeHatchButtonForState:](self, "escapeHatchButtonForState:", objc_msgSend(v4, "state"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollViewBottomContainer buttonTray](self, "buttonTray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topLinkButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 != v7)
      {
        objc_msgSend(v12, "retryPressed");
LABEL_11:

        return;
      }
      goto LABEL_10;
  }
}

- (id)escapeHatchButtonForState:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 > 0xA)
  {
    v5 = 0;
  }
  else
  {
    if (((1 << a3) & 0x747) != 0)
    {
      -[BKUIPearlEnrollViewBottomContainer buttonTray](self, "buttonTray");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bottomLinkButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentOperationHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "shouldShowRetryUI") & 1) != 0)
      {
        -[BKUIPearlEnrollViewBottomContainer bottomLinkButton](self, "bottomLinkButton");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[BKUIPearlEnrollViewBottomContainer buttonTray](self, "buttonTray");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "topLinkButton");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v5;
}

- (BOOL)_shouldShowBottomLinkButton
{
  return 1;
}

- (BOOL)showStartOverForState:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "state") == 3)
  {
    -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentOperationHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldShowRetryUI");

    if ((v8 & 1) != 0)
      return 0;
  }
  else
  {

  }
  if (a3 <= 0xA)
    return (0x1F8u >> a3) & 1;
  else
    return 1;
}

@end
