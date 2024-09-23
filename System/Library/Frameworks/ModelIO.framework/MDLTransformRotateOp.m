@implementation MDLTransformRotateOp

- (MDLTransformRotateOp)initWithName:(id)a3 inverse:(BOOL)a4 order:(unint64_t)a5 data:(id)a6
{
  id v11;
  id v12;
  MDLTransformRotateOp *v13;
  MDLTransformRotateOp *v14;
  MDLTransformRotateOp *v15;
  objc_super v17;

  v11 = a3;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MDLTransformRotateOp;
  v13 = -[MDLTransformRotateOp init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_animatedValue, a6);
    objc_storeStrong((id *)&v14->_name, a3);
    v14->_order = a5;
    v14->_inverse = a4;
    v15 = v14;
  }

  return v14;
}

- (BOOL)IsInverseOp
{
  return self->_inverse;
}

- (void)float4x4AtTime:(uint64_t)a3
{
  __int128 v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  uint64_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  __int128 v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t *v63;
  uint64_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t *v79;
  uint64_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t *v95;
  uint64_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t *v111;
  uint64_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115;
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t *v127;
  uint64_t v128;
  float64x2_t v129;
  float64x2_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  __int128 v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t *v143;
  uint64_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t v158;
  float64x2_t *v159;
  uint64_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  float64x2_t v164;
  float64x2_t v165;
  float64x2_t v166;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t v169;
  __int128 v170;
  float64x2_t v171;
  float64x2_t v172;
  float64x2_t v173;
  float64x2_t v174;
  float64x2_t *v175;
  uint64_t v176;
  float64x2_t v177;
  float64x2_t v178;
  float64x2_t v179;
  float64x2_t v180;
  float64x2_t v181;
  float64x2_t v182;
  float64x2_t v183;
  float64x2_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t *v191;
  uint64_t v192;
  float64x2_t v193;
  float64x2_t v194;
  float64x2_t v195;
  float64x2_t v196;
  float64x2_t v197;
  float64x2_t v198;
  float64x2_t v199;
  float64x2_t v200;
  float64x2_t v201;
  float64x2_t v202;
  float64x2_t v203;
  float64x2_t v204;
  float64x2_t v205;
  float64x2_t v206;
  float64x2_t *v207;
  uint64_t v208;
  float64x2_t v209;
  float64x2_t v210;
  float64x2_t v211;
  float64x2_t v212;
  float64x2_t v213;
  float64x2_t v214;
  float64x2_t v215;
  float64x2_t v216;
  float64x2_t v217;
  __int128 v218;
  float64x2_t v219;
  float64x2_t v220;
  float64x2_t v221;
  float64x2_t v222;
  float64x2_t *v223;
  uint64_t v224;
  float64x2_t v225;
  float64x2_t v226;
  float64x2_t v227;
  float64x2_t v228;
  float64x2_t v229;
  float64x2_t v230;
  float64x2_t v231;
  float64x2_t v232;
  float64x2_t v233;
  float64x2_t v234;
  float64x2_t v235;
  float64x2_t v236;
  float64x2_t v237;
  float64x2_t v238;
  float64x2_t *v239;
  uint64_t v240;
  int v241;
  __int128 v242;
  __int128 v243;
  float v244;
  __int128 v245;
  __int128 v246;
  __int128 vars0;
  simd_float4x4 v248;

  objc_msgSend_float3AtTime_(*(void **)(a1 + 24), a2, a3);
  v245 = v42;
  *(_OWORD *)&STACK[0x5F0] = 0u;
  *(_OWORD *)&STACK[0x600] = 0u;
  *(_OWORD *)&STACK[0x5D0] = 0u;
  *(_OWORD *)&STACK[0x5E0] = 0u;
  *(_OWORD *)&STACK[0x5B0] = 0u;
  *(_OWORD *)&STACK[0x5C0] = 0u;
  *(_OWORD *)&STACK[0x590] = 0u;
  *(_OWORD *)&STACK[0x5A0] = 0u;
  v43.f64[0] = 0.0;
  sub_1DCB51168((uint64_t)&STACK[0x590], *(float *)&v42 * 0.0174532925, (float64x2_t)COERCE_UNSIGNED_INT64(1.0), 0.0, v43);
  a41 = 0u;
  *(_OWORD *)&STACK[0x580] = 0u;
  a39 = 0u;
  a40 = 0u;
  a37 = 0u;
  a38 = 0u;
  a35 = 0u;
  a36 = 0u;
  v44.f64[0] = 0.0;
  v45.f64[0] = 0.0;
  sub_1DCB51168((uint64_t)&a35, *((float *)&v245 + 1) * 0.0174532925, v44, 1.0, v45);
  a33 = 0u;
  a34 = 0u;
  a31 = 0u;
  a32 = 0u;
  a29 = 0u;
  a30 = 0u;
  a27 = 0u;
  a28 = 0u;
  v46.f64[0] = 0.0;
  v47.f64[0] = 1.0;
  sub_1DCB51168((uint64_t)&a27, *((float *)&v245 + 2) * 0.0174532925, v46, 0.0, v47);
  a25 = 0u;
  a26 = 0u;
  a23 = 0u;
  a24 = 0u;
  a21 = 0u;
  a22 = 0u;
  a19 = 0u;
  a20 = 0u;
  switch(*(_QWORD *)(a1 + 32))
  {
    case 1:
      v48 = 0;
      v50 = a27;
      v49 = a28;
      v52 = a29;
      v51 = a30;
      v54 = a31;
      v53 = a32;
      v56 = a33;
      v55 = a34;
      v57 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v57;
      v58 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v58;
      v59 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v59;
      v60 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v60;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v62 = *(float64x2_t *)((char *)&STACK[0x610] + v48);
        v61 = *(float64x2_t *)((char *)&STACK[0x610] + v48 + 16);
        v63 = (float64x2_t *)((char *)&a11 + v48);
        *v63 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v50, v62.f64[0]), v52, v62, 1), v54, v61.f64[0]), v56, v61, 1);
        v63[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v49, v62.f64[0]), v51, v62, 1), v53, v61.f64[0]), v55, v61, 1);
        v48 += 32;
      }
      while (v48 != 128);
      v64 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      v66 = a11;
      v65 = a12;
      v68 = a13;
      v67 = a14;
      v70 = a15;
      v69 = a16;
      v72 = a17;
      v71 = a18;
      v73 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v73;
      v74 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v74;
      v75 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v75;
      v76 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v76;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v78 = *(float64x2_t *)((char *)&STACK[0x610] + v64);
        v77 = *(float64x2_t *)((char *)&STACK[0x610] + v64 + 16);
        v79 = (float64x2_t *)((char *)&a11 + v64);
        *v79 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v66, v78.f64[0]), v68, v78, 1), v70, v77.f64[0]), v72, v77, 1);
        v79[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v65, v78.f64[0]), v67, v78, 1), v69, v77.f64[0]), v71, v77, 1);
        v64 += 32;
      }
      while (v64 != 128);
      goto LABEL_31;
    case 2:
      v80 = 0;
      v82 = a35;
      v81 = a36;
      v84 = a37;
      v83 = a38;
      v86 = a39;
      v85 = a40;
      v88 = a41;
      v87 = *(float64x2_t *)&STACK[0x580];
      v89 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v89;
      v90 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v90;
      v91 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v91;
      v92 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v92;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v94 = *(float64x2_t *)((char *)&STACK[0x610] + v80);
        v93 = *(float64x2_t *)((char *)&STACK[0x610] + v80 + 16);
        v95 = (float64x2_t *)((char *)&a11 + v80);
        *v95 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v82, v94.f64[0]), v84, v94, 1), v86, v93.f64[0]), v88, v93, 1);
        v95[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v81, v94.f64[0]), v83, v94, 1), v85, v93.f64[0]), v87, v93, 1);
        v80 += 32;
      }
      while (v80 != 128);
      v96 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      v98 = a11;
      v97 = a12;
      v100 = a13;
      v99 = a14;
      v102 = a15;
      v101 = a16;
      v104 = a17;
      v103 = a18;
      v105 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v105;
      v106 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v106;
      v107 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v107;
      v108 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v108;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v110 = *(float64x2_t *)((char *)&STACK[0x610] + v96);
        v109 = *(float64x2_t *)((char *)&STACK[0x610] + v96 + 16);
        v111 = (float64x2_t *)((char *)&a11 + v96);
        *v111 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v98, v110.f64[0]), v100, v110, 1), v102, v109.f64[0]), v104, v109, 1);
        v111[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v97, v110.f64[0]), v99, v110, 1), v101, v109.f64[0]), v103, v109, 1);
        v96 += 32;
      }
      while (v96 != 128);
      goto LABEL_31;
    case 3:
      v112 = 0;
      v114 = a27;
      v113 = a28;
      v116 = a29;
      v115 = a30;
      v118 = a31;
      v117 = a32;
      v120 = a33;
      v119 = a34;
      v121 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v121;
      v122 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v122;
      v123 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v123;
      v124 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v124;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v126 = *(float64x2_t *)((char *)&STACK[0x610] + v112);
        v125 = *(float64x2_t *)((char *)&STACK[0x610] + v112 + 16);
        v127 = (float64x2_t *)((char *)&a11 + v112);
        *v127 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v114, v126.f64[0]), v116, v126, 1), v118, v125.f64[0]), v120, v125, 1);
        v127[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v113, v126.f64[0]), v115, v126, 1), v117, v125.f64[0]), v119, v125, 1);
        v112 += 32;
      }
      while (v112 != 128);
      v128 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      v130 = a11;
      v129 = a12;
      v132 = a13;
      v131 = a14;
      v134 = a15;
      v133 = a16;
      v136 = a17;
      v135 = a18;
      v137 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v137;
      v138 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v138;
      v139 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v139;
      v140 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v140;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v142 = *(float64x2_t *)((char *)&STACK[0x610] + v128);
        v141 = *(float64x2_t *)((char *)&STACK[0x610] + v128 + 16);
        v143 = (float64x2_t *)((char *)&a11 + v128);
        *v143 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v130, v142.f64[0]), v132, v142, 1), v134, v141.f64[0]), v136, v141, 1);
        v143[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v129, v142.f64[0]), v131, v142, 1), v133, v141.f64[0]), v135, v141, 1);
        v128 += 32;
      }
      while (v128 != 128);
      goto LABEL_31;
    case 4:
      v144 = 0;
      v146 = *(float64x2_t *)&STACK[0x590];
      v145 = *(float64x2_t *)&STACK[0x5A0];
      v148 = *(float64x2_t *)&STACK[0x5B0];
      v147 = *(float64x2_t *)&STACK[0x5C0];
      v150 = *(float64x2_t *)&STACK[0x5D0];
      v149 = *(float64x2_t *)&STACK[0x5E0];
      v152 = *(float64x2_t *)&STACK[0x5F0];
      v151 = *(float64x2_t *)&STACK[0x600];
      v153 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v153;
      v154 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v154;
      v155 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v155;
      v156 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v156;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v158 = *(float64x2_t *)((char *)&STACK[0x610] + v144);
        v157 = *(float64x2_t *)((char *)&STACK[0x610] + v144 + 16);
        v159 = (float64x2_t *)((char *)&a11 + v144);
        *v159 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v146, v158.f64[0]), v148, v158, 1), v150, v157.f64[0]), v152, v157, 1);
        v159[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v145, v158.f64[0]), v147, v158, 1), v149, v157.f64[0]), v151, v157, 1);
        v144 += 32;
      }
      while (v144 != 128);
      v160 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      v162 = a11;
      v161 = a12;
      v164 = a13;
      v163 = a14;
      v166 = a15;
      v165 = a16;
      v168 = a17;
      v167 = a18;
      v169 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v169;
      v170 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v170;
      v171 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v171;
      v172 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v172;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v174 = *(float64x2_t *)((char *)&STACK[0x610] + v160);
        v173 = *(float64x2_t *)((char *)&STACK[0x610] + v160 + 16);
        v175 = (float64x2_t *)((char *)&a11 + v160);
        *v175 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v162, v174.f64[0]), v164, v174, 1), v166, v173.f64[0]), v168, v173, 1);
        v175[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v161, v174.f64[0]), v163, v174, 1), v165, v173.f64[0]), v167, v173, 1);
        v160 += 32;
      }
      while (v160 != 128);
      goto LABEL_31;
    case 5:
      v176 = 0;
      v178 = a35;
      v177 = a36;
      v180 = a37;
      v179 = a38;
      v182 = a39;
      v181 = a40;
      v184 = a41;
      v183 = *(float64x2_t *)&STACK[0x580];
      v185 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v185;
      v186 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v186;
      v187 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v187;
      v188 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v188;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v190 = *(float64x2_t *)((char *)&STACK[0x610] + v176);
        v189 = *(float64x2_t *)((char *)&STACK[0x610] + v176 + 16);
        v191 = (float64x2_t *)((char *)&a11 + v176);
        *v191 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v178, v190.f64[0]), v180, v190, 1), v182, v189.f64[0]), v184, v189, 1);
        v191[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v177, v190.f64[0]), v179, v190, 1), v181, v189.f64[0]), v183, v189, 1);
        v176 += 32;
      }
      while (v176 != 128);
      v192 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      v194 = a11;
      v193 = a12;
      v196 = a13;
      v195 = a14;
      v198 = a15;
      v197 = a16;
      v200 = a17;
      v199 = a18;
      v201 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v201;
      v202 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v202;
      v203 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v203;
      v204 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v204;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v206 = *(float64x2_t *)((char *)&STACK[0x610] + v192);
        v205 = *(float64x2_t *)((char *)&STACK[0x610] + v192 + 16);
        v207 = (float64x2_t *)((char *)&a11 + v192);
        *v207 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v194, v206.f64[0]), v196, v206, 1), v198, v205.f64[0]), v200, v205, 1);
        v207[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v193, v206.f64[0]), v195, v206, 1), v197, v205.f64[0]), v199, v205, 1);
        v192 += 32;
      }
      while (v192 != 128);
      goto LABEL_31;
    case 6:
      v208 = 0;
      v210 = *(float64x2_t *)&STACK[0x590];
      v209 = *(float64x2_t *)&STACK[0x5A0];
      v212 = *(float64x2_t *)&STACK[0x5B0];
      v211 = *(float64x2_t *)&STACK[0x5C0];
      v214 = *(float64x2_t *)&STACK[0x5D0];
      v213 = *(float64x2_t *)&STACK[0x5E0];
      v216 = *(float64x2_t *)&STACK[0x5F0];
      v215 = *(float64x2_t *)&STACK[0x600];
      v217 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v217;
      v218 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v218;
      v219 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v219;
      v220 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v220;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v222 = *(float64x2_t *)((char *)&STACK[0x610] + v208);
        v221 = *(float64x2_t *)((char *)&STACK[0x610] + v208 + 16);
        v223 = (float64x2_t *)((char *)&a11 + v208);
        *v223 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v210, v222.f64[0]), v212, v222, 1), v214, v221.f64[0]), v216, v221, 1);
        v223[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v209, v222.f64[0]), v211, v222, 1), v213, v221.f64[0]), v215, v221, 1);
        v208 += 32;
      }
      while (v208 != 128);
      v224 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      v226 = a11;
      v225 = a12;
      v228 = a13;
      v227 = a14;
      v230 = a15;
      v229 = a16;
      v232 = a17;
      v231 = a18;
      v233 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v233;
      v234 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v234;
      v235 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v235;
      v236 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v236;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        v238 = *(float64x2_t *)((char *)&STACK[0x610] + v224);
        v237 = *(float64x2_t *)((char *)&STACK[0x610] + v224 + 16);
        v239 = (float64x2_t *)((char *)&a11 + v224);
        *v239 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v226, v238.f64[0]), v228, v238, 1), v230, v237.f64[0]), v232, v237, 1);
        v239[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v225, v238.f64[0]), v227, v238, 1), v229, v237.f64[0]), v231, v237, 1);
        v224 += 32;
      }
      while (v224 != 128);
