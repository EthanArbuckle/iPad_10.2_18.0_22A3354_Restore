@implementation CKPinnedConversationDropTargetCollectionViewCell

+ (NSString)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (NSString)uniqueIdentifier
{
  return (NSString *)CFSTR("PinnedConversationDropTarget");
}

+ (id)uniqueIdentifierForDropTargetAtItemIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%li"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKPinnedConversationDropTargetCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKPinnedConversationDropTargetCollectionViewCell *v7;
  CKPinnedConversationDropTargetCollectionViewCell *v8;
  void *v9;
  id v10;
  uint64_t v11;
  UILabel *instructionLabel;
  UILabel *v13;
  void *v14;
  void *v15;
  CKDropZoneCircleView *v16;
  CKDropZoneCircleView *dropZoneCircleView;
  CKPinnedConversationView *v18;
  CKPinnedConversationView *prototypeConversationView;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CKPinnedConversationDropTargetCollectionViewCell;
  v7 = -[CKPinnedConversationDropTargetCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[CKPinnedConversationDropTargetCollectionViewCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[CKPinnedConversationDropTargetCollectionViewCell bounds](v8, "bounds");
    v11 = objc_msgSend(v10, "initWithFrame:");
    instructionLabel = v8->_instructionLabel;
    v8->_instructionLabel = (UILabel *)v11;

    v13 = v8->_instructionLabel;
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PIN_CONVERSATION_DROP_TARGET_LABEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v13, "setText:", v15);

    -[UILabel setNumberOfLines:](v8->_instructionLabel, "setNumberOfLines:", 3);
    -[UILabel setTextAlignment:](v8->_instructionLabel, "setTextAlignment:", 1);
    -[CKPinnedConversationDropTargetCollectionViewCell _updateInstructionLabelColor](v8, "_updateInstructionLabelColor");
    objc_msgSend(v9, "addSubview:", v8->_instructionLabel);
    v16 = -[CKDropZoneCircleView initWithFrame:]([CKDropZoneCircleView alloc], "initWithFrame:", x, y, width, height);
    dropZoneCircleView = v8->_dropZoneCircleView;
    v8->_dropZoneCircleView = v16;

    objc_msgSend(v9, "addSubview:", v8->_dropZoneCircleView);
    v18 = objc_alloc_init(CKPinnedConversationView);
    prototypeConversationView = v8->_prototypeConversationView;
    v8->_prototypeConversationView = v18;

    -[CKPinnedConversationView configureAsPrototypeCell](v8->_prototypeConversationView, "configureAsPrototypeCell");
    -[CKPinnedConversationDropTargetCollectionViewCell setShouldHideLabel:](v8, "setShouldHideLabel:", 0);
    -[CKPinnedConversationDropTargetCollectionViewCell setShouldAnimateCircle:](v8, "setShouldAnimateCircle:", 1);
    -[CKPinnedConversationDropTargetCollectionViewCell _updateFont](v8, "_updateFont");

  }
  return v8;
}

- (void)setShouldHideLabel:(BOOL)a3
{
  self->_shouldHideLabel = a3;
  -[UILabel setHidden:](self->_instructionLabel, "setHidden:");
}

- (void)setShouldAnimateCircle:(BOOL)a3
{
  CKDropZoneCircleView *dropZoneCircleView;

  self->_shouldAnimateCircle = a3;
  dropZoneCircleView = self->_dropZoneCircleView;
  if (a3)
    -[CKDropZoneCircleView startAnimating](dropZoneCircleView, "startAnimating");
  else
    -[CKDropZoneCircleView stopAnimating](dropZoneCircleView, "stopAnimating");
}

