@implementation NTKAlbumEmptyView

- (id)initForDevice:(id)a3
{
  id v5;
  NTKAlbumEmptyView *v6;
  id *p_isa;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NTKAlbumEmptyView;
  v6 = -[NTKAlbumEmptyView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  p_isa = (id *)&v6->super.super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_alloc(MEMORY[0x1E0DC3890]);
    NTKImageNamed(CFSTR("LargeIconPhoto"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithImage:", v9);
    v11 = p_isa[53];
    p_isa[53] = (id)v10;

    objc_msgSend(p_isa[53], "sizeToFit");
    v12 = *(double *)&qword_1EF16D478 * 0.5;
    objc_msgSend(p_isa[53], "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", v12);

    objc_msgSend(p_isa[53], "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    objc_msgSend(p_isa, "addSubview:", p_isa[53]);
    v15 = objc_opt_new();
    v16 = p_isa[56];
    p_isa[56] = (id)v15;

    NTKCompanionClockFaceLocalizedString(CFSTR("PHOTOS_FACE_NO_SYNCED_ALBUM_TEXT_COMPANION"), CFSTR("No synced photos"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    attributedBodyLabelText(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[56], "setAttributedText:", v18);

    objc_msgSend(p_isa[56], "setLineBreakMode:", 0);
    objc_msgSend(p_isa[56], "setNumberOfLines:", 0);
    objc_msgSend(p_isa[56], "setTextAlignment:", 1);
    objc_msgSend(p_isa, "addSubview:", p_isa[56]);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "setBackgroundColor:", v19);

  }
  return p_isa;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UILabel *bodyLabel;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKAlbumEmptyView;
  -[NTKAlbumEmptyView layoutSubviews](&v15, sel_layoutSubviews);
  -[NTKAlbumEmptyView bounds](self, "bounds");
  -[UIImageView setCenter:](self->_iconImageView, "setCenter:", v3 * 0.5, *(double *)&qword_1EF16D470 + *(double *)&qword_1EF16D478 * 0.5);
  v4 = *(double *)&layout;
  bodyLabel = self->_bodyLabel;
  -[NTKAlbumEmptyView bounds](self, "bounds");
  -[UILabel sizeThatFits:](bodyLabel, "sizeThatFits:", v6 + v4 * -2.0, 1.79769313e308);
  -[UILabel setBounds:](self->_bodyLabel, "setBounds:", 0.0, 0.0, v7, v8);
  -[NTKAlbumEmptyView bounds](self, "bounds");
  v10 = v9 * 0.5;
  v11 = *(double *)&qword_1EF16D480;
  -[UILabel _firstBaselineOffsetFromTop](self->_bodyLabel, "_firstBaselineOffsetFromTop");
  v13 = v11 - v12;
  -[UILabel bounds](self->_bodyLabel, "bounds");
  -[UILabel setCenter:](self->_bodyLabel, "setCenter:", v10, v13 + v14 * 0.5);
}

- (void)setBodyLabelText:(id)a3
{
  NSString *bodyLabelText;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_bodyLabelText, a3);
  bodyLabelText = self->_bodyLabelText;
  if (bodyLabelText)
  {
    attributedBodyLabelText(bodyLabelText);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_bodyLabel, "setAttributedText:", v6);

    -[UILabel setTextAlignment:](self->_bodyLabel, "setTextAlignment:", 1);
    -[NTKAlbumEmptyView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)headerLabelText
{
  return self->_headerLabelText;
}

- (NSString)bodyLabelText
{
  return self->_bodyLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabelText, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabelText, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