LABEL_31:
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      break;
    default:
      break;
  }
  v240 = 0;
  *(_OWORD *)&STACK[0x630] = 0uLL;
  *(_OWORD *)&STACK[0x640] = 0uLL;
  *(_OWORD *)&STACK[0x610] = 0uLL;
  *(_OWORD *)&STACK[0x620] = 0uLL;
  do
  {
    v241 = 0;
    v242 = *((_OWORD *)&a19 + 2 * v240);
    v243 = *((_OWORD *)&STACK[0x610] + v240);
    do
    {
      vars0 = v242;
      v244 = *((double *)&vars0 + (v241 & 3));
      v246 = v243;
      *(float *)((unint64_t)&v246 & 0xFFFFFFFFFFFFFFF3 | (4 * (v241 & 3))) = v244;
      v243 = v246;
      ++v241;
    }
    while (v241 != 4);
    *((_OWORD *)&STACK[0x610] + v240++) = v246;
  }
  while (v240 != 4);
  if (*(_BYTE *)(a1 + 8))
  {
    v248.columns[0] = *(simd_float4 *)&STACK[0x610];
    v248.columns[1] = *(simd_float4 *)&STACK[0x620];
    v248.columns[2] = *(simd_float4 *)&STACK[0x630];
    v248.columns[3] = *(simd_float4 *)&STACK[0x640];
    __invert_f4(v248);
  }
}

