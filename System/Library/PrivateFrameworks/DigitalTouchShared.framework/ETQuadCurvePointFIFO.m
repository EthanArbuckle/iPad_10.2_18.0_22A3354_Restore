@implementation ETQuadCurvePointFIFO

- (ETQuadCurvePointFIFO)initWithFIFO:(id)a3
{
  ETQuadCurvePointFIFO *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ETQuadCurvePointFIFO;
  result = -[ETPointFIFO initWithFIFO:](&v4, sel_initWithFIFO_, a3);
  if (result)
  {
    result->_unitSize = 1.0;
    result->_emitInterpolatedPoints = 1;
  }
  return result;
}

- (void)addPoints:(ETQuadCurvePointFIFO *)self count:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_prevPoints;
  unint64_t v9;
  unint64_t v10;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v11;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v19;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v20;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v21;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v22;
  float32x2_t *v23;
  uint64_t v24;
  float32x2_t v25;
  float32x2_t v26;
  uint64_t v27;
  float32x2_t v28;
  objc_class *v29;
  char *v30;
  float32x2_t *v31;
  float32x2_t v32;
  int32x2_t v33;
  float32x2_t v34;
  int32x2_t v35;
  float v36;
  int v37;
  _QWORD *v38;
  float v39;
  float v40;
  float32x2_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  float32x2_t *v47;
  char *v48;
  char *v49;
  float32x2_t v50;
  uint64_t v51;
  void **v52;
  ETPointFIFO *v53;
  unint64_t v54;
  ETPointFIFO **p_nextFIFO;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  char *v61;
  char *v62;
  _QWORD *v63;
  uint64_t v64;
  float32x2_t v65;
  float32x2_t v66;
  unint64_t v67;
  float32x2_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  float32x2_t *v73;
  char *v74;
  char *v75;
  float32x2_t *v76;
  float32x2_t v77;
  float32x2_t v78;
  unint64_t v79;
  float32x2_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  float32x2_t *v86;
  char *v87;
  char *v88;
  float32x2_t v89;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_controlPoints;
  Class isa;
  ETPointFIFO *nextFIFO;
  objc_class *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v99;
  Class v100;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v101;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v102;
  void (**emissionHandler)(void);
  unsigned __int8 *v104;
  uint64_t v105;

  if (v3)
  {
    v4 = v3;
    v5 = v2;
    v7 = 0;
    p_prevPoints = &self->_prevPoints;
    v104 = &self->_anon_30[8];
    v105 = v3;
    v9 = 0x255C18000uLL;
    v10 = 0x255C18000uLL;
    do
    {
      var0 = p_prevPoints[1].var0;
      v11 = p_prevPoints[2].var0;
      if (var0 >= v11)
      {
        v14 = var0 - p_prevPoints->var0;
        if ((unint64_t)(v14 + 1) >> 61)
          _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
        v15 = (char *)v11 - (char *)p_prevPoints->var0;
        v16 = v15 >> 2;
        if (v15 >> 2 <= (unint64_t)(v14 + 1))
          v16 = v14 + 1;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v16;
        if (v17)
          v18 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)v104, v17);
        else
          v18 = 0;
        v19 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v18[8 * v14];
        *v19 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)(v5 + 8 * v7);
        v13 = v19 + 1;
        v21 = p_prevPoints->var0;
        v20 = p_prevPoints[1].var0;
        if (v20 != p_prevPoints->var0)
        {
          do
          {
            v22 = *--v20;
            *--v19 = v22;
          }
          while (v20 != v21);
          v20 = p_prevPoints->var0;
        }
        p_prevPoints->var0 = v19;
        p_prevPoints[1].var0 = v13;
        p_prevPoints[2].var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v18[8 * v17];
        if (v20)
          operator delete(v20);
      }
      else
      {
        *var0 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)(v5 + 8 * v7);
        v13 = var0 + 1;
      }
      p_prevPoints[1].var0 = v13;
      v23 = (float32x2_t *)p_prevPoints->var0;
      v24 = v13 - p_prevPoints->var0;
      if (v24 == 1)
      {
        v51 = *(int *)(v9 + 3436);
        v52 = (void **)((char *)&self->super.super.isa + v51);
        v53 = *(ETPointFIFO **)((char *)&self->super.super.isa + v51);
        *(ETPointFIFO **)((char *)&self->super._nextFIFO + v51) = v53;
        v54 = *(_QWORD *)(&self->_emitInterpolatedPoints + v51);
        if ((unint64_t)v53 >= v54)
        {
          v56 = v54 - (_QWORD)v53;
          v57 = v56 >> 2;
          if ((unint64_t)(v56 >> 2) <= 1)
            v57 = 1;
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8)
            v58 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v58 = v57;
          v60 = _ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(&self->_emitInterpolatedPoints + v51), v58);
          *v60 = *(_QWORD *)(v5 + 8 * v7);
          p_nextFIFO = (ETPointFIFO **)(v60 + 1);
          v62 = (char *)*v52;
          v61 = (char *)v52[1];
          v63 = v60;
          if (v61 != *v52)
          {
            do
            {
              v64 = *((_QWORD *)v61 - 1);
              v61 -= 8;
              *--v63 = v64;
            }
            while (v61 != v62);
            v61 = (char *)*v52;
          }
          *v52 = v63;
          v52[1] = p_nextFIFO;
          v52[2] = &v60[v59];
          if (v61)
            operator delete(v61);
        }
        else
        {
          v53->super.isa = *(Class *)(v5 + 8 * v7);
          p_nextFIFO = &v53->_nextFIFO;
        }
        v52[1] = p_nextFIFO;
        *(Class *)((char *)&self->super.super.isa + *(int *)(v10 + 3440)) = *(Class *)(v5 + 8 * v7);
      }
      else if (v24 == 3)
      {
        v25 = v23[1];
        v26 = v23[2];
        v27 = *(int *)(v10 + 3440);
        v28 = *(float32x2_t *)((char *)&self->super.super.isa + v27);
        if (v13 != (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v23[1])
          memmove(p_prevPoints->var0, &v23[1], (char *)v13 - (char *)&v23[1]);
        v29 = (objc_class *)vmla_f32(v25, (float32x2_t)0x3F0000003F000000, vsub_f32(v26, v25));
        p_prevPoints[1].var0 = v13 - 1;
        v30 = (char *)self + *(int *)(v9 + 3436);
        v31 = *(float32x2_t **)v30;
        *((_QWORD *)v30 + 1) = *(_QWORD *)v30;
        if (self->_emitInterpolatedPoints)
        {
          v32 = vsub_f32(v28, v25);
          v33 = (int32x2_t)vmul_f32(v32, v32);
          v34 = vsub_f32(v25, (float32x2_t)v29);
          v35 = (int32x2_t)vmul_f32(v34, v34);
          v36 = vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v33, v35), (float32x2_t)vzip2_s32(v33, v35))))
              / self->_unitSize;
          if (v36 > 0.0)
          {
            v37 = 0;
            v38 = v30 + 16;
            v39 = 0.0;
            do
            {
              v40 = v39 / v36;
              v41 = vmla_n_f32(vmla_n_f32(vmul_n_f32(v25, v40 * (float)((float)(1.0 - v40) + (float)(1.0 - v40))), v28, (float)(1.0 - v40) * (float)(1.0 - v40)), (float32x2_t)v29, v40 * v40);
              if ((unint64_t)v31 >= *v38)
              {
                v42 = ((uint64_t)v31 - *(_QWORD *)v30) >> 3;
                if ((unint64_t)(v42 + 1) >> 61)
                  goto LABEL_108;
                v43 = *v38 - *(_QWORD *)v30;
                v44 = v43 >> 2;
                if (v43 >> 2 <= (unint64_t)(v42 + 1))
                  v44 = v42 + 1;
                if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8)
                  v45 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v45 = v44;
                if (v45)
                  v46 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v30 + 16), v45);
                else
                  v46 = 0;
                v47 = (float32x2_t *)&v46[8 * v42];
                *v47 = v41;
                v31 = v47 + 1;
                v49 = *(char **)v30;
                v48 = (char *)*((_QWORD *)v30 + 1);
                if (v48 != *(char **)v30)
                {
                  do
                  {
                    v50 = *(float32x2_t *)(v48 - 8);
                    v48 -= 8;
                    v47[-1] = v50;
                    --v47;
                  }
                  while (v48 != v49);
                  v48 = *(char **)v30;
                }
                *(_QWORD *)v30 = v47;
                *((_QWORD *)v30 + 1) = v31;
                *((_QWORD *)v30 + 2) = &v46[8 * v45];
                if (v48)
                  operator delete(v48);
              }
              else
              {
                *v31++ = v41;
              }
              *((_QWORD *)v30 + 1) = v31;
              v39 = (float)++v37;
            }
            while (v36 > (float)v37);
          }
        }
        else
        {
          v65 = vmul_f32(v25, 0);
          v66 = vmla_f32(vadd_f32(v65, v28), 0, (float32x2_t)v29);
          v67 = *((_QWORD *)v30 + 2);
          if ((unint64_t)v31 >= v67)
          {
            v69 = v67 - (_QWORD)v31;
            v70 = v69 >> 2;
            if ((unint64_t)(v69 >> 2) <= 1)
              v70 = 1;
            if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
              v71 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v71 = v70;
            v73 = (float32x2_t *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v30 + 16), v71);
            *v73 = v66;
            v68 = v73 + 1;
            v75 = *(char **)v30;
            v74 = (char *)*((_QWORD *)v30 + 1);
            v76 = v73;
            if (v74 != *(char **)v30)
            {
              do
              {
                v77 = *(float32x2_t *)(v74 - 8);
                v74 -= 8;
                v76[-1] = v77;
                --v76;
              }
              while (v74 != v75);
              v74 = *(char **)v30;
            }
            *(_QWORD *)v30 = v76;
            *((_QWORD *)v30 + 1) = v68;
            *((_QWORD *)v30 + 2) = &v73[v72];
            if (v74)
              operator delete(v74);
          }
          else
          {
            *v31 = v66;
            v68 = v31 + 1;
          }
          *((_QWORD *)v30 + 1) = v68;
          v78 = vadd_f32((float32x2_t)v29, vmla_f32(v65, 0, v28));
          v79 = *((_QWORD *)v30 + 2);
          if ((unint64_t)v68 >= v79)
          {
            v81 = ((uint64_t)v68 - *(_QWORD *)v30) >> 3;
            if ((unint64_t)(v81 + 1) >> 61)
              goto LABEL_108;
            v82 = v79 - *(_QWORD *)v30;
            v83 = v82 >> 2;
            if (v82 >> 2 <= (unint64_t)(v81 + 1))
              v83 = v81 + 1;
            if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8)
              v84 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v84 = v83;
            if (v84)
              v85 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v30 + 16), v84);
            else
              v85 = 0;
            v86 = (float32x2_t *)&v85[8 * v81];
            *v86 = v78;
            v80 = v86 + 1;
            v88 = *(char **)v30;
            v87 = (char *)*((_QWORD *)v30 + 1);
            if (v87 != *(char **)v30)
            {
              do
              {
                v89 = *(float32x2_t *)(v87 - 8);
                v87 -= 8;
                v86[-1] = v89;
                --v86;
              }
              while (v87 != v88);
              v87 = *(char **)v30;
            }
            *(_QWORD *)v30 = v86;
            *((_QWORD *)v30 + 1) = v80;
            *((_QWORD *)v30 + 2) = &v85[8 * v84];
            if (v87)
              operator delete(v87);
          }
          else
          {
            *v68 = v78;
            v80 = v68 + 1;
          }
          *((_QWORD *)v30 + 1) = v80;
        }
        p_controlPoints = &self->_controlPoints;
        isa = self[1].super.super.isa;
        nextFIFO = self[1].super._nextFIFO;
        if (isa >= (Class)nextFIFO)
        {
          v94 = (isa - (Class)p_controlPoints->var0) >> 3;
          if ((unint64_t)(v94 + 1) >> 61)
LABEL_108:
            _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
          v95 = (char *)nextFIFO - (char *)p_controlPoints->var0;
          v96 = v95 >> 2;
          if (v95 >> 2 <= (unint64_t)(v94 + 1))
            v96 = v94 + 1;
          if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFF8)
            v97 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v97 = v96;
          if (v97)
            v98 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self[1].super._nextFIFO, v97);
          else
            v98 = 0;
          v9 = 0x255C18000;
          v99 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v98[8 * v94];
          *v99 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v25;
          v93 = (objc_class *)(v99 + 1);
          v101 = p_controlPoints->var0;
          v100 = self[1].super.super.isa;
          if (v100 != (Class)p_controlPoints->var0)
          {
            do
            {
              v102 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)*((_QWORD *)v100 - 1);
              v100 = (Class)((char *)v100 - 8);
              *--v99 = v102;
            }
            while (v100 != (Class)v101);
            v100 = (Class)p_controlPoints->var0;
          }
          p_controlPoints->var0 = v99;
          self[1].super.super.isa = v93;
          self[1].super._nextFIFO = (ETPointFIFO *)&v98[8 * v97];
          if (v100)
            operator delete(v100);
        }
        else
        {
          *(float32x2_t *)isa = v25;
          v93 = (Class)((char *)isa + 8);
          v9 = 0x255C18000;
        }
        self[1].super.super.isa = v93;
        *(Class *)((char *)&self->super.super.isa + v27) = v29;
        v4 = v105;
        v10 = 0x255C18000;
      }
      emissionHandler = (void (**)(void))self->_emissionHandler;
      if (emissionHandler)
        emissionHandler[2]();
      -[ETPointFIFO emitPoints:count:](self, "emitPoints:count:");
      ++v7;
    }
    while (v7 != v4);
  }
}

