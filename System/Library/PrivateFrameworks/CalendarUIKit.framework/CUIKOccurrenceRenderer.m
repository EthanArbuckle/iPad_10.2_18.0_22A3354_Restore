@implementation CUIKOccurrenceRenderer

+ (id)renderColorBlockImageWithThickness:(double)a3 backgroundColor:(CGColor *)a4 stripeColor:(CGColor *)a5 stripedImageAlpha:(double)a6
{
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  _QWORD v22[11];

  +[CUIKInterface shared](CUIKInterface, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "interfaceIsLeftToRight");

  +[CUIKORImageUtils occurrencePadding](CUIKORImageUtils, "occurrencePadding");
  v13 = v12;
  if (a5)
  {
    v14 = v12 + a3 + 9.0 + 1.0;
    CUIKRoundToScreenScale(0.5);
    v16 = (v15 + a3 * 2.0) * 3.0 * 18.0;
  }
  else
  {
    CUIKRoundToScreenScale(0.5);
    v16 = v17 + a3 * 2.0;
    v14 = v13 + a3 + 2.0;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__CUIKOccurrenceRenderer_renderColorBlockImageWithThickness_backgroundColor_stripeColor_stripedImageAlpha___block_invoke;
  v22[3] = &__block_descriptor_88_e20_v16__0__CGContext__8l;
  v22[4] = a5;
  v22[5] = a4;
  *(double *)&v22[6] = a6;
  v22[7] = 0;
  v22[8] = 0;
  *(double *)&v22[9] = v14;
  *(double *)&v22[10] = v16;
  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_drawImageWithSize:drawBlock:", v22, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v19 = a3 + 1.0 + v13;
  else
    v19 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_resizableImageFromOriginalImage:withCapInsets:resizingMode:", v18, a5 == 0, 0.0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __107__CUIKOccurrenceRenderer_renderColorBlockImageWithThickness_backgroundColor_stripeColor_stripedImageAlpha___block_invoke(uint64_t a1, CGContext *a2)
{
  void *v4;
  void *v5;
  id v6;
  CGColor *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "cuik_stripedImageWithBackgroundColor:stripeColor:scale:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CUIKScaleFactor());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithPatternImage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", *(double *)(a1 + 48));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (CGColor *)objc_msgSend(v6, "CGColor");

  }
  else
  {
    v7 = *(CGColor **)(a1 + 40);
  }
  CGContextSetFillColorWithColor(a2, v7);
  CGContextFillRect(a2, *(CGRect *)(a1 + 56));
}

+ (id)renderReminderBackgroundSelected:(BOOL)a3 stackDepth:(int)a4 userInterfaceStyle:(int64_t)a5 miniPreview:(BOOL)a6
{
  double v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v11[10];
  int v12;
  BOOL v13;
  BOOL v14;

  v6 = (double)(a4 - 1);
  v11[1] = 3221225472;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __101__CUIKOccurrenceRenderer_renderReminderBackgroundSelected_stackDepth_userInterfaceStyle_miniPreview___block_invoke;
  v11[3] = &__block_descriptor_86_e20_v16__0__CGContext__8l;
  v11[5] = 0;
  v11[6] = 0;
  v11[4] = a1;
  v11[7] = ceil((v6 * 0.75 + 2.0) * 4.0 + 3.0);
  v11[8] = ceil((v6 * 0.5 + 2.0) * 4.0 + 3.0);
  v13 = a3;
  v12 = a4;
  v11[9] = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_drawImageWithSize:drawBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ceil((v6 * 0.375 + 1.0) * 4.0);
  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_resizableImageFromOriginalImage:withCapInsets:resizingMode:", v7, 1, 4.0, v8, ceil((v6 * 0.5 + 1.0) * 4.0), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __101__CUIKOccurrenceRenderer_renderReminderBackgroundSelected_stackDepth_userInterfaceStyle_miniPreview___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderReminderInPreparedContext:bounds:selected:stackDepth:userInterfaceStyle:miniPreview:allDay:", a2, *(unsigned __int8 *)(a1 + 84), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 85), 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

