@implementation SFPrivacyReportGridItemCell

- (void)setReportView:(id)a3
{
  UIView *v5;
  void *v6;
  id *p_reportView;
  UIView *reportView;
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
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  -[SFPrivacyReportGridItemCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_reportView = (id *)&self->_reportView;
  reportView = self->_reportView;
  if (reportView == v5)
  {
    if (-[UIView isDescendantOfView:](v5, "isDescendantOfView:", v6))
      goto LABEL_8;
    reportView = (UIView *)*p_reportView;
  }
  -[UIView superview](reportView, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
    objc_msgSend(*p_reportView, "removeFromSuperview");
  objc_storeStrong(p_reportView, a3);
  if (*p_reportView)
  {
    objc_msgSend(*p_reportView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", *p_reportView);
    v18 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(*p_reportView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    objc_msgSend(*p_reportView, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    objc_msgSend(*p_reportView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v13;
    objc_msgSend(*p_reportView, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v17);

  }
LABEL_8:

}

- (UIView)reportView
{
  return self->_reportView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportView, 0);
}

@end
