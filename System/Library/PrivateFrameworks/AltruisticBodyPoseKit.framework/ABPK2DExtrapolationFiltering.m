@implementation ABPK2DExtrapolationFiltering

- (ABPK2DExtrapolationFiltering)initWithUse3DSkeletonForExtrapolation:(BOOL)a3 shouldPush3DSupportSkeleton:(BOOL)a4 withExtrapolationTime:(double)a5
{
  ABPK2DExtrapolationFiltering *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ABPK2DExtrapolationFiltering;
  result = -[ABPK2DExtrapolationFiltering init](&v9, sel_init);
  if (result)
  {
    result->_extrapolationTime = a5;
    result->_use3DSupportSkeletonForExtrapolation = a3;
    result->_shouldPush3DSupportSkeleton = a4;
    result->_lastANSTTrackedInstanceId = 10000;
  }
  return result;
}

- (int)performExtrapolationOnHumans:()vector<abpk:(std:(CGSize)a4 :(double)a5 allocator<abpk:(int64_t)a6 :(id)a7 Human>> *)a3 :Human withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:
{
  double height;
  double width;
  id v13;
  _QWORD v15[3];
  void **v16;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  memset(v15, 0, sizeof(v15));
  std::vector<abpk::Human>::__init_with_size[abi:ne180100]<abpk::Human*,abpk::Human*>((abpk::Human *)v15, (abpk::Human *)a3->__begin_, (abpk::Human *)a3->__end_, 0xEEEEEEEEEEEEEEEFLL * (a3->__end_ - a3->__begin_));
  LODWORD(a6) = -[ABPK2DExtrapolationFiltering performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:personTracker:](self, "performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:personTracker:", v15, a6, v13, 0, width, height, a5);
  v16 = (void **)v15;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](&v16);

  return a6;
}

