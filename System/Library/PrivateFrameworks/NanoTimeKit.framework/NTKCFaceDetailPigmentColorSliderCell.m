@implementation NTKCFaceDetailPigmentColorSliderCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailPigmentColorSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NTKCFaceDetailPigmentColorSliderCell *v4;
  NTKCFaceDetailPigmentColorSliderCell *v5;
  NTKColorSlider *v6;
  uint64_t v7;
  NTKColorSlider *slider;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKCFaceDetailPigmentColorSliderCell;
  v4 = -[NTKCFaceDetailRowActionCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[NTKCDetailTableViewCell setShowsSeparator:](v4, "setShowsSeparator:", 0);
    v6 = [NTKColorSlider alloc];
    v7 = -[NTKColorSlider initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    slider = v5->_slider;
    v5->_slider = (NTKColorSlider *)v7;

    -[NTKColorSlider setDelegate:](v5->_slider, "setDelegate:", v5);
    -[NTKCFaceDetailPigmentColorSliderCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5->_slider);

  }
  return v5;
}

- (double)rowHeight
{
  double v2;

  +[NTKColorSlider frameForTrackFrame:](NTKColorSlider, "frameForTrackFrame:", 0.0, 0.0, 0.0, 40.0);
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)NTKCFaceDetailPigmentColorSliderCell;
  -[NTKCFaceDetailRowActionCell layoutSubviews](&v13, sel_layoutSubviews);
  -[NTKCFaceDetailPigmentColorSliderCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[NTKCFaceDetailEditOptionCell insetSpacingForStyle:](NTKCFaceDetailEditOptionCell, "insetSpacingForStyle:", 0);
  v12 = v11;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v15 = CGRectInset(v14, v12, 0.0);
  -[NTKColorSlider setFrame:](self->_slider, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
}

- (void)setColors:(id)a3 animated:(BOOL)a4
{
  -[NTKColorSlider setColors:](self->_slider, "setColors:", a3, a4);
}

- (void)setColorFraction:(double)a3 animated:(BOOL)a4
{
  *(float *)&a3 = a3;
  -[NTKColorSlider setValue:animated:](self->_slider, "setValue:animated:", a4, a3);
}

- (void)colorSlider:(id)a3 valueChanged:(double)a4 phase:(int64_t)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pigmentColorSliderCell:colorFractionChanged:transiently:canceled:", self, a5 != 2, a5 == 3, a4);

}

- (NTKCFaceDetailPigmentColorSliderCellDelegate)delegate
{
  return (NTKCFaceDetailPigmentColorSliderCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