- (void)_updateFont
{
  UILabel *instructionLabel;
  void *v3;
  id v4;

  instructionLabel = self->_instructionLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationListDropTargetInstructionFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](instructionLabel, "setFont:", v3);

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
  void *v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double MaxY;
  CGFloat MidY;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v34.receiver = self;
  v34.super_class = (Class)CKPinnedConversationDropTargetCollectionViewCell;
  -[CKPinnedConversationDropTargetCollectionViewCell layoutSubviews](&v34, sel_layoutSubviews);
  -[CKPinnedConversationDropTargetCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  +[CKPinnedConversationView avatarViewPadding](CKPinnedConversationView, "avatarViewPadding");
  v11 = v10;
  +[CKPinnedConversationView avatarViewSizeFittingSize:layoutStyle:](CKPinnedConversationView, "avatarViewSizeFittingSize:layoutStyle:", self->_layoutStyle, v7, v9);
  v13 = v12;
  v15 = v14;
  v16 = (v7 - v12) * 0.5;
  v17 = v5 + v11;
  -[CKDropZoneCircleView setFrame:](self->_dropZoneCircleView, "setFrame:", v16, v17, v12, v14);
  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_instructionLabel, "setAllowsDefaultTighteningForTruncation:", 0);
  -[UILabel sizeThatFits:](self->_instructionLabel, "sizeThatFits:", v13, v15);
  v19 = v18;
  v21 = v20;
  -[UILabel setBounds:](self->_instructionLabel, "setBounds:", 0.0, 0.0, v18, v20);
  -[UILabel font](self->_instructionLabel, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lineHeight");
  v24 = llround(v21 / v23);

  if (v24 == 2)
  {
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_instructionLabel, "_firstLineBaselineOffsetFromBoundsTop");
    v26 = v25;
    v35.origin.x = v16;
    v35.origin.y = v17;
    v35.size.width = v13;
    v35.size.height = v15;
    v27 = CGRectGetMidY(v35) - v26;
  }
  else
  {
    v36.origin.x = v16;
    v36.origin.y = v17;
    v36.size.width = v13;
    v36.size.height = v15;
    v27 = CGRectGetMidY(v36) + v21 * -0.5;
  }
  v37.origin.x = v16;
  v37.origin.y = v17;
  v37.size.width = v13;
  v37.size.height = v15;
  v38.origin.x = CGRectGetMidX(v37) - v19 * 0.5;
  v38.origin.y = v27;
  v38.size.width = v19;
  v38.size.height = v21;
  MaxY = CGRectGetMaxY(v38);
  v39.origin.x = v16;
  v39.origin.y = v17;
  v39.size.width = v13;
  v39.size.height = v15;
  MidY = CGRectGetMidY(v39);
  v30 = v13 * 0.5 * (v13 * 0.5) - (MaxY - MidY) * (MaxY - MidY);
  v40.origin.x = v16;
  v40.origin.y = v17;
  v40.size.width = v13;
  v40.size.height = v15;
  v31 = sqrt(v30);
  v32 = CGRectGetMidX(v40) - v31;
  v41.origin.x = v16;
  v41.origin.y = v17;
  v41.size.width = v13;
  v41.size.height = v15;
  v33 = CGRectGetMidX(v41) + v31 - v32;
  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_instructionLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[UILabel setFrame:](self->_instructionLabel, "setFrame:", v32, v27, v33, v21);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKPinnedConversationView setLayoutStyle:](self->_prototypeConversationView, "setLayoutStyle:", self->_layoutStyle);
  -[CKPinnedConversationView sizeThatFits:](self->_prototypeConversationView, "sizeThatFits:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationDropTargetCollectionViewCell;
  -[CKPinnedConversationDropTargetCollectionViewCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKPinnedConversationDropTargetCollectionViewCell _updateInstructionLabelColor](self, "_updateInstructionLabelColor");
}

- (void)_updateInstructionLabelColor
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[CKPinnedConversationDropTargetCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 < 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.31372549, 0.333333333, 0.360784314, 0.6);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (id)v5;
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.48);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:
  -[CKPinnedConversationDropTargetCollectionViewCell instructionLabel](self, "instructionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (BOOL)shouldHideLabel
{
  return self->_shouldHideLabel;
}

- (BOOL)shouldAnimateCircle
{
  return self->_shouldAnimateCircle;
}

- (CKDropZoneCircleView)dropZoneCircleView
{
  return self->_dropZoneCircleView;
}

- (void)setDropZoneCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_dropZoneCircleView, a3);
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionLabel, a3);
}

- (CKPinnedConversationView)prototypeConversationView
{
  return self->_prototypeConversationView;
}

- (void)setPrototypeConversationView:(id)a3
{
  objc_storeStrong((id *)&self->_prototypeConversationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeConversationView, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_dropZoneCircleView, 0);
}

@end
