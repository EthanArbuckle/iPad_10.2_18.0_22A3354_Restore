@implementation ARPlaneGeometry

- (ARPlaneGeometry)initWithVertices:(vector<float)__attribute__((ext_vector_type(3 triangleIndices:boundaryVertexCount:center:extent:
{
  float32x4_t v5;
  float32x4_t v6;
  ARPlaneGeometry *v10;
  ARPlaneGeometry *v11;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  unint64_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int8x16_t v16;
  void *v17;
  float32x4_t v19;
  float32x4_t v20;
  __int128 v21;
  uint64_t v22;
  objc_super v23;

  v19 = v5;
  v20 = v6;
  v23.receiver = self;
  v23.super_class = (Class)ARPlaneGeometry;
  v10 = -[ARPlaneGeometry init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v10->_vertices, (__n128 *)a3.var0);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v11->_triangleIndices, (__n128 *)a4);
    v11->_boundaryVertexCount = a5;
    *(float32x4_t *)v11->_center = v19;
    *(float32x4_t *)v11->_extent = v20;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v21, (uint64_t)(*(_QWORD *)v11->_anon_10 - (unint64_t)v11->_vertices.var0) >> 4);
    var0 = v11->_vertices.var0;
    if (*(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)v11->_anon_10 != var0)
    {
      v13 = 0;
      v14.i64[0] = 0xBF000000BF000000;
      v14.i64[1] = 0xBF000000BF000000;
      v15 = vaddq_f32(v19, vmulq_f32(v20, v14));
      do
      {
        v16 = (int8x16_t)vdivq_f32(vsubq_f32(*(float32x4_t *)&var0[2 * v13], v15), v20);
        *(int32x2_t *)(v21 + 8 * v13++) = vzip1_s32(*(int32x2_t *)v16.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL));
        var0 = v11->_vertices.var0;
      }
      while (v13 < (uint64_t)(*(_QWORD *)v11->_anon_10 - (_QWORD)var0) >> 4);
    }
    v17 = *(void **)v11->_anon_20;
    if (v17)
    {
      *(_QWORD *)&v11->_anon_20[8] = v17;
      operator delete(v17);
      *(_QWORD *)v11->_anon_20 = 0;
      *(_QWORD *)&v11->_anon_20[8] = 0;
      *(_QWORD *)&v11->_anon_20[16] = 0;
    }
    *(_OWORD *)v11->_anon_20 = v21;
    *(_QWORD *)&v11->_anon_20[16] = v22;
  }
  return v11;
}

