@implementation UIView(HoverAdditions)

- (id)pk_hoverLabelString
{
  return objc_getAssociatedObject(a1, &hoverLabelStringKey);
}

- (void)pk_setHoverLabelString:()HoverAdditions
{
  objc_setAssociatedObject(a1, &hoverLabelStringKey, a3, (void *)3);
}

- (id)pk_hoverLabelAttributedString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, &hoverLabelAttributedStringKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "pk_hoverLabelString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
      objc_msgSend(v4, "boldSystemFontOfSize:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x1E0CB3498]);
      v7 = *MEMORY[0x1E0DC1140];
      v11[0] = *MEMORY[0x1E0DC1138];
      v11[1] = v7;
      v12[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)objc_msgSend(v6, "initWithString:attributes:", v3, v9);

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)pk_setHoverLabelAttributedString:()HoverAdditions
{
  objc_setAssociatedObject(a1, &hoverLabelAttributedStringKey, a3, (void *)3);
}

+ (id)pk_hoverLabelFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "fontWithDescriptor:size:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pk_hoverAttributedStringFromString:()HoverAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    v11[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(a1, "pk_hoverLabelFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v11[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithString:attributes:", v4, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)pk_hoverAttributedStringForColor:()HoverAdditions
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  __int128 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  DKUColorGetRGBAComponents((CGColor *)objc_msgSend(objc_retainAutorelease(a3), "CGColor"), &v35);
  LODWORD(v3) = vcvtd_n_s64_f64(*(double *)&v35, 8uLL);
  LODWORD(v4) = vcvtd_n_s64_f64(*((double *)&v35 + 1), 8uLL);
  v27 = v4;
  LODWORD(v4) = vcvtd_n_s64_f64(v36, 8uLL);
  v29 = v4;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  objc_msgSend(v6, "boldSystemFontOfSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1140];
  v33[0] = *MEMORY[0x1E0DC1138];
  v8 = v33[0];
  v33[1] = v9;
  v34[0] = v7;
  v34[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  v31[1] = v9;
  v32[0] = v7;
  v32[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v10);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("R"), v10);
  objc_msgSend(v5, "appendAttributedString:", v13);

  objc_msgSend(v5, "appendAttributedString:", v12);
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v11);
  objc_msgSend(v5, "appendAttributedString:", v16);

  objc_msgSend(v5, "appendAttributedString:", v12);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("G"), v10);
  objc_msgSend(v5, "appendAttributedString:", v17);

  objc_msgSend(v5, "appendAttributedString:", v12);
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v11);
  objc_msgSend(v5, "appendAttributedString:", v20);

  objc_msgSend(v5, "appendAttributedString:", v12);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("B"), v10);
  objc_msgSend(v5, "appendAttributedString:", v21);

  objc_msgSend(v5, "appendAttributedString:", v12);
  v22 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v11);
  objc_msgSend(v5, "appendAttributedString:", v24);

  v25 = (void *)objc_msgSend(v5, "copy");
  return v25;
}

@end
