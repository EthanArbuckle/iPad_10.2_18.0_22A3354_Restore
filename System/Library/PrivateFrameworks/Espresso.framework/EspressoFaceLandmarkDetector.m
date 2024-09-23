@implementation EspressoFaceLandmarkDetector

- (vector<FaceLandmarkDetectorPoint,)extractSubLandmarksFromCrop192:(EspressoFaceLandmarkDetector *)self centers192:(SEL)a3
{
  double v5;
  float *v8;
  float v9;
  float v10;
  double *v11;
  float v12;
  float v13;
  double *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double *v19;
  uint64_t v20;
  _QWORD *v21;
  _BYTE *v22;
  _BYTE *v23;
  int64_t v24;
  char *v25;
  uint64_t v26;
  double *v27;
  _QWORD *v28;
  _QWORD *v29;
  double *v30;
  uint64_t v31;
  double *v32;
  _QWORD *v33;
  _QWORD *v34;
  double *v35;
  uint64_t v36;
  double *v37;
  _QWORD *v38;
  unint64_t v39;
  float64x2_t v40;
  uint64_t v41;
  int64x2_t v42;
  float64x2_t v43;
  int32x2_t v44;
  int32x2_t v45;
  size_t rowBytes;
  char *v47;
  int8x16_t v48;
  __int128 v49;
  uint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *p_shared_owners;
  unint64_t v58;
  void (***v59)(uint64_t *__return_ptr, _QWORD);
  unint64_t *v60;
  unint64_t v61;
  void *v62;
  unint64_t v63;
  float32x2_t v64;
  uint64_t v65;
  unint64_t v66;
  float32x2_t v67;
  float32x2_t v68;
  FaceLandmarkDetectorPoint *var0;
  FaceLandmarkDetectorPoint *var1;
  FaceLandmarkDetectorPoint *v71;
  FaceLandmarkDetectorPoint *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  FaceLandmarkDetectorPoint *v78;
  uint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  vector<FaceLandmarkDetectorPoint, std::allocator<FaceLandmarkDetectorPoint>> *result;
  int32x2_t v95;
  __int128 v96;
  void *__p[2];
  char v98;
  uint64_t v99;
  std::__shared_weak_count *v100;
  _QWORD v101[4];
  __int128 v102;
  vImage_Buffer v103;
  uint64_t v104;
  std::__shared_weak_count *v105;
  __int128 v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  _QWORD *v115;
  _BYTE v116[64];
  void **v117;
  vImage_Buffer buf;
  vImage_Buffer src;
  double *v120;
  double *v121;
  double *v122;
  double *v123;
  double *v124;
  _QWORD v125[3];

  v125[0] = *MEMORY[0x1E0C80C00];
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v116, "  >> SubLandmark", v5);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v8 = *(float **)a5;
  v9 = *v8;
  v10 = v8[1];
  v11 = (double *)operator new(0x10uLL);
  src.height = (vImagePixelCount)(v11 + 2);
  src.width = (vImagePixelCount)(v11 + 2);
  *v11 = v9;
  v11[1] = (float)(v10 + -4.0);
  src.data = v11;
  v12 = v8[2];
  v13 = v8[3];
  src.rowBytes = 0;
  v120 = 0;
  v121 = 0;
  v14 = (double *)operator new(0x10uLL);
  v120 = v14 + 2;
  v121 = v14 + 2;
  *v14 = v12;
  v14[1] = (float)(v13 + -4.0);
  src.rowBytes = (size_t)v14;
  v15 = v8[6];
  v16 = v8[7];
  v17 = v8[8];
  v18 = v8[9];
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v19 = (double *)operator new(0x10uLL);
  v123 = v19 + 2;
  v124 = v19 + 2;
  *v19 = (float)((float)(v15 + v17) * 0.5);
  v19[1] = (float)((float)((float)(v16 + v18) * 0.5) + 8.0);
  v122 = v19;
  v114 = 0;
  v115 = 0;
  v113 = 0;
  v110 = &v113;
  LOBYTE(v111) = 0;
  v20 = 0;
  v113 = operator new(0x48uLL);
  v114 = v113;
  v115 = v113 + 9;
  v107 = v113;
  __p[0] = v113;
  buf.data = &v115;
  buf.height = (vImagePixelCount)__p;
  buf.width = (vImagePixelCount)&v107;
  v21 = v113;
  LOBYTE(buf.rowBytes) = 0;
  do
  {
    *v21 = 0;
    v21[1] = 0;
    v21[2] = 0;
    v23 = *(void **)((char *)&src.data + v20);
    v22 = *(_BYTE **)((char *)&src.height + v20);
    v24 = v22 - v23;
    if (v22 != v23)
    {
      std::vector<double>::__vallocate[abi:ne180100](v21, v24 >> 3);
      v25 = (char *)v21[1];
      memmove(v25, v23, v24);
      v21[1] = &v25[8 * (v24 >> 3)];
      v21 = v107;
    }
    v21 += 3;
    v107 = v21;
    v20 += 24;
  }
  while (v20 != 72);
  LOBYTE(buf.rowBytes) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&buf);
  v26 = 0;
  v114 = v21;
  do
  {
    v27 = (&v122)[v26];
    if (v27)
    {
      (&v123)[v26] = v27;
      operator delete(v27);
    }
    v26 -= 3;
  }
  while (v26 != -9);
  v28 = operator new(8uLL);
  src.data = v28;
  *v28 = 0x2800000028;
  src.height = (vImagePixelCount)(v28 + 1);
  src.width = (vImagePixelCount)(v28 + 1);
  src.rowBytes = 0;
  v120 = 0;
  v121 = 0;
  v29 = operator new(8uLL);
  src.rowBytes = (size_t)v29;
  *v29 = 0x2800000028;
  v120 = (double *)(v29 + 1);
  v121 = (double *)(v29 + 1);
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v30 = (double *)operator new(8uLL);
  v122 = v30;
  *(_QWORD *)v30 = 0x280000003CLL;
  v123 = v30 + 1;
  v124 = v30 + 1;
  v111 = 0;
  v112 = 0;
  v110 = 0;
  buf.data = &v110;
  LOBYTE(buf.height) = 0;
  v110 = operator new(0x48uLL);
  v111 = v110;
  v112 = v110 + 9;
  v31 = 0;
  v111 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int> const*,std::vector<int> const*,std::vector<int>*>((uint64_t)&v112, (uint64_t)&src, (uint64_t)v125, v110);
  do
  {
    v32 = (&v122)[v31];
    if (v32)
    {
      (&v123)[v31] = v32;
      operator delete(v32);
    }
    v31 -= 3;
  }
  while (v31 != -9);
  v33 = operator new(8uLL);
  src.data = v33;
  *v33 = 0x2000000020;
  src.height = (vImagePixelCount)(v33 + 1);
  src.width = (vImagePixelCount)(v33 + 1);
  src.rowBytes = 0;
  v120 = 0;
  v121 = 0;
  v34 = operator new(8uLL);
  src.rowBytes = (size_t)v34;
  *v34 = 0x2000000020;
  v120 = (double *)(v34 + 1);
  v121 = (double *)(v34 + 1);
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v35 = (double *)operator new(8uLL);
  v122 = v35;
  *(_QWORD *)v35 = 0x2000000030;
  v123 = v35 + 1;
  v124 = v35 + 1;
  v108 = 0;
  v109 = 0;
  v107 = 0;
  buf.data = &v107;
  LOBYTE(buf.height) = 0;
  v107 = operator new(0x48uLL);
  v108 = v107;
  v109 = v107 + 9;
  v36 = 0;
  v108 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int> const*,std::vector<int> const*,std::vector<int>*>((uint64_t)&v109, (uint64_t)&src, (uint64_t)v125, v107);
  do
  {
    v37 = (&v122)[v36];
    if (v37)
    {
      (&v123)[v36] = v37;
      operator delete(v37);
    }
    v36 -= 3;
  }
  while (v36 != -9);
  v38 = v113;
  if (v114 != v113)
  {
    v39 = 0;
    do
    {
      v40 = *(float64x2_t *)v38[3 * v39];
      v41 = *(_QWORD *)v110[3 * v39];
      v42.i64[0] = (int)v41;
      v42.i64[1] = SHIDWORD(v41);
      v43 = vcvtq_f64_s64(v42);
      v44 = vrev64_s32(vmovn_s64(*(int64x2_t *)&a4->height));
      v45 = vmin_s32(vmax_s32(vmovn_s64(vcvtq_s64_f64(vsubq_f64(v40, v43))), 0), v44);
      rowBytes = a4->rowBytes;
      v47 = (char *)a4->data + 4 * v45.i32[0] + rowBytes * v45.i32[1];
      v95 = v45;
      v48 = (int8x16_t)vsubl_s32(vmin_s32(vmax_s32(vmovn_s64(vcvtq_s64_f64(vaddq_f64(v40, v43))), 0), v44), v45);
      *(int8x16_t *)&src.height = vextq_s8(v48, v48, 8uLL);
      src.data = v47;
      src.rowBytes = rowBytes;
      vImageBuffer_Init(&buf, *(int *)(v107[3 * v39] + 4), *(int *)v107[3 * v39], 0x20u, 0);
      vImageScale_ARGB8888(&src, &buf, 0, 0);
      v49 = *((_OWORD *)self->nets_sub_landmark.__begin_ + v39);
      v106 = v49;
      v50 = *((_QWORD *)&v49 + 1);
      if (*((_QWORD *)&v49 + 1))
      {
        v51 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
        do
          v52 = __ldxr(v51);
        while (__stxr(v52 + 1, v51));
      }
      v96 = v49;
      v53 = v49;
      v54 = Espresso::layer_data::get_blob<Espresso::blob_cpu>(*(_QWORD *)(**(_QWORD **)(v49 + 32) + 80), *(_QWORD *)(**(_QWORD **)(v49 + 32) + 88), 0);
      if (v54)
      {
        v55 = v54[20];
        v56 = (std::__shared_weak_count *)v54[21];
        v104 = v55;
        v105 = v56;
        if (v56)
        {
          p_shared_owners = (unint64_t *)&v56->__shared_owners_;
          do
            v58 = __ldxr(p_shared_owners);
          while (__stxr(v58 + 1, p_shared_owners));
        }
      }
      else
      {
        v55 = 0;
        v104 = 0;
        v105 = 0;
      }
      v103 = buf;
      copy_to_blobrgb(&v103, v55, 0.0, *(float *)&buf.width);
      v59 = *(void (****)(uint64_t *__return_ptr, _QWORD))(v53 + 16);
      v101[0] = MEMORY[0x1E0C809B0];
      v101[1] = 3321888768;
      v101[2] = __74__EspressoFaceLandmarkDetector_extractSubLandmarksFromCrop192_centers192___block_invoke;
      v101[3] = &__block_descriptor_48_ea8_32c41_ZTSNSt3__110shared_ptrIN8Espresso3netEEE_e10_v16__0r_v8l;
      v102 = v96;
      if (v50)
      {
        v60 = (unint64_t *)(v50 + 8);
        do
          v61 = __ldxr(v60);
        while (__stxr(v61 + 1, v60));
      }
      Espresso::abstract_context::compute_batch_sync(v59, v101);
      std::string::basic_string[abi:ne180100]<0>(__p, "fc2");
      v117 = __p;
      v62 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v53 + 136, (unsigned __int8 *)__p, (__int128 **)&v117);
      Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&v99, *((void **)v62 + 5), *((std::__shared_weak_count **)v62 + 6));
      if (v98 < 0)
        operator delete(__p[0]);
      v63 = 0;
      v64 = vcvt_f32_s32(v95);
      while (1)
      {
        v65 = 0;
        v66 = *(int *)(v99 + 8);
        do
        {
          v66 *= *(int *)(v99 + 12 + v65);
          v65 += 4;
        }
        while (v65 != 12);
        if (v63 >= v66 >> 1)
          break;
        v67 = vmul_f32(*(float32x2_t *)(*(_QWORD *)(v99 + 24) + 8 * v63), vcvt_f32_s32(*(int32x2_t *)v110[3 * v39]));
        v68 = vadd_f32(vdiv_f32(vadd_f32(v67, v67), vcvt_f32_s32(*(int32x2_t *)v107[3 * v39])), v64);
        var1 = retstr->var1;
        var0 = retstr->var2.var0;
        if (var1 >= var0)
        {
          v72 = retstr->var0;
          v73 = (var1 - retstr->var0) >> 3;
          v74 = v73 + 1;
          if ((unint64_t)(v73 + 1) >> 61)
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          v75 = var0 - v72;
          if (v75 >> 2 > v74)
            v74 = v75 >> 2;
          if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8)
            v76 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v76 = v74;
          if (v76)
            v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v76);
          else
            v77 = 0;
          v78 = (FaceLandmarkDetectorPoint *)(v76 + 8 * v73);
          *(float32x2_t *)v78 = v68;
          v71 = (FaceLandmarkDetectorPoint *)((char *)v78 + 8);
          if (var1 != v72)
          {
            do
            {
              v79 = *((_QWORD *)var1 - 1);
              var1 = (FaceLandmarkDetectorPoint *)((char *)var1 - 8);
              *((_QWORD *)v78 - 1) = v79;
              v78 = (FaceLandmarkDetectorPoint *)((char *)v78 - 8);
            }
            while (var1 != v72);
            var1 = retstr->var0;
          }
          retstr->var0 = v78;
          retstr->var1 = v71;
          retstr->var2.var0 = (FaceLandmarkDetectorPoint *)(v76 + 8 * v77);
          if (var1)
            operator delete(var1);
        }
        else
        {
          *(float32x2_t *)var1 = v68;
          v71 = (FaceLandmarkDetectorPoint *)((char *)var1 + 8);
        }
        retstr->var1 = v71;
        ++v63;
      }
      free(buf.data);
      v80 = v100;
      if (v100)
      {
        v81 = (unint64_t *)&v100->__shared_owners_;
        do
          v82 = __ldaxr(v81);
        while (__stlxr(v82 - 1, v81));
        if (!v82)
        {
          ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
          std::__shared_weak_count::__release_weak(v80);
        }
      }
      v83 = (std::__shared_weak_count *)*((_QWORD *)&v102 + 1);
      if (*((_QWORD *)&v102 + 1))
      {
        v84 = (unint64_t *)(*((_QWORD *)&v102 + 1) + 8);
        do
          v85 = __ldaxr(v84);
        while (__stlxr(v85 - 1, v84));
        if (!v85)
        {
          ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
          std::__shared_weak_count::__release_weak(v83);
        }
      }
      v86 = v105;
      if (v105)
      {
        v87 = (unint64_t *)&v105->__shared_owners_;
        do
          v88 = __ldaxr(v87);
        while (__stlxr(v88 - 1, v87));
        if (!v88)
        {
          ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
          std::__shared_weak_count::__release_weak(v86);
        }
      }
      v89 = (std::__shared_weak_count *)*((_QWORD *)&v106 + 1);
      if (*((_QWORD *)&v106 + 1))
      {
        v90 = (unint64_t *)(*((_QWORD *)&v106 + 1) + 8);
        do
          v91 = __ldaxr(v90);
        while (__stlxr(v91 - 1, v90));
        if (!v91)
        {
          ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
          std::__shared_weak_count::__release_weak(v89);
        }
      }
      ++v39;
      v38 = v113;
    }
    while (0xAAAAAAAAAAAAAAABLL * (v114 - v113) > v39);
  }
  src.data = &v107;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&src);
  src.data = &v110;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&src);
  src.data = &v113;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&src);
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v116);
  return result;
}