- (ARPlaneGeometry)initWithBoundaryVertices:(ARPlaneGeometry *)self center:(SEL)a2 extent:(const void *)a3
{
  __int128 v3;
  float32x4_t v4;
  unint64_t v7;
  unint64_t v8;
  ARPlaneGeometry *v9;
  unsigned int v10;
  char v11;
  _OWORD *v12;
  int v13;
  int v14;
  float32x4_t *v15;
  float32x4_t v16;
  float32x4_t v17;
  float64x2_t v18;
  char *v19;
  float64x2_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  float64x2_t *v27;
  char *v28;
  char *v29;
  float64x2_t *v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  void *v34;
  float v35;
  float v36;
  char *v37;
  int v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  unint64_t v43;
  char *v44;
  char *v45;
  int v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  __int16 v56;
  int v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  __int16 v67;
  int v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  __int16 v77;
  uint64_t v79;
  uint64x2_t v80;
  _DWORD *v81;
  int64x2_t v82;
  int v83;
  int64x2_t v84;
  int32x2_t v85;
  ARPlaneGeometry *v86;
  __int128 v87;
  float32x4_t v88;
  float64x2_t v89;
  void *v90[2];
  uint64_t v91;
  void *v92[2];
  uint64_t v93;
  float64x2_t *v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  int v99;
  float64x2_t v100;
  double v101;
  double v102;
  double v103;
  double v104;
  uint64_t v105;
  float64x2_t v106;
  void *v107;
  char *v108;
  char *v109;
  void *__p[2];
  _QWORD v111[2];
  __int128 v112;
  uint64_t v113;
  _BYTE buf[22];
  __int16 v115;
  int v116;
  __int16 v117;
  double v118;
  __int16 v119;
  double v120;
  __int16 v121;
  double v122;
  __int16 v123;
  double v124;
  __int16 v125;
  void *v126;
  uint64_t v127;

  v87 = v3;
  v88 = v4;
  v127 = *MEMORY[0x1E0C80C00];
  v112 = 0uLL;
  v113 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v112, *(const void **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  v7 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  v8 = v7 >> 4;
  __p[0] = 0;
  __p[1] = 0;
  v111[0] = 0;
  if ((v7 >> 4) < 3)
  {
    v9 = 0;
    goto LABEL_106;
  }
  if ((v7 >> 4) != 3)
  {
    v107 = 0;
    v108 = 0;
    v109 = 0;
    v86 = self;
    std::vector<__ARC3DShapeVertex>::reserve(&v107, (v7 >> 4));
    v10 = v8 - 1;
    if ((int)v8 - 1 < 0)
    {
      v34 = v107;
    }
    else
    {
      v11 = 0;
      v12 = (_OWORD *)MEMORY[0x1E0C9D538];
      v13 = v8;
      do
      {
        v14 = v13;
        v13 = v10;
        v15 = (float32x4_t *)(v112 + 16 * v10);
        if (v10 >= (int)v8 - 1)
          v14 = 0;
        v16 = vsubq_f32(*v15, *(float32x4_t *)(v112 + 16 * v14));
        v17 = vmulq_f32(v16, v16);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]) <= 0.00011921)
        {
          v22 = *((_QWORD *)&v112 + 1) - (_QWORD)(v15 + 1);
          if (*((float32x4_t **)&v112 + 1) != &v15[1])
            memmove(v15, &v15[1], *((_QWORD *)&v112 + 1) - (_QWORD)(v15 + 1));
          *((_QWORD *)&v112 + 1) = (char *)v15 + v22;
          v11 = 1;
          LODWORD(v8) = v8 - 1;
        }
        else
        {
          v18 = vcvtq_f64_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v15->f32, (int32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)v15, *(int8x16_t *)v15, 8uLL)));
          *(_OWORD *)buf = *v12;
          v100 = *(float64x2_t *)buf;
          v106 = *(float64x2_t *)buf;
          v19 = v108;
          if (v108 >= v109)
          {
            v89 = v18;
            v23 = 0xCCCCCCCCCCCCCCCDLL * ((v108 - (_BYTE *)v107) >> 4);
            v24 = v23 + 1;
            if (v23 + 1 > 0x333333333333333)
              std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
            if (0x999999999999999ALL * ((v109 - (_BYTE *)v107) >> 4) > v24)
              v24 = 0x999999999999999ALL * ((v109 - (_BYTE *)v107) >> 4);
            if (0xCCCCCCCCCCCCCCCDLL * ((v109 - (_BYTE *)v107) >> 4) >= 0x199999999999999)
              v25 = 0x333333333333333;
            else
              v25 = v24;
            if (v25)
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__ARC3DShapeVertex>>((uint64_t)&v109, v25);
            else
              v26 = 0;
            v27 = (float64x2_t *)&v26[80 * v23];
            *v27 = v89;
            v27[1] = *(float64x2_t *)buf;
            v27[2] = v100;
            v27[3] = v106;
            v27[4].f64[0] = 0.0;
            LOBYTE(v27[4].f64[1]) = 0;
            HIDWORD(v27[4].f64[1]) = v13;
            v29 = (char *)v107;
            v28 = v108;
            v30 = v27;
            if (v108 != v107)
            {
              do
              {
                v30[-5] = *((float64x2_t *)v28 - 5);
                v31 = *((float64x2_t *)v28 - 4);
                v32 = *((float64x2_t *)v28 - 3);
                v33 = *((float64x2_t *)v28 - 1);
                v30[-2] = *((float64x2_t *)v28 - 2);
                v30[-1] = v33;
                v30[-4] = v31;
                v30[-3] = v32;
                v30 -= 5;
                v28 -= 80;
              }
              while (v28 != v29);
              v28 = v29;
            }
            v21 = (char *)&v27[5];
            v107 = v30;
            v108 = (char *)&v27[5];
            v109 = &v26[80 * v25];
            if (v28)
              operator delete(v28);
          }
          else
          {
            *(float64x2_t *)v108 = v18;
            v20 = v100;
            *((_OWORD *)v19 + 1) = *(_OWORD *)buf;
            *((float64x2_t *)v19 + 2) = v20;
            *((float64x2_t *)v19 + 3) = v106;
            *((_QWORD *)v19 + 8) = 0;
            v19[72] = 0;
            *((_DWORD *)v19 + 19) = v13;
            v21 = v19 + 80;
          }
          v108 = v21;
        }
        v10 = v13 - 1;
      }
      while (v13 > 0);
      if (v8 <= 2)
      {
        if (v107)
        {
          v108 = (char *)v107;
          operator delete(v107);
        }
        v9 = 0;
        goto LABEL_104;
      }
      if ((_DWORD)v8 == 3)
      {
        *(_DWORD *)buf = 65538;
        *(_WORD *)&buf[4] = 0;
        std::vector<short>::__assign_with_size[abi:ne180100]<short const*,short const*>((char *)__p, buf, (uint64_t)&buf[6], 3uLL);
        LODWORD(v8) = 3;
LABEL_97:
        if (v107)
        {
          v108 = (char *)v107;
          operator delete(v107);
        }
        goto LABEL_99;
      }
      v34 = v107;
      if ((v11 & 1) != 0)
      {
        v79 = 0;
        v80 = (uint64x2_t)vdupq_n_s64((unint64_t)v8 - 1);
        v81 = (char *)v107 + 156;
        v82 = (int64x2_t)xmmword_1B3C0B450;
        v83 = v8 - 1;
        v84 = vdupq_n_s64(2uLL);
        do
        {
          v85 = vmovn_s64((int64x2_t)vcgeq_u64(v80, (uint64x2_t)v82));
          if ((v85.i8[0] & 1) != 0)
            *(v81 - 20) = v83;
          if ((v85.i8[4] & 1) != 0)
            *v81 = v8 + (v79 ^ 0xFFFFFFFE);
          v79 += 2;
          v82 = vaddq_s64(v82, v84);
          v81 += 40;
          v83 -= 2;
        }
        while (((v8 + 1) & 0x1FFFFFFFELL) != v79);
      }
    }
    *(_QWORD *)&v100.f64[0] = v34;
    LODWORD(v100.f64[1]) = v8;
    HIDWORD(v100.f64[1]) = v8;
    v35 = (float)(0.5 * v88.f32[0]) + 0.00011921;
    v101 = (float)(*(float *)&v87 - v35);
    v102 = (float)(*(float *)&v87 + v35);
    v36 = vmuls_lane_f32(0.5, v88, 2) + 0.00011921;
    v103 = (float)(*((float *)&v87 + 2) - v36);
    v104 = (float)(*((float *)&v87 + 2) + v36);
    v105 = 2;
    LODWORD(v106.f64[0]) = 0;
    v99 = 0;
    v94 = &v100;
    v95 = 1;
    v97 = 0;
    v96 = 0;
    v98 = 0;
    v37 = (char *)ARC3DShapeConnectedComponentTriangulate((uint64_t)&v94, &v106, &v99);
    v38 = LODWORD(v106.f64[0]);
    if (!LODWORD(v106.f64[0]))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)a3, *((_QWORD *)a3 + 1) - *(_QWORD *)a3, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (_ARLogTechnique(void)::onceToken != -1)
        dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_95);
      v40 = (id)_ARLogTechnique(void)::logObj;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        v115 = 1024;
        v116 = v99;
        v117 = 2048;
        v118 = *(float *)&v87;
        v119 = 2048;
        v120 = *((float *)&v87 + 2);
        v121 = 2048;
        v122 = v88.f32[0];
        v123 = 2048;
        v124 = v88.f32[2];
        v125 = 2112;
        v126 = v39;
        _os_log_impl(&dword_1B3A68000, v40, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error [%d]: Plane triangulation failed (%f %f %f %f) %@", buf, 0x4Eu);

      }
      v38 = LODWORD(v106.f64[0]);
    }
    std::vector<short>::reserve(__p, (3 * v38));
    if (LODWORD(v106.f64[0]))
    {
      v43 = 0;
      v44 = (char *)__p[1];
      do
      {
        v45 = &v37[56 * v43];
        v46 = *(_DWORD *)(*(_QWORD *)v45 + 76);
        v47 = (char *)v111[0];
        if ((unint64_t)v44 >= v111[0])
        {
          v49 = (char *)__p[0];
          v50 = v44 - (char *)__p[0];
          if (v44 - (char *)__p[0] <= -3)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v51 = v50 >> 1;
          if (v111[0] - (unint64_t)__p[0] <= (v50 >> 1) + 1)
            v52 = v51 + 1;
          else
            v52 = v111[0] - (unint64_t)__p[0];
          if (v111[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFFELL)
            v53 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v53 = v52;
          if (v53)
          {
            v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)v111, v53);
            v49 = (char *)__p[0];
            v44 = (char *)__p[1];
          }
          else
          {
            v54 = 0;
          }
          v55 = &v54[2 * v51];
          *(_WORD *)v55 = v46;
          v48 = v55 + 2;
          while (v44 != v49)
          {
            v56 = *((_WORD *)v44 - 1);
            v44 -= 2;
            *((_WORD *)v55 - 1) = v56;
            v55 -= 2;
          }
          v47 = &v54[2 * v53];
          __p[0] = v55;
          __p[1] = v48;
          v111[0] = v47;
          if (v49)
          {
            operator delete(v49);
            v47 = (char *)v111[0];
          }
        }
        else
        {
          *(_WORD *)v44 = v46;
          v48 = v44 + 2;
        }
        __p[1] = v48;
        v57 = *(_DWORD *)(*((_QWORD *)v45 + 2) + 76);
        if (v48 >= v47)
        {
          v59 = (char *)__p[0];
          v60 = v48 - (char *)__p[0];
          if (v48 - (char *)__p[0] <= -3)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v61 = v60 >> 1;
          v62 = v47 - (char *)__p[0];
          if (v62 <= (v60 >> 1) + 1)
            v63 = v61 + 1;
          else
            v63 = v62;
          if (v62 >= 0x7FFFFFFFFFFFFFFELL)
            v64 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v64 = v63;
          if (v64)
          {
            v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)v111, v64);
            v59 = (char *)__p[0];
            v48 = (char *)__p[1];
          }
          else
          {
            v65 = 0;
          }
          v66 = &v65[2 * v61];
          *(_WORD *)v66 = v57;
          v58 = v66 + 2;
          while (v48 != v59)
          {
            v67 = *((_WORD *)v48 - 1);
            v48 -= 2;
            *((_WORD *)v66 - 1) = v67;
            v66 -= 2;
          }
          v47 = &v65[2 * v64];
          __p[0] = v66;
          __p[1] = v58;
          v111[0] = v47;
          if (v59)
          {
            operator delete(v59);
            v47 = (char *)v111[0];
          }
        }
        else
        {
          *(_WORD *)v48 = v57;
          v58 = v48 + 2;
        }
        __p[1] = v58;
        v68 = *(_DWORD *)(*((_QWORD *)v45 + 1) + 76);
        if (v58 >= v47)
        {
          v69 = (char *)__p[0];
          v70 = v58 - (char *)__p[0];
          if (v58 - (char *)__p[0] <= -3)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v71 = v70 >> 1;
          v72 = v47 - (char *)__p[0];
          if (v72 <= (v70 >> 1) + 1)
            v73 = v71 + 1;
          else
            v73 = v72;
          if (v72 >= 0x7FFFFFFFFFFFFFFELL)
            v74 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v74 = v73;
          if (v74)
          {
            v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)v111, v74);
            v69 = (char *)__p[0];
            v58 = (char *)__p[1];
          }
          else
          {
            v75 = 0;
          }
          v76 = &v75[2 * v71];
          *(_WORD *)v76 = v68;
          v44 = v76 + 2;
          while (v58 != v69)
          {
            v77 = *((_WORD *)v58 - 1);
            v58 -= 2;
            *((_WORD *)v76 - 1) = v77;
            v76 -= 2;
          }
          __p[0] = v76;
          __p[1] = v44;
          v111[0] = &v75[2 * v74];
          if (v69)
            operator delete(v69);
        }
        else
        {
          *(_WORD *)v58 = v68;
          v44 = v58 + 2;
        }
        __p[1] = v44;
        ++v43;
      }
      while (v43 < LODWORD(v106.f64[0]));
    }
    free(v37);
    self = v86;
    goto LABEL_97;
  }
  *(_DWORD *)buf = 0x10000;
  *(_WORD *)&buf[4] = 2;
  std::vector<short>::__assign_with_size[abi:ne180100]<short const*,short const*>((char *)__p, buf, (uint64_t)&buf[6], 3uLL);
  LODWORD(v8) = 3;