- (int)performExtrapolationOnHumans:()vector<abpk:(std:(CGSize)a4 :(double)a5 allocator<abpk:(int64_t)a6 :(id)a7 Human>> *)a3 :(id)a8 Human withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:personTracker:
{
  double height;
  double width;
  Human *p_rawTrackedHuman;
  Human *var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v17;
  Human v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v24;
  void *v25;
  Human *v26;
  void *v27;
  _QWORD *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v32;
  void *v33;
  Human *v34;
  void *v35;
  char *v36;
  uint64_t v37;
  Human *p_trackedHuman;
  NSObject *v39;
  NSObject *v40;
  ABPK2DDetectionResult *v41;
  ABPK2DDetectionResult *aligned3DSkeleton;
  int v43;
  NSObject *v44;
  NSObject *v45;
  float32x2_t **p_trackedHumanForLifting;
  _DWORD *v47;
  float32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  unsigned __int32 v51;
  float32x2_t v52;
  float32x2_t v53;
  uint64_t *p_extrapolationFilter2D;
  _QWORD *v55;
  _QWORD *v56;
  ABPK2DDetectionResult *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v61;
  float *v62;
  float *v63;
  float *v64;
  abpk::Human *v65;
  float32x2_t v66;
  float32x2_t v67;
  char *v68;
  float *v69;
  int v70;
  float *v71;
  float *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v78;
  char *v79;
  int v80;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v81;
  uint64_t v82;
  float *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  float *v90;
  int v91;
  float *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  float *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  int v105;
  float *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  int v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  int v115;
  int v116;
  double extrapolationTime;
  _QWORD *v118;
  uint64_t *v119;
  NSObject *v120;
  NSObject *v121;
  _QWORD *v123;
  int v124;
  uint64_t v125;
  id v126;
  id v127;
  uint8_t v128[8];
  float *v129;
  _QWORD v130[2];
  _QWORD v131[3];
  _QWORD v132[3];
  uint8_t buf[16];
  uint64_t v134;
  void *v135[2];
  uint64_t v136;
  void *v137[2];
  uint64_t v138;
  __n128 __p;
  char v140;
  _QWORD v141[5];

  height = a4.height;
  width = a4.width;
  v141[2] = *MEMORY[0x24BDAC8D0];
  p_rawTrackedHuman = &self->_rawTrackedHuman;
  v126 = a7;
  v127 = a8;
  std::vector<abpk::Human>::__vdeallocate((void **)&p_rawTrackedHuman[16].keypoints.var0);
  *(vector<abpk::Human, std::allocator<abpk::Human>> *)&p_rawTrackedHuman[16].keypoints.var0 = *a3;
  a3->__begin_ = 0;
  a3->__end_ = 0;
  a3->__end_cap_.__value_ = 0;
  var0 = (Human *)p_rawTrackedHuman[16].keypoints.var0;
  if (var0 == self->_rawTrackedHumanVector.__end_)
  {
    __ABPKLogSharedInstance();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v29, OS_LOG_TYPE_DEBUG, " \t\t No humans detected in the image ", buf, 2u);
    }

    goto LABEL_58;
  }
  v18.keypoints.var0 = var0->keypoints.var0;
  v17 = var0[1].keypoints.var0;
  __ABPKLogSharedInstance();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = 0xEEEEEEEEEEEEEEEFLL * (self->_rawTrackedHumanVector.__end_ - self->_rawTrackedHumanVector.__begin_);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v20;
    _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_DEBUG, " \t ABPK2DExtrapolationFiltering: Found 2d skeletons: %lu ", buf, 0xCu);
  }

  if (v127)
  {
    __ABPKLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_msgSend(v127, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_DEBUG, " \t ABPK2DExtrapolationFiltering: Found full bodies in the image: %lu ", buf, 0xCu);
    }

    if (objc_msgSend(v127, "count"))
    {
      __ABPKLogSharedInstance();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " \t Associating skeletons with ANST BBs ", buf, 2u);
      }

      memset(v132, 0, sizeof(v132));
      std::vector<abpk::Human>::__init_with_size[abi:ne180100]<abpk::Human*,abpk::Human*>((abpk::Human *)v132, (abpk::Human *)self->_rawTrackedHumanVector.__begin_, (abpk::Human *)self->_rawTrackedHumanVector.__end_, 0xEEEEEEEEEEEEEEEFLL * (self->_rawTrackedHumanVector.__end_ - self->_rawTrackedHumanVector.__begin_));
      -[ABPK2DExtrapolationFiltering _getTrackedHumanForHumans:atTimestamp:withImageResolution:withPersonTracker:](self, "_getTrackedHumanForHumans:atTimestamp:withImageResolution:withPersonTracker:", v132, v127, a5, width, height);
      v24 = p_rawTrackedHuman->keypoints.var0;
      if (p_rawTrackedHuman->keypoints.var0)
      {
        *(_QWORD *)self->_anon_180 = v24;
        operator delete(v24);
        p_rawTrackedHuman->keypoints.var0 = 0;
        p_rawTrackedHuman[1].keypoints.var0 = 0;
        p_rawTrackedHuman[2].keypoints.var0 = 0;
      }
      *(_OWORD *)&p_rawTrackedHuman->keypoints.var0 = *(_OWORD *)buf;
      *(_QWORD *)&self->_anon_180[8] = v134;
      v134 = 0;
      memset(buf, 0, sizeof(buf));
      v25 = *(void **)&self->_anon_180[16];
      if (v25)
      {
        *(_QWORD *)&self->_anon_180[24] = v25;
        operator delete(v25);
        *(_QWORD *)&self->_anon_180[16] = 0;
        *(_QWORD *)&self->_anon_180[24] = 0;
        *(_QWORD *)&self->_anon_180[32] = 0;
      }
      *(_OWORD *)&self->_anon_180[16] = *(_OWORD *)v135;
      *(_QWORD *)&self->_anon_180[32] = v136;
      v135[1] = 0;
      v136 = 0;
      v135[0] = 0;
      v26 = p_rawTrackedHuman + 6;
      v27 = *(void **)&self->_anon_180[40];
      if (v27)
      {
        *(_QWORD *)&self->_anon_180[48] = v27;
        operator delete(v27);
        v26->keypoints.var0 = 0;
        p_rawTrackedHuman[7].keypoints.var0 = 0;
        p_rawTrackedHuman[8].keypoints.var0 = 0;
      }
      *(_OWORD *)&v26->keypoints.var0 = *(_OWORD *)v137;
      *(_QWORD *)&self->_anon_180[56] = v138;
      v137[1] = 0;
      v138 = 0;
      v137[0] = 0;
      _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100INS_27__optional_move_assign_baseIS5_Lb0EEEEEvOT_((uint64_t)&self->_anon_180[64], &__p);
      *(_QWORD *)&self->_anon_180[96] = v141[0];
      *(_QWORD *)&self->_anon_180[101] = *(_QWORD *)((char *)v141 + 5);
      if (v140 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (v137[0])
      {
        v137[1] = v137[0];
        operator delete(v137[0]);
      }
      if (v135[0])
      {
        v135[1] = v135[0];
        operator delete(v135[0]);
      }
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      v28 = v132;
      goto LABEL_50;
    }
  }
  else
  {
    __ABPKLogSharedInstance();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v30, OS_LOG_TYPE_DEBUG, " \t ABPK2DExtrapolationFiltering: No full bodies in the image ", buf, 2u);
    }

  }
  __ABPKLogSharedInstance();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v31, OS_LOG_TYPE_DEBUG, " \t Associating skeletons with legacy 2d skeleton matching ", buf, 2u);
  }

  memset(v131, 0, sizeof(v131));
  std::vector<abpk::Human>::__init_with_size[abi:ne180100]<abpk::Human*,abpk::Human*>((abpk::Human *)v131, (abpk::Human *)self->_rawTrackedHumanVector.__begin_, (abpk::Human *)self->_rawTrackedHumanVector.__end_, 0xEEEEEEEEEEEEEEEFLL * (self->_rawTrackedHumanVector.__end_ - self->_rawTrackedHumanVector.__begin_));
  -[ABPK2DExtrapolationFiltering _getTrackedHumanForHumans:atTimestamp:withImageResolution:](self, "_getTrackedHumanForHumans:atTimestamp:withImageResolution:", v131, a5, width, height);
  v32 = p_rawTrackedHuman->keypoints.var0;
  if (p_rawTrackedHuman->keypoints.var0)
  {
    *(_QWORD *)self->_anon_180 = v32;
    operator delete(v32);
    p_rawTrackedHuman->keypoints.var0 = 0;
    p_rawTrackedHuman[1].keypoints.var0 = 0;
    p_rawTrackedHuman[2].keypoints.var0 = 0;
  }
  *(_OWORD *)&p_rawTrackedHuman->keypoints.var0 = *(_OWORD *)buf;
  *(_QWORD *)&self->_anon_180[8] = v134;
  v134 = 0;
  memset(buf, 0, sizeof(buf));
  v33 = *(void **)&self->_anon_180[16];
  if (v33)
  {
    *(_QWORD *)&self->_anon_180[24] = v33;
    operator delete(v33);
    *(_QWORD *)&self->_anon_180[16] = 0;
    *(_QWORD *)&self->_anon_180[24] = 0;
    *(_QWORD *)&self->_anon_180[32] = 0;
  }
  *(_OWORD *)&self->_anon_180[16] = *(_OWORD *)v135;
  *(_QWORD *)&self->_anon_180[32] = v136;
  v135[1] = 0;
  v136 = 0;
  v135[0] = 0;
  v34 = p_rawTrackedHuman + 6;
  v35 = *(void **)&self->_anon_180[40];
  if (v35)
  {
    *(_QWORD *)&self->_anon_180[48] = v35;
    operator delete(v35);
    v34->keypoints.var0 = 0;
    p_rawTrackedHuman[7].keypoints.var0 = 0;
    p_rawTrackedHuman[8].keypoints.var0 = 0;
  }
  *(_OWORD *)&v34->keypoints.var0 = *(_OWORD *)v137;
  *(_QWORD *)&self->_anon_180[56] = v138;
  v137[1] = 0;
  v138 = 0;
  v137[0] = 0;
  _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100INS_27__optional_move_assign_baseIS5_Lb0EEEEEvOT_((uint64_t)&self->_anon_180[64], &__p);
  *(_QWORD *)&self->_anon_180[96] = v141[0];
  *(_QWORD *)&self->_anon_180[101] = *(_QWORD *)((char *)v141 + 5);
  if (v140 && __p.n128_u64[0])
  {
    __p.n128_u64[1] = __p.n128_u64[0];
    operator delete((void *)__p.n128_u64[0]);
  }
  if (v137[0])
  {
    v137[1] = v137[0];
    operator delete(v137[0]);
  }
  if (v135[0])
  {
    v135[1] = v135[0];
    operator delete(v135[0]);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  v28 = v131;
LABEL_50:
  *(_QWORD *)v128 = v28;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v128);
  v36 = (char *)self->_rawTrackedHuman.keypoints.var0;
  v37 = *(_QWORD *)self->_anon_180;
  if ((char *)v37 == v36)
  {
LABEL_58:
    self->_extrapolationFilter2D.m_values.__end_ = self->_extrapolationFilter2D.m_values.__begin_;
    self->_extrapolationFilter2DForLiftingData.m_values.__end_ = self->_extrapolationFilter2DForLiftingData.m_values.__begin_;
    v43 = -6667;
    goto LABEL_187;
  }
  p_trackedHuman = &self->_trackedHuman;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)&self->_trackedHuman, v36, v37, (v37 - (uint64_t)v36) >> 3);
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&self->_anon_108[16], *(char **)&self->_anon_180[16], *(_QWORD *)&self->_anon_180[24], (uint64_t)(*(_QWORD *)&self->_anon_180[24] - *(_QWORD *)&self->_anon_180[16]) >> 2);
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&self->_anon_108[40], *(char **)&self->_anon_180[40], *(_QWORD *)&self->_anon_180[48], (uint64_t)(*(_QWORD *)&self->_anon_180[48] - *(_QWORD *)&self->_anon_180[40]) >> 2);
  _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100IRKNS_27__optional_copy_assign_baseIS5_Lb0EEEEEvOT_((uint64_t)&self->_anon_108[64], (uint64_t)&self->_anon_180[64]);
  *(_QWORD *)&self->_anon_108[96] = *(_QWORD *)&self->_anon_180[96];
  *(_DWORD *)&self->_anon_108[104] = *(_DWORD *)&self->_anon_180[104];
  self->_anon_108[108] = self->_anon_180[108];
  if (v126)
  {
    __ABPKLogSharedInstance();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v39, OS_LOG_TYPE_DEBUG, " Previous 3d skeleton is not nil ", buf, 2u);
    }

    if (objc_msgSend(v126, "jointCount"))
    {
      __ABPKLogSharedInstance();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v40, OS_LOG_TYPE_DEBUG, " Previous 3d skeleton valid. Using it for alignment ", buf, 2u);
      }

      v41 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]([ABPK2DDetectionResult alloc], "initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:", *(_QWORD *)abpk::Human::jointVector((abpk::Human *)&self->_trackedHuman), *(_QWORD *)&self->_anon_108[16], (uint64_t)(*(_QWORD *)self->_anon_108 - (unint64_t)self->_trackedHuman.keypoints.var0) >> 3, v126, a6);
      aligned3DSkeleton = self->_aligned3DSkeleton;
      self->_aligned3DSkeleton = v41;
    }
    else
    {
      __ABPKLogSharedInstance();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v44, OS_LOG_TYPE_DEBUG, " previousSkeleton3D.jointCount == 0 ", buf, 2u);
      }

      __ABPKLogSharedInstance();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v45, OS_LOG_TYPE_DEBUG, " Setting _aligned3DSkeleton = nil ", buf, 2u);
      }

      aligned3DSkeleton = self->_aligned3DSkeleton;
      self->_aligned3DSkeleton = 0;
    }

  }
  p_trackedHumanForLifting = (float32x2_t **)&self->_trackedHumanForLifting;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)&self->_trackedHumanForLifting, (char *)self->_trackedHuman.keypoints.var0, *(_QWORD *)self->_anon_108, (uint64_t)(*(_QWORD *)self->_anon_108 - (unint64_t)self->_trackedHuman.keypoints.var0) >> 3);
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&self->_anon_218[16], *(char **)&self->_anon_108[16], *(_QWORD *)&self->_anon_108[24], (uint64_t)(*(_QWORD *)&self->_anon_108[24] - *(_QWORD *)&self->_anon_108[16]) >> 2);
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&self->_anon_218[40], *(char **)&self->_anon_108[40], *(_QWORD *)&self->_anon_108[48], (uint64_t)(*(_QWORD *)&self->_anon_108[48] - *(_QWORD *)&self->_anon_108[40]) >> 2);
  _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100IRKNS_27__optional_copy_assign_baseIS5_Lb0EEEEEvOT_((uint64_t)&self->_anon_218[64], (uint64_t)&self->_anon_108[64]);
  *(_QWORD *)&self->_anon_218[96] = *(_QWORD *)&self->_anon_108[96];
  *(_DWORD *)&self->_anon_218[104] = *(_DWORD *)&self->_anon_108[104];
  self->_anon_218[108] = self->_anon_108[108];
  v47 = *(_DWORD **)&self->_anon_218[16];
  if (!*v47 && v47[1] && v47[16])
  {
    v48 = (*p_trackedHumanForLifting)[1];
    v49 = vsub_f32(v48, (*p_trackedHumanForLifting)[16]);
    v50 = vmul_f32(v49, v49);
    v51 = vadd_f32(v50, (float32x2_t)vdup_lane_s32((int32x2_t)v50, 1)).u32[0];
    v52 = vrsqrte_f32((float32x2_t)v51);
    v53 = vmul_f32(v52, vrsqrts_f32((float32x2_t)v51, vmul_f32(v52, v52)));
    abpk::Human::updateJoint((uint64_t)&self->_trackedHumanForLifting, 0, COERCE_DOUBLE(vmla_f32(v48, (float32x2_t)vdup_n_s32(0x3E99999Au), vmul_n_f32(vmul_n_f32(v49, vmul_f32(v53, vrsqrts_f32((float32x2_t)v51, vmul_f32(v53, v53))).f32[0]), sqrtf(vaddv_f32(v50))))));
  }
  abpk::Human::resize((abpk::Human *)&self->_trackedHumanForLifting, 0xEuLL);
  p_extrapolationFilter2D = (uint64_t *)&self->_extrapolationFilter2D;
  v55 = (_QWORD *)abpk::SkeletonJointFilter<float>::filter((uint64_t)&self->_extrapolationFilter2D, (float *)self->_trackedHuman.keypoints.var0, (uint64_t)(*(_QWORD *)self->_anon_108 - (unint64_t)self->_trackedHuman.keypoints.var0) >> 2, a5);
  v56 = (_QWORD *)abpk::SkeletonJointFilter<float>::filter((uint64_t)&self->_extrapolationFilter2DForLiftingData, (float *)self->_trackedHumanForLifting.keypoints.var0, (uint64_t)(*(_QWORD *)self->_anon_218 - (unint64_t)self->_trackedHumanForLifting.keypoints.var0) >> 2, a5);
  memset(buf, 0, sizeof(buf));
  v134 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(buf, *(const void **)&self->_anon_108[16], *(_QWORD *)&self->_anon_108[24], (uint64_t)(*(_QWORD *)&self->_anon_108[24] - *(_QWORD *)&self->_anon_108[16]) >> 2);
  abpk::Human::updateFromRawJointArray((uint64_t *)&self->_trackedHuman, v55);
  v57 = self->_aligned3DSkeleton;
  if (v57 && self->_use3DSupportSkeletonForExtrapolation)
  {
    v125 = -[ABPK2DDetectionResult rawJointsOutput](v57, "rawJointsOutput");
    v58 = (char *)v17 - (char *)v18.keypoints.var0;
    *(_QWORD *)v128 = 0;
    v129 = 0;
    v130[0] = 0;
    std::vector<float>::reserve((void **)v128, ((char *)v17 - (char *)v18.keypoints.var0) >> 2);
    v123 = v56;
    if (v17 != v18.keypoints.var0)
    {
      v59 = 0;
      if ((unint64_t)(v58 >> 3) <= 1)
        v60 = 1;
      else
        v60 = v58 >> 3;
      while (!*(_DWORD *)(*(_QWORD *)buf + 4 * v59))
      {
        v65 = abpk::Human::jointVector((abpk::Human *)&self->_trackedHuman);
        v66 = *(float32x2_t *)(v125 + 8 * v59);
        v67 = vsub_f32(*(float32x2_t *)(*(_QWORD *)v65 + 8 * v59), v66);
        v69 = v129;
        v68 = (char *)v130[0];
        if (sqrtf(vaddv_f32(vmul_f32(v67, v67))) <= 0.03)
        {
          v78 = p_trackedHuman->keypoints.var0;
          if ((unint64_t)v129 >= v130[0])
          {
            v98 = *(float **)v128;
            v99 = ((uint64_t)v129 - *(_QWORD *)v128) >> 2;
            v100 = v99 + 1;
            if ((unint64_t)(v99 + 1) >> 62)
              goto LABEL_189;
            v101 = v130[0] - *(_QWORD *)v128;
            if ((uint64_t)(v130[0] - *(_QWORD *)v128) >> 1 > v100)
              v100 = v101 >> 1;
            if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFFCLL)
              v102 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v102 = v100;
            if (v102)
            {
              v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v130, v102);
              v98 = *(float **)v128;
              v69 = v129;
            }
            else
            {
              v103 = 0;
            }
            v110 = &v103[4 * v99];
            *(_DWORD *)v110 = v78[v59];
            v64 = (float *)(v110 + 4);
            while (v69 != v98)
            {
              v111 = *((_DWORD *)v69-- - 1);
              *((_DWORD *)v110 - 1) = v111;
              v110 -= 4;
            }
            v68 = &v103[4 * v102];
            *(_QWORD *)v128 = v110;
            v129 = v64;
            v130[0] = v68;
            if (v98)
            {
              operator delete(v98);
              v68 = (char *)v130[0];
            }
          }
          else
          {
            *v129 = *(float *)&v78[v59];
            v64 = v69 + 1;
          }
          v129 = v64;
          v81 = p_trackedHuman->keypoints.var0;
          v82 = (2 * v59) | 1;
          if (v64 >= (float *)v68)
          {
            v83 = *(float **)v128;
            v112 = ((uint64_t)v64 - *(_QWORD *)v128) >> 2;
            v113 = v112 + 1;
            if ((unint64_t)(v112 + 1) >> 62)
LABEL_189:
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            v114 = (uint64_t)&v68[-*(_QWORD *)v128];
            if (v114 >> 1 > v113)
              v113 = v114 >> 1;
            if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFFCLL)
              v87 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v87 = v113;
            if (v87)
            {
              v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v130, v87);
              v83 = *(float **)v128;
              v64 = v129;
            }
            else
            {
              v88 = 0;
            }
            v89 = &v88[4 * v112];
            *(_DWORD *)v89 = *((_DWORD *)v81 + v82);
            v90 = (float *)(v89 + 4);
            while (v64 != v83)
            {
              v116 = *((_DWORD *)v64-- - 1);
              *((_DWORD *)v89 - 1) = v116;
              v89 -= 4;
            }
            goto LABEL_167;
          }
