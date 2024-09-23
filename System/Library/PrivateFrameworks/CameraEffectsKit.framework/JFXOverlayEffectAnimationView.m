@implementation JFXOverlayEffectAnimationView

- (JFXOverlayEffectAnimationView)initWithEffectFrame:(id)a3 toEffectFrame:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  JFXOverlayEffectAnimationView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  __int128 v33;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  int8x16_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  int8x16_t v68;
  int8x16_t v69;
  int8x16_t v70;
  int8x16_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  void *v80;
  id v81;
  void *v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  int8x16_t v95;
  int8x16_t v96;
  __int128 v97;
  __int128 v98;
  int8x16_t v99;
  int8x16_t v100;
  __int128 vars0;
  __int128 vars0a;
  int8x16_t vars0b;
  int8x16_t vars0c;
  __int128 v105;
  int8x16_t v106;
  int8x16_t v107;
  __int128 v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  objc_super v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[32];
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[32];
  _BYTE v135[32];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "effectSize");
  v9 = v8;
  objc_msgSend(v6, "effectSize");
  v118.receiver = self;
  v118.super_class = (Class)JFXOverlayEffectAnimationView;
  v11 = -[JFXOverlayEffectAnimationView initWithFrame:](&v118, sel_initWithFrame_, 0.0, 0.0, v9, v10);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[JFXOverlayEffectAnimationView setFromEffectFrame:](v11, "setFromEffectFrame:", v6);
    -[JFXOverlayEffectAnimationView setToEffectFrame:](v11, "setToEffectFrame:", v7);
    -[JFXOverlayEffectAnimationView fromEffectFrame](v11, "fromEffectFrame");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transforms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXOverlayEffectAnimationView toEffectFrame](v11, "toEffectFrame");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transforms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_opt_new();
    -[JFXOverlayEffectAnimationView setAnimationDelegate:](v11, "setAnimationDelegate:", v16);

    -[JFXOverlayEffectAnimationView layer](v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 0;
    objc_msgSend(v17, "setOpacity:", v18);

    objc_msgSend(v13, "transform");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(v15, "transform");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[JFXOverlayEffectAnimationView layer](v11, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "transform");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "SIMDDouble4x4");
          v84 = v110;
          v85 = v111;
          v87 = v112;
          v89 = v113;
          v91 = v114;
          v93 = v115;
          v97 = v117;
          vars0 = v116;
        }
        else
        {
          v93 = 0u;
          v97 = 0u;
          v89 = 0u;
          v91 = 0u;
          v85 = 0u;
          v87 = 0u;
          v84 = 0u;
          vars0 = 0u;
        }
        v25 = (void *)MEMORY[0x24BDE56D0];
        v26 = v22;
        objc_msgSend(v25, "layer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bounds");
        objc_msgSend(v27, "setFrame:");
        *(_OWORD *)v134 = v84;
        *(_OWORD *)&v134[16] = v85;
        *(_OWORD *)v135 = v87;
        *(_OWORD *)&v135[16] = v89;
        *(_OWORD *)&STACK[0x580] = v91;
        *(_OWORD *)&STACK[0x590] = v93;
        *(_OWORD *)&STACK[0x5A0] = vars0;
        *(_OWORD *)&STACK[0x5B0] = v97;
        objc_msgSend(v27, "setTransform:", v134);
        objc_msgSend(v26, "addSublayer:", v27);

        -[JFXOverlayEffectAnimationView setTransformLayer:](v11, "setTransformLayer:", v27);
      }
    }
    objc_msgSend(v13, "transformAnimation");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(v15, "transformAnimation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v13, "transformAnimation");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v6, "time");
        }
        else
        {
          v108 = 0uLL;
          v109 = 0;
        }
        v131 = 0;
        *(_OWORD *)v130 = 0u;
        *(_OWORD *)&v130[16] = 0u;
        v129 = 0u;
        if (v31)
        {
          *(_OWORD *)v134 = v108;
          *(_QWORD *)&v134[16] = v109;
          objc_msgSend(v31, "transformInfoAtTime:", v134);
          v32 = *(_QWORD *)&v130[24];
        }
        else
        {
          v32 = 0;
        }
        *(_QWORD *)&v33 = 0;
        *((_QWORD *)&v33 + 1) = v32;
        v121 = v32;
        v122 = 0u;
        v123 = v33;
        v124 = 0u;
        v125 = 0u;
        v126 = xmmword_226AB71E0;
        v127 = 0u;
        v128 = xmmword_226AB71D0;
        __asm { FMOV            V1.2D, #1.0 }
        v119 = 0u;
        v120 = _Q1;
        pv_simd_matrix_rotate();
        v39 = *(_OWORD *)&STACK[0x590];
        v40 = *(_OWORD *)&STACK[0x5A0];
        v41 = *(_OWORD *)&STACK[0x5B0];
        v42 = *(_OWORD *)&v130[8];
        *(_OWORD *)&STACK[0x580] = *(_OWORD *)&STACK[0x580];
        *(_OWORD *)&STACK[0x590] = v39;
        *(_OWORD *)&STACK[0x5A0] = v40;
        *(_OWORD *)&STACK[0x5B0] = v41;
        v132 = v42;
        v133 = 0u;
        pv_simd_matrix_translate();
        v105 = v122;
        v92 = v121;
        vars0a = v124;
        v90 = v123;
        v98 = v126;
        v88 = v125;
        v94 = v128;
        v86 = v127;

        -[JFXOverlayEffectAnimationView layer](v11, "layer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "bounds");
        objc_msgSend(v44, "setFrame:");
        *(_OWORD *)v134 = v92;
        *(_OWORD *)&v134[16] = v105;
        *(_OWORD *)v135 = v90;
        *(_OWORD *)&v135[16] = vars0a;
        *(_OWORD *)&STACK[0x580] = v88;
        *(_OWORD *)&STACK[0x590] = v98;
        *(_OWORD *)&STACK[0x5A0] = v86;
        *(_OWORD *)&STACK[0x5B0] = v94;
        objc_msgSend(v44, "setTransform:", v134);
        objc_msgSend(v43, "addSublayer:", v44);
        -[JFXOverlayEffectAnimationView setAdditionalTransformLayer:](v11, "setAdditionalTransformLayer:", v44);

      }
    }
    objc_msgSend(v13, "faceTrackingTransform");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = (void *)v45;
      objc_msgSend(v15, "faceTrackingTransform");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        -[JFXOverlayEffectAnimationView layer](v11, "layer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "faceTrackingTransform");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXOverlayEffectAnimationView fromEffectFrame](v11, "fromEffectFrame");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "transformForTrackingType:", objc_msgSend(v50, "trackingType"));
        v95 = v51;
        v99 = v52;
        vars0b = v53;
        v106 = v54;
        v55 = *(float *)v51.i32;
        v56 = *(float *)&v51.i32[3];
        v57 = *(float *)v52.i32;
        v58 = *(float *)&v52.i32[3];
        *(double *)&v59 = *(float *)v53.i32;
        *(double *)&v60 = *(float *)&v53.i32[3];
        *(double *)&v61 = *(float *)v54.i32;
        *(double *)&v62 = *(float *)&v54.i32[3];
        v63 = (void *)MEMORY[0x24BDE56D0];
        v64 = v48;
        objc_msgSend(v63, "layer");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "bounds");
        objc_msgSend(v65, "setFrame:");
        *(float64x2_t *)&v134[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v95.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v95, v95, 8uLL), 4uLL));
        *(double *)v134 = v55;
        *(double *)&v134[24] = v56;
        *(float64x2_t *)&v135[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v99.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v99, v99, 8uLL), 4uLL));
        *(double *)v135 = v57;
        *(double *)&v135[24] = v58;
        *(float64x2_t *)&STACK[0x588] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)vars0b.i8, (int8x8_t)*(_OWORD *)&vextq_s8(vars0b, vars0b, 8uLL), 4uLL));
        STACK[0x580] = v59;
        STACK[0x598] = v60;
        *(float64x2_t *)&STACK[0x5A8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v106.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v106, v106, 8uLL), 4uLL));
        STACK[0x5A0] = v61;
        STACK[0x5B8] = v62;
        objc_msgSend(v65, "setTransform:", v134);
        objc_msgSend(v64, "addSublayer:", v65);

        -[JFXOverlayEffectAnimationView setTrackingTransformLayer:](v11, "setTrackingTransformLayer:", v65);
        -[JFXOverlayEffectAnimationView layer](v11, "layer");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "faceTrackingTransform");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "cameraTransform");
        v96 = v68;
        v100 = v69;
        vars0c = v70;
        v107 = v71;
        v72 = *(float *)v68.i32;
        v73 = *(float *)&v68.i32[3];
        v74 = *(float *)v69.i32;
        v75 = *(float *)&v69.i32[3];
        *(double *)&v76 = *(float *)v70.i32;
        *(double *)&v77 = *(float *)&v70.i32[3];
        *(double *)&v78 = *(float *)v71.i32;
        *(double *)&v79 = *(float *)&v71.i32[3];
        v80 = (void *)MEMORY[0x24BDE56D0];
        v81 = v66;
        objc_msgSend(v80, "layer");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "bounds");
        objc_msgSend(v82, "setFrame:");
        *(float64x2_t *)&v134[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v96.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v96, v96, 8uLL), 4uLL));
        *(double *)v134 = v72;
        *(double *)&v134[24] = v73;
        *(float64x2_t *)&v135[8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v100.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v100, v100, 8uLL), 4uLL));
        *(double *)v135 = v74;
        *(double *)&v135[24] = v75;
        *(float64x2_t *)&STACK[0x588] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)vars0c.i8, (int8x8_t)*(_OWORD *)&vextq_s8(vars0c, vars0c, 8uLL), 4uLL));
        STACK[0x580] = v76;
        STACK[0x598] = v77;
        *(float64x2_t *)&STACK[0x5A8] = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v107.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v107, v107, 8uLL), 4uLL));
        STACK[0x5A0] = v78;
        STACK[0x5B8] = v79;
        objc_msgSend(v82, "setTransform:", v134);
        objc_msgSend(v81, "addSublayer:", v82);

        -[JFXOverlayEffectAnimationView setCameraTransformLayer:](v11, "setCameraTransformLayer:", v82);
      }
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  }
  return v11;
}

