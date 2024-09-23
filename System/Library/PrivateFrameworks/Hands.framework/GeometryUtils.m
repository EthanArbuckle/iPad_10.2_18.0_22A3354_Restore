@implementation GeometryUtils

+ (float32x2_t)unprojectPoint:(double)a3 andIntrinsics:(float32x2_t)a4 andDistortion:(__n128)a5 andImageSize:(float32x2_t)a6 forCameraModel:(uint64_t)a7
{
  float32x2_t result;
  void *v10;
  float32x2_t v11;
  __n128 v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  result = vdiv_f32(vmla_f32(vneg_f32(a4), a6, a1), (float32x2_t)vdup_lane_s32(a2, 0));
  if (a9)
  {
    v13[0] = result;
    v12 = a5;
    if (hermes::kannalaRadialInverse<float>((float *)&v12, (float *)v13, (float *)&v11))
    {
      return vmul_n_f32(v11, 1.0 / sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v11, v11).i32[1]), v11.f32[0], v11.f32[0]) + 1.0));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to calculate 3D center kannala"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("HandsKitUtils"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/GeometryUtils.mm"), 49, v10);

      return 0;
    }
  }
  return result;
}

+ (float32x2_t)project3DPointTo2D:(double)a3 withIntrinsics:(float32x2_t)a4 withDistortion:(__n128)a5 withImageDimensions:(float32x2_t)a6 withCameraModel:(uint64_t)a7 andValidResultPtr:(uint64_t)a8
{
  float32x2_t v12;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  __n128 v17;
  unint64_t v18;
  unsigned __int32 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  a2.i32[1] = HIDWORD(a3);
  if (a10)
    *a10 = *(float *)&a1.i32[2] > 0.0;
  if (a9)
  {
    v14 = a2;
    v15 = a4;
    v18 = a1.i64[0];
    v19 = a1.u32[2];
    v17 = a5;
    v16 = 0;
    if (!hermes::kannalaRadial<float>((float *)&v17, (float *)&v18, (float *)&v16))
    {
      v19 = 897988541;
      hermes::kannalaRadial<float>((float *)&v17, (float *)&v18, (float *)&v16);
      if (a10)
        *a10 = 0;
    }
    v12 = v16;
    a2 = v14;
    a4 = v15;
  }
  else
  {
    v12 = vdiv_f32(*(float32x2_t *)a1.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(a1, 2));
  }
  return vdiv_f32(vmla_f32(a4, a2, v12), a6);
}

+ (double)computeCenter3dKannala:(double)a3 cameraIntrinsics:(float32x2_t)a4 cameraDistortion:(__n128)a5 depth:(float)a6
{
  float32x4_t v6;
  float v7;
  void *v8;
  float32x2_t v11;
  __n128 v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  a2.i32[1] = HIDWORD(a3);
  v13[0] = vdiv_f32(vsub_f32(a1, a4), a2);
  v12 = a5;
  if (hermes::kannalaRadialInverse<float>((float *)&v12, (float *)v13, (float *)&v11))
  {
    v7 = 1.0 / sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v11, v11).i32[1]), v11.f32[0], v11.f32[0]) + 1.0);
    *(float32x2_t *)v6.f32 = vmul_n_f32(v11, v7);
    v6.f32[2] = v7;
    v6.i64[0] = vmulq_n_f32(v6, a6).u64[0];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to calculate 3D center kannala"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("Default"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/GeometryUtils.mm"), 122, v8);

    v6.i64[0] = 0;
  }
  return *(double *)v6.i64;
}

+ (__n128)getCropRotation:(int)a3
{
  __int128 *v3;

  switch(a3)
  {
    case 90:
      v3 = &_PromotedConst_31;
      break;
    case 270:
      v3 = &_PromotedConst_29;
      break;
    case 180:
      v3 = &_PromotedConst_0;
      break;
    default:
      v3 = &_PromotedConst_30;
      break;
  }
  return (__n128)*v3;
}

