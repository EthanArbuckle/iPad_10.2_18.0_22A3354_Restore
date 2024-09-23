@implementation BCSAlertController

- (id)_createHeaderViewControllerWithAction:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "defaultActionTargetApplicationBundleIdentifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    objc_msgSend(v4, "urlThatCanBeOpened");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {

      v5 = CFSTR("com.apple.barcodescanner.text-only");
    }
  }
  -[BCSAlertController _createHeaderViewControllerWithAppIdentifier:](self, "_createHeaderViewControllerWithAppIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createHeaderViewControllerWithAppIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t (*v15)(void *);
  CGImage *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  _QWORD v66[5];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[14];

  v71[12] = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  v58 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  objc_msgSend(v58, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.barcodescanner.icloud")))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("iCloud"), v60);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    _BCSLocalizedString();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.barcodescanner.invalid-data.qr")))
    goto LABEL_4;
  if (objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.barcodescanner.invalid-data.appclip")))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("Viewfinder-20"), v60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    _BCSLocalizedString();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.barcodescanner.text-only")))
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("QRCode-20"), v60);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:", 0, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      _BCSLocalizedString();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    if (objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.barcodescanner.wifi")))
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("Wi-Fi-20"), v60);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_applicationIconImageForFormat:precomposed:", 0, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      MGGetBoolAnswer();
      _BCSLocalizedString();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForIdentifier:", v61);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = *(double *)&screenScale_scale;
      if (*(double *)&screenScale_scale == 0.0)
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scale");
        screenScale_scale = v11;

        v9 = *(double *)&screenScale_scale;
      }
      if (v9 == 2.0)
        v12 = 17;
      else
        v12 = 4;
      if (v9 == 3.0)
        v13 = 34;
      else
        v13 = v12;
      objc_msgSend(v8, "iconDataForVariant:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v67 = 0;
        v68 = &v67;
        v69 = 0x2020000000;
        v15 = (uint64_t (*)(void *))getLICreateIconFromCachedBitmapSymbolLoc_ptr;
        v70 = getLICreateIconFromCachedBitmapSymbolLoc_ptr;
        if (!getLICreateIconFromCachedBitmapSymbolLoc_ptr)
        {
          v66[0] = MEMORY[0x24BDAC760];
          v66[1] = 3221225472;
          v66[2] = __getLICreateIconFromCachedBitmapSymbolLoc_block_invoke;
          v66[3] = &unk_250863E58;
          v66[4] = &v67;
          __getLICreateIconFromCachedBitmapSymbolLoc_block_invoke((uint64_t)v66);
          v15 = (uint64_t (*)(void *))v68[3];
        }
        _Block_object_dispose(&v67, 8);
        if (!v15)
          -[BCSAlertController _createHeaderViewControllerWithAppIdentifier:].cold.1();
        v16 = (CGImage *)v15(v14);
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v16, 0, v9);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v63 = 0;
        }
        CGImageRelease(v16);
      }
      else
      {
        v63 = 0;
      }

      objc_msgSend(v8, "localizedName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uppercaseString");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_28:
  if (v63)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v63);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v18, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v65, "addSubview:", v18);
    if (objc_msgSend(v62, "length"))
    {
      v64 = objc_alloc_init(MEMORY[0x24BEBD708]);
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setFont:", v19);

      objc_msgSend(v64, "setText:", v62);
      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setTextColor:", v20);

      objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v64, "setAdjustsFontSizeToFitWidth:", 1);
      objc_msgSend(v65, "addSubview:", v64);
      -[BCSAlertController _createSeparatorView](self, "_createSeparatorView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addSubview:", v59);
      v32 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v18, "leadingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "leadingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 16.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v55;
      objc_msgSend(v18, "centerYAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "centerYAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v53);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v52;
      objc_msgSend(v18, "heightAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToConstant:", 20.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v71[2] = v50;
      objc_msgSend(v18, "widthAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "heightAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v48);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v71[3] = v47;
      objc_msgSend(v64, "leadingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 8.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v71[4] = v44;
      objc_msgSend(v64, "trailingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "trailingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v71[5] = v41;
      objc_msgSend(v64, "centerYAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "centerYAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:", v39);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v71[6] = v38;
      objc_msgSend(v65, "heightAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToConstant:", 52.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v71[7] = v36;
      objc_msgSend(v59, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v34);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v71[8] = v33;
      objc_msgSend(v59, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v71[9] = v23;
      objc_msgSend(v59, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v71[10] = v26;
      objc_msgSend(v59, "heightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _bcs_pixelLength();
      objc_msgSend(v27, "constraintEqualToConstant:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v71[11] = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v29);

      v30 = v58;
    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)_createSeparatorView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1200);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBDAF0], "_effectForBlurEffect:vibrancyStyle:", v2, 120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v3);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (id)_createPreviewControllerWithText:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[11];

  v49[9] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BEBDB08];
  v5 = a3;
  v26 = objc_alloc_init(v4);
  objc_msgSend(v26, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSAlertController _createSeparatorView](self, "_createSeparatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:");
  v8 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  objc_msgSend(v8, "setText:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "setDataDetectorTypes:", -1);
  objc_msgSend(v8, "setEditable:", 0);
  objc_msgSend(v8, "setScrollEnabled:", 0);
  objc_msgSend(v8, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v11);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v8, "linkTextAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "blueColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v14;
  objc_msgSend(v14, "setValue:forKey:", v15, *MEMORY[0x24BEBB368]);

  objc_msgSend(v14, "setValue:forKey:", &unk_250869960, *MEMORY[0x24BEBB440]);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLinkTextAttributes:", v16);

  objc_msgSend(v6, "addSubview:", v8);
  v35 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v7, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  _bcs_pixelLength();
  objc_msgSend(v47, "constraintEqualToConstant:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v46;
  objc_msgSend(v7, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v42;
  v44 = v7;
  objc_msgSend(v7, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v39;
  objc_msgSend(v7, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v36;
  objc_msgSend(v8, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v32;
  objc_msgSend(v8, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v30, 20.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v29;
  objc_msgSend(v8, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:constant:", v27, -20.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v17;
  objc_msgSend(v8, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v20;
  objc_msgSend(v8, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v24);

  return v26;
}

- (id)_createPreviewControllerForDataDetectionActionPickerItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "icsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDC74E8]);
    v15[0] = CFSTR("ICS");
    v15[1] = CFSTR("NotificationStyle");
    v16[0] = v3;
    v16[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DDUIEventForResults();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BDC7610]);
    objc_msgSend(v6, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:", v7, v6, v7, v9);

    v14 = 0;
    v11 = objc_msgSend(v4, "removeEvent:span:error:", v6, 0, &v14);
    v12 = v14;
    if ((v11 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BCSAlertController _createPreviewControllerForDataDetectionActionPickerItem:].cold.1(v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_configurePopoverPresentationControllerForAlertController:(id)a3 fromViewController:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v5 = a4;
  objc_msgSend(a3, "popoverPresentationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSourceView:", v6);
  objc_msgSend(v6, "center");
  v8 = v7;
  objc_msgSend(v6, "size");
  objc_msgSend(v9, "setSourceRect:", v8);
  objc_msgSend(v9, "setPermittedArrowDirections:", 0);

}

- (void)_addActionForHandlingAlertDismissal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  if (_bcs_deviceIsPad())
  {
    v5 = (void *)MEMORY[0x24BEBD3A8];
    _BCSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__BCSAlertController__addActionForHandlingAlertDismissal___block_invoke;
    v8[3] = &unk_250863DE0;
    v8[4] = self;
    objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v7);

  }
}

void __58__BCSAlertController__addActionForHandlingAlertDismissal___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "alertControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)showActionPickerViewForAction:(id)a3 fromViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id WeakRetained;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  id v50;
  _QWORD v52[4];
  id v53;
  BCSAlertController *v54;
  _QWORD v55[4];
  id v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  BCSAlertController *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v9)
        -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
      goto LABEL_29;
    }
    v50 = objc_alloc_init(MEMORY[0x24BEBD3B0]);
    objc_msgSend(v50, "setPreferredStyle:", 0);
    -[BCSAlertController _createHeaderViewControllerWithAction:](self, "_createHeaderViewControllerWithAction:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionPickerItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = v7;
    v46 = (void *)v27;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[BCSAlertController _createPreviewControllerForDataDetectionActionPickerItem:](self, "_createPreviewControllerForDataDetectionActionPickerItem:", v27), (v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v29 = v28;
      v30 = 0;
    }
    else
    {
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_2564541F0))
      {
        objc_msgSend(v5, "extraPreviewText");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      if (!objc_msgSend(v30, "length"))
      {
        v44 = 0;
        v45 = v30;
        goto LABEL_19;
      }
      -[BCSAlertController _createPreviewControllerWithText:](self, "_createPreviewControllerWithText:", v30);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v44 = (void *)v29;
    v45 = v30;
    if (v29 && v25)
    {
      objc_msgSend(v50, "_setHeaderContentViewController:", v25, v29, v30, v27);
      objc_msgSend(v50, "setContentViewController:", v29);
LABEL_21:
      v48 = v5;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v26;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      v34 = MEMORY[0x24BDAC760];
      if (v33)
      {
        v35 = v33;
        v36 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v63 != v36)
              objc_enumerationMutation(obj);
            v38 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_msgSend(v38, "label", v44);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v58[0] = v34;
            v58[1] = 3221225472;
            v58[2] = __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke;
            v58[3] = &unk_2508639C0;
            v59 = WeakRetained;
            v60 = self;
            v61 = v38;
            v55[0] = v34;
            v55[1] = 3221225472;
            v55[2] = __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_2;
            v55[3] = &unk_250863E08;
            v56 = v59;
            v57 = v38;
            objc_msgSend(v50, "_addActionWithTitle:style:handler:shouldDismissHandler:", v39, 0, v58, v55);

          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        }
        while (v35);
      }

      v40 = (void *)MEMORY[0x24BEBD3A8];
      _BCSLocalizedString();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v34;
      v52[1] = 3221225472;
      v52[2] = __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_3;
      v52[3] = &unk_250863E30;
      v53 = WeakRetained;
      v54 = self;
      v42 = WeakRetained;
      objc_msgSend(v40, "actionWithTitle:style:handler:", v41, 1, v52);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addAction:", v43);

      v7 = v47;
      -[BCSAlertController _configurePopoverPresentationControllerForAlertController:fromViewController:](self, "_configurePopoverPresentationControllerForAlertController:fromViewController:", v50, v47);
      objc_msgSend(v47, "presentViewController:animated:completion:", v50, 1, 0);

      v5 = v48;
      goto LABEL_29;
    }
LABEL_19:
    if (v25)
    {
      objc_msgSend(v50, "_setHeaderContentViewController:", v25, v44, v45, v27);
      objc_msgSend(v5, "localizedDefaultActionDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setMessage:", v31);

    }
    goto LABEL_21;
  }
  v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v17)
    -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_29:

}

uint64_t __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 32), "alertController:didSelectActionItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 48), "performAction");
}

uint64_t __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return 1;
  else
    return objc_msgSend(*(id *)(a1 + 40), "shouldDismissAlertWhenActionIsTaken");
}

void *__71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_3(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "alertControllerDidCancel:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)showFirstTimePromptToOpenApp:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (v7)
    {
      objc_msgSend(v7, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v9)
          -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      else
      {
        v33 = objc_alloc_init(MEMORY[0x24BEBD3B0]);
        objc_msgSend(v33, "setPreferredStyle:", 0);
        -[BCSAlertController _createHeaderViewControllerWithAppIdentifier:](self, "_createHeaderViewControllerWithAppIdentifier:", v6);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_setHeaderContentViewController:", v46);
        objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForIdentifier:", v6);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x24BDD17C8];
        _BCSLocalizedString();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setMessage:", v37);

        v38 = (void *)MEMORY[0x24BEBD3A8];
        _BCSLocalizedString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = MEMORY[0x24BDAC760];
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke;
        v48[3] = &unk_250863DE0;
        v48[4] = self;
        objc_msgSend(v38, "actionWithTitle:style:handler:", v39, 0, v48);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAction:", v41);

        v42 = (void *)MEMORY[0x24BEBD3A8];
        _BCSLocalizedString();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v40;
        v47[1] = 3221225472;
        v47[2] = __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke_2;
        v47[3] = &unk_250863DE0;
        v47[4] = self;
        objc_msgSend(v42, "actionWithTitle:style:handler:", v43, 0, v47);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAction:", v44);

        -[BCSAlertController _addActionForHandlingAlertDismissal:](self, "_addActionForHandlingAlertDismissal:", v33);
        -[BCSAlertController _configurePopoverPresentationControllerForAlertController:fromViewController:](self, "_configurePopoverPresentationControllerForAlertController:fromViewController:", v33, v7);
        objc_msgSend(v7, "presentViewController:animated:completion:", v33, 1, 0);

      }
    }
    else
    {
      v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v25)
        -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  else
  {
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v17)
      -[BCSAlertController showFirstTimePromptToOpenApp:fromViewController:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
  }

}

void __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "alertControllerDidAllow:", *(_QWORD *)(a1 + 32));

}

