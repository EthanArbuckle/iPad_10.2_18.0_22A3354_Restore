@implementation _GCButtonEventImpl

- (_GCButtonEventImpl)initWithButtonEvent:(id)a3
{
  id v4;
  _GCButtonEventImpl *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_GCButtonEventImpl;
  v5 = -[_GCButtonEventImpl init](&v7, sel_init);
  if (v5)
  {
    v5->timestamp = objc_msgSend(v4, "timestamp");
    v5->mask = objc_msgSend(v4, "mask");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimestamp:", self->timestamp);
  objc_msgSend(v4, "setMask:", self->mask);
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

- (int64_t)mask
{
  return self->mask;
}

- (void)setMask:(int64_t)a3
{
  self->mask = a3;
}

@end
