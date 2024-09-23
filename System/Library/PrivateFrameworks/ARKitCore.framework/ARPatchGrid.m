@implementation ARPatchGrid

- (ARPatchGrid)initWithPatchesVector:()vector<ARPatch pivotAngle:(std:(float)a4 :allocator<ARPatch>> *)a3
{
  ARPatchGrid *v6;
  ARPatchGrid *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARPatchGrid;
  v6 = -[ARPatchGrid init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v6->_patchesVector, (__n128 *)a3);
    v7->_angle = a4;
  }
  return v7;
}

- (unint64_t)size
{
  return (self->_patchesVector.__end_ - self->_patchesVector.__begin_) >> 4;
}

- (const)patches
{
  return self->_patchesVector.__begin_;
}

- (float)pivot
{
  return self->_angle;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x2_t **v5;
  uint64_t v6;
  float32x2_t *v7;
  float32x2_t *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  float32x2_t v10;
  float32x2_t v11;
  BOOL v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = (float32x2_t **)v4;
    v6 = objc_msgSend(v5, "size");
    if (v6 == -[ARPatchGrid size](self, "size"))
    {
      v7 = v5[1];
      v8 = v5[2];
      if (v7 == v8)
      {
LABEL_8:
        v12 = *((float *)v5 + 8) == self->_angle;
LABEL_11:

        goto LABEL_12;
      }
      begin = self->_patchesVector.__begin_;
      while (1)
      {
        v10 = vsub_f32(*v7, *(float32x2_t *)begin);
        if (fabsf(sqrtf(vaddv_f32(vmul_f32(v10, v10)))) >= 0.00000011921)
          break;
        v11 = vsub_f32(v7[1], *(float32x2_t *)((char *)begin + 8));
        if (fabsf(sqrtf(vaddv_f32(vmul_f32(v11, v11)))) >= 0.00000011921)
          break;
        v7 += 2;
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
        if (v7 == v8)
          goto LABEL_8;
      }
    }
    v12 = 0;
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  void *v6;
  void *__p;
  void *v9;
  uint64_t v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v9 = 0;
  v10 = 0;
  __p = 0;
  std::vector<ARPatch>::__init_with_size[abi:ne180100]<ARPatch*,ARPatch*>(&__p, self->_patchesVector.__begin_, (uint64_t)self->_patchesVector.__end_, (self->_patchesVector.__end_ - self->_patchesVector.__begin_) >> 4);
  *(float *)&v5 = self->_angle;
  v6 = (void *)objc_msgSend(v4, "initWithPatchesVector:pivotAngle:", &__p, v5);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  *(float *)&v5 = self->_angle;
  v6 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("angle"), v5);
  objc_msgSend(v6, "encodeBytes:length:forKey:", self->_patchesVector.__begin_, self->_patchesVector.__end_ - self->_patchesVector.__begin_, CFSTR("patchesVector"));

}

- (ARPatchGrid)initWithCoder:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;
  const void *v8;
  double v9;
  ARPatchGrid *v10;
  void *__p[2];
  uint64_t v13;
  void *v14[2];
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("angle"));
  v6 = v5;
  v16 = 0;
  v7 = objc_retainAutorelease(v4);
  v8 = (const void *)objc_msgSend(v7, "decodeBytesForKey:returnedLength:", CFSTR("patchesVector"), &v16);
  v14[1] = 0;
  v15 = 0;
  v14[0] = 0;
  std::vector<ARPatch>::__init_with_size[abi:ne180100]<ARPatch*,ARPatch*>(v14, v8, (uint64_t)v8 + (v16 & 0xFFFFFFFFFFFFFFF0), v16 >> 4);
  HIDWORD(v9) = HIDWORD(v14[0]);
  *(_OWORD *)__p = *(_OWORD *)v14;
  v13 = v15;
  v14[1] = 0;
  v15 = 0;
  v14[0] = 0;
  LODWORD(v9) = v6;
  v10 = -[ARPatchGrid initWithPatchesVector:pivotAngle:](self, "initWithPatchesVector:pivotAngle:", __p, v9);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v14[0])
  {
    v14[1] = v14[0];
    operator delete(v14[0]);
  }

  return v10;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_patchesVector.__begin_;
  if (begin)
  {
    self->_patchesVector.__end_ = begin;
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
