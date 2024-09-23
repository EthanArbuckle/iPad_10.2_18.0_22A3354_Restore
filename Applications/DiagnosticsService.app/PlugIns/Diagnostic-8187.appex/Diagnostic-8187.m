uint64_t sub_100001718(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_100001748(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void createCubeFace(void **a1, int8x16_t **a2, __n128 **a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, __n128 a9, char a10, int a11)
{
  float32x4_t v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  float32x4_t *v18;
  float32x4_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  float32x4_t *v25;
  char *v26;
  float32x4_t *v27;
  float32x4_t *v28;
  float32x4_t v29;
  unint64_t v30;
  float32x4_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  float32x4_t *v37;
  char *v38;
  float32x4_t *v39;
  float32x4_t *v40;
  float32x4_t v41;
  unint64_t v42;
  float32x4_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  float32x4_t *v49;
  char *v50;
  float32x4_t *v51;
  float32x4_t *v52;
  float32x4_t v53;
  unint64_t v54;
  float32x4_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  float32x4_t *v61;
  char *v62;
  float32x4_t *v63;
  float32x4_t *v64;
  float32x4_t v65;
  unint64_t v66;
  float32x4_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  float32x4_t *v73;
  char *v74;
  float32x4_t *v75;
  float32x4_t *v76;
  float32x4_t v77;
  unint64_t v78;
  float32x4_t v79;
  _OWORD *f32;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  float32x4_t *v86;
  char *v87;
  float32x4_t *v88;
  char *v89;
  float32x4_t v90;
  int v91;
  float32x4_t v92;
  int32x4_t v93;
  float32x2_t v94;
  float32x2_t v95;
  float32x4_t v96;
  int32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  int32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  int32x4_t v104;
  float32x2_t v105;
  float32x2_t v106;
  float32x4_t v107;
  int32x4_t v108;
  float32x4_t v109;
  int8x16_t v110;
  _QWORD *v111;
  int8x16_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  int8x16_t *v118;
  char *v119;
  char *v120;
  int8x16_t v121;
  int i;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  int8x16_t *v128;
  char *v129;
  char *v130;
  int8x16_t v131;
  int v132;
  _QWORD *v133;
  __n128 *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char *v139;
  __n128 *v140;
  __n128 *v141;
  __n128 *v142;
  __n128 v143;
  unint64_t v144;
  _DWORD *v145;
  char v146;
  char v147;
  uint64_t v148;
  _DWORD *v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  unint64_t v153;
  char *v154;
  char *v155;
  int v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v160;
  int8x16_t v161;
  float32x4_t v162;
  int8x16_t v163;

  v14 = *(float32x4_t *)(a4 + 16 * a5);
  v158 = *(float32x4_t *)(a4 + 16 * a6);
  v160 = *(float32x4_t *)(a4 + 16 * a7);
  v162 = v14;
  v157 = *(float32x4_t *)(a4 + 16 * a8);
  if (a10)
    v15 = -1;
  else
    v15 = 0;
  v17 = (uint64_t)(a1 + 2);
  v16 = (unint64_t)a1[2];
  v18 = (float32x4_t *)a1[1];
  if ((unint64_t)v18 >= v16)
  {
    v20 = ((char *)v18 - (_BYTE *)*a1) >> 4;
    if ((unint64_t)(v20 + 1) >> 60)
      goto LABEL_180;
    v21 = v16 - (_QWORD)*a1;
    v22 = v21 >> 3;
    if (v21 >> 3 <= (unint64_t)(v20 + 1))
      v22 = v20 + 1;
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
      v23 = 0xFFFFFFFFFFFFFFFLL;
    else
      v23 = v22;
    if (v23)
    {
      v24 = (char *)sub_100002378((uint64_t)(a1 + 2), v23);
      v14 = v162;
    }
    else
    {
      v24 = 0;
    }
    v25 = (float32x4_t *)&v24[16 * v20];
    v26 = &v24[16 * v23];
    *v25 = v14;
    v19 = v25 + 1;
    v28 = (float32x4_t *)*a1;
    v27 = (float32x4_t *)a1[1];
    if (v27 != *a1)
    {
      do
      {
        v29 = v27[-1];
        --v27;
        v25[-1] = v29;
        --v25;
      }
      while (v27 != v28);
      v27 = (float32x4_t *)*a1;
    }
    *a1 = v25;
    a1[1] = v19;
    a1[2] = v26;
    if (v27)
    {
      operator delete(v27);
      v14 = v162;
    }
  }
  else
  {
    *v18 = v14;
    v19 = v18 + 1;
  }
  a1[1] = v19;
  v30 = (unint64_t)a1[2];
  if ((unint64_t)v19 >= v30)
  {
    v32 = ((char *)v19 - (_BYTE *)*a1) >> 4;
    if ((unint64_t)(v32 + 1) >> 60)
      goto LABEL_180;
    v33 = v30 - (_QWORD)*a1;
    v34 = v33 >> 3;
    if (v33 >> 3 <= (unint64_t)(v32 + 1))
      v34 = v32 + 1;
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0)
      v35 = 0xFFFFFFFFFFFFFFFLL;
    else
      v35 = v34;
    if (v35)
      v36 = (char *)sub_100002378(v17, v35);
    else
      v36 = 0;
    v37 = (float32x4_t *)&v36[16 * v32];
    v38 = &v36[16 * v35];
    *v37 = v158;
    v31 = v37 + 1;
    v40 = (float32x4_t *)*a1;
    v39 = (float32x4_t *)a1[1];
    if (v39 != *a1)
    {
      do
      {
        v41 = v39[-1];
        --v39;
        v37[-1] = v41;
        --v37;
      }
      while (v39 != v40);
      v39 = (float32x4_t *)*a1;
    }
    *a1 = v37;
    a1[1] = v31;
    a1[2] = v38;
    if (v39)
      operator delete(v39);
    v14 = v162;
  }
  else
  {
    *v19 = v158;
    v31 = v19 + 1;
  }
  a1[1] = v31;
  v42 = (unint64_t)a1[2];
  if ((unint64_t)v31 >= v42)
  {
    v44 = ((char *)v31 - (_BYTE *)*a1) >> 4;
    if ((unint64_t)(v44 + 1) >> 60)
      goto LABEL_180;
    v45 = v42 - (_QWORD)*a1;
    v46 = v45 >> 3;
    if (v45 >> 3 <= (unint64_t)(v44 + 1))
      v46 = v44 + 1;
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF0)
      v47 = 0xFFFFFFFFFFFFFFFLL;
    else
      v47 = v46;
    if (v47)
      v48 = (char *)sub_100002378(v17, v47);
    else
      v48 = 0;
    v49 = (float32x4_t *)&v48[16 * v44];
    v50 = &v48[16 * v47];
    *v49 = v160;
    v43 = v49 + 1;
    v52 = (float32x4_t *)*a1;
    v51 = (float32x4_t *)a1[1];
    if (v51 != *a1)
    {
      do
      {
        v53 = v51[-1];
        --v51;
        v49[-1] = v53;
        --v49;
      }
      while (v51 != v52);
      v51 = (float32x4_t *)*a1;
    }
    *a1 = v49;
    a1[1] = v43;
    a1[2] = v50;
    if (v51)
      operator delete(v51);
    v14 = v162;
  }
  else
  {
    *v31 = v160;
    v43 = v31 + 1;
  }
  a1[1] = v43;
  v54 = (unint64_t)a1[2];
  if ((unint64_t)v43 >= v54)
  {
    v56 = ((char *)v43 - (_BYTE *)*a1) >> 4;
    if ((unint64_t)(v56 + 1) >> 60)
      goto LABEL_180;
    v57 = v54 - (_QWORD)*a1;
    v58 = v57 >> 3;
    if (v57 >> 3 <= (unint64_t)(v56 + 1))
      v58 = v56 + 1;
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF0)
      v59 = 0xFFFFFFFFFFFFFFFLL;
    else
      v59 = v58;
    if (v59)
    {
      v60 = (char *)sub_100002378(v17, v59);
      v14 = v162;
    }
    else
    {
      v60 = 0;
    }
    v61 = (float32x4_t *)&v60[16 * v56];
    v62 = &v60[16 * v59];
    *v61 = v14;
    v55 = v61 + 1;
    v64 = (float32x4_t *)*a1;
    v63 = (float32x4_t *)a1[1];
    if (v63 != *a1)
    {
      do
      {
        v65 = v63[-1];
        --v63;
        v61[-1] = v65;
        --v61;
      }
      while (v63 != v64);
      v63 = (float32x4_t *)*a1;
    }
    *a1 = v61;
    a1[1] = v55;
    a1[2] = v62;
    if (v63)
    {
      operator delete(v63);
      v14 = v162;
    }
  }
  else
  {
    *v43 = v14;
    v55 = v43 + 1;
  }
  a1[1] = v55;
  v66 = (unint64_t)a1[2];
  if ((unint64_t)v55 >= v66)
  {
    v68 = ((char *)v55 - (_BYTE *)*a1) >> 4;
    if ((unint64_t)(v68 + 1) >> 60)
      goto LABEL_180;
    v69 = v66 - (_QWORD)*a1;
    v70 = v69 >> 3;
    if (v69 >> 3 <= (unint64_t)(v68 + 1))
      v70 = v68 + 1;
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0)
      v71 = 0xFFFFFFFFFFFFFFFLL;
    else
      v71 = v70;
    if (v71)
      v72 = (char *)sub_100002378(v17, v71);
    else
      v72 = 0;
    v73 = (float32x4_t *)&v72[16 * v68];
    v74 = &v72[16 * v71];
    *v73 = v160;
    v67 = v73 + 1;
    v76 = (float32x4_t *)*a1;
    v75 = (float32x4_t *)a1[1];
    if (v75 != *a1)
    {
      do
      {
        v77 = v75[-1];
        --v75;
        v73[-1] = v77;
        --v73;
      }
      while (v75 != v76);
      v75 = (float32x4_t *)*a1;
    }
    *a1 = v73;
    a1[1] = v67;
    a1[2] = v74;
    if (v75)
      operator delete(v75);
    v14 = v162;
  }
  else
  {
    *v55 = v160;
    v67 = v55 + 1;
  }
  a1[1] = v67;
  v78 = (unint64_t)a1[2];
  if ((unint64_t)v67 >= v78)
  {
    v81 = ((char *)v67 - (_BYTE *)*a1) >> 4;
    if (!((unint64_t)(v81 + 1) >> 60))
    {
      v82 = v78 - (_QWORD)*a1;
      v83 = v82 >> 3;
      if (v82 >> 3 <= (unint64_t)(v81 + 1))
        v83 = v81 + 1;
      if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0)
        v84 = 0xFFFFFFFFFFFFFFFLL;
      else
        v84 = v83;
      if (v84)
        v85 = (char *)sub_100002378(v17, v84);
      else
        v85 = 0;
      v86 = (float32x4_t *)&v85[16 * v81];
      v87 = &v85[16 * v84];
      *v86 = v157;
      f32 = (_OWORD *)v86[1].f32;
      v89 = (char *)*a1;
      v88 = (float32x4_t *)a1[1];
      if (v88 != *a1)
      {
        do
        {
          v90 = v88[-1];
          --v88;
          v86[-1] = v90;
          --v86;
        }
        while (v88 != (float32x4_t *)v89);
        v88 = (float32x4_t *)*a1;
      }
      *a1 = v86;
      a1[1] = f32;
      a1[2] = v87;
      if (v88)
        operator delete(v88);
      v14 = v162;
      v79 = v157;
      goto LABEL_104;
    }
