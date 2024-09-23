@implementation LPEmailCompatibleHTMLIconComponent

- (LPEmailCompatibleHTMLIconComponent)initWithImage:(id)a3 style:(id)a4 properties:(id)a5 themePath:(id)a6 generator:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  LPEmailCompatibleHTMLIconComponent *v16;
  uint64_t v17;
  LPEmailCompatibleHTMLIconComponent *v18;
  void *v19;
  void (**v20)(void);
  uint64_t v21;
  void (**v22)(void *, const __CFString *, const __CFString *);
  unint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  id v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  uint64_t v56;
  void *v57;
  void *v58;
  LPCSSVariable *v59;
  void *v60;
  LPCSSVariable *v61;
  void *v62;
  void *v63;
  void *v64;
  LPCSSVariable *v65;
  void *v66;
  LPCSSVariable *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  LPEmailCompatibleHTMLIconComponent *v74;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  _QWORD aBlock[4];
  id v89;
  objc_super v90;

  v12 = a3;
  v87 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v90.receiver = self;
  v90.super_class = (Class)LPEmailCompatibleHTMLIconComponent;
  v16 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v90, sel_initWithTagName_themePath_generator_, CFSTR("img"), v14, v15);
  v18 = v16;
  if (v16)
  {
    LPWebLock(v16, v17);
    objc_msgSend(v12, "_alternateHTMLImageGenerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = v14;
    v86 = v13;
    if (v19)
    {
      objc_msgSend(v12, "_alternateHTMLImageGenerator");
      v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v20[2]();
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v21;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__LPEmailCompatibleHTMLIconComponent_initWithImage_style_properties_themePath_generator___block_invoke;
    aBlock[3] = &unk_1E44A7FA8;
    v84 = v14;
    v89 = v84;
    v22 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(aBlock);
    v23 = LPImageViewFilterResolve(v12, v13, v87);
    objc_msgSend(v12, "_remoteURLsForEmailCompatibleOutput");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v87, "cornerRadius");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "value");
      v27 = v26;

      if (v27 != 0.0)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v87, "cornerRadius");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "value");
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%gpx"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cssResolver");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localVariables");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2](v22, CFSTR("local"), CFSTR("corner-radius"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, v34);

      }
      -[LPHTMLComponent element](v18, "element");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_remoteURLsForEmailCompatibleOutput");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "URL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "absoluteString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAttribute:value:", CFSTR("src"), v39);

      -[LPHTMLComponent element](v18, "element");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_srcsetForRemoteURLs");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAttribute:value:", CFSTR("srcset"), v41);
      goto LABEL_15;
    }
    v42 = v12;
    objc_msgSend(v86, "maskColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = v42;
    if (v43)
    {
      objc_msgSend(v86, "maskColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      flatImageWithColor(v42, v44);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v23 <= 0xE)
    {
      if (((1 << v23) & 0x6808) != 0)
      {
        objc_msgSend(v87, "fixedSize");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "asSize");
        v47 = v46;
        v49 = v48;

        objc_msgSend(v87, "cornerRadius");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "value");
        v52 = v51;

        objc_msgSend(v87, "backgroundColor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "backgroundInset");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "value");
        squareImageWithCornerRadius(v40, v53, v47, v49, v52, 2.0, v55);
        v56 = objc_claimAutoreleasedReturnValue();

        v40 = v53;
      }
      else
      {
        if (v23 != 1)
          goto LABEL_14;
        objc_msgSend(v42, "_pixelSize");
        v77 = v76;
        objc_msgSend(v42, "_pixelSize");
        if (v77 == v78)
          goto LABEL_14;
        objc_msgSend(v87, "fixedSize");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "asSize");
        v81 = v80;
        v83 = v82;

        squareBitmapImageWithInlaidImage(v40, v81, v83, 2.0);
        v56 = objc_claimAutoreleasedReturnValue();
      }

      v40 = (void *)v56;
    }
LABEL_14:
    -[LPHTMLComponent element](v18, "element");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_URLForImage:", v40);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAttribute:value:", CFSTR("src"), v57);

LABEL_15:
    -[LPHTMLComponent element](v18, "element");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setAttribute:value:", CFSTR("draggable"), CFSTR("false"));

    v59 = [LPCSSVariable alloc];
    v22[2](v22, 0, CFSTR("fixedSize-width"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[LPCSSVariable initWithName:](v59, "initWithName:", v60);
    objc_msgSend(v15, "cssResolver");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localVariables");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2](v22, CFSTR("local"), CFSTR("size-width"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v61, v64);

    v65 = [LPCSSVariable alloc];
    v22[2](v22, 0, CFSTR("fixedSize-height"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[LPCSSVariable initWithName:](v65, "initWithName:", v66);
    objc_msgSend(v15, "cssResolver");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localVariables");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2](v22, CFSTR("local"), CFSTR("size-height"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v67, v70);

    objc_msgSend(v15, "cssResolver");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lp-rich-link-"), "stringByAppendingString:", v84);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v85;
    v13 = v86;
    -[LPHTMLComponent element](v18, "element");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addStyle:toElement:inComponent:", v72, v73, v18);

    v74 = v18;
  }

  return v18;
}

id __89__LPEmailCompatibleHTMLIconComponent_initWithImage_style_properties_themePath_generator___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)baseRules
{
  LPCSSVariable *v2;
  LPCSSVariable *v3;
  LPCSSVariable *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("inline-block");
  v7[0] = CFSTR("display");
  v7[1] = CFSTR("width");
  v2 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-size-width"));
  v8[1] = v2;
  v7[2] = CFSTR("height");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-size-height"));
  v8[2] = v3;
  v8[3] = CFSTR("none !important");
  v7[3] = CFSTR("pointer-events");
  v7[4] = CFSTR("border-radius");
  v4 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-corner-radius"));
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  objc_msgSend(a1, "baseRules", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
