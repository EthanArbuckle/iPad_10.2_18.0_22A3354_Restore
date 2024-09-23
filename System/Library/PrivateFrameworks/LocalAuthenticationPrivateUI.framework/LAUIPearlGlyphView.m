@implementation LAUIPearlGlyphView

+ (id)sharedStaticResources
{
}

+ (void)collectPipelineDescriptors
{
  objc_opt_self();
  __break(1u);
}

+ (void)invokeSuccessFeedback
{
  if (_AXSPearlAuthenticationHapticsEnabled())
    AudioServicesPlaySystemSoundWithCompletion(0x489u, 0);
}

- (LAUIPearlGlyphView)init
{
  id v3;
  LAUIPearlGlyphView *v4;

  v3 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration](LAUIPearlGlyphStaticConfiguration, "createDefaultConfiguration");
  v4 = -[LAUIPearlGlyphView initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (LAUIPearlGlyphView)initWithStyle:(int64_t)a3
{
  id v5;
  void *v6;
  LAUIPearlGlyphView *v7;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
    v5 = +[LAUIPearlGlyphStaticConfiguration createSystemApertureConfiguration](LAUIPearlGlyphStaticConfiguration, "createSystemApertureConfiguration");
  else
    v5 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration](LAUIPearlGlyphStaticConfiguration, "createDefaultConfiguration");
  v6 = v5;
  objc_msgSend(v5, "setInitialStyle:", a3);
  v7 = -[LAUIPearlGlyphView initWithConfiguration:](self, "initWithConfiguration:", v6);

  return v7;
}