LABEL_180:
    sub_1000022F0();
  }
  v79 = v157;
  *v67 = v157;
  f32 = (_OWORD *)v67[1].f32;
LABEL_104:
  v91 = 0;
  v92 = vsubq_f32(v158, v14);
  v93 = (int32x4_t)vmulq_f32(v92, v92);
  v93.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v93, 2), vadd_f32(*(float32x2_t *)v93.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v93.i8, 1))).u32[0];
  v94 = vrsqrte_f32((float32x2_t)v93.u32[0]);
  v95 = vmul_f32(v94, vrsqrts_f32((float32x2_t)v93.u32[0], vmul_f32(v94, v94)));
  v93.i32[0] = vmul_f32(v95, vrsqrts_f32((float32x2_t)v93.u32[0], vmul_f32(v95, v95))).u32[0];
  v96 = vsubq_f32(v160, v14);
  v97 = (int32x4_t)vmulq_f32(v96, v96);
  v97.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v97, 2), vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v97.i8, 1))).u32[0];
  v98 = vmulq_n_f32(v92, *(float *)v93.i32);
  *(float32x2_t *)v93.i8 = vrsqrte_f32((float32x2_t)v97.u32[0]);
  *(float32x2_t *)v93.i8 = vmul_f32(*(float32x2_t *)v93.i8, vrsqrts_f32((float32x2_t)v97.u32[0], vmul_f32(*(float32x2_t *)v93.i8, *(float32x2_t *)v93.i8)));
  v99 = vmulq_n_f32(v96, vmul_f32(*(float32x2_t *)v93.i8, vrsqrts_f32((float32x2_t)v97.u32[0], vmul_f32(*(float32x2_t *)v93.i8, *(float32x2_t *)v93.i8))).f32[0]);
  v100 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v99, (int32x4_t)v99), (int8x16_t)v99, 0xCuLL);
  v101 = (int32x4_t)vmlaq_f32(vmulq_f32(v100, vnegq_f32(v98)), v99, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v98, (int32x4_t)v98), (int8x16_t)v98, 0xCuLL));
  v102 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v101, v101), (int8x16_t)v101, 0xCuLL);
  v103 = vsubq_f32(v79, v14);
  v104 = (int32x4_t)vmulq_f32(v103, v103);
  v104.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v104, 2), vadd_f32(*(float32x2_t *)v104.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v104.i8, 1))).u32[0];
  v105 = vrsqrte_f32((float32x2_t)v104.u32[0]);
  v106 = vmul_f32(v105, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v105, v105)));
  v107 = vmulq_n_f32(v103, vmul_f32(v106, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v106, v106))).f32[0]);
  v108 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v107, (int32x4_t)v107), (int8x16_t)v107, 0xCuLL), vnegq_f32(v99)), v107, v100);
  v109 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v108, v108), (int8x16_t)v108, 0xCuLL);
  v110 = (int8x16_t)vdupq_n_s32(v15);
  v163 = vbslq_s8(v110, (int8x16_t)vnegq_f32(v102), (int8x16_t)v102);
  v161 = vbslq_s8(v110, (int8x16_t)vnegq_f32(v109), (int8x16_t)v109);
  a1[1] = f32;
  v111 = a2 + 2;
  v112 = a2[1];
  do
  {
    if ((unint64_t)v112 >= *v111)
    {
      v113 = v112 - *a2;
      if ((unint64_t)(v113 + 1) >> 60)
LABEL_177:
        sub_1000022F0();
      v114 = *v111 - (_QWORD)*a2;
      v115 = v114 >> 3;
      if (v114 >> 3 <= (unint64_t)(v113 + 1))
        v115 = v113 + 1;
      if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFF0)
        v116 = 0xFFFFFFFFFFFFFFFLL;
      else
        v116 = v115;
      if (v116)
        v117 = (char *)sub_100002378((uint64_t)(a2 + 2), v116);
      else
        v117 = 0;
      v118 = (int8x16_t *)&v117[16 * v113];
      *v118 = v163;
      v112 = v118 + 1;
      v120 = (char *)*a2;
      v119 = (char *)a2[1];
      if (v119 != (char *)*a2)
      {
        do
        {
          v121 = *((int8x16_t *)v119 - 1);
          v119 -= 16;
          v118[-1] = v121;
          --v118;
        }
        while (v119 != v120);
        v119 = (char *)*a2;
      }
      *a2 = v118;
      a2[1] = v112;
      a2[2] = (int8x16_t *)&v117[16 * v116];
      if (v119)
        operator delete(v119);
    }
    else
    {
      *v112++ = v163;
    }
    a2[1] = v112;
    ++v91;
  }
  while (v91 != 3);
  for (i = 0; i != 3; ++i)
  {
    if ((unint64_t)v112 >= *v111)
    {
      v123 = v112 - *a2;
      if ((unint64_t)(v123 + 1) >> 60)
        goto LABEL_177;
      v124 = *v111 - (_QWORD)*a2;
      v125 = v124 >> 3;
      if (v124 >> 3 <= (unint64_t)(v123 + 1))
        v125 = v123 + 1;
      if ((unint64_t)v124 >= 0x7FFFFFFFFFFFFFF0)
        v126 = 0xFFFFFFFFFFFFFFFLL;
      else
        v126 = v125;
      if (v126)
        v127 = (char *)sub_100002378((uint64_t)(a2 + 2), v126);
      else
        v127 = 0;
      v128 = (int8x16_t *)&v127[16 * v123];
      *v128 = v161;
      v112 = v128 + 1;
      v130 = (char *)*a2;
      v129 = (char *)a2[1];
      if (v129 != (char *)*a2)
      {
        do
        {
          v131 = *((int8x16_t *)v129 - 1);
          v129 -= 16;
          v128[-1] = v131;
          --v128;
        }
        while (v129 != v130);
        v129 = (char *)*a2;
      }
      *a2 = v128;
      a2[1] = v112;
      a2[2] = (int8x16_t *)&v127[16 * v126];
      if (v129)
        operator delete(v129);
    }
    else
    {
      *v112++ = v161;
    }
    a2[1] = v112;
  }
  v132 = 0;
  v133 = a3 + 2;
  v134 = a3[1];
  do
  {
    if ((unint64_t)v134 >= *v133)
    {
      v135 = v134 - *a3;
      if ((unint64_t)(v135 + 1) >> 60)
        sub_1000022F0();
      v136 = *v133 - (_QWORD)*a3;
      v137 = v136 >> 3;
      if (v136 >> 3 <= (unint64_t)(v135 + 1))
        v137 = v135 + 1;
      if ((unint64_t)v136 >= 0x7FFFFFFFFFFFFFF0)
        v138 = 0xFFFFFFFFFFFFFFFLL;
      else
        v138 = v137;
      if (v138)
        v139 = (char *)sub_100002378((uint64_t)(a3 + 2), v138);
      else
        v139 = 0;
      v140 = (__n128 *)&v139[16 * v135];
      *v140 = a9;
      v134 = v140 + 1;
      v142 = *a3;
      v141 = a3[1];
      if (v141 != *a3)
      {
        do
        {
          v143 = v141[-1];
          --v141;
          v140[-1] = v143;
          --v140;
        }
        while (v141 != v142);
        v141 = *a3;
      }
      *a3 = v140;
      a3[1] = v134;
      a3[2] = (__n128 *)&v139[16 * v138];
      if (v141)
        operator delete(v141);
    }
    else
    {
      *v134++ = a9;
    }
    a3[1] = v134;
    ++v132;
  }
  while (v132 != 6);
  v145 = (_DWORD *)qword_100016790;
  v144 = qword_100016798;
  v146 = 1;
  do
  {
    v147 = v146;
    if ((unint64_t)v145 >= v144)
    {
      v149 = (_DWORD *)masks;
      v150 = ((uint64_t)v145 - masks) >> 2;
      v151 = v150 + 1;
      if ((unint64_t)(v150 + 1) >> 62)
        sub_1000022F0();
      v152 = v144 - masks;
      if (v152 >> 1 > v151)
        v151 = v152 >> 1;
      if ((unint64_t)v152 >= 0x7FFFFFFFFFFFFFFCLL)
        v153 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v153 = v151;
      if (v153)
      {
        v154 = (char *)sub_1000023D4((uint64_t)&qword_100016798, v153);
        v149 = (_DWORD *)masks;
        v145 = (_DWORD *)qword_100016790;
      }
      else
      {
        v154 = 0;
      }
      v155 = &v154[4 * v150];
      *(_DWORD *)v155 = a11;
      v148 = (uint64_t)(v155 + 4);
      while (v145 != v149)
      {
        v156 = *--v145;
        *((_DWORD *)v155 - 1) = v156;
        v155 -= 4;
      }
      v144 = (unint64_t)&v154[4 * v153];
      masks = (uint64_t)v155;
      qword_100016790 = v148;
      qword_100016798 = v144;
      if (v149)
      {
        operator delete(v149);
        v144 = qword_100016798;
      }
    }
    else
    {
      *v145 = a11;
      v148 = (uint64_t)(v145 + 1);
    }
    v146 = 0;
    qword_100016790 = v148;
    v145 = (_DWORD *)v148;
  }
  while ((v147 & 1) != 0);
}

