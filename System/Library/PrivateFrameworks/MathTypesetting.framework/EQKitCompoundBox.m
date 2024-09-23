@implementation EQKitCompoundBox

- (EQKitCompoundBox)initWithChildBoxes:(id)a3
{
  id v4;
  EQKitCompoundBox *v5;
  uint64_t v6;
  NSArray *childBoxes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EQKitCompoundBox;
  v5 = -[EQKitCompoundBox init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    childBoxes = v5->_childBoxes;
    v5->_childBoxes = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithChildBoxes:", v5);

  return v6;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  EQKitCompoundBox *v4;
  EQKitCompoundBox *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (EQKitCompoundBox *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[EQKitCompoundBox isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EQKitCompoundBox childBoxes](v5, "childBoxes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)p_ensureDimensionsAreValid
{
  if (!self->_dimensionsValid)
  {
    -[EQKitCompoundBox p_cacheDimensionsForHeight:depth:width:](self, "p_cacheDimensionsForHeight:depth:width:", &self->_height, &self->_depth, &self->_width);
    self->_dimensionsValid = 1;
  }
}

- (double)height
{
  -[EQKitCompoundBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_height;
}

- (double)depth
{
  -[EQKitCompoundBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_depth;
}

- (double)width
{
  -[EQKitCompoundBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_width;
}

- (CGRect)erasableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->_erasableBoundsValid)
  {
    x = self->_erasableBounds.origin.x;
    y = self->_erasableBounds.origin.y;
    width = self->_erasableBounds.size.width;
    height = self->_erasableBounds.size.height;
  }
  else
  {
    -[EQKitCompoundBox p_cacheErasableBounds](self, "p_cacheErasableBounds");
    self->_erasableBounds.origin.x = x;
    self->_erasableBounds.origin.y = y;
    self->_erasableBounds.size.width = width;
    self->_erasableBounds.size.height = height;
    self->_erasableBoundsValid = 1;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitCompoundBox height](self, "height");
  v6 = v5;
  -[EQKitCompoundBox depth](self, "depth");
  v8 = v7;
  -[EQKitCompoundBox width](self, "width");
  v10 = v9;
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f childBoxes=%@"), v4, self, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  *a3 = 0.0;
  *a4 = 0.0;
  *a5 = 0.0;
}

- (CGRect)p_cacheErasableBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)childBoxes
{
  return self->_childBoxes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childBoxes, 0);
}

@end
