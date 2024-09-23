@implementation CBFloatArray2D

- (CBFloatArray2D)initWithValues:(float *)a3 andCountCols:(unint64_t)a4 andRows:(unint64_t)a5
{
  objc_super v6;
  unint64_t v7;
  unint64_t v8;
  float *v9;
  SEL v10;
  CBFloatArray2D *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = a5;
  v6.receiver = self;
  v6.super_class = (Class)CBFloatArray2D;
  v11 = -[CBFloatArray initWithValues:andCount:](&v6, sel_initWithValues_andCount_, a3, a4 * a5);
  if (v11)
  {
    v11->_cols = v8;
    v11->_rows = v7;
  }
  return v11;
}

- (float)getCol:(unint64_t)a3 andRow:(unint64_t)a4
{
  float result;

  -[CBFloatArray get:](self, "get:", a3 + a4 * self->_cols, a4, a3, a2, self);
  return result;
}

@end