void createCube(char a1, char a2, int a3, __n128 a4, float32x4_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  uint64_t v11;
  __int128 v12;
  _OWORD v14[8];

  v11 = 0;
  *(_QWORD *)&v12 = 0xBF000000BF000000;
  *((_QWORD *)&v12 + 1) = 0xBF000000BF000000;
  v14[0] = v12;
  v14[1] = xmmword_10000BF00;
  v14[2] = xmmword_10000BF10;
  v14[3] = xmmword_10000BF20;
  v14[4] = xmmword_10000BF30;
  v14[5] = xmmword_10000BF40;
  *(_QWORD *)&v12 = 0x3F0000003F000000;
  *((_QWORD *)&v12 + 1) = 0x3F0000003F000000;
  v14[6] = xmmword_10000BF50;
  v14[7] = v12;
  do
  {
    v14[v11] = vaddq_f32(a8, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a5, COERCE_FLOAT(v14[v11])), a6, *(float32x2_t *)&v14[v11], 1), a7, (float32x4_t)v14[v11], 2));
    ++v11;
  }
  while (v11 != 8);
  if ((a1 & 1) != 0)
  {
    createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 0, 4u, 6u, 2u, a4, a2, a3);
    if ((a1 & 2) == 0)
    {
LABEL_5:
      if ((a1 & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_5;
  }
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 1u, 3u, 7u, 5u, a4, a2, a3);
  if ((a1 & 4) == 0)
  {
LABEL_6:
    if ((a1 & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 0, 1u, 5u, 4u, a4, a2, a3);
  if ((a1 & 8) == 0)
  {
LABEL_7:
    if ((a1 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 2u, 6u, 7u, 3u, a4, a2, a3);
  if ((a1 & 0x10) == 0)
  {
LABEL_8:
    if ((a1 & 0x20) == 0)
      return;
    goto LABEL_9;
  }
LABEL_15:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 0, 2u, 3u, 1u, a4, a2, a3);
  if ((a1 & 0x20) == 0)
    return;
LABEL_9:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 4u, 5u, 7u, 6u, a4, a2, a3);
}

void sub_1000022F0()
{
  sub_100002304("vector");
}

void sub_100002304(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100002354(exception, a1);
}

void sub_100002340(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100002354(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100002378(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_1000023AC();
  return operator new(16 * a2);
}

void sub_1000023AC()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_1000023D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_1000023AC();
  return operator new(4 * a2);
}

void sub_100002408()
{
  void *v0;

  v0 = objc_autoreleasePoolPush();
  qword_100016748 = 0;
  unk_100016750 = 0;
  vertices = 0;
  __cxa_atexit((void (*)(void *))sub_100001718, &vertices, (void *)&_mh_execute_header);
  qword_100016760 = 0;
  unk_100016768 = 0;
  normals = 0;
  __cxa_atexit((void (*)(void *))sub_100001718, &normals, (void *)&_mh_execute_header);
  qword_100016778 = 0;
  unk_100016780 = 0;
  colors = 0;
  __cxa_atexit((void (*)(void *))sub_100001718, &colors, (void *)&_mh_execute_header);
  qword_100016790 = 0;
  qword_100016798 = 0;
  masks = 0;
  __cxa_atexit((void (*)(void *))sub_100001748, &masks, (void *)&_mh_execute_header);
  objc_autoreleasePoolPop(v0);
}

uint64_t *initialize(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 42;
  v2 = *result;
  do
  {
    v3 = -12211 * (v2 / 53668) + 40014 * (v2 % 53668);
    v2 = ((v3 >> 63) & 0x7FFFFFAB) + v3;
    if ((unint64_t)(v1 - 3) <= 0x1F)
      result[v1] = v2;
    --v1;
  }
  while (v1 != 2);
  *result = v2;
  result[2] = result[3];
  return result;
}

uint64_t next(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v1 = -12211 * (*a1 / 53668) + 40014 * (*a1 % 53668);
  v2 = ((v1 >> 63) & 0x7FFFFFAB) + v1;
  v3 = -3791 * (a1[1] / 52774) + 40692 * (a1[1] % 52774);
  v4 = ((v3 >> 63) & 0x7FFFFF07) + v3;
  *a1 = v2;
  a1[1] = v4;
  v5 = &a1[(int)a1[2] / 67108862];
  a1[2] = v5[3] - v4;
  v5[3] = v2;
  v6 = a1[2];
  if (v6 < 0)
  {
    v6 += 2147483563;
    a1[2] = v6;
  }
  return v6;
}

uint64_t *ConstructRandom(uint64_t *a1, time_t a2)
{
  if (!a2)
    a2 = time(0);
  *a1 = a2;
  a1[1] = a2;
  return initialize(a1);
}

float UniformFloat(uint64_t *a1)
{
  float result;

  result = (double)next(a1) * 4.65661306e-10;
  if (result == 1.0)
    return 0.0;
  return result;
}

void sub_100002B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002B5C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002B6C(uint64_t a1)
{

}

void sub_100002B74(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id sub_1000039A8(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Recieved thermal notification from kernel.", v6, 2u);
  }

  return objc_msgSend(a2, "recievedThermalStateChangedNotification");
}

id sub_100003A1C(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Recieved shutdown notification!", v6, 2u);
  }

  return objc_msgSend(a2, "recievedShutdownNotification");
}

void sub_100003B04(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  int v35;

  v3 = OSThermalNotificationCurrentLevel(a1, a2);
  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v35 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device thermal level is now %d", buf, 8u);
  }

  if (v3 == 11)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isThermalBlocked") & 1) != 0)
      return;
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pausing drain operations due to high thermal state", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIsThermalBlocked:", 1);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drainQueue"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "operations"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "pause");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }
    goto LABEL_19;
  }
  if (v3 >= 12)
  {
    v14 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device is hot enough to trigger OS warning screen and process murdering. Aborting battery drain.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIsThermalBlocked:", 1);
    v27 = 0;
    +[BatteryDrainController setCode:forError:](BatteryDrainController, "setCode:forError:", -1, &v27);
    v9 = v27;
    objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v9);
