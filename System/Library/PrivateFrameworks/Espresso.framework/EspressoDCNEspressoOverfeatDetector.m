@implementation EspressoDCNEspressoOverfeatDetector

- (void)fillFaceList
{
  double v2;
  EspressoFDOverfeatNetwork *v4;
  int *v5;
  float v6;
  float v7;
  uint64_t i;
  double v9;
  double v10;
  EspressoFDOverfeatNetwork *enet;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  EspressoFDOverfeatNetwork *v15;
  EspressoFDOverfeatNetwork *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  double v23;
  EspressoFDOverfeatNetwork *v24;
  int *v25;
  EspressoFDOverfeatNetwork *v26;
  int *v27;
  EspressoFDOverfeatNetwork *v28;
  int v29;
  int v30;
  int v31;
  int *v32;
  int *v33;
  int *v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  float v40;
  uint64_t v41;
  int32x2_t v42;
  float32x2_t v43;
  double v44;
  double v45;
  EspressoFDOverfeatNetwork *v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  EspressoFDOverfeatNetwork *v50;
  EspressoFDOverfeatNetwork *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  int v55;
  Espresso *v56;
  void *v57;
  char *v58;
  Espresso *v59;
  std::__shared_weak_count *v60;
  void *v61;
  int shared_owners;
  int shared_owners_high;
  int32x2_t v64;
  uint64_t v65;
  int v66;
  float *v67;
  int *shared_weak_owners;
  uint64_t v69;
  uint64_t v70;
  float32x2_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  float *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  double confidenceThreshold;
  float v82;
  float *v83;
  float v84;
  int tileSizeScaleFactor;
  int v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float32x2_t v92;
  float32x2_t v93;
  float v94;
  char v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  float32x2_t *v101;
  int v102;
  int v103;
  int v105;
  char *v106;
  float v107;
  float v108;
  float v109;
  int32x2_t v110;
  float v111;
  float32x2_t v112;
  float v113;
  float v114;
  float32x2_t v115;
  float v116;
  float v117;
  float32x2_t v118;
  uint64_t v119;
  int *v120;
  float *v121;
  uint64_t v122;
  int v123;
  float *v124;
  EspressoDCNEspressoOverfeatDetector *v125;
  uint64_t *face_list;
  _OWORD *v127;
  uint64_t v128;
  double v129;
  unint64_t v130;
  unint64_t v131;
  std::__shared_weak_count *v132;
  unint64_t *v133;
  unint64_t v134;
  std::__shared_weak_count *v135;
  unint64_t *v136;
  unint64_t v137;
  void *v138;
  int *v139;
  int v140;
  uint64_t v141;
  std::__shared_weak_count *v142;
  unint64_t *v143;
  unint64_t *v144;
  EspressoDCNEspressoOverfeatDetector *v145;
  std::__shared_weak_count *v146;
  float v147;
  int v148;
  uint64_t v149;
  float *v150;
  float *v151;
  char v152;
  uint64_t v153;
  void *v154;
  __int128 v155;
  float64x2_t v156;
  float v157;
  uint64_t v158;
  uint64_t v159;
  std::__shared_weak_count *v160;
  uint64_t v161;
  std::__shared_weak_count *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  uint64_t v166;
  std::__shared_weak_count *v167;
  uint64_t v168;
  std::__shared_weak_count *v169;
  void *v170[2];
  __int128 v171;
  void *v172[2];
  void *__p[2];
  __int128 v174;
  _BYTE v175[72];

  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v175, "fillFaceList", v2);
  std::__list_imp<int>::clear((_QWORD *)self->face_list);
  if (!self->localFaceMerging)
  {
    -[EspressoFDOverfeatNetwork maxScale](self->_enet, "maxScale");
    v7 = v6;
    for (i = 0; ; ++i)
    {
      if (i >= -[EspressoFDOverfeatNetwork getNumScales](self->_enet, "getNumScales"))
        goto LABEL_169;
      enet = self->_enet;
      if (enet)
      {
        -[EspressoFDOverfeatNetwork resizerAtIndex:](enet, "resizerAtIndex:", 0);
        v12 = (std::__shared_weak_count *)v170[1];
        v155 = *(_OWORD *)(*((_QWORD *)v170[0] + 12) + 16 * i);
        if (v170[1])
        {
          v13 = (unint64_t *)((char *)v170[1] + 8);
          do
            v14 = __ldaxr(v13);
          while (__stlxr(v14 - 1, v13));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
      }
      else
      {
        v170[0] = 0;
        v170[1] = 0;
        v155 = *(_OWORD *)(MEMORY[0x60] + 16 * i);
      }
      v15 = self->_enet;
      if (!v15)
        break;
      -[EspressoFDOverfeatNetwork probBlobForScale:](v15, "probBlobForScale:", i);
      v16 = self->_enet;
      if (!v16)
        goto LABEL_18;
      -[EspressoFDOverfeatNetwork boxBlobForScale:](v16, "boxBlobForScale:", i);
LABEL_19:
      *(float *)&v9 = *(double *)&v155;
      *(float *)&v10 = *((double *)&v155 + 1);
      -[EspressoDCNEspressoOverfeatDetector computeBBoxUsingProb:box:andScalefactor:padX:padY:](self, "computeBBoxUsingProb:box:andScalefactor:padX:padY:", &v161, &v159, COERCE_DOUBLE(__PAIR64__(HIDWORD(v155), LODWORD(v7))), v9, v10);
      v17 = v160;
      if (v160)
      {
        p_shared_owners = (unint64_t *)&v160->__shared_owners_;
        do
          v19 = __ldaxr(p_shared_owners);
        while (__stlxr(v19 - 1, p_shared_owners));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v20 = v162;
      if (v162)
      {
        v21 = (unint64_t *)&v162->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      -[EspressoFDOverfeatNetwork getScale:](self->_enet, "getScale:", i);
      v7 = v7 / v23;
    }
    v161 = 0;
    v162 = 0;
LABEL_18:
    v159 = 0;
    v160 = 0;
    goto LABEL_19;
  }
  v4 = self->_enet;
  if (v4)
  {
    -[EspressoFDOverfeatNetwork strideConfiguration](v4, "strideConfiguration");
    v5 = (int *)v170[1];
    v171 = 0uLL;
    v170[1] = 0;
    if (__p[1])
    {
      *(void **)&v174 = __p[1];
      operator delete(__p[1]);
    }
  }
  else
  {
    v5 = 0;
    *(_OWORD *)__p = 0u;
    v174 = 0u;
    v171 = 0u;
    *(_OWORD *)v172 = 0u;
    *(_OWORD *)v170 = 0u;
  }
  if (v172[0])
  {
    v172[1] = v172[0];
    operator delete(v172[0]);
  }
  if (v170[1])
  {
    *(void **)&v171 = v170[1];
    operator delete(v170[1]);
  }
  v24 = self->_enet;
  if (v24)
  {
    -[EspressoFDOverfeatNetwork strideConfiguration](v24, "strideConfiguration");
    v25 = (int *)v172[0];
    v172[1] = 0;
    __p[0] = 0;
    v172[0] = 0;
    if (__p[1])
    {
      *(void **)&v174 = __p[1];
      operator delete(__p[1]);
    }
  }
  else
  {
    v25 = 0;
    *(_OWORD *)__p = 0u;
    v174 = 0u;
    v171 = 0u;
    *(_OWORD *)v172 = 0u;
    *(_OWORD *)v170 = 0u;
  }
  if (v170[1])
  {
    *(void **)&v171 = v170[1];
    operator delete(v170[1]);
  }
  v26 = self->_enet;
  if (v26)
  {
    -[EspressoFDOverfeatNetwork strideConfiguration](v26, "strideConfiguration");
    v27 = (int *)__p[1];
    v174 = 0uLL;
    __p[1] = 0;
    if (v172[0])
    {
      v172[1] = v172[0];
      operator delete(v172[0]);
    }
  }
  else
  {
    v27 = 0;
    *(_OWORD *)__p = 0u;
    v174 = 0u;
    v171 = 0u;
    *(_OWORD *)v172 = 0u;
    *(_OWORD *)v170 = 0u;
  }
  if (v170[1])
  {
    *(void **)&v171 = v170[1];
    operator delete(v170[1]);
  }
  v28 = self->_enet;
  if (v28)
  {
    -[EspressoFDOverfeatNetwork strideConfiguration](v28, "strideConfiguration");
    v29 = (int)v170[0];
    if (__p[1])
    {
      *(void **)&v174 = __p[1];
      operator delete(__p[1]);
    }
  }
  else
  {
    v29 = 0;
    *(_OWORD *)__p = 0u;
    v174 = 0u;
    v171 = 0u;
    *(_OWORD *)v172 = 0u;
    *(_OWORD *)v170 = 0u;
  }
  if (v172[0])
  {
    v172[1] = v172[0];
    operator delete(v172[0]);
  }
  if (v170[1])
  {
    *(void **)&v171 = v170[1];
    operator delete(v170[1]);
  }
  if (v29 < 1)
  {
    v30 = 0;
    v31 = 1;
  }
  else
  {
    v30 = 0;
    v31 = 1;
    v32 = v5;
    v33 = v27;
    v34 = v25;
    v35 = v29;
    do
    {
      v37 = *v32++;
      v36 = v37;
      v38 = *v33++;
      v30 += (v36 / 2 - v38) * v31;
      v39 = *v34++;
      v31 *= v39;
      --v35;
    }
    while (v35);
  }
  v139 = v25;
  -[EspressoFDOverfeatNetwork maxScale](self->_enet, "maxScale", v5);
  v147 = v40;
  v41 = 0;
  *(float *)v42.i32 = (float)v30;
  v43 = (float32x2_t)vdup_lane_s32(v42, 0);
  v44 = 1.0;
  v45 = 0.5;
  v145 = self;
  v140 = v31;
  while (v41 < -[EspressoFDOverfeatNetwork getNumScales](self->_enet, "getNumScales"))
  {
    v46 = self->_enet;
    if (v46)
    {
      -[EspressoFDOverfeatNetwork resizerAtIndex:](v46, "resizerAtIndex:", 0);
      v47 = (std::__shared_weak_count *)v170[1];
      v156 = *(float64x2_t *)(*((_QWORD *)v170[0] + 12) + 16 * v41);
      if (v170[1])
      {
        v48 = (unint64_t *)((char *)v170[1] + 8);
        do
          v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
          std::__shared_weak_count::__release_weak(v47);
        }
      }
    }
    else
    {
      v170[0] = 0;
      v170[1] = 0;
      v156 = *(float64x2_t *)(MEMORY[0x60] + 16 * v41);
    }
    v50 = self->_enet;
    if (!v50)
    {
      v168 = 0;
      v169 = 0;
LABEL_73:
      v166 = 0;
      v167 = 0;
      goto LABEL_74;
    }
    -[EspressoFDOverfeatNetwork probBlobForScale:](v50, "probBlobForScale:", v41);
    v51 = self->_enet;
    if (!v51)
      goto LABEL_73;
    -[EspressoFDOverfeatNetwork boxBlobForScale:](v51, "boxBlobForScale:", v41);
LABEL_74:
    if (!v168)
      goto LABEL_152;
    v52 = *(unsigned int *)(v168 + 8);
    v53 = *(unsigned int *)(v168 + 12);
    v54 = (char *)operator new(0x58uLL);
    *((_QWORD *)v54 + 1) = 0;
    v144 = (unint64_t *)(v54 + 8);
    v55 = v53;
    *(_QWORD *)v54 = &off_1E2DBEAE8;
    *(_OWORD *)(v54 + 56) = 0u;
    *((_QWORD *)v54 + 2) = 0;
    *((_QWORD *)v54 + 3) = &off_1E2DA10F0;
    *(_OWORD *)(v54 + 72) = 0u;
    *((_DWORD *)v54 + 8) = v52;
    *((_DWORD *)v54 + 9) = v53;
    v153 = v53;
    v56 = (Espresso *)(16 * (int)v52 * (uint64_t)(int)v53);
    v57 = Espresso::kern_alloc_uninitialized(v56);
    bzero(v57, (size_t)v56);
    *((_QWORD *)v54 + 5) = v57;
    v54[48] = 1;
    v58 = (char *)operator new(0x58uLL);
    *((_QWORD *)v58 + 1) = 0;
    v143 = (unint64_t *)(v58 + 8);
    *(_QWORD *)v58 = &off_1E2DBEEA0;
    *(_OWORD *)(v58 + 56) = 0u;
    *((_QWORD *)v58 + 2) = 0;
    *((_QWORD *)v58 + 3) = &off_1E2DA1310;
    *(_OWORD *)(v58 + 72) = 0u;
    *((_DWORD *)v58 + 8) = v52;
    *((_DWORD *)v58 + 9) = v153;
    v59 = (Espresso *)(4 * (int)v52 * (uint64_t)v55);
    v60 = (std::__shared_weak_count *)v58;
    v61 = Espresso::kern_alloc_uninitialized(v59);
    bzero(v61, (size_t)v59);
    v60[1].__shared_weak_owners_ = (uint64_t)v61;
    LOBYTE(v60[2].__vftable) = 1;
    shared_owners = v60[1].__shared_owners_;
    shared_owners_high = HIDWORD(v60[1].__shared_owners_);
    v146 = v60;
    if (shared_owners_high * (uint64_t)shared_owners)
      memset(v61, 255, 4 * shared_owners * (uint64_t)shared_owners_high);
    bzero(*((void **)v54 + 5), 16 * *((int *)v54 + 8) * (uint64_t)*((int *)v54 + 9));
    v65 = v153;
    v66 = v153 * v52;
    v142 = (std::__shared_weak_count *)v54;
    v67 = (float *)*((_QWORD *)v54 + 5);
    v151 = v67;
    if ((int)v153 * (int)v52 >= 1)
    {
      bzero(v67, 16 * (v153 * v52));
      v67 = v151;
      v65 = v153;
    }
    v141 = v41;
    shared_weak_owners = (int *)v146[1].__shared_weak_owners_;
    v69 = 4 * (int)v52;
    if ((int)v65 > 0)
    {
      v70 = 0;
      v71 = vcvt_f32_f64(v156);
      v72 = 4 * (v52 - 1);
      v73 = *(_QWORD *)(v166 + 24);
      v74 = v73 + 8 * (int)v52 * (int)v65;
      v75 = *(_QWORD *)(v168 + 24) + 4 * v66;
      v76 = v67 + 2;
      v77 = v73 + 4 * v66;
      v78 = v146[1].__shared_weak_owners_;
      do
      {
        if ((int)v52 >= 1)
        {
          v79 = 0;
          v80 = 0;
          confidenceThreshold = v145->_confidenceThreshold;
          v83 = v76;
          do
          {
            v84 = *(float *)(v75 + v80);
            tileSizeScaleFactor = v145->tileSizeScaleFactor;
            if (tileSizeScaleFactor >= 0)
              v86 = v145->tileSizeScaleFactor;
            else
              v86 = tileSizeScaleFactor + 1;
            if (confidenceThreshold <= v84)
            {
              v82 = confidenceThreshold + (v44 - confidenceThreshold) * v45;
              if (v84 > v82)
              {
                if (!v80)
                  v84 = v84 * 1.4;
                v87 = 1.75;
                if (v80)
                  v87 = 1.4;
                if (v72 == v80)
                  v88 = v87;
                else
                  v88 = 1.0;
                v89 = v88 * v84;
                if (v72 == v80)
                  v87 = v87 * 1.25;
                if (v70)
                  v90 = 1.0;
                else
                  v90 = v87;
                v84 = v90 * v89;
                if (!v70)
                  v87 = v87 * 1.25;
                v91 = v87 * v84;
                if (v70 == (_DWORD)v65 - 1)
                  v84 = v91;
              }
              *(float *)v64.i32 = -(float)(v86 >> 1);
              v92.i32[0] = *(_DWORD *)(v73 + v80);
              v92.i32[1] = *(_DWORD *)(v77 + v80);
              v93 = vmla_n_f32((float32x2_t)vdup_lane_s32(v64, 0), v92, (float)tileSizeScaleFactor);
              v94 = *(float *)(v74 + v80) * (float)tileSizeScaleFactor;
              v92.f32[0] = (float)v79;
              v92.f32[1] = (float)(v31 * v70);
              v64 = (int32x2_t)vmul_n_f32(vsub_f32(vadd_f32(vadd_f32(v93, v43), v92), v71), v147);
              *((int32x2_t *)v83 - 1) = v64;
              *v83 = v147 * v94;
              v83[1] = v84;
              *(_DWORD *)(v78 + v80) = 1;
            }
            v80 += 4;
            v79 += v31;
            v83 += 4;
          }
          while (4 * v52 != v80);
        }
        ++v70;
        v74 += v69;
        v78 += v69;
        v75 += v69;
        v76 += 4 * (int)v52;
        v73 += v69;
        v77 += v69;
      }
      while (v70 != v65);
    }
    v95 = 1;
    do
    {
      v96 = 0;
      v152 = v95;
      do
      {
        v148 = v96;
        if ((int)v65 >= 1)
        {
          v97 = 0;
          while ((int)v52 < 1)
          {
LABEL_134:
            if (++v97 == v65)
              goto LABEL_135;
          }
          v98 = 0;
          v149 = v97 * (int)v52;
          while (shared_weak_owners[v98 + v149] != 1)
          {
LABEL_133:
            if (++v98 == v52)
              goto LABEL_134;
          }
          v99 = 0;
          v100 = (char *)&v67[4 * v98 + 4 * v149];
          v101 = (float32x2_t *)(v100 + 4);
          v150 = (float *)(v100 + 12);
          while (2)
          {
            if (((0x40423uLL >> v99) & 1) == 0 || ((0x404089uLL >> v99) & 1) == 0)
            {
              v102 = dword_191AA1B74[v99] + v97;
              if (v102 >= 0)
              {
                v103 = dword_191AA1B10[v99] + v98;
                if (v103 >= 0 && v102 < (int)v65 && v103 < (int)v52)
                {
                  v105 = v103 + v102 * v52;
                  if (shared_weak_owners[v105] == 1)
                  {
                    v106 = (char *)&v67[4 * v105];
                    v107 = *(float *)v106;
                    v154 = (void *)*((_QWORD *)v106 + 1);
                    v157 = *((float *)v106 + 1);
                    if ((v152 & 1) != 0)
                    {
                      v165 = *(_OWORD *)v106;
                      v108 = vision::DCN::boundingbox::calculate_overlap((float *)v100, (float *)&v165);
                      v170[0] = (void *)__PAIR64__(LODWORD(v157), LODWORD(v107));
                      v170[1] = v154;
                      v109 = vision::DCN::boundingbox::calculate_overlap((float *)v100, (float *)v170);
                      v110.i32[0] = *(_DWORD *)v100;
                      v111 = v157;
                      v65 = v153;
                      v67 = v151;
                      if ((float)(v109
                                 + (float)(sqrtf((float)((float)(v101->f32[0] - v157) * (float)(v101->f32[0] - v157))+ (float)((float)(*(float *)v100 - v107) * (float)(*(float *)v100 - v107)))/ (float)(*(float *)&v154 + *((float *)v100 + 2)))) < 0.9359375&& v108 > 0.3)
                      {
                        v112 = (float32x2_t)v154;
                        v113 = *v150;
                        goto LABEL_131;
                      }
                    }
                    else
                    {
                      v164 = *(_OWORD *)v106;
                      v114 = vision::DCN::boundingbox::calculate_overlap((float *)v100, (float *)&v164);
                      v65 = v153;
                      v67 = v151;
                      v111 = v157;
                      if (v114 > 0.5)
                      {
                        v113 = *v150;
                        v110.i32[0] = *(_DWORD *)v100;
                        v112 = (float32x2_t)v154;
LABEL_131:
                        v115 = (float32x2_t)vrev64_s32((int32x2_t)v112);
                        v116 = vmuls_lane_f32(v107, v112, 1) + (float)(*(float *)v110.i32 * v113);
                        *(float *)v110.i32 = v113 + v112.f32[1];
                        v117 = v116 / (float)(v113 + v112.f32[1]);
                        v112.f32[0] = v111;
                        v118 = vdiv_f32(vmla_n_f32(vmul_f32(v112, v115), *v101, v113), (float32x2_t)vdup_lane_s32(v110, 0));
                        *(float *)v100 = v117;
                        *(float32x2_t *)(v100 + 4) = v118;
                        *((_DWORD *)v100 + 3) = v110.i32[0];
                        shared_weak_owners[v105] = 2;
                      }
                    }
                  }
                }
              }
            }
            if (++v99 == 25)
              goto LABEL_133;
            continue;
          }
        }
LABEL_135:
        v96 = v148 + 1;
      }
      while (v148 != 2);
      v95 = 0;
    }
    while ((v152 & 1) != 0);
    self = v145;
    v44 = 1.0;
    v45 = 0.5;
    if ((int)v65 >= 1)
    {
      v119 = 0;
      do
      {
        v158 = v119;
        v120 = shared_weak_owners;
        v121 = v67;
        v122 = v52;
        if ((int)v52 >= 1)
        {
          do
          {
            v123 = *v120++;
            if (v123 == 1)
            {
              v124 = v67;
              v125 = self;
              face_list = (uint64_t *)self->face_list;
              v163 = *(_OWORD *)v121;
              v127 = operator new(0x20uLL);
              v127[1] = v163;
              *((_QWORD *)v127 + 1) = face_list;
              v128 = *face_list;
              *(_QWORD *)v127 = *face_list;
              *(_QWORD *)(v128 + 8) = v127;
              *face_list = (uint64_t)v127;
              ++face_list[2];
              v65 = v153;
              v67 = v124;
              self = v125;
            }
            v121 += 4;
            --v122;
          }
          while (v122);
        }
        v119 = v158 + 1;
        v67 += 4 * (int)v52;
        shared_weak_owners += (int)v52;
      }
      while (v158 + 1 != v65);
    }
    v41 = v141;
    -[EspressoFDOverfeatNetwork getScale:](self->_enet, "getScale:", v141);
    *(float *)&v129 = v147 / v129;
    v147 = *(float *)&v129;
    do
      v130 = __ldaxr(v143);
    while (__stlxr(v130 - 1, v143));
    if (!v130)
    {
      ((void (*)(std::__shared_weak_count *))v146->__on_zero_shared)(v146);
      std::__shared_weak_count::__release_weak(v146);
    }
    v31 = v140;
    do
      v131 = __ldaxr(v144);
    while (__stlxr(v131 - 1, v144));
    if (!v131)
    {
      ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
      std::__shared_weak_count::__release_weak(v142);
    }
LABEL_152:
    v132 = v167;
    if (v167)
    {
      v133 = (unint64_t *)&v167->__shared_owners_;
      do
        v134 = __ldaxr(v133);
      while (__stlxr(v134 - 1, v133));
      if (!v134)
      {
        ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
        std::__shared_weak_count::__release_weak(v132);
      }
    }
    v135 = v169;
    if (v169)
    {
      v136 = (unint64_t *)&v169->__shared_owners_;
      do
        v137 = __ldaxr(v136);
      while (__stlxr(v137 - 1, v136));
      if (!v137)
      {
        ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
        std::__shared_weak_count::__release_weak(v135);
      }
    }
    ++v41;
  }
  if (v27)
    operator delete(v27);
  if (v139)
    operator delete(v139);
  if (v138)
    operator delete(v138);
LABEL_169:
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v175);
}