- (void)flush
{
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_prevPoints;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_points;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  float32x2_t v10;
  float32x2_t v11;
  float v12;
  int v13;
  unsigned __int8 *v14;
  float v15;
  float v16;
  float32x2_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v23;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v24;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v25;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v26;
  float32x2_t v27;
  float32x2_t v28;
  unint64_t v29;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v34;
  uint64_t v35;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v36;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v37;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v38;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v39;
  float32x2_t v40;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v41;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v48;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v49;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v50;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v51;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v52;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_controlPoints;
  Class isa;
  ETPointFIFO *nextFIFO;
  objc_class *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v62;
  ETPointFIFO *v63;
  Class v64;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v65;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v66;
  void (**emissionHandler)(void);
  objc_super v68;
  float32x2_t v69;

  v69 = 0;
  p_prevPoints = &self->_prevPoints;
  v4 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_30;
  if (v4 != self->_prevPoints.var0)
  {
    v5 = *(float32x2_t *)self->_lastPoint;
    v6 = (float32x2_t)*(v4 - 1);
    v7 = vmla_f32(v5, (float32x2_t)0x3F0000003F000000, vsub_f32(v6, v5));
    p_points = &self->_points;
    var0 = self->_points.var0;
    *(_QWORD *)self->_anon_48 = var0;
    if (self->_emitInterpolatedPoints)
    {
      v10 = vsub_f32(v5, v7);
      v11 = vsub_f32(v7, v6);
      v12 = (float)(sqrtf(vaddv_f32(vmul_f32(v10, v10))) + sqrtf(vaddv_f32(vmul_f32(v11, v11)))) / self->_unitSize;
      if (v12 > 0.0)
      {
        v13 = 0;
        v14 = &self->_anon_48[8];
        v15 = 0.0;
        do
        {
          v16 = v15 / v12;
          v17 = vmla_n_f32(vmla_n_f32(vmul_n_f32(v7, v16 * (float)((float)(1.0 - v16) + (float)(1.0 - v16))), v5, (float)(1.0 - v16) * (float)(1.0 - v16)), v6, v16 * v16);
          if ((unint64_t)var0 >= *(_QWORD *)v14)
          {
            v18 = var0 - p_points->var0;
            if ((unint64_t)(v18 + 1) >> 61)
              goto LABEL_72;
            v19 = *(_QWORD *)v14 - (unint64_t)p_points->var0;
            v20 = v19 >> 2;
            if (v19 >> 2 <= (unint64_t)(v18 + 1))
              v20 = v18 + 1;
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
              v21 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v21 = v20;
            if (v21)
              v22 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&p_points[2], v21);
            else
              v22 = 0;
            v23 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v22[8 * v18];
            *v23 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v17;
            var0 = v23 + 1;
            v25 = p_points->var0;
            v24 = p_points[1].var0;
            if (v24 != p_points->var0)
            {
              do
              {
                v26 = *--v24;
                *--v23 = v26;
              }
              while (v24 != v25);
              v24 = p_points->var0;
            }
            p_points->var0 = v23;
            p_points[1].var0 = var0;
            p_points[2].var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v22[8 * v21];
            if (v24)
              operator delete(v24);
          }
          else
          {
            *var0++ = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v17;
          }
          p_points[1].var0 = var0;
          v15 = (float)++v13;
        }
        while (v12 > (float)v13);
      }
    }
    else
    {
      v27 = vmul_f32(v7, 0);
      v28 = vmla_f32(vadd_f32(v5, v27), 0, v6);
      v29 = *(_QWORD *)&self->_anon_48[8];
      if ((unint64_t)var0 >= v29)
      {
        v31 = v29 - (_QWORD)var0;
        v32 = v31 >> 2;
        if ((unint64_t)(v31 >> 2) <= 1)
          v32 = 1;
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
          v33 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v33 = v32;
        v34 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_48[8], v33);
        v36 = &v34[v35];
        *v34 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v28;
        v30 = v34 + 1;
        v38 = p_points->var0;
        v37 = p_points[1].var0;
        if (v37 != p_points->var0)
        {
          do
          {
            v39 = *--v37;
            *--v34 = v39;
          }
          while (v37 != v38);
          v37 = p_points->var0;
        }
        p_points->var0 = v34;
        p_points[1].var0 = v30;
        p_points[2].var0 = v36;
        if (v37)
          operator delete(v37);
      }
      else
      {
        *var0 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v28;
        v30 = var0 + 1;
      }
      p_points[1].var0 = v30;
      v40 = vadd_f32(v6, vmla_f32(v27, 0, v5));
      v41 = p_points[2].var0;
      if (v30 >= v41)
      {
        v43 = v30 - p_points->var0;
        if ((unint64_t)(v43 + 1) >> 61)
          goto LABEL_72;
        v44 = (char *)v41 - (char *)p_points->var0;
        v45 = v44 >> 2;
        if (v44 >> 2 <= (unint64_t)(v43 + 1))
          v45 = v43 + 1;
        if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
          v46 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v46 = v45;
        if (v46)
          v47 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&p_points[2], v46);
        else
          v47 = 0;
        v48 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v47[8 * v43];
        v49 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v47[8 * v46];
        *v48 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v40;
        v42 = v48 + 1;
        v51 = p_points->var0;
        v50 = p_points[1].var0;
        if (v50 != p_points->var0)
        {
          do
          {
            v52 = *--v50;
            *--v48 = v52;
          }
          while (v50 != v51);
          v50 = p_points->var0;
        }
        p_points->var0 = v48;
        p_points[1].var0 = v42;
        p_points[2].var0 = v49;
        if (v50)
          operator delete(v50);
      }
      else
      {
        *v30 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v40;
        v42 = v30 + 1;
      }
      p_points[1].var0 = v42;
    }
    p_controlPoints = &self->_controlPoints;
    isa = self[1].super.super.isa;
    nextFIFO = self[1].super._nextFIFO;
    if (isa < (Class)nextFIFO)
    {
      *(float32x2_t *)isa = v7;
      v56 = (Class)((char *)isa + 8);
LABEL_68:
      self[1].super.super.isa = v56;
      v69 = v7;
      goto LABEL_69;
    }
    v57 = (isa - (Class)p_controlPoints->var0) >> 3;
    if (!((unint64_t)(v57 + 1) >> 61))
    {
      v58 = (char *)nextFIFO - (char *)p_controlPoints->var0;
      v59 = v58 >> 2;
      if (v58 >> 2 <= (unint64_t)(v57 + 1))
        v59 = v57 + 1;
      if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8)
        v60 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v60 = v59;
      if (v60)
        v61 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self[1].super._nextFIFO, v60);
      else
        v61 = 0;
      v62 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v61[8 * v57];
      v63 = (ETPointFIFO *)&v61[8 * v60];
      *v62 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v7;
      v56 = (objc_class *)(v62 + 1);
      v65 = p_controlPoints->var0;
      v64 = self[1].super.super.isa;
      if (v64 != (Class)p_controlPoints->var0)
      {
        do
        {
          v66 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)*((_QWORD *)v64 - 1);
          v64 = (Class)((char *)v64 - 8);
          *--v62 = v66;
        }
        while (v64 != (Class)v65);
        v64 = (Class)p_controlPoints->var0;
      }
      p_controlPoints->var0 = v62;
      self[1].super.super.isa = v56;
      self[1].super._nextFIFO = v63;
      if (v64)
        operator delete(v64);
      goto LABEL_68;
    }