void __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "alertControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)showICloudSignInPromptWithTitle:(id)a3 message:(id)a4 fromViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      v29 = objc_alloc_init(MEMORY[0x24BEBD3B0]);
      objc_msgSend(v29, "setPreferredStyle:", 0);
      -[BCSAlertController _createHeaderViewControllerWithAppIdentifier:](self, "_createHeaderViewControllerWithAppIdentifier:", CFSTR("com.apple.barcodescanner.icloud"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_setHeaderContentViewController:", v30);

      objc_msgSend(v29, "setMessage:", v9);
      v31 = (void *)MEMORY[0x24BEBD3A8];
      _BCSLocalizedString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = MEMORY[0x24BDAC760];
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke;
      v39[3] = &unk_250863DE0;
      v39[4] = self;
      objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 0, v39);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addAction:", v34);

      v35 = (void *)MEMORY[0x24BEBD3A8];
      _BCSLocalizedString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v33;
      v38[1] = 3221225472;
      v38[2] = __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke_2;
      v38[3] = &unk_250863DE0;
      v38[4] = self;
      objc_msgSend(v35, "actionWithTitle:style:handler:", v36, 0, v38);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addAction:", v37);

      -[BCSAlertController _addActionForHandlingAlertDismissal:](self, "_addActionForHandlingAlertDismissal:", v29);
      -[BCSAlertController _configurePopoverPresentationControllerForAlertController:fromViewController:](self, "_configurePopoverPresentationControllerForAlertController:fromViewController:", v29, v11);
      objc_msgSend(v11, "presentViewController:animated:completion:", v29, 1, 0);

    }
  }
  else
  {
    v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v21)
      -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
  }

}