- (id)getFacesFromNetworkResultOriginalWidth:(float)a3 originalHeight:(float)a4
{
  void *v5;
  double v6;
  float v7;
  _QWORD *face_list;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  int tileDimension;
  float v14;
  float v15;
  float v16;
  int v17;
  float v18;
  float v19;
  float v20;
  int v21;
  EspressoFaceDetectedObject *v22;
  double v23;
  double v24;
  float v25;
  EspressoFaceDetectedObject *v26;
  void *v27;
  char v28;
  _BYTE v32[64];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EspressoDCNEspressoOverfeatDetector fillFaceList](self, "fillFaceList");
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v32, "mergeFaceList", v6);
  if (a3 <= a4)
    v7 = a4;
  else
    v7 = a3;
  -[EspressoDCNEspressoOverfeatDetector mergeFaceList](self, "mergeFaceList");
  face_list = self->face_list;
  v9 = face_list[1];
  if ((_QWORD *)v9 != face_list)
  {
    do
    {
      v10 = *(float *)(v9 + 16);
      -[EspressoFDOverfeatNetwork maxScale](self->_enet, "maxScale");
      v12 = v11;
      tileDimension = self->tileDimension;
      v14 = *(float *)(v9 + 20);
      -[EspressoFDOverfeatNetwork maxScale](self->_enet, "maxScale");
      v16 = v15;
      v17 = self->tileDimension;
      v18 = *(float *)(v9 + 24);
      -[EspressoFDOverfeatNetwork maxScale](self->_enet, "maxScale");
      v20 = v19;
      v21 = self->tileDimension;
      v22 = [EspressoFaceDetectedObject alloc];
      *(float *)&v23 = (float)(v7 * v10) / (float)(v12 * (float)tileDimension);
      *(float *)&v24 = (float)(v7 * v14) / (float)(v16 * (float)v17);
      v25 = (float)(v7 * v18) / (float)(v20 * (float)v21);
      if ((float)(*(float *)&v24 + v25) > a4)
        *(float *)&v24 = a4 - v25;
      if ((float)(*(float *)&v24 - v25) < 0.0)
        *(float *)&v24 = (float)(v7 * v18) / (float)(v20 * (float)v21);
      if ((float)(*(float *)&v23 + v25) > a3)
        *(float *)&v23 = a3 - v25;
      if ((float)(*(float *)&v23 - v25) < 0.0)
        *(float *)&v23 = (float)(v7 * v18) / (float)(v20 * (float)v21);
      v26 = -[EspressoFaceDetectedObject initWithOptionsXloc:yloc:size:confidence:](v22, "initWithOptionsXloc:yloc:size:confidence:", v23, v24);
      objc_msgSend(v5, "addObject:", v26);

      v9 = *(_QWORD *)(v9 + 8);
    }
    while ((void *)v9 != self->face_list);
  }
  +[EspressoMetalSingleton shared](EspressoMetalSingleton, "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "is_memory_tight");

  if ((v28 & 1) != 0)
    -[EspressoFDOverfeatNetwork reset](self->_enet, "reset");
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v32);
  return v5;
}

