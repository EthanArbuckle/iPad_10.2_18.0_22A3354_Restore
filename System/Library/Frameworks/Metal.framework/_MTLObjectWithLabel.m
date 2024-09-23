@implementation _MTLObjectWithLabel

- (void)dealloc
{
  objc_super v3;

  self->_label = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLObjectWithLabel;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  if (self->_label != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    os_unfair_lock_lock(&self->_labelLock);
    label = self->_label;
    self->_label = v4;
    os_unfair_lock_unlock(&self->_labelLock);

  }
}

- (_MTLObjectWithLabel)init
{
  _MTLObjectWithLabel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLObjectWithLabel;
  result = -[_MTLObjectWithLabel init](&v3, sel_init);
  if (result)
  {
    result->_label = 0;
    result->_labelLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSString)label
{
  return (NSString *)-[_MTLObjectWithLabel retainedLabel](self, "retainedLabel");
}

- (id)retainedLabel
{
  os_unfair_lock_s *p_labelLock;
  NSString *v4;

  p_labelLock = &self->_labelLock;
  os_unfair_lock_lock(&self->_labelLock);
  v4 = self->_label;
  os_unfair_lock_unlock(p_labelLock);
  return v4;
}

@end
