@implementation WKSafeBrowsingWarning

- (WKSafeBrowsingWarning)initWithFrame:(CGRect)a3 safeBrowsingWarning:(const void *)a4 completionHandler:(void *)a5
{
  WKSafeBrowsingWarning *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *value;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF *m_ptr;
  uint64_t v15;
  uint64_t v16;
  id location;
  uint64_t v19;
  int v20;
  objc_super v21;
  char v22;

  v21.receiver = self;
  v21.super_class = (Class)WKSafeBrowsingWarning;
  v7 = -[WKSafeBrowsingWarning initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    location = 0;
    objc_initWeak(&location, v7);
    v8 = *(_QWORD *)a5;
    *(_QWORD *)a5 = 0;
    v19 = v8;
    v9 = WTF::fastMalloc((WTF *)0x18);
    *(_QWORD *)v9 = off_1E3508048;
    *(_QWORD *)(v9 + 8) = 0;
    objc_moveWeak((id *)(v9 + 8), &location);
    v10 = v19;
    v19 = 0;
    *(_QWORD *)(v9 + 16) = v10;
    value = v7->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
    v7->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = (void *)v9;
    if (value)
    {
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
      v12 = v19;
      v19 = 0;
      if (v12)
        (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
    }
    objc_destroyWeak(&location);
    ++*(_DWORD *)a4;
    m_ptr = (WTF *)v7->_warning.m_ptr;
    v7->_warning.m_ptr = (SafeBrowsingWarning *)a4;
    if (m_ptr)
      WTF::RefCounted<WebKit::SafeBrowsingWarning>::deref(m_ptr, v13);
    v15 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.998, 0.239, 0.233, 1.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    objc_msgSend((id)-[WKSafeBrowsingWarning traitCollection](v7, "traitCollection"), "horizontalSizeClass");
    -[WKSafeBrowsingWarning setBackgroundColor:](v7, "setBackgroundColor:", v15);
  }
  else
  {
    LOBYTE(location) = 1;
    v20 = 0;
    v16 = *(_QWORD *)a5;
    *(_QWORD *)a5 = 0;
    (*(void (**)(uint64_t, id *))(*(_QWORD *)v16 + 16))(v16, &location);
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    if (v20 != -1)
      ((void (*)(char *, id *))off_1E3508028[v20])(&v22, &location);
  }
  return v7;
}

- (void)addContent
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  const void *v14;
  void *Button;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Class isa;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  Class cf;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  NSAttributedString v44;
  NSAttributedString v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[8];
  _QWORD v49[6];
  _QWORD v50[5];
  _BYTE v51[128];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v39 = (void *)objc_opt_new();
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (*((_QWORD *)self->_warning.m_ptr + 6))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E351F1B8;
  v5 = *MEMORY[0x1E0CEA098];
  v54[0] = *MEMORY[0x1E0CEA098];
  v55[0] = objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB580]);
  v6 = *MEMORY[0x1E0CEA0A0];
  v54[1] = *MEMORY[0x1E0CEA0A0];
  v7 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.998, 0.239, 0.233, 1.0);
  v8 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  if (objc_msgSend((id)-[WKSafeBrowsingWarning traitCollection](self, "traitCollection"), "horizontalSizeClass") == 1)
    v9 = v8;
  else
    v9 = v7;
  v55[1] = v9;
  v10 = (const void *)objc_msgSend(v3, "initWithString:attributes:", v4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2));
  makeLabel(&v45, (uint64_t)v10);
  if (v10)
    CFRelease(v10);
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (*((_QWORD *)self->_warning.m_ptr + 7))
    v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v12 = &stru_1E351F1B8;
  v52[0] = v5;
  v13 = objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v52[1] = v6;
  v53[0] = v13;
  v53[1] = colorForItem(4, self);
  v14 = (const void *)objc_msgSend(v11, "initWithString:attributes:", v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
  makeLabel(&v44, (uint64_t)v14);
  if (v14)
    CFRelease(v14);
  Button = makeButton(5, (__CFString *)self, (uint64_t)sel_showDetailsClicked);
  v16 = makeButton(6, (__CFString *)self, (uint64_t)sel_goBackClicked);
  v17 = (void *)objc_opt_new();
  objc_storeWeak(&self->_box.m_weakReference, v17);
  v18 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.998, 0.239, 0.233, 1.0);
  v19 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  if (objc_msgSend((id)-[WKSafeBrowsingWarning traitCollection](self, "traitCollection"), "horizontalSizeClass") == 1)
    v20 = v18;
  else
    v20 = v19;
  objc_msgSend(v17, "setSafeBrowsingBackgroundColor:", v20);
  objc_msgSend((id)objc_msgSend(v17, "layer"), "setCornerRadius:", 6.0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  isa = v45.super.isa;
  v50[0] = v39;
  v50[1] = v45.super.isa;
  cf = v44.super.isa;
  v50[2] = v44.super.isa;
  v50[3] = v16;
  v22 = Button;
  v50[4] = Button;
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v17, "addSubview:", v27);
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v24);
  }
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WKSafeBrowsingWarning addSubview:](self, "addSubview:", v17);
  v28 = (void *)MEMORY[0x1E0CB3718];
  v49[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "leadingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v39, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
  v49[1] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "leadingAnchor"), "anchorWithOffsetToAnchor:", -[objc_class leadingAnchor](isa, "leadingAnchor")), "constraintEqualToConstant:", 60.0);
  v49[2] = objc_msgSend((id)objc_msgSend((id)-[objc_class topAnchor](isa, "topAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v39, "topAnchor")), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend(v39, "bottomAnchor"), "anchorWithOffsetToAnchor:", -[objc_class bottomAnchor](isa, "bottomAnchor")));
  v49[3] = objc_msgSend((id)objc_msgSend((id)-[objc_class bottomAnchor](isa, "bottomAnchor"), "anchorWithOffsetToAnchor:", -[objc_class topAnchor](cf, "topAnchor")), "constraintEqualToConstant:", 20.0);
  v49[4] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "topAnchor"), "anchorWithOffsetToAnchor:", -[objc_class topAnchor](isa, "topAnchor")), "constraintEqualToConstant:", 20.0);
  v49[5] = objc_msgSend((id)objc_msgSend((id)-[WKSafeBrowsingWarning topAnchor](self, "topAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "topAnchor")), "constraintEqualToAnchor:multiplier:", objc_msgSend((id)objc_msgSend(v17, "bottomAnchor"), "anchorWithOffsetToAnchor:", -[WKSafeBrowsingWarning bottomAnchor](self, "bottomAnchor")), 0.5);
  objc_msgSend(v28, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 6));
  v29 = (void *)MEMORY[0x1E0CB3718];
  v48[0] = objc_msgSend((id)objc_msgSend((id)-[WKSafeBrowsingWarning leftAnchor](self, "leftAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "leftAnchor")), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend(v17, "rightAnchor"), "anchorWithOffsetToAnchor:", -[WKSafeBrowsingWarning rightAnchor](self, "rightAnchor")));
  v48[1] = objc_msgSend((id)objc_msgSend(v17, "widthAnchor"), "constraintLessThanOrEqualToConstant:", 675.0);
  v48[2] = objc_msgSend((id)objc_msgSend(v17, "widthAnchor"), "constraintLessThanOrEqualToAnchor:", -[WKSafeBrowsingWarning widthAnchor](self, "widthAnchor"));
  v48[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "leadingAnchor"), "anchorWithOffsetToAnchor:", -[objc_class leadingAnchor](cf, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
  v48[4] = objc_msgSend((id)objc_msgSend((id)-[objc_class trailingAnchor](isa, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "trailingAnchor")), "constraintGreaterThanOrEqualToConstant:", 20.0);
  v48[5] = objc_msgSend((id)objc_msgSend((id)-[objc_class trailingAnchor](cf, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "trailingAnchor")), "constraintGreaterThanOrEqualToConstant:", 20.0);
  v48[6] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "trailingAnchor")), "constraintEqualToConstant:", 20.0);
  v48[7] = objc_msgSend((id)objc_msgSend((id)-[objc_class bottomAnchor](cf, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v16, "topAnchor")), "constraintEqualToConstant:", 20.0);
  objc_msgSend(v29, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 8));
  objc_msgSend((id)objc_msgSend(v22, "titleLabel"), "intrinsicContentSize");
  v31 = v30;
  objc_msgSend((id)objc_msgSend(v16, "titleLabel"), "intrinsicContentSize");
  v33 = v32;
  -[WKSafeBrowsingWarning frame](self, "frame");
  v34 = (void *)MEMORY[0x1E0CB3718];
  if (v31 + v33 + 60.0 <= v35)
  {
    v46[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v16, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
    v46[1] = objc_msgSend((id)objc_msgSend(v16, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v22, "topAnchor"));
    v46[2] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "bottomAnchor")), "constraintEqualToConstant:", 20.0);
    objc_msgSend(v34, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3));
  }
  else
  {
    v47[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "trailingAnchor")), "constraintEqualToConstant:", 20.0);
    v47[1] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v22, "topAnchor")), "constraintEqualToConstant:", 20.0);
    v36 = (void *)objc_msgSend((id)objc_msgSend(v16, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v17, "bottomAnchor"));
    objc_msgSend((id)objc_msgSend(v22, "titleLabel"), "intrinsicContentSize");
    v47[2] = objc_msgSend(v36, "constraintEqualToConstant:", v37 + 40.0);
    objc_msgSend(v34, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3));
  }
  -[WKSafeBrowsingWarning updateContentSize](self, "updateContentSize");
  if (v17)
    CFRelease(v17);
  if (cf)
    CFRelease(cf);
  if (isa)
    CFRelease(isa);
  if (v39)
    CFRelease(v39);
}

