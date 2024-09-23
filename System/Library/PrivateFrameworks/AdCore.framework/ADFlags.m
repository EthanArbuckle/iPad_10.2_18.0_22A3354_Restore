@implementation ADFlags

+ (id)initWithFlags:(unint64_t)a3
{
  ADFlags *v4;

  v4 = objc_alloc_init(ADFlags);
  -[ADFlags set:](v4, "set:", a3);
  return v4;
}

- (ADFlags)init
{
  ADFlags *v2;
  ADFlags *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADFlags;
  v2 = -[ADFlags init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ADFlags reset](v2, "reset");
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "set:", self->_flags);
  return v5;
}

- (void)set:(unint64_t)a3
{
  self->_flags |= a3;
}

- (void)unset:(unint64_t)a3
{
  self->_flags &= ~a3;
}

- (void)reset
{
  self->_flags = 0;
}

- (BOOL)isSet:(unint64_t)a3
{
  return -[ADFlags anySet:](self, "anySet:", a3) != 0;
}

- (unint64_t)anySet:(unint64_t)a3
{
  return self->_flags & a3;
}

- (BOOL)allSet:(unint64_t)a3
{
  return (a3 & ~self->_flags) == 0;
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(a3, "allSet:", self->_flags);
}

- (BOOL)noneSet
{
  return self->_flags == 0;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

@end