+ (void)renderReminderInPreparedContext:(CGContext *)a3 bounds:(CGRect)a4 selected:(BOOL)a5 stackDepth:(int)a6 userInterfaceStyle:(int64_t)a7 miniPreview:(BOOL)a8 allDay:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  int v19;
  double v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  id v26;
  CGRect v27;
  CGRect v28;

  v9 = a9;
  v12 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a1, "reminderBackgroundColor:style:miniPreview:", a5, a7, a8);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v19 = a6 - 1;
  v20 = height + (double)(a6 - 1) * -2.0;
  objc_msgSend(a1, "reminderStrokeColor:stack:style:", v12, a6 > 1, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "drawReminderInContext:rect:fillColor:strokeColor:coveringReminderRect:allDay:", a3, v26, v21, v9, x, y, width, v20, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  if (a6 >= 2)
  {
    do
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = v20;
      v28 = CGRectInset(v27, 1.5, 0.0);
      v22 = v28.origin.x;
      v23 = v28.size.width;
      v24 = v28.size.height;
      v25 = v28.origin.y + 2.0;
      objc_msgSend(a1, "drawReminderInContext:rect:fillColor:strokeColor:coveringReminderRect:allDay:", a3, v26, v21, v9, v28.origin.x, v28.origin.y + 2.0);
      v20 = v24;
      width = v23;
      y = v25;
      x = v22;
      --v19;
    }
    while (v19);
  }

}

+ (void)drawReminderInContext:(CGContext *)a3 rect:(CGRect)a4 fillColor:(id)a5 strokeColor:(id)a6 coveringReminderRect:(CGRect)a7 allDay:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v19;
  id v20;
  BOOL IsNull;
  const CGPath *v22;
  const CGPath *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  const CGPath *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  id v32;
  CGSize v33;
  CGSize v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v14 = a4.size.height;
  v15 = a4.size.width;
  v16 = a4.origin.y;
  v17 = a4.origin.x;
  v19 = a5;
  v20 = a6;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  IsNull = CGRectIsNull(v35);
  v36.origin.x = v17;
  v36.origin.y = v16;
  v36.size.width = v15;
  v36.size.height = v14;
  v22 = CGPathCreateWithRoundedRect(v36, 4.0, 4.0, 0);
  v23 = 0;
  if (!IsNull)
  {
    CGContextBeginPath(a3);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v38 = CGRectInset(v37, 0.5, 0.5);
    v24 = v38.origin.x;
    v25 = v38.origin.y;
    v26 = v38.size.width;
    v27 = v38.size.height;
    v23 = CGPathCreateWithRoundedRect(v38, 3.75, 3.75, 0);
    CGContextAddPath(a3, v23);
    CGContextAddPath(a3, v22);
    CGContextClosePath(a3);
    CGContextEOClip(a3);
    CGContextBeginPath(a3);
    v39.origin.x = v24;
    v39.origin.y = v25;
    v39.size.width = v26;
    v39.size.height = v27;
    v40.origin.y = CGRectGetMaxY(v39) + -0.9;
    v40.size.height = v14 - (v40.origin.y - v16);
    v40.origin.x = v17;
    v40.size.width = v15;
    CGContextAddRect(a3, v40);
    CGContextClosePath(a3);
    CGContextClip(a3);
  }
  v32 = objc_retainAutorelease(v19);
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v32, "CGColor"));
  CGContextBeginPath(a3);
  CGContextAddPath(a3, v22);
  CGContextClosePath(a3);
  CGContextFillPath(a3);
  CGPathRelease(v22);
  if (v20 && !a8)
  {
    v41.origin.x = v17;
    v41.origin.y = v16;
    v41.size.width = v15;
    v41.size.height = v14;
    v42 = CGRectInset(v41, 0.5, 0.5);
    v28 = CGPathCreateWithRoundedRect(v42, v14 + -0.25, v14 + -0.25, 0);
    CGContextBeginPath(a3);
    CGContextAddPath(a3, v28);
    CGContextClosePath(a3);
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(objc_retainAutorelease(v20), "CGColor"));
    CGContextSetLineWidth(a3, 0.5);
    CGContextStrokePath(a3);
    CGPathRelease(v28);
  }
  if (!IsNull)
  {
    v29 = v14 * 0.5;
    v30 = *MEMORY[0x1E0C9D820];
    v31 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v33.width = *(CGFloat *)MEMORY[0x1E0C9D820];
    v33.height = v31;
    CGContextSetShadow(a3, v33, v29);
    CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(objc_retainAutorelease(v32), "CGColor"));
    CGContextBeginPath(a3);
    CGContextAddPath(a3, v23);
    CGContextClosePath(a3);
    CGContextFillPath(a3);
    v34.width = v30;
    v34.height = v31;
    CGContextSetShadowWithColor(a3, v34, 0.0, 0);
    CGContextResetClip(a3);
  }
  if (v23)
    CGPathRelease(v23);

}

