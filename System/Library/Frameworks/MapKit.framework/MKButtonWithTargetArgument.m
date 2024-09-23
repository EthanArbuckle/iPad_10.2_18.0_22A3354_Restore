@implementation MKButtonWithTargetArgument

+ (id)button
{
  return objc_alloc_init((Class)a1);
}

- (id)targetArgument
{
  return self->_targetArgument;
}

- (void)setTargetArgument:(id)a3
{
  objc_storeStrong(&self->_targetArgument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_targetArgument, 0);
}

@end
