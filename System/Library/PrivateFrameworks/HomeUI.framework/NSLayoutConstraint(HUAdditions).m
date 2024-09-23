@implementation NSLayoutConstraint(HUAdditions)

+ (id)hu_constraintsSizingAnchorProvider:()HUAdditions toAnchorProvider:
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    objc_msgSend(v7, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    objc_msgSend(v7, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    objc_msgSend(v7, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)hu_constraintWithPriority:()HUAdditions
{
  objc_msgSend(a1, "setPriority:");
  return a1;
}

@end