LABEL_149:
          *v64 = *((float *)v81 + v82);
          v106 = v64 + 1;
          goto LABEL_150;
        }
        v124 = HIDWORD(*(_QWORD *)(v125 + 8 * v59));
        v70 = *(_QWORD *)(v125 + 8 * v59);
        if ((unint64_t)v129 >= v130[0])
        {
          v92 = *(float **)v128;
          v93 = ((uint64_t)v129 - *(_QWORD *)v128) >> 2;
          v94 = v93 + 1;
          if ((unint64_t)(v93 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v95 = v130[0] - *(_QWORD *)v128;
          if ((uint64_t)(v130[0] - *(_QWORD *)v128) >> 1 > v94)
            v94 = v95 >> 1;
          if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL)
            v96 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v96 = v94;
          if (v96)
          {
            v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v130, v96);
            v92 = *(float **)v128;
            v69 = v129;
          }
          else
          {
            v97 = 0;
          }
          v104 = &v97[4 * v93];
          *(_DWORD *)v104 = v70;
          v71 = (float *)(v104 + 4);
          while (v69 != v92)
          {
            v105 = *((_DWORD *)v69-- - 1);
            *((_DWORD *)v104 - 1) = v105;
            v104 -= 4;
          }
          v68 = &v97[4 * v96];
          *(_QWORD *)v128 = v104;
          v129 = v71;
          v130[0] = v68;
          if (v92)
          {
            operator delete(v92);
            v68 = (char *)v130[0];
          }
        }
        else
        {
          *v129 = v66.f32[0];
          v71 = v69 + 1;
        }
        v129 = v71;
        if (v71 >= (float *)v68)
        {
          v83 = *(float **)v128;
          v107 = ((uint64_t)v71 - *(_QWORD *)v128) >> 2;
          v108 = v107 + 1;
          if ((unint64_t)(v107 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v109 = (uint64_t)&v68[-*(_QWORD *)v128];
          if (v109 >> 1 > v108)
            v108 = v109 >> 1;
          if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFFCLL)
            v87 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v87 = v108;
          if (v87)
          {
            v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v130, v87);
            v83 = *(float **)v128;
            v71 = v129;
          }
          else
          {
            v88 = 0;
          }
          v89 = &v88[4 * v107];
          *(_DWORD *)v89 = v124;
          v90 = (float *)(v89 + 4);
          while (v71 != v83)
          {
            v115 = *((_DWORD *)v71-- - 1);
            *((_DWORD *)v89 - 1) = v115;
            v89 -= 4;
          }
LABEL_167:
          *(_QWORD *)v128 = v89;
          v129 = v90;
          v130[0] = &v88[4 * v87];
          if (v83)
            operator delete(v83);
          goto LABEL_169;
        }
        *(_DWORD *)v71 = v124;
        v106 = v71 + 1;
