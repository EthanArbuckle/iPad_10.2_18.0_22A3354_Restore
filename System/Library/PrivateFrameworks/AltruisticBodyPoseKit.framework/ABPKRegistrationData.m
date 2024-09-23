@implementation ABPKRegistrationData

- (ABPKRegistrationData)initWithImagePoints:(ABPKRegistrationData *)self imagePointsCount:(SEL)a2 jointsLifted3D:jointsLifted3DCount:cameraIntrinsics:imageDimensions:cameraFromBodyPose:registrationValid:
{
  const void *v2;
  unint64_t v3;
  const void *v4;
  unint64_t v5;
  BOOL v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  BOOL v12;
  unint64_t v13;
  const void *v14;
  unint64_t v15;
  CGFloat v16;
  CGFloat v17;
  const void *v18;
  ABPKRegistrationData *v19;
  ABPKRegistrationData *v20;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v12 = v6;
  v13 = v5;
  v14 = v4;
  v15 = v3;
  v16 = v11;
  v17 = v10;
  v29 = v8;
  v30 = v9;
  v28 = v7;
  v18 = v2;
  v33.receiver = self;
  v33.super_class = (Class)ABPKRegistrationData;
  v19 = -[ABPKRegistrationData init](&v33, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_imagePointsCount = v15;
    v31 = 0uLL;
    v32 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v31, v18, (uint64_t)v18 + 8 * v15, v15);
    var0 = v20->_imagePointsVector.var0;
    if (var0)
    {
      *(_QWORD *)v20->_anon_10 = var0;
      operator delete(var0);
      v20->_imagePointsVector.var0 = 0;
      *(_QWORD *)v20->_anon_10 = 0;
      *(_QWORD *)&v20->_anon_10[8] = 0;
    }
    *(_OWORD *)&v20->_imagePointsVector.var0 = v31;
    *(_QWORD *)&v20->_anon_10[8] = v32;
    v20->_jointsLifted3DCount = v13;
    v31 = 0uLL;
    v32 = 0;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v31, v14, (uint64_t)v14 + 16 * v13, v13);
    v22 = v34;
    v23 = v35;
    v24 = v36;
    v25 = v37;
    v26 = v20->_jointsLifted3DVector.var0;
    if (v26)
    {
      *(_QWORD *)v20->_anon_28 = v26;
      operator delete(v26);
      v25 = v37;
      v24 = v36;
      v23 = v35;
      v22 = v34;
      v20->_jointsLifted3DVector.var0 = 0;
      *(_QWORD *)v20->_anon_28 = 0;
      *(_QWORD *)&v20->_anon_28[8] = 0;
    }
    *(_OWORD *)&v20->_jointsLifted3DVector.var0 = v31;
    *(_QWORD *)&v20->_anon_28[8] = v32;
    *(_OWORD *)v20->_anon_60 = v28;
    *(_OWORD *)&v20->_anon_60[16] = v29;
    v20->_imageDimensions.width = v17;
    v20->_imageDimensions.height = v16;
    *(_OWORD *)&v20->_anon_60[32] = v30;
    *(_OWORD *)&v20[1].super.isa = v22;
    *(_OWORD *)v20[1]._anon_10 = v23;
    *(_OWORD *)&v20[1]._jointsLifted3DVector.var0 = v24;
    *(_OWORD *)&v20[1]._anon_28[8] = v25;
    v20->_registrationValid = v12;
  }
  return v20;
}

- (uint64_t)imagePoints
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)jointsLifted3D
{
  return *(_QWORD *)(a1 + 32);
}

- (unint64_t)imagePointsCount
{
  return self->_imagePointsCount;
}

- (unint64_t)jointsLifted3DCount
{
  return self->_jointsLifted3DCount;
}

- (__n128)cameraIntrinsics
{
  return a1[6];
}

- (CGSize)imageDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_imageDimensions.width;
  height = self->_imageDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (__n128)cameraFromBodyPose
{
  return a1[9];
}

- (BOOL)registrationValid
{
  return self->_registrationValid;
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v4;

  var0 = self->_jointsLifted3DVector.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v4 = self->_imagePointsVector.var0;
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

@end