- (LAUIPearlGlyphView)initWithConfiguration:(id)a3
{
  _anonymous_namespace_ *v4;
  _anonymous_namespace_ *v5;
  void *static_resources;
  void *v7;
  LAUIMetalRenderLoop *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  LAUIPearlGlyphView *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  LAUICheckmarkLayer *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  int8x16_t *v47;
  double v48;
  float v49;
  float v50;
  float v51;
  float v52;
  __int128 v53;
  float v54;
  float v55;
  unsigned int v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  double v62;
  double v63;
  float v64;
  float v65;
  float v66;
  LAUIPearlGlyphView *result;
  float v68;
  float v69;
  unsigned int v70;
  unint64_t v71;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int8x16_t v81;
  int8x16_t *v82;
  int8x16_t v83;
  unsigned int v84;
  int8x16_t v85;
  int8x16_t v86;
  int8x16_t v87;
  _OWORD *v88;
  uint64_t v89;
  _OWORD *v90;
  uint64_t *v91;
  void **v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  float v100;
  uint64_t *v101;
  unint64_t v102;
  _QWORD *v103;
  uint64_t *v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  __int128 v112;
  __int128 v113;
  _OWORD *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  float v121;
  char *v122;
  unint64_t v123;
  char *v124;
  double v125;
  uint64_t *v126;
  void **v127;
  char *v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  __int128 v136;
  __int128 v137;
  void *v138;
  double v139;
  void *v140;
  void *v141;
  __int128 v142;
  int8x16_t v143;
  double v144;
  uint64_t *v145;
  float v146;
  _QWORD *obj;
  void *v148;
  LAUIMetalRenderLoop *v149;
  void *v150;
  _BYTE v151[23];
  uint64_t v152;
  __int128 v153;
  objc_super v154;
  void *v155;
  void *v156;
  _OWORD *v157;
  unint64_t v158;
  unint64_t v159;
  double v160;
  float v161;
  float v162;
  float v163;
  float v164;
  float v165;
  float v166;
  float v167;
  float v168;
  uint64_t v169;
  __int128 v170;
  uint64_t v171;
  const __CFString *v172;
  const __CFString *v173;
  const __CFString *v174;
  const __CFString *v175;
  const __CFString *v176;
  const __CFString *v177;
  const __CFString *v178;
  const __CFString *v179;
  void *__p[2];
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  unint64_t *v185;
  float *v186;
  float *v187;
  __int128 v188;
  int v189;
  uint64_t v190;
  uint64_t v191;

  v191 = *MEMORY[0x24BDAC8D0];
  v4 = (_anonymous_namespace_ *)a3;
  v5 = v4;
  if (!v4)
  {
    v19 = 0;
LABEL_93:

    return v19;
  }
  v7 = static_resources;
  if (!static_resources)
  {
    v19 = 0;
LABEL_92:

    goto LABEL_93;
  }
  obj = objc_retainAutorelease(static_resources);
  v8 = -[LAUIMetalRenderLoop initWithPixelFormat:forDevice:]([LAUIMetalRenderLoop alloc], "initWithPixelFormat:forDevice:", 80, obj[1]);
  v150 = v7;
  if (!v8)
  {
    v19 = 0;
LABEL_91:

    v7 = v150;
    goto LABEL_92;
  }
  v149 = v8;
  v9 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v154.receiver = self;
  v154.super_class = (Class)LAUIPearlGlyphView;
  v13 = -[LAUIPearlGlyphView initWithFrame:](&v154, sel_initWithFrame_, v9, v10, v11, v12);
  v14 = v13;
  v15 = (uint64_t)v13;
  if (!v13)
  {
LABEL_90:
    self = (LAUIPearlGlyphView *)(id)v15;
    v19 = self;
    v8 = v149;
    goto LABEL_91;
  }
  objc_storeStrong((id *)v13 + 53, obj);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  *(_QWORD *)(v15 + 448) = v17;

  *(_BYTE *)(v15 + 776) = 0;
  *(_BYTE *)(v15 + 777) = 1;
  *(_BYTE *)(v15 + 778) = 1;
  *(_BYTE *)(v15 + 497) = 1;
  *((_QWORD *)v14 + 54) = -[_anonymous_namespace_ initialStyle](v5, "initialStyle");
  v18 = UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled();
  *((_BYTE *)v14 + 440) = v18;
  *(_QWORD *)(v15 + 784) = 3;
  v20 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  v21 = (void *)*((_QWORD *)v14 + 59);
  *((_QWORD *)v14 + 59) = v20;

  objc_msgSend((id)v15, "addSubview:", *((_QWORD *)v14 + 59));
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = (uint64_t)CFSTR("position");
  *(_QWORD *)&v170 = CFSTR("bounds");
  __p[0] = v22;
  __p[1] = v22;
  *((_QWORD *)&v170 + 1) = CFSTR("transform");
  v171 = (uint64_t)CFSTR("backgroundColor");
  *(_QWORD *)&v181 = v22;
  *((_QWORD *)&v181 + 1) = v22;
  v172 = CFSTR("cornerRadius");
  v173 = CFSTR("contents");
  *(_QWORD *)&v182 = v22;
  *((_QWORD *)&v182 + 1) = v22;
  v174 = CFSTR("anchorPoint");
  v175 = CFSTR("opacity");
  *(_QWORD *)&v183 = v22;
  *((_QWORD *)&v183 + 1) = v22;
  v176 = CFSTR("strokeStart");
  v177 = CFSTR("strokeEnd");
  *(_QWORD *)&v184 = v22;
  *((_QWORD *)&v184 + 1) = v22;
  v178 = CFSTR("strokeColor");
  v179 = CFSTR("fillColor");
  v185 = (unint64_t *)v22;
  v186 = (float *)v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", __p, &v169, 12);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  v24 = (void *)*((_QWORD *)v14 + 100);
  *((_QWORD *)v14 + 100) = v23;

  objc_msgSend(*((id *)v14 + 100), "setActions:", v148);
  LODWORD(v25) = 0;
  objc_msgSend(*(id *)(v15 + 800), "setOpacity:", v25);
  objc_msgSend(*(id *)(v15 + 800), "setContentsScale:", *(double *)(v15 + 448));
  v26 = objc_alloc_init(LAUICheckmarkLayer);
  v27 = (void *)*((_QWORD *)v14 + 57);
  *((_QWORD *)v14 + 57) = v26;

  objc_msgSend(*((id *)v14 + 57), "setContentsScale:", *(double *)(v15 + 448));
  objc_msgSend(*(id *)(v15 + 800), "addSublayer:", *(_QWORD *)(v15 + 456));
  v28 = objc_alloc_init(MEMORY[0x24BDE5758]);
  v29 = (void *)*((_QWORD *)v14 + 70);
  *((_QWORD *)v14 + 70) = v28;

  objc_msgSend(*((id *)v14 + 70), "setActions:", v148);
  objc_msgSend(*(id *)(v15 + 560), "setContentsScale:", *(double *)(v15 + 448));
  v30 = *(void **)(v15 + 560);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v30, "setStrokeColor:", objc_msgSend(v31, "CGColor"));

  v32 = *(void **)(v15 + 560);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v32, "setFillColor:", objc_msgSend(v33, "CGColor"));

  objc_msgSend(*(id *)(v15 + 560), "setLineWidth:", 1.0);
  objc_msgSend(*(id *)(v15 + 800), "setMask:", *(_QWORD *)(v15 + 560));
  *(_BYTE *)(v15 + 552) = 1;
  objc_storeStrong((id *)v14 + 60, v149);
  LODWORD(v34) = 1117782016;
  LODWORD(v35) = 1123024896;
  LODWORD(v36) = 1123024896;
  objc_msgSend(*((id *)v14 + 60), "setPreferredFrameRateRange:", v34, v35, v36);
  objc_msgSend(*((id *)v14 + 60), "setHighFrameRateReason:", 2424833);
  objc_msgSend(*((id *)v14 + 60), "setDelegate:", v15);
  *(_QWORD *)(v15 + 768) = CGColorSpaceRetain((CGColorSpaceRef)objc_msgSend(*((id *)v14 + 60), "colorSpace"));
  objc_msgSend(*((id *)v14 + 60), "layer");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)*((_QWORD *)v14 + 61);
  *((_QWORD *)v14 + 61) = v37;

  objc_msgSend(*((id *)v14 + 61), "setOpaque:", 0);
  v153 = xmmword_209E30EF0;
  v39 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t *)operator new();
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::renderer_t(v39, *((_QWORD *)v14 + 60), obj + 1, &v153);
  std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::renderer_t>::reset[abi:ne180100]((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)v14 + 71, v39);
  -[_anonymous_namespace_ lineThicknessScale](v5, "lineThicknessScale");
  v41 = v40;
  v42 = *((_QWORD *)v14 + 71);
  v43 = -[_anonymous_namespace_ pathStyle](v5, "pathStyle");
  *(_OWORD *)&v151[7] = *((_OWORD *)v14 + 27);
  v44 = operator new();
  v45 = v44;
  v144 = v41;
  v46 = v41 * 0.105;
  *(_BYTE *)v44 = 0;
  *(_BYTE *)(v44 + 40) = 0;
  *(_WORD *)(v44 + 48) = 0;
  *(_QWORD *)(v44 + 56) = 0;
  *(_QWORD *)(v44 + 64) = v42;
  *(_QWORD *)(v44 + 80) = 0;
  v47 = (int8x16_t *)(v44 + 80);
  *(_QWORD *)(v44 + 88) = 0;
  *(_BYTE *)(v44 + 96) = 0;
  *(_BYTE *)(v44 + 112) = 0;
  *(_BYTE *)(v44 + 128) = 1;
  *(_OWORD *)(v44 + 129) = *(_OWORD *)v151;
  *(_QWORD *)(v44 + 144) = *(_QWORD *)&v151[15];
  *(_BYTE *)(v44 + 152) = 0;
  *(_BYTE *)(v44 + 832) = 0;
  *(_BYTE *)(v44 + 1104) = 0;
  *(_BYTE *)(v44 + 896) = 0;
  *(_OWORD *)(v44 + 864) = 0u;
  *(_OWORD *)(v44 + 880) = 0u;
  *(_OWORD *)(v44 + 848) = 0u;
  *(_OWORD *)(v44 + 1120) = 0u;
  *(_OWORD *)(v44 + 1136) = 0u;
  *(_OWORD *)(v44 + 1152) = 0u;
  *(_QWORD *)(v44 + 1168) = 0;
  *(_DWORD *)(v44 + 1176) = 1065353216;
  v48 = v46;
  v49 = 2.12131567 - v46;
  v168 = v49;
  v50 = 1.99999608 - v46;
  v167 = v50;
  v51 = 1.14707981 - v46;
  v166 = v51;
  v52 = flt_209E30E10[v43 == 1];
  v165 = (float)(v49 - v51) * 0.5;
  *(float *)&v53 = v165 * v52;
  v54 = 0.85;
  if (v43 == 1)
    v54 = 0.5;
  v55 = (float)(v54 * *(float *)&v53) + (float)(v54 * *(float *)&v53);
  v56 = 0;
  if (v43 == 1)
    v57 = 0.0;
  else
    v57 = v55;
  v164 = v57 + v51;
  v58 = (float)(v49 - (float)(v57 + v51)) * 0.5;
  if (v43 == 1)
    v59 = 0.0;
  else
    v59 = *(float *)&v53;
  v163 = v59 + v58;
  v162 = v51 - v55;
  v161 = (float)((float)(v49 - (float)(v51 - v55)) * 0.5) - *(float *)&v53;
  v60 = (float)(v46 * 0.5) / (v49 * 3.14159265) + 0.0250000004;
  v61 = (float)(v60 + v60) * 3.14159265;
  *(float *)(v44 + 160) = v49 * 0.5;
  v62 = 2.87;
  if (v43 != 1)
    v62 = 5.0;
  v155 = *(void **)&v62;
  v63 = 2.3;
  if (v43 == 1)
    v63 = 1.0;
  v160 = v63;
  *(_QWORD *)&v53 = 0xC011FFFFB2AE0E4DLL;
  *(_OWORD *)(v44 + 176) = 0uLL;
  *(_OWORD *)(v44 + 192) = v53;
  *(_QWORD *)&v53 = 0xC010F876CCDF6CDALL;
  *(_OWORD *)(v44 + 208) = 0uLL;
  *(_OWORD *)(v44 + 224) = v53;
  v146 = v41 * 0.105;
  *(float *)(v44 + 240) = v46;
  *(double *)(v44 + 248) = v61 + -3.14159265;
  *(double *)(v44 + 256) = 3.14159265 - v61;
  *(_DWORD *)(v44 + 272) = 0;
  v64 = 1.0;
  v65 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
  *(float *)(v45 + 276) = v65;
  *(_BYTE *)(v45 + 280) = 0;
  *(_BYTE *)(v45 + 288) = 0;
  *(_DWORD *)(v45 + 300) = 0;
  if (v65 <= 0.0)
    v66 = 0.0;
  else
    v66 = INFINITY;
  *(float *)(v45 + 296) = v66;
  *(float *)(v45 + 292) = v66;
  *(_QWORD *)(v45 + 304) = 0;
  *(_DWORD *)(v45 + 320) = 0;
  *(_DWORD *)(v45 + 328) = 0;
  *(float *)(v45 + 332) = v65;
  *(_BYTE *)(v45 + 336) = 0;
  *(_BYTE *)(v45 + 344) = 0;
  *(_DWORD *)(v45 + 356) = 0;
  *(float *)(v45 + 352) = v66;
  *(float *)(v45 + 348) = v66;
  *(_QWORD *)(v45 + 360) = 0;
  *(_DWORD *)(v45 + 376) = 0;
  *(_DWORD *)(v45 + 384) = 0;
  *(float *)(v45 + 388) = v65;
  *(_BYTE *)(v45 + 392) = 0;
  *(_BYTE *)(v45 + 400) = 0;
  *(_DWORD *)(v45 + 412) = 0;
  *(float *)(v45 + 408) = v66;
  *(float *)(v45 + 404) = v66;
  *(_QWORD *)(v45 + 416) = 0;
  *(_DWORD *)(v45 + 432) = 0;
  *(_DWORD *)(v45 + 440) = 0;
  *(float *)(v45 + 444) = v65;
  *(_BYTE *)(v45 + 448) = 0;
  *(_BYTE *)(v45 + 456) = 0;
  *(_DWORD *)(v45 + 468) = 0;
  *(float *)(v45 + 464) = v66;
  *(float *)(v45 + 460) = v66;
  *(_QWORD *)(v45 + 472) = 0;
  *(_DWORD *)(v45 + 488) = 0;
  *(_DWORD *)(v45 + 640) = 0;
  *(float *)(v45 + 644) = v65;
  *(_BYTE *)(v45 + 648) = 0;
  *(_BYTE *)(v45 + 656) = 0;
  *(_DWORD *)(v45 + 668) = 0;
  *(float *)(v45 + 664) = v66;
  *(float *)(v45 + 660) = v66;
  *(_QWORD *)(v45 + 672) = 0;
  *(_DWORD *)(v45 + 688) = 0;
  *(_DWORD *)(v45 + 696) = 0;
  *(float *)(v45 + 700) = v65;
  *(_BYTE *)(v45 + 704) = 0;
  *(_BYTE *)(v45 + 712) = 0;
  *(_DWORD *)(v45 + 724) = 0;
  *(float *)(v45 + 720) = v66;
  *(float *)(v45 + 716) = v66;
  *(_QWORD *)(v45 + 728) = 0;
  *(_DWORD *)(v45 + 744) = 0;
  *(_QWORD *)(v45 + 752) = 0;
  *(float *)(v45 + 760) = v65;
  *(_BYTE *)(v45 + 764) = 0;
  *(_BYTE *)(v45 + 772) = 0;
  *(_DWORD *)(v45 + 784) = 0;
  *(float *)(v45 + 780) = v66;
  *(float *)(v45 + 776) = v66;
  *(_DWORD *)(v45 + 816) = 0;
  *(_QWORD *)(v45 + 800) = 0;
  *(_QWORD *)(v45 + 792) = 0;
  if (*(_BYTE *)(v45 + 144))
  {
    v68 = -3.1416;
    v69 = 3.1416;
    v70 = 0;
    switch(*(_BYTE *)(v45 + 152))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
        goto LABEL_33;
      case 4:
        goto LABEL_31;
      case 6:
        goto LABEL_32;
      default:
        goto LABEL_96;
    }
  }
  v68 = -3.1416;
  v69 = 3.1416;
  v70 = 0;
  switch(*(_BYTE *)(v45 + 152))
  {
    case 0:
    case 1:
    case 2:
    case 5:
      goto LABEL_33;
    case 3:
      v71 = *(_QWORD *)(v45 + 136);
      if (v71 >= 0xA)
        goto LABEL_96;
      v56 = dword_209E31370[v71];
      v70 = dword_209E31398[v71];
      v64 = 0.2;
LABEL_33:
      __p[0] = (void *)__PAIR64__(LODWORD(v65), LODWORD(v64));
      LOBYTE(__p[1]) = 0;
      LOBYTE(v181) = 0;
      *((_QWORD *)&v181 + 1) = LODWORD(v66);
      *((float *)&v181 + 1) = v66;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v45 + 272, (uint64_t)__p, 0);
      __p[0] = (void *)__PAIR64__(LODWORD(v65), v56);
      LOBYTE(__p[1]) = 0;
      LOBYTE(v181) = 0;
      *((_QWORD *)&v181 + 1) = LODWORD(v66);
      *((float *)&v181 + 1) = v66;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v45 + 328, (uint64_t)__p, 0);
      __p[0] = (void *)__PAIR64__(LODWORD(v65), v70);
      LOBYTE(__p[1]) = 0;
      LOBYTE(v181) = 0;
      *((_QWORD *)&v181 + 1) = LODWORD(v66);
      *((float *)&v181 + 1) = v66;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v45 + 384, (uint64_t)__p, 0);
      LODWORD(__p[0]) = 1066285284;
      *((float *)__p + 1) = v65;
      LOBYTE(__p[1]) = 0;
      LOBYTE(v181) = 0;
      *((_QWORD *)&v181 + 1) = LODWORD(v66);
      *((float *)&v181 + 1) = v66;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v45 + 440, (uint64_t)__p, 0);
      __p[0] = 0;
      __p[1] = 0;
      __asm { FMOV            V0.2D, #-3.0 }
      v181 = _Q0;
      *(float *)&v182 = v65;
      BYTE4(v182) = 0;
      BYTE12(v182) = 0;
      *(_QWORD *)((char *)&v183 + 4) = LODWORD(v66);
      *(float *)&v183 = v66;
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v45 + 496, (uint64_t)__p, 0);
      __p[0] = (void *)__PAIR64__(LODWORD(v65), LODWORD(v68));
      LOBYTE(__p[1]) = 0;
      LOBYTE(v181) = 0;
      *((_QWORD *)&v181 + 1) = LODWORD(v66);
      *((float *)&v181 + 1) = v66;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v45 + 640, (uint64_t)__p, 0);
      v145 = (uint64_t *)v14;
      __p[0] = (void *)__PAIR64__(LODWORD(v65), LODWORD(v69));
      LOBYTE(__p[1]) = 0;
      LOBYTE(v181) = 0;
      *((_QWORD *)&v181 + 1) = LODWORD(v66);
      *((float *)&v181 + 1) = v66;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v45 + 696, (uint64_t)__p, 0);
      *(_BYTE *)(v45 + 832) = 1;
      v77 = *(_QWORD *)(v45 + 872);
      if (0x8E38E38E38E38E39 * ((*(_QWORD *)(v45 + 888) - v77) >> 5) <= 1)
      {
        v78 = *(_QWORD *)(v45 + 880);
        *(_QWORD *)&v182 = v45 + 888;
        __p[0] = operator new(0x240uLL);
        __p[1] = (char *)__p[0] + v78 - v77;
        *(void **)&v181 = __p[1];
        *((_QWORD *)&v181 + 1) = (char *)__p[0] + 576;
        v77 = *(_QWORD *)(v45 + 872);
      }
      v159 = 0x8E38E38E38E38E39 * ((*(_QWORD *)(v45 + 880) - v77) >> 5);
      LOBYTE(__p[0]) = 1;
      v158 = 0x8E38E38E38E38E39 * ((uint64_t)(*(_QWORD *)(v45 + 880) - *(_QWORD *)(v45 + 872)) >> 5);
      LOBYTE(__p[0]) = 0;
      __p[0] = &v168;
      __p[1] = &v167;
      *(_QWORD *)&v181 = &v164;
      *((_QWORD *)&v181 + 1) = &v155;
      *(_QWORD *)&v182 = &v160;
      *((_QWORD *)&v182 + 1) = &v166;
      *(_QWORD *)&v183 = &v162;
      *((_QWORD *)&v183 + 1) = v45;
      *(_QWORD *)&v184 = v42;
      *((_QWORD *)&v184 + 1) = &v159;
      v185 = &v158;
      v186 = &v161;
      v187 = &v165;
      *(_QWORD *)&v188 = &v163;
      v79 = *(_QWORD *)(v45 + 848);
      if (0xEEEEEEEEEEEEEEEFLL * ((*(_QWORD *)(v45 + 864) - v79) >> 4) <= 3)
      {
        v80 = *(_QWORD *)(v45 + 856);
        v172 = (const __CFString *)(v45 + 864);
        v169 = (uint64_t)operator new(0x3C0uLL);
        *(_QWORD *)&v170 = v169 + v80 - v79;
        *((_QWORD *)&v170 + 1) = v170;
        v171 = v169 + 960;
      }
      *(float *)&v159 = v146;
      if (*(_BYTE *)(v45 + 1104))
      {
        _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(v45 + 1088);
        result = (LAUIPearlGlyphView *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v45 + 992);
        *(_BYTE *)(v45 + 1104) = 0;
      }
      *(_OWORD *)(v45 + 912) = xmmword_209E30C90;
      *(float *)(v45 + 928) = v65;
      *(_BYTE *)(v45 + 932) = 0;
      *(_BYTE *)(v45 + 940) = 0;
      *(_DWORD *)(v45 + 952) = 0;
      *(float *)(v45 + 948) = v66;
      *(float *)(v45 + 944) = v66;
      v83 = *(int8x16_t *)(v45 + 912);
      *(int8x16_t *)(v45 + 960) = v83;
      *(int8x16_t *)(v45 + 976) = v83;
      *(_DWORD *)(v45 + 1000) = 0;
      *(_QWORD *)(v45 + 1016) = 0;
      *(_QWORD *)(v45 + 1008) = 0;
      *(float *)(v45 + 1024) = v65;
      *(_BYTE *)(v45 + 1028) = 0;
      *(_BYTE *)(v45 + 1036) = 0;
      *(_DWORD *)(v45 + 1048) = 0;
      *(float *)(v45 + 1044) = v66;
      *(float *)(v45 + 1040) = v66;
      *(_DWORD *)(v45 + 1096) = 0;
      v82 = (int8x16_t *)(v45 + 80);
      v83.i32[1] = 0;
      v83.i64[1] = 0;
      *(_OWORD *)(v45 + 1056) = 0u;
      *(_OWORD *)(v45 + 1072) = 0u;
      if (*(_BYTE *)(v45 + 112))
        v82 = (int8x16_t *)(v45 + 96);
      v84 = *(unsigned __int8 *)(v45 + 152);
      if (v84 <= 6)
      {
        v85 = *v82;
        if (((1 << v84) & 0x27) != 0)
        {
          v83.i32[0] = 0;
          v81.i8[0] = *(_BYTE *)(v45 + 128);
          v86 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v81, v83), 0);
          v87 = *v82;
          v87.i32[3] = 0;
          v85 = vbslq_s8(v86, v87, v85);
        }
        else
        {
          v85.i32[3] = 0;
        }
        v143 = v85;
        *(_OWORD *)__p = xmmword_209E30C90;
        *(float *)&v181 = v65;
        BYTE4(v181) = 0;
        BYTE12(v181) = 0;
        *(_QWORD *)((char *)&v182 + 4) = LODWORD(v66);
        *(float *)&v182 = v66;
        LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v45 + 912, (uint64_t)__p, 0);
        *(int8x16_t *)__p = v143;
        *(float *)&v181 = v65;
        BYTE4(v181) = 0;
        BYTE12(v181) = 0;
        *(_QWORD *)((char *)&v182 + 4) = LODWORD(v66);
        *(float *)&v182 = v66;
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v45 + 1008, (uint64_t)__p, 0);
        *(_BYTE *)(v45 + 1104) = 1;
        v88 = operator new(0x40uLL);
        *v88 = xmmword_209E31150;
        v88[1] = unk_209E31160;
        v88[2] = xmmword_209E31170;
        v88[3] = unk_209E31180;
        __p[0] = v88;
        __p[1] = v88 + 4;
        *(_QWORD *)&v181 = v88 + 4;
        v89 = *(_QWORD *)(v45 + 64);
        v169 = 4;
        v155 = (void *)LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_spline(v89, (unint64_t *)&v169, (__int128 **)__p);
        v169 = v45;
        *(_QWORD *)&v170 = &v155;
        *((_QWORD *)&v170 + 1) = &v159;
        _ZZN12_GLOBAL__N_118face_id_animator_tC1ERN36LAUI_uniform_cubic_b_spline_renderer10renderer_tE23LAUIPearlGlyphPathStylefRKNS_15face_id_state_tEENKUlDv3_fE_clES8_((uint64_t)&v169, (__n128)xmmword_209E30F00);
        _ZZN12_GLOBAL__N_118face_id_animator_tC1ERN36LAUI_uniform_cubic_b_spline_renderer10renderer_tE23LAUIPearlGlyphPathStylefRKNS_15face_id_state_tEENKUlDv3_fE_clES8_((uint64_t)&v169, (__n128)xmmword_209E30F10);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v90 = operator new(0x70uLL);
        v91 = v145;
        v92 = (void **)(v45 + 1120);
        v90[4] = xmmword_209E311D0;
        v90[5] = unk_209E311E0;
        v90[6] = xmmword_209E311F0;
        *v90 = xmmword_209E31190;
        v90[1] = unk_209E311A0;
        v90[2] = xmmword_209E311B0;
        v90[3] = unk_209E311C0;
        v155 = v90;
        v156 = v90 + 7;
        v157 = v90 + 7;
        v93 = *(_QWORD *)(v45 + 64);
        __p[0] = (void *)7;
        v160 = COERCE_DOUBLE(LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_spline(v93, (unint64_t *)__p, (__int128 **)&v155));
        v94 = *(_QWORD *)(v45 + 64);
        v170 = xmmword_209E30F20;
        v169 = 0;
        v171 = 0x3FF0000000000000;
        *(_OWORD *)__p = 0u;
        v181 = xmmword_209E30C90;
        v182 = 0u;
        v183 = xmmword_209E30C90;
        __asm { FMOV            V0.4S, #1.0 }
        v142 = _Q0;
        v184 = _Q0;
        v185 = 0;
        v186 = 0;
        v188 = xmmword_209E30F30;
        LODWORD(v187) = 1065353216;
        v189 = 0;
        v190 = 0;
        v96 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v94, (uint64_t *)&v160, (__int128 *)&v169, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)__p);
        v98 = v96;
        v99 = v97;
        v100 = v48 * 0.78;
        v101 = *(uint64_t **)(v45 + 1128);
        v102 = *(_QWORD *)(v45 + 1136);
        if ((unint64_t)v101 >= v102)
        {
          v104 = (uint64_t *)*v92;
          v105 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (_BYTE *)*v92) >> 4);
          v106 = v105 + 1;
          if (v105 + 1 > 0x555555555555555)
            goto LABEL_94;
          v107 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102 - (_QWORD)v104) >> 4);
          if (2 * v107 > v106)
            v106 = 2 * v107;
          if (v107 >= 0x2AAAAAAAAAAAAAALL)
            v108 = 0x555555555555555;
          else
            v108 = v106;
          if (v108)
          {
            if (v108 > 0x555555555555555)
              goto LABEL_95;
            v109 = (char *)operator new(48 * v108);
          }
          else
          {
            v109 = 0;
          }
          v110 = &v109[48 * v105];
          v111 = &v109[48 * v108];
          *(_QWORD *)v110 = v98;
          *((_QWORD *)v110 + 1) = v99;
          *((float *)v110 + 4) = v100;
          *((_OWORD *)v110 + 2) = xmmword_209E30F40;
          v103 = v110 + 48;
          if (v101 == v104)
          {
            v91 = v145;
            v92 = (void **)(v45 + 1120);
          }
          else
          {
            v91 = v145;
            v92 = (void **)(v45 + 1120);
            do
            {
              v112 = *((_OWORD *)v101 - 3);
              v113 = *((_OWORD *)v101 - 1);
              *((_OWORD *)v110 - 2) = *((_OWORD *)v101 - 2);
              *((_OWORD *)v110 - 1) = v113;
              *((_OWORD *)v110 - 3) = v112;
              v110 -= 48;
              v101 -= 6;
            }
            while (v101 != v104);
            v101 = *(uint64_t **)(v45 + 1120);
          }
          *(_QWORD *)(v45 + 1120) = v110;
          *(_QWORD *)(v45 + 1128) = v103;
          *(_QWORD *)(v45 + 1136) = v111;
          if (v101)
            operator delete(v101);
        }
        else
        {
          *v101 = v96;
          v101[1] = v97;
          *((float *)v101 + 4) = v100;
          *((_OWORD *)v101 + 2) = xmmword_209E30F40;
          v103 = v101 + 6;
        }
        *(_QWORD *)(v45 + 1128) = v103;
        if (v155)
        {
          v156 = v155;
          operator delete(v155);
        }
        v114 = operator new(0x50uLL);
        v114[2] = xmmword_209E31220;
        v114[3] = unk_209E31230;
        v114[4] = xmmword_209E31240;
        *v114 = xmmword_209E31200;
        v114[1] = unk_209E31210;
        v155 = v114;
        v156 = v114 + 5;
        v157 = v114 + 5;
        v115 = *(_QWORD *)(v45 + 64);
        __p[0] = (void *)5;
        v160 = COERCE_DOUBLE(LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_spline(v115, (unint64_t *)__p, (__int128 **)&v155));
        v116 = *(_QWORD *)(v45 + 64);
        v170 = xmmword_209E30F20;
        v169 = 0;
        v171 = 0x3FF0000000000000;
        *(_OWORD *)__p = 0u;
        v181 = xmmword_209E30C90;
        v182 = 0u;
        v183 = xmmword_209E30C90;
        v184 = v142;
        v185 = 0;
        v186 = 0;
        v188 = xmmword_209E30F30;
        LODWORD(v187) = 1065353216;
        v189 = 0;
        v190 = 0;
        v117 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v116, (uint64_t *)&v160, (__int128 *)&v169, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)__p);
        v119 = v117;
        v120 = v118;
        v121 = v48 * 0.85;
        v122 = *(char **)(v45 + 1128);
        v123 = *(_QWORD *)(v45 + 1136);
        if ((unint64_t)v122 < v123)
        {
          *(_QWORD *)v122 = v117;
          *((_QWORD *)v122 + 1) = v118;
          *((float *)v122 + 4) = v121;
          *((_OWORD *)v122 + 2) = xmmword_209E30F50;
          v124 = v122 + 48;
          v125 = v144;
LABEL_87:
          *(_QWORD *)(v45 + 1128) = v124;
          if (v155)
          {
            v156 = v155;
            operator delete(v155);
          }
          v152 = 0;
          v138 = *(void **)(v15 + 456);
          -[_anonymous_namespace_ checkmarkThicknessScale](v5, "checkmarkThicknessScale");
          objc_msgSend(v138, "setLineWidthScale:", v125 * v139);
          objc_msgSend(*(id *)(v15 + 472), "layer");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "addSublayer:", *(_QWORD *)(v15 + 800));
          objc_msgSend(v140, "addSublayer:", *(_QWORD *)(v15 + 488));
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "addObserver:selector:name:object:", v15, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);
          objc_msgSend(v141, "addObserver:selector:name:object:", v15, sel_reduceTransparencyDidChange_, *MEMORY[0x24BDF7318], 0);
          objc_msgSend(v141, "addObserver:selector:name:object:", v15, sel_reduceMotionDidChange_, *MEMORY[0x24BDF7310], 0);
          -[LAUIPearlGlyphView _applyConfiguration]((void *)v15);
          *(_QWORD *)(v15 + 792) = 0;
          *(_QWORD *)(v15 + 720) = 0;
          -[LAUIPearlGlyphView _applyStateAnimated:](v15, 0);

          goto LABEL_90;
        }
        v126 = v91;
        v127 = v92;
        v128 = (char *)*v92;
        v129 = 0xAAAAAAAAAAAAAAABLL * ((v122 - (_BYTE *)*v92) >> 4);
        v130 = v129 + 1;
        if (v129 + 1 <= 0x555555555555555)
        {
          v131 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v123 - (_QWORD)v128) >> 4);
          if (2 * v131 > v130)
            v130 = 2 * v131;
          if (v131 >= 0x2AAAAAAAAAAAAAALL)
            v132 = 0x555555555555555;
          else
            v132 = v130;
          if (!v132)
          {
            v133 = 0;
LABEL_80:
            v134 = &v133[48 * v129];
            v135 = &v133[48 * v132];
            *(_QWORD *)v134 = v119;
            *((_QWORD *)v134 + 1) = v120;
            *((float *)v134 + 4) = v121;
            *((_OWORD *)v134 + 2) = xmmword_209E30F50;
            v124 = v134 + 48;
            if (v122 == v128)
            {
              v125 = v144;
            }
            else
            {
              v125 = v144;
              do
              {
                v136 = *((_OWORD *)v122 - 3);
                v137 = *((_OWORD *)v122 - 1);
                *((_OWORD *)v134 - 2) = *((_OWORD *)v122 - 2);
                *((_OWORD *)v134 - 1) = v137;
                *((_OWORD *)v134 - 3) = v136;
                v134 -= 48;
                v122 -= 48;
              }
              while (v122 != v128);
              v122 = (char *)*v127;
            }
            *(_QWORD *)(v45 + 1120) = v134;
            *(_QWORD *)(v45 + 1128) = v124;
            *(_QWORD *)(v45 + 1136) = v135;
            v91 = v126;
            if (v122)
              operator delete(v122);
            goto LABEL_87;
          }
          if (v132 <= 0x555555555555555)
          {
            v133 = (char *)operator new(48 * v132);
            v126 = v145;
            goto LABEL_80;
          }
