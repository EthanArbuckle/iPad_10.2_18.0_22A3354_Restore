@implementation PKPaletteBackgroundViewFactory

- (id)makeBackgroundViewWithName:(void *)a3 backgroundColor:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0D47498];
    v7 = a2;
    objc_msgSend(v6, "materialViewWithRecipe:", 53);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupNameBase:", v7);

    v9 = v8;
    v10 = v9;
    if (v5)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);

      objc_msgSend(v10, "setBackgroundColor:", v5);
      objc_msgSend(v10, "addSubview:", v9);
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v20 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v9, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -4.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v23;
      objc_msgSend(v9, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -4.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v19;
      objc_msgSend(v9, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 4.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v13;
      objc_msgSend(v9, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 4.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v17);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