LABEL_19:

    return;
  }
  if (!v3 && objc_msgSend(*(id *)(a1 + 32), "isThermalBlocked"))
  {
    v16 = DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Resuming drain operations due to lowered thermal state", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIsThermalBlocked:", 0);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drainQueue", 0));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "operations"));

    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), "resume");
        }
        v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v20);
    }
    goto LABEL_19;
  }
}

void sub_100004EFC(IONotificationPort **a1, io_iterator_t a2)
{
  IONotificationPort *v4;
  io_object_t v5;
  io_service_t v6;
  kern_return_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *context;
  uint8_t v12;
  _BYTE v13[15];
  uint8_t buf[16];

  context = objc_autoreleasePoolPush();
  v4 = *a1;
  v5 = IOIteratorNext(a2);
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = IOServiceAddInterestNotification(v4, v6, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000054CC, 0, (io_object_t *)&dword_1000167A8);
      v8 = DiagnosticLogHandleForCategory(3);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_100008FB0(&v12, v13, v10);

      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Added interest notification for battery", buf, 2u);
        }

        sub_1000054E8(v6);
      }
      IOObjectRelease(v6);
      v6 = IOIteratorNext(a2);
    }
    while (v6);
  }
  objc_autoreleasePoolPop(context);
}

void sub_1000054CC(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200)
    sub_1000054E8(a2);
}

