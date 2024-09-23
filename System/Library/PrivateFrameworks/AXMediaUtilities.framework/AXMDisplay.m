@implementation AXMDisplay

- (id)_initWithBackingType:(int64_t)a3
{
  AXMDisplay *v4;
  AXMDisplay *v5;
  NSString *name;
  CGPoint *v7;
  CGSize v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXMDisplay;
  v4 = -[AXMDisplay init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_backingType = a3;
    name = v4->_name;
    v4->_name = (NSString *)CFSTR("Default");

    v5->_size = (CGSize)*MEMORY[0x1E0C9D820];
    *(_OWORD *)&v5->_scale = xmmword_1B0EFFF10;
    v7 = (CGPoint *)MEMORY[0x1E0C9D648];
    v5->_physicalOrientation = 1;
    v8 = (CGSize)v7[1];
    v5->_referenceBounds.origin = *v7;
    v5->_referenceBounds.size = v8;
    v5->_supportsDeepColor = 0;
  }
  return v5;
}

- (id)description
{
  unint64_t backingType;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t physicalOrientation;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  backingType = self->_backingType;
  if (backingType > 2)
    v4 = 0;
  else
    v4 = *((_QWORD *)&off_1E625E8F8 + backingType);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[AXMDisplay name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMDisplay scale](self, "scale");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDisplay size](self, "size");
  v10 = v9;
  -[AXMDisplay size](self, "size");
  v12 = v11;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMDisplay orientation](self, "orientation");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  physicalOrientation = self->_physicalOrientation;
  if (physicalOrientation > 4)
    v16 = "unknown";
  else
    v16 = off_1E625E910[physicalOrientation];
  -[AXMDisplay referenceBounds](self, "referenceBounds");
  v18 = v17;
  -[AXMDisplay referenceBounds](self, "referenceBounds");
  v20 = v19;
  -[AXMDisplay referenceBounds](self, "referenceBounds");
  v22 = v21;
  -[AXMDisplay referenceBounds](self, "referenceBounds");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("AXMDisplay<%p>: Backing:%@ Name:%@ scale:%@ size:[%.2f %.2f] orientation:%@ (%s) refBounds:[%.2f %.2f %.2f %.2f] deepColor:%d"), self, v4, v6, v8, v10, v12, v14, v16, v18, v20, v22, v23, -[AXMDisplay supportsDeepColor](self, "supportsDeepColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  CGPoint origin;

  v4 = -[AXMDisplay _initWithBackingType:]([AXMDisplay alloc], "_initWithBackingType:", self->_backingType);
  objc_storeStrong((id *)v4 + 2, self->_name);
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_scale;
  *(CGSize *)(v4 + 56) = self->_size;
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_orientation;
  *((_QWORD *)v4 + 5) = self->_physicalOrientation;
  origin = self->_referenceBounds.origin;
  *(CGSize *)(v4 + 88) = self->_referenceBounds.size;
  *(CGPoint *)(v4 + 72) = origin;
  v4[8] = self->_supportsDeepColor;
  return v4;
}

- (CGPoint)convertPointToDisplay:(CGPoint)a3
{
  double scale;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  scale = self->_scale;
  v5 = a3.x * scale;
  v6 = a3.y * scale;
  -[AXMDisplay referenceBounds](self, "referenceBounds");
  v8 = v7;
  v10 = v9;
  v11 = self->_scale;
  if (AXMFloatApproxEqual(self->_orientation, 1.57079633))
  {
    v5 = v11 * v8 + -1.0 - v5;
    v12 = v6;
  }
  else if (AXMFloatApproxEqual(self->_orientation, 4.71238898))
  {
    v12 = v11 * v10 + -1.0 - v6;
  }
  else
  {
    v12 = v5;
    v5 = v6;
  }
  v13 = v5;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)convertRectToDisplay:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  CGFloat x;
  double MinX;
  double v9;
  double v10;
  double v11;
  double scale;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AXMDisplay referenceBounds](self, "referenceBounds");
  if (AXMFloatApproxEqual(self->_orientation, 1.57079633))
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    MinX = CGRectGetMaxX(v15) + -1.0 / self->_scale;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    y = CGRectGetMinY(v16);
  }
  else
  {
    if (!AXMFloatApproxEqual(self->_orientation, 4.71238898))
    {
      MinX = x;
      v9 = width;
      width = height;
      goto LABEL_7;
    }
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinX = CGRectGetMinX(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    y = CGRectGetMaxY(v18) + -1.0 / self->_scale;
  }
  v9 = height;
LABEL_7:
  -[AXMDisplay convertPointToDisplay:](self, "convertPointToDisplay:", MinX, y);
  scale = self->_scale;
  v13 = v9 * scale;
  v14 = width * scale;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(double)a3
{
  self->_orientation = a3;
}

- (int64_t)physicalOrientation
{
  return self->_physicalOrientation;
}

- (void)setPhysicalOrientation:(int64_t)a3
{
  self->_physicalOrientation = a3;
}

- (CGRect)referenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceBounds.origin.x;
  y = self->_referenceBounds.origin.y;
  width = self->_referenceBounds.size.width;
  height = self->_referenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setReferenceBounds:(CGRect)a3
{
  self->_referenceBounds = a3;
}

- (BOOL)supportsDeepColor
{
  return self->_supportsDeepColor;
}

- (void)setSupportsDeepColor:(BOOL)a3
{
  self->_supportsDeepColor = a3;
}

- (int64_t)backingType
{
  return self->_backingType;
}

- (void)setBackingType:(int64_t)a3
{
  self->_backingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
