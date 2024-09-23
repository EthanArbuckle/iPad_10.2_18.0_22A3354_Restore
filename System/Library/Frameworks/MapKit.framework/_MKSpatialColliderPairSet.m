@implementation _MKSpatialColliderPairSet

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  next = self->_pairs.__table_.__p1_.__value_.__next_;
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
  value = self->_pairs.__table_.__bucket_list_.__ptr_.__value_;
  self->_pairs.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (_MKSpatialColliderPairSet)initWithCapacity:(unint64_t)a3
{
  _MKSpatialColliderPairSet *v4;
  _MKSpatialColliderPairSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKSpatialColliderPairSet;
  v4 = -[_MKSpatialColliderPairSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__hash_table<_MKAnnotationViewPair,std::hash<_MKAnnotationViewPair>,std::equal_to<_MKAnnotationViewPair>,std::allocator<_MKAnnotationViewPair>>::__rehash<true>((uint64_t)&v4->_pairs, vcvtps_u32_f32((float)a3 / v4->_pairs.__table_.__p3_.__value_));
  return v5;
}

@end
