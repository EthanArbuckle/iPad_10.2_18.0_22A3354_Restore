@implementation FINodeTask

- (id)init:(const void *)a3
{
  FINodeTask *v4;

  v4 = -[FINodeTask init](self, "init");
  std::shared_ptr<TCFURLInfo>::operator=[abi:ne180100](&v4->_nodeTask.__ptr_, (uint64_t *)a3);
  return v4;
}

- (void).cxx_destruct
{
  std::shared_ptr<TClientChangeNotifier>::~shared_ptr[abi:ne180100]((uint64_t)&self->_nodeTask);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
