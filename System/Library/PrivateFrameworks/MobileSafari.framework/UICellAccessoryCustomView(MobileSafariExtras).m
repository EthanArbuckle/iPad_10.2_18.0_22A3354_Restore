@implementation UICellAccessoryCustomView(MobileSafariExtras)

- (id)sf_initWithCustomView:()MobileSafariExtras placement:trailingPadding:
{
  objc_class *v8;
  id v9;
  id v10;
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
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  if (a2 == 0.0)
  {
    v23 = a4;
    v24 = (void *)objc_msgSend(a1, "initWithCustomView:placement:", v23, a5);

    v21 = v24;
  }
  else
  {
    v8 = (objc_class *)MEMORY[0x1E0DC3F10];
    v9 = a4;
    v31 = a1;
    v10 = objc_alloc_init(v8);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addSubview:", v9);
    v26 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v10, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    objc_msgSend(v10, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v12;
    objc_msgSend(v10, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v15;
    objc_msgSend(v10, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v19);

    v20 = (void *)objc_msgSend(v31, "initWithCustomView:placement:", v10, a5);
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "setReservedLayoutWidth:", 0.0);
      v22 = v21;
    }

  }
  return v21;
}

@end