- (void)showDetailsClicked
{
  id WeakRetained;
  void *v4;
  SafeBrowsingWarning *m_ptr;
  void *v6;
  void *v7;
  WKSafeBrowsingTextView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[11];
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(&self->_box.m_weakReference);
  v4 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "subviews"), "lastObject"), "removeFromSuperview");
  m_ptr = self->_warning.m_ptr;
  v6 = (void *)*((_QWORD *)m_ptr + 9);
  if (v6)
    CFRetain(*((CFTypeRef *)m_ptr + 9));
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  if (v6)
    CFRelease(v6);
  v26 = *MEMORY[0x1E0CEA098];
  v27[0] = objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  objc_msgSend(v7, "addAttributes:range:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1), 0, objc_msgSend(v7, "length"));
  v8 = -[WKSafeBrowsingTextView initWithAttributedString:forWarning:]([WKSafeBrowsingTextView alloc], "initWithAttributedString:forWarning:", v7, self);
  objc_storeWeak(&self->_details.m_weakReference, v8);
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.998, 0.239, 0.233, 1.0);
  v11 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  if (objc_msgSend((id)-[WKSafeBrowsingWarning traitCollection](self, "traitCollection"), "horizontalSizeClass") == 1)
    v12 = v10;
  else
    v12 = v11;
  objc_msgSend(v9, "setSafeBrowsingBackgroundColor:", v12);
  objc_msgSend((id)objc_msgSend(v9, "layer"), "setCornerRadius:", 6.0);
  objc_msgSend((id)objc_msgSend(v4, "layer"), "setMaskedCorners:", 3);
  objc_msgSend((id)objc_msgSend(v9, "layer"), "setMaskedCorners:", 12);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setSafeBrowsingBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v24[0] = v8;
  v24[1] = v9;
  v24[2] = v13;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3, 0);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v15);
  }
  -[WKSafeBrowsingWarning addSubview:](self, "addSubview:", v9);
  objc_msgSend(v9, "addSubview:", v13);
  objc_msgSend(v9, "addSubview:", v8);
  v18 = (void *)MEMORY[0x1E0CB3718];
  v23[0] = objc_msgSend((id)objc_msgSend(v4, "widthAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "widthAnchor"));
  v23[1] = objc_msgSend((id)objc_msgSend(v4, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "topAnchor"));
  v23[2] = objc_msgSend((id)objc_msgSend(v4, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "leadingAnchor"));
  v23[3] = objc_msgSend((id)objc_msgSend(v13, "widthAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "widthAnchor"));
  v23[4] = objc_msgSend((id)objc_msgSend(v13, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "leadingAnchor"));
  v23[5] = objc_msgSend((id)objc_msgSend(v13, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "topAnchor"));
  v23[6] = objc_msgSend((id)objc_msgSend(v13, "heightAnchor"), "constraintEqualToConstant:", 1.0);
  v23[7] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "topAnchor"), "anchorWithOffsetToAnchor:", -[WKSafeBrowsingTextView topAnchor](v8, "topAnchor")), "constraintEqualToConstant:", 20.0);
  v23[8] = objc_msgSend((id)objc_msgSend((id)-[WKSafeBrowsingTextView bottomAnchor](v8, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v9, "bottomAnchor")), "constraintEqualToConstant:", 20.0);
  v23[9] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "leadingAnchor"), "anchorWithOffsetToAnchor:", -[WKSafeBrowsingTextView leadingAnchor](v8, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
  v23[10] = objc_msgSend((id)objc_msgSend((id)-[WKSafeBrowsingTextView trailingAnchor](v8, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v9, "trailingAnchor")), "constraintEqualToConstant:", 20.0);
  objc_msgSend(v18, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 11));
  -[WKSafeBrowsingWarning layoutText](self, "layoutText");
  -[WKSafeBrowsingWarning updateContentSize](self, "updateContentSize");
  if (v13)
    CFRelease(v13);
  if (v9)
    CFRelease(v9);
  if (v8)
    CFRelease(v8);
  if (v7)
    CFRelease(v7);
}

