@implementation ICCRVectorTimestampElement

- (unint64_t)clock
{
  return self->_clock;
}

- (void)setClock:(unint64_t)a3
{
  self->_clock = a3;
}

- (unint64_t)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unint64_t)a3
{
  self->_subclock = a3;
}

@end
