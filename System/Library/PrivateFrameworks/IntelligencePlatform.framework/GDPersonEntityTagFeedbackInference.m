@implementation GDPersonEntityTagFeedbackInference

- (GDPersonEntityTagFeedbackInference)initWithIDValue:(int64_t)a3 tag:(int64_t)a4
{
  GDPersonEntityTagFeedbackInference *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDPersonEntityTagFeedbackInference;
  result = -[GDPersonEntityTagFeedbackInference init](&v7, sel_init);
  if (result)
  {
    result->_tag = a4;
    result->_idValue = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  GDPersonEntityTagFeedbackInference *v4;
  const char *v5;
  char isEqualToPersonEntityTagFeedbackInference;

  v4 = (GDPersonEntityTagFeedbackInference *)a3;
  if (v4 == self)
  {
    isEqualToPersonEntityTagFeedbackInference = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToPersonEntityTagFeedbackInference = objc_msgSend_isEqualToPersonEntityTagFeedbackInference_(self, v5, (uint64_t)v4);
    else
      isEqualToPersonEntityTagFeedbackInference = 0;
  }

  return isEqualToPersonEntityTagFeedbackInference;
}

- (BOOL)isEqualToPersonEntityTagFeedbackInference:(id)a3
{
  GDPersonEntityTagFeedbackInference *v4;
  BOOL v5;

  v4 = (GDPersonEntityTagFeedbackInference *)a3;
  v5 = v4 == self || v4 && self->_idValue == v4->_idValue && self->_tag == v4->_tag;

  return v5;
}

- (unint64_t)hash
{
  return self->_tag - self->_idValue + 32 * self->_idValue;
}

- (int64_t)tag
{
  return self->_tag;
}

- (int64_t)idValue
{
  return self->_idValue;
}

@end
