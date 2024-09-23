@implementation ARPlaneWorld

- (ARPlaneWorld)init
{
  return -[ARPlaneWorld initWithTextureSize:](self, "initWithTextureSize:", 0);
}

- (ARPlaneWorld)initWithTextureSize:(unint64_t)a3
{
  ARPlaneWorld *v4;
  uint64_t v5;
  ARGPUWarper *gpuWarper;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *semaphore;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARPlaneWorld;
  v4 = -[ARPlaneWorld init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    gpuWarper = v4->_gpuWarper;
    v4->_gpuWarper = (ARGPUWarper *)v5;

    v4->_textureSize = a3;
    v7 = dispatch_semaphore_create(1);
    semaphore = v4->_semaphore;
    v4->_semaphore = (OS_dispatch_semaphore *)v7;

  }
  return v4;
}

- (BOOL)isBusy
{
  intptr_t v3;

  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  return v3 != 0;
}

+ (map<std::array<unsigned)findMergedPlanes:(std:()16>> :(std:()16>> :(std:()16> :(std:(16>>>>> *__return_ptr)retstr :(map<std:()16> :(std:()16>> :(std:()16>> :(std:()16> :(std:(16>>>>> *)result :(SEL)a3 set<std:(const void *)a4 :(const void *)a5 array<unsigned)char allocator<std::pair<const std::array<unsigned)char less<std::array<unsigned)char set<std::array<unsigned)char array<unsigned)char set<std::array<unsigned)char allocator<std::pair<const std::array<unsigned)char less<std::array<unsigned)char set<std::array<unsigned)char :
{
  char *v6;
  char *v7;
  char *v9;
  char *v10;
  char *v11;
  BOOL v12;
  _OWORD *v13[3];
  _QWORD *v14;
  _QWORD *v15;

  retstr->var0.var2.var0 = 0;
  retstr->var0.var1.var0.__left_ = 0;
  retstr->var0.var0 = &retstr->var0.var1;
  v6 = (char *)a4 + 8;
  v7 = *(char **)a4;
  if (*(const void **)a4 != (char *)a4 + 8)
  {
    do
    {
      keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)a5, (uint64_t)v13);
      intersect<std::array<unsigned char,16ul>>(v13, (uint64_t)(v7 + 240), (uint64_t)&v14);
      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v13, (_QWORD *)v13[1]);
      v13[0] = v7 + 48;
      v9 = (char *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul> const&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)(v7 + 48), (uint64_t)&std::piecewise_construct, v13);
      std::set<std::array<unsigned char,16ul>>::insert[abi:ne180100]<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v9 + 48, v14, &v15);
      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v14, v15);
      v10 = (char *)*((_QWORD *)v7 + 1);
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = *(char **)v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (char *)*((_QWORD *)v7 + 2);
          v12 = *(_QWORD *)v11 == (_QWORD)v7;
          v7 = v11;
        }
        while (!v12);
      }
      v7 = v11;
    }
    while (v11 != v6);
  }
  return result;
}

