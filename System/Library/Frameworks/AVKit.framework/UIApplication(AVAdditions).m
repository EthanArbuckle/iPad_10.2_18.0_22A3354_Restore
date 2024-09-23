@implementation UIApplication(AVAdditions)

- (id)avkit_possibleWindowForControllingOverallAppearance
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "avkit_possiblePrimaryWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "_findWindowForControllingOverallAppearanceInWindowScene:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)avkit_possiblePrimaryWindowScene
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "connectedScenes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_4407);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)avkit_windowSceneWithSessionIdentifier:()AVAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(a1, "openSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__UIApplication_AVAdditions__avkit_windowSceneWithSessionIdentifier___block_invoke;
  v13[3] = &unk_1E5BB11D8;
  v14 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredSetUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
