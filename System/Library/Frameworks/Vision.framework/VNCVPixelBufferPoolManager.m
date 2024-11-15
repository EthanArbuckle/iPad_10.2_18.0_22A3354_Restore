@implementation VNCVPixelBufferPoolManager

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

- (VNCVPixelBufferPoolManager)init
{
  objc_super v3;

  self->_poolsLock._os_unfair_lock_opaque = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNCVPixelBufferPoolManager;
  return -[VNCVPixelBufferPoolManager init](&v3, sel_init);
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  next = self->_pools.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_pools.__table_.__bucket_list_.__ptr_.__value_;
  self->_pools.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

@end
