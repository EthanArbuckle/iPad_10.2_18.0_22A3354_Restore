@implementation ASCStarRow

- (ASCStarRow)initWithStarSize:(int64_t)a3 fill:(BOOL)a4 starColor:(id)a5 andMaxNumberOfStars:(double)a6
{
  _BOOL8 v7;
  UIColor *v10;
  ASCStarRow *v11;
  void *v12;
  uint64_t v13;
  UIImageView *starImageView;
  CAReplicatorLayer *v15;
  CAReplicatorLayer *starLayer;
  CAReplicatorLayer *v17;
  CGFloat v18;
  CAReplicatorLayer *v19;
  void *v20;
  UIColor *starColor;
  UIColor *v22;
  void *v23;
  void *v24;
  CATransform3D v26;
  objc_super v27;

  v7 = a4;
  v10 = (UIColor *)a5;
  -[ASCStarRow frameForCurrentRating:andStarSize:](self, "frameForCurrentRating:andStarSize:", self->_starSize, a6);
  v27.receiver = self;
  v27.super_class = (Class)ASCStarRow;
  v11 = -[ASCStarRow initWithFrame:](&v27, sel_initWithFrame_);
  v11->_starSize = a3;
  v11->_maxNumberOfStars = a6;
  v11->_numberOfStarsInRow = a6;
  +[ASCStarRow starForSize:withFill:](ASCStarRow, "starForSize:withFill:", a3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
  starImageView = v11->_starImageView;
  v11->_starImageView = (UIImageView *)v13;

  v15 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x1E0CD2828]);
  starLayer = v11->_starLayer;
  v11->_starLayer = v15;

  -[CAReplicatorLayer setInstanceCount:](v11->_starLayer, "setInstanceCount:", (uint64_t)a6);
  v17 = v11->_starLayer;
  -[UIImageView frame](v11->_starImageView, "frame");
  CATransform3DMakeTranslation(&v26, v18, 0.0, 0.0);
  -[CAReplicatorLayer setInstanceTransform:](v17, "setInstanceTransform:", &v26);
  -[CAReplicatorLayer setMasksToBounds:](v11->_starLayer, "setMasksToBounds:", 1);
  -[UIImageView setTintColor:](v11->_starImageView, "setTintColor:", v10);
  v19 = v11->_starLayer;
  -[UIImageView layer](v11->_starImageView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAReplicatorLayer addSublayer:](v19, "addSublayer:", v20);

  -[ASCStarRow modifyStarLayerRectToHideOuterPaddingUsing:](v11, "modifyStarLayerRectToHideOuterPaddingUsing:", v12);
  starColor = v11->_starColor;
  v11->_starColor = v10;
  v22 = v10;

  -[ASCStarRow layer](v11, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSublayer:", v11->_starLayer);

  -[ASCStarRow layer](v11, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMasksToBounds:", 1);

  return v11;
}

- (ASCStarRow)initWithFrame:(CGRect)a3
{
  -[ASCStarRow doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (ASCStarRow)initWithCoder:(id)a3
{
  -[ASCStarRow doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCStarRow doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setNumberOfStarsInRow:(double)a3
{
  id v4;

  -[ASCStarRow frameForCurrentRating:andStarSize:](self, "frameForCurrentRating:andStarSize:", self->_starSize, a3);
  -[CAReplicatorLayer setFrame:](self->_starLayer, "setFrame:");
  -[UIImageView image](self->_starImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCStarRow modifyStarLayerRectToHideOuterPaddingUsing:](self, "modifyStarLayerRectToHideOuterPaddingUsing:", v4);

}

+ (CGSize)sizeForStarRowWithSizeOfStar:(int64_t)a3 andNumberOfStars:(double)a4
{
  void *v5;
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
  CGSize result;

  objc_msgSend(a1, "starForSize:withFill:", a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alignmentRectInsets");
  v7 = v6;
  objc_msgSend(v5, "alignmentRectInsets");
  v9 = v7 + v8;
  objc_msgSend(v5, "size");
  v11 = v10 - v9;
  objc_msgSend(v5, "alignmentRectInsets");
  v13 = v12;
  objc_msgSend(v5, "alignmentRectInsets");
  v15 = v13 + v14;
  objc_msgSend(v5, "size");
  v17 = v16 - v15;

  v18 = v11 * a4 + 2.0;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (id)starForSize:(int64_t)a3 withFill:(BOOL)a4
{
  _BOOL4 v4;
  double v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = 0.0;
  if ((unint64_t)a3 <= 3)
    v5 = dbl_1BCC09118[a3];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = CFSTR("star.fill");
  else
    v7 = CFSTR("star");
  +[ASCImageRenderer systemImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "systemImageNamed:compatibleWithTraitCollection:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageByApplyingSymbolConfiguration:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)modifyStarLayerRectToHideOuterPaddingUsing:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CAReplicatorLayer frame](self->_starLayer, "frame", a3);
  v5 = v4;
  -[CAReplicatorLayer frame](self->_starLayer, "frame");
  v7 = v6;
  -[CAReplicatorLayer frame](self->_starLayer, "frame");
  v9 = v8;
  -[CAReplicatorLayer frame](self->_starLayer, "frame");
  -[CAReplicatorLayer setFrame:](self->_starLayer, "setFrame:", v5, v7, v9);
}

- (CGRect)frameForCurrentRating:(double)a3 andStarSize:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  +[ASCStarRow sizeForStarRowWithSizeOfStar:andNumberOfStars:](ASCStarRow, "sizeForStarRowWithSizeOfStar:andNumberOfStars:", self->_starSize, a3);
  v5 = v4;
  v7 = v6;
  v8 = 0.0;
  v9 = 0.0;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)numberOfStarsInRow
{
  return self->_numberOfStarsInRow;
}

- (UIImageView)starImageView
{
  return self->_starImageView;
}

- (double)maxNumberOfStars
{
  return self->_maxNumberOfStars;
}

- (CAReplicatorLayer)starLayer
{
  return self->_starLayer;
}

- (int64_t)starSize
{
  return self->_starSize;
}

- (UIColor)starColor
{
  return self->_starColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starColor, 0);
  objc_storeStrong((id *)&self->_starLayer, 0);
  objc_storeStrong((id *)&self->_starImageView, 0);
}

@end