LABEL_150:
        v90 = v106;
LABEL_169:
        v129 = v90;
        if (++v59 == v60)
          goto LABEL_173;
      }
      v61 = p_trackedHuman->keypoints.var0;
      v63 = v129;
      v62 = (float *)v130[0];
      if ((unint64_t)v129 >= v130[0])
      {
        v72 = *(float **)v128;
        v73 = ((uint64_t)v129 - *(_QWORD *)v128) >> 2;
        v74 = v73 + 1;
        if ((unint64_t)(v73 + 1) >> 62)
          goto LABEL_188;
        v75 = v130[0] - *(_QWORD *)v128;
        if ((uint64_t)(v130[0] - *(_QWORD *)v128) >> 1 > v74)
          v74 = v75 >> 1;
        if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFFCLL)
          v76 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v76 = v74;
        if (v76)
        {
          v77 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v130, v76);
          v72 = *(float **)v128;
          v63 = v129;
        }
        else
        {
          v77 = 0;
        }
        v79 = &v77[4 * v73];
        *(_DWORD *)v79 = v61[v59];
        v64 = (float *)(v79 + 4);
        while (v63 != v72)
        {
          v80 = *((_DWORD *)v63-- - 1);
          *((_DWORD *)v79 - 1) = v80;
          v79 -= 4;
        }
        v62 = (float *)&v77[4 * v76];
        *(_QWORD *)v128 = v79;
        v129 = v64;
        v130[0] = v62;
        if (v72)
        {
          operator delete(v72);
          v62 = (float *)v130[0];
        }
      }
      else
      {
        *v129 = *(float *)&v61[v59];
        v64 = v63 + 1;
      }
      v129 = v64;
      v81 = p_trackedHuman->keypoints.var0;
      v82 = (2 * v59) | 1;
      if (v64 >= v62)
      {
        v83 = *(float **)v128;
        v84 = ((uint64_t)v64 - *(_QWORD *)v128) >> 2;
        v85 = v84 + 1;
        if ((unint64_t)(v84 + 1) >> 62)
LABEL_188:
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v86 = (uint64_t)v62 - *(_QWORD *)v128;
        if (v86 >> 1 > v85)
          v85 = v86 >> 1;
        if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFFCLL)
          v87 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v87 = v85;
        if (v87)
        {
          v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v130, v87);
          v83 = *(float **)v128;
          v64 = v129;
        }
        else
        {
          v88 = 0;
        }
        v89 = &v88[4 * v84];
        *(_DWORD *)v89 = *((_DWORD *)v81 + v82);
        v90 = (float *)(v89 + 4);
        while (v64 != v83)
        {
          v91 = *((_DWORD *)v64-- - 1);
          *((_DWORD *)v89 - 1) = v91;
          v89 -= 4;
        }
        goto LABEL_167;
      }
      goto LABEL_149;
    }
    v90 = v129;
