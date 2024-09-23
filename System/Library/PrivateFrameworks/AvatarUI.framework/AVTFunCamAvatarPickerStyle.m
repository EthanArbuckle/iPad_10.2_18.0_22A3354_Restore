@implementation AVTFunCamAvatarPickerStyle

+ (id)insetProviderForConstant:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__AVTFunCamAvatarPickerStyle_insetProviderForConstant___block_invoke;
  v4[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v4[4] = a3;
  return (id)objc_msgSend(v4, "copy");
}

double __55__AVTFunCamAvatarPickerStyle_insetProviderForConstant___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

+ (id)defaultLayoutStyle
{
  return -[AVTFunCamAvatarPickerStyle initWithCellSize:engagedCellSize:interitemSpacing:gridEdgeInsets:]([AVTFunCamAvatarPickerStyle alloc], "initWithCellSize:engagedCellSize:interitemSpacing:gridEdgeInsets:", 74.0, 74.0, 108.0, 108.0, 16.0, 0, 0x4020000000000000, 0, 0x4020000000000000);
}

- (AVTFunCamAvatarPickerStyle)initWithCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 interitemSpacing:(double)a5 gridEdgeInsets:(UIEdgeInsets)a6
{
  double height;
  CGFloat width;
  double v9;
  CGFloat v10;
  AVTFunCamAvatarPickerStyle *result;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v9 = a3.height;
  v10 = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)AVTFunCamAvatarPickerStyle;
  result = -[AVTFunCamAvatarPickerStyle init](&v12, sel_init);
  if (result)
  {
    result->_cellSize.height = v9 + 14.0;
    result->_engagedCellSize.width = width;
    result->_interitemSpacing = a5;
    result->_cellSize.width = v10;
    result->_engagedCellSize.height = height + 14.0;
    result->_gridEdgeInsets = a6;
  }
  return result;
}

- (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4
{
  double v6;
  double v7;
  double v8;
  double result;

  -[AVTFunCamAvatarPickerStyle gridEdgeInsets](self, "gridEdgeInsets", a4);
  v7 = v6;
  -[AVTFunCamAvatarPickerStyle gridEdgeInsets](self, "gridEdgeInsets");
  result = floor((a3 - (v7 + v8)) * 0.25);
  if (result < 50.0)
    return 50.0;
  return result;
}

- (id)imageItemInsetsForList
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__AVTFunCamAvatarPickerStyle_imageItemInsetsForList__block_invoke;
  v3[3] = &unk_1EA51F6F0;
  v3[4] = self;
  return (id)MEMORY[0x1DF0D0754](v3, a2);
}

double __52__AVTFunCamAvatarPickerStyle_imageItemInsetsForList__block_invoke(uint64_t a1, double a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "cellSize");
  v5 = a2 - v4;
  objc_msgSend(*(id *)(a1 + 32), "engagedCellSize");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "cellSize");
  return (a2 - (v5 / (v7 - v8) * -0.0445445445 + 0.72972973) * a2) * 0.5;
}

- (id)imageItemInsetsForGrid
{
  return (id)objc_msgSend((id)objc_opt_class(), "insetProviderForConstant:", 18.0);
}

- (CGSize)cellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cellSize.width;
  height = self->_cellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (CGSize)engagedCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_engagedCellSize.width;
  height = self->_engagedCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEngagedCellSize:(CGSize)a3
{
  self->_engagedCellSize = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (UIEdgeInsets)gridEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridEdgeInsets.top;
  left = self->_gridEdgeInsets.left;
  bottom = self->_gridEdgeInsets.bottom;
  right = self->_gridEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridEdgeInsets:(UIEdgeInsets)a3
{
  self->_gridEdgeInsets = a3;
}

@end