LABEL_95:
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
LABEL_94:
        std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
      }
LABEL_96:
      __break(1u);
      return result;
    case 4:
LABEL_31:
      v68 = *(double *)(v45 + 248);
      v69 = *(double *)(v45 + 256);
      goto LABEL_33;
    case 6:
LABEL_32:
      v69 = 0.0;
      v68 = 0.0;
      goto LABEL_33;
    default:
      goto LABEL_96;
  }
}

- (void)_applyConfiguration
{
  id v2;

  if (a1)
  {
    objc_msgSend(a1, "traitCollection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    -[LAUIPearlGlyphView _applyConfigurationWithTraitCollection:]((uint64_t)a1, v2);

  }
}

- (void)_applyStateAnimated:(uint64_t)a1
{
  void *v4;
  dispatch_group_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  char v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  dispatch_group_t v20;
  char v21;
  float v22;
  float v23;
  float v24;
  __int128 *v25;
  __int128 v26;
  float v27;
  __int128 v28;
  float v29;
  float v30;
  float v31;
  char *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  int v37;
  float *v38;
  void *v39;
  uint64_t v40;
  id v41;
  float v42;
  float v43;
  float v44;
  uint64_t v45;
  int v46;
  char v47;
  int v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  BOOL v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  unsigned int v57;
  unint64_t v58;
  BOOL v59;
  unsigned int v60;
  float v61;
  double v62;
  void *v63;
  id v64;
  float v65;
  void *v66;
  double v67;
  _QWORD v68[5];
  id v69[2];
  _QWORD v70[4];
  NSObject *v71;
  _QWORD block[4];
  NSObject *v73;
  id v74[2];
  char v75;
  _QWORD v76[4];
  NSObject *v77;
  id v78;
  _QWORD *v79;
  _BYTE v80[23];
  id __p[5];
  _QWORD v82[4];
  NSObject *v83;
  _QWORD *v84;
  _QWORD v85[3];
  char v86;
  id location[6];
  char v88;
  _BYTE v89[23];
  char v90;
  float v91;
  char v92;
  char v93;
  float v94;
  char v95;
  int v96;
  BOOL v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  if (!a1 || *(_BYTE *)(a1 + 496))
    return;
  *(_BYTE *)(a1 + 728) = 1;
  *(_BYTE *)(a1 + 729) = a2;
  v4 = (void *)(*(_QWORD *)(a1 + 736) + 1);
  *(_QWORD *)(a1 + 736) = v4;
  v5 = dispatch_group_create();
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  v6 = MEMORY[0x24BDAC760];
  v86 = 1;
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke;
  v82[3] = &unk_24C27EDF8;
  v84 = v85;
  v7 = v5;
  v83 = v7;
  v8 = (void *)MEMORY[0x20BD1B708](v82);
  v10 = *(_QWORD *)(a1 + 792);
  v11 = *(_QWORD *)(a1 + 720);
  if (v11 > 8 || ((1 << v11) & 0x1EC) == 0)
  {
    if (((v10 < 9) & (0x1ECu >> v10)) == 0)
      goto LABEL_6;
LABEL_8:
    v12 = 1;
    goto LABEL_9;
  }
  if (((v10 < 9) & (0x1ECu >> v10)) == 0)
    goto LABEL_8;
LABEL_6:
  v12 = (v10 < 9) & (0x7Fu >> v10) ^ (v11 < 9) & (0x7Fu >> v11);
LABEL_9:
  if (v10 - 1 < 2)
    v13 = 1;
  else
    v13 = a2;
  LODWORD(v9) = 0;
  if (v13)
    *(float *)&v9 = 0.979;
  switch(v10)
  {
    case 0uLL:
      v27 = 0.98747;
      if (!v13)
        v27 = 0.0;
      v28 = *(_OWORD *)(a1 + 432);
      LOBYTE(location[2]) = 0;
      *(_OWORD *)((char *)__p + 7) = v28;
      LOBYTE(location[4]) = 0;
      *(_OWORD *)v89 = *(_OWORD *)__p;
      *(_QWORD *)&v89[15] = *((_QWORD *)&v28 + 1);
      v90 = 0;
      v92 = 0;
      v93 = 0;
      v97 = 0;
      *(_OWORD *)location = *(_OWORD *)(a1 + 624);
      v88 = *(_BYTE *)(a1 + 784) & 1;
      if (!v12)
        *(float *)&v9 = v27;
      v91 = *(float *)&v9;
      v94 = v27;
      v95 = 1;
      goto LABEL_62;
    case 1uLL:
      *(_OWORD *)((char *)__p + 7) = *(_OWORD *)(a1 + 432);
      *(_OWORD *)&v80[7] = *(_OWORD *)((char *)__p + 7);
      if (v13)
        v29 = 0.98747;
      else
        v29 = 0.0;
      v30 = fminf(*(float *)&v9, v29);
      if (!v12)
        v30 = v29;
      if (v13)
        v31 = v30;
      else
        v31 = 0.0;
      *(_OWORD *)((char *)location + 7) = 0uLL;
      HIBYTE(location[2]) = 0;
      v32 = (char *)operator new(0xE0uLL);
      v33 = v32;
      v34 = 0;
      v32[16] = 0;
      v32[32] = 0;
      v32[48] = 1;
      *(_OWORD *)(v32 + 49) = *(_OWORD *)__p;
      *((id *)v32 + 8) = *(id *)((char *)&__p[1] + 7);
      v32[72] = 1;
      *((_DWORD *)v32 + 20) = 0;
      v32[84] = 0;
      v32[88] = 0;
      v32[92] = 0;
      v32[96] = 0;
      *((_DWORD *)v32 + 25) = 0;
      v32[104] = 0;
      v35 = *(_OWORD *)location;
      v36 = *(_OWORD *)&location[2];
      *((id *)v32 + 17) = *(id *)((char *)&location[3] + 7);
      *(_OWORD *)(v32 + 121) = v36;
      *(_OWORD *)(v32 + 105) = v35;
      v32[144] = 0;
      v32[160] = 1;
      *(_OWORD *)(v32 + 161) = *(_OWORD *)v80;
      *((_QWORD *)v32 + 22) = *(_QWORD *)&v80[15];
      v32[184] = 2;
      *((_DWORD *)v32 + 48) = 0;
      v32[196] = 0;
      v32[200] = 0;
      v32[204] = 0;
      v32[208] = 0;
      *((_DWORD *)v32 + 53) = 0;
      v32[216] = 0;
      *(_OWORD *)v32 = *(_OWORD *)(a1 + 656);
      v37 = (*(unsigned __int8 *)(a1 + 784) >> 1) & 1;
      *((_OWORD *)v32 + 7) = *(_OWORD *)(a1 + 640);
      do
      {
        v38 = (float *)&v32[v34];
        *((_BYTE *)v38 + 48) = v37;
        v38[20] = v29;
        v38[21] = v31;
        *((_BYTE *)v38 + 88) = 1;
        v34 += 112;
        v38[25] = 0.01;
      }
      while (v34 != 224);
      v39 = v32 + 224;
      dispatch_group_enter(v7);
      v40 = *(_QWORD *)(a1 + 576);
      location[0] = v33;
      location[1] = v39;
      location[2] = v39;
      LOBYTE(location[3]) = 0;
      location[4] = 0;
      v41 = location[0];
      if (!location[0])
        goto LABEL_90;
      goto LABEL_74;
    case 2uLL:
      v42 = 0.98421;
      v43 = 0.0;
      if (!v13)
        v42 = 0.0;
      v44 = fminf(*(float *)&v9, v42);
      if (v13)
        v43 = 0.963;
      if (!v12)
        v44 = v42;
      LOBYTE(location[2]) = 0;
      v45 = *(_QWORD *)(a1 + 432);
      v46 = *(unsigned __int8 *)(a1 + 440);
      *(_DWORD *)&v89[16] = *(_DWORD *)(a1 + 441);
      *(_DWORD *)&v89[19] = *(_DWORD *)(a1 + 444);
      if (v46)
        v47 = 4;
      else
        v47 = 3;
      LOBYTE(location[4]) = 0;
      v88 = 1;
      *(_QWORD *)&v89[7] = v45;
      v89[15] = v46;
      v90 = v47;
      v92 = 0;
      v93 = 0;
      v97 = 0;
      *(_OWORD *)location = *(_OWORD *)(a1 + 640);
      v91 = v44;
      v94 = v43;
      v95 = 1;
LABEL_62:
      v48 = 1008981770;
      goto LABEL_72;
    case 3uLL:
    case 4uLL:
      v16 = *(_QWORD *)(a1 + 784);
      v17 = 4;
      if (v10 == 4)
        v17 = 1;
      v18 = v16 & v17;
      v19 = (v16 & v17) != 0;
      if (v10 == 4)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0.98148;
        v23 = 0.96767;
        if (!v12)
          v23 = 0.98148;
        if ((_DWORD)a2)
        {
          v24 = v23;
        }
        else
        {
          v22 = 0.0;
          v24 = 0.0;
        }
        v25 = (__int128 *)(a1 + 624);
      }
      else
      {
        if (v13)
          v24 = 0.979;
        else
          v24 = 0.0;
        if (v18)
          v20 = 0;
        else
          v20 = dispatch_group_create();
        v25 = (__int128 *)(a1 + 672);
        v21 = 5;
        v22 = v24;
      }
      v50 = *v25;
      v51 = *(_OWORD *)(a1 + 432);
      LOBYTE(location[2]) = 0;
      *(_OWORD *)((char *)__p + 7) = v51;
      LOBYTE(location[4]) = 0;
      *(_OWORD *)v89 = *(_OWORD *)__p;
      *(_QWORD *)&v89[15] = *((_QWORD *)&v51 + 1);
      v90 = v21;
      v92 = 0;
      v93 = 0;
      *(_OWORD *)location = v50;
      v88 = v19;
      v91 = v24;
      v94 = v22;
      v95 = 1;
      v96 = 1034147594;
      if (v18)
        v52 = *(_QWORD *)(a1 + 720) == 2;
      else
        v52 = 0;
      v97 = v52;
      v6 = MEMORY[0x24BDAC760];
      if (v20)
        v53 = v20;
      else
        v53 = v7;
      dispatch_group_enter(v53);
      v54 = *(_QWORD *)(a1 + 576);
      v76[0] = v6;
      v76[1] = 3221225472;
      v76[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_2;
      v76[3] = &unk_24C27EE20;
      v55 = v20;
      v77 = v55;
      v79 = v85;
      v78 = v8;
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v20)
      {
        objc_initWeak(__p, (id)a1);
        dispatch_group_enter(v7);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_3;
        block[3] = &unk_24C27EE70;
        objc_copyWeak(v74, __p);
        v74[1] = v4;
        v75 = a2;
        v73 = v7;
        dispatch_group_notify(v55, MEMORY[0x24BDAC9B8], block);

        objc_destroyWeak(v74);
        objc_destroyWeak(__p);
      }
      else if (*(_QWORD *)(a1 + 456))
      {
        dispatch_group_enter(v7);
        v56 = *(void **)(a1 + 456);
        v70[0] = v6;
        v70[1] = 3221225472;
        v70[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_5;
        v70[3] = &unk_24C27EE48;
        v71 = v7;
        objc_msgSend(v56, "setRevealed:animated:withCompletion:", 0, a2, v70);

      }
      goto LABEL_90;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      if (v10 - 7 >= 0xFFFFFFFFFFFFFFFELL)
        v14 = 5;
      else
        v14 = 6;
      if (v10 == 5)
        v14 = 4;
      memset(location, 0, 17);
      *(_OWORD *)((char *)__p + 7) = *(_OWORD *)(a1 + 432);
      v88 = 1;
      *(_OWORD *)v89 = *(_OWORD *)__p;
      *(id *)&v89[15] = *(id *)((char *)&__p[1] + 7);
      v90 = v14;
      v91 = 0.0;
      v92 = 0;
      v93 = 0;
      v97 = 0;
      if (v10 == 6)
      {
        v15 = (_OWORD *)(a1 + 704);
        goto LABEL_33;
      }
      if (v10 == 5)
      {
        v15 = (_OWORD *)(a1 + 640);
LABEL_33:
        *(_OWORD *)location = *v15;
        if (v11 == 4)
        {
          v26 = *(_OWORD *)(a1 + 624);
          goto LABEL_71;
        }
        goto LABEL_70;
      }
      v26 = *(_OWORD *)(a1 + 624);
      *(_OWORD *)location = v26;
      if (v10 - 7 >= 0xFFFFFFFFFFFFFFFELL && v11 != 4)
LABEL_70:
        v26 = *(_OWORD *)(a1 + 640);
LABEL_71:
      LOBYTE(location[4]) = 1;
      *(_OWORD *)&location[2] = v26;
      v88 = 0;
      v91 = *(float *)&v9;
      v94 = *(float *)&v9;
      v95 = 1;
      v48 = 1034147594;
LABEL_72:
      v96 = v48;
      dispatch_group_enter(v7);
      v49 = *(_QWORD *)(a1 + 576);
      v41 = __p[0];
      if (__p[0])
      {
        __p[1] = __p[0];
LABEL_74:
        operator delete(v41);
      }
LABEL_90:
      if (*(_QWORD *)(a1 + 792) == 3)
      {
        v57 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 456), "setRevealed:animated:", 0, a2, v9);
        v58 = *(_QWORD *)(a1 + 792);
        v59 = v58 > 8;
        v60 = (0x148u >> v58) & 1;
        if (v59)
          v57 = 0;
        else
          v57 = v60;
      }
      objc_msgSend(*(id *)(a1 + 800), "opacity", v9);
      v62 = v61;
      if ((double)v57 != v61)
      {
        objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("opacity"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setMass:", 3.0);
        objc_msgSend(v63, "setStiffness:", 1000.0);
        objc_msgSend(v63, "setDamping:", 500.0);
        objc_msgSend(v63, "setVelocity:", 0.0);
        objc_msgSend(v63, "setFillMode:", *MEMORY[0x24BDE5970]);
        objc_msgSend(v63, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
        objc_msgSend(v63, "durationForEpsilon:", 0.001);
        objc_msgSend(v63, "setDuration:");
        objc_msgSend(v63, "setAdditive:", 1);
        objc_msgSend(*(id *)(a1 + 800), "presentationLayer");
        v64 = (id)objc_claimAutoreleasedReturnValue();
        if (v64 || (v64 = *(id *)(a1 + 800)) != 0)
        {
          objc_msgSend(v64, "opacity");
          v62 = v65;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v62 - (double)v57);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setFromValue:", v66);

        objc_msgSend(v63, "setToValue:", &unk_24C2850E0);
        objc_msgSend(*(id *)(a1 + 800), "addAnimation:forKey:", v63, CFSTR("opacity"));
        *(float *)&v67 = (float)v57;
        objc_msgSend(*(id *)(a1 + 800), "setOpacity:", v67);

      }
      objc_initWeak(location, (id)a1);
      v68[0] = v6;
      v68[1] = 3221225472;
      v68[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_85;
      v68[3] = &unk_24C27EE98;
      objc_copyWeak(v69, location);
      v69[1] = v4;
      v68[4] = v85;
      dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], v68);
      -[LAUIPearlGlyphView _updateRendererPaused:](a1, 1);
      objc_destroyWeak(v69);
      objc_destroyWeak(location);

      _Block_object_dispose(v85, 8);
      break;
    default:
      goto LABEL_90;
  }
}