void sub_1000054E8(io_registry_entry_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  unsigned int v15;
  int v16;
  float v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  _BYTE v30[14];
  double v31;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  sub_100005900(a1, v3, CFSTR("CurrentCapacity"));
  sub_100005900(a1, v3, CFSTR("MaxCapacity"));
  sub_100005900(a1, v3, CFSTR("AtCriticalLevel"));
  sub_100005900(a1, v3, CFSTR("Voltage"));
  sub_100005900(a1, v3, CFSTR("FullyCharged"));
  sub_100005900(a1, v3, CFSTR("IsCharging"));
  sub_100005900(a1, v3, CFSTR("ExternalConnected"));
  sub_100005900(a1, v3, CFSTR("ExternalChargeCapable"));
  sub_100005900(a1, v3, CFSTR("AdapterInfo"));
  sub_100005900(a1, v3, CFSTR("CapacityEstimated"));
  sub_100005900(a1, v3, CFSTR("AdapterDetails"));
  v4 = objc_msgSend(v3, "count");
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (!v7)
      goto LABEL_7;
    *(_WORD *)v30 = 0;
    v8 = "Updating battery status with populated properties";
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_WORD *)v30 = 0;
    v8 = "Updating battery status properties, will be UIDeviceBatteryStateUnknown";
  }
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, v30, 2u);
LABEL_7:

  v9 = v3;
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10000909C((uint64_t)v9, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("CurrentCapacity")));
  v13 = objc_msgSend(v12, "intValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("MaxCapacity")));
  v15 = objc_msgSend(v14, "intValue");

  if (v15)
    v16 = v15;
  else
    v16 = 100;
  v17 = (float)v13 / (float)v16;
  if (v17 != *(float *)&dword_1000165B8)
  {
    v18 = DiagnosticLogHandleForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v30 = 134218240;
      *(double *)&v30[4] = *(float *)&dword_1000165B8;
      *(_WORD *)&v30[12] = 2048;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Battery level has changed from %f to %f. Sending notification", v30, 0x16u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    *(float *)&v21 = v17;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21));
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("com.apple.Diagnostics.BatteryLevelChangedNotification"), v22);

    dword_1000165B8 = LODWORD(v17);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("IsCharging"), *(_QWORD *)v30));
  v24 = objc_msgSend(v23, "BOOLValue");

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("ExternalConnected")));
  v26 = objc_msgSend(v25, "BOOLValue");

  if ((v24 & 1) != 0 || v26)
  {
    v27 = DiagnosticLogHandleForCategory(3);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v30 = 67109376;
      *(_DWORD *)&v30[4] = v24;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "The battery is either charging (%d) or connected to a charging source (%d). Sending notification", v30, 0xEu);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "postNotificationName:object:", CFSTR("com.apple.Diagnostics.BatteryConnectedToChargingNotification"), 0);

  }
  objc_autoreleasePoolPop(v2);
}