- (map<std::array<unsigned)updatePlanes:()ARTexturedPlane withCurrentDetections:(std:()16>> :(std:()16> :(ARTexturedPlane>>> *__return_ptr)retstr allocator<std:(ARPlaneWorld *)self :(SEL)a3 pair<const std:(const void *)a4 :(const void *)a5 array<unsigned)char less<std:(BOOL)a6 :array<unsigned)char synchronous:
{
  _QWORD **v7;
  unint64_t textureSize;
  uint64_t v9;
  uint64_t **v10;
  uint64_t **v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _OWORD *v22;
  void *v23;
  _QWORD *v24;
  _QWORD **v25;
  BOOL v26;
  _QWORD **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float v39;
  uint32x4_t v40;
  uint32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  void *v51;
  id v52;
  ARGPUWarper *gpuWarper;
  __int128 v54;
  __int128 v55;
  float32x4_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  const void *v64;
  uint64_t v65;
  _OWORD *v66;
  uint64_t v67;
  ARGPUWarper *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD *v78;
  _OWORD *v79;
  uint64_t **v80;
  uint64_t **v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  _QWORD *v89;
  _QWORD **v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  uint64_t **v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  map<std::array<unsigned char, 16>, ARTexturedPlane, std::less<std::array<unsigned char, 16>>, std::allocator<std::pair<const std::array<unsigned char, 16>, ARTexturedPlane>>> *result;
  uint64_t v109;
  float32x4_t v111;
  float v112;
  _BOOL4 v114;
  char v116[8];
  _QWORD *v117;
  _QWORD **v118;
  _QWORD *v119[2];
  _QWORD **v120;
  _QWORD *v121[2];
  _QWORD v122[3];
  _QWORD v123[3];
  _OWORD v124[4];
  float32x4_t v125[12];
  _QWORD *v126[3];
  id v127;
  _OWORD v128[12];
  _QWORD *v129[3];
  id v130;
  float32x4_t v131[12];
  _QWORD *v132[3];
  id v133;
  _OWORD v134[12];
  _QWORD *v135[3];
  id v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  _QWORD *v149;
  _QWORD *v150[2];
  id obj;
  uint64_t v152;
  simd_float4x4 v153;

  v114 = a6;
  v152 = *MEMORY[0x1E0C80C00];
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)a4, (uint64_t)v123);
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)a5, (uint64_t)v122);
  notInLeftButRight<std::array<unsigned char,16ul>>((char *)v123, v122, (uint64_t)&v120);
  intersect<std::array<unsigned char,16ul>>(v123, (uint64_t)v122, (uint64_t)&v118);
  +[ARPlaneWorld findMergedPlanes::](ARPlaneWorld, "findMergedPlanes::", a5, a4);
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  v7 = v120;
  textureSize = (unint64_t)fminf(sqrtf(16777000.0 / (float)((unint64_t)v121[1] + *((_QWORD *)a4 + 2))), 1024.0);
  if (self->_textureSize)
    textureSize = self->_textureSize;
  v109 = textureSize;
  if (v120 != v121)
  {
    do
    {
      v9 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)a5, (uint64_t)v7 + 25);
      v137.i64[0] = (uint64_t)v7 + 25;
      v10 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)v7 + 25, (uint64_t)&std::piecewise_construct, (__int128 **)&v137);
      v11 = v10;
      v12 = *(_OWORD *)v9;
      v13 = *(_OWORD *)(v9 + 16);
      v14 = *(_OWORD *)(v9 + 48);
      *((_OWORD *)v10 + 5) = *(_OWORD *)(v9 + 32);
      *((_OWORD *)v10 + 6) = v14;
      *((_OWORD *)v10 + 3) = v12;
      *((_OWORD *)v10 + 4) = v13;
      v15 = *(_OWORD *)(v9 + 64);
      v16 = *(_OWORD *)(v9 + 80);
      v17 = *(_OWORD *)(v9 + 112);
      *((_OWORD *)v10 + 9) = *(_OWORD *)(v9 + 96);
      *((_OWORD *)v10 + 10) = v17;
      *((_OWORD *)v10 + 7) = v15;
      *((_OWORD *)v10 + 8) = v16;
      v18 = *(_OWORD *)(v9 + 128);
      v19 = *(_OWORD *)(v9 + 144);
      v20 = *(_OWORD *)(v9 + 176);
      *((_OWORD *)v10 + 13) = *(_OWORD *)(v9 + 160);
      *((_OWORD *)v10 + 14) = v20;
      *((_OWORD *)v10 + 11) = v18;
      *((_OWORD *)v10 + 12) = v19;
      if (v10 + 6 != (uint64_t **)v9)
        std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v10 + 30, *(_QWORD **)(v9 + 192), (_QWORD *)(v9 + 200));
      objc_storeStrong((id *)v11 + 33, *(id *)(v9 + 216));
      ARCreateTexture(v109);
      v21 = objc_claimAutoreleasedReturnValue();
      v137.i64[0] = (uint64_t)v7 + 25;
      v22 = std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)v7 + 25, (uint64_t)&std::piecewise_construct, (__int128 **)&v137);
      v23 = (void *)*((_QWORD *)v22 + 33);
      *((_QWORD *)v22 + 33) = v21;

      v24 = v7[1];
      if (v24)
      {
        do
        {
          v25 = (_QWORD **)v24;
          v24 = (_QWORD *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (_QWORD **)v7[2];
          v26 = *v25 == v7;
          v7 = v25;
        }
        while (!v26);
      }
      v7 = v25;
    }
    while (v25 != v121);
  }
  v27 = v118;
  if (v118 != v119)
  {
    do
    {
      v28 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)a5, (uint64_t)v27 + 25);
      v29 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)a4, (uint64_t)v27 + 25);
      v153 = __invert_f4(*(simd_float4x4 *)(v29 + 32));
      v31 = 0;
      v32 = *(_OWORD *)(v28 + 48);
      v33 = *(_OWORD *)(v28 + 64);
      v34 = *(_OWORD *)(v28 + 80);
      v124[0] = *(_OWORD *)(v28 + 32);
      v124[1] = v32;
      v124[2] = v33;
      v124[3] = v34;
      do
      {
        *(float32x4_t *)((char *)&v137 + v31 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v153.columns[0], COERCE_FLOAT(v124[v31])), (float32x4_t)v153.columns[1], *(float32x2_t *)&v124[v31], 1), (float32x4_t)v153.columns[2], (float32x4_t)v124[v31], 2), (float32x4_t)v153.columns[3], (float32x4_t)v124[v31], 3);
        ++v31;
      }
      while (v31 != 4);
      v111 = v140;
      *(double *)v35.i64 = ARMatrix3x3FromMatrix4x4(v30);
      v38 = vabsq_f32(v111);
      if (v38.f32[0] <= 0.01
        && v38.f32[1] <= 0.01
        && (v112 = v38.f32[2],
            v39 = acosf(COERCE_FLOAT(vmlaq_f32(vaddq_f32(v36, vmulq_f32(v35, (float32x4_t)0)), (float32x4_t)0, v37).i32[1])),
            v112 <= 0.01)
        && v39 >= 0.0
        && v39 <= 0.0
        && (v40 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v29 + 96), *(float32x4_t *)(v28 + 96)),
            v40.i32[3] = v40.i32[2],
            (vminvq_u32(v40) & 0x80000000) != 0)
        && (v41 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v29 + 112), *(float32x4_t *)(v28 + 112)),
            v41.i32[3] = v41.i32[2],
            (vminvq_u32(v41) & 0x80000000) != 0))
      {
        v91 = *(float32x4_t *)v29;
        v92 = *(float32x4_t *)(v29 + 16);
        v93 = *(float32x4_t *)(v29 + 48);
        v139 = *(float32x4_t *)(v29 + 32);
        v140 = v93;
        v137 = v91;
        v138 = v92;
        v94 = *(float32x4_t *)(v29 + 64);
        v95 = *(float32x4_t *)(v29 + 80);
        v96 = *(float32x4_t *)(v29 + 96);
        v144 = *(float32x4_t *)(v29 + 112);
        v143 = v96;
        v142 = v95;
        v141 = v94;
        v97 = *(float32x4_t *)(v29 + 128);
        v98 = *(float32x4_t *)(v29 + 144);
        v99 = *(float32x4_t *)(v29 + 160);
        v148 = *(float32x4_t *)(v29 + 176);
        v147 = v99;
        v146 = v98;
        v145 = v97;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)&v149, v29 + 192);
        obj = *(id *)(v29 + 216);
        ++v138.i64[0];
        *(_QWORD *)&v124[0] = (char *)v27 + 25;
        v100 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, (uint64_t)v27 + 25, (uint64_t)&std::piecewise_construct, (__int128 **)v124);
        v81 = v100;
        v101 = v148;
        v102 = v146;
        *((float32x4_t *)v100 + 11) = v145;
        *((float32x4_t *)v100 + 12) = v102;
        *((float32x4_t *)v100 + 13) = v147;
        *((float32x4_t *)v100 + 14) = v101;
        v103 = v144;
        v104 = v142;
        *((float32x4_t *)v100 + 7) = v141;
        *((float32x4_t *)v100 + 8) = v104;
        *((float32x4_t *)v100 + 9) = v143;
        *((float32x4_t *)v100 + 10) = v103;
        v105 = v138;
        v107 = v139;
        v106 = v140;
        *((float32x4_t *)v100 + 3) = v137;
        *((float32x4_t *)v100 + 4) = v105;
        *((float32x4_t *)v100 + 5) = v107;
        *((float32x4_t *)v100 + 6) = v106;
        if (v100 + 6 != (uint64_t **)&v137)
          std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v100 + 30, v149, v150);
      }
      else
      {
        v42 = *(float32x4_t *)v28;
        v43 = *(float32x4_t *)(v28 + 16);
        v44 = *(float32x4_t *)(v28 + 48);
        v139 = *(float32x4_t *)(v28 + 32);
        v140 = v44;
        v137 = v42;
        v138 = v43;
        v45 = *(float32x4_t *)(v28 + 64);
        v46 = *(float32x4_t *)(v28 + 80);
        v47 = *(float32x4_t *)(v28 + 96);
        v144 = *(float32x4_t *)(v28 + 112);
        v143 = v47;
        v142 = v46;
        v141 = v45;
        v48 = *(float32x4_t *)(v28 + 128);
        v49 = *(float32x4_t *)(v28 + 144);
        v50 = *(float32x4_t *)(v28 + 160);
        v148 = *(float32x4_t *)(v28 + 176);
        v147 = v50;
        v146 = v49;
        v145 = v48;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)&v149, v28 + 192);
        obj = *(id *)(v28 + 216);
        ARCreateTexture(v109);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = obj;
        obj = v51;

        kdebug_trace();
        gpuWarper = self->_gpuWarper;
        v54 = *(_OWORD *)(v29 + 48);
        v56 = *(float32x4_t *)v29;
        v55 = *(_OWORD *)(v29 + 16);
        v134[2] = *(_OWORD *)(v29 + 32);
        v134[3] = v54;
        v134[0] = v56;
        v134[1] = v55;
        v57 = *(_OWORD *)(v29 + 112);
        v59 = *(_OWORD *)(v29 + 64);
        v58 = *(_OWORD *)(v29 + 80);
        v134[6] = *(_OWORD *)(v29 + 96);
        v134[7] = v57;
        v134[4] = v59;
        v134[5] = v58;
        v60 = *(_OWORD *)(v29 + 176);
        v62 = *(_OWORD *)(v29 + 128);
        v61 = *(_OWORD *)(v29 + 144);
        v134[10] = *(_OWORD *)(v29 + 160);
        v134[11] = v60;
        v134[8] = v62;
        v134[9] = v61;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v135, v29 + 192);
        v136 = *(id *)(v29 + 216);
        v131[8] = v145;
        v131[9] = v146;
        v131[10] = v147;
        v131[11] = v148;
        v131[4] = v141;
        v131[5] = v142;
        v131[6] = v143;
        v131[7] = v144;
        v131[0] = v137;
        v131[1] = v138;
        v131[2] = v139;
        v131[3] = v140;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v132, (uint64_t)&v149);
        v133 = obj;
        -[ARGPUWarper warpPlane:toPlane:withLoadAction:synchronous:](gpuWarper, "warpPlane:toPlane:withLoadAction:synchronous:", v134, v131, 2, v114);

        std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v132, v132[1]);
        std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v135, v135[1]);
        kdebug_trace();
        v63 = (uint64_t)v27 + 25;
        v64 = a4;
        if (&v117 != std::__tree<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>>>::find<std::array<unsigned char,16ul>>((uint64_t)v116, (uint64_t)v27 + 25))
        {
          v65 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)v116, v63);
          std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v124, v65);
          v66 = *(_OWORD **)&v124[0];
          if (*(_OWORD **)&v124[0] != (_OWORD *)((char *)v124 + 8))
          {
            do
            {
              v67 = std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::at((uint64_t)v64, (uint64_t)v66 + 25);
              v68 = self->_gpuWarper;
              v69 = *(_OWORD *)(v67 + 48);
              v71 = *(_OWORD *)v67;
              v70 = *(_OWORD *)(v67 + 16);
              v128[2] = *(_OWORD *)(v67 + 32);
              v128[3] = v69;
              v128[0] = v71;
              v128[1] = v70;
              v72 = *(_OWORD *)(v67 + 112);
              v74 = *(_OWORD *)(v67 + 64);
              v73 = *(_OWORD *)(v67 + 80);
              v128[6] = *(_OWORD *)(v67 + 96);
              v128[7] = v72;
              v128[4] = v74;
              v128[5] = v73;
              v75 = *(_OWORD *)(v67 + 176);
              v77 = *(_OWORD *)(v67 + 128);
              v76 = *(_OWORD *)(v67 + 144);
              v128[10] = *(_OWORD *)(v67 + 160);
              v128[11] = v75;
              v128[8] = v77;
              v128[9] = v76;
              std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v129, v67 + 192);
              v130 = *(id *)(v67 + 216);
              v125[8] = v145;
              v125[9] = v146;
              v125[10] = v147;
              v125[11] = v148;
              v125[4] = v141;
              v125[5] = v142;
              v125[6] = v143;
              v125[7] = v144;
              v125[0] = v137;
              v125[1] = v138;
              v125[2] = v139;
              v125[3] = v140;
              std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v126, (uint64_t)&v149);
              v127 = obj;
              -[ARGPUWarper warpPlane:toPlane:withLoadAction:synchronous:](v68, "warpPlane:toPlane:withLoadAction:synchronous:", v128, v125, 1, v114);

              v64 = a4;
              std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v126, v126[1]);

              std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v129, v129[1]);
              v78 = (_QWORD *)*((_QWORD *)v66 + 1);
              if (v78)
              {
                do
                {
                  v79 = v78;
                  v78 = (_QWORD *)*v78;
                }
                while (v78);
              }
              else
              {
                do
                {
                  v79 = (_OWORD *)*((_QWORD *)v66 + 2);
                  v26 = *(_QWORD *)v79 == (_QWORD)v66;
                  v66 = v79;
                }
                while (!v26);
              }
              v66 = v79;
            }
            while (v79 != (_OWORD *)((char *)v124 + 8));
          }
          std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v124, *((_QWORD **)&v124[0] + 1));
          v63 = (uint64_t)v27 + 25;
        }
        *(_QWORD *)&v124[0] = v63;
        v80 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)retstr, v63, (uint64_t)&std::piecewise_construct, (__int128 **)v124);
        v81 = v80;
        v82 = v148;
        v83 = v146;
        *((float32x4_t *)v80 + 11) = v145;
        *((float32x4_t *)v80 + 12) = v83;
        *((float32x4_t *)v80 + 13) = v147;
        *((float32x4_t *)v80 + 14) = v82;
        v84 = v144;
        v85 = v142;
        *((float32x4_t *)v80 + 7) = v141;
        *((float32x4_t *)v80 + 8) = v85;
        *((float32x4_t *)v80 + 9) = v143;
        *((float32x4_t *)v80 + 10) = v84;
        v86 = v138;
        v88 = v139;
        v87 = v140;
        *((float32x4_t *)v80 + 3) = v137;
        *((float32x4_t *)v80 + 4) = v86;
        *((float32x4_t *)v80 + 5) = v88;
        *((float32x4_t *)v80 + 6) = v87;
        if (v80 + 6 != (uint64_t **)&v137)
          std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v80 + 30, v149, v150);
      }
      objc_storeStrong((id *)v81 + 33, obj);

      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v149, v150[0]);
      v89 = v27[1];
      if (v89)
      {
        do
        {
          v90 = (_QWORD **)v89;
          v89 = (_QWORD *)*v89;
        }
        while (v89);
      }
      else
      {
        do
        {
          v90 = (_QWORD **)v27[2];
          v26 = *v90 == v27;
          v27 = v90;
        }
        while (!v26);
      }
      v27 = v90;
    }
    while (v90 != v119);
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,std::set<std::array<unsigned char,16ul>>>>>::destroy((uint64_t)v116, v117);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v118, v119[0]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v120, v121[0]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v122, (_QWORD *)v122[1]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v123, (_QWORD *)v123[1]);
  return result;
}

