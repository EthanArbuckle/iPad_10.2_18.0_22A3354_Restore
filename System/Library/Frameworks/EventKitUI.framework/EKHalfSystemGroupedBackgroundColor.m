@implementation EKHalfSystemGroupedBackgroundColor

id __EKHalfSystemGroupedBackgroundColor_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ek_blendWithColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