LABEL_173:
    p_extrapolationFilter2D = (uint64_t *)&self->_extrapolationFilter2D;
    v118 = (_QWORD *)abpk::SkeletonJointFilter<float>::filter((uint64_t)&self->_extrapolationFilter2D, *(float **)v128, ((uint64_t)v90 - *(_QWORD *)v128) >> 2, a5);
    abpk::Human::updateFromRawJointArray((uint64_t *)&self->_trackedHuman, v118);
    v56 = v123;
    p_trackedHumanForLifting = (float32x2_t **)&self->_trackedHumanForLifting;
    if (*(_QWORD *)v128)
    {
      v129 = *(float **)v128;
      operator delete(*(void **)v128);
    }
    extrapolationTime = -1.0;
  }
  else
  {
    extrapolationTime = self->_extrapolationTime;
  }
  v119 = abpk::SkeletonJointFilter<float>::applyTimeConstraint(p_extrapolationFilter2D, a5, extrapolationTime);
  abpk::Human::updateFromRawJointArray((uint64_t *)&self->_trackedHuman, v119);
  if (*(_QWORD *)&self->_anon_108[96] < (unint64_t)((uint64_t)(*(_QWORD *)self->_anon_108
                                                                    - (unint64_t)self->_trackedHuman.keypoints.var0) >> 3))
  {
    __ABPKLogSharedInstance();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v128 = 0;
      _os_log_impl(&dword_210836000, v120, OS_LOG_TYPE_DEBUG, " \t\t Missing joints detected in _trackedHuman skeleton. ", v128, 2u);
    }

    abpk::Human::printMissingJoints((abpk::Human *)&self->_trackedHuman);
  }
  abpk::Human::updateFromRawJointArray((uint64_t *)p_trackedHumanForLifting, v56);
  if (*(_QWORD *)&self->_anon_218[96] < (unint64_t)((uint64_t)(*(_QWORD *)self->_anon_218
                                                                    - (unint64_t)self->_trackedHumanForLifting.keypoints.var0) >> 3))
  {
    __ABPKLogSharedInstance();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v128 = 0;
      _os_log_impl(&dword_210836000, v121, OS_LOG_TYPE_DEBUG, " \t\t Missing joints detected in _trackedHumanForLifting skeleton. ", v128, 2u);
    }

    abpk::Human::printMissingJoints((abpk::Human *)p_trackedHumanForLifting);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  v43 = 0;
LABEL_187:

  return v43;
}

