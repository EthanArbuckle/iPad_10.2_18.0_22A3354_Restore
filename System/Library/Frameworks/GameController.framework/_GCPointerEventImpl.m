@implementation _GCPointerEventImpl

- (_GCPointerEventImpl)initWithPointerEvent:(id)a3
{
  id v4;
  _GCPointerEventImpl *v5;
  float v6;
  float v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCPointerEventImpl;
  v5 = -[_GCPointerEventImpl init](&v9, sel_init);
  if (v5)
  {
    v5->timestamp = objc_msgSend(v4, "timestamp");
    objc_msgSend(v4, "x");
    v5->x = v6;
    objc_msgSend(v4, "y");
    v5->y = v7;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimestamp:", self->timestamp);
  *(float *)&v5 = self->x;
  objc_msgSend(v4, "setX:", v5);
  *(float *)&v6 = self->y;
  objc_msgSend(v4, "setY:", v6);
  return v4;
}

- (unint64_t)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->timestamp = a3;
}

- (float)x
{
  return self->x;
}

- (void)setX:(float)a3
{
  self->x = a3;
}

- (float)y
{
  return self->y;
}

- (void)setY:(float)a3
{
  self->y = a3;
}

@end
