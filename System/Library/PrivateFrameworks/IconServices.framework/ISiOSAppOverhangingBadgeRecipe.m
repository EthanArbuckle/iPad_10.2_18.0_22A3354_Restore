@implementation ISiOSAppOverhangingBadgeRecipe

- (id)hintedMainIconBadgeRect
{
  if (hintedMainIconBadgeRect_onceToken != -1)
    dispatch_once(&hintedMainIconBadgeRect_onceToken, &__block_literal_global_203);
  return (id)hintedMainIconBadgeRect_rect;
}

void __57__ISiOSAppOverhangingBadgeRecipe_hintedMainIconBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD rect2[5];
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;
  CGRect v24;

  v22 = *MEMORY[0x1E0C80C00];
  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 5);
  v1 = (void *)hintedMainIconBadgeRect_rect;
  hintedMainIconBadgeRect_rect = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D3A7B8], "iosAppIconSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&rect2[1], 0, 32);
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v2, "allImageSpecifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &rect2[1], v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)rect2[3];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    rect2[0] = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)rect2[3] != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(rect2[2] + 8 * i);
        objc_msgSend(v11, "size");
        v13 = v12;
        objc_msgSend(v11, "size");
        v15 = v14;
        v16 = round(v13 * 1.18);
        v17 = round(v14 * 1.18);
        objc_msgSend((id)hintedMainIconBadgeRect_rect, "hintedRectForSize:", v16, v17);
        *(_QWORD *)&v24.origin.x = rect2[0];
        v24.origin.y = v7;
        v24.size.width = v8;
        v24.size.height = v9;
        if (CGRectEqualToRect(v23, v24))
          objc_msgSend((id)hintedMainIconBadgeRect_rect, "addHintedRect:forSize:", (v16 - v13) * 0.5, (v17 - v15) * 0.5, v13, v15, v16, v17);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &rect2[1], v21, 16);
    }
    while (v5);
  }

}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken != -1)
    dispatch_once(&hintedBadgeRect_onceToken, &__block_literal_global_204);
  return (id)hintedBadgeRect_rect;
}

void __49__ISiOSAppOverhangingBadgeRecipe_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;

  v24 = *MEMORY[0x1E0C80C00];
  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 5);
  v1 = (void *)hintedBadgeRect_rect;
  hintedBadgeRect_rect = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D3A7B8], "iosAppIconSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v2, "allImageSpecifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "size", *(_QWORD *)&v17, *(_QWORD *)&v18);
        v12 = v11;
        objc_msgSend(v10, "size");
        v14 = v13;
        v15 = round(v12 * 1.18);
        v16 = round(v13 * 1.18);
        objc_msgSend((id)hintedBadgeRect_rect, "hintedRectForSize:", v15, v16);
        v26.origin.y = v17;
        v26.origin.x = v18;
        v26.size.width = v7;
        v26.size.height = v8;
        if (CGRectEqualToRect(v25, v26))
          objc_msgSend((id)hintedBadgeRect_rect, "addHintedRect:forSize:", v15 - v12 * 0.35, 0.0, v12 * 0.35, v14 * 0.35, v15, v16);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISContentLayer *v7;
  ISContentLayer *v8;
  ISContentLayer *v9;
  void *v10;
  ISContentLayer *v11;
  void *v12;
  ISContentLayer *v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  -[ISLayer setName:](v7, "setName:", CFSTR("layer"));
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v8, "setName:", CFSTR("transparent background layer"));
  -[ISLayer setSize:](v8, "setSize:", width, height);
  -[ISContentLayer setContent:](v8, "setContent:", 0);
  v9 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v9, "setName:", CFSTR("icon"));
  -[ISContentLayer setContent:](v9, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISiOSAppOverhangingBadgeRecipe hintedMainIconBadgeRect](self, "hintedMainIconBadgeRect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v9, "setFrame:");

  v11 = objc_alloc_init(ISContentLayer);
  -[ISLayer size](v9, "size");
  -[ISLayer setSize:](v11, "setSize:");
  -[ISLayer setName:](v11, "setName:", CFSTR("mask layer"));
  +[ISShapeCompositorResource continuousRoundedRectShape](ISShapeCompositorResource, "continuousRoundedRectShape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v11, "setContent:", v12);

  -[ISLayer setMask:](v9, "setMask:", v11);
  -[ISLayer addSublayer:](v8, "addSublayer:", v9);
  v13 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v13, "setName:", CFSTR("badge layer"));
  -[ISiOSAppOverhangingBadgeRecipe hintedBadgeRect](self, "hintedBadgeRect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v13, "setFrame:");

  -[ISContentLayer setContent:](v13, "setContent:", CFSTR("kISBadgeResourceKey"));
  -[ISLayer addSublayer:](v8, "addSublayer:", v13);

  -[ISLayer addSublayer:](v7, "addSublayer:", v8);
  return v7;
}

@end