- (Human)_getTrackedHumanForHumans:()vector<abpk:(std:(double)a4 :(CGSize)a5 allocator<abpk:(id)a6 :Human>> *)a3 :Human atTimestamp:withImageResolution:withPersonTracker:
{
  uint64_t v6;
  double height;
  double width;
  uint64_t v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  float v16;
  float v17;
  float v18;
  float v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  Human *begin;
  double v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t lastANSTTrackedInstanceId;
  unint64_t i;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  unint64_t v43;
  NSObject *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  Human *v57;
  Human *v58;
  float v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  Human v71;
  double v72;
  uint8_t buf[4];
  double v74;
  uint64_t v75;
  CGSize v77;
  CGSize v78;
  CGSize v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  height = a5.height;
  width = a5.width;
  v12 = v6;
  v75 = *MEMORY[0x24BDAC8D0];
  v13 = a6;
  __ABPKLogSharedInstance();
  v14 = objc_claimAutoreleasedReturnValue();
  v72 = a4;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_DEBUG, " ANST Bounding boxes ", buf, 2u);
  }

  v15 = 0;
  v16 = width;
  v17 = v16 / 288.0;
  v18 = height;
  v19 = v18 / 192.0;
  while (objc_msgSend(v13, "count") > v15)
  {
    __ABPKLogSharedInstance();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v15;
      _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_DEBUG, " Person: %d ", buf, 8u);
    }

    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "boundingBox");
    printCGRect(v80, v17, v19);

    ++v15;
  }
  __ABPKLogSharedInstance();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v22, OS_LOG_TYPE_DEBUG, " 2d Skeleton Bounding boxes ", buf, 2u);
  }

  begin = a3->__begin_;
  if (a3->__begin_ != a3->__end_)
  {
    v24 = 0.0;
    do
    {
      __ABPKLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v74 = v24;
        _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_DEBUG, " Human: %lu ", buf, 0xCu);
      }

      v77.width = width;
      v77.height = height;
      v81.origin.x = abpk::Human::boundingBox((abpk::Human *)begin, v77);
      printCGRect(v81, 1.0, 1.0);
      ++*(_QWORD *)&v24;
      begin += 15;
    }
    while (begin != a3->__end_);
  }
  __ABPKLogSharedInstance();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    lastANSTTrackedInstanceId = self->_lastANSTTrackedInstanceId;
    *(_DWORD *)buf = 134217984;
    v74 = *(double *)&lastANSTTrackedInstanceId;
    _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_DEBUG, " _lastANSTTrackedInstanceId %lu ", buf, 0xCu);
  }

  for (i = 0; i < objc_msgSend(v13, "count"); ++i)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "objectID") == self->_lastANSTTrackedInstanceId;

    if (v30)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "boundingBox");
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v53 = v52;

      objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)&v43 = COERCE_DOUBLE(objc_msgSend(v54, "objectID"));

      v55 = v17;
      v35 = v47 * v17;
      v56 = v19;
      v37 = v49 * v19;
      v39 = v51 * v55;
      v41 = v53 * v56;
      self->_lastANSTTrackedInstanceIdTime = v72;
      goto LABEL_30;
    }
  }
  __ABPKLogSharedInstance();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v31, OS_LOG_TYPE_DEBUG, " _lastANSTTrackedInstanceId not found in the current frame ", buf, 2u);
  }

  self->_extrapolationFilter2D.m_values.__end_ = self->_extrapolationFilter2D.m_values.__begin_;
  self->_extrapolationFilter2DForLiftingData.m_values.__end_ = self->_extrapolationFilter2DForLiftingData.m_values.__begin_;
  if (a4 - self->_lastANSTTrackedInstanceIdTime > 2.0)
  {
    __ABPKLogSharedInstance();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v32, OS_LOG_TYPE_DEBUG, " Primary person occluded for more than set threshold. Shifting tracking to a different person ", buf, 2u);
    }

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "boundingBox");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v43 = COERCE_DOUBLE(objc_msgSend(v42, "objectID"));

    __ABPKLogSharedInstance();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v74 = *(double *)&v43;
      _os_log_impl(&dword_210836000, v44, OS_LOG_TYPE_DEBUG, " Picked %lu as the new ID ", buf, 0xCu);
    }

LABEL_30:
    v57 = a3->__begin_;
    if (a3->__begin_ == a3->__end_)
    {
      v59 = -10000.0;
    }
    else
    {
      v58 = 0;
      v59 = -10000.0;
      do
      {
        v78.width = width;
        v78.height = height;
        v60 = abpk::Human::boundingBox((abpk::Human *)v57, v78);
        v64 = computeIOUbetweenRects(v60, v61, v62, v63, v35, v37, v39, v41);
        __ABPKLogSharedInstance();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v74 = v64;
          _os_log_impl(&dword_210836000, v65, OS_LOG_TYPE_DEBUG, " \t\t iou: %f ", buf, 0xCu);
        }

        if (v64 > v59)
        {
          v58 = v57;
          v59 = v64;
        }
        v57 += 15;
      }
      while (v57 != a3->__end_);
      if (v59 >= 0.0)
        goto LABEL_43;
    }
    __ABPKLogSharedInstance();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v66, OS_LOG_TYPE_DEBUG, " IOU is lower than threshold. No closest human found from the previous frame. Assigning new tracking id ", buf, 2u);
    }

    v58 = a3->__begin_;
    self->_extrapolationFilter2D.m_values.__end_ = self->_extrapolationFilter2D.m_values.__begin_;
    self->_extrapolationFilter2DForLiftingData.m_values.__end_ = self->_extrapolationFilter2DForLiftingData.m_values.__begin_;
LABEL_43:
    __ABPKLogSharedInstance();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v74 = v59;
      _os_log_impl(&dword_210836000, v67, OS_LOG_TYPE_DEBUG, " Associated skeleton with IOU: %f ", buf, 0xCu);
    }

    __ABPKLogSharedInstance();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v68, OS_LOG_TYPE_DEBUG, " _lastANSTTrackedInstanceIdBB ", buf, 2u);
    }

    v82.origin.x = v35;
    v82.origin.y = v37;
    v82.size.width = v39;
    v82.size.height = v41;
    printCGRect(v82, 1.0, 1.0);
    __ABPKLogSharedInstance();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v69, OS_LOG_TYPE_DEBUG, " Human ", buf, 2u);
    }

    v79.width = width;
    v79.height = height;
    v83.origin.x = abpk::Human::boundingBox((abpk::Human *)v58, v79);
    printCGRect(v83, 1.0, 1.0);
    if (self->_lastANSTTrackedInstanceId != v43)
    {
      self->_extrapolationFilter2D.m_values.__end_ = self->_extrapolationFilter2D.m_values.__begin_;
      self->_extrapolationFilter2DForLiftingData.m_values.__end_ = self->_extrapolationFilter2DForLiftingData.m_values.__begin_;
    }
    self->_lastANSTTrackedInstanceId = v43;
    self->_iteratorToTrackedInstance.__i_ = v58;
    abpk::Human::Human((abpk::Human *)v12, (const abpk::Human *)v58);
    goto LABEL_55;
  }
  __ABPKLogSharedInstance();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v70, OS_LOG_TYPE_DEBUG, " Primary person occluded. Waiting for them to be visible. ", buf, 2u);
  }

  *(_QWORD *)(v12 + 112) = 0;
  *(_OWORD *)(v12 + 80) = 0u;
  *(_OWORD *)(v12 + 96) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(_OWORD *)(v12 + 64) = 0u;
  *(_OWORD *)(v12 + 16) = 0u;
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)v12 = 0u;
LABEL_55:

  return v71;
}

