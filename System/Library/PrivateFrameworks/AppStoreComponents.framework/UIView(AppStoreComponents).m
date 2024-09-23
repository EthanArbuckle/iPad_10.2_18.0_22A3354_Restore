@implementation UIView(AppStoreComponents)

- (id)asc_layoutTraitEnvironment
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];

  v2 = objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
  if (v2 == 1)
    v3 = 1;
  else
    v3 = -1;
  if (v2)
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(a1, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "layoutDirection") == v4)
  {
    v6 = a1;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__UIView_AppStoreComponents__asc_layoutTraitEnvironment__block_invoke;
    v9[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v9[4] = v4;
    objc_msgSend(v5, "traitCollectionByModifyingTraits:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[__ASCLayoutProxy traitEnvironmentWithTraitCollection:](__ASCLayoutProxy, "traitEnvironmentWithTraitCollection:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (uint64_t)asc_isEqualToOrDescendantOfFocusItem:()AppStoreComponents
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == a1)
    {
      v9 = 1;
    }
    else
    {
      objc_opt_class();
      v6 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;

      if (v8)
        v9 = objc_msgSend(a1, "isDescendantOfView:", v8);
      else
        v9 = 0;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)asc_nearestSuperviewPassingTest:()AppStoreComponents
{
  uint64_t (**v4)(id, void *, _BYTE *);
  void *v5;
  uint64_t v6;
  char v8;

  v4 = a3;
  v8 = 0;
  objc_msgSend(a1, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    while ((v4[2](v4, v5, &v8) & 1) == 0)
    {
      if (!v8)
      {
        objc_msgSend(v5, "superview");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
        if (v6)
          continue;
      }

      v5 = 0;
      break;
    }
  }

  return v5;
}

@end
