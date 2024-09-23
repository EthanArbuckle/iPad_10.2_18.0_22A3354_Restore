@implementation NCWidgetMetrics

+ (double)scaledValueForValue:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
  else
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && ((v8 = (void *)*MEMORY[0x24BDF7658],
         UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v7, (UIContentSizeCategory)*MEMORY[0x24BDF7658]) == NSOrderedAscending)
     || (v9 = v8, v7, (v7 = v9) != 0)))
  {
    objc_msgSend(MEMORY[0x24BDF6A80], "defaultMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scaledValueForValue:compatibleWithTraitCollection:", v11, a3);
    v13 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scaledValueForValue:", a3);
    v13 = v14;
  }

  return v13;
}

+ (double)defaultWidgetRowHeight
{
  if (defaultWidgetRowHeight_onceToken != -1)
    dispatch_once(&defaultWidgetRowHeight_onceToken, &__block_literal_global_10);
  return *(double *)&defaultWidgetRowHeight___defaultRowHeight;
}

double __41__NCWidgetMetrics_defaultWidgetRowHeight__block_invoke()
{
  double result;

  result = *MEMORY[0x24BDF7DE8];
  *(double *)&defaultWidgetRowHeight___defaultRowHeight = result;
  return result;
}

+ (double)widgetRowHeight
{
  double result;
  void *v4;
  uint64_t v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__NCWidgetMetrics_widgetRowHeight__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (widgetRowHeight_onceToken != -1)
    dispatch_once(&widgetRowHeight_onceToken, block);
  result = *(double *)&__rowHeightForContentSizeCategory;
  if (*(double *)&__rowHeightForContentSizeCategory == 0.0)
  {
    objc_msgSend(a1, "defaultWidgetRowHeight", *(double *)&__rowHeightForContentSizeCategory);
    objc_msgSend(a1, "scaledValueForValue:");
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    __rowHeightForContentSizeCategory = v5;

    return *(double *)&__rowHeightForContentSizeCategory;
  }
  return result;
}

void __34__NCWidgetMetrics_widgetRowHeight__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__updateWidgetRowHeightForContentSizeCategory, *MEMORY[0x24BDF7670], 0);

}

+ (void)_updateWidgetRowHeightForContentSizeCategory
{
  __rowHeightForContentSizeCategory = 0;
}

@end