- (void)animate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  __int128 v40;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  void *v97;
  void *v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  unint64_t v108;
  float v109;
  unint64_t v110;
  float v111;
  unint64_t v112;
  float v113;
  unint64_t v114;
  float v115;
  unint64_t v116;
  float v117;
  unint64_t v118;
  float v119;
  unint64_t v120;
  float v121;
  unint64_t v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  void *v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float v157;
  unint64_t v158;
  float v159;
  unint64_t v160;
  float v161;
  unint64_t v162;
  float v163;
  unint64_t v164;
  float v165;
  unint64_t v166;
  float v167;
  unint64_t v168;
  float v169;
  unint64_t v170;
  float v171;
  unint64_t v172;
  id v173;
  id v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  unint64_t v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  unint64_t v194;
  unint64_t v195;
  unint64_t v196;
  unint64_t v197;
  unint64_t v198;
  unint64_t v199;
  __int128 v200;
  __int128 v201;
  unint64_t v202;
  unint64_t v203;
  __int128 v204;
  __int128 v205;
  unint64_t v206;
  unint64_t v207;
  __int128 v208;
  __int128 v209;
  unint64_t v210;
  unint64_t v211;
  __int128 vars0;
  __int128 vars0a;
  unint64_t vars0b;
  unint64_t vars0c;
  __int128 v216;
  __int128 v217;
  unint64_t v218;
  unint64_t v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  unint64_t v223;
  unint64_t v224;
  __int128 v225;
  __int128 v226;
  unint64_t v227;
  unint64_t v228;
  __int128 v229;
  __int128 v230;
  unint64_t v231;
  unint64_t v232;
  __int128 v233;
  __int128 v234;
  unint64_t v235;
  unint64_t v236;
  __int128 v237;
  __int128 v238;
  unint64_t v239;
  unint64_t v240;
  __int128 v241;
  __int128 v242;
  unint64_t v243;
  unint64_t v244;
  __int128 v245;
  __int128 v246;
  unint64_t v247;
  unint64_t v248;
  __int128 v249;
  __int128 v250;
  unint64_t v251;
  unint64_t v252;
  __int128 v253;
  __int128 v254;
  void *v255;
  unint64_t v256;
  __int128 v257;
  __int128 v258;
  void *v259;
  __int128 v260;
  __int128 v261;
  uint64_t v262;
  __int128 v263;
  unint64_t v264;
  __int128 v265;
  unint64_t v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;

  v6 = a3;
  v7 = a4;
  -[JFXOverlayEffectAnimationView fromEffectFrame](self, "fromEffectFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transforms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXOverlayEffectAnimationView toEffectFrame](self, "toEffectFrame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transforms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXOverlayEffectAnimationView animationDelegate](self, "animationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animateWithCompletion:", v7);

  -[JFXOverlayEffectAnimationView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v6, "copy");
  -[JFXOverlayEffectAnimationView animationDelegate](self, "animationDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  v17 = v14;
  objc_msgSend(v17, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v17, "setDelegate:", v15);
  v262 = *MEMORY[0x24BDE5970];
  objc_msgSend(v17, "setFillMode:");
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  objc_msgSend(v17, "setFromValue:", &unk_24EE9BD68);
  objc_msgSend(v17, "setToValue:", &unk_24EE9BD80);
  objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("opacityAnimation"));

  objc_msgSend(v9, "transform");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v11, "transform");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[JFXOverlayEffectAnimationView transformLayer](self, "transformLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v9, "transform");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "SIMDDouble4x4");
        v233 = v275;
        v237 = v276;
        v241 = v277;
        v245 = v278;
        v249 = v279;
        v253 = v280;
        v257 = v282;
        v260 = v281;
      }
      else
      {
        v253 = 0u;
        v257 = 0u;
        v245 = 0u;
        v249 = 0u;
        v237 = 0u;
        v241 = 0u;
        v233 = 0u;
        v260 = 0u;
      }
      objc_msgSend(v11, "transform");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "SIMDDouble4x4");
        v200 = v267;
        v204 = v268;
        v208 = v269;
        vars0 = v270;
        v216 = v271;
        v220 = v272;
        v225 = v274;
        v229 = v273;
      }
      else
      {
        v220 = 0u;
        v225 = 0u;
        vars0 = 0u;
        v216 = 0u;
        v204 = 0u;
        v208 = 0u;
        v200 = 0u;
        v229 = 0u;
      }
      v27 = v21;
      v28 = v22;
      objc_msgSend(v28, "setKeyPath:", CFSTR("transform"));
      objc_msgSend(v28, "setFillMode:", v262);
      objc_msgSend(v28, "setRemovedOnCompletion:", 0);
      v29 = (void *)MEMORY[0x24BDD1968];
      *(_OWORD *)&STACK[0x7C0] = v233;
      *(_OWORD *)&STACK[0x7D0] = v237;
      *(_OWORD *)&STACK[0x7E0] = v241;
      *(_OWORD *)&STACK[0x7F0] = v245;
      *(_OWORD *)&STACK[0x800] = v249;
      *(_OWORD *)&STACK[0x810] = v253;
      *(_OWORD *)&STACK[0x820] = v260;
      *(_OWORD *)&STACK[0x830] = v257;
      objc_msgSend(v29, "valueWithCATransform3D:", &STACK[0x7C0]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFromValue:", v30);

      v31 = (void *)MEMORY[0x24BDD1968];
      *(_OWORD *)&STACK[0x7C0] = v200;
      *(_OWORD *)&STACK[0x7D0] = v204;
      *(_OWORD *)&STACK[0x7E0] = v208;
      *(_OWORD *)&STACK[0x7F0] = vars0;
      *(_OWORD *)&STACK[0x800] = v216;
      *(_OWORD *)&STACK[0x810] = v220;
      *(_OWORD *)&STACK[0x820] = v229;
      *(_OWORD *)&STACK[0x830] = v225;
      objc_msgSend(v31, "valueWithCATransform3D:", &STACK[0x7C0]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setToValue:", v32);

      objc_msgSend(v27, "addAnimation:forKey:", v28, CFSTR("transformAnimation"));
    }
  }
  objc_msgSend(v9, "transformAnimation");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    objc_msgSend(v11, "transformAnimation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v9, "transformAnimation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXOverlayEffectAnimationView fromEffectFrame](self, "fromEffectFrame");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "time");
      }
      else
      {
        v265 = 0uLL;
        v266 = 0;
      }
      STACK[0x790] = 0;
      *(_OWORD *)&STACK[0x770] = 0u;
      *(_OWORD *)&STACK[0x780] = 0u;
      *(_OWORD *)&STACK[0x760] = 0u;
      if (v36)
      {
        *(_OWORD *)&STACK[0x7C0] = v265;
        STACK[0x7D0] = v266;
        objc_msgSend(v36, "transformInfoAtTime:", &STACK[0x7C0]);
        v39 = STACK[0x788];
      }
      else
      {
        v39 = 0;
      }
      *(_QWORD *)&v40 = 0;
      *((_QWORD *)&v40 + 1) = v39;
      *(_OWORD *)&STACK[0x6E0] = v39;
      *(_OWORD *)&STACK[0x6F0] = 0u;
      *(_OWORD *)&STACK[0x700] = v40;
      *(_OWORD *)&STACK[0x710] = 0u;
      *(_OWORD *)&STACK[0x720] = 0u;
      *(_OWORD *)&STACK[0x730] = xmmword_226AB71E0;
      *(_OWORD *)&STACK[0x740] = 0u;
      *(_OWORD *)&STACK[0x750] = xmmword_226AB71D0;
      __asm { FMOV            V1.2D, #1.0 }
      v221 = _Q1;
      *(_OWORD *)&STACK[0x6C0] = 0u;
      *(_OWORD *)&STACK[0x6D0] = _Q1;
      pv_simd_matrix_rotate();
      v46 = *(_OWORD *)&STACK[0x7D0];
      v47 = *(_OWORD *)&STACK[0x7E0];
      v48 = *(_OWORD *)&STACK[0x7F0];
      v49 = *(_OWORD *)&STACK[0x800];
      v50 = *(_OWORD *)&STACK[0x810];
      v51 = *(_OWORD *)&STACK[0x820];
      v52 = *(_OWORD *)&STACK[0x830];
      v53 = *(_OWORD *)&STACK[0x778];
      *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&STACK[0x7C0];
      *(_OWORD *)&STACK[0x7D0] = v46;
      *(_OWORD *)&STACK[0x7E0] = v47;
      *(_OWORD *)&STACK[0x7F0] = v48;
      *(_OWORD *)&STACK[0x800] = v49;
      *(_OWORD *)&STACK[0x810] = v50;
      *(_OWORD *)&STACK[0x830] = v52;
      *(_OWORD *)&STACK[0x820] = v51;
      *(_OWORD *)&STACK[0x7A0] = v53;
      *(_OWORD *)&STACK[0x7B0] = 0u;
      pv_simd_matrix_translate();
      v258 = *(_OWORD *)&STACK[0x710];
      v261 = *(_OWORD *)&STACK[0x6F0];
      v242 = *(_OWORD *)&STACK[0x700];
      v246 = *(_OWORD *)&STACK[0x6E0];
      v250 = *(_OWORD *)&STACK[0x750];
      v254 = *(_OWORD *)&STACK[0x730];
      v234 = *(_OWORD *)&STACK[0x740];
      v238 = *(_OWORD *)&STACK[0x720];

      objc_msgSend(v11, "transformAnimation");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXOverlayEffectAnimationView fromEffectFrame](self, "fromEffectFrame");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v55)
      {
        objc_msgSend(v55, "time");
      }
      else
      {
        v263 = 0uLL;
        v264 = 0;
      }
      STACK[0x790] = 0;
      *(_OWORD *)&STACK[0x770] = 0u;
      *(_OWORD *)&STACK[0x780] = 0u;
      *(_OWORD *)&STACK[0x760] = 0u;
      if (v54)
      {
        *(_OWORD *)&STACK[0x7C0] = v263;
        STACK[0x7D0] = v264;
        objc_msgSend(v54, "transformInfoAtTime:", &STACK[0x7C0]);
        v57 = STACK[0x788];
      }
      else
      {
        v57 = 0;
      }
      *(_QWORD *)&v58 = 0;
      *((_QWORD *)&v58 + 1) = v57;
      *(_OWORD *)&STACK[0x6E0] = v57;
      *(_OWORD *)&STACK[0x6F0] = 0u;
      *(_OWORD *)&STACK[0x700] = v58;
      *(_OWORD *)&STACK[0x710] = 0u;
      *(_OWORD *)&STACK[0x720] = 0u;
      *(_OWORD *)&STACK[0x730] = xmmword_226AB71E0;
      *(_OWORD *)&STACK[0x740] = 0u;
      *(_OWORD *)&STACK[0x750] = xmmword_226AB71D0;
      *(_OWORD *)&STACK[0x6C0] = 0u;
      *(_OWORD *)&STACK[0x6D0] = v221;
      pv_simd_matrix_rotate();
      v59 = *(_OWORD *)&STACK[0x7D0];
      v60 = *(_OWORD *)&STACK[0x7E0];
      v61 = *(_OWORD *)&STACK[0x7F0];
      v62 = *(_OWORD *)&STACK[0x800];
      v63 = *(_OWORD *)&STACK[0x810];
      v64 = *(_OWORD *)&STACK[0x820];
      v65 = *(_OWORD *)&STACK[0x830];
      v66 = *(_OWORD *)&STACK[0x778];
      *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&STACK[0x7C0];
      *(_OWORD *)&STACK[0x7D0] = v59;
      *(_OWORD *)&STACK[0x7E0] = v60;
      *(_OWORD *)&STACK[0x7F0] = v61;
      *(_OWORD *)&STACK[0x800] = v62;
      *(_OWORD *)&STACK[0x810] = v63;
      *(_OWORD *)&STACK[0x830] = v65;
      *(_OWORD *)&STACK[0x820] = v64;
      *(_OWORD *)&STACK[0x7A0] = v66;
      *(_OWORD *)&STACK[0x7B0] = 0u;
      pv_simd_matrix_translate();
      v226 = *(_OWORD *)&STACK[0x710];
      v230 = *(_OWORD *)&STACK[0x6F0];
      v209 = *(_OWORD *)&STACK[0x700];
      vars0a = *(_OWORD *)&STACK[0x6E0];
      v217 = *(_OWORD *)&STACK[0x750];
      v222 = *(_OWORD *)&STACK[0x730];
      v201 = *(_OWORD *)&STACK[0x740];
      v205 = *(_OWORD *)&STACK[0x720];

      -[JFXOverlayEffectAnimationView additionalTransformLayer](self, "additionalTransformLayer");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)objc_msgSend(v6, "copy");
      v69 = v67;
      v70 = v68;
      objc_msgSend(v70, "setKeyPath:", CFSTR("transform"));
      objc_msgSend(v70, "setFillMode:", v262);
      objc_msgSend(v70, "setRemovedOnCompletion:", 0);
      v71 = (void *)MEMORY[0x24BDD1968];
      *(_OWORD *)&STACK[0x7C0] = v246;
      *(_OWORD *)&STACK[0x7D0] = v261;
      *(_OWORD *)&STACK[0x7E0] = v242;
      *(_OWORD *)&STACK[0x7F0] = v258;
      *(_OWORD *)&STACK[0x800] = v238;
      *(_OWORD *)&STACK[0x810] = v254;
      *(_OWORD *)&STACK[0x820] = v234;
      *(_OWORD *)&STACK[0x830] = v250;
      objc_msgSend(v71, "valueWithCATransform3D:", &STACK[0x7C0]);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setFromValue:", v72);

      v73 = (void *)MEMORY[0x24BDD1968];
      *(_OWORD *)&STACK[0x7C0] = vars0a;
      *(_OWORD *)&STACK[0x7D0] = v230;
      *(_OWORD *)&STACK[0x7E0] = v209;
      *(_OWORD *)&STACK[0x7F0] = v226;
      *(_OWORD *)&STACK[0x800] = v205;
      *(_OWORD *)&STACK[0x810] = v222;
      *(_OWORD *)&STACK[0x820] = v201;
      *(_OWORD *)&STACK[0x830] = v217;
      objc_msgSend(v73, "valueWithCATransform3D:", &STACK[0x7C0]);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setToValue:", v74);

      objc_msgSend(v69, "addAnimation:forKey:", v70, CFSTR("transformAnimation"));
    }
  }
  objc_msgSend(v9, "faceTrackingTransform");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    objc_msgSend(v11, "faceTrackingTransform");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      -[JFXOverlayEffectAnimationView trackingTransformLayer](self, "trackingTransformLayer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v9, "faceTrackingTransform");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXOverlayEffectAnimationView fromEffectFrame](self, "fromEffectFrame");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "transformForTrackingType:", objc_msgSend(v80, "trackingType"));
      *(double *)&v251 = v81;
      *(double *)&v247 = v82;
      *(double *)&v243 = v83;
      *(double *)&v239 = v84;
      *(double *)&v235 = v85;
      *(double *)&v231 = v86;
      *(double *)&v227 = v87;
      *(double *)&v223 = v88;
      *(double *)&v218 = v89;
      *(double *)&vars0b = v90;
      *(double *)&v210 = v91;
      *(double *)&v206 = v92;
      *(double *)&v198 = v94;
      *(double *)&v202 = v93;
      *(double *)&v194 = v96;
      *(double *)&v196 = v95;
      objc_msgSend(v11, "faceTrackingTransform");
      v259 = v6;
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXOverlayEffectAnimationView toEffectFrame](self, "toEffectFrame");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "transformForTrackingType:", objc_msgSend(v98, "trackingType"));
      *(double *)&v190 = v100;
      *(double *)&v192 = v99;
      *(double *)&v186 = v102;
      *(double *)&v188 = v101;
      *(double *)&v182 = v104;
      *(double *)&v184 = v103;
      *(double *)&v179 = v106;
      *(double *)&v180 = v105;
      *(double *)&v108 = v107;
      *(double *)&v110 = v109;
      *(double *)&v112 = v111;
      *(double *)&v114 = v113;
      *(double *)&v116 = v115;
      *(double *)&v118 = v117;
      *(double *)&v120 = v119;
      *(double *)&v122 = v121;
      v123 = v78;
      v124 = v79;
      objc_msgSend(v124, "setKeyPath:", CFSTR("transform"));
      objc_msgSend(v124, "setFillMode:", v262);
      objc_msgSend(v124, "setRemovedOnCompletion:", 0);
      v125 = (void *)MEMORY[0x24BDD1968];
      STACK[0x7C0] = v251;
      STACK[0x7C8] = v247;
      STACK[0x7D0] = v243;
      STACK[0x7D8] = v239;
      STACK[0x7E0] = v235;
      STACK[0x7E8] = v231;
      STACK[0x7F0] = v227;
      STACK[0x7F8] = v223;
      STACK[0x800] = v218;
      STACK[0x808] = vars0b;
      STACK[0x810] = v210;
      STACK[0x818] = v206;
      STACK[0x820] = v202;
      STACK[0x828] = v198;
      STACK[0x830] = v196;
      STACK[0x838] = v194;
      objc_msgSend(v125, "valueWithCATransform3D:", &STACK[0x7C0]);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "setFromValue:", v126);

      v127 = (void *)MEMORY[0x24BDD1968];
      STACK[0x7C0] = v192;
      STACK[0x7C8] = v190;
      STACK[0x7D0] = v188;
      STACK[0x7D8] = v186;
      STACK[0x7E0] = v184;
      STACK[0x7E8] = v182;
      STACK[0x7F0] = v180;
      STACK[0x7F8] = v179;
      STACK[0x800] = v108;
      STACK[0x808] = v110;
      STACK[0x810] = v112;
      STACK[0x818] = v114;
      STACK[0x820] = v116;
      STACK[0x828] = v118;
      STACK[0x830] = v120;
      STACK[0x838] = v122;
      objc_msgSend(v127, "valueWithCATransform3D:", &STACK[0x7C0]);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "setToValue:", v128);

      objc_msgSend(v123, "addAnimation:forKey:", v124, CFSTR("transformAnimation"));
      v6 = v259;

      -[JFXOverlayEffectAnimationView cameraTransformLayer](self, "cameraTransformLayer");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = (void *)objc_msgSend(v259, "copy");
      objc_msgSend(v9, "faceTrackingTransform");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "cameraTransform");
      *(double *)&v256 = v132;
      *(double *)&v252 = v133;
      *(double *)&v248 = v134;
      *(double *)&v244 = v135;
      *(double *)&v240 = v136;
      *(double *)&v236 = v137;
      *(double *)&v232 = v138;
      *(double *)&v228 = v139;
      *(double *)&v224 = v140;
      *(double *)&v219 = v141;
      *(double *)&vars0c = v142;
      *(double *)&v211 = v143;
      *(double *)&v207 = v144;
      *(double *)&v199 = v145;
      *(double *)&v195 = v146;
      *(double *)&v191 = v147;
      objc_msgSend(v11, "faceTrackingTransform");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "cameraTransform");
      *(double *)&v203 = v149;
      *(double *)&v197 = v150;
      *(double *)&v193 = v151;
      *(double *)&v187 = v153;
      *(double *)&v189 = v152;
      *(double *)&v183 = v155;
      *(double *)&v185 = v154;
      *(double *)&v181 = v156;
      *(double *)&v158 = v157;
      *(double *)&v160 = v159;
      *(double *)&v162 = v161;
      *(double *)&v164 = v163;
      *(double *)&v166 = v165;
      *(double *)&v168 = v167;
      *(double *)&v170 = v169;
      *(double *)&v172 = v171;
      v173 = v129;
      v174 = v130;
      objc_msgSend(v174, "setKeyPath:", CFSTR("transform"));
      objc_msgSend(v174, "setFillMode:", v262);
      objc_msgSend(v174, "setRemovedOnCompletion:", 0);
      v175 = (void *)MEMORY[0x24BDD1968];
      STACK[0x7C0] = v256;
      STACK[0x7C8] = v252;
      STACK[0x7D0] = v248;
      STACK[0x7D8] = v244;
      STACK[0x7E0] = v240;
      STACK[0x7E8] = v236;
      STACK[0x7F0] = v232;
      STACK[0x7F8] = v228;
      STACK[0x800] = v224;
      STACK[0x808] = v219;
      STACK[0x810] = vars0c;
      STACK[0x818] = v211;
      STACK[0x820] = v207;
      STACK[0x828] = v199;
      STACK[0x830] = v195;
      STACK[0x838] = v191;
      objc_msgSend(v175, "valueWithCATransform3D:", &STACK[0x7C0]);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "setFromValue:", v176);

      v177 = (void *)MEMORY[0x24BDD1968];
      STACK[0x7C0] = v203;
      STACK[0x7C8] = v197;
      STACK[0x7D0] = v193;
      STACK[0x7D8] = v189;
      STACK[0x7E0] = v187;
      STACK[0x7E8] = v185;
      STACK[0x7F0] = v183;
      STACK[0x7F8] = v181;
      STACK[0x800] = v158;
      STACK[0x808] = v160;
      STACK[0x810] = v162;
      STACK[0x818] = v164;
      STACK[0x820] = v166;
      STACK[0x828] = v168;
      STACK[0x830] = v170;
      STACK[0x838] = v172;
      objc_msgSend(v177, "valueWithCATransform3D:", &STACK[0x7C0]);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "setToValue:", v178);

      objc_msgSend(v173, "addAnimation:forKey:", v174, CFSTR("transformAnimation"));
    }
  }

}

