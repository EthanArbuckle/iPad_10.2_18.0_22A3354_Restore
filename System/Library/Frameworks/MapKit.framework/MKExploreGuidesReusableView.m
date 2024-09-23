@implementation MKExploreGuidesReusableView

- (void)configureWithExploreGuides:(id)a3 tapHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  MKExploreGuidesView *v14;
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
  void *v25;
  void *v26;
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
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exploreGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

    if ((v11 & 1) == 0)
    {
      -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateExploreGuide:", v6);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesReusableView setBackgroundColor:](self, "setBackgroundColor:", v13);

    v14 = -[MKExploreGuidesView initWithExploreGuides:tapHandler:]([MKExploreGuidesView alloc], "initWithExploreGuides:tapHandler:", v6, v7);
    -[MKExploreGuidesReusableView setExploreGuidesView:](self, "setExploreGuidesView:", v14);

    -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesReusableView addSubview:](self, "addSubview:", v16);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesReusableView leadingAnchor](self, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v33;
    -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesReusableView topAnchor](self, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v29;
    -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesReusableView bottomAnchor](self, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v17;
    -[MKExploreGuidesReusableView exploreGuidesView](self, "exploreGuidesView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesReusableView trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v21;
    -[MKExploreGuidesReusableView heightAnchor](self, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKExploreGuidesView defaultHeight](MKExploreGuidesView, "defaultHeight");
    objc_msgSend(v22, "constraintEqualToConstant:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v24);

  }
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (MKExploreGuidesView)exploreGuidesView
{
  return self->_exploreGuidesView;
}

- (void)setExploreGuidesView:(id)a3
{
  objc_storeStrong((id *)&self->_exploreGuidesView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exploreGuidesView, 0);
}

@end
