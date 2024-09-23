@implementation SLSheetPhotoAlbumImageView

+ (unint64_t)displayedFrameMaximum
{
  return 3;
}

- (SLSheetPhotoAlbumImageView)initWithPrincipalAttachments:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SLSheetPhotoAlbumImageView *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *frameViews;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  UILabel *imageCountLabel;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SLSheetPhotoAlbumImageView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[SLSheetImagePreviewView initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (v9)
  {
    v9->_imageQuantity = objc_msgSend(v4, "count");
    v9->_allAttachmentsAreImages = 1;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (objc_msgSend(v15, "type") && objc_msgSend(v15, "type") != 2)
          {
            v9->_allAttachmentsAreImages = 0;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_13:

    v16 = objc_msgSend(v10, "count");
    if (v16 >= 3)
      v17 = 3;
    else
      v17 = v16;
    objc_msgSend(v10, "subarrayWithRange:", 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetImagePreviewView setPrincipalAttachments:](v9, "setPrincipalAttachments:", v18);

    v19 = objc_opt_new();
    frameViews = v9->_frameViews;
    v9->_frameViews = (NSMutableArray *)v19;

    v47.receiver = v9;
    v47.super_class = (Class)SLSheetPhotoAlbumImageView;
    -[SLSheetImagePreviewView intrinsicContentSize](&v47, sel_intrinsicContentSize);
    v22 = v21;
    v24 = v23;
    -[SLSheetImagePreviewView principalAttachments](v9, "principalAttachments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v27 = 0;
      v28 = *MEMORY[0x1E0CEC320];
      do
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 0.0, 0.0, v22, v24);
        objc_msgSend(v29, "setClipsToBounds:", 1);
        -[NSMutableArray addObject:](v9->_frameViews, "addObject:", v29);
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.8, 1.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setBackgroundColor:", v30);

        objc_msgSend(v29, "setContentMode:", 2);
        -[SLSheetPhotoAlbumImageView addSubview:](v9, "addSubview:", v29);
        objc_msgSend(v29, "_setVisualAltitude:", v28);
        ++v27;
        objc_msgSend(v29, "_setVisualAltitudeBias:", (double)(int)v27 * 0.333339989, (double)(int)v27 * 0.333339989);

        -[SLSheetImagePreviewView principalAttachments](v9, "principalAttachments");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

      }
      while (v32 > v27);
    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    imageCountLabel = v9->_imageCountLabel;
    v9->_imageCountLabel = (UILabel *)v33;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_imageCountLabel, "setFont:", v35);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_imageCountLabel, "setTextColor:", v36);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9->_imageCountLabel, "setBackgroundColor:", v37);

    -[SLSheetPhotoAlbumImageView _itemCountString](v9, "_itemCountString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_imageCountLabel, "setText:", v38);

    -[UILabel setTextAlignment:](v9->_imageCountLabel, "setTextAlignment:", 1);
    -[UILabel sizeToFit](v9->_imageCountLabel, "sizeToFit");
    LODWORD(v39) = 1144750080;
    -[SLSheetPhotoAlbumImageView setContentHuggingPriority:forAxis:](v9, "setContentHuggingPriority:forAxis:", 0, v39);
    LODWORD(v40) = 1144750080;
    -[SLSheetPhotoAlbumImageView setContentHuggingPriority:forAxis:](v9, "setContentHuggingPriority:forAxis:", 1, v40);
    LODWORD(v41) = 1144750080;
    -[SLSheetPhotoAlbumImageView setContentCompressionResistancePriority:forAxis:](v9, "setContentCompressionResistancePriority:forAxis:", 0, v41);
    LODWORD(v42) = 1144750080;
    -[SLSheetPhotoAlbumImageView setContentCompressionResistancePriority:forAxis:](v9, "setContentCompressionResistancePriority:forAxis:", 1, v42);
    -[SLSheetPhotoAlbumImageView sizeToFit](v9, "sizeToFit");
    -[SLSheetPhotoAlbumImageView layer](v9, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setShouldRasterize:", 1);

    -[SLSheetPhotoAlbumImageView layer](v9, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scale");
    objc_msgSend(v44, "setRasterizationScale:");

    -[SLSheetPhotoAlbumImageView setNeedsLayout](v9, "setNeedsLayout");
  }

  return v9;
}

- (void)addPreviewImage:(id)a3
{
  unint64_t numPreviewImagesAdded;
  void *v5;
  id v6;

  v6 = a3;
  numPreviewImagesAdded = self->_numPreviewImagesAdded;
  if (numPreviewImagesAdded < -[NSMutableArray count](self->_frameViews, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_frameViews, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_frameViews, "count") + ~self->_numPreviewImagesAdded);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);
    ++self->_numPreviewImagesAdded;

  }
}