+ (double)mean:(float32x4_t *)a3 ofSize:(int)a4
{
  uint64_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x2_t v7;
  double result;

  if (a4 < 1)
    return 0.0;
  v4 = a4;
  v5 = 0uLL;
  do
  {
    v6 = *a3++;
    v7.i32[1] = v6.i32[1];
    v5 = vaddq_f32(v5, v6);
    --v4;
  }
  while (v4);
  *(float *)v7.i32 = (float)a4;
  *(_QWORD *)&result = vdivq_f32(v5, (float32x4_t)vdupq_lane_s32(v7, 0)).u64[0];
  return result;
}

+ (double)variance:(float32x4_t *)a3 ofSize:(int)a4
{
  float32x4_t v6;
  uint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;

  +[GeometryUtils mean:ofSize:](GeometryUtils, "mean:ofSize:");
  if (a4 < 1)
  {
    v6.i64[0] = 0;
  }
  else
  {
    v7 = a4;
    v8 = 0uLL;
    do
    {
      v9 = *a3++;
      v10 = vsubq_f32(v9, v6);
      v8 = vmlaq_f32(v8, v10, v10);
      --v7;
    }
    while (v7);
    v6.f32[0] = (float)a4;
    v6.i64[0] = vdivq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 0)).u64[0];
  }
  return *(double *)v6.i64;
}

