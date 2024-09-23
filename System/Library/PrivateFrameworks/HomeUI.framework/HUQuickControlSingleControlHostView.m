@implementation HUQuickControlSingleControlHostView

id __59___HUQuickControlSingleControlHostView__setupConstraintSet__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(v2, "contentView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    objc_msgSend(v2, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredFrameLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    objc_msgSend(v2, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredFrameLayoutGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v21;
    objc_msgSend(v2, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredFrameLayoutGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1132134400;
    objc_msgSend(v18, "hu_constraintsLessThanOrEqualToAnchor:equalityPriority:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v8;
    objc_msgSend(v2, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredFrameLayoutGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1132134400;
    objc_msgSend(v10, "hu_constraintsLessThanOrEqualToAnchor:equalityPriority:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_arrayByFlattening");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

@end