- (Human)_getTrackedHumanForHumans:()vector<abpk:(std:(double)a4 :(CGSize)a5 allocator<abpk::Human>> *)a3 :Human atTimestamp:withImageResolution:
{
  abpk::Human *v5;
  abpk::Human *v8;
  Human *end;
  Human *v10;
  double v11;
  float *p_m_smoothing;
  CGFloat height;
  float v14;
  unint64_t *begin;
  __int128 v16;
  float32x2_t **v17;
  float32x2_t *var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  float32x2_t *v23;
  float v24;
  float32x2_t v25;
  float32x2_t v26;
  int32x2_t v27;
  float32x2_t v28;
  float v29;
  unint64_t *v30;
  float v31;
  float v32;
  float32x2_t v33;
  float v34;
  Human *v35;
  float v36;
  unint64_t *v37;
  float v38;
  NSObject *v39;
  uint8_t buf[8];
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *__p;
  void *v49;
  uint64_t v50;
  __int128 v51;
  _OWORD v52[2];

  v8 = v5;
  if (self->_extrapolationFilter2D.m_values.__begin_ == self->_extrapolationFilter2D.m_values.__end_)
  {
    begin = (unint64_t *)a3->__begin_;
    if (a3->__begin_ != a3->__end_)
    {
      v29 = -2147500000.0;
      v30 = (unint64_t *)a3->__begin_;
      do
      {
        v31 = (float)v30[13];
        *(float32x2_t *)&a4 = abpk::Human::area((abpk::Human *)v30, *(float32x2_t *)&a4);
        *(float *)&a4 = *(float *)&a4 + v31;
        if (*(float *)&a4 > v29)
        {
          begin = v30;
          v29 = *(float *)&a4;
        }
        v30 += 15;
      }
      while (v30 != (unint64_t *)a3->__end_);
    }
  }
  else
  {
    v10 = a3->__begin_;
    end = a3->__end_;
    if (a3->__begin_ == end)
    {
      v14 = 3.4028e38;
      begin = (unint64_t *)a3->__end_;
    }
    else
    {
      v11 = a4;
      p_m_smoothing = &self->_extrapolationFilter2D.m_smoothing;
      height = a5.height;
      v14 = 3.4028e38;
      begin = (unint64_t *)a3->__end_;
      do
      {
        *(_QWORD *)buf = 0;
        v43 = 0;
        v44 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(buf, self->_extrapolationFilter2D.m_values.__begin_, (uint64_t)self->_extrapolationFilter2D.m_values.__end_, self->_extrapolationFilter2D.m_values.__end_ - self->_extrapolationFilter2D.m_values.__begin_);
        v45 = 0;
        v46 = 0;
        v47 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v45, self->_extrapolationFilter2D.m_speed.__begin_, (uint64_t)self->_extrapolationFilter2D.m_speed.__end_, self->_extrapolationFilter2D.m_speed.__end_ - self->_extrapolationFilter2D.m_speed.__begin_);
        __p = 0;
        v49 = 0;
        v50 = 0;
        std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, self->_extrapolationFilter2D.m_timestamps.__begin_, (uint64_t)self->_extrapolationFilter2D.m_timestamps.__end_, self->_extrapolationFilter2D.m_timestamps.__end_ - self->_extrapolationFilter2D.m_timestamps.__begin_);
        v16 = *(_OWORD *)&self->_extrapolationFilter2D.m_highest_threshold;
        v51 = *(_OWORD *)p_m_smoothing;
        v52[0] = v16;
        *(_OWORD *)((char *)v52 + 12) = *(_OWORD *)&self->_extrapolationFilter2D.m_min_smoothing;
        v17 = (float32x2_t **)abpk::SkeletonJointFilter<float>::filter((uint64_t)buf, (float *)v10->keypoints.var0, ((char *)v10[1].keypoints.var0 - (char *)v10->keypoints.var0) >> 2, v11);
        var0 = (float32x2_t *)v10->keypoints.var0;
        v19 = v10[1].keypoints.var0;
        v20 = (char *)v19 - (char *)v10->keypoints.var0;
        if (v19 == v10->keypoints.var0)
        {
          v24 = 0.0;
        }
        else
        {
          v21 = 0;
          v22 = v20 >> 2;
          v23 = *v17;
          v24 = 0.0;
          do
          {
            v25 = vcvt_f32_f64(vmulq_f64((float64x2_t)a5, vcvtq_f64_f32(*var0)));
            if (v25.f32[0] >= 0.0 && v25.f32[1] >= 0.0)
            {
              v26 = vcvt_f32_f64(vmulq_f64((float64x2_t)a5, vcvtq_f64_f32(*v23)));
              v27 = vcltz_f32(v26);
              if (((v27.i32[0] | v27.i32[1]) & 1) == 0)
              {
                v28 = vsub_f32(v25, v26);
                v24 = v24 + sqrtf(vaddv_f32(vmul_f32(v28, v28)));
              }
            }
            v21 += 2;
            ++var0;
            ++v23;
          }
          while (v21 < v22);
        }
        if (v24 <= v14)
        {
          begin = (unint64_t *)v10;
          v14 = v24;
        }
        if (__p)
        {
          v49 = __p;
          operator delete(__p);
        }
        if (v45)
        {
          v46 = v45;
          operator delete(v45);
        }
        if (*(_QWORD *)buf)
        {
          v43 = *(void **)buf;
          operator delete(*(void **)buf);
        }
        v10 += 15;
      }
      while (v10 != a3->__end_);
      end = a3->__begin_;
    }
    *(float *)&a4 = (float)(unint64_t)(4
                                            * ((((char *)end[1].keypoints.var0 - (char *)end->keypoints.var0) >> 1)
                                             + end[1].keypoints.var0
                                             - end->keypoints.var0));
    if (v14 > *(float *)&a4)
    {
      self->_extrapolationFilter2D.m_values.__end_ = self->_extrapolationFilter2D.m_values.__begin_;
      self->_extrapolationFilter2DForLiftingData.m_values.__end_ = self->_extrapolationFilter2DForLiftingData.m_values.__begin_;
    }
  }
  v32 = (float)begin[13];
  v33 = abpk::Human::area((abpk::Human *)begin, *(float32x2_t *)&a4);
  v34 = v33.f32[0] + v32;
  v35 = a3->__begin_;
  v36 = -2147500000.0;
  if (a3->__begin_ != a3->__end_)
  {
    v37 = (unint64_t *)a3->__begin_;
    do
    {
      if (v37 != begin)
      {
        v38 = (float)v37[13];
        v33 = abpk::Human::area((abpk::Human *)v37, v33);
        v33.f32[0] = v33.f32[0] + v38;
        if (v33.f32[0] > v36)
        {
          v35 = (Human *)v37;
          v36 = v33.f32[0];
        }
      }
      v37 += 15;
    }
    while (v37 != (unint64_t *)a3->__end_);
  }
  if (v36 > v34)
  {
    __ABPKLogSharedInstance();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v39, OS_LOG_TYPE_DEBUG, " Resetting tracking as new human found ", buf, 2u);
    }

    self->_extrapolationFilter2D.m_values.__end_ = self->_extrapolationFilter2D.m_values.__begin_;
    self->_extrapolationFilter2DForLiftingData.m_values.__end_ = self->_extrapolationFilter2DForLiftingData.m_values.__begin_;
    begin = (unint64_t *)v35;
  }
  self->_iteratorToTrackedInstance.__i_ = (Human *)begin;
  return (Human)abpk::Human::Human(v8, (const abpk::Human *)begin);
}

