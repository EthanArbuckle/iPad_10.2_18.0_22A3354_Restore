@implementation CKMomentShareStatusBalloonView

- (CKMomentShareStatusBalloonView)initWithFrame:(CGRect)a3
{
  CKMomentShareStatusBalloonView *v3;
  void *v4;
  uint64_t v5;
  UIImageView *iconImageView;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *primaryLabel;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *secondaryLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKMomentShareStatusBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "px_imageNamed:", CFSTR("PXMessagesPlaceholderIcon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v5;

    -[UIImageView setContentMode:](v3->_iconImageView, "setContentMode:", 1);
    -[UIImageView _setContinuousCornerRadius:](v3->_iconImageView, "_setContinuousCornerRadius:", 10.0);
    -[UIImageView setClipsToBounds:](v3->_iconImageView, "setClipsToBounds:", 1);
    -[CKMomentShareStatusBalloonView addSubview:](v3, "addSubview:", v3->_iconImageView);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB548]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v10;

    v12 = v3->_primaryLabel;
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CKMomentShareStatusBalloonViewTitle"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12, "setText:", v14);

    -[UILabel setFont:](v3->_primaryLabel, "setFont:", v9);
    -[UILabel setNumberOfLines:](v3->_primaryLabel, "setNumberOfLines:", 0);
    -[CKMomentShareStatusBalloonView addSubview:](v3, "addSubview:", v3->_primaryLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v15;

    v17 = v3->_secondaryLabel;
    objc_msgSend((id)objc_opt_class(), "_secondaryLabelString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v17, "setText:", v18);

    -[UILabel setFont:](v3->_secondaryLabel, "setFont:", v9);
    -[UILabel setNumberOfLines:](v3->_secondaryLabel, "setNumberOfLines:", 0);
    v19 = v3->_secondaryLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    -[CKMomentShareStatusBalloonView addSubview:](v3, "addSubview:", v3->_secondaryLabel);
  }
  return v3;
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  _QWORD block[5];
  CGSize result;

  height = a3.height;
  width = a3.width;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CKMomentShareStatusBalloonView_sizeThatFits___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sizeThatFits__predicate != -1)
    dispatch_once(&sizeThatFits__predicate, block);
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width > 0.0 && height > 0.0)
  {
    objc_msgSend((id)sizeThatFits___measurementView, "setFrame:", 0.0, 0.0, width, height);
    objc_msgSend((id)sizeThatFits___measurementView, "sizeThatFits:", width, height);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

void __47__CKMomentShareStatusBalloonView_sizeThatFits___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sizeThatFits___measurementView;
  sizeThatFits___measurementView = (uint64_t)v1;

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CKMomentShareStatusBalloonView _performLayoutInSize:updateSubviewFrames:](self, "_performLayoutInSize:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMomentShareStatusBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v5, sel_layoutSubviews);
  -[CKMomentShareStatusBalloonView bounds](self, "bounds");
  -[CKMomentShareStatusBalloonView _performLayoutInSize:updateSubviewFrames:](self, "_performLayoutInSize:updateSubviewFrames:", 1, v3, v4);
}

+ (id)_secondaryLabelString
{
  abort();
}

- (CGSize)_performLayoutInSize:(CGSize)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double MaxY;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double rect;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MaxX;
  double v52;
  double v53;
  double v54;
  char v55;
  CGSize result;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v4 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
  objc_msgSend(v6, "balloonMaskTailSizeForTailShape:", v55);
  v8 = v7;

  v9 = -[CKBalloonView orientation](self, "orientation");
  v10 = 10.0;
  v11 = v8 + 10.0;
  if (v9)
    v12 = 10.0;
  else
    v12 = v8 + 10.0;
  if (v9)
    v13 = v11;
  else
    v13 = 10.0;
  v53 = v13;
  PXEdgeInsetsInsetSize();
  v15 = v14;
  v17 = v16;
  v57.origin.y = 10.0;
  v57.origin.x = v12;
  v57.size.width = 50.0;
  v57.size.height = 50.0;
  v18 = fmax(v12, CGRectGetMaxX(v57));
  v58.origin.y = 10.0;
  v46 = v12;
  v58.origin.x = v12;
  v58.size.width = 50.0;
  v58.size.height = 50.0;
  v48 = fmax(CGRectGetMaxY(v58), 10.0);
  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v15 + -60.0, v17);
  v20 = v19;
  v22 = v21;
  v44 = v17;
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v15 + -60.0, v17);
  v24 = v23;
  v26 = v25;
  v52 = v18;
  v27 = v18 + 10.0;
  v59.origin.y = 10.0;
  v59.origin.x = v18 + 10.0;
  v59.size.width = v20;
  v59.size.height = v22;
  MaxX = CGRectGetMaxX(v59);
  v60.origin.x = v18 + 10.0;
  v60.origin.y = v22 + 10.0 + 5.0;
  v60.size.width = v24;
  v60.size.height = v26;
  v50 = CGRectGetMaxX(v60);
  v61.origin.y = 10.0;
  v61.origin.x = v18 + 10.0;
  v61.size.width = v20;
  v47 = v22;
  v61.size.height = v22;
  MaxY = CGRectGetMaxY(v61);
  v62.origin.x = v27;
  v42 = v22 + 10.0 + 5.0;
  v62.origin.y = v42;
  v62.size.width = v24;
  v54 = v26;
  v62.size.height = v26;
  v49 = fmax(v48, fmax(MaxY, CGRectGetMaxY(v62)));
  -[CKMomentShareStatusBalloonView traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayScale");
  if (v30 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");

  }
  PXFloatFloorToPixel();
  v33 = v32 + 10.0;
  if (v33 + -10.0 <= 0.0)
    v33 = 10.0;
  rect = v33;
  PXFloatFloorToPixel();
  v35 = v34 + 10.0 + -10.0;
  if (v35 <= 0.0)
    v36 = -0.0;
  else
    v36 = v35;
  if (v35 > 0.0)
    v10 = v35 + 10.0;
  v37 = v27;
  v38 = v46;
  if (-[CKMomentShareStatusBalloonView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection", *(_QWORD *)&v42) == 1)
  {
    v63.origin.y = 10.0;
    v63.origin.x = v46;
    v63.size.height = v44;
    v63.size.width = v15;
    v38 = CGRectGetMaxX(v63) + -50.0;
    v64.size.width = 50.0;
    v64.origin.x = v38;
    v64.origin.y = rect;
    v64.size.height = 50.0;
    v39 = CGRectGetMinX(v64) + -10.0;
    v37 = v39 - v20;
    v27 = v39 - v24;
  }
  if (v4)
  {
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v38, rect, 50.0, 50.0);
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v37, v10, v20, v47);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v27, v43 + v36, v24, v54);
  }
  v40 = v53 + fmax(v52, fmax(MaxX, v50));
  v41 = v49 + 10.0;
  result.height = v41;
  result.width = v40;
  return result;
}

- (char)color
{
  return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
