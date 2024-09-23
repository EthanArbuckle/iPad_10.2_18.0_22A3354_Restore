@implementation UINavigationBar(CKUtilities)

- (void)enableBranding:()CKUtilities forBusinessChat:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryBrandColorForBusinessChat:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryBrandColorForBusinessChat:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_enableBusinessBranding:primaryColor:secondaryColor:", a3, v8, v11);
}

- (void)_enableBusinessBranding:()CKUtilities primaryColor:secondaryColor:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CEABE0], "effectCompositingColor:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setBackgroundEffects:", v11);

    }
    else
    {
      objc_msgSend(a1, "setBackgroundEffects:", 0);
    }
    v12 = a1;
    v13 = v9;
  }
  else
  {
    objc_msgSend(a1, "setBackgroundEffects:", 0);
    v12 = a1;
    v13 = 0;
  }
  objc_msgSend(v12, "setTintColor:", v13);

}

- (uint64_t)setDarkEffectStyle:()CKUtilities
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryFieldDarkEffectButtonColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTintColor:", v6);

    objc_msgSend(a1, "setBarStyle:", 2);
    objc_msgSend(a1, "_setDisableBlurTinting:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBarTintColor:", v7);

  }
  else
  {
    objc_msgSend(a1, "setTintColor:", 0);
    objc_msgSend(a1, "setBarStyle:", 0);
    objc_msgSend(a1, "_setDisableBlurTinting:", 0);
    objc_msgSend(a1, "setBarTintColor:", 0);
  }
  return objc_msgSend(a1, "setBackgroundEffects:", 0);
}

- (void)enableBranding:()CKUtilities forBusinessHandle:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryBrandColorForBusinessHandle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryBrandColorForBusinessHandle:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_enableBusinessBranding:primaryColor:secondaryColor:", a3, v8, v11);
}

@end
