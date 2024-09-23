@implementation _ASCABLEQRCodeImageView

- (_ASCABLEQRCodeImageView)initWithFrame:(CGRect)a3
{
  _ASCABLEQRCodeImageView *v3;
  _ASCABLEQRCodeImageView *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _ASCABLEQRCodeImageView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_ASCABLEQRCodeImageView;
  v3 = -[_ASCABLEQRCodeImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x24BDE5C88];
    -[_ASCABLEQRCodeImageView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsGravity:", v5);

    v7 = *MEMORY[0x24BDE5BB0];
    -[_ASCABLEQRCodeImageView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMagnificationFilter:", v7);

    v9 = v4;
  }

  return v4;
}

- (void)setImage:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGImage");

  -[_ASCABLEQRCodeImageView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

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
