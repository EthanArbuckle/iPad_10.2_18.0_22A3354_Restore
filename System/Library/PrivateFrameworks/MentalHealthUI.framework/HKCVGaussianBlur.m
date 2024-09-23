@implementation HKCVGaussianBlur

- (HKCVGaussianBlur)initWithSigma:(float)a3 clipRect:(id *)a4 kernelCache:(id)a5 archive:(id)a6 library:(id)a7
{
  char *v12;
  HKCVGaussianBlur *v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HKCVGaussianBlur;
  v12 = -[HKCVGaussianBlur init](&v17, sel_init);
  v13 = (HKCVGaussianBlur *)v12;
  if (v12)
  {
    *((float *)v12 + 140) = a3;
    v14 = *(_OWORD *)&a4->var0.var0;
    v15 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)(v12 + 616) = *(_OWORD *)&a4->var0.var2;
    *(_OWORD *)(v12 + 632) = v15;
    *(_OWORD *)(v12 + 600) = v14;
    *((_QWORD *)v12 + 71) = a5;
    v13->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13->_library = (MTLLibrary *)a7;
    v13->_archive = (MTLBinaryArchive *)a6;
    initFilterInfo((uint64_t)&v13->_planInfo, v13->_sigma);
    -[HKCVGaussianBlur prepareRAndPlanStepsROIs](v13, "prepareRAndPlanStepsROIs");
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKCVGaussianBlur;
  -[HKCVGaussianBlur dealloc](&v3, sel_dealloc);
}

- (id)cachedTextureForDevice:(id)a3 pixelInfo:(WMPSPixelInfo)a4 identifier:(unint64_t)a5 textureSize:(id *)a6 protectionOptions:(unint64_t)a7
{
  void *IntermediateTexture;
  HKCVGaussianBlurKey *v12;
  HKCVGaussianBlurKey *v13;
  void *v14;
  id v15;
  __int128 v17;
  unint64_t var2;
  WMPSPixelInfo v19;

  v19 = a4;
  if (a7)
    return (id)WMPSConvolutionGetIntermediateTexture(a3, &v19, a6, a7);
  v12 = [HKCVGaussianBlurKey alloc];
  v17 = *(_OWORD *)&a6->var0;
  var2 = a6->var2;
  v13 = -[HKCVGaussianBlurKey initWithIdentifier:textureSize:](v12, "initWithIdentifier:textureSize:", a5, &v17);
  v14 = (void *)-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v13);
  if (v14)
  {
    IntermediateTexture = v14;
    v15 = v14;
  }
  else
  {
    IntermediateTexture = (void *)WMPSConvolutionGetIntermediateTexture(a3, &v19, a6, 0);
    -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", IntermediateTexture, v13);
  }

  return IntermediateTexture;
}

