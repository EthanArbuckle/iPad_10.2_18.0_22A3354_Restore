@implementation MKTransitInfoPreloader

- (MKTransitInfoPreloader)initWithTransitLabels:(id)a3
{
  id v4;
  MKTransitInfoPreloader *v5;
  uint64_t v6;
  NSArray *transitLabels;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTransitInfoPreloader;
  v5 = -[MKTransitInfoPreloader init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    transitLabels = v5->_transitLabels;
    v5->_transitLabels = (NSArray *)v6;

  }
  return v5;
}

+ (id)attributedTextFromPreload:(id)a3 view:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v5 = a4;
  objc_msgSend(a3, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v5, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "capHeight");
  v10 = v9;

  v11 = *MEMORY[0x1E0CEA050];
  v12 = objc_msgSend(v7, "length");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__MKTransitInfoPreloader_attributedTextFromPreload_view___block_invoke;
  v15[3] = &unk_1E20D8C30;
  v17 = v10;
  v16 = v5;
  v13 = v5;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v15);

  return v7;
}

void __57__MKTransitInfoPreloader_attributedTextFromPreload_view___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v6;
      objc_msgSend(v2, "image");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "size");
      UIRoundToViewScale();
      v5 = v4;

      objc_msgSend(v2, "setVerticalOffset:", v5);
    }
  }

}

- (void)preloadWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int IsRightToLeft;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  id v17;
  const __CFString *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MKTransitInfoPreloader *v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  int64_t v30;
  int64_t v31;
  uint64_t v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;

  v4 = a3;
  if (v4)
  {
    if (-[NSArray count](self->_transitLabels, "count"))
    {
      +[MKFontManager sharedManager](MKFontManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "smallAttributionFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scale");
      v9 = v8;

      +[MKTransitInfoLabelView stringAttributesForFont:lineBreakMode:](MKTransitInfoLabelView, "stringAttributesForFont:lineBreakMode:", v6, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredContentSizeCategory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = +[MKTransitInfoLabelView shieldSizeForContentSizeCategory:](MKTransitInfoLabelView, "shieldSizeForContentSizeCategory:", v13);
      v15 = +[MKTransitInfoLabelView iconSizeForContentSizeCategory:](MKTransitInfoLabelView, "iconSizeForContentSizeCategory:", v13);
      +[MKArtworkDataSourceCache sharedInstance](MKArtworkDataSourceCache, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = __Block_byref_object_copy__3;
      v34[4] = __Block_byref_object_dispose__3;
      v17 = objc_alloc(MEMORY[0x1E0CB3778]);
      if (IsRightToLeft)
        v18 = CFSTR("\u200F");
      else
        v18 = CFSTR("\u200E");
      v35 = (id)objc_msgSend(v17, "initWithString:attributes:", v18, v10);
      dispatch_get_global_queue(2, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke;
      v23[3] = &unk_1E20D8C80;
      v24 = v10;
      v25 = self;
      v30 = v15;
      v31 = v14;
      v32 = v9;
      v26 = v16;
      v27 = v6;
      v33 = xmmword_18B2A9500;
      v29 = v34;
      v28 = v4;
      v20 = v6;
      v21 = v16;
      v22 = v10;
      dispatch_async(v19, v23);

      _Block_object_dispose(v34, 8);
    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  MKTransitInfoPreload *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_commaListDelimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, *(_QWORD *)(a1 + 32));

  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke_2;
  v16[3] = &unk_1E20D8C58;
  v27 = *(_OWORD *)(a1 + 80);
  v17 = v7;
  v28 = *(_QWORD *)(a1 + 96);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 40);
  v18 = v9;
  v19 = v10;
  v11 = v2;
  v20 = v11;
  v24 = v30;
  v29 = *(_OWORD *)(a1 + 104);
  v25 = v32;
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 72);
  v21 = v12;
  v26 = v13;
  v14 = v6;
  v22 = v14;
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 0, v16);
  v15 = -[MKTransitInfoPreload initWithAttributedString:]([MKTransitInfoPreload alloc], "initWithAttributedString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  UIImage *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  MKImageTextAttachment *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  MKEmptyTextAttachment *v26;
  MKEmptyTextAttachment *v27;
  id v28;

  v28 = a2;
  v5 = objc_msgSend(v28, "type");
  if (v5 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_mapkit_lineHeight");
    objc_msgSend((id)objc_opt_class(), "separatorImageWithLineHeight:", v11);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
    if (v10)
      goto LABEL_9;
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (v5 == 2)
  {
    objc_msgSend(v28, "labelString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  if (v5 != 1)
  {
    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v28, "labelArtwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "artworkSourceType");
  v8 = v7 == 2;
  v9 = 120;
  if (v7 == 2)
    v9 = 112;
  objc_msgSend(*(id *)(a1 + 32), "imageForArtwork:size:featureType:scale:nightMode:", v6, *(_QWORD *)(a1 + v9), 2, 0, *(double *)(a1 + 128));
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_14;
LABEL_9:
  UIImagePNGRepresentation(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v12) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
    v15 = 136;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      v16 = 136;
    else
      v16 = 144;
    v17 = 0.0;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      v18 = *(double *)(a1 + v16);
    else
      v18 = 0.0;
    if (!v8)
      v15 = 144;
    v19 = *(double *)(a1 + v15);
    if (a3 + 1 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "count"))
      v17 = v19;
    v27 = -[MKEmptyTextAttachment initWithWidth:]([MKEmptyTextAttachment alloc], "initWithWidth:", v18);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MKEmptyTextAttachment initWithWidth:]([MKEmptyTextAttachment alloc], "initWithWidth:", v17);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MKImageTextAttachment initWithImage:verticalOffset:]([MKImageTextAttachment alloc], "initWithImage:verticalOffset:", v10, 0.0);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(v14, "appendAttributedString:", v25);
    objc_msgSend(v14, "appendAttributedString:", v22);
    objc_msgSend(v14, "appendAttributedString:", v20);
    v23 = *MEMORY[0x1E0CEA0A0];
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v23, v24, 0, objc_msgSend(v14, "length"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v8;

    v13 = 0;
    if (v14)
      goto LABEL_21;
    goto LABEL_22;
  }
  v13 = 0;
LABEL_16:
  if (objc_msgSend(v13, "length") && (objc_msgSend(*(id *)(a1 + 64), "containsObject:", v13) & 1) == 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "appendAttributedString:", *(_QWORD *)(a1 + 72));
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, *(_QWORD *)(a1 + 80));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);
    if (v14)
    {
LABEL_21:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "appendAttributedString:", v14, v25);

    }
  }
LABEL_22:

}

+ (id)separatorImageWithLineHeight:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGContext *CurrentContext;
  void *v15;
  CGSize v17;
  CGRect v18;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nativeScale");
  v5 = 1.0;
  if (v6 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nativeScale");
    v5 = v8;

  }
  v9 = 1.0 / v5;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;
  v17.width = v9;
  v17.height = a3;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);

  objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFill");

  CurrentContext = UIGraphicsGetCurrentContext();
  v18.origin.y = a3 * 0.125;
  v18.size.height = a3 * 0.75;
  v18.origin.x = 0.0;
  v18.size.width = v9;
  CGContextFillRect(CurrentContext, v18);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLabels, 0);
}

@end
