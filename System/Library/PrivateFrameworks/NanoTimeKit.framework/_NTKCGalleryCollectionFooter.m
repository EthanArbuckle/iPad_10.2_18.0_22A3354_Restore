@implementation _NTKCGalleryCollectionFooter

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_NTKCGalleryCollectionFooter)initWithFrame:(CGRect)a3
{
  _NTKCGalleryCollectionFooter *v3;
  uint64_t v4;
  UILabel *label;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NTKCGalleryCollectionFooter;
  v3 = -[_NTKCGalleryCollectionFooter initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    BPSTextColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v6);

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[_NTKCGalleryCollectionFooter addSubview:](v3, "addSubview:", v3->_label);
    -[_NTKCGalleryCollectionFooter _fontSizeDidChange](v3, "_fontSizeDidChange");
  }
  return v3;
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UILabel text](self->_label, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    if (v4)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3498]);
      v12 = *MEMORY[0x1E0DC1178];
      LODWORD(v8) = 0.5;
      objc_msgSend(MEMORY[0x1E0DC1288], "NTKHyphenationParagraphStyleWithFactor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLineBreakMode:", 4);
      v13[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithString:attributes:", v4, v10);

      -[UILabel setAttributedText:](self->_label, "setAttributedText:", v11);
    }
    else
    {
      -[UILabel setText:](self->_label, "setText:", 0);
    }
    -[_NTKCGalleryCollectionFooter setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double Width;
  uint64_t v4;
  char IsRTL;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)_NTKCGalleryCollectionFooter;
  -[_NTKCGalleryCollectionFooter layoutSubviews](&v10, sel_layoutSubviews);
  -[_NTKCGalleryCollectionFooter bounds](self, "bounds");
  Width = CGRectGetWidth(v11);
  v4 = NTKCScreenStyle();
  IsRTL = CLKLayoutIsRTL();
  -[UILabel frame](self->_label, "frame");
  v6 = 0.0;
  if ((IsRTL & 1) == 0)
  {
    if (NTKCScreenStyle() == -1)
      v6 = 11.0;
    else
      v6 = 15.0;
  }
  v7 = 15.0;
  if (v4 == -1)
    v7 = 11.0;
  v8 = Width - v7;
  +[NTKCFaceContainerView sizeForFaceSize:style:](NTKCFaceContainerView, "sizeForFaceSize:style:", 1, FaceSize());
  -[UILabel setFrame:](self->_label, "setFrame:", v6, 0.0, v8, v9);
}

- (void)_fontSizeDidChange
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = NTKCScreenStyle();
  v4 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  if (v3 != -1)
    v4 = (_QWORD *)MEMORY[0x1E0DC4B08];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_label, "setFont:", v7);
  -[_NTKCGalleryCollectionFooter setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