LABEL_72:
    _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
  }
LABEL_69:
  emissionHandler = (void (**)(void))self->_emissionHandler;
  if (emissionHandler)
    emissionHandler[2]();
  -[ETPointFIFO emitPoints:count:](self, "emitPoints:count:");
  p_prevPoints[1].var0 = p_prevPoints->var0;
  v68.receiver = self;
  v68.super_class = (Class)ETQuadCurvePointFIFO;
  -[ETPointFIFO flush](&v68, sel_flush);
}

- (void)clear
{
  objc_super v2;

  *(_QWORD *)self->_anon_30 = self->_prevPoints.var0;
  *(_QWORD *)self->_anon_48 = self->_points.var0;
  v2.receiver = self;
  v2.super_class = (Class)ETQuadCurvePointFIFO;
  -[ETPointFIFO clear](&v2, sel_clear);
}

- (float)unitSize
{
  return self->_unitSize;
}

- (void)setUnitSize:(float)a3
{
  self->_unitSize = a3;
}

- (BOOL)emitInterpolatedPoints
{
  return self->_emitInterpolatedPoints;
}

- (void)setEmitInterpolatedPoints:(BOOL)a3
{
  self->_emitInterpolatedPoints = a3;
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEmissionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (vector<float)prevPoints
{
  _QWORD *v2;

  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_prevPoints.var0, *(_QWORD *)self->_anon_30, (uint64_t)(*(_QWORD *)self->_anon_30 - (unint64_t)self->_prevPoints.var0) >> 3);
}

