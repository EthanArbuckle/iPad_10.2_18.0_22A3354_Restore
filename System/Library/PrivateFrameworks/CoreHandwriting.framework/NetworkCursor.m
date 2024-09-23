@implementation NetworkCursor

- (NetworkCursor)init
{
  NetworkCursor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NetworkCursor;
  result = -[NetworkCursor init](&v3, sel_init);
  if (result)
    result->_stateType = 0;
  return result;
}

- (BOOL)isCompletePattern
{
  return (self->_stateType & 6) != 0;
}

- (void).cxx_destruct
{
  unint64_t *begin;

  begin = self->_nodeIndexes.__begin_;
  if (begin)
  {
    self->_nodeIndexes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