+ (id)reminderBackgroundColor:(BOOL)a3 style:(int64_t)a4 miniPreview:(BOOL)a5
{
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color", a3, a4, a5);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKAdjustedColorForColor(v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKBackgroundColorForCalendarColorWithOpaqueForStyle(v9, 0, a4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "cuik_systemBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  return v6;
}

+ (id)reminderStrokeColor:(BOOL)a3 stack:(BOOL)a4 style:(int64_t)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D0C368], "getDebugColorStringForPreference:dark:", *MEMORY[0x1E0D0C048], a5 == 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CUIKColorFromString();
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v12 = (void *)v9;
    goto LABEL_12;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v6)
  {
    if (a5 == 2)
    {
      v10 = 0.407843137;
      v11 = 0.423529412;
    }
    else
    {
      v10 = 0.596078431;
      v11 = 0.611764706;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v10, v10, v11, 1.0);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (id)renderStrings:(id)a3 withSize:(CGSize)a4 font:(id)a5 edgeInsets:(UIEdgeInsets)a6 leadingIcon:(id)a7 trailingIcons:(id)a8
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  double v17;
  double v18;

  v17 = 0.0;
  v18 = 0.0;
  objc_msgSend(a1, "renderingBlockForStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:outImageSize:", a3, a5, a7, a8, &v17, a4.width, a4.height, a6.top, a6.left, a6.bottom, a6.right);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3870];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__CUIKOccurrenceRenderer_renderStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons___block_invoke;
  v15[3] = &unk_1E6EB6EF8;
  v16 = v8;
  v10 = v17;
  v11 = v18;
  v12 = v8;
  objc_msgSend(v9, "cuik_drawImageWithSize:drawBlock:", v15, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __91__CUIKOccurrenceRenderer_renderStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)renderingBlockForStrings:(id)a3 withSize:(CGSize)a4 font:(id)a5 edgeInsets:(UIEdgeInsets)a6 leadingIcon:(id)a7 trailingIcons:(id)a8 outImageSize:(CGSize *)a9
{
  double bottom;
  double top;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat MaxX;
  double MaxY;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v53;
  _QWORD aBlock[4];
  id v55;
  id v56;
  id v57;
  id v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  BOOL v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  bottom = a6.bottom;
  top = a6.top;
  height = a4.height;
  width = a4.width;
  v70 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  +[CUIKInterface shared](CUIKInterface, "shared");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "layoutDirectionOrOverride");

  v23 = 0.0;
  if (objc_msgSend(v20, "count"))
  {
    v53 = v22;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v24 = v20;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v66 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "size");
          v30 = v23 + v29;
          +[CUIKORImageUtils occurrencePadding](CUIKORImageUtils, "occurrencePadding");
          v23 = v30 + v31;
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v26);
    }

    v22 = v53;
  }
  if (width - v23 >= 50.0)
    v32 = v23;
  else
    v32 = 0.0;
  objc_msgSend(v17, "combinedString", width - v23);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "boundingRectWithSize:options:context:", 33, 0, width - v32, height);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v42 = bottom + v41;
  v71.origin.x = v35;
  v71.origin.y = v37;
  v71.size.width = v39;
  v71.size.height = v42;
  v43 = width - CGRectGetMinX(v71);
  v44 = top + v37;
  v72.origin.x = v35;
  v72.origin.y = v44;
  v72.size.width = v43;
  v72.size.height = v42;
  MaxX = CGRectGetMaxX(v72);
  v73.origin.x = v35;
  v73.origin.y = v44;
  v73.size.width = v43;
  v73.size.height = v42;
  MaxY = CGRectGetMaxY(v73);
  if (a9)
  {
    a9->width = MaxX;
    a9->height = MaxY;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize___block_invoke;
  aBlock[3] = &unk_1E6EB6F48;
  v59 = v35;
  v60 = v44;
  v61 = v43;
  v62 = v42;
  v63 = v32;
  v55 = v20;
  v56 = v18;
  v64 = v22 == 1;
  v57 = v19;
  v58 = v17;
  v47 = v17;
  v48 = v19;
  v49 = v18;
  v50 = v20;
  v51 = _Block_copy(aBlock);

  return v51;
}