- (void)prepareRAndPlanStepsROIs
{
  float32x4_t v2;
  float32x2_t *anon_210;
  unint64_t numSteps;
  float scale;
  uint64_t v7;
  uint64_t v8;
  int *planSteps;
  _OWORD *v10;
  int *v11;
  int v12;
  signed int v13;
  uint64_t GaussianBlurKernelBorderScaleData;
  float v15;
  unint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  __int128 v23;
  uint64_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  unsigned int v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  __int128 v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  unint64_t v42;
  float32x4_t v43;
  float32x4_t v44;
  unint64_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  __int128 v52;
  unsigned int v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  _OWORD *v59;
  __int128 v60;
  float32x2_t v61;
  unsigned __int8 *anon_10;
  unint64_t v63;
  unsigned int v64;
  int v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  float32x4_t *v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  __n128 v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  unsigned __int8 *v80;
  __int128 v81;
  unsigned __int8 *v82;
  __int128 v83;
  uint64_t v84;
  float32x2_t v85;
  __int32 v86;
  float32x2_t v87;
  __int32 v88;
  float v89;
  float32x4_t *v90;
  float32x4_t v91;
  __n128 v92;
  __n128 v93;
  float v94;
  float32x4_t v95;
  __n128 v96;
  __int32 v97;
  float32x2_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  unsigned __int8 *v107;
  __int128 v108;
  __n128 v109;
  __int32 v110;
  float32x2_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  unsigned __int8 *v120;
  __int128 v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  int v131;
  float32x4_t v132;
  __int32 v133;
  __int32 v134;
  __int32 v135;
  __int32 v136;
  __int32 v137;
  __int32 v138;
  __int32 v139;
  __int32 v140;
  __int32 v141;
  float32x4_t v142;
  __int32 v143;
  float32x4_t v144;
  _BYTE v145[512];
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  anon_210 = (float32x2_t *)self->_anon_210;
  numSteps = self->_planInfo._numSteps;
  scale = self->_planInfo._scale;
  *(float32x2_t *)v2.f32 = vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_clipRect.size.width));
  v132 = v2;
  *(_OWORD *)self->_anon_210 = xmmword_2418AB3B0;
  *(float32x4_t *)&self->_anon_210[16] = v2;
  if (numSteps)
  {
    v7 = 0;
    v8 = 0;
    planSteps = self->_planInfo._planSteps;
    v10 = v145;
    v11 = self->_planInfo._planSteps;
    v131 = numSteps;
    do
    {
      v13 = *v11++;
      v12 = v13;
      GaussianBlurKernelBorderScaleData = getGaussianBlurKernelBorderScaleData(v13);
      if (v13 < 24)
      {
        v25 = *(float32x4_t *)anon_210->f32;
        v26 = *(float32x4_t *)anon_210[2].f32;
        if (v12 < 16)
        {
          LODWORD(v42) = 0;
          *((float *)&v42 + 1) = 1.0 / *((float *)&GaussianBlurKernelBorderScaleData + 1);
          v43 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), v25.f32[0]), (float32x4_t)v42, *(float32x2_t *)v25.f32, 1), (float32x4_t)xmmword_2418AB3B0, v25, 2);
          v44 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), v26.f32[0]), (float32x4_t)v42, *(float32x2_t *)v26.f32, 1), (float32x4_t)xmmword_2418AB3B0, v26, 2);
          LODWORD(v45) = 0;
          *((float *)&v45 + 1) = (float)-(int)GaussianBlurKernelBorderScaleData;
          v46 = vaddq_f32((float32x4_t)v45, v43);
          v47.i64[0] = 0xC0000000C0000000;
          v47.i64[1] = 0xC0000000C0000000;
          v48 = vmlaq_f32(v44, v47, (float32x4_t)v45);
          v46.i32[3] = v136;
          v48.i32[3] = v134;
          v49 = vaddq_f32(v46, v48);
          v46.i32[3] = 0;
          v50 = vrndmq_f32(v46);
          v49.i32[3] = 0;
          v51 = vsubq_f32(vrndpq_f32(v49), v50);
          anon_210[1].i32[0] = v50.i32[2];
          *anon_210 = *(float32x2_t *)v50.f32;
          anon_210[3].i32[0] = v51.i32[2];
          anon_210[2] = *(float32x2_t *)v51.f32;
          v52 = *(_OWORD *)anon_210[2].f32;
          *v10 = *(_OWORD *)anon_210->f32;
          v10[1] = v52;
          *(float *)&v53 = (float)-(int)GaussianBlurKernelBorderScaleData;
          v54 = vaddq_f32((float32x4_t)v53, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0 / *((float *)&GaussianBlurKernelBorderScaleData + 1)), COERCE_FLOAT(*(_OWORD *)anon_210->f32)), (float32x4_t)xmmword_2418AB3A0, *anon_210, 1), (float32x4_t)xmmword_2418AB3B0, *(float32x4_t *)anon_210->f32, 2));
          v55 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0 / *((float *)&GaussianBlurKernelBorderScaleData + 1)), COERCE_FLOAT(*(_OWORD *)anon_210[2].f32)), (float32x4_t)xmmword_2418AB3A0, anon_210[2], 1), (float32x4_t)xmmword_2418AB3B0, *(float32x4_t *)anon_210[2].f32, 2), v47, (float32x4_t)v53);
          v54.i32[3] = v138;
          v55.i32[3] = v137;
          v56 = vaddq_f32(v54, v55);
          v54.i32[3] = 0;
          v56.i32[3] = 0;
          v57 = vrndmq_f32(v54);
          v58 = vsubq_f32(vrndpq_f32(v56), v57);
          anon_210[1].i32[0] = v57.i32[2];
          *anon_210 = *(float32x2_t *)v57.f32;
          anon_210[3].i32[0] = v58.i32[2];
          anon_210[2] = *(float32x2_t *)v58.f32;
          v24 = v7;
        }
        else
        {
          v27 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)HIDWORD(GaussianBlurKernelBorderScaleData), v25.f32[0]), (float32x4_t)xmmword_2418AB3A0, *(float32x2_t *)v25.f32, 1), (float32x4_t)xmmword_2418AB3B0, v25, 2);
          v28 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)HIDWORD(GaussianBlurKernelBorderScaleData), v26.f32[0]), (float32x4_t)xmmword_2418AB3A0, *(float32x2_t *)v26.f32, 1), (float32x4_t)xmmword_2418AB3B0, v26, 2);
          *(float *)&v29 = (float)-(int)GaussianBlurKernelBorderScaleData;
          v30 = vaddq_f32((float32x4_t)v29, v27);
          v31.i64[0] = 0xC0000000C0000000;
          v31.i64[1] = 0xC0000000C0000000;
          v32 = vmlaq_f32(v28, v31, (float32x4_t)v29);
          v30.i32[3] = v135;
          v32.i32[3] = v133;
          v33 = vaddq_f32(v30, v32);
          v30.i32[3] = 0;
          v33.i32[3] = 0;
          v34 = vrndmq_f32(v30);
          v35 = vsubq_f32(vrndpq_f32(v33), v34);
          anon_210[1].i32[0] = v34.i32[2];
          *anon_210 = *(float32x2_t *)v34.f32;
          anon_210[3].i32[0] = v35.i32[2];
          anon_210[2] = *(float32x2_t *)v35.f32;
          v24 = 2 * v8;
          v36 = *(_OWORD *)anon_210[2].f32;
          *v10 = *(_OWORD *)anon_210->f32;
          v10[1] = v36;
          LODWORD(v36) = 0;
          DWORD1(v36) = HIDWORD(GaussianBlurKernelBorderScaleData);
          v34.i32[0] = 0;
          v34.f32[1] = (float)-(int)GaussianBlurKernelBorderScaleData;
          v37 = vaddq_f32((float32x4_t)v34.u64[0], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), COERCE_FLOAT(*(_OWORD *)anon_210->f32)), (float32x4_t)(unint64_t)v36, *anon_210, 1), (float32x4_t)xmmword_2418AB3B0, *(float32x4_t *)anon_210->f32, 2));
          v38 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0), COERCE_FLOAT(*(_OWORD *)anon_210[2].f32)), (float32x4_t)(unint64_t)v36, anon_210[2], 1), (float32x4_t)xmmword_2418AB3B0, *(float32x4_t *)anon_210[2].f32, 2), v31, (float32x4_t)v34.u64[0]);
          v37.i32[3] = v140;
          v38.i32[3] = v139;
          v39 = vaddq_f32(v37, v38);
          v37.i32[3] = 0;
          v40 = vrndmq_f32(v37);
          v39.i32[3] = 0;
          anon_210[1].i32[0] = v40.i32[2];
          *anon_210 = *(float32x2_t *)v40.f32;
          v41 = vsubq_f32(vrndpq_f32(v39), v40);
          anon_210[3].i32[0] = v41.i32[2];
          anon_210[2] = *(float32x2_t *)v41.f32;
        }
      }
      else
      {
        if (v12 == 24)
          v15 = scale;
        else
          v15 = 1.0 / scale;
        LODWORD(v16) = 0;
        *((float *)&v16 + 1) = v15;
        v17 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v15), COERCE_FLOAT(*(_OWORD *)anon_210->f32)), (float32x4_t)v16, *anon_210, 1), (float32x4_t)xmmword_2418AB3B0, *(float32x4_t *)anon_210->f32, 2);
        v18 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v15), COERCE_FLOAT(*(_OWORD *)anon_210[2].f32)), (float32x4_t)v16, anon_210[2], 1), (float32x4_t)xmmword_2418AB3B0, *(float32x4_t *)anon_210[2].f32, 2);
        v19 = vaddq_f32(v17, (float32x4_t)0);
        v19.i32[3] = v143;
        v18.i32[3] = v141;
        v20 = vaddq_f32(v19, v18);
        v19.i32[3] = 0;
        v21 = vrndmq_f32(v19);
        v20.i32[3] = 0;
        anon_210[1].i32[0] = v21.i32[2];
        v22 = vsubq_f32(vrndpq_f32(v20), v21);
        *anon_210 = *(float32x2_t *)v21.f32;
        anon_210[3].i32[0] = v22.i32[2];
        anon_210[2] = *(float32x2_t *)v22.f32;
        v23 = *(_OWORD *)anon_210[2].f32;
        v24 = 2 * v8;
        *v10 = *(_OWORD *)anon_210->f32;
        v10[1] = v23;
      }
      v59 = &v145[(32 * v24) | 0x20];
      v60 = *(_OWORD *)anon_210[2].f32;
      *v59 = *(_OWORD *)anon_210->f32;
      v59[1] = v60;
      ++v8;
      v7 += 2;
      v10 += 4;
      --numSteps;
    }
    while (numSteps);
    v61 = vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_clipRect.size.width));
    anon_210[1].i32[0] = 1065353216;
    *anon_210 = 0;
    anon_210[3].i32[0] = 0;
    anon_210[2] = v61;
    if (v131 >= 1)
    {
      anon_10 = self->_anon_10;
      v63 = v131 + 1;
      v64 = 2 * v131 - 2;
      do
      {
        v65 = planSteps[(v63 - 2)];
        if (v65 <= 25)
          v66 = (char *)&kPlanKernelInfo + 56 * v65;
        else
          v66 = 0;
        v67 = getGaussianBlurKernelBorderScaleData(planSteps[(v63 - 2)]);
        v68 = v64 + 1;
        v69 = (float32x4_t *)&v145[32 * v68];
        v70 = *v69;
        v71 = *(float32x4_t *)anon_210->f32;
        v73 = (__n128)vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
        v72 = vaddq_f32(*v69, v69[1]);
        v71.i32[3] = 0;
        v70.i32[3] = 0;
        v73.n128_u32[3] = 0;
        v74 = vmaxnmq_f32(v71, v70);
        v72.i32[3] = 0;
        v75 = vsubq_f32(vminnmq_f32((float32x4_t)v73, v72), v74);
        anon_210[1].i32[0] = v74.i32[2];
        *anon_210 = *(float32x2_t *)v74.f32;
        anon_210[3].i32[0] = v75.i32[2];
        anon_210[2] = *(float32x2_t *)v75.f32;
        v76 = *(float32x4_t *)anon_210->f32;
        v77 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
        v76.i32[3] = 0;
        v78 = vrndmq_f32(v76);
        v77.i32[3] = 0;
        anon_210[1].i32[0] = v78.i32[2];
        v79 = vsubq_f32(vrndpq_f32(v77), v78);
        *anon_210 = *(float32x2_t *)v78.f32;
        anon_210[3].i32[0] = v79.i32[2];
        anon_210[2] = *(float32x2_t *)v79.f32;
        v80 = &anon_10[32 * v68];
        v81 = *(_OWORD *)anon_210[2].f32;
        *(_OWORD *)v80 = *(_OWORD *)anon_210->f32;
        *((_OWORD *)v80 + 1) = v81;
        if (v65 < 23)
        {
          v89 = *((float *)&v67 + 1);
          v90 = (float32x4_t *)&v145[32 * v64];
          v91 = *v90;
          v92 = *(__n128 *)anon_210->f32;
          v93 = *(__n128 *)anon_210[2].f32;
          v94 = (float)(int)v67;
          v95 = vaddq_f32(*v90, v90[1]);
          v91.i32[3] = 0;
          v95.i32[3] = 0;
          v142 = v91;
          v144 = v95;
          if (v65 < 16)
          {
            v109 = ((__n128 (*)(uint64_t, __n128, __n128, float, float))*((_QWORD *)v66 + 2))(1, v92, v93, v94, *((float *)&v67 + 1));
            anon_210[1].i32[0] = v109.n128_i32[2];
            *anon_210 = (float32x2_t)v109.n128_u64[0];
            anon_210[3].i32[0] = v110;
            anon_210[2] = v111;
            v112 = *(float32x4_t *)anon_210->f32;
            v113 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
            v112.i32[3] = 0;
            v114 = vmaxnmq_f32(v112, v142);
            v113.i32[3] = 0;
            v115 = vsubq_f32(vminnmq_f32(v113, v144), v114);
            v114.i32[3] = v139;
            v115.i32[3] = v141;
            v116 = vaddq_f32(v114, v115);
            v117 = v114;
            v117.i32[3] = 0;
            v118 = vrndmq_f32(v117);
            v116.i32[3] = 0;
            v119 = vsubq_f32(vrndpq_f32(v116), v118);
            anon_210[1].i32[0] = v118.i32[2];
            *anon_210 = *(float32x2_t *)v118.f32;
            anon_210[3].i32[0] = v119.i32[2];
            anon_210[2] = *(float32x2_t *)v119.f32;
            v120 = &anon_10[32 * v64];
            v121 = *(_OWORD *)anon_210[2].f32;
            *(_OWORD *)v120 = *(_OWORD *)anon_210->f32;
            *((_OWORD *)v120 + 1) = v121;
            (*((void (**)(uint64_t, __n128, __n128, float, float))v66 + 5))(1, *(__n128 *)anon_210->f32, *(__n128 *)anon_210[2].f32, v94, v89);
          }
          else
          {
            v96 = ((__n128 (*)(_QWORD, __n128, __n128, float, float))*((_QWORD *)v66 + 5))(0, v92, v93, v94, *((float *)&v67 + 1));
            anon_210[1].i32[0] = v96.n128_i32[2];
            *anon_210 = (float32x2_t)v96.n128_u64[0];
            anon_210[3].i32[0] = v97;
            anon_210[2] = v98;
            v99 = *(float32x4_t *)anon_210->f32;
            v100 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
            v99.i32[3] = 0;
            v101 = vmaxnmq_f32(v99, v142);
            v100.i32[3] = 0;
            v102 = vsubq_f32(vminnmq_f32(v100, v144), v101);
            v101.i32[3] = v138;
            v102.i32[3] = v140;
            v103 = vaddq_f32(v101, v102);
            v104 = v101;
            v104.i32[3] = 0;
            v105 = vrndmq_f32(v104);
            v103.i32[3] = 0;
            v106 = vsubq_f32(vrndpq_f32(v103), v105);
            anon_210[1].i32[0] = v105.i32[2];
            *anon_210 = *(float32x2_t *)v105.f32;
            anon_210[3].i32[0] = v106.i32[2];
            anon_210[2] = *(float32x2_t *)v106.f32;
            v107 = &anon_10[32 * v64];
            v108 = *(_OWORD *)anon_210[2].f32;
            *(_OWORD *)v107 = *(_OWORD *)anon_210->f32;
            *((_OWORD *)v107 + 1) = v108;
            (*((void (**)(_QWORD, __n128, __n128, float, float))v66 + 2))(0, *(__n128 *)anon_210->f32, *(__n128 *)anon_210[2].f32, v94, v89);
          }
        }
        else
        {
          v82 = &anon_10[32 * v64];
          v83 = *(_OWORD *)anon_210[2].f32;
          *(_OWORD *)v82 = *(_OWORD *)anon_210->f32;
          *((_OWORD *)v82 + 1) = v83;
          v84 = 40;
          if (v65 == 24)
          {
            v84 = 16;
            v73.n128_f32[0] = 1.0 / scale;
          }
          else
          {
            v73.n128_f32[0] = scale;
          }
          (*(void (**)(uint64_t, __n128, __n128, float, __n128))&v66[v84])(1, *(__n128 *)anon_210->f32, *(__n128 *)anon_210[2].f32, 0.0, v73);
        }
        anon_210[1].i32[0] = v86;
        *anon_210 = v85;
        anon_210[3].i32[0] = v88;
        anon_210[2] = v87;
        --v63;
        v64 -= 2;
      }
      while (v63 > 1);
    }
  }
  else
  {
    *(_DWORD *)&self->_anon_210[8] = 1065353216;
    *anon_210 = 0;
    *(_DWORD *)&self->_anon_210[24] = 0;
    *(_QWORD *)&self->_anon_210[16] = v2.i64[0];
  }
  v122 = *(float32x4_t *)anon_210->f32;
  v123 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
  v124 = vaddq_f32(v132, (float32x4_t)xmmword_2418AB3B0);
  v122.i32[3] = 0;
  v123.i32[3] = 0;
  v124.i32[3] = 0;
  v125 = vmaxnmq_f32(v122, (float32x4_t)xmmword_2418AB3B0);
  v126 = vsubq_f32(vminnmq_f32(v123, v124), v125);
  anon_210[1].i32[0] = v125.i32[2];
  *anon_210 = *(float32x2_t *)v125.f32;
  anon_210[3].i32[0] = v126.i32[2];
  anon_210[2] = *(float32x2_t *)v126.f32;
  v127 = *(float32x4_t *)anon_210->f32;
  v128 = vaddq_f32(*(float32x4_t *)anon_210->f32, *(float32x4_t *)anon_210[2].f32);
  v127.i32[3] = 0;
  v128.i32[3] = 0;
  v129 = vrndmq_f32(v127);
  v130 = vsubq_f32(vrndpq_f32(v128), v129);
  anon_210[1].i32[0] = v129.i32[2];
  *anon_210 = *(float32x2_t *)v129.f32;
  anon_210[3].i32[0] = v130.i32[2];
  anon_210[2] = *(float32x2_t *)v130.f32;
}

