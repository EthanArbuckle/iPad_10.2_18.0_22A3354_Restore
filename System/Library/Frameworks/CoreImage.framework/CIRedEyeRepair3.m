@implementation CIRedEyeRepair3

- (void)setInspector:(id)a3
{
  self->inspector = (RedEyeInspector3 *)a3;
}

+ ($A3B2E143E1A03423F9FC703C010436DC)bitmapRectWithImageSubRectangle:(CGRect)a3 settings:(id *)a4
{
  float width;
  uint64_t v5;
  float height;
  float x;
  uint64_t v8;
  float y;
  uint64_t v10;
  unint64_t BitmapRect;
  uint64_t v12;
  $A3B2E143E1A03423F9FC703C010436DC result;

  width = a3.size.width;
  v5 = (uint64_t)rintf(width);
  height = a3.size.height;
  x = a3.origin.x;
  v8 = (uint64_t)rintf(x);
  y = a3.origin.y;
  v10 = (uint64_t)rintf(y);
  BitmapRect = makeBitmapRect(v8, (int)(float)(a4->var4 - (float)(int)(v10 + (uint64_t)rintf(height))), (v8 + v5), (int)(float)(a4->var4 - (float)(int)v10));
  result.var2 = v12;
  result.var3 = HIDWORD(v12);
  result.var0 = BitmapRect;
  result.var1 = HIDWORD(BitmapRect);
  return result;
}

+ (float)yawAngleWithFaceDictionary:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;

  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeX")), "floatValue");
  v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeY")), "floatValue");
  v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeX")), "floatValue");
  v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeY")), "floatValue");
  v11 = v10;
  v12 = (float)(v5 + v9) * 0.5;
  v13 = (float)(v7 + v10) * 0.5;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mouthCenterX")), "floatValue");
  v15 = v14;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mouthCenterY")), "floatValue");
  v17 = v16;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("noseTipX")), "floatValue");
  v19 = v18;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("noseTipY")), "floatValue");
  v20 = 1.0 / sqrtf((float)((float)(v17 - v13) * (float)(v17 - v13)) + (float)((float)(v15 - v12) * (float)(v15 - v12)));
  v22 = (float)((float)((float)(v21 - v17) * (float)-(float)((float)(v15 - v12) * v20))
              + (float)((float)(v19 - v15) * (float)((float)(v17 - v13) * v20)))
      / (float)((float)((float)(v11 - v17) * (float)-(float)((float)(v15 - v12) * v20))
              + (float)((float)(v9 - v15) * (float)((float)(v17 - v13) * v20)));
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeLeftX")), "floatValue");
  v24 = v23;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeLeftY")), "floatValue");
  v26 = v25;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeRightX")), "floatValue");
  v28 = v27;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeRightY")), "floatValue");
  v30 = v29;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeLeftX")), "floatValue");
  v32 = v31;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeLeftY")), "floatValue");
  v34 = v33;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeRightX")), "floatValue");
  v36 = v35;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeRightY")), "floatValue");
  v38 = atan((1.0- (float)(sqrtf((float)((float)(v37 - v34) * (float)(v37 - v34)) + (float)((float)(v36 - v32)* (float)(v36 - v32)))/ sqrtf((float)((float)(v30 - v26) * (float)(v30 - v26)) + (float)((float)(v28 - v24)* (float)(v28 - v24)))))* 5.5)* 32.0;
  v39 = sin(v22 * 1.3) * 45.0;
  return (float)((float)(v39 + v38) * 0.5) * 3.14159265 / 180.0;
}

+ (int)bitmapRect:(id *)a3 point:(CGPoint *)a4 polygon:(CGPoint)a5[8] andDistMatrix:(float)a6[4] forEye:(int)a7 inFaceDictionary:(id)a8 settings:(id *)a9
{
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  __double2 v64;
  float sinval;
  float cosval;
  uint64_t var7;
  int result;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  float32x4_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  float v92;
  float v93;
  float v94;
  float v95;
  $A3B2E143E1A03423F9FC703C010436DC *v96;
  CGPoint *v97;
  const __CFString *v98;
  float v99;
  const __CFString *v100;
  float v101;
  const __CFString *v102;
  float v103;
  const __CFString *v104;
  float v105;
  const __CFString *v106;
  float v107;
  const __CFString *v108;
  float v109;
  const __CFString *v110;
  float v111;
  const __CFString *v112;
  float v113;
  const __CFString *v114;
  float v115;
  const __CFString *v116;
  float v117;
  $807B2EF8CC2A3BA0CBD71F9CA1C0D669 *v118;
  float v119;

  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("leftEyeX")), "floatValue");
  v16 = v15;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("leftEyeY")), "floatValue");
  v18 = v17;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("rightEyeX")), "floatValue");
  v20 = v19;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("rightEyeY")), "floatValue");
  v22 = v21 - v18;
  +[CIRedEyeRepair3 yawAngleWithFaceDictionary:](CIRedEyeRepair3, "yawAngleWithFaceDictionary:", a8);
  v24 = sqrt((float)((float)(v22 * v22) + (float)((float)(v20 - v16) * (float)(v20 - v16)))) / cos(v23);
  if (v24 < 200.0)
    a9->var7 = 0;
  a9->var24 = v24;
  if (a7)
  {
    if (a7 != 1)
      return 53;
    v96 = a3;
    v97 = a4;
    v116 = CFSTR("rightEyelidSWY");
    v118 = a9;
    v112 = CFSTR("rightEyelidLowerY");
    v114 = CFSTR("rightEyelidSWX");
    v108 = CFSTR("rightEyelidSEY");
    v110 = CFSTR("rightEyelidLowerX");
    v104 = CFSTR("rightEyeRightY");
    v106 = CFSTR("rightEyelidSEX");
    v100 = CFSTR("rightEyelidNEY");
    v102 = CFSTR("rightEyeRightX");
    v98 = CFSTR("rightEyelidNEX");
    v25 = CFSTR("rightEyelidUpperY");
    v26 = CFSTR("rightEyelidUpperX");
    v27 = CFSTR("rightEyelidNWY");
    v28 = CFSTR("rightEyelidNWX");
    v29 = CFSTR("rightEyeLeftY");
    v30 = CFSTR("rightEyeLeftX");
    v31 = CFSTR("rightEyeY");
    v32 = CFSTR("rightEyeX");
  }
  else
  {
    v96 = a3;
    v97 = a4;
    v116 = CFSTR("leftEyelidSWY");
    v118 = a9;
    v112 = CFSTR("leftEyelidLowerY");
    v114 = CFSTR("leftEyelidSWX");
    v108 = CFSTR("leftEyelidSEY");
    v110 = CFSTR("leftEyelidLowerX");
    v104 = CFSTR("leftEyeRightY");
    v106 = CFSTR("leftEyelidSEX");
    v100 = CFSTR("leftEyelidNEY");
    v102 = CFSTR("leftEyeRightX");
    v98 = CFSTR("leftEyelidNEX");
    v25 = CFSTR("leftEyelidUpperY");
    v26 = CFSTR("leftEyelidUpperX");
    v27 = CFSTR("leftEyelidNWY");
    v28 = CFSTR("leftEyelidNWX");
    v29 = CFSTR("leftEyeLeftY");
    v30 = CFSTR("leftEyeLeftX");
    v31 = CFSTR("leftEyeY");
    v32 = CFSTR("leftEyeX");
  }
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v32), "floatValue");
  v93 = v33;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v31), "floatValue");
  v92 = v34;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v30), "floatValue");
  v36 = v35;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v29), "floatValue");
  v38 = v37;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v28), "floatValue");
  v95 = v39;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v27), "floatValue");
  v94 = v40;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v26), "floatValue");
  v119 = v41;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v25), "floatValue");
  v43 = v42;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v98), "floatValue");
  v99 = v44;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v100), "floatValue");
  v101 = v45;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v102), "floatValue");
  v47 = v46;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v104), "floatValue");
  v49 = v48;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v106), "floatValue");
  v107 = v50;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v108), "floatValue");
  v109 = v51;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v110), "floatValue");
  v53 = v52;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v112), "floatValue");
  v55 = v54;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v114), "floatValue");
  v105 = v56;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v116), "floatValue");
  v103 = v57;
  v115 = v47;
  v58 = v47 - v36;
  v113 = v49;
  v59 = v49 - v38;
  v60 = atan2((float)-v59, (float)(v47 - v36));
  v61 = sqrtf((float)(v59 * v59) + (float)(v58 * v58));
  v111 = v53;
  v117 = v43;
  v62 = vabds_f32((float)((float)((float)(v53 - v36) * v59) - (float)(v58 * (float)(v55 - v38))) / v61, (float)((float)((float)(v119 - v36) * v59) - (float)(v58 * (float)(v43 - v38))) / v61);
  v63 = (float)(v61 * 0.5) / v62;
  v64 = __sincos_stret(v60);
  sinval = v64.__sinval;
  cosval = v64.__cosval;
  *a6 = cosval;
  a6[1] = -sinval;
  a6[2] = v63 * sinval;
  a6[3] = v63 * cosval;
  var7 = v118->var7;
  if (var7 > 3)
    return 17;
  result = 0;
  v69 = flt_1924972D0[var7];
  v70 = flt_1924972E0[var7];
  v71 = v62 * 1.8;
  v72 = v61 * 1.3;
  v73 = 1.0 / fmaxf(v61, 0.00001);
  v74 = -(float)(v58 * v73);
  v118->var23 = v69;
  v75 = v72 * 0.5;
  v76 = (float)(v58 * v73);
  v77 = v93 - v75 * v76;
  v78 = v71 * 0.5;
  v79 = (float)(v59 * v73);
  v80 = v77 - v78 * v79;
  v81 = v92 - v75 * v79;
  v82 = v74;
  v83 = v81 - v78 * v82;
  *(double *)v84.i64 = v93 + v75 * v76;
  v85 = *(double *)v84.i64 - v78 * v79;
  v86 = v92 + v75 * v79;
  v87 = v86 - v78 * v82;
  v88 = v77 + v78 * v79;
  v89 = v81 + v78 * v82;
  v90 = *(double *)v84.i64 + v78 * v79;
  v91 = v86 + v78 * v82;
  *(float *)&v86 = v80;
  v84.f32[0] = v85;
  *(float *)&v82 = v88;
  *(float *)&v90 = v90;
  *(float *)&v80 = fminf(*(float *)&v86, fminf(v84.f32[0], fminf(*(float *)&v82, *(float *)&v90)));
  *(float *)&v86 = fmaxf(*(float *)&v86, fmaxf(v84.f32[0], fmaxf(*(float *)&v82, *(float *)&v90)));
  *(float *)&v90 = v83;
  v84.f32[0] = v87;
  *(float *)&v82 = v89;
  *(float *)&v91 = v91;
  *(float *)&v88 = fminf(*(float *)&v90, fminf(v84.f32[0], fminf(*(float *)&v82, *(float *)&v91)));
  *(float *)&v91 = fmaxf(*(float *)&v90, fmaxf(v84.f32[0], fmaxf(*(float *)&v82, *(float *)&v91)));
  v84.f32[0] = floorf(*(float *)&v88 * v69);
  v84.i32[1] = ceilf(*(float *)&v91 * v69);
  v84.i64[1] = __PAIR64__(COERCE_UNSIGNED_INT(ceilf(*(float *)&v86 * v69)), COERCE_UNSIGNED_INT(floorf(*(float *)&v80 * v69)));
  *(int32x4_t *)v96 = vcvtq_s32_f32(vrndxq_f32(vmulq_n_f32(v84, v70)));
  v97->x = v93;
  v97->y = v92;
  a5->x = v36;
  a5->y = v38;
  a5[1].x = v95;
  a5[1].y = v94;
  a5[2].x = v119;
  a5[2].y = v117;
  a5[3].x = v99;
  a5[3].y = v101;
  a5[4].x = v115;
  a5[4].y = v113;
  a5[5].x = v107;
  a5[5].y = v109;
  a5[6].x = v111;
  a5[6].y = v55;
  a5[7].x = v105;
  a5[7].y = v103;
  return result;
}

+ (int)faceContext:(id *)a3 withFaceArray:(id)a4 index:(int)a5 settings:(id *)a6
{
  uint64_t v8;
  int result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int32x4_t v13;
  int32x4_t v14;
  float64x2_t v15;
  float64x2_t v16;
  double *i64;
  double *v18;
  int32x4_t __src[24];
  float64x2x2_t v20;
  float64x2x2_t v21;
  float64x2x2_t v22;

  memset(__src, 0, 376);
  v8 = objc_msgSend(a4, "objectAtIndexedSubscript:", a5);
  result = +[CIRedEyeRepair3 bitmapRect:point:polygon:andDistMatrix:forEye:inFaceDictionary:settings:](CIRedEyeRepair3, "bitmapRect:point:polygon:andDistMatrix:forEye:inFaceDictionary:settings:", &__src[3], &__src[1], &__src[7], &__src[5], 0, v8, a6);
  if (!result)
  {
    result = +[CIRedEyeRepair3 bitmapRect:point:polygon:andDistMatrix:forEye:inFaceDictionary:settings:](CIRedEyeRepair3, "bitmapRect:point:polygon:andDistMatrix:forEye:inFaceDictionary:settings:", &__src[4], &__src[2], &__src[15], &__src[6], 1, v8, a6);
    if (!result)
    {
      v10 = unionBitmapRects(__src[3].i64[0], __src[3].i64[1], __src[4].i64[0]);
      v11 = 0;
      v13.i64[0] = __PAIR64__(v12, v10);
      __src[0].i64[0] = v10;
      __src[0].i64[1] = v12;
      v14 = vzip1q_s32(v13, v13);
      *(double *)__src[1].i64 = *(double *)__src[1].i64 - (double)(int)v12;
      *(double *)&__src[1].i64[1] = *(double *)&__src[1].i64[1] - (double)(int)v10;
      *(double *)__src[2].i64 = *(double *)__src[2].i64 - (double)(int)v12;
      *(double *)&__src[2].i64[1] = *(double *)&__src[2].i64[1] - (double)(int)v10;
      __src[3] = vsubq_s32(__src[3], v14);
      __src[4] = vsubq_s32(__src[4], v14);
      v15 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(int)v12), 0);
      v16 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(int)v10), 0);
      do
      {
        i64 = (double *)__src[v11 + 7].i64;
        v20 = vld2q_f64(i64);
        v22.val[0] = vsubq_f64(v20.val[0], v15);
        v22.val[1] = vsubq_f64(v20.val[1], v16);
        vst2q_f64(i64, v22);
        v18 = (double *)__src[v11 + 15].i64;
        v21 = vld2q_f64(v18);
        v22.val[0] = vsubq_f64(v21.val[0], v15);
        v22.val[1] = vsubq_f64(v21.val[1], v16);
        vst2q_f64(v18, v22);
        v11 += 2;
      }
      while (v11 != 8);
      memcpy(a3, __src, sizeof($AF671A98239A4E3D129AF9BD78C1FB81));
      return 0;
    }
  }
  return result;
}

+ ($807B2EF8CC2A3BA0CBD71F9CA1C0D669)settingsWithOptions:(SEL)a3
{
  void *v6;
  int v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  void *v22;
  float v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;
  double v36;
  float v37;
  double v38;
  uint64_t v39;
  __CFString *v40;
  $807B2EF8CC2A3BA0CBD71F9CA1C0D669 *result;
  int v42;
  float v43;
  float v44;
  float v45;

  *(_QWORD *)&retstr->var26 = 0;
  *(_OWORD *)&retstr->var25.c = 0u;
  *(_OWORD *)&retstr->var25.tx = 0u;
  *(_OWORD *)&retstr->var21 = 0u;
  *(_OWORD *)&retstr->var25.a = 0u;
  *(_OWORD *)&retstr->var18.origin.y = 0u;
  *(_OWORD *)&retstr->var18.size.height = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("downsampleType"));
  if (v6)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = 1;
  retstr->var7 = v7;
  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("downsampleOversizeX"));
  if (v8)
    objc_msgSend(v8, "floatValue");
  else
    v9 = 1.3;
  retstr->var8 = v9;
  v10 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("downsampleOversizeY"));
  if (v10)
    objc_msgSend(v10, "floatValue");
  else
    v11 = 1.8;
  retstr->var9 = v11;
  v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("gradientChannel"));
  if (v12)
    v13 = objc_msgSend(v12, "intValue");
  else
    v13 = 6;
  retstr->var10 = v13;
  v14 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("edgeFindingChannel"));
  if (v14)
    v15 = objc_msgSend(v14, "intValue");
  else
    v15 = 6;
  retstr->var11 = v15;
  v16 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("minMagnitude"));
  if (v16)
    objc_msgSend(v16, "floatValue");
  else
    v17 = 0.1;
  retstr->var12 = v17;
  v18 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("regressionRadius"));
  if (v18)
    objc_msgSend(v18, "floatValue");
  else
    v19 = 2.5;
  retstr->var13 = v19;
  v20 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("capture"));
  if (v20)
    objc_msgSend(v20, "floatValue");
  else
    v21 = 3.14;
  retstr->var14 = v21;
  v22 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("alignmentTolerance"));
  if (v22)
    objc_msgSend(v22, "floatValue");
  else
    v23 = 0.72;
  retstr->var15 = v23;
  v24 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("connectThreshold"));
  if (v24)
    objc_msgSend(v24, "floatValue");
  else
    v25 = 7.0;
  retstr->var16 = v25;
  v26 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("forceFail"));
  if (v26)
    LOBYTE(v26) = objc_msgSend(v26, "BOOLValue");
  retstr->var17 = (char)v26;
  v27 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("orientation"));
  if (v27)
    v28 = objc_msgSend(v27, "intValue");
  else
    v28 = 1;
  retstr->var19 = v28;
  v29 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("imageExtent"));
  if (v29)
  {
    v30 = v29;
    objc_msgSend((id)objc_msgSend(v29, "objectAtIndexedSubscript:", 0), "floatValue");
    v32 = v31;
    objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", 1), "floatValue");
    v34 = v33;
    objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", 2), "floatValue");
    v36 = v35;
    objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", 3), "floatValue");
    v38 = v37;
  }
  else
  {
    v32 = 0.0;
    v34 = 0.0;
    v36 = 0.0;
    v38 = 0.0;
  }
  retstr->var18.origin.x = v32;
  retstr->var18.origin.y = v34;
  retstr->var18.size.width = v36;
  retstr->var18.size.height = v38;
  v39 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("cameraModel"));
  if (v39)
    v40 = (__CFString *)v39;
  else
    v40 = CFSTR("Unknown");
  result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)-[__CFString isEqualToString:](v40, "isEqualToString:", CFSTR("iPhone X"));
  if ((_DWORD)result)
  {
    v42 = 1;
  }
  else
  {
    result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)-[__CFString isEqualToString:](v40, "isEqualToString:", CFSTR("iPhone 4"));
    if ((result & 1) != 0
      || (result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)-[__CFString isEqualToString:](v40, "isEqualToString:", CFSTR("iPhone")), (_DWORD)result))
    {
      v42 = 2;
    }
    else
    {
      result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)-[__CFString containsString:](v40, "containsString:", CFSTR("KODAK"));
      if ((_DWORD)result)
        v42 = 3;
      else
        v42 = 4;
    }
  }
  retstr->var20 = v42;
  v43 = v36;
  v44 = v38;
  retstr->var0 = v43;
  retstr->var1 = v44;
  retstr->var2 = 1.0 / v43;
  retstr->var3 = 1.0 / v44;
  v45 = (float)(uint64_t)rintf(v44);
  retstr->var4 = v45;
  retstr->var26 = (int)v45;
  return result;
}

- (int)updateWithFaceIndex:(int)a3
{
  int result;
  double x;
  double y;
  double height;
  int minrow;
  int maxrow;
  int mincol;
  int maxcol;

  self->S.faceIndex = a3;
  result = +[CIRedEyeRepair3 faceContext:withFaceArray:index:settings:](CIRedEyeRepair3, "faceContext:withFaceArray:index:settings:", &self->FC, self->faceArray, *(_QWORD *)&a3, &self->S);
  if (!result)
  {
    x = self->S.inputImageExtent.origin.x;
    y = self->S.inputImageExtent.origin.y;
    height = self->S.inputImageExtent.size.height;
    minrow = self->FC.FR.minrow;
    maxrow = self->FC.FR.maxrow;
    mincol = self->FC.FR.mincol;
    maxcol = self->FC.FR.maxcol;
    self->ioffx = mincol;
    self->ioffy = minrow;
    self->ROIRect.origin.x = x + (float)mincol;
    self->ROIRect.origin.y = y + height - (float)maxrow;
    self->ROIRect.size.width = (float)(maxcol - mincol);
    self->ROIRect.size.height = (float)(maxrow - minrow);
  }
  return result;
}

- (void)repairExternalBuffer
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_repairMap;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  char *baseAddress;
  uint64_t samplesPerPixel;
  int width;
  int height;
  int *p_height;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t rowSamples;
  uint64_t v29;
  unsigned __int8 *v30;
  char *v31;
  char *v32;
  unsigned __int8 *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  _OWORD v40[2];
  uint64_t v41;

  v2 = *(_QWORD *)&self->repairRect.minrow;
  v3 = HIDWORD(v2);
  v4 = *(_QWORD *)&self->repairRect.mincol;
  v5 = SHIDWORD(v4) <= (int)v4 || SHIDWORD(v2) <= (int)v2;
  if (v5 || __PAIR64__(HIDWORD(v2) - (int)v2, HIDWORD(v4) - (int)v4) != *(_QWORD *)&self->repairMap.width)
    return;
  p_repairMap = &self->repairMap;
  v41 = 0;
  memset(v40, 0, sizeof(v40));
  if (self->FC.FR.mincol > (int)v4
    || self->FC.FR.minrow > (int)v2
    || self->FC.FR.maxcol < SHIDWORD(v4)
    || self->FC.FR.maxrow < SHIDWORD(v2))
  {
    v8 = offsetBitmapRect(*(_QWORD *)&self->FC.FR.minrow, *(_QWORD *)&self->FC.FR.mincol, -(int)v4, -(int)v2);
    v10 = v9;
    v11 = offsetBitmapRect(v2, v4, -(int)v4, -(int)v2);
    v12 = intersectBitmapRects(v8, v10, v11);
    v14 = v12;
    v15 = v13;
    if (SHIDWORD(v13) <= (int)v13 || SHIDWORD(v12) <= (int)v12)
      return;
    constructSliceBitmap((uint64_t)&self->repairMap, (uint64_t)v40, v12, v13);
    v17 = offsetBitmapRect(v14, v15, v4, v2);
    v4 = v18;
    v3 = HIDWORD(v17);
    p_repairMap = ($F19D4DADCC5A4AF414AA3A0637C491CF *)v40;
    LODWORD(v2) = v17;
  }
  if (self->subRectangle.mincol <= (int)v4
    && (int)v2 >= self->subRectangle.minrow
    && self->subRectangle.maxcol >= SHIDWORD(v4)
    && (int)v3 <= self->subRectangle.maxrow)
  {
    baseAddress = p_repairMap->baseAddress;
    samplesPerPixel = p_repairMap->samplesPerPixel;
    width = p_repairMap->width;
    p_height = &p_repairMap->height;
    height = p_repairMap->height;
    v24 = p_height[1];
    v25 = offsetBitmapRect(v2 | (v3 << 32), v4, -self->FC.FR.mincol, -self->FC.FR.minrow);
    if (height >= 1)
    {
      v27 = 0;
      rowSamples = self->fullBitmap.rowSamples;
      v29 = self->fullBitmap.samplesPerPixel;
      v30 = (unsigned __int8 *)(baseAddress + 1);
      v31 = &self->fullBitmap.baseAddress[(int)rowSamples * (uint64_t)v25 + 2 + (int)v29 * (uint64_t)v26];
      do
      {
        if (width >= 1)
        {
          v32 = v31;
          v33 = v30;
          v34 = width;
          do
          {
            v35 = v33[2] | (v33[2] << 8);
            v36 = *(v32 - 1);
            v37 = *v32;
            v38 = (*v33 - v36) * v35 + 0x8000;
            v39 = (*(v33 - 1) - v37) * v35 + 0x8000;
            *(v32 - 2) += ((v33[1] - *(v32 - 2)) * v35 + 0x8000) >> 16;
            *(v32 - 1) = v36 + BYTE2(v38);
            *v32 = v37 + BYTE2(v39);
            v33 += samplesPerPixel;
            v32 += v29;
            --v34;
          }
          while (v34);
        }
        ++v27;
        v30 += v24;
        v31 += rowSamples;
      }
      while (v27 != height);
    }
  }
}

- ($07A02DD24AF34610473D9D0940B06C4B)repairMap
{
  return ($07A02DD24AF34610473D9D0940B06C4B *)&self->repairMap;
}

- ($A3B2E143E1A03423F9FC703C010436DC)repairRect
{
  uint64_t v2;
  uint64_t v3;
  $A3B2E143E1A03423F9FC703C010436DC result;

  v2 = *(_QWORD *)&self->repairRect.mincol;
  v3 = *(_QWORD *)&self->repairRect.minrow;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (CGPoint)bitmapPointWithDictionaryPoint:(CGPoint)a3
{
  float v3;
  float yf;
  float v5;
  double v6;
  double v7;
  CGPoint result;

  v3 = a3.x * self->S.xf;
  yf = self->S.yf;
  v5 = a3.y * yf;
  v6 = (float)(v3 - (float)self->ioffx);
  v7 = (float)((float)(yf - v5) - (float)self->ioffy);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)globalBitmapPointWithDictionaryPoint:(CGPoint)a3
{
  float v3;
  float yf;
  float v5;
  double v6;
  double v7;
  CGPoint result;

  v3 = a3.x * self->S.xf;
  yf = self->S.yf;
  v5 = a3.y * yf;
  v6 = v3;
  v7 = (float)(yf - v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)bitmapPointWithDictionaryPointArray:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  double v10;
  CGPoint result;

  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  v6 = v5 * self->S.xf;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  v8 = (float)(self->S.yf - (float)(v7 * self->S.yf)) - (float)self->ioffy;
  v9 = (float)(v6 - (float)self->ioffx);
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)globalBitmapPointWithDictionaryPointArray:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  double v10;
  CGPoint result;

  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  v6 = v5 * self->S.xf;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  v8 = self->S.yf - (float)(v7 * self->S.yf);
  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)dictionaryPointWithBitmapPoint:(CGPoint)a3
{
  float v3;
  float v4;
  double v5;
  double v6;
  CGPoint result;

  v3 = a3.x + (float)self->ioffx;
  v4 = a3.y + (float)self->ioffy;
  v5 = (float)(self->S.xfi * v3);
  v6 = (float)(self->S.yfi * (float)(self->S.yf - v4));
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)dictionaryPointWithGlobalBitmapPoint:(CGPoint)a3
{
  float x;
  float y;
  double v5;
  double v6;
  CGPoint result;

  x = a3.x;
  y = a3.y;
  v5 = (float)(self->S.xfi * x);
  v6 = (float)((float)(self->S.yf - y) * self->S.yfi);
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)dictionaryPointArrayWithEyeBitmapPoint:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  CGFloat v5;
  float v6;
  float v7;
  double v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = 136;
  if (!self->S.side)
    v3 = 120;
  v4 = 144;
  if (!self->S.side)
    v4 = 128;
  v5 = a3.x + (float)(self->FC.FR.mincol + *(_DWORD *)((char *)&self->super.isa + v4));
  *(float *)&v5 = v5;
  v6 = a3.y + (float)(self->FC.FR.minrow + *(_DWORD *)((char *)&self->super.isa + v3));
  *(float *)&v5 = self->S.xfi * *(float *)&v5;
  v7 = self->S.yfi * (float)(self->S.yf - v6);
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  *(float *)&v8 = v7;
  v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
}

- (id)dictionaryPointArrayWithBitmapPoint:(CGPoint)a3
{
  CGFloat v3;
  float v4;
  float v5;
  double v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3.x + (float)self->FC.FR.mincol;
  *(float *)&v3 = v3;
  v4 = a3.y + (float)self->FC.FR.minrow;
  *(float *)&v3 = self->S.xfi * *(float *)&v3;
  v5 = self->S.yfi * (float)(self->S.yf - v4);
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  *(float *)&v6 = v5;
  v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
}

- (id)dictionaryPointArrayWithGlobalBitmapPoint:(CGPoint)a3
{
  float y;
  float v4;
  double v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  *(float *)&a3.x = a3.x;
  y = a3.y;
  *(float *)&a3.x = self->S.xfi * *(float *)&a3.x;
  v4 = (float)(self->S.yf - y) * self->S.yfi;
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3.x);
  *(float *)&v5 = v4;
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
}

- ($A3B2E143E1A03423F9FC703C010436DC)bitmapRectWithDictionaryRectArray:(id)a3
{
  float v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float v11;
  unint64_t BitmapRect;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  $A3B2E143E1A03423F9FC703C010436DC result;

  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  v6 = (uint64_t)rintf(v5 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  v8 = (uint64_t)rintf(v7 * self->S.yf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "floatValue");
  v10 = (uint64_t)rintf(v9 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "floatValue");
  BitmapRect = makeBitmapRect(v6, (int)(float)(self->S.ify - (float)(int)((uint64_t)rintf(v11 * self->S.yf) + v8)), (v10 + v6), (int)(float)(self->S.ify - (float)(int)v8));
  v14 = offsetBitmapRect(BitmapRect, v13, -self->ioffx, -self->ioffy);
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  return result;
}

- ($A3B2E143E1A03423F9FC703C010436DC)globalBitmapRectWithDictionaryRectArray:(id)a3
{
  float v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float v11;
  unint64_t BitmapRect;
  uint64_t v13;
  $A3B2E143E1A03423F9FC703C010436DC result;

  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  v6 = (uint64_t)rintf(v5 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  v8 = (uint64_t)rintf(v7 * self->S.yf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "floatValue");
  v10 = (uint64_t)rintf(v9 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "floatValue");
  BitmapRect = makeBitmapRect(v6, (int)(float)(self->S.ify - (float)(int)((uint64_t)rintf(v11 * self->S.yf) + v8)), (v10 + v6), (int)(float)(self->S.ify - (float)(int)v8));
  result.var2 = v13;
  result.var3 = HIDWORD(v13);
  result.var0 = BitmapRect;
  result.var1 = HIDWORD(BitmapRect);
  return result;
}

- (id)dictionaryRectArrayWithBitmapRect:(id)a3
{
  double v3;
  float xfi;
  float yfi;
  float v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  xfi = self->S.xfi;
  *(float *)&v3 = xfi * (float)(self->ioffx + a3.var2);
  yfi = self->S.yfi;
  v6 = yfi * (float)(int)(float)(self->S.ify - (float)(self->ioffy + a3.var1));
  v7 = xfi * (float)(a3.var3 - a3.var2);
  v8 = yfi * (float)(a3.var1 - a3.var0);
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  *(float *)&v9 = v6;
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  *(float *)&v10 = v7;
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  *(float *)&v11 = v8;
  v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
}

- (id)dictionaryRectArrayWithGlobalBitmapRect:(id)a3
{
  double v3;
  float xfi;
  float yfi;
  float v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  xfi = self->S.xfi;
  *(float *)&v3 = xfi * (float)a3.var2;
  yfi = self->S.yfi;
  v6 = yfi * (float)(int)(float)(self->S.ify - (float)a3.var1);
  v7 = xfi * (float)(a3.var3 - a3.var2);
  v8 = yfi * (float)(a3.var1 - a3.var0);
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  *(float *)&v9 = v6;
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  *(float *)&v10 = v7;
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  *(float *)&v11 = v8;
  v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
}

- (int)saveRepairDictionary:(id *)a3 withConvexHull:(id *)a4 facts:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  void *v74;
  int result;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[23];
  _QWORD v94[23];
  _QWORD v95[6];
  _QWORD v96[16];
  _QWORD v97[16];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[23];
  _QWORD v101[23];
  _QWORD v102[4];
  _QWORD v103[6];

  v103[4] = *MEMORY[0x1E0C80C00];
  -[CIRedEyeRepair3 centroidWithConvexHull:](self, "centroidWithConvexHull:", a4);
  v9 = -[CIRedEyeRepair3 dictionaryPointArrayWithEyeBitmapPoint:](self, "dictionaryPointArrayWithEyeBitmapPoint:");
  v10 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(_QWORD *)&self->FC.FR.minrow, *(_QWORD *)&self->FC.FR.mincol);
  if (!v10)
    return 8;
  v11 = v10;
  v12 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.leftEye.x, self->FC.leftEye.y);
  if (!v12)
    return 8;
  v13 = v12;
  v14 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.rightEye.x, self->FC.rightEye.y);
  if (!v14)
    return 8;
  v15 = v14;
  v16 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[0].x, self->FC.LPoly[0].y);
  if (!v16)
    return 8;
  v17 = v16;
  v18 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[1].x, self->FC.LPoly[1].y);
  if (!v18)
    return 8;
  v19 = v18;
  v20 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[2].x, self->FC.LPoly[2].y);
  if (!v20)
    return 8;
  v92 = v20;
  v21 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[3].x, self->FC.LPoly[3].y);
  if (!v21)
    return 8;
  v91 = v21;
  v22 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[4].x, self->FC.LPoly[4].y);
  if (!v22)
    return 8;
  v90 = v22;
  v23 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[5].x, self->FC.LPoly[5].y);
  if (!v23)
    return 8;
  v89 = v23;
  v24 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[6].x, self->FC.LPoly[6].y);
  if (!v24)
    return 8;
  v88 = v24;
  v25 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[7].x, self->FC.LPoly[7].y);
  if (!v25)
    return 8;
  v87 = v25;
  v26 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[0].x, self->FC.RPoly[0].y);
  if (!v26)
    return 8;
  v86 = v26;
  v27 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[1].x, self->FC.RPoly[1].y);
  if (!v27)
    return 8;
  v85 = v27;
  v28 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[2].x, self->FC.RPoly[2].y);
  if (!v28)
    return 8;
  v84 = v28;
  v29 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[3].x, self->FC.RPoly[3].y);
  if (!v29)
    return 8;
  v83 = v29;
  v30 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[4].x, self->FC.RPoly[4].y);
  if (!v30)
    return 8;
  v82 = v30;
  v31 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[5].x, self->FC.RPoly[5].y);
  if (!v31)
    return 8;
  v81 = v31;
  v32 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[6].x, self->FC.RPoly[6].y);
  if (!v32)
    return 8;
  v80 = v32;
  v79 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[7].x, self->FC.RPoly[7].y);
  if (!v79)
    return 8;
  v78 = -[CIRedEyeRepair3 dictionaryRectArrayWithBitmapRect:](self, "dictionaryRectArrayWithBitmapRect:", *(_QWORD *)&self->FC.LR.minrow, *(_QWORD *)&self->FC.LR.mincol);
  if (!v78)
    return 8;
  v77 = -[CIRedEyeRepair3 dictionaryRectArrayWithBitmapRect:](self, "dictionaryRectArrayWithBitmapRect:", *(_QWORD *)&self->FC.RR.minrow, *(_QWORD *)&self->FC.RR.mincol);
  if (!v77)
    return 8;
  *(float *)&v33 = self->FC.leftDistMatrix[0];
  v103[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
  *(float *)&v34 = self->FC.leftDistMatrix[1];
  v103[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  *(float *)&v35 = self->FC.leftDistMatrix[2];
  v103[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
  *(float *)&v36 = self->FC.leftDistMatrix[3];
  v103[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v76 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 4);
  if (!v76)
    return 8;
  *(float *)&v37 = self->FC.rightDistMatrix[0];
  v102[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  *(float *)&v38 = self->FC.rightDistMatrix[1];
  v102[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  *(float *)&v39 = self->FC.rightDistMatrix[2];
  v102[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
  *(float *)&v40 = self->FC.rightDistMatrix[3];
  v102[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 4);
  if (!v41)
    return 8;
  v100[0] = CFSTR("faceRect");
  v100[1] = CFSTR("leftEye");
  v101[0] = v11;
  v101[1] = v13;
  v100[2] = CFSTR("rightEye");
  v100[3] = CFSTR("leftPoly0");
  v101[2] = v15;
  v101[3] = v17;
  v100[4] = CFSTR("leftPoly1");
  v100[5] = CFSTR("leftPoly2");
  v101[4] = v19;
  v101[5] = v92;
  v100[6] = CFSTR("leftPoly3");
  v100[7] = CFSTR("leftPoly4");
  v101[6] = v91;
  v101[7] = v90;
  v100[8] = CFSTR("leftPoly5");
  v100[9] = CFSTR("leftPoly6");
  v101[8] = v89;
  v101[9] = v88;
  v100[10] = CFSTR("leftPoly7");
  v100[11] = CFSTR("rightPoly0");
  v101[10] = v87;
  v101[11] = v86;
  v100[12] = CFSTR("rightPoly1");
  v100[13] = CFSTR("rightPoly2");
  v101[12] = v85;
  v101[13] = v84;
  v100[14] = CFSTR("rightPoly3");
  v100[15] = CFSTR("rightPoly4");
  v101[14] = v83;
  v101[15] = v82;
  v100[16] = CFSTR("rightPoly5");
  v100[17] = CFSTR("rightPoly6");
  v101[16] = v81;
  v101[17] = v80;
  v100[18] = CFSTR("rightPoly7");
  v100[19] = CFSTR("leftRect");
  v101[18] = v79;
  v101[19] = v78;
  v100[20] = CFSTR("rightRect");
  v100[21] = CFSTR("leftDistMatrix");
  v101[20] = v77;
  v101[21] = v76;
  v100[22] = CFSTR("rightDistMatrix");
  v101[22] = v41;
  v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 23);
  if (!v42)
    return 8;
  v43 = v42;
  v44 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!v44)
    return 8;
  v45 = (void *)v44;
  if (a4->var1 >= 1)
  {
    v46 = 0;
    v47 = 0;
    do
    {
      objc_msgSend(v45, "addObject:", -[CIRedEyeRepair3 dictionaryPointArrayWithEyeBitmapPoint:](self, "dictionaryPointArrayWithEyeBitmapPoint:", a4->var3[v46].x, a4->var3[v46].y));
      ++v47;
      ++v46;
    }
    while (v47 < a4->var1);
  }
  v98[0] = CFSTR("counterClockwise");
  v99[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4->var0);
  v98[1] = CFSTR("nPoints");
  v99[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4->var1);
  v98[2] = CFSTR("maxPoints");
  v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4->var2);
  v98[3] = CFSTR("hullBody");
  v99[2] = v48;
  v99[3] = v45;
  v49 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
  if (!v49)
    return 8;
  v50 = v49;
  v96[0] = CFSTR("downsampleType");
  v97[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.downsampleType);
  v96[1] = CFSTR("downsampleOversizeX");
  *(float *)&v51 = self->S.downsampleOversizeX;
  v97[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
  v96[2] = CFSTR("downsampleOversizeY");
  *(float *)&v52 = self->S.downsampleOversizeY;
  v97[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
  v96[3] = CFSTR("gradientChannel");
  v97[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.gradientChannel);
  v96[4] = CFSTR("edgeFindingChannel");
  v97[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.edgeFindingChannel);
  v96[5] = CFSTR("minMagnitude");
  *(float *)&v53 = self->S.minMagnitude;
  v97[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v96[6] = CFSTR("regressionRadius");
  *(float *)&v54 = self->S.regressionRadius;
  v97[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
  v96[7] = CFSTR("capture");
  *(float *)&v55 = self->S.capture;
  v97[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v96[8] = CFSTR("alignmentTolerance");
  *(float *)&v56 = self->S.alignmentTolerance;
  v97[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
  v96[9] = CFSTR("connectThreshold");
  *(float *)&v57 = self->S.connectThreshold;
  v97[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
  v96[10] = CFSTR("faceIndex");
  v97[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.faceIndex);
  v96[11] = CFSTR("side");
  v97[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.side);
  v96[12] = CFSTR("scale");
  *(float *)&v58 = self->S.scale;
  v97[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
  v96[13] = CFSTR("IOD");
  *(float *)&v59 = self->S.IOD;
  v97[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
  v96[14] = CFSTR("transform");
  v95[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.a);
  v95[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.b);
  v95[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.c);
  v95[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.d);
  v95[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.tx);
  v95[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.ty);
  v97[14] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 6);
  v96[15] = CFSTR("height");
  v97[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.height);
  v60 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 16);
  if (!v60)
    return 8;
  v93[0] = CFSTR("context");
  v93[1] = CFSTR("convexHull");
  v94[0] = v43;
  v94[1] = v50;
  v94[2] = v60;
  v93[2] = CFSTR("settings");
  v93[3] = CFSTR("xf");
  *(float *)&v61 = self->S.xf;
  v94[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
  v93[4] = CFSTR("yf");
  *(float *)&v62 = self->S.yf;
  v94[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v62);
  v93[5] = CFSTR("ioffx");
  v94[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.ioffx);
  v93[6] = CFSTR("ioffy");
  v94[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.ioffy);
  v93[7] = CFSTR("px");
  v94[7] = objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v93[8] = CFSTR("py");
  v94[8] = objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v93[9] = CFSTR("pointX");
  v94[9] = objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v93[10] = CFSTR("pointY");
  v94[10] = objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v93[11] = CFSTR("skinval");
  *(float *)&v63 = self->M.skinval;
  v94[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
  v93[12] = CFSTR("avgLuminance");
  *(float *)&v64 = self->M.avgLuminance;
  v94[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
  v93[13] = CFSTR("minLuminance");
  *(float *)&v65 = self->M.minLuminance;
  v94[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
  v93[14] = CFSTR("maxLuminance");
  *(float *)&v66 = self->M.maxLuminance;
  v94[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v66);
  v93[15] = CFSTR("darkPercent");
  *(float *)&v67 = self->M.darkPercent;
  v94[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
  v93[16] = CFSTR("clipPercent");
  *(float *)&v68 = self->M.clipPercent;
  v94[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
  v93[17] = CFSTR("variance");
  v94[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->FS.variance);
  v93[18] = CFSTR("nNonZero");
  v94[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->FS.nNonZero);
  v93[19] = CFSTR("xPosition");
  *(float *)&v69 = a5->var6;
  v94[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
  v93[20] = CFSTR("hue");
  *(float *)&v70 = a5->var7;
  v94[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
  v93[21] = CFSTR("saturation");
  *(float *)&v71 = a5->var8;
  v94[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
  v93[22] = CFSTR("luminance");
  *(float *)&v72 = a5->var9;
  v94[22] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
  v73 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 23);
  if (!v73)
    return 8;
  v74 = (void *)v73;
  result = 0;
  *a3 = v74;
  return result;
}

- (int)packGlobalRepairDictionary:(id *)a3 withConvexHull:(id *)a4 facts:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  void *v74;
  int result;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[23];
  _QWORD v94[23];
  _QWORD v95[6];
  _QWORD v96[16];
  _QWORD v97[16];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[23];
  _QWORD v101[23];
  _QWORD v102[4];
  _QWORD v103[6];

  v103[4] = *MEMORY[0x1E0C80C00];
  -[CIRedEyeRepair3 centroidWithConvexHull:](self, "centroidWithConvexHull:", a4);
  v9 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:");
  v10 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(_QWORD *)&self->FC.FR.minrow, *(_QWORD *)&self->FC.FR.mincol);
  if (!v10)
    return 8;
  v11 = v10;
  v12 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.leftEye.x, self->FC.leftEye.y);
  if (!v12)
    return 8;
  v13 = v12;
  v14 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.rightEye.x, self->FC.rightEye.y);
  if (!v14)
    return 8;
  v15 = v14;
  v16 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[0].x, self->FC.LPoly[0].y);
  if (!v16)
    return 8;
  v17 = v16;
  v18 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[1].x, self->FC.LPoly[1].y);
  if (!v18)
    return 8;
  v19 = v18;
  v20 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[2].x, self->FC.LPoly[2].y);
  if (!v20)
    return 8;
  v92 = v20;
  v21 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[3].x, self->FC.LPoly[3].y);
  if (!v21)
    return 8;
  v91 = v21;
  v22 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[4].x, self->FC.LPoly[4].y);
  if (!v22)
    return 8;
  v90 = v22;
  v23 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[5].x, self->FC.LPoly[5].y);
  if (!v23)
    return 8;
  v89 = v23;
  v24 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[6].x, self->FC.LPoly[6].y);
  if (!v24)
    return 8;
  v88 = v24;
  v25 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[7].x, self->FC.LPoly[7].y);
  if (!v25)
    return 8;
  v87 = v25;
  v26 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[0].x, self->FC.RPoly[0].y);
  if (!v26)
    return 8;
  v86 = v26;
  v27 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[1].x, self->FC.RPoly[1].y);
  if (!v27)
    return 8;
  v85 = v27;
  v28 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[2].x, self->FC.RPoly[2].y);
  if (!v28)
    return 8;
  v84 = v28;
  v29 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[3].x, self->FC.RPoly[3].y);
  if (!v29)
    return 8;
  v83 = v29;
  v30 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[4].x, self->FC.RPoly[4].y);
  if (!v30)
    return 8;
  v82 = v30;
  v31 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[5].x, self->FC.RPoly[5].y);
  if (!v31)
    return 8;
  v81 = v31;
  v32 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[6].x, self->FC.RPoly[6].y);
  if (!v32)
    return 8;
  v80 = v32;
  v79 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[7].x, self->FC.RPoly[7].y);
  if (!v79)
    return 8;
  v78 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(_QWORD *)&self->FC.LR.minrow, *(_QWORD *)&self->FC.LR.mincol);
  if (!v78)
    return 8;
  v77 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(_QWORD *)&self->FC.RR.minrow, *(_QWORD *)&self->FC.RR.mincol);
  if (!v77)
    return 8;
  *(float *)&v33 = self->FC.leftDistMatrix[0];
  v103[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
  *(float *)&v34 = self->FC.leftDistMatrix[1];
  v103[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  *(float *)&v35 = self->FC.leftDistMatrix[2];
  v103[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
  *(float *)&v36 = self->FC.leftDistMatrix[3];
  v103[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v76 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 4);
  if (!v76)
    return 8;
  *(float *)&v37 = self->FC.rightDistMatrix[0];
  v102[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  *(float *)&v38 = self->FC.rightDistMatrix[1];
  v102[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  *(float *)&v39 = self->FC.rightDistMatrix[2];
  v102[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
  *(float *)&v40 = self->FC.rightDistMatrix[3];
  v102[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 4);
  if (!v41)
    return 8;
  v100[0] = CFSTR("faceRect");
  v100[1] = CFSTR("leftEye");
  v101[0] = v11;
  v101[1] = v13;
  v100[2] = CFSTR("rightEye");
  v100[3] = CFSTR("leftPoly0");
  v101[2] = v15;
  v101[3] = v17;
  v100[4] = CFSTR("leftPoly1");
  v100[5] = CFSTR("leftPoly2");
  v101[4] = v19;
  v101[5] = v92;
  v100[6] = CFSTR("leftPoly3");
  v100[7] = CFSTR("leftPoly4");
  v101[6] = v91;
  v101[7] = v90;
  v100[8] = CFSTR("leftPoly5");
  v100[9] = CFSTR("leftPoly6");
  v101[8] = v89;
  v101[9] = v88;
  v100[10] = CFSTR("leftPoly7");
  v100[11] = CFSTR("rightPoly0");
  v101[10] = v87;
  v101[11] = v86;
  v100[12] = CFSTR("rightPoly1");
  v100[13] = CFSTR("rightPoly2");
  v101[12] = v85;
  v101[13] = v84;
  v100[14] = CFSTR("rightPoly3");
  v100[15] = CFSTR("rightPoly4");
  v101[14] = v83;
  v101[15] = v82;
  v100[16] = CFSTR("rightPoly5");
  v100[17] = CFSTR("rightPoly6");
  v101[16] = v81;
  v101[17] = v80;
  v100[18] = CFSTR("rightPoly7");
  v100[19] = CFSTR("leftRect");
  v101[18] = v79;
  v101[19] = v78;
  v100[20] = CFSTR("rightRect");
  v100[21] = CFSTR("leftDistMatrix");
  v101[20] = v77;
  v101[21] = v76;
  v100[22] = CFSTR("rightDistMatrix");
  v101[22] = v41;
  v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 23);
  if (!v42)
    return 8;
  v43 = v42;
  v44 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!v44)
    return 8;
  v45 = (void *)v44;
  if (a4->var1 >= 1)
  {
    v46 = 0;
    v47 = 0;
    do
    {
      objc_msgSend(v45, "addObject:", -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", a4->var3[v46].x, a4->var3[v46].y));
      ++v47;
      ++v46;
    }
    while (v47 < a4->var1);
  }
  v98[0] = CFSTR("counterClockwise");
  v99[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4->var0);
  v98[1] = CFSTR("nPoints");
  v99[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4->var1);
  v98[2] = CFSTR("maxPoints");
  v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4->var2);
  v98[3] = CFSTR("hullBody");
  v99[2] = v48;
  v99[3] = v45;
  v49 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
  if (!v49)
    return 8;
  v50 = v49;
  v96[0] = CFSTR("downsampleType");
  v97[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.downsampleType);
  v96[1] = CFSTR("downsampleOversizeX");
  *(float *)&v51 = self->S.downsampleOversizeX;
  v97[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
  v96[2] = CFSTR("downsampleOversizeY");
  *(float *)&v52 = self->S.downsampleOversizeY;
  v97[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
  v96[3] = CFSTR("gradientChannel");
  v97[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.gradientChannel);
  v96[4] = CFSTR("edgeFindingChannel");
  v97[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.edgeFindingChannel);
  v96[5] = CFSTR("minMagnitude");
  *(float *)&v53 = self->S.minMagnitude;
  v97[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v96[6] = CFSTR("regressionRadius");
  *(float *)&v54 = self->S.regressionRadius;
  v97[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
  v96[7] = CFSTR("capture");
  *(float *)&v55 = self->S.capture;
  v97[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v96[8] = CFSTR("alignmentTolerance");
  *(float *)&v56 = self->S.alignmentTolerance;
  v97[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
  v96[9] = CFSTR("connectThreshold");
  *(float *)&v57 = self->S.connectThreshold;
  v97[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
  v96[10] = CFSTR("faceIndex");
  v97[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.faceIndex);
  v96[11] = CFSTR("side");
  v97[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.side);
  v96[12] = CFSTR("scale");
  *(float *)&v58 = self->S.scale;
  v97[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
  v96[13] = CFSTR("IOD");
  *(float *)&v59 = self->S.IOD;
  v97[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
  v96[14] = CFSTR("transform");
  v95[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.a);
  v95[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.b);
  v95[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.c);
  v95[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.d);
  v95[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.tx);
  v95[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->S.transform.ty);
  v97[14] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 6);
  v96[15] = CFSTR("height");
  v97[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.height);
  v60 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 16);
  if (!v60)
    return 8;
  v93[0] = CFSTR("context");
  v93[1] = CFSTR("convexHull");
  v94[0] = v43;
  v94[1] = v50;
  v94[2] = v60;
  v93[2] = CFSTR("settings");
  v93[3] = CFSTR("xf");
  *(float *)&v61 = self->S.xf;
  v94[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
  v93[4] = CFSTR("yf");
  *(float *)&v62 = self->S.yf;
  v94[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v62);
  v93[5] = CFSTR("ioffx");
  v94[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.ioffx);
  v93[6] = CFSTR("ioffy");
  v94[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->S.ioffy);
  v93[7] = CFSTR("px");
  v94[7] = objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v93[8] = CFSTR("py");
  v94[8] = objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v93[9] = CFSTR("pointX");
  v94[9] = objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v93[10] = CFSTR("pointY");
  v94[10] = objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v93[11] = CFSTR("skinval");
  *(float *)&v63 = self->M.skinval;
  v94[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
  v93[12] = CFSTR("avgLuminance");
  *(float *)&v64 = self->M.avgLuminance;
  v94[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
  v93[13] = CFSTR("minLuminance");
  *(float *)&v65 = self->M.minLuminance;
  v94[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
  v93[14] = CFSTR("maxLuminance");
  *(float *)&v66 = self->M.maxLuminance;
  v94[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v66);
  v93[15] = CFSTR("darkPercent");
  *(float *)&v67 = self->M.darkPercent;
  v94[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
  v93[16] = CFSTR("clipPercent");
  *(float *)&v68 = self->M.clipPercent;
  v94[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
  v93[17] = CFSTR("variance");
  v94[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->FS.variance);
  v93[18] = CFSTR("nNonZero");
  v94[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->FS.nNonZero);
  v93[19] = CFSTR("xPosition");
  *(float *)&v69 = a5->var6;
  v94[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
  v93[20] = CFSTR("hue");
  *(float *)&v70 = a5->var7;
  v94[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
  v93[21] = CFSTR("saturation");
  *(float *)&v71 = a5->var8;
  v94[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
  v93[22] = CFSTR("luminance");
  *(float *)&v72 = a5->var9;
  v94[22] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
  v73 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 23);
  if (!v73)
    return 8;
  v74 = (void *)v73;
  result = 0;
  *a3 = v74;
  return result;
}

- (BOOL)unpackToGlobalRepairDictionary:(id)a3 convexHull:(id *)a4 facts:(id *)a5
{
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  uint64_t v91;
  uint64_t v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  _BYTE *v101;
  _BYTE *v102;
  int v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  int v111;
  void *v113;
  float v114;
  void *v115;
  float v116;
  void *v117;
  int v118;
  void *v119;
  int v120;
  void *v121;
  float v122;
  void *v123;
  float v124;
  void *v125;
  float v126;
  void *v127;
  float v128;
  void *v129;
  float v130;
  void *v131;
  void *v132;
  void *v133;
  float v134;
  void *v135;
  float v136;
  void *v137;
  int v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;

  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("xf")), "floatValue");
  self->S.xf = v9;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("yf")), "floatValue");
  self->S.yf = v10;
  self->S.xfi = 1.0 / self->S.xf;
  self->S.yfi = 1.0 / v10;
  self->S.ify = (float)(int)rintf(v10);
  self->S.ioffx = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ioffx")), "intValue");
  self->S.ioffy = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ioffy")), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("skinval")), "floatValue");
  self->M.skinval = v11;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("avgLuminance")), "floatValue");
  self->M.avgLuminance = v12;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minLuminance")), "floatValue");
  self->M.minLuminance = v13;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxLuminance")), "floatValue");
  self->M.maxLuminance = v14;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("darkPercent")), "floatValue");
  self->M.darkPercent = v15;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("clipPercent")), "floatValue");
  self->M.clipPercent = v16;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("xPosition")), "floatValue");
  a5->var6 = v17;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("hue")), "floatValue");
  a5->var7 = v18;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("saturation")), "floatValue");
  a5->var8 = v19;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("luminance")), "floatValue");
  a5->var9 = v20;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("variance")), "doubleValue");
  self->FS.variance = v21;
  self->FS.nNonZero = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("nNonZero")), "intValue");
  v22 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("context"));
  if (!v22)
    goto LABEL_37;
  v23 = v22;
  v24 = objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("faceRect"));
  if (!v24)
    goto LABEL_37;
  v25 = v24;
  v26 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftEye"));
  if (!v26)
    goto LABEL_37;
  v27 = v26;
  v28 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightEye"));
  if (!v28)
    goto LABEL_37;
  v29 = v28;
  v30 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly0"));
  if (!v30)
    goto LABEL_37;
  v31 = v30;
  v32 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly1"));
  if (!v32)
    goto LABEL_37;
  v33 = v32;
  v34 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly2"));
  if (!v34)
    goto LABEL_37;
  v35 = v34;
  v36 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly3"));
  if (!v36)
    goto LABEL_37;
  v164 = v36;
  v37 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly4"));
  if (!v37)
    goto LABEL_37;
  v163 = v37;
  v38 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly5"));
  if (!v38)
    goto LABEL_37;
  v162 = v38;
  v39 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly6"));
  if (!v39)
    goto LABEL_37;
  v161 = v39;
  v40 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftPoly7"));
  if (!v40)
    goto LABEL_37;
  v160 = v40;
  v41 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly0"));
  if (!v41)
    goto LABEL_37;
  v159 = v41;
  v42 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly1"));
  if (!v42)
    goto LABEL_37;
  v158 = v42;
  v43 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly2"));
  if (!v43)
    goto LABEL_37;
  v157 = v43;
  v44 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly3"));
  if (!v44)
    goto LABEL_37;
  v156 = v44;
  v45 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly4"));
  if (!v45)
    goto LABEL_37;
  v155 = v45;
  v46 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly5"));
  if (!v46)
    goto LABEL_37;
  v153 = v46;
  v154 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly6"));
  if (!v154)
    goto LABEL_37;
  v47 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightPoly7"));
  if (!v47)
    goto LABEL_37;
  v151 = v35;
  v152 = v47;
  v48 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftRect"));
  if (!v48)
    goto LABEL_37;
  v49 = v48;
  v150 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightRect"));
  if (!v150)
    goto LABEL_37;
  v149 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("leftDistMatrix"));
  if (!v149)
    goto LABEL_37;
  v147 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rightDistMatrix"));
  if (!v147)
    goto LABEL_37;
  v50 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("convexHull"));
  if (!v50)
    goto LABEL_37;
  v51 = v50;
  v148 = (void *)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("hullBody"));
  if (!v148)
    goto LABEL_37;
  v52 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("settings"));
  v53 = v52;
  if (!v52)
    return (char)v53;
  v145 = objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("transform"));
  if (!v145)
    goto LABEL_37;
  *(_QWORD *)&self->FC.FR.minrow = -[CIRedEyeRepair3 globalBitmapRectWithDictionaryRectArray:](self, "globalBitmapRectWithDictionaryRectArray:", v25);
  *(_QWORD *)&self->FC.FR.mincol = v54;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v27);
  self->FC.leftEye.x = v55;
  self->FC.leftEye.y = v56;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v29);
  self->FC.rightEye.x = v57;
  self->FC.rightEye.y = v58;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v31);
  self->FC.LPoly[0].x = v59;
  self->FC.LPoly[0].y = v60;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v33);
  self->FC.LPoly[1].x = v61;
  self->FC.LPoly[1].y = v62;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v151);
  self->FC.LPoly[2].x = v63;
  self->FC.LPoly[2].y = v64;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v164);
  self->FC.LPoly[3].x = v65;
  self->FC.LPoly[3].y = v66;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v163);
  self->FC.LPoly[4].x = v67;
  self->FC.LPoly[4].y = v68;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v162);
  self->FC.LPoly[5].x = v69;
  self->FC.LPoly[5].y = v70;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v161);
  self->FC.LPoly[6].x = v71;
  self->FC.LPoly[6].y = v72;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v160);
  self->FC.LPoly[7].x = v73;
  self->FC.LPoly[7].y = v74;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v159);
  self->FC.RPoly[0].x = v75;
  self->FC.RPoly[0].y = v76;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v158);
  self->FC.RPoly[1].x = v77;
  self->FC.RPoly[1].y = v78;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v157);
  self->FC.RPoly[2].x = v79;
  self->FC.RPoly[2].y = v80;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v156);
  self->FC.RPoly[3].x = v81;
  self->FC.RPoly[3].y = v82;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v155);
  self->FC.RPoly[4].x = v83;
  self->FC.RPoly[4].y = v84;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v153);
  self->FC.RPoly[5].x = v85;
  self->FC.RPoly[5].y = v86;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v154);
  self->FC.RPoly[6].x = v87;
  self->FC.RPoly[6].y = v88;
  -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", v152);
  self->FC.RPoly[7].x = v89;
  self->FC.RPoly[7].y = v90;
  *(_QWORD *)&self->FC.LR.minrow = -[CIRedEyeRepair3 globalBitmapRectWithDictionaryRectArray:](self, "globalBitmapRectWithDictionaryRectArray:", v49);
  *(_QWORD *)&self->FC.LR.mincol = v91;
  *(_QWORD *)&self->FC.RR.minrow = -[CIRedEyeRepair3 globalBitmapRectWithDictionaryRectArray:](self, "globalBitmapRectWithDictionaryRectArray:", v150);
  *(_QWORD *)&self->FC.RR.mincol = v92;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 0), "floatValue");
  self->FC.leftDistMatrix[0] = v93;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 1), "floatValue");
  self->FC.leftDistMatrix[1] = v94;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 2), "floatValue");
  self->FC.leftDistMatrix[2] = v95;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 3), "floatValue");
  self->FC.leftDistMatrix[3] = v96;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 0), "floatValue");
  self->FC.rightDistMatrix[0] = v97;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 1), "floatValue");
  self->FC.rightDistMatrix[1] = v98;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 2), "floatValue");
  self->FC.rightDistMatrix[2] = v99;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 3), "floatValue");
  self->FC.rightDistMatrix[3] = v100;
  self->S.ioffx = self->FC.FR.mincol;
  self->S.ioffy = self->FC.FR.minrow;
  v101 = malloc_type_malloc(0x18uLL, 0x10200409093602BuLL);
  if (!v101)
  {
LABEL_37:
    LOBYTE(v53) = 0;
    return (char)v53;
  }
  v102 = v101;
  *v101 = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("counterClockwise")), "BOOLValue");
  *((_DWORD *)v102 + 1) = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("nPoints")), "intValue");
  v103 = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("maxPoints")), "intValue");
  *((_DWORD *)v102 + 2) = v103;
  v104 = malloc_type_malloc(16 * v103, 0x1000040451B5BE8uLL);
  *((_QWORD *)v102 + 2) = v104;
  if (!v104)
  {
    free(v102);
    goto LABEL_37;
  }
  bzero(v104, 16 * *((int *)v102 + 2));
  if (*((int *)v102 + 1) >= 1)
  {
    v105 = 0;
    v106 = 0;
    do
    {
      v107 = (_QWORD *)(*((_QWORD *)v102 + 2) + v105);
      -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", objc_msgSend(v148, "objectAtIndexedSubscript:", v106, v145));
      *v107 = v108;
      v107[1] = v109;
      ++v106;
      v105 += 16;
    }
    while (v106 < *((int *)v102 + 1));
  }
  v110 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("downsampleType"), v145);
  if (v110)
    v111 = objc_msgSend(v110, "intValue");
  else
    v111 = 1;
  self->S.downsampleType = v111;
  v113 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("downsampleOversizeX"));
  if (v113)
    objc_msgSend(v113, "floatValue");
  else
    v114 = 1.3;
  self->S.downsampleOversizeX = v114;
  v115 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("downsampleOversizeY"));
  if (v115)
    objc_msgSend(v115, "floatValue");
  else
    v116 = 1.8;
  self->S.downsampleOversizeY = v116;
  v117 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("gradientChannel"));
  if (v117)
    v118 = objc_msgSend(v117, "intValue");
  else
    v118 = 6;
  self->S.gradientChannel = v118;
  v119 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("edgeFindingChannel"));
  if (v119)
    v120 = objc_msgSend(v119, "intValue");
  else
    v120 = 6;
  self->S.edgeFindingChannel = v120;
  v121 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("minMagnitude"));
  if (v121)
    objc_msgSend(v121, "floatValue");
  else
    v122 = 0.1;
  self->S.minMagnitude = v122;
  v123 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("regressionRadius"));
  if (v123)
    objc_msgSend(v123, "floatValue");
  else
    v124 = 2.5;
  self->S.regressionRadius = v124;
  v125 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("capture"));
  if (v125)
    objc_msgSend(v125, "floatValue");
  else
    v126 = 3.14;
  self->S.capture = v126;
  v127 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("alignmentTolerance"));
  if (v127)
    objc_msgSend(v127, "floatValue");
  else
    v128 = 0.72;
  self->S.alignmentTolerance = v128;
  v129 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("connectThreshold"));
  if (v129)
    objc_msgSend(v129, "floatValue");
  else
    v130 = 7.0;
  self->S.connectThreshold = v130;
  v131 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("faceIndex"));
  if (v131)
    LODWORD(v131) = objc_msgSend(v131, "intValue");
  self->S.faceIndex = (int)v131;
  v132 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("side"));
  if (v132)
    LODWORD(v132) = objc_msgSend(v132, "intValue");
  self->S.side = (int)v132;
  v133 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("scale"));
  if (v133)
    objc_msgSend(v133, "floatValue");
  else
    v134 = 1.0;
  self->S.scale = v134;
  v135 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("IOD"));
  if (v135)
    objc_msgSend(v135, "floatValue");
  else
    v136 = 100.0;
  self->S.IOD = v136;
  v137 = (void *)objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("height"));
  if (v137)
    v138 = objc_msgSend(v137, "intValue");
  else
    v138 = 3024;
  self->S.height = v138;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 0), "floatValue");
  self->S.transform.a = v139;
  LOBYTE(v53) = 1;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 1), "floatValue");
  self->S.transform.b = v140;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 2), "floatValue");
  self->S.transform.c = v141;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 3), "floatValue");
  self->S.transform.d = v142;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 4), "floatValue");
  self->S.transform.tx = v143;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 5), "floatValue");
  self->S.transform.ty = v144;
  *a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v102;
  return (char)v53;
}

- (BOOL)openRepairDictionary:(id)a3 convexHull:(id *)a4 facts:(id *)a5
{
  _BOOL4 v7;
  int32x4_t v8;
  uint64_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  CGPoint *v16;
  CGPoint *v17;
  $2B11B063D4FF7ECB26AB90748407DBDB LR;
  $2B11B063D4FF7ECB26AB90748407DBDB RR;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  uint64_t v21;
  int mincol;
  int side;
  double v24;
  int minrow;
  double *v26;
  double v27;
  uint64_t v29;
  float64x2x2_t v30;
  float64x2x2_t v31;
  float64x2x2_t v32;

  v29 = 0;
  v7 = -[CIRedEyeRepair3 unpackToGlobalRepairDictionary:convexHull:facts:](self, "unpackToGlobalRepairDictionary:convexHull:facts:", a3, &v29, a5);
  if (v7)
  {
    v9 = 0;
    v8.i64[0] = *(_QWORD *)&self->S.ioffx;
    v10 = vrev64q_s32(v8);
    v11 = vzip1q_s32(v10, v10);
    v12.i64[0] = v8.i32[0];
    v12.i64[1] = v8.i32[1];
    v13 = vcvtq_f64_s64(v12);
    self->FC.leftEye = (CGPoint)vsubq_f64((float64x2_t)self->FC.leftEye, v13);
    self->FC.rightEye = (CGPoint)vsubq_f64((float64x2_t)self->FC.rightEye, v13);
    v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v13.f64[0], 0);
    v15 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v13, 1);
    do
    {
      v16 = &self->FC.LPoly[v9];
      v30 = vld2q_f64(&v16->x);
      v32.val[0] = vsubq_f64(v30.val[0], v14);
      v32.val[1] = vsubq_f64(v30.val[1], v15);
      vst2q_f64(&v16->x, v32);
      v17 = &self->FC.RPoly[v9];
      v31 = vld2q_f64(&v17->x);
      v32.val[0] = vsubq_f64(v31.val[0], v14);
      v32.val[1] = vsubq_f64(v31.val[1], v15);
      vst2q_f64(&v17->x, v32);
      v9 += 2;
    }
    while (v9 != 8);
    LR = self->FC.LR;
    self->FC.LR = ($2B11B063D4FF7ECB26AB90748407DBDB)vsubq_s32((int32x4_t)LR, v11);
    RR = self->FC.RR;
    self->FC.RR = ($2B11B063D4FF7ECB26AB90748407DBDB)vsubq_s32((int32x4_t)RR, v11);
    v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v29;
    v21 = *(unsigned int *)(v29 + 4);
    if ((int)v21 >= 1)
    {
      mincol = LR.mincol;
      side = self->S.side;
      if (side)
        mincol = RR.mincol;
      v24 = (double)mincol;
      minrow = LR.minrow;
      if (side)
        minrow = RR.minrow;
      v26 = (double *)(*(_QWORD *)(v29 + 16) + 8);
      do
      {
        v27 = *v26 - (double)minrow;
        *(v26 - 1) = *(v26 - 1) - v24;
        *v26 = v27;
        v26 += 2;
        --v21;
      }
      while (v21);
    }
    *a4 = v20;
  }
  return v7;
}

- (CIRedEyeRepair3)initWithExternalBuffer:(char *)a3 subRectangle:(CGRect)a4 rowBytes:(unint64_t)a5 options:(id)a6
{
  int v7;
  double height;
  double width;
  double y;
  double x;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;
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
  uint64_t v34;

  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  self->repairMap.baseAddress = 0;
  self->faceBitmap.baseAddress = 0;
  self->repairs = 0;
  +[CIRedEyeRepair3 settingsWithOptions:](CIRedEyeRepair3, "settingsWithOptions:", a6);
  v14 = v32;
  *(_OWORD *)&self->S.transform.a = v31;
  *(_OWORD *)&self->S.transform.c = v14;
  *(_OWORD *)&self->S.transform.tx = v33;
  *(_QWORD *)&self->S.height = v34;
  v15 = v28;
  *(_OWORD *)&self->S.connectThreshold = v27;
  *(_OWORD *)&self->S.inputImageExtent.origin.y = v15;
  v16 = v30;
  *(_OWORD *)&self->S.inputImageExtent.size.height = v29;
  *(_OWORD *)&self->S.faceIndex = v16;
  v17 = v24;
  *(_OWORD *)&self->S.xf = v23;
  *(_OWORD *)&self->S.ify = v17;
  v18 = v26;
  *(_OWORD *)&self->S.downsampleOversizeX = v25;
  *(_OWORD *)&self->S.minMagnitude = v18;
  self->repairs = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = +[CIRedEyeRepair3 bitmapRectWithImageSubRectangle:settings:](CIRedEyeRepair3, "bitmapRectWithImageSubRectangle:settings:", &self->S, x, y, width, height);
  *(_QWORD *)&self->subRectangle.minrow = v19;
  *(_QWORD *)&self->subRectangle.mincol = v20;
  constructBitmap((uint64_t)&self->fullBitmap, (uint64_t)a3, HIDWORD(v20) - v20, HIDWORD(v19) - v19, 4, 1, v7, 100.0);
  if (objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("inspector")))
    -[CIRedEyeRepair3 setInspector:](self, "setInspector:", objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("inspector")));
  v22.receiver = self;
  v22.super_class = (Class)CIRedEyeRepair3;
  return -[CIRedEyeRepair3 init](&v22, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  if (self->faceBitmap.baseAddress)
    termBitmap((void **)&self->faceBitmap.baseAddress);
  if (self->repairMap.baseAddress)
    termBitmap((void **)&self->repairMap.baseAddress);

  self->repairs = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIRedEyeRepair3;
  -[CIRedEyeRepair3 dealloc](&v3, sel_dealloc);
}

+ (CGRect)supportRectangleWithRepair:(id)a3 imageSize:(CGSize)a4
{
  float width;
  float height;
  void *v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  width = a4.width;
  height = a4.height;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("context")), "objectForKeyedSubscript:", CFSTR("faceRect"));
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "floatValue");
  v8 = rintf(v7 * width);
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 1), "floatValue");
  v10 = rintf(v9 * height);
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 2), "floatValue");
  v12 = rintf(v11 * width);
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 3), "floatValue");
  v14 = rintf(v13 * height);
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (CGRect)supportRectangleWithFaceArray:(id)a3 options:(id)a4
{
  int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[23];
  uint64_t v20;
  CGRect result;

  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v18 = 0;
  +[CIRedEyeRepair3 settingsWithOptions:](CIRedEyeRepair3, "settingsWithOptions:", a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0);
  v5 = objc_msgSend(a3, "count");
  v6 = v5;
  if (!v5)
  {
LABEL_10:
    v12 = *MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_13;
  }
  if (v5 >= 1)
  {
    v7 = 0;
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    v10 = 0;
    while (1)
    {
      LODWORD(v17) = v10;
      if (+[CIRedEyeRepair3 faceContext:withFaceArray:index:settings:](CIRedEyeRepair3, "faceContext:withFaceArray:index:settings:", v19, a3, v10, &v16))
      {
        goto LABEL_10;
      }
      if ((_DWORD)v10)
      {
        v9 = unionBitmapRects(v9 | ((unint64_t)v8 << 32), v7, *(uint64_t *)&v19[0]);
        v7 = v11;
      }
      else
      {
        v7 = *((_QWORD *)&v19[0] + 1);
        v9 = *(_QWORD *)&v19[0];
      }
      v8 = HIDWORD(v9);
      v10 = (v10 + 1);
      if (v6 == (_DWORD)v10)
        goto LABEL_12;
    }
  }
  LODWORD(v9) = 0;
  LODWORD(v8) = 0;
  v7 = 0;
LABEL_12:
  v12 = (double)(int)v7;
  v13 = (double)((int)v18 - (int)v8);
  v14 = (double)(HIDWORD(v7) - (int)v7);
  v15 = (double)((int)v8 - (int)v9);
LABEL_13:
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGAffineTransform)inverseImageTransformForOrientation:(SEL)a3
{
  float xf;
  float yf;
  int v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v11;
  _QWORD v12[11];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  double v23;
  __int128 v24;
  __int128 v25;
  double v26;
  double v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  double v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  xf = self->S.xf;
  if (a4 <= 4)
    yf = self->S.xf;
  else
    yf = self->S.yf;
  if (a4 <= 4)
    xf = self->S.yf;
  v12[0] = 0x3FF0000000000000;
  v12[1] = 0;
  v12[2] = 0;
  v12[3] = 0x3FF0000000000000;
  v12[4] = 0;
  v12[5] = 0;
  v12[6] = 0xBFF0000000000000;
  v12[7] = 0;
  v12[8] = 0;
  v12[9] = 0x3FF0000000000000;
  *(double *)&v12[10] = yf;
  v13 = xmmword_1924948E0;
  v14 = 0;
  v15 = 0;
  v16 = 0xBFF0000000000000;
  v17 = yf;
  v18 = xf;
  v20 = 0;
  v21 = 0;
  v19 = 0x3FF0000000000000;
  v22 = xmmword_192493540;
  v24 = xmmword_1924948E0;
  v25 = xmmword_192493540;
  v23 = xf;
  v26 = xf;
  v27 = yf;
  v28 = xmmword_1924948E0;
  v30 = 0;
  v31 = 0;
  v29 = 0x3FF0000000000000;
  v32 = yf;
  v33 = xmmword_1924948F0;
  v36 = 0u;
  v35 = 0u;
  v34 = 0x3FF0000000000000;
  v37 = 0x3FF0000000000000;
  v38 = xmmword_192493540;
  v39 = xf;
  v40 = 0;
  if ((a4 - 9) >= 0xFFFFFFF8)
    v6 = a4 - 1;
  else
    v6 = 0;
  v7 = (__int128 *)&v12[6 * v6];
  v8 = v7[2];
  v9 = *v7;
  *(_OWORD *)&v11.c = v7[1];
  *(_OWORD *)&v11.tx = v8;
  *(_OWORD *)&v11.a = v9;
  return CGAffineTransformInvert(retstr, &v11);
}

- (void)printFaceArray
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  uint8_t buf[4];
  char *v73;
  char __str[256];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->faceArray, "count");
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = v3;
    do
    {
      v6 = -[NSArray objectAtIndexedSubscript:](self->faceArray, "objectAtIndexedSubscript:", v4);
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyeX")), "floatValue");
      v8 = v7;
      v9 = v7;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyeY")), "floatValue");
      v11 = v10;
      v12 = v10;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyeX")), "floatValue");
      v14 = v13;
      v15 = v13;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyeY")), "floatValue");
      v17 = v16;
      v18 = v16;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mouthCenterX")), "floatValue");
      v70 = v19;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mouthCenterY")), "floatValue");
      v68 = v20;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("centerX")), "floatValue");
      v66 = v21;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("centerY")), "floatValue");
      v64 = v22;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("noseBridgeX")), "floatValue");
      v71 = v23;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("noseBridgeY")), "floatValue");
      v69 = v24;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("noseTipX")), "floatValue");
      v67 = v25;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("noseTipY")), "floatValue");
      v65 = v26;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyeLeftX")), "floatValue");
      v63 = v27;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyeLeftY")), "floatValue");
      v62 = v28;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyelidUpperX")), "floatValue");
      v61 = v29;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyelidUpperY")), "floatValue");
      v60 = v30;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyeRightX")), "floatValue");
      v58 = v31;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyeRightY")), "floatValue");
      v56 = v32;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyelidLowerX")), "floatValue");
      v54 = v33;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftEyelidLowerY")), "floatValue");
      v52 = v34;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyeLeftX")), "floatValue");
      v59 = v35;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyeLeftY")), "floatValue");
      v57 = v36;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyelidUpperX")), "floatValue");
      v55 = v37;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyelidUpperY")), "floatValue");
      v53 = v38;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyeRightX")), "floatValue");
      v51 = v39;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyeRightY")), "floatValue");
      v50 = v40;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyelidLowerX")), "floatValue");
      v49 = v41;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightEyelidLowerY")), "floatValue");
      v48 = v42;
      snprintf(__str, 0x100uLL, "face %d   left (%.1f, %.1f) right (%.1f, %.1f) IOD %.1f", ++v4, v9, v12, v15, v18, sqrtf((float)((float)(v17 - v11) * (float)(v17 - v11)) + (float)((float)(v14 - v8) * (float)(v14 - v8))));
      v43 = ci_logger_render();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v73 = __str;
        _os_log_debug_impl(&dword_1921E4000, v43, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
      }
      if (self->printFaceArrayLevel >= 2)
      {
        snprintf(__str, 0x100uLL, "face %d   mouth (%.1f, %.1f) center (%.1f, %.1f)", v4, v70, v68, v66, v64);
        v44 = ci_logger_render();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v73 = __str;
          _os_log_debug_impl(&dword_1921E4000, v44, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
        }
        snprintf(__str, 0x100uLL, "face %d   nose bridge (%.1f, %.1f) tip (%.1f, %.1f)", v4, v71, v69, v67, v65);
        v45 = ci_logger_render();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v73 = __str;
          _os_log_debug_impl(&dword_1921E4000, v45, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
        }
        if (self->printFaceArrayLevel >= 3)
        {
          snprintf(__str, 0x100uLL, "face %d   left eye l (%.1f, %.1f) u (%.1f, %.1f) r (%.1f, %.1f) d (%.1f, %.1f)", v4, v63, v62, v61, v60, v58, v56, v54, v52);
          v46 = ci_logger_render();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v73 = __str;
            _os_log_debug_impl(&dword_1921E4000, v46, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
          }
          snprintf(__str, 0x100uLL, "face %d   right eye l (%.1f, %.1f) u (%.1f, %.1f) r (%.1f, %.1f) d (%.1f, %.1f)", v4, v59, v57, v55, v53, v51, v50, v49, v48);
          v47 = ci_logger_render();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v73 = __str;
            _os_log_debug_impl(&dword_1921E4000, v47, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
          }
        }
      }
    }
    while (v5 != v4);
  }
}

- (void)autoRepairWithFaceArray:(id)a3
{
  int v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *failureCauses;
  id v9;
  unint64_t v10;
  uint64_t v11;
  RedEyeInspector3 *inspector;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  RedEyeInspector3 *v31;
  NSMutableArray *v32;
  id v33;
  NSMutableArray *repairs;
  double v35;
  RedEyeInspector3 *v36;
  const char *v37;
  double v38;
  RedEyeInspector3 *v39;
  const char *v40;
  NSMutableArray *v41;
  id v42;
  NSMutableArray *v43;
  $E8834F51CE79BF204CBF6D92B5F806C1 *p_S;
  _OWORD v45[3];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  self->faceArray = (NSArray *)a3;
  v4 = objc_msgSend(a3, "count");
  if (self->printFaceArrayLevel >= 1)
    -[CIRedEyeRepair3 printFaceArray](self, "printFaceArray");

  v5 = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  self->failureCauses = v5;
  if (v4)
  {
    if (v4 >= 1)
    {
      v6 = 0;
      p_S = &self->S;
      while (1)
      {
        self->S.faceIndex = v6;
        v7 = -[CIRedEyeRepair3 updateWithFaceIndex:](self, "updateWithFaceIndex:", v6);
        if ((_DWORD)v7)
          break;
        if (self->S.IOD < 54.0)
        {
          failureCauses = self->failureCauses;
          v9 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("red-eye correction was prevented: (face %d) features too small to resolve properly"), (v6 + 1));
          goto LABEL_10;
        }
        initBitmap((uint64_t)&self->faceBitmap, self->FC.FR.maxcol - self->FC.FR.mincol, self->FC.FR.maxrow - self->FC.FR.minrow, 4, 1, 100.0);
        if (self->faceBitmap.baseAddress)
        {
          v10 = offsetBitmapRect(*(_QWORD *)&self->FC.FR.minrow, *(_QWORD *)&self->FC.FR.mincol, -self->subRectangle.mincol, -self->subRectangle.minrow);
          copySliceOfBitmapToBitmap((int *)&self->fullBitmap, &self->faceBitmap.baseAddress, v10, v11);
          -[CIRedEyeRepair3 gatherFaceStatistics:](self, "gatherFaceStatistics:", &self->M);
          inspector = self->inspector;
          if (inspector)
            -[RedEyeInspector3 getFaceStatistics:](inspector, "getFaceStatistics:", &self->M);
          *(_QWORD *)&v45[0] = 0;
          v46 = 0;
          v13 = -[CIRedEyeRepair3 repairDictionary:withEyeIndex:](self, "repairDictionary:withEyeIndex:", v45, 0);
          v14 = -[CIRedEyeRepair3 repairDictionary:withEyeIndex:](self, "repairDictionary:withEyeIndex:", &v46, 1);
          v15 = 0.0;
          v16 = 0.0;
          v17 = 0.0;
          v18 = 0.0;
          v19 = 0.0;
          if (!(_DWORD)v13)
          {
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", CFSTR("xPosition")), "floatValue");
            v16 = v20;
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", CFSTR("hue")), "floatValue");
            v17 = v21;
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", CFSTR("saturation")), "floatValue");
            v18 = v22;
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", CFSTR("luminance")), "floatValue");
            v19 = v23;
          }
          v24 = 0.0;
          v25 = 0.0;
          v26 = 0.0;
          if (!(_DWORD)v14)
          {
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("xPosition")), "floatValue");
            v15 = v27;
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("hue")), "floatValue");
            v24 = v28;
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("saturation")), "floatValue");
            v25 = v29;
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("luminance")), "floatValue");
            v26 = v30;
          }
          v31 = self->inspector;
          if (!v31)
            goto LABEL_26;
          -[RedEyeInspector3 getIdentifyingString:settings:](v31, "getIdentifyingString:settings:", &v47, p_S);
          if ((_DWORD)v13 && (_DWORD)v14)
            goto LABEL_29;
          printf("%s ", (const char *)&v47);
          if ((_DWORD)v13)
          {
            if ((_DWORD)v14)
              goto LABEL_25;
LABEL_64:
            printf("R[xp %.3f hue %.3f sat %.3f lum %.1f] ", v15, v24, v25, v26);
          }
          else
          {
            printf("L[xp %.3f hue %.3f sat %.3f lum %.1f] ", v16, v17, v18, v19);
            if (!(_DWORD)v14)
              goto LABEL_64;
          }
LABEL_25:
          putchar(10);
LABEL_26:
          if (!(_DWORD)v13)
          {
            v35 = v17;
            if (v17 <= 0.384 || v35 >= 0.426 || v18 >= 0.3 || v18 <= 0.118 || v19 <= 100.0 || fabsf(v16) <= 0.075)
            {
              v13 = 0;
              if (v17 >= 0.75)
                goto LABEL_27;
              if (v35 <= 0.64)
                goto LABEL_27;
              if (v19 <= 190.0)
                goto LABEL_27;
              v36 = self->inspector;
              v13 = 61;
              if (!v36)
                goto LABEL_27;
              v37 = "%s (L) prevent shine repair\n";
            }
            else
            {
              v36 = self->inspector;
              v13 = 60;
              if (!v36)
                goto LABEL_27;
              v37 = "%s (L) prevent sclera repair\n";
            }
            -[RedEyeInspector3 getIdentifyingString:settings:](v36, "getIdentifyingString:settings:", &v47, p_S);
            printf(v37, &v47);
          }
LABEL_27:
          if (!(_DWORD)v14)
          {
            v38 = v24;
            if (v24 <= 0.384 || v38 >= 0.426 || v25 >= 0.3 || v25 <= 0.118 || v26 <= 100.0 || fabsf(v15) <= 0.075)
            {
              v14 = 0;
              if (v24 >= 0.75)
                goto LABEL_28;
              if (v38 <= 0.64)
                goto LABEL_28;
              if (v26 <= 190.0)
                goto LABEL_28;
              v39 = self->inspector;
              v14 = 61;
              if (!v39)
                goto LABEL_28;
              v40 = "%s (R) prevent shine repair\n";
            }
            else
            {
              v39 = self->inspector;
              v14 = 60;
              if (!v39)
                goto LABEL_28;
              v40 = "%s (R) prevent sclera repair\n";
            }
            -[RedEyeInspector3 getIdentifyingString:settings:](v39, "getIdentifyingString:settings:", &v47, p_S);
            printf(v40, &v47);
          }
LABEL_28:
          if ((_DWORD)v13)
          {
LABEL_29:
            v32 = self->failureCauses;
            v33 = -[CIRedEyeRepair3 stringWithRER3Error:](self, "stringWithRER3Error:", v13);
            repairs = v32;
          }
          else
          {
            repairs = self->repairs;
            v33 = *(id *)&v45[0];
          }
          -[NSMutableArray addObject:](repairs, "addObject:", v33);
          if ((_DWORD)v14)
          {
            v41 = self->failureCauses;
            v42 = -[CIRedEyeRepair3 stringWithRER3Error:](self, "stringWithRER3Error:", v14);
            v43 = v41;
          }
          else
          {
            v43 = self->repairs;
            v42 = v46;
          }
          -[NSMutableArray addObject:](v43, "addObject:", v42);
          termBitmap((void **)&self->faceBitmap.baseAddress);
          self->faceBitmap.baseAddress = 0;
        }
LABEL_11:
        v6 = (v6 + 1);
        if (v4 == (_DWORD)v6)
          goto LABEL_66;
      }
      failureCauses = self->failureCauses;
      v9 = -[CIRedEyeRepair3 stringWithRER3Error:](self, "stringWithRER3Error:", v7);
LABEL_10:
      -[NSMutableArray addObject:](failureCauses, "addObject:", v9);
      goto LABEL_11;
    }
  }
  else
  {
    -[NSMutableArray addObject:](v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("red-eye correction was prevented: no face detected")));
    if (!self->S.forceFail)
      return;
  }
LABEL_66:
  if (self->S.orientation != 1)
  {
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    -[CIRedEyeRepair3 inverseImageTransformForOrientation:](self, "inverseImageTransformForOrientation:");
    v45[0] = v47;
    v45[1] = v48;
    v45[2] = v49;
    -[CIRedEyeRepair3 transformRepairArray:](self, "transformRepairArray:", v45);
  }
}

- (id)repairWithSide:(int)a3
{
  NSMutableArray *repairs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  repairs = self->repairs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](repairs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v16;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v8)
      objc_enumerationMutation(repairs);
    v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
    v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rf")), "intValue");
    v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("re")), "intValue");
    if (v11 == self->S.faceIndex && v12 == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](repairs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)mutableCopyOfArray:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v6;
  id v7;
  char v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = 0;
    v3 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v7);
    if (v3)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 1, 0, &v7);
      if (v4)
        return v4;
    }
    v6 = (void *)objc_msgSend(v7, "localizedDescription");
    objc_msgSend(v6, "getCString:maxLength:encoding:", v8, 128, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
    printf("mutableCopyOfArray: %s\n", v8);
  }
  return 0;
}

- (CGPoint)leftHandedTransform:(CGAffineTransform *)a3 ofPoint:(CGPoint)a4
{
  double d;
  float yf;
  float xf;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  CGPoint result;

  if (a3->a != 0.0)
  {
    d = a3->d;
    goto LABEL_5;
  }
  d = a3->d;
  if (d != 0.0)
  {
LABEL_5:
    yf = self->S.yf;
    xf = yf;
    goto LABEL_6;
  }
  yf = self->S.yf;
  xf = self->S.xf;
LABEL_6:
  v7 = yf - a4.y;
  v8 = a3->tx + v7 * a3->c + a3->a * a4.x;
  v9 = xf - (a3->ty + v7 * d + a3->b * a4.x);
  v10 = v8;
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)transformGlobalsWithTransform:(CGAffineTransform *)a3
{
  double mincol;
  double minrow;
  double maxcol;
  double maxrow;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  float v15;
  double v16;
  double v17;
  __int128 v18;
  CGFloat v19;
  CGFloat v20;
  __int128 v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t i;
  char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  float v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  float v55;
  double v56;
  double v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  mincol = (double)self->FC.FR.mincol;
  minrow = (double)self->FC.FR.minrow;
  maxcol = (double)self->FC.FR.maxcol;
  maxrow = (double)self->FC.FR.maxrow;
  v9 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v9;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, mincol, minrow);
  v11 = v10;
  v13 = v12;
  v14 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v14;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, maxcol, maxrow);
  v15 = v11;
  *(float *)&v16 = v16;
  self->FC.FR.mincol = (int)rintf(fminf(v15, *(float *)&v16));
  self->FC.FR.maxcol = (int)rintf(fmaxf(v15, *(float *)&v16));
  *(float *)&v16 = v13;
  *(float *)&v17 = v17;
  self->FC.FR.minrow = (int)rintf(fminf(*(float *)&v16, *(float *)&v17));
  self->FC.FR.maxrow = (int)rintf(fmaxf(*(float *)&v16, *(float *)&v17));
  v18 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v18;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, self->FC.leftEye.x, self->FC.leftEye.y);
  self->FC.leftEye.x = v19;
  self->FC.leftEye.y = v20;
  v21 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v21;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, self->FC.rightEye.x, self->FC.rightEye.y);
  self->FC.rightEye.x = v22;
  self->FC.rightEye.y = v23;
  for (i = 184; i != 312; i += 16)
  {
    v25 = (char *)self + i;
    v26 = *(_OWORD *)&a3->c;
    v58 = *(_OWORD *)&a3->a;
    v59 = v26;
    v60 = *(_OWORD *)&a3->tx;
    -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, *(double *)((char *)&self->super.isa + i), *(double *)((char *)&self->inspector + i));
    *(_QWORD *)v25 = v27;
    *((_QWORD *)v25 + 1) = v28;
    v29 = *(_OWORD *)&a3->c;
    v58 = *(_OWORD *)&a3->a;
    v59 = v29;
    v60 = *(_OWORD *)&a3->tx;
    -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, *((double *)v25 + 16), *((double *)v25 + 17));
    *((_QWORD *)v25 + 16) = v30;
    *((_QWORD *)v25 + 17) = v31;
  }
  v32 = (double)self->FC.LR.mincol;
  v33 = (double)self->FC.LR.minrow;
  v34 = (double)self->FC.LR.maxcol;
  v35 = (double)self->FC.LR.maxrow;
  v36 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v36;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v32, v33);
  v38 = v37;
  v40 = v39;
  v41 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v41;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v34, v35);
  v42 = v38;
  *(float *)&v43 = v43;
  self->FC.LR.mincol = (int)rintf(fminf(v42, *(float *)&v43));
  self->FC.LR.maxcol = (int)rintf(fmaxf(v42, *(float *)&v43));
  *(float *)&v43 = v40;
  *(float *)&v44 = v44;
  self->FC.LR.minrow = (int)rintf(fminf(*(float *)&v43, *(float *)&v44));
  self->FC.LR.maxrow = (int)rintf(fmaxf(*(float *)&v43, *(float *)&v44));
  v45 = (double)self->FC.RR.mincol;
  v46 = (double)self->FC.RR.minrow;
  v47 = (double)self->FC.RR.maxcol;
  v48 = (double)self->FC.RR.maxrow;
  v49 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v49;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v45, v46);
  v51 = v50;
  v53 = v52;
  v54 = *(_OWORD *)&a3->c;
  v58 = *(_OWORD *)&a3->a;
  v59 = v54;
  v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v47, v48);
  v55 = v51;
  *(float *)&v56 = v56;
  self->FC.RR.mincol = (int)rintf(fminf(v55, *(float *)&v56));
  self->FC.RR.maxcol = (int)rintf(fmaxf(v55, *(float *)&v56));
  *(float *)&v56 = v53;
  *(float *)&v57 = v57;
  self->FC.RR.minrow = (int)rintf(fminf(*(float *)&v56, *(float *)&v57));
  self->FC.RR.maxrow = (int)rintf(fmaxf(*(float *)&v56, *(float *)&v57));
}

- (void)transformConvexHull:(id *)a3 withTransform:(CGAffineTransform *)a4
{
  uint64_t v7;
  uint64_t v8;
  CGPoint *v9;
  __int128 v10;
  CGFloat v11;
  CGFloat v12;
  _OWORD v13[3];

  if (a3->var1 >= 1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = &a3->var3[v7];
      v10 = *(_OWORD *)&a4->c;
      v13[0] = *(_OWORD *)&a4->a;
      v13[1] = v10;
      v13[2] = *(_OWORD *)&a4->tx;
      -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", v13, v9->x, v9->y);
      v9->x = v11;
      v9->y = v12;
      ++v8;
      ++v7;
    }
    while (v8 < a3->var1);
  }
}

- (int)transformRepairArray:(CGAffineTransform *)a3
{
  int v5;
  _BOOL4 v6;
  uint64_t v7;
  CGSize *p_size;
  uint64_t v9;
  float32x2_t v10;
  float yf;
  float xf;
  __int128 v13;
  __int128 v14;
  int8x16_t v15;
  int result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[3];
  int v21;
  uint64_t v22;
  uint64_t v23;

  v5 = -[NSMutableArray count](self->repairs, "count");
  v6 = a3->a == 0.0 && a3->d == 0.0;
  if (v5 < 1)
    return 0;
  v7 = 0;
  v22 = 0;
  v23 = 0;
  memset(v20, 0, sizeof(v20));
  v21 = 0;
  p_size = &self->S.inputImageExtent.size;
  v9 = v5;
  v10 = 0;
  yf = 0.0;
  xf = 0.0;
  while (-[CIRedEyeRepair3 unpackToGlobalRepairDictionary:convexHull:facts:](self, "unpackToGlobalRepairDictionary:convexHull:facts:", -[NSMutableArray objectAtIndexedSubscript:](self->repairs, "objectAtIndexedSubscript:", v7), &v23, v20))
  {
    v13 = *(_OWORD *)&a3->c;
    v17 = *(_OWORD *)&a3->a;
    v18 = v13;
    v19 = *(_OWORD *)&a3->tx;
    -[CIRedEyeRepair3 transformGlobalsWithTransform:](self, "transformGlobalsWithTransform:", &v17);
    v14 = *(_OWORD *)&a3->c;
    v17 = *(_OWORD *)&a3->a;
    v18 = v14;
    v19 = *(_OWORD *)&a3->tx;
    -[CIRedEyeRepair3 transformConvexHull:withTransform:](self, "transformConvexHull:withTransform:", v23, &v17);
    if (v6)
    {
      xf = self->S.xf;
      yf = self->S.yf;
      v10 = vcvt_f32_f64(*(float64x2_t *)p_size);
      self->S.yf = xf;
      self->S.xf = yf;
      self->S.xfi = 1.0 / yf;
      self->S.yfi = 1.0 / xf;
      self->S.ify = (float)(uint64_t)rintf(xf);
      v15 = (int8x16_t)vcvtq_f64_f32(v10);
      *(int8x16_t *)p_size = vextq_s8(v15, v15, 8uLL);
    }
    result = -[CIRedEyeRepair3 packGlobalRepairDictionary:withConvexHull:facts:](self, "packGlobalRepairDictionary:withConvexHull:facts:", &v22, v23, v20);
    if (result)
      return result;
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->repairs, "replaceObjectAtIndex:withObject:", v7, v22);
    if (v6)
    {
      self->S.yf = yf;
      self->S.xf = xf;
      self->S.xfi = 1.0 / xf;
      self->S.yfi = 1.0 / yf;
      self->S.ify = (float)(uint64_t)rintf(yf);
      *(float64x2_t *)p_size = vcvtq_f64_f32(v10);
    }
    if (v9 == ++v7)
      return 0;
  }
  return 1;
}

- (id)repairArray
{
  return -[CIRedEyeRepair3 mutableCopyOfArray:](self, "mutableCopyOfArray:", self->repairs);
}

- (id)stringWithRER3Error:(int)a3
{
  const char *v3;

  if ((a3 - 1) > 0x3C)
    v3 = "unknown error code";
  else
    v3 = off_1E2EC4F80[a3 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v3, 30);
}

- (void)executeRepair:(id)a3
{
  uint64_t v5;

  self->failureCauses = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = -[CIRedEyeRepair3 executeRepairWithRepairDictionary:](self, "executeRepairWithRepairDictionary:", a3);
  if ((_DWORD)v5)
    -[NSMutableArray addObject:](self->failureCauses, "addObject:", -[CIRedEyeRepair3 stringWithRER3Error:](self, "stringWithRER3Error:", v5));
}

- (void)magnitudeMap:(id *)a3 fromGabor:(id *)a4
{
  int var2;
  int v5;
  int var1;
  uint64_t var6;
  uint64_t var3;
  char *var0;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  char *v15;

  var2 = a4->var2;
  if (var2 >= 1)
  {
    v5 = 0;
    var1 = a4->var1;
    var6 = a3->var6;
    var3 = a3->var3;
    var0 = a3->var0;
    v10 = a4->var0;
    v11 = 4 * a4->var3;
    v12 = 4 * a4->var6;
    do
    {
      if (var1 >= 1)
      {
        v13 = var1;
        v14 = 8;
        v15 = var0;
        do
        {
          *v15 = (int)(float)(*(float *)&v10[v14] * 255.0);
          v15 += var6;
          v14 += v12;
          --v13;
        }
        while (v13);
      }
      ++v5;
      var0 += var3;
      v10 += v11;
    }
    while (v5 != var2);
  }
}

- (void)condenseFourChannelRecognitionMap:(id *)a3 intoOneChanneMap:(id *)a4
{
  int var2;
  int v7;
  int var1;
  uint64_t var6;
  uint64_t var3;
  char *var0;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v15;
  char *v16;
  char *v17;

  bzero(a4->var0, a4->var5);
  var2 = a3->var2;
  if (var2 >= 1)
  {
    v7 = 0;
    var1 = a3->var1;
    var6 = a4->var6;
    var3 = a4->var3;
    var0 = a4->var0;
    v12 = a3->var6;
    v13 = a3->var3;
    v14 = a3->var0;
    do
    {
      if (var1 >= 1)
      {
        v15 = var1;
        v16 = var0;
        v17 = v14;
        do
        {
          *v16 = *v17;
          v17 += v12;
          v16 += var6;
          --v15;
        }
        while (v15);
      }
      ++v7;
      v14 += v13;
      var0 += var3;
    }
    while (v7 != var2);
  }
}

- (int)initShapePoints:(id *)a3 withMaxPoints:(int)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  int result;

  v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(48 * a4, 0x1000040EED21634uLL);
  a3->var2 = v6;
  if (!v6)
    return 29;
  result = 0;
  a3->var0 = 0;
  a3->var1 = a4;
  return result;
}

- (int)addPoint:(CGPoint)a3 toShapePoints:(id *)a4
{
  int var0;
  int result;
  char *v6;

  var0 = a4->var0;
  if (a4->var0 >= a4->var1)
    return 30;
  result = 0;
  v6 = (char *)a4->var2 + 48 * var0;
  *(CGPoint *)v6 = a3;
  *((_QWORD *)v6 + 2) = 0;
  *((_DWORD *)v6 + 6) = 0;
  a4->var0 = var0 + 1;
  return result;
}

- (void)termShapePoints:(id *)a3
{
  free(a3->var2);
  *(_QWORD *)&a3->var0 = 0;
  a3->var2 = 0;
}

- (int)copyShape:(id *)a3 into:(id *)a4 transform:(CGAffineTransform *)a5 height:(int)a6
{
  __int128 v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  int var0;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  double v14;
  double v15;

  v10 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&a4->var0 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&a4->var3 = v10;
  a4->var2 = 0;
  v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(48 * a3->var0, 0x1000040EED21634uLL);
  a4->var2 = v11;
  if (!v11)
    return 31;
  memmove(v11, a3->var2, 48 * a3->var0);
  var0 = a4->var0;
  a4->var1 = a4->var0;
  if (var0 >= 1)
  {
    var2 = a4->var2;
    do
    {
      v14 = (float)a6 - *((double *)var2 + 1);
      v15 = *(double *)var2 + 0.5;
      *(double *)var2 = v15;
      *((double *)var2 + 1) = v14;
      *(float64x2_t *)var2 = vaddq_f64(*(float64x2_t *)&a5->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a5->c, v14), *(float64x2_t *)&a5->a, v15));
      var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
      --var0;
    }
    while (var0);
  }
  return 0;
}

- (BOOL)initGridWithBitmap:(id *)a3 scale:(int)a4
{
  int v4;
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  int v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  int height;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *grid;
  uint64_t width;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;

  v4 = (a3->var1 + a4 - 1) / a4;
  p_G = &self->G;
  v6 = (a3->var2 + a4 - 1) / a4;
  self->G.width = v4;
  self->G.height = v6;
  self->G.scaleFactor = 1.0 / (float)a4;
  v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(8 * v6 * v4, 0x100004000313F17uLL);
  p_G->grid = v7;
  if (v7)
  {
    p_G->maxPoints = 500;
    v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0xBB80uLL, 0x1000040565EDBD2uLL);
    p_G->points = v8;
    if (v8)
    {
      __memset_chk();
      p_G->nPoints = 0;
      height = p_G->height;
      if (height >= 1)
      {
        grid = p_G->grid;
        width = p_G->width;
        do
        {
          if ((int)width >= 1)
          {
            memset(grid, 255, 8 * width);
            grid = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)grid + 8 * (width - 1) + 8);
          }
          --height;
        }
        while (height);
      }
      p_G->nextNetNumber = 1;
      p_G->maxThreads = 200;
      v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x4B00uLL, 0x1000040DB95C216uLL);
      p_G->threads = v12;
      if (v12)
      {
        __memset_chk();
        p_G->nThreads = 0;
        p_G->maxShapes = 20;
        v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x280uLL, 0x1020040A150DD5AuLL);
        p_G->shapes = v13;
        if (v13)
        {
          __memset_chk();
          p_G->nShapes = 0;
          LOBYTE(v7) = 1;
          return (char)v7;
        }
        free(p_G->threads);
        p_G->threads = 0;
      }
      free(p_G->points);
      p_G->points = 0;
    }
    free(p_G->grid);
    LOBYTE(v7) = 0;
    p_G->grid = 0;
  }
  return (char)v7;
}

- (void)termGrid
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *shapes;
  int v5;

  p_G = &self->G;
  free(self->G.grid);
  p_G->grid = 0;
  free(p_G->points);
  p_G->points = 0;
  free(p_G->threads);
  p_G->threads = 0;
  shapes = p_G->shapes;
  if (p_G->nShapes >= 1)
  {
    v5 = 0;
    do
    {
      -[CIRedEyeRepair3 termShapePoints:](self, "termShapePoints:", shapes);
      ++v5;
      shapes = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32);
    }
    while (v5 < p_G->nShapes);
    shapes = p_G->shapes;
  }
  free(shapes);
  p_G->shapes = 0;
}

- (void)point:(CGPoint)a3 toGridRow:(int *)a4 column:(int *)a5
{
  double scaleFactor;
  int v6;
  int height;
  signed int v8;
  int width;
  int v10;

  scaleFactor = self->G.scaleFactor;
  v6 = vcvtmd_s64_f64(a3.y * scaleFactor);
  if (v6 < 0)
  {
    v6 = 0;
  }
  else
  {
    height = self->G.height;
    if (height <= v6)
      v6 = height - 1;
  }
  v8 = vcvtmd_s64_f64(a3.x * scaleFactor);
  if (v8 < 0)
  {
    v10 = 0;
  }
  else
  {
    width = self->G.width;
    if (width <= v8)
      v10 = width - 1;
    else
      v10 = v8;
  }
  *a4 = v6;
  *a5 = v10;
}

- (int)insertPoint:(CGPoint)a3 andDirection:(CGPoint)a4 intoGrid:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  int nPoints;
  int maxPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  double *v16;
  int *v17;
  int v18;
  int result;
  char *v20;
  int nextNetNumber;
  uint64_t v22;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  p_G = &self->G;
  nPoints = self->G.nPoints;
  maxPoints = self->G.maxPoints;
  if (nPoints >= maxPoints)
  {
    v15 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * maxPoints + 19200, 0x1000040565EDBD2uLL);
    if (!v15)
      return 19;
    points = v15;
    memmove(v15, p_G->points, 96 * p_G->nPoints);
    free(p_G->points);
    p_G->points = points;
    nPoints = p_G->nPoints;
    p_G->maxPoints += 200;
  }
  else
  {
    points = self->G.points;
  }
  v22 = 0;
  p_G->nPoints = nPoints + 1;
  v16 = (double *)((char *)points + 96 * nPoints);
  if (v5)
  {
    -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v22 + 4, &v22, v9, v8);
    v17 = (int *)((char *)p_G->grid + 8 * (int)v22 + 8 * p_G->width * HIDWORD(v22));
    v18 = *v17;
  }
  else
  {
    v17 = 0;
    v18 = -1;
  }
  result = 0;
  v20 = (char *)points + 96 * nPoints;
  *((_DWORD *)v20 + 16) = v18;
  *v16 = v9;
  v16[1] = v8;
  *((CGFloat *)v20 + 2) = x;
  *((CGFloat *)v20 + 3) = y;
  *(_QWORD *)(v20 + 68) = -1;
  nextNetNumber = p_G->nextNetNumber;
  *((_DWORD *)v20 + 19) = 0;
  *((_DWORD *)v20 + 20) = nextNetNumber;
  p_G->nextNetNumber = nextNetNumber + 1;
  if (v5)
  {
    result = 0;
    *v17 = nPoints;
  }
  return result;
}

- (int)newThread:(id *)a3
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  int nThreads;
  int maxThreads;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  int result;

  p_G = &self->G;
  nThreads = self->G.nThreads;
  maxThreads = self->G.maxThreads;
  if (nThreads < maxThreads)
  {
    threads = self->G.threads;
LABEL_5:
    result = 0;
    p_G->nThreads = nThreads + 1;
    *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)threads + 96 * nThreads);
    return result;
  }
  v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * maxThreads + 9600, 0x1000040DB95C216uLL);
  if (v8)
  {
    threads = v8;
    memmove(v8, p_G->threads, 96 * p_G->nThreads);
    free(p_G->threads);
    p_G->threads = threads;
    nThreads = p_G->nThreads;
    p_G->maxThreads += 100;
    goto LABEL_5;
  }
  return 36;
}

- (int)newShape:(id *)a3
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  int nShapes;
  int maxShapes;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *shapes;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  int result;

  p_G = &self->G;
  nShapes = self->G.nShapes;
  maxShapes = self->G.maxShapes;
  if (nShapes < maxShapes)
  {
    shapes = self->G.shapes;
LABEL_5:
    result = 0;
    p_G->nShapes = nShapes + 1;
    *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32 * nShapes);
    return result;
  }
  v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(32 * (maxShapes + 10), 0x1020040A150DD5AuLL);
  if (v8)
  {
    shapes = v8;
    memmove(v8, p_G->shapes, 32 * p_G->nShapes);
    free(p_G->shapes);
    p_G->shapes = shapes;
    nShapes = p_G->nShapes;
    p_G->maxShapes += 10;
    goto LABEL_5;
  }
  return 34;
}

- (int)connectThreads:(int)a3 drop1:(int)a4 and:(int)a5 drop2:(int)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  char *v8;
  _DWORD *v9;
  int v10;
  int v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  uint64_t v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  int v19;
  char *v20;
  char *v21;

  threads = self->G.threads;
  v8 = (char *)threads + 96 * a3;
  v11 = *((_DWORD *)v8 + 1);
  v9 = v8 + 4;
  v10 = v11;
  points = self->G.points;
  v13 = v11;
  if (a4 >= 1)
  {
    do
    {
      v14 = (char *)points + 96 * v13;
      v15 = *((_DWORD *)v14 + 18);
      *((_DWORD *)v14 + 18) = -1;
      v13 = v15;
      *((_DWORD *)points + 24 * v15 + 17) = -1;
      --a4;
    }
    while (a4);
    v10 = v15;
  }
  v16 = *((_DWORD *)threads + 24 * a5);
  v17 = v16;
  if (a6 >= 1)
  {
    do
    {
      v18 = (char *)points + 96 * v17;
      v19 = *((_DWORD *)v18 + 17);
      *((_DWORD *)v18 + 17) = -1;
      v17 = v19;
      *((_DWORD *)points + 24 * v19 + 18) = -1;
      --a6;
    }
    while (a6);
    v16 = v19;
  }
  v20 = (char *)threads + 96 * a3;
  *((_DWORD *)points + 24 * (int)v13 + 17) = v16;
  *((_DWORD *)points + 24 * (int)v17 + 18) = v10;
  v21 = (char *)threads + 96 * a5;
  *v9 = *((_DWORD *)v21 + 1);
  -[CIRedEyeRepair3 removeThreadAtIndex:](self, "removeThreadAtIndex:", *(_QWORD *)&a5);
  v21[24] = 0;
  return -[CIRedEyeRepair3 gatherThreadInfo:](self, "gatherThreadInfo:", v20);
}

- (void)putThreadAtIndex:(int)a3
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  int *v5;
  double *v6;
  uint64_t v7;
  int *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = 0;
  p_G = &self->G;
  v5 = (int *)((char *)self->G.threads + 96 * a3);
  v6 = (double *)((char *)self->G.points + 96 * *v5);
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v11 + 4, &v11, *v6, v6[1]);
  v7 = (uint64_t)p_G->grid + 8 * (int)v11 + 8 * p_G->width * HIDWORD(v11);
  v10 = *(_DWORD *)(v7 + 4);
  v8 = (int *)(v7 + 4);
  v9 = v10;
  v5[7] = v10;
  v5[8] = -1;
  if (v10 != -1)
    *((_DWORD *)p_G->threads + 24 * v9 + 8) = a3;
  *v8 = a3;
}

- (void)removeThreadAtIndex:(int)a3
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  char *v5;
  int v6;
  _DWORD *v7;
  int v8;
  char *v9;
  int v10;
  int *v11;
  double *v12;
  uint64_t v13;

  v13 = 0;
  p_G = &self->G;
  threads = self->G.threads;
  v5 = (char *)threads + 96 * a3;
  v8 = *((_DWORD *)v5 + 8);
  v7 = v5 + 32;
  v6 = v8;
  if (v8 == -1)
  {
    v11 = (int *)((char *)threads + 96 * a3);
    v12 = (double *)((char *)self->G.points + 96 * *v11);
    -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v13 + 4, &v13, *v12, v12[1]);
    v10 = v11[7];
    *((_DWORD *)p_G->grid + 2 * (int)v13 + 2 * p_G->width * HIDWORD(v13) + 1) = v10;
  }
  else
  {
    v9 = (char *)threads + 96 * a3;
    *((_DWORD *)threads + 24 * v6 + 7) = *((_DWORD *)v9 + 7);
    v10 = *((_DWORD *)v9 + 7);
  }
  if (v10 != -1)
    *((_DWORD *)p_G->threads + 24 * v10 + 8) = *v7;
}

- (int)lookForPoint:(CGPoint *)a3 onLine:(id)a4 nearestPoint:(CGPoint)a5
{
  int result;
  float v6;
  BOOL v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  if (a4.var0 == 0.0 && a4.var1 == 0.0)
    return 37;
  result = 0;
  v6 = a5.y * a4.var0 + (float)-a4.var1 * a5.x;
  v7 = a4.var0 == 0.0;
  v8 = (float)(a4.var1 * a4.var1) + (float)(a4.var0 * a4.var0);
  v9 = (float)-(float)((float)(a4.var1 * v6) + (float)(a4.var0 * a4.var2)) / v8;
  v10 = (float)-(float)(a4.var2 + (float)(a4.var0 * v9)) / a4.var1;
  v11 = (float)((float)(a4.var2 * (float)-a4.var1) + (float)(a4.var0 * v6)) / v8;
  v12 = (float)-(float)(a4.var2 + (float)(a4.var1 * v11)) / a4.var0;
  if (v7)
  {
    v12 = v9;
    v13 = v10;
  }
  else
  {
    v13 = v11;
  }
  a3->x = v12;
  a3->y = v13;
  return result;
}

- (void)forAllGridPointsNear:(int)a3 withinRadius:(float)a4 do:(void *)a5 context:(void *)a6
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  double *v12;
  double v13;
  double v14;
  double v15;
  int v16;
  int v17;
  float v18;
  int v19;
  int v20;
  int v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  int v23;
  double *v24;
  float v25;
  float v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;

  v28 = 0;
  v29 = 0;
  p_G = &self->G;
  v12 = (double *)((char *)self->G.points + 96 * a3);
  v13 = *v12;
  v14 = v12[1];
  v15 = a4;
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v29 + 4, (char *)&v28 + 4, *v12 - a4, v14 - a4);
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", &v29, &v28, *v12 + v15, v12[1] + v15);
  v16 = v29;
  v17 = HIDWORD(v29);
  if (SHIDWORD(v29) <= (int)v29)
  {
    v18 = a4 * a4;
    v19 = v28;
    do
    {
      v20 = HIDWORD(v28);
      if (SHIDWORD(v28) <= v19)
      {
        do
        {
          v21 = *((_DWORD *)p_G->grid + 2 * v20 + 2 * p_G->width * v17);
          if (v21 != -1)
          {
            do
            {
              points = p_G->points;
              v23 = v21;
              if (v21 != a3)
              {
                v24 = (double *)((char *)points + 96 * v21);
                v25 = *v24 - v13;
                v26 = v24[1] - v14;
                if ((float)((float)(v26 * v26) + (float)(v25 * v25)) <= v18)
                  ((void (*)(void *, _QWORD))a5)(a6, v21);
              }
              v21 = *((_DWORD *)points + 24 * v23 + 16);
            }
            while (v21 != -1);
            v19 = v28;
          }
          v27 = v20++ < v19;
        }
        while (v27);
        v16 = v29;
      }
      v27 = v17++ < v16;
    }
    while (v27);
  }
}

- (void)forAllGridThreadsNear:(CGPoint)a3 withinRadius:(float)a4 do:(void *)a5 context:(void *)a6
{
  double y;
  double x;
  double v12;
  int v13;
  int v14;
  float v15;
  int v16;
  int v17;
  int v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  int v20;
  double *v21;
  float v22;
  float v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  v25 = 0;
  v26 = 0;
  v12 = a4;
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v26 + 4, (char *)&v25 + 4, a3.x - a4, a3.y - a4);
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", &v26, &v25, x + v12, y + v12);
  v13 = v26;
  v14 = HIDWORD(v26);
  if (SHIDWORD(v26) <= (int)v26)
  {
    v15 = a4 * a4;
    v16 = v25;
    do
    {
      v17 = HIDWORD(v25);
      if (SHIDWORD(v25) <= v16)
      {
        do
        {
          v18 = *((_DWORD *)self->G.grid + 2 * v17 + 2 * self->G.width * v14 + 1);
          if (v18 != -1)
          {
            do
            {
              threads = self->G.threads;
              v20 = v18;
              v21 = (double *)((char *)self->G.points + 96 * *((int *)threads + 24 * v18));
              v22 = *v21 - x;
              v23 = v21[1] - y;
              if ((float)((float)(v23 * v23) + (float)(v22 * v22)) <= v15)
                ((void (*)(void *, _QWORD))a5)(a6, v18);
              v18 = *((_DWORD *)threads + 24 * v20 + 7);
            }
            while (v18 != -1);
            v16 = v25;
          }
          v24 = v17++ < v16;
        }
        while (v24);
        v13 = v26;
      }
      v24 = v14++ < v13;
    }
    while (v24);
  }
}

- (int)replacePointAndDirection:(int)a3
{
  double v3;
  double v4;
  double v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  char *v8;
  float *v9;
  int result;
  char *v11;
  float v12;
  float v13;
  __int128 v14;

  v14 = 0uLL;
  points = self->G.points;
  v8 = (char *)points + 96 * a3;
  v9 = (float *)(v8 + 84);
  LODWORD(v3) = *((_DWORD *)v8 + 21);
  LODWORD(v4) = *((_DWORD *)v8 + 22);
  LODWORD(v5) = *((_DWORD *)v8 + 23);
  result = -[CIRedEyeRepair3 lookForPoint:onLine:nearestPoint:](self, "lookForPoint:onLine:nearestPoint:", &v14, v3, v4, v5, *(double *)v8, *((double *)v8 + 1));
  if (!result)
  {
    v11 = (char *)points + 96 * a3;
    *((_OWORD *)v11 + 2) = *(_OWORD *)v8;
    *(_OWORD *)v8 = v14;
    v12 = *((float *)v11 + 22);
    v13 = *v9;
    if (*((double *)v11 + 3) * (float)-*v9 + v12 * *((double *)v11 + 2) >= 0.0)
      v13 = -*v9;
    else
      v12 = -v12;
    *((_OWORD *)v11 + 3) = *((_OWORD *)v11 + 1);
    *((double *)v11 + 2) = v12;
    *((double *)v11 + 3) = v13;
  }
  return result;
}

- (int)linkUpPointIndex:(int)a3 toPointIndex:(int)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  char *v5;
  _DWORD *v6;
  int v7;
  int v8;
  int v9;
  char *v10;
  int v11;
  _DWORD *v12;
  int v13;
  char *v14;
  int *v15;
  int v16;
  int v17;
  char *v18;
  int *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  _DWORD *v24;
  int v25;

  points = self->G.points;
  v5 = (char *)points + 96 * a4;
  v8 = *((_DWORD *)v5 + 19);
  v6 = v5 + 76;
  v7 = v8;
  v9 = *((_DWORD *)points + 24 * a3 + 19);
  if (v8 > v9 + 1)
    return 0;
  v10 = (char *)points + 96 * a4;
  v13 = *((_DWORD *)v10 + 20);
  v12 = v10 + 80;
  v11 = v13;
  v14 = (char *)points + 96 * a3;
  v17 = *((_DWORD *)v14 + 20);
  v15 = (int *)(v14 + 80);
  v16 = v17;
  if (v11 == v17)
    return 0;
  v18 = (char *)points + 96 * a4;
  v21 = *((_DWORD *)v18 + 18);
  v19 = (int *)(v18 + 72);
  v20 = v21;
  if (v21 != -1)
  {
    *((_DWORD *)points + 24 * v20 + 17) = -1;
    goto LABEL_5;
  }
  if (v7 <= 0)
  {
LABEL_5:
    *((_DWORD *)points + 24 * a3 + 17) = a4;
    *v19 = a3;
    *v6 = v9 + 1;
    *v12 = v16;
    v22 = *((_DWORD *)points + 24 * a4 + 17);
    if (v22 != -1)
    {
      v23 = v9 + 2;
      do
      {
        v24 = (_DWORD *)((char *)points + 96 * v22);
        v25 = *v15;
        v24[19] = v23;
        v24[20] = v25;
        v22 = v24[17];
        ++v23;
      }
      while (v22 != -1);
    }
    return 0;
  }
  return 38;
}

- (int)copyGridInto:(id *)a3 transform:(CGAffineTransform *)a4 height:(int)a5
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  int var4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var6;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  int var11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var13;
  _QWORD *v24;
  int v25;
  int v26;
  const void **v27;
  void *v28;
  const void *v29;
  const void *v30;
  uint64_t v31;
  int result;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  int v34;
  int v35;
  void **v36;

  p_G = &self->G;
  memmove(a3, &self->G, 0x50uLL);
  a3->var3 = 0;
  a3->var6 = 0;
  v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(8 * a3->var1 * a3->var0, 0x100004000313F17uLL);
  a3->var3 = v9;
  if (v9)
  {
    memmove(v9, p_G->grid, 8 * a3->var1 * a3->var0);
    v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * a3->var4, 0x1000040565EDBD2uLL);
    a3->var6 = v10;
    if (v10)
    {
      memmove(v10, p_G->points, 96 * a3->var4);
      var4 = a3->var4;
      a3->var5 = var4;
      if (var4 >= 1)
      {
        var6 = a3->var6;
        v13 = (float)a5;
        do
        {
          v14 = v13 - *((double *)var6 + 1);
          v15 = *(double *)var6 + 0.5;
          *(double *)var6 = v15;
          *((double *)var6 + 1) = v14;
          *(float64x2_t *)var6 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v14), *(float64x2_t *)&a4->a, v15));
          v16 = v13 - *((double *)var6 + 5);
          v17 = *((double *)var6 + 4) + 0.5;
          *((double *)var6 + 4) = v17;
          *((double *)var6 + 5) = v16;
          *((float64x2_t *)var6 + 2) = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v16), *(float64x2_t *)&a4->a, v17));
          LODWORD(v17) = *((_DWORD *)var6 + 22);
          v18 = *((float *)var6 + 21);
          v19 = *((float *)var6 + 23) + v18 * -0.5 + (float)(*(float *)&v17 * (float)a5);
          *(float *)&v18 = v19 * a4->a - a4->tx * v18 + *(float *)&v17 * a4->ty;
          *((float *)var6 + 22) = -*(float *)&v17;
          *((_DWORD *)var6 + 23) = LODWORD(v18);
          var6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var6 + 96);
          --var4;
        }
        while (var4);
      }
      v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * a3->var8, 0x1000040DB95C216uLL);
      a3->var10 = v20;
      if (v20)
      {
        memmove(v20, p_G->threads, 96 * a3->var8);
        a3->var9 = a3->var8;
        v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(32 * a3->var11, 0x1020040A150DD5AuLL);
        a3->var13 = v21;
        if (v21)
        {
          memmove(v21, p_G->shapes, 32 * a3->var11);
          var11 = a3->var11;
          if (var11 < 1)
          {
            result = 0;
            a3->var12 = var11;
            return result;
          }
          var13 = a3->var13;
          v24 = (_QWORD *)((char *)var13 + 8);
          v25 = a3->var11;
          do
          {
            *v24 = 0;
            v24 += 4;
            --v25;
          }
          while (v25);
          a3->var12 = var11;
          v26 = 0;
          v27 = (const void **)((char *)p_G->shapes + 8);
          while (1)
          {
            v28 = malloc_type_malloc(48 * *(_DWORD *)var13, 0x1000040EED21634uLL);
            *((_QWORD *)var13 + 1) = v28;
            if (!v28)
              break;
            v30 = *v27;
            v27 += 4;
            v29 = v30;
            v31 = *(_DWORD *)var13;
            var13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var13 + 32);
            memmove(v28, v29, 48 * v31);
            result = 0;
            if (++v26 >= a3->var11)
              return result;
          }
          v33 = a3->var13;
          v34 = a3->var11;
          if (v34 >= 1)
          {
            v35 = 0;
            v36 = (void **)((char *)v33 + 8);
            do
            {
              if (*v36)
              {
                free(*v36);
                *v36 = 0;
                v34 = a3->var11;
              }
              ++v35;
              v36 += 4;
            }
            while (v35 < v34);
            v33 = a3->var13;
          }
          free(v33);
          a3->var13 = 0;
        }
        free(a3->var10);
        a3->var10 = 0;
      }
      free(a3->var6);
      a3->var6 = 0;
    }
    free(a3->var3);
    a3->var3 = 0;
  }
  return 39;
}

- (int)nextPointIndexWithPointIndex:(int)a3
{
  char *v3;
  uint64_t v5;
  int v6;

  v3 = (char *)self->G.points + 96 * a3;
  *(float *)&v5 = (float)(self->S.capture * self->S.capture) + 1.0;
  HIDWORD(v5) = -1;
  -[CIRedEyeRepair3 forAllGridPointsNear:withinRadius:do:context:](self, "forAllGridPointsNear:withinRadius:do:context:", *(_OWORD *)v3, *((_OWORD *)v3 + 1), *(_QWORD *)(v3 + 84), __PAIR64__(LODWORD(self->S.alignmentTolerance), *((_DWORD *)v3 + 23)), v5);
  return v6;
}

- (void)regressionWithPointIndex:(int)a3
{
  uint64_t v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  float64x2_t v7;
  $E8834F51CE79BF204CBF6D92B5F806C1 *p_S;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  float32x4_t v20;
  int32x2_t v21;
  int v22;

  v3 = *(_QWORD *)&a3;
  points = self->G.points;
  v7 = *((float64x2_t *)points + 6 * a3);
  v21 = (int32x2_t)vcvt_f32_f64(v7);
  v20 = vcvt_hight_f32_f64(v21, v7);
  v22 = 1;
  p_S = &self->S;
  *(float *)v7.f64 = self->S.regressionRadius;
  -[CIRedEyeRepair3 forAllGridPointsNear:withinRadius:do:context:](self, "forAllGridPointsNear:withinRadius:do:context:", *(_QWORD *)&a3, regressionMeanAction, &v20, v7.f64[0]);
  *(float *)&v9 = 1.0 / (float)v22;
  v10 = *(float *)v21.i32 * *(float *)&v9;
  v11 = *(float *)&v21.i32[1] * *(float *)&v9;
  if ((float)(v20.f32[2] - v20.f32[0]) <= (float)(v20.f32[3] - v20.f32[1]))
  {
    v17 = *(float *)v21.i32 * *(float *)&v9;
    v18 = *(float *)&v21.i32[1] * *(float *)&v9;
    v19 = 0;
    *(float *)&v9 = p_S->regressionRadius;
    -[CIRedEyeRepair3 forAllGridPointsNear:withinRadius:do:context:](self, "forAllGridPointsNear:withinRadius:do:context:", v3, regressionVerticalAction, &v17, v9);
    v14 = 0.0;
    if (*(float *)&v19 != 0.0)
      v14 = *((float *)&v19 + 1) / *(float *)&v19;
    v13 = v10 - (float)(v14 * v11);
    v12 = -1.0;
  }
  else
  {
    v17 = *(float *)v21.i32 * *(float *)&v9;
    v18 = *(float *)&v21.i32[1] * *(float *)&v9;
    v19 = 0;
    *(float *)&v9 = p_S->regressionRadius;
    -[CIRedEyeRepair3 forAllGridPointsNear:withinRadius:do:context:](self, "forAllGridPointsNear:withinRadius:do:context:", v3, regressionHorizontalAction, &v17, v9);
    v12 = 0.0;
    if (*(float *)&v19 != 0.0)
      v12 = *((float *)&v19 + 1) / *(float *)&v19;
    v13 = v11 - (float)(v12 * v10);
    v14 = -1.0;
  }
  v15 = (float *)((char *)points + 96 * a3);
  v16 = 1.0 / sqrtf((float)(v14 * v14) + (float)(v12 * v12));
  v15[21] = v12 * v16;
  v15[22] = v14 * v16;
  v15[23] = v13 * v16;
}

- (int)initHull:(id *)a3 withOrientation:(BOOL)a4
{
  int v6;
  char *v7;
  char *v8;
  void *v9;

  v6 = 24;
  v7 = (char *)malloc_type_malloc(0x18uLL, 0x10200409093602BuLL);
  if (v7)
  {
    v8 = v7;
    *v7 = a4;
    *(_QWORD *)(v7 + 4) = 0x4000000000;
    v9 = malloc_type_malloc(0x400uLL, 0x1000040451B5BE8uLL);
    *((_QWORD *)v8 + 2) = v9;
    if (v9)
    {
      bzero(v9, 0x400uLL);
      v6 = 0;
      *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v8;
    }
    else
    {
      free(v8);
      return 24;
    }
  }
  return v6;
}

- (void)termHull:(id *)a3
{
  free(a3->var3);
  free(a3);
}

- (int)addPoint:(CGPoint)a3 toHull:(id *)a4
{
  CGFloat y;
  CGFloat x;
  int var1;
  int var2;
  CGPoint *var3;
  CGPoint *v10;
  int result;
  CGFloat *p_x;

  y = a3.y;
  x = a3.x;
  var1 = a4->var1;
  var2 = a4->var2;
  if (var1 < var2)
  {
    var3 = a4->var3;
LABEL_5:
    result = 0;
    a4->var1 = var1 + 1;
    p_x = &var3[var1].x;
    *p_x = x;
    p_x[1] = y;
    return result;
  }
  v10 = (CGPoint *)malloc_type_malloc(16 * (var2 + 32), 0x1000040451B5BE8uLL);
  if (v10)
  {
    var3 = v10;
    memmove(v10, a4->var3, 16 * a4->var1);
    free(a4->var3);
    a4->var3 = var3;
    var1 = a4->var1;
    a4->var2 += 32;
    goto LABEL_5;
  }
  return 50;
}

- (BOOL)trimConcaveFromHull:(id *)a3
{
  int var1;
  CGPoint *var3;
  double *p_x;
  double v6;
  double v7;
  double *v8;
  double v9;
  unsigned int v10;
  double *v11;
  double v12;
  float v13;
  BOOL result;

  var1 = a3->var1;
  if (var1 < 3)
    return 0;
  var3 = a3->var3;
  p_x = &var3[var1 - 3].x;
  v6 = *p_x;
  v7 = p_x[1];
  v8 = &var3[var1 - 2].x;
  v9 = v8[1];
  v10 = var1 - 1;
  v11 = &var3[v10].x;
  v12 = v11[1];
  *(float *)&v6 = *v8 - v6;
  *(float *)&v7 = v9 - v7;
  v13 = *v11 - *v8;
  *(float *)&v9 = v12 - v9;
  if (a3->var0 == (float)((float)(*(float *)&v6 * *(float *)&v9) - (float)(*(float *)&v7 * v13)) < 0.0)
    return 0;
  *v8 = *v11;
  v8[1] = v12;
  result = 1;
  a3->var1 = v10;
  return result;
}

- (BOOL)trimEndPointFromHull:(id *)a3
{
  int var1;
  CGPoint *var3;
  double *p_x;
  double v6;
  double v7;
  unsigned int v8;
  double *v9;
  double v10;
  float v11;

  var1 = a3->var1;
  if (var1 < 3)
    return 0;
  var3 = a3->var3;
  p_x = &var3[var1 - 2].x;
  v6 = *p_x;
  v7 = p_x[1];
  v8 = var1 - 1;
  v9 = &var3[v8].x;
  v10 = v9[1];
  *(float *)&v6 = *v9 - v6;
  *(float *)&v7 = v10 - v7;
  v11 = var3->x - *v9;
  *(float *)&v10 = var3->y - v10;
  if (a3->var0 == (float)((float)(*(float *)&v6 * *(float *)&v10) - (float)(*(float *)&v7 * v11)) < 0.0)
    return 0;
  a3->var1 = v8;
  return 1;
}

- (BOOL)trimStartPointFromHull:(id *)a3
{
  int var1;
  CGPoint *var3;
  double *p_x;
  double y;
  float v7;
  float v8;
  float v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  var1 = a3->var1;
  if (var1 < 3)
    return 0;
  var3 = a3->var3;
  p_x = &var3[var1 - 1].x;
  y = var3->y;
  v7 = var3->x - *p_x;
  v8 = y - p_x[1];
  v9 = var3[1].x - var3->x;
  *(float *)&y = var3[1].y - y;
  if (a3->var0 == (float)((float)(v7 * *(float *)&y) - (float)(v8 * v9)) < 0.0)
    return 0;
  v11 = 0;
  v12 = 1;
  do
  {
    a3->var3[v11] = a3->var3[v11 + 1];
    ++v12;
    v13 = a3->var1;
    ++v11;
  }
  while (v12 < v13);
  a3->var1 = v13 - 1;
  return 1;
}

- (BOOL)isConvex:(id *)a3
{
  unint64_t var1;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  CGPoint *var3;
  CGPoint *v9;
  double *p_x;
  double *p_y;
  double *v12;
  uint64_t v13;
  double *v14;
  float v15;
  float v16;
  float v17;
  float v18;

  var1 = a3->var1;
  if ((int)var1 < 1)
  {
    return 1;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = (var1 - 1);
    v7 = 1;
    do
    {
      if (v4 * 16)
      {
        var3 = a3->var3;
        v9 = &var3[v4];
        p_x = &var3[v4 - 1].x;
        p_y = &var3[v4 - 1].y;
        v12 = &var3[v4].y;
        v13 = (uint64_t)&var3[v4 + 1].y;
        if ((var1 - 1) == v4)
        {
          p_x = &var3[(int)var1 - 2].x;
          p_y = p_x + 1;
          v9 = &var3[v6];
          v12 = &v9->y;
          v14 = &var3->y;
        }
        else
        {
          var3 = (CGPoint *)((char *)var3 + v4 * 16 + 16);
          v14 = (double *)v13;
        }
      }
      else
      {
        v9 = a3->var3;
        p_x = &v9[v6].x;
        p_y = p_x + 1;
        v12 = &v9->y;
        var3 = v9 + 1;
        v14 = &v9[1].y;
      }
      v15 = v9->x - *p_x;
      v16 = *v12 - *p_y;
      v17 = var3->x - v9->x;
      v18 = *v14 - *v12;
      if (a3->var0 != (float)((float)(v15 * v18) - (float)(v16 * v17)) < 0.0)
        break;
      v5 = v7 >= var1;
      ++v4;
      ++v7;
    }
    while (var1 != v4);
  }
  return v5;
}

- (int)convexHull:(id *)a3 ofOriented:(BOOL)a4 threadIndex:(int)a5
{
  int result;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  int v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;

  v12 = 0;
  result = -[CIRedEyeRepair3 initHull:withOrientation:](self, "initHull:withOrientation:", &v12, a4);
  if (!result)
  {
    threads = self->G.threads;
    if (*((_BYTE *)threads + 96 * a5 + 24))
    {
      points = self->G.points;
      v11 = *((_DWORD *)threads + 24 * a5);
      result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v12, *((double *)points + 12 * v11), *((double *)points + 12 * v11 + 1));
      if (!result)
      {
        while (1)
        {
          v11 = *((_DWORD *)points + 24 * v11 + 17);
          if (v11 == -1)
            break;
          points = self->G.points;
          result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v12, *((double *)points + 12 * v11), *((double *)points + 12 * v11 + 1));
          if (result)
            return result;
          while (-[CIRedEyeRepair3 trimConcaveFromHull:](self, "trimConcaveFromHull:", v12))
            ;
        }
        do
        {
          while (-[CIRedEyeRepair3 trimEndPointFromHull:](self, "trimEndPointFromHull:", v12))
            ;
        }
        while (-[CIRedEyeRepair3 trimStartPointFromHull:](self, "trimStartPointFromHull:", v12));
        if (-[CIRedEyeRepair3 isConvex:](self, "isConvex:", v12))
        {
          result = 0;
          *a3 = v12;
        }
        else
        {
          -[CIRedEyeRepair3 termHull:](self, "termHull:", v12);
          return 40;
        }
      }
    }
    else
    {
      -[CIRedEyeRepair3 termHull:](self, "termHull:", v12);
      return 41;
    }
  }
  return result;
}

- (int)convexHull:(id *)a3 ofOriented:(BOOL)a4 shape:(id *)a5
{
  int result;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  int v10;
  double v11;
  double v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;

  v13 = 0;
  result = -[CIRedEyeRepair3 initHull:withOrientation:](self, "initHull:withOrientation:", &v13, a4);
  if (!result)
  {
    var2 = a5->var2;
    result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v13, *(double *)var2, *((double *)var2 + 1));
    if (!result)
    {
      if (a5->var0 < 2)
      {
        do
        {
LABEL_8:
          while (-[CIRedEyeRepair3 trimEndPointFromHull:](self, "trimEndPointFromHull:", v13))
            ;
        }
        while (-[CIRedEyeRepair3 trimStartPointFromHull:](self, "trimStartPointFromHull:", v13));
        result = 0;
        *a3 = v13;
      }
      else
      {
        v10 = 1;
        while (1)
        {
          v11 = *((double *)var2 + 6);
          v12 = *((double *)var2 + 7);
          var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
          result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v13, v11, v12);
          if (result)
            break;
          while (-[CIRedEyeRepair3 trimConcaveFromHull:](self, "trimConcaveFromHull:", v13))
            ;
          if (++v10 >= a5->var0)
            goto LABEL_8;
        }
      }
    }
  }
  return result;
}

- (void)measureHull:(id *)a3 majorAxis:(CGPoint *)a4 majorTo:(CGPoint *)a5 majorDiameter:(float *)a6 minorAxis:(CGPoint *)a7 minorTo:(CGPoint *)a8 minorDiameter:(float *)a9
{
  CGPoint *var3;
  uint64_t var1;
  uint64_t v11;
  double *p_x;
  double v13;
  double v14;
  double y;
  double x;
  double *p_y;
  float v18;
  int v19;
  float v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double *v34;
  double v35;
  double v36;
  uint64_t v37;
  double *v38;
  double v39;
  double v40;
  float v41;
  int v42;
  uint64_t v43;
  double *v44;
  float v45;
  float v46;
  float v47;
  float v48;

  var3 = a3->var3;
  var1 = a3->var1;
  v11 = var1 - 1;
  p_x = &var3[var1 - 1].x;
  v13 = *p_x;
  v14 = p_x[1];
  x = var3->x;
  y = var3->y;
  p_y = &var3[1].y;
  v18 = 0.0;
  v19 = -1;
  do
  {
    v20 = fabs(x * (*p_y - v14) + v13 * (y - *p_y) + *(p_y - 1) * (v14 - y)) * 0.5;
    ++v19;
    p_y += 2;
    v21 = v18 < v20;
    v18 = v20;
  }
  while (v21);
  if ((int)var1 <= v19)
  {
    v33 = 0.0;
    v27 = -10000.0;
    v32 = 0.0;
    v24 = 10000.0;
    v31 = 0.0;
    v30 = 0.0;
    v29 = 0.0;
    v28 = 0.0;
    v26 = 0.0;
    v25 = 0.0;
  }
  else
  {
    v22 = 0;
    v23 = v19;
    v24 = 10000.0;
    v25 = 0.0;
    v26 = 0.0;
    v27 = -10000.0;
    v28 = 0.0;
    v29 = 0.0;
    v30 = 0.0;
    v31 = 0.0;
    v32 = 0.0;
    v33 = 0.0;
    do
    {
      v34 = &var3[v22 + 1].x;
      v35 = *v34;
      v36 = v34[1];
      v37 = v19;
      v38 = &var3[v19].x;
      v39 = *v38;
      v40 = v38[1];
      v41 = fabs(v35 * (v40 - y) + x * (v36 - v40) + *v38 * (y - v36)) * 0.5;
      if (v19 <= (int)v11)
        v42 = var1 - 1;
      else
        v42 = v19;
      if (v11 > v19)
        v37 = var1 - 1;
      v43 = v37 - v19;
      v44 = &var3[v19-- + 1].y;
      while (1)
      {
        v45 = v39 - x;
        v46 = v40 - y;
        v47 = (float)(v46 * v46) + (float)(v45 * v45);
        if (v47 < v24)
        {
          v24 = v47;
          v33 = x;
          v32 = y;
          v29 = v39;
          v28 = v40;
        }
        if (v47 > v27)
        {
          v27 = v47;
          v31 = x;
          v30 = y;
          v26 = v39;
          v25 = v40;
        }
        if (!v43)
          break;
        v39 = *(v44 - 1);
        v40 = *v44;
        v48 = fabs(v35 * (*v44 - y) + x * (v36 - *v44) + v39 * (y - v36)) * 0.5;
        ++v19;
        --v43;
        v44 += 2;
        v21 = v41 < v48;
        v41 = v48;
        if (!v21)
          goto LABEL_19;
      }
      v19 = v42;
LABEL_19:
      if (v22 >= v23)
        break;
      ++v22;
      y = v36;
      x = v35;
    }
    while (v19 < (int)var1);
  }
  a4->x = v31;
  a4->y = v30;
  a5->x = v26;
  a5->y = v25;
  *a6 = sqrtf(v27);
  a7->x = v33;
  a7->y = v32;
  a8->x = v29;
  a8->y = v28;
  *a9 = sqrtf(v24);
}

- (int)renderHull:(id *)a3 toBitmap:(id *)a4
{
  size_t var2;
  size_t var1;
  CGColorSpace *DeviceGray;
  CGColorSpace *v9;
  CGContext *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CGPoint *v14;
  double v15;
  double v16;

  var1 = a4->var1;
  var2 = a4->var2;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  if (!DeviceGray)
    return 10;
  v9 = DeviceGray;
  v10 = CGBitmapContextCreate(a4->var0, var1, var2, 8uLL, a4->var4, DeviceGray, 0);
  CGColorSpaceRelease(v9);
  if (!v10)
    return 42;
  CGContextSetRGBFillColor(v10, 0.0, 0.0, 0.0, 1.0);
  CGContextBeginPath(v10);
  CGContextMoveToPoint(v10, 0.0, 0.0);
  CGContextAddLineToPoint(v10, (double)var1, 0.0);
  CGContextAddLineToPoint(v10, (double)var1, (double)var2);
  CGContextAddLineToPoint(v10, 0.0, (double)var2);
  CGContextAddLineToPoint(v10, 0.0, 0.0);
  CGContextClosePath(v10);
  CGContextFillPath(v10);
  CGContextSetRGBFillColor(v10, 1.0, 1.0, 1.0, 1.0);
  CGContextBeginPath(v10);
  if (a3->var1 <= 0)
  {
    v13 = (float)(var2 - 1);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = (float)(var2 - 1);
    do
    {
      v14 = &a3->var3[v11];
      v15 = v14->x + 0.5;
      v16 = v13 - v14->y + 0.5;
      if (v11 * 16)
        CGContextAddLineToPoint(v10, v15, v16);
      else
        CGContextMoveToPoint(v10, v15, v16);
      ++v12;
      ++v11;
    }
    while (v12 < a3->var1);
  }
  CGContextAddLineToPoint(v10, a3->var3->x + 0.5, v13 - a3->var3->y + 0.5);
  CGContextClosePath(v10);
  CGContextFillPath(v10);
  CGContextRelease(v10);
  return 0;
}

- (int)widenedHull:(id *)a3 withHull:(id *)a4 by:(float)a5
{
  int v9;
  unint64_t var1;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  CGPoint *var3;
  CGPoint *v17;
  double x;
  double y;
  double v20;
  double v21;
  double *p_x;
  double v23;
  double v24;
  int v25;
  float v26;
  float v27;
  float v28;
  int v29;
  uint64_t v31;
  float v32;
  uint64_t v33;
  float v34;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v35;

  v35 = 0;
  v9 = -[CIRedEyeRepair3 initHull:withOrientation:](self, "initHull:withOrientation:", &v35, 0);
  if (!v9)
  {
    var1 = a4->var1;
    if ((int)var1 < 1)
    {
LABEL_15:
      v9 = 0;
      *a3 = v35;
    }
    else
    {
      v11 = 0;
      v34 = 0.0;
      v33 = 0;
      v31 = 0;
      v12 = 1;
      v32 = 0.0;
      while (1)
      {
        if (v11)
          v13 = 0;
        else
          v13 = (int)var1;
        v14 = v13 + v11++;
        if (v11 >= var1)
          v15 = var1;
        else
          v15 = 0;
        var3 = a4->var3;
        v17 = &var3[v14];
        x = v17[-1].x;
        y = v17[-1].y;
        v20 = var3[v12 - 1].x;
        v21 = var3[v12 - 1].y;
        p_x = &var3[v12 - v15].x;
        v23 = *p_x;
        v24 = p_x[1];
        v25 = lineEquationThroughTwoPoints((float *)&v33, x, y, v20, v21);
        if (v25 || (v25 = lineEquationThroughTwoPoints((float *)&v31, v20, v21, v23, v24)) != 0)
        {
          v9 = v25;
          -[CIRedEyeRepair3 termHull:](self, "termHull:", v35);
          return v9;
        }
        v26 = (float)(*(float *)&v33 * *((float *)&v31 + 1)) - (float)(*(float *)&v31 * *((float *)&v33 + 1));
        v27 = (float)((float)(*((float *)&v33 + 1) * (float)(v32 + a5))
                    - (float)(*((float *)&v31 + 1) * (float)(v34 + a5)))
            / v26;
        v28 = (float)((float)(*(float *)&v31 * (float)(v34 + a5)) - (float)(*(float *)&v33 * (float)(v32 + a5))) / v26;
        v34 = (float)(v34 + a5) - a5;
        v32 = (float)(v32 + a5) - a5;
        v29 = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v35, v27, v28);
        if (v29)
          return v29;
        ++v12;
        if (var1 == v11)
          goto LABEL_15;
      }
    }
  }
  return v9;
}

- (int)renderConvexHull:(id *)a3 distance:(float)a4 fieldToBitmap:(id *)a5
{
  char *var0;
  int var2;
  uint64_t var3;
  int var6;
  int var1;
  int v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  $8F900678518FF6FBDC0D898206FA669F *v18;
  uint64_t v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  float *v24;
  int v25;
  int v26;
  unsigned __int8 *v28;
  $8F900678518FF6FBDC0D898206FA669F *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  float *v36;
  float v37;
  float v38;
  float *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  int v45;
  float *v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  CGPoint *v52;
  double *p_x;
  double *v54;
  double v55;
  float v56;
  float v57;
  double v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  signed int v88;
  int v89;
  signed int v90;
  float v91;
  int v92;
  int v93;
  int v94;
  char *v95;
  char *v96;
  int v97;
  uint64_t v98;
  float v99;
  float v100;
  int v101;
  int i;
  int v103;
  unsigned __int8 *v104;
  char *v105;
  uint64_t v106;
  int v107;
  float *v108;
  char *v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  float v113[12];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v112 = 0;
  v110 = 0u;
  v111 = 0u;
  var0 = a5->var0;
  var2 = a5->var2;
  var3 = a5->var3;
  var6 = a5->var6;
  var1 = a5->var1;
  initBitmap((uint64_t)&v110, var1, var2, var6, 1, 100.0);
  if (!(_QWORD)v110)
    return 45;
  v14 = -[CIRedEyeRepair3 renderHull:toBitmap:](self, "renderHull:toBitmap:", a3, &v110);
  if (!v14)
  {
    v15 = (unsigned __int8 *)v110;
    v16 = (int)v111;
    v17 = SHIDWORD(v111);
    v109 = var0;
    bzero(var0, a5->var5);
    v18 = a3;
    v19 = a3->var1;
    v20 = (float *)malloc_type_malloc(12 * v19, 0x10000403E1C8BA9uLL);
    if (v20)
    {
      v106 = v16;
      v107 = var1;
      v21 = 0;
      v22 = var6;
      v23 = 1;
      v108 = v20;
      v24 = v20;
      while ((v19 & ~((int)v19 >> 31)) != v21)
      {
        if ((int)v19 <= v23)
          v25 = v19;
        else
          v25 = 0;
        v26 = lineEquationThroughTwoPoints(v24, v18->var3[v21].x, v18->var3[v21].y, v18->var3[v23 - v25].x, v18->var3[v23 - v25].y);
        ++v21;
        v24 += 3;
        ++v23;
        if (v26)
        {
          v14 = v26;
          termBitmap((void **)&v110);
          free(v108);
          return v14;
        }
      }
      v28 = v15;
      v29 = v18;
      v30 = v109;
      if ((int)v19 < 1)
      {
LABEL_75:
        free(v108);
        if (var2 >= 1)
        {
          for (i = 0; i != var2; ++i)
          {
            if (v107 >= 1)
            {
              v103 = v107;
              v104 = v28;
              v105 = v30;
              do
              {
                if (*v104 >= 0x79u)
                  *v105 = -1;
                v105 += v22;
                v104 += v17;
                --v103;
              }
              while (v103);
            }
            v30 += var3;
            v28 += v106;
          }
        }
        termBitmap((void **)&v110);
        return 0;
      }
      else
      {
        v31 = 0;
        while (1)
        {
          v32 = v31 ? 0 : v19;
          v33 = v31 + v32;
          v34 = v31 + 1;
          v35 = v31 + 1 >= v19 ? v19 : 0;
          v36 = &v108[3 * v33];
          v37 = *(v36 - 3);
          v38 = *(v36 - 2);
          v39 = &v108[3 * v31];
          v40 = *v39;
          v41 = v39[1];
          v42 = v37 - *v39;
          v43 = v38 - v41;
          v44 = sqrtf((float)(v43 * v43) + (float)(v42 * v42));
          if (v44 == 0.0)
            break;
          v45 = v34 - v35;
          v46 = &v108[3 * ((int)v34 - v35)];
          v47 = *v46;
          v48 = v46[1];
          v49 = v40 - *v46;
          v50 = v41 - v48;
          v51 = sqrtf((float)(v50 * v50) + (float)(v49 * v49));
          if (v51 == 0.0)
            break;
          v52 = v29->var3;
          p_x = &v52[v31].x;
          v54 = &v52[v45].x;
          v55 = *v54;
          v56 = *p_x;
          if (*v54 >= v56)
          {
            v57 = *p_x;
            if (*v54 > v56)
              v56 = v55;
          }
          else
          {
            v57 = v55;
          }
          v58 = v54[1];
          v59 = p_x[1];
          if (v58 >= v59)
          {
            v60 = p_x[1];
            if (v58 > v59)
              v59 = v58;
          }
          else
          {
            v60 = v58;
          }
          v61 = *(v36 - 1);
          v62 = v39[2];
          v63 = v46[2];
          v64 = 1.0 / v44;
          v65 = v42 * v64;
          v66 = v43 * v64;
          v67 = (float)(v61 - v62) * v64;
          v68 = v62 - v63;
          v69 = 1.0 / v51;
          v70 = v62 + a4;
          v71 = v63 + a4;
          v72 = (float)(v41 * (float)(v63 + a4)) - (float)(v48 * v70);
          v73 = (float)(v40 * v48) - (float)(v47 * v41);
          v74 = v72 / v73;
          v75 = (float)((float)(v47 * v70) - (float)(v40 * v71)) / v73;
          v76 = v70 - a4;
          v77 = (float)(v38 * (float)((float)(v70 - a4) + a4)) - (float)(v41 * (float)(v61 + a4));
          v78 = (float)(v37 * v41) - (float)(v40 * v38);
          v79 = v77 / v78;
          v80 = (float)((float)(v40 * (float)(v61 + a4)) - (float)(v37 * (float)((float)(v70 - a4) + a4))) / v78;
          if (v74 > v56)
            v81 = v74;
          else
            v81 = v56;
          if (v74 >= v57)
            v56 = v81;
          else
            v57 = v74;
          if (v75 > v59)
            v82 = v75;
          else
            v82 = v59;
          if (v75 < v60)
          {
            v83 = v59;
          }
          else
          {
            v75 = v60;
            v83 = v82;
          }
          if (v79 > v56)
            v84 = v79;
          else
            v84 = v56;
          if (v79 >= v57)
            v85 = v57;
          else
            v85 = v79;
          if (v79 >= v57)
            v56 = v84;
          if (v80 > v83)
            v86 = v80;
          else
            v86 = v83;
          if (v80 < v75)
          {
            v87 = v83;
          }
          else
          {
            v80 = v75;
            v87 = v86;
          }
          v88 = vcvtps_s32_f32(v56);
          v89 = vcvtms_s32_f32(v80);
          v90 = vcvtps_s32_f32(v87);
          v113[0] = -v40;
          v113[1] = -v41;
          v91 = (float)(v76 + a4) - a4;
          v92 = v89 & ~(v89 >> 31);
          if (var2 < v90)
            v90 = var2;
          if (v107 < v88)
            v88 = v107;
          v113[2] = -v91;
          v113[3] = v65;
          v113[4] = v66;
          v113[5] = v67;
          v113[6] = v40;
          v113[7] = v41;
          v113[8] = v91 + a4;
          v113[9] = -(float)(v49 * v69);
          v113[10] = -(float)(v50 * v69);
          v113[11] = -(float)(v68 * v69);
          if (v92 < v90)
          {
            v93 = vcvtms_s32_f32(v85);
            v94 = v93 & ~(v93 >> 31);
            v95 = &v109[(int)var3 * (uint64_t)v92];
            do
            {
              if (v94 < v88)
              {
                v96 = &v95[v94 * (int)v22];
                v97 = v94;
                do
                {
                  v98 = 0;
                  v99 = (float)v97;
                  while ((float)(v113[v98 + 2] + (float)((float)(v113[v98 + 1] * (float)v92) + (float)(v113[v98] * v99))) > 0.0)
                  {
                    v98 += 3;
                    if ((_DWORD)(v98 * 4) == 48)
                    {
                      v100 = (1.0
                            - (float)((float)((float)((float)((float)-v41 * (float)v92) + (float)(v113[0] * v99)) - v91)
                                    / a4))
                           * 255.0;
                      v101 = (int)rintf(v100);
                      if (v101 >= 255)
                        v101 = 255;
                      *v96 = v101 & ~(v101 >> 31);
                      break;
                    }
                  }
                  ++v97;
                  v96 += v22;
                }
                while (v97 != v88);
              }
              ++v92;
              v95 += var3;
            }
            while (v92 != v90);
          }
          v31 = v34;
          if (v34 == v19)
            goto LABEL_75;
        }
        termBitmap((void **)&v110);
        free(v108);
        return 44;
      }
    }
    else
    {
      termBitmap((void **)&v110);
      return 46;
    }
  }
  return v14;
}

- (CGPoint)centroidWithConvexHull:(id *)a3
{
  int var1;
  float v4;
  uint64_t v5;
  CGPoint *var3;
  float32x2_t v7;
  int v8;
  float64x2_t v9;
  CGPoint *v10;
  float32x2_t v11;
  float64x2_t v12;
  CGPoint *v13;
  float64x2_t v14;
  float32x2_t v15;
  float64x2_t v16;
  float v17;
  float64x2_t v18;
  float v19;
  float64x2_t v20;
  double v21;
  CGPoint result;

  var1 = a3->var1;
  v4 = 0.0;
  if (var1 < 1)
  {
    v11 = 0;
  }
  else
  {
    v5 = 0;
    var3 = a3->var3;
    v7 = 0;
    do
      v7 = vcvt_f32_f64(vaddq_f64((float64x2_t)var3[v5++], vcvtq_f64_f32(v7)));
    while (var1 != (_DWORD)v5);
    v8 = 0;
    v9 = vcvtq_f64_f32(vmul_n_f32(v7, 1.0 / (float)var1));
    v10 = var3 + 1;
    v11 = 0;
    v4 = 0.0;
    v12 = (float64x2_t)vdupq_n_s64(0x3FD5555551C112DAuLL);
    do
    {
      if (v8 >= var1 - 1)
        v13 = a3->var3;
      else
        v13 = v10;
      v14 = (float64x2_t)v10[-1];
      v15 = vcvt_f32_f64(vmulq_f64(vaddq_f64(vaddq_f64(v14, *(float64x2_t *)v13), v9), v12));
      v16 = vsubq_f64(v14, v9);
      v17 = v16.f64[0];
      *(float *)v16.f64 = v16.f64[1];
      v18 = vsubq_f64(*(float64x2_t *)v13, v9);
      v19 = v18.f64[0];
      *(float *)v18.f64 = v18.f64[1];
      *(float *)v16.f64 = fabsf((float)((float)(v17 * *(float *)v18.f64) - (float)(*(float *)v16.f64 * v19)) * 0.5);
      v11 = vmla_n_f32(v11, v15, *(float *)v16.f64);
      v4 = v4 + *(float *)v16.f64;
      ++v8;
      ++v10;
    }
    while (var1 != v8);
  }
  v20 = vcvtq_f64_f32(vmul_n_f32(v11, 1.0 / v4));
  v21 = v20.f64[1];
  result.x = v20.f64[0];
  result.y = v21;
  return result;
}

- (int)analyzeMask:(id *)a3 usingConvexHull:(id *)a4 producingOptimizedMask:(id *)a5
{
  RedEyeInspector3 *inspector;
  int v10;
  int var1;
  double v12;
  double v13;
  double v14;
  double v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  CGPoint *var3;
  char *v23;
  double y;
  double x;
  int v26;
  float v27;
  float v28;
  float v29;
  double v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  int v36;
  double v37;
  double v38;
  float v39;
  unsigned int v40;
  unsigned int v41;
  double v42;
  double v43;
  int v44;
  float v45;
  float v46;
  int v47;
  int v48;
  signed int v49;
  int v50;
  int v51;
  double v52;
  float v53;
  int v54;
  float v55;
  float v56;
  float v57;
  float v58;
  int *v59;
  int v60;
  float v61;
  float v62;
  int v63;
  int v64;
  char *v65;
  uint64_t v66;
  char *v67;
  int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  char *v75;
  int v76;
  _QWORD *v77;
  int v78;
  char *var0;
  uint64_t var6;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  float v85;
  float v86;
  double v87;
  double v88;
  char *v93;
  int v94;
  char *v95;
  double v96;
  double v97;
  float64x2_t v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  double v105;
  float v106;
  float v107;
  signed int v108;
  signed int v109;
  int v110;
  int v111;
  float v112;
  float v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  char *v119;
  char *v120;
  float v121;
  float v122;
  float32x2_t v123;
  float v124;
  char *v125;
  float *v126;
  float *v127;
  char *v128;
  char *v129;
  int v130;
  uint64_t v131;
  float v132;
  float v133;
  float v134;
  float v135;
  unsigned int v136;
  float v137;
  int v138;
  char *v140;
  char *v141;
  int v142;
  float64x2_t v143;
  int var2;
  int v145;
  $07A02DD24AF34610473D9D0940B06C4B *v146;
  int v147;
  int v148;
  char *v149;
  int v150;
  int v151;
  int v152;
  uint64_t v153;
  float v154;
  float32x2_t v155;
  float v156;
  float v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  inspector = self->inspector;
  if (inspector)
    v10 = -[RedEyeInspector3 debuggingThisFaceAndEye:](inspector, "debuggingThisFaceAndEye:", &self->S);
  else
    v10 = 0;
  var1 = a4->var1;
  if (!var1)
    return 3;
  -[CIRedEyeRepair3 centroidWithConvexHull:](self, "centroidWithConvexHull:", a4);
  v13 = v12;
  v15 = v14;
  v16 = (char *)malloc_type_malloc(80 * var1, 0x10000404E27CAF5uLL);
  if (!v16)
    return 4;
  v17 = v16;
  v149 = v16;
  v150 = var1;
  if (var1 >= 1)
  {
    v146 = a5;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    var3 = a4->var3;
    v23 = v16;
    while (1)
    {
      x = var3->x;
      y = var3->y;
      *((_QWORD *)v23 + 2) = *(_QWORD *)&var3->x;
      *((double *)v23 + 3) = y;
      v26 = lineEquationThroughTwoPoints((float *)v23, v13, v15, x, y);
      if (v26)
        goto LABEL_120;
      v27 = x - v13;
      v28 = y - v15;
      *((double *)v23 + 4) = v27;
      *((double *)v23 + 5) = v28;
      if (v10)
        printf("sector %d:\n", v18);
      v151 = v20;
      v29 = sqrtf((float)(v28 * v28) + (float)(v27 * v27));
      v30 = v29;
      v31 = 1.0 / v29;
      v32 = v31 * v27;
      v33 = v31 * v28;
      v34 = v30 * 0.8;
      v35 = fminf(v34, 4.0);
      v36 = (int)rintf(v35 + v35);
      v37 = x - (float)(v32 * v35);
      v38 = y - (float)(v33 * v35);
      v39 = v37;
      *(float *)&v30 = v38;
      v40 = bilinearLookup((uint64_t)a3, v39, *(float *)&v30);
      v41 = v40;
      *((_DWORD *)v23 + 12) = v40;
      *(_QWORD *)(v23 + 52) = v40;
      if (v36 < 2)
      {
        v49 = 0;
        v51 = v40;
        v50 = v40;
        if (!v10)
          goto LABEL_24;
      }
      else
      {
        v42 = v32;
        v43 = v33;
        v44 = v36 - 1;
        do
        {
          v37 = v37 + v42;
          v38 = v38 + v43;
          v45 = v37;
          v46 = v38;
          v47 = bilinearLookup((uint64_t)a3, v45, v46);
          v48 = v47;
          if (v10)
            printf("%d ", v47);
          v49 = *((_DWORD *)v23 + 14);
          if ((int)(v41 - v48) > v49)
          {
            *((_DWORD *)v23 + 14) = v41 - v48;
            v49 = v41 - v48;
          }
          v50 = *((_DWORD *)v23 + 13);
          if (v48 > v50)
          {
            *((_DWORD *)v23 + 13) = v48;
            v50 = v48;
          }
          v51 = *((_DWORD *)v23 + 12);
          if (v48 < v51)
          {
            *((_DWORD *)v23 + 12) = v48;
            v51 = v48;
          }
          v41 = v48;
          --v44;
        }
        while (v44);
        if (!v10)
          goto LABEL_24;
      }
      printf(" -- max %d min %d grad %d\n", v50, v51, v49);
      v51 = *((_DWORD *)v23 + 12);
      v50 = *((_DWORD *)v23 + 13);
      v49 = *((_DWORD *)v23 + 14);
LABEL_24:
      var1 = v150;
      v52 = (float)(v50 - v51);
      v53 = 255.0 / (v52 * 0.8);
      *(float *)&v52 = -(((float)v51 + v52 * 0.1) * v53);
      *((float *)v23 + 15) = v53;
      *((_DWORD *)v23 + 16) = LODWORD(v52);
      v19 += v49;
      v21 += v50;
      v20 = v51 + v151;
      ++v18;
      ++var3;
      v23 += 80;
      if (v18 == v150)
      {
        v55 = (float)v21;
        v56 = (float)v19;
        v57 = (float)v20;
        v17 = v149;
        a5 = v146;
        goto LABEL_31;
      }
    }
  }
  v55 = 0.0;
  v57 = 0.0;
  v56 = 0.0;
LABEL_31:
  v58 = v55 / (float)var1;
  if (v10)
    printf("max average %.1f min average %.1f max gradient %.1f\n", v58, (float)(v57 / (float)var1), (float)(v56 / (float)var1));
  if (var1 >= 1)
  {
    v59 = (int *)(v17 + 76);
    v60 = var1;
    do
    {
      v61 = *((float *)v59 - 4);
      v62 = *((float *)v59 - 3);
      v63 = (int)rintf(v62 + (float)(v58 * v61));
      if (v63 >= 255)
        v63 = 255;
      *v59 = v63 & ~(v63 >> 31);
      *((float *)v59 - 2) = v61;
      *((float *)v59 - 1) = v62;
      v59 += 20;
      --v60;
    }
    while (v60);
    v64 = 0;
    v65 = v17 + 156;
    v66 = -1;
    v67 = v17;
    do
    {
      if (*((int *)v67 + 19) <= 199 && var1 != 1)
      {
        v69 = -1;
        v70 = v66;
        while (1)
        {
          v71 = var1 & ((v64 + v69) >> 31);
          v72 = v70 + v71;
          if (*(int *)&v17[80 * v72 + 76] > 200)
            break;
          --v69;
          --v70;
          if (!(var1 + v69))
            goto LABEL_60;
        }
        if (var1 + v69)
        {
          if (var1 == 1)
          {
            v73 = v64 + v71 + v69;
            v74 = 1;
          }
          else
          {
            v74 = 1;
            v75 = v65;
            while (1)
            {
              v76 = v64 + v74 >= var1 ? var1 : 0;
              if (*(int *)&v75[-80 * v76] > 200)
                break;
              v75 += 80;
              if (var1 == ++v74)
                goto LABEL_60;
            }
            v73 = v64 - v76 + v74;
          }
          if (v74 != var1)
            *(float32x2_t *)(v67 + 68) = vmla_n_f32(*(float32x2_t *)&v17[80 * v72 + 60], vsub_f32(*(float32x2_t *)&v17[80 * v73 + 60], *(float32x2_t *)&v17[80 * v72 + 60]), (float)-(float)v69 / (float)(v74 - v69));
        }
      }
LABEL_60:
      ++v64;
      v67 += 80;
      ++v66;
      v65 += 80;
    }
    while (v64 != var1);
    v77 = v17 + 68;
    v78 = var1;
    do
    {
      *(v77 - 1) = *v77;
      v77 += 10;
      --v78;
    }
    while (v78);
  }
  var0 = a3->var0;
  var6 = a3->var6;
  v81 = a3->var3;
  var2 = a3->var2;
  v145 = a3->var1;
  v82 = a5->var3;
  v83 = a5->var6;
  v140 = a5->var0;
  v141 = var0;
  bzero(a5->var0, a5->var5);
  if (var1 < 1)
  {
LABEL_119:
    free(v149);
    return 0;
  }
  else
  {
    v84 = 0;
    v85 = v13;
    v86 = v15;
    v87 = v85;
    v88 = v86;
    __asm { FMOV            V0.2D, #5.0 }
    v143 = _Q0;
    v93 = v149;
    v142 = v10;
    while (1)
    {
      if (v84 + 1 == var1)
        v94 = 0;
      else
        v94 = v84 + 1;
      v95 = &v149[80 * v94];
      v96 = *((double *)v93 + 2) + *((double *)v93 + 4) * 5.0;
      v97 = *((double *)v93 + 3) + *((double *)v93 + 5) * 5.0;
      v98 = vmlaq_f64(*((float64x2_t *)v95 + 1), v143, *((float64x2_t *)v95 + 2));
      v99 = v96;
      if (v96 > v87)
        v100 = v96;
      else
        v100 = v85;
      if (v96 < v87)
      {
        v101 = v85;
      }
      else
      {
        v99 = v85;
        v101 = v100;
      }
      if (v97 > v88)
        v102 = v97;
      else
        v102 = v86;
      if (v97 < v88)
        v103 = v97;
      else
        v103 = v86;
      if (v97 < v88)
        v104 = v86;
      else
        v104 = v102;
      v105 = v99;
      if (v98.f64[0] > v101)
        v106 = v98.f64[0];
      else
        v106 = v101;
      if (v98.f64[0] < v105)
        v107 = v98.f64[0];
      else
        v107 = v99;
      if (v98.f64[0] >= v105)
        v101 = v106;
      v152 = v84 + 1;
      v147 = v84;
      v148 = v94;
      if (v98.f64[1] >= v103)
      {
        if (v98.f64[1] > v104)
          v104 = v98.f64[1];
      }
      else
      {
        v103 = v98.f64[1];
      }
      v108 = vcvtps_s32_f32(v101);
      v109 = vcvtps_s32_f32(v104);
      v110 = var2 >= v109 ? v109 : var2;
      v111 = v145 >= v108 ? v108 : v145;
      v153 = *(_QWORD *)v93;
      v154 = *((float *)v93 + 2);
      v156 = *((float *)v95 + 2);
      v155 = *(float32x2_t *)v95;
      v155 = vneg_f32(v155);
      v156 = -v156;
      v26 = lineEquationThroughTwoPoints(&v157, v96, v97, v98.f64[0], v98.f64[1]);
      if (v26)
        break;
      var1 = v150;
      if (v142)
      {
        printf("sector %d ", v147);
        v112 = *((float *)v93 + 15);
        v113 = *((float *)v93 + 16);
        v114 = (int)rintf(v113 + (float)(v58 * v112));
        if (v114 >= 255)
          v114 = 255;
        printf("factor %.3f offset %.3f max sample %d\n", v112, v113, v114 & ~(v114 >> 31));
      }
      v115 = vcvtms_s32_f32(v103);
      v116 = v115 & ~(v115 >> 31);
      if (v116 < v110)
      {
        v117 = vcvtms_s32_f32(v107);
        v118 = v117 & ~(v117 >> 31);
        v119 = &v140[(int)v82 * (uint64_t)v116];
        v120 = &v141[(int)v81 * (uint64_t)v116];
        v121 = *((float *)&v153 + 1);
        v122 = v154;
        v123 = v155;
        v124 = v156;
        v125 = &v149[80 * v148];
        v126 = (float *)(v125 + 60);
        v127 = (float *)(v125 + 64);
        do
        {
          if (v118 < v111)
          {
            v128 = &v119[(int)v83 * (uint64_t)v118];
            v129 = &v120[(int)var6 * (uint64_t)v118];
            v130 = v118;
            do
            {
              v131 = 0;
              v132 = (float)v130;
              while ((float)(*(float *)((char *)&v153 + v131 + 8)
                            + (float)((float)(*(float *)((char *)&v153 + v131 + 4) * (float)v116)
                                    + (float)(*(float *)((char *)&v153 + v131) * v132))) > 0.0)
              {
                v131 += 12;
                if ((_DWORD)v131 == 36)
                {
                  v133 = (float)(v122 + (float)((float)(v121 * (float)v116) + (float)(*(float *)&v153 * v132)))
                       / (float)((float)(v122 + (float)((float)(v121 * (float)v116) + (float)(*(float *)&v153 * v132)))
                               + (float)(v124 + (float)((float)(v123.f32[1] * (float)v116) + (float)(v123.f32[0] * v132))));
                  v134 = *((float *)v93 + 16);
                  v135 = *((float *)v93 + 15) + (float)(v133 * (float)(*v126 - *((float *)v93 + 15)));
                  *(float *)&v136 = *v127 - v134;
                  v137 = v134 + (float)(v133 * *(float *)&v136);
                  LOBYTE(v136) = *v129;
                  v138 = (int)rintf(v137 + (float)((float)v136 * v135));
                  if (v138 >= 255)
                    v138 = 255;
                  *v128 = v138 & ~(v138 >> 31);
                  break;
                }
              }
              ++v130;
              v129 += var6;
              v128 += v83;
            }
            while (v130 != v111);
          }
          ++v116;
          v120 += v81;
          v119 += v82;
        }
        while (v116 != v110);
      }
      v93 += 80;
      v84 = v152;
      if (v152 == v150)
        goto LABEL_119;
    }
LABEL_120:
    v54 = v26;
    free(v149);
  }
  return v54;
}

- (BOOL)edgePoint:(CGPoint *)a3 withBitmap:(id *)a4 center:(CGPoint)a5 perp:(CGPoint)a6
{
  double y;
  double x;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  int *p_samplesPerPixel;
  double v14;
  float v15;
  float v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  _DWORD *v45;
  int v46;
  int i;
  int v48;
  int v49;
  int v50;
  float v51;
  float v52;
  float v53;
  float v54;
  double v55;
  double v56;
  float v57;
  float v58;
  float v59;
  double v60;
  BOOL result;
  uint64_t v63;
  _QWORD v64[5];
  int v65;
  _QWORD v66[24];

  y = a6.y;
  x = a6.x;
  v9 = a5.y;
  v10 = a5.x;
  v11 = 0;
  v66[22] = *MEMORY[0x1E0C80C00];
  v63 = 0;
  v64[0] = 0;
  v12 = a5.x + a6.x * -7.0;
  p_samplesPerPixel = &self->fullBitmap.samplesPerPixel;
  v14 = a5.y + a6.y * -7.0;
  do
  {
    v15 = v14;
    v16 = v12;
    bilinearARGB8LookupComponents((uint64_t)a4, (_DWORD *)&v63 + 1, v64, (_DWORD *)v64 + 1, &v63, v16, v15);
    switch(p_samplesPerPixel[124])
    {
      case 1:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v19 = 1202 * LODWORD(v64[0]) + 2660 * HIDWORD(v64[0]) + 234 * HIDWORD(v63);
        goto LABEL_13;
      case 2:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v23 = 257 * HIDWORD(v64[0]) * LODWORD(v64[0]) - 13107 * HIDWORD(v63) + 0x8000;
        v24 = v23 >> 16;
        goto LABEL_11;
      case 3:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v23 = ((2 * HIDWORD(v64[0])) | 1) - (LODWORD(v64[0]) + HIDWORD(v63));
        v24 = v23 >> 1;
LABEL_11:
        v22 = v24 & ~(v23 >> 31);
        break;
      case 4:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v19 = 2404 * LODWORD(v64[0]) + 1225 * HIDWORD(v64[0]) + 467 * HIDWORD(v63);
LABEL_13:
        v22 = (v19 + 2048) >> 12;
        break;
      case 5:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v22 = HIDWORD(v64[0]);
        break;
      case 6:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v25 = ((1638 * ((257 * HIDWORD(v63) * ((257 * HIDWORD(v64[0]) * LODWORD(v64[0])) >> 16)) >> 16) + 2048) >> 12)
            + ((-4915 * LODWORD(v64[0]) + (HIDWORD(v64[0]) << 13) + 1229) >> 12);
        if (v25 >= 255)
          v25 = 255;
        goto LABEL_45;
      case 7:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        if (10 * HIDWORD(v64[0]) <= 2295)
          v27 = 2295;
        else
          v27 = 10 * HIDWORD(v64[0]);
        v28 = 10 * LODWORD(v64[0]);
        if (10 * LODWORD(v64[0]) <= 2295)
          v28 = 2295;
        v29 = v28 - 2295;
        v30 = 5 * HIDWORD(v63);
        if (5 * HIDWORD(v63) <= 1020)
          v30 = 1020;
        v31 = ((257 * v30 - 262140) * (((257 * v27 - 589815) * v29) >> 16)) >> 16;
        v26 = 257
            * ((HIDWORD(v64[0]) - HIDWORD(v63)) & ~((HIDWORD(v64[0]) - HIDWORD(v63)) >> 31))
            * ((2570
              * HIDWORD(v64[0])
              * ((HIDWORD(v64[0]) - LODWORD(v64[0])) & ~((HIDWORD(v64[0]) - LODWORD(v64[0])) >> 31))) >> 16);
        v22 = (v31 + (v26 >> 16)) & ~((v31 + (v26 >> 16)) >> 31);
        goto LABEL_42;
      case 8:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        if (SHIDWORD(v64[0]) <= SLODWORD(v64[0]))
          v32 = v64[0];
        else
          v32 = HIDWORD(v64[0]);
        if (SHIDWORD(v64[0]) >= SLODWORD(v64[0]))
          v33 = v64[0];
        else
          v33 = HIDWORD(v64[0]);
        if (SHIDWORD(v63) > v32)
          v32 = HIDWORD(v63);
        if (SHIDWORD(v63) < v33)
          v33 = HIDWORD(v63);
        v34 = v32 - v33;
        v35 = v32 + v33;
        if (v35 > 255)
          v35 = 510 - v35;
        if (v35 <= 1)
          v35 = 1;
        v36 = 255 * v34 / v35;
        if (v36 >= 255)
          v36 = 255;
        v37 = 257
            * v34
            * ((257
              * ((2404 * LODWORD(v64[0]) + 1225 * HIDWORD(v64[0]) + 467 * HIDWORD(v63) + 2048) >> 12)
              * ((257 * ((257 * HIDWORD(v64[0]) * LODWORD(v64[0])) >> 16) * v36) >> 16)) >> 16);
        v22 = (__int16)(v37 >> 14) & ~((4 * v37) >> 31);
LABEL_42:
        if (v22 >= 255)
          v22 = 255;
        break;
      case 9:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v25 = HIDWORD(v64[0]) - (LODWORD(v64[0]) + ((257 * HIDWORD(v64[0]) * LODWORD(v64[0])) >> 16));
LABEL_45:
        v22 = v25 & ~(v25 >> 31);
        break;
      default:
        v18 = v64[0];
        v17 = HIDWORD(v64[0]);
        v20 = -4915 * LODWORD(v64[0]) + (HIDWORD(v64[0]) << 13);
        v21 = (v20 + 1229) >> 12;
        if (v21 >= 0xFF)
          v21 = 255;
        if (v20 >= -1229)
          v22 = v21;
        else
          v22 = 0;
        break;
    }
    v38 = (int *)&v64[v11 + 1];
    *v38 = v22;
    v38[1] = v17;
    v39 = HIDWORD(v63);
    v38[2] = v18;
    v38[3] = v39;
    v12 = x + v16;
    v14 = y + v15;
    v11 += 2;
  }
  while (v11 != 30);
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v44 = v65;
  v45 = v66;
  v46 = -1;
  for (i = 2; i != 13; ++i)
  {
    v48 = *(v45 - 16) + ((6144 * *(v45 - 12) + 2048) >> 12);
    v49 = *(v45 - 4);
    v50 = *v45 + ((6144 * v49 + 2048) >> 12);
    if (v50 > v48 && v50 - v48 > v43)
    {
      v41 = v44 + ((6144 * v44 + 2048) >> 12);
      v43 = v50 - v48;
      v42 = *(v45 - 16) + ((6144 * *(v45 - 12) + 2048) >> 12);
      v40 = *v45 + ((6144 * v49 + 2048) >> 12);
      v46 = i;
    }
    v45 += 4;
    v44 = v49;
  }
  if (v46 == -1)
  {
    v55 = 0.0;
    v56 = 0.0;
  }
  else
  {
    v51 = (float)v40;
    v52 = (float)v41;
    v53 = (float)((float)v42 + (float)v40) * 0.5;
    if ((float)v41 >= (float)v42)
    {
      v57 = 0.0;
      if (v53 > v52)
        v57 = (float)(v53 - v52) / (float)(v51 - v52);
      v58 = (float)((float)(v53 - (float)v42) / (float)(v52 - (float)v42)) + -1.0;
      if (v53 < v52)
        v59 = (float)((float)(v53 - (float)v42) / (float)(v52 - (float)v42)) + -1.0;
      else
        v59 = v57;
      if (v52 > v51)
        v54 = v58;
      else
        v54 = v59;
    }
    else
    {
      v54 = (float)(v53 - v52) / (float)(v51 - v52);
    }
    v60 = (float)(v54 + (float)(v46 - 7));
    v55 = v10 + v60 * x;
    v56 = v9 + v60 * y;
  }
  result = v46 != -1;
  a3->x = v55;
  a3->y = v56;
  return result;
}

+ (void)insertIntoConnectionHopper:(id *)a3 index1:(int)a4 drop1:(int)a5 index2:(int)a6 drop2:(int)a7 score:(float)a8
{
  uint64_t var0;
  uint64_t v9;
  float *p_var4;
  int v11;
  uint64_t v12;
  $789BBD900715E5B0855DE2613310D737 *v13;
  char *v14;
  int v15;

  var0 = a3->var0;
  if ((int)var0 < 1)
  {
    LODWORD(v9) = 0;
LABEL_9:
    if ((int)var0 <= 18)
      v11 = var0 - 1;
    else
      v11 = 18;
    if (v11 >= (int)v9)
    {
      v12 = v11 + 1;
      v13 = &a3->var1[v11 + 1];
      do
      {
        *(_OWORD *)&v13->var0 = *(_OWORD *)&v13[-1].var0;
        v13->var4 = v13[-1].var4;
        --v13;
        --v12;
      }
      while (v12 > v9);
      LODWORD(var0) = a3->var0;
    }
    v14 = (char *)a3 + 20 * v9;
    *((_DWORD *)v14 + 1) = a4;
    *((_DWORD *)v14 + 2) = a5;
    *((_DWORD *)v14 + 3) = a6;
    *((_DWORD *)v14 + 4) = a7;
    *((float *)v14 + 5) = a8;
    if ((int)var0 < 20)
      v15 = var0 + 1;
    else
      v15 = 20;
    a3->var0 = v15;
    return;
  }
  v9 = 0;
  p_var4 = &a3->var1[0].var4;
  while (*p_var4 <= a8)
  {
    ++v9;
    p_var4 += 5;
    if (var0 == v9)
    {
      LODWORD(v9) = a3->var0;
      break;
    }
  }
  if (v9 <= 0x13)
    goto LABEL_9;
}

- (void)printConnectionHopper:(id *)a3 message:(char *)a4
{
  int v5;
  uint64_t v6;

  printf("\n%s -- hopper with %d elements total\n", a4, a3->var0);
  if (a3->var0 >= 1)
  {
    v5 = 0;
    v6 = 4;
    do
    {
      printf("  element %d i %3d/%d j %3d/%d score %5.3f\n", v5++, *(int *)((char *)&a3->var0 + v6), *(int *)((char *)&a3->var1[0].var0 + v6), *(int *)((char *)&a3->var1[0].var1 + v6), *(int *)((char *)&a3->var1[0].var2 + v6), *(float *)((char *)&a3->var1[0].var3 + v6));
      v6 += 20;
    }
    while (v5 < a3->var0);
  }
}

- (void)printThreadWithIndex:(int)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;

  threads = self->G.threads;
  if (*((_BYTE *)threads + 96 * a3 + 24))
  {
    printf("  ");
    if (*((_BYTE *)threads + 96 * a3 + 25))
      printf("closed ");
    printf("thread %3d start %4d end %4d %3d points length %5.1f turn %6.1f");
  }
  else
  {
    printf("attempt to print invalid thread %d\n");
  }
}

- (void)printThreadsOnlyClosed:(BOOL)a3 message:(char *)a4
{
  _BOOL4 v4;
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  int nThreads;
  uint64_t v8;
  _BYTE *v9;

  v4 = a3;
  p_G = &self->G;
  printf("\n%s -- %d threads total\n", a4, self->G.nThreads);
  nThreads = p_G->nThreads;
  if (nThreads >= 1)
  {
    v8 = 0;
    v9 = (char *)p_G->threads + 25;
    do
    {
      if (*(v9 - 1) && (!v4 || *v9))
      {
        -[CIRedEyeRepair3 printThreadWithIndex:](self, "printThreadWithIndex:", v8);
        putchar(10);
        nThreads = p_G->nThreads;
      }
      v9 += 96;
      v8 = (v8 + 1);
    }
    while ((int)v8 < nThreads);
  }
}

- (int)gatherThreadInfo:(id *)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  int var0;
  char *v6;
  int v7;
  double *v8;
  double v9;
  double v10;
  unsigned int v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  long double v24;
  int result;

  if (!a3->var6)
    return 35;
  points = self->G.points;
  var0 = a3->var0;
  v6 = (char *)points + 96 * a3->var0;
  a3->var5 = *((_DWORD *)v6 + 20);
  v7 = *((_DWORD *)v6 + 17);
  if (v7 == -1)
  {
    v16 = 0.0;
    v11 = 1;
    v15 = 0.0;
  }
  else
  {
    v8 = (double *)((char *)points + 96 * var0);
    v9 = *v8;
    v10 = v8[1];
    v11 = 1;
    v12 = 0.0;
    v13 = 1.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    do
    {
      v17 = v9;
      v18 = v10;
      v19 = (double *)((char *)points + 96 * v7);
      v9 = *v19;
      v10 = v19[1];
      *(float *)&v17 = *v19 - v17;
      *(float *)&v18 = v10 - v18;
      v20 = sqrtf((float)(*(float *)&v18 * *(float *)&v18) + (float)(*(float *)&v17 * *(float *)&v17));
      v21 = v13 / fmaxf(v20, 0.00001);
      v22 = v21 * *(float *)&v17;
      v23 = v21 * *(float *)&v18;
      if (v11 >= 2)
      {
        v24 = asin((float)((float)(v14 * v23) - (float)(v22 * v12)));
        v13 = 1.0;
        v15 = v24 + v15;
      }
      v16 = v16 + v20;
      ++v11;
      v7 = *((_DWORD *)points + 24 * v7 + 17);
      v12 = v23;
      v14 = v22;
    }
    while (v7 != -1);
  }
  result = 0;
  a3->var2 = v11;
  a3->var3 = v16;
  a3->var4 = v15;
  return result;
}

- (int)findThreadsInGrid
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  int nPoints;
  uint64_t v5;
  CGFloat *p_y;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  int v8;
  uint64_t v9;
  int v10;
  int result;
  _DWORD *v12;
  _DWORD *v13;

  p_G = &self->G;
  self->G.nThreads = 0;
  nPoints = self->G.nPoints;
  if (nPoints < 1)
    return 0;
  v5 = 0;
  v13 = 0;
  p_y = &self->FC.rightEye.y;
  while (1)
  {
    points = p_G->points;
    if (*((_DWORD *)points + 24 * v5 + 18) == -1)
    {
      v8 = *((_DWORD *)points + 24 * v5 + 17);
      if (v8 != -1)
        break;
    }
LABEL_4:
    if (++v5 >= nPoints)
      return 0;
  }
  v9 = v5;
  do
  {
    v10 = v8;
    if (*((_DWORD *)points + 24 * v9 + 20) != *((_DWORD *)points + 24 * v5 + 20))
      return 33;
    v9 = v8;
    v8 = *((_DWORD *)points + 24 * v8 + 17);
  }
  while (v8 != -1);
  result = -[CIRedEyeRepair3 newThread:](self, "newThread:", &v13);
  if (!result)
  {
    v12 = v13;
    *v13 = v5;
    v12[1] = v10;
    *((_WORD *)v12 + 12) = 1;
    *((CGFloat *)v12 + 11) = p_y[62];
    result = -[CIRedEyeRepair3 gatherThreadInfo:](self, "gatherThreadInfo:");
    if (!result)
    {
      nPoints = p_G->nPoints;
      goto LABEL_4;
    }
  }
  return result;
}

- (int)connectThreadsInGrid
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  CIRedEyeRepair3 *v3;
  uint64_t v4;
  double v5;
  int nThreads;
  int *p_mincol;
  __int128 *v8;
  int v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  double *v11;
  int v12;
  uint64_t v13;
  float v14;
  __int128 *v15;
  int *v16;
  uint64_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  uint64_t v19;
  uint64_t v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  float v27;
  uint64_t v30;
  int result;
  int v32;
  int *v33;
  _DWORD *v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  char *v39;
  CIRedEyeRepair3 *v40;
  int *v41;
  char v42;
  _QWORD v43[5];
  int v44;
  __int128 v45;
  _OWORD v46[24];

  memset(v46, 0, sizeof(v46));
  v45 = 0u;
  p_G = &self->G;
  if (self->G.nThreads >= 1)
  {
    v3 = self;
    v4 = 0;
    do
    {
      -[CIRedEyeRepair3 putThreadAtIndex:](v3, "putThreadAtIndex:", v4);
      v4 = (v4 + 1);
      nThreads = p_G->nThreads;
    }
    while ((int)v4 < nThreads);
    if (nThreads >= 1)
    {
      p_mincol = &v3->subRectangle.mincol;
      v8 = &v45;
      v40 = v3;
      v41 = &v3->subRectangle.mincol;
      while (1)
      {
        v9 = 0;
        v44 = 0;
        threads = p_G->threads;
        do
        {
          if (*((_BYTE *)threads + 24) && !*((_BYTE *)threads + 25))
          {
            v11 = (double *)((char *)p_G->points + 96 * *((int *)threads + 1));
            v43[1] = threads;
            v43[0] = v9;
            v43[2] = v11;
            v43[3] = p_G;
            v43[4] = &v44;
            *(float *)&v5 = *((float *)p_mincol + 124) + *((float *)p_mincol + 124);
            -[CIRedEyeRepair3 forAllGridThreadsNear:withinRadius:do:context:](v3, "forAllGridThreadsNear:withinRadius:do:context:", threadSearchAction, v43, *v11, v11[1], v5);
            nThreads = p_G->nThreads;
          }
          ++v9;
          threads = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)threads + 96);
        }
        while (v9 < nThreads);
        v12 = v44;
        if (v44 >= 1)
          break;
        if (!v44)
          return 0;
LABEL_50:
        result = 0;
        nThreads = p_G->nThreads;
        v3 = v40;
        if (nThreads < 1)
          return result;
      }
      v13 = 0;
      v42 = 0;
      while (1)
      {
        v14 = *((float *)v46 + 5 * v13);
        if (v14 > *((float *)p_mincol + 124) && (v42 & 1) == 0)
          break;
        v15 = v8;
        v16 = &v44 + 5 * v13;
        v17 = v16[1];
        v18 = p_G->threads;
        if (!*((_BYTE *)v18 + 96 * (int)v17 + 24))
          return 49;
        v19 = v16[3];
        if (!*((_BYTE *)v18 + 96 * (int)v19 + 24))
          return 49;
        v20 = v16[2];
        points = p_G->points;
        v22 = *((int *)v18 + 24 * (int)v17 + 1);
        v23 = v20;
        if ((int)v20 >= 1)
        {
          do
          {
            LODWORD(v22) = *((_DWORD *)points + 24 * v22 + 18);
            --v23;
          }
          while (v23);
        }
        v24 = v16[4];
        v25 = *((int *)v18 + 24 * (int)v19);
        v26 = v24;
        if ((int)v24 >= 1)
        {
          do
          {
            LODWORD(v25) = *((_DWORD *)points + 24 * v25 + 17);
            --v26;
          }
          while (v26);
        }
        v27 = pointToPointScore((uint64_t)points + 96 * (int)v22, (uint64_t)points + 96 * (int)v25);
        if (v27 != v14 || v27 == -1.0 || v27 == -2.0)
        {
          v30 = v13 + 1;
          v42 = 1;
          p_mincol = v41;
          v8 = v15;
        }
        else
        {
          if ((_DWORD)v17 == (_DWORD)v19)
          {
            *((_BYTE *)v18 + 96 * (int)v17 + 25) = 1;
          }
          else
          {
            result = -[CIRedEyeRepair3 connectThreads:drop1:and:drop2:](v40, "connectThreads:drop1:and:drop2:", v17, v20, v19, v24);
            if (result)
              return result;
            v12 = v44;
          }
          v30 = v13 + 1;
          p_mincol = v41;
          v8 = v15;
          if (v13 + 1 < v12)
          {
            v32 = v13 + 1;
            do
            {
              v33 = &v44 + 5 * v32;
              v36 = v33[1];
              v34 = v33 + 1;
              v35 = v36;
              if (v36 == (_DWORD)v17 || *((_DWORD *)&v45 + 5 * v32 + 2) == (_DWORD)v19)
              {
                v37 = v13 + 2;
                if ((int)v13 + 2 < v12)
                {
                  v38 = v37;
                  v39 = (char *)v15 + 20 * v37;
                  do
                  {
                    *(_OWORD *)(v39 - 20) = *(_OWORD *)v39;
                    *((_DWORD *)v39 - 1) = *((_DWORD *)v39 + 4);
                    ++v38;
                    v12 = v44;
                    v39 += 20;
                  }
                  while (v38 < v44);
                }
                v44 = --v12;
              }
              else
              {
                if (v35 == (_DWORD)v19)
                  *v34 = v17;
                LODWORD(v13) = v32;
              }
              v32 = v13 + 1;
            }
            while ((int)v13 + 1 < v12);
          }
        }
        v12 = v44;
        v13 = v30;
        if (v30 >= v44)
        {
          if (v44)
            goto LABEL_50;
          return 0;
        }
      }
    }
  }
  return 0;
}

- (void)initBitmaps
{
  self->PB.O.baseAddress = 0;
  self->PB.OO.baseAddress = 0;
  self->PB.EP.baseAddress = 0;
  self->PB.D.baseAddress = 0;
  self->PB.G.baseAddress = 0;
  self->PB.M.baseAddress = 0;
  self->PB.S.baseAddress = 0;
  self->PB.P.baseAddress = 0;
}

- (void)termBitmaps
{
  $42BE4D6713D11F14BD59556247296FA3 *p_PB;
  $42BE4D6713D11F14BD59556247296FA3 *v3;
  void **p_baseAddress;
  char *baseAddress;

  p_PB = &self->PB;
  v3 = &self->PB;
  baseAddress = v3->O.baseAddress;
  p_baseAddress = (void **)&v3->O.baseAddress;
  if (baseAddress)
    termBitmap(p_baseAddress);
  if (p_PB->OO.baseAddress)
    termBitmap((void **)&p_PB->OO.baseAddress);
  if (p_PB->EP.baseAddress)
    termBitmap((void **)&p_PB->EP.baseAddress);
  if (p_PB->D.baseAddress)
    termBitmap((void **)&p_PB->D.baseAddress);
  if (p_PB->G.baseAddress)
    termBitmap((void **)&p_PB->G.baseAddress);
  if (p_PB->M.baseAddress)
    termBitmap((void **)&p_PB->M.baseAddress);
  if (p_PB->S.baseAddress)
    termBitmap((void **)&p_PB->S.baseAddress);
  if (p_PB->P.baseAddress)
    termBitmap((void **)&p_PB->P.baseAddress);
}

- (void)removeRedundantPointsFromShape:(id *)a3 closerThan:(float)a4
{
  float v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  uint64_t var0;
  uint64_t v7;
  int v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  double *v10;
  float v11;
  float v12;
  __int128 v13;
  __int128 v14;
  double *v15;
  float v16;
  float v17;

  v4 = a4 * a4;
  var2 = a3->var2;
  var0 = a3->var0;
  if ((int)var0 >= 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = a3->var2;
    while (1)
    {
      if (!v7)
        goto LABEL_7;
      v10 = (double *)((char *)var2 + 48 * v8);
      v11 = *(double *)v9 - *(v10 - 6);
      v12 = *((double *)v9 + 1) - *(v10 - 5);
      if ((float)((float)(v12 * v12) + (float)(v11 * v11)) > v4)
        break;
LABEL_8:
      ++v7;
      v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 48);
      if (var0 == v7)
        goto LABEL_11;
    }
    if (v7 != v8)
    {
      v13 = *(_OWORD *)v9;
      v14 = *((_OWORD *)v9 + 2);
      *((_OWORD *)v10 + 1) = *((_OWORD *)v9 + 1);
      *((_OWORD *)v10 + 2) = v14;
      *(_OWORD *)v10 = v13;
    }
LABEL_7:
    ++v8;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_11:
  v15 = (double *)((char *)var2 + 48 * v8);
  v16 = *(double *)var2 - *(v15 - 6);
  v17 = *((double *)var2 + 1) - *(v15 - 5);
  a3->var0 = v8 - ((float)((float)(v17 * v17) + (float)(v16 * v16)) <= v4);
  -[CIRedEyeRepair3 computeLengthsAnglesAndDeltaAnglesForShape:](self, "computeLengthsAnglesAndDeltaAnglesForShape:");
}

- (void)computeLengthsAnglesAndDeltaAnglesForShape:(id *)a3
{
  int var0;
  int v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  double *v7;
  int v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  float v12;
  double v13;
  double v14;

  var0 = a3->var0;
  if (a3->var0 >= 1)
  {
    v5 = 0;
    var2 = a3->var2;
    do
    {
      if (v5 == var0 - 1)
        v7 = (double *)a3->var2;
      else
        v7 = (double *)((char *)var2 + 48);
      computeLengthAndAngle((uint64_t)var2, v7);
      ++v5;
      var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
      var0 = a3->var0;
    }
    while (v5 < a3->var0);
    if (var0 >= 1)
    {
      v8 = 0;
      v9 = a3->var2;
      v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 48 * var0);
      while (1)
      {
        v11 = v8 ? v9 : v10;
        v12 = *((float *)v9 + 5) - *((float *)v11 - 7);
        v13 = v12;
        if (v12 < -3.14159265)
          break;
        if (v13 >= 3.14159265)
        {
          v14 = v13 + -6.28318531;
          goto LABEL_16;
        }
LABEL_17:
        *((float *)v9 + 6) = v12;
        ++v8;
        v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 48);
        if (var0 == v8)
          return;
      }
      v14 = v13 + 6.28318531;
LABEL_16:
      v12 = v14;
      goto LABEL_17;
    }
  }
}

- (void)removeSmallBumpsFromShape:(id *)a3 center:(CGPoint)a4 threshold:(float)a5
{
  int var0;
  double y;
  int v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  uint64_t v12;
  unsigned int v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  double *v15;
  uint64_t v16;
  double *v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  char *v25;
  int v26;
  CGPoint *v27;
  CGPoint v28;
  float *v29;
  uint64_t v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  float v32;

  var0 = a3->var0;
  if (a3->var0 >= 1)
  {
    y = a4.y;
    v10 = 0;
    var2 = a3->var2;
    v12 = (uint64_t)var2;
    do
    {
      if (var0 >= 4)
      {
        v13 = var0 - 1;
        if (v10 == var0 - 1)
          v14 = var2;
        else
          v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v12 + 48);
        v15 = (double *)((char *)var2 + 48 * var0);
        if (v10)
          v15 = (double *)v12;
        v16 = (var0 - 2);
        if (v10 >= (int)v16)
          v17 = (double *)((char *)var2 + 48 * v10 + -48 * v16);
        else
          v17 = (double *)(v12 + 96);
        LODWORD(a4.x) = *(_DWORD *)(v12 + 24);
        LODWORD(a4.y) = *((_DWORD *)v14 + 6);
        if (*(float *)&a4.x < 0.0 != *(float *)&a4.y < 0.0)
        {
          v18 = fabsf(*(float *)&a4.x) + fabsf(*(float *)&a4.y);
          a4.x = fabsf(*(float *)&a4.x + *(float *)&a4.y);
          a4.y = v18 * 0.333333;
          if (a4.y > a4.x)
          {
            v19 = *(v15 - 6);
            v20 = *(v15 - 5) - y;
            v21 = *(double *)(v12 + 8) - y;
            v22 = *((double *)v14 + 1) - y;
            v23 = v17[1] - y;
            a4.x = (*(double *)v12 + *(double *)v14) * 0.5;
            a4.y = (v21 + v22) * 0.5;
            v24 = (*(double *)v14 - *(double *)v12) * (v21 + v22) * 0.5
                + (*(double *)v12 - v19) * (v20 + v21) * 0.5
                + (*v17 - *(double *)v14) * (v22 + v23) * 0.5;
            *(float *)&v19 = (*v17 - a4.x) * (v23 + a4.y - y) * 0.5 + (a4.x - v19) * (v20 + a4.y - y) * 0.5;
            if (vabds_f32(*(float *)&v19, v24) < a5)
            {
              *(CGPoint *)v12 = a4;
              computeLengthAndAngle((uint64_t)(v15 - 6), (double *)v12);
              computeLengthAndAngle(v12, v17);
              if (v10 == v13)
              {
                memmove(var2, (char *)var2 + 48, 48 * v10--);
                v12 -= 48;
              }
              else if (v10 + 1 < var0)
              {
                v25 = (char *)var2 + 48 * v10 + 48;
                v26 = v10;
                do
                {
                  v27 = (CGPoint *)((char *)var2 + 48 * v26);
                  a4 = *(CGPoint *)v25;
                  *(CGPoint *)&a4.y = (CGPoint)*((_OWORD *)v25 + 1);
                  v28 = (CGPoint)*((_OWORD *)v25 + 2);
                  v27[1] = *(CGPoint *)&a4.y;
                  v27[2] = v28;
                  *v27 = a4;
                  ++v26;
                  v25 += 48;
                }
                while (v13 != v26);
              }
              --a3->var0;
              v29 = (float *)((char *)var2 + 48 * v13);
              v30 = (uint64_t)&v29[12 * v10 - 24];
              if (v10 >= 2)
                v30 = v12 - 96;
              if (v10)
                v29 = (float *)v12;
              v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v12 + 48);
              if (v10 == (_DWORD)v16)
                v31 = var2;
              v32 = *(v29 - 7);
              *(v29 - 6) = v32 - *(float *)(v30 + 20);
              LODWORD(a4.y) = *(_DWORD *)(v12 + 20);
              *(float *)(v12 + 24) = *(float *)&a4.y - v32;
              *(float *)&a4.x = *((float *)v31 + 5) - *(float *)&a4.y;
              *((_DWORD *)v31 + 6) = LODWORD(a4.x);
              --v10;
              v12 -= 48;
              --var0;
            }
          }
        }
      }
      ++v10;
      v12 += 48;
    }
    while (v10 < var0);
  }
  -[CIRedEyeRepair3 computeLengthsAnglesAndDeltaAnglesForShape:](self, "computeLengthsAnglesAndDeltaAnglesForShape:", a3, a4.x, a4.y);
}

- (void)removeSpikesFromShape:(id *)a3
{
  unsigned int v5;
  uint64_t var0;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  int v8;
  int v9;
  int v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  float v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  BOOL v18;
  float v19;
  int v20;
  char v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  float v27;
  int v28;
  int v29;
  int v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  float *v32;
  float v33;
  int v34;
  int v35;
  float v36;
  int v37;
  float v38;
  float v39;
  _BOOL4 v40;
  _BOOL4 v41;
  int v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  __int128 v47;

  v5 = 0;
LABEL_2:
  LODWORD(var0) = a3->var0;
  if (a3->var0 >= 1)
  {
    var2 = a3->var2;
    v8 = -2;
    v9 = 2;
    v10 = 3;
    v11 = var2;
    do
    {
      v12 = 0.0;
      v13 = v9;
      v14 = v8;
      do
      {
        v15 = ((v14 & ~(v14 >> 31)) + v13 - ((v14 & ~(v14 >> 31)) + v13 != 0)) / var0;
        if ((v14 & ~(v14 >> 31)) + v13)
          ++v15;
        v16 = v14 + var0 * v15;
        do
        {
          v17 = v16;
          v18 = __OFSUB__(v16, (_DWORD)var0);
          v16 -= var0;
        }
        while (v16 < 0 == v18);
        v19 = fabsf(*((float *)var2 + 12 * v17 + 6));
        if (v19 > v12)
          v12 = v19;
        ++v14;
        --v13;
      }
      while (v14 != v10);
      *((float *)v11 + 11) = v12;
      v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v11 + 48);
      ++v8;
      --v9;
      v43 = v10++ == (_DWORD)var0 + 2;
    }
    while (!v43);
    v20 = 0;
    v21 = 0;
    while (1)
    {
      v22 = v20 - 2;
      v23 = (v22 & ~(v22 >> 31)) + 2;
      if (v23 == v20)
        v24 = v20;
      else
        v24 = v20 + 1;
      v25 = v23 - v24;
      if (var0 <= 1)
        v26 = 1;
      else
        v26 = var0;
      v27 = *((float *)var2 + 6);
      if (v23 == v20)
        v28 = v25 / v26;
      else
        v28 = v25 / v26 + 1;
      if (v20 <= 0)
        v29 = var0;
      else
        v29 = 0;
      v30 = v20 + v29 - 1;
      v31 = a3->var2;
      v32 = (float *)((char *)v31 + 48 * v30);
      v33 = *((float *)v31 + 12 * (v22 + var0 * v28) + 6);
      v34 = v20 + 1;
      if (v20 + 1 >= (int)var0)
        v35 = var0;
      else
        v35 = 0;
      v36 = *((float *)v31 + 12 * (v34 - v35) + 6);
      v37 = var0 + v20 + 2;
      do
        v37 -= var0;
      while (v37 >= (int)var0);
      v38 = fabsf(v27);
      v39 = *((float *)v31 + 12 * v37 + 6);
      v40 = vabds_f32(v27, v32[6]) > 1.0;
      if (vabds_f32(v27, v33) > 1.0)
        v40 = 1;
      v41 = vabds_f32(v27, v36) > 1.0;
      if (vabds_f32(v27, v39) > 1.0)
        v41 = 1;
      if (v38 <= 1.57079633)
      {
        if (v38 <= 1.0)
          goto LABEL_46;
        v42 = v40 && v41;
      }
      else
      {
        v42 = 1;
      }
      v43 = v38 != *((float *)var2 + 11) || v42 == 0;
      if (!v43)
      {
        if (v34 < (int)var0)
        {
          v44 = v34;
          v45 = 48 * v20;
          do
          {
            v46 = (_OWORD *)((char *)a3->var2 + v45);
            v47 = v46[4];
            *v46 = v46[3];
            v46[1] = v47;
            v46[2] = v46[5];
            ++v44;
            var0 = a3->var0;
            v45 += 48;
          }
          while (v44 < var0);
        }
        LODWORD(var0) = var0 - 1;
        a3->var0 = var0;
        var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 - 48);
        v21 = 1;
        goto LABEL_51;
      }
LABEL_46:
      ++v20;
LABEL_51:
      var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
      if (v20 >= (int)var0)
      {
        if ((v21 & 1) != 0)
        {
          -[CIRedEyeRepair3 computeLengthsAnglesAndDeltaAnglesForShape:](self, "computeLengthsAnglesAndDeltaAnglesForShape:", a3);
          if (v5++ < 2)
            goto LABEL_2;
        }
        return;
      }
    }
  }
}

- (void)slidingWindowAnalysisOfShape:(id *)a3 into:(id *)a4
{
  uint64_t v4;
  int var0;
  uint64_t v6;
  int v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  int v9;
  int v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  int v12;
  int v13;
  int v14;
  float v15;
  int v16;
  int v17;
  int v18;
  float *v19;
  int v20;
  float v21;
  uint64_t v22;
  float v23;
  float *v24;
  _DWORD *v25;
  float *v26;
  float *v27;
  _DWORD *v28;
  int v29;
  int v30;
  float v31;
  float v32;
  float *v33;
  float v34;
  float v35;
  float v36;
  float *v37;
  float v38;

  v4 = 0;
  var0 = a3->var0;
  v6 = 28;
  do
  {
    v7 = var0 >> ++v4;
    if ((var0 >> v4) > 1)
    {
      v10 = v7 >> 1;
      var2 = a3->var2;
      if (v7 < 0)
      {
        v15 = 0.0;
      }
      else
      {
        v12 = -v10;
        if (v10 >= 0)
          v13 = v10;
        else
          v13 = -v10;
        v14 = v13 + 1;
        v15 = 0.0;
        do
        {
          if (v12 >= var0)
            v16 = var0;
          else
            v16 = 0;
          if (v12 >= 0)
            v17 = -v16;
          else
            v17 = var0;
          v15 = v15 + *((float *)var2 + 12 * v17 + 12 * v12++ + 6);
        }
        while (v14 != v12);
      }
      if (var0 >= 1)
      {
        v18 = var0 - v10;
        v19 = (float *)((char *)var2 + v6);
        v20 = var0;
        do
        {
          *v19 = v15;
          v19 += 12;
          v21 = v15 - *((float *)var2 + 12 * v18 + 6);
          if (v18 + 1 == var0)
            v18 = 0;
          else
            ++v18;
          if (v10 + 1 == var0)
            v10 = 0;
          else
            ++v10;
          v15 = v21 + *((float *)var2 + 12 * v10 + 6);
          --v20;
        }
        while (v20);
      }
    }
    else if (var0 >= 1)
    {
      v8 = a3->var2;
      v9 = var0;
      do
      {
        *(_DWORD *)((char *)v8 + v6) = 0;
        v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 48);
        --v9;
      }
      while (v9);
    }
    v6 += 4;
  }
  while (v4 != 4);
  v22 = 0;
  v23 = 1.0 / (float)var0;
  v24 = (float *)((char *)a3->var2 + 28);
  do
  {
    v25 = (_DWORD *)&a4->var0[v22];
    *v25 = 0;
    v25[8] = 0;
    v26 = (float *)(v25 + 8);
    v25[4] = 0;
    v27 = (float *)(v25 + 4);
    v25[12] = 0;
    v28 = v25 + 12;
    if (a3->var0 >= 1)
    {
      v29 = 0;
      v30 = 0;
      v32 = 0.0;
      v33 = v24;
      v34 = 0.0;
      v35 = 0.0;
      while (1)
      {
        v36 = *v33;
        if (*v33 < 0.0)
          *v28 = ++v29;
        if (v30)
        {
          if (v36 >= v34)
          {
            v37 = v26;
            v38 = v36;
            if (v36 <= v32)
              goto LABEL_42;
            goto LABEL_41;
          }
          v37 = v27;
          v38 = v32;
        }
        else
        {
          *v27 = v36;
          v37 = v26;
          v38 = v36;
        }
        v34 = v36;
LABEL_41:
        *v37 = v36;
        v32 = v38;
LABEL_42:
        v31 = 3.14159265 / (float)(1 << v22);
        v35 = vabds_f32(v36, v31) + v35;
        a4->var0[v22] = v35;
        ++v30;
        v33 += 12;
        if (v30 >= a3->var0)
          goto LABEL_47;
      }
    }
    v35 = 0.0;
LABEL_47:
    a4->var0[v22++] = v23 * v35;
    ++v24;
  }
  while (v22 != 4);
}

- (int)updatedCheckpoint:(CGPoint *)a3 withCheckpoint:(CGPoint)a4 checkpointIndex:(int)a5 angle:(float)a6 width:(int)a7 height:(int)a8 inChannel:(id *)a9 threadIndex:(int)a10 returningEdgeWidth:(float *)a11
{
  double y;
  double x;
  char v18;
  char *var0;
  uint64_t var3;
  uint64_t var6;
  uint64_t v22;
  __double2 v23;
  float cosval;
  float sinval;
  float v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  float v42;
  double v43;
  double v44;
  double v45;
  unint64_t BitmapRect;
  unint64_t v47;
  int v48;
  unint64_t v49;
  int var1;
  unint64_t v51;
  int var2;
  int result;
  int v54;
  uint64_t v55;
  char *v56;
  float v57;
  uint64_t v58;
  float v59;
  uint64_t v60;
  float v61;
  uint64_t v62;
  float v63;
  uint64_t v64;
  int v65;
  float v66;
  float v67;
  int v68;
  int v69;
  float *v70;
  int *v71;
  int *v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  uint64_t v77;
  int *v78;
  float *v79;
  float *v80;
  _BYTE *v81;
  uint64_t v82;
  float v83;
  float v84;
  float v85;
  uint64_t v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float *v92;
  unsigned __int8 *v93;
  float v94;
  uint64_t v95;
  float v97;
  int v98;
  int v99;
  float v100;
  float *v101;
  unsigned __int8 *v102;
  float v103;
  uint64_t v104;
  float v105;
  float v107;
  float v108;
  float v109;
  double v110;
  uint64_t v111;
  float v112;
  int v113;
  float v114;
  uint64_t v115;
  float v116;
  float v117;
  float v118;
  float v120;
  double v121;
  float v123;
  double v124;
  uint64_t v125;
  float v126;
  uint64_t v127;
  float v128;
  uint64_t v129;
  float v130;
  uint64_t v131;
  float v132;
  float v133[1];
  int v134;
  float v135[28];
  uint64_t v136;
  _DWORD v137[1];
  int v138;
  _DWORD v139[30];
  _QWORD v140[7];

  y = a4.y;
  x = a4.x;
  v140[4] = *MEMORY[0x1E0C80C00];
  memset(v140, 0, 30);
  v136 = 0;
  memset(v135, 0, sizeof(v135));
  if (self->inspector)
    v18 = -[RedEyeInspector3 debuggingThisFaceAndEye:andThreadIndex:](self->inspector, "debuggingThisFaceAndEye:andThreadIndex:", &self->S, *(_QWORD *)&a10);
  else
    v18 = 0;
  var0 = a9->var0;
  var3 = a9->var3;
  var6 = a9->var6;
  v23 = __sincos_stret(a6);
  cosval = v23.__cosval;
  sinval = v23.__sinval;
  v26 = (float)a7 * 0.5;
  v27 = (float)a8 * 0.5;
  v28 = (float)(v26 * cosval);
  v29 = (float)(v27 * sinval);
  v30 = x + v28 + v29;
  v120 = sinval;
  v31 = (float)(v26 * sinval);
  v123 = cosval;
  v32 = (float)-(float)(cosval * v27);
  v33 = y + v31 + v32;
  v34 = x + v28 - v29;
  v35 = y + v31 - v32;
  v36 = x - v28;
  v37 = v30;
  v38 = v33;
  if (v34 >= v37)
  {
    v39 = v30;
    if (v34 > v37)
      v37 = v34;
  }
  else
  {
    v39 = v34;
  }
  v40 = y - v31;
  v41 = v36 - v29;
  v124 = x;
  if (v35 >= v38)
  {
    v42 = v33;
    if (v35 > v38)
      v38 = v35;
  }
  else
  {
    v42 = v35;
  }
  v43 = v40 - v32;
  if (v41 >= v39)
  {
    if (v41 > v37)
      v37 = v41;
  }
  else
  {
    v39 = v41;
  }
  v44 = v36 + v29;
  v121 = y;
  if (v43 >= v42)
  {
    if (v43 > v38)
      v38 = v43;
  }
  else
  {
    v42 = v43;
  }
  v45 = v40 + v32;
  if (v44 >= v39)
  {
    if (v44 > v37)
      v37 = v44;
  }
  else
  {
    v39 = v44;
  }
  if (v45 >= v42)
  {
    if (v45 > v38)
      v38 = v45;
  }
  else
  {
    v42 = v45;
  }
  v132 = 0.0;
  v131 = 0;
  LODWORD(v22) = vcvtms_s32_f32(v39);
  BitmapRect = makeBitmapRect(v22, vcvtms_s32_f32(v42), vcvtms_s32_f32(v37) + 1, vcvtms_s32_f32(v38) + 1);
  v48 = BitmapRect;
  v49 = v47 & 0xFFFFFFFF00000000;
  if ((v47 & 0x80000000) == 0)
    v49 = v47;
  var1 = a9->var1;
  if (var1 >= SHIDWORD(v49))
    v51 = v49;
  else
    v51 = v49 | ((unint64_t)var1 << 32);
  if (a9->var2 >= SHIDWORD(BitmapRect))
    var2 = HIDWORD(BitmapRect);
  else
    var2 = a9->var2;
  result = lineEquationThroughTwoPoints((float *)&v131, v30, v33, v34, v35);
  if (!result)
  {
    v130 = 0.0;
    v129 = 0;
    result = lineEquationThroughTwoPoints((float *)&v129, v34, v35, v41, v43);
    if (!result)
    {
      v128 = 0.0;
      v127 = 0;
      result = lineEquationThroughTwoPoints((float *)&v127, v41, v43, v44, v45);
      if (!result)
      {
        v126 = 0.0;
        v125 = 0;
        result = lineEquationThroughTwoPoints((float *)&v125, v44, v45, v30, v33);
        if (!result)
        {
          v54 = v48 & ~(v48 >> 31);
          if (a8 >= 1)
          {
            bzero(v137, 4 * a8);
            bzero(v139, 4 * a8);
          }
          if (v54 < var2)
          {
            v55 = v131;
            v56 = &var0[(int)var3 * (uint64_t)v54];
            v57 = v132;
            v58 = v129;
            v59 = v130;
            v60 = v127;
            v61 = v128;
            v62 = v125;
            v63 = v126;
            do
            {
              if ((int)v51 < SHIDWORD(v51))
              {
                v64 = (int)var6 * (uint64_t)(int)v51;
                v65 = v51;
                do
                {
                  v66 = (float)v65;
                  if ((float)(v57
                             + (float)((float)(*((float *)&v55 + 1) * (float)v54) + (float)(*(float *)&v55 * (float)v65))) > 0.0)
                  {
                    v67 = v59 + (float)((float)(*((float *)&v58 + 1) * (float)v54) + (float)(*(float *)&v58 * v66));
                    if (v67 > 0.0
                      && (float)(v61
                               + (float)((float)(*((float *)&v60 + 1) * (float)v54) + (float)(*(float *)&v60 * v66))) > 0.0
                      && (float)(v63
                               + (float)((float)(*((float *)&v62 + 1) * (float)v54) + (float)(*(float *)&v62 * v66))) > 0.0)
                    {
                      v68 = vcvtms_s32_f32(v67);
                      if ((v68 & 0x80000000) == 0 && v68 < a8)
                      {
                        v69 = v56[v64];
                        ++v137[v68];
                        v139[v68] += v69;
                      }
                    }
                  }
                  ++v65;
                  v64 += var6;
                }
                while (HIDWORD(v51) != v65);
              }
              ++v54;
              v56 += var3;
            }
            while (v54 != var2);
          }
          if (a8 < 1)
            return 58;
          v70 = v135;
          v71 = v137;
          v72 = v139;
          v73 = a8;
          do
          {
            v74 = *v72++;
            v75 = v74;
            v76 = *v71++;
            *v70++ = (float)v75 / (float)v76;
            --v73;
          }
          while (v73);
          LOBYTE(v140[0]) = 0;
          if (a8 >= 2)
          {
            v77 = a8 - 1;
            v78 = &v138;
            v79 = &v135[1];
            v80 = (float *)&v134;
            v81 = (char *)v140 + 1;
            do
            {
              if (*(v78 - 1) && *v78)
              {
                *v81 = 1;
                *v80 = fmaxf(*(v79 - 1) - *v79, 0.0);
              }
              else
              {
                *v81 = 0;
              }
              ++v78;
              ++v79;
              ++v80;
              ++v81;
              --v77;
            }
            while (v77);
          }
          v82 = 0;
          v83 = 0.0;
          v84 = 0.0;
          do
          {
            if (*((_BYTE *)v140 + v82))
            {
              v85 = v133[v82];
              v84 = v84 + v85;
              v83 = v83 + (float)((float)(int)v82 * v85);
            }
            ++v82;
          }
          while (a8 != v82);
          if (v84 == 0.0)
          {
            return 58;
          }
          else
          {
            v86 = 0;
            v87 = 0.0;
            v88 = v83 / v84;
            do
            {
              if (*((_BYTE *)v140 + v86))
                v87 = v87
                    + (float)((float)((float)((float)(int)v86 - v88) * (float)((float)(int)v86 - v88)) * v133[v86]);
              ++v86;
            }
            while (a8 != v86);
            v89 = sqrtf(v87 / v84);
            *a11 = v89;
            v90 = -1.0;
            v91 = 0.0;
            v92 = v135;
            v93 = (unsigned __int8 *)v140;
            v94 = 256.0;
            v95 = a8;
            do
            {
              if (*v93++)
              {
                v97 = *v92;
                if (*v92 < v94)
                  v94 = *v92;
                if (v97 > v90)
                  v90 = *v92;
                v91 = v91 + v97;
              }
              ++v92;
              --v95;
            }
            while (v95);
            v98 = 0;
            v99 = 0;
            v100 = 0.0;
            v101 = v135;
            v102 = (unsigned __int8 *)v140;
            v103 = 0.0;
            v104 = a8;
            v105 = v91 / (float)a8;
            do
            {
              if (*v102++)
              {
                v107 = *v101;
                if (*v101 >= v105)
                {
                  v100 = v100 + v107;
                  ++v99;
                }
                else
                {
                  v103 = v103 + v107;
                  ++v98;
                }
              }
              ++v101;
              --v104;
            }
            while (v104);
            v108 = v103 / (float)v98;
            v109 = v100 / (float)v99;
            if ((v18 & 1) != 0)
            {
              v110 = v108;
              printf("checkpoint %d bins (min %.2f max %.2f avg %.2f low avg %.2f high avg %.2f)\n", a5, v94, v90, v105, v108, v109);
              v111 = 0;
              do
              {
                if (*((_BYTE *)v140 + v111))
                {
                  v112 = v135[v111];
                  printf("  %6.2f", v112);
                  printf(" |");
                  if (v111)
                  {
                    v113 = (int)rintf(v135[(v111 - 1)] - v112);
                    if (v113 >= 1)
                    {
                      do
                      {
                        putchar(42);
                        --v113;
                      }
                      while (v113);
                    }
                  }
                  putchar(10);
                }
                ++v111;
              }
              while (v111 != a8);
              printf("mean = %.2f SD = %.2f\n", v88, v89);
            }
            else
            {
              v110 = v108;
            }
            v114 = -(float)((float)a8 * 0.5);
            if (a8 >= 2)
            {
              v115 = 0;
              v116 = v110 + (float)(v109 - v108) * 0.2;
              do
              {
                if (*((_BYTE *)v140 + v115))
                {
                  v117 = v135[v115++];
                  v118 = v135[v115];
                  if (v117 > v116 && v118 <= v116)
                  {
                    v114 = v114 + (float)((float)(v116 - v117) / (float)(v118 - v117));
                    break;
                  }
                }
                else
                {
                  ++v115;
                }
                v114 = v114 + 1.0;
              }
              while (v115 != a8 - 1);
            }
            result = 0;
            a3->x = v124 + (float)(v114 * v120);
            a3->y = v121 + (float)(v114 * (float)-v123);
          }
        }
      }
    }
  }
  return result;
}

- (int)newShape:(id *)a3 byInterpolatingBetweenCheckpoints:(id)a4[100] nc:(int)a5 usingVectorField:(id *)a6
{
  $79F3AD277E97AF61B58637F04D775907 *__attribute__((__org_arrdim(0,100))) v8;
  uint64_t v11;
  uint64_t v12;
  int v13;
  $79F3AD277E97AF61B58637F04D775907 *__attribute__((__org_arrdim(0,100))) v14;
  int v15;
  $79F3AD277E97AF61B58637F04D775907 *v16;
  float v17;
  float v18;
  double v19;
  signed int v20;
  float64x2_t *v21;
  float64x2_t *v22;
  int v23;
  int v24;
  uint64_t v25;
  double *p_x;
  double v27;
  double v28;
  int v29;
  uint64_t v30;
  float64x2_t var0;
  float v32;
  double y;
  float v34;
  float v35;
  double v36;
  $79F3AD277E97AF61B58637F04D775907 *v37;
  int v38;
  double *v39;
  float v40;
  float v41;
  float v42;
  __double2 v43;
  float v44;
  float v45;
  float v46;
  uint64_t v47;
  float64x2_t v48;
  uint64_t v49;
  double *v51;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v52;
  $79F3AD277E97AF61B58637F04D775907 *v53;
  float64x2_t v54;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v55;
  float v56[4];
  uint64_t v57;

  v8 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  if (a5 < 1)
  {
    v13 = 0;
    v12 = 0;
  }
  else
  {
    v11 = 0;
    LODWORD(v12) = 0;
    v13 = 0;
    v14 = a4;
    do
    {
      if (++v11 >= (unint64_t)a5)
        v15 = a5;
      else
        v15 = 0;
      v16 = &v14[-v15];
      v17 = v14->var0.x - v16[1].var0.x;
      v18 = v14->var0.y - v16[1].var0.y;
      v19 = sqrt((float)((float)(v18 * v18) + (float)(v17 * v17)));
      *(float *)&v19 = v19 + v19 + v19 + v19;
      v20 = vcvtps_s32_f32(*(float *)&v19);
      if (v13 <= v20)
        v13 = v20;
      v12 = (v12 + v20);
      ++v14;
    }
    while (a5 != v11);
  }
  v21 = (float64x2_t *)malloc_type_malloc(16 * v13, 0x1000040451B5BE8uLL);
  if (!v21)
    return 27;
  v22 = v21;
  v55 = 0;
  v23 = -[CIRedEyeRepair3 newShape:](self, "newShape:", &v55);
  if (!v23)
  {
    v23 = -[CIRedEyeRepair3 initShapePoints:withMaxPoints:](self, "initShapePoints:withMaxPoints:", v55, v12);
    if (!v23)
    {
      if (a5 < 1)
      {
LABEL_37:
        free(v22);
        v24 = 0;
        *a3 = v55;
        return v24;
      }
      v25 = 0;
      v51 = &v22->f64[1];
      v52 = a3;
      v53 = v8;
      while (1)
      {
        p_x = &v8[v25].var0.x;
        v27 = *p_x;
        v28 = p_x[1];
        v23 = -[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v55, *p_x, v28, v51);
        if (v23)
          break;
        if (++v25 >= (unint64_t)a5)
          v29 = a5;
        else
          v29 = 0;
        v30 = (int)v25 - v29;
        var0 = (float64x2_t)v8[v30].var0;
        v32 = v27 - var0.f64[0];
        y = v8[v30].var0.y;
        v34 = v28 - y;
        v35 = (float)(v34 * v34) + (float)(v32 * v32);
        v36 = sqrt(v35);
        *(float *)&v36 = v36 + v36 + v36 + v36;
        LODWORD(v8) = vcvtps_s32_f32(*(float *)&v36);
        if (v13 < (int)v8)
          goto LABEL_39;
        if ((int)v8 < 1)
          goto LABEL_28;
        v37 = 0;
        v38 = -1;
        v39 = v51;
        v54 = var0;
        do
        {
          v40 = v27;
          v41 = v28;
          bilinearFloat4LookupComponents((uint64_t)a6, v56, v40, v41);
          v42 = 6.28318531 - v56[3];
          v43 = __sincos_stret(v42);
          var0 = v54;
          v27 = v27 + v43.__cosval * 0.5;
          v28 = v28 + v43.__sinval * 0.5;
          *(v39 - 1) = v27;
          *v39 = v28;
          v44 = v54.f64[0] - v27;
          v45 = y - v28;
          v46 = (float)(v45 * v45) + (float)(v44 * v44);
          if (v46 < v35)
          {
            v38 = (int)v37;
            v35 = v46;
          }
          v37 = ($79F3AD277E97AF61B58637F04D775907 *)((char *)v37 + 1);
          v39 += 2;
        }
        while (v8 != v37);
        if (v38 == -1)
LABEL_28:
          v38 = 1;
        if (v38 >= (int)v8)
        {
LABEL_39:
          free(v22);
          return 27;
        }
        v8 = v53;
        if (v38 >= 1)
        {
          v47 = 0;
          v48 = vsubq_f64(var0, v22[v38]);
          do
          {
            v22[v47] = vmlaq_n_f64(v22[v47], v48, (float)((float)(1.0 / (float)v38) * (float)(int)v47));
            ++v47;
          }
          while (v38 != v47);
          v49 = 0;
          while (!-[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v55, v22[v49].f64[0], v22[v49].f64[1]))
          {
            if (v38 == ++v49)
              goto LABEL_36;
          }
          free(v22);
          return 28;
        }
LABEL_36:
        a3 = v52;
        if (v25 == a5)
          goto LABEL_37;
      }
    }
  }
  v24 = v23;
  free(v22);
  return v24;
}

- (int)improvedShape:(id *)a3 withShape:(id *)a4
{
  $42BE4D6713D11F14BD59556247296FA3 *p_PB;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_G;
  RedEyeInspector3 *inspector;
  int v9;
  int var0;
  int v11;
  int v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  char *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  float *v28;
  float v29;
  float v30;
  float v31;
  double v32;
  BOOL v33;
  _BOOL4 v34;
  int v35;
  char *v36;
  char *v37;
  __int128 v38;
  int v39;
  int v40;
  _BYTE *v41;
  uint64_t v42;
  int result;
  uint64_t v44;
  float v45;
  double v46;
  float v47;
  int v48;
  float v49;
  int v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  float v54;
  char *i;
  double v56;
  double v57;
  float v58;
  float v59;
  double v60;
  _BYTE *v61;
  uint64_t v62;
  int var5;
  uint64_t v64;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_D;
  float v67;
  uint64_t v68;
  char v69[256];
  char v70[8];
  _BYTE v71[12];
  _QWORD v72[297];
  float v73[3];
  float v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v68 = 0;
  p_PB = &self->PB;
  p_G = &self->PB.G;
  inspector = self->inspector;
  if (inspector
    && -[RedEyeInspector3 debuggingThisFaceAndEye:andThreadIndex:](inspector, "debuggingThisFaceAndEye:andThreadIndex:", &self->S, a4->var5))
  {
    -[RedEyeInspector3 getIdentifyingString:settings:](self->inspector, "getIdentifyingString:settings:", v70, &self->S);
    printf("\n%s %3d with %d points\n", v70, a4->var5, a4->var0);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  p_D = &p_PB->D;
  var0 = a4->var0;
  if (a4->var0 < 1)
  {
    v22 = 0;
    v14 = 0.0;
    goto LABEL_23;
  }
  v11 = 0;
  v12 = 0;
  var2 = a4->var2;
  v14 = 0.0;
  do
  {
    v15 = *((float *)var2 + 4);
    v16 = *(double *)var2;
    v17 = *((double *)var2 + 1);
    bilinearFloat4LookupComponents((uint64_t)p_G, v73, v16, v17);
    v18 = 6.28318531 - v74 - *((float *)var2 + 5);
    v19 = v18;
    if (v18 >= 3.14159265)
    {
      v20 = v19 + -6.28318531;
    }
    else
    {
      if (v19 >= -3.14159265)
        goto LABEL_12;
      v20 = v19 + 6.28318531;
    }
    v18 = v20;
LABEL_12:
    if (fabsf(v18) < 0.17453)
    {
      if (v11 <= 99)
      {
        v21 = &v70[24 * v11];
        *(_OWORD *)v21 = *(_OWORD *)var2;
        *((_DWORD *)v21 + 4) = v12;
        *((_DWORD *)v21 + 5) = 0;
        ++v11;
      }
      if (v9)
      {
        printf("  %d\n", v12);
        var0 = a4->var0;
      }
    }
    v14 = v14 + v15;
    ++v12;
    var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
  }
  while (v12 < var0);
  v22 = v11;
  if (v11 > 0)
  {
    v23 = 0;
    v24 = 20;
    do
    {
      *(float *)&v70[v24] = checkpointScore(v23++, (uint64_t)v70, v11, (uint64_t)a4);
      v24 += 24;
    }
    while (v11 != v23);
  }
  while (1)
  {
LABEL_23:
    v25 = v22;
    if (v22 < 1)
    {
      v27 = -1;
      v32 = v14;
    }
    else
    {
      v26 = 0;
      v27 = -1;
      v28 = (float *)v72;
      v29 = v14;
      do
      {
        v30 = *v28;
        v28 += 6;
        v31 = v30;
        if (v30 < v29)
        {
          v27 = v26;
          v29 = v31;
        }
        ++v26;
      }
      while (v22 != v26);
      v32 = v29;
    }
    v33 = v14 * 0.1 <= v32 || v22 <= 1;
    v34 = !v33;
    if (v22 <= 10 && !v34)
      break;
    v35 = v27 + 1;
    if (v27 + 1 < v22)
    {
      v36 = &v70[24 * v35];
      do
      {
        v37 = &v70[24 * v35 - 24];
        v38 = *(_OWORD *)v36;
        *((_QWORD *)v37 + 2) = *((_QWORD *)v36 + 2);
        *(_OWORD *)v37 = v38;
        ++v35;
        v36 += 24;
      }
      while (v22 != v35);
    }
    --v22;
    if (v27 <= 0)
      v39 = v25 - 1;
    else
      v39 = 0;
    *(float *)&v72[3 * v27 - 3 + 3 * v39] = checkpointScore(v27 + v39 - 1, (uint64_t)v70, v22, (uint64_t)a4);
    if (v27 >= v22)
      v40 = v25 - 1;
    else
      v40 = 0;
    *(float *)&v72[3 * (v27 - v40)] = checkpointScore(v27 - v40, (uint64_t)v70, v22, (uint64_t)a4);
  }
  if (v9)
  {
    -[RedEyeInspector3 getIdentifyingString:settings:](self->inspector, "getIdentifyingString:settings:", v69, &self->S);
    printf("\n%s %3d with %d points and %d checkpoints\n", v69, a4->var5, a4->var0, v22);
    if (v22 >= 1)
    {
      v41 = v71;
      v42 = v22;
      do
      {
        printf("  %d (%.1f, %.1f)\n", *((_DWORD *)v41 + 2), *((double *)v41 - 1), *(double *)v41);
        v41 += 24;
        --v42;
      }
      while (v42);
    }
  }
  if (v22 > 1)
  {
    v44 = 0;
    v45 = v14 * 0.41;
    v46 = v45;
    v47 = v46 * 0.4;
    v48 = (int)rintf(v47);
    if (v48 <= 3)
      v48 = 3;
    v49 = v46 * 0.8;
    v50 = (int)rintf(v49);
    if (v48 >= 0xA)
      v51 = 10;
    else
      v51 = v48;
    if (v50 <= 6)
      v52 = 6;
    else
      v52 = v50;
    if (v52 >= 0x1E)
      v53 = 30;
    else
      v53 = v52;
    v67 = 0.0;
    v54 = 0.0;
    for (i = v70; ; i += 24)
    {
      v56 = *(double *)i;
      v57 = *((double *)i + 1);
      v58 = *(double *)i;
      v59 = v57;
      bilinearFloat4LookupComponents((uint64_t)p_G, v73, v58, v59);
      *(float *)&v60 = 6.28318531 - v74;
      result = -[CIRedEyeRepair3 updatedCheckpoint:withCheckpoint:checkpointIndex:angle:width:height:inChannel:threadIndex:returningEdgeWidth:](self, "updatedCheckpoint:withCheckpoint:checkpointIndex:angle:width:height:inChannel:threadIndex:returningEdgeWidth:", i, v44, v51, v53, p_D, a4->var5, v56, v57, v60, &v67);
      if (result)
        break;
      v54 = v54 + v67;
      if (v25 == ++v44)
      {
        if (v9)
        {
          -[RedEyeInspector3 getIdentifyingString:settings:](self->inspector, "getIdentifyingString:settings:", v69, &self->S);
          printf("\n%s after update %3d with %d points and %d checkpoints\n", v69, a4->var5, a4->var0, v25);
          v61 = v71;
          v62 = v25;
          do
          {
            printf("  %d (%.1f, %.1f)\n", *((_DWORD *)v61 + 2), *((double *)v61 - 1), *(double *)v61);
            v61 += 24;
            --v62;
          }
          while (v62);
          printf("edge width %.2f\n", (float)(v54 / (float)(int)v25));
        }
        var5 = a4->var5;
        result = -[CIRedEyeRepair3 newShape:byInterpolatingBetweenCheckpoints:nc:usingVectorField:](self, "newShape:byInterpolatingBetweenCheckpoints:nc:usingVectorField:", &v68, v70, v25, p_G);
        if (!result)
        {
          -[CIRedEyeRepair3 computeLengthsAnglesAndDeltaAnglesForShape:](self, "computeLengthsAnglesAndDeltaAnglesForShape:", v68);
          result = 0;
          v64 = v68;
          *(_QWORD *)(v68 + 16) = *(_QWORD *)&self->S.faceIndex;
          *(_DWORD *)(v64 + 24) = var5;
          *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v64;
        }
        return result;
      }
    }
  }
  else
  {
    result = 0;
    *a3 = 0;
  }
  return result;
}

- (int)shape:(id *)a3 withThreadAtIndex:(int)a4 centroid:(CGPoint)a5
{
  double y;
  double x;
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  RedEyeInspector3 *inspector;
  char v13;
  int result;
  uint64_t v15;
  uint64_t v16;
  int v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  double v19;
  double v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *shapes;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v25;
  uint64_t v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v27;
  uint64_t v28;

  y = a5.y;
  x = a5.x;
  p_G = &self->G;
  threads = self->G.threads;
  inspector = self->inspector;
  if (inspector)
    v13 = -[RedEyeInspector3 debuggingThisFaceAndEye:andThreadIndex:](inspector, "debuggingThisFaceAndEye:andThreadIndex:", &self->S, *(_QWORD *)&a4);
  else
    v13 = 0;
  v27 = 0;
  v28 = 0;
  result = -[CIRedEyeRepair3 newShape:](self, "newShape:", &v28);
  if (!result)
  {
    result = -[CIRedEyeRepair3 initShapePoints:withMaxPoints:](self, "initShapePoints:withMaxPoints:", v28, *((unsigned int *)threads + 24 * a4 + 2));
    if (!result)
    {
      v15 = v28;
      *(_QWORD *)(v28 + 16) = *(_QWORD *)&self->S.faceIndex;
      *(_DWORD *)(v15 + 24) = a4;
      v16 = (uint64_t)p_G->points + 96 * *((int *)threads + 24 * a4);
      v17 = *(_DWORD *)(v16 + 68);
      if (v17 == -1)
      {
LABEL_10:
        result = -[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v15, *(double *)v16, *(double *)(v16 + 8));
        if (!result)
        {
          if (*(_DWORD *)v28 == *(_DWORD *)(v28 + 4))
          {
            if (*(int *)v28 < 2)
              return 48;
            LODWORD(v19) = 1050790593;
            -[CIRedEyeRepair3 removeRedundantPointsFromShape:closerThan:](self, "removeRedundantPointsFromShape:closerThan:", v19);
            if ((v13 & 1) != 0)
            {
              puts("\nbefore");
              if (*(int *)v28 >= 1)
              {
                v21 = 0;
                v22 = *(_QWORD *)(v28 + 8);
                do
                {
                  printf("%3d (%5.1f, %5.1f) %6.4f %6.1f° del %6.1f\n", v21++, *(double *)v22, *(double *)(v22 + 8), *(float *)(v22 + 16), *(float *)(v22 + 20) * 180.0 / 3.14159265, *(float *)(v22 + 24) * 180.0 / 3.14159265);
                  v22 += 48;
                }
                while (v21 < *(_DWORD *)v28);
              }
            }
            *(float *)&v20 = self->S.scale * 1.5 * self->S.scale;
            -[CIRedEyeRepair3 removeSmallBumpsFromShape:center:threshold:](self, "removeSmallBumpsFromShape:center:threshold:", x, y, v20);
            if (*(int *)v28 > 1)
            {
              -[CIRedEyeRepair3 removeSpikesFromShape:](self, "removeSpikesFromShape:");
              v23 = v28;
              shapes = p_G->shapes;
              result = -[CIRedEyeRepair3 improvedShape:withShape:](self, "improvedShape:withShape:", &v27, v28);
              if (!result)
              {
                v25 = v27;
                if (v27)
                {
                  v26 = (uint64_t)p_G->shapes + 32 * ((v23 - (uint64_t)shapes) >> 5);
                  *(_DWORD *)(v26 + 24) = -1;
                  *(_QWORD *)(v26 + 16) = -1;
                }
                else
                {
                  v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v28;
                }
                result = 0;
                *a3 = v25;
              }
            }
            else
            {
              return 48;
            }
          }
          else
          {
            return 47;
          }
        }
      }
      else
      {
        while (1)
        {
          points = p_G->points;
          result = -[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v28, *(double *)v16, *(double *)(v16 + 8));
          if (result)
            break;
          v16 = (uint64_t)points + 96 * v17;
          v17 = *(_DWORD *)(v16 + 68);
          if (v17 == -1)
          {
            v15 = v28;
            goto LABEL_10;
          }
        }
      }
    }
  }
  return result;
}

- (int)closeThreadIndex:(int)a3 usingVectorField:(id *)a4
{
  uint64_t v4;
  double v5;
  RedEyeInspector3 *inspector;
  int *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  uint64_t v12;
  double *v13;
  double v14;
  double v15;
  float v16;
  double v17;
  float v18;
  float v19;
  double v20;
  double *v21;
  float64x2_t *v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  float64x2_t v32;
  double *v33;
  int v34;
  uint64_t v35;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v36;
  char *v37;
  int v38;
  char *v39;
  int v40;
  float64x2_t v42;
  float v43[4];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  inspector = self->inspector;
  if (inspector
    && -[RedEyeInspector3 debuggingThisFaceAndEye:andThreadIndex:](inspector, "debuggingThisFaceAndEye:andThreadIndex:", &self->S, *(_QWORD *)&a3))
  {
    putchar(10);
  }
  v10 = (int *)((char *)self->G.threads + 96 * a3);
  points = self->G.points;
  v12 = 96 * *v10;
  v13 = (double *)((char *)points + 96 * v10[1]);
  v14 = *v13;
  v15 = v13[1];
  v16 = *v13 - v5;
  v42 = *(float64x2_t *)((char *)points + v12);
  v17 = *(double *)((char *)points + v12 + 8);
  v18 = v15 - v42.f64[1];
  v19 = (float)(v18 * v18) + (float)(v16 * v16);
  v20 = sqrt(v19);
  *(float *)&v20 = v20 + v20 + v20 + v20;
  LODWORD(v4) = vcvtps_s32_f32(*(float *)&v20);
  v21 = (double *)malloc_type_malloc(32 * (_DWORD)v4, 0x1000040451B5BE8uLL);
  if (!v21)
    return 20;
  v22 = (float64x2_t *)v21;
  if ((int)v4 < 1)
    goto LABEL_21;
  v23 = 0;
  v24 = v21 + 1;
  LODWORD(v25) = -1;
  do
  {
    v26 = v14;
    v27 = v15;
    bilinearFloat4LookupComponents((uint64_t)a4, v43, v26, v27);
    v14 = v14 + v43[0] * 0.5;
    v15 = v15 + v43[1] * 0.5;
    *(v24 - 1) = v14;
    *v24 = v15;
    v28 = v42.f64[0] - v14;
    v29 = v17 - v15;
    v30 = (float)(v29 * v29) + (float)(v28 * v28);
    if (v30 >= v19)
      v25 = v25;
    else
      v25 = v23;
    if (v30 < v19)
      v19 = v30;
    ++v23;
    v24 += 2;
  }
  while (v4 != v23);
  if ((_DWORD)v25 == -1)
  {
LABEL_21:
    v40 = 21;
  }
  else if ((int)v25 < 1)
  {
LABEL_20:
    v40 = 0;
  }
  else
  {
    v31 = 0;
    v32 = vsubq_f64(v42, v22[(int)v25]);
    do
    {
      v22[v31] = vmlaq_n_f64(v22[v31], v32, (float)((float)(1.0 / (float)(int)v25) * (float)(int)v31));
      ++v31;
    }
    while (v25 != v31);
    v33 = (double *)v22;
    while (1)
    {
      v34 = -[CIRedEyeRepair3 insertPoint:andDirection:intoGrid:](self, "insertPoint:andDirection:intoGrid:", 0, *v33, v33[1], v33[2 * (int)v4], v33[2 * (int)v4 + 1], *(_OWORD *)&v42);
      if (v34)
        break;
      v35 = self->G.nPoints - 1;
      v36 = self->G.points;
      v37 = (char *)self->G.threads + 96 * a3;
      v38 = *((_DWORD *)v37 + 1);
      *((_DWORD *)v36 + 24 * v38 + 17) = v35;
      v39 = (char *)v36 + 96 * v35;
      *((_DWORD *)v39 + 17) = -1;
      *((_DWORD *)v39 + 18) = v38;
      LODWORD(v39) = *((_DWORD *)v37 + 2) + 1;
      *((_DWORD *)v37 + 1) = v35;
      *((_DWORD *)v37 + 2) = (_DWORD)v39;
      v33 += 2;
      if (!--v25)
        goto LABEL_20;
    }
    v40 = v34;
  }
  free(v22);
  return v40;
}

- (int)attemptClosureOfThreadIndex:(int)a3
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  int *v5;
  uint64_t v6;
  RedEyeInspector3 *inspector;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  int v15;
  int v16;
  double *v17;
  char *v18;
  int *v19;
  int v20;
  int v21;
  char *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  float v28;
  float v29;
  int *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  double *v35;
  float v36;
  float v37;
  int result;
  int v39;
  char *v40;
  int v41;
  int *v42;
  int v43;
  int v44;
  float *v45;
  int v46;
  float v47;
  float v48;
  double v49;
  double v50;
  int v51;
  float v52;
  double v53;
  double v54;
  double *v55;
  float v56;
  float v57;
  float v58;
  char v59;
  char *v60;
  int v61;
  double *v62;
  float v63;
  float v64;
  int v65;
  int v66;
  int v67;
  float *v68;
  int v69;
  float v70;
  float v71;
  float v72;
  double v73;
  double v74;
  double *v75;
  float v76;
  float v77;
  float v78;
  char *v79;
  int v80;

  p_G = &self->G;
  threads = self->G.threads;
  v5 = (int *)((char *)threads + 96 * a3);
  if (!*((_BYTE *)v5 + 24))
    return 22;
  v6 = *(_QWORD *)&a3;
  inspector = self->inspector;
  if (inspector
    && -[RedEyeInspector3 debuggingThisFaceAndEye:andThreadIndex:](inspector, "debuggingThisFaceAndEye:andThreadIndex:", &self->S, *(_QWORD *)&a3))
  {
    -[CIRedEyeRepair3 printThreadWithIndex:](self, "printThreadWithIndex:", v6);
    putchar(10);
    v10 = (uint64_t)p_G->points + 96 * *v5;
    printf("  0 %d (%.2f, %.2f)\n", *v5, *(double *)v10, *(double *)(v10 + 8));
    v11 = *(_DWORD *)(v10 + 68);
    if (v11 != -1)
    {
      v12 = 1;
      do
      {
        v13 = (uint64_t)p_G->points + 96 * v11;
        printf("  %d %d (%.2f, %.2f)\n", v12++, v11, *(double *)v13, *(double *)(v13 + 8));
        v11 = *(_DWORD *)(v13 + 68);
      }
      while (v11 != -1);
    }
    putchar(10);
  }
  points = p_G->points;
  v15 = *v5;
  v16 = *v5;
  v17 = (double *)((char *)points + 96 * *v5);
  v18 = (char *)threads + 96 * a3;
  v21 = *((_DWORD *)v18 + 1);
  v19 = (int *)(v18 + 4);
  v20 = v21;
  v22 = (char *)points + 96 * v21;
  v23 = *(double *)v22;
  v24 = *((double *)v22 + 1);
  v25 = *v17;
  v26 = v17[1];
  v27 = *(double *)v22 - *v17;
  v28 = v24 - v26;
  v29 = sqrtf((float)(v28 * v28) + (float)(v27 * v27));
  v32 = *((_DWORD *)v22 + 18);
  v30 = (int *)(v22 + 72);
  v31 = v32;
  if (v32 == -1)
  {
    v34 = v20;
    v33 = v20;
  }
  else
  {
    do
    {
      v33 = v31;
      v34 = v31;
      v35 = (double *)((char *)points + 96 * v31);
      v36 = v23 - *v35;
      v37 = v24 - v35[1];
      if (sqrtf((float)(v37 * v37) + (float)(v36 * v36)) > v29)
        break;
      v31 = *((_DWORD *)points + 24 * v34 + 18);
    }
    while (v31 != -1);
  }
  if (*((_DWORD *)points + 24 * v34 + 18) == -1)
    v39 = v33;
  else
    v39 = *((_DWORD *)points + 24 * v34 + 18);
  v40 = (char *)points + 96 * v16;
  v43 = *((_DWORD *)v40 + 17);
  v42 = (int *)(v40 + 68);
  v41 = v43;
  if (v43 == -1)
  {
    v59 = 0;
    v52 = v29;
    goto LABEL_34;
  }
  LOBYTE(v44) = v15 != v39;
  v45 = (float *)((char *)threads + 96 * a3 + 12);
  v46 = -1;
  v47 = 0.0;
  v48 = 10000.0;
  v49 = v26;
  v50 = v25;
  v51 = v41;
  v52 = 10000.0;
  do
  {
    v53 = v50;
    v54 = v49;
    v55 = (double *)((char *)points + 96 * v51);
    v44 = v44 & (v51 != v39);
    v50 = *v55;
    v49 = v55[1];
    *(float *)&v53 = v53 - *v55;
    *(float *)&v54 = v54 - v49;
    v47 = sqrt((float)((float)(*(float *)&v54 * *(float *)&v54) + (float)(*(float *)&v53 * *(float *)&v53))) + v47;
    if (v44 == 1)
    {
      v56 = v23 - v50;
      v57 = v24 - v49;
      v58 = sqrtf((float)(v57 * v57) + (float)(v56 * v56));
      if (v58 < v52 && *v45 * 0.5 > v47)
      {
        v46 = v51;
        v52 = v58;
        v48 = v47;
      }
    }
    v51 = *((_DWORD *)points + 24 * v51 + 17);
  }
  while (v51 != -1);
  v59 = 0;
  if (v46 != -1 && v52 < v29)
  {
    if (*v45 * 0.5 > v48)
    {
      v60 = (char *)points + 96 * v46;
      v61 = *((_DWORD *)v60 + 18);
      *((_DWORD *)v60 + 18) = -1;
      *v5 = v46;
      *((_DWORD *)points + 24 * v61 + 17) = -1;
      v41 = *v42;
      v59 = 1;
      v15 = v46;
      goto LABEL_31;
    }
    v59 = 0;
  }
  v52 = v29;
LABEL_31:
  while (v41 != -1)
  {
    v15 = v41;
    v16 = v41;
    v62 = (double *)((char *)points + 96 * v41);
    v63 = v25 - *v62;
    v64 = v26 - v62[1];
    if (sqrtf((float)(v64 * v64) + (float)(v63 * v63)) > v29)
      break;
    v41 = *((_DWORD *)points + 24 * v16 + 17);
  }
LABEL_34:
  v65 = *((_DWORD *)points + 24 * v16 + 17);
  if (v65 == -1)
    v65 = v15;
  v66 = *v30;
  if (*v30 == -1)
    goto LABEL_48;
  LOBYTE(v67) = v20 != v65;
  v68 = (float *)((char *)threads + 96 * a3 + 12);
  v69 = -1;
  v70 = 0.0;
  v71 = 10000.0;
  v72 = 10000.0;
  do
  {
    v73 = v23;
    v74 = v24;
    v75 = (double *)((char *)points + 96 * v66);
    v67 = v67 & (v66 != v65);
    v23 = *v75;
    v24 = v75[1];
    *(float *)&v73 = v73 - *v75;
    *(float *)&v74 = v74 - v24;
    v70 = sqrt((float)((float)(*(float *)&v74 * *(float *)&v74) + (float)(*(float *)&v73 * *(float *)&v73))) + v70;
    if (v67 == 1)
    {
      v76 = v25 - v23;
      v77 = v26 - v24;
      v78 = sqrtf((float)(v77 * v77) + (float)(v76 * v76));
      if (v78 < v72 && *v68 * 0.5 > v70)
      {
        v69 = v66;
        v72 = v78;
        v71 = v70;
      }
    }
    v66 = *((_DWORD *)points + 24 * v66 + 18);
  }
  while (v66 != -1);
  if (v69 == -1 || v72 >= v52 || *v68 * 0.5 <= v71)
  {
LABEL_48:
    if ((v59 & 1) == 0 && *((float *)threads + 24 * a3 + 3) * 0.2 <= v29)
    {
LABEL_52:
      if (*((_BYTE *)threads + 96 * a3 + 25))
        return 0;
      else
        return 23;
    }
  }
  else
  {
    v79 = (char *)points + 96 * v69;
    v80 = *((_DWORD *)v79 + 17);
    *((_DWORD *)v79 + 17) = -1;
    *v19 = v69;
    *((_DWORD *)points + 24 * v80 + 18) = -1;
  }
  result = -[CIRedEyeRepair3 closeThreadIndex:usingVectorField:](self, "closeThreadIndex:usingVectorField:", v6, &self->PB.G);
  if (result == 21 || !result)
  {
    *((_BYTE *)threads + 96 * a3 + 25) = 1;
    result = -[CIRedEyeRepair3 gatherThreadInfo:](self, "gatherThreadInfo:", v5);
    if (!result)
      goto LABEL_52;
  }
  return result;
}

- (CGPoint)threadCentroid:(id *)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  char *v4;
  float32x2_t v5;
  int v6;
  int v7;
  char *v8;
  float v9;
  float64x2_t v10;
  double v11;
  CGPoint result;

  points = self->G.points;
  v4 = (char *)points + 96 * a3->var0;
  v5 = vcvt_f32_f64(*(float64x2_t *)v4);
  v6 = *((_DWORD *)v4 + 17);
  if (v6 == -1)
  {
    v9 = 1.0;
  }
  else
  {
    v7 = 1;
    do
    {
      v8 = (char *)points + 96 * v6;
      ++v7;
      v5 = vcvt_f32_f64(vaddq_f64(*(float64x2_t *)v8, vcvtq_f64_f32(v5)));
      v6 = *((_DWORD *)v8 + 17);
    }
    while (v6 != -1);
    v9 = (float)v7;
  }
  v10 = vcvtq_f64_f32(vmul_n_f32(v5, 1.0 / v9));
  v11 = v10.f64[1];
  result.x = v10.f64[0];
  result.y = v11;
  return result;
}

- (float)threadSignedArea:(id *)a3 centroid:(CGPoint)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *points;
  char *v5;
  int v6;
  double v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  double v13;
  float v14;
  double v15;
  double v16;
  float v17;
  float v18;

  points = self->G.points;
  v5 = (char *)points + 96 * a3->var0;
  v6 = *((_DWORD *)v5 + 17);
  v7 = *((double *)v5 + 1);
  if (v6 == -1)
  {
    v16 = v7 - a4.y;
    v8 = 0.0;
    v15 = v16;
    v10 = *(double *)v5;
  }
  else
  {
    v8 = 0.0;
    v9 = *((double *)v5 + 1);
    v10 = *(double *)v5;
    do
    {
      v11 = v10;
      v12 = (double *)((char *)points + 96 * v6);
      v13 = v9 - a4.y;
      v10 = *v12;
      v9 = v12[1];
      v14 = *v12 - v11;
      v15 = v9 - a4.y;
      *(float *)&v13 = (v13 + v9 - a4.y) * 0.5;
      v8 = v8 + (float)(v14 * *(float *)&v13);
      v6 = *((_DWORD *)v12 + 17);
    }
    while (v6 != -1);
    v16 = v7 - a4.y;
  }
  v17 = *(double *)v5 - v10;
  v18 = (v15 + v16) * 0.5;
  return v8 + (float)(v17 * v18);
}

- (int)color:(id *)a3 underConvexHull:(id *)a4 saturated:(id *)a5
{
  $42BE4D6713D11F14BD59556247296FA3 *p_PB;
  int width;
  int height;
  int result;
  float v13;
  float v14;
  int v15;
  char *baseAddress;
  float v17;
  float v18;
  _BYTE *v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  int v27;
  unsigned __int8 *v28;
  _BYTE *v29;
  char *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = 0;
  v44 = 0u;
  v45 = 0u;
  p_PB = &self->PB;
  width = self->PB.O.width;
  height = self->PB.O.height;
  initBitmap((uint64_t)&v44, width, height, 1, 1, 100.0);
  if (!(_QWORD)v44)
    return 51;
  result = -[CIRedEyeRepair3 renderHull:toBitmap:](self, "renderHull:toBitmap:", a4, &v44);
  if (!result)
  {
    if (height)
    {
      v15 = 0;
      baseAddress = p_PB->D.baseAddress;
      v17 = 0.0;
      v18 = 0.0;
      v19 = (_BYTE *)v44;
      v20 = (uint64_t)(p_PB->O.baseAddress + 2);
      v21 = 0.0;
      v22 = 0.0;
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      v26 = 0.0;
      do
      {
        if (width)
        {
          v27 = width;
          v28 = (unsigned __int8 *)v20;
          v29 = v19;
          v30 = baseAddress;
          do
          {
            LOBYTE(v13) = *v29;
            v13 = (float)LODWORD(v13) * 0.0039216;
            v31 = *v28;
            v32 = *(v28 - 1);
            v33 = *(v28 - 2);
            LOBYTE(v14) = *v30;
            v14 = (float)LODWORD(v14);
            v26 = v26 + (float)((float)v31 * v13);
            v25 = v25 + (float)((float)v32 * v13);
            v24 = v24 + (float)((float)v33 * v13);
            v23 = v23 + (float)(v14 * v13);
            if (v31 <= 0xFA)
              v34 = -0.0;
            else
              v34 = v13;
            v21 = v21 + v34;
            if (v32 <= 0xFA)
              v35 = -0.0;
            else
              v35 = v13;
            v18 = v18 + v35;
            if (v33 <= 0xFA)
              v36 = -0.0;
            else
              v36 = v13;
            v17 = v17 + v36;
            v22 = v22 + v13;
            v29 += SHIDWORD(v45);
            v30 += p_PB->D.samplesPerPixel;
            v28 += p_PB->O.samplesPerPixel;
            --v27;
          }
          while (v27);
        }
        ++v15;
        v19 += (int)v45;
        baseAddress += p_PB->D.rowSamples;
        v20 += p_PB->O.rowSamples;
      }
      while (v15 != height);
    }
    else
    {
      v26 = 0.0;
      v25 = 0.0;
      v24 = 0.0;
      v23 = 0.0;
      v22 = 0.0;
      v21 = 0.0;
      v18 = 0.0;
      v17 = 0.0;
    }
    v37 = v26 / v22;
    v38 = v25 / v22;
    v39 = v24 / v22;
    v40 = v23 / v22;
    v41 = v21 / v22;
    v42 = v18 / v22;
    v43 = v17 / v22;
    termBitmap((void **)&v44);
    result = 0;
    a5->var0 = v41;
    a5->var1 = v42;
    a5->var2 = v43;
    a5->var3 = 0.0;
    a3->var0 = v37;
    a3->var1 = v38;
    a3->var2 = v39;
    a3->var3 = v40;
  }
  return result;
}

+ (void)insertIntoThreadHopper:(id *)a3 index:(int)a4 recChannel:(float)a5 hue:(float)a6 saturation:(float)a7 luminance:(float)a8 shapeMetricTotal:(float)a9 xPosition:(float)a10
{
  uint64_t var0;
  uint64_t v11;
  float *p_var5;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  $FC27114F07FD3606AA62879A7C7DE505 *v17;
  char *v18;
  int v19;

  var0 = a3->var0;
  if ((int)var0 < 1)
  {
    LODWORD(v11) = 0;
LABEL_16:
    if ((int)var0 <= 18)
      v15 = var0 - 1;
    else
      v15 = 18;
    if (v15 >= (int)v11)
    {
      v16 = v15 + 1;
      v17 = &a3->var1[v15 + 1];
      do
      {
        *(_OWORD *)&v17->var0 = *(_OWORD *)&v17[-1].var0;
        *(_OWORD *)&v17->var3 = *(_OWORD *)&v17[-1].var3;
        --v17;
        --v16;
      }
      while (v16 > v11);
      LODWORD(var0) = a3->var0;
    }
    v18 = (char *)a3 + 28 * v11;
    *((_DWORD *)v18 + 1) = a4;
    *((float *)v18 + 2) = a5;
    *((float *)v18 + 3) = a6;
    *((float *)v18 + 4) = a7;
    *((float *)v18 + 5) = a8;
    *((float *)v18 + 6) = a9;
    *((float *)v18 + 7) = a10;
    if ((int)var0 < 20)
      v19 = var0 + 1;
    else
      v19 = 20;
    a3->var0 = v19;
    return;
  }
  v11 = 0;
  p_var5 = &a3->var1[0].var5;
  while (1)
  {
    v13 = *(p_var5 - 4) < a5;
    if (*(p_var5 - 4) >= a5)
      v14 = 1;
    else
      v14 = 2;
    if (*(p_var5 - 2) < a7)
      v13 = v14;
    if (*p_var5 > a9)
      ++v13;
    if (v13 > 1)
      break;
    ++v11;
    p_var5 += 7;
    if (var0 == v11)
    {
      LODWORD(v11) = a3->var0;
      break;
    }
  }
  if (v11 <= 0x13)
    goto LABEL_16;
}

- (BOOL)hopperElement:(id *)a3 isMoreScleraThanElement:(id *)a4
{
  return a3->var4 > a4->var4
      && fabs(a3->var2 + -0.333) > fabs(a4->var2 + -0.333)
      && a4->var3 * 3.0 > a3->var3
      && fabsf(a3->var6) > fabsf(a4->var6);
}

- (void)swapHopperElement:(id *)a3 withElement:(id *)a4
{
  __int128 v4;
  _BYTE v5[28];
  char v6[256];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&v5[12] = *(_OWORD *)&a3->var3;
  *(_OWORD *)v5 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&a3->var0 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&a3->var3 = v4;
  *(_OWORD *)&a4->var0 = *(_OWORD *)v5;
  *(_OWORD *)&a4->var3 = *(_OWORD *)&v5[12];
  if (self->inspector)
  {
    -[RedEyeInspector3 getIdentifyingString:settings:](self->inspector, "getIdentifyingString:settings:", v6, &self->S);
    printf("%s swapping\n", v6);
  }
}

- (int)recognizeThreadsWinningThreadIndex:(int *)a3 info:(id *)a4
{
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  uint64_t v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  RedEyeInspector3 *inspector;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  int v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  int v22;
  int v23;
  uint64_t v24;
  RedEyeInspector3 *v25;
  uint64_t v26;
  uint64_t height;
  __int128 v28;
  uint64_t v29;
  __int128 *v30;
  float v31;
  double v33;
  double v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  $B2601F6C1AEFD516A4951621A0FFBC2C *p_FC;
  uint64_t v47;
  uint64_t v48;
  int v49;
  float v50;
  float scale;
  double v52;
  float v53;
  float v54;
  int v55;
  BOOL v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  double v62;
  double v63;
  float v64;
  char v65;
  double v66;
  double v67;
  double v68;
  float v69;
  double v70;
  long double v71;
  float v72;
  BOOL v73;
  int v74;
  char *v75;
  uint64_t v76;
  int *v77;
  float v78;
  double v80;
  double v83;
  double v84;
  int v85;
  _OWORD v86[3];
  _OWORD v87[2];
  __int128 v88;
  __int128 v89;
  int v90;
  _OWORD v91[35];
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD v102[3];

  v90 = 0;
  p_G = &self->G;
  if (self->G.nThreads >= 1)
  {
    v6 = 0;
    v101 = 0;
    v102[0] = 0;
    v99 = 0.0;
    v100 = 0;
    v97 = 0.0;
    v98 = 0.0;
    v95 = 0.0;
    v96 = 0.0;
    v93 = 0.0;
    v94 = 0.0;
    v92 = 0.0;
    memset(v91, 0, 508);
    v88 = 0u;
    v89 = 0u;
    memset(v87, 0, sizeof(v87));
    threads = self->G.threads;
    while (1)
    {
      *((_BYTE *)threads + 26) = 0;
      if (!*((_BYTE *)threads + 24))
        goto LABEL_61;
      inspector = self->inspector;
      if (inspector
        && -[RedEyeInspector3 debuggingThisFaceAndEye:](inspector, "debuggingThisFaceAndEye:", &self->S))
      {
        -[CIRedEyeRepair3 printThreadWithIndex:](self, "printThreadWithIndex:", v6);
        putchar(10);
        v9 = 1;
      }
      else
      {
        v9 = 0;
      }
      v10 = -[CIRedEyeRepair3 attemptClosureOfThreadIndex:](self, "attemptClosureOfThreadIndex:", v6);
      if (v10 == 23)
        goto LABEL_61;
      v11 = v10;
      if (v10)
        return v11;
      -[CIRedEyeRepair3 threadCentroid:](self, "threadCentroid:", threads);
      v13 = v12;
      v15 = v14;
      -[CIRedEyeRepair3 threadSignedArea:centroid:](self, "threadSignedArea:centroid:", threads);
      if (v16 >= 0.0)
        goto LABEL_61;
      v17 = -[CIRedEyeRepair3 shape:withThreadAtIndex:centroid:](self, "shape:withThreadAtIndex:centroid:", &v101, v6, v13, v15);
      if (v17)
        return v17;
      -[CIRedEyeRepair3 slidingWindowAnalysisOfShape:into:](self, "slidingWindowAnalysisOfShape:into:", v101, v87);
      LODWORD(v19) = DWORD1(v87[0]);
      LODWORD(v20) = v87[0];
      v21 = *(float *)v87 > 0.62832;
      if (*((float *)v87 + 1) > 0.68068)
        v21 = 1;
      LODWORD(v18) = DWORD2(v87[0]);
      if (*((float *)v87 + 2) > 0.61087)
        v21 = 1;
      if ((int)v89 > 0)
        v21 = 1;
      v22 = SDWORD1(v89) > 2 || v21;
      if (SDWORD2(v89) > 21)
        v22 = 1;
      v85 = v22;
      if (v22 == 1)
      {
        if (*(float *)v87 > 0.66323)
          goto LABEL_61;
        LODWORD(v20) = 1062338430;
        if (*((float *)v87 + 1) > 0.8203)
          goto LABEL_61;
        LODWORD(v19) = 1062045612;
        if (*((float *)v87 + 2) > 0.80285 || (int)v89 > 0 || SDWORD1(v89) > 5 || SDWORD2(v89) > 25)
          goto LABEL_61;
      }
      if (v9)
      {
        puts("\nafter");
        if (*(int *)v101 >= 1)
        {
          v23 = 0;
          v24 = *(_QWORD *)(v101 + 8);
          do
          {
            printf("%3d (%5.1f, %5.1f) %6.4f %6.1f° del %6.1f [%6.1f %6.1f %6.1f %6.1f]\n", v23++, *(double *)v24, *(double *)(v24 + 8), *(float *)(v24 + 16), (float)(*(float *)(v24 + 20) * 57.296), (float)(*(float *)(v24 + 24) * 57.296), (float)(*(float *)(v24 + 28) * 57.296), (float)(*(float *)(v24 + 32) * 57.296), (float)(*(float *)(v24 + 36) * 57.296), (float)(*(float *)(v24 + 40) * 57.296));
            v24 += 48;
          }
          while (v23 < *(_DWORD *)v101);
        }
      }
      v25 = self->inspector;
      if (v25)
      {
        v26 = -[RedEyeInspector3 newSavedShape](v25, "newSavedShape", v18, v19, v20);
        height = self->S.height;
        v28 = *(_OWORD *)&self->S.transform.c;
        v86[0] = *(_OWORD *)&self->S.transform.a;
        v86[1] = v28;
        v86[2] = *(_OWORD *)&self->S.transform.tx;
        -[CIRedEyeRepair3 copyShape:into:transform:height:](self, "copyShape:into:transform:height:", v101, v26, v86, height);
      }
      if (v9)
      {
        v29 = -4;
        v30 = &v88;
        do
        {
          v31 = 3.14159265 / (float)(1 << (v29 + 4));
          printf("1/%d scale: min %4.2f max %4.2f avg %4.2f # neg %d\n", 2 << (v29 + 4), (float)((float)(*((float *)v30 - 4) - v31) * 57.296), (float)((float)(*(float *)v30 - v31) * 57.296), (float)(*((float *)v30 - 8) * 57.296), *((_DWORD *)v30 + 4));
          v30 = (__int128 *)((char *)v30 + 4);
        }
        while (!__CFADD__(v29++, 1));
      }
      v17 = -[CIRedEyeRepair3 convexHull:ofOriented:shape:](self, "convexHull:ofOriented:shape:", &v100, 0, v101, v18, v19, v20);
      if (v17)
        return v17;
      -[CIRedEyeRepair3 measureHull:majorAxis:majorTo:majorDiameter:minorAxis:minorTo:minorDiameter:](self, "measureHull:majorAxis:majorTo:majorDiameter:minorAxis:minorTo:minorDiameter:", v100, &v98, &v96, (char *)v102 + 4, &v94, &v92, v102);
      v33 = atan2(v97 - v99, v96 - v98);
      v34 = atan2(v93 - v95, v92 - v94);
      v35 = -[CIRedEyeRepair3 color:underConvexHull:saturated:](self, "color:underConvexHull:saturated:", (char *)threads + 52, v100, (char *)threads + 68);
      if (v35)
      {
        v11 = v35;
        -[CIRedEyeRepair3 termHull:](self, "termHull:", v100);
        return v11;
      }
      LODWORD(v36) = *((_DWORD *)threads + 13);
      LODWORD(v37) = *((_DWORD *)threads + 14);
      LODWORD(v38) = *((_DWORD *)threads + 15);
      LODWORD(v39) = *((_DWORD *)threads + 16);
      -[CIRedEyeRepair3 RGBtoHSV:](self, "RGBtoHSV:", v36, v37, v38, v39);
      v41 = v40;
      v43 = v42;
      v45 = v44;
      p_FC = &self->FC;
      v47 = 72;
      if (!self->S.side)
        v47 = 56;
      v48 = 32;
      if (!self->S.side)
        v48 = 16;
      v49 = *(int *)((char *)&p_FC->FR.minrow + v47);
      v50 = *((float *)threads + 14) * 0.587 + *((float *)threads + 13) * 0.299 + *((float *)threads + 15) * 0.114;
      scale = self->S.scale;
      v52 = (float)(self->S.IOD * scale);
      v53 = v52 * 0.032;
      v54 = v52 * 0.14;
      v55 = HIDWORD(v102[0]);
      v56 = *((float *)v102 + 1) >= v53 && *((float *)v102 + 1) <= v54;
      if (!v56 && (v54 * 1.17 < *((float *)v102 + 1) || fabs(v41 + -0.333) > 0.15 || v43 < 0.45 || v50 < 75.0))
        goto LABEL_61;
      v83 = v13;
      v84 = *(double *)((char *)&p_FC->FR.minrow + v48);
      v57 = v33;
      v58 = v34;
      *((_BYTE *)threads + 26) = 1;
      *((_DWORD *)threads + 9) = v55;
      *((float *)threads + 10) = v57;
      *((_DWORD *)threads + 11) = v102[0];
      *((float *)threads + 12) = v58;
      v59 = v41;
      v60 = v43;
      v61 = v45;
      -[CIRedEyeRepair3 termHull:](self, "termHull:", v100);
      *(float *)&v63 = v60;
      v64 = v59;
      if (v59 == 0.0 || v61 == 0.0 || v60 == 1.0 || *((float *)threads + 13) > 255.0)
      {
        v65 = v85;
      }
      else
      {
        v80 = (float)(v61 / 255.0) * 0.42;
        v71 = sin(v60 + -0.2);
        v64 = v59;
        HIDWORD(v63) = HIDWORD(v80);
        *(float *)&v71 = v80 * v71 + 0.3945 + v60 * -0.21;
        if (vabds_f32(v59, *(float *)&v71) <= 0.0735)
        {
          v72 = sqrt((v60 + -0.2) / 6.0) + 0.23;
          v73 = v60 < 0.28 || (float)(v61 / 255.0) < v72;
          *(float *)&v63 = v60;
          v67 = v83;
          v66 = v84;
          if (v73 && ((v85 ^ 1) & 1) == 0)
            goto LABEL_61;
LABEL_60:
          v68 = v66 - (double)v49;
          v69 = v68 * scale;
          v70 = (v67 - v69) / v52;
          *((float *)threads + 21) = (float)(*(float *)v87 + *((float *)v87 + 1)) + *((float *)v87 + 2);
          LODWORD(v70) = *((_DWORD *)threads + 16);
          *(float *)&v68 = v64;
          *(float *)&v62 = v50;
          +[CIRedEyeRepair3 insertIntoThreadHopper:index:recChannel:hue:saturation:luminance:shapeMetricTotal:xPosition:](CIRedEyeRepair3, "insertIntoThreadHopper:index:recChannel:hue:saturation:luminance:shapeMetricTotal:xPosition:", &v90, v6, v70, v68, v63, v62);
          goto LABEL_61;
        }
        v65 = v85;
        *(float *)&v63 = v60;
      }
      v67 = v83;
      v66 = v84;
      if ((v65 & 1) == 0)
        goto LABEL_60;
LABEL_61:
      v6 = (v6 + 1);
      threads = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)threads + 96);
      if ((int)v6 >= p_G->nThreads)
      {
        v74 = v90;
        if (v90 < 2)
          goto LABEL_87;
        if (v90 != 3)
        {
          if (v90 == 2)
          {
            v75 = (char *)&v91[1] + 12;
            goto LABEL_79;
          }
          goto LABEL_82;
        }
        v75 = (char *)&v91[1] + 12;
        if (-[CIRedEyeRepair3 hopperElement:isMoreScleraThanElement:](self, "hopperElement:isMoreScleraThanElement:", v91, (char *)&v91[1] + 12))
        {
          goto LABEL_80;
        }
        v75 = (char *)&v91[3] + 8;
LABEL_79:
        if (-[CIRedEyeRepair3 hopperElement:isMoreScleraThanElement:](self, "hopperElement:isMoreScleraThanElement:", v91, v75))
        {
LABEL_80:
          -[CIRedEyeRepair3 swapHopperElement:withElement:](self, "swapHopperElement:withElement:", v91, v75);
        }
        v74 = v90;
        if (v90 < 1)
        {
LABEL_87:
          if (!v74)
            return 25;
        }
        else
        {
LABEL_82:
          v76 = 0;
          v77 = (int *)v91;
          do
          {
            if (v76)
              *((_BYTE *)p_G->threads + 96 * *v77 + 26) = 0;
            ++v76;
            v77 += 7;
          }
          while (v74 != v76);
        }
        v11 = 0;
        *a3 = v91[0];
        v78 = *(float *)&v91[1];
        a4->var0 = *((float *)&v91[1] + 2);
        *(_QWORD *)&a4->var1 = *((_QWORD *)&v91[0] + 1);
        a4->var3 = v78;
        return v11;
      }
    }
  }
  return 25;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)RGBtoHSV:(id)a3
{
  float var2;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  var2 = a3.var2;
  v4 = fmaxf(a3.var0, fmaxf(a3.var1, a3.var2));
  v5 = fminf(a3.var0, fminf(a3.var1, a3.var2));
  v6 = v4 - v5;
  v7 = 0.0;
  if ((float)(v4 - v5) == 0.0)
  {
    v8 = 0.0;
    goto LABEL_18;
  }
  v9 = v6;
  v10 = v4 + v5;
  v11 = v10 * 0.5;
  if ((float)(v10 * 0.5) <= 0.5)
    v12 = v6 / v10;
  else
    v12 = v9 / (510.0 - v10);
  v13 = 1.0 / (v9 * 6.0);
  if (a3.var0 == v4)
  {
    v14 = (float)((float)(a3.var1 - var2) * v13);
    v15 = 0.333333333;
  }
  else
  {
    if (a3.var1 != v4)
    {
      v16 = (float)(a3.var0 - a3.var1) * v13;
      if (var2 != v4)
        v16 = 0.0;
      goto LABEL_11;
    }
    v14 = (float)((float)(var2 - a3.var0) * v13);
    v15 = 0.666666667;
  }
  v16 = v14 + v15;
LABEL_11:
  v17 = floorf(v16);
  v5 = 0.0;
  v8 = 0.0;
  if (v12 >= 0.0)
  {
    v8 = v12;
    if (v12 > 1.0)
      v8 = 1.0;
  }
  v7 = v16 - v17;
  if (v11 >= 0.0)
  {
    if (v11 <= 255.0)
      v5 = v11;
    else
      v5 = 255.0;
  }
LABEL_18:
  v18 = 0.0;
  v19 = v7;
  result.var3 = v18;
  result.var2 = v5;
  result.var1 = v8;
  result.var0 = v19;
  return result;
}

- (int)prominenceConvexHull:(id *)a3 facts:(id *)a4
{
  $42BE4D6713D11F14BD59556247296FA3 *p_PB;
  char *baseAddress;
  uint64_t rowSamples;
  uint64_t samplesPerPixel;
  char *v11;
  uint64_t v12;
  RedEyeInspector3 *inspector;
  int v14;
  uint64_t v15;
  int *p_bytesPerSample;
  float *v17;
  uint64_t v18;
  float *v19;
  __double2 v20;
  uint64_t v21;
  RedEyeInspector3 *v22;
  CIRedEyeRepair3 *v23;
  $68B11FE3954BEC635853EB9B37D30F2D *p_G;
  uint64_t v25;
  uint64_t v26;
  int nPoints;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  RedEyeInspector3 *v33;
  int v34;
  RedEyeInspector3 *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  RedEyeInspector3 *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  RedEyeInspector3 *v51;
  $E8834F51CE79BF204CBF6D92B5F806C1 *p_S;
  uint64_t v53;
  uint64_t v54;
  RedEyeInspector3 *v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  RedEyeInspector3 *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *threads;
  unsigned int v67;
  RedEyeInspector3 *v68;
  float *v69;
  float v70;
  float v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  float v78;
  float v79;
  char *v80;
  float *p_var1;
  float32x2x2_t v82;
  unint64_t v83;
  uint64_t nShapes;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *shapes;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v86;
  int v88;
  RedEyeInspector3 *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v94;
  $19F83CAE97543C5E9E65A2AD3DFD871A *v95;
  $42BE4D6713D11F14BD59556247296FA3 *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  int height;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_O;
  CIRedEyeRepair3 *v103;
  int width;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v105;
  __int128 v106;
  _QWORD v107[2];
  double v108;
  double v109;
  unsigned int v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v110 = 0;
  v108 = 0.0;
  v109 = 0.0;
  v107[0] = 0;
  v107[1] = 0;
  p_PB = &self->PB;
  baseAddress = self->PB.G.baseAddress;
  rowSamples = self->PB.G.rowSamples;
  samplesPerPixel = self->PB.G.samplesPerPixel;
  v11 = self->PB.O.baseAddress;
  p_O = &self->PB.O;
  v99 = self->PB.O.rowSamples;
  v12 = self->PB.O.samplesPerPixel;
  width = self->PB.width;
  height = self->PB.height;
  inspector = self->inspector;
  if (inspector)
    -[RedEyeInspector3 initGradients:](inspector, "initGradients:", v107);
  if (-[CIRedEyeRepair3 initGridWithBitmap:scale:](self, "initGridWithBitmap:scale:", p_O, 8))
  {
    v95 = a4;
    v96 = p_PB;
    v97 = v11;
    v98 = v12;
    v103 = self;
    v94 = a3;
    v14 = width;
    if (height >= 1)
    {
      v15 = 0;
      p_bytesPerSample = &self->fullBitmap.bytesPerSample;
      v17 = (float *)(baseAddress + 12);
      do
      {
        if ((_DWORD)v15 && (int)v15 < height - 1 && v14 >= 1)
        {
          v18 = 0;
          v19 = v17;
          do
          {
            if ((_DWORD)v18 && (int)v18 < width - 1 && *(v19 - 1) > *((float *)p_bytesPerSample + 124))
            {
              v20 = __sincos_stret(*v19);
              v21 = -[CIRedEyeRepair3 edgePoint:withBitmap:center:perp:](v103, "edgePoint:withBitmap:center:perp:", &v108, p_O, (float)(int)v18, (float)(int)v15, v20.__sinval, v20.__cosval);
              if ((_DWORD)v21
                && -[CIRedEyeRepair3 insertPoint:andDirection:intoGrid:](v103, "insertPoint:andDirection:intoGrid:", 1, v108, v109, v20.__cosval, -v20.__sinval))
              {
                return 52;
              }
              v22 = v103->inspector;
              v14 = width;
              if (v22)
                -[RedEyeInspector3 addGradientRow:column:good:toList:](v22, "addGradientRow:column:good:toList:", v15, v18, v21, v107);
            }
            v18 = (v18 + 1);
            v19 += samplesPerPixel;
          }
          while (v14 != (_DWORD)v18);
        }
        v15 = (v15 + 1);
        v17 += rowSamples;
      }
      while ((_DWORD)v15 != height);
    }
    v23 = v103;
    p_G = &v103->G;
    v110 = 0;
    v25 = v98;
    if (v103->G.nPoints < 1)
      goto LABEL_36;
    v26 = 0;
    do
    {
      -[CIRedEyeRepair3 regressionWithPointIndex:](v103, "regressionWithPointIndex:", v26);
      v26 = v110 + 1;
      v110 = v26;
      nPoints = v103->G.nPoints;
    }
    while ((int)v26 < nPoints);
    v110 = 0;
    if (nPoints < 1)
    {
LABEL_36:
      v110 = 0;
LABEL_37:
      v34 = -[CIRedEyeRepair3 findThreadsInGrid](v103, "findThreadsInGrid");
      v35 = v103->inspector;
      if (v35
        && -[RedEyeInspector3 BOOLOptionIsOn:](v35, "BOOLOptionIsOn:", 3)
        && -[RedEyeInspector3 BOOLOptionIsOn:](v103->inspector, "BOOLOptionIsOn:", 5))
      {
        v36 = -[RedEyeInspector3 initEyeMarkUpsWithBitmap:](v103->inspector, "initEyeMarkUpsWithBitmap:", p_O);
        if (height >= 1)
        {
          v37 = 0;
          v38 = v97;
          do
          {
            if (width >= 1)
            {
              v39 = 0;
              v40 = v38;
              do
              {
                -[RedEyeInspector3 emitEyeMarkUps:pixel:rectangleAtRow:column:settings:](v103->inspector, "emitEyeMarkUps:pixel:rectangleAtRow:column:settings:", v36, v40, v37, v39, &v103->S);
                v39 = (v39 + 1);
                v40 += v98;
              }
              while (width != (_DWORD)v39);
            }
            v37 = (v37 + 1);
            v38 += v99;
          }
          while ((_DWORD)v37 != height);
        }
        v23 = v103;
        -[RedEyeInspector3 emitEyeMarkUps:threadsWithGrid:settings:](v103->inspector, "emitEyeMarkUps:threadsWithGrid:settings:", v36, p_G, &v103->S);
        -[RedEyeInspector3 getIdentifyingStringEdge:settings:](v103->inspector, "getIdentifyingStringEdge:settings:", &v111, &v103->S);
        -[RedEyeInspector3 saveEyeMarkUps:withName:](v103->inspector, "saveEyeMarkUps:withName:", v36, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-T.tiff"), &v111));
        -[RedEyeInspector3 termEyeMarkUps:](v103->inspector, "termEyeMarkUps:", v36);
        v25 = v98;
      }
      if (!v34)
      {
        v34 = -[CIRedEyeRepair3 connectThreadsInGrid](v23, "connectThreadsInGrid");
        v41 = v23->inspector;
        if (v41
          && -[RedEyeInspector3 BOOLOptionIsOn:](v41, "BOOLOptionIsOn:", 3)
          && -[RedEyeInspector3 BOOLOptionIsOn:](v23->inspector, "BOOLOptionIsOn:", 5))
        {
          v42 = -[RedEyeInspector3 initEyeMarkUpsWithBitmap:](v23->inspector, "initEyeMarkUpsWithBitmap:", p_O);
          if (height >= 1)
          {
            v43 = 0;
            v44 = v97;
            do
            {
              if (width >= 1)
              {
                v45 = 0;
                v46 = v44;
                do
                {
                  -[RedEyeInspector3 emitEyeMarkUps:pixel:rectangleAtRow:column:settings:](v103->inspector, "emitEyeMarkUps:pixel:rectangleAtRow:column:settings:", v42, v46, v43, v45, &v103->S);
                  v45 = (v45 + 1);
                  v46 += v98;
                }
                while (width != (_DWORD)v45);
              }
              v43 = (v43 + 1);
              v44 += v99;
            }
            while ((_DWORD)v43 != height);
          }
          v23 = v103;
          -[RedEyeInspector3 emitEyeMarkUps:threadsWithGrid:settings:](v103->inspector, "emitEyeMarkUps:threadsWithGrid:settings:", v42, p_G, &v103->S);
          -[RedEyeInspector3 getIdentifyingStringEdge:settings:](v103->inspector, "getIdentifyingStringEdge:settings:", &v111, &v103->S);
          -[RedEyeInspector3 saveEyeMarkUps:withName:](v103->inspector, "saveEyeMarkUps:withName:", v42, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-C.tiff"), &v111));
          -[RedEyeInspector3 termEyeMarkUps:](v103->inspector, "termEyeMarkUps:", v42);
          v25 = v98;
        }
        if (!v34)
        {
          v106 = 0uLL;
          v34 = -[CIRedEyeRepair3 recognizeThreadsWinningThreadIndex:info:](v23, "recognizeThreadsWinningThreadIndex:info:", &v110, &v106);
          v51 = v23->inspector;
          if (v51)
          {
            p_S = &v23->S;
            -[RedEyeInspector3 setDebugFaceIndex:side:](v51, "setDebugFaceIndex:side:", v23->S.faceIndex, v23->S.side);
            v53 = -[RedEyeInspector3 newSavedGradientList](v23->inspector, "newSavedGradientList");
            if (v53)
            {
              v54 = v53;
              v55 = v23->inspector;
              v56 = *(_OWORD *)&v96->Tp.c;
              v111 = *(_OWORD *)&v96->Tp.a;
              v112 = v56;
              v113 = *(_OWORD *)&v96->Tp.tx;
              -[RedEyeInspector3 copyGradients:into:bitmap:transform:](v55, "copyGradients:into:bitmap:transform:", v107, v54, &v96->G, &v111);
            }
            v57 = -[RedEyeInspector3 newSavedGrid](v23->inspector, "newSavedGrid");
            v58 = v96->height;
            v59 = *(_OWORD *)&v96->Tp.c;
            v111 = *(_OWORD *)&v96->Tp.a;
            v112 = v59;
            v113 = *(_OWORD *)&v96->Tp.tx;
            -[CIRedEyeRepair3 copyGridInto:transform:height:](v23, "copyGridInto:transform:height:", v57, &v111, v58);
            -[RedEyeInspector3 termGradients:](v23->inspector, "termGradients:", v107);
            v60 = v23->inspector;
            if (v60
              && -[RedEyeInspector3 BOOLOptionIsOn:](v60, "BOOLOptionIsOn:", 3)
              && -[RedEyeInspector3 BOOLOptionIsOn:](v23->inspector, "BOOLOptionIsOn:", 5))
            {
              v100 = v34;
              v61 = -[RedEyeInspector3 initEyeMarkUpsWithBitmap:](v23->inspector, "initEyeMarkUpsWithBitmap:", p_O);
              if (height >= 1)
              {
                v62 = 0;
                v63 = v97;
                do
                {
                  if (width >= 1)
                  {
                    v64 = 0;
                    v65 = v63;
                    do
                    {
                      -[RedEyeInspector3 emitEyeMarkUps:pixel:rectangleAtRow:column:settings:](v103->inspector, "emitEyeMarkUps:pixel:rectangleAtRow:column:settings:", v61, v65, v62, v64, p_S);
                      v64 = (v64 + 1);
                      v65 += v98;
                    }
                    while (width != (_DWORD)v64);
                  }
                  v62 = (v62 + 1);
                  v63 += v99;
                }
                while ((_DWORD)v62 != height);
              }
              v23 = v103;
              -[RedEyeInspector3 emitEyeMarkUps:threadsWithGrid:settings:](v103->inspector, "emitEyeMarkUps:threadsWithGrid:settings:", v61, p_G, p_S);
              -[RedEyeInspector3 getIdentifyingStringEdge:settings:](v103->inspector, "getIdentifyingStringEdge:settings:", &v111, p_S);
              -[RedEyeInspector3 saveEyeMarkUps:withName:](v103->inspector, "saveEyeMarkUps:withName:", v61, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-R.tiff"), &v111));
              -[RedEyeInspector3 termEyeMarkUps:](v103->inspector, "termEyeMarkUps:", v61);
              v25 = v98;
              v34 = v100;
            }
          }
          if (!v34)
          {
            v105 = 0;
            threads = v103->G.threads;
            v67 = v110;
            v68 = v23->inspector;
            if (v68 && -[RedEyeInspector3 BOOLOptionIsOn:](v68, "BOOLOptionIsOn:", 2))
            {
              v69 = (float *)((char *)threads + 96 * (int)v67);
              v70 = v69[4] * 180.0 / 3.14159265;
              v71 = rintf(v70);
              v72 = 82;
              if (!v23->S.side)
                v72 = 76;
              printf("      %c %3d turn %d° ", v72, v110, (int)v71);
              *(float *)&v73 = v69[13];
              *(float *)&v74 = v69[14];
              *(float *)&v75 = v69[15];
              *(float *)&v76 = v69[16];
              -[CIRedEyeRepair3 RGBtoHSV:](v23, "RGBtoHSV:", v73, v74, v75, v76);
              printf("%3.1f%% of IOD HSV (%5.3f, %5.3f, %5.1f) SAT (%2d %2d %2d) REC %5.1f\n", v69[9] * 100.0 / (float)(v23->S.IOD * v23->S.scale), v79, v77, v78, (int)rintf(v69[17] * 100.0), (int)rintf(v69[18] * 100.0), (int)rintf(v69[19] * 100.0), v69[16]);
            }
            v80 = (char *)threads + 96 * (int)v67;
            LODWORD(v47) = *((_DWORD *)v80 + 13);
            LODWORD(v48) = *((_DWORD *)v80 + 14);
            LODWORD(v49) = *((_DWORD *)v80 + 15);
            LODWORD(v50) = *((_DWORD *)v80 + 16);
            -[CIRedEyeRepair3 RGBtoHSV:](v23, "RGBtoHSV:", v47, v48, v49, v50);
            v95->var0 = *($C28CD4A45FD07A4F97CC9D5F91F25271 *)(v80 + 52);
            p_var1 = &v95->var1;
            v82 = *(float32x2x2_t *)(v80 + 36);
            v83 = vextq_s8((int8x16_t)v82, (int8x16_t)v82, 8uLL).u64[0];
            vst2_f32(p_var1, v82);
            v95->var5 = *((float *)v80 + 21);
            *(_OWORD *)&v95->var6 = v106;
            nShapes = v103->G.nShapes;
            if ((int)nShapes < 1)
              goto LABEL_89;
            shapes = v103->G.shapes;
            v86 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32 * (nShapes - 1));
            do
            {
              if (*((_DWORD *)shapes + 6) == v110)
              {
                v86 = shapes;
                goto LABEL_87;
              }
              shapes = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32);
              --nShapes;
            }
            while (nShapes);
            if (!v86)
              goto LABEL_89;
LABEL_87:
            if (*((_DWORD *)v86 + 6) == v110)
              v88 = -[CIRedEyeRepair3 convexHull:ofOriented:shape:](v23, "convexHull:ofOriented:shape:", &v105, 0, v86);
            else
LABEL_89:
              v88 = -[CIRedEyeRepair3 convexHull:ofOriented:threadIndex:](v23, "convexHull:ofOriented:threadIndex:", &v105, 0, v110);
            v34 = v88;
            if (!v88)
            {
              v89 = v23->inspector;
              if (v89 && -[RedEyeInspector3 BOOLOptionIsOn:](v89, "BOOLOptionIsOn:", 3))
              {
                v90 = -[RedEyeInspector3 initEyeMarkUpsWithBitmap:](v23->inspector, "initEyeMarkUpsWithBitmap:", p_O);
                if (height >= 1)
                {
                  v91 = 0;
                  do
                  {
                    if (width >= 1)
                    {
                      v92 = 0;
                      v93 = v97;
                      do
                      {
                        -[RedEyeInspector3 emitEyeMarkUps:pixel:rectangleAtRow:column:settings:](v23->inspector, "emitEyeMarkUps:pixel:rectangleAtRow:column:settings:", v90, v93, v91, v92, &v23->S);
                        v92 = (v92 + 1);
                        v93 += v25;
                      }
                      while (width != (_DWORD)v92);
                    }
                    v91 = (v91 + 1);
                    v97 += v99;
                  }
                  while ((_DWORD)v91 != height);
                }
                if (v105)
                  -[RedEyeInspector3 emitEyeMarkUps:convexHull:settings:](v23->inspector, "emitEyeMarkUps:convexHull:settings:", v90, v105, &v23->S);
                -[RedEyeInspector3 getIdentifyingStringEdge:settings:](v23->inspector, "getIdentifyingStringEdge:settings:", &v111, &v23->S);
                -[RedEyeInspector3 saveEyeMarkUps:withName:](v23->inspector, "saveEyeMarkUps:withName:", v90, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.tiff"), &v111));
                -[RedEyeInspector3 termEyeMarkUps:](v23->inspector, "termEyeMarkUps:", v90);
              }
              -[CIRedEyeRepair3 termGrid](v23, "termGrid");
              v34 = 0;
              *v94 = v105;
            }
          }
        }
      }
    }
    else
    {
      v28 = 0;
      while (1)
      {
        v29 = -[CIRedEyeRepair3 replacePointAndDirection:](v103, "replacePointAndDirection:", v28);
        if (v29)
          return v29;
        v28 = v110 + 1;
        v110 = v28;
        v30 = v103->G.nPoints;
        if ((int)v28 >= v30)
        {
          v110 = 0;
          if (v30 < 1)
            goto LABEL_37;
          v31 = 0;
          while (1)
          {
            v32 = -[CIRedEyeRepair3 nextPointIndexWithPointIndex:](v103, "nextPointIndexWithPointIndex:", v31);
            if ((_DWORD)v32 != -1)
            {
              v29 = -[CIRedEyeRepair3 linkUpPointIndex:toPointIndex:](v103, "linkUpPointIndex:toPointIndex:", v110, v32);
              if (v29)
                return v29;
            }
            v31 = v110 + 1;
            v110 = v31;
            if ((int)v31 >= v103->G.nPoints)
              goto LABEL_37;
          }
        }
      }
    }
  }
  else
  {
    v33 = self->inspector;
    if (v33)
      -[RedEyeInspector3 termGradients:](v33, "termGradients:", v107);
    return 18;
  }
  return v34;
}

- (int)prepareTransformWithEyeIndex:(int)a3
{
  $B2601F6C1AEFD516A4951621A0FFBC2C *p_FC;
  $2B11B063D4FF7ECB26AB90748407DBDB *p_RR;
  int *p_maxrow;
  int *p_mincol;
  int *p_maxcol;
  int v9;
  double v10;
  double v11;
  int v12;
  int v13;
  $E8834F51CE79BF204CBF6D92B5F806C1 *p_S;
  int downsampleType;
  double scale;
  float v17;
  $42BE4D6713D11F14BD59556247296FA3 *p_PB;
  float v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGFloat v24;
  __int128 v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  float height;
  int maxrow;
  int mincol;
  $42BE4D6713D11F14BD59556247296FA3 *v37;
  __int128 v38;
  int result;
  __int128 v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;

  p_FC = &self->FC;
  p_RR = &self->FC.RR;
  p_maxrow = &self->FC.RR.maxrow;
  p_mincol = &self->FC.RR.mincol;
  p_maxcol = &self->FC.RR.maxcol;
  if (!a3)
  {
    p_maxcol = &self->FC.LR.maxcol;
    p_mincol = &self->FC.LR.mincol;
    p_maxrow = &self->FC.LR.maxrow;
    p_RR = &self->FC.LR;
  }
  v9 = *p_maxrow;
  v10 = (double)*p_mincol;
  v11 = (double)(self->FC.FR.maxrow - self->FC.FR.minrow - *p_maxrow);
  v12 = *p_maxcol - *p_mincol;
  v13 = v9 - p_RR->minrow;
  p_S = &self->S;
  downsampleType = self->S.downsampleType;
  if ((downsampleType - 1) < 3)
  {
    scale = self->S.scale;
    v17 = (double)v12 * scale;
    p_PB = &self->PB;
    v19 = (double)v13 * scale;
    v20 = (__int128 *)MEMORY[0x1E0C9BAA8];
    self->PB.width = (int)rintf(v17);
    self->PB.height = (int)rintf(v19);
    v21 = *v20;
    v22 = v20[1];
    *(_OWORD *)&self->PB.T.a = *v20;
    *(_OWORD *)&self->PB.T.c = v22;
    v23 = v20[2];
    *(_OWORD *)&self->PB.T.tx = v23;
    v24 = self->S.scale;
    *(_OWORD *)&v42.a = v21;
    *(_OWORD *)&v42.c = v22;
    *(_OWORD *)&v42.tx = v23;
    CGAffineTransformScale(&v43, &v42, v24, v24);
    v25 = *(_OWORD *)&v43.c;
    *(_OWORD *)&self->PB.T.a = *(_OWORD *)&v43.a;
    *(_OWORD *)&self->PB.T.c = v25;
    *(_OWORD *)&self->PB.T.tx = *(_OWORD *)&v43.tx;
    v26 = -v10;
    v27 = -v11;
    v28 = *(_OWORD *)&self->PB.T.c;
    *(_OWORD *)&v42.a = *(_OWORD *)&self->PB.T.a;
    *(_OWORD *)&v42.c = v28;
    *(_OWORD *)&v42.tx = *(_OWORD *)&self->PB.T.tx;
LABEL_7:
    CGAffineTransformTranslate(&v43, &v42, v26, v27);
    v33 = *(_OWORD *)&v43.c;
    *(_OWORD *)&p_PB->T.a = *(_OWORD *)&v43.a;
    *(_OWORD *)&p_PB->T.c = v33;
    *(_OWORD *)&p_PB->T.tx = *(_OWORD *)&v43.tx;
    height = p_S->inputImageExtent.size.height;
    maxrow = p_FC->FR.maxrow;
    mincol = p_FC->FR.mincol;
    v37 = &self->PB;
    v38 = *(_OWORD *)&v37->T.c;
    *(_OWORD *)&v42.a = *(_OWORD *)&v37->T.a;
    *(_OWORD *)&v42.c = v38;
    *(_OWORD *)&v42.tx = *(_OWORD *)&v37->T.tx;
    memset(&v43, 0, sizeof(v43));
    CGAffineTransformTranslate(&v43, &v42, -(double)mincol, -(double)((int)rintf(height) - maxrow));
    v41 = v43;
    CGAffineTransformInvert(&v42, &v41);
    result = 0;
    v40 = *(_OWORD *)&v42.c;
    *(_OWORD *)&v37->Tp.a = *(_OWORD *)&v42.a;
    *(_OWORD *)&v37->Tp.c = v40;
    *(_OWORD *)&v37->Tp.tx = *(_OWORD *)&v42.tx;
    return result;
  }
  if (!downsampleType)
  {
    p_PB = &self->PB;
    v29 = (__int128 *)MEMORY[0x1E0C9BAA8];
    self->PB.width = (int)(float)v12;
    self->PB.height = (int)(float)v13;
    v30 = *v29;
    v31 = v29[1];
    *(_OWORD *)&self->PB.T.a = *v29;
    *(_OWORD *)&self->PB.T.c = v31;
    v32 = v29[2];
    *(_OWORD *)&self->PB.T.tx = v32;
    v26 = -v10;
    v27 = -v11;
    *(_OWORD *)&v42.a = v30;
    *(_OWORD *)&v42.c = v31;
    *(_OWORD *)&v42.tx = v32;
    goto LABEL_7;
  }
  return 17;
}

- (int)renderEyePolygonToBitmap:(id *)a3
{
  size_t var2;
  size_t var1;
  CGColorSpace *DeviceGray;
  CGColorSpace *v8;
  CGContext *v9;
  uint64_t v10;
  int side;
  $B2601F6C1AEFD516A4951621A0FFBC2C *p_FC;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  CGPoint *LPoly;
  double v20;
  double v21;
  double v22;

  var1 = a3->var1;
  var2 = a3->var2;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  if (!DeviceGray)
    return 10;
  v8 = DeviceGray;
  v9 = CGBitmapContextCreate(a3->var0, var1, var2, 8uLL, a3->var4, DeviceGray, 0);
  CGColorSpaceRelease(v8);
  if (!v9)
    return 42;
  CGContextSetRGBFillColor(v9, 0.0, 0.0, 0.0, 1.0);
  CGContextBeginPath(v9);
  CGContextMoveToPoint(v9, 0.0, 0.0);
  CGContextAddLineToPoint(v9, (double)var1, 0.0);
  CGContextAddLineToPoint(v9, (double)var1, (double)var2);
  CGContextAddLineToPoint(v9, 0.0, (double)var2);
  CGContextAddLineToPoint(v9, 0.0, 0.0);
  CGContextClosePath(v9);
  CGContextFillPath(v9);
  CGContextSetRGBFillColor(v9, 1.0, 1.0, 1.0, 1.0);
  CGContextBeginPath(v9);
  v10 = 0;
  side = self->S.side;
  p_FC = &self->FC;
  v13 = side == 0;
  v14 = 72;
  if (v13)
    v14 = 56;
  v15 = 64;
  if (v13)
  {
    v15 = 48;
    v16 = 112;
  }
  else
  {
    v16 = 240;
  }
  v17 = (double)*(int *)((char *)&p_FC->FR.minrow + v14);
  v18 = (double)*(int *)((char *)&p_FC->FR.minrow + v15);
  if (v13)
    LPoly = p_FC->LPoly;
  else
    LPoly = p_FC->RPoly;
  v20 = (float)(var2 - 1);
  do
  {
    v21 = LPoly[v10].x - v17 + 0.5;
    v22 = v18 - LPoly[v10].y + v20 + 0.5;
    if (v10 * 16)
      CGContextAddLineToPoint(v9, v21, v22);
    else
      CGContextMoveToPoint(v9, v21, v22);
    ++v10;
  }
  while (v10 != 8);
  CGContextAddLineToPoint(v9, *(double *)((char *)&p_FC->FR.minrow + v16) - v17 + 0.5, v18 - LPoly->y + v20 + 0.5);
  CGContextClosePath(v9);
  CGContextFillPath(v9);
  CGContextRelease(v9);
  return 0;
}

- (int)prepareBitmapsWithString:(char *)a3
{
  uint64_t v5;
  CGColorSpace *v6;
  CIImage *v7;
  $42BE4D6713D11F14BD59556247296FA3 *p_PB;
  __int128 v9;
  CIImage *v10;
  CIContext *v11;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v13;
  RedEyeInspector3 *inspector;
  int result;
  uint64_t gradientChannel;
  uint64_t v17;
  CIImage *v18;
  double v19;
  float v20;
  RedEyeInspector3 *v21;
  CIImage *v22;
  double v23;
  RedEyeInspector3 *v24;
  uint64_t v25;
  RedEyeInspector3 *v26;
  CIImage *v27;
  CIImage *v28;
  RedEyeInspector3 *v29;
  uint64_t v30;
  char *baseAddress;
  vImagePixelCount height;
  size_t rowBytes;
  RedEyeInspector3 *v34;
  uint64_t v35;
  RedEyeInspector3 *v36;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_S;
  uint64_t v38;
  _OWORD v39[2];
  uint64_t v40;
  vImage_Buffer dest;
  vImage_Buffer src;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  const __CFString *v49;
  CIVector *v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  const __CFString *v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->faceBitmap.baseAddress, self->faceBitmap.size);
  v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  v7 = -[CIImage imageByClampingToExtent](+[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v5, self->faceBitmap.rowBytes, 266, v6, (double)self->faceBitmap.width, (double)self->faceBitmap.height), "imageByClampingToExtent");
  p_PB = &self->PB;
  v9 = *(_OWORD *)&self->PB.T.c;
  v43 = *(_OWORD *)&self->PB.T.a;
  v44 = v9;
  v45 = *(_OWORD *)&self->PB.T.tx;
  v10 = -[CIImage imageByApplyingTransform:](v7, "imageByApplyingTransform:", &v43);
  initBitmap((uint64_t)&self->PB.OO, self->PB.width, self->PB.height, 4, 1, 100.0);
  if (!self->PB.OO.baseAddress)
  {
    CGColorSpaceRelease(v6);
    return 9;
  }
  v11 = +[CIContext context](CIContext, "context");
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v10, self->PB.OO.baseAddress, self->PB.OO.rowBytes, 266, v6, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  CGColorSpaceRelease(v6);
  initBitmap((uint64_t)&self->PB.O, p_PB->width, self->PB.height, 4, 1, 100.0);
  if (!self->PB.O.baseAddress)
    return 9;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB)
    return 10;
  v13 = DeviceRGB;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v10, self->PB.O.baseAddress, self->PB.O.rowBytes, 266, DeviceRGB, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  CGColorSpaceRelease(v13);
  inspector = self->inspector;
  if (inspector && -[RedEyeInspector3 BOOLOptionIsOn:](inspector, "BOOLOptionIsOn:", 4))
    -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](self->inspector, "saveBitmap:format:faceIndex:side:name:which:", &self->PB.O, 266, self->S.faceIndex, self->S.side, "1-ORIG", a3);
  gradientChannel = self->S.gradientChannel;
  if (gradientChannel > 9)
    return 54;
  v17 = dword_192499C40[gradientChannel];
  v57 = CFSTR("inputChannel");
  v58[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
  v18 = -[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeChannel"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1));
  v19 = (float)(self->S.IOD * self->S.scale) * 0.05;
  v20 = v19;
  v21 = self->inspector;
  if (v21)
  {
    if (-[RedEyeInspector3 BOOLOptionIsOn:](v21, "BOOLOptionIsOn:", 4))
    {
      initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
      if ((_QWORD)v46)
      {
        -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v18, (_QWORD)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](self->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v46, 266, self->S.faceIndex, self->S.side, "2-REC", a3);
        termBitmap((void **)&v46);
      }
    }
  }
  v55 = CFSTR("inputRadius");
  *(float *)&v19 = v20;
  v56 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19, a3);
  v22 = -[CIImage imageByApplyingFilter:withInputParameters:](v18, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeMinMorphology"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
  v24 = self->inspector;
  if (v24)
  {
    if (-[RedEyeInspector3 BOOLOptionIsOn:](v24, "BOOLOptionIsOn:", 4))
    {
      initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
      if ((_QWORD)v46)
      {
        -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v22, (_QWORD)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](self->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v46, 266, self->S.faceIndex, self->S.side, "3-MIN", v38);
        termBitmap((void **)&v46);
      }
    }
  }
  v53 = CFSTR("inputRadius");
  *(float *)&v23 = v20;
  v54 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v25 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeMaxMorphology"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
  v26 = self->inspector;
  if (v26)
  {
    if (-[RedEyeInspector3 BOOLOptionIsOn:](v26, "BOOLOptionIsOn:", 4))
    {
      initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
      if ((_QWORD)v46)
      {
        -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v25, (_QWORD)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](self->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v46, 266, self->S.faceIndex, self->S.side, "4-MAX", v38);
        termBitmap((void **)&v46);
      }
    }
  }
  v51 = CFSTR("inputSubtractedImage");
  v52 = v25;
  v27 = -[CIImage imageByApplyingFilter:withInputParameters:](v18, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeDifference"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
  v28 = v27;
  if (self->PB.maskRender)
    v28 = -[CIImage imageByApplyingFilter:withInputParameters:](-[CIImage imageByApplyingFilter:withInputParameters:](v27, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeMaxMorphology"), &unk_1E2F1D7D8), "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeMinMorphology"), &unk_1E2F1D800);
  initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
  if (!(_QWORD)v46)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    return 11;
  }
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v28, (_QWORD)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  initBitmap((uint64_t)&self->PB.D, p_PB->width, self->PB.height, 1, 1, 100.0);
  if (!self->PB.D.baseAddress)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&v46);
    return 12;
  }
  -[CIRedEyeRepair3 condenseFourChannelRecognitionMap:intoOneChanneMap:](self, "condenseFourChannelRecognitionMap:intoOneChanneMap:", &v46, &self->PB.D);
  v29 = self->inspector;
  if (v29 && -[RedEyeInspector3 BOOLOptionIsOn:](v29, "BOOLOptionIsOn:", 4))
    -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](self->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v46, 266, self->S.faceIndex, self->S.side, "5-DIFF", v38);
  termBitmap((void **)&v46);
  if (!self->PB.computeGradient)
  {
    self->PB.G.baseAddress = 0;
    goto LABEL_42;
  }
  v30 = -[CIImage imageByApplyingFilter:](v28, "imageByApplyingFilter:", CFSTR("RedEyeGradient"));
  *(_QWORD *)&v45 = 0;
  v43 = 0u;
  v44 = 0u;
  initBitmap((uint64_t)&v43, p_PB->width, self->PB.height, 4, 2, 100.0);
  if (!(_QWORD)v43)
  {
LABEL_59:
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&self->PB.D.baseAddress);
    return 13;
  }
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v30, (_QWORD)v43, SDWORD1(v44), 2056, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  initBitmap((uint64_t)&self->PB.G, p_PB->width, self->PB.height, 4, 4, 100.0);
  baseAddress = self->PB.G.baseAddress;
  if (!baseAddress)
  {
    termBitmap((void **)&v43);
    goto LABEL_59;
  }
  src.data = (void *)v43;
  src.height = SHIDWORD(v43);
  src.width = 4 * SDWORD2(v43);
  src.rowBytes = SDWORD1(v44);
  height = self->PB.G.height;
  dest.data = baseAddress;
  dest.height = height;
  rowBytes = self->PB.G.rowBytes;
  dest.width = 4 * self->PB.G.width;
  dest.rowBytes = rowBytes;
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  termBitmap((void **)&v43);
  v34 = self->inspector;
  if (v34)
  {
    if (-[RedEyeInspector3 BOOLOptionIsOn:](v34, "BOOLOptionIsOn:", 4))
    {
      v40 = 0;
      memset(v39, 0, sizeof(v39));
      initBitmap((uint64_t)v39, p_PB->width, self->PB.height, 1, 1, 100.0);
      if (*(_QWORD *)&v39[0])
      {
        -[CIRedEyeRepair3 magnitudeMap:fromGabor:](self, "magnitudeMap:fromGabor:", v39, &self->PB.G);
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](self->inspector, "saveBitmap:format:faceIndex:side:name:which:", v39, 266, self->S.faceIndex, self->S.side, "6-MAG", v38);
        termBitmap((void **)v39);
      }
    }
  }
LABEL_42:
  if (self->PB.computeShine)
  {
    v49 = CFSTR("inputThresholds");
    v50 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.36, 0.36, 0.36, 0.0);
    v35 = -[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeGlintFinder"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
    initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
    if (!(_QWORD)v46)
    {
      termBitmap((void **)&self->PB.O.baseAddress);
      termBitmap((void **)&self->PB.D.baseAddress);
      if (self->PB.G.baseAddress)
        termBitmap((void **)&self->PB.G.baseAddress);
      return 14;
    }
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v35, (_QWORD)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
    initBitmap((uint64_t)&self->PB.S, p_PB->width, self->PB.height, 1, 1, 100.0);
    if (!self->PB.S.baseAddress)
    {
      termBitmap((void **)&self->PB.O.baseAddress);
      termBitmap((void **)&self->PB.D.baseAddress);
      if (self->PB.G.baseAddress)
        termBitmap((void **)&self->PB.G.baseAddress);
      termBitmap((void **)&v46);
      return 15;
    }
    -[CIRedEyeRepair3 condenseFourChannelRecognitionMap:intoOneChanneMap:](self, "condenseFourChannelRecognitionMap:intoOneChanneMap:", &v46, &self->PB.S);
    v36 = self->inspector;
    if (v36 && -[RedEyeInspector3 BOOLOptionIsOn:](v36, "BOOLOptionIsOn:", 4))
      -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](self->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v46, 266, self->S.faceIndex, self->S.side, "7-SHIN", v38);
    termBitmap((void **)&v46);
  }
  else
  {
    self->PB.S.baseAddress = 0;
  }
  if (!self->PB.computeEyePolygon)
    return 0;
  initBitmap((uint64_t)&self->PB.EP, p_PB->width, self->PB.height, 1, 1, 100.0);
  if (!self->PB.EP.baseAddress)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&self->PB.D.baseAddress);
    if (self->PB.G.baseAddress)
      termBitmap((void **)&self->PB.G.baseAddress);
    if (!self->PB.S.baseAddress)
      return 59;
    p_S = &self->PB.S;
LABEL_71:
    termBitmap((void **)&p_S->baseAddress);
    return 59;
  }
  result = -[CIRedEyeRepair3 renderEyePolygonToBitmap:](self, "renderEyePolygonToBitmap:", &self->PB.EP);
  if (result)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&self->PB.D.baseAddress);
    if (self->PB.G.baseAddress)
      termBitmap((void **)&self->PB.G.baseAddress);
    if (self->PB.S.baseAddress)
      termBitmap((void **)&self->PB.S.baseAddress);
    p_S = &self->PB.EP;
    goto LABEL_71;
  }
  return result;
}

- (void)start12BitRandom:(int)a3
{
  srandom(a3);
}

- (double)next12BitRandom
{
  return (double)(((unint64_t)random() >> 5) & 0xFFF) * 0.000244140625 + -0.5;
}

- (int)prepareMasksWithConvexHull:(id *)a3
{
  CIRedEyeRepair3 *v4;
  RedEyeInspector3 *inspector;
  RedEyeInspector3 *v6;
  RedEyeInspector3 *v7;
  RedEyeInspector3 *v8;
  $42BE4D6713D11F14BD59556247296FA3 *p_PB;
  int v10;
  RedEyeInspector3 *v11;
  double v12;
  int v13;
  RedEyeInspector3 *v15;
  char *baseAddress;
  uint64_t rowSamples;
  uint64_t samplesPerPixel;
  int width;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  int v30;
  char *v31;
  unsigned __int8 *v32;
  char *v33;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  RedEyeInspector3 *v38;
  uint64_t p_S;
  char *v40;
  double y;
  double v42;
  long double v43;
  float *rightDistMatrix;
  int v45;
  float v46;
  double v47;
  double v48;
  float v49;
  float v50;
  float *v51;
  int v52;
  float v53;
  double v54;
  char *v55;
  double v56;
  uint64_t v57;
  float v58;
  float v59;
  _BYTE *v60;
  float v61;
  __double2 v62;
  uint64_t i;
  float sinval;
  float cosval;
  float v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t j;
  uint64_t v70;
  float v71;
  _BYTE *v72;
  float v73;
  double v74;
  uint64_t v75;
  float v76;
  float v77;
  uint64_t k;
  float *p_IOD;
  float v80;
  float v81;
  char *v82;
  int v83;
  int v84;
  _BYTE *v85;
  float v86;
  float v87;
  float v88;
  float v89;
  double v90;
  double v91;
  int v92;
  int v93;
  _BYTE *v94;
  float v95;
  float v96;
  RedEyeInspector3 *v97;
  int v98;
  signed int v99;
  signed int v100;
  int v101;
  signed int v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  char *v108;
  char *v109;
  int v110;
  char *v111;
  char *v112;
  int v113;
  signed int v114;
  signed int v115;
  int v116;
  unsigned int v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  $42BE4D6713D11F14BD59556247296FA3 *v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  float avgLuminance;
  float v126;
  _BYTE *v127;
  unsigned __int8 *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  int v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  int32x2_t v137;
  double v138;
  int v139;
  unsigned int v140;
  int32x2_t v141;
  int v142;
  uint32x2_t v143;
  RedEyeInspector3 *v144;
  uint64_t p_P;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  _QWORD *p_minrow;
  uint64_t v151;
  uint64_t v152;
  int v153;
  int v154;
  int *p_repairMap;
  unint64_t BitmapRect;
  $B2601F6C1AEFD516A4951621A0FFBC2C *p_FC;
  uint64_t v158;
  $42BE4D6713D11F14BD59556247296FA3 *v159;
  $E8834F51CE79BF204CBF6D92B5F806C1 *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unsigned __int8 *v167;
  _BYTE *v168;
  int v169;
  int v170;
  char *v171;
  float v172;
  int v173;
  float v174;
  int v175;
  int v176;
  uint64_t v177;
  CIRedEyeRepair3 *v178;
  char *v179;
  void *v180;
  double v181;
  uint64_t v182;
  uint64_t v183;
  double v184;
  uint64_t v185;
  int height;
  char *v187;
  char *v188;
  float v189;
  char *v190;
  char *v191;
  float v192;
  int v193;
  char *v194;
  int32x2_t v195;
  float v196;
  int v197;
  char *v198;
  int v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  uint64_t v203;
  char v204[256];
  _BYTE v205[80];
  uint64_t v206;

  v4 = self;
  v206 = *MEMORY[0x1E0C80C00];
  inspector = self->inspector;
  if (inspector)
  {
    if (-[RedEyeInspector3 BOOLOptionIsOn:](inspector, "BOOLOptionIsOn:", 0))
      -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v4->PB.O, 266, v4->S.faceIndex, v4->S.side, "1-ORIG", "M");
    v6 = v4->inspector;
    if (v6)
    {
      if (-[RedEyeInspector3 BOOLOptionIsOn:](v6, "BOOLOptionIsOn:", 1))
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v4->PB.D, 266, v4->S.faceIndex, v4->S.side, "2-DIFF", "M");
      v7 = v4->inspector;
      if (v7)
      {
        if (-[RedEyeInspector3 BOOLOptionIsOn:](v7, "BOOLOptionIsOn:", 1))
          -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v4->PB.S, 266, v4->S.faceIndex, v4->S.side, "A-OSHN", "M");
        v8 = v4->inspector;
        if (v8 && -[RedEyeInspector3 BOOLOptionIsOn:](v8, "BOOLOptionIsOn:", 1))
          -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v4->PB.EP, 266, v4->S.faceIndex, v4->S.side, "B-POLY", "M");
      }
    }
  }
  p_PB = &v4->PB;
  initBitmap((uint64_t)&v4->PB.M, v4->PB.width, v4->PB.height, 1, 1, 100.0);
  if (!v4->PB.M.baseAddress)
    return 6;
  v10 = -[CIRedEyeRepair3 analyzeMask:usingConvexHull:producingOptimizedMask:](v4, "analyzeMask:usingConvexHull:producingOptimizedMask:", &v4->PB.D, a3, &v4->PB.M);
  if (!v10)
  {
    v11 = v4->inspector;
    if (v11 && -[RedEyeInspector3 BOOLOptionIsOn:](v11, "BOOLOptionIsOn:", 1))
      -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v4->PB.M, 266, v4->S.faceIndex, v4->S.side, "3-OPTI", "M");
    v202 = 0;
    v203 = 0;
    v200 = 0u;
    v201 = 0u;
    v10 = -[CIRedEyeRepair3 widenedHull:withHull:by:](v4, "widenedHull:withHull:by:", &v203, a3, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
    if (!v10)
    {
      initBitmap((uint64_t)&v200, v4->PB.width, v4->PB.height, 1, 1, 100.0);
      if (!(_QWORD)v200)
      {
        -[CIRedEyeRepair3 termHull:](v4, "termHull:", v203);
        return 7;
      }
      LODWORD(v12) = 2.0;
      v13 = -[CIRedEyeRepair3 renderConvexHull:distance:fieldToBitmap:](v4, "renderConvexHull:distance:fieldToBitmap:", v203, &v200, v12);
      if (v13)
      {
        v10 = v13;
        -[CIRedEyeRepair3 termHull:](v4, "termHull:", v203);
        termBitmap((void **)&v200);
        return v10;
      }
      v15 = v4->inspector;
      if (v15 && -[RedEyeInspector3 BOOLOptionIsOn:](v15, "BOOLOptionIsOn:", 1))
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v200, 266, v4->S.faceIndex, v4->S.side, "4-DIST", "M");
      -[CIRedEyeRepair3 termHull:](v4, "termHull:", v203);
      if ((applyMaxFilter8((uint64_t)&v4->PB.M, 3) & 1) == 0)
      {
        termBitmap((void **)&v200);
        return 0;
      }
      baseAddress = v4->PB.S.baseAddress;
      rowSamples = v4->PB.S.rowSamples;
      samplesPerPixel = v4->PB.S.samplesPerPixel;
      width = p_PB->width;
      height = v4->PB.height;
      v179 = baseAddress;
      if (height < 1)
      {
        v23 = 0;
        v22 = 0;
        v21 = 0;
      }
      else
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v24 = SHIDWORD(v201);
        v25 = (int)v201;
        v26 = (unsigned __int8 *)v200;
        v27 = v4->PB.M.samplesPerPixel;
        v28 = v4->PB.M.rowSamples;
        v29 = v4->PB.M.baseAddress;
        do
        {
          if (width >= 1)
          {
            v30 = 0;
            v31 = baseAddress;
            v32 = v26;
            v33 = v29;
            do
            {
              v34 = *v31;
              v35 = *v32 | (*v32 << 8);
              v36 = v35 * *v33;
              v37 = (v36 + 0x8000) >> 16;
              if (v36 >= 0x8000)
              {
                v23 += v37 * v30;
                v22 += v37 * v20;
                v21 += v37;
              }
              ++v30;
              *v33 = v37;
              *v31 = (v35 * v34 + 0x8000) >> 16;
              v33 += v27;
              v32 += v24;
              v31 += samplesPerPixel;
            }
            while (width != v30);
          }
          ++v20;
          v29 += v28;
          v26 += v25;
          baseAddress += rowSamples;
        }
        while (v20 != height);
      }
      termBitmap((void **)&v200);
      v38 = v4->inspector;
      if (v38)
        v176 = -[RedEyeInspector3 debuggingThisFaceAndEye:](v38, "debuggingThisFaceAndEye:", &v4->S);
      else
        v176 = 0;
      p_S = (uint64_t)&v4->PB.S;
      v160 = &v4->S;
      v40 = v179;
      p_FC = &v4->FC;
      if (v4->S.side)
      {
        y = v4->FC.rightEye.y;
        v42 = v4->FC.rightEye.x - (double)v4->FC.RR.mincol;
        v43 = y - (double)v4->FC.RR.minrow;
        v181 = v43;
        rightDistMatrix = v4->FC.rightDistMatrix;
      }
      else
      {
        y = v4->FC.leftEye.y;
        v42 = v4->FC.leftEye.x - (double)v4->FC.LR.mincol;
        v43 = y - (double)v4->FC.LR.minrow;
        v181 = v43;
        rightDistMatrix = v4->FC.leftDistMatrix;
      }
      if (height >= 1)
      {
        v45 = 0;
        *(float *)&y = (float)v21;
        v174 = (float)v23 / (float)v21;
        v46 = 0.0;
        v47 = 0.0;
        v48 = 1.0;
        v49 = 0.0;
        v50 = 0.0;
        *(float *)&v43 = (float)v22 / (float)v21;
        v172 = *(float *)&v43;
        v51 = rightDistMatrix;
        do
        {
          v184 = v47;
          if (width >= 1)
          {
            v52 = 0;
            *(float *)&v43 = v47 - v181;
            v196 = *v51;
            v192 = v51[1] * *(float *)&v43;
            v189 = v51[2];
            v53 = v51[3] * *(float *)&v43;
            v54 = 0.0;
            v55 = v40;
            do
            {
              LOBYTE(v43) = *v55;
              v43 = pow((float)((float)LODWORD(v43) * 0.0039216), 7.0);
              v48 = 1.0;
              *(float *)&v43 = v43;
              y = v54 - v42;
              *(float *)&y = v54 - v42;
              *(float *)&v43 = sqrtf((float)((float)(v53 + (float)(*(float *)&y * v189))* (float)(v53 + (float)(*(float *)&y * v189)))+ (float)((float)(v192 + (float)(*(float *)&y * v196))* (float)(v192 + (float)(*(float *)&y * v196))))* *(float *)&v43;
              v50 = v50 + *(float *)&v43;
              *(float *)&y = (float)v52;
              v49 = v49 + (float)((float)v52 * *(float *)&v43);
              v46 = v46 + (float)((float)v45 * *(float *)&v43);
              v54 = v54 + 1.0;
              ++v52;
              v55 += samplesPerPixel;
            }
            while (width != v52);
          }
          v47 = v184 + v48;
          ++v45;
          v40 += rowSamples;
        }
        while (v45 != height);
        p_PB = &v4->PB;
        if (v50 > 0.0)
        {
          v56 = v42;
          v57 = 0;
          v58 = v49 / v50;
          v59 = 0.0;
          v60 = v205;
          v61 = v46 / v50;
          do
          {
            v62 = __sincos_stret(v59);
            for (i = 0; i != 10; ++i)
            {
              sinval = v62.__sinval;
              cosval = v62.__cosval;
              v60[i] = bilinearLookup(p_S, v58 + (float)((float)(int)i * cosval), v61 + (float)((float)(int)i * sinval));
            }
            ++v57;
            v59 = v59 + 0.7854;
            v60 += 10;
          }
          while (v57 != 8);
          if (v176)
          {
            -[RedEyeInspector3 getIdentifyingString:settings:](v4->inspector, "getIdentifyingString:settings:", v204, v160);
            printf("%s glint neighborhood\n", v204);
            v67 = 0;
            v68 = v205;
            do
            {
              printf("%d ", v67);
              for (j = 0; j != 10; ++j)
                printf("%3d ", v68[j]);
              putchar(10);
              ++v67;
              v68 += 10;
            }
            while (v67 != 8);
          }
          v70 = 0;
          v71 = -1.0;
          v72 = v205;
          v73 = 256.0;
          v74 = v56;
          do
          {
            v75 = 0;
            v76 = 0.0;
            do
            {
              LOBYTE(v66) = v72[v75];
              v66 = (float)LODWORD(v66);
              v76 = v76 + v66;
              v75 += 10;
            }
            while (v75 != 80);
            v77 = v76 * 0.125;
            if (v77 < v73)
              v73 = v77;
            if (v77 > v71)
              v71 = v77;
            *(float *)&v204[4 * v70++] = v77;
            ++v72;
          }
          while (v70 != 10);
          if ((v176 & 1) != 0)
          {
            printf("A ");
            for (k = 0; k != 40; k += 4)
              printf("%3d ", (int)rintf(*(float *)&v204[k]));
            putchar(10);
            p_IOD = &v4->S.IOD;
            v80 = v4->S.IOD * 0.025;
            v81 = v73 / v71;
            printf("intensity %5.1f diameter %4.1f falloff %.3f\n", v71, v80, (float)(v73 / v71));
            putchar(10);
            v82 = v179;
            v74 = v56;
          }
          else
          {
            v81 = v73 / v71;
            p_IOD = &v4->S.IOD;
            v80 = v4->S.IOD * 0.025;
            v82 = v179;
          }
          if (v71 < 121.0 || v81 > 0.28)
          {
            v88 = v174 - v74;
            v89 = v172 - v181;
            v90 = sqrtf((float)(v89 * v89) + (float)(v88 * v88));
            v91 = *p_IOD;
            if (v91 * 0.025 <= v90)
            {
              p_PB = &v4->PB;
              bzero(v82, v4->PB.S.size);
            }
            else
            {
              v92 = 0;
              v43 = v91 * 0.009;
              *(float *)&v43 = v43;
              y = *(float *)&v43;
              if (*(float *)&v43 < 1.3)
                *(float *)&v43 = 1.3;
              LODWORD(y) = 0.5;
              p_PB = &v4->PB;
              do
              {
                if (width >= 1)
                {
                  v93 = 0;
                  v94 = v82;
                  do
                  {
                    v95 = (float)(*(float *)&v43
                                - sqrtf((float)((float)((float)v92 - v61) * (float)((float)v92 - v61))+ (float)((float)((float)v93 - v58) * (float)((float)v93 - v58))))* 0.5;
                    v96 = 1.0;
                    if (v95 <= 1.0)
                    {
                      v96 = v95;
                      if (v95 < 0.0)
                        v96 = 0.0;
                    }
                    *v94 = (int)rintf(v96 * 255.0);
                    ++v93;
                    v94 += samplesPerPixel;
                  }
                  while (width != v93);
                }
                ++v92;
                v82 += rowSamples;
              }
              while (v92 != height);
            }
          }
          else
          {
            v83 = 0;
            y = (v80 + 2.0) * 0.5;
            *(float *)&y = y;
            v43 = *p_IOD * 0.025;
            *(float *)&v43 = v43;
            if (*(float *)&v43 < 1.3)
              *(float *)&v43 = 1.3;
            if (*(float *)&v43 >= *(float *)&y)
              *(float *)&v43 = *(float *)&y;
            LODWORD(y) = 0.5;
            p_PB = &v4->PB;
            do
            {
              if (width >= 1)
              {
                v84 = 0;
                v85 = v82;
                do
                {
                  v86 = (float)(*(float *)&v43
                              - sqrtf((float)((float)((float)v83 - v61) * (float)((float)v83 - v61))+ (float)((float)((float)v84 - v58) * (float)((float)v84 - v58))))* 0.5;
                  v87 = 1.0;
                  if (v86 <= 1.0)
                  {
                    v87 = v86;
                    if (v86 < 0.0)
                      v87 = 0.0;
                  }
                  *v85 = (int)rintf(v87 * (float)*v85);
                  ++v84;
                  v85 += samplesPerPixel;
                }
                while (width != v84);
              }
              ++v83;
              v82 += rowSamples;
            }
            while (v83 != height);
          }
        }
      }
      v97 = v4->inspector;
      if (v97 && -[RedEyeInspector3 BOOLOptionIsOn:](v97, "BOOLOptionIsOn:", 1, (double)v43, y))
      {
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", &v4->PB.M, 266, v4->S.faceIndex, v4->S.side, "5-PROD", "M");
        -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", p_S, 266, v4->S.faceIndex, v4->S.side, "6-SHIN", "M");
      }
      v98 = p_PB->height;
      if (v98 < 1)
        return 56;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v104 = p_PB->width;
      v105 = p_PB->M.rowSamples;
      v106 = p_PB->M.samplesPerPixel;
      v107 = 1;
      v108 = p_PB->S.baseAddress;
      v109 = p_PB->M.baseAddress;
      do
      {
        if (v104 >= 1)
        {
          v110 = 0;
          v111 = v108;
          v112 = v109;
          do
          {
            v113 = *v112 | *v111;
            if (v99 <= v100)
              v114 = v100;
            else
              v114 = v99;
            if (v99 >= v102)
              v115 = v102;
            else
              v115 = v99;
            if (v99 < v102)
              v114 = v100;
            if (v110 <= v101)
              v116 = v101;
            else
              v116 = v110;
            if (v110 >= (int)v103)
              v117 = v103;
            else
              v117 = v110;
            if (v110 < (int)v103)
              v116 = v101;
            if ((v107 & 1) != 0)
            {
              v117 = v110;
              v115 = v99;
              v116 = v110;
              v114 = v99;
            }
            if (v113)
              v103 = v117;
            else
              v103 = v103;
            if (v113)
            {
              v102 = v115;
              v101 = v116;
              v100 = v114;
              v107 = 0;
            }
            ++v110;
            v112 += v106;
            v111 += p_PB->S.samplesPerPixel;
          }
          while (v104 != v110);
        }
        ++v99;
        v109 += v105;
        v108 += p_PB->S.rowSamples;
      }
      while (v99 != v98);
      if ((v107 & 1) != 0)
        return 56;
      v187 = p_PB->M.baseAddress;
      v190 = p_PB->S.baseAddress;
      v185 = p_PB->S.samplesPerPixel;
      v165 = p_PB->S.rowSamples;
      v197 = v100 + 1;
      v193 = v101 + 1;
      BitmapRect = makeBitmapRect(v103, v102, (v101 + 1), (v100 + 1));
      v166 = v118;
      termBitmap((void **)&v4->repairMap.baseAddress);
      initBitmap((uint64_t)&v4->repairMap, v193 - v103, v197 - v102, 4, 1, 100.0);
      v119 = v4->repairMap.baseAddress;
      if (v119)
      {
        v120 = BitmapRect;
        v121 = p_PB;
        v198 = p_PB->OO.baseAddress;
        v164 = p_PB->OO.rowSamples;
        v122 = p_PB->OO.samplesPerPixel;
        v163 = v4->repairMap.rowSamples;
        p_repairMap = (int *)&v4->repairMap;
        v180 = (void *)v4->repairMap.samplesPerPixel;
        v123 = BitmapRect;
        v194 = p_PB->EP.baseAddress;
        v124 = p_PB->EP.rowSamples;
        v159 = v121;
        v182 = v121->EP.samplesPerPixel;
        v183 = v122;
        avgLuminance = v4->M.avgLuminance;
        -[CIRedEyeRepair3 start12BitRandom:](v4, "start12BitRandom:", 75838567);
        if ((int)BitmapRect < SHIDWORD(BitmapRect))
        {
          v153 = v104;
          v154 = v98;
          v178 = v4;
          v170 = 0;
          v173 = 0;
          v126 = (avgLuminance * 0.0000036 * avgLuminance + 0.08) * 255.0;
          v175 = (int)rintf(v126);
          v171 = &v194[(int)v124 * (uint64_t)(int)BitmapRect];
          v188 = &v187[(int)v105 * (uint64_t)(int)BitmapRect];
          v191 = &v190[(int)v165 * (uint64_t)(int)BitmapRect];
          v177 = v106;
          v158 = (int)v106 * (int)v166;
          v161 = v124;
          v127 = v119 + 2;
          v128 = (unsigned __int8 *)&v198[(int)v183 * (uint64_t)(int)v166 + 2 + (int)v164 * (uint64_t)(int)BitmapRect];
          v162 = v105;
          do
          {
            v169 = v123;
            v167 = v128;
            v168 = v127;
            if (SHIDWORD(v166) > (int)v166)
            {
              v130 = (int)v185 * (int)v166;
              v129 = v158;
              v131 = (int)v182 * (uint64_t)(int)v166;
              v132 = HIDWORD(v166) - v166;
              do
              {
                v199 = v188[v129];
                v133 = v191[v130];
                v134 = v199 | (v199 << 8);
                v135 = v133 | (v133 << 8);
                v136 = *v128;
                v137.i32[0] = *(v128 - 2);
                v137.i32[1] = *(v128 - 1);
                v195 = v137;
                -[CIRedEyeRepair3 next12BitRandom](v178, "next12BitRandom");
                *(float *)&v138 = v138 * 7.5;
                v139 = (int)rintf(*(float *)&v138) + v175;
                if (v139 >= 255)
                  v139 = 255;
                v140 = v139 & ~(v139 >> 31);
                v141 = vsra_n_s32(v195, vmla_s32((int32x2_t)0x800000008000, vsub_s32(vdup_n_s32(v140), v195), vdup_n_s32(v134)), 0x10uLL);
                v142 = v136 + ((int)((v140 - v136) * v134 + 0x8000) >> 16);
                v143 = vsra_n_u32((uint32x2_t)v141, (uint32x2_t)vmla_s32((int32x2_t)0x800000008000, vsub_s32((int32x2_t)0xFF000000FFLL, v141), vdup_n_s32(v135)), 0x10uLL);
                *(v127 - 1) = v143.i8[4];
                *(v127 - 2) = v143.i8[0];
                *v127 = v142 + (((255 - v142) * v135 + 0x8000) >> 16);
                v127[1] = -1;
                if (v133 | v199)
                {
                  if (v171[v131])
                    ++v173;
                  else
                    ++v170;
                }
                v128 += v183;
                v131 += v182;
                v127 = (char *)v180 + (_QWORD)v127;
                v130 += v185;
                v129 += v177;
                --v132;
              }
              while (v132);
            }
            v123 = v169 + 1;
            v188 += v162;
            v191 += v165;
            v171 += v161;
            v127 = &v168[v163];
            v128 = &v167[v164];
          }
          while (v169 + 1 != HIDWORD(BitmapRect));
          v4 = v178;
          v104 = v153;
          v98 = v154;
          v120 = BitmapRect;
          if (v173 < v170)
            return 56;
        }
        v144 = v4->inspector;
        if (!v144 || !-[RedEyeInspector3 BOOLOptionIsOn:](v144, "BOOLOptionIsOn:", 0))
          goto LABEL_155;
        p_P = (uint64_t)&v159->P;
        initBitmap((uint64_t)&v159->P, v104, v98, 4, 1, 100.0);
        v146 = v159->P.baseAddress;
        if (v146)
        {
          memmove(v146, v159->OO.baseAddress, v159->P.size);
          copyBitmapToSliceOfBitmap(p_repairMap, p_P, v120, v166);
          -[RedEyeInspector3 saveBitmap:format:faceIndex:side:name:which:](v4->inspector, "saveBitmap:format:faceIndex:side:name:which:", p_P, 266, v160->faceIndex, v160->side, "7-FINL", "M");
LABEL_155:
          v147 = 64;
          if (!v160->side)
            v147 = 48;
          v148 = 72;
          if (!v160->side)
            v148 = 56;
          v149 = offsetBitmapRect(v120, v166, *(unsigned int *)((char *)&p_FC->FR.minrow + v148), *(int *)((char *)&p_FC->FR.minrow + v147));
          p_minrow = &v4->repairRect.minrow;
          v10 = 0;
          *p_minrow = offsetBitmapRect(v149, v151, p_FC->FR.mincol, p_FC->FR.minrow);
          p_minrow[1] = v152;
          return v10;
        }
      }
      return 2;
    }
  }
  return v10;
}

- (int)repairDictionary:(id *)a3 withEyeIndex:(int)a4
{
  uint64_t v4;
  $E8834F51CE79BF204CBF6D92B5F806C1 *p_S;
  int v8;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  char v14;
  char v15;
  int v16;
  uint64_t *v17;
  int v18;
  float scale;
  uint64_t v20;
  double v21;
  float64x2_t *v22;
  id *v23;
  _DWORD *v24;
  uint64_t v25;
  void *v26;
  _DWORD v27[26];
  uint64_t v28;
  uint64_t v29;
  _DWORD v30[2];
  uint64_t v31;

  v4 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v28 = 0;
  v29 = 0;
  p_S = &self->S;
  self->S.side = a4;
  -[CIRedEyeRepair3 initBitmaps](self, "initBitmaps");
  v8 = -[CIRedEyeRepair3 prepareTransformWithEyeIndex:](self, "prepareTransformWithEyeIndex:", v4);
  if (!v8)
  {
    self->PB.maskRender = 0;
    self->PB.computeGradient = 1;
    self->PB.computeShine = 0;
    self->PB.computeEyePolygon = 0;
    v8 = -[CIRedEyeRepair3 prepareBitmapsWithString:](self, "prepareBitmapsWithString:", "TI");
    if (!v8)
    {
      v23 = a3;
      v24 = 0;
      v10 = 0;
      v25 = 0;
      v11 = 0;
      v12 = *(_OWORD *)&self->PB.Tp.a;
      v13 = *(_OWORD *)&self->PB.Tp.tx;
      *(_OWORD *)&p_S->transform.c = *(_OWORD *)&self->PB.Tp.c;
      *(_OWORD *)&p_S->transform.tx = v13;
      *(_OWORD *)&p_S->transform.a = v12;
      v14 = 1;
      p_S->height = self->PB.height;
      do
      {
        v15 = v14;
        if ((v14 & 1) != 0)
          v16 = 6;
        else
          v16 = 8 * (p_S->IOD < 130.0);
        p_S->edgeFindingChannel = v16;
        v17 = &v28 + v10;
        v18 = -[CIRedEyeRepair3 prominenceConvexHull:facts:](self, "prominenceConvexHull:facts:", v17, &v27[13 * v10], v23);
        v30[v10] = v18;
        if (v18)
        {
          *v17 = 0;
        }
        else
        {
          ++v11;
          v24 = &v27[13 * v10];
          v25 = *v17;
        }
        v14 = 0;
        v10 = 1;
      }
      while ((v15 & 1) != 0);
      if (v11 != 1)
      {
        if (!v11)
          return v30[0];
        v25 = v28;
        -[CIRedEyeRepair3 termHull:](self, "termHull:", v29);
        v24 = v27;
      }
      -[CIRedEyeRepair3 termBitmaps](self, "termBitmaps");
      if (v25)
      {
        scale = p_S->scale;
        if (scale < 1.0)
        {
          v20 = *(unsigned int *)(v25 + 4);
          if ((int)v20 >= 1)
          {
            v21 = (float)(1.0 / scale);
            v22 = *(float64x2_t **)(v25 + 16);
            do
            {
              *v22 = vmulq_n_f64(*v22, v21);
              ++v22;
              --v20;
            }
            while (v20);
          }
        }
        v8 = -[CIRedEyeRepair3 saveRepairDictionary:withConvexHull:facts:](self, "saveRepairDictionary:withConvexHull:facts:", &v26, v25, v24);
        -[CIRedEyeRepair3 termHull:](self, "termHull:", v25);
        if (!v8)
          *v23 = v26;
      }
      else
      {
        return 0;
      }
    }
  }
  return v8;
}

- (int)executeRepairWithRepairDictionary:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  int side;
  $2B11B063D4FF7ECB26AB90748407DBDB *p_RR;
  int *p_maxrow;
  int *p_mincol;
  BOOL v10;
  int *p_maxcol;
  int v12;
  int v13;
  int v14;
  int v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;
  CGAffineTransform v25;
  CGAffineTransform v26;
  _OWORD v27[3];
  int v28;
  uint64_t v29;

  v29 = 0;
  v28 = 0;
  memset(v27, 0, sizeof(v27));
  if (!-[CIRedEyeRepair3 openRepairDictionary:convexHull:facts:](self, "openRepairDictionary:convexHull:facts:", a3, &v29, v27))return 1;
  initBitmap((uint64_t)&self->faceBitmap, self->FC.FR.maxcol - self->FC.FR.mincol, self->FC.FR.maxrow - self->FC.FR.minrow, 4, 1, 100.0);
  if (self->faceBitmap.baseAddress)
  {
    v4 = offsetBitmapRect(*(_QWORD *)&self->FC.FR.minrow, *(_QWORD *)&self->FC.FR.mincol, -self->subRectangle.mincol, -self->subRectangle.minrow);
    copySliceOfBitmapToBitmap((int *)&self->fullBitmap, &self->faceBitmap.baseAddress, v4, v5);
    -[CIRedEyeRepair3 initBitmaps](self, "initBitmaps");
    side = self->S.side;
    p_RR = &self->FC.RR;
    p_maxrow = &self->FC.RR.maxrow;
    p_mincol = &self->FC.RR.mincol;
    v10 = side == 0;
    if (side)
      p_maxcol = &self->FC.RR.maxcol;
    else
      p_maxcol = &self->FC.LR.maxcol;
    if (v10)
      p_mincol = &self->FC.LR.mincol;
    if (v10)
      p_maxrow = &self->FC.LR.maxrow;
    if (v10)
      p_RR = &self->FC.LR;
    v12 = *p_maxrow;
    v13 = *p_mincol;
    v14 = self->FC.FR.maxrow - self->FC.FR.minrow - v12;
    v15 = (int)(float)(v12 - p_RR->minrow);
    v16 = (__int128 *)MEMORY[0x1E0C9BAA8];
    self->PB.width = (int)(float)(*p_maxcol - v13);
    self->PB.height = v15;
    v17 = *v16;
    v18 = v16[1];
    *(_OWORD *)&self->PB.T.a = *v16;
    *(_OWORD *)&self->PB.T.c = v18;
    v19 = v16[2];
    *(_OWORD *)&self->PB.T.tx = v19;
    *(_OWORD *)&v25.a = v17;
    *(_OWORD *)&v25.c = v18;
    *(_OWORD *)&v25.tx = v19;
    CGAffineTransformTranslate(&v26, &v25, -(double)v13, -(double)v14);
    v20 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->PB.T.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->PB.T.c = v20;
    *(_OWORD *)&self->PB.T.tx = *(_OWORD *)&v26.tx;
    v21 = *(_OWORD *)&self->PB.T.c;
    *(_OWORD *)&v25.a = *(_OWORD *)&self->PB.T.a;
    *(_OWORD *)&v25.c = v21;
    *(_OWORD *)&v25.tx = *(_OWORD *)&self->PB.T.tx;
    CGAffineTransformInvert(&v26, &v25);
    v22 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->PB.Tp.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->PB.Tp.c = v22;
    *(_OWORD *)&self->PB.Tp.tx = *(_OWORD *)&v26.tx;
    self->S.scale = 1.0;
    self->PB.maskRender = 1;
    self->PB.computeGradient = 0;
    self->PB.computeShine = 1;
    self->PB.computeEyePolygon = 1;
    v23 = -[CIRedEyeRepair3 prepareBitmapsWithString:](self, "prepareBitmapsWithString:", "MI");
    if (!v23)
      v23 = -[CIRedEyeRepair3 prepareMasksWithConvexHull:](self, "prepareMasksWithConvexHull:", v29);
    -[CIRedEyeRepair3 termBitmaps](self, "termBitmaps");
  }
  else
  {
    v23 = 55;
  }
  -[CIRedEyeRepair3 termHull:](self, "termHull:", v29);
  return v23;
}

- (BOOL)gatherFaceStatistics:(id *)a3
{
  double v3;
  $98842C164A97019BEC1DF4F65F0C834F *p_FS;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_faceBitmap;
  uint64_t v8;
  int width;
  int height;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t samplesPerPixel;
  uint64_t rowSamples;
  uint64_t v17;
  double v18;
  float v19;
  float v20;
  double v21;
  unsigned __int8 *v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  double v27;
  unsigned int v30;
  unsigned int v31;
  double v32;
  float v35;
  double v36;
  float v37;
  float v38;
  float v39;

  p_FS = &self->FS;
  p_faceBitmap = &self->faceBitmap;
  *(float *)&v3 = self->S.IOD;
  *(_QWORD *)&self->FS.variance = -[CIRedEyeRepair3 focusStatsWithBitmap:IOD:](self, "focusStatsWithBitmap:IOD:", &self->faceBitmap, v3);
  *(_QWORD *)&p_FS->nNonZero = v8;
  width = p_faceBitmap->width;
  height = p_faceBitmap->height;
  if (height < 1)
  {
    v13 = 0;
    v14 = 0;
    v21 = 0.0;
    v35 = 0.0;
    v19 = 1000.0;
    v20 = -1000.0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    samplesPerPixel = p_faceBitmap->samplesPerPixel;
    rowSamples = p_faceBitmap->rowSamples;
    v17 = (uint64_t)(p_faceBitmap->baseAddress + 1);
    v18 = 0.0;
    v19 = 1000.0;
    v20 = -1000.0;
    v21 = 0.0;
    do
    {
      if (width >= 1)
      {
        v22 = (unsigned __int8 *)v17;
        v23 = width;
        do
        {
          v24 = *(v22 - 1);
          v25 = *v22;
          v26 = v22[1];
          v27 = (double)v25 * 0.587 + (double)v26 * 0.299 + (double)v24 * 0.114;
          if (v27 < v19)
            v19 = v27;
          if (v27 > v20)
            v20 = v27;
          if (v26 > 0xFA || v25 > 0xFA || v24 > 0xFA)
            ++v13;
          if (v25 <= v26)
            v30 = v22[1];
          else
            v30 = *v22;
          if (v25 >= v26)
            v31 = v22[1];
          else
            v31 = *v22;
          if (v30 <= v24)
            v30 = *(v22 - 1);
          if (v31 >= v24)
            v31 = *(v22 - 1);
          v32 = (double)(int)((v30 - v31) * v26) / 65025.0;
          if (v32 <= 0.05)
            v32 = -0.0;
          else
            ++v12;
          v21 = v21 + v27;
          v18 = v18 + v32;
          if (v26 < 0x8D && v25 < 0x8D && v24 < 0x8D)
            ++v14;
          v22 += samplesPerPixel;
          --v23;
        }
        while (v23);
      }
      ++v11;
      v17 += rowSamples;
    }
    while (v11 != height);
    v35 = 1.0 / (double)v12 * v18;
    if (!v12)
      v35 = 0.0;
  }
  self->skinval = v35;
  v36 = 1.0 / (double)(height * width);
  v37 = v36 * v21;
  a3->var0 = v35;
  a3->var1 = v37;
  a3->var2 = v19;
  a3->var3 = v20;
  v38 = v36 * ((float)v14 * 100.0);
  v39 = v36 * ((float)v13 * 100.0);
  a3->var4 = v38;
  a3->var5 = v39;
  return 1;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)focusStatsWithBitmap:(id *)a3 IOD:(float)a4
{
  char *var0;
  int var2;
  uint64_t var3;
  uint64_t var6;
  int var1;
  int v9;
  uint64_t v10;
  int v11;
  unsigned __int8 *v12;
  unint64_t v13;
  unsigned int v14;
  unsigned __int8 *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  uint64_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  double v28;
  float64x2_t v29;
  int32x4_t v30;
  double v31;
  int32x4_t v32;
  int64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  __int128 v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  unint64_t v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  double v52;
  _DWORD v53[256];
  _DWORD v54[512];
  uint64_t v55;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v55 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  var2 = a3->var2;
  var3 = a3->var3;
  var6 = a3->var6;
  var1 = a3->var1;
  bzero(v54, 0x800uLL);
  bzero(v53, 0x400uLL);
  if (var2 > 2)
  {
    v9 = 1;
    v10 = (uint64_t)&var0[var6 + 1 + var3];
    do
    {
      if (var1 >= 3)
      {
        v11 = var1 - 2;
        v12 = (unsigned __int8 *)v10;
        do
        {
          v13 = *v12;
          v14 = v12[1 - (int)var6 - 1];
          v15 = &v12[1 - (int)var3];
          v16 = v12[var3];
          v12 += var6;
          v17 = *v12;
          v18 = *(v15 - 1);
          ++v53[v13];
          if (v13 <= 0xF0 && v14 <= 0xF0 && v17 <= 0xF0 && v18 <= 0xF0 && v16 <= 0xF0)
          {
            v19 = ((v14 + v17 + v18 + v16 + 2) >> 2) - v13 + 256;
            ++v54[v19];
          }
          --v11;
        }
        while (v11);
      }
      v10 += var3;
    }
    while (v9++ != var2 - 2);
  }
  v21 = 0;
  v22 = (int32x4_t)xmmword_19248E120;
  v23 = 0uLL;
  v24.i64[0] = 0x400000004;
  v24.i64[1] = 0x400000004;
  v25 = 0uLL;
  do
  {
    v26 = *(int32x4_t *)&v54[v21];
    v23 = vaddq_s32(v26, v23);
    v25 = vmlaq_s32(v25, v26, v22);
    v22 = vaddq_s32(v22, v24);
    v21 += 4;
  }
  while (v21 != 512);
  v27 = 0;
  v28 = (double)vaddvq_s32(v23);
  v29 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)vaddvq_s32(v25) / v28), 0);
  v30 = (int32x4_t)xmmword_19248E120;
  v31 = 0.0;
  v32.i64[0] = 0x400000004;
  v32.i64[1] = 0x400000004;
  do
  {
    v33.i64[0] = v30.i32[0];
    v33.i64[1] = v30.i32[1];
    v34 = vcvtq_f64_s64(v33);
    v33.i64[0] = v30.i32[2];
    v33.i64[1] = v30.i32[3];
    v35 = vsubq_f64(vcvtq_f64_s64(v33), v29);
    v36 = vsubq_f64(v34, v29);
    v37 = *(_OWORD *)&v54[v27];
    v33.i64[0] = v37;
    v33.i64[1] = DWORD1(v37);
    v38 = vcvtq_f64_u64((uint64x2_t)v33);
    v33.i64[0] = DWORD2(v37);
    v33.i64[1] = HIDWORD(v37);
    v39 = vmulq_f64(vmulq_f64(v35, v35), vcvtq_f64_u64((uint64x2_t)v33));
    v40 = vmulq_f64(vmulq_f64(v36, v36), v38);
    v31 = v31 + v40.f64[0] + v40.f64[1] + v39.f64[0] + v39.f64[1];
    v30 = vaddq_s32(v30, v32);
    v27 += 4;
  }
  while (v27 != 512);
  v41 = 0;
  v42 = 0;
  do
  {
    if (v54[v41])
      v42 = (v42 + 1) | v42 & 0xFFFFFFFF00000000;
    ++v41;
  }
  while (v41 != 512);
  v43 = (var2 - 3) * (var1 - 3);
  if (v43 < 20)
  {
    v51 = 255;
    v48 = 2;
  }
  else
  {
    v44 = 0;
    v45 = 0;
    v46 = v43 / 20;
    do
    {
      v47 = v44 + 1;
      if (v44 > 0xFE)
        break;
      v45 += v53[v44++];
    }
    while (v45 < v46);
    v48 = 2 - v47;
    v49 = 0;
    v50 = 255;
    do
    {
      v51 = v50 - 1;
      if (!v50)
        break;
      v49 += v53[v50--];
    }
    while (v49 < v46);
  }
  v52 = v31 / v28 / ((float)(v48 + v51) / 255.0);
  result.var1 = v42;
  result.var0 = v52;
  return result;
}

- (BOOL)isBlurryWithFocusStats:(id)a3
{
  return a3.var0 < 14.0;
}

@end