- (JFXOverlayEffectTransforms)currentEffectTransforms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  void *v53;
  JFXFaceTrackedEffectTransform *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  int64x2_t v69;
  int64x2_t v70;
  uint64_t v71;
  void *v72;
  int8x16_t v73;
  int8x16_t v74;
  int8x16_t v75;
  int8x16_t v76;
  int8x16_t v77;
  int8x16_t v78;
  int8x16_t v79;
  int8x16_t v80;
  int8x16_t v81;
  int8x16_t v82;
  int8x16_t v83;
  int8x16_t v84;
  int8x16_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  int8x16_t v94;
  int8x16_t v95;
  int8x16_t v96;
  int8x16_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _OWORD v134[8];
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  __int128 v138;
  _BYTE v139[48];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;

  -[JFXOverlayEffectAnimationView fromEffectFrame](self, "fromEffectFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transforms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXOverlayEffectAnimationView toEffectFrame](self, "toEffectFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXOverlayEffectAnimationView animationDelegate](self, "animationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "animationDidBegin");

  if ((v8 & 1) == 0)
    goto LABEL_9;
  -[JFXOverlayEffectAnimationView animationDelegate](self, "animationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "animationDidEnd");

  if (v10)
  {
    v11 = v6;
LABEL_10:
    v28 = v11;
    goto LABEL_11;
  }
  -[JFXOverlayEffectAnimationView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_9:
    v11 = v4;
    goto LABEL_10;
  }
  objc_msgSend(v4, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v6, "transform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BE790A8];
      -[JFXOverlayEffectAnimationView transformLayer](self, "transformLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentationLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "transform");
        v21 = v132;
        v20 = v133;
        v23 = v130;
        v22 = v131;
        v25 = v128;
        v24 = v129;
        v26 = v126;
        v27 = v127;
      }
      else
      {
        v26 = 0uLL;
        v27 = 0uLL;
        v25 = 0uLL;
        v24 = 0uLL;
        v23 = 0uLL;
        v22 = 0uLL;
        v21 = 0uLL;
        v20 = 0uLL;
      }
      v134[0] = v26;
      v134[1] = v27;
      v134[2] = v25;
      v134[3] = v24;
      v134[4] = v23;
      v134[5] = v22;
      v134[6] = v21;
      v134[7] = v20;
      objc_msgSend(v16, "matrixWithSIMDDouble4x4:", v134);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
  }
  objc_msgSend(v4, "transformAnimation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v6, "transformAnimation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[JFXOverlayEffectAnimationView additionalTransformLayer](self, "additionalTransformLayer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "presentationLayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        objc_msgSend(v33, "transform");
        v36 = v115;
        *(_QWORD *)&v35 = v114;
        v37 = v116;
        v39 = v118;
        *(_QWORD *)&v38 = v117;
        v40 = v119;
        v42 = v121;
        *(_QWORD *)&v41 = v120;
        v43 = v122;
        v45 = v124;
        *(_QWORD *)&v44 = v123;
        v46 = v125;
      }
      else
      {
        v46 = 0uLL;
        *(_QWORD *)&v44 = 0;
        v45 = 0;
        v42 = 0;
        *(_QWORD *)&v41 = 0;
        v39 = 0;
        *(_QWORD *)&v38 = 0;
        v36 = 0;
        *(_QWORD *)&v35 = 0;
        v43 = 0uLL;
        v40 = 0uLL;
        v37 = 0uLL;
      }
      *((_QWORD *)&v35 + 1) = v36;
      *((_QWORD *)&v38 + 1) = v39;
      *((_QWORD *)&v41 + 1) = v42;
      *((_QWORD *)&v44 + 1) = v45;
      v47 = *(_OWORD *)(MEMORY[0x24BE79710] + 80);
      v148 = *(_OWORD *)(MEMORY[0x24BE79710] + 64);
      v149 = v47;
      v48 = *(_OWORD *)(MEMORY[0x24BE79710] + 112);
      v150 = *(_OWORD *)(MEMORY[0x24BE79710] + 96);
      v151 = v48;
      v49 = *(_OWORD *)(MEMORY[0x24BE79710] + 16);
      v144 = *MEMORY[0x24BE79710];
      v145 = v49;
      v50 = *(_OWORD *)(MEMORY[0x24BE79710] + 48);
      v146 = *(_OWORD *)(MEMORY[0x24BE79710] + 32);
      v147 = v50;
      *(_OWORD *)v139 = v37;
      v138 = v35;
      *(_OWORD *)&v139[32] = v40;
      *(_OWORD *)&v139[16] = v38;
      v141 = v43;
      v140 = v41;
      v143 = v46;
      v142 = v44;
      pv_transform_info_make();
      v137 = 0;
      v136 = 0;
      v135 = 0;
      v138 = v146;
      *(_OWORD *)v139 = v147;
      pv_simd_quaternion_get_euler_angles();
      v138 = 0u;
      memset(v139, 0, 40);
      PVTransformAnimationInfoIdentity();
      v138 = *MEMORY[0x24BDC0D88];
      *(_QWORD *)v139 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      *(_QWORD *)&v51 = v148;
      *(_OWORD *)&v139[8] = v144;
      *((_QWORD *)&v51 + 1) = v137;
      *(_OWORD *)&v139[24] = v51;

      v52 = objc_alloc(MEMORY[0x24BE790C8]);
      v144 = v138;
      v145 = *(_OWORD *)v139;
      v146 = *(_OWORD *)&v139[16];
      *(_QWORD *)&v147 = *(_QWORD *)&v139[32];
      v30 = (void *)objc_msgSend(v52, "initWithAnimationInfo:", &v144);
      objc_msgSend(v6, "transformAnimation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "aspectRatio");
      objc_msgSend(v30, "setAspectRatio:");

    }
    else
    {
      v30 = 0;
    }
  }
  objc_msgSend(v4, "faceTrackingTransform");
  v54 = (JFXFaceTrackedEffectTransform *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend(v6, "faceTrackingTransform");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v4, "faceTrackingTransform");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "cameraProjection");
      v88 = v58;
      v89 = v57;
      v86 = v60;
      v87 = v59;

      -[JFXOverlayEffectAnimationView cameraTransformLayer](self, "cameraTransformLayer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "presentationLayer");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
      {
        objc_msgSend(v62, "transform");
        *(_QWORD *)&v90 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v108), v109).u64[0];
        *(_QWORD *)&v91 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v110), v111).u64[0];
        *(_QWORD *)&v92 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v106), v107).u64[0];
        *(_QWORD *)&v93 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v112), v113).u64[0];
      }
      else
      {
        v90 = 0.0;
        v91 = 0.0;
        v92 = 0.0;
        v93 = 0.0;
      }

      -[JFXOverlayEffectAnimationView trackingTransformLayer](self, "trackingTransformLayer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "presentationLayer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v65)
      {
        objc_msgSend(v65, "transform");
        v95 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v102), v103);
        v96 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v104), v105);
        v94 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v100), v101);
        v97 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v98), v99);
      }
      else
      {
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
      }

      -[JFXOverlayEffectAnimationView toEffectFrame](self, "toEffectFrame");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "trackingType");

      if (v68 == 1)
        v71 = 2;
      else
        v71 = 1;
      v69.i64[0] = 1;
      v70.i64[0] = v68;
      v81 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v70, v69).i64[0], 0);
      objc_msgSend(v6, "faceTrackingTransform");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "transformForTrackingType:", v71);
      v77 = v74;
      v78 = v73;
      v85 = vbslq_s8(v81, v96, v74);
      v84 = vbslq_s8(v81, v95, v73);
      v79 = v76;
      v80 = v75;
      v83 = vbslq_s8(v81, v94, v76);
      v82 = vbslq_s8(v81, v97, v75);

      if (v68 != 2)
      {
        v95 = v78;
        v96 = v77;
        v94 = v79;
        v97 = v80;
      }
      v54 = -[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:]([JFXFaceTrackedEffectTransform alloc], "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v89, v88, v87, v86, v92, v90, v91, v93, *(_OWORD *)&v82, *(_OWORD *)&v83, *(_OWORD *)&v84, *(_OWORD *)&v85, *(_OWORD *)&v97, *(_OWORD *)&v94, *(_OWORD *)&v95, *(_OWORD *)&v96);
    }
    else
    {
      v54 = 0;
    }
  }
  +[JFXOverlayEffectTransforms transformsWithTransform:transformAnimation:faceTrackingTransform:](JFXOverlayEffectTransforms, "transformsWithTransform:transformAnimation:faceTrackingTransform:", v14, v30, v54);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return (JFXOverlayEffectTransforms *)v28;
}

