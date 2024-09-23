@implementation UITableViewCell

void __89__UITableViewCell_SafariServicesExtras__sf_registerDynamicImageProvider_forTraitChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "setImage:", v5);
    objc_msgSend(v8, "setContentConfiguration:", v6);
  }
  else
  {
    objc_msgSend(v8, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v5);

  }
}

@end
