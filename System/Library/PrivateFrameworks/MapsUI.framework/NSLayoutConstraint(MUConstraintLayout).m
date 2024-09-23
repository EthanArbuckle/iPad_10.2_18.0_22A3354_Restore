@implementation NSLayoutConstraint(MUConstraintLayout)

+ (void)_mapsui_activateLayouts:()MUConstraintLayout
{
  id v4;

  MUMap(a3, &__block_literal_global_26);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_activateLayouts:", v4);

}

+ (void)_mapsui_activateLayouts:()MUConstraintLayout constraints:
{
  id v6;
  id v7;

  v6 = a4;
  MUMap(a3, &__block_literal_global_36_0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_activateLayouts:constraints:", v7, v6);

}

+ (void)_mapsui_deactivateLayouts:()MUConstraintLayout
{
  id v4;

  MUMap(a3, &__block_literal_global_37);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_deactivateLayouts:", v4);

}

+ (void)_mapsui_deactivateLayouts:()MUConstraintLayout constraints:
{
  id v6;
  id v7;

  v6 = a4;
  MUMap(a3, &__block_literal_global_38);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_activateLayouts:constraints:", v7, v6);

}

@end