- (void)dealloc
{
  void *v3;
  const void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (const void *)*((_QWORD *)self + 96);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)self + 96) = 0;
  }
  -[LAUIPearlGlyphView invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)LAUIPearlGlyphView;
  -[LAUIPearlGlyphView dealloc](&v5, sel_dealloc);
}

- (void)_applyConfigurationWithTraitCollection:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  CGColor *v6;
  id v7;
  CGColor *v8;
  CGColorSpace *v9;
  CGColor *converted_color;
  CGColor *v11;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  float32x4_t v14;
  id v15;
  CGColor *v16;
  CGColorSpace *v17;
  CGColor *v18;
  CGColor *v19;
  CGColorSpace *v20;
  const CGFloat *v21;
  float32x4_t v22;
  id v24;
  CGColor *v25;
  CGColorSpace *v26;
  CGColor *v27;
  CGColor *v28;
  CGColorSpace *v29;
  const CGFloat *v30;
  float32x4_t v31;
  __int128 v32;
  uint64_t v37;
  id v39;
  CGColor *v40;
  CGColorSpace *v41;
  CGColor *v42;
  CGColor *v43;
  CGColorSpace *v44;
  const CGFloat *v45;
  float32x4_t v46;
  float32x4_t v47;
  unint64_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float32x4_t v54;
  float64x2_t v55;
  float32x4_t v56;
  float64x2_t v57;
  float32x4_t v58;
  float64x2_t v59;
  float32x4_t v60;
  id v61;

  v3 = a2;
  if (!a1 || !v3)
  {
LABEL_52:

    return;
  }
  v61 = v3;
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "setCurrentTraitCollection:", v4);
  v6 = *(CGColor **)(a1 + 768);
  if (*(_BYTE *)(a1 + 616))
  {
    v7 = objc_retainAutorelease(*(id *)(a1 + 608));
    v8 = (CGColor *)objc_msgSend(v7, "CGColor");
    converted_color = LAUI_CA_utilities::create_converted_color(v8, v6, v9);
    if (converted_color)
    {
      v11 = converted_color;
      ColorSpace = CGColorGetColorSpace(converted_color);
      if (CGColorSpaceGetNumberOfComponents(ColorSpace) != 3)
        __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
      Components = CGColorGetComponents(v11);
      v49 = *(float64x2_t *)Components;
      v53 = *(float64x2_t *)(Components + 2);
      CFRelease(v11);
      v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49), v53);
    }
    else
    {
      v14 = 0uLL;
    }
    v54 = v14;

    *(float32x4_t *)(a1 + 624) = v54;
  }
  if (*(_BYTE *)(a1 + 696))
  {
    v15 = objc_retainAutorelease(*(id *)(a1 + 688));
    v16 = (CGColor *)objc_msgSend(v15, "CGColor");
    v18 = LAUI_CA_utilities::create_converted_color(v16, v6, v17);
    if (v18)
    {
      v19 = v18;
      v20 = CGColorGetColorSpace(v18);
      if (CGColorSpaceGetNumberOfComponents(v20) != 3)
        __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
      v21 = CGColorGetComponents(v19);
      v50 = *(float64x2_t *)v21;
      v55 = *(float64x2_t *)(v21 + 2);
      CFRelease(v19);
      v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v50), v55);
    }
    else
    {
      v22 = 0uLL;
    }
    v56 = v22;

    *(float32x4_t *)(a1 + 704) = v56;
  }
  switch(*(_QWORD *)(a1 + 432))
  {
    case 0:
    case 2:
      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = (CGColor *)objc_msgSend(v24, "CGColor");
      v27 = LAUI_CA_utilities::create_converted_color(v25, v6, v26);
      if (v27)
      {
        v28 = v27;
        v29 = CGColorGetColorSpace(v27);
        if (CGColorSpaceGetNumberOfComponents(v29) != 3)
          __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
        v30 = CGColorGetComponents(v28);
        v51 = *(float64x2_t *)v30;
        v57 = *(float64x2_t *)(v30 + 2);
        CFRelease(v28);
        v31 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v51), v57);
      }
      else
      {
        v31 = 0uLL;
      }
      v58 = v31;

      *(float32x4_t *)(a1 + 640) = v58;
      if (*(_QWORD *)(a1 + 432) == 2)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v40 = (CGColor *)objc_msgSend(v39, "CGColor");
        v42 = LAUI_CA_utilities::create_converted_color(v40, v6, v41);
        if (v42)
        {
          v43 = v42;
          v44 = CGColorGetColorSpace(v42);
          if (CGColorSpaceGetNumberOfComponents(v44) != 3)
            __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
          v45 = CGColorGetComponents(v43);
          v52 = *(float64x2_t *)v45;
          v59 = *(float64x2_t *)(v45 + 2);
          CFRelease(v43);
          v46 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v52), v59);
        }
        else
        {
          v46 = 0uLL;
        }
        v60 = v46;

        *(float32x4_t *)(a1 + 672) = v60;
      }
      else
      {
        *(_OWORD *)(a1 + 672) = *(_OWORD *)(a1 + 640);
      }
      if (!*(_BYTE *)(a1 + 616))
        *(_OWORD *)(a1 + 624) = xmmword_209E30F80;
      v37 = a1 + 688;
      if (!*(_BYTE *)(a1 + 696))
      {
        _Q0 = *(_OWORD *)(a1 + 640);
        goto LABEL_47;
      }
      break;
    case 1:
      __asm { FMOV            V0.4S, #1.0 }
      *(_OWORD *)(a1 + 672) = _Q0;
      *(_OWORD *)(a1 + 640) = _Q0;
      if (!*(_BYTE *)(a1 + 616))
        *(_OWORD *)(a1 + 624) = _Q0;
      if (!*(_BYTE *)(a1 + 696))
        *(_OWORD *)(a1 + 704) = *(_OWORD *)(a1 + 640);
      break;
    case 3:
    case 6:
    case 7:
    case 8:
    case 9:
      if (*(_BYTE *)(a1 + 696))
      {
        _Q0 = *(_OWORD *)(a1 + 704);
      }
      else
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(_OWORD *)(a1 + 704) = _Q0;
      }
      *(_OWORD *)(a1 + 672) = _Q0;
      *(_OWORD *)(a1 + 640) = _Q0;
      v37 = a1 + 608;
      if (!*(_BYTE *)(a1 + 616))