+ ($25235678F713106DF2E344C64AB44517)getRigidTransform:(id)a1 from:(SEL)a2 withScaling:ofSize:
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  uint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  unint64_t v20;
  float32x4_t v21;
  _DWORD *v22;
  float32x4_t v23;
  float32x4_t v24;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float *v29;
  float *v30;
  uint64_t v31;
  int32x4_t v32;
  int32x4_t v33;
  float32x4_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  float32x4_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  unsigned __int32 v45;
  unsigned __int32 v46;
  __int32 v47;
  __int32 v48;
  __int32 v49;
  unsigned __int32 v50;
  float32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  float32x4_t v54;
  float v56;
  float32x4_t v61;
  unint64_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  unint64_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float v72;
  __int32 v73;
  __int32 v74;
  __int32 v75;
  __int32 v76;
  __int32 v77;
  __int32 v78;
  __int32 v79;
  __int32 v80;
  __int32 v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t __src[183];
  void *v88[3];
  void *__p;
  void *v90;
  float32x4_t v91;
  __int32 v92;
  __int32 v93;
  __int32 v94;
  __int32 v95;
  __int32 v96;
  __int32 v97;
  __int32 v98;
  __int32 v99;
  __int32 v100;
  float32x4_t v101[6];
  __int32 v102;
  __int32 v103;
  __int32 v104;
  __int32 v105;
  __int32 v106;
  __int32 v107;
  _DWORD v108[731];
  _BYTE v109[2916];
  int v110;
  int v111;
  _BYTE v112[2916];
  int v113;
  int v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;

  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = v6;
  if ((int)v5 <= 0)
  {
    v39 = MEMORY[0x24BDAEE00];
    v40 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
    *(_OWORD *)v7 = *MEMORY[0x24BDAEE00];
    *(_OWORD *)(v7 + 16) = v40;
    v38 = *(float32x4_t *)(v39 + 32);
    v41 = *(_OWORD *)(v39 + 48);
    *(float32x4_t *)(v7 + 32) = v38;
    *(_OWORD *)(v7 + 48) = v41;
    *(_DWORD *)(v7 + 64) = 1065353216;
  }
  else
  {
    v8 = v5;
    if (v5 >= 0x1C)
      nis::Matrix<float,16u,std::plus<float>,std::multiplies<float>>::Matrix();
    v9 = v4;
    v10 = v3;
    v11 = v2;
    bzero(v112, 0xB64uLL);
    v113 = 3;
    v114 = v8;
    bzero(v109, 0xB64uLL);
    v110 = 3;
    v111 = v8;
    bzero(v108, 0xB6CuLL);
    bzero(v101, 0xB6CuLL);
    bzero(&v92, 0xB6CuLL);
    nis::SVD<27u>::SVD((uint64_t)v88);
    v12 = 0;
    v13 = 0uLL;
    v14 = 0uLL;
    do
    {
      v13 = vaddq_f32(v13, *(float32x4_t *)(v11 + v12));
      v15 = *(float32x4_t *)(v10 + v12);
      v14 = vaddq_f32(v14, v15);
      v12 += 16;
    }
    while (16 * v8 != v12);
    v16 = 0;
    v15.f32[0] = (float)(int)v8;
    v17 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0);
    v18 = vdivq_f32(v13, v17);
    v19 = vdivq_f32(v14, v17);
    v20 = 216;
    do
    {
      v21 = vsubq_f32(*(float32x4_t *)(v11 + v16), v18);
      v22 = &v112[v20];
      *(_DWORD *)&v109[v20 + 2816] = v21.i32[1];
      *v22 = v21.i32[2];
      v23 = *(float32x4_t *)(v10 + v16);
      *(v22 - 54) = v21.i32[0];
      v24 = vsubq_f32(v23, v19);
      v25 = &v109[v20];
      v108[v20 / 4 + 704] = v24.i32[1];
      *(v25 - 54) = v24.i32[0];
      *v25 = v24.i32[2];
      v16 += 16;
      v20 += 4;
    }
    while (16 * v8 != v16);
    v85 = v19;
    v86 = v18;
    nis::matrix_inner_product<float,27u,std::plus<float>,std::multiplies<float>>((uint64_t)v112, (uint64_t)v109, __src);
    memcpy(v108, __src, sizeof(v108));
    if (v9)
    {
      v26 = v108[729];
      if (v108[729])
      {
        v27 = 0;
        v28 = v108[730];
        v29 = (float *)v108;
        do
        {
          v30 = v29;
          v31 = v28;
          if ((_DWORD)v28)
          {
            do
            {
              *v30 = (float)(1.0 / (float)(int)v8) * *v30;
              ++v30;
              --v31;
            }
            while (v31);
          }
          ++v27;
          v29 += 27;
        }
        while (v27 != v26);
      }
    }
    if (nis::SVD<27u>::svd())
    {
      v35 = MEMORY[0x24BDAEE00];
      v36 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
      *(_OWORD *)v7 = *MEMORY[0x24BDAEE00];
      *(_OWORD *)(v7 + 16) = v36;
      v37 = *(_OWORD *)(v35 + 48);
      *(_OWORD *)(v7 + 32) = *(_OWORD *)(v35 + 32);
      *(_OWORD *)(v7 + 48) = v37;
      v38.i32[0] = 1.0;
    }
    else
    {
      v42 = v101[0];
      v43 = *(float32x4_t *)((char *)v101 + 4);
      v44 = *(float32x4_t *)((char *)v101 + 8);
      v42.i32[1] = v102;
      v42.i32[2] = v105;
      v43.i32[1] = v103;
      v43.i32[2] = v106;
      v44.i32[1] = v104;
      v44.i32[2] = v107;
      v34.i32[0] = v92;
      v33.i32[0] = v93;
      v45 = v98;
      v46 = v99;
      v47 = v95;
      v32.i32[0] = v94;
      v48 = v96;
      v49 = v97;
      v50 = v100;
      v38 = vmulq_f32(v42, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v44, (int8x16_t)v44, 0xCuLL), (int8x16_t)v44, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43), (int8x16_t)v43, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v44, (int32x4_t)v44), (int8x16_t)v44, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v43, (int8x16_t)v43, 0xCuLL), (int8x16_t)v43, 8uLL)));
      v51 = v34;
      v51.i32[1] = v95;
      v51.i32[2] = v98;
      v52 = v33;
      v52.i32[1] = v96;
      v52.i32[2] = v99;
      v53 = v32;
      v53.i32[1] = v97;
      v53.i32[2] = v100;
      v54 = vmulq_f32(v51, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v53, (int8x16_t)v53, 0xCuLL), (int8x16_t)v53, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v52, v52), (int8x16_t)v52, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v53, v53), (int8x16_t)v53, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v52, (int8x16_t)v52, 0xCuLL), (int8x16_t)v52, 8uLL)));
      v38.i64[0] = vmulq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1)))).u64[0];
      _NF = v38.f32[0] < 0.0;
      v38.i32[0] = 1.0;
      if (_NF)
        v56 = -1.0;
      else
        v56 = 1.0;
      if (v9)
      {
        v72 = v56;
        v73 = v95;
        v74 = v92;
        v75 = v98;
        v76 = v96;
        v77 = v93;
        v78 = v99;
        v79 = v94;
        v80 = v97;
        v81 = v100;
        v82 = v44;
        v83 = v43;
        v84 = v42;
        +[GeometryUtils variance:ofSize:](GeometryUtils, "variance:ofSize:", v11, v8);
        __asm { FMOV            V1.4S, #1.0 }
        v56 = v72;
        _Q1.f32[2] = v72;
        v61 = vmulq_f32(_Q1, v91);
        v38.i64[0] = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1)))).u64[0];
        v43 = v83;
        v42 = v84;
        v50 = v81;
        v44 = v82;
        v32.i32[0] = v79;
        v49 = v80;
        v33.i32[0] = v77;
        v46 = v78;
        v45 = v75;
        v48 = v76;
        v47 = v73;
        v34.i32[0] = v74;
      }
      v62 = 0;
      v63.i64[0] = __PAIR64__(v47, v34.u32[0]);
      v63.i64[1] = v45;
      v64.i64[0] = __PAIR64__(v48, v33.u32[0]);
      v64.i64[1] = v46;
      v65.i64[0] = __PAIR64__(v49, v32.u32[0]);
      v65.i64[1] = v50;
      v66.i64[0] = 0;
      v66.i64[1] = LODWORD(v56);
      v115 = v63;
      v116 = v64;
      v117 = v65;
      do
      {
        __src[v62 / 4] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_23D9A3E10, COERCE_FLOAT(*(_OWORD *)((char *)&v115 + v62 * 4))), (float32x4_t)xmmword_23D9A3E20, *(float32x2_t *)&v115.f32[v62], 1), v66, *(float32x4_t *)((char *)&v115 + v62 * 4), 2);
        v62 += 4;
      }
      while (v62 != 12);
      v67 = 0;
      v115 = __src[0];
      v116 = __src[1];
      v117 = __src[2];
      do
      {
        __src[v67 / 4] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(*(_OWORD *)((char *)&v115 + v67 * 4))), v43, *(float32x2_t *)&v115.f32[v67], 1), v44, *(float32x4_t *)((char *)&v115 + v67 * 4), 2);
        v67 += 4;
      }
      while (v67 != 12);
      v68 = __src[0];
      v69 = __src[1];
      v68.i32[3] = 0;
      v69.i32[3] = 0;
      v70 = __src[2];
      v70.i32[3] = 0;
      v71 = vmlsq_lane_f32(v86, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(__src[0], v85.f32[0]), __src[1], *(float32x2_t *)v85.f32, 1), __src[2], v85, 2), *(float32x2_t *)v38.f32, 0);
      v71.i32[3] = 1.0;
      *(float32x4_t *)v7 = v68;
      *(float32x4_t *)(v7 + 16) = v69;
      *(float32x4_t *)(v7 + 32) = v70;
      *(float32x4_t *)(v7 + 48) = v71;
    }
    *(_DWORD *)(v7 + 64) = v38.i32[0];
    if (__p)
    {
      v90 = __p;
      operator delete(__p);
    }
    if (v88[0])
    {
      v88[1] = v88[0];
      operator delete(v88[0]);
    }
  }
  return LODWORD(v38.f32[0]);
}

@end
