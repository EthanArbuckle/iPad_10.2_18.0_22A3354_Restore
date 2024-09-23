@implementation HUPocketButtonViewController

+ (CGSize)calculatePreferredContentSizeForDescriptors:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    v7 = objc_msgSend(v3, "count");
    if (v7)
    {
      v8 = 10.0;
      do
      {
        v8 = v8 + 50.0 + 10.0;
        --v7;
      }
      while (v7);
    }
    else
    {
      v8 = 10.0;
    }
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (HUPocketButtonViewController)initWithButtonDescriptors:(id)a3
{
  id v5;
  HUPocketButtonViewController *v6;
  uint64_t v7;
  NSArray *descriptors;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPocketButtonViewController.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptors"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HUPocketButtonViewController;
  v6 = -[HUPocketButtonViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    descriptors = v6->_descriptors;
    v6->_descriptors = (NSArray *)v7;

    objc_msgSend((id)objc_opt_class(), "calculatePreferredContentSizeForDescriptors:", v5);
    -[HUPocketButtonViewController setPreferredContentSize:](v6, "setPreferredContentSize:");
  }

  return v6;
}

- (HUPocketButtonViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithButtonDescriptors_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPocketButtonViewController.m"), 154, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPocketButtonViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUPocketButtonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithButtonDescriptors_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPocketButtonViewController.m"), 159, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPocketButtonViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  _HUPocketButton *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id obj;
  _QWORD v26[4];
  id v27;
  HUPocketButtonViewController *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)HUPocketButtonViewController;
  -[HUPocketButtonViewController viewDidLoad](&v33, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HUPocketButtonViewController descriptors](self, "descriptors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        v13 = -[_HUPocketButton initWithFrame:highlightedAlpha:highlightedTextAlpha:]([_HUPocketButton alloc], "initWithFrame:highlightedAlpha:highlightedTextAlpha:", v7, v8, v9, v10, 0.75, 0.5);
        objc_msgSend(v12, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HUPocketButton setTitle:forState:](v13, "setTitle:forState:", v14, 0);

        objc_msgSend(v12, "backgroundColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v12, "backgroundColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUPocketButton setBackgroundColor:](v13, "setBackgroundColor:", v16);

        }
        else
        {
          -[HUColoredButton setBackgroundColorFollowsTintColor:](v13, "setBackgroundColorFollowsTintColor:", 1);
        }
        objc_msgSend(v12, "textColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v12, "textColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUPocketButton setTitleColor:forState:](v13, "setTitleColor:forState:", v18, 0);

        }
        -[HUPocketButtonViewController descriptors](self, "descriptors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HUPocketButton setTag:](v13, "setTag:", objc_msgSend(v19, "indexOfObject:", v12));

        -[_HUPocketButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", self, sel__buttonHit_, 64);
        objc_msgSend(v3, "addObject:", v13);

        ++v11;
      }
      while (v5 != v11);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithArrangedSubviews:", v3);
  objc_msgSend(v20, "setAxis:", 1);
  objc_msgSend(v20, "setDistribution:", 4);
  objc_msgSend(v20, "setAlignment:", 3);
  objc_msgSend(v20, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v20, "setSpacing:", 10.0);
  objc_msgSend(v20, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v20, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[HUPocketButtonViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "naui_addAutoLayoutSubview:", v20);

  v22 = (void *)MEMORY[0x1E0CB3718];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __43__HUPocketButtonViewController_viewDidLoad__block_invoke;
  v26[3] = &unk_1E6F59D18;
  v27 = v20;
  v28 = self;
  v23 = v20;
  __43__HUPocketButtonViewController_viewDidLoad__block_invoke((uint64_t)v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v24);

}

id __43__HUPocketButtonViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v12);

  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v16);

  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v20);

  return v2;
}

- (void)_buttonHit:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "tag");
  -[HUPocketButtonViewController descriptors](self, "descriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "execute");
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