LABEL_99:
  *(_OWORD *)v92 = v112;
  v93 = v113;
  v113 = 0;
  v112 = 0uLL;
  *(_OWORD *)v90 = *(_OWORD *)__p;
  v91 = v111[0];
  __p[0] = 0;
  __p[1] = 0;
  v111[0] = 0;
  self = -[ARPlaneGeometry initWithVertices:triangleIndices:boundaryVertexCount:center:extent:](self, "initWithVertices:triangleIndices:boundaryVertexCount:center:extent:", v92, v90, v8, *(double *)&v87, *(double *)v88.i64, v86);
  if (v90[0])
  {
    v90[1] = v90[0];
    operator delete(v90[0]);
  }
  if (v92[0])
  {
    v92[1] = v92[0];
    operator delete(v92[0]);
  }
  v9 = self;
LABEL_104:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_106:
  if ((_QWORD)v112)
  {
    *((_QWORD *)&v112 + 1) = v112;
    operator delete((void *)v112);
  }

  return v9;
}

- (NSUInteger)vertexCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_vertices.var0) >> 4;
}

- (const)vertices
{
  return (const simd_float3 *)self->_vertices.var0;
}

- (NSUInteger)textureCoordinateCount
{
  return (uint64_t)(*(_QWORD *)&self->_anon_20[8] - *(_QWORD *)self->_anon_20) >> 3;
}