- (void)setPrevPoints:(vector<float)__attribute__((ext_vector_type(2
{
  char *p_prevPoints;

  p_prevPoints = (char *)&self->_prevPoints;
  if (p_prevPoints != (char *)a3.var0)
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_prevPoints, *(char **)a3.var0, *((_QWORD *)a3.var0 + 1), (uint64_t)(*((_QWORD *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
}

- (vector<float)points
{
  _QWORD *v2;

  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_points.var0, *(_QWORD *)self->_anon_48, (uint64_t)(*(_QWORD *)self->_anon_48 - (unint64_t)self->_points.var0) >> 3);
}

- (void)setPoints:(vector<float)__attribute__((ext_vector_type(2
{
  char *p_points;

  p_points = (char *)&self->_points;
  if (p_points != (char *)a3.var0)
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_points, *(char **)a3.var0, *((_QWORD *)a3.var0 + 1), (uint64_t)(*((_QWORD *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
}

- (vector<float)controlPoints
{
  _QWORD *v2;

  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_controlPoints.var0, (uint64_t)self[1].super.super.isa, (self[1].super.super.isa - (Class)self->_controlPoints.var0) >> 3);
}

- (void)setControlPoints:(vector<float)__attribute__((ext_vector_type(2
{
  char *p_controlPoints;

  p_controlPoints = (char *)&self->_controlPoints;
  if (p_controlPoints != (char *)a3.var0)
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_controlPoints, *(char **)a3.var0, *((_QWORD *)a3.var0 + 1), (uint64_t)(*((_QWORD *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
}

- (double)lastPoint
{
  return *(double *)(a1 + 32);
}

- (void)setLastPoint:(ETQuadCurvePointFIFO *)self
{
  uint64_t v2;

  *(_QWORD *)self->_lastPoint = v2;
}

- (void).cxx_destruct
{
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_controlPoints;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v5;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v6;

  p_controlPoints = &self->_controlPoints;
  var0 = self->_controlPoints.var0;
  if (var0)
  {
    p_controlPoints[1].var0 = var0;
    operator delete(var0);
  }
  v5 = self->_points.var0;
  if (v5)
  {
    *(_QWORD *)self->_anon_48 = v5;
    operator delete(v5);
  }
  v6 = self->_prevPoints.var0;
  if (v6)
  {
    *(_QWORD *)self->_anon_30 = v6;
    operator delete(v6);
  }
  objc_storeStrong(&self->_emissionHandler, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
