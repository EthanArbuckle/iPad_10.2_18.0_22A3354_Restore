@implementation LPEmailCompatibleHTMLImageComponent

- (LPEmailCompatibleHTMLImageComponent)initWithImage:(id)a3 style:(id)a4 themePath:(id)a5 generator:(id)a6
{
  id v10;
  id v11;
  id v12;
  LPEmailCompatibleHTMLImageComponent *v13;
  uint64_t v14;
  LPEmailCompatibleHTMLImageComponent *v15;
  void *v16;
  void (**v17)(void);
  uint64_t v18;
  void (**v19)(void *, const __CFString *, const __CFString *);
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  LPPointUnit *v45;
  LPPointUnit *v46;
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
  uint64_t v57;
  double v58;
  float v59;
  __CFString *v60;
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
  LPEmailCompatibleHTMLImageComponent *v72;
  id v74;
  id v75;
  void *v76;
  id v77;
  _QWORD aBlock[4];
  id v79;
  objc_super v80;

  v10 = a3;
  v77 = a4;
  v11 = a5;
  v12 = a6;
  v80.receiver = self;
  v80.super_class = (Class)LPEmailCompatibleHTMLImageComponent;
  v13 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v80, sel_initWithTagName_themePath_generator_, CFSTR("img"), v11, v12);
  v15 = v13;
  if (v13)
  {
    LPWebLock(v13, v14);
    objc_msgSend(v10, "_alternateHTMLImageGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = v11;
    if (v16)
    {
      objc_msgSend(v10, "_alternateHTMLImageGenerator");
      v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v17[2]();
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v18;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__LPEmailCompatibleHTMLImageComponent_initWithImage_style_themePath_generator___block_invoke;
    aBlock[3] = &unk_1E44A7FA8;
    v74 = v11;
    v79 = v74;
    v19 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(aBlock);
    v10 = v10;
    objc_msgSend(v10, "_remoteURLsForEmailCompatibleOutput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[LPHTMLComponent element](v15, "element");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_remoteURLsForEmailCompatibleOutput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAttribute:value:", CFSTR("src"), v25);

      -[LPHTMLComponent element](v15, "element");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_srcsetForRemoteURLs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAttribute:value:", CFSTR("srcset"), v27);
      v76 = v10;
    }
    else
    {
      v76 = v10;
      if (objc_msgSend(v77, "filter") == 4)
      {
        objc_msgSend(v77, "maskColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        flatImageWithColor(v10, v28);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[LPHTMLComponent element](v15, "element");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_URLForImage:", v76);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAttribute:value:", CFSTR("src"), v27);
    }

    -[LPHTMLComponent element](v15, "element");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "properties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "accessibilityText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAttribute:value:", CFSTR("alt"), v31);

    objc_msgSend(v77, "fixedSize");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32
      && (objc_msgSend(v77, "fixedSize"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v34 = objc_msgSend(v33, "isEmpty"),
          v33,
          v32,
          (v34 & 1) == 0))
    {
      objc_msgSend(v77, "fixedSize");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "width");
      v45 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v77, "fixedSize");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "height");
      v46 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v76, "_pixelSize");
      v36 = v35;
      v38 = v37;
      objc_msgSend(v12, "rootWidth");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "value");
      sizeFittingInsideSizeMaintainingAspectRatio(v36, v38, v40, 500.0);
      v42 = v41;
      v44 = v43;

      v45 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v42);
      v46 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v44);
    }
    -[LPPointUnit _lp_CSSText](v45, "_lp_CSSText");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cssResolver");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localVariables");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, CFSTR("local"), CFSTR("width"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v49, v52);

    -[LPPointUnit _lp_CSSText](v46, "_lp_CSSText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cssResolver");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localVariables");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, CFSTR("local"), CFSTR("height"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v53, v56);

    v57 = objc_msgSend(v77, "filter");
    v58 = 0.0;
    if (v57 == 2)
      objc_msgSend(v77, "darkeningAmount", 0.0);
    v59 = v58;
    if (v59 == 0.0)
    {
      v60 = &stru_1E44AB1C8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("brightness(%g)"), (float)(1.0 - v59));
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "cssResolver");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "localVariables");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, CFSTR("local"), CFSTR("filter"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v60, v63);

    if (v59 != 0.0)
    objc_msgSend(v12, "cssResolver");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lp-rich-link-"), "stringByAppendingString:", v74);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v15, "element");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addStyle:toElement:inComponent:", v65, v66, v15);

    -[LPHTMLComponent element](v15, "element");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPointUnit _lp_HTMLAttributeText](v45, "_lp_HTMLAttributeText");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setAttribute:value:", CFSTR("width"), v68);

    -[LPHTMLComponent element](v15, "element");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPointUnit _lp_HTMLAttributeText](v46, "_lp_HTMLAttributeText");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setAttribute:value:", CFSTR("height"), v70);

    -[LPHTMLComponent element](v15, "element");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setAttribute:value:", CFSTR("draggable"), CFSTR("false"));

    v72 = v15;
    v11 = v75;
  }

  return v15;
}

id __79__LPEmailCompatibleHTMLImageComponent_initWithImage_style_themePath_generator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), v5, *(_QWORD *)(a1 + 32), v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), *(_QWORD *)(a1 + 32), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  LPCSSVariable *v3;
  LPCSSVariable *v4;
  LPCSSVariable *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("width");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-width"));
  v9[0] = v3;
  v8[1] = CFSTR("height");
  v4 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-height"));
  v9[1] = v4;
  v8[2] = CFSTR("filter");
  v5 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-filter"));
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