- (void)double4x4AtTime:(uint64_t)a3@<X2>
{
  void *v45;
  int8x16_t v46;
  double v47;
  float64x2_t v48;
  float64x2_t v49;
  uint64_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t *v65;
  uint64_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t *v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  uint64_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t *v99;
  uint64_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t *v109;
  uint64_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115;
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t *v125;
  uint64_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t v129;
  float64x2_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t *v135;
  uint64_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t *v151;
  uint64_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t v158;
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t *v161;
  uint64_t v162;
  float64x2_t v163;
  float64x2_t v164;
  float64x2_t v165;
  float64x2_t v166;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t v169;
  float64x2_t v170;
  float64x2_t v171;
  float64x2_t v172;
  float64x2_t v173;
  float64x2_t v174;
  float64x2_t v175;
  float64x2_t v176;
  float64x2_t *v177;
  uint64_t v178;
  float64x2_t v179;
  float64x2_t v180;
  float64x2_t v181;
  float64x2_t v182;
  float64x2_t v183;
  float64x2_t v184;
  float64x2_t v185;
  float64x2_t v186;
  float64x2_t *v187;
  uint64_t v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t v193;
  float64x2_t v194;
  float64x2_t v195;
  float64x2_t v196;
  float64x2_t v197;
  float64x2_t v198;
  float64x2_t v199;
  float64x2_t v200;
  float64x2_t v201;
  float64x2_t v202;
  float64x2_t *v203;
  uint64_t v204;
  float64x2_t v205;
  float64x2_t v206;
  float64x2_t v207;
  float64x2_t v208;
  float64x2_t v209;
  float64x2_t v210;
  float64x2_t v211;
  float64x2_t v212;
  float64x2_t *v213;
  double v214;
  float64x2_t v215;
  float64x2_t vars0;
  float64x2_t v217;
  float64x2_t v218;
  float64x2_t v219;
  float64x2_t v220;
  float64x2_t v221;
  float64x2_t v222;

  v45 = *(void **)(a1 + 24);
  if (v45)
  {
    objc_msgSend_double3AtTime_(v45, a2, a3);
    v46 = a42;
    *(_QWORD *)&v214 = vextq_s8(v46, v46, 8uLL).u64[0];
    v47 = a43;
  }
  else
  {
    v46.i64[0] = 0;
    v214 = 0.0;
    v47 = 0.0;
  }
  a40 = 0u;
  a41 = 0u;
  a38 = 0u;
  a39 = 0u;
  a36 = 0u;
  a37 = 0u;
  a34 = 0u;
  a35 = 0u;
  a5.f64[0] = 0.0;
  sub_1DCB51168((uint64_t)&a34, *(double *)v46.i64 * 0.0174532925, (float64x2_t)COERCE_UNSIGNED_INT64(1.0), 0.0, a5);
  a32 = 0u;
  a33 = 0u;
  a30 = 0u;
  a31 = 0u;
  a28 = 0u;
  a29 = 0u;
  a26 = 0u;
  a27 = 0u;
  v48.f64[0] = 0.0;
  sub_1DCB51168((uint64_t)&a26, v214 * 0.0174532925, (float64x2_t)0, 1.0, v48);
  a24 = 0u;
  a25 = 0u;
  a22 = 0u;
  a23 = 0u;
  a20 = 0u;
  a21 = 0u;
  a18 = 0u;
  a19 = 0u;
  v49.f64[0] = 1.0;
  sub_1DCB51168((uint64_t)&a18, v47 * 0.0174532925, (float64x2_t)0, 0.0, v49);
  switch(*(_QWORD *)(a1 + 32))
  {
    case 1:
      v50 = 0;
      v52 = a18;
      v51 = a19;
      v54 = a20;
      v53 = a21;
      v56 = a22;
      v55 = a23;
      v58 = a24;
      v57 = a25;
      v59 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v59;
      v60 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v60;
      v61 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v61;
      v62 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v62;
      v215 = 0u;
      vars0 = 0u;
      do
      {
        v64 = *(float64x2_t *)((char *)&STACK[0x500] + v50);
        v63 = *(float64x2_t *)((char *)&STACK[0x500] + v50 + 16);
        v65 = (float64x2_t *)((char *)&v215 + v50);
        *v65 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v52, v64.f64[0]), v54, v64, 1), v56, v63.f64[0]), v58, v63, 1);
        v65[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v51, v64.f64[0]), v53, v64, 1), v55, v63.f64[0]), v57, v63, 1);
        v50 += 32;
      }
      while (v50 != 128);
      v66 = 0;
      v68 = v215;
      v67 = vars0;
      v69 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v69;
      v70 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v70;
      v71 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v71;
      v72 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v72;
      v215 = 0u;
      vars0 = 0u;
      v217 = 0u;
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      do
      {
        v74 = *(float64x2_t *)((char *)&STACK[0x500] + v66);
        v73 = *(float64x2_t *)((char *)&STACK[0x500] + v66 + 16);
        v75 = (float64x2_t *)((char *)&v215 + v66);
        *v75 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v68, v74.f64[0]), (float64x2_t)0, v74, 1), (float64x2_t)0, v73.f64[0]), (float64x2_t)0, v73, 1);
        v75[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v67, v74.f64[0]), (float64x2_t)0, v74, 1), (float64x2_t)0, v73.f64[0]), (float64x2_t)0, v73, 1);
        v66 += 32;
      }
      while (v66 != 128);
      goto LABEL_35;
    case 2:
      v84 = 0;
      v86 = a26;
      v85 = a27;
      v88 = a28;
      v87 = a29;
      v90 = a30;
      v89 = a31;
      v92 = a32;
      v91 = a33;
      v93 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v93;
      v94 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v94;
      v95 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v95;
      v96 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v96;
      v215 = 0u;
      vars0 = 0u;
      do
      {
        v98 = *(float64x2_t *)((char *)&STACK[0x500] + v84);
        v97 = *(float64x2_t *)((char *)&STACK[0x500] + v84 + 16);
        v99 = (float64x2_t *)((char *)&v215 + v84);
        *v99 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v86, v98.f64[0]), v88, v98, 1), v90, v97.f64[0]), v92, v97, 1);
        v99[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v85, v98.f64[0]), v87, v98, 1), v89, v97.f64[0]), v91, v97, 1);
        v84 += 32;
      }
      while (v84 != 128);
      v100 = 0;
      v102 = v215;
      v101 = vars0;
      v103 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v103;
      v104 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v104;
      v105 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v105;
      v106 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v106;
      v215 = 0u;
      vars0 = 0u;
      v217 = 0u;
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      do
      {
        v108 = *(float64x2_t *)((char *)&STACK[0x500] + v100);
        v107 = *(float64x2_t *)((char *)&STACK[0x500] + v100 + 16);
        v109 = (float64x2_t *)((char *)&v215 + v100);
        *v109 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v102, v108.f64[0]), (float64x2_t)0, v108, 1), (float64x2_t)0, v107.f64[0]), (float64x2_t)0, v107, 1);
        v109[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v101, v108.f64[0]), (float64x2_t)0, v108, 1), (float64x2_t)0, v107.f64[0]), (float64x2_t)0, v107, 1);
        v100 += 32;
      }
      while (v100 != 128);
      goto LABEL_35;
    case 3:
      v110 = 0;
      v112 = a18;
      v111 = a19;
      v114 = a20;
      v113 = a21;
      v116 = a22;
      v115 = a23;
      v118 = a24;
      v117 = a25;
      v119 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v119;
      v120 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v120;
      v121 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v121;
      v122 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v122;
      v215 = 0u;
      vars0 = 0u;
      do
      {
        v124 = *(float64x2_t *)((char *)&STACK[0x500] + v110);
        v123 = *(float64x2_t *)((char *)&STACK[0x500] + v110 + 16);
        v125 = (float64x2_t *)((char *)&v215 + v110);
        *v125 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v112, v124.f64[0]), v114, v124, 1), v116, v123.f64[0]), v118, v123, 1);
        v125[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v111, v124.f64[0]), v113, v124, 1), v115, v123.f64[0]), v117, v123, 1);
        v110 += 32;
      }
      while (v110 != 128);
      v126 = 0;
      v128 = v215;
      v127 = vars0;
      v129 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v129;
      v130 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v130;
      v131 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v131;
      v132 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v132;
      v215 = 0u;
      vars0 = 0u;
      v217 = 0u;
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      do
      {
        v134 = *(float64x2_t *)((char *)&STACK[0x500] + v126);
        v133 = *(float64x2_t *)((char *)&STACK[0x500] + v126 + 16);
        v135 = (float64x2_t *)((char *)&v215 + v126);
        *v135 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v128, v134.f64[0]), (float64x2_t)0, v134, 1), (float64x2_t)0, v133.f64[0]), (float64x2_t)0, v133, 1);
        v135[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v127, v134.f64[0]), (float64x2_t)0, v134, 1), (float64x2_t)0, v133.f64[0]), (float64x2_t)0, v133, 1);
        v126 += 32;
      }
      while (v126 != 128);
      goto LABEL_35;
    case 4:
      v136 = 0;
      v138 = a34;
      v137 = a35;
      v140 = a36;
      v139 = a37;
      v142 = a38;
      v141 = a39;
      v144 = a40;
      v143 = a41;
      v145 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v145;
      v146 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v146;
      v147 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v147;
      v148 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v148;
      v215 = 0u;
      vars0 = 0u;
      do
      {
        v150 = *(float64x2_t *)((char *)&STACK[0x500] + v136);
        v149 = *(float64x2_t *)((char *)&STACK[0x500] + v136 + 16);
        v151 = (float64x2_t *)((char *)&v215 + v136);
        *v151 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v138, v150.f64[0]), v140, v150, 1), v142, v149.f64[0]), v144, v149, 1);
        v151[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v137, v150.f64[0]), v139, v150, 1), v141, v149.f64[0]), v143, v149, 1);
        v136 += 32;
      }
      while (v136 != 128);
      v152 = 0;
      v154 = v215;
      v153 = vars0;
      v155 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v155;
      v156 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v156;
      v157 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v157;
      v158 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v158;
      v215 = 0u;
      vars0 = 0u;
      v217 = 0u;
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      do
      {
        v160 = *(float64x2_t *)((char *)&STACK[0x500] + v152);
        v159 = *(float64x2_t *)((char *)&STACK[0x500] + v152 + 16);
        v161 = (float64x2_t *)((char *)&v215 + v152);
        *v161 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v160.f64[0]), (float64x2_t)0, v160, 1), (float64x2_t)0, v159.f64[0]), (float64x2_t)0, v159, 1);
        v161[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v160.f64[0]), (float64x2_t)0, v160, 1), (float64x2_t)0, v159.f64[0]), (float64x2_t)0, v159, 1);
        v152 += 32;
      }
      while (v152 != 128);
      goto LABEL_35;
    case 5:
      v162 = 0;
      v164 = a26;
      v163 = a27;
      v166 = a28;
      v165 = a29;
      v168 = a30;
      v167 = a31;
      v170 = a32;
      v169 = a33;
      v171 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v171;
      v172 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v172;
      v173 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v173;
      v174 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v174;
      v215 = 0u;
      vars0 = 0u;
      do
      {
        v176 = *(float64x2_t *)((char *)&STACK[0x500] + v162);
        v175 = *(float64x2_t *)((char *)&STACK[0x500] + v162 + 16);
        v177 = (float64x2_t *)((char *)&v215 + v162);
        *v177 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v164, v176.f64[0]), v166, v176, 1), v168, v175.f64[0]), v170, v175, 1);
        v177[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v163, v176.f64[0]), v165, v176, 1), v167, v175.f64[0]), v169, v175, 1);
        v162 += 32;
      }
      while (v162 != 128);
      v178 = 0;
      v180 = v215;
      v179 = vars0;
      v181 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v181;
      v182 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v182;
      v183 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v183;
      v184 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v184;
      v215 = 0u;
      vars0 = 0u;
      v217 = 0u;
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      do
      {
        v186 = *(float64x2_t *)((char *)&STACK[0x500] + v178);
        v185 = *(float64x2_t *)((char *)&STACK[0x500] + v178 + 16);
        v187 = (float64x2_t *)((char *)&v215 + v178);
        *v187 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v180, v186.f64[0]), (float64x2_t)0, v186, 1), (float64x2_t)0, v185.f64[0]), (float64x2_t)0, v185, 1);
        v187[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v179, v186.f64[0]), (float64x2_t)0, v186, 1), (float64x2_t)0, v185.f64[0]), (float64x2_t)0, v185, 1);
        v178 += 32;
      }
      while (v178 != 128);
      goto LABEL_35;
    case 6:
      v188 = 0;
      v190 = a34;
      v189 = a35;
      v192 = a36;
      v191 = a37;
      v194 = a38;
      v193 = a39;
      v196 = a40;
      v195 = a41;
      v197 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v197;
      v198 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v198;
      v199 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v199;
      v200 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v200;
      v215 = 0u;
      vars0 = 0u;
      do
      {
        v202 = *(float64x2_t *)((char *)&STACK[0x500] + v188);
        v201 = *(float64x2_t *)((char *)&STACK[0x500] + v188 + 16);
        v203 = (float64x2_t *)((char *)&v215 + v188);
        *v203 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v190, v202.f64[0]), v192, v202, 1), v194, v201.f64[0]), v196, v201, 1);
        v203[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v189, v202.f64[0]), v191, v202, 1), v193, v201.f64[0]), v195, v201, 1);
        v188 += 32;
      }
      while (v188 != 128);
      v204 = 0;
      v206 = v215;
      v205 = vars0;
      v207 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v207;
      v208 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v208;
      v209 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v209;
      v210 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v210;
      v215 = 0u;
      vars0 = 0u;
      v217 = 0u;
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      do
      {
        v212 = *(float64x2_t *)((char *)&STACK[0x500] + v204);
        v211 = *(float64x2_t *)((char *)&STACK[0x500] + v204 + 16);
        v213 = (float64x2_t *)((char *)&v215 + v204);
        *v213 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v206, v212.f64[0]), (float64x2_t)0, v212, 1), (float64x2_t)0, v211.f64[0]), (float64x2_t)0, v211, 1);
        v213[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v205, v212.f64[0]), (float64x2_t)0, v212, 1), (float64x2_t)0, v211.f64[0]), (float64x2_t)0, v211, 1);
        v204 += 32;
      }
      while (v204 != 128);
