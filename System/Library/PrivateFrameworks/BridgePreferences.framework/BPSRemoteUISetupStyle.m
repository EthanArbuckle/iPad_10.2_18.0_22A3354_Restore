@implementation BPSRemoteUISetupStyle

- (void)_applyToTitleLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  BPSTextColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v4);

  BPSFontWithSize(30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v5);

  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v9, "setNumberOfLines:", 1);
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);
  }

}

- (void)_applyToLabel:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  BPSTextColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

}

- (void)applyToObjectModel:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
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
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id obj;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "setNextButtonStyle:", 2);
  v76 = v3;
  objc_msgSend(v3, "allPages");
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
  if (v4)
  {
    v5 = v4;
    v83 = *(_QWORD *)v100;
    v6 = *MEMORY[0x24BDF7D80];
    v90 = *MEMORY[0x24BDF6600];
    do
    {
      v7 = 0;
      v77 = v5;
      do
      {
        if (*(_QWORD *)v100 != v83)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v7);
        if (objc_msgSend(v8, "hasWebView"))
        {
          objc_msgSend(v8, "webViewOM");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "webView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "scrollView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setDecelerationRate:", v6);

          objc_msgSend(v10, "scrollView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setIndicatorStyle:", 2);

          objc_msgSend(v10, "evaluateJavaScript:completionHandler:", CFSTR("document.body.style.webkitUserSelect='none';"),
            0);

        }
        objc_msgSend(v8, "setShowsTitlesAsHeaderViews:", 1);
        objc_msgSend(v8, "setTitleLabelPadding:", 6.0, 0.0, 14.0, 0.0);
        objc_msgSend(v8, "titleLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BPSRemoteUISetupStyle _applyToTitleLabel:](self, "_applyToTitleLabel:", v13);

        if (objc_msgSend(v8, "hasTableView"))
        {
          v81 = v8;
          v82 = v7;
          objc_msgSend(v8, "tableViewOM");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "tableView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBackgroundColor:", v16);

          objc_msgSend(v15, "setBackgroundView:", 0);
          BPSSeparatorColor();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSeparatorColor:", v17);

          v79 = v15;
          objc_msgSend(v15, "setIndicatorStyle:", 2);
          v80 = v14;
          objc_msgSend(v14, "sections");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v85 = v18;
          v87 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
          if (!v87)
            goto LABEL_36;
          v86 = *(_QWORD *)v96;
          while (1)
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v96 != v86)
                objc_enumerationMutation(v85);
              v88 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v19);
              v89 = v19;
              objc_msgSend(v88, "rows");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = 0u;
              v92 = 0u;
              v93 = 0u;
              v94 = 0u;
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v92;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v92 != v23)
                      objc_enumerationMutation(v20);
                    v25 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
                    objc_msgSend(v25, "tableCell");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "attributes");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "objectForKey:", CFSTR("class"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("label"));

                    if (v29)
                    {
                      objc_msgSend(v26, "textLabel");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      BPSForegroundColor();
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setBackgroundColor:", v31);

                      BPSTextColor();
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "setTextColor:", v32);

                      BPSFontWithSize(15.0);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "setFont:", v33);

                      objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 1);
                      objc_msgSend(v30, "setMinimumScaleFactor:", 0.70588237);
                      objc_msgSend(v26, "detailTextLabel");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      BPSTextColor();
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "setTextColor:", v35);

                      objc_msgSend(v25, "attributes");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = (void *)objc_msgSend(v36, "mutableCopy");

                      objc_msgSend(v37, "setObject:forKey:", CFSTR("white"), CFSTR("labelColor"));
                      objc_msgSend(v37, "objectForKey:", CFSTR("radioGroup"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v38)
                        objc_msgSend(v37, "setObject:forKey:", CFSTR("systemOrange"), CFSTR("radioGroupSelectedColor"));
                      objc_msgSend(v25, "setAttributes:", v37);
                      goto LABEL_26;
                    }
                    BPSForegroundColor();
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setBackgroundColor:", v39);

                    objc_msgSend(v26, "textLabel");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    BPSSetupTintColor();
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "setTextColor:", v41);

                    objc_msgSend(v26, "editableTextField");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v42)
                      goto LABEL_28;
                    objc_msgSend(v26, "editableTextField");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    BPSTextColor();
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setTextColor:", v44);

                    objc_msgSend(v26, "editableTextField");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "placeholder");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v30, "length"))
                    {
                      v103 = v90;
                      objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v104 = v46;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();

                      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v30, v37);
                      objc_msgSend(v26, "editableTextField");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "setAttributedPlaceholder:", v47);

LABEL_26:
                    }

LABEL_28:
                    v49 = objc_alloc_init(MEMORY[0x24BDF6F90]);
                    BPSCellHightlightColor();
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setBackgroundColor:", v50);

                    objc_msgSend(v26, "setSelectedBackgroundView:", v49);
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
                }
                while (v22);
              }
              objc_msgSend(v88, "footerView");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v51, "linkButton");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "titleLabel");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                BPSFontWithSize(15.0);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setFont:", v54);

              }
              objc_msgSend(v88, "headerView");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v55, "headerLabel");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "subHeaderLabel");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                -[BPSRemoteUISetupStyle _applyToLabel:](self, "_applyToLabel:", v56);
                -[BPSRemoteUISetupStyle _applyToLabel:](self, "_applyToLabel:", v57);

              }
              v19 = v89 + 1;
            }
            while (v89 + 1 != v87);
            v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
            if (!v87)
            {
LABEL_36:

              v5 = v77;
              v8 = v81;
              v7 = v82;
              v59 = v79;
              v58 = v80;
              goto LABEL_43;
            }
          }
        }
        if (objc_msgSend(v8, "hasPasscodeView"))
        {
          objc_msgSend(v8, "passcodeViewOM");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "passcodeView");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
          v62 = v8;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setBackgroundColor:", v63);

          v8 = v62;
          objc_msgSend(v62, "passcodeViewOM");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          BPSTextColor();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setForegroundColor:", v65);

          objc_msgSend(v62, "passcodeViewOM");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setKeyboardAppearance:", 1);

          objc_msgSend(v62, "containerView");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (void *)MEMORY[0x24BDF6950];
        }
        else
        {
          if (objc_msgSend(v8, "hasSpinnerView"))
          {
            objc_msgSend(v8, "spinnerViewOM");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setSpinnerColor:", v69);

          }
          objc_msgSend(v8, "containerView");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (void *)MEMORY[0x24BDF6950];
        }
        objc_msgSend(v67, "blackColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setBackgroundColor:", v59);
LABEL_43:

        objc_msgSend(v8, "toolbar");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setBarStyle:", 1);
        objc_msgSend(v70, "setTranslucent:", 0);
        objc_msgSend(v8, "leftToolbarItem");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        BPSSetupTintColor();
        v72 = v8;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setTintColor:", v73);

        objc_msgSend(v72, "rightToolbarItem");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        BPSSetupTintColor();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setTintColor:", v75);

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
    }
    while (v5);
  }

}

- (int64_t)navBarActivityIndicatorStyle
{
  return 100;
}

@end