void __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "alertControllerDidAllow:", *(_QWORD *)(a1 + 32));

}

void __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "alertControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)showInvalidDataAlertForAction:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v10)
        -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      v26 = objc_alloc_init(MEMORY[0x24BEBD3B0]);
      objc_msgSend(v26, "setPreferredStyle:", 0);
      if (objc_msgSend(v6, "codeType") == 3)
        v27 = CFSTR("com.apple.barcodescanner.invalid-data.appclip");
      else
        v27 = CFSTR("com.apple.barcodescanner.invalid-data.qr");
      -[BCSAlertController _createHeaderViewControllerWithAppIdentifier:](self, "_createHeaderViewControllerWithAppIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_setHeaderContentViewController:", v28);

      objc_msgSend(v6, "localizedDefaultActionDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMessage:", v29);

      v30 = (void *)MEMORY[0x24BEBD3A8];
      _BCSLocalizedString();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __71__BCSAlertController_showInvalidDataAlertForAction_fromViewController___block_invoke;
      v33[3] = &unk_250863DE0;
      v33[4] = self;
      objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 1, v33);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addAction:", v32);

      -[BCSAlertController _configurePopoverPresentationControllerForAlertController:fromViewController:](self, "_configurePopoverPresentationControllerForAlertController:fromViewController:", v26, v8);
      objc_msgSend(v8, "presentViewController:animated:completion:", v26, 1, 0);

    }
  }
  else
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }

}