- (void)updatePlanes:(simd_float4)a3 withCameraImage:(simd_float4)a4 exposureOffset:(float32x4_t)a5 transform:(simd_float4)a6 intrinsics:(float32x4_t)a7 synchronous:(float32x4_t)a8
{
  dispatch_semaphore_t *v16;
  float32x4_t *v17;
  int8x16_t v18;
  float32x4_t *v19;
  float32x4_t *v20;
  BOOL v21;
  _QWORD *v22;
  size_t Width;
  size_t Height;
  uint64_t **v25;
  float v26;
  int v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x2_t v30;
  uint64_t **v33;
  uint64_t **v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t *v44;
  uint64_t **v45;
  _QWORD *v46;
  unsigned __int32 *v47;
  unsigned __int32 *v48;
  unsigned __int32 *v49;
  int v50;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  float32x4_t *v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  uint64_t v65;
  void *v66;
  double v67;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  uint64_t v83;
  char v84[8];
  _QWORD *v85;
  _QWORD v86[3];
  char v87[8];
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  uint64_t v91[3];
  float32x4_t v92[12];
  _QWORD *v93[3];
  id v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  _QWORD *v108[3];
  id v109;
  float32x4_t v110;
  uint64_t v111;
  simd_float4x4 v112;
  simd_float4x4 v113;

  v111 = *MEMORY[0x1E0C80C00];
  v16 = (dispatch_semaphore_t *)(a1 + 112);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL);
  std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::map[abi:ne180100](v91, (uint64_t)(v16 - 13));
  dispatch_semaphore_signal(*v16);
  objc_msgSend((id)a1, "updatePlanes:withCurrentDetections:synchronous:", v91, a11, a13);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL);
  if (v16 - 13 != (dispatch_semaphore_t *)&v89)
    std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__tree_node<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,void *> *,long>>((uint64_t **)v16 - 13, v89, &v90);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 112));
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)v91, (uint64_t)v87);
  keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)&v89, (uint64_t)v86);
  notInLeftButRight<std::array<unsigned char,16ul>>(v87, v86, (uint64_t)v84);
  std::map<std::array<unsigned char,16ul>,ARTexturedPlane>::map[abi:ne180100]((uint64_t *)&v82, (uint64_t)&v89);
  v96.i64[0] = 0;
  v95.i64[1] = 0;
  v95.i64[0] = (uint64_t)&v95.i64[1];
  v17 = (float32x4_t *)v82.i64[0];
  if ((unsigned __int32 *)v82.i64[0] != &v82.u32[2])
  {
    v80 = vnegq_f32(a5);
    do
    {
      v18 = (int8x16_t)vmulq_f32(v17[6], v80);
      if (acosf(vaddv_f32(vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))) > 2.04203522)
        std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::pair<std::array<unsigned char,16ul> const,ARTexturedPlane> const&>((uint64_t **)&v95, (uint64_t)&v17[2], (uint64_t)&v17[2]);
      v19 = (float32x4_t *)v17->i64[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (float32x4_t *)v19->i64[0];
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (float32x4_t *)v17[1].i64[0];
          v21 = v20->i64[0] == (_QWORD)v17;
          v17 = v20;
        }
        while (!v21);
      }
      v17 = v20;
    }
    while (v20 != (float32x4_t *)&v82.u32[2]);
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v82, (_QWORD *)v82.i64[1]);
  v22 = (_QWORD *)v95.i64[1];
  v82 = v95;
  v83 = v96.i64[0];
  if (v96.i64[0])
  {
    *(_QWORD *)(v95.i64[1] + 16) = &v82.i64[1];
    v95.i64[0] = (uint64_t)&v95.i64[1];
    v95.i64[1] = 0;
    v96.i64[0] = 0;
    v22 = 0;
  }
  else
  {
    v82.i64[0] = (uint64_t)&v82.i64[1];
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v95, v22);
  v112.columns[0] = a3;
  v112.columns[1] = a4;
  v112.columns[2] = (simd_float4)a5;
  v112.columns[3] = a6;
  v113 = __invert_f4(v112);
  v79 = (float32x4_t)v113.columns[1];
  v81 = (float32x4_t)v113.columns[0];
  v77 = (float32x4_t)v113.columns[3];
  v78 = (float32x4_t)v113.columns[2];
  Width = CVPixelBufferGetWidth(a12);
  Height = CVPixelBufferGetHeight(a12);
  v96.i64[0] = 0;
  v95.i64[1] = 0;
  v95.i64[0] = (uint64_t)&v95.i64[1];
  v25 = (uint64_t **)v82.i64[0];
  if ((unsigned __int32 *)v82.i64[0] != &v82.u32[2])
  {
    v26 = (float)Height;
    do
    {
      v27 = 100;
      while (1)
      {
        *(double *)v28.i64 = randomPlanePointInWorldCoordinates((const ARTexturedPlane *)(v25 + 6));
        v110 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v28.f32[0]), v79, *(float32x2_t *)v28.f32, 1), v78, v28, 2), v77, v28, 3);
        *(float32x2_t *)v29.f32 = dehomogenize((float32x2_t *)&v110, *(double *)v28.i64, *(int32x2_t *)v110.f32);
        if (v29.f32[2] < 0.0)
        {
          v110 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a7, v29.f32[0]), a8, *(float32x2_t *)v29.f32, 1), a9, v29, 2);
          v30 = dehomogenize((uint64_t)&v110);
          if (v30.f32[0] >= 0.0 && v30.f32[0] < (float)Width && v30.f32[1] >= 0.0 && v30.f32[1] < v26)
            break;
        }
        if (!--v27)
          goto LABEL_34;
      }
      v110.i64[0] = (uint64_t)(v25 + 4);
      v33 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>((uint64_t **)&v95, (uint64_t)(v25 + 4), (uint64_t)&std::piecewise_construct, (__int128 **)&v110);
      v34 = v33;
      v35 = *((_OWORD *)v25 + 3);
      v36 = *((_OWORD *)v25 + 4);
      v37 = *((_OWORD *)v25 + 6);
      *((_OWORD *)v33 + 5) = *((_OWORD *)v25 + 5);
      *((_OWORD *)v33 + 6) = v37;
      *((_OWORD *)v33 + 3) = v35;
      *((_OWORD *)v33 + 4) = v36;
      v38 = *((_OWORD *)v25 + 7);
      v39 = *((_OWORD *)v25 + 8);
      v40 = *((_OWORD *)v25 + 10);
      *((_OWORD *)v33 + 9) = *((_OWORD *)v25 + 9);
      *((_OWORD *)v33 + 10) = v40;
      *((_OWORD *)v33 + 7) = v38;
      *((_OWORD *)v33 + 8) = v39;
      v41 = *((_OWORD *)v25 + 11);
      v42 = *((_OWORD *)v25 + 12);
      v43 = *((_OWORD *)v25 + 14);
      *((_OWORD *)v33 + 13) = *((_OWORD *)v25 + 13);
      *((_OWORD *)v33 + 14) = v43;
      *((_OWORD *)v33 + 11) = v41;
      *((_OWORD *)v33 + 12) = v42;
      if (v25 != v33)
        std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v33 + 30, v25[30], v25 + 31);
      objc_storeStrong((id *)v34 + 33, v25[33]);