- (void)computeBBoxUsingProb:()shared_ptr<Espresso:(3>>)a3 :()shared_ptr<Espresso:(3>>)a4 :(float)a5 blob<float blob<float box:(float)a6 andScalefactor:(float)a7 padX:padY:
{
  uint64_t v7;
  __shared_weak_count *var1;
  void *var0;
  EspressoFDOverfeatNetwork *enet;
  void *v13;
  uint64_t v14;
  EspressoFDOverfeatNetwork *v15;
  void *v16;
  EspressoFDOverfeatNetwork *v17;
  void *v18;
  int v19;
  uint64_t v20;
  int v21;
  int *v22;
  int *v23;
  int *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  float v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  float v33;
  int tileSizeScaleFactor;
  int v35;
  double confidenceThreshold;
  float v37;
  float v38;
  float v39;
  float *v40;
  float *v41;
  float v42;
  BOOL v43;
  float v44;
  BOOL v47;
  float v48;
  uint64_t *face_list;
  _OWORD *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v63;
  uint64_t v64;
  void *v65[2];
  void *v66;
  uint64_t v67;
  void *v68;
  void *__p[2];

  v7 = *(_QWORD *)a3.var0;
  if (*(_QWORD *)a3.var0)
  {
    var1 = a3.var1;
    var0 = a3.var0;
    v58 = *(int *)(v7 + 8);
    v59 = *(unsigned int *)(v7 + 12);
    enet = self->_enet;
    if (enet)
    {
      -[EspressoFDOverfeatNetwork strideConfiguration](enet, "strideConfiguration");
      v13 = v66;
      v14 = v67;
      v65[1] = 0;
      if (__p[1])
        operator delete(__p[1]);
    }
    else
    {
      v13 = 0;
      v14 = 0;
      *(_OWORD *)__p = 0u;
      v68 = 0;
      *(_OWORD *)v65 = 0u;
    }
    if (v68)
      operator delete(v68);
    if (v65[1])
      operator delete(v65[1]);
    v15 = self->_enet;
    if (v15)
    {
      -[EspressoFDOverfeatNetwork strideConfiguration](v15, "strideConfiguration");
      v16 = v68;
      if (__p[1])
        operator delete(__p[1]);
    }
    else
    {
      v16 = 0;
      *(_OWORD *)__p = 0u;
      *(_OWORD *)v65 = 0u;
    }
    if (v65[1])
      operator delete(v65[1]);
    v17 = self->_enet;
    if (v17)
    {
      -[EspressoFDOverfeatNetwork strideConfiguration](v17, "strideConfiguration");
      v18 = __p[1];
    }
    else
    {
      v18 = 0;
      *(_OWORD *)v65 = 0u;
    }
    if (v65[1])
      operator delete(v65[1]);
    v53 = v16;
    v54 = v13;
    v52 = v18;
    if ((int)((unint64_t)(v14 - (_QWORD)v13) >> 2) < 1)
    {
      v29 = 0.0;
      v21 = 1;
    }
    else
    {
      v19 = 0;
      v20 = ((unint64_t)(v14 - (_QWORD)v13) >> 2);
      v21 = 1;
      v22 = (int *)v13;
      v23 = (int *)v18;
      v24 = (int *)v16;
      do
      {
        v26 = *v22++;
        v25 = v26;
        v27 = *v23++;
        v19 += (v25 / 2 - v27) * v21;
        v28 = *v24++;
        v21 *= v28;
        --v20;
      }
      while (v20);
      v29 = (float)v19;
    }
    if ((int)v59 >= 1)
    {
      v30 = 0;
      v56 = *(_QWORD *)(*(_QWORD *)var0 + 24);
      v60 = v59 * v58;
      v64 = *(_QWORD *)(*(_QWORD *)var1 + 24) + 8 * (int)v59 * (int)v58;
      v57 = 4 * v58;
      v55 = *(_QWORD *)(*(_QWORD *)var1 + 24);
      v63 = v55;
      do
      {
        if ((int)v58 >= 1)
        {
          v31 = 0;
          v32 = 0;
          do
          {
            v33 = *(float *)(v56 + 4 * v60 + v32);
            tileSizeScaleFactor = self->tileSizeScaleFactor;
            if (tileSizeScaleFactor >= 0)
              v35 = self->tileSizeScaleFactor;
            else
              v35 = tileSizeScaleFactor + 1;
            confidenceThreshold = self->_confidenceThreshold;
            if (confidenceThreshold <= v33)
            {
              v37 = *(float *)(v63 + v32);
              v38 = *(float *)(v55 + 4 * v60 + v32);
              v39 = *(float *)(v64 + v32);
              v40 = (float *)operator new();
              v41 = v40;
              v42 = confidenceThreshold + (1.0 - confidenceThreshold) * 0.33;
              v43 = v33 > v42 && v32 == 0;
              v44 = v33 + v33;
              if (!v43)
                v44 = v33;
              if (v44 > v42 && 4 * (v58 - 1) == v32)
                v44 = v44 + v44;
              if (v44 > v42 && v30 == 0)
                v44 = v44 + v44;
              v47 = v44 > v42 && v30 == (_DWORD)v59 - 1;
              v48 = v44 + v44;
              if (!v47)
                v48 = v44;
              *v40 = (float)((float)((float)(v29 - (float)((float)(v35 >> 1) - (float)(v37 * (float)tileSizeScaleFactor)))
                                   + (float)v31)
                           - a6)
                   * a5;
              v40[1] = (float)((float)((float)(v29
                                             - (float)((float)(v35 >> 1) - (float)(v38 * (float)tileSizeScaleFactor)))
                                     + (float)(v30 * v21))
                             - a7)
                     * a5;
              v40[2] = (float)(v39 * (float)tileSizeScaleFactor) * a5;
              v40[3] = v48;
              face_list = (uint64_t *)self->face_list;
              v50 = operator new(0x20uLL);
              v50[1] = *(_OWORD *)v41;
              *((_QWORD *)v50 + 1) = face_list;
              v51 = *face_list;
              *(_QWORD *)v50 = *face_list;
              *(_QWORD *)(v51 + 8) = v50;
              *face_list = (uint64_t)v50;
              ++face_list[2];
              MEMORY[0x19401CD90](v41, 0x1000C40451B5BE8);
            }
            v32 += 4;
            v31 += v21;
          }
          while (4 * v58 != v32);
        }
        ++v30;
        v64 += v57;
        v63 += v57;
        v60 += v58;
      }
      while (v30 != v59);
    }
    if (v52)
      operator delete(v52);
    if (v53)
      operator delete(v53);
    if (v54)
      operator delete(v54);
  }
}