- (void)updateContentSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WKSafeBrowsingWarning layoutIfNeeded](self, "layoutIfNeeded");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)-[WKSafeBrowsingWarning subviews](self, "subviews", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "frame");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }
  -[WKSafeBrowsingWarning frame](self, "frame");
  v11 = v10;
  -[WKSafeBrowsingWarning frame](self, "frame");
  -[WKSafeBrowsingWarning setContentSize:](self, "setContentSize:", v11, v7 + v12 * 0.5);
}

- (void)layoutText
{
  objc_msgSend(objc_loadWeak(&self->_details.m_weakReference), "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKSafeBrowsingWarning;
  -[WKSafeBrowsingWarning layoutSubviews](&v3, sel_layoutSubviews);
  -[WKSafeBrowsingWarning layoutText](self, "layoutText");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  -[WKSafeBrowsingWarning clickedOnLink:](self, "clickedOnLink:", a4);
  return 0;
}

- (void)dealloc
{
  void *value;
  SafeBrowsingWarning *m_ptr;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v7;
  _QWORD *v8;

  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  m_ptr = self->_warning.m_ptr;
  self->_warning.m_ptr = 0;
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v5 = &off_1E3508070;
  v5[1] = value;
  v5[2] = m_ptr;
  v8 = v5;
  WTF::ensureOnMainRunLoop();
  v6 = v8;
  v8 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  v7.receiver = self;
  v7.super_class = (Class)WKSafeBrowsingWarning;
  -[WKSafeBrowsingWarning dealloc](&v7, sel_dealloc);
}

- (void)goBackClicked
{
  void *value;
  _BYTE v3[40];
  int v4;
  char v5;

  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  if (value)
  {
    v3[0] = 0;
    v4 = 0;
    self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    (*(void (**)(void *, _BYTE *))(*(_QWORD *)value + 16))(value, v3);
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
    if (v4 != -1)
      ((void (*)(char *, _BYTE *))off_1E3508028[v4])(&v5, v3);
  }
}

- (void)clickedOnLink:(id)a3
{
  WebKit::SafeBrowsingWarning *v5;
  void *value;
  _BYTE v7[40];
  int v8;
  char v9;

  if (self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_)
  {
    v5 = (WebKit::SafeBrowsingWarning *)objc_msgSend(a3, "isEqual:", WebKit::SafeBrowsingWarning::visitUnsafeWebsiteSentinel((WebKit::SafeBrowsingWarning *)self));
    if ((_DWORD)v5)
    {
      v7[0] = 1;
      v8 = 0;
      value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
      self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
      (*(void (**)(void *, _BYTE *))(*(_QWORD *)value + 16))(value, v7);
    }
    else
    {
      if (objc_msgSend(a3, "isEqual:", WebKit::SafeBrowsingWarning::confirmMalwareSentinel(v5)))
      {
        v7[0] = 1;
        v8 = 0;
      }
      else
      {
        MEMORY[0x19AEABB18](v7, a3);
        v8 = 1;
      }
      value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
      self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
      (*(void (**)(void *, _BYTE *))(*(_QWORD *)value + 16))(value, v7);
    }
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
    if (v8 != -1)
      ((void (*)(char *, _BYTE *))off_1E3508028[v8])(&v9, v7);
  }
}

- (BOOL)forMainFrameNavigation
{
  return *((_BYTE *)self->_warning.m_ptr + 64);
}

- (void).cxx_destruct
{
  WTF::StringImpl *v3;
  SafeBrowsingWarning *m_ptr;
  void *value;

  objc_destroyWeak(&self->_box.m_weakReference);
  objc_destroyWeak(&self->_details.m_weakReference);
  m_ptr = self->_warning.m_ptr;
  self->_warning.m_ptr = 0;
  if (m_ptr)
    WTF::RefCounted<WebKit::SafeBrowsingWarning>::deref((WTF *)m_ptr, v3);
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 259) = 0;
  *((_QWORD *)self + 260) = 0;
  *((_QWORD *)self + 261) = 0;
  *((_QWORD *)self + 262) = 0;
  return self;
}

- (uint64_t)initWithFrame:(uint64_t)a1 safeBrowsingWarning:completionHandler:
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 16))(v1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
}

- (_QWORD)dealloc
{
  WTF *v3;
  uint64_t v4;

  *a1 = &off_1E3508070;
  v3 = (WTF *)a1[2];
  a1[2] = 0;
  if (v3)
    WTF::RefCounted<WebKit::SafeBrowsingWarning>::deref(v3, a2);
  v4 = a1[1];
  a1[1] = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

- (uint64_t)dealloc
{
  uint64_t v1;
  _BYTE v2[40];
  int v3;
  char v4;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    v2[0] = 0;
    v3 = 0;
    *(_QWORD *)(result + 8) = 0;
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v1 + 16))(v1, v2);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
    if (v3 != -1)
      return ((uint64_t (*)(char *, _BYTE *))off_1E3508028[v3])(&v4, v2);
  }
  return result;
}

@end
