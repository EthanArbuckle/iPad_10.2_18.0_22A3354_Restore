@implementation UIViewController(InfoButton)

- (id)generateBarcode:()InfoButton showAsQRCode:
{
  double v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGAffineTransform v14;
  CGAffineTransform v15;

  if (a4)
    v5 = 3.5;
  else
    v5 = 2.5;
  v6 = CFSTR("CICode128BarcodeGenerator");
  if (a4)
    v6 = CFSTR("CIQRCodeGenerator");
  v7 = v6;
  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:forKey:", v8, CFSTR("inputMessage"));
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v5, v5);
  objc_msgSend(v9, "outputImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  objc_msgSend(v10, "imageByApplyingTransform:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCIImage:", v11);
  return v12;
}

- (id)_deviceInformation
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBSGestaltEquipmentInfo CurrentEquipmentInfo](CBSGestaltEquipmentInfo, "CurrentEquipmentInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serialNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "serialNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CBSDeviceInformationField fieldWithFormat:value:](CBSDeviceInformationField, "fieldWithFormat:value:", 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v4);

  }
  objc_msgSend(v1, "meid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v1, "meid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CBSDeviceInformationField fieldWithFormat:value:](CBSDeviceInformationField, "fieldWithFormat:value:", 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v7);

  }
  objc_msgSend(v1, "imeiArray");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v1, "imeiArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v1, "imeiArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(";"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[CBSDeviceInformationField fieldWithFormat:value:](CBSDeviceInformationField, "fieldWithFormat:value:", 2, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "addObject:", v14);

    }
  }
  v15 = (void *)objc_msgSend(v0, "copy");

  return v15;
}

- (id)_deviceInformationView
{
  unint64_t v2;
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  id obj;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = 0x24BDF6000uLL;
  v3 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setAxis:", 1);
  objc_msgSend(v4, "setAlignment:", 3);
  objc_msgSend(v4, "setDistribution:", 3);
  objc_msgSend(v4, "setSpacing:", 20.0);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(a1, "_deviceInformation");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v38)
  {
    v36 = *(_QWORD *)v44;
    v37 = v4;
    v31 = a1;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v7 = objc_alloc_init(*(Class *)(v2 + 3536));
        objc_msgSend(v7, "setAxis:", 1);
        objc_msgSend(v7, "setAlignment:", 3);
        objc_msgSend(v7, "setDistribution:", 3);
        v8 = objc_alloc_init(MEMORY[0x24BDF6B68]);
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 20.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFont:", v9);

        objc_msgSend(v6, "formattedTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v10);

        objc_msgSend(v7, "addArrangedSubview:", v8);
        if (objc_msgSend(v6, "multiLineFormatted"))
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v6, "formattedValuesArray");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v12)
          {
            v13 = v12;
            v33 = v6;
            v34 = v8;
            v35 = i;
            v14 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v40 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
                v17 = objc_alloc_init(MEMORY[0x24BDF6B68]);
                objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 20.0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setFont:", v18);

                objc_msgSend(v17, "setText:", v16);
                objc_msgSend(v7, "addArrangedSubview:", v17);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v13);
            a1 = v31;
            v2 = 0x24BDF6000;
            v4 = v37;
            v8 = v34;
            i = v35;
            v6 = v33;
          }
          else
          {
            v4 = v37;
          }
        }
        else
        {
          v11 = objc_alloc_init(MEMORY[0x24BDF6B68]);
          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 20.0);
          v19 = v2;
          v20 = a1;
          v21 = v6;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFont:", v22);

          objc_msgSend(v21, "formattedValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setText:", v23);

          v6 = v21;
          a1 = v20;
          v2 = v19;
          v4 = v37;
          objc_msgSend(v7, "addArrangedSubview:", v11);
        }

        objc_msgSend(v4, "addArrangedSubview:", v7);
        if (!objc_msgSend(v6, "format"))
        {
          v24 = v8;
          objc_msgSend(v6, "formattedValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "generateBarcode:showAsQRCode:", v25, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v26);
            objc_msgSend(v27, "setTag:", 1);
            objc_msgSend(v27, "setUserInteractionEnabled:", 1);
            v28 = i;
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", a1, sel_barcodeViewTapped_);
            objc_msgSend(v29, "setNumberOfTapsRequired:", 2);
            objc_msgSend(v27, "addGestureRecognizer:", v29);
            objc_msgSend(v4, "addArrangedSubview:", v27);

            i = v28;
          }

          v8 = v24;
          v2 = 0x24BDF6000;
        }

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v38);
  }

  return v4;
}

- (void)setupInfoButton
{
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  objc_msgSend(a1, "_deviceInformationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setDeviceInformationView:", v2);

  objc_msgSend(MEMORY[0x24BDF6888], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("info.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  objc_msgSend(v3, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 0.0);

  objc_msgSend(v3, "setContentInsets:", 24.0, 24.0, 6.0, 6.0);
  objc_initWeak(&location, a1);
  v6 = (void *)MEMORY[0x24BDF6880];
  v7 = (void *)MEMORY[0x24BDF67B8];
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __47__UIViewController_InfoButton__setupInfoButton__block_invoke;
  v16 = &unk_24FCB13C0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "actionWithHandler:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v3, v8, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setInfoButton:", v9);

  objc_msgSend(a1, "infoButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

  objc_msgSend(a1, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "infoButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_layoutDeviceInformationView
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  objc_msgSend(a1, "substitutableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v3 = v2;
  objc_msgSend(a1, "substitutableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  objc_msgSend(a1, "substitutableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  objc_msgSend(a1, "deviceInformationView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  objc_msgSend(v10, "systemLayoutSizeFittingSize:", v12, *(double *)(MEMORY[0x24BDF7B88] + 8));
  v14 = v13;
  objc_msgSend(a1, "deviceInformationView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v3, v6, v9, v14);

}

- (void)infoButtonTapped:()InfoButton
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  CheckerBoardLogHandleForCategory(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22F698000, v2, OS_LOG_TYPE_DEFAULT, "[Info] button was tapped. Toggling device information…", v10, 2u);
  }

  objc_msgSend(a1, "setShowingDeviceInformation:", objc_msgSend(a1, "showingDeviceInformation") ^ 1);
  if (objc_msgSend(a1, "showingDeviceInformation"))
  {
    objc_msgSend(a1, "_layoutDeviceInformationView");
    objc_msgSend(a1, "substitutableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "deviceInformationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    objc_msgSend(a1, "substitutableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  else
  {
    objc_msgSend(a1, "deviceInformationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    objc_msgSend(a1, "substitutableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(v6, "setHidden:", v8);

}

- (void)barcodeViewTapped:()InfoButton
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  +[CBSGestaltEquipmentInfo CurrentEquipmentInfo](CBSGestaltEquipmentInfo, "CurrentEquipmentInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(v5, "setTag:", objc_msgSend(v5, "tag") == 0);
    objc_msgSend(v11, "serialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generateBarcode:showAsQRCode:", v8, objc_msgSend(v5, "tag") == 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v9);

    objc_msgSend(a1, "_layoutDeviceInformationView");
    objc_msgSend(a1, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

@end
