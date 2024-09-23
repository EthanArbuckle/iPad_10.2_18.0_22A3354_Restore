@implementation DYReplayControllerQueue

- (DYReplayControllerQueue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYReplayControllerQueue;
  return -[DYReplayControllerQueue init](&v3, sel_init);
}

- (unint64_t)count
{
  return *((_QWORD *)self + 6);
}

- (void)pushBlock:(id)a3
{
  id v4;

  v4 = a3;
  std::deque<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::push_back((_QWORD *)self + 1, &v4);

}

- (void)dequeBlock
{
  std::deque<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::pop_front((int64x2_t *)((char *)self + 8));
}

- (id)front
{
  return (id)MEMORY[0x242624058](*(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 2)+ ((*((_QWORD *)self + 5) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((_QWORD *)self + 5) & 0x1FFLL)), a2);
}

- (void)clear
{
  int64x2_t *v3;

  if (*((_QWORD *)self + 6))
  {
    v3 = (int64x2_t *)((char *)self + 8);
    do
      std::deque<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::pop_front(v3);
    while (*((_QWORD *)self + 6));
  }
}

- (void).cxx_destruct
{
  std::deque<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::~deque[abi:ne180100]((_QWORD *)self + 1);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
