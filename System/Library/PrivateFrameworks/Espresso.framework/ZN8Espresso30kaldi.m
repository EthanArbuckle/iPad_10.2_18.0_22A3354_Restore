@implementation ZN8Espresso30kaldi

_QWORD *___ZN8Espresso30kaldi_like_sgemv_float_genericIaEEvPKT_PKfS5_S5_PfmRKNS_22inner_product_uniformsEb_block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float *v21;
  int16x8_t *v22;
  float32x2_t *v23;
  _OWORD *v25;
  unint64_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t *v43;
  float32x4_t *v44;
  float32x4_t *v45;
  int8x16_t v46;
  int8x8_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  int8x16_t *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  float v64;
  unint64_t v65;
  int8x16_t *v66;
  float v67;
  float v68;
  float v69;
  unint64_t v70;
  unint64_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  uint64_t v75;
  unint64_t v76;
  int32x4_t v77;
  unint64_t v78;
  int32x4_t v79;
  int8x16_t *v80;
  int32x4_t v81;
  int16x8_t *v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int8x16_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t *v96;
  int16x8_t *v97;
  int16x8_t *v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  unint64_t i;
  int v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float32x4_t v114;
  float v115;
  float32x4_t v116;
  float v117;
  float32x4_t v118;
  float v119;
  float32x4_t v120;
  float v121;
  unint64_t v122;
  int v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  float v132;
  unint64_t v133;
  float v134;
  unint64_t v135;
  uint64_t v136;
  int16x8_t *v137;
  double v138;
  float v139;
  unint64_t v140;
  int8x16_t *v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  unint64_t v145;
  int32x4_t v146;
  unint64_t v147;
  int8x16_t *v148;
  int16x8_t *v149;
  int32x4_t v150;
  int32x4_t v151;
  int32x4_t v152;
  int8x16_t v153;
  int16x8_t v154;
  int16x8_t v155;
  int16x8_t v156;
  int16x8_t v157;
  float32x4_t v158;
  unint64_t j;
  int v160;
  int v161;
  int v162;
  float v163;
  float v164;
  _OWORD *v165;
  unint64_t v166;
  float32x4_t v167;
  float32x4_t v168;
  float32x4_t v169;
  float32x4_t v170;
  int8x16_t v171;
  int8x8_t v172;
  float32x4_t v173;
  float32x4_t v174;
  float32x4_t v175;
  float32x4_t v176;
  int8x16_t *v177;
  unint64_t v178;
  float32x4_t v179;
  float v180;
  unint64_t v181;
  float v182;
  float v183;
  int v184;
  _QWORD *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  int8x16_t *v196;
  float32x4_t v197;

  v2 = result[4];
  v3 = result[5];
  v4 = v2 * a2;
  if (v3 >= v2 * a2 + v2)
    v3 = v2 * a2 + v2;
  v190 = v3;
  if (v4 < v3)
  {
    v5 = result[6];
    v6 = result[8];
    v187 = result[9];
    v188 = v6;
    v7 = result[10];
    v189 = result[7];
    v8 = v189 + v2 * v6 * a2;
    v185 = result;
    v186 = v7;
    do
    {
      if (v7)
        v9 = *(float *)(v7 + 4 * v4);
      else
        v9 = 0.0;
      v196 = (int8x16_t *)(v189 + v6 * v4);
      v10 = *(float *)(v187 + 4 * v4);
      v11 = 0;
      v12 = v5 & 0xFFFFFFFFFFFFFFFCLL;
      if ((v5 & 0xFFFFFFFFFFFFFFFCLL) != 0)
      {
        v13 = result[8];
        v14 = result[12];
        v194 = result[11];
        v195 = v5 & 0xFFFFFFFFFFFFFFFCLL;
        v15 = result[13];
        v16 = result[14];
        v17 = v13 & 0xFFFFFFFFFFFFFFF0;
        v191 = v16;
        v18 = result[15];
        v19 = result[5];
        v20 = 4 * v13;
        v192 = v15;
        v193 = v14;
        do
        {
          v21 = (float *)(v14 + 4 * v11);
          if (v15)
            v22 = (int16x8_t *)(v15 + 2 * v13 * v11);
          else
            v22 = 0;
          v23 = (float32x2_t *)(v16 + 4 * v11);
          if (!v16)
            v23 = 0;
          if (v22)
            _ZF = v23 == 0;
          else
            _ZF = 1;
          if (_ZF)
          {
            v25 = (_OWORD *)(v194 + 4 * v13 * v11);
            if (v17)
            {
              v26 = 0;
              v27 = 0uLL;
              v28 = 0uLL;
              v29 = 0uLL;
              v30 = 0uLL;
              v31 = 0uLL;
              v32 = 0uLL;
              v33 = 0uLL;
              v34 = 0uLL;
              v35 = 0uLL;
              v36 = 0uLL;
              v37 = 0uLL;
              v38 = 0uLL;
              v39 = 0uLL;
              v40 = 0uLL;
              v41 = 0uLL;
              v42 = 0uLL;
              do
              {
                v43 = (float32x4_t *)((char *)v25 + v20);
                v44 = (float32x4_t *)((char *)v25 + 8 * v13);
                v45 = (float32x4_t *)((char *)v25 + 12 * v13);
                v46 = *(int8x16_t *)(v8 + v26);
                v47 = (int8x8_t)vextq_s8(v46, v46, 8uLL).u64[0];
                v48 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v47, 0), 8uLL), 8uLL)));
                v49 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v47, 0), 8uLL), 8uLL)));
                v50 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v46.i8, 0), 8uLL), 8uLL)));
                v51 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v46.i8, 0), 8uLL), 8uLL)));
                v52 = *((float32x4_t *)v25 + 2);
                v53 = *((float32x4_t *)v25 + 3);
                v54 = *(float32x4_t *)v25;
                v55 = *((float32x4_t *)v25 + 1);
                v25 += 4;
                v28 = vmlaq_f32(v28, v51, v55);
                v27 = vmlaq_f32(v27, v50, v54);
                v30 = vmlaq_f32(v30, v49, v53);
                v29 = vmlaq_f32(v29, v48, v52);
                v32 = vmlaq_f32(v32, v51, v43[1]);
                v31 = vmlaq_f32(v31, v50, *v43);
                v34 = vmlaq_f32(v34, v49, v43[3]);
                v33 = vmlaq_f32(v33, v48, v43[2]);
                v40 = vmlaq_f32(v40, v51, v44[1]);
                v39 = vmlaq_f32(v39, v50, *v44);
                v42 = vmlaq_f32(v42, v49, v44[3]);
                v41 = vmlaq_f32(v41, v48, v44[2]);
                v36 = vmlaq_f32(v36, v51, v45[1]);
                v35 = vmlaq_f32(v35, v50, *v45);
                v38 = vmlaq_f32(v38, v49, v45[3]);
                v37 = vmlaq_f32(v37, v48, v45[2]);
                v26 += 16;
              }
              while (v26 < v17);
              v56 = (int8x16_t *)(v8 + v26);
              v57 = (((v13 & 0xFFFFFFFFFFFFFFF0) - 1) & 0xFFFFFFFFFFFFFFF0) + 16;
            }
            else
            {
              v57 = 0;
              v39 = 0uLL;
              v40 = 0uLL;
              v41 = 0uLL;
              v42 = 0uLL;
              v35 = 0uLL;
              v36 = 0uLL;
              v37 = 0uLL;
              v38 = 0uLL;
              v31 = 0uLL;
              v32 = 0uLL;
              v33 = 0uLL;
              v34 = 0uLL;
              v27 = 0uLL;
              v28 = 0uLL;
              v29 = 0uLL;
              v56 = v196;
              v30 = 0uLL;
            }
            v114 = vaddq_f32(v30, vaddq_f32(v29, vaddq_f32(v28, vaddq_f32(v27, (float32x4_t)0))));
            LODWORD(v115) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v114, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v114, 2), vaddq_f32(v114, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v114.f32, 1)))).u32[0];
            v116 = vaddq_f32(v34, vaddq_f32(v33, vaddq_f32(v32, vaddq_f32(v31, (float32x4_t)0))));
            LODWORD(v117) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v116, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v116, 2), vaddq_f32(v116, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v116.f32, 1)))).u32[0];
            v118 = vaddq_f32(v42, vaddq_f32(v41, vaddq_f32(v40, vaddq_f32(v39, (float32x4_t)0))));
            LODWORD(v119) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 2), vaddq_f32(v118, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v118.f32, 1)))).u32[0];
            v120 = vaddq_f32(v38, vaddq_f32(v37, vaddq_f32(v36, vaddq_f32(v35, (float32x4_t)0))));
            LODWORD(v121) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v120, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v120, 2), vaddq_f32(v120, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v120.f32, 1)))).u32[0];
            _CF = v13 >= v57;
            v122 = v13 - v57;
            if (v122 != 0 && _CF)
            {
              do
              {
                v123 = v56->i8[0];
                v56 = (int8x16_t *)((char *)v56 + 1);
                v115 = v115 + (float)(*(float *)v25 * (float)v123);
                v117 = v117 + (float)(*((float *)v25 + v13) * (float)v123);
                v119 = v119 + (float)(*((float *)v25 + 2 * v13) * (float)v123);
                v121 = v121 + (float)(*((float *)v25 + 3 * v13) * (float)v123);
                v25 = (_OWORD *)((char *)v25 + 4);
                --v122;
              }
              while (v122);
            }
            v110 = (float)(v9 * *v21) + (float)(v10 * v115);
            v111 = (float)(v9 * v21[1]) + (float)(v10 * v117);
            v112 = (float)(v9 * v21[2]) + (float)(v10 * v119);
            v113 = (float)(v9 * v21[3]) + (float)(v10 * v121);
          }
          else
          {
            v58 = 0;
            v59 = 0;
            __asm { FMOV            V7.2D, #1.0 }
            v197 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vdivq_f64(_Q7, vcvtq_f64_f32(*v23)), v10)), vmulq_n_f64(vdivq_f64(_Q7, vcvt_hight_f64_f32(*(float32x4_t *)v23->f32)), v10));
            v64 = 0.0;
            v65 = 4096;
            v66 = v196;
            v67 = 0.0;
            v68 = 0.0;
            v69 = 0.0;
            do
            {
              if (v13 >= v65)
                v70 = v65;
              else
                v70 = v13;
              v71 = (v59 + 1) << 12;
              if (v71 >= v13)
                v71 = v13;
              if (v58 >= v71 >> 4)
              {
                v89 = 0uLL;
                v90 = 0uLL;
                v91 = 0uLL;
                v92 = 0uLL;
                v85 = 0uLL;
                v86 = 0uLL;
                v87 = 0uLL;
                v88 = 0uLL;
                v79 = 0uLL;
                v81 = 0uLL;
                v83 = 0uLL;
                v84 = 0uLL;
                v72 = 0uLL;
                v73 = 0uLL;
                v74 = 0uLL;
                v77 = 0uLL;
              }
              else
              {
                v72 = 0uLL;
                v73 = 0uLL;
                v74 = 0uLL;
                v75 = 16 * v58;
                v76 = (v70 >> 4) - v58;
                v77 = 0uLL;
                v78 = v76;
                v79 = 0uLL;
                v80 = v66;
                v81 = 0uLL;
                v82 = v22;
                v83 = 0uLL;
                v84 = 0uLL;
                v85 = 0uLL;
                v86 = 0uLL;
                v87 = 0uLL;
                v88 = 0uLL;
                v89 = 0uLL;
                v90 = 0uLL;
                v91 = 0uLL;
                v92 = 0uLL;
                do
                {
                  v93 = *v80++;
                  v94 = vmovl_high_s8(v93);
                  v95 = vmovl_s8(*(int8x8_t *)v93.i8);
                  v96 = (int16x8_t *)((char *)v82 + 2 * v13);
                  v97 = (int16x8_t *)((char *)v82 + v20);
                  v98 = (int16x8_t *)((char *)v82 + 6 * v13);
                  v100 = *v82;
                  v99 = v82[1];
                  v82 += 2;
                  v89 = vmlal_s16(v89, *(int16x4_t *)v100.i8, *(int16x4_t *)v95.i8);
                  v90 = vmlal_high_s16(v90, v100, v95);
                  v91 = vmlal_s16(v91, *(int16x4_t *)v99.i8, *(int16x4_t *)v94.i8);
                  v92 = vmlal_high_s16(v92, v99, v94);
                  v101 = v96[1];
                  v85 = vmlal_s16(v85, *(int16x4_t *)v96->i8, *(int16x4_t *)v95.i8);
                  v86 = vmlal_high_s16(v86, *v96, v95);
                  v87 = vmlal_s16(v87, *(int16x4_t *)v101.i8, *(int16x4_t *)v94.i8);
                  v88 = vmlal_high_s16(v88, v101, v94);
                  v102 = v97[1];
                  v79 = vmlal_s16(v79, *(int16x4_t *)v97->i8, *(int16x4_t *)v95.i8);
                  v81 = vmlal_high_s16(v81, *v97, v95);
                  v83 = vmlal_s16(v83, *(int16x4_t *)v102.i8, *(int16x4_t *)v94.i8);
                  v84 = vmlal_high_s16(v84, v102, v94);
                  v103 = v98[1];
                  v72 = vmlal_s16(v72, *(int16x4_t *)v98->i8, *(int16x4_t *)v95.i8);
                  v73 = vmlal_high_s16(v73, *v98, v95);
                  v74 = vmlal_s16(v74, *(int16x4_t *)v103.i8, *(int16x4_t *)v94.i8);
                  v77 = vmlal_high_s16(v77, v103, v94);
                  --v78;
                }
                while (v78);
                v66 = (int8x16_t *)((char *)v66 + (v70 & 0xFFFFFFFFFFFFFFF0) - v75);
                v22 += 2 * v76;
                v58 = v70 >> 4;
              }
              v104 = vaddq_f32(vcvtq_f32_s32(v92), vaddq_f32(vcvtq_f32_s32(v91), vaddq_f32(vcvtq_f32_s32(v90), vcvtq_f32_s32(v89))));
              v64 = v64
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v104, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v104, 2), vaddq_f32(v104, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v104.f32, 1)))).f32[0];
              v105 = vaddq_f32(vcvtq_f32_s32(v88), vaddq_f32(vcvtq_f32_s32(v87), vaddq_f32(vcvtq_f32_s32(v86), vcvtq_f32_s32(v85))));
              v67 = v67
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v105, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v105, 2), vaddq_f32(v105, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v105.f32, 1)))).f32[0];
              v106 = vaddq_f32(vcvtq_f32_s32(v84), vaddq_f32(vcvtq_f32_s32(v83), vaddq_f32(vcvtq_f32_s32(v81), vcvtq_f32_s32(v79))));
              v107 = vaddq_f32(vcvtq_f32_s32(v77), vaddq_f32(vcvtq_f32_s32(v74), vaddq_f32(vcvtq_f32_s32(v73), vcvtq_f32_s32(v72))));
              v68 = v68
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v106, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v106, 2), vaddq_f32(v106, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v106.f32, 1)))).f32[0];
              v69 = v69
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v107, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v107, 2), vaddq_f32(v107, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v107.f32, 1)))).f32[0];
              v65 += 4096;
              _ZF = v59++ == v13 >> 12;
            }
            while (!_ZF);
            for (i = 16 * v58; i < v13; ++i)
            {
              v109 = v66->i8[0];
              v66 = (int8x16_t *)((char *)v66 + 1);
              v64 = v64 + (float)(v22->i16[0] * v109);
              v67 = v67 + (float)(v22->i16[v13] * v109);
              v68 = v68 + (float)(v22->i16[2 * v13] * v109);
              v69 = v69 + (float)(v22->i16[3 * v13] * v109);
              v22 = (int16x8_t *)((char *)v22 + 2);
            }
            v110 = (float)(*v21 * v9) + (float)(v64 * v197.f32[0]);
            v111 = (float)(v21[1] * v9) + (float)(v67 * v197.f32[1]);
            v112 = (float)(v21[2] * v9) + (float)(v68 * v197.f32[2]);
            v113 = (float)(v21[3] * v9) + (float)(v69 * v197.f32[3]);
            v12 = v195;
            v15 = v192;
            v14 = v193;
            v16 = v191;
          }
          *(float *)(v18 + 4 * (v4 + v19 * v11)) = v110;
          *(float *)(v18 + 4 * (v4 + v19 * (v11 | 1))) = v111;
          *(float *)(v18 + 4 * (v4 + v19 * (v11 | 2))) = v112;
          *(float *)(v18 + 4 * (v4 + v19 * (v11 | 3))) = v113;
          v11 += 4;
        }
        while (v11 < v12);
        result = v185;
        v5 = v185[6];
      }
      if (v11 < v5)
      {
        v124 = result[8];
        v125 = result[14];
        v126 = result[5];
        v127 = result[15] + 4 * v4;
        v128 = result[11];
        v129 = result[12];
        v130 = result[13];
        v131 = v124 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          if (v125)
            v132 = *(float *)(v125 + 4 * v11);
          else
            v132 = 0.0;
          v133 = v124 * v11;
          v134 = *(float *)(v129 + 4 * v11);
          if (v130)
          {
            v135 = 0;
            v136 = 0;
            v137 = (int16x8_t *)(v130 + 2 * v133);
            v138 = 1.0 / v132 * v10;
            v139 = 0.0;
            v140 = 4096;
            v141 = v196;
            do
            {
              if (v124 >= v140)
                v142 = v140;
              else
                v142 = v124;
              v143 = (v136 + 1) << 12;
              if (v143 >= v124)
                v143 = v124;
              if (v135 >= v143 >> 4)
              {
                v146 = 0uLL;
                v150 = 0uLL;
                v151 = 0uLL;
                v152 = 0uLL;
              }
              else
              {
                v144 = 16 * v135;
                v145 = (v142 >> 4) - v135;
                v146 = 0uLL;
                v147 = v145;
                v148 = v141;
                v149 = v137;
                v150 = 0uLL;
                v151 = 0uLL;
                v152 = 0uLL;
                do
                {
                  v153 = *v148++;
                  v154 = vmovl_high_s8(v153);
                  v155 = vmovl_s8(*(int8x8_t *)v153.i8);
                  v157 = *v149;
                  v156 = v149[1];
                  v149 += 2;
                  v146 = vmlal_s16(v146, *(int16x4_t *)v157.i8, *(int16x4_t *)v155.i8);
                  v150 = vmlal_high_s16(v150, v157, v155);
                  v151 = vmlal_s16(v151, *(int16x4_t *)v156.i8, *(int16x4_t *)v154.i8);
                  v152 = vmlal_high_s16(v152, v156, v154);
                  --v147;
                }
                while (v147);
                v141 = (int8x16_t *)((char *)v141 + (v142 & 0xFFFFFFFFFFFFFFF0) - v144);
                v137 += 2 * v145;
                v135 = v142 >> 4;
              }
              v158 = vaddq_f32(vcvtq_f32_s32(v152), vaddq_f32(vcvtq_f32_s32(v151), vaddq_f32(vcvtq_f32_s32(v150), vcvtq_f32_s32(v146))));
              v139 = v139
                   + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v158, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v158, 2), vaddq_f32(v158, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v158.f32, 1)))).f32[0];
              v140 += 4096;
              _ZF = v136++ == v124 >> 12;
            }
            while (!_ZF);
            for (j = 16 * v135; j < v124; ++j)
            {
              v161 = v141->i8[0];
              v141 = (int8x16_t *)((char *)v141 + 1);
              v160 = v161;
              v162 = v137->i16[0];
              v137 = (int16x8_t *)((char *)v137 + 2);
              v139 = v139 + (float)(v162 * v160);
            }
            v163 = v138;
            v164 = (float)(v134 * v9) + (float)(v139 * v163);
          }
          else
          {
            v165 = (_OWORD *)(v128 + 4 * v133);
            if (v131)
            {
              v166 = 0;
              v167 = 0uLL;
              v168 = 0uLL;
              v169 = 0uLL;
              v170 = 0uLL;
              do
              {
                v171 = *(int8x16_t *)(v8 + v166);
                v172 = (int8x8_t)vextq_s8(v171, v171, 8uLL).u64[0];
                v173 = *((float32x4_t *)v165 + 2);
                v174 = *((float32x4_t *)v165 + 3);
                v175 = *(float32x4_t *)v165;
                v176 = *((float32x4_t *)v165 + 1);
                v165 += 4;
                v168 = vmlaq_f32(v168, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v171.i8, 0), 8uLL), 8uLL))), v176);
                v167 = vmlaq_f32(v167, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v171.i8, 0), 8uLL), 8uLL))), v175);
                v170 = vmlaq_f32(v170, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v172, 0), 8uLL), 8uLL))), v174);
                v169 = vmlaq_f32(v169, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v172, 0), 8uLL), 8uLL))), v173);
                v166 += 16;
              }
              while (v166 < v131);
              v177 = (int8x16_t *)(v8 + v166);
              v178 = (((v124 & 0xFFFFFFFFFFFFFFF0) - 1) & 0xFFFFFFFFFFFFFFF0) + 16;
            }
            else
            {
              v178 = 0;
              v167 = 0uLL;
              v168 = 0uLL;
              v169 = 0uLL;
              v177 = v196;
              v170 = 0uLL;
            }
            v179 = vaddq_f32(v170, vaddq_f32(v169, vaddq_f32(v168, vaddq_f32(v167, (float32x4_t)0))));
            LODWORD(v180) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v179, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v179, 2), vaddq_f32(v179, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v179.f32, 1)))).u32[0];
            _CF = v124 >= v178;
            v181 = v124 - v178;
            if (v181 != 0 && _CF)
            {
              do
              {
                v182 = *(float *)v165;
                v165 = (_OWORD *)((char *)v165 + 4);
                v183 = v182;
                v184 = v177->i8[0];
                v177 = (int8x16_t *)((char *)v177 + 1);
                v180 = v180 + (float)(v183 * (float)v184);
                --v181;
              }
              while (v181);
            }
            v164 = (float)(v180 * v10) + (float)(v134 * v9);
          }
          *(float *)(v127 + 4 * v126 * v11++) = v164;
        }
        while (v11 < v5);
      }
      ++v4;
      v6 = v188;
      v8 += v188;
      v7 = v186;
    }
    while (v4 != v190);
  }
  return result;
}