LABEL_34:
      v44 = v25[1];
      if (v44)
      {
        do
        {
          v45 = (uint64_t **)v44;
          v44 = (uint64_t *)*v44;
        }
        while (v44);
      }
      else
      {
        do
        {
          v45 = (uint64_t **)v25[2];
          v21 = *v45 == (uint64_t *)v25;
          v25 = v45;
        }
        while (!v21);
      }
      v25 = v45;
    }
    while (v45 != (uint64_t **)&v82.u32[2]);
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v82, (_QWORD *)v82.i64[1]);
  v46 = (_QWORD *)v95.i64[1];
  v82 = v95;
  v83 = v96.i64[0];
  if (v96.i64[0])
  {
    *(_QWORD *)(v95.i64[1] + 16) = &v82.i64[1];
    v95.i64[0] = (uint64_t)&v95.i64[1];
    v95.i64[1] = 0;
    v96.i64[0] = 0;
    v46 = 0;
  }
  else
  {
    v82.i64[0] = (uint64_t)&v82.i64[1];
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v95, v46);
  v47 = (unsigned __int32 *)v82.i64[0];
  if ((unsigned __int32 *)v82.i64[0] != &v82.u32[2])
  {
    do
    {
      ARPlaneUpdateQueue::insert((_QWORD *)(a1 + 40), *((_QWORD *)v47 + 4), *((_QWORD *)v47 + 5), (id *)v47 + 6);
      v48 = (unsigned __int32 *)*((_QWORD *)v47 + 1);
      if (v48)
      {
        do
        {
          v49 = v48;
          v48 = *(unsigned __int32 **)v48;
        }
        while (v48);
      }
      else
      {
        do
        {
          v49 = (unsigned __int32 *)*((_QWORD *)v47 + 2);
          v21 = *(_QWORD *)v49 == (_QWORD)v47;
          v47 = v49;
        }
        while (!v21);
      }
      v47 = v49;
    }
    while (v49 != &v82.u32[2]);
  }
  if (*(_QWORD *)(a1 + 80))
  {
    v50 = -3;
    do
    {
      if (__CFADD__(v50++, 1))
        break;
      v52 = *(_QWORD *)(a1 + 72);
      v53 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * (v52 / 0x11));
      v54 = v52 % 0x11;
      v55 = (float32x4_t *)(v53 + 240 * (v52 % 0x11));
      v95 = *v55;
      v57 = v55[3];
      v56 = v55[4];
      v58 = v55[2];
      v96 = v55[1];
      v97 = v58;
      v98 = v57;
      v99 = v56;
      v59 = v55[8];
      v61 = v55[5];
      v60 = v55[6];
      v102 = v55[7];
      v103 = v59;
      v100 = v61;
      v101 = v60;
      v62 = v55[12];
      v64 = v55[9];
      v63 = v55[10];
      v106 = v55[11];
      v107 = v62;
      v104 = v64;
      v105 = v63;
      std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v108, (uint64_t)&v55[13]);
      v109 = *(id *)(v53 + 240 * v54 + 232);
      v110 = v95;
      std::__tree<std::array<unsigned char,16ul>>::__erase_unique<std::array<unsigned char,16ul>>((uint64_t **)(a1 + 88), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * (*(_QWORD *)(a1 + 72) / 0x11uLL))+ 240 * (*(_QWORD *)(a1 + 72) % 0x11uLL));
      std::deque<std::pair<std::array<unsigned char,16ul>,ARTexturedPlane>>::pop_front((int64x2_t *)(a1 + 40));
      v65 = &v85 == std::__tree<std::array<unsigned char,16ul>>::find<std::array<unsigned char,16ul>>((uint64_t)v84, (uint64_t)&v110)? 1: 2;
      kdebug_trace();
      v66 = *(void **)(a1 + 32);
      v92[8] = v104;
      v92[9] = v105;
      v92[10] = v106;
      v92[11] = v107;
      v92[4] = v100;
      v92[5] = v101;
      v92[6] = v102;
      v92[7] = v103;
      v92[0] = v96;
      v92[1] = v97;
      v92[2] = v98;
      v92[3] = v99;
      std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v93, (uint64_t)v108);
      v94 = v109;
      *(float *)&v67 = a2;
      objc_msgSend(v66, "warpCameraImage:withExposureOffset:withCameraIntrinsics:withCameraTransform:toPlane:withLoadAction:synchronous:", a12, v92, v65, a13, v67, *(double *)a7.i64, *(double *)a8.i64, *(double *)a9.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, *(double *)a6.i64);

      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v93, v93[1]);
      kdebug_trace();

      std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v108, v108[1]);
    }
    while (*(_QWORD *)(a1 + 80));
  }
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v82, (_QWORD *)v82.i64[1]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v84, v85);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v86, (_QWORD *)v86[1]);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v87, v88);
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v89, v90);
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)v91, (_QWORD *)v91[1]);
}