- (double)fractionComplete
{
  void *v3;
  int v4;
  double v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;

  -[JFXOverlayEffectAnimationView animationDelegate](self, "animationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animationDidBegin");

  v5 = 0.0;
  if (v4)
  {
    -[JFXOverlayEffectAnimationView animationDelegate](self, "animationDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "animationDidEnd");

    v5 = 1.0;
    if ((v7 & 1) == 0)
    {
      -[JFXOverlayEffectAnimationView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentationLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0.0;
      if (v9)
      {
        -[JFXOverlayEffectAnimationView layer](self, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "presentationLayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "opacity");
        v5 = v12;

      }
    }
  }
  return v5;
}

- (JFXOverlayEffectFrame)fromEffectFrame
{
  return self->_fromEffectFrame;
}

- (void)setFromEffectFrame:(id)a3
{
  objc_storeStrong((id *)&self->_fromEffectFrame, a3);
}

- (JFXOverlayEffectFrame)toEffectFrame
{
  return self->_toEffectFrame;
}

- (void)setToEffectFrame:(id)a3
{
  objc_storeStrong((id *)&self->_toEffectFrame, a3);
}

- (JFXEffectAnimationDelegate)animationDelegate
{
  return self->_animationDelegate;
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_animationDelegate, a3);
}

- (CALayer)transformLayer
{
  return self->_transformLayer;
}

- (void)setTransformLayer:(id)a3
{
  objc_storeStrong((id *)&self->_transformLayer, a3);
}

- (CALayer)additionalTransformLayer
{
  return self->_additionalTransformLayer;
}

- (void)setAdditionalTransformLayer:(id)a3
{
  objc_storeStrong((id *)&self->_additionalTransformLayer, a3);
}

- (CALayer)trackingTransformLayer
{
  return self->_trackingTransformLayer;
}

- (void)setTrackingTransformLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackingTransformLayer, a3);
}

- (CALayer)cameraTransformLayer
{
  return self->_cameraTransformLayer;
}

- (void)setCameraTransformLayer:(id)a3
{
  objc_storeStrong((id *)&self->_cameraTransformLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraTransformLayer, 0);
  objc_storeStrong((id *)&self->_trackingTransformLayer, 0);
  objc_storeStrong((id *)&self->_additionalTransformLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_animationDelegate, 0);
  objc_storeStrong((id *)&self->_toEffectFrame, 0);
  objc_storeStrong((id *)&self->_fromEffectFrame, 0);
}

@end