_QWORD *___ZN8Espresso30kaldi_like_sgemv_float_genericIhEEvPKT_PKfS5_S5_PfmRKNS_22inner_product_uniformsEb_block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float *v23;
  int16x8_t *v24;
  float32x2_t *v25;
  float32x4_t *v27;
  unint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  int8x16_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  uint8x16_t *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  float v58;
  unint64_t v59;
  uint8x16_t *v60;
  float v61;
  float v62;
  float v63;
  unint64_t v64;
  unint64_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  uint64_t v69;
  unint64_t v70;
  int32x4_t v71;
  unint64_t v72;
  int32x4_t v73;
  uint8x16_t *v74;
  int32x4_t v75;
  int16x8_t *v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int32x4_t v86;
  uint8x16_t v87;
  int16x8_t v88;
  int16x8_t v89;
  int16x8_t *v90;
  int16x8_t *v91;
  int16x8_t *v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  unint64_t i;
  int v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float32x4_t v108;
  float v109;
  float32x4_t v110;
  float v111;
  float32x4_t v112;
  float v113;
  float32x4_t v114;
  float v115;
  unint64_t v116;
  unsigned int v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  float v126;
  unint64_t v127;
  float v128;
  unint64_t v129;
  uint64_t v130;
  int16x8_t *v131;
  double v132;
  float v133;
  unint64_t v134;
  uint8x16_t *v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  int32x4_t v140;
  unint64_t v141;
  uint8x16_t *v142;
  int16x8_t *v143;
  int32x4_t v144;
  int32x4_t v145;
  int32x4_t v146;
  uint8x16_t v147;
  int16x8_t v148;
  int16x8_t v149;
  int16x8_t v150;
  int16x8_t v151;
  float32x4_t v152;
  unint64_t j;
  int v154;
  int v155;
  int v156;
  float v157;
  float v158;
  float32x4_t *v159;
  unint64_t v160;
  float32x4_t v161;
  float32x4_t v162;
  float32x4_t v163;
  float32x4_t v164;
  int8x16_t v165;
  uint8x16_t *v166;
  unint64_t v167;
  float32x4_t v168;
  float v169;
  unint64_t v170;
  float v171;
  float v172;
  unsigned int v173;
  _QWORD *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  uint8x16_t *v185;
  float32x4_t v186;

  v2 = result[4];
  v3 = result[5];
  v4 = v2 * a2;
  if (v3 >= v2 * a2 + v2)
    v3 = v2 * a2 + v2;
  v179 = v3;
  if (v4 < v3)
  {
    v5 = result[6];
    v6 = result[8];
    v176 = result[9];
    v7 = result[10];
    v178 = result[7];
    v8 = v178 + v2 * v6 * a2;
    v174 = result;
    v175 = v7;
    v177 = v6;
    do
    {
      if (v7)
        v9 = *(float *)(v7 + 4 * v4);
      else
        v9 = 0.0;
      v185 = (uint8x16_t *)(v178 + v6 * v4);
      v10 = *(float *)(v176 + 4 * v4);
      v11 = 0;
      v12 = v5 & 0xFFFFFFFFFFFFFFFCLL;
      if ((v5 & 0xFFFFFFFFFFFFFFFCLL) != 0)
      {
        v13 = result[8];
        v14 = result[12];
        v183 = result[11];
        v184 = v5 & 0xFFFFFFFFFFFFFFFCLL;
        v15 = result[13];
        v16 = result[14];
        v17 = v13 & 0xFFFFFFFFFFFFFFF0;
        v180 = v16;
        v18 = result[15];
        v19 = 12 * v13;
        v20 = 8 * v13;
        v21 = result[5];
        v22 = 4 * v13;
        v181 = v15;
        v182 = v14;
        do
        {
          v23 = (float *)(v14 + 4 * v11);
          if (v15)
            v24 = (int16x8_t *)(v15 + 2 * v13 * v11);
          else
            v24 = 0;
          v25 = (float32x2_t *)(v16 + 4 * v11);
          if (!v16)
            v25 = 0;
          if (v24)
            _ZF = v25 == 0;
          else
            _ZF = 1;
          if (_ZF)
          {
            v27 = (float32x4_t *)(v183 + 4 * v13 * v11);
            if (v17)
            {
              v28 = 0;
              v29 = 0uLL;
              v30 = 0uLL;
              v31 = 0uLL;
              v32 = 0uLL;
              v33 = 0uLL;
              v34 = 0uLL;
              v35 = 0uLL;
              v36 = 0uLL;
              v37 = 0uLL;
              v38 = 0uLL;
              v39 = 0uLL;
              v40 = 0uLL;
              v41 = 0uLL;
              v42 = 0uLL;
              v43 = 0uLL;
              v44 = 0uLL;
              do
              {
                v45 = *(int8x16_t *)(v8 + v28);
                v46 = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v45, (int8x16_t)xmmword_191A74190));
                v47 = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v45, (int8x16_t)xmmword_191A741A0));
                v48 = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v45, (int8x16_t)xmmword_191A741B0));
                v49 = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v45, (int8x16_t)xmmword_191A741C0));
                v32 = vmlaq_f32(v32, v49, v27[3]);
                v31 = vmlaq_f32(v31, v48, v27[2]);
                v30 = vmlaq_f32(v30, v47, v27[1]);
                v29 = vmlaq_f32(v29, v46, *v27);
                v36 = vmlaq_f32(v36, v49, *(float32x4_t *)((char *)v27 + v22 + 48));
                v35 = vmlaq_f32(v35, v48, *(float32x4_t *)((char *)v27 + v22 + 32));
                v34 = vmlaq_f32(v34, v47, *(float32x4_t *)((char *)v27 + v22 + 16));
                v33 = vmlaq_f32(v33, v46, *(float32x4_t *)((char *)v27 + 4 * v13));
                v44 = vmlaq_f32(v44, v49, *(float32x4_t *)((char *)v27 + v20 + 48));
                v43 = vmlaq_f32(v43, v48, *(float32x4_t *)((char *)v27 + v20 + 32));
                v42 = vmlaq_f32(v42, v47, *(float32x4_t *)((char *)v27 + v20 + 16));
                v41 = vmlaq_f32(v41, v46, *(float32x4_t *)((char *)v27 + 8 * v13));
                v40 = vmlaq_f32(v40, v49, *(float32x4_t *)((char *)v27 + v19 + 48));
                v39 = vmlaq_f32(v39, v48, *(float32x4_t *)((char *)v27 + v19 + 32));
                v38 = vmlaq_f32(v38, v47, *(float32x4_t *)((char *)v27 + v19 + 16));
                v37 = vmlaq_f32(v37, v46, *(float32x4_t *)((char *)v27 + 12 * v13));
                v27 += 4;
                v28 += 16;
              }
              while (v28 < v17);
              v50 = (uint8x16_t *)(v8 + v28);
              v51 = (((v13 & 0xFFFFFFFFFFFFFFF0) - 1) & 0xFFFFFFFFFFFFFFF0) + 16;
            }
            else
            {
              v51 = 0;
              v41 = 0uLL;
              v42 = 0uLL;
              v43 = 0uLL;
              v44 = 0uLL;
              v37 = 0uLL;
              v38 = 0uLL;
              v39 = 0uLL;
              v40 = 0uLL;
              v33 = 0uLL;
              v34 = 0uLL;
              v35 = 0uLL;
              v36 = 0uLL;
              v29 = 0uLL;
              v30 = 0uLL;
              v31 = 0uLL;
              v50 = v185;
              v32 = 0uLL;
            }
            v108 = vaddq_f32(v32, vaddq_f32(v31, vaddq_f32(v30, vaddq_f32(v29, (float32x4_t)0))));
            LODWORD(v109) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v108, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v108, 2), vaddq_f32(v108, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v108.f32, 1)))).u32[0];
            v110 = vaddq_f32(v36, vaddq_f32(v35, vaddq_f32(v34, vaddq_f32(v33, (float32x4_t)0))));
            LODWORD(v111) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v110, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v110, 2), vaddq_f32(v110, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v110.f32, 1)))).u32[0];
            v112 = vaddq_f32(v44, vaddq_f32(v43, vaddq_f32(v42, vaddq_f32(v41, (float32x4_t)0))));
            LODWORD(v113) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v112, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v112, 2), vaddq_f32(v112, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v112.f32, 1)))).u32[0];
            v114 = vaddq_f32(v40, vaddq_f32(v39, vaddq_f32(v38, vaddq_f32(v37, (float32x4_t)0))));
            LODWORD(v115) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v114, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v114, 2), vaddq_f32(v114, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v114.f32, 1)))).u32[0];
            _CF = v13 >= v51;
            v116 = v13 - v51;
            if (v116 != 0 && _CF)
            {
              do
              {
                v117 = v50->u8[0];
                v50 = (uint8x16_t *)((char *)v50 + 1);
                v109 = v109 + (float)(v27->f32[0] * (float)v117);
                v111 = v111 + (float)(v27->f32[v13] * (float)v117);
                v113 = v113 + (float)(v27->f32[2 * v13] * (float)v117);
                v115 = v115 + (float)(v27->f32[3 * v13] * (float)v117);
                v27 = (float32x4_t *)((char *)v27 + 4);
                --v116;
              }
              while (v116);
            }
            v104 = (float)(v9 * *v23) + (float)(v10 * v109);
            v105 = (float)(v9 * v23[1]) + (float)(v10 * v111);
            v106 = (float)(v9 * v23[2]) + (float)(v10 * v113);
            v107 = (float)(v9 * v23[3]) + (float)(v10 * v115);
          }
          else
          {
            v52 = 0;
            v53 = 0;
            __asm { FMOV            V19.2D, #1.0 }
            v186 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vdivq_f64(_Q19, vcvtq_f64_f32(*v25)), v10)), vmulq_n_f64(vdivq_f64(_Q19, vcvt_hight_f64_f32(*(float32x4_t *)v25->f32)), v10));
            v58 = 0.0;
            v59 = 4096;
            v60 = v185;
            v61 = 0.0;
            v62 = 0.0;
            v63 = 0.0;
            do
            {
              if (v13 >= v59)
                v64 = v59;
              else
                v64 = v13;
              v65 = (v53 + 1) << 12;
              if (v65 >= v13)
                v65 = v13;
              if (v52 >= v65 >> 4)
              {
                v83 = 0uLL;
                v84 = 0uLL;
                v85 = 0uLL;
                v86 = 0uLL;
                v79 = 0uLL;
                v80 = 0uLL;
                v81 = 0uLL;
                v82 = 0uLL;
                v73 = 0uLL;
                v75 = 0uLL;
                v77 = 0uLL;
                v78 = 0uLL;
                v66 = 0uLL;
                v67 = 0uLL;
                v68 = 0uLL;
                v71 = 0uLL;
              }
              else
              {
                v66 = 0uLL;
                v67 = 0uLL;
                v68 = 0uLL;
                v69 = 16 * v52;
                v70 = (v64 >> 4) - v52;
                v71 = 0uLL;
                v72 = v70;
                v73 = 0uLL;
                v74 = v60;
                v75 = 0uLL;
                v76 = v24;
                v77 = 0uLL;
                v78 = 0uLL;
                v79 = 0uLL;
                v80 = 0uLL;
                v81 = 0uLL;
                v82 = 0uLL;
                v83 = 0uLL;
                v84 = 0uLL;
                v85 = 0uLL;
                v86 = 0uLL;
                do
                {
                  v87 = *v74++;
                  v88 = (int16x8_t)vmovl_high_u8(v87);
                  v89 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v87.i8);
                  v90 = (int16x8_t *)((char *)v76 + 2 * v13);
                  v91 = (int16x8_t *)((char *)v76 + v22);
                  v92 = (int16x8_t *)((char *)v76 + 6 * v13);
                  v93 = *v76;
                  v94 = v76[1];
                  v76 += 2;
                  v83 = vmlal_s16(v83, *(int16x4_t *)v93.i8, *(int16x4_t *)v89.i8);
                  v84 = vmlal_high_s16(v84, v93, v89);
                  v85 = vmlal_s16(v85, *(int16x4_t *)v94.i8, *(int16x4_t *)v88.i8);
                  v86 = vmlal_high_s16(v86, v94, v88);
                  v95 = v90[1];
                  v79 = vmlal_s16(v79, *(int16x4_t *)v90->i8, *(int16x4_t *)v89.i8);
                  v80 = vmlal_high_s16(v80, *v90, v89);
                  v81 = vmlal_s16(v81, *(int16x4_t *)v95.i8, *(int16x4_t *)v88.i8);
                  v82 = vmlal_high_s16(v82, v95, v88);
                  v96 = v91[1];
                  v73 = vmlal_s16(v73, *(int16x4_t *)v91->i8, *(int16x4_t *)v89.i8);
                  v75 = vmlal_high_s16(v75, *v91, v89);
                  v77 = vmlal_s16(v77, *(int16x4_t *)v96.i8, *(int16x4_t *)v88.i8);
                  v78 = vmlal_high_s16(v78, v96, v88);
                  v97 = v92[1];
                  v66 = vmlal_s16(v66, *(int16x4_t *)v92->i8, *(int16x4_t *)v89.i8);
                  v67 = vmlal_high_s16(v67, *v92, v89);
                  v68 = vmlal_s16(v68, *(int16x4_t *)v97.i8, *(int16x4_t *)v88.i8);
                  v71 = vmlal_high_s16(v71, v97, v88);
                  --v72;
                }
                while (v72);
                v60 = (uint8x16_t *)((char *)v60 + (v64 & 0xFFFFFFFFFFFFFFF0) - v69);
                v24 += 2 * v70;
                v52 = v64 >> 4;
              }
              v98 = vaddq_f32(vcvtq_f32_s32(v86), vaddq_f32(vcvtq_f32_s32(v85), vaddq_f32(vcvtq_f32_s32(v84), vcvtq_f32_s32(v83))));
              v58 = v58
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v98, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v98, 2), vaddq_f32(v98, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v98.f32, 1)))).f32[0];
              v99 = vaddq_f32(vcvtq_f32_s32(v82), vaddq_f32(vcvtq_f32_s32(v81), vaddq_f32(vcvtq_f32_s32(v80), vcvtq_f32_s32(v79))));
              v61 = v61
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v99, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v99, 2), vaddq_f32(v99, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 1)))).f32[0];
              v100 = vaddq_f32(vcvtq_f32_s32(v78), vaddq_f32(vcvtq_f32_s32(v77), vaddq_f32(vcvtq_f32_s32(v75), vcvtq_f32_s32(v73))));
              v101 = vaddq_f32(vcvtq_f32_s32(v71), vaddq_f32(vcvtq_f32_s32(v68), vaddq_f32(vcvtq_f32_s32(v67), vcvtq_f32_s32(v66))));
              v62 = v62
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v100, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v100, 2), vaddq_f32(v100, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v100.f32, 1)))).f32[0];
              v63 = v63
                  + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v101, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v101, 2), vaddq_f32(v101, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v101.f32, 1)))).f32[0];
              v59 += 4096;
              _ZF = v53++ == v13 >> 12;
            }
            while (!_ZF);
            for (i = 16 * v52; i < v13; ++i)
            {
              v103 = v60->u8[0];
              v60 = (uint8x16_t *)((char *)v60 + 1);
              v58 = v58 + (float)(v24->i16[0] * v103);
              v61 = v61 + (float)(v24->i16[v13] * v103);
              v62 = v62 + (float)(v24->i16[2 * v13] * v103);
              v63 = v63 + (float)(v24->i16[3 * v13] * v103);
              v24 = (int16x8_t *)((char *)v24 + 2);
            }
            v104 = (float)(*v23 * v9) + (float)(v58 * v186.f32[0]);
            v105 = (float)(v23[1] * v9) + (float)(v61 * v186.f32[1]);
            v106 = (float)(v23[2] * v9) + (float)(v62 * v186.f32[2]);
            v107 = (float)(v23[3] * v9) + (float)(v63 * v186.f32[3]);
            v12 = v184;
            v15 = v181;
            v14 = v182;
            v16 = v180;
          }
          *(float *)(v18 + 4 * (v4 + v21 * v11)) = v104;
          *(float *)(v18 + 4 * (v4 + v21 * (v11 | 1))) = v105;
          *(float *)(v18 + 4 * (v4 + v21 * (v11 | 2))) = v106;
          *(float *)(v18 + 4 * (v4 + v21 * (v11 | 3))) = v107;
          v11 += 4;
        }
        while (v11 < v12);
        result = v174;
        v5 = v174[6];
      }
      if (v11 < v5)
      {
        v118 = result[8];
        v119 = result[14];
        v120 = result[5];
        v121 = result[15] + 4 * v4;
        v122 = result[11];
        v123 = result[12];
        v124 = result[13];
        v125 = v118 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          if (v119)
            v126 = *(float *)(v119 + 4 * v11);
          else
            v126 = 0.0;
          v127 = v118 * v11;
          v128 = *(float *)(v123 + 4 * v11);
          if (v124)
          {
            v129 = 0;
            v130 = 0;
            v131 = (int16x8_t *)(v124 + 2 * v127);
            v132 = 1.0 / v126 * v10;
            v133 = 0.0;
            v134 = 4096;
            v135 = v185;
            do
            {
              if (v118 >= v134)
                v136 = v134;
              else
                v136 = v118;
              v137 = (v130 + 1) << 12;
              if (v137 >= v118)
                v137 = v118;
              if (v129 >= v137 >> 4)
              {
                v140 = 0uLL;
                v144 = 0uLL;
                v145 = 0uLL;
                v146 = 0uLL;
              }
              else
              {
                v138 = 16 * v129;
                v139 = (v136 >> 4) - v129;
                v140 = 0uLL;
                v141 = v139;
                v142 = v135;
                v143 = v131;
                v144 = 0uLL;
                v145 = 0uLL;
                v146 = 0uLL;
                do
                {
                  v147 = *v142++;
                  v148 = (int16x8_t)vmovl_high_u8(v147);
                  v149 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v147.i8);
                  v151 = *v143;
                  v150 = v143[1];
                  v143 += 2;
                  v140 = vmlal_s16(v140, *(int16x4_t *)v151.i8, *(int16x4_t *)v149.i8);
                  v144 = vmlal_high_s16(v144, v151, v149);
                  v145 = vmlal_s16(v145, *(int16x4_t *)v150.i8, *(int16x4_t *)v148.i8);
                  v146 = vmlal_high_s16(v146, v150, v148);
                  --v141;
                }
                while (v141);
                v135 = (uint8x16_t *)((char *)v135 + (v136 & 0xFFFFFFFFFFFFFFF0) - v138);
                v131 += 2 * v139;
                v129 = v136 >> 4;
              }
              v152 = vaddq_f32(vcvtq_f32_s32(v146), vaddq_f32(vcvtq_f32_s32(v145), vaddq_f32(vcvtq_f32_s32(v144), vcvtq_f32_s32(v140))));
              v133 = v133
                   + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v152, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v152, 2), vaddq_f32(v152, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v152.f32, 1)))).f32[0];
              v134 += 4096;
              _ZF = v130++ == v118 >> 12;
            }
            while (!_ZF);
            for (j = 16 * v129; j < v118; ++j)
            {
              v155 = v135->u8[0];
              v135 = (uint8x16_t *)((char *)v135 + 1);
              v154 = v155;
              v156 = v131->i16[0];
              v131 = (int16x8_t *)((char *)v131 + 2);
              v133 = v133 + (float)(v156 * v154);
            }
            v157 = v132;
            v158 = (float)(v128 * v9) + (float)(v133 * v157);
          }
          else
          {
            v159 = (float32x4_t *)(v122 + 4 * v127);
            if (v125)
            {
              v160 = 0;
              v161 = 0uLL;
              v162 = 0uLL;
              v163 = 0uLL;
              v164 = 0uLL;
              do
              {
                v165 = *(int8x16_t *)(v8 + v160);
                v164 = vmlaq_f32(v164, vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v165, (int8x16_t)xmmword_191A741C0)), v159[3]);
                v163 = vmlaq_f32(v163, vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v165, (int8x16_t)xmmword_191A741B0)), v159[2]);
                v162 = vmlaq_f32(v162, vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v165, (int8x16_t)xmmword_191A741A0)), v159[1]);
                v161 = vmlaq_f32(v161, vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v165, (int8x16_t)xmmword_191A74190)), *v159);
                v159 += 4;
                v160 += 16;
              }
              while (v160 < v125);
              v166 = (uint8x16_t *)(v8 + v160);
              v167 = (((v118 & 0xFFFFFFFFFFFFFFF0) - 1) & 0xFFFFFFFFFFFFFFF0) + 16;
            }
            else
            {
              v167 = 0;
              v161 = 0uLL;
              v162 = 0uLL;
              v163 = 0uLL;
              v166 = v185;
              v164 = 0uLL;
            }
            v168 = vaddq_f32(v164, vaddq_f32(v163, vaddq_f32(v162, vaddq_f32(v161, (float32x4_t)0))));
            LODWORD(v169) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v168, 3), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v168, 2), vaddq_f32(v168, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v168.f32, 1)))).u32[0];
            _CF = v118 >= v167;
            v170 = v118 - v167;
            if (v170 != 0 && _CF)
            {
              do
              {
                v171 = v159->f32[0];
                v159 = (float32x4_t *)((char *)v159 + 4);
                v172 = v171;
                v173 = v166->u8[0];
                v166 = (uint8x16_t *)((char *)v166 + 1);
                v169 = v169 + (float)(v172 * (float)v173);
                --v170;
              }
              while (v170);
            }
            v158 = (float)(v169 * v10) + (float)(v128 * v9);
          }
          *(float *)(v121 + 4 * v120 * v11++) = v158;
        }
        while (v11 < v5);
      }
      ++v4;
      v6 = v177;
      v8 += v177;
      v7 = v175;
    }
    while (v4 != v179);
  }
  return result;
}

@end