void __71__BCSAlertController_showInvalidDataAlertForAction_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "alertControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)showErrorExplanationForAction:(id)a3 error:(id)a4 fromViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  id WeakRetained;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      objc_msgSend(v9, "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE0BA40]);

      if ((v30 & 1) != 0)
      {
        WeakRetained = objc_alloc_init(MEMORY[0x24BEBD3B0]);
        objc_msgSend(WeakRetained, "setPreferredStyle:", 0);
        switch(objc_msgSend(v9, "code"))
        {
          case 0:
          case 1:
          case 2:
          case 3:
            _BCSLocalizedString();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            v32 = 0;
            break;
        }
        objc_msgSend(v8, "defaultActionTargetApplicationBundleIdentifier");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!-[__CFString length](v33, "length")
          && objc_msgSend(v8, "conformsToProtocol:", &unk_2564541F0)
          && objc_msgSend(v8, "isWiFiAction"))
        {

          v33 = CFSTR("com.apple.barcodescanner.wifi");
        }
        -[BCSAlertController _createHeaderViewControllerWithAppIdentifier:](self, "_createHeaderViewControllerWithAppIdentifier:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_setHeaderContentViewController:", v34);

        objc_msgSend(WeakRetained, "setMessage:", v32);
        v35 = (void *)MEMORY[0x24BEBD3A8];
        _BCSLocalizedString();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __77__BCSAlertController_showErrorExplanationForAction_error_fromViewController___block_invoke;
        v38[3] = &unk_250863DE0;
        v38[4] = self;
        objc_msgSend(v35, "actionWithTitle:style:handler:", v36, 1, v38);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "addAction:", v37);

        -[BCSAlertController _configurePopoverPresentationControllerForAlertController:fromViewController:](self, "_configurePopoverPresentationControllerForAlertController:fromViewController:", WeakRetained, v11);
        objc_msgSend(v11, "presentViewController:animated:completion:", WeakRetained, 1, 0);

      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "alertControllerDidCancel:", self);
      }

    }
  }
  else
  {
    v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v21)
      -[BCSAlertController showActionPickerViewForAction:fromViewController:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
  }

}

void __77__BCSAlertController_showErrorExplanationForAction_error_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "alertControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (BCSAlertControllerDelegate)delegate
{
  return (BCSAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_createHeaderViewControllerWithAppIdentifier:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImageRef _LICreateIconFromCachedBitmap(CFDataRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSAlertController.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_createPreviewControllerForDataDetectionActionPickerItem:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_236DE2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSAlertController: failed to remove event %{public}@", (uint8_t *)&v2, 0xCu);

}

- (void)showActionPickerViewForAction:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSAlertController: No presenting view controller is specified", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)showActionPickerViewForAction:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSAlertController: Host view controller is already presenting a view.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)showFirstTimePromptToOpenApp:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236DE2000, MEMORY[0x24BDACB70], a3, "BCSAlertController: No app identifier", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