LABEL_35:
      v77 = v215;
      v76 = vars0;
      v79 = v217;
      v78 = v218;
      v81 = v219;
      v80 = v220;
      v83 = v221;
      v82 = v222;
      break;
    default:
      v77 = *(float64x2_t *)MEMORY[0x1E0C83FD8];
      v76 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 16);
      v79 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 32);
      v78 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 48);
      v81 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64);
      v80 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80);
      v83 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96);
      v82 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112);
      break;
  }
  if (*(_BYTE *)(a1 + 8))
  {
    *(float64x2_t *)&STACK[0x500] = v77;
    *(float64x2_t *)&STACK[0x510] = v76;
    *(float64x2_t *)&STACK[0x520] = v79;
    *(float64x2_t *)&STACK[0x530] = v78;
    *(float64x2_t *)&STACK[0x540] = v81;
    *(float64x2_t *)&STACK[0x550] = v80;
    *(float64x2_t *)&STACK[0x560] = v83;
    *(float64x2_t *)&STACK[0x570] = v82;
    __invert_d4();
  }
  else
  {
    *a4 = v77;
    a4[1] = v76;
    a4[2] = v79;
    a4[3] = v78;
    a4[4] = v81;
    a4[5] = v80;
    a4[6] = v83;
    a4[7] = v82;
  }
}

- (NSString)name
{
  return self->_name;
}

- (MDLAnimatedVector3)animatedValue
{
  return self->_animatedValue;
}

- (BOOL)inverse
{
  return self->_inverse;
}

- (void)setInverse:(BOOL)a3
{
  self->_inverse = a3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