LABEL_47:
        *(_OWORD *)(v37 + 16) = _Q0;
      break;
    case 4:
    case 5:
      if (!*(_BYTE *)(a1 + 616))
        *(_OWORD *)(a1 + 624) = xmmword_209E30F60;
      if (*(_BYTE *)(a1 + 696))
      {
        v32 = *(_OWORD *)(a1 + 704);
      }
      else
      {
        v32 = xmmword_209E30F70;
        *(_OWORD *)(a1 + 704) = xmmword_209E30F70;
      }
      *(_OWORD *)(a1 + 672) = v32;
      *(_OWORD *)(a1 + 640) = v32;
      break;
    default:
      break;
  }
  v47 = *(float32x4_t *)(a1 + 640);
  *(float32x4_t *)(a1 + 656) = v47;
  v48 = *(_QWORD *)(a1 + 432);
  if (v48 <= 9)
  {
    if (((1 << v48) & 0x33A) != 0)
      *(float *)(a1 + 668) = vmuls_lane_f32(0.5, v47, 3);
    -[LAUIPearlGlyphView _applyCheckmarkColor](a1);
    objc_msgSend(MEMORY[0x24BDF6F30], "setCurrentTraitCollection:", v5);

    v3 = v61;
    goto LABEL_52;
  }
  __break(1u);
}

- (void)_applyCheckmarkColor
{
  CGColorSpace *v2;
  float32x4_t v3;
  CGColorRef v4;
  CGColorRef v5;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *(CGColorSpace **)(a1 + 768);
    if (v2)
    {
      if (*(_QWORD *)(a1 + 456))
      {
        v3 = *(float32x4_t *)(a1 + 672);
        v6[0] = vcvtq_f64_f32(*(float32x2_t *)v3.f32);
        v6[1] = vcvt_hight_f64_f32(v3);
        v4 = CGColorCreate(v2, (const CGFloat *)v6);
        if (v4)
        {
          v5 = v4;
          objc_msgSend(*(id *)(a1 + 456), "setColor:animated:", v4, 0);
          CFRelease(v5);
        }
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LAUIPearlGlyphView;
  -[LAUIPearlGlyphView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[LAUIPearlGlyphView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4 || (v6 = objc_msgSend(v4, "userInterfaceStyle"), v6 != objc_msgSend(v5, "userInterfaceStyle")))
      -[LAUIPearlGlyphView _applyConfigurationWithTraitCollection:]((uint64_t)self, v5);
  }

}

- (void)didMoveToWindow
{
  void *v3;
  double updated;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LAUIPearlGlyphView;
  -[LAUIPearlGlyphView didMoveToWindow](&v8, sel_didMoveToWindow);
  -[LAUIPearlGlyphView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)self + 498) = v3 != 0;
  if (v3)
  {
    v5 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t *)*((_QWORD *)self + 71);
    if (v5)
      updated = LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(v5);
  }
  v6 = (void *)*((_QWORD *)self + 60);
  objc_msgSend(v3, "screen", updated);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachToScreen:", v7);

  -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, *((_BYTE *)self + 498));
}

- (uint64_t)_updateRendererPaused:(uint64_t)result
{
  uint64_t v2;
  int v3;
  _BOOL8 v4;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v5;

  if (result)
  {
    v2 = result;
    v3 = (a2 & 1) == 0 && !*(_BYTE *)(result + 600) && !*(_QWORD *)(result + 504)
      || *(_BYTE *)(result + 496)
      || *(_BYTE *)(result + 776) != 0;
    if (*(unsigned __int8 *)(result + 497) != v3)
    {
      *(_BYTE *)(result + 497) = v3;
      if (*(_BYTE *)(result + 497))
      {
        v4 = 1;
      }
      else
      {
        v5 = *(LAUI_uniform_cubic_b_spline_renderer::renderer_t **)(result + 568);
        if (v5)
        {
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(v5);
          v4 = *(_BYTE *)(v2 + 497) != 0;
        }
        else
        {
          v4 = 0;
        }
      }
      return objc_msgSend(*(id *)(v2 + 480), "setPaused:", v4);
    }
  }
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id WeakRetained;
  _BOOL8 v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)LAUIPearlGlyphView;
  -[LAUIPearlGlyphView layoutSubviews](&v41, sel_layoutSubviews);
  v3 = (void *)*((_QWORD *)self + 59);
  -[LAUIPearlGlyphView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*((id *)self + 59), "bounds");
  v8 = v6;
  v9 = v7;
  if (v7 >= v6)
    v10 = v6;
  else
    v10 = v7;
  v11 = *((double *)self + 56);
  v12 = fmax(v10 * 1.41421354, 75.0 / v11 + v10);
  if (v11 == 0.0)
    v13 = round(v12);
  else
    v13 = round(v11 * v12) / v11;
  *((double *)self + 64) = v13 / v10;
  v14 = *((double *)self + 56);
  v15 = v4 + (v8 - v13) * 0.5;
  if (v14 == 0.0)
  {
    v16 = round(v15);
    v17 = round(v5 + (v9 - v13) * 0.5);
  }
  else
  {
    v16 = round(v15 * v14) / v14;
    v17 = round((v5 + (v9 - v13) * 0.5) * v14) / v14;
  }
  objc_msgSend(*((id *)self + 61), "setFrame:", v16, v17, v13, v13);
  objc_msgSend(*((id *)self + 60), "setDrawableSize:", v13 * *((double *)self + 56), v13 * *((double *)self + 56));
  v18 = *((double *)self + 56);
  v19 = v13 - v10;
  v20 = v16 + (v13 - v10) * 0.5;
  if (v18 == 0.0)
  {
    v21 = round(v20);
    v22 = round(v17 + v19 * 0.5);
  }
  else
  {
    v21 = round(v20 * v18) / v18;
    v22 = round((v17 + v19 * 0.5) * v18) / v18;
  }
  objc_msgSend(*((id *)self + 100), "setFrame:", v21, v22, v10, v10);
  objc_msgSend(*((id *)self + 100), "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(*((id *)self + 70), "setFrame:");
  objc_msgSend(*((id *)self + 57), "defaultSizeForCircleWithDiameter:scale:", v28, *((double *)self + 56));
  v32 = v31;
  v34 = v33;
  v35 = *((double *)self + 56);
  v36 = v24 + (v28 - v31) * 0.5;
  if (v35 == 0.0)
  {
    v37 = round(v36);
    v38 = round(v26 + (v30 - v34) * 0.5);
  }
  else
  {
    v37 = round(v35 * v36) / v35;
    v38 = round(v35 * (v26 + (v30 - v34) * 0.5)) / v35;
  }
  objc_msgSend(*((id *)self + 57), "setFrame:", v37, v38, v32);
  WeakRetained = objc_loadWeakRetained((id *)self + 101);
  objc_msgSend(WeakRetained, "pearlGlyphView:didLayoutContentLayer:", self, *((_QWORD *)self + 100));

  if (*((double *)self + 65) != v8 || *((double *)self + 66) != v9)
  {
    *((double *)self + 65) = v8;
    *((double *)self + 66) = v9;
    if (*((_BYTE *)self + 728))
      v40 = *((_BYTE *)self + 729) != 0;
    else
      v40 = 0;
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v40);
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  if (!*((_BYTE *)self + 496))
  {
    *((_BYTE *)self + 496) = 1;
    v3 = (void *)*((_QWORD *)self + 60);
    if (v3)
    {
      objc_msgSend(v3, "invalidate");
      v4 = (void *)*((_QWORD *)self + 60);
      *((_QWORD *)self + 60) = 0;

    }
    -[LAUIPearlGlyphView purgeBuffers](self, "purgeBuffers");
    v5 = (void *)*((_QWORD *)self + 61);
    if (v5)
    {
      objc_msgSend(v5, "removeFromSuperlayer");
      v6 = (void *)*((_QWORD *)self + 61);
      *((_QWORD *)self + 61) = 0;

    }
    -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)self, 0);
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, 0);
    v7 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t *)*((_QWORD *)self + 71);
    if (!*((_BYTE *)v7 + 8))
    {
      *((_BYTE *)v7 + 8) = 1;
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::purge(v7);
    }
    std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::renderer_t>::reset[abi:ne180100]((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self + 71, 0);
    v8 = (uint64_t *)((char *)self + 576);
    v9 = *v8;
    if (!*(_BYTE *)(*v8 + 48))
    {
      *(_WORD *)(v9 + 48) = 1;
      LAUI_CA_utilities::animation_completion_handler_container::set_completion((void **)(v9 + 56), 0);
      if (*(_BYTE *)(v9 + 40))
      {
        v10 = *(void **)v9;
        if (*(_QWORD *)v9)
        {
          *(_QWORD *)(v9 + 8) = v10;
          operator delete(v10);
        }
        *(_BYTE *)(v9 + 40) = 0;
      }
    }
  }
}

