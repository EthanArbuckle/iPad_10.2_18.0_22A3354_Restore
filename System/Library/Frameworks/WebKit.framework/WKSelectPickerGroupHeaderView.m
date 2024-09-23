@implementation WKSelectPickerGroupHeaderView

- (WKSelectPickerGroupHeaderView)initWithGroupName:(id)a3 section:(int64_t)a4 isCollapsible:(BOOL)a5
{
  WKSelectPickerGroupHeaderView *v8;
  WKSelectPickerGroupHeaderView *v9;
  const void *v10;
  id v11;
  void *m_ptr;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  objc_super v31;
  _QWORD v32[4];
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)WKSelectPickerGroupHeaderView;
  v8 = -[WKSelectPickerGroupHeaderView init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_section = a4;
    v8->_isCollapsible = a5;
    v10 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v8, sel_didTapHeader_);
    -[WKSelectPickerGroupHeaderView addGestureRecognizer:](v9, "addGestureRecognizer:", v10);
    v11 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    m_ptr = v9->_label.m_ptr;
    v9->_label.m_ptr = v11;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v11 = v9->_label.m_ptr;
    }
    objc_msgSend(v11, "setText:", a3);
    objc_msgSend(v9->_label.m_ptr, "setFont:", +[WKSelectPickerGroupHeaderView preferredFont](WKSelectPickerGroupHeaderView, "preferredFont"));
    objc_msgSend(v9->_label.m_ptr, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v9->_label.m_ptr, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v9->_label.m_ptr, "setLineBreakMode:", 4);
    objc_msgSend(v9->_label.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WKSelectPickerGroupHeaderView addSubview:](v9, "addSubview:", v9->_label.m_ptr);
    if (v9->_isCollapsible)
    {
      v13 = objc_alloc(MEMORY[0x1E0CEA658]);
      v14 = objc_msgSend(v13, "initWithImage:", objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.down")));
      v15 = v9->_collapseIndicatorView.m_ptr;
      v9->_collapseIndicatorView.m_ptr = (void *)v14;
      if (v15)
        CFRelease(v15);
      objc_msgSend(v9->_label.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v9->_collapseIndicatorView.m_ptr, "setPreferredSymbolConfiguration:", objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", +[WKSelectPickerGroupHeaderView preferredFont](WKSelectPickerGroupHeaderView, "preferredFont"), 1));
      LODWORD(v16) = 1148846080;
      objc_msgSend(v9->_collapseIndicatorView.m_ptr, "setContentCompressionResistancePriority:forAxis:", 0, v16);
      objc_msgSend(v9->_collapseIndicatorView.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[WKSelectPickerGroupHeaderView addSubview:](v9, "addSubview:", v9->_collapseIndicatorView.m_ptr);
      v17 = (void *)MEMORY[0x1E0CB3718];
      v18 = (void *)objc_msgSend(v9->_label.m_ptr, "leadingAnchor");
      v19 = -[WKSelectPickerGroupHeaderView leadingAnchor](v9, "leadingAnchor");
      +[WKSelectPickerGroupHeaderView preferredMargin](WKSelectPickerGroupHeaderView, "preferredMargin");
      v34[0] = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
      v34[1] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "trailingAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v9->_collapseIndicatorView.m_ptr, "leadingAnchor"), -4.0);
      v34[2] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "topAnchor"), "constraintEqualToAnchor:constant:", -[WKSelectPickerGroupHeaderView topAnchor](v9, "topAnchor"), 0.0);
      objc_msgSend(v17, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3));
      v20 = (void *)MEMORY[0x1E0CB3718];
      v21 = (void *)objc_msgSend(v9->_collapseIndicatorView.m_ptr, "trailingAnchor");
      v22 = -[WKSelectPickerGroupHeaderView trailingAnchor](v9, "trailingAnchor");
      +[WKSelectPickerGroupHeaderView preferredMargin](WKSelectPickerGroupHeaderView, "preferredMargin");
      v33[0] = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -v23);
      v33[1] = objc_msgSend((id)objc_msgSend(v9->_collapseIndicatorView.m_ptr, "topAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v9->_label.m_ptr, "topAnchor"), 0.0);
      v33[2] = objc_msgSend((id)objc_msgSend(v9->_collapseIndicatorView.m_ptr, "bottomAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v9->_label.m_ptr, "bottomAnchor"), 0.0);
      v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3718];
      v25 = (void *)objc_msgSend(v9->_label.m_ptr, "leadingAnchor");
      v26 = -[WKSelectPickerGroupHeaderView leadingAnchor](v9, "leadingAnchor");
      +[WKSelectPickerGroupHeaderView preferredMargin](WKSelectPickerGroupHeaderView, "preferredMargin");
      v32[0] = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26);
      v27 = (void *)objc_msgSend(v9->_label.m_ptr, "trailingAnchor");
      v28 = -[WKSelectPickerGroupHeaderView trailingAnchor](v9, "trailingAnchor");
      +[WKSelectPickerGroupHeaderView preferredMargin](WKSelectPickerGroupHeaderView, "preferredMargin");
      v32[1] = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -v29);
      v32[2] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "topAnchor"), "constraintEqualToAnchor:", -[WKSelectPickerGroupHeaderView topAnchor](v9, "topAnchor"));
      v32[3] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "bottomAnchor"), "constraintEqualToAnchor:", -[WKSelectPickerGroupHeaderView bottomAnchor](v9, "bottomAnchor"));
      v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    }
    objc_msgSend(v20, "activateConstraints:", v24);
    if (v10)
      CFRelease(v10);
  }
  return v9;
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  CGFloat tx;
  uint64_t v9;
  __int128 v10;
  void *m_ptr;
  CGAffineTransform v12;
  CGAffineTransform v13;

  if (self->_isCollapsible && self->_collapsed != a3)
  {
    v5 = a4;
    self->_collapsed = a3;
    CFRetain(self);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CEABB0];
      *(_QWORD *)&v13.a = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v13.b = 3321888768;
      *(_QWORD *)&v13.c = ___ZZ55__WKSelectPickerGroupHeaderView_setCollapsed_animated__ENK3__3cvU13block_pointerFvvEEv_block_invoke;
      *(_QWORD *)&v13.d = &__block_descriptor_40_e8_32c68_ZTSKZ55__WKSelectPickerGroupHeaderView_setCollapsed_animated__E3__3_e5_v8__0l;
      *(_QWORD *)&v13.tx = self;
      CFRetain(self);
      v7 = objc_msgSend((id)objc_msgSend(&v13, "copy"), "autorelease");
      tx = v13.tx;
      v13.tx = 0.0;
      if (tx != 0.0)
        CFRelease(*(CFTypeRef *)&tx);
      objc_msgSend(v6, "animateWithDuration:animations:", v7, 0.300000012);
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[WKSelectPickerGroupHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
      memset(&v13, 0, sizeof(v13));
      if (self->_collapsed)
      {
        CGAffineTransformMakeRotation(&v13, dbl_1978D0430[v9 == 0]);
      }
      else
      {
        v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v13.c = v10;
        *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      m_ptr = self->_collapseIndicatorView.m_ptr;
      v12 = v13;
      objc_msgSend(m_ptr, "setTransform:", &v12);
    }
    CFRelease(self);
  }
}

