@implementation AVBackdropView

+ (void)applySecondaryGlyphTintToView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "secondaryGlyphTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureView:forTintEffectWithColor:filterType:", v4, v5, *MEMORY[0x1E0CD2EA0]);

}

+ (void)configureView:(id)a3 forTintEffectWithColor:(id)a4 filterType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "_setTextColorFollowsTintColor:", 1);
    objc_msgSend(v8, "setTintColor:", v9);
    objc_msgSend(v8, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", v14);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(v12, "titleForState:", 0), (v15 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v16 = (void *)v15,
          objc_msgSend(v12, "imageForState:", 0),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v16,
          !v17))
    {
      v18 = v9;
      v19 = v10;
      objc_msgSend(v12, "titleForState:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v29 = 0.0;
        objc_msgSend(v18, "getRed:green:blue:alpha:", 0, 0, 0, &v29);
        v21 = (void *)*MEMORY[0x1E0CD2E70];
        if (v29 < 1.0)
          v21 = v19;
        v22 = v21;

        objc_msgSend(v12, "titleLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "configureView:forTintEffectWithColor:filterType:", v23, v18, v19);

        v18 = 0;
        v19 = v22;
      }
      else
      {
        objc_msgSend(v12, "titleLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v12, "titleLabel");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "configureView:forTintEffectWithColor:filterType:", v25, 0, *MEMORY[0x1E0CD2E70]);

        }
      }
      objc_msgSend(MEMORY[0x1E0DC44B0], "layerWithTintColor:filterType:", v18, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC44A0], "configWithContentConfig:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contentConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "configureLayerView:", v8);

    }
  }

}

+ (id)secondaryGlyphTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.55);
}

+ (void)configureSlider:(id)a3 thumbView:(id)a4 loadedTrackView:(id)a5 withTimelineMarkers:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v8, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsGroupBlending:", 0);

  objc_msgSend(v8, "_minTrackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CD2EA0];
  objc_msgSend(v13, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

  objc_msgSend(v8, "_minTrackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.35);

  objc_msgSend(v8, "_maxTrackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCompositingFilter:", v14);

  objc_msgSend(v8, "_maxTrackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 0.1);

  objc_msgSend(v9, "setAlpha:", 0.08);
  v29 = v9;
  objc_msgSend(v9, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCompositingFilter:", v14);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v25, "setAlpha:", 1.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "colorWithAlphaComponent:", 0.5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setBackgroundColor:", v27);

        objc_msgSend(v25, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setCompositingFilter:", v14);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }

}

+ (void)configureSlider:(id)a3 thumbView:(id)a4 loadedTrackView:(id)a5
{
  objc_msgSend(a1, "configureSlider:thumbView:loadedTrackView:withTimelineMarkers:", a3, a4, a5, 0);
}

+ (void)applyPrimaryGlyphTintToView:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "colorWithWhite:alpha:", 1.0, 0.75);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureView:forTintEffectWithColor:filterType:", v5, v6, *MEMORY[0x1E0CD2EA0]);

}

+ (void)removeAllFiltersFromView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", 0);

}

+ (void)applyGlyphTintColor:(id)a3 toView:(id)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x1E0CD2E70];
  objc_msgSend(a1, "configureView:forTintEffectWithColor:filterType:", a4, a3, *v4);
}

+ (void)applyBaseTrackTintToView:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "colorWithWhite:alpha:", 1.0, 0.1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView configureView:forTintEffectWithColor:filterType:](AVBackdropView, "configureView:forTintEffectWithColor:filterType:", v4, v5, *MEMORY[0x1E0CD2EA0]);

}

+ (void)applyCompletedTrackTintToView:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "colorWithWhite:alpha:", 1.0, 0.35);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView configureView:forTintEffectWithColor:filterType:](AVBackdropView, "configureView:forTintEffectWithColor:filterType:", v4, v5, *MEMORY[0x1E0CD2EA0]);

}

+ (void)applyLoadedTrackTintToView:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "colorWithWhite:alpha:", 1.0, 0.08);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView configureView:forTintEffectWithColor:filterType:](AVBackdropView, "configureView:forTintEffectWithColor:filterType:", v4, v5, *MEMORY[0x1E0CD2EA0]);

}

+ (void)configureView:(id)a3 withBackgroundFillOfColor:(id)a4 opacity:(double)a5 filter:(id)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0DC44A8];
  v10 = a3;
  objc_msgSend(v9, "layerWithFillColor:opacity:filterType:", a4, a6, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC44A0], "configWithContentConfig:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureLayerView:", v10);

}

+ (id)secondaryMaterialOverlayView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 23, 0.06);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundEffects:", v6);

  return v2;
}

@end