void sub_100005900(io_registry_entry_t a1, void *a2, const __CFString *a3)
{
  CFTypeRef CFProperty;
  void *v6;
  id v7;

  v7 = a2;
  CFProperty = IORegistryEntryCreateCFProperty(a1, a3, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v6 = (void *)CFProperty;
    objc_msgSend(v7, "setObject:forKey:", CFProperty, a3);

  }
}

void sub_10000596C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005984(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005D70(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100005D90(id a1)
{
  return a1;
}

uint64_t sub_100005D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(a1, a2, a3, a4);
}

BOOL sub_100006118(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") && (unint64_t)objc_msgSend(v2, "length") < 0x33;

  return v3;
}

uint64_t GetPhysicalCPUs()
{
  int v0;
  unsigned int v1;
  size_t v3;
  int v4;

  v4 = 0;
  v3 = 4;
  v0 = sysctlbyname("hw.physicalcpu_max", &v4, &v3, 0, 0);
  v1 = v4;
  if (v4 <= 1)
    v1 = 1;
  if (v0)
    return 1;
  else
    return v1;
}

uint64_t detect_cpu()
{
  size_t v1;
  unsigned int v2;

  v2 = 0;
  v1 = 4;
  if (sysctlbyname("hw.cpufamily", &v2, &v1, 0, 0))
    return 0;
  else
    return v2;
}

size_t printBestThermalInfo()
{
  return fwrite("\nUse the following for maximum energy expenditure and battery discharge on: \nCortex-A7:             thermalA7Synthetic -n 0         \nSwift:                 thermalSwiftSynthetic -n 0      \nCyclone:               thermalCycloneSynthetic -n 0    \nTyphoon:               thermalTyphoonSynthetic -n 0    \nTwister:               thermalTwisterSynthetic -n 0    \nHurricane/Zephyr:      thermalHurricaneSynthetic -n 0  \nMonsoon/Mistral:       thermalMonsoonSynthetic -n 0    \nVortex/Tempest:        thermalVortexSynthetic -n 0        \nTempest:               thermalTempestSynthetic -n 0    \n\n", 0x249uLL, 1uLL, __stderrp);
}

double matrix4x4_translation(float a1, float a2, float a3)
{
  double result;

  __asm { FMOV            V3.4S, #1.0 }
  *(_QWORD *)&result = 1065353216;
  return result;
}

double matrix4x4_rotation(float a1, float32x4_t a2)
{
  int32x4_t v2;
  float32x2_t v3;
  float32x2_t v4;
  __float2 v5;
  double v6;
  float32x4_t v8;

  v2 = (int32x4_t)vmulq_f32(a2, a2);
  v2.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v2, 2), vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1))).u32[0];
  v3 = vrsqrte_f32((float32x2_t)v2.u32[0]);
  v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v3, v3)));
  v8 = vmulq_n_f32(a2, vmul_f32(v4, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v4, v4))).f32[0]);
  v5 = __sincosf_stret(a1);
  LODWORD(v6) = vmlas_n_f32(v5.__cosval, 1.0 - v5.__cosval, vmulq_f32(v8, v8).f32[0]);
  *((float *)&v6 + 1) = vmuls_lane_f32(v5.__sinval, v8, 2)
                      + (float)(vmuls_lane_f32(v8.f32[0], *(float32x2_t *)v8.f32, 1) * (float)(1.0 - v5.__cosval));
  return v6;
}

void sub_100007B0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100007BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)Renderer;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100007C0C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100007F08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100008694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100008CA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

intptr_t sub_100008CD0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 176));
}

void sub_100008E0C(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);

}

void sub_100008E68(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100008EEC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to restore USB charging.", v1, 2u);
}