- (void)mergeFaceList
{
  __n128 v2;
  double v3;
  double v4;
  __n128 v5;
  uint64_t *face_list;
  uint64_t v8;
  char *v9;
  float32x2_t *v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  __n128 v24;
  float *v25;
  float *v26;
  float minBoundingBoxThreshold;
  float *v28;
  uint64_t v29;
  __n128 v30;
  __int128 v31;

  face_list = (uint64_t *)self->face_list;
  v8 = face_list[1];
  if ((uint64_t *)v8 != face_list)
  {
    while (1)
    {
      v9 = 0;
      v10 = 0;
      v11 = v8;
      v12 = 1.0e12;
      do
      {
        v13 = *(_QWORD *)(v11 + 8);
        if ((uint64_t *)v13 == face_list)
          break;
        v14 = *(float *)(v11 + 16);
        v15 = *(float *)(v11 + 20);
        v16 = *(float *)(v11 + 24);
        do
        {
          v18 = *(float *)(v13 + 20);
          LODWORD(v31) = *(_DWORD *)(v13 + 16);
          v17 = *(float *)&v31;
          *((float *)&v31 + 1) = v18;
          v2.n128_u64[0] = *(_QWORD *)(v13 + 24);
          v30 = v2;
          *((_QWORD *)&v31 + 1) = v2.n128_u64[0];
          v2.n128_f32[0] = vision::DCN::boundingbox::calculate_overlap((float *)(v11 + 16), (float *)&v31);
          v5 = v30;
          v2.n128_f32[0] = v2.n128_f32[0]
                         + (float)(sqrtf((float)((float)(v15 - v18) * (float)(v15 - v18))+ (float)((float)(v14 - v17) * (float)(v14 - v17)))/ (float)(v30.n128_f32[0] + v16));
          if (v16 >= v30.n128_f32[0])
            v19 = v16;
          else
            v19 = v30.n128_f32[0];
          if (v30.n128_f32[0] >= v16)
            *(float *)&v4 = v16;
          else
            *(float *)&v4 = v30.n128_f32[0];
          *(float *)&v3 = v19 / *(float *)&v4;
          if (v2.n128_f32[0] < v12 && *(float *)&v3 < 3.0)
          {
            v10 = (float32x2_t *)v13;
            v9 = (char *)v11;
            v12 = v2.n128_f32[0];
          }
          v13 = *(_QWORD *)(v13 + 8);
        }
        while ((uint64_t *)v13 != face_list);
        v11 = *(_QWORD *)(v11 + 8);
      }
      while ((uint64_t *)v11 != face_list);
      v2.n128_u32[0] = 1062600704;
      if (v12 > 0.83594 || (unint64_t)face_list[2] < 2)
        break;
      v2 = vision::DCN::FaceList::merge_bounding_boxes(face_list, v9, v10, v2.n128_f64[0], v3, v4, v5);
      v8 = face_list[1];
      if ((uint64_t *)v8 == face_list)
        goto LABEL_26;
    }
    while ((uint64_t *)v8 != face_list)
    {
      v20 = v8;
      while (1)
      {
        v20 = *(_QWORD *)(v20 + 8);
        if ((uint64_t *)v20 == face_list)
          break;
        v31 = *(_OWORD *)(v20 + 16);
        *(float *)&v21 = vision::DCN::boundingbox::calculate_overlap((float *)(v8 + 16), (float *)&v31);
        if (*(float *)&v21 > 0.5)
        {
          vision::DCN::FaceList::merge_bounding_boxes(face_list, (char *)v8, (float32x2_t *)v20, v21, v22, v23, v24);
          v8 = face_list[1];
          goto LABEL_25;
        }
      }
      v8 = *(_QWORD *)(v8 + 8);
LABEL_25:
      ;
    }
  }
LABEL_26:
  v25 = (float *)self->face_list;
  v26 = (float *)*((_QWORD *)v25 + 1);
  if (v26 != v25)
  {
    minBoundingBoxThreshold = self->_minBoundingBoxThreshold;
    do
    {
      v28 = (float *)*((_QWORD *)v26 + 1);
      if (v26[7] < minBoundingBoxThreshold)
      {
        v29 = *(_QWORD *)v26;
        *(_QWORD *)(v29 + 8) = v28;
        **((_QWORD **)v26 + 1) = v29;
        --*((_QWORD *)v25 + 2);
        operator delete(v26);
      }
      v26 = v28;
    }
    while (v28 != v25);
  }
}