- (void)setTableViewController:(id)a3
{
  objc_storeWeak(&self->_tableViewController.m_weakReference, a3);
}

- (void)didTapHeader:(id)a3
{
  objc_msgSend(objc_loadWeak(&self->_tableViewController.m_weakReference), "didTapSelectPickerGroupHeaderView:", self);
  -[WKSelectPickerGroupHeaderView setCollapsed:animated:](self, "setCollapsed:animated:", !self->_collapsed, 1);
}

+ (id)preferredFont
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5C0]);
  v7 = *MEMORY[0x1E0CEB510];
  v5 = *MEMORY[0x1E0CEB608];
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5F8]);
  v8[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v3 = objc_msgSend(v2, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v3, 0.0);
}

+ (double)preferredMargin
{
  return 16.0;
}

+ (double)preferredHeight
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(+[WKSelectPickerGroupHeaderView preferredFont](WKSelectPickerGroupHeaderView, "preferredFont"), "lineHeight");
  v3 = v2;
  +[WKSelectPickerGroupHeaderView preferredMargin](WKSelectPickerGroupHeaderView, "preferredMargin");
  return v3 + v4;
}

- (int64_t)section
{
  return self->_section;
}

- (BOOL)isCollapsible
{
  return self->_isCollapsible;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  objc_destroyWeak(&self->_tableViewController.m_weakReference);
  m_ptr = self->_collapseIndicatorView.m_ptr;
  self->_collapseIndicatorView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_label.m_ptr;
  self->_label.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  return self;
}

@end
