@implementation BCSRealTimeSignposter

- (id)_initWithType:(int64_t)a3 signpostIdentifier:(unint64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCSRealTimeSignposter;
  result = -[BCSRealTimeSignposter init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

@end
