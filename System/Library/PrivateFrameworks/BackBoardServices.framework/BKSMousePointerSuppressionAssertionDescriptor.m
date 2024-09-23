@implementation BKSMousePointerSuppressionAssertionDescriptor

- (unint64_t)suppressionOptions
{
  return self->_suppressionOptions;
}

- (void)setSuppressionOptions:(unint64_t)a3
{
  self->_suppressionOptions = a3;
}

@end
