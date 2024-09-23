@implementation Position3DFilter

- (Position3DFilter)initWithNoiseStd:(float)a3 withVelocityLimit:(float)a4 isPredictive:(BOOL)a5
{
  Position3DFilter *v8;
  nis::PositionFilter *v9;
  double v10;
  PositionFilter *value;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)Position3DFilter;
  v8 = -[Position3DFilter init](&v13, sel_init);
  v8->_isPredictive = a5;
  v9 = (nis::PositionFilter *)operator new();
  *(float *)&v10 = a4;
  nis::PositionFilter::PositionFilter(v9, !a5, a3, v10);
  value = v8->_positionFilter.__ptr_.__value_;
  v8->_positionFilter.__ptr_.__value_ = (PositionFilter *)v9;
  if (value)
    std::default_delete<nis::PositionFilter>::operator()[abi:ne180100]((uint64_t)&v8->_positionFilter, value);
  return v8;
}

- (void)dealloc
{
  unique_ptr<nis::PositionFilter, std::default_delete<nis::PositionFilter>> *p_positionFilter;
  PositionFilter *v4;
  PositionFilter *value;
  objc_super v6;

  value = self->_positionFilter.__ptr_.__value_;
  p_positionFilter = &self->_positionFilter;
  v4 = value;
  p_positionFilter->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<nis::PositionFilter>::operator()[abi:ne180100]((uint64_t)p_positionFilter, v4);
  v6.receiver = self;
  v6.super_class = (Class)Position3DFilter;
  -[Position3DFilter dealloc](&v6, sel_dealloc);
}

- (__n128)filter:(uint64_t)a1
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  float32x4_t v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 8);
  *(double *)&v4 = _ZN3nis15OneShekelFilterIDv3_fNS_15FilterUtilitiesIS1_Lj16EEEE4callERS1_f(*(_QWORD *)v3, &v8, -1.0);
  *(_OWORD *)(v3 + 32) = v4;
  if (!*(_BYTE *)(v3 + 24))
  {
    *(double *)&v5 = _ZN3nis15OneShekelFilterIDv3_fNS_15FilterUtilitiesIS1_Lj16EEEE4callERS1_f(*(_QWORD *)(v3 + 8), &v8, -1.0);
    *(_OWORD *)(v3 + 48) = v5;
  }
  v6 = 48;
  if (!*(_BYTE *)(a1 + 16))
    v6 = 32;
  return *(__n128 *)(*(_QWORD *)(a1 + 8) + v6);
}

- (void)clear
{
  double v2;
  double v3;

  nis::PositionFilter::clear((nis::PositionFilter *)self->_positionFilter.__ptr_.__value_, v2, v3);
}

- (void)setVelocityLimit:(float)a3
{
  int32x2_t v3;
  PositionFilter *value;
  int32x4_t v5;
  int32x4_t *v6;
  int32x4_t v7;
  int32x4_t *v8;

  value = self->_positionFilter.__ptr_.__value_;
  *((float *)value + 5) = a3;
  *(float *)v3.i32 = -a3;
  v5 = vdupq_lane_s32(v3, 0);
  v6 = *(int32x4_t **)value;
  v7 = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
  v6[45] = v5;
  v6[46] = v7;
  if (!*((_BYTE *)value + 24))
  {
    v8 = (int32x4_t *)*((_QWORD *)value + 1);
    v8[45] = v5;
    v8[46] = v7;
  }
}

- (void).cxx_destruct
{
  unique_ptr<nis::PositionFilter, std::default_delete<nis::PositionFilter>> *p_positionFilter;
  PositionFilter *v3;
  PositionFilter *value;

  value = self->_positionFilter.__ptr_.__value_;
  p_positionFilter = &self->_positionFilter;
  v3 = value;
  p_positionFilter->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<nis::PositionFilter>::operator()[abi:ne180100]((uint64_t)p_positionFilter, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