void sub_100008F2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005994();
  sub_10000596C((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't create notification port", v2, v3, v4, v5, v6);
  sub_10000597C();
}

void sub_100008F58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005994();
  sub_10000596C((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't get run loop source", v2, v3, v4, v5, v6);
  sub_10000597C();
}

void sub_100008F84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005994();
  sub_10000596C((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't add matching notification", v2, v3, v4, v5, v6);
  sub_10000597C();
}

void sub_100008FB0(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to add interest notification for battery", buf, 2u);
}

void sub_100008FEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005994();
  sub_100005984((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: destroying notification port", v2, v3, v4, v5, v6);
  sub_10000597C();
}

void sub_100009018()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005994();
  sub_10000596C((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: no run loop source", v2, v3, v4, v5, v6);
  sub_10000597C();
}

void sub_100009044()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005994();
  sub_100005984((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: removed run loop source", v2, v3, v4, v5, v6);
  sub_10000597C();
}

void sub_100009070()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005994();
  sub_100005984((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: releasing matching notification", v2, v3, v4, v5, v6);
  sub_10000597C();
}

void sub_10000909C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Updating battery data based on properties: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100009110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = (void *)sub_100005D9C(a1, a2, a3, a4);
  v5 = sub_100005D90(v4);
  sub_100005D70((void *)&_mh_execute_header, v6, v7, "Starting [%@]", v8, v9, v10, v11, v12);

  sub_100005D84();
}

void sub_100009180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = (void *)sub_100005D9C(a1, a2, a3, a4);
  v5 = sub_100005D90(v4);
  sub_100005D70((void *)&_mh_execute_header, v6, v7, "Cancelling [%@]", v8, v9, v10, v11, v12);

  sub_100005D84();
}

void sub_1000091F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = (void *)sub_100005D9C(a1, a2, a3, a4);
  v5 = sub_100005D90(v4);
  sub_100005D70((void *)&_mh_execute_header, v6, v7, "Finishing [%@]", v8, v9, v10, v11, v12);

  sub_100005D84();
}

void sub_100009260(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create metal renderer.", v1, 2u);
}

void sub_1000092A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  id v5;
  int v6;
  id v7;

  v6 = 138412290;
  v7 = (id)objc_opt_class(a1, a2, a3, a4);
  v5 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Main returning for %@", (uint8_t *)&v6, 0xCu);

}

void sub_100009334(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "/Library/Caches/com.apple.xbs/Sources/Diagnostics/DiagnosticsService/Diagnostic-8187/CPUDrainOperation.m";
  v3 = 1024;
  v4 = 133;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: %s:%d, unable to allocate memory.", (uint8_t *)&v1, 0x12u);
}

void sub_1000093C4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "This version of thermalSGEMMEnergy supports CYCLONE, TYPHOON, and TWISTER CPU families...", v1, 2u);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_accessoryConnectDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryConnectDetector");
}

id objc_msgSend_accessoryDetectorModelNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDetectorModelNumbers");
}

id objc_msgSend_accessoryDisconnectDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDisconnectDetector");
}

id objc_msgSend_addCompletedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCompletedHandler:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_audioFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioFileURL");
}

id objc_msgSend_audioFilename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioFilename");
}

id objc_msgSend_audioPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioPlayer");
}

id objc_msgSend_audioVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioVolume");
}

id objc_msgSend_autoBrightnessOff(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoBrightnessOff");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_brightnessSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnessSystemClient");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_changeRenderSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeRenderSize:");
}

id objc_msgSend_checkStartingBatteryPercentage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkStartingBatteryPercentage:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorAttachments");
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandBuffer");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commit");
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeCommandEncoder");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contents");
}

id objc_msgSend_copyPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPropertyForKey:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cpuDrainIterationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpuDrainIterationDelay");
}

id objc_msgSend_cpuDrainMatrixLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpuDrainMatrixLength");
}

id objc_msgSend_createBuffers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createBuffers");
}

id objc_msgSend_createIntersector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createIntersector");
}

id objc_msgSend_createPipelines(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPipelines");
}

id objc_msgSend_createScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createScene");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaults");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_disableUSBCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUSBCharging");
}

id objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchThreadgroups:threadsPerThreadgroup:");
}

id objc_msgSend_displayBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayBrightness");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_BOOLFromRequiredKey_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromRequiredKey:failed:");
}

id objc_msgSend_dk_dictionaryFromRequiredKey_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromRequiredKey:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_stringFromKey_maxLength_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromKey:maxLength:defaultValue:failed:");
}

id objc_msgSend_drainAudio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drainAudio");
}

id objc_msgSend_drainCPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drainCPU");
}

id objc_msgSend_drainDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drainDisplay");
}

id objc_msgSend_drainGPU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drainGPU");
}

id objc_msgSend_drainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drainQueue");
}

id objc_msgSend_enableUSBCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableUSBCharging");
}

id objc_msgSend_enableVolumeHUD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableVolumeHUD:");
}

id objc_msgSend_encodeIntersectionToCommandBuffer_intersectionType_rayBuffer_rayBufferOffset_intersectionBuffer_intersectionBufferOffset_rayCount_accelerationStructure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeIntersectionToCommandBuffer:intersectionType:rayBuffer:rayBufferOffset:intersectionBuffer:intersectionBufferOffset:rayCount:accelerationStructure:");
}

id objc_msgSend_endBatteryDrainWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endBatteryDrainWithStatusCode:");
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEncoding");
}

id objc_msgSend_ensureAnalyticsFreeEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ensureAnalyticsFreeEnvironment");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_failedToExecuteWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedToExecuteWithError:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finish");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_getActiveCategoryVolume_andName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActiveCategoryVolume:andName:");
}

id objc_msgSend_getAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAsset:completion:");
}

id objc_msgSend_getPowerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPowerMode");
}

id objc_msgSend_gpuDrainIterationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gpuDrainIterationDelay");
}

id objc_msgSend_hasRenderDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRenderDevice");
}

id objc_msgSend_initOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initOperations");
}

id objc_msgSend_initWithAudioFileURL_volume_responder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAudioFileURL:volume:responder:");
}

id objc_msgSend_initWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBool:");
}

id objc_msgSend_initWithBrightness_responder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBrightness:responder:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevice:");
}

id objc_msgSend_initWithIterationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIterationDelay:");
}

id objc_msgSend_initWithMatrixLength_iterationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMatrixLength:iterationDelay:");
}

id objc_msgSend_initWithModelNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModelNumbers:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isAccessoryDetectorActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessoryDetectorActive");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isDeviceConnectedToRequiredAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceConnectedToRequiredAccessory");
}

id objc_msgSend_isDeviceConnectedToUnexpectedAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceConnectedToUnexpectedAccessory");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaused");
}

id objc_msgSend_isThermalBlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isThermalBlocked");
}

id objc_msgSend_iterationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iterationDelay");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadMetal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadMetal");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_lowPowerModeOff(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowPowerModeOff");
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "main");
}

id objc_msgSend_matrixLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matrixLength");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumbers");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newBufferWithLength_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBufferWithLength:options:");
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newCommandQueue");
}

