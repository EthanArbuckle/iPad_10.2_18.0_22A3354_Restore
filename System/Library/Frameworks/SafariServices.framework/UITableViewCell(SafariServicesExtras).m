@implementation UITableViewCell(SafariServicesExtras)

- (void)sf_setUsesVibrantSelection:()SafariServicesExtras
{
  void *v5;
  char isKindOfClass;
  SFVibrantCellSelectionBackgroundView *v7;

  objc_msgSend(a1, "selectedBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((a3 & 1) != 0)
  {
    if ((isKindOfClass & 1) == 0)
    {
      v7 = objc_alloc_init(SFVibrantCellSelectionBackgroundView);
      objc_msgSend(a1, "setSelectedBackgroundView:", v7);

    }
  }
  else if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "setSelectedBackgroundView:", 0);
  }
}

- (void)sf_registerDynamicImageProvider:()SafariServicesExtras forTraitChanges:
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_getAssociatedObject(a1, (const void *)dynamicImageTraitCollectionRegistrationKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(a1, "unregisterForTraitChanges:", v8);
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__UITableViewCell_SafariServicesExtras__sf_registerDynamicImageProvider_forTraitChanges___block_invoke;
    v11[3] = &unk_1E4AC5308;
    v12 = v6;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](v11);
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, a1, 0);
    objc_msgSend(a1, "registerForTraitChanges:withHandler:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(a1, (const void *)dynamicImageTraitCollectionRegistrationKey, v10, (void *)3);
    v8 = v10;
  }
  else
  {
    objc_setAssociatedObject(a1, (const void *)dynamicImageTraitCollectionRegistrationKey, 0, (void *)3);
  }

}

- (void)sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:()SafariServicesExtras
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC3E88];
  v5 = a3;
  objc_msgSend(v4, "systemTraitsAffectingColorAppearance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sf_registerDynamicImageProvider:forTraitChanges:", v5, v6);

}

@end
