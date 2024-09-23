@implementation MPArtworkCatalogPlaceholderDataSource

void __96___MPArtworkCatalogPlaceholderDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  id v26;
  CGRect v27;

  objc_msgSend(a2, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFill");

  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  UIRectFill(v27);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_432);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 >= v11)
    v13 = v9;
  else
    v13 = v11;
  if (v9 >= v11)
    v14 = v11;
  else
    v14 = v9;
  v15 = v13 * 0.46;
  if (v14 < v15)
    v15 = v14;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 3, -1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "token");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_systemImageNamed:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "imageWithConfiguration:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "imageByApplyingSymbolConfiguration:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "imageWithTintColor:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "size");
  v24 = v23 * -0.5 + v9 * 0.5;
  objc_msgSend(v22, "size");
  objc_msgSend(v22, "drawAtPoint:", v24, v25 * -0.5 + v11 * 0.5);

}

id __96___MPArtworkCatalogPlaceholderDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_msgSend(a2, "userInterfaceStyle");
  if ((unint64_t)v2 < 2)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    v4 = 0.858823529;
    v5 = 1.0;
    v6 = 0.858823529;
    v7 = 0.858823529;
LABEL_5:
    objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v6, v7, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (v2 == (void *)2)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    v4 = 0.270588235;
    v7 = 0.278431373;
    v5 = 1.0;
    v6 = 0.270588235;
    goto LABEL_5;
  }
  return v2;
}

uint64_t __58___MPArtworkCatalogPlaceholderDataSource_sharedDataSource__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDataSource___dataSource;
  sharedDataSource___dataSource = (uint64_t)v1;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v4 = *(void **)(sharedDataSource___dataSource + 8);
  *(_QWORD *)(sharedDataSource___dataSource + 8) = v3;

  return objc_msgSend(*(id *)(sharedDataSource___dataSource + 8), "setCountLimit:", 4);
}

@end
