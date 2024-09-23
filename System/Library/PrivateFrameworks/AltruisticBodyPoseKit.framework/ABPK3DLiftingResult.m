@implementation ABPK3DLiftingResult

- (ABPK3DLiftingResult)init
{
  ABPK3DLiftingResult *v2;
  void *__p;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  v5 = 0;
  v6 = 0;
  __p = 0;
  v2 = -[ABPK3DLiftingResult initWithJoints:rawNetworkOutputs:referenceDetectionResult:](self, "initWithJoints:rawNetworkOutputs:referenceDetectionResult:", &v7, &__p, 0);
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
  if (v7)
  {
    v8 = v7;
    operator delete(v7);
  }

  return v2;
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self rawNetworkOutputs:(SEL)a2 referenceDetectionResult:(vector<float)__attribute__((ext_vector_type(3
{
  id v9;
  ABPK3DLiftingResult *v10;
  ABPK3DLiftingResult *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ABPK3DLiftingResult;
  v10 = -[ABPK3DLiftingResult init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    std::vector<float>::__move_assign((uint64_t)&v10->_jointsVector, (__n128 *)a3.var0);
    objc_storeStrong((id *)&v11->_skeletonDetectionResult2D, a5);
    std::vector<float>::__move_assign((uint64_t)&v11->_rawNetworkOutputJointsVector, (__n128 *)a4.var0);
  }

  return v11;
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2 referenceDetectionResult:
{
  return -[ABPK3DLiftingResult initWithJoints:numberOfJoints:rawNetworkOutputs:referenceDetectionResult:](self, "initWithJoints:numberOfJoints:rawNetworkOutputs:referenceDetectionResult:");
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2 rawNetworkOutputs:referenceDetectionResult:
{
  const void *v2;
  unint64_t v3;
  const void *v4;
  void *v5;
  const void *v6;
  unint64_t v7;
  const void *v8;
  id v10;
  ABPK3DLiftingResult *v11;
  void *__p;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v6 = v4;
  v7 = v3;
  v8 = v2;
  v10 = v5;
  v17 = 0;
  v18 = 0;
  v16 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v16, v8, (uint64_t)v8 + 16 * v7, v7);
  __p = 0;
  v14 = 0;
  v15 = 0;
  if (v6)
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&__p, v6, (uint64_t)v6 + 16 * v7, v7);
  v11 = -[ABPK3DLiftingResult initWithJoints:rawNetworkOutputs:referenceDetectionResult:](self, "initWithJoints:rawNetworkOutputs:referenceDetectionResult:", &v16, &__p, v10);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  if (v16)
  {
    v17 = v16;
    operator delete(v16);
  }

  return v11;
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2
{
  return -[ABPK3DLiftingResult initWithJoints:numberOfJoints:referenceDetectionResult:](self, "initWithJoints:numberOfJoints:referenceDetectionResult:");
}

- (uint64_t)joints
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)rawNetworkOutputJoints
{
  return *(_QWORD *)(a1 + 32);
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4;
}

- (id)createResultScaledByFactor:(float)a3
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v5;
  float32x4_t *v6;
  float32x4_t v7;
  ABPK3DLiftingResult *v8;
  _BYTE *v9;
  _BYTE *v10;
  void *v11;
  ABPK3DLiftingResult *v12;
  void *__p;
  _BYTE *v16;

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&__p, (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4);
  var0 = self->_jointsVector.var0;
  v5 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
  if (var0 != v5)
  {
    v6 = (float32x4_t *)__p;
    do
    {
      v7 = *(float32x4_t *)var0;
      var0 += 2;
      *v6++ = vmulq_n_f32(v7, a3);
    }
    while (var0 != v5);
  }
  v8 = [ABPK3DLiftingResult alloc];
  v9 = __p;
  v10 = v16;
  -[ABPK3DLiftingResult skeletonDetectionResult2D](self, "skeletonDetectionResult2D");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ABPK3DLiftingResult initWithJoints:numberOfJoints:referenceDetectionResult:](v8, "initWithJoints:numberOfJoints:referenceDetectionResult:", v9, (v10 - v9) >> 4, v11);

  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  return v12;
}

- (BOOL)isJointTracked:(int64_t)a3
{
  unint64_t v4;

  if (a3 < 0)
    return 0;
  if (((uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4) - 1 >= (unint64_t)a3)
  {
    v4 = ARRigInputJointsDependencies[a3];
    if (-[ABPK2DDetectionResult jointCount](self->_skeletonDetectionResult2D, "jointCount") - 1 >= v4)
      return -[ABPK2DDetectionResult jointTrackingStates](self->_skeletonDetectionResult2D, "jointTrackingStates")[4 * v4] == 1;
  }
  return 0;
}

- (ABPK2DDetectionResult)skeletonDetectionResult2D
{
  return self->_skeletonDetectionResult2D;
}

- (float)estimatedScale
{
  return self->_estimatedScale;
}

- (void)setEstimatedScale:(float)a3
{
  self->_estimatedScale = a3;
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v4;

  objc_storeStrong((id *)&self->_skeletonDetectionResult2D, 0);
  var0 = self->_rawNetworkOutputJointsVector.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v4 = self->_jointsVector.var0;
  if (v4)
  {
    *(_QWORD *)self->_anon_10 = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)init
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

@end
