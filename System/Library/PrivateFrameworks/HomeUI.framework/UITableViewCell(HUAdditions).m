@implementation UITableViewCell(HUAdditions)

- (id)hu_forcedSeparatorStyle
{
  return objc_getAssociatedObject(a1, &_MergedGlobals_641);
}

- (void)hu_setForcedSeparatorStyle:()HUAdditions
{
  void *v4;
  id value;

  value = a3;
  if (qword_1ED580DD0 != -1)
    dispatch_once(&qword_1ED580DD0, &__block_literal_global_273);
  objc_setAssociatedObject(a1, &_MergedGlobals_641, value, (void *)3);
  v4 = value;
  if (value)
  {
    ((void (*)(void *, char *, uint64_t))off_1ED580DD8)(a1, sel_setSeparatorStyle_, objc_msgSend(value, "unsignedIntegerValue"));
    v4 = value;
  }

}

- (void)turnOffRounding
{
  void *v2;
  id v3;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRadius:", 0.0);

  objc_msgSend(a1, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 0);

}

- (void)removeMargins
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(a1, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreservesSuperviewLayoutMargins:", 0);

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  objc_msgSend(a1, "setLayoutMargins:", *MEMORY[0x1E0CEB4B0], v4, v5, v6);
  objc_msgSend(a1, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutMargins:", v3, v4, v5, v6);

}

@end
