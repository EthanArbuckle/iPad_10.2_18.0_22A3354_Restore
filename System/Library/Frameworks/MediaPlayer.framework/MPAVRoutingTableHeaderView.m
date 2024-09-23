@implementation MPAVRoutingTableHeaderView

- (void)_init
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  UILabel *detailLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CAShapeLayer *v19;
  CAShapeLayer *borderLayer;
  id v21;
  double v22;
  void *v23;
  id v24;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableHeaderView setBackgroundColor:](self, "setBackgroundColor:", v3);

  *(_OWORD *)&self->_edgeInsets.top = xmmword_193F0CB10;
  *(_OWORD *)&self->_edgeInsets.bottom = xmmword_193F0CB10;
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  v11 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_MIRRORING_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v24 = (id)objc_claimAutoreleasedReturnValue();

  -[MPAVRoutingTableHeaderView _mirroringTitleTextAttributes](self, "_mirroringTitleTextAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v24, v14);
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v15);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[MPAVRoutingTableHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  -[MPAVRoutingTableHeaderView _mirroringCompactDescription](self, "_mirroringCompactDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableHeaderView _mirroringCompactDescriptionTextAttributes](self, "_mirroringCompactDescriptionTextAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v17);
  -[UILabel setAttributedText:](self->_detailLabel, "setAttributedText:", v18);

  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
  -[MPAVRoutingTableHeaderView addSubview:](self, "addSubview:", self->_detailLabel);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v19 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  borderLayer = self->_borderLayer;
  self->_borderLayer = v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", objc_msgSend(v21, "CGColor"));

  -[CAShapeLayer setLineWidth:](self->_borderLayer, "setLineWidth:", 0.5);
  -[CAShapeLayer setFillColor:](self->_borderLayer, "setFillColor:", 0);
  LODWORD(v22) = 1.0;
  -[CAShapeLayer setOpacity:](self->_borderLayer, "setOpacity:", v22);
  -[MPAVRoutingTableHeaderView layer](self, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSublayer:", self->_borderLayer);

}

- (MPAVRoutingTableHeaderView)initWithFrame:(CGRect)a3
{
  MPAVRoutingTableHeaderView *v3;
  MPAVRoutingTableHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPAVRoutingTableHeaderView;
  v3 = -[MPAVRoutingTableHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MPAVRoutingTableHeaderView _init](v3, "_init");
  return v4;
}

- (MPAVRoutingTableHeaderView)initWithCoder:(id)a3
{
  MPAVRoutingTableHeaderView *v3;
  MPAVRoutingTableHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPAVRoutingTableHeaderView;
  v3 = -[MPAVRoutingTableHeaderView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MPAVRoutingTableHeaderView _init](v3, "_init");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  id v18;
  id v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)MPAVRoutingTableHeaderView;
  -[MPAVRoutingTableHeaderView layoutSubviews](&v22, sel_layoutSubviews);
  -[MPAVRoutingTableHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v20 = v5;
  v21 = v7;
  v9 = v8;
  v10 = v7 - (self->_edgeInsets.left + self->_edgeInsets.right);
  v11 = v8 - (self->_edgeInsets.top + self->_edgeInsets.bottom);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v10, v11);
  v13 = v12;
  v14 = v4 + self->_edgeInsets.left;
  v15 = v6 + self->_edgeInsets.top;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15, v10, v12);
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v10, v11);
  v17 = v16;
  v23.origin.x = v14;
  v23.origin.y = v15;
  v23.size.width = v10;
  v23.size.height = v13;
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", v4 + self->_edgeInsets.left, CGRectGetMaxY(v23) + 2.0, v10, v17);
  v18 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  objc_msgSend(v18, "moveToPoint:", v4, v20 + v9);
  objc_msgSend(v18, "addLineToPoint:", v4 + v21, v20 + v9);
  v19 = objc_retainAutorelease(v18);
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", objc_msgSend(v19, "CGPath"));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIEdgeInsets *p_edgeInsets;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_MIRRORING_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPAVRoutingTableHeaderView _mirroringTitleTextAttributes](self, "_mirroringTitleTextAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableHeaderView _mirroringCompactDescription](self, "_mirroringCompactDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableHeaderView _mirroringCompactDescriptionTextAttributes](self, "_mirroringCompactDescriptionTextAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  p_edgeInsets = &self->_edgeInsets;
  v12 = width - (p_edgeInsets->left + p_edgeInsets->right);
  v13 = height - (p_edgeInsets->top + p_edgeInsets->bottom);
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v12, v13);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v12, v13);
  if (v15 >= v18)
    v20 = v15;
  else
    v20 = v18;
  v21 = rint(p_edgeInsets->right + p_edgeInsets->left + v20);
  v22 = rint(v17 + 2.0 + v19 + p_edgeInsets->top + p_edgeInsets->bottom);

  v23 = v21;
  v24 = v22;
  result.height = v24;
  result.width = v23;
  return result;
}

- (id)_mirroringTitleTextAttributes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
  objc_msgSend(v2, "setAlignment:", 1);
  objc_msgSend(v2, "setLineBreakMode:", 0);
  v7[0] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = *MEMORY[0x1E0DC32C0];
  v8[1] = v4;
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_mirroringCompactDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("iPhone");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPHONE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("iPad");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPAD"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("iPod");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPOD"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MGCopyAnswer();
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_MIRRORING_COMPACT_DESCRIPTION_IPHONE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_mirroringCompactDescriptionTextAttributes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
  objc_msgSend(v2, "setAlignment:", 1);
  objc_msgSend(v2, "setLineBreakMode:", 0);
  v7[0] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGrayTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = *MEMORY[0x1E0DC32C0];
  v8[1] = v4;
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