- (vector<FaceLandmarkDetectorPoint,)detect:(EspressoFaceLandmarkDetector *)self face:(SEL)a3 sublandmark:(vImage_Buffer *)a4 doFaceRectFix:(CGRect)a5
{
  _BOOL8 v7;
  __int128 v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  vector<FaceLandmarkDetectorPoint, std::allocator<FaceLandmarkDetectorPoint>> *result;
  __int128 v18;
  _OWORD v19[2];
  _OWORD v20[2];
  void *__p;
  void *v22;
  _OWORD v23[2];

  v7 = a6;
  if (a7)
  {
    v10 = *(_OWORD *)&a4->width;
    v20[0] = *(_OWORD *)&a4->data;
    v20[1] = v10;
    -[EspressoFaceLandmarkDetector detectInImageRect:face:sublandmark:](self, "detectInImageRect:face:sublandmark:", v20, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
    v11 = *((float *)__p + 2);
    v12 = vabds_f32(*(float *)__p, v11) * 2.5;
    v13 = *(float *)__p * 0.3333333 + *((float *)__p + 4) * 0.3333333 + v11 * 0.3333333 + (float)(v12 * -0.5);
    v14 = *((float *)__p + 1) * 0.125
        + *((float *)__p + 5) * 0.5
        + *((float *)__p + 3) * 0.125
        + *((float *)__p + 7) * 0.125
        + *((float *)__p + 9) * 0.125
        + (float)(v12 * -0.6);
    v15 = v12;
    -[EspressoFaceLandmarkDetector setNewface:](self, "setNewface:", v13, v14, v15, v15);
    v16 = *(_OWORD *)&a4->width;
    v19[0] = *(_OWORD *)&a4->data;
    v19[1] = v16;
    -[EspressoFaceLandmarkDetector detectInImageRect:face:sublandmark:](self, "detectInImageRect:face:sublandmark:", v19, v7, v13, v14, v15, v15);
    result = (vector<FaceLandmarkDetectorPoint, std::allocator<FaceLandmarkDetectorPoint>> *)__p;
    if (__p)
    {
      v22 = __p;
      operator delete(__p);
    }
  }
  else
  {
    v18 = *(_OWORD *)&a4->width;
    v23[0] = *(_OWORD *)&a4->data;
    v23[1] = v18;
    return -[EspressoFaceLandmarkDetector detectInImageRect:face:sublandmark:](self, "detectInImageRect:face:sublandmark:", v23, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  }
  return result;
}

- (vector<FaceLandmarkDetectorPoint,)detectInImageRect:(EspressoFaceLandmarkDetector *)self face:(SEL)a3 sublandmark:(vImage_Buffer *)a4
{
  double height;
  double width;
  double y;
  double x;
  float v14;
  float v15;
  int v16;
  int v17;
  int v18;
  size_t rowBytes;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  __int128 v26;
  uint64_t v27;
  void (***v28)(uint64_t *__return_ptr, _QWORD);
  uint64_t v29;
  _QWORD *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  net *ptr;
  void *v35;
  net *v36;
  void *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  net *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  void (***v52)(uint64_t *__return_ptr, _QWORD);
  net *v53;
  void *v54;
  FaceLandmarkDetectorPoint *var1;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int *v59;
  int v60;
  int v61;
  FaceLandmarkDetectorPoint *var0;
  FaceLandmarkDetectorPoint *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  FaceLandmarkDetectorPoint *v70;
  uint64_t v71;
  __int128 v72;
  uint64_t *data;
  vImagePixelCount v74;
  FaceLandmarkDetectorPoint *v75;
  uint64_t v76;
  FaceLandmarkDetectorPoint *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  FaceLandmarkDetectorPoint *v83;
  FaceLandmarkDetectorPoint *v84;
  FaceLandmarkDetectorPoint *v85;
  uint64_t v86;
  FaceLandmarkDetectorPoint *v87;
  float v88;
  float v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  vector<FaceLandmarkDetectorPoint, std::allocator<FaceLandmarkDetectorPoint>> *result;
  int v100;
  int v101;
  _OWORD v102[2];
  _QWORD v103[5];
  void *__p;
  std::__shared_weak_count *v105;
  char v106;
  uint64_t v107;
  std::__shared_weak_count *v108;
  vImage_Buffer *p_src;
  std::__shared_weak_count *v110;
  uint64_t v111;
  std::__shared_weak_count *v112;
  _QWORD v113[5];
  _OWORD v114[2];
  uint64_t v115;
  std::__shared_weak_count *v116;
  vImage_Buffer src;
  _BYTE v118[64];
  __int128 *v119[2];
  CGRect v120;
  CGRect v121;
  CGRect v122;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v118, "FaceLandmark", a5.origin.x);
  v14 = (float)(int)width;
  v15 = (float)(int)height;
  v16 = (int)(float)(v14 * 1.04);
  v120.origin.x = (double)(int)(float)((float)(int)x + (float)((float)(v14 * -0.04) * 0.5));
  v120.origin.y = (double)(int)(float)((float)(int)y + (float)((float)(v15 * -0.04) * 0.5));
  v120.size.width = (double)v16;
  v120.size.height = (double)(int)(float)(v15 * 1.04);
  v122.size.width = (double)a4->width;
  v122.size.height = (double)a4->height;
  v122.origin.x = 0.0;
  v122.origin.y = 0.0;
  v121 = CGRectIntersection(v120, v122);
  v17 = (int)v121.origin.x;
  if ((int)v121.size.height >= (int)v121.size.width)
    v18 = (int)v121.size.width;
  else
    v18 = (int)v121.size.height;
  v101 = (int)v121.origin.y;
  rowBytes = a4->rowBytes;
  src.data = (char *)a4->data + 4 * v17 + rowBytes * (int)v121.origin.y;
  src.height = v18;
  src.width = v18;
  src.rowBytes = rowBytes;
  vImageScale_ARGB8888(&src, &self->crop_192, 0, 0x20u);
  vImageScale_ARGB8888(&self->crop_192, &self->crop_scaled, 0, 0x20u);
  v20 = **((_QWORD **)self->net_detect.__ptr_ + 4);
  v21 = Espresso::layer_data::get_blob<Espresso::blob_cpu>(*(_QWORD *)(v20 + 80), *(_QWORD *)(v20 + 88), 0);
  if (v21)
  {
    v22 = v21[20];
    v23 = (std::__shared_weak_count *)v21[21];
    v115 = v22;
    v116 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
    }
  }
  else
  {
    v22 = 0;
    v115 = 0;
    v116 = 0;
  }
  v26 = *(_OWORD *)&self->crop_scaled.width;
  v114[0] = *(_OWORD *)&self->crop_scaled.data;
  v114[1] = v26;
  copy_to_blobrgb(v114, v22, -90.686, *(float *)&v26);
  v27 = MEMORY[0x1E0C809B0];
  v28 = (void (***)(uint64_t *__return_ptr, _QWORD))*((_QWORD *)self->net_detect.__ptr_ + 2);
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v113[2] = __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke;
  v113[3] = &unk_1E2DD3720;
  v113[4] = self;
  Espresso::abstract_context::compute_batch_sync(v28, v113);
  v100 = v17;
  v29 = **((_QWORD **)self->net.__ptr_ + 4);
  v30 = Espresso::layer_data::get_blob<Espresso::blob_cpu>(*(_QWORD *)(v29 + 80), *(_QWORD *)(v29 + 88), 0);
  if (v30)
  {
    v31 = (std::__shared_weak_count *)v30[21];
    v111 = v30[20];
    v112 = v31;
    if (v31)
    {
      v32 = (unint64_t *)&v31->__shared_owners_;
      do
        v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }
  }
  else
  {
    v111 = 0;
    v112 = 0;
  }
  ptr = self->net_detect.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&src, "prob_student");
  __p = &src;
  v35 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)&src, (__int128 **)&__p);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&p_src, *((void **)v35 + 5), *((std::__shared_weak_count **)v35 + 6));
  if (SHIBYTE(src.width) < 0)
    operator delete(src.data);
  if (*(float *)(p_src->rowBytes + 4) < 0.99996875)
    NSLog(CFSTR("    dcn lndmrk skip! No face %e"), *(float *)(p_src->rowBytes + 4));
  std::vector<int>::vector((std::vector<int> *)&src, 1uLL);
  v36 = self->net_detect.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&__p, "pool5_student");
  v119[0] = (__int128 *)&__p;
  v37 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v36 + 136, (unsigned __int8 *)&__p, v119);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&v107, *((void **)v37 + 5), *((std::__shared_weak_count **)v37 + 6));
  if (v106 < 0)
    operator delete(__p);
  *(_DWORD *)src.data = 0;
  v38 = v108;
  if (v108)
  {
    v39 = (unint64_t *)&v108->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v41 = *(_QWORD *)(v111 + 24);
  v42 = self->net_detect.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&__p, "pool5_student");
  v119[0] = (__int128 *)&__p;
  v43 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v42 + 136, (unsigned __int8 *)&__p, v119);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&v107, *((void **)v43 + 5), *((std::__shared_weak_count **)v43 + 6));
  if (v106 < 0)
    operator delete(__p);
  v44 = 0;
  v45 = *(int *)(v107 + 8);
  do
  {
    v45 *= *(int *)(v107 + 12 + v44);
    v44 += 4;
  }
  while (v44 != 12);
  memcpy((void *)(v41 + 4 * *(int *)src.data), *(const void **)(v107 + 24), 4 * v45);
  v46 = v108;
  if (v108)
  {
    v47 = (unint64_t *)&v108->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  if (src.data)
  {
    src.height = (vImagePixelCount)src.data;
    operator delete(src.data);
  }
  v49 = v110;
  if (v110)
  {
    v50 = (unint64_t *)&v110->__shared_owners_;
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  v52 = (void (***)(uint64_t *__return_ptr, _QWORD))*((_QWORD *)self->net.__ptr_ + 2);
  v103[0] = v27;
  v103[1] = 3221225472;
  v103[2] = __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke_2;
  v103[3] = &unk_1E2DD3720;
  v103[4] = self;
  Espresso::abstract_context::compute_batch_sync(v52, v103);
  v53 = self->net.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&src, "fc2");
  p_src = &src;
  v54 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v53 + 136, (unsigned __int8 *)&src, (__int128 **)&p_src);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&__p, *((void **)v54 + 5), *((std::__shared_weak_count **)v54 + 6));
  if (SHIBYTE(src.width) < 0)
    operator delete(src.data);
  var1 = 0;
  v56 = 0;
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  while (1)
  {
    v57 = 0;
    v58 = *((int *)__p + 2);
    do
    {
      v58 *= *(int *)((char *)__p + v57 + 12);
      v57 += 4;
    }
    while (v57 != 12);
    if (v56 >= v58 >> 1)
      break;
    v59 = (int *)(*((_QWORD *)__p + 3) + 8 * v56);
    v61 = *v59;
    v60 = v59[1];
    var0 = retstr->var2.var0;
    if (var1 >= var0)
    {
      v63 = retstr->var0;
      v64 = (var1 - retstr->var0) >> 3;
      v65 = v64 + 1;
      if ((unint64_t)(v64 + 1) >> 61)
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      v66 = var0 - v63;
      if (v66 >> 2 > v65)
        v65 = v66 >> 2;
      if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8)
        v67 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v67 = v65;
      if (v67)
      {
        v67 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v67);
        v63 = retstr->var0;
        var1 = retstr->var1;
      }
      else
      {
        v68 = 0;
      }
      v69 = v67 + 8 * v64;
      *(_DWORD *)v69 = v61;
      *(_DWORD *)(v69 + 4) = v60;
      v70 = (FaceLandmarkDetectorPoint *)v69;
      if (var1 != v63)
      {
        do
        {
          v71 = *((_QWORD *)var1 - 1);
          var1 = (FaceLandmarkDetectorPoint *)((char *)var1 - 8);
          *((_QWORD *)v70 - 1) = v71;
          v70 = (FaceLandmarkDetectorPoint *)((char *)v70 - 8);
        }
        while (var1 != v63);
        v63 = retstr->var0;
      }
      var1 = (FaceLandmarkDetectorPoint *)(v69 + 8);
      retstr->var0 = v70;
      retstr->var1 = (FaceLandmarkDetectorPoint *)(v69 + 8);
      retstr->var2.var0 = (FaceLandmarkDetectorPoint *)(v67 + 8 * v68);
      if (v63)
        operator delete(v63);
    }
    else
    {
      *(_DWORD *)var1 = v61;
      *((_DWORD *)var1 + 1) = v60;
      var1 = (FaceLandmarkDetectorPoint *)((char *)var1 + 8);
    }
    retstr->var1 = var1;
    ++v56;
  }
  if (a6)
  {
    v72 = *(_OWORD *)&self->crop_192.width;
    v102[0] = *(_OWORD *)&self->crop_192.data;
    v102[1] = v72;
    -[EspressoFaceLandmarkDetector extractSubLandmarksFromCrop192:centers192:](self, "extractSubLandmarksFromCrop192:centers192:", v102, retstr);
    data = (uint64_t *)src.data;
    v74 = src.height;
    if (src.data != (void *)src.height)
    {
      v75 = retstr->var1;
      do
      {
        v76 = *data;
        v77 = retstr->var2.var0;
        if (v75 >= v77)
        {
          v78 = (v75 - retstr->var0) >> 3;
          if ((unint64_t)(v78 + 1) >> 61)
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          v79 = v77 - retstr->var0;
          v80 = v79 >> 2;
          if (v79 >> 2 <= (unint64_t)(v78 + 1))
            v80 = v78 + 1;
          if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFF8)
            v81 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v81 = v80;
          if (v81)
            v81 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v81);
          else
            v82 = 0;
          v83 = (FaceLandmarkDetectorPoint *)(v81 + 8 * v78);
          *(_QWORD *)v83 = v76;
          v75 = (FaceLandmarkDetectorPoint *)((char *)v83 + 8);
          v85 = retstr->var0;
          v84 = retstr->var1;
          if (v84 != retstr->var0)
          {
            do
            {
              v86 = *((_QWORD *)v84 - 1);
              v84 = (FaceLandmarkDetectorPoint *)((char *)v84 - 8);
              *((_QWORD *)v83 - 1) = v86;
              v83 = (FaceLandmarkDetectorPoint *)((char *)v83 - 8);
            }
            while (v84 != v85);
            v84 = retstr->var0;
          }
          retstr->var0 = v83;
          retstr->var1 = v75;
          retstr->var2.var0 = (FaceLandmarkDetectorPoint *)(v81 + 8 * v82);
          if (v84)
            operator delete(v84);
        }
        else
        {
          *(_QWORD *)v75 = v76;
          v75 = (FaceLandmarkDetectorPoint *)((char *)v75 + 8);
        }
        retstr->var1 = v75;
        ++data;
      }
      while (data != (uint64_t *)v74);
      data = (uint64_t *)src.data;
    }
    if (data)
    {
      src.height = (vImagePixelCount)data;
      operator delete(data);
    }
    var1 = retstr->var1;
  }
  v87 = retstr->var0;
  if (retstr->var0 != var1)
  {
    v88 = (float)v18;
    do
    {
      v89 = (float)v101 + (float)((float)(*((float *)v87 + 1) / 192.0) * v88);
      *(float *)v87 = (float)v100 + (float)((float)(*(float *)v87 / 192.0) * v88);
      *((float *)v87 + 1) = v89;
      v87 = (FaceLandmarkDetectorPoint *)((char *)v87 + 8);
    }
    while (v87 != var1);
  }
  v90 = v105;
  if (v105)
  {
    v91 = (unint64_t *)&v105->__shared_owners_;
    do
      v92 = __ldaxr(v91);
    while (__stlxr(v92 - 1, v91));
    if (!v92)
    {
      ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
      std::__shared_weak_count::__release_weak(v90);
    }
  }
  v93 = v112;
  if (v112)
  {
    v94 = (unint64_t *)&v112->__shared_owners_;
    do
      v95 = __ldaxr(v94);
    while (__stlxr(v95 - 1, v94));
    if (!v95)
    {
      ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
      std::__shared_weak_count::__release_weak(v93);
    }
  }
  v96 = v116;
  if (v116)
  {
    v97 = (unint64_t *)&v116->__shared_owners_;
    do
      v98 = __ldaxr(v97);
    while (__stlxr(v98 - 1, v97));
    if (!v98)
    {
      ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
      std::__shared_weak_count::__release_weak(v96);
    }
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v118);
  return result;
}

