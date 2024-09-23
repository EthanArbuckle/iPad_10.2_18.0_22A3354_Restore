@implementation EQKitOffsetVBox

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3
{
  return -[EQKitOffsetVBox initWithChildBoxes:pivotIndex:offset:](self, "initWithChildBoxes:pivotIndex:offset:", a3, 0, 0.0);
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  return -[EQKitOffsetVBox initWithChildBoxes:pivotIndex:offset:](self, "initWithChildBoxes:pivotIndex:offset:", a3, a4, 0.0);
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4 offset:(double)a5
{
  EQKitOffsetVBox *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EQKitOffsetVBox;
  result = -[EQKitVBox initWithChildBoxes:pivotIndex:](&v7, sel_initWithChildBoxes_pivotIndex_, a3, a4);
  if (result)
    result->_offset = a5;
  return result;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EQKitOffsetVBox;
  -[EQKitVBox p_cacheDimensionsForHeight:depth:width:](&v8, sel_p_cacheDimensionsForHeight_depth_width_, a3, a4, a5);
  *a3 = self->_offset + *a3;
  *a4 = *a4 - self->_offset;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EQKitVBox pivotIndex](self, "pivotIndex");
  -[EQKitOffsetVBox offset](self, "offset");
  v7 = (void *)objc_msgSend(v4, "initWithChildBoxes:pivotIndex:offset:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EQKitOffsetVBox;
  if (-[EQKitVBox isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = v4;
    -[EQKitOffsetVBox offset](self, "offset");
    v7 = v6;
    objc_msgSend(v5, "offset");
    v9 = v7 == v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  unint64_t v12;
  uint64_t v13;
  void *v14;

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
  v12 = -[EQKitVBox pivotIndex](self, "pivotIndex");
  -[EQKitOffsetVBox offset](self, "offset");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu offset=%f"), v4, self, v6, v8, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)offset
{
  return self->_offset;
}

@end