- (const)textureCoordinates
{
  return *(const simd_float2 **)self->_anon_20;
}

- (NSUInteger)triangleCount
{
  return (self->_triangleIndices.__end_ - self->_triangleIndices.__begin_) / 3uLL;
}

- (const)triangleIndices
{
  return self->_triangleIndices.__begin_;
}

- (const)boundaryVertices
{
  return (const simd_float3 *)self->_vertices.var0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_vertices.var0, *(_QWORD *)self->_anon_10 - (unint64_t)self->_vertices.var0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("vertexData"));

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_triangleIndices.__begin_, (char *)self->_triangleIndices.__end_ - (char *)self->_triangleIndices.__begin_, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("triangleData"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_boundaryVertexCount, CFSTR("boundaryVertexCount"));
  objc_msgSend(v6, "ar_encodeVector3:forKey:", CFSTR("center"), *(double *)self->_center);
  objc_msgSend(v6, "ar_encodeVector3:forKey:", CFSTR("extent"), *(double *)self->_extent);

}

- (ARPlaneGeometry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  const void *v11;
  id v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  ARPlaneGeometry *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  objc_class *v20;
  void *v21;
  double v23;
  double v24;
  void *__p[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  void *v29[2];
  uint64_t v30;
  uint8_t buf[24];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vertexData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triangleData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("boundaryVertexCount"));
  objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("center"));
  v24 = v8;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("extent"));
  if (v5 && v6 && v7)
  {
    v23 = v9;
    v10 = objc_retainAutorelease(v5);
    v11 = (const void *)objc_msgSend(v10, "bytes");
    v12 = objc_retainAutorelease(v6);
    v13 = (const void *)objc_msgSend(v12, "bytes");
    v14 = objc_msgSend(v10, "length");
    memset(buf, 0, sizeof(buf));
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v11, (uint64_t)v11 + (v14 & 0xFFFFFFFFFFFFFFF0), v14 >> 4);
    v15 = objc_msgSend(v12, "length");
    v29[0] = 0;
    v29[1] = 0;
    v30 = 0;
    std::vector<short>::__init_with_size[abi:ne180100]<short const*,short const*>(v29, v13, (uint64_t)v13 + (v15 & 0xFFFFFFFFFFFFFFFELL), v15 >> 1);
    *(_OWORD *)v27 = *(_OWORD *)buf;
    v28 = *(_QWORD *)&buf[16];
    memset(buf, 0, sizeof(buf));
    *(_OWORD *)__p = *(_OWORD *)v29;
    v26 = v30;
    v29[0] = 0;
    v29[1] = 0;
    v30 = 0;
    self = -[ARPlaneGeometry initWithVertices:triangleIndices:boundaryVertexCount:center:extent:](self, "initWithVertices:triangleIndices:boundaryVertexCount:center:extent:", v27, __p, v7, v24, v23);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v27[0])
    {
      v27[1] = v27[0];
      operator delete(v27[0]);
    }
    if (v29[0])
    {
      v29[1] = v29[0];
      operator delete(v29[0]);
    }
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
    v16 = self;
  }
  else
  {
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_71);
    v17 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v32 = v21;
      v33 = 2048;
      v34 = v4;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %{public}@(%p): Error decoding plane geometry", buf, 0x2Au);

    }
    v16 = 0;
  }

  return v16;
}

- (NSUInteger)boundaryVertexCount
{
  return self->_boundaryVertexCount;
}

- (__n128)center
{
  return a1[6];
}

- (__n128)extent
{
  return a1[7];
}

- (void).cxx_destruct
{
  signed __int16 *begin;
  void *v4;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;

  begin = self->_triangleIndices.__begin_;
  if (begin)
  {
    self->_triangleIndices.__end_ = begin;
    operator delete(begin);
  }
  v4 = *(void **)self->_anon_20;
  if (v4)
  {
    *(_QWORD *)&self->_anon_20[8] = v4;
    operator delete(v4);
  }
  var0 = self->_vertices.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_10 = var0;
    operator delete(var0);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