- (BOOL)_shouldDisplayImageCountLabel
{
  void *v3;
  BOOL v4;

  -[SLSheetPhotoAlbumImageView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass") == 2
    && (unint64_t)-[NSMutableArray count](self->_frameViews, "count") > 1;

  return v4;
}

- (id)_itemCountString
{
  _BOOL4 allAttachmentsAreImages;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  allAttachmentsAreImages = self->_allAttachmentsAreImages;
  v4 = (void *)MEMORY[0x1E0CB3940];
  SLSocialFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (allAttachmentsAreImages)
    v7 = CFSTR("SHEET_IMAGE_COUNT_STRING");
  else
    v7 = CFSTR("SHEET_ITEM_COUNT_STRING");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E7592238, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_imageQuantity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithLocale:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  CGSize result;

  v18.receiver = self;
  v18.super_class = (Class)SLSheetPhotoAlbumImageView;
  -[SLSheetImagePreviewView intrinsicContentSize](&v18, sel_intrinsicContentSize);
  v5 = v4;
  v7 = v6;
  if (-[SLSheetPhotoAlbumImageView _shouldDisplayImageCountLabel](self, "_shouldDisplayImageCountLabel"))
  {
    v8 = v7 + 14.5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = v10;

    if (v11 <= 1.0)
      v12 = 3.0;
    else
      v12 = 2.5;
    v8 = v7 + v12 * (double)(unint64_t)(-[NSMutableArray count](self->_frameViews, "count") - 1);
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v5, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLSheetPhotoAlbumImageView _shouldDisplayImageCountLabel](self, "_shouldDisplayImageCountLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_frameViews, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLSheetPhotoAlbumImageView intrinsicContentSize returning %@ _shouldDisplayImageCountLabel %@ _frameViews.count %@"));

  v15 = v5;
  v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLSheetPhotoAlbumImageView;
  -[SLSheetImagePreviewView traitCollectionDidChange:](&v17, sel_traitCollectionDidChange_, v5);
  if ((unint64_t)-[NSMutableArray count](self->_frameViews, "count") >= 2)
  {
    -[SLSheetPhotoAlbumImageView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "verticalSizeClass");
    v8 = objc_msgSend(v5, "verticalSizeClass");

    if (v7 != v8)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      -[SLSheetPhotoAlbumImageView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "verticalSizeClass"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v3, 7, CFSTR("SLSheetPhotoAlbumImageView will invalidateIntrinsicContentSize new verticalSizeClass %@"));

      -[SLSheetPhotoAlbumImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v16);
    }
  }
  -[SLSheetPhotoAlbumImageView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_imageCountLabel, "setFont:", v15);

  }
}

- (void)sizeToFit
{
  double v3;
  double v4;

  -[SLSheetPhotoAlbumImageView intrinsicContentSize](self, "intrinsicContentSize");
  -[SLSheetPhotoAlbumImageView setBounds:](self, "setBounds:", 0.0, 0.0, v3, v4);
}

- (void)layoutSubviews
{
  uint64_t v2;
  NSMutableArray *frameViews;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  UILabel *imageCountLabel;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  _QWORD v26[7];
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[SLSheetPhotoAlbumImageView bounds](self, "bounds");
  NSStringFromCGRect(v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLSheetPhotoAlbumImageView bounds %@"));

  v27.receiver = self;
  v27.super_class = (Class)SLSheetPhotoAlbumImageView;
  -[SLSheetImagePreviewView intrinsicContentSize](&v27, sel_intrinsicContentSize, v24);
  frameViews = self->_frameViews;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __44__SLSheetPhotoAlbumImageView_layoutSubviews__block_invoke;
  v26[3] = &unk_1E7590D98;
  v26[5] = v5;
  v26[6] = v6;
  v26[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](frameViews, "enumerateObjectsUsingBlock:", v26);
  v7 = -[SLSheetPhotoAlbumImageView _shouldDisplayImageCountLabel](self, "_shouldDisplayImageCountLabel");
  imageCountLabel = self->_imageCountLabel;
  if (v7)
  {
    -[UILabel superview](imageCountLabel, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[SLSheetPhotoAlbumImageView addSubview:](self, "addSubview:", self->_imageCountLabel);
    -[NSMutableArray lastObject](self->_frameViews, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[UILabel frame](self->_imageCountLabel, "frame");
    v20 = v19;
    v22 = v21;
    v29.origin.x = v12;
    v29.origin.y = v14;
    v29.size.width = v16;
    v29.size.height = v18;
    v23 = CGRectGetMaxY(v29) + 4.0;
    -[UILabel setFrame:](self->_imageCountLabel, "setFrame:", v20, v23, v16, v22);
    v30.origin.x = v20;
    v30.origin.y = v23;
    v30.size.width = v16;
    v30.size.height = v22;
    NSStringFromCGRect(v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v2, 7, CFSTR("SLSheetPhotoAlbumImageView labelFrame %@"));

  }
  else
  {
    -[UILabel removeFromSuperview](imageCountLabel, "removeFromSuperview");
  }
}

void __44__SLSheetPhotoAlbumImageView_layoutSubviews__block_invoke(double *a1, void *a2, unint64_t a3)
{
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  CGFloat v9;
  uint64_t v10;
  double x;
  double width;
  double height;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v5 = a1[5];
  v6 = a1[6];
  v7 = *(void **)(*((_QWORD *)a1 + 4) + 456);
  v19 = a2;
  v8 = objc_msgSend(v7, "count");
  v9 = (float)((float)(v8 + ~a3) + (float)(v8 + ~a3));
  v10 = objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 456), "count");
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v5;
  v20.size.height = v6;
  v21 = CGRectInset(v20, v9, (float)((float)(v10 + ~a3) + (float)(v10 + ~a3)));
  x = v21.origin.x;
  width = v21.size.width;
  height = v21.size.height;
  v14 = (double)a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;

  v18 = 3.0;
  if (v17 > 1.0)
    v18 = 2.5;
  objc_msgSend(v19, "setFrame:", x, v18 * v14, width, height);

}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCountLabel, 0);
  objc_storeStrong((id *)&self->_frameViews, 0);
  objc_storeStrong((id *)&self->_glossLayer, 0);
  objc_storeStrong((id *)&self->_frameLayer, 0);
}

@end