- (void)_executeCompletionHandlers:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  void **v6;

  if (a1)
  {
    v2 = a1 + 744;
    v3 = *(_QWORD *)(v2 + 8);
    if (v3 != *(_QWORD *)v2)
    {
      v5[0] = *(_QWORD *)v2;
      v5[1] = v3;
      *(_QWORD *)v2 = 0;
      *(_QWORD *)(v2 + 8) = 0;
      v5[2] = *(_QWORD *)(v2 + 16);
      *(_QWORD *)(v2 + 16) = 0;
      std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::shrink_to_fit((char **)v2);
      LAUI_CA_utilities::animation_completion_handler_container::execute<std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>>((uint64_t)v5, a2);
      v6 = (void **)v5;
      std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v6);
    }
  }
}

- (void)purgeBuffers
{
  if (!*((_BYTE *)self + 496))
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::purge(*((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self
                                                            + 71));
}

- (BOOL)inApplicationContext
{
  return objc_msgSend(*((id *)self + 60), "isInApplicationContext");
}

- (void)setInApplicationContext:(BOOL)a3
{
  objc_msgSend(*((id *)self + 60), "setInApplicationContext:", a3);
}

- (int64_t)style
{
  return *((_QWORD *)self + 54);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v6;

  if (*((_QWORD *)self + 54) != a3)
  {
    *((_QWORD *)self + 54) = a3;
    -[LAUIPearlGlyphView _applyConfiguration](self);
    if (a4)
    {
      v6 = 1;
    }
    else if (*((_BYTE *)self + 728))
    {
      v6 = *((_BYTE *)self + 729) != 0;
    }
    else
    {
      v6 = 0;
    }
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v6);
  }
}

- (UIColor)idleColor
{
}

- (void)setIdleColor:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id *v8;
  _BOOL8 v9;
  id v10;
  char v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v11 = 1;
    v8 = (id *)((char *)self + 608);
    if (*((_BYTE *)self + 616) && v10 == *v8)
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    v11 = 0;
    v8 = (id *)((char *)self + 608);
    if (!*((_BYTE *)self + 616))
      goto LABEL_13;
  }
  std::__optional_storage_base<UIColor * {__strong},false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<UIColor * {__strong},false> const&>(v8, (uint64_t)&v10);
  -[LAUIPearlGlyphView _applyConfiguration](self);
  if (a4)
  {
    v9 = 1;
  }
  else if (*((_BYTE *)self + 728))
  {
    v9 = *((_BYTE *)self + 729) != 0;
  }
  else
  {
    v9 = 0;
  }
  -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v9);
  if (v11)
    goto LABEL_12;
LABEL_13:

}

- (UIColor)finishedColor
{
}

- (void)setFinishedColor:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id *v8;
  _BOOL8 v9;
  id v10;
  char v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v11 = 1;
    v8 = (id *)((char *)self + 688);
    if (*((_BYTE *)self + 696) && v10 == *v8)
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    v11 = 0;
    v8 = (id *)((char *)self + 688);
    if (!*((_BYTE *)self + 696))
      goto LABEL_13;
  }
  std::__optional_storage_base<UIColor * {__strong},false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<UIColor * {__strong},false> const&>(v8, (uint64_t)&v10);
  -[LAUIPearlGlyphView _applyConfiguration](self);
  if (a4)
  {
    v9 = 1;
  }
  else if (*((_BYTE *)self + 728))
  {
    v9 = *((_BYTE *)self + 729) != 0;
  }
  else
  {
    v9 = 0;
  }
  -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v9);
  if (v11)
    goto LABEL_12;
LABEL_13:

}

- (void)setFaceVisibility:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (*((_QWORD *)self + 98) != a3)
  {
    *((_QWORD *)self + 98) = a3;
    if (a4)
    {
      v4 = 1;
    }
    else if (*((_BYTE *)self + 728))
    {
      v4 = *((_BYTE *)self + 729) != 0;
    }
    else
    {
      v4 = 0;
    }
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v4);
  }
}

- (BOOL)hideFace
{
  return *((_QWORD *)self + 98) == 0;
}

- (void)setHideFace:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4;

  if (a3)
    v4 = 0;
  else
    v4 = 3;
  -[LAUIPearlGlyphView setFaceVisibility:animated:](self, "setFaceVisibility:animated:", v4, a4);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  -[LAUIPearlGlyphView setState:animated:withCompletion:](self, "setState:animated:withCompletion:", a3, a4, 0);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  CAAnimation *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CALayer *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t **v46;
  uint64_t *v47;
  unint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t **v51;
  uint64_t *v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t *v65;
  char *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  int64x2_t v70;
  char *v71;
  uint64_t *v72;
  char *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  int64x2_t v77;
  uint64_t *v78;
  uint64_t block;
  int64x2_t v80;
  char *v81;
  id v82;
  char v83;
  _QWORD v84[3];

  v5 = a4;
  v84[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (v5)
  {
    v5 = *((_BYTE *)self + 776) == 0;
    if (a3 == 4 && !*((_BYTE *)self + 776))
    {
      if (*((_BYTE *)self + 777))
      {
        -[LAUIPearlGlyphView bounds](self, "bounds");
        v10 = v9;
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAdditive:", 1);
        v12 = *MEMORY[0x24BDE5858];
        objc_msgSend(v11, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
        LODWORD(v13) = 1036831949;
        LODWORD(v14) = 0.25;
        LODWORD(v15) = 0.25;
        LODWORD(v16) = 1.0;
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v14, v13, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTimingFunction:", v17);

        objc_msgSend(v11, "setDuration:", 0.2);
        v18 = *MEMORY[0x24BDE5978];
        objc_msgSend(v11, "setFillMode:", *MEMORY[0x24BDE5978]);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, 0.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFromValue:", v19);
        v20 = v10 * 0.579710145;

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v20, 0.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setToValue:", v21);

        objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAdditive:", 1);
        objc_msgSend(v22, "setBeginTimeMode:", v12);
        objc_msgSend(v22, "setFillMode:", v18);
        objc_msgSend(v22, "setBeginTime:", 0.075);
        objc_msgSend(v22, "setMass:", 3.0);
        objc_msgSend(v22, "setStiffness:", 2200.0);
        objc_msgSend(v22, "setDamping:", 40.0);
        objc_msgSend(v22, "setInitialVelocity:", 0.0);
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTimingFunction:", v23);

        LODWORD(v24) = 1068708659;
        objc_msgSend(v22, "setSpeed:", v24);
        objc_msgSend(v22, "durationForEpsilon:", 0.001);
        objc_msgSend(v22, "setDuration:");
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, 0.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFromValue:", v25);

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", -v20, 0.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setToValue:", v26);

        objc_msgSend(MEMORY[0x24BDE5638], "animation");
        v27 = (CAAnimation *)objc_claimAutoreleasedReturnValue();
        -[CAAnimation setBeginTimeMode:](v27, "setBeginTimeMode:", v12);
        v84[0] = v11;
        v84[1] = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAAnimation setAnimations:](v27, "setAnimations:", v28);

        v29 = v11;
        objc_msgSend(v29, "beginTime");
        v31 = v30;
        objc_msgSend(v29, "duration");
        v33 = v32;

        v34 = v22;
        objc_msgSend(v34, "beginTime");
        v36 = v35;
        objc_msgSend(v34, "duration");
        v38 = v37;

        v39 = v31 + v33;
        if (v31 + v33 < v36 + v38)
          v39 = v36 + v38;
        -[CAAnimation setDuration:](v27, "setDuration:", v39);
        -[LAUIPearlGlyphView layer](self, "layer");
        v40 = (CALayer *)objc_claimAutoreleasedReturnValue();
        v41 = LAUILayerAddAdditiveAnimation(v40, CFSTR("position"), v27);

      }
      if (*((_BYTE *)self + 778))
        AudioServicesPlaySystemSoundWithCompletion(0x48Au, 0);
      v5 = 1;
    }
  }
  if (*((_QWORD *)self + 99) == a3)
  {
    if (v8)
    {
      if (*((_BYTE *)self + 728))
      {
        if (*((_BYTE *)self + 496))
        {
          block = MEMORY[0x24BDAC760];
          v80.i64[0] = 3321888768;
          v80.i64[1] = (uint64_t)___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
          v81 = (char *)&__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
          v42 = (void *)MEMORY[0x20BD1B708](v8);
          v82 = (id)MEMORY[0x20BD1B708]();
          v83 = 0;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
        else
        {
          v50 = objc_msgSend(v8, "copy");
          v51 = (uint64_t **)((char *)self + 744);
          v52 = v51[1];
          v53 = (unint64_t)v51[2];
          if ((unint64_t)v52 >= v53)
          {
            v60 = v52 - *v51;
            if ((unint64_t)(v60 + 1) >> 61)
              std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
            v61 = v53 - (_QWORD)*v51;
            v62 = v61 >> 2;
            if (v61 >> 2 <= (unint64_t)(v60 + 1))
              v62 = v60 + 1;
            if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v62;
            v82 = v51 + 2;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>((uint64_t)(v51 + 2), v63);
            else
              v64 = 0;
            v72 = (uint64_t *)&v64[8 * v60];
            v73 = &v64[8 * v63];
            v81 = v73;
            *v72 = v50;
            v54 = v72 + 1;
            v80.i64[1] = (uint64_t)(v72 + 1);
            v75 = *v51;
            v74 = v51[1];
            if (v74 == *v51)
            {
              v77 = vdupq_n_s64((unint64_t)v74);
            }
            else
            {
              do
              {
                v76 = *--v74;
                *v74 = 0;
                *--v72 = v76;
              }
              while (v74 != v75);
              v77 = *(int64x2_t *)v51;
              v54 = (uint64_t *)v80.i64[1];
              v73 = v81;
            }
            *v51 = v72;
            v51[1] = v54;
            v80 = v77;
            v78 = v51[2];
            v51[2] = (uint64_t *)v73;
            v81 = (char *)v78;
            block = v77.i64[0];
            std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&block);
          }
          else
          {
            *v52 = v50;
            v54 = v52 + 1;
          }
          v51[1] = v54;
        }
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v80.i64[0] = 3321888768;
        v80.i64[1] = (uint64_t)___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
        v81 = (char *)&__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
        v44 = (void *)MEMORY[0x20BD1B708](v8);
        v82 = (id)MEMORY[0x20BD1B708]();
        v83 = 1;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }
  }
  else
  {
    -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)self, 0);
    if (v8)
    {
      if (*((_BYTE *)self + 496))
      {
        block = MEMORY[0x24BDAC760];
        v80.i64[0] = 3321888768;
        v80.i64[1] = (uint64_t)___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
        v81 = (char *)&__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
        v43 = (void *)MEMORY[0x20BD1B708](v8);
        v82 = (id)MEMORY[0x20BD1B708]();
        v83 = 0;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
      else
      {
        v45 = objc_msgSend(v8, "copy");
        v46 = (uint64_t **)((char *)self + 744);
        v47 = (uint64_t *)*((_QWORD *)self + 94);
        v48 = *((_QWORD *)self + 95);
        if ((unint64_t)v47 >= v48)
        {
          v55 = v47 - *v46;
          if ((unint64_t)(v55 + 1) >> 61)
            std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
          v56 = v48 - (_QWORD)*v46;
          v57 = v56 >> 2;
          if (v56 >> 2 <= (unint64_t)(v55 + 1))
            v57 = v55 + 1;
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8)
            v58 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v58 = v57;
          v82 = (char *)self + 760;
          if (v58)
            v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>((uint64_t)self + 760, v58);
          else
            v59 = 0;
          v65 = (uint64_t *)&v59[8 * v55];
          v66 = &v59[8 * v58];
          v81 = v66;
          *v65 = v45;
          v49 = v65 + 1;
          v80.i64[1] = (uint64_t)(v65 + 1);
          v68 = *v46;
          v67 = (uint64_t *)*((_QWORD *)self + 94);
          if (v67 == *v46)
          {
            v70 = vdupq_n_s64((unint64_t)v67);
          }
          else
          {
            do
            {
              v69 = *--v67;
              *v67 = 0;
              *--v65 = v69;
            }
            while (v67 != v68);
            v70 = *(int64x2_t *)v46;
            v49 = (_QWORD *)v80.i64[1];
            v66 = v81;
          }
          *v46 = v65;
          *((_QWORD *)self + 94) = v49;
          v80 = v70;
          v71 = (char *)*((_QWORD *)self + 95);
          *((_QWORD *)self + 95) = v66;
          v81 = v71;
          block = v70.i64[0];
          std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&block);
        }
        else
        {
          *v47 = v45;
          v49 = v47 + 1;
        }
        *((_QWORD *)self + 94) = v49;
      }
    }
    *((_QWORD *)self + 90) = *((_QWORD *)self + 99);
    *((_QWORD *)self + 99) = a3;
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v5);
    *((_QWORD *)self + 90) = *((_QWORD *)self + 99);
  }

}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_2(_QWORD *a1, char a2)
{
  NSObject *v2;

  v2 = a1[4];
  if (v2)
  {
    if ((a2 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      v2 = a1[4];
    }
    dispatch_group_leave(v2);
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[92] == *(_QWORD *)(a1 + 48) && (v4 = (void *)WeakRetained[57]) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      if (*((_BYTE *)WeakRetained + 778))
      {
        +[LAUIPearlGlyphView invokeSuccessFeedback](LAUIPearlGlyphView, "invokeSuccessFeedback");
        v4 = (void *)v3[57];
        v5 = *(_BYTE *)(a1 + 56) != 0;
      }
      else
      {
        v5 = 1;
      }
    }
    else
    {
      v5 = 0;
    }
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_4;
    v6[3] = &unk_24C27EE48;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "setRevealed:animated:withCompletion:", 1, v5, v6);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_85(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *((_QWORD *)WeakRetained + 92) == *(_QWORD *)(a1 + 48))
  {
    WeakRetained[728] = 0;
    v3 = WeakRetained;
    -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)WeakRetained, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    WeakRetained = v3;
  }

}

