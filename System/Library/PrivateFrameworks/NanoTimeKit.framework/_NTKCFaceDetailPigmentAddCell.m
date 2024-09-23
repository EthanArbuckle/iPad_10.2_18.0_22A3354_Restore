@implementation _NTKCFaceDetailPigmentAddCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_NTKCFaceDetailPigmentAddCell)initWithFrame:(CGRect)a3
{
  _NTKCFaceDetailPigmentAddCell *v3;
  uint64_t v4;
  UIButton *button;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NTKCFaceDetailPigmentAddCell;
  v3 = -[_NTKCFaceDetailCollectionCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, sel__tapped, 64);
    -[_NTKCFaceDetailPigmentAddCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_button);

  }
  return v3;
}

- (void)setImage:(id)a3
{
  -[UIButton setImage:forState:](self->_button, "setImage:forState:", a3, 0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NTKCFaceDetailPigmentAddCell;
  -[_NTKCFaceDetailCollectionCell layoutSubviews](&v3, sel_layoutSubviews);
  -[_NTKCFaceDetailCollectionCell swatchFrame](self, "swatchFrame");
  -[UIButton setFrame:](self->_button, "setFrame:");
}

- (void)_tapped
{
  id v3;

  -[_NTKCFaceDetailPigmentAddCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCellTapped:", self);

}

- (_NTKCFaceDetailPigmentAddCellDelegate)delegate
{
  return (_NTKCFaceDetailPigmentAddCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
