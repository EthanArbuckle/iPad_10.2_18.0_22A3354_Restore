@implementation CKAcknowledgmentGlyphImageView

- (CKAcknowledgmentGlyphImageView)initWithImage:(id)a3
{
  id v4;
  CKAcknowledgmentGlyphImageView *v5;
  CKAcknowledgmentGlyphImageView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAcknowledgmentGlyphImageView;
  v5 = -[CKAcknowledgmentGlyphImageView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[CKAcknowledgmentGlyphImageView setImage:](v5, "setImage:", v4);

  return v6;
}

- (void)setImage:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGImage");

  -[CKAcknowledgmentGlyphImageView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

}

- (void)sizeToFit
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CKAcknowledgmentGlyphImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKAcknowledgmentGlyphImageView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    -[CKAcknowledgmentGlyphImageView image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;

    -[CKAcknowledgmentGlyphImageView setBounds:](self, "setBounds:", v5, v7, v10, v12);
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
