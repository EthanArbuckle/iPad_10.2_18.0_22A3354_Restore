@implementation LinearPiece

- (LinearPiece)init
{
  LinearPiece *v2;
  double v3;
  LinearPiece *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LinearPiece;
  v2 = -[LinearPiece init](&v7, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 0;
    -[LinearPiece setValue:](v2, "setValue:", v3);
    LODWORD(v5) = 0;
    -[LinearPiece setDelta:](v4, "setDelta:", v5);
  }
  return v4;
}

+ (id)pieceWithValue:(float)a3 delta:(float)a4
{
  void *v6;
  double v7;
  double v8;

  v6 = (void *)objc_opt_new();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setValue:", v7);
  *(float *)&v8 = a4;
  objc_msgSend(v6, "setDelta:", v8);
  return v6;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (float)delta
{
  return self->_delta;
}

- (void)setDelta:(float)a3
{
  self->_delta = a3;
}

@end