- (uint64_t)encodeCommandBuffer:(void *)a3 inPlaceTexture:
{
  char *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  int v13;
  char *v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  float64x2_t *v18;
  char *v19;
  float32x4_t *v20;
  float32x4_t v21;
  float32x4_t v22;
  int32x2_t v23;
  char *v24;
  float64x2_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  float64x2_t *v30;
  float64x2_t v31;
  float64x2_t v32;
  int v33;
  float32x4_t *v34;
  float32x4_t *v35;
  unsigned int v36;
  float32x4_t v37;
  __int128 v38;
  float32x4_t v39;
  int8x16_t v40;
  int32x2_t v41;
  __int128 v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  id Sampler;
  unsigned __int16 v47;
  unsigned __int16 v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  id v58;
  id v59;
  float32x4_t *v60;
  float32x4_t v61;
  float32x4_t v62;
  __int128 v63;
  __int128 v64;
  int32x2_t v65;
  __int16 v66;
  __int16 v67;
  float32x4_t v68;
  int8x16_t v69;
  int32x2_t v70;
  __int128 v71;
  id v72;
  unsigned __int16 v73;
  unsigned __int16 v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t PixelInfo;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  char *v98;
  void *v99;
  void *v100;
  int v101;
  float32x2_t v102;
  int32x2_t v103;
  void *v104;
  char *v105;
  void *v106;
  void *v107;
  void *v108;
  int GaussianBlurKernelSize;
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[3];
  _QWORD v113[3];
  __int128 v114;
  uint64_t v115;
  _QWORD v116[2];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  float v123;
  _QWORD v124[5];
  _QWORD v125[5];
  _QWORD v126[3];
  _QWORD v127[3];
  __int128 v128;
  uint64_t v129;
  _QWORD v130[2];
  __int128 v131;
  float32x4_t v132;
  _OWORD v133[4];
  float v134;

  if (result)
  {
    v3 = (char *)result;
    if (*(float *)(result + 560) >= 1.0)
    {
      v5 = *a3;
      v89 = *(_QWORD *)(result + 608);
      v90 = *(_QWORD *)(result + 600);
      v6 = objc_msgSend((id)objc_msgSend(a2, "commandQueue"), "device");
      v106 = a2;
      v7 = (void *)objc_msgSend(a2, "computeCommandEncoder");
      v88 = *((_QWORD *)v3 + 81);
      v8 = *((_QWORD *)v3 + 82);
      v9 = *((float *)v3 + 166);
      v107 = (void *)v6;
      PixelInfo = GetPixelInfo();
      v93 = objc_msgSend(v5, "protectionOptions");
      v95 = v8;
      if (v8)
      {
        v10 = 0;
        v11 = 0;
        v105 = v3 + 16;
        v86 = v8 - 1;
        v91 = v3 + 668;
        LODWORD(v12) = 0;
        v102 = 0;
        v85 = COERCE_UNSIGNED_INT(1.0);
        HIDWORD(v12) = 1.0;
        v84 = v12;
        v104 = v5;
        v87 = v5;
        v92 = v3;
        while (1)
        {
          v13 = *(_DWORD *)&v91[4 * v10];
          GaussianBlurKernelSize = getGaussianBlurKernelSize(v13);
          v14 = v13 <= 25 ? (char *)&kPlanKernelInfo + 56 * v13 : 0;
          v16 = *((_DWORD *)v14 + 2);
          v15 = v14 + 8;
          result = -[HKCVKernelCache kernelWithIdentifier:fromLibrary:archive:](*((_QWORD *)v3 + 71), (uint64_t)*(&CommonKernels + 3 * v16), *((void **)v3 + 73), *((_QWORD *)v3 + 74));
          v108 = (void *)result;
          if (!result)
            break;
          result = -[HKCVKernelCache kernelWithIdentifier:fromLibrary:archive:](*((_QWORD *)v3 + 71), (uint64_t)*(&CommonKernels + 3 * *((unsigned int *)v15 + 6)), *((void **)v3 + 73), *((_QWORD *)v3 + 74));
          if (!result)
            break;
          v17 = GaussianBlurKernelSize - 1;
          v18 = (float64x2_t *)(v88 + 8 * (v11 + 3));
          if (v13 >= 16)
            v19 = v15;
          else
            v19 = v15 + 24;
          v20 = (float32x4_t *)&v105[64 * v10];
          v22 = *v20;
          v21 = v20[1];
          v23 = vcvt_s32_f32(*(float32x2_t *)v21.f32);
          if (v13 >= 16)
            v24 = v15 + 24;
          else
            v24 = v15;
          HIDWORD(v25.f64[0]) = 0;
          v25.f64[1] = 0.0;
          LOWORD(v25.f64[0]) = v23.i16[0];
          WORD1(v25.f64[0]) = v23.i16[2];
          v26 = v108;
          if (v13 >= 16)
            v27 = v108;
          else
            v27 = (void *)result;
          if (v13 >= 16)
            v26 = (void *)result;
          v98 = v24;
          v99 = v26;
          v130[0] = *(_QWORD *)&v25.f64[0];
          v130[1] = v22.i64[0];
          v96 = v22.i64[0];
          if (GaussianBlurKernelSize < 5)
          {
            v28 = 0;
          }
          else
          {
            v28 = v17 >> 2;
            v29 = v17 >> 2;
            v30 = (float64x2_t *)v133;
            do
            {
              v32 = *v18;
              v31 = v18[1];
              v18 += 2;
              v25 = (float64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v31);
              *v30++ = v25;
              --v29;
            }
            while (v29);
          }
          v33 = v17 & 3;
          if ((v17 & 3) != 0)
          {
            v34 = (float32x4_t *)&v130[2 * v28];
            v34[3].i32[0] = 0;
            v35 = v34 + 3;
            v35->i64[1] = 0;
            v35->i32[1] = 0;
            if (v33 == 2)
            {
              v37 = *(float32x4_t *)v18;
              *(float32x2_t *)v37.f32 = vcvt_f32_f64(*v18);
            }
            else if (v33 == 1)
            {
              *(float *)&v36 = v18->f64[0];
              v37 = (float32x4_t)v36;
            }
            else
            {
              v25.f64[0] = v18[1].f64[0];
              v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v18), v25);
              v37.i32[3] = 0;
            }
            *v35 = v37;
          }
          v100 = (void *)result;
          v101 = v11;
          v39 = (float32x4_t)xmmword_2418AB3A0;
          v38 = xmmword_2418AB400;
          HIDWORD(v38) = v102.i32[1];
          v39.i32[3] = v102.i32[0];
          v131 = v38;
          v132 = v39;
          v134 = 1.0 / v9;
          v39.i64[0] = 0x4F0000004F000000;
          v39.i64[1] = 0x4F0000004F000000;
          v40 = (int8x16_t)vcgtq_f32(v21, v39);
          v41 = vadd_s32((int32x2_t)vand_s8(*(int8x8_t *)v40.i8, (int8x8_t)0x8000000080000000), (int32x2_t)*(_OWORD *)&vcvtq_s32_f32(vsubq_f32(v21, (float32x4_t)vandq_s8(v40, (int8x16_t)v39))));
          *(_QWORD *)&v42 = v41.u32[0];
          *((_QWORD *)&v42 + 1) = v41.u32[1];
          v128 = v42;
          v129 = 1;
          v43 = objc_msgSend(v3, "cachedTextureForDevice:pixelInfo:identifier:textureSize:protectionOptions:", v107, PixelInfo, v10, &v128, v93, v84, v85);
          if (v10)
            v44 = v13 < 16;
          else
            v44 = 1;
          v45 = v44;
          Sampler = GetSampler(v107, 0, v45, 0);
          v47 = v130[0];
          v48 = WORD1(v130[0]);
          v49 = objc_msgSend(v27, "maxTotalThreadsPerThreadgroup");
          v50 = objc_msgSend(v27, "threadExecutionWidth");
          v51 = (v49 & (unint64_t)-(uint64_t)v50) / v50;
          if (v51 <= v50)
            v52 = v50;
          else
            v52 = (v49 & (unint64_t)-(uint64_t)v50) / v50;
          if (v51 >= v50)
            v51 = v50;
          v53 = *((_QWORD *)v19 + 2);
          if (v53)
            v54 = v52;
          else
            v54 = v51;
          if (v53)
            v55 = v51;
          else
            v55 = v52;
          objc_msgSend(v7, "setComputePipelineState:", v27);
          v97 = (void *)v43;
          objc_msgSend(v7, "setTexture:atIndex:", v43, 0);
          objc_msgSend(v7, "setTexture:atIndex:", v104, 1);
          objc_msgSend(v7, "setSamplerState:atIndex:", Sampler, 0);
          objc_msgSend(v7, "setBytes:length:atIndex:", v130, 128, 0);
          v127[0] = (v54 + v47 - 1) / v54;
          v127[1] = (v55 + v48 - 1) / v55;
          v127[2] = 1;
          v126[0] = v54;
          v126[1] = v55;
          v126[2] = 1;
          objc_msgSend(v7, "dispatchThreadgroups:threadsPerThreadgroup:", v127, v126);
          v56 = objc_msgSend(v106, "retainedReferences");
          v57 = (uint64_t)v87;
          if (v104 == v87)
          {
            if ((v56 & 1) == 0)
            {
              v59 = v87;
              v124[0] = MEMORY[0x24BDAC760];
              v124[1] = 3221225472;
              v124[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_2;
              v124[3] = &unk_2511AB430;
              v124[4] = v87;
              objc_msgSend(v106, "addCompletedHandler:", v124);
            }
          }
          else
          {
            if ((v56 & 1) == 0)
            {
              v58 = v104;
              v125[0] = MEMORY[0x24BDAC760];
              v125[1] = 3221225472;
              v125[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke;
              v125[3] = &unk_2511AB430;
              v125[4] = v104;
              objc_msgSend(v106, "addCompletedHandler:", v125);
            }

          }
          v60 = (float32x4_t *)&v105[(v10 << 6) | 0x20];
          v62 = *v60;
          v61 = v60[1];
          v119 = v133[0];
          v120 = v133[1];
          v121 = v133[2];
          v122 = v133[3];
          v63 = v85;
          *((float *)&v63 + 3) = -*(float *)&v96;
          v64 = v84;
          *((float *)&v64 + 3) = -*((float *)&v96 + 1);
          v65 = vcvt_s32_f32(*(float32x2_t *)v61.f32);
          v117 = v63;
          v118 = v64;
          v123 = v9;
          v5 = v87;
          if (v10 == v86)
            v66 = v90;
          else
            v66 = 0;
          v65.i16[1] = v65.i16[2];
          if (v10 == v86)
            v67 = v89;
          else
            v67 = 0;
          v65.i16[2] = v66;
          v65.i16[3] = v67;
          v116[0] = v65;
          v116[1] = v62.i64[0];
          v103 = *(int32x2_t *)v62.f32;
          if (v10 != v86)
          {
            v68.i64[0] = 0x4F0000004F000000;
            v68.i64[1] = 0x4F0000004F000000;
            v69 = (int8x16_t)vcgtq_f32(v61, v68);
            v70 = vadd_s32((int32x2_t)vand_s8(*(int8x8_t *)v69.i8, (int8x8_t)0x8000000080000000), (int32x2_t)*(_OWORD *)&vcvtq_s32_f32(vsubq_f32(v61, (float32x4_t)vandq_s8(v69, (int8x16_t)v68))));
            *(_QWORD *)&v71 = v70.u32[0];
            *((_QWORD *)&v71 + 1) = v70.u32[1];
            v114 = v71;
            v115 = 1;
            v57 = objc_msgSend(v92, "cachedTextureForDevice:pixelInfo:identifier:textureSize:protectionOptions:", v107, PixelInfo, v10 + v95, &v114, v93);
          }
          v72 = GetSampler(v107, 0, v13 < 16, 0);
          v73 = v116[0];
          v74 = WORD1(v116[0]);
          v75 = objc_msgSend(v99, "maxTotalThreadsPerThreadgroup");
          v76 = objc_msgSend(v99, "threadExecutionWidth");
          v77 = (v75 & (unint64_t)-(uint64_t)v76) / v76;
          if (v77 <= v76)
            v78 = v76;
          else
            v78 = (v75 & (unint64_t)-(uint64_t)v76) / v76;
          if (v77 >= v76)
            v77 = v76;
          v79 = *((_QWORD *)v98 + 2);
          if (v79)
            v80 = v78;
          else
            v80 = v77;
          if (v79)
            v81 = v77;
          else
            v81 = v78;
          objc_msgSend(v7, "setComputePipelineState:", v99);
          v104 = (void *)v57;
          objc_msgSend(v7, "setTexture:atIndex:", v57, 0);
          objc_msgSend(v7, "setTexture:atIndex:", v97, 1);
          objc_msgSend(v7, "setSamplerState:atIndex:", v72, 0);
          objc_msgSend(v7, "setBytes:length:atIndex:", v116, 128, 0);
          v113[0] = (v80 + v73 - 1) / v80;
          v113[1] = (v81 + v74 - 1) / v81;
          v113[2] = 1;
          v112[0] = v80;
          v112[1] = v81;
          v112[2] = 1;
          objc_msgSend(v7, "dispatchThreadgroups:threadsPerThreadgroup:", v113, v112);
          if ((objc_msgSend(v106, "retainedReferences") & 1) == 0)
          {
            v82 = v97;
            v111[0] = MEMORY[0x24BDAC760];
            v111[1] = 3221225472;
            v111[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_3;
            v111[3] = &unk_2511AB430;
            v111[4] = v97;
            objc_msgSend(v106, "addCompletedHandler:", v111);
          }
          v102 = vneg_f32((float32x2_t)vrev64_s32(v103));

          v11 = GaussianBlurKernelSize + v101;
          ++v10;
          v3 = v92;
          if (v10 == v95)
            goto LABEL_79;
        }
      }
      else
      {
LABEL_79:
        if ((objc_msgSend(v106, "retainedReferences") & 1) == 0)
        {
          v83 = v5;
          v110[0] = MEMORY[0x24BDAC760];
          v110[1] = 3221225472;
          v110[2] = __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_4;
          v110[3] = &unk_2511AB430;
          v110[4] = v5;
          objc_msgSend(v106, "addCompletedHandler:", v110);
        }
        objc_msgSend(v7, "endEncoding");
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke(uint64_t a1)
{

}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_2(uint64_t a1)
{

}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_3(uint64_t a1)
{

}

void __55__HKCVGaussianBlur_encodeCommandBuffer_inPlaceTexture___block_invoke_4(uint64_t a1)
{

}

- (float)sigma
{
  return self->_sigma;
}

- ($F1BC40A862ED60063F4F8EDA86EB086B)clipRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].var1.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[12].var1.var0;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[13].var0.var1;
  return self;
}

- ($0EE4DB4080C7F8AC2CA5DE15946CA571)planInfo
{
  __int128 v3;

  *(_QWORD *)&retstr->var3[7] = *(_QWORD *)&self[12].var3[1];
  v3 = *(_OWORD *)&self[11].var3[7];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[11].var3[3];
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var3[3] = *(_OWORD *)&self[12].var1;
  return self;
}

- (HKCVKernelCache)kernelCache
{
  return self->_kernelCache;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (MTLBinaryArchive)archive
{
  return self->_archive;
}

@end
