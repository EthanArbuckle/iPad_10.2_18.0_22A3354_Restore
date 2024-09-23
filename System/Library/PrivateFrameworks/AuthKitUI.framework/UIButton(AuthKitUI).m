@implementation UIButton(AuthKitUI)

+ (id)ak_passwordRecoveryButton
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v19);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("iforgot"), v18, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addSubview:", v0);
  objc_msgSend(v1, "setContentMode:", 4);
  objc_msgSend(v1, "setFrame:", 0.0, 0.0, 18.0, 18.0);
  objc_msgSend(v1, "setImage:forState:", v17, 0);
  objc_msgSend(v1, "addTarget:action:forControlEvents:", v1, sel__ak_passwordRecoveryButtonTapped_, 64);
  v11 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v0, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  objc_msgSend(v0, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v2;
  objc_msgSend(v0, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v5;
  objc_msgSend(v0, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v9);

  return v1;
}

- (void)_ak_passwordRecoveryButtonTapped:()AuthKitUI
{
  NSObject *v0;

  dispatch_get_global_queue(9, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_0);

}

@end
