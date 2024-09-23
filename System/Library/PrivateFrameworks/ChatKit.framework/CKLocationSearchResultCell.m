@implementation CKLocationSearchResultCell

- (CKLocationSearchResultCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKLocationSearchResultCell *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CKLocationSearchResultCell;
  v7 = -[CKLocationSearchResultCell initWithFrame:](&v19, sel_initWithFrame_);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v8, "setContentMode:", 2);
    -[CKEditableSearchResultCell setImageView:](v7, "setImageView:", v8);
    -[CKLocationSearchResultCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    v10 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithEffect:", v11);

    -[CKLocationSearchResultCell setBlurEffectView:](v7, "setBlurEffectView:", v12);
    -[CKLocationSearchResultCell contentView](v7, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v12);

    v14 = objc_alloc(MEMORY[0x1E0CEA700]);
    v15 = (void *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v15, "setNumberOfLines:", 1);
    -[CKLocationSearchResultCell setPlaceLabel:](v7, "setPlaceLabel:", v15);
    -[CKLocationSearchResultCell contentView](v7, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__thumbnailGenerated_, CFSTR("CKSearchThumbnailDidChange"), 0);

  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  CGFloat v31;
  void *v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double Width;
  double v52;
  double Height;
  double v54;
  void *v55;
  CGFloat rect;
  double v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v58.receiver = self;
  v58.super_class = (Class)CKLocationSearchResultCell;
  -[CKEditableSearchResultCell layoutSubviews](&v58, sel_layoutSubviews);
  -[CKLocationSearchResultCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CKLocationSearchResultCell layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldRasterize:", 1);

  -[CKLocationSearchResultCell traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v16 = v15;
  -[CKLocationSearchResultCell layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRasterizationScale:", v16);

  -[CKLocationSearchResultCell placeLabel](self, "placeLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

  v57 = v9;
  v19 = v9 + -20.0;
  -[CKLocationSearchResultCell placeLabel](self, "placeLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", v9 + -20.0, v11 + -20.0);
  v22 = v21;
  v24 = v23;

  if (v22 >= v9 + -20.0)
    v22 = v9 + -20.0;
  v59.origin.x = v5;
  v59.origin.y = v7;
  v59.size.width = v9;
  v59.size.height = v11;
  v25 = CGRectGetMaxY(v59) + -10.0;
  -[CKLocationSearchResultCell placeLabel](self, "placeLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", 10.0, v25, v22, v24);

  -[CKLocationSearchResultCell placeLabel](self, "placeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60.origin.y = v7 + 10.0;
  v60.origin.x = v5 + 10.0;
  v60.size.width = v19;
  v60.size.height = v11 + -20.0;
  objc_msgSend(v27, "_setLastLineBaselineFrameOriginY:", CGRectGetMaxY(v60));

  -[CKLocationSearchResultCell placeLabel](self, "placeLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_firstLineCapFrameOriginY");
  v30 = v29 + -10.0;

  v61.origin.x = v5;
  v61.origin.y = v7;
  v61.size.width = v57;
  rect = v11;
  v61.size.height = v11;
  v31 = CGRectGetHeight(v61) - v30;
  -[CKLocationSearchResultCell blurEffectView](self, "blurEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  v34 = v30;
  v35 = v57;
  objc_msgSend(v32, "setFrame:", v5, v34, v57, v31);

  -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = -[CKLocationSearchResultCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[CKLocationSearchResultCell contentView](self, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bringSubviewToFront:", v39);

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeToFit");

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "frame");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;

    v50 = 4.0;
    if ((v37 & 1) == 0)
    {
      v62.origin.x = v33;
      v62.origin.y = v7;
      v62.size.width = v57;
      v62.size.height = rect;
      Width = CGRectGetWidth(v62);
      v63.origin.x = v43;
      v63.origin.y = v45;
      v63.size.width = v47;
      v63.size.height = v49;
      v52 = Width - CGRectGetWidth(v63);
      v35 = v57;
      v50 = v52 + -4.0;
    }
    v64.origin.x = v33;
    v64.origin.y = v7;
    v64.size.width = v35;
    v64.size.height = rect;
    Height = CGRectGetHeight(v64);
    v65.origin.x = v50;
    v65.origin.y = v45;
    v65.size.width = v47;
    v65.size.height = v49;
    v54 = Height - CGRectGetHeight(v65) + -4.0;
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFrame:", v50, v54, v47, v49);

  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKLocationSearchResultCell;
  -[CKEditableSearchResultCell prepareForReuse](&v5, sel_prepareForReuse);
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[CKLocationSearchResultCell placeLabel](self, "placeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

  -[CKLocationSearchResultCell setResult:](self, "setResult:", 0);
  -[CKLocationSearchResultCell setSearchText:](self, "setSearchText:", 0);
  -[CKLocationSearchResultCell setMode:](self, "setMode:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKLocationSearchResultCell;
  -[CKLocationSearchResultCell dealloc](&v4, sel_dealloc);
}

+ (id)reuseIdentifier
{
  return CFSTR("LocationSearchCell");
}

- (NSString)resultIdentifier
{
  void *v2;
  void *v3;

  -[CKLocationSearchResultCell result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  -[CKLocationSearchResultCell setResult:](self, "setResult:", v22);
  -[CKLocationSearchResultCell setSearchText:](self, "setSearchText:", v8);
  -[CKLocationSearchResultCell setMode:](self, "setMode:", a5);
  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationSearchResultCell traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hasCachedMapPreviewForQueryResult:traitCollection:", v22, v10);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationSearchResultCell traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v12, "generateMapPreviewForQueryResult:traitCollection:", v22, v13);

LABEL_5:
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationSearchResultCell traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mapPlaceholderImageForTraitCollection:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v12, "cachedMapPreviewForQueryResult:traitCollection:", v22, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_5;
LABEL_6:
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v14);

  -[CKLocationSearchResultCell _configurePlaceLabelWithResult:searchText:](self, "_configurePlaceLabelWithResult:searchText:", v22, v8);
  -[CKLocationSearchResultCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClipsToBounds:", 1);

  -[CKLocationSearchResultCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "searchLocationCellCornerRadius");
  objc_msgSend(v20, "setCornerRadius:");

  -[CKLocationSearchResultCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)refreshForSearchTextIfNeeded:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKLocationSearchResultCell result](self, "result");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKLocationSearchResultCell _configurePlaceLabelWithResult:searchText:](self, "_configurePlaceLabelWithResult:searchText:", v5, v4);

}

- (void)_configurePlaceLabelWithResult:(id)a3 searchText:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CKLocationSearchResultCell *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = a4;
  objc_msgSend(a3, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__ck_spotlightItemSnippet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Current Location")) & 1) != 0
    || (CKFrameworkBundle(),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Current Location"), &stru_1E276D870, CFSTR("ChatKit")), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v8, "isEqualToString:", v10), v10, v9, v11))
  {
    objc_msgSend(v6, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "__ck_itemContentCreationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationRelativeDateFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringFromDate:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LOCATION_FOOTER_DETAILS_VIEW"), &stru_1E276D870, CFSTR("ChatKit"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

    if (v22 == 1)
      v23 = CFSTR("\u200F");
    else
      v23 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v20);
    v24 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v24;
  }
  v25 = objc_msgSend(v8, "length");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "conversationListCellMaxSummaryLength");

  if (v25 > v27)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringWithRange:", 0, objc_msgSend(v28, "conversationListCellMaxSummaryLength"));
    v29 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v29;
  }
  if (v8)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "theme");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "conversationListSummaryColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "searchResultLabelFont");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "theme");
    v40 = self;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "conversationListSenderColor");
    v43 = v6;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "searchResultLabelFont");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:](CKSpotlightQueryUtilities, "annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:", v44, v8, v30, v32, v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKLocationSearchResultCell placeLabel](v40, "placeLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAttributedText:", v38);

    v6 = v43;
  }

}

- (void)_thumbnailGenerated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "object");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationSearchResultCell result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationSearchResultCell traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedMapPreviewForQueryResult:traitCollection:", v15, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CKEditableSearchResultCell imageView](self, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v10);
    }
    else
    {
      +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLocationSearchResultCell traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mapPlaceholderImageForTraitCollection:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKEditableSearchResultCell imageView](self, "imageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v11);

    }
    -[CKLocationSearchResultCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKLocationSearchResultCell;
  -[CKLocationSearchResultCell traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[CKLocationSearchResultCell result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationSearchResultCell searchText](self, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationSearchResultCell configureWithQueryResult:searchText:mode:](self, "configureWithQueryResult:searchText:mode:", v4, v5, -[CKLocationSearchResultCell mode](self, "mode"));

}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (UILabel)placeLabel
{
  return self->_placeLabel;
}

- (void)setPlaceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_placeLabel, a3);
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffectView, a3);
}

- (CKSpotlightQueryResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_searchText, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_placeLabel, 0);
}

@end