- (EspressoDCNEspressoOverfeatDetector)init
{
  EspressoDCNEspressoOverfeatDetector *v2;
  EspressoDCNEspressoOverfeatDetector *v3;
  EspressoDCNEspressoOverfeatDetector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  v2 = -[EspressoDCNEspressoOverfeatDetector init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[EspressoDCNEspressoOverfeatDetector commonInit](v2, "commonInit");
    v4 = v3;
  }

  return v3;
}

- (EspressoDCNEspressoOverfeatDetector)initWithOptions:(id)a3
{
  id v4;
  EspressoDCNEspressoOverfeatDetector *v5;
  EspressoDCNEspressoOverfeatDetector *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  EspressoDCNEspressoOverfeatDetector *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  v5 = -[EspressoDCNEspressoOverfeatDetector init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EspressoDCNEspressoOverfeatDetector commonInit](v5, "commonInit");
    objc_msgSend(v4, "objectForKey:", CFSTR("Tile Dimension"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->tileDimension = objc_msgSend(v7, "unsignedIntValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("Confidence Threshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v6->_confidenceThreshold = v9;

    objc_msgSend(v4, "objectForKey:", CFSTR("Pre training tile crop size"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v6->tileSizeScaleFactor = (int)v11;

    objc_msgSend(v4, "objectForKey:", CFSTR("Mininum bounding box threshold"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v6->_minBoundingBoxThreshold = v13;

    v14 = v6;
  }

  return v6;
}

- (EspressoDCNEspressoOverfeatDetector)initWithNetwork:(id)a3
{
  id v5;
  EspressoDCNEspressoOverfeatDetector *v6;
  EspressoDCNEspressoOverfeatDetector *v7;
  EspressoDCNEspressoOverfeatDetector *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  v6 = -[EspressoDCNEspressoOverfeatDetector init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_enet, a3);
    -[EspressoDCNEspressoOverfeatDetector commonInit](v7, "commonInit");
    v8 = v7;
  }

  return v7;
}

- (void)commonInit
{
  _QWORD *v3;

  *(_OWORD *)&self->_confidenceThreshold = xmmword_191A936A0;
  *(_QWORD *)&self->tileSizeScaleFactor = 0x1C00000020;
  self->localFaceMerging = 1;
  v3 = (_QWORD *)operator new();
  *v3 = v3;
  v3[1] = v3;
  v3[2] = 0;
  self->face_list = v3;
}

- (double)compareObject:(id)a3 withObject:(id)a4 error:(id *)a5
{
  if (*a5)
    *a5 = 0;
  return 1.79769313e308;
}

- (id)getDescription
{
  return CFSTR("DCNEspressoOverfeatDetector");
}

- (void)dealloc
{
  void *face_list;
  objc_super v4;

  face_list = self->face_list;
  if (face_list)
  {
    std::__list_imp<int>::clear((_QWORD *)self->face_list);
    MEMORY[0x19401CD90](face_list, 0x1020C4062D53EE8);
  }
  self->face_list = 0;
  v4.receiver = self;
  v4.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  -[EspressoDCNEspressoOverfeatDetector dealloc](&v4, sel_dealloc);
}

- (EspressoFDOverfeatNetwork)enet
{
  return self->_enet;
}

- (void)setEnet:(id)a3
{
  objc_storeStrong((id *)&self->_enet, a3);
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (double)minBoundingBoxThreshold
{
  return self->_minBoundingBoxThreshold;
}

- (void)setMinBoundingBoxThreshold:(double)a3
{
  self->_minBoundingBoxThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enet, 0);
}

@end
