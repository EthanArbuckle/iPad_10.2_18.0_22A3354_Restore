@implementation CKMessageEntryViewSnapshot

- (CKMessageEntryViewSnapshot)initWithFrame:(CGRect)a3 entryView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKMessageEntryViewSnapshot *v10;
  CKMessageEntryViewSnapshot *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  objc_super v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CKMessageEntryViewSnapshot;
  v10 = -[CKMessageEntryViewSnapshot initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[CKMessageEntryViewSnapshot setBackgroundColor:](v10, "setBackgroundColor:", 0);
    -[CKMessageEntryViewSnapshot setClipsToBounds:](v11, "setClipsToBounds:", 1);
    objc_msgSend(v9, "snapshotForCompactBrowserAnimation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutoresizingMask:", 18);
    -[CKMessageEntryViewSnapshot bounds](v11, "bounds");
    objc_msgSend(v12, "setFrame:");
    -[CKMessageEntryViewSnapshot addSubview:](v11, "addSubview:", v12);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOpaque:", 0);
    v14 = (void *)MEMORY[0x1E0CEA638];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "entryViewAppButtonName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_systemImageNamed:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithRenderingMode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = CKIsRunningInMacCatalyst();
    v20 = 32.0;
    if (v19)
      v20 = 16.0;
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, 3, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithSymbolConfiguration:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentMode:", 1);

    objc_msgSend(v13, "setImage:forState:", v22, 0);
    v24 = *MEMORY[0x1E0C9D538];
    v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v22, "size");
    objc_msgSend(v13, "setBounds:", v24, v25, v26, v27);
    objc_msgSend(v9, "browserButtonFrame");
    objc_msgSend(v13, "setFrame:");
    CKFrameworkBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SUMMARY_SNAPSHOT_APPS_ACCESSIBILITY_LABEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityLabel:", v29);

    -[CKMessageEntryViewSnapshot setBrowserButton:](v11, "setBrowserButton:", v13);
    -[CKMessageEntryViewSnapshot addSubview:](v11, "addSubview:", v13);

  }
  return v11;
}

- (UIButton)browserButton
{
  return self->_browserButton;
}

- (void)setBrowserButton:(id)a3
{
  objc_storeStrong((id *)&self->_browserButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserButton, 0);
}

@end