- (EspressoFaceLandmarkDetector)initWithNetworkAtPath:(id)a3 context:(shared_ptr<Espresso:(int)a5 :(int)a6 abstract_context>)a4 platform:computePath:
{
  uint64_t v6;
  __shared_weak_count *cntrl;
  abstract_context *ptr;
  id v10;
  EspressoFaceLandmarkDetector *v11;
  EspressoFaceLandmarkDetector *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  objc_super v22;

  v6 = *(_QWORD *)&a5;
  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EspressoFaceLandmarkDetector;
  v11 = -[EspressoFaceLandmarkDetector init](&v22, sel_init);
  v12 = v11;
  v13 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v20 = *(_QWORD *)ptr;
  v21 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  -[EspressoFaceLandmarkDetector commonInit:context:platform:computePath:](v11, "commonInit:context:platform:computePath:", v10, &v20, cntrl, v6);
  v16 = v21;
  if (v21)
  {
    v17 = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return v12;
}

- (EspressoFaceLandmarkDetector)initWithNetworkAtPath:(id)a3 contextObjC:(id)a4 platform:(int)a5 computePath:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  EspressoFaceLandmarkDetector *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  objc_super v19;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)EspressoFaceLandmarkDetector;
  v12 = -[EspressoFaceLandmarkDetector init](&v19, sel_init);
  if (v11)
  {
    objc_msgSend(v11, "ctx");
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  -[EspressoFaceLandmarkDetector commonInit:context:platform:computePath:](v12, "commonInit:context:platform:computePath:", v10, &v17, v7, v6);
  v13 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return v12;
}