void __115__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MaxX;
  double y;
  const char *v14;
  double v15;
  double v16;
  const char *v17;
  double v18;
  _QWORD *p_x;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double MinX;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  double v37;
  double v38;
  CGRect *v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  CGRect *v44;
  void *v45;
  BOOL v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  CGRect *v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;

  v63 = *MEMORY[0x1E0C80C00];
  v56 = 0;
  v57 = (CGRect *)&v56;
  v58 = 0x4010000000;
  v59 = &unk_1B8BDE616;
  v2 = *(_OWORD *)(a1 + 80);
  v60 = *(_OWORD *)(a1 + 64);
  v61 = v2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") && *(double *)(a1 + 96) > 0.0)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v53 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v7, "size");
          v9 = v8;
          v11 = v10;
          MaxX = CGRectGetMaxX(v57[1]);
          y = v57[1].origin.y;
          v15 = -[UIFont cuik_lineHeight](*(void **)(a1 + 40), v14);
          v16 = CUIKCeilToScreenScale(y + (v15 - v11) * 0.5);
          +[CUIKORImageUtils occurrencePadding](CUIKORImageUtils, "occurrencePadding");
          p_x = (_QWORD *)&v57->origin.x;
          v20 = v57[1].size.width - (v9 + v18);
          v57[1].size.width = v20;
          if (*(_BYTE *)(a1 + 104))
          {
            v21 = p_x[4];
            v22 = p_x[5];
            v23 = p_x[7];
            MinX = CGRectGetMinX(*(CGRect *)(&v20 - 2));
            +[CUIKORImageUtils occurrencePadding](CUIKORImageUtils, "occurrencePadding");
            v57[1].origin.x = v9 + v25 + v57[1].origin.x;
          }
          else
          {
            MinX = MaxX - v9;
          }
          -[UIImage cuik_drawAtPoint:](v7, v17, MinX, v16);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v4);
    }

  }
  v26 = *(void **)(a1 + 48);
  if (v26)
  {
    objc_msgSend(v26, "size");
    v28 = v27;
    v30 = v29;
    v31 = *(double *)(a1 + 64);
    v32 = *(double *)(a1 + 72);
    v34 = -[UIFont cuik_lineHeight](*(void **)(a1 + 40), v33);
    v36 = CUIKCeilToScreenScale(v32 + (v34 - v30) * 0.5);
    if (*(_BYTE *)(a1 + 104))
    {
      v37 = CGRectGetMaxX(v57[1]) - v28 + 1.0;
      v38 = v28 + 3.0 + -1.0;
      v39 = v57;
    }
    else
    {
      v37 = v31 + -1.0;
      v38 = v28 + 3.0 + -1.0;
      v39 = v57;
      v57[1].origin.x = v38 + v57[1].origin.x;
    }
    v39[1].size.width = v39[1].size.width - v38;
    -[UIImage cuik_drawAtPoint:](*(void **)(a1 + 48), v35, v37, v36);
  }
  objc_msgSend(*(id *)(a1 + 56), "trailingString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    objc_msgSend(*(id *)(a1 + 56), "trailingString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "drawWithRect:options:context:", 33, v41, v57[1].origin.x, v57[1].origin.y, v57[1].size.width, v57[1].size.height);

    objc_msgSend(v41, "totalBounds");
    v43 = CGRectGetWidth(v64) + 2.0;
    v44 = v57;
    v57[1].size.width = v57[1].size.width - v43;
    if (*(_BYTE *)(a1 + 104))
      v44[1].origin.x = v43 + v44[1].origin.x;

  }
  objc_msgSend(*(id *)(a1 + 56), "trailingString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45 || (v46 = CGRectGetWidth(v57[1]) < 10.0, v45, !v46))
  {
    objc_msgSend(*(id *)(a1 + 56), "nonNilComponents");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __115__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize___block_invoke_2;
    v49[3] = &unk_1E6EB6F20;
    v51 = &v56;
    v48 = v47;
    v50 = v48;
    objc_msgSend(v48, "enumerateObjectsUsingBlock:", v49);

  }
  _Block_object_dispose(&v56, 8);
}

void __115__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double Height;
  id v8;
  CGRect v9;

  v8 = a2;
  objc_msgSend(v8, "boundingRectWithSize:options:context:", 33, 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  Height = CGRectGetHeight(v9);
  if (Height > CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)))
    goto LABEL_5;
  objc_msgSend(v8, "drawWithRect:options:context:", 33, 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 56)
                                                              - Height;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = Height
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 != a3)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 56)
                                                                + -1.0;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + 1.0;
  }
  if (CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)) <= 0.0)
LABEL_5:
    *a4 = 1;

}

@end
