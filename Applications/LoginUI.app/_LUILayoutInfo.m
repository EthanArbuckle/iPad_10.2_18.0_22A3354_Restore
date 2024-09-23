@implementation _LUILayoutInfo

- (CGSize)itemSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_itemSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_itemSize, &v3, 16, 1, 0);
}

- (CGSize)itemSpacing
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_itemSpacing, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setItemSpacing:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_itemSpacing, &v3, 16, 1, 0);
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

@end
