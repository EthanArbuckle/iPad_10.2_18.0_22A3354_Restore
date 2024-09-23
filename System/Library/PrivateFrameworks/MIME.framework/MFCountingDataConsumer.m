@implementation MFCountingDataConsumer

- (int64_t)appendData:(id)a3
{
  int64_t result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFCountingDataConsumer;
  result = -[MFNullDataConsumer appendData:](&v5, sel_appendData_, a3);
  if (result >= 1)
    self->_count += result;
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

@end
