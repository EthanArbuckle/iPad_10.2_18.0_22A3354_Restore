@implementation GeometricJointsFilter

- (GeometricJointsFilter)initWithChirality:(BOOL)a3 withIsPredictive:(BOOL)a4 withFPS:(float)a5
{
  GeometricJointsFilter *v8;
  nis::GeometricFilter *v9;
  uint64_t value;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GeometricJointsFilter;
  v8 = -[GeometricJointsFilter init](&v12, sel_init);
  v8->_isPredictive = a4;
  v9 = (nis::GeometricFilter *)operator new();
  nis::GeometricFilter::GeometricFilter(v9, a3, !a4, a5);
  value = (uint64_t)v8->_geometricFilter.__ptr_.__value_;
  v8->_geometricFilter.__ptr_.__value_ = (GeometricFilter *)v9;
  if (value)
    std::default_delete<nis::GeometricFilter>::operator()[abi:ne180100]((uint64_t)&v8->_geometricFilter, value);
  return v8;
}

- (void)dealloc
{
  unique_ptr<nis::GeometricFilter, std::default_delete<nis::GeometricFilter>> *p_geometricFilter;
  uint64_t v4;
  GeometricFilter *value;
  objc_super v6;

  value = self->_geometricFilter.__ptr_.__value_;
  p_geometricFilter = &self->_geometricFilter;
  v4 = (uint64_t)value;
  p_geometricFilter->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<nis::GeometricFilter>::operator()[abi:ne180100]((uint64_t)p_geometricFilter, v4);
  v6.receiver = self;
  v6.super_class = (Class)GeometricJointsFilter;
  -[GeometricJointsFilter dealloc](&v6, sel_dealloc);
}

- (void)filter:(const void *)a3
{
  unsigned __int8 *anon_10;
  GeometricFilter *value;
  char *v6;
  char *v7;
  const void *v8;

  anon_10 = self->_anon_10;
  memcpy(self->_anon_10, a3, sizeof(self->_anon_10));
  nis::GeometricFilter::call((uint64_t)self->_geometricFilter.__ptr_.__value_, (uint64_t)anon_10);
  value = self->_geometricFilter.__ptr_.__value_;
  v6 = (char *)value + 2576;
  v7 = (char *)value + 848;
  if (self->_isPredictive)
    v8 = v6;
  else
    v8 = v7;
  return memcpy(anon_10, v8, 0x6C0uLL);
}

- (void)clear
{
  nis::GeometricFilter::clear((nis::GeometricFilter *)self->_geometricFilter.__ptr_.__value_, (uint64_t)a2);
}

- (void).cxx_destruct
{
  unique_ptr<nis::GeometricFilter, std::default_delete<nis::GeometricFilter>> *p_geometricFilter;
  uint64_t v3;
  GeometricFilter *value;

  value = self->_geometricFilter.__ptr_.__value_;
  p_geometricFilter = &self->_geometricFilter;
  v3 = (uint64_t)value;
  p_geometricFilter->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<nis::GeometricFilter>::operator()[abi:ne180100]((uint64_t)p_geometricFilter, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
