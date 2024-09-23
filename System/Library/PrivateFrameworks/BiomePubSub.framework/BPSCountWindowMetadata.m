@implementation BPSCountWindowMetadata

- (BPSCountWindowMetadata)initWithCurrentCount:(unint64_t)a3
{
  BPSCountWindowMetadata *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BPSCountWindowMetadata;
  result = -[BPSCountWindowMetadata init](&v5, sel_init);
  if (result)
    result->_currentCount = a3;
  return result;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
}

@end
