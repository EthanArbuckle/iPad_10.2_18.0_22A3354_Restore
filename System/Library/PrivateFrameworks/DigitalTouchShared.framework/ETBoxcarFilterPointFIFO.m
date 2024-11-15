@implementation ETBoxcarFilterPointFIFO

- (ETBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4 spacing:(float)a5
{
  ETBoxcarFilterPointFIFO *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ETBoxcarFilterPointFIFO;
  result = -[ETPointFIFO initWithFIFO:](&v8, sel_initWithFIFO_, a3);
  if (result)
  {
    result->_width = a4;
    result->_spacing = a5;
  }
  return result;
}

- (void)emitAveragedPoint
{
  int32x2_t v2;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_prevPoints;
  Class isa;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  float32x2_t v7;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v8;
  float32x2_t v9;
  int64_t v10;
  float32x2_t v11;

  p_prevPoints = &self->_prevPoints;
  var0 = self->_prevPoints.var0;
  isa = self[1].super.super.isa;
  v7 = 0;
  if (var0 != (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)isa)
  {
    v8 = self->_prevPoints.var0;
    do
    {
      v9 = (float32x2_t)*v8++;
      v2.i32[1] = v9.i32[1];
      v7 = vadd_f32(v9, v7);
    }
    while (v8 != (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)isa);
  }
  *(float *)v2.i32 = (float)self->_width;
  v11 = vdiv_f32(v7, (float32x2_t)vdup_lane_s32(v2, 0));
  v10 = isa - (Class)(var0 + 1);
  if (isa != (Class)(var0 + 1))
    memmove(var0, var0 + 1, isa - (Class)(var0 + 1));
  p_prevPoints[1].var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)((char *)var0 + v10);
  -[ETPointFIFO emitPoints:count:](self, "emitPoints:count:", &v11, 1);
}

- (void)addPoints:(ETBoxcarFilterPointFIFO *)self count:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_prevPoints;
  ETPointFIFO **p_nextFIFO;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  ETPointFIFO *v11;
  uint64_t v12;
  float32x2_t v13;
  float32x2_t v14;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v15;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v16;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v23;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v24;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v25;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v31;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v32;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v33;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v34;

  if (v3)
  {
    v4 = v3;
    v5 = v2;
    v7 = 0;
    p_prevPoints = &self->_prevPoints;
    p_nextFIFO = &self[1].super._nextFIFO;
    do
    {
      var0 = p_prevPoints->var0;
      v11 = (ETPointFIFO *)p_prevPoints[1].var0;
      v12 = ((char *)v11 - (char *)p_prevPoints->var0) >> 3;
      if (v11 == (ETPointFIFO *)p_prevPoints->var0)
      {
        v16 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)(v5 + 8 * v7);
        if (v11 >= *p_nextFIFO)
        {
          v18 = (char *)*p_nextFIFO - (char *)var0;
          v19 = v18 >> 2;
          if (v18 >> 2 <= (unint64_t)(v12 + 1))
            v19 = v12 + 1;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
            v20 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          v21 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)p_nextFIFO, v20);
          v23 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v21[8 * v12];
          *v23 = *v16;
          v17 = v23 + 1;
          v25 = p_prevPoints->var0;
          v24 = p_prevPoints[1].var0;
          if (v24 != p_prevPoints->var0)
          {
            do
            {
              v26 = *--v24;
              *--v23 = v26;
            }
            while (v24 != v25);
            v24 = p_prevPoints->var0;
          }
          p_prevPoints->var0 = v23;
          p_prevPoints[1].var0 = v17;
          p_prevPoints[2].var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v21[8 * v22];
          if (v24)
            operator delete(v24);
        }
        else
        {
          v11->super.isa = (Class)*v16;
          v17 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v11->_nextFIFO;
        }
        p_prevPoints[1].var0 = v17;
        -[ETPointFIFO emitPoints:count:](self, "emitPoints:count:", v5 + 8 * v7, 1);
      }
      else
      {
        v13 = *(float32x2_t *)(v5 + 8 * v7);
        v14 = vsub_f32((float32x2_t)v11[-1]._nextFIFO, v13);
        if (sqrtf(vaddv_f32(vmul_f32(v14, v14))) >= self->_spacing)
        {
          if (v11 >= *p_nextFIFO)
          {
            if ((unint64_t)(v12 + 1) >> 61)
              _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
            v27 = (char *)*p_nextFIFO - (char *)var0;
            v28 = v27 >> 2;
            if (v27 >> 2 <= (unint64_t)(v12 + 1))
              v28 = v12 + 1;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
              v29 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v29 = v28;
            if (v29)
            {
              v30 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)p_nextFIFO, v29);
              v13 = *(float32x2_t *)(v5 + 8 * v7);
            }
            else
            {
              v30 = 0;
            }
            v31 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v30[8 * v12];
            *v31 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v13;
            v15 = v31 + 1;
            v33 = p_prevPoints->var0;
            v32 = p_prevPoints[1].var0;
            if (v32 != p_prevPoints->var0)
            {
              do
              {
                v34 = *--v32;
                *--v31 = v34;
              }
              while (v32 != v33);
              v32 = p_prevPoints->var0;
            }
            p_prevPoints->var0 = v31;
            p_prevPoints[1].var0 = v15;
            p_prevPoints[2].var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v30[8 * v29];
            if (v32)
              operator delete(v32);
          }
          else
          {
            v11->super.isa = (Class)v13;
            v15 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v11->_nextFIFO;
          }
          p_prevPoints[1].var0 = v15;
          v12 = v15 - p_prevPoints->var0;
        }
        if (v12 == self->_width)
          -[ETBoxcarFilterPointFIFO emitAveragedPoint](self, "emitAveragedPoint");
      }
      ++v7;
    }
    while (v7 != v4);
  }
}