id objc_msgSend_newComputePipelineStateWithDescriptor_options_reflection_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newComputePipelineStateWithDescriptor:options:reflection:error:");
}

id objc_msgSend_newDefaultLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDefaultLibrary");
}

id objc_msgSend_newFunctionWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newFunctionWithName:");
}

id objc_msgSend_newRenderPipelineStateWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newRenderPipelineStateWithDescriptor:error:");
}

id objc_msgSend_newTextureWithDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTextureWithDescriptor:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operations");
}

id objc_msgSend_originalPowerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalPowerMode");
}

id objc_msgSend_originalPowerModeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalPowerModeSet");
}

id objc_msgSend_originalScreenBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalScreenBrightness");
}

id objc_msgSend_originalVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalVolume");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pause");
}

id objc_msgSend_pauseLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseLock");
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "play");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_recievedConnectedToChargerNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recievedConnectedToChargerNotification:");
}

id objc_msgSend_recievedShutdownNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recievedShutdownNotification");
}

id objc_msgSend_recievedThermalStateChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recievedThermalStateChangedNotification");
}

id objc_msgSend_registerForBatteryEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForBatteryEvents");
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForLocalNotifications");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_render(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "render");
}

id objc_msgSend_requestedBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestedBrightness");
}

id objc_msgSend_requestedVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestedVolume");
}

id objc_msgSend_responder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responder");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_setAccessoryConnectDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryConnectDetector:");
}

id objc_msgSend_setAccessoryDisconnectDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryDisconnectDetector:");
}

id objc_msgSend_setActiveCategoryVolumeTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveCategoryVolumeTo:");
}

id objc_msgSend_setAudioFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioFileURL:");
}

id objc_msgSend_setAudioFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioFilename:");
}

id objc_msgSend_setAudioPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioPlayer:");
}

id objc_msgSend_setAudioVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioVolume:");
}

id objc_msgSend_setAutoBrightnessOff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoBrightnessOff:");
}

id objc_msgSend_setBrightnessSystemClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessSystemClient:");
}

id objc_msgSend_setBuffer_offset_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuffer:offset:atIndex:");
}

id objc_msgSend_setCategory_mode_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:mode:options:error:");
}

id objc_msgSend_setCode_forError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCode:forError:");
}

id objc_msgSend_setCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedUnitCount:");
}

id objc_msgSend_setComputeFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComputeFunction:");
}

id objc_msgSend_setComputePipelineState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComputePipelineState:");
}

id objc_msgSend_setCpuDrainIterationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCpuDrainIterationDelay:");
}

id objc_msgSend_setCpuDrainMatrixLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCpuDrainMatrixLength:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaults:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableUSBCharging_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableUSBCharging:");
}

id objc_msgSend_setDisplayBrightness_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayBrightness:");
}

id objc_msgSend_setDrainAudio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrainAudio:");
}

id objc_msgSend_setDrainCPU_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrainCPU:");
}

id objc_msgSend_setDrainDisplay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrainDisplay:");
}

id objc_msgSend_setDrainGPU_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrainGPU:");
}

id objc_msgSend_setDrainQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrainQueue:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFragmentFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFragmentFunction:");
}

id objc_msgSend_setGpuDrainIterationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGpuDrainIterationDelay:");
}

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeight:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIntersectionDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntersectionDataType:");
}

id objc_msgSend_setIsPaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPaused:");
}

id objc_msgSend_setIsThermalBlocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsThermalBlocked:");
}

id objc_msgSend_setLowPowerModeOff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowPowerModeOff:");
}

id objc_msgSend_setMaskBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaskBuffer:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setNumberOfLoops_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLoops:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOriginalPowerMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalPowerMode:");
}

id objc_msgSend_setOriginalPowerModeSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalPowerModeSet:");
}

id objc_msgSend_setPixelFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPixelFormat:");
}

id objc_msgSend_setPowerMode_fromSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerMode:fromSource:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setPurgeableState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurgeableState:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setRasterSampleCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRasterSampleCount:");
}

id objc_msgSend_setRayDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRayDataType:");
}

id objc_msgSend_setRayMaskOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRayMaskOptions:");
}

id objc_msgSend_setRayStride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRayStride:");
}

id objc_msgSend_setResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponder:");
}

id objc_msgSend_setRunNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunNumber:");
}

id objc_msgSend_setScreenToBrightness_animate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenToBrightness:animate:");
}

id objc_msgSend_setStartingBatteryPercentage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartingBatteryPercentage:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStorageMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorageMode:");
}

id objc_msgSend_setTargetBatteryPercentage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetBatteryPercentage:");
}

id objc_msgSend_setTexture_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTexture:atIndex:");
}

id objc_msgSend_setTextureType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextureType:");
}

id objc_msgSend_setThreadGroupSizeIsMultipleOfThreadExecutionWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:");
}

id objc_msgSend_setTotalUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalUnitCount:");
}

id objc_msgSend_setTriangleCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTriangleCount:");
}

id objc_msgSend_setUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsage:");
}

id objc_msgSend_setVertexBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVertexBuffer:");
}

id objc_msgSend_setVertexFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVertexFunction:");
}

id objc_msgSend_setWasAutoBrightnessEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasAutoBrightnessEnabled:");
}

id objc_msgSend_setWasChargingDisabledDuringTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasChargingDisabledDuringTest:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupNotifications");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signal");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startingBatteryPercentage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startingBatteryPercentage");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_targetBatteryPercentage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetBatteryPercentage");
}

id objc_msgSend_thermalSGEMMEnergyObjC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thermalSGEMMEnergyObjC");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unregisterForBatteryEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForBatteryEvents");
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForLocalNotifications");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateUniforms(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUniforms");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wait");
}

id objc_msgSend_waitForSafeThermalState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForSafeThermalState");
}

id objc_msgSend_waitIfPaused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitIfPaused");
}

id objc_msgSend_wasAutoBrightnessEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasAutoBrightnessEnabled");
}

id objc_msgSend_wasChargingDisabledDuringTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasChargingDisabledDuringTest");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