- (vector<ARTexturedPlane,)planes
{
  ARPlaneWorld *begin_node;
  ARTexturedPlane *v6;
  id *p_begin;
  ARPlaneWorld *isa;
  ARPlaneWorld *left;
  BOOL v10;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  begin_node = (ARPlaneWorld *)self->_planes.__tree_.__begin_node_;
  if (begin_node != (ARPlaneWorld *)&self->_planes.__tree_.__pair1_)
  {
    v6 = 0;
    do
    {
      p_begin = (id *)&begin_node->_queue.queue.c.__map_.__begin_;
      if (v6 >= retstr->__end_cap_.__value_)
      {
        v6 = (ARTexturedPlane *)std::vector<ARTexturedPlane>::__push_back_slow_path<ARTexturedPlane const&>((uint64_t *)retstr, p_begin);
      }
      else
      {
        std::vector<ARTexturedPlane>::__construct_one_at_end[abi:ne180100]<ARTexturedPlane const&>((uint64_t)retstr, p_begin);
        v6 += 4;
      }
      retstr->__end_ = v6;
      isa = (ARPlaneWorld *)begin_node->_planes.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (ARPlaneWorld *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (ARPlaneWorld *)begin_node->_planes.__tree_.__pair1_.__value_.__left_;
          v10 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v10);
      }
      begin_node = left;
    }
    while (left != (ARPlaneWorld *)&self->_planes.__tree_.__pair1_);
  }
  return (vector<ARTexturedPlane, std::allocator<ARTexturedPlane>> *)dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[ARPlaneWorld description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ARPlaneWorld isBusy](self, "isBusy");
  v7 = CFSTR("NotBusy");
  if (v6)
    v7 = CFSTR("Busy");
  objc_msgSend(v5, "appendFormat:", CFSTR("State: %@\n"), v7);
  objc_msgSend(v5, "appendFormat:", CFSTR("Queue Size: %d\n"), self->_queue.queue.c.__size_.__value_);
  objc_msgSend(v5, "appendFormat:", CFSTR("GPU Warper: %@\n"), self->_gpuWarper);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&self->_queue.elements, (_QWORD *)self->_queue.elements.__tree_.__pair1_.__value_.__left_);
  std::deque<std::pair<std::array<unsigned char,16ul>,ARTexturedPlane>>::~deque[abi:ne180100](&self->_queue.queue.c.__map_.__first_);
  objc_storeStrong((id *)&self->_gpuWarper, 0);
  std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&self->_planes, (_QWORD *)self->_planes.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = (char *)self + 96;
  return self;
}

@end