- (void)flush
{
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_prevPoints;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  Class isa;
  objc_super v6;

  p_prevPoints = &self->_prevPoints;
  var0 = self->_prevPoints.var0;
  isa = self[1].super.super.isa;
  if (self->_width == (isa - (Class)var0) >> 3)
  {
    -[ETBoxcarFilterPointFIFO emitAveragedPoint](self, "emitAveragedPoint");
    var0 = p_prevPoints->var0;
    isa = (Class)p_prevPoints[1].var0;
  }
  if (isa != (Class)var0)
  {
    -[ETPointFIFO emitPoints:count:](self, "emitPoints:count:", (char *)isa - 8, 1);
    var0 = p_prevPoints->var0;
  }
  p_prevPoints[1].var0 = var0;
  v6.receiver = self;
  v6.super_class = (Class)ETBoxcarFilterPointFIFO;
  -[ETPointFIFO flush](&v6, sel_flush);
}

- (void)clear
{
  objc_super v2;

  self[1].super.super.isa = (Class)self->_prevPoints.var0;
  v2.receiver = self;
  v2.super_class = (Class)ETBoxcarFilterPointFIFO;
  -[ETPointFIFO clear](&v2, sel_clear);
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (float)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(float)a3
{
  self->_spacing = a3;
}

- (vector<float)prevPoints
{
  _QWORD *v2;

  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_prevPoints.var0, (uint64_t)self[1].super.super.isa, (self[1].super.super.isa - (Class)self->_prevPoints.var0) >> 3);
}

- (void)setPrevPoints:(vector<float)__attribute__((ext_vector_type(2
{
  char *p_prevPoints;

  p_prevPoints = (char *)&self->_prevPoints;
  if (p_prevPoints != (char *)a3.var0)
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_prevPoints, *(char **)a3.var0, *((_QWORD *)a3.var0 + 1), (uint64_t)(*((_QWORD *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
}

- (void).cxx_destruct
{
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_prevPoints;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;

  p_prevPoints = &self->_prevPoints;
  var0 = self->_prevPoints.var0;
  if (var0)
  {
    p_prevPoints[1].var0 = var0;
    operator delete(var0);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