- (EspressoFaceLandmarkDetector)init
{
  EspressoFaceLandmarkDetector *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  int v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EspressoFaceLandmarkDetector;
  v2 = -[EspressoFaceLandmarkDetector init](&v10, sel_init);
  v7 = 0;
  Espresso::create_context(&v7, &v8);
  -[EspressoFaceLandmarkDetector commonInit:context:platform:computePath:](v2, "commonInit:context:platform:computePath:", 0, &v8, 0, 0);
  v3 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v2;
}

- (void)commonInit:(id)a3 context:(shared_ptr<Espresso:(int)a5 :(int)a6 abstract_context>)a4 platform:computePath:
{
  uint64_t v6;
  abstract_context *ptr;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *p_nets_sub_landmark;
  id v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  id v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  id v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  id v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  BOOL v44;
  std::__shared_weak_count *v45;
  unint64_t *p_shared_owners;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  EspressoFaceLandmarkDetector *v51;
  unsigned int v52;
  void *v53;
  unsigned int cntrl;
  id v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  void *__p[2];
  char v59;
  void *v60[2];
  char v61;
  __int128 v62;

  v6 = *(_QWORD *)&a5;
  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  v9 = a3;
  NSLog(CFSTR("NP %@"), v9);
  v10 = v9;
  v11 = v9;
  v55 = v9;
  v12 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pathForResource:ofType:", CFSTR("landmarks_8c_.espresso.local.bin"), &stru_1E2DD80E0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathForResource:ofType:", CFSTR("faceDetector-current.bin"), &stru_1E2DD80E0);
    v55 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathForResource:ofType:", CFSTR("landmarks_p0_.espresso.local.bin"), &stru_1E2DD80E0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathForResource:ofType:", CFSTR("landmarks_p1_.espresso.local.bin"), &stru_1E2DD80E0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pathForResource:ofType:", CFSTR("landmarks_p3_.espresso.local.bin"), &stru_1E2DD80E0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v52 = v6;
      v51 = self;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "pathForResource:ofType:", CFSTR("landmarks_8c_.espresso.local.bin"), &stru_1E2DD80E0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "pathForResource:ofType:", CFSTR("faceDetector-current.bin"), &stru_1E2DD80E0);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v53, "pathForResource:ofType:", CFSTR("landmarks_p0_.espresso.local.bin"), &stru_1E2DD80E0);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v53, "pathForResource:ofType:", CFSTR("landmarks_p1_.espresso.local.bin"), &stru_1E2DD80E0);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v53, "pathForResource:ofType:", CFSTR("landmarks_p3_.espresso.local.bin"), &stru_1E2DD80E0);
      v21 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v19;
      v10 = (void *)v20;
      v11 = (void *)v21;
      v55 = (id)v18;
      v6 = v52;
      self = v51;
    }
  }
  vImageBuffer_Init(&self->crop_scaled, 0x1CuLL, 0x1CuLL, 0x20u, 0);
  vImageBuffer_Init(&self->crop_192, 0xC0uLL, 0xC0uLL, 0x20u, 0);
  p_nets_sub_landmark = (uint64_t *)&self->nets_sub_landmark;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::resize((int64x2_t *)&self->nets_sub_landmark, 3uLL);
  v23 = objc_retainAutorelease(v12);
  std::string::basic_string[abi:ne180100]<0>(v60, (char *)objc_msgSend(v23, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_8c_");
  Espresso::load_network_binserializer((uint64_t)v60, (const void **)__p, (uint64_t *)ptr, v6, 1, (uint64_t)&v62);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->net, &v62);
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v59 < 0)
    operator delete(__p[0]);
  if (v61 < 0)
    operator delete(v60[0]);
  v27 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(v60, (char *)objc_msgSend(v27, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_p0_");
  Espresso::load_network_binserializer((uint64_t)v60, (const void **)__p, (uint64_t *)ptr, v6, 1, (uint64_t)&v62);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100](*p_nets_sub_landmark, &v62);
  v28 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v29 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (v59 < 0)
    operator delete(__p[0]);
  if (v61 < 0)
    operator delete(v60[0]);
  v31 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v60, (char *)objc_msgSend(v31, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_p1_");
  Espresso::load_network_binserializer((uint64_t)v60, (const void **)__p, (uint64_t *)ptr, v6, 1, (uint64_t)&v62);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100](*p_nets_sub_landmark + 16, &v62);
  v32 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v33 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (v59 < 0)
    operator delete(__p[0]);
  if (v61 < 0)
    operator delete(v60[0]);
  v35 = objc_retainAutorelease(v11);
  std::string::basic_string[abi:ne180100]<0>(v60, (char *)objc_msgSend(v35, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_p3_");
  Espresso::load_network_binserializer((uint64_t)v60, (const void **)__p, (uint64_t *)ptr, v6, 1, (uint64_t)&v62);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100](*p_nets_sub_landmark + 32, &v62);
  v36 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v37 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  if (v59 < 0)
    operator delete(__p[0]);
  v39 = v6;
  if (v61 < 0)
    operator delete(v60[0]);
  v40 = objc_retainAutorelease(v55);
  std::string::basic_string[abi:ne180100]<0>(v60, (char *)objc_msgSend(v40, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  Espresso::load_network_binserializer((uint64_t)v60, (const void **)__p, (uint64_t *)ptr, v39, 1, (uint64_t)&v62);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->net_detect, &v62);
  v41 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v42 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  if (v59 < 0)
    operator delete(__p[0]);
  if (v61 < 0)
    operator delete(v60[0]);
  if (*(_QWORD *)*p_nets_sub_landmark)
    v44 = 1;
  else
    v44 = v23 == 0;
  if (!v44)
  {
    v45 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v56 = *(_QWORD *)ptr;
    v57 = v45;
    if (v45)
    {
      p_shared_owners = (unint64_t *)&v45->__shared_owners_;
      do
        v47 = __ldxr(p_shared_owners);
      while (__stxr(v47 + 1, p_shared_owners));
    }
    -[EspressoFaceLandmarkDetector commonInit:context:platform:computePath:](self, "commonInit:context:platform:computePath:", 0, &v56, cntrl, v39);
    v48 = v57;
    if (v57)
    {
      v49 = (unint64_t *)&v57->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  free(self->crop_scaled.data);
  free(self->crop_192.data);
  v3.receiver = self;
  v3.super_class = (Class)EspressoFaceLandmarkDetector;
  -[EspressoFaceLandmarkDetector dealloc](&v3, sel_dealloc);
}

- (CGRect)newface
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_newface, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setNewface:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_newface, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  vector<std::shared_ptr<Espresso::net>, std::allocator<std::shared_ptr<Espresso::net>>> *p_nets_sub_landmark;

  p_nets_sub_landmark = &self->nets_sub_landmark;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_nets_sub_landmark);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->net_detect);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->net);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

void __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke(uint64_t a1, _QWORD *a2)
{
  Espresso::net::__forward(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), a2, 0, 0xFFFFFFFFLL);
}

void __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  Espresso::net::__forward(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), a2, 0, 0xFFFFFFFFLL);
}

void __74__EspressoFaceLandmarkDetector_extractSubLandmarksFromCrop192_centers192___block_invoke(uint64_t a1, _QWORD *a2)
{
  Espresso::net::__forward(*(_QWORD *)(a1 + 32), a2, 0, 0xFFFFFFFFLL);
}

@end