- (void)setPaused:(BOOL)a3
{
  if (*((_BYTE *)self + 776) != a3)
  {
    *((_BYTE *)self + 776) = a3;
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, !a3);
    if (*((_BYTE *)self + 776))
      -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)self, 0);
  }
}

- (void)setDelegate:(id)a3
{
  id *v4;
  id v5;

  v4 = (id *)((char *)self + 808);
  v5 = a3;
  objc_storeWeak(v4, v5);
  LOBYTE(v4) = objc_opt_respondsToSelector();

  *((_BYTE *)self + 464) = v4 & 1;
}

- (BOOL)isWireframeEnabled
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 568);
    return v1 && *(unsigned __int8 *)(v1 + 128) != 0;
  }
  return result;
}

- (uint64_t)setWireframeEnabled:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = *(_QWORD *)(result + 568);
    if (v2)
      *(_BYTE *)(v2 + 128) = a2;
    return -[LAUIPearlGlyphView _updateRendererPaused:](result, 1);
  }
  return result;
}

- (double)modelTransform
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a1)
  {
    v2 = *(_OWORD **)(a1 + 568);
    if (v2)
    {
      v3 = v2[14];
      a2[4] = v2[13];
      a2[5] = v3;
      v4 = v2[16];
      a2[6] = v2[15];
      a2[7] = v4;
      v5 = v2[10];
      *a2 = v2[9];
      a2[1] = v5;
      v6 = v2[11];
      v7 = v2[12];
    }
    else
    {
      v8 = (_OWORD *)MEMORY[0x24BDAEDE8];
      v9 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 80);
      a2[4] = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 64);
      a2[5] = v9;
      v10 = v8[7];
      a2[6] = v8[6];
      a2[7] = v10;
      v11 = v8[1];
      *a2 = *v8;
      a2[1] = v11;
      v6 = v8[2];
      v7 = v8[3];
    }
    a2[2] = v6;
    a2[3] = v7;
  }
  else
  {
    *(_QWORD *)&v6 = 0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v6;
}

- (uint64_t)setModelTransform:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 568);
    if (v3)
      memmove((void *)(v3 + 144), a2, 0x80uLL);
    return -[LAUIPearlGlyphView _updateRendererPaused:](v2, 1);
  }
  return result;
}

- (uint64_t)beginExternalAnimation
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 504);
    *(_QWORD *)(result + 504) = v1 + 1;
    if (!v1)
      return -[LAUIPearlGlyphView _updateRendererPaused:](result, 0);
  }
  return result;
}

- (uint64_t)endExternalAnimation
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 504) - 1;
    *(_QWORD *)(result + 504) = v1;
    if (!v1)
      return -[LAUIPearlGlyphView _updateRendererPaused:](result, 0);
  }
  return result;
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  uint64_t v4;
  _OWORD *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD var10[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)self + 496))
  {
    v4 = 0;
    *((_QWORD *)self + 67) = *(_QWORD *)&a4.width;
    *((_QWORD *)self + 68) = *(_QWORD *)&a4.height;
    *((_BYTE *)self + 552) = 1;
    v5 = (_OWORD *)*((_QWORD *)self + 71);
    v6.f64[1] = 0.0;
    v6.f64[0] = 1.41421354 / *((double *)self + 64);
    v7.f64[0] = 0.0;
    v7.f64[1] = v6.f64[0];
    var10[0] = COERCE_UNSIGNED_INT64(2.00000444 / (a4.width / a4.height));
    var10[1] = 0u;
    do
    {
      v9 = (float64x2_t)var10[v4];
      v8 = (float64x2_t)var10[v4 + 1];
      v10 = (float64x2_t *)((char *)&v19 + v4 * 16);
      *v10 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v6, v9.f64[0]), v7, v9, 1), (float64x2_t)0, v8.f64[0]), (float64x2_t)0, v8, 1);
      v10[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v9.f64[0]), (float64x2_t)0, v9, 1), (float64x2_t)xmmword_209E30F20, v8.f64[0]), (float64x2_t)xmmword_209E30F30, v8, 1);
      v4 += 2;
    }
    while (v4 != 8);
    v11 = v24;
    v31 = v23;
    v32 = v24;
    v12 = v25;
    v13 = v26;
    v33 = v25;
    v34 = v26;
    v14 = v19;
    v15 = v20;
    v27 = v19;
    v28 = v20;
    v16 = v21;
    v17 = v22;
    v29 = v21;
    v30 = v22;
    v5[29] = v23;
    v5[30] = v11;
    v5[31] = v12;
    v5[32] = v13;
    v5[25] = v14;
    v5[26] = v15;
    v5[27] = v16;
    v5[28] = v17;
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, 1);
  }
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  float64x2_t *v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  double v44;
  double v45;
  double v46;
  CGPathRef v47;
  id WeakRetained;
  double updated;
  uint64_t v50;
  unint64_t v51;
  float v52;
  unsigned __int16 v53;
  char v54;
  unsigned int v55;
  unsigned __int16 v56;
  unsigned __int16 v57;
  unsigned __int16 v58;
  unsigned __int16 v59;
  unsigned __int16 v60;
  unsigned __int16 v61;
  unsigned __int16 v62;
  _BOOL4 v63;
  int v64;
  int v73;
  uint64_t v74;
  uint64_t v75;
  unsigned __int16 v76;
  uint64_t v77;
  uint64_t v78;
  unsigned __int16 v79;
  uint64_t v80;
  uint64_t v81;
  int v83;
  int v84;
  char v85;
  float v86;
  float v87;
  __int16 v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  __int32 v94;
  float v95;
  unsigned __int16 v96;
  char v97;
  unsigned int v98;
  unsigned __int16 v99;
  _BOOL4 v100;
  unsigned __int16 v103;
  char v104;
  unsigned int v105;
  unsigned __int16 v106;
  _BOOL4 v108;
  _BOOL4 v109;
  int v110;
  int v111;
  char v112;
  int v113;
  void *v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  id v126;
  float64x2_t v127;
  uint64_t v128;
  float64x2_t vars0;
  __int128 vars0a;
  double v131;
  float64x2_t v132;
  double v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float32x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  __int128 v146;
  float64x2_t v147;
  float64x2_t v148;
  _BYTE v149[32];
  uint64_t v150;
  uint64_t v151;

  v151 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (*((_BYTE *)self + 496))
  {
LABEL_139:

    return;
  }
  if (*((_BYTE *)self + 552))
  {
    v6 = 0;
    *((_BYTE *)self + 552) = 0;
    v7 = *((_QWORD *)self + 72);
    v133 = *(float *)(v7 + 160);
    v131 = *(float *)(v7 + 240) * 0.5;
    v8 = (float64x2_t *)*((_QWORD *)self + 71);
    v10 = v8[25];
    v9 = v8[26];
    v12 = v8[27];
    v11 = v8[28];
    v14 = v8[29];
    v13 = v8[30];
    v16 = v8[31];
    v15 = v8[32];
    v17 = v8[22];
    v138 = v8[21];
    v139 = v17;
    v18 = v8[24];
    v140 = v8[23];
    v141 = v18;
    v19 = v8[18];
    v134 = v8[17];
    v135 = v19;
    v20 = v8[20];
    v136 = v8[19];
    v137 = v20;
    do
    {
      v22 = *(float64x2_t *)((char *)&v134 + v6);
      v21 = *(float64x2_t *)((char *)&v134 + v6 + 16);
      v23 = (float64x2_t *)((char *)&v143 + v6);
      *v23 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v22.f64[0]), v12, v22, 1), v14, v21.f64[0]), v16, v21, 1);
      v23[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v22.f64[0]), v11, v22, 1), v13, v21.f64[0]), v15, v21, 1);
      v6 += 32;
    }
    while (v6 != 128);
    v120 = v144;
    v121 = v145;
    v122 = v143;
    v123 = v148;
    v124 = (float64x2_t)v146;
    v127 = v147;
    vars0 = *(float64x2_t *)&v149[16];
    v125 = *(float64x2_t *)v149;
    v24 = *((double *)self + 68);
    v25 = *((double *)self + 56);
    objc_msgSend(*((id *)self + 100), "bounds");
    v27 = v26;
    v29 = v28;
    objc_msgSend(*((id *)self + 70), "lineWidth");
    v30.f64[0] = 0.0;
    v30.f64[1] = v133;
    v31.f64[0] = 0.0;
    v31.f64[1] = v131;
    v32 = vaddq_f64(v30, v31);
    v33 = vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v120, v32.f64[0]), v124, v32, 1), (float64x2_t)0, v123);
    v34 = vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v122, v32.f64[0]), v121, v32, 1), (float64x2_t)0, v127);
    __asm { FMOV            V4.2D, #1.0 }
    v39 = vmlaq_f64(v34, _Q4, v125);
    v40 = vmlaq_f64(v33, _Q4, vars0);
    v41 = vsubq_f64(v30, v31);
    v42 = vmlaq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v122, v41.f64[0]), v121, v41, 1), (float64x2_t)0, v127), _Q4, v125);
    v43 = vmlaq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v120, v41.f64[0]), v124, v41, 1), (float64x2_t)0, v123), _Q4, vars0);
    v45 = floor(v24* 0.5* vabdd_f64(vmuld_lane_f64(1.0 / sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v39, v39), vmulq_f64(v40, v40)))), v39, 1), vmuld_lane_f64(1.0 / sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v42, v42), vmulq_f64(v43, v43)))), v42, 1)))/ v25+ v44 * 0.5;
    v41.f64[0] = v27 + v45 * -2.0;
    v43.f64[0] = v29 + v45 * -2.0;
    v46 = v45;
    v47 = CGPathCreateWithEllipseInRect(*(CGRect *)(&v41 - 1), 0);
    if (v47)
    {
      objc_msgSend(*((id *)self + 70), "setPath:", v47);
      CFRelease(v47);
    }
  }
  if (*((_BYTE *)self + 464))
  {
    WeakRetained = objc_loadWeakRetained((id *)self + 101);
    objc_msgSend(WeakRetained, "pearlGlyphViewWillRender:", self);

  }
  updated = LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(*((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self
                                                                                      + 71));
  v50 = *((_QWORD *)self + 72);
  v51 = 0x2545B4000;
  if (!*(_BYTE *)(v50 + 49))
    goto LABEL_136;
  if (*(_BYTE *)(v50 + 48))
  {
LABEL_135:
    *((_BYTE *)self + *(int *)(v51 + 1088)) = 1;
    goto LABEL_136;
  }
  v126 = v5;
  v52 = updated * 1000.0;
  v53 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 272, v52);
  v54 = v53;
  v55 = v53;
  v56 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 328, v52);
  v57 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 384, v52);
  v58 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(v50 + 440, v52);
  v59 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(v50 + 496, v52);
  v128 = v50;
  v60 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 640, v52);
  v61 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v128 + 696, v52);
  v62 = LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v128 + 752, v52);
  v63 = v62 != 0;
  if (!(_BYTE)v61)
    v63 = 0;
  if (!(_BYTE)v60)
    v63 = 0;
  if (!(_BYTE)v59)
    v63 = 0;
  if (!(_BYTE)v58)
    v63 = 0;
  if (!(_BYTE)v57)
    v63 = 0;
  if (!(_BYTE)v56)
    v63 = 0;
  if (v54)
    v64 = v63;
  else
    v64 = 0;
  v73 = *(float *)(v128 + 364) <= 0.0
     && v62 > 0xFFu
     && v61 > 0xFFu
     && v60 > 0xFFu
     && v59 > 0xFFu
     && v58 > 0xFFu
     && v57 > 0xFFu
     && v56 > 0xFFu
     && v55 > 0xFF;
  v74 = *(_QWORD *)(v128 + 848);
  v75 = *(_QWORD *)(v128 + 856);
  while (v74 != v75)
  {
    v76 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v74 + 112, v52);
    v64 = (v76 != 0) & v64;
    v73 = (v76 > 0xFFu) & v73;
    v77 = *(_QWORD *)(v74 + 208);
    v78 = *(_QWORD *)(v74 + 216);
    while (v77 != v78)
    {
      v79 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v77, v52);
      v64 = (v79 != 0) & v64;
      v73 = (v79 > 0xFFu) & v73;
      v77 += 96;
    }
    v74 += 240;
  }
  v80 = *(_QWORD *)(v128 + 872);
  v81 = *(_QWORD *)(v128 + 880);
  if (v80 == v81)
  {
LABEL_104:
    v103 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v128 + 912, v52);
    v104 = v103;
    v105 = v103;
    v106 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(v128 + 1008, v52);
    v108 = v106 > 0xFFu && v105 > 0xFF;
    v109 = v106 != 0;
    if (!v104)
      v109 = 0;
    v110 = v109 & v64;
    if ((v108 & v73) != 0)
      v111 = 256;
    else
      v111 = 0;
    v112 = v108 & v73 ^ 1;
    v113 = v111 | v110;
    v5 = v126;
    if (!v113)
    {
      v118 = *(_QWORD *)(v128 + 872);
      v119 = *(_QWORD *)(v128 + 880);
      if (v118 == v119)
        goto LABEL_134;
      while (!*(_QWORD *)(v118 + 16))
      {
        v118 += 288;
        if (v118 == v119)
          goto LABEL_117;
      }
    }
    LAUI_CA_utilities::animation_completion_handler_container::operator()((void **)(v128 + 56), 1);
