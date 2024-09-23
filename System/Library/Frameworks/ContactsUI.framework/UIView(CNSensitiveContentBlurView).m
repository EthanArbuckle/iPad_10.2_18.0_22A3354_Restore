@implementation UIView(CNSensitiveContentBlurView)

- (id)constrainViewToEdgesConstraints:()CNSensitiveContentBlurView
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(v4, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(v4, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