- (const)rawTrackedHuman
{
  return &self->_rawTrackedHuman;
}

- (const)trackedHuman
{
  return &self->_trackedHuman;
}

- (const)rawTrackedHumanVector
{
  return &self->_rawTrackedHumanVector;
}

- (const)trackedHumanForLifting
{
  return &self->_trackedHumanForLifting;
}

- (ABPK2DDetectionResult)aligned3DSkeleton
{
  return self->_aligned3DSkeleton;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  void *v7;
  void *v8;
  void *v9;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v10;
  void *v11;
  void *v12;
  void *v13;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v14;
  double *begin;
  float *v16;
  float *v17;
  double *v18;
  float *v19;
  float *v20;
  vector<abpk::Human, std::allocator<abpk::Human>> *p_rawTrackedHumanVector;

  objc_storeStrong((id *)&self->_aligned3DSkeleton, 0);
  if (self->_anon_218[88])
  {
    v3 = *(void **)&self->_anon_218[64];
    if (v3)
    {
      *(_QWORD *)&self->_anon_218[72] = v3;
      operator delete(v3);
    }
  }
  v4 = *(void **)&self->_anon_218[40];
  if (v4)
  {
    *(_QWORD *)&self->_anon_218[48] = v4;
    operator delete(v4);
  }
  v5 = *(void **)&self->_anon_218[16];
  if (v5)
  {
    *(_QWORD *)&self->_anon_218[24] = v5;
    operator delete(v5);
  }
  var0 = self->_trackedHumanForLifting.keypoints.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_218 = var0;
    operator delete(var0);
  }
  p_rawTrackedHumanVector = &self->_rawTrackedHumanVector;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_rawTrackedHumanVector);
  if (self->_anon_180[88])
  {
    v7 = *(void **)&self->_anon_180[64];
    if (v7)
    {
      *(_QWORD *)&self->_anon_180[72] = v7;
      operator delete(v7);
    }
  }
  v8 = *(void **)&self->_anon_180[40];
  if (v8)
  {
    *(_QWORD *)&self->_anon_180[48] = v8;
    operator delete(v8);
  }
  v9 = *(void **)&self->_anon_180[16];
  if (v9)
  {
    *(_QWORD *)&self->_anon_180[24] = v9;
    operator delete(v9);
  }
  v10 = self->_rawTrackedHuman.keypoints.var0;
  if (v10)
  {
    *(_QWORD *)self->_anon_180 = v10;
    operator delete(v10);
  }
  if (self->_anon_108[88])
  {
    v11 = *(void **)&self->_anon_108[64];
    if (v11)
    {
      *(_QWORD *)&self->_anon_108[72] = v11;
      operator delete(v11);
    }
  }
  v12 = *(void **)&self->_anon_108[40];
  if (v12)
  {
    *(_QWORD *)&self->_anon_108[48] = v12;
    operator delete(v12);
  }
  v13 = *(void **)&self->_anon_108[16];
  if (v13)
  {
    *(_QWORD *)&self->_anon_108[24] = v13;
    operator delete(v13);
  }
  v14 = self->_trackedHuman.keypoints.var0;
  if (v14)
  {
    *(_QWORD *)self->_anon_108 = v14;
    operator delete(v14);
  }
  begin = self->_extrapolationFilter2DForLiftingData.m_timestamps.__begin_;
  if (begin)
  {
    self->_extrapolationFilter2DForLiftingData.m_timestamps.__end_ = begin;
    operator delete(begin);
  }
  v16 = self->_extrapolationFilter2DForLiftingData.m_speed.__begin_;
  if (v16)
  {
    self->_extrapolationFilter2DForLiftingData.m_speed.__end_ = v16;
    operator delete(v16);
  }
  v17 = self->_extrapolationFilter2DForLiftingData.m_values.__begin_;
  if (v17)
  {
    self->_extrapolationFilter2DForLiftingData.m_values.__end_ = v17;
    operator delete(v17);
  }
  v18 = self->_extrapolationFilter2D.m_timestamps.__begin_;
  if (v18)
  {
    self->_extrapolationFilter2D.m_timestamps.__end_ = v18;
    operator delete(v18);
  }
  v19 = self->_extrapolationFilter2D.m_speed.__begin_;
  if (v19)
  {
    self->_extrapolationFilter2D.m_speed.__end_ = v19;
    operator delete(v19);
  }
  v20 = self->_extrapolationFilter2D.m_values.__begin_;
  if (v20)
  {
    self->_extrapolationFilter2D.m_values.__end_ = v20;
    operator delete(v20);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_OWORD *)self + 5) = xmmword_210881DA0;
  *((_OWORD *)self + 6) = xmmword_210881DB0;
  *((_QWORD *)self + 14) = 0x40D5555542C80000;
  *((_DWORD *)self + 30) = 1045220557;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((_QWORD *)self + 25) = 0;
  *((_OWORD *)self + 13) = xmmword_210881DA0;
  *((_OWORD *)self + 14) = xmmword_210881DB0;
  *((_QWORD *)self + 30) = 0x40D5555542C80000;
  *((_DWORD *)self + 62) = 1045220557;
  *((_BYTE *)self + 352) = 0;
  *((_BYTE *)self + 368) = 0;
  *((_BYTE *)self + 372) = 0;
  *(_OWORD *)((char *)self + 313) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_BYTE *)self + 472) = 0;
  *((_BYTE *)self + 488) = 0;
  *((_BYTE *)self + 492) = 0;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 433) = 0u;
  *((_BYTE *)self + 624) = 0;
  *((_BYTE *)self + 640) = 0;
  *((_BYTE *)self + 644) = 0;
  *((_QWORD *)self + 81) = 0;
  *(_OWORD *)((char *)self + 504) = 0u;
  *(_OWORD *)((char *)self + 520) = 0u;
  *(_OWORD *)((char *)self + 536) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *((_BYTE *)self + 600) = 0;
  return self;
}

@end