LABEL_117:
    if (v113 && *(_BYTE *)(v128 + 40))
    {
      v114 = *(void **)v128;
      v115 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(v128 + 8) - *(_QWORD *)v128) >> 4);
      if (v115 < 2)
      {
        if (v114)
        {
          *(_QWORD *)(v128 + 8) = v114;
          operator delete(v114);
        }
        *(_BYTE *)(v128 + 40) = 0;
      }
      else
      {
        v116 = *(_QWORD *)(v128 + 32);
        if (*(_BYTE *)(v128 + 24))
        {
          if (v116)
          {
            v117 = v116 - 1;
          }
          else
          {
            *(_BYTE *)(v128 + 24) = 0;
            v117 = 1;
          }
        }
        else
        {
          v117 = v116 + 1;
          if (v117 >= v115)
          {
            *(_BYTE *)(v128 + 24) = 1;
            v117 = v115 - 2;
          }
        }
        *(_QWORD *)(v128 + 32) = v117;
      }
    }
LABEL_134:
    *(_BYTE *)(v128 + 49) = (*(_BYTE *)(v128 + 40) != 0) | v112 & 1;
    v51 = 0x2545B4000uLL;
    if (*(_BYTE *)(*((_QWORD *)self + 72) + 49))
      goto LABEL_135;
LABEL_136:
    if ((LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(*((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self
                                                                   + 71)) & 1) == 0)
      *((_BYTE *)self + *(int *)(v51 + 1088)) = 1;
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, 0);
    goto LABEL_139;
  }
  __asm { FMOV            V0.4S, #1.0 }
  v132 = _Q0;
  vars0a = xmmword_209E30F30;
  while (1)
  {
    v83 = v73 & 1;
    v84 = v64 & 1;
    if (*(_QWORD *)(v80 + 16))
      break;
LABEL_89:
    v96 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v80 + 96, v52);
    v97 = v96;
    v98 = v96;
    v99 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(v80 + 192, v52);
    v100 = v99 != 0;
    if (!v97)
      v100 = 0;
    if (v84)
      v64 = v100;
    else
      v64 = 0;
    v73 = v99 > 0xFFu && v98 > 0xFF && v83 != 0;
    v80 += 288;
    if (v80 == v81)
      goto LABEL_104;
  }
  *(float *)(v80 + 24) = *(float *)(v80 + 24) + v52;
  LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(v80 + 32, v52);
  v143 = 0u;
  v145 = 0u;
  v146 = xmmword_209E30C90;
  v147 = v132;
  *(_DWORD *)v149 = 1065353216;
  *(_OWORD *)&v149[8] = xmmword_209E30F30;
  *(_DWORD *)&v149[24] = 0;
  v150 = 0;
  v144 = *(float64x2_t *)(v80 + 96);
  v148 = *(float64x2_t *)(v80 + 192);
  v85 = (*(uint64_t (**)(float64x2_t *, uint64_t, float))(v80 + 16))(&v143, v80 + 24, v52);
  if (*(_QWORD *)(v80 + 16))
  {
    v86 = *(float *)(v80 + 28);
    v87 = *(float *)(v80 + 68);
    v88 = *(_WORD *)(v80 + 8);
    if ((v88 & 2) != 0)
    {
      if ((*(_WORD *)(v80 + 10) & 2) != 0)
        v89 = *(float *)(v80 + 68);
      else
        v89 = *(float *)(v80 + 28);
      v90 = nexttowardf(1.0, 0.0);
      v134 = v144;
      LODWORD(v135.f64[0]) = fmaxf(fminf(v89, v90), 0.0);
      if (*(float *)v135.f64 <= 0.0)
        v91 = 0.0;
      else
        v91 = INFINITY;
      BYTE4(v135.f64[0]) = 0;
      BYTE4(v135.f64[1]) = 0;
      *(float *)v136.f64 = v91;
      *(_QWORD *)((char *)v136.f64 + 4) = LODWORD(v91);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v80 + 96, (uint64_t)&v134, 6);
      if (!*(_QWORD *)(v80 + 16))
        goto LABEL_79;
      v88 = *(_WORD *)(v80 + 8);
    }
    if ((v88 & 0x20) != 0)
    {
      if ((*(_WORD *)(v80 + 10) & 0x20) != 0)
        v86 = v87;
      v92 = nexttowardf(1.0, 0.0);
      v134 = v148;
      LODWORD(v135.f64[0]) = fmaxf(fminf(v86, v92), 0.0);
      if (*(float *)v135.f64 <= 0.0)
        v93 = 0.0;
      else
        v93 = INFINITY;
      BYTE4(v135.f64[0]) = 0;
      BYTE4(v135.f64[1]) = 0;
      *(float *)v136.f64 = v93;
      *(_QWORD *)((char *)v136.f64 + 4) = LODWORD(v93);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v80 + 192, (uint64_t)&v134, 6);
    }
  }
LABEL_79:
  if ((v85 & 1) == 0)
  {
    v84 = 0;
    v83 = 0;
    goto LABEL_89;
  }
  *(_DWORD *)(v80 + 8) = 0;
  *(_QWORD *)(v80 + 16) = 0;
  v94 = *(__int32 *)(v80 + 88);
  v142.i32[0] = 953267991;
  if (*(float *)&v94 <= 0.0)
  {
    v142.i32[1] = 981668463;
LABEL_86:
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::resolve_infinite_duration(v80 + 96, &v142);
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS_18animation_timing_t23epsilon_configuration_tE(v80 + 192, &v142);
    *(_QWORD *)(v80 + 24) = 0;
    *(_DWORD *)(v80 + 88) = 0;
    LODWORD(v134.f64[0]) = 0;
    HIDWORD(v134.f64[0]) = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    LOBYTE(v134.f64[1]) = 0;
    LOBYTE(v135.f64[0]) = 0;
    HIDWORD(v135.f64[1]) = 0;
    v95 = INFINITY;
    if (*((float *)v134.f64 + 1) <= 0.0)
      v95 = 0.0;
    *((float *)v135.f64 + 1) = v95;
    *(float *)&v135.f64[1] = v95;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v80 + 32, (uint64_t)&v134, 6);
    goto LABEL_89;
  }
  v142.i32[1] = v94;
  if (*(float *)&v94 < 1.0)
  {
    if (*(float *)&v94 < 0.0001)
      v142.i32[0] = v94;
    goto LABEL_86;
  }
  __break(1u);
}

- (void)_updateReduceBlurState
{
  _BYTE *v2;
  _BOOL4 IsReduceMotionEnabled;
  _BOOL8 v4;

  if (a1)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      v2 = a1 + 440;
      if (a1[440])
        return;
      LOBYTE(IsReduceMotionEnabled) = 1;
    }
    else
    {
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      v2 = a1 + 440;
      if (IsReduceMotionEnabled == (a1[440] != 0))
        return;
    }
    *v2 = IsReduceMotionEnabled;
    -[LAUIPearlGlyphView _applyConfiguration](a1);
    if (a1[728])
      v4 = a1[729] != 0;
    else
      v4 = 0;
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)a1, v4);
  }
}

- (unint64_t)faceVisibility
{
  return *((_QWORD *)self + 98);
}

- (int64_t)state
{
  return *((_QWORD *)self + 99);
}

- (BOOL)isPaused
{
  return *((_BYTE *)self + 776);
}

- (BOOL)shakeEnabled
{
  return *((_BYTE *)self + 777);
}

- (void)setShakeEnabled:(BOOL)a3
{
  *((_BYTE *)self + 777) = a3;
}

- (BOOL)feedbackEnabled
{
  return *((_BYTE *)self + 778);
}

- (void)setFeedbackEnabled:(BOOL)a3
{
  *((_BYTE *)self + 778) = a3;
}

- (CALayer)contentLayer
{
  return (CALayer *)*((_QWORD *)self + 100);
}

- (LAUIPearlGlyphViewDelegate)delegate
{
  return (LAUIPearlGlyphViewDelegate *)objc_loadWeakRetained((id *)self + 101);
}

- (void).cxx_destruct
{
  void **v3;

  objc_destroyWeak((id *)self + 101);
  objc_storeStrong((id *)self + 100, 0);
  v3 = (void **)((char *)self + 744);
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v3);
  if (*((_BYTE *)self + 696))

  if (*((_BYTE *)self + 616))
  std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::renderer_t>::reset[abi:ne180100]((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self + 71, 0);
  objc_storeStrong((id *)self + 70, 0);
  objc_storeStrong((id *)self + 61, 0);
  objc_storeStrong((id *)self + 60, 0);
  objc_storeStrong((id *)self + 59, 0);
  objc_storeStrong((id *)self + 57, 0);
  objc_storeStrong((id *)self + 53, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 71) = 0;
  *((_QWORD *)self + 72) = 0;
  *((_BYTE *)self + 608) = 0;
  *((_BYTE *)self + 616) = 0;
  *((_BYTE *)self + 688) = 0;
  *((_BYTE *)self + 696) = 0;
  *((_QWORD *)self + 94) = 0;
  *((_QWORD *)self + 95) = 0;
  *((_QWORD *)self + 93) = 0;
  return self;
}

@end
