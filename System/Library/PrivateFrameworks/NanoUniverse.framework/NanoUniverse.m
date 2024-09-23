uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B50AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B50B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_2134A484C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CGImage *_NUNICreateImageFromURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  CGImage *Copy;
  int Width;
  int Height;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithContentsOfFile:", v4));
  Copy = CGImageCreateCopy((CGImageRef)objc_msgSend(v5, "CGImage"));

  if (!Copy)
  {
    NUNILoggingObjectForDomain(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      _NUNICreateImageFromURL_cold_1(v3, v14);

    if (a2)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = &unk_24CFE3670;
      v13 = -1;
      goto LABEL_14;
    }
LABEL_15:
    Copy = 0;
    goto LABEL_16;
  }
  Width = CGImageGetWidth(Copy);
  Height = CGImageGetHeight(Copy);
  if ((Width - 1024) > 0xC00 || 2 * Height != Width)
  {
    CGImageRelease(Copy);
    NUNILoggingObjectForDomain(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = 67109634;
      v17[1] = Width;
      v18 = 1024;
      v19 = Height;
      v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_2134A1000, v10, OS_LOG_TYPE_ERROR, "AegirResourceManager: invalid dimensions (%d, %d) (%@)", (uint8_t *)v17, 0x18u);

    }
    if (a2)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = &unk_24CFE3698;
      v13 = -2;
LABEL_14:
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoUniverse.NUNICloudCoverFileConverter"), v13, v12);
      Copy = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return Copy;
}

id _NUNIRasterizeImageGenericGray(CGImage *a1, int a2, int a3)
{
  id v6;
  void *v7;
  CGColorSpace *v8;
  CGContext *v9;
  CGRect v11;

  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", a3 * a2));
  v7 = (void *)objc_msgSend(v6, "mutableBytes");
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF288]);
  v9 = CGBitmapContextCreate(v7, a2, a3, 8uLL, a2, v8, 0);
  CGColorSpaceRelease(v8);
  CGContextSetInterpolationQuality(v9, kCGInterpolationHigh);
  v11.size.width = (double)a2;
  v11.size.height = (double)a3;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  CGContextDrawImage(v9, v11, a1);
  CGContextRelease(v9);
  return v6;
}

id _NUNIEqualize(void *a1, int a2, int a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _BYTE *v8;
  id v9;
  unsigned __int8 *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  int v18;
  _BYTE v20[1280];
  _DWORD v21[256];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (a3 * a2);
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v6));
  v8 = (_BYTE *)objc_msgSend(v7, "mutableBytes");
  v9 = objc_retainAutorelease(v5);
  v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
  bzero(v21, 0x400uLL);
  if ((_DWORD)v6)
  {
    v11 = v6;
    v12 = v10;
    do
    {
      v13 = *v12++;
      ++v21[v13];
      --v11;
    }
    while (v11);
    v14 = v21[0];
  }
  else
  {
    v14 = 0;
  }
  v15 = 1;
  v16 = v14;
  do
  {
    v16 += v21[v15];
    *(_DWORD *)&v20[v15 * 4 + 256] = v16;
    ++v15;
  }
  while (v15 != 256);
  v20[0] = 0;
  for (i = 1; i != 256; ++i)
    v20[i] = llroundf((float)((float)(*(_DWORD *)&v20[4 * i + 256] - v14) / (float)(v6 - v14))* 255.0);
  if ((_DWORD)v6)
  {
    do
    {
      v18 = *v10++;
      *v8++ = v20[v18];
      --v6;
    }
    while (v6);
  }

  return v7;
}

id _NUNIInitializeImageGenericGray(int a1, int a2)
{
  uint64_t v2;
  void *v3;

  v2 = (a2 * a1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v2);
  objc_msgSend(v3, "resetBytesInRange:", 0, v2);
  return v3;
}

void _NUNIAddCloudLayer(void *a1, void *a2, int a3, int a4)
{
  id v7;
  uint64_t v8;
  _BYTE *v9;
  unsigned __int8 *v10;
  float v11;
  unsigned int v12;
  float v13;
  id v14;

  v7 = a1;
  v8 = (a4 * a3);
  v9 = (_BYTE *)objc_msgSend(objc_retainAutorelease(a2), "mutableBytes");
  v14 = objc_retainAutorelease(v7);
  v10 = (unsigned __int8 *)objc_msgSend(v14, "bytes");
  if ((_DWORD)v8)
  {
    do
    {
      v12 = *v10++;
      v13 = (double)v12 / 255.0;
      LOBYTE(v11) = *v9;
      v11 = (float)LODWORD(v11);
      *v9++ = (int)(float)(v11 + (float)((float)((float)(v13 * v13) * v13) * 85.0));
      --v8;
    }
    while (v8);
  }

}

id _NUNIConvertEquirectangularToOctahedral(void *a1, int a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  float v12;
  float v13;
  int32x2_t v14;
  int32x2_t v15;
  int v21;
  uint64_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x4_t v26;
  int32x4_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float v30;
  unsigned int v31;
  unsigned int v32;
  float v33;
  float v34;
  float v35;
  signed int v36;
  int v37;
  float v38;
  int v39;
  float v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  float v45;
  float v46;
  __int128 v48;
  float32x4_t v49;

  v5 = a1;
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 0x400000));
  v7 = objc_msgSend(v6, "mutableBytes");
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "bytes");
  v11 = 0;
  v12 = (float)a3;
  v13 = 0.5;
  v14.i32[1] = 973078528;
  v15.i32[1] = 0x40000000;
  __asm { FMOV            V10.2S, #-1.0 }
  v21 = a3 - 1;
  do
  {
    v22 = 0;
    *(float *)&v10 = (float)((float)(int)v11 + v13) * 0.00048828;
    v48 = v10;
    do
    {
      v23.f32[0] = (float)((float)(int)v22 + v13) * 0.00048828;
      v23.i32[1] = v48;
      v24 = vmla_f32(_D10, (float32x2_t)0x4000000040000000, v23);
      v25 = vabs_f32(v24);
      v25.f32[0] = (float)(1.0 - v25.f32[0]) - v25.f32[1];
      *(float *)v14.i32 = fminf(fmaxf(-v25.f32[0], 0.0), 1.0);
      *(float *)v15.i32 = -*(float *)v14.i32;
      *(float32x2_t *)v26.f32 = vadd_f32(v24, (float32x2_t)vbsl_s8((int8x8_t)vcgez_f32(v24), (int8x8_t)vdup_lane_s32(v15, 0), (int8x8_t)vdup_lane_s32(v14, 0)));
      v26.i64[1] = __PAIR64__(HIDWORD(v48), v25.u32[0]);
      v27 = (int32x4_t)vmulq_f32(v26, v26);
      v27.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2), vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1))).u32[0];
      v28 = vrsqrte_f32((float32x2_t)v27.u32[0]);
      v29 = vmul_f32(v28, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v28, v28)));
      v49 = vmulq_n_f32(v26, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v29, v29))).f32[0]);
      v30 = acosf(v49.f32[2]);
      *(float *)&v10 = (float)((float)((float)((float)(atan2f(v49.f32[1], v49.f32[0]) * -0.15915) + -0.25) + 1.0)
                             * (float)a2)
                     + -0.5;
      v33 = (float)((float)((float)(v30 * -0.31831) + 1.0) * v12) + -0.5;
      v34 = (float)(int)v33;
      v35 = (float)(int)*(float *)&v10;
      v36 = (int)*(float *)&v10 % a2;
      v37 = (int)v33 & ~((int)v33 >> 31);
      if (v37 >= v21)
        v37 = v21;
      v38 = *(float *)&v10 - v35;
      if (v36 + 1 == a2)
        v39 = 0;
      else
        v39 = v36 + 1;
      v40 = v33 - v34;
      if (v37 + 1 < v21)
        v41 = v37 + 1;
      else
        v41 = v21;
      v42 = v37 * a2;
      LOBYTE(v34) = *(_BYTE *)(v9 + v42 + v36);
      LOBYTE(v35) = *(_BYTE *)(v9 + v42 + v39);
      v43 = v41 * a2;
      LOBYTE(v31) = *(_BYTE *)(v9 + v43 + v36);
      LOBYTE(v32) = *(_BYTE *)(v9 + v43 + v39);
      v44 = (float)(v38 * v38) * (float)((float)(v38 * -2.0) + 3.0);
      v45 = (float)(v40 * v40) * (float)((float)(v40 * -2.0) + 3.0);
      *(float *)v14.i32 = (float)(v44 * (float)LODWORD(v35)) + (float)((float)LODWORD(v34) * (float)(1.0 - v44));
      *(float *)v15.i32 = 1.0 - v45;
      v46 = v45 * (float)((float)(v44 * (float)v32) + (float)((float)v31 * (float)(1.0 - v44)));
      v13 = 0.5;
      v15.i32[1] = 0x40000000;
      v14.i32[1] = 973078528;
      *(_BYTE *)(v7 + v22++) = (int)(float)((float)(v46 + (float)(*(float *)v14.i32 * *(float *)v15.i32)) + 0.5);
    }
    while (v22 != 2048);
    ++v11;
    v7 += 2048;
  }
  while (v11 != 2048);

  return v6;
}

void *_NUNIGenerateAllMipmapsR8(unsigned __int8 *a1, const void *a2)
{
  unsigned __int8 *v2;
  void *result;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int i;
  int v7;
  int v8;
  int v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  unsigned __int8 *v13;

  v2 = a1;
  result = memcpy(a1, a2, 0x400000uLL);
  v4 = v2 + 0x400000;
  v5 = 2048;
  for (i = 2048; ; i = v8)
  {
    v7 = v5 >> 1;
    if (v5 >> 1 <= 1)
      v7 = 1;
    v8 = i >> 1;
    if (i >> 1 <= 1)
      v8 = 1;
    if (v5 >= 2)
    {
      if (i <= 1)
      {
        v12 = v7;
        v13 = v4;
        do
        {
          *v13++ = (*v2 + v2[1] + 1) >> 1;
          v2 += 2;
          --v12;
        }
        while (v12);
      }
      else
      {
        v9 = 0;
        v10 = v4;
        do
        {
          v11 = v7;
          do
          {
            result = (void *)v2[1];
            *v10++ = (*v2 + (_DWORD)result + v2[v5] + v2[v5 + 1] + 2) >> 2;
            v2 += 2;
            --v11;
          }
          while (v11);
          ++v9;
          v2 += v5;
        }
        while (v9 != v8);
      }
    }
    if ((i | v5) < 4)
      break;
    v2 = v4;
    v4 += (v8 * v7);
    v5 = v7;
  }
  return result;
}

uint64_t NUNIAstronomyVistaView_SpheroidTypeToVista(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return 2;
  else
    return qword_2134DBEA0[a1 - 1];
}

id NUNIAstronomyVistaView_GenerateZoomAnimationArrayFromSceneBlob(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int32x2_t v11;
  uint64_t v12;
  uint64_t v13;
  int32x2_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v22;
  int32x2_t v23;
  int32x2_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NUNIAnimation *v29;
  NUNIAnimation *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NUNIAnimation *v40;
  NUNIAnimation *v41;
  NUNIAnimation *v42;
  NUNIAnimation *v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v49;
  float32x4_t v51;
  unint64_t v60;
  unint64_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float v64;
  void *v71;
  void *v72;
  float32x4_t v76;
  float32x2_t v77;
  float32x2_t v78;
  float32x2_t v79;
  float32x2_t v80;
  float32x2_t v81;
  float32x2_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x2_t v85;
  float v86;
  float v87;
  float32x4_t v88;
  float v89;
  float32x2_t v90;
  float32x2_t v91;
  float32x2_t v92;
  float32x2_t v93;
  float32x2_t v94;
  float32x2_t v95;
  float32x2_t v96;
  float32x2_t v97;
  float32x2_t v98;
  unint64_t v99;
  float v100;
  float v101;
  float32x4_t v107;
  float32x4_t v117;
  unint64_t v118;
  float32x4_t v124;
  unint64_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  NUNIAnimation *v137;
  unint64_t v138;
  float32x4_t v139;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  void *v150;
  void *v151;
  void *v152;
  uint32x2_t v153;
  void *v154;
  uint32x2_t v155;
  void *v156;
  id v158;
  id v159;
  __int128 v160;
  double v161;
  int32x2_t v162;
  int32x2_t v163;
  id v164;
  float32x4_t v165;
  double v166;
  double v167;
  double v168;
  double v169;
  float32x4_t v170;
  float32x4_t v171;
  float32x4_t v172;
  double v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  double v177;
  int32x2_t v178;
  float v179;
  float v180;
  float32x2_t *v181;
  float32x2_t *v182;
  float32x2_t v183;
  float32x2_t v184;
  double v185;
  uint64_t v186;
  int32x4_t v187;
  int32x4_t v188;
  double v189;
  _OWORD v190[2];
  _BYTE v191[112];
  float32x4_t v192;
  float32x4_t v193;
  float32x4_t v194;
  float32x4_t v195;
  float32x4_t v196;
  float32x4_t v197;
  float32x4_t v198;
  uint64_t v199;

  v199 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v158 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v158, "bytes");
  v164 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v164, "bytes");
  v11.i32[0] = *(_DWORD *)(v9 + 52);
  v163 = v11;
  v167 = *(double *)(v9 + 96);
  v169 = *(double *)(v9 + 104);
  v171 = *(float32x4_t *)v9;
  v172 = *(float32x4_t *)v10;
  v170 = *(float32x4_t *)(v10 + 16);
  v160 = *(_OWORD *)(v10 + 32);
  v11.i32[1] = DWORD1(v160);
  v161 = *(double *)(v9 + 32);
  v11.i32[0] = *(_DWORD *)(v10 + 52);
  v162 = v11;
  v165 = *(float32x4_t *)(v9 + 16);
  v166 = *(double *)(v10 + 96);
  v168 = *(double *)(v10 + 104);
  v12 = *(int *)(v9 + 128);
  v159 = v5;
  objc_msgSend(v5, "spheroids");
  v13 = objc_claimAutoreleasedReturnValue();
  v175 = *(_QWORD *)(v9 + 56);
  v176 = (void *)v13;
  v186 = v10;
  v174 = *(_QWORD *)(v10 + 56);
  if ((_DWORD)v12)
  {
    v15 = 0;
    v16 = 0;
    v181 = 0;
    v182 = 0;
    v17 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v173 = *(double *)&_Q0;
    while (1)
    {
      objc_msgSend(v176, "objectAtIndex:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v186 + v15;
      v26 = *(_QWORD *)(v9 + v15 + 144);
      v27 = (uint64_t)v182;
      if (v26 == v175)
        v27 = v9 + v15 + 144;
      v182 = (float32x2_t *)v27;
      _ZF = v26 == v174;
      v28 = (uint64_t)v181;
      if (_ZF)
        v28 = v186 + v15 + 144;
      v181 = (float32x2_t *)v28;
      v24.i32[0] = *(_DWORD *)(v9 + v15 + 232);
      v23.i32[0] = *(_DWORD *)(v25 + 232);
      if (*(float *)v24.i32 != *(float *)v23.i32)
      {
        v29 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v22, 7, *(double *)vdupq_lane_s32(v24, 0).i64, *(double *)vdupq_lane_s32(v23, 0).i64);

        -[NUNIAnimation setFunction:](v29, "setFunction:", 0);
        objc_msgSend(v8, "addObject:", v29);
        v17 = v29;
      }
      v24.i32[0] = *(_DWORD *)(v9 + v15 + 192);
      v23.i32[0] = *(_DWORD *)(v25 + 192);
      if (*(float *)v24.i32 == *(float *)v23.i32)
        goto LABEL_21;
      v178 = v23;
      if (*(float *)v24.i32 == 1.0 && *(float *)v23.i32 == 0.0)
        break;
      v177 = *(double *)&v24;
      v30 = [NUNIAnimation alloc];
      *(_QWORD *)&v33 = vdupq_lane_s32(*(int32x2_t *)&v177, 0).u64[0];
      _ZF = *(float *)&v177 == 0.0 && *(float *)v178.i32 == 1.0;
      if (_ZF)
      {
        v32 = v22;
        v31 = v173;
        v34 = v33;
        v35 = v33;
        goto LABEL_19;
      }
      v37 = -[NUNIAnimation initWithAnimatable:from:to:key:](v30, "initWithAnimatable:from:to:key:", v22, 9, v33, *(double *)vdupq_lane_s32(v178, 0).i64, v177);

      v38 = (void *)v37;
      v39 = 0;
LABEL_20:
      objc_msgSend(v38, "setFunction:", v39);
      v17 = (void *)v37;
      objc_msgSend(v8, "addObject:", v37);
LABEL_21:
      v23.i32[0] = *(_DWORD *)(v9 + v15 + 196);
      v24.i32[0] = *(_DWORD *)(v186 + v15 + 196);
      if (*(float *)v23.i32 != *(float *)v24.i32)
      {
        v40 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v22, 12, *(double *)vdupq_lane_s32(v23, 0).i64, *(double *)vdupq_lane_s32(v24, 0).i64);

        -[NUNIAnimation setFunction:](v40, "setFunction:", 0);
        objc_msgSend(v8, "addObject:", v40);
        v17 = v40;
      }
      v24.i32[0] = *(_DWORD *)(v9 + v15 + 156);
      v23.i32[0] = *(_DWORD *)(v186 + v15 + 156);
      if (*(float *)v23.i32 != *(float *)v24.i32)
      {
        v41 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v22, 5, *(double *)vdupq_lane_s32(v24, 0).i64, *(double *)vdupq_lane_s32(v23, 0).i64);

        -[NUNIAnimation setFunction:](v41, "setFunction:", 0);
        objc_msgSend(v8, "addObject:", v41);
        v17 = v41;
      }
      if ((vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(v186 + v15 + 176), *(float32x4_t *)(v9 + v15 + 176))) & 0x80000000) == 0)
      {
        *(_OWORD *)v191 = xmmword_2134DBE5C;
        *(_OWORD *)&v191[12] = *(__int128 *)((char *)&xmmword_2134DBE5C + 12);
        +[NUNIAnimation generateSlerpKeys:times:count:from:to:](NUNIAnimation, "generateSlerpKeys:times:count:from:to:", &v192, v191, 7);
        v42 = -[NUNIAnimation initWithAnimatable:values:count:key:]([NUNIAnimation alloc], "initWithAnimatable:values:count:key:", v22, &v192, 7, 2);

        -[NUNIAnimation setFunction:](v42, "setFunction:", 3);
        objc_msgSend(v8, "addObject:", v42);
        v17 = v42;
      }
      v43 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v22, 0, *(double *)(v9 + v15 + 240), *(double *)(v186 + v15 + 240));

      -[NUNIAnimation setFunction:](v43, "setFunction:", 0);
      objc_msgSend(v8, "addObject:", v43);

      ++v16;
      v15 += 160;
      v17 = v43;
      if (v12 == v16)
        goto LABEL_30;
    }
    v30 = [NUNIAnimation alloc];
    *(_QWORD *)&v31 = vdupq_lane_s32(v178, 0).u64[0];
    v32 = v22;
    v33 = v173;
    v34 = v31;
    v35 = v31;
LABEL_19:
    v37 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v30, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v32, 9, v33, v31, v34, v35);

    v38 = (void *)v37;
    v39 = 2;
    goto LABEL_20;
  }
  v43 = 0;
  v181 = 0;
  v182 = 0;
LABEL_30:
  v45 = v171;
  v44 = v172;
  _Q0 = vsubq_f32(v172, v171);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  *(float *)v14.i32 = sqrtf(_S1);
  v49 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(v14, 0));
  if (!v182 || !v181)
  {
    if (v174 == 3 && v181)
    {
      v179 = *(float *)v14.i32;
      v77 = vsub_f32(v181[12], *(float32x2_t *)v171.f32);
      v78 = vmul_f32(v77, v77);
      v78.i32[0] = vadd_f32(v78, (float32x2_t)vdup_lane_s32((int32x2_t)v78, 1)).u32[0];
      v79 = vrsqrte_f32((float32x2_t)v78.u32[0]);
      v80 = vmul_f32(v79, vrsqrts_f32((float32x2_t)v78.u32[0], vmul_f32(v79, v79)));
      v183 = vmul_n_f32(v77, vmul_f32(v80, vrsqrts_f32((float32x2_t)v78.u32[0], vmul_f32(v80, v80))).f32[0]);
      v187 = (int32x4_t)v49;
      v81 = vsub_f32(*(float32x2_t *)v170.f32, *(float32x2_t *)v172.f32);
      v82 = vmul_f32(v81, v81);
      v82.i32[0] = vadd_f32(v82, (float32x2_t)vdup_lane_s32((int32x2_t)v82, 1)).u32[0];
      v83 = vrsqrte_f32((float32x2_t)v82.u32[0]);
      v84 = vmul_f32(v83, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v83, v83)));
      v85 = vmul_n_f32(v81, vmul_f32(v84, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v84, v84))).f32[0]);
      v86 = atan2f(_Q0.f32[0], _Q0.f32[1]);
      v87 = atan2f(v183.f32[0], v183.f32[1]);
      v49 = (float32x4_t)v187;
      if (v86 >= v87)
      {
        v88.i64[1] = 0;
        v88.i32[0] = v187.i32[1];
        v88.f32[1] = -*(float *)v187.i32;
      }
      else
      {
        v88 = (float32x4_t)vtrn1q_s32((int32x4_t)COERCE_UNSIGNED_INT(-*(float *)&v187.i32[1]), v187);
      }
      v72 = v158;
      v71 = v159;
      *(float *)v14.i32 = v179;
      v89 = fmaxf(v183.f32[1] * (float)((float)(v179 * 30.0) * vaddv_f32(vmul_f32(v183, v85))), 0.0);
      v45 = v171;
      v44 = v172;
    }
    else
    {
      v88 = 0uLL;
      v89 = 0.0;
      v71 = v159;
      if (v175 == 3)
      {
        v72 = v158;
        if (v182)
        {
          v180 = *(float *)v14.i32;
          v90 = vsub_f32(v182[12], *(float32x2_t *)v172.f32);
          v91 = vmul_f32(v90, v90);
          v91.i32[0] = vadd_f32(v91, (float32x2_t)vdup_lane_s32((int32x2_t)v91, 1)).u32[0];
          v92 = vrsqrte_f32((float32x2_t)v91.u32[0]);
          v93 = vmul_f32(v92, vrsqrts_f32((float32x2_t)v91.u32[0], vmul_f32(v92, v92)));
          v184 = vmul_n_f32(v90, vmul_f32(v93, vrsqrts_f32((float32x2_t)v91.u32[0], vmul_f32(v93, v93))).f32[0]);
          v188 = (int32x4_t)v49;
          v94 = vsub_f32(*(float32x2_t *)v165.f32, *(float32x2_t *)v171.f32);
          v95 = vmul_f32(v94, v94);
          v95.i32[0] = vadd_f32(v95, (float32x2_t)vdup_lane_s32((int32x2_t)v95, 1)).u32[0];
          v96 = vrsqrte_f32((float32x2_t)v95.u32[0]);
          v97 = vmul_f32(v96, vrsqrts_f32((float32x2_t)v95.u32[0], vmul_f32(v96, v96)));
          v98 = vmul_n_f32(v94, vmul_f32(v97, vrsqrts_f32((float32x2_t)v95.u32[0], vmul_f32(v97, v97))).f32[0]);
          v99 = vsubq_f32(v171, v172).u64[0];
          v100 = atan2f(*(float *)&v99, *((float *)&v99 + 1));
          v101 = atan2f(v184.f32[0], v184.f32[1]);
          v49 = (float32x4_t)v188;
          if (v100 <= v101)
          {
            v88.i64[1] = 0;
            v88.i32[0] = v188.i32[1];
            v88.f32[1] = -*(float *)v188.i32;
          }
          else
          {
            v88 = (float32x4_t)vtrn1q_s32((int32x4_t)COERCE_UNSIGNED_INT(-*(float *)&v188.i32[1]), v188);
          }
          *(float *)v14.i32 = v180;
          v89 = fmaxf(v184.f32[1] * (float)((float)(v180 * 20.0) * vaddv_f32(vmul_f32(v184, v98))), 0.0);
          v45 = v171;
          v44 = v172;
          goto LABEL_66;
        }
      }
      else
      {
        v72 = v158;
      }
    }
    if (v175 == 24)
    {
      v126 = v45;
      v126.i32[3] = 0;
      v127 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.2), v88, v89 * 0.2);
      v127.i32[3] = 0;
      v192 = v126;
      v193 = v127;
      v128 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.5), v88, v89 * 0.3);
      v128.i32[3] = 0;
      v129 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.8), v88, v89 * 0.15);
      v129.i32[3] = 0;
      v194 = v128;
      v195 = v129;
      v130 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.92), v88, v89 * 0.05);
      v130.i32[3] = 0;
      v131 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.97), v88, v89 * 0.02);
      v131.i32[3] = 0;
      v196 = v130;
LABEL_67:
      v44.i32[3] = 0;
      v197 = v131;
      v198 = v44;
      v137 = -[NUNIAnimation initWithAnimatable:values:count:key:]([NUNIAnimation alloc], "initWithAnimatable:values:count:key:", v71, &v192, 7, 0);

      -[NUNIAnimation setFunction:](v137, "setFunction:", 3);
      v138 = 0x24CFD6000;
      goto LABEL_73;
    }
LABEL_66:
    v132 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.3), v88, v89 * 0.15);
    v133 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.75), v88, v89 * 0.2);
    v134 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.93), v88, v89 * 0.05);
    v135 = v45;
    v135.i32[3] = 0;
    v136 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.97), v88, v89 * 0.02);
    v132.i32[3] = 0;
    v133.i32[3] = 0;
    v192 = v135;
    v193 = v132;
    v134.i32[3] = 0;
    v136.i32[3] = 0;
    v194 = v133;
    v195 = v134;
    v131 = vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.99);
    v131.i32[3] = 0;
    v196 = v136;
    goto LABEL_67;
  }
  _Q1 = (int32x4_t)vmulq_f32(v49, (float32x4_t)xmmword_2134DBE20);
  v51 = (float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)_Q1, (int8x16_t)_Q1, 4uLL), _Q1);
  _Q2 = vsubq_f32(v170, v172);
  _Q3 = vmulq_f32(_Q2, _Q2);
  _S4 = _Q2.i32[2];
  __asm { FMLA            S3, S4, V2.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  _Q4 = vsubq_f32(v165, v171);
  _Q5 = vmulq_f32(_Q4, _Q4);
  _S6 = _Q4.i32[2];
  __asm { FMLA            S5, S6, V4.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q3 = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q4 = vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0));
  v60 = vmlaq_n_f32(vmlaq_n_f32(v171, v49, *(float *)v14.i32 * 0.25), v51, *(float *)v14.i32 * 0.05).u64[0];
  v61 = vmlaq_n_f32(vmlaq_n_f32(v171, v49, *(float *)v14.i32 * 0.75), v51, *(float *)v14.i32 * 0.05).u64[0];
  v62 = *(float32x4_t *)v182[12].f32;
  v14.i32[0] = v182[10].i32[1];
  v63 = *(float32x4_t *)v181[12].f32;
  v64 = v181[10].f32[1];
  _S19 = vsubq_f32(v171, v62).i32[2];
  __asm { FMLA            S18, S19, V6.S[2] }
  if (sqrtf(_S18) <= (float)(*(float *)v14.i32 * 5.7588))
  {
    _S18 = v49.i32[2];
    __asm { FMLA            S17, S18, V4.S[2] }
    if (_S17 > 0.25)
    {
      _S16 = _Q4.i32[2];
      __asm
      {
        FMLA            S17, S4, V1.S[1]
        FMLA            S17, S16, V1.S[2]
      }
      *(float *)v14.i32 = (float)(*(float *)v14.i32 * 5.7588) * 3.0;
      v107 = (float32x4_t)vdupq_lane_s32(v14, 0);
      v72 = v158;
      v71 = v159;
      if (_S17 <= 0.1)
        v60 = vmlaq_f32(v171, v107, v51).u64[0];
      else
        v60 = vmlsq_f32(v171, v107, v51).u64[0];
      goto LABEL_49;
    }
  }
  else
  {
    _S19 = vsubq_f32(v172, v62).i32[2];
    __asm { FMLA            S17, S19, V16.S[2] }
    if (sqrtf(_S17) <= (float)(*(float *)v14.i32 * 5.7588))
    {
      _S17 = v49.i32[2];
      __asm { FMLA            S16, S17, V3.S[2] }
      v72 = v158;
      v71 = v159;
      if (_S16 < -0.25)
      {
        _S16 = _Q3.i32[2];
        __asm
        {
          FMLA            S17, S3, V1.S[1]
          FMLA            S17, S16, V1.S[2]
        }
        *(float *)v14.i32 = (float)(*(float *)v14.i32 * 5.7588) * 3.0;
        v76 = (float32x4_t)vdupq_lane_s32(v14, 0);
        if (_S17 <= 0.1)
          v61 = vmlaq_f32(v172, v76, v51).u64[0];
        else
          v61 = vmlsq_f32(v172, v76, v51).u64[0];
      }
      goto LABEL_49;
    }
  }
  v72 = v158;
  v71 = v159;
LABEL_49:
  _S17 = vsubq_f32(v171, v63).i32[2];
  __asm { FMLA            S16, S17, V7.S[2] }
  if (sqrtf(_S16) <= (float)(v64 * 5.7588))
  {
    _S5 = v49.i32[2];
    __asm { FMLA            S3, S5, V4.S[2] }
    v185 = *(double *)&v61;
    if (_S3 <= 0.25)
    {
      v189 = *(double *)&v60;
    }
    else
    {
      _S3 = _Q4.i32[2];
      __asm
      {
        FMLA            S5, S4, V1.S[1]
        FMLA            S5, S3, V1.S[2]
      }
      *(float *)_Q1.i32 = (float)(v64 * 5.7588) * 3.0;
      v117 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.i8, 0);
      if (_S5 <= 0.1)
        v118 = vmlaq_f32(v171, v117, v51).u64[0];
      else
        v118 = vmlsq_f32(v171, v117, v51).u64[0];
      v189 = *(double *)&v118;
    }
  }
  else
  {
    _S7 = vsubq_f32(v172, v63).i32[2];
    __asm { FMLA            S5, S7, V4.S[2] }
    v189 = *(double *)&v60;
    if (sqrtf(_S5) <= (float)(v64 * 5.7588))
    {
      _S5 = v49.i32[2];
      __asm { FMLA            S4, S5, V3.S[2] }
      if (_S4 >= -0.25)
      {
        v185 = *(double *)&v61;
      }
      else
      {
        _S4 = _Q3.i32[2];
        __asm
        {
          FMLA            S5, S3, V1.S[1]
          FMLA            S5, S4, V1.S[2]
        }
        *(float *)_Q1.i32 = (float)(v64 * 5.7588) * 3.0;
        v124 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.i8, 0);
        if (_S5 <= 0.1)
          v125 = vmlaq_f32(v172, v124, v51).u64[0];
        else
          v125 = vmlsq_f32(v172, v124, v51).u64[0];
        v185 = *(double *)&v125;
      }
    }
    else
    {
      v185 = *(double *)&v61;
    }
  }
  v138 = 0x24CFD6000uLL;
  v137 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v71, 0, *(double *)v171.i64, *(double *)v172.i64, v189, v185);

  -[NUNIAnimation setFunction:](v137, "setFunction:", 2);
LABEL_73:
  objc_msgSend(v8, "addObject:", v137);
  v139 = v170;
  _Q0 = vsubq_f32(v170, v165);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v143 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  v144 = v165;
  v144.i32[3] = 0;
  v145 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.3);
  v145.i32[3] = 0;
  v192 = v144;
  v193 = v145;
  v146 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.75);
  v146.i32[3] = 0;
  v147 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.93);
  v148 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.97);
  v147.i32[3] = 0;
  v148.i32[3] = 0;
  v194 = v146;
  v195 = v147;
  v149 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.99);
  v149.i32[3] = 0;
  v196 = v148;
  v197 = v149;
  v139.i32[3] = 0;
  v198 = v139;
  v150 = (void *)objc_msgSend(objc_alloc(*(Class *)(v138 + 3664)), "initWithAnimatable:values:count:key:", v71, &v192, 7, 1);

  objc_msgSend(v150, "setFunction:", 3);
  objc_msgSend(v8, "addObject:", v150);
  v190[0] = xmmword_2134DBE78;
  *(_OWORD *)((char *)v190 + 12) = *(__int128 *)((char *)&xmmword_2134DBE78 + 12);
  objc_msgSend(*(id *)(v138 + 3664), "generateSlerpKeys:times:count:from:to:", v191, v190, 7, v161, *(double *)&v160);
  v151 = (void *)objc_msgSend(objc_alloc(*(Class *)(v138 + 3664)), "initWithAnimatable:values:count:key:", v71, v191, 7, 2);

  objc_msgSend(v151, "setFunction:", 3);
  objc_msgSend(v8, "addObject:", v151);
  v152 = (void *)objc_msgSend(objc_alloc(*(Class *)(v138 + 3664)), "initWithAnimatable:from:to:key:", v71, 3, *(double *)vdupq_lane_s32(v163, 0).i64, *(double *)vdupq_lane_s32(v162, 0).i64);

  objc_msgSend(v152, "setFunction:", 0);
  objc_msgSend(v8, "addObject:", v152);
  v153 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v167, *(float32x2_t *)&v166);
  if ((vpmin_u32(v153, v153).u32[0] & 0x80000000) == 0)
  {
    v154 = (void *)objc_msgSend(objc_alloc(*(Class *)(v138 + 3664)), "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v71, 6, v167, v166, v166, v166);

    objc_msgSend(v154, "setFunction:", 2);
    objc_msgSend(v8, "addObject:", v154);
    v152 = v154;
  }
  v155 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v169, *(float32x2_t *)&v168);
  if ((vpmin_u32(v155, v155).u32[0] & 0x80000000) == 0)
  {
    v156 = (void *)objc_msgSend(objc_alloc(*(Class *)(v138 + 3664)), "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v71, 7, v169, v168, v168, v168);

    objc_msgSend(v156, "setFunction:", 2);
    objc_msgSend(v8, "addObject:", v156);
    v152 = v156;
  }

  return v8;
}

id NUNIAstronomyVistaView_GenerateCarouselAnimationArrayFromSceneBlob(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NUNIAnimation *v18;
  void *v23;
  int32x2_t v24;
  uint64_t v25;
  NUNIAnimation *v26;
  NUNIAnimation *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  NUNIAnimation *v34;
  uint64_t v35;
  int32x2_t v36;
  int32x2_t v37;
  NUNIAnimation *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NUNIAnimation *v47;
  NUNIAnimation *v48;
  float32x4_t v49;
  uint32x4_t v50;
  NUNIAnimation *v51;
  float32x4_t v52;
  NUNIAnimation *v53;
  float v56;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  NUNIAnimation *v65;
  float v67;
  float32x4_t v68;
  float v69;
  float32x4_t v70;
  float v71;
  float32x4_t v72;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float v79;
  float v80;
  float32x4_t v81;
  float32x4_t v82;
  __float2 v83;
  __float2 v84;
  float32x4_t v85;
  __float2 v86;
  __float2 v87;
  float32x4_t v88;
  void *v89;
  void *v90;
  __float2 v91;
  __float2 v92;
  float32x4_t v93;
  int32x4_t v97;
  float32x4_t v101;
  NUNIAnimation *v102;
  NUNIAnimation *v103;
  NUNIAnimation *v104;
  NUNIAnimation *v105;
  NUNIAnimation *v113;
  NUNIAnimation *v114;
  uint32x2_t v115;
  NUNIAnimation *v116;
  uint32x2_t v117;
  NUNIAnimation *v118;
  void *v120;
  id v121;
  id v122;
  __int128 v123;
  float32x4_t v124;
  int32x2_t v125;
  int32x2_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  double v130;
  double v131;
  double v132;
  double v133;
  float32x4_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  double v139;
  double v140;
  float32x4_t v141;
  double v142;
  float v143;
  uint64_t v144;
  float32x4_t v145;
  double v146;
  float v147;
  float v148;
  float32x4_t v149;
  float v150;
  int32x2_t v151;
  float v152;
  float v153;
  float32x4_t v154;
  int32x2_t v155;
  int32x2_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v122 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v122, "bytes");
  v121 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v121, "bytes");
  v11 = *(float32x4_t *)(v9 + 32);
  v128 = *(float32x4_t *)v9;
  v129 = v11;
  v11.i32[0] = *(_DWORD *)(v9 + 52);
  v126 = *(int32x2_t *)v11.f32;
  v131 = *(double *)(v9 + 96);
  v133 = *(double *)(v9 + 104);
  v134 = *(float32x4_t *)(v9 + 16);
  v127 = *(float32x4_t *)v10;
  v12 = *(float32x4_t *)(v10 + 32);
  v123 = *(_OWORD *)(v10 + 16);
  v124 = v12;
  v12.i32[0] = *(_DWORD *)(v10 + 52);
  v125 = *(int32x2_t *)v12.f32;
  v130 = *(double *)(v10 + 96);
  v132 = *(double *)(v10 + 104);
  v13 = *(int *)(v9 + 128);
  objc_msgSend(v5, "spheroids");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v13;
  if (!(_DWORD)v13)
  {
    v18 = 0;
    goto LABEL_42;
  }
  v120 = v5;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v135 = *(_QWORD *)(v9 + 56);
  v136 = *(_QWORD *)(v10 + 56);
  __asm { FMOV            V0.4S, #1.0 }
  v139 = *(double *)&_Q0;
  do
  {
    objc_msgSend(v138, "objectAtIndex:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(v10 + v14 + 144);
    if (v25 == v135)
      v17 = v9 + v14 + 144;
    v144 = v17;
    if (v25 == v136)
      v16 = v10 + v14 + 144;
    v24.i32[0] = *(_DWORD *)(v9 + v14 + 232);
    v155 = v24;
    v24.i32[0] = *(_DWORD *)(v10 + v14 + 232);
    v150 = *(float *)v24.i32;
    *(_QWORD *)&v140 = vdupq_lane_s32(v24, 0).u64[0];
    *(_QWORD *)&v142 = vdupq_lane_s32(v155, 0).u64[0];
    v26 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v23, 7);

    -[NUNIAnimation setFunction:](v26, "setFunction:", 0);
    if (*(float *)v155.i32 == 1.0 && v150 <= 0.00001)
    {
      v27 = [NUNIAnimation alloc];
      v28 = 0.0;
      v29 = 0.0;
      v30 = v23;
      v31 = v139;
      v32 = v139;
    }
    else
    {
      v27 = [NUNIAnimation alloc];
      if (*(float *)v155.i32 > 0.00001 || v150 != 1.0)
      {
        v18 = -[NUNIAnimation initWithAnimatable:from:to:key:](v27, "initWithAnimatable:from:to:key:", v23, 7, v142, v140);

        v34 = v18;
        v35 = 0;
        goto LABEL_17;
      }
      v31 = 0.0;
      v32 = 0.0;
      v30 = v23;
      v28 = v139;
      v29 = v139;
    }
    v18 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v27, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v30, 7, v31, v28, v32, v29);

    v34 = v18;
    v35 = 2;
LABEL_17:
    -[NUNIAnimation setFunction:](v34, "setFunction:", v35);
    objc_msgSend(v8, "addObject:", v18);
    v36.i32[0] = *(_DWORD *)(v9 + v14 + 192);
    v37.i32[0] = *(_DWORD *)(v10 + v14 + 192);
    if (*(float *)v36.i32 == *(float *)v37.i32)
      goto LABEL_27;
    if (*(float *)v36.i32 == 1.0 && *(float *)v37.i32 == 0.0)
    {
      v38 = [NUNIAnimation alloc];
      v39 = 0.0;
      v40 = 0.0000305175853;
      v41 = v23;
      v42 = v139;
      v43 = v139;
    }
    else
    {
      v151 = v37;
      v156 = v36;
      v38 = [NUNIAnimation alloc];
      if (*(float *)v156.i32 != 0.0 || *(float *)v151.i32 != 1.0)
      {
        v44 = -[NUNIAnimation initWithAnimatable:from:to:key:](v38, "initWithAnimatable:from:to:key:", v23, 9, *(double *)vdupq_lane_s32(v156, 0).i64, *(double *)vdupq_lane_s32(v151, 0).i64);

        v45 = (void *)v44;
        v46 = 0;
        goto LABEL_26;
      }
      v42 = 0.0;
      v43 = 0.0000305175853;
      v41 = v23;
      v39 = v139;
      v40 = v139;
    }
    v44 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v38, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v41, 9, v42, v39, v43, v40);

    v45 = (void *)v44;
    v46 = 2;
LABEL_26:
    objc_msgSend(v45, "setFunction:", v46);
    v18 = (NUNIAnimation *)v44;
    objc_msgSend(v8, "addObject:", v44);
LABEL_27:
    v37.i32[0] = *(_DWORD *)(v9 + v14 + 196);
    v36.i32[0] = *(_DWORD *)(v10 + v14 + 196);
    if (*(float *)v37.i32 != *(float *)v36.i32)
    {
      v47 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v23, 12, *(double *)vdupq_lane_s32(v37, 0).i64, *(double *)vdupq_lane_s32(v36, 0).i64);

      -[NUNIAnimation setFunction:](v47, "setFunction:", 0);
      objc_msgSend(v8, "addObject:", v47);
      v18 = v47;
    }
    v36.i32[0] = *(_DWORD *)(v9 + v14 + 156);
    v37.i32[0] = *(_DWORD *)(v10 + v14 + 156);
    if (*(float *)v37.i32 != *(float *)v36.i32)
    {
      v48 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v23, 5, *(double *)vdupq_lane_s32(v36, 0).i64, *(double *)vdupq_lane_s32(v37, 0).i64);

      -[NUNIAnimation setFunction:](v48, "setFunction:", 0);
      objc_msgSend(v8, "addObject:", v48);
      v18 = v48;
    }
    v49 = *(float32x4_t *)(v10 + v14 + 240);
    v50 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v9 + v14 + 240), v49);
    v50.i32[3] = v50.i32[2];
    if ((vminvq_u32(v50) & 0x80000000) == 0)
    {
      v51 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v23, 0, *(double *)(v9 + v14 + 240), *(double *)v49.i64);

      -[NUNIAnimation setFunction:](v51, "setFunction:", 0);
      objc_msgSend(v8, "addObject:", v51);
      v18 = v51;
    }
    v52 = *(float32x4_t *)(v10 + v14 + 176);
    if ((vminvq_u32((uint32x4_t)vceqq_f32(v52, *(float32x4_t *)(v9 + v14 + 176))) & 0x80000000) == 0)
    {
      v53 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v23, 2, *(double *)(v9 + v14 + 176), *(double *)v52.i64);

      -[NUNIAnimation setFunction:](v53, "setFunction:", 4);
      objc_msgSend(v8, "addObject:", v53);
      v18 = v53;
    }
    v17 = v144;

    ++v15;
    v14 += 160;
  }
  while (v137 != v15);
  if (!v144)
  {
    v5 = v120;
    goto LABEL_42;
  }
  v5 = v120;
  if (!v16)
  {
LABEL_42:
    v65 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v5, 0, *(double *)v128.i64, *(double *)v127.i64);

    -[NUNIAnimation setFunction:](v65, "setFunction:", 0);
    objc_msgSend(v8, "addObject:", v65);
    goto LABEL_72;
  }
  _Q1 = vsubq_f32(v128, v134);
  _S9 = _Q1.i32[2];
  v56 = _Q1.f32[1];
  __asm { FMLA            S0, S9, V1.S[2] }
  v152 = sqrtf(_S0);
  v157 = _Q1;
  v147 = acosf(_Q1.f32[2] / v152);
  _Q0.f32[0] = atan2f(v56, v157.f32[0]);
  v143 = _Q0.f32[0];
  _Q1 = _Q0;
  _Q1.f32[1] = v147;
  _Q1.f32[2] = v152;
  v145 = _Q1;
  v141 = vsubq_f32(v127, v134);
  _Q1.i32[0] = v141.i32[2];
  __asm { FMLA            S0, S1, V2.S[2] }
  v148 = sqrtf(_Q0.f32[0]);
  v153 = acosf(v141.f32[2] / v148);
  v60.f32[0] = atan2f(v141.f32[1], v141.f32[0]);
  v63.f32[0] = v143 - v60.f32[0];
  if ((float)(v143 - v60.f32[0]) > 3.1416)
  {
    v61.f32[0] = v143 + -6.2832;
    v64 = v145;
    goto LABEL_45;
  }
  v64 = v145;
  v61 = v145;
  if (v63.f32[0] < -3.1416)
  {
    v61.f32[0] = v143 + 6.2832;
LABEL_45:
    v61.i32[1] = v64.i32[1];
    v61.i32[2] = v64.i32[2];
  }
  _V21.S[2] = v157.i32[2];
  if ((float)(v61.f32[1] - v153) > 3.1416)
  {
    v67 = -6.2832;
    goto LABEL_50;
  }
  if ((float)(v61.f32[1] - v153) < -3.1416)
  {
    v67 = 6.2832;
LABEL_50:
    v68.i64[0] = __PAIR64__(v61.f32[1] + v67, v61.u32[0]);
    v68.i64[1] = v61.i64[1];
    v61 = v68;
  }
  v60.f32[1] = v153;
  if (v63.f32[0] > 3.1416)
  {
    v69 = -6.2832;
    goto LABEL_55;
  }
  v62 = v64;
  if (v63.f32[0] < -3.1416)
  {
    v69 = 6.2832;
LABEL_55:
    v62.f32[0] = v143 + v69;
    v62.i32[1] = v64.i32[1];
    v62.i32[2] = v64.i32[2];
  }
  v60.f32[2] = v148;
  v70 = (float32x4_t)vdupq_n_s32(0x3EA8F5C3u);
  if ((float)(v62.f32[1] - v153) > 3.1416)
  {
    v71 = -6.2832;
    goto LABEL_60;
  }
  if ((float)(v62.f32[1] - v153) < -3.1416)
  {
    v71 = 6.2832;
LABEL_60:
    v72.i64[0] = __PAIR64__(v62.f32[1] + v71, v62.u32[0]);
    v72.i64[1] = v62.i64[1];
    v62 = v72;
  }
  __asm { FMLA            S4, S9, V21.S[2] }
  v74 = (float32x4_t)vdupq_n_s32(0x3F2B851Eu);
  v75 = vmulq_f32(v60, v70);
  v76 = vmulq_f32(v60, (float32x4_t)vdupq_n_s32(0x3F28F5C3u));
  v77 = (float32x4_t)vdupq_n_s32(0x3EAE147Au);
  if (v63.f32[0] > 3.1416)
  {
    v63.i32[0] = -1060565029;
    goto LABEL_65;
  }
  if (v63.f32[0] < -3.1416)
  {
    v63.i32[0] = 1086918619;
LABEL_65:
    v63.f32[0] = v143 + v63.f32[0];
    v63.i32[1] = v64.i32[1];
    v63.i32[2] = v64.i32[2];
    v64 = v63;
  }
  v78 = vmlaq_f32(v75, v74, v61);
  v79 = sqrtf(_S4);
  v158 = vmlaq_f32(v76, v77, v62);
  if ((float)(v64.f32[1] - v153) > 3.1416)
  {
    v80 = -6.2832;
    goto LABEL_70;
  }
  if ((float)(v64.f32[1] - v153) < -3.1416)
  {
    v80 = 6.2832;
LABEL_70:
    v81.i32[0] = v64.i32[0];
    v81.f32[1] = v64.f32[1] + v80;
    v81.i64[1] = v64.i64[1];
    v64 = v81;
  }
  v82.i64[0] = 0x3F0000003F000000;
  v82.i64[1] = 0x3F0000003F000000;
  v149 = v78;
  v154 = vmlaq_f32(vmulq_f32(v60, v82), v82, v64);
  v83 = __sincosf_stret(v78.f32[0]);
  v84 = __sincosf_stret(v149.f32[1]);
  *(float32x2_t *)v85.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v83.__sinval), LODWORD(v83.__cosval)), vmuls_lane_f32(v84.__sinval, v149, 2));
  v85.i32[2] = vmuls_lane_f32(v84.__cosval, v149, 2);
  v149.i64[0] = vaddq_f32(v134, v85).u64[0];
  v86 = __sincosf_stret(v158.f32[0]);
  v87 = __sincosf_stret(v158.f32[1]);
  *(float32x2_t *)v88.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v86.__sinval), LODWORD(v86.__cosval)), vmuls_lane_f32(v87.__sinval, v158, 2));
  v88.i32[2] = vmuls_lane_f32(v87.__cosval, v158, 2);
  *(_QWORD *)&v146 = vaddq_f32(v134, v88).u64[0];
  objc_msgSend(v120, "spheroidOfType:", v135);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "spheroidOfType:", v136);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = __sincosf_stret(v154.f32[0]);
  v92 = __sincosf_stret(v154.f32[1]);
  *(float32x2_t *)v93.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v91.__sinval), LODWORD(v91.__cosval)), vmuls_lane_f32(v92.__sinval, v154, 2));
  v93.i32[2] = vmuls_lane_f32(v92.__cosval, v154, 2);
  _Q0 = vsubq_f32(vaddq_f32(v134, v93), v134);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v97 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v97, (int8x16_t)v97, 0xCuLL), (int8x16_t)v97, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v129, (int32x4_t)v129), (int8x16_t)v129, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v97, v97), (int8x16_t)v97, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v129, (int8x16_t)v129, 0xCuLL), (int8x16_t)v129, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v101 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0.f32[0] = v79 * 0.75;
  v159 = v101;
  v102 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v89, 0, *(double *)v134.i64, *(double *)vmlsq_lane_f32(v134, v101, *(float32x2_t *)_Q0.f32, 0).i64);

  -[NUNIAnimation setFunction:](v102, "setFunction:", 0);
  objc_msgSend(v8, "addObject:", v102);
  v103 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v90, 0, *(double *)vmlaq_n_f32(v134, v159, v79 * 0.75).i64, *(double *)v134.i64);

  -[NUNIAnimation setFunction:](v103, "setFunction:", 0);
  objc_msgSend(v8, "addObject:", v103);
  v65 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v120, 0, *(double *)v128.i64, *(double *)v127.i64, *(double *)v149.i64, v146);

  -[NUNIAnimation setFunction:](v65, "setFunction:", 2);
  objc_msgSend(v8, "addObject:", v65);

LABEL_72:
  v104 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v5, 1, *(double *)v134.i64, *(double *)&v123);

  -[NUNIAnimation setFunction:](v104, "setFunction:", 0);
  objc_msgSend(v8, "addObject:", v104);
  v105 = [NUNIAnimation alloc];
  __asm
  {
    FMOV            V3.4S, #0.25
    FMOV            V4.4S, #0.75
  }
  _Q2 = vmlaq_f32(vmulq_f32(v124, _Q3), _Q4, v129);
  _Q5 = vmulq_f32(_Q2, _Q2);
  _S6 = _Q2.i32[2];
  __asm { FMLA            S5, S6, V2.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q2.i64[0] = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0)).u64[0];
  _Q4 = vmlaq_f32(vmulq_f32(v124, _Q4), _Q3, v129);
  _Q3 = vmulq_f32(_Q4, _Q4);
  _Q5.i32[0] = _Q4.i32[2];
  __asm { FMLA            S3, S5, V4.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  v113 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](v105, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v5, 2, *(double *)v129.i64, *(double *)v124.i64, *(double *)_Q2.i64, *(double *)vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0)).i64);

  -[NUNIAnimation setFunction:](v113, "setFunction:", 2);
  objc_msgSend(v8, "addObject:", v113);
  v114 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v5, 3, *(double *)vdupq_lane_s32(v126, 0).i64, *(double *)vdupq_lane_s32(v125, 0).i64);

  -[NUNIAnimation setFunction:](v114, "setFunction:", 0);
  objc_msgSend(v8, "addObject:", v114);
  v115 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v131, *(float32x2_t *)&v130);
  if ((vpmin_u32(v115, v115).u32[0] & 0x80000000) == 0)
  {
    v116 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v5, 6, v131, v130);

    -[NUNIAnimation setFunction:](v116, "setFunction:", 0);
    objc_msgSend(v8, "addObject:", v116);
    v114 = v116;
  }
  v117 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v133, *(float32x2_t *)&v132);
  if ((vpmin_u32(v117, v117).u32[0] & 0x80000000) == 0)
  {
    v118 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v5, 7, v133, v132);

    -[NUNIAnimation setFunction:](v118, "setFunction:", 0);
    objc_msgSend(v8, "addObject:", v118);
    v114 = v118;
  }

  return v8;
}

float _NUNISphereoidComputeRadius(uint64_t a1, uint64_t a2)
{
  float v2;
  float result;
  float v4;
  uint64_t v5;

  if (a2)
  {
    v2 = 0.14894;
  }
  else
  {
    if (((1 << a1) & 0xFFC000) != 0)
      v5 = a1 - 14;
    else
      v5 = a1;
    if (v5)
    {
      if (v5 == 7)
      {
        v2 = 0.051282;
      }
      else if (v5 == 6)
      {
        v2 = 0.057692;
      }
      else
      {
        v2 = 0.044872;
      }
    }
    else
    {
      v2 = 0.070513;
    }
  }
  result = 0.5;
  if ((unint64_t)(a1 - 10) >= 2)
  {
    v4 = v2 + v2;
    if ((unint64_t)(a1 - 12) > 1)
      v4 = v2;
    return v4 * 0.5;
  }
  return result;
}

void NUNIComputeSpheroidTransformParameters(void *a1, void *a2, float *a3, float *a4, float32x2_t *a5, float *a6, float *a7, int a8)
{
  id v15;
  id v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  void *v24;
  double v25;
  float v26;
  float v27;
  float v28;
  void *v29;
  double v30;
  const float *v31;
  float32x2_t v32;
  void *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  unsigned int v38;
  float v39;
  double *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  simd_float4 v52;
  simd_float4 v53;
  simd_float4 v54;
  simd_float4 v55;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  simd_float4 v59;
  simd_float4 v60;
  simd_float4 v61;
  simd_float4 v62;
  simd_float4 v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  simd_float4 v67;
  simd_float4 v68;
  simd_float4 v69;
  simd_float4 v70;
  simd_float4 v71;
  simd_float4 v72;
  simd_float4 v73;
  simd_float4 v74;
  simd_float4 v75;
  simd_float4 v76;
  simd_float4 v77;
  simd_float4 v78;
  simd_float4 v79;
  simd_float4 v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  double v85;
  __int32 v86;
  float v87;
  float v88;
  simd_float4 v89;
  simd_float4 v90;
  simd_float4 v91;
  simd_float4 v92;
  simd_float4 v93;
  simd_float4 v94;
  simd_float4 v95;
  simd_float4 v96;
  simd_float4 v97;
  simd_float4 v98;
  simd_float4 v99;
  simd_float4 v100;
  simd_float4 v101;
  simd_float4 v102;
  simd_float4 v103;
  simd_float4 v104;
  float *v105;
  float v106;
  double v107;
  double v108;
  double v109[2];
  simd_float4x4 v110;
  simd_float4x4 v111;
  simd_float4x4 v112;
  simd_float4x4 v113;
  simd_float4x4 v114;
  simd_float4x4 v115;
  simd_float4x4 v116;
  simd_float4x4 v117;

  v15 = a2;
  v16 = a1;
  v17 = (uint64_t *)objc_msgSend(v16, "structure");
  objc_msgSend(v16, "scene");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  *a6 = 0.0;
  *a4 = 0.0;
  v105 = a3;
  *a3 = 0.0;
  *a5 = 0;
  v19 = objc_msgSend(v18, "collectionType");
  v20 = *v17;
  *a7 = _NUNISphereoidComputeRadius(*v17, v19);
  if (((1 << v20) & 0xFBF3FE) != 0)
  {
    v21 = v20 - 14;
    if (((1 << v20) & 0xFFC000) == 0)
      v21 = v20;
    if (((1 << v20) & 0x3000) != 0)
      v22 = 7;
    else
      v22 = v21;
    v23 = 0.0;
    if (v22)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3D058]), "initWithDate:body:", v15, v22);
      objc_msgSend(v24, "longitude");
      *(float *)&v25 = v25;
      *a4 = (float)(*(float *)&v25 * 3.1416) / 180.0;

      if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        v26 = s_distance[v22];
        if (v19)
        {
          v27 = (float)(v26 * 10.0) + 3.0;
          v28 = 48.0;
        }
        else
        {
          v27 = (float)(v26 * 18.0) + 4.0;
          v28 = 156.0;
        }
        v23 = (float)(v27 / v28) * 0.5;
      }
    }
    *a6 = v23;
    if (v20 == 3)
    {
      v33 = (void *)objc_opt_new();
      v108 = 0.0;
      v109[0] = 0.0;
      v107 = 0.0;
      objc_msgSend(v33, "calculateGeocentricDirectionForSunX:Y:Z:date:", v109, &v108, &v107, v15);
      v34 = v109[0];
      v35 = v108;
      v36 = v107;
      v37 = 1.5708 - atan2f(v35, v34);
      if (a8)
      {
        *(float *)&v38 = 3.14159265 - *a4;
        v39 = v37 - *(float *)&v38;
        *a5 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(acosf(v36)), v38);
        *v105 = v39;
      }
      else
      {
        v106 = v37;
        *a5 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(acosf(v36)), LODWORD(v106));
      }

    }
    else if (v20 == 4)
    {
      *v105 = *a4;
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3D058]), "initWithDate:body:", v15, 3);
      objc_msgSend(v29, "longitude");
      *(float *)&v30 = v30;
      v31 = (const float *)&dword_2134DBFA4;
      v32 = vld1_dup_f32(v31);
      v32.f32[0] = (float)(*(float *)&v30 * 3.1416) / -180.0;
      *a5 = v32;

    }
    else if ((unint64_t)(v20 - 1) <= 8)
    {
      v40 = (double *)((char *)&NUNIComputeSpheroidTransformParameters_orientations + 40 * v20);
      v41 = *v40;
      v42 = v40[1];
      v43 = v40[2];
      v44 = v40[3];
      v45 = v40[4];
      objc_msgSend(v15, "timeIntervalSince1970");
      v47 = v46 / 86400.0 + 2440587.5 + -2451545.0;
      v48 = fmod(v43 + v44 * v47, 360.0);
      *(double *)v49.i64 = UMFloat4x4MakeRotateZ(v48 * -0.017453);
      v97 = v50;
      v101 = v49;
      v89 = v52;
      v93 = v51;
      v49.f32[0] = 90.0 - v42;
      *(double *)v53.i64 = UMFloat4x4MakeRotateX(v49.f32[0] * -0.017453);
      v114.columns[0] = v53;
      v114.columns[1] = v54;
      v114.columns[2] = v55;
      v114.columns[3] = v56;
      v110.columns[1] = v97;
      v110.columns[0] = v101;
      v110.columns[3] = v89;
      v110.columns[2] = v93;
      *(double *)v57.i64 = UMMul(v110, v114);
      v98 = v58;
      v102 = v57;
      v90 = v60;
      v94 = v59;
      v57.f32[0] = v41 + -90.0;
      *(double *)v61.i64 = UMFloat4x4MakeRotateZ(v57.f32[0] * -0.017453);
      v115.columns[0] = v61;
      v115.columns[1] = v62;
      v115.columns[2] = v63;
      v115.columns[3] = v64;
      v111.columns[1] = v98;
      v111.columns[0] = v102;
      v111.columns[3] = v90;
      v111.columns[2] = v94;
      *(double *)v65.i64 = UMMul(v111, v115);
      v99 = v66;
      v103 = v65;
      v91 = v68;
      v95 = v67;
      *(double *)v69.i64 = UMFloat4x4MakeRotateX(-0.40911);
      v116.columns[0] = v69;
      v116.columns[1] = v70;
      v116.columns[2] = v71;
      v116.columns[3] = v72;
      v112.columns[1] = v99;
      v112.columns[0] = v103;
      v112.columns[3] = v91;
      v112.columns[2] = v95;
      *(double *)v73.i64 = UMMul(v112, v116);
      v100 = v74;
      v104 = v73;
      v92 = v76;
      v96 = v75;
      v73.f32[0] = v45 * v47;
      *(double *)v77.i64 = UMFloat4x4MakeRotateZ(v73.f32[0] * -0.017453);
      v117.columns[0] = v77;
      v117.columns[1] = v78;
      v117.columns[2] = v79;
      v117.columns[3] = v80;
      v113.columns[1] = v100;
      v113.columns[0] = v104;
      v113.columns[3] = v92;
      v113.columns[2] = v96;
      *(double *)v81.i64 = UMMul(v113, v117);
      v85 = UMMul(v81, v82, v83, v84, (float32x4_t)xmmword_2134DBF70);
      v104.i32[2] = v86;
      v87 = atan2f(*((float *)&v85 + 1), *(float *)&v85);
      v88 = 3.14159265 - *a4;
      v100.f32[0] = v88;
      *(float *)&v45 = v87 - v88;
      *a5 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(acosf(v104.f32[2])), v100.u32[0]);
      *v105 = *(float *)&v45;
    }
  }

}

void NUNIComputeSpheroidParentPosition(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  float v6;
  float32x2_t v7;
  float v8;
  int v9;
  float v10;
  float v11;

  if (a1)
  {
    v3 = a2;
    v4 = a1;
    objc_msgSend(v4, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NUNIComputeSpheroidParentPosition(v5, v3);

    v9 = 0;
    v10 = 0.0;
    NUNIComputeSpheroidTransformParameters(v4, v3, &v11, &v10, &v7, (float *)&v9, &v8, 1);

    v6 = v10;
    objc_msgSend(v4, "distanceScale");

    __sincosf_stret(v6);
  }
}

__n128 NUNIComputeCameraView(uint64_t a1, uint64_t a2, float a3)
{
  float v3;
  float v4;
  float v5;
  __float2 v6;
  __float2 v7;
  __n128 result;

  v3 = -*(float *)&a2;
  if (a1 == 4)
    v3 = 180.0 - *(float *)&a2;
  if (a1 == 3)
    v3 = -90.0 - *(float *)&a2;
  v4 = COERCE_FLOAT(HIDWORD(a2) ^ 0x80000000) * 3.14159265 / 180.0;
  v5 = v3 * 3.14159265 / 180.0 - a3 + 0.0;
  v6 = __sincosf_stret(v4);
  v7 = __sincosf_stret(v5);
  result.n128_u64[0] = (unint64_t)vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v7.__sinval), LODWORD(v7.__cosval)), v6.__cosval);
  result.n128_u32[2] = LODWORD(v6.__sinval);
  return result;
}

uint64_t NUNIComputeSpheroidIdealHomeCoordinate(uint64_t a1, float a2, float a3)
{
  float v3;
  float v4;

  v3 = a2 + a3;
  if (a1 == 1 || !a1 && (a2 > 1.5708 || a2 < -1.5708))
    v4 = 216.0;
  else
    v4 = 144.0;
  return COERCE_UNSIGNED_INT((float)(v4 + (float)(v3 * -57.296)) + (float)(floorf((float)(v4 + (float)(v3 * -57.296)) / 360.0)
                                                                         * -360.0)) | 0x41A0000000000000;
}

void sub_2134AC708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id _NUNCalliopeCreateTexture(void *a1, int a2, int a3, int a4, uint64_t a5, int a6)
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v11 = a1;
  if (a5)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setTextureType:", 2);
    objc_msgSend(v12, "setWidth:", a2);
    objc_msgSend(v12, "setHeight:", a3);
    objc_msgSend(v12, "setDepth:", 1);
    objc_msgSend(v12, "setPixelFormat:", a5);
    if (a6)
      v13 = 7;
    else
      v13 = 5;
    objc_msgSend(v12, "setUsage:", v13);
    objc_msgSend(v12, "setResourceOptions:", 32);
    if (a4 >= 2)
      objc_msgSend(v12, "setMipmapLevelCount:", a4);
    v14 = (void *)objc_msgSend(v11, "newTextureWithDescriptor:", v12);
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      NUNILoggingObjectForDomain(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        _NUNCalliopeCreateTexture_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void _NUNICalliopeRenderer_ComputeProjectedSpheroid(float a1)
{
  tanf(a1 * 0.5);
}

uint64_t _NUNICalliopeRenderCompareObject(float *a1, float *a2)
{
  if (*a1 < *a2)
    return 1;
  else
    return 0xFFFFFFFFLL;
}

void __destructor_8_s0_AB8s32n16_S_s8_AE(id *a1)
{
  id *v1;
  uint64_t i;

  v1 = a1 + 1;

  for (i = 0; i != 64; i += 4)
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2134B1C10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16_s24(id *a1)
{

}

id NUNIImageNamed(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDB8780];
  v2 = a1;
  objc_msgSend(v1, "sharedRenderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIImageNamedFromBundleForDevice();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id NUNILocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24CFDA758, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t NUNIMoonTotalPhaseNumbers()
{
  return 112;
}

id NUNIMoonImageForPhaseNumber(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3 <= 7 && ((0x9Fu >> a3) & 1) != 0)
  {
    if (*MEMORY[0x24BDB85A0] != a3)
    {
      v5 = off_24CFD7B48[a3];
      goto LABEL_8;
    }
  }
  else if (*MEMORY[0x24BDB85A0] != a3)
  {
    v4 = 0;
    return v4;
  }
  v5 = CFSTR("VictoryNTK");
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@Moon_%02d"), v5, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NUNIImageNamed(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (a2 == 1)
  {
    ___SouthernHemisphereImage_block_invoke((int)v7, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }

  return v4;
}

id NUNIRenderedMoonImage(unint64_t a1, void *a2, void *a3, uint64_t a4, CGFloat a5)
{
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  long double v17;
  CGPath *Mutable;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform m;
  CGSize v29;

  v8 = (double)a1 / 112.0;
  v9 = a5 * 0.5;
  v10 = (void *)MEMORY[0x24BDE56D0];
  v11 = a3;
  v12 = a2;
  objc_msgSend(v10, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMasksToBounds:", 1);
  objc_msgSend(v13, "addSublayer:", v14);
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, a5, a5);
  objc_msgSend(v13, "setCornerRadius:", v9);
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, a5, a5);
  v15 = v8 + -0.5;
  if (v8 >= 0.5)
  {
    v16 = 0.0;
  }
  else
  {
    v15 = v8;
    v16 = a5;
  }
  v17 = cos((v15 + v15) * 3.14159265);
  Mutable = CGPathCreateMutable();
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v9, v9);
  v26 = m;
  CGAffineTransformScale(&v27, &v26, v17, 1.0);
  m = v27;
  CGPathMoveToPoint(Mutable, 0, v16, 0.0);
  CGPathAddArc(Mutable, &m, 0.0, 0.0, v9, -1.57079633, 1.57079633, 0);
  CGPathAddLineToPoint(Mutable, 0, v16, a5);
  objc_msgSend(v14, "setPath:", Mutable);
  v19 = objc_retainAutorelease(v12);
  v20 = objc_msgSend(v19, "CGColor");

  objc_msgSend(v14, "setFillColor:", v20);
  v21 = objc_retainAutorelease(v11);
  v22 = objc_msgSend(v21, "CGColor");

  objc_msgSend(v13, "setBackgroundColor:", v22);
  v29.width = a5;
  v29.height = a5;
  UIGraphicsBeginImageContextWithOptions(v29, 0, 0.0);
  objc_msgSend(v13, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageWithRenderingMode:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  CGPathRelease(Mutable);

  return v24;
}

uint64_t NUNIMoonPhaseNumber(void *a1, double a2, double a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  double v8;
  unint64_t v9;
  uint64_t v10;

  v5 = (objc_class *)MEMORY[0x24BE3CB88];
  v6 = a1;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithLocation:date:body:", v6, 4, a2, a3);

  NUNIMoonPhaseAngleFromEphemeris(v7);
  v9 = vcvtmd_u64_f64((v8 + 180.0) / 360.0 * 112.0 + 0.5);
  v10 = v9 - 112 * (((v9 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64);

  return v10;
}

void NUNIMoonPhaseAngleFromEphemeris(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "parallacticAngle");
  objc_msgSend(v1, "phaseAngle");

}

id NUNIMoonPhaseDescriptionUnknown()
{
  return NUNILocalizedString(CFSTR("MOONPHASE_UNKNOWN"));
}

uint64_t NUNIMoonPhaseFor(void *a1, void *a2, double a3, double a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = (void *)MEMORY[0x24BDBCE48];
  v8 = a2;
  v9 = a1;
  objc_msgSend(v7, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v8);

  objc_msgSend(v10, "startOfDayForDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
  objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, 1, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startOfDayForDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CB88]), "initWithLocation:date:body:", v11, 4, a3, a4);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CB88]), "initWithLocation:date:body:", v14, 4, a3, a4);
  NUNIMoonPhaseAngleFromEphemeris(v15);
  v18 = v17;
  NUNIMoonPhaseAngleFromEphemeris(v16);
  if (v18 <= 0.0 || v19 >= 0.0)
  {
    if (v18 >= -90.0 || v19 <= -90.0)
    {
      if (v18 >= 0.0 || v19 <= 0.0)
      {
        v20 = 4;
        if (v18 < -90.0)
          v20 = 2;
        v21 = 8;
        if (v18 < 90.0)
          v21 = 6;
        v22 = 7;
        if (v18 >= 90.0 || v19 <= 90.0)
          v22 = v20;
        if (v18 < 0.0 || v18 < -90.0 || v18 < 90.0 && v19 > 90.0)
          v12 = v22;
        else
          v12 = v21;
      }
      else
      {
        v12 = 5;
      }
    }
    else
    {
      v12 = 3;
    }
  }

  return v12;
}

id NUNIMoonPhaseDescription(void *a1, void *a2, double a3, double a4)
{
  uint64_t v4;

  v4 = NUNIMoonPhaseFor(a1, a2, a3, a4);
  return NUNILocalizedString(off_24CFD7B88[v4 - 1]);
}

void NUNIAstronomyVistaController_ApplyStyleDefinition(float32x2_t *a1, uint64_t a2, void *a3)
{
  double v4;
  id v5;
  double v6;
  double v12;
  void *v13;
  id v14;

  v4 = *(double *)&a1[1];
  v5 = a3;
  objc_msgSend(v5, "setCameraOffset:", v4);
  LODWORD(v6) = a1->i32[0];
  objc_msgSend(v5, "setCameraOrbit:", v6);
  __asm { FMOV            V1.2D, #-15.0 }
  objc_msgSend(v5, "setOffsetCoordinate:", COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(vcvtq_f64_f32(a1[16]), _Q1).f64[1]));
  objc_msgSend(v5, "spheroidOfType:", 3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v13 = v14;
  if (v14)
  {
    LODWORD(v12) = a1[3].i32[0];
    objc_msgSend(v14, "setCloudOpacity:", v12);
    v13 = v14;
  }

}

void sub_2134B534C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2134B53CC(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void _simd_slerp_internal(float32x4_t a1, float32x4_t a2, float a3)
{
  float v5;
  float32x4_t v6;
  int8x16_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float v10;
  float v11;
  float v12;

  v5 = 1.0 - a3;
  v6 = vsubq_f32(a1, a2);
  v7 = (int8x16_t)vmulq_f32(v6, v6);
  v8 = vaddq_f32(a1, a2);
  v9 = (int8x16_t)vmulq_f32(v8, v8);
  v10 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)))));
  v11 = v10 + v10;
  if ((float)(v10 + v10) != 0.0)
    sinf(v11);
  if ((float)(v5 * v11) != 0.0)
    sinf(v5 * v11);
  v12 = v11 * a3;
  if (v12 != 0.0)
    sinf(v12);
}

id NUNILoggingObjectForDomain(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (NUNILoggingObjectForDomain_onceToken != -1)
    dispatch_once(&NUNILoggingObjectForDomain_onceToken, &__block_literal_global_1);
  v2 = (void *)NUNILoggingObjectForDomain___logObjects;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

double _LayoutConstants(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_LayoutConstants___cachedDevice, v1);
    _LayoutConstants___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    ___LayoutConstants_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _LayoutConstants___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock);
  v9 = *(double *)&_LayoutConstants_constants_0;

  return v9;
}

uint64_t _NUNIClassicRenderCompareObject(float *a1, float *a2)
{
  if (*a1 < *a2)
    return 1;
  else
    return 0xFFFFFFFFLL;
}

id NUNILoadMtlTextureFromMemory(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BE16F20];
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atlasBackingWithBytes:length:mmapFile:uuid:", a1, a2, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    kdebug_trace();
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v9, "structure");
    objc_msgSend(MEMORY[0x24BE16F48], "sharedDevice");
    objc_claimAutoreleasedReturnValue();
    NUNILoadMtlTextureFromMemory_cold_2();
  }
  NUNILoggingObjectForDomain(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    NUNILoadMtlTextureFromMemory_cold_1((uint64_t)v5, v10);

  return 0;
}

void __destructor_8_AB0s8n4_s0_AE_s32_s40(uint64_t a1)
{
  uint64_t i;

  for (i = 0; i != 32; i += 8)

}

uint64_t _NTKCreateHalfOctahedron(void *a1, float a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  float32x4_t v6;
  float v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float32x4_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float32x4_t *v27;
  float v28;
  float v29;
  float32x4_t v30;
  float v31;
  float32x4_t v32;
  uint64_t v33;
  float32x4_t v34;
  float32x4_t *v35;
  int32x2_t v36;
  float v37;
  float32x4_t v38;
  uint64_t v39;
  float32x4_t v40;
  float32x4_t *v41;
  float v42;
  float32x4_t v43;
  uint64_t v44;
  float32x4_t v45;
  float32x4_t *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  _WORD *i;
  int v56;
  int v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  unsigned int v61;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  float v76;
  float v77;
  float32x4_t v78;
  float32x4_t v79;
  float32_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  uint64_t v84;
  float32x4_t v85;
  float32x4_t v86;
  uint8_t v87[16];
  uint8_t buf[16];

  v65 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 10016);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 3456);
  v64 = objc_retainAutorelease(v2);
  v4 = objc_msgSend(v64, "mutableBytes");
  v63 = objc_retainAutorelease(v3);
  v5 = objc_msgSend(v63, "mutableBytes");
  v6.f32[0] = atan2f(a2, 0.0);
  v7 = a2;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 1.0;
  v15.i64[0] = LODWORD(a2);
  v15.i32[2] = 0;
  v15.i32[3] = 1.0;
  v16 = COERCE_UNSIGNED_INT(fminf(fmaxf((float)(v6.f32[0] + 3.1416) / 6.2832, 0.0), 1.0)) | 0x3F00000000000000;
  *(float32x4_t *)v4 = v15;
  *(_QWORD *)(v4 + 16) = v16;
  v67 = v5;
  v68 = v4;
  *(_QWORD *)(v4 + 24) = 0;
  v17 = 2;
  v18 = 1;
  v19 = 1;
  v66 = v5 + 6;
  do
  {
    v72 = v12;
    v74 = v8;
    v20 = 0;
    v21 = v19;
    v22 = (float)(v17 - 1) / 12.0;
    v70 = v11;
    v23 = 32 * v19;
    v24 = v11 + 32 * v19;
    v6.f32[0] = (float)(v14 - v22) * v7;
    v86 = v6;
    v71 = v10;
    v25 = v10 + 32 * v19;
    v73 = v9;
    v26 = v9 + 32 * v19;
    v75 = v18;
    do
    {
      v27 = (float32x4_t *)(v68 + v23);
      v28 = (float)(int)v20 / (float)((float)(int)v17 + -1.0);
      v29 = v14 - v28;
      v80 = v22 * (float)(v14 - v28);
      v30 = v86;
      v30.f32[1] = v80;
      *(float *)&v16 = v22 * v28;
      v30.i32[2] = v16;
      v15.f32[0] = sqrtf((float)((float)(v80 * v80) + (float)(v86.f32[0] * v86.f32[0]))+ (float)(*(float *)&v16 * *(float *)&v16));
      v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0);
      v84 = v16;
      v79 = vdivq_f32(v30, v82);
      v77 = fminf(fmaxf((float)(atan2f(v79.f32[0], v79.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      v31 = acosf(v79.f32[2]);
      v32 = v79;
      v32.i32[3] = 1.0;
      *(float *)&v33 = v77;
      *((float *)&v33 + 1) = v31 / 3.1416;
      *v27 = v32;
      v27[1].i64[0] = v33;
      v27[1].i64[1] = 0;
      v34 = v86;
      v34.f32[1] = -(float)(v22 * v28);
      v35 = (float32x4_t *)(v68 + v24);
      v34.f32[2] = v80;
      v36 = (int32x2_t)v84;
      *(float *)v36.i32 = sqrtf((float)((float)(*(float *)v36.i32 * *(float *)v36.i32) + (float)(v86.f32[0] * v86.f32[0]))+ (float)(v34.f32[2] * v34.f32[2]));
      v81 = (float32x4_t)vdupq_lane_s32(v36, 0);
      v78 = vdivq_f32(v34, v81);
      v76 = fminf(fmaxf((float)(atan2f(v78.f32[0], v78.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      v37 = acosf(v78.f32[2]);
      v38 = v78;
      v38.i32[3] = 1.0;
      *(float *)&v39 = v76;
      *((float *)&v39 + 1) = v37 / 3.1416;
      v35[2] = v38;
      v35[3].i64[0] = v39;
      v35[3].i64[1] = 0;
      v40 = v86;
      v40.f32[1] = -(float)(v22 * v29);
      v41 = (float32x4_t *)(v68 + v25);
      v40.f32[2] = -(float)(v22 * v28);
      v83 = vdivq_f32(v40, v82);
      v79.i32[0] = fminf(fmaxf((float)(atan2f(v83.f32[0], v83.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      v42 = acosf(v83.f32[2]);
      v43 = v83;
      v43.i32[3] = 1.0;
      LODWORD(v44) = v79.i32[0];
      *((float *)&v44 + 1) = v42 / 3.1416;
      v41[4] = v43;
      v41[5].i64[0] = v44;
      v41[5].i64[1] = 0;
      v45 = v86;
      v45.i32[1] = v84;
      v46 = (float32x4_t *)(v68 + v26);
      v45.f32[2] = -(float)(v22 * v29);
      v85 = vdivq_f32(v45, v81);
      v83.i32[0] = fminf(fmaxf((float)(atan2f(v85.f32[0], v85.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      v6.f32[0] = acosf(v85.f32[2]);
      v14 = 1.0;
      LODWORD(v16) = v83.i32[0];
      v15 = v85;
      v15.i32[3] = 1.0;
      *((float *)&v16 + 1) = v6.f32[0] / 3.1416;
      v46[6] = v15;
      ++v20;
      v23 += 32;
      v46[7].i64[0] = v16;
      v46[7].i64[1] = 0;
      v24 += 32;
      v25 += 32;
      v26 += 32;
    }
    while ((_DWORD)v75 != (_DWORD)v20);
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 4 * v17 - 8;
    v51 = v21;
    v7 = a2;
    do
    {
      v52 = 0;
      v53 = 3 * v13;
      v54 = v67 + 6 * (2 * (v17 - 1) - 1) + 6 * v13++;
      for (i = (_WORD *)(v66 + 2 * v53); ; i += 6)
      {
        if (v17 == 2)
        {
          LOWORD(v56) = 0;
          LOWORD(v57) = 0;
        }
        else
        {
          v56 = v21 - v50 + (v48 + v52) % v50;
          v57 = (unsigned __int16)v21 - v50 + (v48 + v52 + 1) % v50;
        }
        v58 = (v47 + v52 + 1) % (4 * ((int)v17 - 1)) + v21;
        *(i - 3) = v51 + v52;
        if (a2 >= 0.0)
          break;
        *(i - 2) = v58;
        *(i - 1) = v56;
        if ((unint64_t)i >= v54)
          goto LABEL_15;
LABEL_14:
        *i = v56;
        i[1] = v58;
        v13 += 2;
        i[2] = v57;
        ++v52;
      }
      *(i - 2) = v56;
      *(i - 1) = v58;
      if ((unint64_t)i < v54)
      {
        LOWORD(v58) = v57;
        LOWORD(v57) = (v47 + v52 + 1) % (4 * ((int)v17 - 1)) + v21;
        goto LABEL_14;
      }
LABEL_15:
      ++v49;
      v48 += v74;
      v51 += v75;
      v47 += v75;
    }
    while (v49 != 4);
    v19 = v21 + v72 + v20 + 3;
    ++v17;
    v18 = v75 + 1;
    v12 = v72 + 3;
    v11 = v70 + 32;
    v10 = v71 + 64;
    v9 = v73 + 96;
    v8 = v74 + 1;
  }
  while (v17 != 14);
  if (v21 + v12 + v20 != 313)
  {
    NUNILoggingObjectForDomain(0);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2134A1000, v59, OS_LOG_TYPE_DEFAULT, "v not at right position", buf, 2u);
    }

  }
  if (v13 != 576)
  {
    NUNILoggingObjectForDomain(0);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_2134A1000, v60, OS_LOG_TYPE_DEFAULT, "t not at right position", v87, 2u);
    }

  }
  v61 = objc_msgSend(v65, "addIndices:count:vbase:", v67, 1728, objc_msgSend(v65, "addVertices:count:", v68, 313));

  return v61 | 0x6C000000000;
}

void sub_2134BA860(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUNIBundle()
{
  if (NUNIBundle_onceToken != -1)
    dispatch_once(&NUNIBundle_onceToken, &__block_literal_global_2);
  return (id)NUNIBundle___bundle;
}

void sub_2134BC3F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2134BC4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

float UMMul(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8)
{
  return (float)((float)((float)(a4 * a8) - (float)(a1 * a5)) - (float)(a2 * a6)) - (float)(a3 * a7);
}

__n64 UMFloat4x4Make(float a1, float a2, float a3, float a4)
{
  float v4;
  __n64 result;

  v4 = (float)(a1 * (float)(a2 + a2)) + (float)(a4 * (float)(a3 + a3));
  result.n64_f32[0] = 1.0 - (float)((float)(a2 * (float)(a2 + a2)) + (float)(a3 * (float)(a3 + a3)));
  result.n64_f32[1] = v4;
  return result;
}

__n64 UMFloat4x4Make(simd_quatf a1)
{
  return UMFloat4x4Make(a1.vector.f32[0], a1.vector.f32[1], a1.vector.f32[2], a1.vector.f32[3]);
}

float UMFloat4x4MakeOrtho(float a1, float a2, float a3, float a4, float a5, float a6)
{
  float result;

  result = (float)(1.0 / (float)(a2 - a1)) + (float)(1.0 / (float)(a2 - a1));
  __asm { FMOV            V3.4S, #1.0 }
  return result;
}

float UMFloat4x4MakePerspective(float a1, float a2, float a3, float a4)
{
  __float2 v5;

  v5 = __sincosf_stret(a1 * 0.0087266);
  return (float)(v5.__cosval / v5.__sinval) / a2;
}

__n64 UMFloat4x4MakeLookAt(double a1, float a2)
{
  __n64 result;

  result.n64_f32[1] = a2;
  return result;
}

double UMTranslate(float32x4_t a1, double a2, double a3, float32x4_t a4, float a5)
{
  double result;

  *(_QWORD *)&result = vmlaq_n_f32(a1, a4, a5).u64[0];
  return result;
}

double UMFloat4x4MakeTranslate()
{
  return *(double *)&_PromotedConst_0;
}

BOOL UMFloat4x4Equal(simd_float4x4 a1, simd_float4x4 a2)
{
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  _OWORD v6[3];
  simd_float4x4 v7;

  v7 = a1;
  v6[0] = a2.columns[1];
  v6[1] = a2.columns[2];
  v6[2] = a2.columns[3];
  if ((vminvq_u32((uint32x4_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0])) & 0x80000000) == 0)
    return 0;
  v3 = 0;
  do
  {
    v4 = v3;
    if (v3 == 3)
      break;
    v5 = vminvq_u32((uint32x4_t)vceqq_f32((float32x4_t)v7.columns[v3 + 1], (float32x4_t)v6[v3]));
    ++v3;
  }
  while ((v5 & 0x80000000) != 0);
  return v4 > 2;
}

double UMMul(simd_float4x4 a1, simd_float4x4 a2)
{
  double result;

  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)a1.columns[1], *(float32x2_t *)a2.columns[0].f32, 1), (float32x4_t)a1.columns[0], a2.columns[0].f32[0]), (float32x4_t)a1.columns[2], (float32x4_t)a2.columns[0], 2), (float32x4_t)a1.columns[3], (float32x4_t)a2.columns[0], 3).u64[0];
  return result;
}

double UMMul(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  double result;

  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(a2, *(float32x2_t *)a5.f32, 1), a1, a5.f32[0]), a3, a5, 2), a4, a5, 3).u64[0];
  return result;
}

float UMQuaternionMake(float a1, float a2, float a3)
{
  __float2 v5;
  __float2 v6;
  __float2 v7;

  v5 = __sincosf_stret(a1 * 0.5);
  v6 = __sincosf_stret(a2 * 0.5);
  v7 = __sincosf_stret(a3 * 0.5);
  return (float)(v5.__sinval * (float)(v6.__cosval * v7.__cosval))
       - (float)((float)(v6.__sinval * v7.__sinval) * v5.__cosval);
}

double UMFloat4x4MakeRotateX(float a1)
{
  __sincosf_stret(a1);
  return *(double *)&_PromotedConst_1;
}

double UMFloat4x4MakeRotateZ(float a1)
{
  __float2 v1;
  double v2;

  v1 = __sincosf_stret(a1);
  *(float *)&v2 = v1.__cosval;
  *((float *)&v2 + 1) = -v1.__sinval;
  return v2;
}

float UMSlerp(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9)
{
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v25;
  float v26;

  v18 = a9;
  if (a9 <= 0.0)
    return a1;
  v19 = a5;
  if (a9 < 1.0)
  {
    v20 = (float)((float)((float)(a2 * a6) + (float)(a1 * a5)) + (float)(a3 * a7)) + (float)(a4 * a8);
    if (v20 < 0.0)
    {
      v19 = -a5;
      v20 = -v20;
    }
    if (v20 <= 0.999)
    {
      v22 = sqrtf(1.0 - (float)(v20 * v20));
      v25 = atan2f(v22, v20);
      v26 = 1.0 / v22;
      v23 = (1.0 - a9) * v25;
      v21 = (float)(1.0 / v22) * sinf(v23);
      v18 = v26 * sinf(v25 * a9);
    }
    else
    {
      v21 = 1.0 - a9;
    }
    return (float)(v19 * v18) + (float)(v21 * a1);
  }
  return v19;
}

float UMQuaternionMake(int32x4_t a1, int32x4_t a2, float32x4_t a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v10;
  unsigned __int32 v11;
  float v12;

  v3 = (float)((float)(*(float *)a1.i32 + *(float *)&a2.i32[1]) + a3.f32[2]) + 1.0;
  if (v3 <= 0.0001)
  {
    if (*(float *)a1.i32 <= *(float *)&a2.i32[1] || *(float *)a1.i32 <= a3.f32[2])
    {
      if (*(float *)&a2.i32[1] <= a3.f32[2])
      {
        v10 = 0.5 / sqrtf((float)((float)(a3.f32[2] + 1.0) - *(float *)a1.i32) - *(float *)&a2.i32[1]);
        v6 = v10 * vaddq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).f32[0];
        v7 = vmuls_lane_f32(v10, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a2, 2), a3), 1);
        v8 = 0.25 / v10;
        v11 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a2).u32[0];
      }
      else
      {
        v10 = 0.5 / sqrtf((float)((float)(*(float *)&a2.i32[1] + 1.0) - *(float *)a1.i32) - a3.f32[2]);
        v6 = v10 * vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a2).f32[0];
        v7 = 0.25 / v10;
        v8 = vmuls_lane_f32(v10, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a2, 2), a3), 1);
        v11 = vsubq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).u32[0];
      }
      v5 = v10 * *(float *)&v11;
    }
    else
    {
      v12 = 0.5 / sqrtf((float)((float)(*(float *)a1.i32 + 1.0) - *(float *)&a2.i32[1]) - a3.f32[2]);
      v6 = 0.25 / v12;
      v7 = v12 * vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a2).f32[0];
      v8 = v12 * vaddq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).f32[0];
      v5 = vmuls_lane_f32(v12, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32(a2, 2), a3), 1);
    }
  }
  else
  {
    v4 = 0.5 / sqrtf(v3);
    v5 = 0.25 / v4;
    v6 = vmuls_lane_f32(v4, (float32x2_t)*(_OWORD *)&vsubq_f32(a3, (float32x4_t)vdupq_laneq_s32(a2, 2)), 1);
    v7 = v4 * vsubq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).f32[0];
    v8 = v4 * vsubq_f32((float32x4_t)a2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1)).f32[0];
  }
  return v6 / sqrtf((float)((float)((float)(v7 * v7) + (float)(v6 * v6)) + (float)(v8 * v8)) + (float)(v5 * v5));
}

id _NUNAegirCreateTexture(void *a1, int a2, int a3, int a4, uint64_t a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;

  v9 = a1;
  if (a5)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setTextureType:", 2);
    objc_msgSend(v10, "setWidth:", a2);
    objc_msgSend(v10, "setHeight:", a3);
    objc_msgSend(v10, "setDepth:", 1);
    objc_msgSend(v10, "setPixelFormat:", a5);
    objc_msgSend(v10, "setUsage:", 5);
    objc_msgSend(v10, "setResourceOptions:", 32);
    if (a4 >= 2)
      objc_msgSend(v10, "setMipmapLevelCount:", a4);
    v11 = (void *)objc_msgSend(v9, "newTextureWithDescriptor:", v10);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      NUNILoggingObjectForDomain(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        _NUNAegirCreateTexture_cold_1(v14);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t _NUNIAegirRenderCompareObject(float *a1, float *a2)
{
  if (*a1 < *a2)
    return 1;
  else
    return 0xFFFFFFFFLL;
}

double NUNIAstronomyAddLocationCoordinates(double a1, double a2, double a3)
{
  return a1 + a3;
}

float NUNIAstronomyClampLatitude(float a1)
{
  float result;

  result = 80.0;
  if (a1 <= 80.0)
  {
    result = a1;
    if (a1 < -80.0)
      return -80.0;
  }
  return result;
}

double _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(double result, double a2, double a3, double a4)
{
  double i;
  double j;

  for (; a2 > a4 + 180.0; a2 = a2 + -360.0)
    ;
  for (i = a4 + -180.0; a2 < i; a2 = a2 + 360.0)
    ;
  for (; result > a3 + 180.0; result = result + -360.0)
    ;
  for (j = a3 + -180.0; result < j; result = result + 360.0)
    ;
  return result;
}

uint64_t sub_2134C09D0()
{
  uint64_t v0;

  v0 = sub_2134D8EC0();
  __swift_allocate_value_buffer(v0, qword_253F00AB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_253F00AB0);
  return sub_2134D8EB4();
}

uint64_t sub_2134C0A48(uint64_t a1, uint64_t a2)
{
  return sub_2134C0B10(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2134C0A54()
{
  sub_2134D9004();
  sub_2134D9010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134C0A94()
{
  uint64_t v0;

  sub_2134D9004();
  sub_2134D9298();
  sub_2134D9010();
  v0 = sub_2134D92B0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2134C0B04(uint64_t a1, uint64_t a2)
{
  return sub_2134C0B10(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2134C0B10(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2134D9004();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2134C0B4C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2134D8FEC();
  *a2 = 0;
  return result;
}

uint64_t sub_2134C0BC0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2134D8FF8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2134C0C3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2134D9004();
  v2 = sub_2134D8FE0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2134C0C7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2134D9004();
  v2 = v1;
  if (v0 == sub_2134D9004() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2134D9238();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2134C0D04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2134D8FE0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2134C0D48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2134D9004();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for FileAttributeKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254B9EE18)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B9EE18);
  }
}

uint64_t sub_2134C0DC4()
{
  sub_2134C0E9C(&qword_254B9EE38, (uint64_t)&unk_2134F9E58);
  sub_2134C0E9C((unint64_t *)&unk_254B9EE40, (uint64_t)&unk_2134F9DAC);
  return sub_2134D9208();
}

uint64_t sub_2134C0E30()
{
  return sub_2134C0E9C(&qword_254B9EE20, (uint64_t)&unk_2134F9D70);
}

uint64_t sub_2134C0E54()
{
  return sub_2134C0E9C(&qword_254B9EE28, (uint64_t)&unk_2134F9D44);
}

uint64_t sub_2134C0E78()
{
  return sub_2134C0E9C(&qword_254B9EE30, (uint64_t)&unk_2134F9DE0);
}

uint64_t sub_2134C0E9C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for FileAttributeKey();
    result = MEMORY[0x2199B50C4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_2134C0EDC()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  qword_253F00AD0 = (uint64_t)result;
  return result;
}

char *sub_2134C0F14()
{
  void *v0;
  uint64_t inited;
  id v2;
  unint64_t v3;
  id v4;
  char *result;

  if (qword_253F006A8 != -1)
    swift_once();
  v0 = (void *)qword_253F00AD0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F00800);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2134F9EA0;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x80000002134FB870;
  *(_QWORD *)(inited + 48) = 0x4043000000000000;
  *(_QWORD *)(inited + 56) = 0xD000000000000012;
  *(_QWORD *)(inited + 64) = 0x80000002134FB890;
  *(_QWORD *)(inited + 72) = 0x4034000000000000;
  *(_QWORD *)(inited + 80) = 0xD000000000000013;
  *(_QWORD *)(inited + 88) = 0x80000002134FB8B0;
  *(_QWORD *)(inited + 96) = 0x4042800000000000;
  *(_QWORD *)(inited + 104) = 0xD000000000000010;
  *(_QWORD *)(inited + 112) = 0x80000002134FB8D0;
  *(_QWORD *)(inited + 120) = 0x4000000000000000;
  *(_QWORD *)(inited + 128) = 0xD000000000000018;
  *(_QWORD *)(inited + 136) = 0x80000002134FB8F0;
  *(_QWORD *)(inited + 144) = 0x401C000000000000;
  *(_QWORD *)(inited + 152) = 0xD000000000000017;
  *(_QWORD *)(inited + 160) = 0x80000002134FB910;
  *(_QWORD *)(inited + 168) = 0x4039000000000000;
  strcpy((char *)(inited + 176), "AegirSunExpMin");
  *(_BYTE *)(inited + 191) = -18;
  *(_QWORD *)(inited + 192) = 0x4049000000000000;
  *(_QWORD *)(inited + 200) = 0xD000000000000010;
  *(_QWORD *)(inited + 208) = 0x80000002134FB950;
  *(_QWORD *)(inited + 216) = 0x4055800000000000;
  *(_QWORD *)(inited + 224) = 0xD000000000000012;
  *(_QWORD *)(inited + 232) = 0x80000002134FB970;
  *(_QWORD *)(inited + 240) = 0x4050800000000000;
  *(_QWORD *)(inited + 248) = 0xD000000000000011;
  *(_QWORD *)(inited + 256) = 0x80000002134FB990;
  *(_QWORD *)(inited + 264) = 0x4045800000000000;
  *(_QWORD *)(inited + 272) = 0xD000000000000014;
  *(_QWORD *)(inited + 280) = 0x80000002134FB9B0;
  *(_QWORD *)(inited + 288) = 0x4034000000000000;
  *(_QWORD *)(inited + 296) = 0xD000000000000017;
  *(_QWORD *)(inited + 304) = 0x80000002134FB9D0;
  *(_QWORD *)(inited + 312) = 0x4051000000000000;
  *(_QWORD *)(inited + 320) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 328) = 0x80000002134FB9F0;
  *(_QWORD *)(inited + 336) = 0x4032000000000000;
  *(_QWORD *)(inited + 344) = 0xD000000000000019;
  *(_QWORD *)(inited + 352) = 0x80000002134FBA10;
  *(_QWORD *)(inited + 360) = 0x4049000000000000;
  *(_QWORD *)(inited + 368) = 0xD000000000000020;
  *(_QWORD *)(inited + 376) = 0x80000002134FBA30;
  *(_QWORD *)(inited + 384) = 0x4018000000000000;
  *(_QWORD *)(inited + 392) = 0xD000000000000019;
  *(_QWORD *)(inited + 400) = 0x80000002134FBA60;
  *(_QWORD *)(inited + 408) = 0x4059000000000000;
  *(_QWORD *)(inited + 416) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 424) = 0x80000002134FBA80;
  *(_QWORD *)(inited + 432) = 0x4044000000000000;
  *(_QWORD *)(inited + 440) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 448) = 0x80000002134FBAA0;
  *(_QWORD *)(inited + 456) = 0;
  *(_QWORD *)(inited + 464) = 0xD00000000000001ELL;
  *(_QWORD *)(inited + 472) = 0x80000002134FBAC0;
  *(_QWORD *)(inited + 480) = 0x4049000000000000;
  *(_QWORD *)(inited + 488) = 0xD00000000000001DLL;
  *(_QWORD *)(inited + 496) = 0x80000002134FBAE0;
  *(_QWORD *)(inited + 504) = 0x4052C00000000000;
  *(_QWORD *)(inited + 512) = 0xD00000000000001DLL;
  *(_QWORD *)(inited + 520) = 0x80000002134FBB00;
  *(_QWORD *)(inited + 528) = 0;
  *(_QWORD *)(inited + 536) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 544) = 0x80000002134FBB20;
  *(_QWORD *)(inited + 552) = 0x4050000000000000;
  *(_QWORD *)(inited + 560) = 0xD00000000000001ELL;
  *(_QWORD *)(inited + 568) = 0x80000002134FBB40;
  *(_QWORD *)(inited + 576) = 0x4000000000000000;
  *(_QWORD *)(inited + 584) = 0xD000000000000014;
  *(_QWORD *)(inited + 592) = 0x80000002134FBB60;
  *(_QWORD *)(inited + 600) = 0x403E000000000000;
  *(_QWORD *)(inited + 608) = 0xD000000000000017;
  *(_QWORD *)(inited + 616) = 0x80000002134FBB80;
  *(_QWORD *)(inited + 624) = 0x4000000000000000;
  *(_QWORD *)(inited + 632) = 0xD000000000000019;
  *(_QWORD *)(inited + 640) = 0x80000002134FBBA0;
  *(_QWORD *)(inited + 648) = 0x4046000000000000;
  *(_QWORD *)(inited + 656) = 0xD000000000000018;
  *(_QWORD *)(inited + 664) = 0x80000002134FBBC0;
  *(_QWORD *)(inited + 672) = 0x4055800000000000;
  *(_QWORD *)(inited + 680) = 0xD00000000000001CLL;
  *(_QWORD *)(inited + 688) = 0x80000002134FBBE0;
  *(_QWORD *)(inited + 696) = 0x404E000000000000;
  *(_QWORD *)(inited + 704) = 0xD00000000000001ELL;
  *(_QWORD *)(inited + 712) = 0x80000002134FBC00;
  *(_QWORD *)(inited + 720) = 0x4049000000000000;
  *(_QWORD *)(inited + 728) = 0xD000000000000026;
  *(_QWORD *)(inited + 736) = 0x80000002134FBC20;
  *(_QWORD *)(inited + 744) = 0x403E000000000000;
  *(_QWORD *)(inited + 752) = 0xD000000000000024;
  *(_QWORD *)(inited + 760) = 0x80000002134FBC50;
  *(_QWORD *)(inited + 768) = 0x4049000000000000;
  *(_QWORD *)(inited + 776) = 0xD000000000000013;
  *(_QWORD *)(inited + 784) = 0x80000002134FBC80;
  *(_QWORD *)(inited + 792) = 0x402E000000000000;
  *(_QWORD *)(inited + 800) = 0xD000000000000016;
  *(_QWORD *)(inited + 808) = 0x80000002134FBCA0;
  *(_QWORD *)(inited + 816) = 0x4051000000000000;
  *(_QWORD *)(inited + 824) = 0xD000000000000019;
  *(_QWORD *)(inited + 832) = 0x80000002134FBCC0;
  *(_QWORD *)(inited + 840) = 0x4042800000000000;
  *(_QWORD *)(inited + 848) = 0xD00000000000001FLL;
  *(_QWORD *)(inited + 856) = 0x80000002134FBCE0;
  *(_QWORD *)(inited + 864) = 0x402E000000000000;
  v2 = v0;
  v3 = sub_2134C21AC(inited);
  v4 = objc_allocWithZone((Class)type metadata accessor for PreferencePane());
  result = PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(0xD000000000000014, 0x80000002134FB930, v0, v3, MEMORY[0x24BEE4B00], MEMORY[0x24BEE4B00], MEMORY[0x24BEE4B00]);
  qword_253F00818 = (uint64_t)result;
  return result;
}

id static PreferencePane.aegirRenderingPreferencePane.getter()
{
  if (qword_253F00840 != -1)
    swift_once();
  return (id)qword_253F00818;
}

NSNumber_optional __swiftcall PreferencePane.fractionValue(forOption:)(Swift::String forOption)
{
  double v1;
  Swift::Bool v2;
  objc_class *v3;
  NSNumber_optional result;

  v1 = COERCE_DOUBLE(sub_2134C4BDC(forOption._countAndFlagsBits, (uint64_t)forOption._object));
  if (v2)
    v3 = 0;
  else
    v3 = (objc_class *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v1 / 100.0);
  result.value.super.super.isa = v3;
  result.is_nil = v2;
  return result;
}

uint64_t AegirAuthentication.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_2134D8E84();
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_2134D8E78();
  return v0;
}

uint64_t AegirAuthentication.init()()
{
  uint64_t v0;

  sub_2134D8E84();
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_2134D8E78();
  return v0;
}

uint64_t sub_2134C1614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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

  v36 = a6;
  v33 = a5;
  v34 = a7;
  v35 = a4;
  v31 = a2;
  v32 = a3;
  v30 = a1;
  v7 = sub_2134D8E60();
  v28 = *(_QWORD *)(v7 - 8);
  v29 = v7;
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2134D8E18();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2134D8E48();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_2134D8E9C();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v23);
  v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v31, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v32, v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2134D8E90();
  sub_2134D8E6C();
  sub_2134D8E54();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v29);
  sub_2134D8D4C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v25, v21);
}

uint64_t AegirAuthentication.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t AegirAuthentication.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2134C1A0C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2134C1A1C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2134C1A50(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2134C1A70(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2134C1AE0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2134D9148();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2134C1AE0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2134C1BB0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2134C2170((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2134C2170((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2134C1BB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2134D9154();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2134C1D68(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2134D91B4();
  if (!v8)
  {
    sub_2134D91C0();
    __break(1u);
LABEL_17:
    result = sub_2134D91FC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2134C1D68(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2134C1DFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2134C1FD4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2134C1FD4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2134C1DFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2134C1F70(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2134D919C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2134D91C0();
      __break(1u);
LABEL_10:
      v2 = sub_2134D9028();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2134D91FC();
    __break(1u);
LABEL_14:
    result = sub_2134D91C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2134C1F70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F00808);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2134C1FD4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F00808);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2134D91FC();
  __break(1u);
  return result;
}

_BYTE **sub_2134C2120(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for AegirAuthentication()
{
  return objc_opt_self();
}

uint64_t method lookup function for AegirAuthentication()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AegirAuthentication.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AegirAuthentication.addSignature(to:date:url:httpMethod:apiKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_2134C2170(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2134C21AC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F007D8);
  v2 = (_QWORD *)sub_2134D91F0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2134C5C04(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_2134C22BC()
{
  void *v0;
  id v1;
  unint64_t v2;
  id v3;
  char *result;

  if (qword_253F006A8 != -1)
    swift_once();
  v0 = (void *)qword_253F00AD0;
  v1 = (id)qword_253F00AD0;
  v2 = sub_2134C21AC((uint64_t)&unk_24CFD8380);
  v3 = objc_allocWithZone((Class)type metadata accessor for PreferencePane());
  result = PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(0xD000000000000014, 0x80000002134FB930, v0, v2, MEMORY[0x24BEE4B00], MEMORY[0x24BEE4B00], MEMORY[0x24BEE4B00]);
  qword_253F00688 = (uint64_t)result;
  return result;
}

id static PreferencePane.calliopeRenderingPreferencePane.getter()
{
  if (qword_253F00698 != -1)
    swift_once();
  return (id)qword_253F00688;
}

char *PreferencePane.__allocating_init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_2134C24F4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2134C25E4()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_2134D8F20();
}

uint64_t sub_2134C2658@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2134C26D4(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_2134D8F20();
}

void (*sub_2134C2750(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2134D8F08();
  return sub_2134C27C8;
}

void sub_2134C27C8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_2134C2814()
{
  return sub_2134C2F08((uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name, &qword_254B9EF10);
}

uint64_t sub_2134C2828(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF18);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF10);
  sub_2134D8EFC();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_2134C28FC(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF18);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF10);
  sub_2134D8EF0();
  swift_endAccess();
  return sub_2134C29C4;
}

void sub_2134C29C4(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_2134D8EFC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_2134D8EFC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_2134C2B88()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2134C2C80@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2134C2CFC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_2134D8F20();
}

uint64_t sub_2134C2D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_2134D8EF0();
  return swift_endAccess();
}

uint64_t sub_2134C2DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = (char *)&v20 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v18((char *)&v20 - v16, a1, v9);
  v18(v14, (uint64_t)v17, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2134D8EFC();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v17, v9);
}

uint64_t sub_2134C2EF4()
{
  return sub_2134C2F08((uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes, (uint64_t *)&unk_253F00778);
}

uint64_t sub_2134C2F08(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_2134D8EF0();
  return swift_endAccess();
}

uint64_t sub_2134C2FB0()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2134C303C(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_2134C3084())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2134C30D4()
{
  return sub_2134C3490();
}

uint64_t sub_2134C30EC(uint64_t a1)
{
  return sub_2134C3570(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders);
}

uint64_t (*sub_2134C30F8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2134C3148()
{
  return sub_2134C3490();
}

uint64_t sub_2134C3160(uint64_t a1)
{
  return sub_2134C3570(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles);
}

uint64_t (*sub_2134C316C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_2134C31BC()
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_2134D9034();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2134C3220()
{
  return sub_2134C3490();
}

uint64_t sub_2134C3238(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t *v7;

  v6 = sub_2134D9040();
  v7 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v7 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134C32A4(uint64_t a1)
{
  return sub_2134C3570(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections);
}

uint64_t (*sub_2134C32B0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2134C3308()
{
  return sub_2134C3490();
}

uint64_t sub_2134C3328(uint64_t a1)
{
  return sub_2134C3570(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
}

uint64_t (*sub_2134C3334())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2134C338C()
{
  return sub_2134C3490();
}

uint64_t sub_2134C33AC(uint64_t a1)
{
  return sub_2134C3570(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
}

uint64_t (*sub_2134C33B8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_2134C3410()
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_2134D8FB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2134C3484()
{
  return sub_2134C3490();
}

uint64_t sub_2134C3490()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2134C34E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t *v8;

  v7 = sub_2134D8FBC();
  v8 = (uint64_t *)(a1 + *a5);
  swift_beginAccess();
  *v8 = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134C3564(uint64_t a1)
{
  return sub_2134C3570(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
}

uint64_t sub_2134C3570(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134C35BC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2134C3620())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2134C36F4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2134C37C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134C3810(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2134C3878())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2134C3904()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  return MEMORY[0x2199B519C](v1);
}

uint64_t sub_2134C399C()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_2134C39F4(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199B519C](v5);
  return sub_2134C3A64;
}

void sub_2134C3A64(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_2134C3AD0(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_2134C3B30()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_2134C3B7C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_2134C3BCC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PreferencePane.__allocating_init(name:panes:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return PreferencePane.init(name:panes:)(a1, a2, a3);
}

uint64_t PreferencePane.init(name:panes:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v4 = v3;
  v6 = (void *)sub_2134D8FE0();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2134D8FB0();
  v8 = (void *)sub_2134D8FB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF20);
  v9 = (void *)sub_2134D8FB0();
  v10 = (void *)sub_2134D8FB0();
  v11 = objc_msgSend(v4, sel_initWithName_userDefaults_sliders_toggles_pickerOptions_pickerSelections_, v6, 0, v7, v8, v9, v10);

  swift_getKeyPath();
  swift_getKeyPath();
  v17 = a3;
  v12 = v11;
  sub_2134D8F20();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  result = swift_release();
  if (!v17)
    goto LABEL_12;
  if (!(v17 >> 62))
  {
    v14 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14)
      goto LABEL_4;
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:

    return (uint64_t)v12;
  }
  swift_bridgeObjectRetain();
  v14 = sub_2134D91CC();
  result = swift_bridgeObjectRelease();
  if (!v14)
    goto LABEL_11;
LABEL_4:
  if (v14 >= 1)
  {
    if ((v17 & 0xC000000000000001) != 0)
    {
      v15 = 0;
      do
      {
        MEMORY[0x2199B47F4](v15++, v17);
        swift_beginAccess();
        swift_unknownObjectWeakAssign();
        swift_unknownObjectRelease();
      }
      while (v14 != v15);
    }
    else
    {
      v16 = v17 + 32;
      do
      {
        v16 += 8;
        swift_beginAccess();
        swift_unknownObjectWeakAssign();
        --v14;
      }
      while (v14);
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

char *PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void **v19;
  void *v20;
  id v21;
  objc_class *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  objc_super v34;
  uint64_t v35;
  uint64_t v36;

  v30 = a7;
  v31 = a6;
  v29 = a5;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F00778);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &v7[OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes];
  v33[0] = 0;
  v17 = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F00790);
  sub_2134D8EE4();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  *(_DWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence] = 0;
  v18 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles] = v18;
  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections] = v18;
  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions] = 0;
  swift_unknownObjectWeakInit();
  v19 = (void **)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults];
  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults] = 0;
  swift_beginAccess();
  v35 = a1;
  v36 = a2;
  sub_2134D8EE4();
  swift_endAccess();
  swift_beginAccess();
  v20 = *v19;
  *v19 = a3;
  v21 = a3;

  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders] = a4;
  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles] = v29;
  *(_QWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections] = v30;

  v22 = (objc_class *)type metadata accessor for PreferencePane();
  v34.receiver = v17;
  v34.super_class = v22;
  v23 = (char *)objc_msgSendSuper2(&v34, sel_init);
  sub_2134C5030(0x704F72656B636970, 0xED0000736E6F6974, (uint64_t)v33);
  if (!v33[3])
  {
    sub_2134C52FC((uint64_t)v33);
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9EF28);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v26 = &v23[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions];
    swift_beginAccess();
    *(_QWORD *)v26 = v31;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  v24 = v32;
  v25 = &v23[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions];
  swift_beginAccess();
  *(_QWORD *)v25 = v24;
LABEL_6:
  swift_bridgeObjectRelease();
  sub_2134C4398(0);

  return v23;
}

uint64_t type metadata accessor for PreferencePane()
{
  uint64_t result;

  result = qword_253F006C0;
  if (!qword_253F006C0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2134C4398(char a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id *v10;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  id v25;
  void *v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int64_t v33;
  unint64_t v34;
  unint64_t j;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  id v47;
  void *v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  int64_t v55;
  unint64_t v56;
  unint64_t k;
  int64_t v58;
  unint64_t v59;
  int64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  char v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int64_t v74;
  int64_t v75;
  int64_t v76;
  id *v78;

  v2 = v1;
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders);
  swift_beginAccess();
  *v3 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
  swift_beginAccess();
  v5 = *v4;
  v6 = (_QWORD *)(*v4 + 64);
  v7 = 1 << *(_BYTE *)(*v4 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *v6;
  v71 = v2;
  v10 = (id *)(v2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_bridgeObjectRetain();
  v78 = v10;
  swift_beginAccess();
  v11 = 0;
  v74 = (unint64_t)(v7 + 63) >> 6;
  if (v9)
    goto LABEL_6;
LABEL_7:
  v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  if (v14 < v74)
  {
    v15 = v6[v14];
    ++v11;
    if (v15)
      goto LABEL_20;
    v11 = v14 + 1;
    if (v14 + 1 >= v74)
      goto LABEL_29;
    v15 = v6[v11];
    if (v15)
      goto LABEL_20;
    v11 = v14 + 2;
    if (v14 + 2 >= v74)
      goto LABEL_29;
    v15 = v6[v11];
    if (v15)
    {
LABEL_20:
      v9 = (v15 - 1) & v15;
      for (i = __clz(__rbit64(v15)) + (v11 << 6); ; i = v12 | (v11 << 6))
      {
        v17 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
        v19 = *v17;
        v18 = v17[1];
        swift_beginAccess();
        v20 = (_QWORD *)*v3;
        swift_bridgeObjectRetain_n();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v3 = v20;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v20 = sub_2134D23CC(0, v20[2] + 1, 1, v20);
          *v3 = v20;
        }
        v23 = v20[2];
        v22 = v20[3];
        if (v23 >= v22 >> 1)
        {
          v20 = sub_2134D23CC((_QWORD *)(v22 > 1), v23 + 1, 1, v20);
          *v3 = v20;
        }
        v20[2] = v23 + 1;
        v24 = &v20[2 * v23];
        v24[4] = v19;
        v24[5] = v18;
        swift_endAccess();
        if ((a1 & 1) != 0 && *v78)
        {
          v25 = *v78;
          v26 = (void *)sub_2134D8FE0();
          swift_bridgeObjectRelease();
          objc_msgSend(v25, sel_removeObjectForKey_, v26);

          if (!v9)
            goto LABEL_7;
        }
        else
        {
          swift_bridgeObjectRelease();
          if (!v9)
            goto LABEL_7;
        }
LABEL_6:
        v12 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
      }
    }
    v16 = v14 + 3;
    if (v16 < v74)
    {
      v15 = v6[v16];
      if (v15)
      {
        v11 = v16;
        goto LABEL_20;
      }
      while (1)
      {
        v11 = v16 + 1;
        if (__OFADD__(v16, 1))
          goto LABEL_89;
        if (v11 >= v74)
          break;
        v15 = v6[v11];
        ++v16;
        if (v15)
          goto LABEL_20;
      }
    }
  }
LABEL_29:
  swift_release();
  v27 = (_QWORD *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles);
  swift_beginAccess();
  *v27 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v28 = (uint64_t *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
  swift_beginAccess();
  v29 = *v28;
  v72 = v29 + 64;
  v30 = 1 << *(_BYTE *)(v29 + 32);
  v31 = -1;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  v32 = v31 & *(_QWORD *)(v29 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  v33 = 0;
  v75 = (unint64_t)(v30 + 63) >> 6;
  if (v32)
    goto LABEL_34;
LABEL_35:
  v36 = v33 + 1;
  if (__OFADD__(v33, 1))
    goto LABEL_87;
  if (v36 < v75)
  {
    v37 = *(_QWORD *)(v72 + 8 * v36);
    ++v33;
    if (v37)
      goto LABEL_48;
    v33 = v36 + 1;
    if (v36 + 1 < v75)
    {
      v37 = *(_QWORD *)(v72 + 8 * v33);
      if (v37)
        goto LABEL_48;
      v33 = v36 + 2;
      if (v36 + 2 < v75)
      {
        v37 = *(_QWORD *)(v72 + 8 * v33);
        if (v37)
          goto LABEL_48;
        v38 = v36 + 3;
        if (v38 < v75)
        {
          v37 = *(_QWORD *)(v72 + 8 * v38);
          if (!v37)
          {
            while (1)
            {
              v33 = v38 + 1;
              if (__OFADD__(v38, 1))
                goto LABEL_90;
              if (v33 >= v75)
                goto LABEL_57;
              v37 = *(_QWORD *)(v72 + 8 * v33);
              ++v38;
              if (v37)
                goto LABEL_48;
            }
          }
          v33 = v38;
LABEL_48:
          v32 = (v37 - 1) & v37;
          for (j = __clz(__rbit64(v37)) + (v33 << 6); ; j = v34 | (v33 << 6))
          {
            v39 = (uint64_t *)(*(_QWORD *)(v29 + 48) + 16 * j);
            v41 = *v39;
            v40 = v39[1];
            swift_beginAccess();
            v42 = (_QWORD *)*v27;
            swift_bridgeObjectRetain_n();
            v43 = swift_isUniquelyReferenced_nonNull_native();
            *v27 = v42;
            if ((v43 & 1) == 0)
            {
              v42 = sub_2134D23CC(0, v42[2] + 1, 1, v42);
              *v27 = v42;
            }
            v45 = v42[2];
            v44 = v42[3];
            if (v45 >= v44 >> 1)
            {
              v42 = sub_2134D23CC((_QWORD *)(v44 > 1), v45 + 1, 1, v42);
              *v27 = v42;
            }
            v42[2] = v45 + 1;
            v46 = &v42[2 * v45];
            v46[4] = v41;
            v46[5] = v40;
            swift_endAccess();
            if ((a1 & 1) != 0 && *v78)
            {
              v47 = *v78;
              v48 = (void *)sub_2134D8FE0();
              swift_bridgeObjectRelease();
              objc_msgSend(v47, sel_removeObjectForKey_, v48);

              if (!v32)
                goto LABEL_35;
            }
            else
            {
              swift_bridgeObjectRelease();
              if (!v32)
                goto LABEL_35;
            }
LABEL_34:
            v34 = __clz(__rbit64(v32));
            v32 &= v32 - 1;
          }
        }
      }
    }
  }
LABEL_57:
  swift_release();
  v49 = (_QWORD *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections);
  swift_beginAccess();
  *v49 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v50 = (uint64_t *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
  swift_beginAccess();
  v51 = *v50;
  v73 = v51 + 64;
  v52 = 1 << *(_BYTE *)(v51 + 32);
  v53 = -1;
  if (v52 < 64)
    v53 = ~(-1 << v52);
  v54 = v53 & *(_QWORD *)(v51 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  v55 = 0;
  v76 = (unint64_t)(v52 + 63) >> 6;
  if (v54)
    goto LABEL_62;
LABEL_63:
  v58 = v55 + 1;
  if (!__OFADD__(v55, 1))
  {
    if (v58 < v76)
    {
      v59 = *(_QWORD *)(v73 + 8 * v58);
      ++v55;
      if (v59)
        goto LABEL_76;
      v55 = v58 + 1;
      if (v58 + 1 < v76)
      {
        v59 = *(_QWORD *)(v73 + 8 * v55);
        if (v59)
          goto LABEL_76;
        v55 = v58 + 2;
        if (v58 + 2 < v76)
        {
          v59 = *(_QWORD *)(v73 + 8 * v55);
          if (v59)
            goto LABEL_76;
          v60 = v58 + 3;
          if (v60 < v76)
          {
            v59 = *(_QWORD *)(v73 + 8 * v60);
            if (!v59)
            {
              while (1)
              {
                v55 = v60 + 1;
                if (__OFADD__(v60, 1))
                  goto LABEL_91;
                if (v55 >= v76)
                  goto LABEL_85;
                v59 = *(_QWORD *)(v73 + 8 * v55);
                ++v60;
                if (v59)
                  goto LABEL_76;
              }
            }
            v55 = v60;
LABEL_76:
            v54 = (v59 - 1) & v59;
            for (k = __clz(__rbit64(v59)) + (v55 << 6); ; k = v56 | (v55 << 6))
            {
              v61 = (uint64_t *)(*(_QWORD *)(v51 + 48) + 16 * k);
              v63 = *v61;
              v62 = v61[1];
              swift_beginAccess();
              v64 = (_QWORD *)*v49;
              swift_bridgeObjectRetain_n();
              v65 = swift_isUniquelyReferenced_nonNull_native();
              *v49 = v64;
              if ((v65 & 1) == 0)
              {
                v64 = sub_2134D23CC(0, v64[2] + 1, 1, v64);
                *v49 = v64;
              }
              v67 = v64[2];
              v66 = v64[3];
              if (v67 >= v66 >> 1)
              {
                v64 = sub_2134D23CC((_QWORD *)(v66 > 1), v67 + 1, 1, v64);
                *v49 = v64;
              }
              v64[2] = v67 + 1;
              v68 = &v64[2 * v67];
              v68[4] = v63;
              v68[5] = v62;
              swift_endAccess();
              if ((a1 & 1) != 0 && *v78)
              {
                v69 = *v78;
                v70 = (void *)sub_2134D8FE0();
                swift_bridgeObjectRelease();
                objc_msgSend(v69, sel_removeObjectForKey_, v70);

                if (!v54)
                  goto LABEL_63;
              }
              else
              {
                swift_bridgeObjectRelease();
                if (!v54)
                  goto LABEL_63;
              }
LABEL_62:
              v56 = __clz(__rbit64(v54));
              v54 &= v54 - 1;
            }
          }
        }
      }
    }
LABEL_85:
    swift_release();
    return;
  }
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
}

uint64_t sub_2134C4BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];

  sub_2134C5030(a1, a2, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast())
      return v10;
  }
  else
  {
    sub_2134C52FC((uint64_t)v11);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  result = swift_release();
  v6 = v11[0];
  if (!v11[0])
    return 0;
  if (!(v11[0] >> 62))
  {
    if (*(_QWORD *)((v11[0] & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v9 = sub_2134D91CC();
  result = swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_8:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x2199B47F4](0, v6);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v6 + 32);
LABEL_11:
    v8 = v7;
    swift_bridgeObjectRelease();
    v4 = sub_2134C4BDC(a1, a2);

    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2134C4D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  _QWORD v11[4];

  sub_2134C5030(a1, a2, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast())
      return v10;
  }
  else
  {
    sub_2134C52FC((uint64_t)v11);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  result = swift_release();
  v6 = v11[0];
  if (!v11[0])
    return 2;
  if (!(v11[0] >> 62))
  {
    if (*(_QWORD *)((v11[0] & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v9 = sub_2134D91CC();
  result = swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 2;
  }
LABEL_8:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x2199B47F4](0, v6);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v6 + 32);
LABEL_11:
    v8 = v7;
    swift_bridgeObjectRelease();
    v4 = sub_2134C4D54(a1, a2);

    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2134C4EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];

  sub_2134C5030(a1, a2, (uint64_t)v11);
  if (v11[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v10;
  }
  else
  {
    sub_2134C52FC((uint64_t)v11);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  result = swift_release();
  v6 = v11[0];
  if (!v11[0])
    return 0;
  if (!(v11[0] >> 62))
  {
    if (*(_QWORD *)((v11[0] & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v9 = sub_2134D91CC();
  result = swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_8:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x2199B47F4](0, v6);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v6 + 32);
LABEL_11:
    v8 = v7;
    swift_bridgeObjectRelease();
    v4 = sub_2134C4EBC(a1, a2);

    return v4;
  }
  __break(1u);
  return result;
}

_OWORD *sub_2134C5030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id *v8;
  id v9;
  void *v10;
  id v11;
  _OWORD *result;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD v30[2];
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];

  v4 = v3;
  v8 = (id *)(v3 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  if (*v8)
  {
    v9 = *v8;
    v10 = (void *)sub_2134D8FE0();
    v11 = objc_msgSend(v9, sel_valueForKey_, v10);

    if (v11)
    {
      sub_2134D9160();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v30, 0, sizeof(v30));
    }
    sub_2134C533C((uint64_t)v30, (uint64_t)&v31);
    if (*((_QWORD *)&v32 + 1))
    {
      sub_2134C5C68(&v31, v33);
      return sub_2134C5C68(v33, (_OWORD *)a3);
    }
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_2134C52FC((uint64_t)&v31);
  v13 = (uint64_t *)(v4 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
  swift_beginAccess();
  v14 = *v13;
  if (*(_QWORD *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = sub_2134C5C04(a1, a2);
    if ((v16 & 1) != 0)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
      swift_bridgeObjectRelease();
      result = (_OWORD *)swift_bridgeObjectRelease();
      *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE13C8];
      *(_QWORD *)a3 = v17;
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v18 = (uint64_t *)(v4 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
  swift_beginAccess();
  v19 = *v18;
  if (*(_QWORD *)(v19 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = sub_2134C5C04(a1, a2);
    if ((v21 & 1) != 0)
    {
      v22 = *(_BYTE *)(*(_QWORD *)(v19 + 56) + v20);
      swift_bridgeObjectRelease();
      result = (_OWORD *)swift_bridgeObjectRelease();
      *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE1328];
      *(_BYTE *)a3 = v22;
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v23 = (uint64_t *)(v4 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
  result = (_OWORD *)swift_beginAccess();
  v24 = *v23;
  if (*(_QWORD *)(v24 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25 = sub_2134C5C04(a1, a2);
    if ((v26 & 1) != 0)
    {
      v27 = (uint64_t *)(*(_QWORD *)(v24 + 56) + 16 * v25);
      v29 = *v27;
      v28 = v27[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      result = (_OWORD *)swift_bridgeObjectRelease();
      *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE0D00];
      *(_QWORD *)a3 = v29;
      *(_QWORD *)(a3 + 8) = v28;
      return result;
    }
    swift_bridgeObjectRelease();
    result = (_OWORD *)swift_bridgeObjectRelease();
  }
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

uint64_t sub_2134C52FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00810);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2134C533C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_2134C5480(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *result;
  _QWORD v18[3];
  uint64_t v19;

  v2 = v1;
  v4 = (void **)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  v5 = *v4;
  if (v5)
  {
    sub_2134C5C78(a1, (uint64_t)v18);
    v6 = v19;
    if (v19)
    {
      v7 = __swift_project_boxed_opaque_existential_0(v18, v19);
      v8 = *(_QWORD *)(v6 - 8);
      MEMORY[0x24BDAC7A8](v7, v7);
      v10 = (char *)&v18[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v8 + 16))(v10);
      v11 = v5;
      v12 = sub_2134D922C();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
    }
    else
    {
      v13 = v5;
      v12 = 0;
    }
    v14 = (void *)sub_2134D8FE0();
    objc_msgSend(v5, sel_setObject_forKey_, v12, v14);

    swift_unknownObjectRelease();
  }
  type metadata accessor for PreferencePane();
  sub_2134C5CC0();
  sub_2134D8ECC();
  sub_2134D8ED8();
  swift_release();
  v15 = v2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x2199B519C](v15);
  if (result)
  {
    objc_msgSend(result, sel_preferencePaneDidChangeWithPreference_, v2);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2134C56EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  _DWORD *v5;
  uint64_t result;

  v3 = v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x2199B519C](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_preferencePaneDidChangeWithPreference_, a1);
    swift_unknownObjectRelease();
  }
  v5 = (_DWORD *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  result = swift_beginAccess();
  ++*v5;
  return result;
}

void *sub_2134C584C()
{
  uint64_t v0;
  uint64_t v1;
  void *result;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2134D8F14();
  swift_release();
  result = (void *)swift_release();
  if (!v8)
  {
    sub_2134C4398(1);
    goto LABEL_13;
  }
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2134D91CC();
    result = (void *)swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_4;
  }
  else
  {
    v3 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3)
    {
LABEL_4:
      if (v3 < 1)
      {
        __break(1u);
        return result;
      }
      for (i = 0; i != v3; ++i)
      {
        if ((v8 & 0xC000000000000001) != 0)
          v5 = (id)MEMORY[0x2199B47F4](i);
        else
          v5 = *(id *)(v8 + 8 * i + 32);
        v6 = v5;
        sub_2134C584C();

      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  type metadata accessor for PreferencePane();
  sub_2134C5CC0();
  sub_2134D8ECC();
  sub_2134D8ED8();
  swift_release();
  v7 = v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x2199B519C](v7);
  if (result)
  {
    objc_msgSend(result, sel_preferencePaneDidChangeWithPreference_, v1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id PreferencePane.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PreferencePane.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PreferencePane.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreferencePane();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2134C5BC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PreferencePane();
  result = sub_2134D8ECC();
  *a1 = result;
  return result;
}

unint64_t sub_2134C5C04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2134D9298();
  sub_2134D9010();
  v4 = sub_2134D92B0();
  return sub_2134C6874(a1, a2, v4);
}

_OWORD *sub_2134C5C68(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2134C5C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2134C5CC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B9EF30;
  if (!qword_254B9EF30)
  {
    v1 = type metadata accessor for PreferencePane();
    result = MEMORY[0x2199B50C4](&protocol conformance descriptor for PreferencePane, v1);
    atomic_store(result, (unint64_t *)&qword_254B9EF30);
  }
  return result;
}

uint64_t sub_2134C5D08()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2134C5D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2134C2D70(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name, &qword_254B9EF10);
}

uint64_t sub_2134C5D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C2DDC(a1, a2, a3, a4, &qword_254B9EF18, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name, &qword_254B9EF10);
}

uint64_t sub_2134C5D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2134C2D70(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes, (uint64_t *)&unk_253F00778);
}

uint64_t sub_2134C5D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C2DDC(a1, a2, a3, a4, &qword_254B9EF40, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes, (uint64_t *)&unk_253F00778);
}

uint64_t sub_2134C5DB4@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(*a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2134C5E04(int *a1, _QWORD *a2)
{
  int v2;
  _DWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_DWORD *)(*a2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_2134C5E50@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders, a2);
}

uint64_t sub_2134C5E5C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C35BC(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders);
}

uint64_t sub_2134C5E78@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles, a2);
}

uint64_t sub_2134C5E84(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C35BC(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles);
}

uint64_t sub_2134C5EA0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections, a2);
}

uint64_t sub_2134C5EAC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C35BC(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections);
}

uint64_t sub_2134C5EC8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders, a2);
}

uint64_t sub_2134C5ED4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C35BC(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
}

uint64_t sub_2134C5EF0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles, a2);
}

uint64_t sub_2134C5EFC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C35BC(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
}

uint64_t sub_2134C5F18@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections, a2);
}

uint64_t keypath_get_15Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2134C5F74(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2134C35BC(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
}

uint64_t sub_2134C5F90@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2134C5FE8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  result = MEMORY[0x2199B519C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_2134C603C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

id sub_2134C6090@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_2134C60E4()
{
  return type metadata accessor for PreferencePane();
}

void sub_2134C60EC()
{
  unint64_t v0;
  unint64_t v1;

  sub_2134C66CC();
  if (v0 <= 0x3F)
  {
    sub_2134C6720();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for PreferencePane()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PreferencePane.name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PreferencePane.name.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PreferencePane.name.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PreferencePane.$name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PreferencePane.$name.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of PreferencePane.$name.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of PreferencePane.panes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of PreferencePane.$panes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of PreferencePane.changeSequence.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of PreferencePane.changeSequence.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of PreferencePane.changeSequence.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of PreferencePane.sliders.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of PreferencePane.sliders.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of PreferencePane.sliders.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of PreferencePane.toggles.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of PreferencePane.toggles.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of PreferencePane.toggles.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of PreferencePane.pickersSelections.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of PreferencePane.pickersSelections.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of PreferencePane.pickersSelections.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of PreferencePane.defaultSliders.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of PreferencePane.defaultSliders.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of PreferencePane.defaultSliders.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of PreferencePane.defaultToggles.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of PreferencePane.defaultToggles.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of PreferencePane.defaultToggles.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of PreferencePane.defaultPickersSelections.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of PreferencePane.defaultPickersSelections.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of PreferencePane.defaultPickersSelections.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of PreferencePane.pickerOptions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of PreferencePane.pickerOptions.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of PreferencePane.pickerOptions.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of PreferencePane.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of PreferencePane.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of PreferencePane.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of PreferencePane.userDefaults.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of PreferencePane.userDefaults.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of PreferencePane.userDefaults.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of PreferencePane.__allocating_init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 512))();
}

uint64_t dispatch thunk of PreferencePane.doubleValue(forKey:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of PreferencePane.BOOLeanValue(forKey:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of PreferencePane.stringValue(forKey:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of PreferencePane.getValue(forKey:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of PreferencePane.set(_:forKey:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of PreferencePane.preferencePaneDidChange(preference:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of PreferencePane.reset()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x240))();
}

void sub_2134C66CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F00770)
  {
    v0 = sub_2134D8F2C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F00770);
  }
}

void sub_2134C6720()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254B9EF38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_253F00790);
    v0 = sub_2134D8F2C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254B9EF38);
  }
}

unint64_t sub_2134C6778(uint64_t a1)
{
  uint64_t v2;

  sub_2134D9004();
  sub_2134D9298();
  sub_2134D9010();
  v2 = sub_2134D92B0();
  swift_bridgeObjectRelease();
  return sub_2134C6954(a1, v2);
}

unint64_t sub_2134C67F8(char a1)
{
  uint64_t v2;

  sub_2134D9298();
  sub_2134D9010();
  swift_bridgeObjectRelease();
  v2 = sub_2134D92B0();
  return sub_2134C6AEC(a1, v2);
}

unint64_t sub_2134C6874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2134D9238() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2134D9238() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2134C6954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2134D9004();
    v8 = v7;
    if (v6 == sub_2134D9004() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2134D9238();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2134D9004();
          v15 = v14;
          if (v13 == sub_2134D9004() && v15 == v16)
            break;
          v18 = sub_2134D9238();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_2134C6AC8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_2134C6AEC(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    v6 = a1;
    v7 = *(_QWORD *)&aTotal_1[v6 * 8];
    v8 = qword_2134FA078[v6];
    while (*(_QWORD *)&aTotal_1[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4)] != v7
         || qword_2134FA078[*(char *)(*(_QWORD *)(v2 + 48) + v4)] != v8)
    {
      v10 = sub_2134D9238();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_2134C6C00()
{
  uint64_t result;

  result = sub_2134D8FE0();
  qword_254B9EF48 = result;
  return result;
}

id PreferencePaneDoneButtonTappedNotificationName.getter()
{
  if (qword_254B9EE00 != -1)
    swift_once();
  return (id)qword_254B9EF48;
}

uint64_t sub_2134C6C74()
{
  uint64_t result;

  result = sub_2134D8FE0();
  qword_253F00760 = result;
  return result;
}

id CloudCoverExpiredNotification.getter()
{
  if (qword_253F00768 != -1)
    swift_once();
  return (id)qword_253F00760;
}

uint64_t sub_2134C6D30()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_2134C6DDC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_2134C6E2C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_2134C6E94())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2134C6F1C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2134C6FA8(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_2134C6FF0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_2134C7034(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v7 = 1;
  v8 = objc_msgSend(v6, sel_URLsForDirectory_inDomains_, 13, 1);
  v9 = sub_2134D8E18();
  v10 = sub_2134D9040();

  v11 = *(_QWORD *)(v9 - 8);
  if (*(_QWORD *)(v10 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v5, v10 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v9);
    v7 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v5, v7, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v9) == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a1, v5, v9);
    sub_2134D8DDC();

  }
}

uint64_t sub_2134C7264@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  v4 = sub_2134D8E18();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2134C73FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  _BYTE v11[24];

  v3 = sub_2134D8E18();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v3);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v8, a1, v3);
  swift_endAccess();
  sub_2134C7688();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(a1, v3);
  return ((uint64_t (*)(_BYTE *, uint64_t))v9)(v7, v3);
}

uint64_t sub_2134C74F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  v4 = sub_2134D8E18();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_2134C7558(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void (*v13)(_BYTE *, uint64_t, uint64_t);
  uint64_t v14;
  void (*v15)(_BYTE *, uint64_t);
  _BYTE v17[24];

  v4 = sub_2134D8E18();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = &v17[-v11];
  v13 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  v13(&v17[-v11], a1, v4);
  v14 = *a2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  v13(v9, v14, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v5 + 24))(v14, v12, v4);
  swift_endAccess();
  sub_2134C7688();
  v15 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v15(v12, v4);
  return ((uint64_t (*)(_BYTE *, uint64_t))v15)(v9, v4);
}

uint64_t sub_2134C7688()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2134D8F44();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2134D8F5C();
  v23 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2134D8E18();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v16, v10);
  sub_2134D8244((unint64_t *)&unk_253F00830, v11, MEMORY[0x24BDCDB00]);
  v17 = sub_2134D8FD4();
  result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  if ((v17 & 1) == 0)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v1;
    aBlock[4] = sub_2134D8284;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2134C7A98;
    aBlock[3] = &block_descriptor_164;
    v20 = _Block_copy(aBlock);
    v21 = v1;
    sub_2134D8F50();
    v26 = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    sub_2134D916C();
    MEMORY[0x2199B4728](0, v9, v5, v20);
    _Block_release(v20);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
    return swift_release();
  }
  return result;
}

void sub_2134C7938()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  id v5;

  if (sub_2134CA1D4())
  {
    if (qword_253F00670 != -1)
      swift_once();
    v0 = sub_2134D8EC0();
    __swift_project_value_buffer(v0, (uint64_t)qword_253F00AB0);
    v1 = sub_2134D8EA8();
    v2 = sub_2134D9088();
    if (os_log_type_enabled(v1, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2134A1000, v1, v2, "Directory changed and files are expired. It will post expirated Notification.", v3, 2u);
      MEMORY[0x2199B5148](v3, -1, -1);
    }

    v4 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v5 = v4;
    if (qword_253F00768 != -1)
    {
      swift_once();
      v4 = v5;
    }
    objc_msgSend(v4, sel_postNotificationName_object_, qword_253F00760, 0);

  }
}

void (*sub_2134C7A9C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t, uint64_t);

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_2134D8E18();
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  v3[14] = v7;
  v3[15] = v8;
  v9 = v1 + v8;
  swift_beginAccess();
  v10 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 16);
  v3[16] = v10;
  v10(v7, v9, v4);
  return sub_2134C7B64;
}

void sub_2134C7B64(uint64_t a1, char a2)
{
  void *v2;
  void (*v3)(void *, void *, uint64_t);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (*v10)(void *, uint64_t);
  void *v11;

  v2 = *(void **)a1;
  v3 = *(void (**)(void *, void *, uint64_t))(*(_QWORD *)a1 + 128);
  v4 = *(void **)(*(_QWORD *)a1 + 104);
  v5 = *(void **)(*(_QWORD *)a1 + 112);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  v6 = *(void **)(*(_QWORD *)a1 + 96);
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v9 = (void *)(*(_QWORD *)(*(_QWORD *)a1 + 72) + *(_QWORD *)(*(_QWORD *)a1 + 120));
  if ((a2 & 1) != 0)
  {
    v3(*(void **)(*(_QWORD *)a1 + 104), v5, v8);
    v3(v6, v9, v8);
    swift_beginAccess();
    (*(void (**)(void *, void *, uint64_t))(v7 + 24))(v9, v4, v8);
    swift_endAccess();
    sub_2134C7688();
    v10 = *(void (**)(void *, uint64_t))(v7 + 8);
    v10(v4, v8);
    v10(v6, v8);
    v11 = v5;
  }
  else
  {
    v3(*(void **)(*(_QWORD *)a1 + 104), v9, v8);
    swift_beginAccess();
    (*(void (**)(void *, void *, uint64_t))(v7 + 24))(v9, v5, v8);
    swift_endAccess();
    sub_2134C7688();
    v10 = *(void (**)(void *, uint64_t))(v7 + 8);
    v10(v5, v8);
    v11 = v4;
  }
  v10(v11, v8);
  free(v5);
  free(v4);
  free(v6);
  free(v2);
}

uint64_t static AegirCloudCoverService.Configuration.devEnvironment.getter@<X0>(unint64_t *a1@<X8>)
{
  uint64_t result;

  static AegirCloudCoverService.Configuration.prodEnvironment.getter(a1);
  result = swift_bridgeObjectRelease();
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000002134FC1F0;
  return result;
}

void static AegirCloudCoverService.Configuration.prodEnvironment.getter(unint64_t *a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v2 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v3 = (void *)sub_2134D8FE0();
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  if (!v4)
  {
    v10 = 0xD00000000000001ELL;
    v9 = 0x80000002134FC240;
    v11 = 0x80000002134FC260;
    v12 = 0xD000000000000019;
LABEL_21:
    v21 = 0xD000000000000020;
    v23 = 0x80000002134FC280;
    v18 = v4;
    goto LABEL_22;
  }
  v5 = v4;
  v6 = (void *)sub_2134D8FE0();
  v7 = objc_msgSend(v5, sel_stringForKey_, v6);

  if (v7)
  {
    v24 = sub_2134D9004();
    v9 = v8;

  }
  else
  {
    v24 = 0;
    v9 = 0;
  }
  v13 = v5;
  v14 = (void *)sub_2134D8FE0();
  v15 = objc_msgSend(v13, sel_stringForKey_, v14);

  if (v15)
  {
    v12 = sub_2134D9004();
    v17 = v16;

  }
  else
  {
    v12 = 0;
    v17 = 0;
  }
  v18 = v13;
  v19 = (void *)sub_2134D8FE0();
  v20 = objc_msgSend(v18, sel_stringForKey_, v19);

  if (v20)
  {
    v21 = sub_2134D9004();
    v23 = v22;

  }
  else
  {
    v21 = 0;
    v23 = 0;
  }
  if (v9)
    v10 = v24;
  else
    v10 = 0xD00000000000001ELL;
  if (!v9)
    v9 = 0x80000002134FC240;
  if (v17)
  {
    v11 = v17;
  }
  else
  {
    v12 = 0xD000000000000019;
    v11 = 0x80000002134FC260;
  }
  if (!v23)
    goto LABEL_21;
LABEL_22:

  *a1 = v10;
  a1[1] = v9;
  a1[2] = v12;
  a1[3] = v11;
  a1[4] = v21;
  a1[5] = v23;
}

void sub_2134C7F80()
{
  qword_254B9F730 = 3;
  qword_254B9F738 = 0x3FE0000000000000;
}

uint64_t AegirCloudCoverService.CloudLevel.description.getter()
{
  char *v0;

  return *(_QWORD *)&aTotal_2[8 * *v0];
}

uint64_t AegirCloudCoverService.CloudLevel.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aTotal_2[8 * *v0];
}

uint64_t sub_2134C7FE0()
{
  sub_2134D901C();
  swift_bridgeObjectRelease();
  return 0x61632D632D333070;
}

uint64_t sub_2134C805C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v4;
  char v6;

  v4 = result;
  if (result == 0xD000000000000012 && a2 == 0x80000002134FC320 || (result = sub_2134D9238(), (result & 1) != 0))
  {
    v6 = 3;
  }
  else if (v4 == 0xD000000000000012 && a2 == 0x80000002134FC340 || (result = sub_2134D9238(), (result & 1) != 0))
  {
    v6 = 2;
  }
  else if (v4 == 0xD000000000000013 && a2 == 0x80000002134FC360 || (result = sub_2134D9238(), (result & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    v6 = 4;
    if (v4 != 0xD000000000000014 || a2 != 0x80000002134FC630)
    {
      result = sub_2134D9238();
      if ((result & 1) != 0)
        v6 = 4;
      else
        v6 = 5;
    }
  }
  *a3 = v6;
  return result;
}

void sub_2134C81BC()
{
  uint64_t v0;

  sub_2134C81D8();
  qword_253F00B20 = v0;
}

void sub_2134C81D8()
{
  __asm { BR              X8; loc_2134C8214 }
}

void *static AegirCloudCoverService.CloudLevel.allCases.getter()
{
  return &unk_24CFD8710;
}

NanoUniverse::AegirCloudCoverService::CloudLevel_optional __swiftcall AegirCloudCoverService.CloudLevel.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  NanoUniverse::AegirCloudCoverService::CloudLevel_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2134D9214();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_2134C8394()
{
  return sub_2134C839C();
}

uint64_t sub_2134C839C()
{
  sub_2134D9298();
  sub_2134D9010();
  swift_bridgeObjectRelease();
  return sub_2134D92B0();
}

uint64_t sub_2134C8404()
{
  return sub_2134C840C();
}

uint64_t sub_2134C840C()
{
  sub_2134D9010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134C844C()
{
  return sub_2134C8454();
}

uint64_t sub_2134C8454()
{
  sub_2134D9298();
  sub_2134D9010();
  swift_bridgeObjectRelease();
  return sub_2134D92B0();
}

NanoUniverse::AegirCloudCoverService::CloudLevel_optional sub_2134C84B8(Swift::String *a1)
{
  return AegirCloudCoverService.CloudLevel.init(rawValue:)(*a1);
}

uint64_t sub_2134C84C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AegirCloudCoverService.CloudLevel.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_2134C84E8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24CFD87D0;
}

uint64_t sub_2134C84F8()
{
  return AegirCloudCoverService.CloudLevel.rawValue.getter();
}

uint64_t sub_2134C8528(char *a1, char *a2)
{
  return sub_2134C8534(*a1, *a2);
}

uint64_t sub_2134C8534(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aTotal_2[8 * a1] == *(_QWORD *)&aTotal_2[8 * a2] && qword_2134FA408[a1] == qword_2134FA408[a2])
    v3 = 1;
  else
    v3 = sub_2134D9238();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

BOOL sub_2134C85B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2134C85D0()
{
  sub_2134D9298();
  sub_2134D92A4();
  return sub_2134D92B0();
}

uint64_t sub_2134C8614()
{
  return sub_2134D92A4();
}

uint64_t sub_2134C863C()
{
  sub_2134D9298();
  sub_2134D92A4();
  return sub_2134D92B0();
}

id AegirCloudCoverService.__allocating_init(imageScale:)(float a1)
{
  objc_class *v1;
  id v3;
  id v4;
  id v5;
  _OWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v3 = objc_allocWithZone(v1);
  static AegirCloudCoverService.Configuration.prodEnvironment.getter((unint64_t *)v10);
  v7[0] = v10[0];
  v7[1] = v10[1];
  v8 = v11;
  v9 = v12;
  v4 = objc_allocWithZone((Class)type metadata accessor for AegirCloudCoverService());
  v5 = AegirCloudCoverService.init(configuration:imageScale:)((uint64_t *)v7, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

id AegirCloudCoverService.init(imageScale:)(float a1)
{
  id v2;
  id v3;
  _OWORD v5[2];
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  static AegirCloudCoverService.Configuration.prodEnvironment.getter((unint64_t *)v8);
  v5[0] = v8[0];
  v5[1] = v8[1];
  v6 = v9;
  v7 = v10;
  v2 = objc_allocWithZone((Class)type metadata accessor for AegirCloudCoverService());
  v3 = AegirCloudCoverService.init(configuration:imageScale:)((uint64_t *)v5, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

id AegirCloudCoverService.__allocating_init(configuration:imageScale:)(uint64_t *a1, float a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return AegirCloudCoverService.init(configuration:imageScale:)(a1, a2);
}

uint64_t type metadata accessor for AegirCloudCoverService()
{
  uint64_t result;

  result = qword_253F00750;
  if (!qword_253F00750)
    return swift_getSingletonMetadata();
  return result;
}

id AegirCloudCoverService.init(configuration:imageScale:)(uint64_t *a1, float a2)
{
  _BYTE *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_class *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  char *v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD aBlock[6];
  objc_super v61;

  v5 = sub_2134D8F44();
  v49 = *(_QWORD *)(v5 - 8);
  v50 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v48 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2134D90B8();
  v51 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2134D90A0();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v12, v14);
  v47 = sub_2134D8F5C();
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47, v15);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v57 = a1[1];
  v58 = v18;
  v19 = a1[2];
  v55 = a1[3];
  v56 = v19;
  v20 = a1[4];
  v53 = a1[5];
  v54 = v20;
  *(_QWORD *)&v2[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter] = 0;
  v2[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch] = 0;
  v21 = (uint64_t)&v2[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
  v22 = v2;
  sub_2134C7034(v21);
  *(_QWORD *)&v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_refreshTimeIntervalInSeconds] = 0x40AC200000000000;
  v23 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue;
  sub_2134D7D30(0, &qword_253F007D0);
  sub_2134D8F50();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2134D8244(&qword_253F007C8, v13, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F007B0);
  sub_2134D7D68((unint64_t *)&unk_253F007B8, &qword_253F007B0, MEMORY[0x24BEE12C8]);
  sub_2134D916C();
  (*(void (**)(char *, _QWORD, uint64_t))(v51 + 104))(v11, *MEMORY[0x24BEE5750], v52);
  *(_QWORD *)&v22[v23] = sub_2134D90E8();
  *(_QWORD *)&v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_startBackoffInterval] = 0x4082C00000000000;
  *(_QWORD *)&v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_maxBackoffInterval] = 0x40F5180000000000;
  *(_QWORD *)&v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer] = 0;
  *(_QWORD *)&v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress] = MEMORY[0x24BEE4B08];
  v24 = &v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_backoffInterval];
  *(_QWORD *)v24 = 0;
  v24[8] = 1;
  *(_QWORD *)&v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session] = 0;
  v25 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_authenticator;
  type metadata accessor for AegirAuthentication();
  v26 = swift_allocObject();
  sub_2134D8E84();
  swift_allocObject();
  *(_QWORD *)(v26 + 16) = sub_2134D8E78();
  *(_QWORD *)&v22[v25] = v26;
  if (qword_253F00670 != -1)
    swift_once();
  v27 = sub_2134D8EC0();
  __swift_project_value_buffer(v27, (uint64_t)qword_253F00AB0);
  v28 = sub_2134D8EA8();
  v29 = sub_2134D9088();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_2134A1000, v28, v29, "Initializing AegirCloudCoverService", v30, 2u);
    MEMORY[0x2199B5148](v30, -1, -1);
  }

  v31 = &v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_configuration];
  v32 = v57;
  *(_QWORD *)v31 = v58;
  *((_QWORD *)v31 + 1) = v32;
  v33 = v55;
  *((_QWORD *)v31 + 2) = v56;
  *((_QWORD *)v31 + 3) = v33;
  v34 = v53;
  *((_QWORD *)v31 + 4) = v54;
  *((_QWORD *)v31 + 5) = v34;
  *(float *)&v22[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_imageScale] = a2;

  v35 = (objc_class *)type metadata accessor for AegirCloudCoverService();
  v61.receiver = v22;
  v61.super_class = v35;
  v36 = objc_msgSendSuper2(&v61, sel_init);
  v37 = qword_253F00730;
  v38 = v36;
  if (v37 != -1)
    swift_once();
  if (byte_253F00728 == 1)
  {
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = v38;
    aBlock[4] = sub_2134C9720;
    aBlock[5] = v39;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2134C7A98;
    aBlock[3] = &block_descriptor;
    v40 = _Block_copy(aBlock);
    v41 = v38;
    sub_2134D8F50();
    v59 = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    v42 = v48;
    v43 = v50;
    sub_2134D916C();
    MEMORY[0x2199B4728](0, v17, v42, v40);

    _Block_release(v40);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v42, v43);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v47);
    swift_release();
  }
  else
  {

  }
  return v38;
}

uint64_t sub_2134C8EEC(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  void *v18;
  char *v19;
  id v20;
  _QWORD v22[2];
  _QWORD aBlock[6];

  v7 = sub_2134D8F44();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2134D8F5C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[0] = *(_QWORD *)&v3[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue];
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v3;
  v17[3] = a1;
  v17[4] = a2;
  v17[5] = a3;
  aBlock[4] = sub_2134D2384;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2134C7A98;
  aBlock[3] = &block_descriptor_6;
  v18 = _Block_copy(aBlock);
  v19 = v3;
  v20 = a1;
  swift_retain();
  sub_2134D8F50();
  v22[1] = MEMORY[0x24BEE4AF8];
  sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
  sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
  sub_2134D916C();
  MEMORY[0x2199B4728](0, v16, v11, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  return swift_release();
}

void sub_2134C9170(uint64_t a1, uint64_t a2)
{
  id v3;

  sub_2134D8E18();
  v3 = (id)sub_2134D9034();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

unint64_t sub_2134C91C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v22[2];
  uint64_t v23[3];
  unint64_t v24;

  v1 = sub_2134D8E18();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BEE4AF8];
  if (qword_253F006D8 != -1)
    swift_once();
  v22[0] = *(_QWORD *)(qword_253F00B20 + 16);
  if (v22[0])
  {
    v6 = v0 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v7 = 0;
    v8 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    v9 = MEMORY[0x24BEE4AF8];
    do
    {
      v8(v5, v6, v1);
      v23[0] = 0x61632D632D333070;
      v23[1] = 0xEF2D65706F696C6CLL;
      sub_2134D901C();
      swift_bridgeObjectRelease();
      sub_2134D8DDC();
      swift_bridgeObjectRelease();
      sub_2134D8DE8();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v9 = sub_2134D24D8(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
      v11 = *(_QWORD *)(v9 + 16);
      v10 = *(_QWORD *)(v9 + 24);
      if (v11 >= v10 >> 1)
        v9 = sub_2134D24D8(v10 > 1, v11 + 1, 1, v9);
      ++v7;
      *(_QWORD *)(v9 + 16) = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v9+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v11, v5, v1);
      v24 = v9;
    }
    while (v22[0] != v7);
    swift_bridgeObjectRelease();
  }
  if (qword_253F00670 != -1)
    swift_once();
  v12 = sub_2134D8EC0();
  __swift_project_value_buffer(v12, (uint64_t)qword_253F00AB0);
  v13 = sub_2134D8EA8();
  v14 = sub_2134D9070();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)v15 = 136315138;
    swift_beginAccess();
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x2199B4698](v17, v1);
    v20 = v19;
    swift_bridgeObjectRelease();
    v22[1] = sub_2134C1AE0(v18, v20, v23);
    sub_2134D9148();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2134A1000, v13, v14, "Cached cloudTextureURLs: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B5148](v16, -1, -1);
    MEMORY[0x2199B5148](v15, -1, -1);
  }

  swift_beginAccess();
  return v24;
}

uint64_t sub_2134C95CC()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_processName);

  v2 = sub_2134D9004();
  v4 = v3;

  v5 = v2 == 0x656764697242 && v4 == 0xE600000000000000;
  if (v5
    || (sub_2134D9238() & 1) != 0
    || (v2 == 0x736F507269676541 ? (v6 = v4 == 0xEB00000000726574) : (v6 = 0), v6))
  {
    result = swift_bridgeObjectRelease();
    v7 = 1;
  }
  else
  {
    v7 = sub_2134D9238();
    result = swift_bridgeObjectRelease();
  }
  byte_253F00728 = v7 & 1;
  return result;
}

uint64_t sub_2134C96FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2134C9720()
{
  return sub_2134CD5A4();
}

uint64_t sub_2134C9770(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (qword_253F00730 != -1)
    a1 = swift_once();
  if ((byte_253F00728 & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](a1, a2);
    sub_2134D90D0();
    return v13;
  }
  else
  {
    if (qword_253F00670 != -1)
      swift_once();
    v3 = sub_2134D8EC0();
    __swift_project_value_buffer(v3, (uint64_t)qword_253F00AB0);
    v4 = sub_2134D8EA8();
    v5 = sub_2134D9088();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v13 = v7;
      *(_DWORD *)v6 = 136315138;
      v8 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
      v9 = objc_msgSend(v8, sel_processName);

      v10 = sub_2134D9004();
      v12 = v11;

      sub_2134C1AE0(v10, v12, &v13);
      sub_2134D9148();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2134A1000, v4, v5, "Will not fetch data: process %s is not permitted to perform downloads", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v7, -1, -1);
      MEMORY[0x2199B5148](v6, -1, -1);
    }

    return 0;
  }
}

uint64_t sub_2134C99C8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  void *v25;
  unsigned int v26;
  char v27;
  char *v28;
  void *v29;
  unsigned int v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  int v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  char *v57;
  uint64_t result;
  _QWORD v59[2];
  __int128 v60;
  uint64_t *v61;
  char *v62;
  char *v63;
  os_log_t v64;
  int v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t aBlock;
  unint64_t v81;
  uint64_t (*v82)(uint64_t);
  void *v83;
  uint64_t (*v84)();
  uint64_t v85;
  uint64_t v86;

  v1 = v0;
  v86 = *MEMORY[0x24BDAC8D0];
  v2 = sub_2134D8EC0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2134D8E18();
  v75 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v63 = (char *)v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v72 = (char *)v59 - v13;
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)v59 - v15;
  v17 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  if (qword_253F006D8 != -1)
    swift_once();
  v18 = qword_253F00B20;
  v74 = *(_QWORD *)(qword_253F00B20 + 16);
  if (v74)
  {
    v70 = v6;
    v71 = v3;
    v68 = v2;
    v19 = &v1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
    swift_bridgeObjectRetain();
    v77 = v19;
    swift_beginAccess();
    v20 = 0;
    v76 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
    v61 = &v79;
    *(_QWORD *)&v21 = 136315394;
    v60 = v21;
    v59[1] = MEMORY[0x24BEE4AD8] + 8;
    v62 = v1;
    v67 = v17;
    v73 = v18;
    do
    {
      v23 = *(_BYTE *)(v18 + v20 + 32);
      v76(v16, v77, v7);
      aBlock = 0x61632D632D333070;
      v81 = 0xEF2D65706F696C6CLL;
      sub_2134D901C();
      swift_bridgeObjectRelease();
      sub_2134D8DDC();
      swift_bridgeObjectRelease();
      sub_2134D8DE8();
      sub_2134D8E00();
      v24 = *(void (**)(char *, uint64_t))(v75 + 8);
      v24(v16, v7);
      v25 = (void *)sub_2134D8FE0();
      swift_bridgeObjectRelease();
      v26 = objc_msgSend(v17, sel_fileExistsAtPath_, v25);

      if (v26)
      {
        v27 = v23;
        v28 = v72;
        v76(v72, v77, v7);
        LOBYTE(aBlock) = v27;
        sub_2134C7FE0();
        sub_2134D8DDC();
        swift_bridgeObjectRelease();
        sub_2134D8DE8();
        v29 = (void *)sub_2134D8DD0();
        v24(v28, v7);
        aBlock = 0;
        v30 = objc_msgSend(v17, sel_removeItemAtURL_error_, v29, &aBlock);

        v31 = (id)aBlock;
        if (!v30)
        {
          v32 = v31;
          v33 = (void *)sub_2134D8DAC();

          swift_willThrow();
          if (qword_253F00670 != -1)
            swift_once();
          v34 = v68;
          v35 = __swift_project_value_buffer(v68, (uint64_t)qword_253F00AB0);
          (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v70, v35, v34);
          v36 = v1;
          v37 = v33;
          v69 = v36;
          v38 = v33;
          v39 = sub_2134D8EA8();
          v40 = sub_2134D907C();
          v41 = v40;
          if (os_log_type_enabled(v39, v40))
          {
            v42 = swift_slowAlloc();
            v66 = swift_slowAlloc();
            aBlock = v66;
            *(_DWORD *)v42 = v60;
            v43 = v63;
            v76(v63, v77, v7);
            LOBYTE(v78) = v27;
            v65 = v41;
            sub_2134C7FE0();
            sub_2134D8DDC();
            swift_bridgeObjectRelease();
            sub_2134D8DE8();
            sub_2134D8244(&qword_254B9EF60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
            v44 = sub_2134D9220();
            v64 = v39;
            v46 = v45;
            v24(v43, v7);
            v78 = sub_2134C1AE0(v44, v46, &aBlock);
            sub_2134D9148();
            v47 = v69;

            swift_bridgeObjectRelease();
            *(_WORD *)(v42 + 12) = 2080;
            swift_getErrorValue();
            v48 = sub_2134D925C();
            v78 = sub_2134C1AE0(v48, v49, &aBlock);
            sub_2134D9148();
            swift_bridgeObjectRelease();

            v50 = v64;
            _os_log_impl(&dword_2134A1000, v64, (os_log_type_t)v65, "Failed to delete cloud texture file at : %s. Error: %s", (uint8_t *)v42, 0x16u);
            v51 = v66;
            swift_arrayDestroy();
            MEMORY[0x2199B5148](v51, -1, -1);
            v52 = v42;
            v1 = v62;
            MEMORY[0x2199B5148](v52, -1, -1);

            (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v68);
          }
          else
          {

            v22 = v69;
            (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v34);
          }
          v17 = v67;
        }
      }
      ++v20;
      v18 = v73;
    }
    while (v74 != v20);
    swift_bridgeObjectRelease();
  }
  v53 = *(NSObject **)&v1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue];
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = v1;
  v55 = swift_allocObject();
  *(_QWORD *)(v55 + 16) = sub_2134D271C;
  *(_QWORD *)(v55 + 24) = v54;
  v84 = sub_2134D2744;
  v85 = v55;
  aBlock = MEMORY[0x24BDAC760];
  v81 = 1107296256;
  v82 = sub_2134CA1B4;
  v83 = &block_descriptor_15;
  v56 = _Block_copy(&aBlock);
  v57 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v53, v56);

  _Block_release(v56);
  LOBYTE(v53) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v53 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_2134CA1B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

BOOL sub_2134CA1D4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  _BOOL4 v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29[3];
  BOOL v30;

  v1 = sub_2134D8EC0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch];
  swift_beginAccess();
  if ((*v6 & 1) != 0
    || (v7 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress],
        swift_beginAccess(),
        *(_QWORD *)(*(_QWORD *)v7 + 16)))
  {
LABEL_3:
    v30 = 0;
  }
  else
  {
    v20 = *(_QWORD *)&v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer];
    v30 = v20 == 0;
    if (!v20)
    {
      v30 = 0;
      if (qword_253F006D8 != -1)
        swift_once();
      v21 = qword_253F00B20;
      v22 = *(_QWORD *)(qword_253F00B20 + 16);
      if (v22)
      {
        swift_bridgeObjectRetain();
        v23 = 0;
        while (1)
        {
          LOBYTE(v29[0]) = *(_BYTE *)(v21 + v23 + 32);
          sub_2134CC8B0((unsigned __int8 *)v29);
          if ((v24 & 1) != 0)
            break;
          if (v22 == ++v23)
          {
            swift_bridgeObjectRelease();
            goto LABEL_3;
          }
        }
        swift_bridgeObjectRelease();
        v30 = 1;
      }
    }
  }
  if (qword_253F00670 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v1, (uint64_t)qword_253F00AB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v8, v1);
  v9 = v30;
  v10 = v0;
  v11 = sub_2134D8EA8();
  v12 = sub_2134D9088();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v26 = v2;
    v15 = v14;
    v29[0] = v14;
    *(_DWORD *)v13 = 67109890;
    v28 = v9;
    sub_2134D9148();
    *(_WORD *)(v13 + 8) = 1024;
    v28 = *v6;
    sub_2134D9148();
    *(_WORD *)(v13 + 14) = 2048;
    v16 = &v10[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress];
    swift_beginAccess();
    v27 = *(_QWORD *)(*(_QWORD *)v16 + 16);
    sub_2134D9148();
    *(_WORD *)(v13 + 24) = 2080;
    if (*(_QWORD *)&v10[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer])
      v17 = 0x6C694E746F6ELL;
    else
      v17 = 7104878;
    if (*(_QWORD *)&v10[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer])
      v18 = 0xE600000000000000;
    else
      v18 = 0xE300000000000000;
    v27 = sub_2134C1AE0(v17, v18, v29);
    sub_2134D9148();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2134A1000, v11, v12, "Should fetch data: %{BOOL}d, disabledFetch: %{BOOL}d, operationsInProgress.count: %ld, dispatchSourceTimer: %s", (uint8_t *)v13, 0x22u);
    swift_arrayDestroy();
    MEMORY[0x2199B5148](v15, -1, -1);
    MEMORY[0x2199B5148](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  swift_beginAccess();
  return v30;
}

void sub_2134CA5AC(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5, char *a6, NSObject *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void **v39;
  void *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  size_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  void *v58;
  char *v59;
  void *v60;
  unsigned int v61;
  id v62;
  void (*v63)(char *, uint64_t);
  id v64;
  void *v65;
  char *v66;
  id v67;
  id v68;
  NSObject *v69;
  uint64_t v70;
  os_log_type_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  _QWORD v76[2];
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  void *v86;
  dispatch_group_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92[19];

  v87 = a7;
  v84 = a6;
  LODWORD(v85) = a4;
  v92[18] = *MEMORY[0x24BDAC8D0];
  v81 = sub_2134D8EC0();
  v88 = *(_QWORD *)(v81 - 8);
  v12 = MEMORY[0x24BDAC7A8](v81, v11);
  v80 = (char *)v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)v76 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  v19 = MEMORY[0x24BDAC7A8](v17, v18);
  v21 = (char *)v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v22);
  v24 = (char *)v76 - v23;
  v25 = sub_2134D8E18();
  v27 = MEMORY[0x24BDAC7A8](v25, v26);
  v83 = (char *)v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27, v29);
  v31 = (char *)v76 - v30;
  v82 = a3;
  v32 = (_BYTE *)(a5 + 16);
  v34 = v33;
  sub_2134D80EC(a1, (uint64_t)v24, &qword_253F00678);
  v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v24, 1, v25);
  v86 = (void *)(a3 + 16);
  if (v35 == 1)
  {
    sub_2134D8004((uint64_t)v24, &qword_253F00678);
    objc_msgSend(a2, sel_lock);
    swift_beginAccess();
    *v32 = 1;
    objc_msgSend(a2, sel_unlock);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v24, v25);
    objc_msgSend(a2, sel_lock);
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v21, v31, v25);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v21, 0, 1, v25);
    swift_beginAccess();
    sub_2134CAF48((uint64_t)v21, v85);
    swift_endAccess();
    objc_msgSend(a2, sel_unlock);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v25);
  }
  v36 = v25;
  swift_beginAccess();
  v37 = v88;
  if ((*v32 & 1) == 0)
  {
    v38 = v86;
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)v38 + 16) == 3)
    {
      v39 = (void **)&v84[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter];
      swift_beginAccess();
      v40 = *v39;
      if (*v39)
      {
        v41 = &v84[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
        swift_beginAccess();
        v85 = v34;
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v83, v41, v25);
        swift_unknownObjectRetain();
        sub_2134D8DDC();
        sub_2134D8DE8();
        if (qword_253F00670 != -1)
          swift_once();
        v42 = v81;
        v43 = __swift_project_value_buffer(v81, (uint64_t)qword_253F00AB0);
        v44 = *(char **)(v37 + 16);
        v79 = v43;
        v84 = v44;
        ((void (*)(char *))v44)(v16);
        swift_retain_n();
        v45 = sub_2134D8EA8();
        v46 = sub_2134D9088();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = swift_slowAlloc();
          v77 = swift_slowAlloc();
          v92[0] = v77;
          *(_DWORD *)v47 = 136315394;
          v78 = v16;
          v90 = sub_2134C1AE0(0x6F626D6F63, 0xE500000000000000, v92);
          sub_2134D9148();
          *(_WORD *)(v47 + 12) = 2080;
          v76[1] = v47 + 14;
          swift_beginAccess();
          v48 = swift_bridgeObjectRetain();
          v49 = v40;
          v50 = sub_2134D2764(v48);
          swift_bridgeObjectRelease();
          v51 = MEMORY[0x2199B4698](v50, v25);
          v53 = v52;
          v40 = v49;
          swift_release();
          v91 = (id)sub_2134C1AE0(v51, v53, v92);
          sub_2134D9148();
          swift_release_n();
          v36 = v25;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2134A1000, v45, v46, "Combining cloud textures for level: %s %s", (uint8_t *)v47, 0x16u);
          v54 = v77;
          swift_arrayDestroy();
          MEMORY[0x2199B5148](v54, -1, -1);
          MEMORY[0x2199B5148](v47, -1, -1);

          v55 = *(void (**)(char *, uint64_t))(v88 + 8);
          v55(v78, v42);
        }
        else
        {

          swift_release_n();
          v55 = *(void (**)(char *, uint64_t))(v37 + 8);
          v55(v16, v42);
        }
        v56 = v42;
        swift_beginAccess();
        v57 = swift_bridgeObjectRetain();
        sub_2134D2764(v57);
        swift_bridgeObjectRelease();
        v58 = (void *)sub_2134D9034();
        swift_release();
        v59 = v83;
        v60 = (void *)sub_2134D8DD0();
        v91 = 0;
        v61 = objc_msgSend(v40, sel_combineFilesAt_to_error_, v58, v60, &v91);

        if (v61)
        {
          v62 = v91;
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v85 + 8))(v59, v36);
        }
        else
        {
          v63 = v55;
          v64 = v91;
          v65 = (void *)sub_2134D8DAC();

          swift_willThrow();
          v66 = v80;
          ((void (*)(char *, uint64_t, uint64_t))v84)(v80, v79, v56);
          v67 = v65;
          v68 = v65;
          v69 = sub_2134D8EA8();
          v70 = v56;
          v71 = sub_2134D907C();
          if (os_log_type_enabled(v69, v71))
          {
            v72 = swift_slowAlloc();
            v73 = (void *)swift_slowAlloc();
            v91 = v73;
            *(_DWORD *)v72 = 136315394;
            v89 = sub_2134C1AE0(0x6F626D6F63, 0xE500000000000000, (uint64_t *)&v91);
            v86 = v40;
            sub_2134D9148();
            *(_WORD *)(v72 + 12) = 2080;
            v88 = v36;
            swift_getErrorValue();
            v74 = sub_2134D925C();
            v89 = sub_2134C1AE0(v74, v75, (uint64_t *)&v91);
            sub_2134D9148();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_2134A1000, v69, v71, "Failed to combine cloud textures for level: %s. Error: %s.", (uint8_t *)v72, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x2199B5148](v73, -1, -1);
            MEMORY[0x2199B5148](v72, -1, -1);
            swift_unknownObjectRelease();

            v63(v80, v70);
            (*(void (**)(char *, uint64_t))(v85 + 8))(v83, v88);
          }
          else
          {
            swift_unknownObjectRelease();

            v63(v66, v56);
            (*(void (**)(char *, uint64_t))(v85 + 8))(v83, v36);
          }
        }
      }
    }
  }
  dispatch_group_leave(v87);
}

uint64_t sub_2134CAF48(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2134D8E18();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_2134D8004(a1, &qword_253F00678);
    sub_2134D2B48(a2, (uint64_t)v9);
    return sub_2134D8004((uint64_t)v9, &qword_253F00678);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v14, a1, v10);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_2134D3204((uint64_t)v14, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2134CB09C(char *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t aBlock[6];

  v5 = a1;
  v6 = a2 + 16;
  v7 = *(NSObject **)&a1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue];
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v6;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_2134D7E88;
  *(_QWORD *)(v9 + 24) = v8;
  aBlock[4] = (uint64_t)sub_2134D8440;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2134CA1B4;
  aBlock[3] = (uint64_t)&block_descriptor_86;
  v10 = _Block_copy(aBlock);
  v11 = v5;
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v5 & 1) != 0)
  {
    __break(1u);
  }
  else if (qword_253F00670 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v12 = sub_2134D8EC0();
  __swift_project_value_buffer(v12, (uint64_t)qword_253F00AB0);
  swift_retain_n();
  v13 = sub_2134D8EA8();
  v14 = sub_2134D9088();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)v15 = 136315138;
    swift_beginAccess();
    sub_2134D8E18();
    sub_2134D7EE4();
    swift_bridgeObjectRetain();
    v16 = sub_2134D8FC8();
    v18 = v17;
    swift_bridgeObjectRelease();
    sub_2134C1AE0(v16, v18, aBlock);
    sub_2134D9148();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2134A1000, v13, v14, "Finished loading cloud textures. Urls: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B5148](v22, -1, -1);
    MEMORY[0x2199B5148](v15, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_beginAccess();
  v19 = swift_bridgeObjectRetain();
  v20 = sub_2134CB408(v19);
  swift_bridgeObjectRelease();
  a4(v20);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134CB408(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t result;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t i;
  char v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  void (*v33)(char *, unint64_t, uint64_t);
  uint64_t v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  int64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  int64_t v60;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v2, v3);
  v58 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2134D8E18();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v50 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v10);
  v49 = (char *)&v48 - v11;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00848);
  v13 = MEMORY[0x24BDAC7A8](v57, v12);
  v56 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v55 = (char *)&v48 - v17;
  MEMORY[0x24BDAC7A8](v16, v18);
  v54 = (char *)&v48 - v19;
  v20 = *(_QWORD *)(a1 + 64);
  v52 = a1 + 64;
  v21 = 1 << *(_BYTE *)(a1 + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v20;
  v53 = (unint64_t)(v21 + 63) >> 6;
  v59 = a1;
  result = swift_bridgeObjectRetain();
  v25 = 0;
  v51 = MEMORY[0x24BEE4AF8];
  v26 = (uint64_t)v55;
  if (!v23)
    goto LABEL_7;
LABEL_4:
  v27 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  v60 = v25;
  for (i = v27 | (v25 << 6); ; i = __clz(__rbit64(v39)) + (v40 << 6))
  {
    v29 = *(_BYTE *)(*(_QWORD *)(v59 + 48) + i);
    v30 = *(_QWORD *)(v6 + 72);
    v31 = v57;
    v32 = v54;
    v33 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    v33(&v54[*(int *)(v57 + 48)], *(_QWORD *)(v59 + 56) + v30 * i, v5);
    *v32 = v29;
    sub_2134D7F28((uint64_t)v32, v26, &qword_253F00848);
    v34 = *(int *)(v31 + 48);
    v35 = &v56[v34];
    v33(&v56[v34], v26 + v34, v5);
    v36 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v37 = (uint64_t)v58;
    v36(v58, v35, v5);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(v37, 0, 1, v5);
    sub_2134D8004(v26, &qword_253F00848);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v37, 1, v5) == 1)
    {
      result = sub_2134D8004(v37, &qword_253F00678);
      v25 = v60;
      if (v23)
        goto LABEL_4;
    }
    else
    {
      v42 = v37;
      v43 = v49;
      v36(v49, (char *)v42, v5);
      v36(v50, v43, v5);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v51 = sub_2134D24D8(0, *(_QWORD *)(v51 + 16) + 1, 1, v51);
      v45 = *(_QWORD *)(v51 + 16);
      v44 = *(_QWORD *)(v51 + 24);
      if (v45 >= v44 >> 1)
        v51 = sub_2134D24D8(v44 > 1, v45 + 1, 1, v51);
      v46 = v50;
      v47 = v51;
      *(_QWORD *)(v51 + 16) = v45 + 1;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v36)(v47+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ v45 * v30, v46, v5);
      v25 = v60;
      if (v23)
        goto LABEL_4;
    }
LABEL_7:
    v38 = v25 + 1;
    if (__OFADD__(v25, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v38 >= v53)
      goto LABEL_29;
    v39 = *(_QWORD *)(v52 + 8 * v38);
    v40 = v25 + 1;
    if (!v39)
    {
      v40 = v25 + 2;
      if (v25 + 2 >= v53)
        goto LABEL_29;
      v39 = *(_QWORD *)(v52 + 8 * v40);
      if (!v39)
      {
        v40 = v25 + 3;
        if (v25 + 3 >= v53)
          goto LABEL_29;
        v39 = *(_QWORD *)(v52 + 8 * v40);
        if (!v39)
        {
          v40 = v25 + 4;
          if (v25 + 4 >= v53)
            goto LABEL_29;
          v39 = *(_QWORD *)(v52 + 8 * v40);
          if (!v39)
            break;
        }
      }
    }
LABEL_22:
    v23 = (v39 - 1) & v39;
    v60 = v40;
  }
  v41 = v25 + 5;
  if (v25 + 5 >= v53)
  {
LABEL_29:
    swift_release();
    return v51;
  }
  v39 = *(_QWORD *)(v52 + 8 * v41);
  if (v39)
  {
    v40 = v25 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    v40 = v41 + 1;
    if (__OFADD__(v41, 1))
      break;
    if (v40 >= v53)
      goto LABEL_29;
    v39 = *(_QWORD *)(v52 + 8 * v40);
    ++v41;
    if (v39)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2134CB85C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2134CB888(char a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint32_t v15;
  double v16;
  double v17;
  uint64_t v18;
  os_log_type_t v19;
  double v20;

  v2 = v1;
  v4 = (_BYTE *)(v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  result = swift_beginAccess();
  if ((*v4 & 1) == 0)
  {
    v20 = 3600.0;
    v6 = v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_backoffInterval;
    if ((a1 & 1) != 0)
    {
      *(_QWORD *)v6 = 0;
      *(_BYTE *)(v6 + 8) = 1;
      if (qword_253F00670 != -1)
        swift_once();
      v7 = sub_2134D8EC0();
      __swift_project_value_buffer(v7, (uint64_t)qword_253F00AB0);
      v8 = sub_2134D8EA8();
      v9 = sub_2134D9088();
      if (!os_log_type_enabled(v8, v9))
        goto LABEL_18;
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      v11 = "Resetting backoff.";
      v12 = v8;
      v13 = v9;
      v14 = v10;
      v15 = 2;
    }
    else
    {
      if ((*(_BYTE *)(v6 + 8) & 1) != 0)
        v16 = 600.0;
      else
        v16 = *(double *)v6 + *(double *)v6;
      if (v16 <= 86400.0)
        v17 = v16;
      else
        v17 = 86400.0;
      *(double *)v6 = v17;
      *(_BYTE *)(v6 + 8) = 0;
      v20 = v17;
      if (qword_253F00670 != -1)
        swift_once();
      v18 = sub_2134D8EC0();
      __swift_project_value_buffer(v18, (uint64_t)qword_253F00AB0);
      v8 = sub_2134D8EA8();
      v19 = sub_2134D9088();
      if (!os_log_type_enabled(v8, v19))
        goto LABEL_18;
      v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v10 = 134217984;
      sub_2134D9148();
      v11 = "Incrementing backoff to %f seconds.";
      v12 = v8;
      v13 = v19;
      v14 = v10;
      v15 = 12;
    }
    _os_log_impl(&dword_2134A1000, v12, v13, v11, v14, v15);
    MEMORY[0x2199B5148](v10, -1, -1);
LABEL_18:

    swift_beginAccess();
    return sub_2134CBAE4(v20);
  }
  return result;
}

uint64_t sub_2134CBAE4(double a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t ObjectType;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  char *v42;
  uint64_t result;
  _QWORD *v44;
  uint64_t v45;
  void (*v46)(_QWORD *, _QWORD, uint64_t);
  uint64_t v47;
  char *v48;
  void (*v49)(_QWORD *, uint64_t);
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  double aBlock;
  uint64_t v69;
  uint64_t (*v70)();
  void *v71;
  void *v72;
  uint64_t v73;

  v2 = v1;
  v62 = sub_2134D8F38();
  v58 = *(_QWORD *)(v62 - 8);
  v5 = MEMORY[0x24BDAC7A8](v62, v4);
  v61 = (_QWORD **)((char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5, v7);
  v55 = (_QWORD **)((char *)&v55 - v8);
  v60 = sub_2134D8F8C();
  v57 = *(_QWORD *)(v60 - 8);
  v10 = MEMORY[0x24BDAC7A8](v60, v9);
  v67 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v12);
  v59 = (char *)&v55 - v13;
  v14 = sub_2134D8F44();
  v65 = *(_QWORD *)(v14 - 8);
  v66 = v14;
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2134D8F5C();
  v63 = *(_QWORD *)(v18 - 8);
  v64 = v18;
  MEMORY[0x24BDAC7A8](v18, v19);
  v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_2134D90F4();
  v23 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0];
  v24 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22, v25);
  v27 = (char *)&v55 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2134D7D30(0, &qword_253F00888);
  aBlock = MEMORY[0x24BEE4AF8];
  sub_2134D8244(&qword_253F00880, v23, MEMORY[0x24BEE57D0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F00868);
  sub_2134D7D68((unint64_t *)&unk_253F00870, &qword_253F00868, MEMORY[0x24BEE12C8]);
  sub_2134D916C();
  v28 = sub_2134D9100();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v22);
  ObjectType = swift_getObjectType();
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v2;
  v72 = sub_2134D7DA8;
  v73 = v30;
  aBlock = MEMORY[0x24BDAC760];
  v69 = 1107296256;
  v70 = sub_2134C7A98;
  v71 = &block_descriptor_49;
  v31 = _Block_copy(&aBlock);
  v56 = v2;
  sub_2134D8F50();
  sub_2134CC660();
  sub_2134D910C();
  _Block_release(v31);
  v32 = v66;
  v33 = *(void (**)(char *, uint64_t))(v65 + 8);
  v33(v17, v66);
  v34 = v64;
  v35 = *(void (**)(char *, uint64_t))(v63 + 8);
  v35(v21, v64);
  swift_release();
  v72 = sub_2134CC594;
  v73 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v69 = 1107296256;
  v70 = sub_2134C7A98;
  v71 = &block_descriptor_52;
  v36 = _Block_copy(&aBlock);
  sub_2134D8F50();
  sub_2134CC660();
  v65 = ObjectType;
  v37 = v28;
  sub_2134D9118();
  _Block_release(v36);
  v33(v17, v32);
  v35(v21, v34);
  if (qword_253F00670 != -1)
    swift_once();
  v38 = sub_2134D8EC0();
  __swift_project_value_buffer(v38, (uint64_t)qword_253F00AB0);
  v39 = sub_2134D8EA8();
  v40 = sub_2134D9088();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v41 = 134217984;
    aBlock = a1;
    sub_2134D9148();
    _os_log_impl(&dword_2134A1000, v39, v40, "Setting up DispatchSourceTimer with %f seconds.", v41, 0xCu);
    MEMORY[0x2199B5148](v41, -1, -1);
  }

  v42 = v67;
  result = sub_2134D8F80();
  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  v44 = v55;
  *v55 = (uint64_t)a1;
  v45 = v58;
  v46 = *(void (**)(_QWORD *, _QWORD, uint64_t))(v58 + 104);
  v47 = v62;
  v46(v44, *MEMORY[0x24BEE5420], v62);
  v48 = v59;
  MEMORY[0x2199B45F0](v42, v44);
  v49 = *(void (**)(_QWORD *, uint64_t))(v45 + 8);
  v49(v44, v47);
  v50 = *(void (**)(char *, uint64_t))(v57 + 8);
  v51 = v60;
  v50(v42, v60);
  v46(v44, *MEMORY[0x24BEE5418], v47);
  v52 = v61;
  *v61 = 0;
  v46(v52, *MEMORY[0x24BEE5400], v47);
  MEMORY[0x2199B4788](v48, v44, v52, v65);
  v49(v52, v47);
  v49(v44, v47);
  v53 = v56;
  v50(v48, v51);
  sub_2134D9130();
  v54 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer;
  if (*(_QWORD *)&v53[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer])
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2134D9124();
    swift_unknownObjectRelease();
  }
  *(_QWORD *)&v53[v54] = v37;
  return swift_unknownObjectRelease();
}

uint64_t sub_2134CC104(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t result;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t aBlock[6];

  v2 = sub_2134D8F44();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2134D8F5C();
  v29 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253F00670 != -1)
    swift_once();
  v11 = sub_2134D8EC0();
  __swift_project_value_buffer(v11, (uint64_t)qword_253F00AB0);
  v12 = sub_2134D8EA8();
  v13 = sub_2134D9088();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2134A1000, v12, v13, "DispatchSourceTimer triggered.", v14, 2u);
    MEMORY[0x2199B5148](v14, -1, -1);
  }

  *(_QWORD *)&a1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer] = 0;
  swift_unknownObjectRelease();
  result = sub_2134CA1D4();
  if ((result & 1) != 0)
  {
    v16 = sub_2134D8EA8();
    v17 = sub_2134D9088();
    v18 = os_log_type_enabled(v16, v17);
    v28 = v7;
    if (v18)
    {
      v27 = v3;
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      aBlock[0] = v20;
      *(_DWORD *)v19 = 136315138;
      if (qword_253F00768 != -1)
        swift_once();
      v21 = sub_2134D9004();
      v30 = sub_2134C1AE0(v21, v22, aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2134A1000, v16, v17, "Posting %s.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v20, -1, -1);
      MEMORY[0x2199B5148](v19, -1, -1);

      v3 = v27;
    }
    else
    {

    }
    sub_2134D7D30(0, &qword_253F007D0);
    v23 = (void *)sub_2134D90C4();
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = a1;
    aBlock[4] = (uint64_t)sub_2134D7DB0;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2134C7A98;
    aBlock[3] = (uint64_t)&block_descriptor_58;
    v25 = _Block_copy(aBlock);
    v26 = a1;
    swift_release();
    sub_2134D8F50();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    sub_2134D916C();
    MEMORY[0x2199B4728](0, v10, v6, v25);
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v10, v28);
  }
  return result;
}

void sub_2134CC510()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = v0;
  if (qword_253F00768 != -1)
  {
    swift_once();
    v0 = v1;
  }
  objc_msgSend(v0, sel_postNotificationName_object_, qword_253F00760, 0);

}

void sub_2134CC594()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_253F00670 != -1)
    swift_once();
  v0 = sub_2134D8EC0();
  __swift_project_value_buffer(v0, (uint64_t)qword_253F00AB0);
  oslog = sub_2134D8EA8();
  v1 = sub_2134D9088();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2134A1000, oslog, v1, "DispatchSourceTimer cancelled.", v2, 2u);
    MEMORY[0x2199B5148](v2, -1, -1);
  }

}

uint64_t sub_2134CC660()
{
  sub_2134D8F44();
  sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
  sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
  return sub_2134D916C();
}

uint64_t sub_2134CC714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2 + 16;
  swift_beginAccess();
  v7 = MEMORY[0x2199B519C](v6);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(id *)(v7 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue);

    MEMORY[0x24BDAC7A8](v10, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F008B8);
    sub_2134D90D0();

  }
  return a4(a1);
}

void sub_2134CC808(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x2199B519C](v5);
  if (v6)
  {
    v7 = (void *)v6;
    swift_beginAccess();
    sub_2134D4094(a2, &v8);
    swift_endAccess();

  }
  *a3 = 0;
}

void sub_2134CC8B0(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v22 = sub_2134D8EC0();
  v2 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22, v3);
  v21[5] = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00680);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2134D8E48();
  v21[2] = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v21[0] = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13);
  v21[1] = (char *)v21 - v14;
  v15 = sub_2134D8E18();
  v17 = MEMORY[0x24BDAC7A8](v15, v16);
  MEMORY[0x24BDAC7A8](v17, v18);
  v19 = *a1;
  v21[4] = (char)v19;
  v21[6] = v2;
  v20 = (char *)&loc_2134CCA4C + dword_2134CD434[v19];
  v21[3] = v8;
  __asm { BR              X9 }
}

uint64_t sub_2134CCA64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  void (*v63)(uint64_t, uint64_t);
  double v64;
  double v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;

  v8 = sub_2134D9238();
  swift_bridgeObjectRelease();
  v9 = v6 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  if ((v8 & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v5, v9, v2);
    *(_BYTE *)(v7 - 192) = v4;
    sub_2134C7FE0();
    sub_2134D8DDC();
    swift_bridgeObjectRelease();
    sub_2134D8DE8();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v1, v9, v2);
    *(_BYTE *)(v7 - 192) = v4;
    sub_2134C7FE0();
    sub_2134D8DDC();
    swift_bridgeObjectRelease();
    sub_2134D8DE8();
    v5 = v1;
  }
  v10 = sub_2134D8E00();
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v5, v2);
  v13 = (uint64_t *)(v6 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress);
  v14 = v12;
  swift_beginAccess();
  v15 = *v13;
  swift_bridgeObjectRetain();
  v16 = sub_2134CD448(v4, v15);
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0
    || (v17 = (void *)objc_opt_self(),
        v18 = objc_msgSend(v17, sel_defaultManager),
        v19 = (void *)sub_2134D8FE0(),
        v20 = objc_msgSend(v18, sel_fileExistsAtPath_, v19),
        v18,
        v19,
        !v20))
  {
    v34 = v10;
    v35 = v16 ^ 1;
    if (qword_253F00670 != -1)
      swift_once();
    v36 = *(_QWORD *)(v7 - 248);
    v37 = __swift_project_value_buffer(v36, (uint64_t)qword_253F00AB0);
    v38 = *(_QWORD *)(v7 - 256);
    v39 = *(_QWORD *)(v7 - 264);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v37, v36);
    swift_bridgeObjectRetain();
    v40 = sub_2134D8EA8();
    v41 = sub_2134D9070();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = swift_slowAlloc();
      v43 = swift_slowAlloc();
      *(_QWORD *)(v7 - 192) = v43;
      v44 = *(_QWORD *)(v7 - 272);
      v45 = *(_QWORD *)&aTotal_2[v44 * 8];
      *(_DWORD *)v42 = 136315394;
      *(_QWORD *)(v7 - 200) = sub_2134C1AE0(v45, qword_2134FA408[v44], (uint64_t *)(v7 - 192));
      sub_2134D9148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v7 - 200) = sub_2134C1AE0(v34, v14, (uint64_t *)(v7 - 192));
      sub_2134D9148();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2134A1000, v40, v41, "Cached file for %s not found. File Name: %s", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v43, -1, -1);
      MEMORY[0x2199B5148](v42, -1, -1);

      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v7 - 256) + 8))(*(_QWORD *)(v7 - 264), *(_QWORD *)(v7 - 248));
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v36);
    }
  }
  else
  {
    v21 = v3;
    v22 = objc_msgSend(v17, sel_defaultManager);
    v23 = (void *)sub_2134D8FE0();
    *(_QWORD *)(v7 - 192) = 0;
    v24 = objc_msgSend(v22, sel_attributesOfItemAtPath_error_, v23, v7 - 192);

    v25 = *(void **)(v7 - 192);
    v26 = v10;
    if (v24)
    {
      type metadata accessor for FileAttributeKey();
      sub_2134D8244(&qword_254B9EE38, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2134F9E58);
      v27 = sub_2134D8FBC();
      v28 = v25;

      if (*(_QWORD *)(v27 + 16))
      {
        v29 = (id)*MEMORY[0x24BDD0C98];
        v30 = sub_2134C6778((uint64_t)v29);
        v31 = v21;
        v32 = *(_QWORD *)(v7 - 280);
        if ((v33 & 1) != 0)
        {
          sub_2134C2170(*(_QWORD *)(v27 + 56) + 32 * v30, v7 - 192);
        }
        else
        {
          *(_OWORD *)(v7 - 192) = 0u;
          *(_OWORD *)(v7 - 176) = 0u;
        }

      }
      else
      {
        *(_OWORD *)(v7 - 192) = 0u;
        *(_OWORD *)(v7 - 176) = 0u;
        v31 = v21;
        v32 = *(_QWORD *)(v7 - 280);
      }
      v57 = *(_QWORD *)(v7 - 288);
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v7 - 168))
      {
        v58 = swift_dynamicCast();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v57 + 56))(v32, v58 ^ 1u, 1, v31);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v32, 1, v31) != 1)
        {
          swift_bridgeObjectRelease();
          v59 = *(_QWORD *)(v7 - 296);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32))(v59, v32, v31);
          v60 = *(_QWORD *)(v7 - 304);
          sub_2134D8E3C();
          sub_2134D8E24();
          v62 = v61;
          v63 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
          v63(v60, v31);
          sub_2134D8E24();
          v65 = v64;
          v63(v59, v31);
          v35 = v62 - v65 > 3600.0;
          return v35 & 1;
        }
      }
      else
      {
        sub_2134D8004(v7 - 192, &qword_253F00810);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56))(v32, 1, 1, v31);
      }
      sub_2134D8004(v32, &qword_253F00680);
      if (qword_253F00670 != -1)
        swift_once();
      __swift_project_value_buffer(*(_QWORD *)(v7 - 248), (uint64_t)qword_253F00AB0);
      swift_bridgeObjectRetain();
      v51 = sub_2134D8EA8();
      v66 = sub_2134D907C();
      if (!os_log_type_enabled(v51, v66))
      {

        swift_bridgeObjectRelease_n();
        v35 = 0;
        return v35 & 1;
      }
      v67 = (uint8_t *)swift_slowAlloc();
      v68 = swift_slowAlloc();
      *(_QWORD *)(v7 - 192) = v68;
      *(_DWORD *)v67 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v7 - 200) = sub_2134C1AE0(v10, v14, (uint64_t *)(v7 - 192));
      sub_2134D9148();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2134A1000, v51, v66, "No last modified data attribute for file. This may cause serious issues in refresh policy. File: %s", v67, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v68, -1, -1);
      MEMORY[0x2199B5148](v67, -1, -1);
LABEL_33:

      v35 = 0;
      return v35 & 1;
    }
    v47 = v25;
    v48 = (void *)sub_2134D8DAC();

    swift_willThrow();
    if (qword_253F00670 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v7 - 248), (uint64_t)qword_253F00AB0);
    v49 = v48;
    swift_bridgeObjectRetain();
    v50 = v48;
    v51 = sub_2134D8EA8();
    v52 = sub_2134D907C();
    if (!os_log_type_enabled(v51, v52))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_33;
    }
    v53 = swift_slowAlloc();
    v54 = swift_slowAlloc();
    *(_QWORD *)(v7 - 192) = v54;
    *(_DWORD *)v53 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v7 - 200) = sub_2134C1AE0(v26, v14, (uint64_t *)(v7 - 192));
    sub_2134D9148();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v53 + 12) = 2080;
    swift_getErrorValue();
    v55 = sub_2134D925C();
    *(_QWORD *)(v7 - 200) = sub_2134C1AE0(v55, v56, (uint64_t *)(v7 - 192));
    sub_2134D9148();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2134A1000, v51, v52, "No last modified data attribute for file %s. Error: %s", (uint8_t *)v53, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199B5148](v54, -1, -1);
    MEMORY[0x2199B5148](v53, -1, -1);

    v35 = 0;
  }
  return v35 & 1;
}

uint64_t sub_2134CD448(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  if (*(_QWORD *)(a2 + 16)
    && (sub_2134D9298(),
        sub_2134D9010(),
        swift_bridgeObjectRelease(),
        v4 = sub_2134D92B0(),
        v5 = -1 << *(_BYTE *)(a2 + 32),
        v6 = v4 & ~v5,
        ((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    v7 = ~v5;
    v8 = a1;
    v9 = *(_QWORD *)&aTotal_2[v8 * 8];
    v10 = qword_2134FA408[v8];
    while (*(_QWORD *)&aTotal_2[8 * *(char *)(*(_QWORD *)(a2 + 48) + v6)] != v9
         || qword_2134FA408[*(char *)(*(_QWORD *)(a2 + 48) + v6)] != v10)
    {
      v12 = sub_2134D9238();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
          continue;
      }
      return v12 & 1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_2134CD5A4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  char *v26;
  double v27;
  double v28;
  void (*v29)(char *, uint64_t);
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00680);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2134D8E48();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11);
  v39 = (char *)&v38 - v12;
  v13 = sub_2134D8F44();
  v41 = *(uint64_t *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_2134D8F5C();
  v17 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40, v18);
  v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2134CA1D4())
  {
    sub_2134D7D30(0, &qword_253F007D0);
    v21 = (void *)sub_2134D90C4();
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v0;
    aBlock[4] = sub_2134D7D28;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2134C7A98;
    aBlock[3] = &block_descriptor_43;
    v23 = _Block_copy(aBlock);
    v24 = v0;
    swift_release();
    sub_2134D8F50();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    sub_2134D916C();
    MEMORY[0x2199B4728](0, v20, v16, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v13);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v40);
  }
  else
  {
    sub_2134CE0FC((uint64_t)v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      return sub_2134D8004((uint64_t)v4, &qword_253F00680);
    }
    else
    {
      v26 = v39;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v39, v4, v5);
      sub_2134D8E3C();
      sub_2134D8E24();
      v28 = v27;
      v29 = *(void (**)(char *, uint64_t))(v6 + 8);
      v29(v10, v5);
      sub_2134D8E24();
      v31 = v30 - v28;
      v32 = 3600.0;
      if (qword_253F00670 != -1)
      {
        *(double *)&v41 = 3600.0;
        swift_once();
        v32 = *(double *)&v41;
      }
      v33 = v31 + v32;
      v34 = sub_2134D8EC0();
      __swift_project_value_buffer(v34, (uint64_t)qword_253F00AB0);
      v35 = sub_2134D8EA8();
      v36 = sub_2134D9088();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v37 = 134217984;
        *(double *)aBlock = v33;
        sub_2134D9148();
        _os_log_impl(&dword_2134A1000, v35, v36, "Scheduling time to check for clouds textures expiration. Remaining interval %f", v37, 0xCu);
        MEMORY[0x2199B5148](v37, -1, -1);
      }

      sub_2134CBAE4(v33);
      return ((uint64_t (*)(char *, uint64_t))v29)(v26, v5);
    }
  }
}

void sub_2134CD9E0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  id v5;

  if (qword_253F00670 != -1)
    swift_once();
  v0 = sub_2134D8EC0();
  __swift_project_value_buffer(v0, (uint64_t)qword_253F00AB0);
  v1 = sub_2134D8EA8();
  v2 = sub_2134D9088();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2134A1000, v1, v2, "Clouds textures expired.", v3, 2u);
    MEMORY[0x2199B5148](v3, -1, -1);
  }

  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v5 = v4;
  if (qword_253F00768 != -1)
  {
    swift_once();
    v4 = v5;
  }
  objc_msgSend(v4, sel_postNotificationName_object_, qword_253F00760, 0);

}

uint64_t sub_2134CDB20@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  void (*v43)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00680);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2134D8E18();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  v14 = v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
  LOBYTE(v49) = (_BYTE)a1;
  sub_2134C7FE0();
  sub_2134D8DDC();
  swift_bridgeObjectRelease();
  sub_2134D8DE8();
  v15 = sub_2134D8E00();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_defaultManager);
  v20 = (void *)sub_2134D8FE0();
  LODWORD(v10) = objc_msgSend(v19, sel_fileExistsAtPath_, v20);

  if ((_DWORD)v10)
  {
    v21 = objc_msgSend(v18, sel_defaultManager);
    v22 = (void *)sub_2134D8FE0();
    *(_QWORD *)&v49 = 0;
    v23 = objc_msgSend(v21, sel_attributesOfItemAtPath_error_, v22, &v49);

    v24 = (id)v49;
    if (v23)
    {
      swift_bridgeObjectRelease();
      type metadata accessor for FileAttributeKey();
      sub_2134D8244(&qword_254B9EE38, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2134F9E58);
      v25 = sub_2134D8FBC();

      if (*(_QWORD *)(v25 + 16))
      {
        v26 = (id)*MEMORY[0x24BDD0C98];
        v27 = sub_2134C6778((uint64_t)v26);
        if ((v28 & 1) != 0)
        {
          sub_2134C2170(*(_QWORD *)(v25 + 56) + 32 * v27, (uint64_t)&v49);
        }
        else
        {
          v49 = 0u;
          v50 = 0u;
        }

      }
      else
      {
        v49 = 0u;
        v50 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v50 + 1))
      {
        v40 = sub_2134D8E48();
        v41 = swift_dynamicCast();
        v42 = *(_QWORD *)(v40 - 8);
        v43 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56);
        v43(v8, v41 ^ 1u, 1, v40);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v8, 1, v40) != 1)
        {
          (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(a2, v8, v40);
          return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v43)(a2, 0, 1, v40);
        }
      }
      else
      {
        sub_2134D8004((uint64_t)&v49, &qword_253F00810);
        v45 = sub_2134D8E48();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v8, 1, 1, v45);
      }
      sub_2134D8004((uint64_t)v8, &qword_253F00680);
    }
    else
    {
      v29 = v24;
      v30 = (void *)sub_2134D8DAC();

      swift_willThrow();
      if (qword_253F00670 != -1)
        swift_once();
      v31 = sub_2134D8EC0();
      __swift_project_value_buffer(v31, (uint64_t)qword_253F00AB0);
      v32 = v30;
      v33 = v30;
      swift_bridgeObjectRetain();
      v34 = sub_2134D8EA8();
      v35 = sub_2134D907C();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = swift_slowAlloc();
        v37 = swift_slowAlloc();
        *(_QWORD *)&v49 = v37;
        *(_DWORD *)v36 = 136315394;
        swift_bridgeObjectRetain();
        v48 = sub_2134C1AE0(v15, v17, (uint64_t *)&v49);
        sub_2134D9148();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v36 + 12) = 2080;
        swift_getErrorValue();
        v38 = sub_2134D925C();
        v48 = sub_2134C1AE0(v38, v39, (uint64_t *)&v49);
        sub_2134D9148();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2134A1000, v34, v35, "No last modified data attribute for file %s. Error: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2199B5148](v37, -1, -1);
        MEMORY[0x2199B5148](v36, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v46 = sub_2134D8E48();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(a2, 1, 1, v46);
}

uint64_t sub_2134CE0FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  void (*v42)(uint64_t, char *, uint64_t);
  void (*v43)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  _QWORD *v49;
  uint64_t v50;
  char v51;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00680);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v41 = (char *)&v38 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v47 = (uint64_t)&v38 - v13;
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v38 - v15;
  v17 = sub_2134D8E48();
  v18 = *(_QWORD **)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v48 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v18[7];
  v46 = a1;
  v43 = v21;
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v21)(a1, 1, 1, v17);
  if (qword_253F006D8 != -1)
    result = swift_once();
  v23 = qword_253F00B20;
  v50 = *(_QWORD *)(qword_253F00B20 + 16);
  if (v50)
  {
    v40 = v7;
    swift_bridgeObjectRetain();
    v24 = 0;
    v25 = v48;
    v38 = v17;
    v39 = v16;
    v49 = v18;
    v44 = v1;
    v45 = v23;
    while (1)
    {
      v51 = *(_BYTE *)(v23 + v24 + 32);
      sub_2134CDB20(&v51, (uint64_t)v16);
      v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18[6];
      if (v26((uint64_t)v16, 1, v17) == 1)
      {
        sub_2134D8004((uint64_t)v16, &qword_253F00680);
      }
      else
      {
        v27 = (void (*)(char *, char *, uint64_t))v18[4];
        v27(v25, v16, v17);
        v28 = v46;
        v29 = v47;
        sub_2134D80EC(v46, v47, &qword_253F00680);
        v30 = v25;
        v31 = v26(v29, 1, v17);
        sub_2134D8004(v29, &qword_253F00680);
        if (v31 == 1)
        {
          sub_2134D8004(v28, &qword_253F00680);
          v27((char *)v28, v30, v17);
          v43(v28, 0, 1, v17);
          v18 = v49;
          v25 = v30;
          v23 = v45;
        }
        else
        {
          v42 = (void (*)(uint64_t, char *, uint64_t))v27;
          v33 = (uint64_t)v40;
          v32 = (uint64_t)v41;
          sub_2134D80EC(v28, (uint64_t)v40, &qword_253F00680);
          result = v26(v33, 1, v17);
          if ((_DWORD)result == 1)
          {
            __break(1u);
            return result;
          }
          v34 = v48;
          v35 = sub_2134D8E30();
          v36 = (void (*)(uint64_t, uint64_t))v49[1];
          v36(v33, v17);
          if ((v35 & 1) != 0)
          {
            v37 = v28;
            sub_2134D8004(v28, &qword_253F00680);
            v42(v32, v34, v17);
            v43(v32, 0, 1, v17);
          }
          else
          {
            v36((uint64_t)v34, v17);
            v37 = v28;
            sub_2134D7F28(v28, v32, &qword_253F00680);
          }
          v23 = v45;
          sub_2134D7F28(v32, v37, &qword_253F00680);
          v25 = v48;
          v18 = v49;
          v17 = v38;
          v16 = v39;
        }
      }
      if (v50 == ++v24)
        return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_2134CE484(uint64_t a1, void (*a2)(char *), void (*a3)(_QWORD, _QWORD), uint64_t a4, uint64_t a5, void *a6, uint64_t a7, double a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *);
  void (*v67)(char *);
  void (*v68)(_QWORD, _QWORD);
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  void *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *);
  void (*v99)(_QWORD, _QWORD);
  uint64_t v100;
  uint64_t aBlock[6];
  uint64_t v102;

  v82 = a7;
  v85 = a6;
  v96 = a5;
  v98 = a2;
  v99 = a3;
  v11 = sub_2134D8F44();
  v92 = *(_QWORD *)(v11 - 8);
  v93 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v91 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_2134D8F5C();
  v89 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90, v14);
  v88 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_2134D8F74();
  v84 = *(_QWORD *)(v87 - 8);
  v17 = MEMORY[0x24BDAC7A8](v87, v16);
  v83 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17, v19);
  v86 = (char *)&v81 - v20;
  v21 = sub_2134D8EC0();
  v97 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21, v22);
  v94 = (char *)&v81 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23, v25);
  v95 = (char *)&v81 - v26;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v27, v28);
  v30 = (char *)&v81 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_2134D8E18();
  v32 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31, v33);
  v35 = (char *)&v81 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F008A8);
  MEMORY[0x24BDAC7A8](v36, v37);
  v39 = (char *)&v81 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2134D80EC(a1, (uint64_t)v39, (uint64_t *)&unk_253F008A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (*v39 != 1 || a4 == 0)
    {
      v41 = v21;
      if (qword_253F00670 != -1)
        swift_once();
      v42 = __swift_project_value_buffer(v21, (uint64_t)qword_253F00AB0);
      v43 = v97;
      v44 = v94;
      (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v94, v42, v41);
      v45 = sub_2134D8EA8();
      v46 = sub_2134D907C();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = swift_slowAlloc();
        v82 = v41;
        v48 = (uint8_t *)v47;
        v49 = swift_slowAlloc();
        *(_DWORD *)v48 = 136315138;
        v50 = (char)v96;
        v51 = *(_QWORD *)&aTotal_2[v50 * 8];
        aBlock[0] = v49;
        v102 = sub_2134C1AE0(v51, qword_2134FA408[v50], aBlock);
        sub_2134D9148();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2134A1000, v45, v46, "Exhausted retry attempts for %s", v48, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199B5148](v49, -1, -1);
        MEMORY[0x2199B5148](v48, -1, -1);

        (*(void (**)(char *, uint64_t))(v97 + 8))(v94, v82);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v41);
      }
      v66 = v98;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v30, 1, 1, v31);
      v66(v30);
      return sub_2134D8004((uint64_t)v30, &qword_253F00678);
    }
    else
    {
      v53 = a4;
      v94 = (char *)(v82 + 16);
      v54 = v96;
      v55 = v21;
      if (qword_253F00670 != -1)
        swift_once();
      v56 = __swift_project_value_buffer(v21, (uint64_t)qword_253F00AB0);
      v57 = v97;
      v58 = v95;
      (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v95, v56, v55);
      v59 = sub_2134D8EA8();
      v60 = sub_2134D9088();
      if (os_log_type_enabled(v59, v60))
      {
        v61 = swift_slowAlloc();
        v82 = v55;
        v62 = v61;
        v63 = swift_slowAlloc();
        aBlock[0] = v63;
        v64 = v54;
        v65 = *(_QWORD *)&aTotal_2[v64 * 8];
        *(_DWORD *)v62 = 136315650;
        v102 = sub_2134C1AE0(v65, qword_2134FA408[v64], aBlock);
        sub_2134D9148();
        swift_bridgeObjectRelease();
        *(_WORD *)(v62 + 12) = 2048;
        v102 = v53;
        sub_2134D9148();
        *(_WORD *)(v62 + 22) = 2048;
        v102 = *(_QWORD *)&a8;
        sub_2134D9148();
        _os_log_impl(&dword_2134A1000, v59, v60, "Attempting to retry download for %s. Remaining retries: %ld. Backoff period: %f", (uint8_t *)v62, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x2199B5148](v63, -1, -1);
        MEMORY[0x2199B5148](v62, -1, -1);

        (*(void (**)(char *, uint64_t))(v57 + 8))(v95, v82);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v55);
      }
      v67 = v98;
      v68 = v99;
      v69 = v83;
      sub_2134D8F68();
      v70 = v86;
      MEMORY[0x2199B45E4](v69, a8);
      v99 = *(void (**)(_QWORD, _QWORD))(v84 + 8);
      v71 = v87;
      v99(v69, v87);
      v72 = swift_allocObject();
      v73 = v94;
      swift_beginAccess();
      v74 = (void *)MEMORY[0x2199B519C](v73);
      swift_unknownObjectWeakInit();

      v75 = swift_allocObject();
      *(_QWORD *)(v75 + 16) = v72;
      *(_BYTE *)(v75 + 24) = v54;
      v76 = v85;
      *(_QWORD *)(v75 + 32) = v85;
      *(_QWORD *)(v75 + 40) = v53;
      *(double *)(v75 + 48) = a8;
      *(_QWORD *)(v75 + 56) = v67;
      *(_QWORD *)(v75 + 64) = v68;
      aBlock[4] = (uint64_t)sub_2134D8150;
      aBlock[5] = v75;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2134C7A98;
      aBlock[3] = (uint64_t)&block_descriptor_157;
      v77 = _Block_copy(aBlock);
      swift_retain();
      v76;
      swift_retain();
      v78 = v88;
      sub_2134D8F50();
      v100 = MEMORY[0x24BEE4AF8];
      sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
      sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
      v79 = v91;
      v80 = v93;
      sub_2134D916C();
      MEMORY[0x2199B46F8](v70, v78, v79, v77);
      _Block_release(v77);
      (*(void (**)(char *, uint64_t))(v92 + 8))(v79, v80);
      (*(void (**)(char *, uint64_t))(v89 + 8))(v78, v90);
      v99(v70, v71);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    (*(void (**)(char *, _BYTE *, uint64_t))(v32 + 32))(v35, v39, v31);
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v30, v35, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v30, 0, 1, v31);
    v98(v30);
    sub_2134D8004((uint64_t)v30, &qword_253F00678);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v35, v31);
  }
}

void sub_2134CED84(uint64_t a1, int a2, void *a3, uint64_t a4, void (*a5)(char *), void (*a6)(_QWORD, _QWORD), double a7)
{
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);

  v13 = a1 + 16;
  swift_beginAccess();
  v14 = MEMORY[0x2199B519C](v13);
  if (v14)
  {
    v15 = (void *)v14;
    LOBYTE(v18) = a2;
    v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    v17 = a3;
    sub_2134D6B80(&v18, v17, (uint64_t)v15, a5, a6, a4 - (a4 > 0), a2, v17, a7, v16);

    swift_release();
    swift_release();

  }
}

uint64_t sub_2134CEE8C(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint8_t *v78;
  uint64_t v79;
  void *v80;
  _BYTE *v81;
  _BYTE *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  _BYTE *v95;
  _BYTE *v96;
  _QWORD *v97;
  _QWORD *v98;
  _QWORD *v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  void *v103;
  _QWORD *v104;
  _BYTE *v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t v109;
  NSObject *v110;
  os_log_type_t v111;
  _BOOL4 v112;
  void *v113;
  uint8_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  NSObject *v120;
  os_log_type_t v121;
  uint8_t *v122;
  uint64_t v123;
  NSObject *v124;
  NSObject *v125;
  _QWORD *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  _BYTE v132[4];
  int v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _BYTE *v144;
  _BYTE *v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t aBlock;
  uint64_t v152;
  uint64_t (*v153)();
  void *v154;
  uint64_t (*v155)();
  _QWORD *v156;

  v139 = a8;
  v147 = a6;
  v148 = a7;
  v149 = a5;
  v143 = sub_2134D8F44();
  v142 = *(_QWORD *)(v143 - 8);
  MEMORY[0x24BDAC7A8](v143, v12);
  v145 = &v132[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v146 = (_QWORD *)sub_2134D8F5C();
  v141 = *(v146 - 1);
  MEMORY[0x24BDAC7A8](v146, v14);
  v144 = &v132[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = &v132[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v137 = (_QWORD *)sub_2134D8E18();
  v136 = *(v137 - 1);
  MEMORY[0x24BDAC7A8](v137, v20);
  v22 = &v132[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = sub_2134D8EC0();
  v140 = *(_QWORD *)(v23 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23, v24);
  v27 = &v132[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29 = MEMORY[0x24BDAC7A8](v25, v28);
  v31 = &v132[-v30];
  MEMORY[0x24BDAC7A8](v29, v32);
  v34 = &v132[-v33];
  swift_beginAccess();
  v35 = (void *)MEMORY[0x2199B519C](a4 + 16);
  if (!v35)
  {
    if (qword_253F00670 != -1)
      swift_once();
    __swift_project_value_buffer(v23, (uint64_t)qword_253F00AB0);
    v70 = sub_2134D8EA8();
    v71 = sub_2134D907C();
    v72 = os_log_type_enabled(v70, v71);
    v73 = v148;
    v74 = v147;
    v75 = v146;
    v76 = v142;
    v77 = v141;
    if (v72)
    {
      v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v78 = 0;
      _os_log_impl(&dword_2134A1000, v70, v71, "AegirCloudCoverService instance went away. Server response ignored.", v78, 2u);
      MEMORY[0x2199B5148](v78, -1, -1);
    }

    v79 = swift_allocObject();
    *(_QWORD *)(v79 + 16) = v74;
    *(_QWORD *)(v79 + 24) = v73;
    v155 = sub_2134D843C;
    v156 = (_QWORD *)v79;
    aBlock = MEMORY[0x24BDAC760];
    v152 = 1107296256;
    v153 = sub_2134C7A98;
    v154 = &block_descriptor_112;
    v80 = _Block_copy(&aBlock);
    swift_retain();
    v81 = v144;
    sub_2134D8F50();
    v150 = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    v82 = v145;
    v83 = v143;
    sub_2134D916C();
    MEMORY[0x2199B4728](0, v81, v82, v80);
    _Block_release(v80);
    (*(void (**)(_BYTE *, uint64_t))(v76 + 8))(v82, v83);
    (*(void (**)(_BYTE *, _QWORD *))(v77 + 8))(v81, v75);
    return swift_release();
  }
  v138 = v35;
  if (!a2 || (objc_opt_self(), (v36 = swift_dynamicCastObjCClass()) == 0))
  {
    if (qword_253F00670 != -1)
      swift_once();
    v57 = __swift_project_value_buffer(v23, (uint64_t)qword_253F00AB0);
    v58 = v140;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v140 + 16))(v34, v57, v23);
    v59 = a3;
    v60 = a3;
    v61 = sub_2134D8EA8();
    v62 = sub_2134D907C();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = swift_slowAlloc();
      v64 = swift_slowAlloc();
      aBlock = v64;
      v65 = (char)v139;
      v66 = *(_QWORD *)&aTotal_2[v65 * 8];
      *(_DWORD *)v63 = 136315394;
      v150 = sub_2134C1AE0(v66, qword_2134FA408[v65], &aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v63 + 12) = 2080;
      if (a3)
      {
        swift_getErrorValue();
        v67 = sub_2134D925C();
        v69 = v68;
      }
      else
      {
        v67 = 0;
        v69 = 0xE000000000000000;
      }
      v150 = sub_2134C1AE0(v67, v69, &aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2134A1000, v61, v62, "Failed to download cloud data: %s. It did not received a http response. Error: %s.", (uint8_t *)v63, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v64, -1, -1);
      MEMORY[0x2199B5148](v63, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v140 + 8))(v34, v23);
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v58 + 8))(v34, v23);
    }
    v88 = v148;
    v89 = v147;
    v90 = v143;
    v91 = v142;
    v92 = v141;
    v93 = swift_allocObject();
    *(_QWORD *)(v93 + 16) = v89;
    *(_QWORD *)(v93 + 24) = v88;
    v155 = sub_2134D806C;
    v156 = (_QWORD *)v93;
    aBlock = MEMORY[0x24BDAC760];
    v152 = 1107296256;
    v153 = sub_2134C7A98;
    v154 = &block_descriptor_118;
    v94 = _Block_copy(&aBlock);
    swift_retain();
    v95 = v144;
    sub_2134D8F50();
    v150 = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    v96 = v145;
    sub_2134D916C();
    MEMORY[0x2199B4728](0, v95, v96, v94);

    _Block_release(v94);
    (*(void (**)(_BYTE *, uint64_t))(v91 + 8))(v96, v90);
    (*(void (**)(_BYTE *, _QWORD *))(v92 + 8))(v95, v146);
    return swift_release();
  }
  v37 = (void *)v36;
  v38 = a2;
  v39 = v140;
  v135 = (uint64_t)v37;
  if (a3 || (char *)objc_msgSend(v37, sel_statusCode) - 200 > (char *)0x63)
  {
LABEL_8:
    if (qword_253F00670 != -1)
      swift_once();
    v42 = __swift_project_value_buffer(v23, (uint64_t)qword_253F00AB0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v39 + 16))(v27, v42, v23);
    v43 = a3;
    v44 = v38;
    v45 = a3;
    v46 = v44;
    v47 = sub_2134D8EA8();
    v48 = sub_2134D907C();
    if (os_log_type_enabled(v47, (os_log_type_t)v48))
    {
      v133 = v48;
      v137 = v46;
      v49 = swift_slowAlloc();
      v50 = swift_slowAlloc();
      v51 = swift_slowAlloc();
      aBlock = v51;
      v52 = (char)v139;
      v53 = *(_QWORD *)&aTotal_2[v52 * 8];
      *(_DWORD *)v49 = 136315650;
      v150 = sub_2134C1AE0(v53, qword_2134FA408[v52], &aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      v136 = v51;
      v134 = (_QWORD *)v50;
      if (a3)
      {
        swift_getErrorValue();
        v54 = sub_2134D925C();
        v56 = v55;
      }
      else
      {
        v54 = 0;
        v56 = 0xE000000000000000;
      }
      v150 = sub_2134C1AE0(v54, v56, &aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();

      *(_WORD *)(v49 + 22) = 2112;
      v87 = v135;
      v150 = v135;
      v97 = v137;
      v98 = v137;
      sub_2134D9148();
      v99 = v134;
      *v134 = v87;

      v46 = v97;
      _os_log_impl(&dword_2134A1000, v47, (os_log_type_t)v133, "Failed to download cloud data: %s. Error: %s, Response: %@", (uint8_t *)v49, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B9F050);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v99, -1, -1);
      v100 = v136;
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v100, -1, -1);
      MEMORY[0x2199B5148](v49, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v140 + 8))(v27, v23);
      v84 = v146;
      v85 = v142;
      v86 = v141;
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v39 + 8))(v27, v23);
      v84 = v146;
      v85 = v142;
      v86 = v141;
      v87 = v135;
    }
    v101 = (_QWORD *)swift_allocObject();
    v102 = v148;
    v101[2] = v147;
    v101[3] = v102;
    v101[4] = v87;
    v155 = sub_2134D80B0;
    v156 = v101;
    aBlock = MEMORY[0x24BDAC760];
    v152 = 1107296256;
    v153 = sub_2134C7A98;
    v154 = &block_descriptor_124;
    v103 = _Block_copy(&aBlock);
    v104 = v46;
    swift_retain();
    v105 = v144;
    sub_2134D8F50();
    v150 = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    v106 = v145;
    v107 = v143;
    sub_2134D916C();
    MEMORY[0x2199B4728](0, v105, v106, v103);

    _Block_release(v103);
    (*(void (**)(_BYTE *, uint64_t))(v85 + 8))(v106, v107);
    (*(void (**)(_BYTE *, _QWORD *))(v86 + 8))(v105, v84);
    return swift_release();
  }
  v134 = v38;
  sub_2134D80EC(a1, (uint64_t)v19, &qword_253F00678);
  v40 = v136;
  v41 = v137;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, _QWORD *))(v136 + 48))(v19, 1, v137) == 1)
  {
    sub_2134D8004((uint64_t)v19, &qword_253F00678);
    v38 = v134;
    goto LABEL_8;
  }
  (*(void (**)(_BYTE *, _BYTE *, _QWORD *))(v40 + 32))(v22, v19, v41);
  if (qword_253F00670 != -1)
    swift_once();
  v109 = __swift_project_value_buffer(v23, (uint64_t)qword_253F00AB0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v39 + 16))(v31, v109, v23);
  v110 = sub_2134D8EA8();
  v111 = sub_2134D9088();
  v112 = os_log_type_enabled(v110, v111);
  v113 = v134;
  if (v112)
  {
    v146 = (_QWORD *)v109;
    v114 = (uint8_t *)swift_slowAlloc();
    v115 = swift_slowAlloc();
    *(_DWORD *)v114 = 136315138;
    v116 = (char)v139;
    v117 = *(_QWORD *)&aTotal_2[v116 * 8];
    aBlock = v115;
    v150 = sub_2134C1AE0(v117, qword_2134FA408[v116], &aBlock);
    sub_2134D9148();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2134A1000, v110, v111, "Successfully downloaded task for cloud data: %s", v114, 0xCu);
    swift_arrayDestroy();
    v118 = v115;
    v113 = v134;
    MEMORY[0x2199B5148](v118, -1, -1);
    MEMORY[0x2199B5148](v114, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v140 + 8))(v31, v23);
  }
  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v39 + 8))(v31, v23);
  }
  v119 = v113;
  v120 = sub_2134D8EA8();
  v121 = sub_2134D9070();
  if (os_log_type_enabled(v120, v121))
  {
    v122 = (uint8_t *)swift_slowAlloc();
    v146 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v122 = 138412290;
    v123 = v135;
    aBlock = v135;
    v124 = v119;
    v125 = v119;
    sub_2134D9148();
    v126 = v146;
    *v146 = v123;

    v119 = v124;
    _os_log_impl(&dword_2134A1000, v120, v121, "Response: %@", v122, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9F050);
    swift_arrayDestroy();
    MEMORY[0x2199B5148](v126, -1, -1);
    MEMORY[0x2199B5148](v122, -1, -1);
  }
  else
  {

    v120 = v119;
  }
  v128 = v148;
  v127 = v149;
  v129 = v147;

  LOBYTE(aBlock) = v139;
  v130 = v127;
  v131 = v138;
  sub_2134D0134(v22, (char *)&aBlock, v130, v129, v128);

  return (*(uint64_t (**)(_BYTE *, _QWORD *))(v136 + 8))(v22, v137);
}

uint64_t sub_2134CFEC8(void (*a1)(_BYTE *))
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F008A8);
  MEMORY[0x24BDAC7A8](v2, v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v4 = 0;
  swift_storeEnumTagMultiPayload();
  a1(v4);
  return sub_2134D8004((uint64_t)v4, (uint64_t *)&unk_253F008A8);
}

uint64_t sub_2134CFF58(void (*a1)(BOOL *), uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL *v8;
  uint64_t v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F008A8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (BOOL *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v8 = (char *)objc_msgSend(a3, sel_statusCode) - 500 < (char *)0xFFFFFFFFFFFFFF9CLL;
  swift_storeEnumTagMultiPayload();
  a1(v8);
  return sub_2134D8004((uint64_t)v8, (uint64_t *)&unk_253F008A8);
}

uint64_t sub_2134D0014(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, void *, void *);
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, void *, void *))(a1 + 32);
  if (a2)
  {
    sub_2134D8DF4();
    v13 = sub_2134D8E18();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    v14 = sub_2134D8E18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  swift_retain();
  v15 = a3;
  v16 = a4;
  v12(v11, a3, a4);

  swift_release();
  return sub_2134D8004((uint64_t)v11, &qword_253F00678);
}

uint64_t sub_2134D0134(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  void *v37;
  void *v38;
  unsigned int v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  id v49;
  uint64_t v50;
  void (**v51)(char *, uint64_t);
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  char *v57;
  char *v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  char *v63;
  id v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  id v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  NSObject *v84;
  os_log_type_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  void (**v92)(char *, uint64_t);
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  os_log_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  void (**v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  void *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v113;
  os_log_t v114;
  void *v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  id v121;
  void (**v122)(char *, uint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id aBlock;
  uint64_t v136;
  uint64_t (*v137)();
  void *v138;
  uint64_t (*v139)();
  uint64_t v140;
  uint64_t v141;

  v6 = v5;
  v124 = a5;
  v123 = a4;
  v125 = a3;
  v121 = a1;
  v141 = *MEMORY[0x24BDAC8D0];
  v133 = sub_2134D8EC0();
  v120 = *(_QWORD *)(v133 - 8);
  v9 = MEMORY[0x24BDAC7A8](v133, v8);
  v119 = (char *)&v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v11);
  v118 = (char *)&v113 - v12;
  v132 = sub_2134D8F44();
  v129 = *(_QWORD *)(v132 - 8);
  MEMORY[0x24BDAC7A8](v132, v13);
  v127 = (char *)&v113 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_2134D8F5C();
  v128 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131, v15);
  v126 = (char *)&v113 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2134D8E18();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  v21 = MEMORY[0x24BDAC7A8](v17, v20);
  v116 = (char *)&v113 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21, v22);
  v25 = (char *)&v113 - v24;
  v27 = MEMORY[0x24BDAC7A8](v23, v26);
  v29 = (char *)&v113 - v28;
  MEMORY[0x24BDAC7A8](v27, v30);
  v32 = (char *)&v113 - v31;
  v33 = *a2;
  v34 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v35 = v6 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  v122 = (void (**)(char *, uint64_t))v18;
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v130 = v17;
  v36(v32, v35, v17);
  v117 = v33;
  LOBYTE(aBlock) = v33;
  sub_2134C7FE0();
  sub_2134D8DDC();
  swift_bridgeObjectRelease();
  sub_2134D8DE8();
  sub_2134D10EC();
  sub_2134D8E00();
  v37 = (void *)sub_2134D8FE0();
  swift_bridgeObjectRelease();
  LODWORD(v35) = objc_msgSend(v34, sel_fileExistsAtPath_, v37);

  if (!(_DWORD)v35)
    goto LABEL_4;
  v38 = (void *)sub_2134D8DD0();
  aBlock = 0;
  v39 = objc_msgSend(v34, sel_removeItemAtURL_error_, v38, &aBlock);

  if (v39)
  {
    v40 = aBlock;
LABEL_4:
    if (qword_253F00670 != -1)
      swift_once();
    v41 = v133;
    v42 = __swift_project_value_buffer(v133, (uint64_t)qword_253F00AB0);
    v43 = sub_2134D8EA8();
    v44 = sub_2134D9088();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_2134A1000, v43, v44, "Fech Completed. Moving textures to cache directory.", v45, 2u);
      MEMORY[0x2199B5148](v45, -1, -1);
    }

    v46 = (void *)sub_2134D8DD0();
    v47 = (void *)sub_2134D8DD0();
    aBlock = 0;
    v48 = objc_msgSend(v34, sel_moveItemAtURL_toURL_error_, v46, v47, &aBlock);

    v49 = aBlock;
    if (v48)
    {
      v50 = v130;
      v36(v29, (uint64_t)v32, v130);
      v51 = v122;
      v52 = (*((unsigned __int8 *)v122 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v122 + 80);
      v53 = swift_allocObject();
      v54 = v124;
      *(_QWORD *)(v53 + 16) = v123;
      *(_QWORD *)(v53 + 24) = v54;
      ((void (*)(unint64_t, char *, uint64_t))v51[4])(v53 + v52, v29, v50);
      v139 = sub_2134D7CF8;
      v140 = v53;
      aBlock = (id)MEMORY[0x24BDAC760];
      v136 = 1107296256;
      v137 = sub_2134C7A98;
      v138 = &block_descriptor_31;
      v55 = _Block_copy(&aBlock);
      v56 = v49;
      swift_retain();
      v57 = v126;
      sub_2134D8F50();
      v134 = MEMORY[0x24BEE4AF8];
      sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
      sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
      v58 = v127;
      v59 = v132;
      sub_2134D916C();
      MEMORY[0x2199B4728](0, v57, v58, v55);
      _Block_release(v55);

      (*(void (**)(char *, uint64_t))(v129 + 8))(v58, v59);
      (*(void (**)(char *, uint64_t))(v128 + 8))(v57, v131);
      v51[1](v32, v50);
    }
    else
    {
      v60 = aBlock;
      v61 = (void *)sub_2134D8DAC();

      swift_willThrow();
      v62 = v120;
      v63 = v119;
      (*(void (**)(char *, uint64_t, uint64_t))(v120 + 16))(v119, v42, v41);
      v64 = v61;
      v65 = v61;
      v66 = sub_2134D8EA8();
      v67 = sub_2134D907C();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = swift_slowAlloc();
        v69 = (void *)swift_slowAlloc();
        aBlock = v69;
        v70 = v117;
        v71 = *(_QWORD *)&aTotal_2[8 * v117];
        *(_DWORD *)v68 = 136315394;
        v134 = sub_2134C1AE0(v71, qword_2134FA408[v70], (uint64_t *)&aBlock);
        sub_2134D9148();
        swift_bridgeObjectRelease();
        *(_WORD *)(v68 + 12) = 2080;
        swift_getErrorValue();
        v72 = sub_2134D925C();
        v134 = sub_2134C1AE0(v72, v73, (uint64_t *)&aBlock);
        sub_2134D9148();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2134A1000, v66, v67, "Failed to move file to cache directory: %s. Error: %s.", (uint8_t *)v68, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2199B5148](v69, -1, -1);
        MEMORY[0x2199B5148](v68, -1, -1);

        (*(void (**)(char *, uint64_t))(v120 + 8))(v119, v133);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v41);
      }
      v99 = swift_allocObject();
      v100 = v124;
      *(_QWORD *)(v99 + 16) = v123;
      *(_QWORD *)(v99 + 24) = v100;
      v139 = sub_2134D843C;
      v140 = v99;
      aBlock = (id)MEMORY[0x24BDAC760];
      v136 = 1107296256;
      v137 = sub_2134C7A98;
      v138 = &block_descriptor_25;
      v101 = _Block_copy(&aBlock);
      swift_retain();
      v102 = v126;
      sub_2134D8F50();
      v134 = MEMORY[0x24BEE4AF8];
      sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
      sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
      v103 = v127;
      v104 = v132;
      sub_2134D916C();
      MEMORY[0x2199B4728](0, v102, v103, v101);

      _Block_release(v101);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v103, v104);
      (*(void (**)(char *, uint64_t))(v128 + 8))(v102, v131);
      v122[1](v32, v130);
    }
    return swift_release();
  }
  v74 = aBlock;
  v75 = (char *)sub_2134D8DAC();

  swift_willThrow();
  if (qword_253F00670 != -1)
    swift_once();
  v76 = v133;
  v77 = __swift_project_value_buffer(v133, (uint64_t)qword_253F00AB0);
  v78 = v120;
  v79 = v118;
  (*(void (**)(char *, uint64_t, uint64_t))(v120 + 16))(v118, v77, v76);
  v80 = v130;
  v36(v25, (uint64_t)v121, v130);
  v81 = v116;
  v36(v116, (uint64_t)v32, v80);
  v82 = v75;
  v83 = v75;
  v84 = sub_2134D8EA8();
  v85 = sub_2134D907C();
  v86 = v85;
  if (os_log_type_enabled(v84, v85))
  {
    v87 = swift_slowAlloc();
    v115 = (void *)swift_slowAlloc();
    aBlock = v115;
    v88 = v117;
    v89 = *(_QWORD *)&aTotal_2[8 * v117];
    *(_DWORD *)v87 = 136315906;
    LODWORD(v117) = v86;
    v134 = sub_2134C1AE0(v89, qword_2134FA408[v88], (uint64_t *)&aBlock);
    v121 = v34;
    sub_2134D9148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v87 + 12) = 2080;
    sub_2134D8244(&qword_254B9EF60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v114 = v84;
    v90 = sub_2134D9220();
    v134 = sub_2134C1AE0(v90, v91, (uint64_t *)&aBlock);
    sub_2134D9148();
    swift_bridgeObjectRelease();
    v119 = v75;
    v92 = (void (**)(char *, uint64_t))v122[1];
    ((void (*)(char *, uint64_t))v92)(v25, v80);
    *(_WORD *)(v87 + 22) = 2080;
    v93 = sub_2134D9220();
    v134 = sub_2134C1AE0(v93, v94, (uint64_t *)&aBlock);
    sub_2134D9148();
    swift_bridgeObjectRelease();
    v122 = v92;
    ((void (*)(char *, uint64_t))v92)(v81, v80);
    v75 = v119;
    *(_WORD *)(v87 + 32) = 2080;
    swift_getErrorValue();
    v95 = sub_2134D925C();
    v134 = sub_2134C1AE0(v95, v96, (uint64_t *)&aBlock);
    v34 = v121;
    sub_2134D9148();
    swift_bridgeObjectRelease();

    v97 = v114;
    _os_log_impl(&dword_2134A1000, v114, (os_log_type_t)v117, "Failed to move tmp file for cloud data: %s from: %s, to: %s. Error: %s", (uint8_t *)v87, 0x2Au);
    v98 = v115;
    swift_arrayDestroy();
    MEMORY[0x2199B5148](v98, -1, -1);
    MEMORY[0x2199B5148](v87, -1, -1);

    (*(void (**)(char *, uint64_t))(v120 + 8))(v118, v133);
  }
  else
  {
    v105 = (void (**)(char *, uint64_t))v122[1];
    ((void (*)(char *, uint64_t))v105)(v25, v80);
    v122 = v105;
    ((void (*)(char *, uint64_t))v105)(v81, v80);

    (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v133);
  }
  v106 = swift_allocObject();
  v107 = v124;
  *(_QWORD *)(v106 + 16) = v123;
  *(_QWORD *)(v106 + 24) = v107;
  v139 = sub_2134D843C;
  v140 = v106;
  aBlock = (id)MEMORY[0x24BDAC760];
  v136 = 1107296256;
  v137 = sub_2134C7A98;
  v138 = &block_descriptor_37;
  v108 = _Block_copy(&aBlock);
  swift_retain();
  v109 = v126;
  sub_2134D8F50();
  v134 = MEMORY[0x24BEE4AF8];
  sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
  sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
  v110 = v127;
  v111 = v132;
  sub_2134D916C();
  MEMORY[0x2199B4728](0, v109, v110, v108);

  _Block_release(v108);
  (*(void (**)(char *, uint64_t))(v129 + 8))(v110, v111);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v109, v131);
  ((void (*)(char *, uint64_t))v122)(v32, v80);
  return swift_release();
}

uint64_t sub_2134D1030(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F008A8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2134D8E18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a3, v9);
  swift_storeEnumTagMultiPayload();
  a1(v8);
  return sub_2134D8004((uint64_t)v8, (uint64_t *)&unk_253F008A8);
}

void sub_2134D10EC()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  void (*v10)(char *, uint64_t);
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  _QWORD v33[2];
  void *v34;
  uint64_t v35;
  id v36[5];

  v1 = v0;
  v36[4] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_2134D8E18();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v8 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v6, v8, v2);
  sub_2134D8E00();
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v11 = (void *)sub_2134D8FE0();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v7, sel_fileExistsAtPath_, v11);

  if ((v12 & 1) != 0
    || (v9(v6, v8, v2),
        v13 = (void *)sub_2134D8DD0(),
        v10(v6, v2),
        v36[0] = 0,
        v14 = objc_msgSend(v7, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v13, 1, 0, v36), v13, v15 = v36[0], v14))
  {

  }
  else
  {
    v16 = v15;
    v17 = (void *)sub_2134D8DAC();

    swift_willThrow();
    if (qword_253F00670 != -1)
      swift_once();
    v18 = sub_2134D8EC0();
    __swift_project_value_buffer(v18, (uint64_t)qword_253F00AB0);
    v19 = v1;
    v20 = v17;
    v21 = v19;
    v22 = v17;
    v23 = sub_2134D8EA8();
    v24 = sub_2134D9088();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v34 = (void *)swift_slowAlloc();
      v36[0] = v34;
      *(_DWORD *)v25 = 136315394;
      v33[1] = v25 + 4;
      v9(v6, v8, v2);
      sub_2134D8244(&qword_254B9EF60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v26 = v24;
      v27 = sub_2134D9220();
      v29 = v28;
      v10(v6, v2);
      v35 = sub_2134C1AE0(v27, v29, (uint64_t *)v36);
      sub_2134D9148();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      swift_getErrorValue();
      v30 = sub_2134D925C();
      v35 = sub_2134C1AE0(v30, v31, (uint64_t *)v36);
      sub_2134D9148();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2134A1000, v23, v26, "Failed to create destination folder:%s. Error: %s", (uint8_t *)v25, 0x16u);
      v32 = v34;
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v32, -1, -1);
      MEMORY[0x2199B5148](v25, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_2134D150C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  char *v36;
  uint64_t v37;
  uint64_t result;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(char *, uint64_t, uint64_t);
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;

  v76 = a1;
  v2 = sub_2134D8E48();
  v64 = *(_QWORD *)(v2 - 8);
  v65 = v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v68 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2134D8DA0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v72 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00820);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v67 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13);
  v79 = (char *)&v62 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00828);
  MEMORY[0x24BDAC7A8](v15, v16);
  v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  v21 = MEMORY[0x24BDAC7A8](v19, v20);
  v77 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21, v23);
  v25 = (char *)&v62 - v24;
  v26 = sub_2134D8E18();
  v27 = *(_QWORD *)(v26 - 8);
  v29 = MEMORY[0x24BDAC7A8](v26, v28);
  v66 = (char *)&v62 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x24BDAC7A8](v29, v31);
  v70 = (uint64_t)&v62 - v33;
  MEMORY[0x24BDAC7A8](v32, v34);
  v36 = (char *)&v62 - v35;
  v73 = v1;
  v37 = v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_configuration;
  sub_2134D8E0C();
  v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  result = v71(v25, 1, v26);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v78 = v27;
    v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
    v75 = v26;
    v63 = v39;
    v39((uint64_t)v36, (uint64_t)v25, v26);
    sub_2134D8DDC();
    sub_2134D8DDC();
    swift_bridgeObjectRelease();
    sub_2134D8DB8();
    sub_2134D8D94();
    swift_bridgeObjectRelease();
    v69 = v6;
    v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
    v41 = v5;
    if (!v40(v18, 1, v5))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F008A0);
      sub_2134D8D70();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_2134FA430;
      sub_2134D9058();
      sub_2134D8D64();
      swift_bridgeObjectRelease();
      sub_2134D8D7C();
    }
    v42 = sub_2134D8D58();
    v43 = *(_QWORD *)(v42 - 8);
    v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
    v45 = (uint64_t)v79;
    v44(v79, 1, 1, v42);
    v46 = v40(v18, 1, v41);
    v74 = v18;
    if (v46)
    {
      v48 = (uint64_t)v77;
      v47 = v78;
      v49 = v75;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v77, 1, 1, v75);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v47 + 8))(v36, v49);
      sub_2134D8004(v48, &qword_253F00678);
      v53 = v76;
      v54 = (uint64_t)v74;
LABEL_8:
      sub_2134D7F28(v45, v53, &qword_253F00820);
      return sub_2134D8004(v54, &qword_253F00828);
    }
    v50 = v69;
    v51 = v72;
    (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v72, v18, v41);
    v48 = (uint64_t)v77;
    sub_2134D8D88();
    v45 = (uint64_t)v79;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v41);
    v49 = v75;
    v52 = v71((char *)v48, 1, v75);
    v47 = v78;
    if (v52 == 1)
      goto LABEL_7;
    v55 = v70;
    v63(v70, v48, v49);
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v66, v55, v49);
    v56 = (uint64_t)v67;
    sub_2134D8D40();
    v44((char *)v56, 0, 1, v42);
    sub_2134D7C3C(v56, v45);
    v57 = (uint64_t)v68;
    sub_2134D8E3C();
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v45, 1, v42);
    v54 = (uint64_t)v74;
    if ((_DWORD)result != 1)
    {
      v58 = *(_QWORD *)(v37 + 32);
      v59 = *(_QWORD *)(v37 + 40);
      v60 = v70;
      sub_2134C1614(v45, v57, v70, 5522759, 0xE300000000000000, v58, v59);
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v57, v65);
      v61 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
      v61(v60, v49);
      v61((uint64_t)v36, v49);
      v53 = v76;
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

id AegirCloudCoverService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AegirCloudCoverService.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AegirCloudCoverService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AegirCloudCoverService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static AegirCloudCoverService.cloudLevelPrefix.getter()
{
  return 0x61632D632D333070;
}

unint64_t static AegirCloudCoverService.cloudLevelLowFileName.getter()
{
  return 0xD000000000000012;
}

unint64_t static AegirCloudCoverService.cloudLevelMidFileName.getter()
{
  return 0xD000000000000012;
}

unint64_t static AegirCloudCoverService.cloudLevelHighFileName.getter()
{
  return 0xD000000000000013;
}

uint64_t AegirCloudCoverService.urlForCloudLevel(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10[24];

  sub_2134C805C(a1, a2, v10);
  if (v10[0] == 5)
  {
    v5 = sub_2134D8E18();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a3, 1, 1, v5);
  }
  else
  {
    v7 = v3 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
    swift_beginAccess();
    v8 = sub_2134D8E18();
    v9 = *(_QWORD *)(v8 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a3, v7, v8);
    sub_2134C7FE0();
    sub_2134D8DDC();
    swift_bridgeObjectRelease();
    sub_2134D8DE8();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a3, 0, 1, v8);
  }
}

uint64_t AegirCloudCoverService.currentURLForCloudLevel(with:)@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  id v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  id v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t ObjCClassFromMetadata;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v2 = v1;
  v36 = a1;
  v3 = sub_2134D8E18();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v10, v13);
  v16 = (char *)&v35 - v15;
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)&v35 - v18;
  v20 = (void *)sub_2134D8FE0();
  v21 = objc_msgSend(v2, sel_urlForCloudLevelWith_, v20, v2);

  if (v21)
  {
    sub_2134D8DF4();

    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v22(v16, 0, 1, v3);
  }
  else
  {
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v22(v16, 1, 1, v3);
  }
  sub_2134D7F28((uint64_t)v16, (uint64_t)v19, &qword_253F00678);
  sub_2134D80EC((uint64_t)v19, (uint64_t)v12, &qword_253F00678);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) == 1)
  {
    sub_2134D8004((uint64_t)v12, &qword_253F00678);
    return sub_2134D7F28((uint64_t)v19, v36, &qword_253F00678);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v12, v3);
  v23 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_2134D8E00();
  v24 = (void *)sub_2134D8FE0();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v23, sel_fileExistsAtPath_, v24);

  if ((v25 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return sub_2134D7F28((uint64_t)v19, v36, &qword_253F00678);
  }
  type metadata accessor for AegirCloudCoverService();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v28 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v29 = (void *)sub_2134D8FE0();
  v30 = (void *)sub_2134D8FE0();
  v31 = objc_msgSend(v28, sel_pathForResource_ofType_, v29, v30);

  if (v31)
  {
    sub_2134D9004();

    sub_2134D10EC();
    v32 = v36;
    sub_2134D8DC4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    sub_2134D8004((uint64_t)v19, &qword_253F00678);
    v33 = v32;
    v34 = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    sub_2134D8004((uint64_t)v19, &qword_253F00678);
    v33 = v36;
    v34 = 1;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v22)(v33, v34, 1, v3);
}

id sub_2134D2218(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2134D9004();
  v12 = v11;
  v13 = a1;
  a4(v10, v12);

  swift_bridgeObjectRelease();
  v14 = sub_2134D8E18();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14) != 1)
  {
    v16 = (void *)sub_2134D8DD0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  }
  return v16;
}

uint64_t sub_2134D2350()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2134D2384()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);

  v1 = (char *)v0[2];
  v2 = v0[3];
  v4 = (void (*)(void))v0[4];
  v3 = v0[5];
  swift_retain();
  sub_2134D6374(v2, v1, v4, v3);
  return swift_release();
}

_QWORD *sub_2134D23CC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F007F8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2134D478C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2134D24D8(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B9F040);
  v10 = *(_QWORD *)(sub_2134D8E18() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2134D91C0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_2134D8E18() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2134D487C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

BOOL sub_2134D26E0@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_2134CA1D4();
  *a1 = result;
  return result;
}

uint64_t sub_2134D271C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_2134D2734()
{
  return swift_deallocObject();
}

uint64_t sub_2134D2744()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

size_t sub_2134D2764(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B9F040);
  v3 = *(_QWORD *)(sub_2134D8E18() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      swift_bridgeObjectRetain();
      v9 = sub_2134D443C(&v10, (uint64_t)v6 + v5, v1, a1);
      sub_2134D823C();
      if (v9 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2134D285C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2134D29FC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2134D2878(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2134D2894(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2134D2894(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2134D91FC();
  __break(1u);
  return result;
}

uint64_t sub_2134D29FC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F007E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2134D91FC();
  __break(1u);
  return result;
}

uint64_t sub_2134D2B48@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2134C67F8(a1);
  v8 = v7;
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    v16 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2134D33B4();
      v10 = v16;
    }
    v11 = *(_QWORD *)(v10 + 56);
    v12 = sub_2134D8E18();
    v13 = *(_QWORD *)(v12 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v13 + 32))(a2, v11 + *(_QWORD *)(v13 + 72) * v6, v12);
    sub_2134D2FF8(v6, v10);
    *v3 = v10;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(a2, 0, 1, v12);
  }
  else
  {
    v15 = sub_2134D8E18();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
}

uint64_t sub_2134D2C60(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t *v42;
  int64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;

  v3 = v2;
  v46 = sub_2134D8E18();
  v5 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46, v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B9F058);
  v10 = sub_2134D91E4();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_40;
  v42 = v2;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v44 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v43 = (unint64_t)(v12 + 63) >> 6;
  v16 = a2;
  v17 = v10 + 64;
  result = swift_retain();
  v19 = 0;
  v41 = v16;
  v20 = 16;
  if ((v16 & 1) != 0)
    v20 = 32;
  v45 = v20;
  while (1)
  {
    if (v15)
    {
      v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v23 = v22 | (v19 << 6);
      goto LABEL_24;
    }
    v24 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v24 >= v43)
      break;
    v25 = v44;
    v26 = v44[v24];
    ++v19;
    if (!v26)
    {
      v19 = v24 + 1;
      if (v24 + 1 >= v43)
        goto LABEL_33;
      v26 = v44[v19];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v43)
        {
LABEL_33:
          swift_release();
          v3 = v42;
          if ((v41 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v26 = v44[v27];
        if (!v26)
        {
          while (1)
          {
            v19 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_42;
            if (v19 >= v43)
              goto LABEL_33;
            v26 = v44[v19];
            ++v27;
            if (v26)
              goto LABEL_23;
          }
        }
        v19 = v27;
      }
    }
LABEL_23:
    v15 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v19 << 6);
LABEL_24:
    v28 = *(_QWORD *)(v9 + 56);
    v29 = v9;
    v30 = *(_BYTE *)(*(_QWORD *)(v9 + 48) + v23);
    v31 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + v45))(v8, v28 + v31 * v23, v46);
    sub_2134D9298();
    sub_2134D9010();
    swift_bridgeObjectRelease();
    result = sub_2134D92B0();
    v32 = -1 << *(_BYTE *)(v11 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v17 + 8 * v34);
      }
      while (v38 == -1);
      v21 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_BYTE *)(*(_QWORD *)(v11 + 48) + v21) = v30;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v11 + 56) + v31 * v21, v8, v46);
    ++*(_QWORD *)(v11 + 16);
    v9 = v29;
  }
  swift_release();
  v3 = v42;
  v25 = v44;
  if ((v41 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v39 = 1 << *(_BYTE *)(v9 + 32);
  if (v39 >= 64)
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v39;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v11;
  return result;
}

unint64_t sub_2134D2FF8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2134D9178();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_2134D9298();
        sub_2134D9010();
        swift_bridgeObjectRelease();
        result = sub_2134D92B0();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v9 < v8)
          goto LABEL_11;
LABEL_12:
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_BYTE *)(v10 + v3);
        v12 = (_BYTE *)(v10 + v6);
        if (v3 != v6 || v11 >= v12 + 1)
          *v11 = *v12;
        v13 = *(_QWORD *)(a2 + 56);
        v14 = *(_QWORD *)(*(_QWORD *)(sub_2134D8E18() - 8) + 72);
        v15 = v14 * v3;
        result = v13 + v14 * v3;
        v16 = v14 * v6;
        v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v15 == v16)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v9 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v9)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2134D3204(uint64_t a1, char a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_2134C67F8(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = sub_2134D8E18();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_2134D3328(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2134D33B4();
      goto LABEL_7;
    }
    sub_2134D2C60(v13, a3 & 1);
    v20 = sub_2134C67F8(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_2134D3328(v10, a2, a1, v16);
    }
  }
  result = sub_2134D9250();
  __break(1u);
  return result;
}

uint64_t sub_2134D3328(unint64_t a1, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  v7 = a4[7];
  v8 = sub_2134D8E18();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

void *sub_2134D33B4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_2134D8E18();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B9F058);
  v24 = v0;
  v6 = *v0;
  v7 = sub_2134D91D8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v8;
    return result;
  }
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v25 = v6 + 64;
  v26 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v17 = v16 | (v12 << 6);
      goto LABEL_12;
    }
    v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v12;
    if (!v21)
    {
      v12 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v12);
      if (!v21)
        break;
    }
LABEL_25:
    v15 = (v21 - 1) & v21;
    v17 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_12:
    v18 = *(_BYTE *)(*(_QWORD *)(v6 + 48) + v17);
    v19 = *(_QWORD *)(v2 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v5, *(_QWORD *)(v6 + 56) + v19, v1);
    *(_BYTE *)(*(_QWORD *)(v8 + 48) + v17) = v18;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v8 + 56) + v19, v5, v1);
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v12 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v12 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v12);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2134D35D0(_BYTE *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  char isUniquelyReferenced_nonNull_native;
  char v15;
  uint64_t result;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v20;

  v4 = *v2;
  sub_2134D9298();
  swift_bridgeObjectRetain();
  sub_2134D9010();
  swift_bridgeObjectRelease();
  v5 = sub_2134D92B0();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  v17 = a2;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v8 = (char)a2;
    v9 = ~v6;
    v10 = *(_QWORD *)&aTotal_2[8 * v8];
    v11 = qword_2134FA408[v8];
    while (*(_QWORD *)&aTotal_2[8 * *(char *)(*(_QWORD *)(v4 + 48) + v7)] != v10
         || qword_2134FA408[*(char *)(*(_QWORD *)(v4 + 48) + v7)] != v11)
    {
      v13 = sub_2134D9238();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_11;
      v7 = (v7 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    result = 0;
    v15 = *(_BYTE *)(*(_QWORD *)(*v18 + 48) + v7);
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v18;
    *v18 = 0x8000000000000000;
    v15 = v17;
    sub_2134D3A84(v17, v7, isUniquelyReferenced_nonNull_native);
    *v18 = v20;
    swift_bridgeObjectRelease();
    result = 1;
  }
  *a1 = v15;
  return result;
}

uint64_t sub_2134D37A4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F00890);
  v3 = sub_2134D9190();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
      sub_2134D9298();
      sub_2134D9010();
      swift_bridgeObjectRelease();
      result = sub_2134D92B0();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2134D3A84(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  char v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  char v21;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_16;
  if ((a3 & 1) != 0)
  {
    sub_2134D37A4();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_2134D3C58();
      goto LABEL_16;
    }
    sub_2134D3DE8();
  }
  v8 = *v3;
  sub_2134D9298();
  sub_2134D9010();
  swift_bridgeObjectRelease();
  result = sub_2134D92B0();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = v5;
    v11 = ~v9;
    v12 = *(_QWORD *)&aTotal_2[8 * v10];
    v13 = qword_2134FA408[v10];
    while (*(_QWORD *)&aTotal_2[8 * *(char *)(*(_QWORD *)(v8 + 48) + a2)] != v12
         || qword_2134FA408[*(char *)(*(_QWORD *)(v8 + 48) + a2)] != v13)
    {
      v15 = sub_2134D9238();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v15 & 1) != 0)
        goto LABEL_20;
      a2 = (a2 + 1) & v11;
      if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_16;
    }
    goto LABEL_19;
  }
LABEL_16:
  v16 = *v20;
  *(_QWORD *)(*v20 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v16 + 48) + a2) = v21;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (!v18)
  {
    *(_QWORD *)(v16 + 16) = v19;
    return result;
  }
  __break(1u);
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_20:
  result = sub_2134D9244();
  __break(1u);
  return result;
}

void *sub_2134D3C58()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F00890);
  v2 = *v0;
  v3 = sub_2134D9184();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2134D3DE8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F00890);
  v3 = sub_2134D9190();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    sub_2134D9298();
    sub_2134D9010();
    swift_bridgeObjectRelease();
    result = sub_2134D92B0();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2134D4094@<X0>(char a1@<W0>, _BYTE *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v19;

  v4 = *v2;
  sub_2134D9298();
  swift_bridgeObjectRetain();
  sub_2134D9010();
  swift_bridgeObjectRelease();
  v5 = sub_2134D92B0();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v8 = ~v6;
    v9 = a1;
    v10 = *(_QWORD *)&aTotal_2[v9 * 8];
    v11 = qword_2134FA408[v9];
    while (*(_QWORD *)&aTotal_2[8 * *(char *)(*(_QWORD *)(v4 + 48) + v7)] != v10
         || qword_2134FA408[*(char *)(*(_QWORD *)(v4 + 48) + v7)] != v11)
    {
      v13 = sub_2134D9238();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_11;
      v7 = (v7 + 1) & v8;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v17;
    v19 = *v17;
    *v17 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2134D3C58();
      v16 = v19;
    }
    *a2 = *(_BYTE *)(*(_QWORD *)(v16 + 48) + v7);
    sub_2134D4268(v7);
    *v17 = v19;
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_9:
    result = swift_bridgeObjectRelease();
    *a2 = 5;
  }
  return result;
}

unint64_t sub_2134D4268(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_2134D9178();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_2134D9298();
        sub_2134D9010();
        swift_bridgeObjectRelease();
        v10 = sub_2134D92B0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9)
            goto LABEL_5;
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(v3 + 48);
          v12 = (_BYTE *)(v11 + v2);
          v13 = (_BYTE *)(v11 + v6);
          if (v2 != v6 || (v2 = v6, v12 >= v13 + 1))
          {
            *v12 = *v13;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v14 = *(_QWORD *)(v3 + 16);
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_2134D443C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2134D8E18();
  v43 = *(_QWORD *)(v12 - 8);
  result = MEMORY[0x24BDAC7A8](v12, v13);
  v42 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a4;
  v17 = a4 + 64;
  v16 = *(_QWORD *)(a4 + 64);
  v18 = -1 << *(_BYTE *)(a4 + 32);
  v37 = a1;
  v38 = v18;
  v19 = -v18;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    v23 = 0;
LABEL_39:
    v33 = v37;
    v34 = ~v38;
    *v37 = v44;
    v33[1] = v17;
    v33[2] = v34;
    v33[3] = v22;
    v33[4] = v21;
    return v23;
  }
  if (!a3)
  {
    v22 = 0;
    v23 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v22 = 0;
  v23 = 0;
  v39 = a4 + 64;
  v40 = (unint64_t)(63 - v38) >> 6;
  v36 = v40 - 1;
  v41 = a3;
  v24 = v42;
  v25 = v43;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v26 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v27 = v26 | (v22 << 6);
  while (1)
  {
    v31 = *(_QWORD *)(v25 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v25 + 16))(v11, *(_QWORD *)(v44 + 56) + v31 * v27, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v11, 1, v12) == 1)
    {
      v17 = v39;
      goto LABEL_38;
    }
    ++v23;
    v32 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v32(v24, v11, v12);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(a2, v24, v12);
    if (v23 == v41)
    {
      v23 = v41;
      v17 = v39;
      goto LABEL_39;
    }
    a2 += v31;
    v25 = v43;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v28 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    v17 = v39;
    if (v28 >= v40)
      goto LABEL_37;
    v29 = *(_QWORD *)(v39 + 8 * v28);
    if (!v29)
    {
      v30 = v22 + 2;
      ++v22;
      if (v28 + 1 >= v40)
        goto LABEL_37;
      v29 = *(_QWORD *)(v39 + 8 * v30);
      if (v29)
        goto LABEL_14;
      v22 = v28 + 1;
      if (v28 + 2 >= v40)
        goto LABEL_37;
      v29 = *(_QWORD *)(v39 + 8 * (v28 + 2));
      if (v29)
      {
        v28 += 2;
      }
      else
      {
        v22 = v28 + 2;
        if (v28 + 3 >= v40)
          goto LABEL_37;
        v29 = *(_QWORD *)(v39 + 8 * (v28 + 3));
        if (!v29)
        {
          v30 = v28 + 4;
          v22 = v28 + 3;
          if (v28 + 4 < v40)
          {
            v29 = *(_QWORD *)(v39 + 8 * v30);
            if (!v29)
            {
              while (1)
              {
                v28 = v30 + 1;
                if (__OFADD__(v30, 1))
                  goto LABEL_42;
                if (v28 >= v40)
                {
                  v22 = v36;
                  goto LABEL_37;
                }
                v29 = *(_QWORD *)(v39 + 8 * v28);
                ++v30;
                if (v29)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v28 = v30;
            goto LABEL_21;
          }
LABEL_37:
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v11, 1, 1, v12);
          v21 = 0;
LABEL_38:
          sub_2134D8004((uint64_t)v11, &qword_253F00678);
          goto LABEL_39;
        }
        v28 += 3;
      }
    }
LABEL_21:
    v21 = (v29 - 1) & v29;
    v27 = __clz(__rbit64(v29)) + (v28 << 6);
    v22 = v28;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2134D478C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2134D91FC();
  __break(1u);
  return result;
}

uint64_t sub_2134D487C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_2134D8E18() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_2134D91FC();
  __break(1u);
  return result;
}

uint64_t sub_2134D4994(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(char *, uint64_t), double a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  NSObject *v56;
  os_log_type_t v57;
  BOOL v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  void *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(char *, uint64_t);
  uint64_t v125;
  uint64_t aBlock[6];
  uint64_t v127;

  v124 = a8;
  v101 = a5;
  v106 = a4;
  v115 = a3;
  v119 = a2;
  v121 = a10;
  v122 = a1;
  v113 = sub_2134D8F44();
  v112 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113, v13);
  v111 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_2134D8F5C();
  v109 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110, v15);
  v108 = (char *)&v101 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = sub_2134D8F74();
  v105 = *(_QWORD *)(v117 - 8);
  v18 = MEMORY[0x24BDAC7A8](v117, v17);
  v104 = (char *)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18, v20);
  v107 = (char *)&v101 - v21;
  v120 = sub_2134D8EC0();
  v118 = *(_QWORD *)(v120 - 8);
  v23 = MEMORY[0x24BDAC7A8](v120, v22);
  v114 = (char *)&v101 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23, v25);
  v102 = (char *)&v101 - v26;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  v29 = MEMORY[0x24BDAC7A8](v27, v28);
  v103 = (char *)&v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29, v31);
  v33 = (char *)&v101 - v32;
  v34 = sub_2134D8E18();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34, v36);
  v38 = (char *)&v101 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F008A8);
  MEMORY[0x24BDAC7A8](v39, v40);
  v42 = (unsigned __int8 *)&v101 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = swift_allocObject();
  v44 = a6;
  *(_QWORD *)(v43 + 16) = a6;
  v116 = a7;
  *(_BYTE *)(v43 + 24) = a7;
  v45 = v121;
  v123 = v43;
  *(_QWORD *)(v43 + 32) = v124;
  *(_QWORD *)(v43 + 40) = v45;
  sub_2134D80EC(v122, (uint64_t)v42, (uint64_t *)&unk_253F008A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v122 = v35;
    v46 = *v42;
    v47 = qword_253F00670;
    swift_retain();
    swift_retain();
    v48 = v44;
    v49 = v119;
    if (v46 == 1 && v119)
    {
      v50 = v101 + 16;
      v51 = v47 == -1;
      v52 = v118;
      if (!v51)
        swift_once();
      v53 = v120;
      v54 = __swift_project_value_buffer(v120, (uint64_t)qword_253F00AB0);
      v55 = v102;
      (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v102, v54, v53);
      v56 = sub_2134D8EA8();
      v57 = sub_2134D9088();
      v58 = os_log_type_enabled(v56, v57);
      v59 = v115;
      if (v58)
      {
        v60 = swift_slowAlloc();
        v61 = swift_slowAlloc();
        aBlock[0] = v61;
        v62 = v59;
        v63 = *(_QWORD *)&aTotal_2[v62 * 8];
        *(_DWORD *)v60 = 136315650;
        v127 = sub_2134C1AE0(v63, qword_2134FA408[v62], aBlock);
        sub_2134D9148();
        swift_bridgeObjectRelease();
        *(_WORD *)(v60 + 12) = 2048;
        v127 = v119;
        sub_2134D9148();
        *(_WORD *)(v60 + 22) = 2048;
        v127 = *(_QWORD *)&a9;
        sub_2134D9148();
        _os_log_impl(&dword_2134A1000, v56, v57, "Attempting to retry download for %s. Remaining retries: %ld. Backoff period: %f", (uint8_t *)v60, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x2199B5148](v61, -1, -1);
        v64 = v60;
        v49 = v119;
        MEMORY[0x2199B5148](v64, -1, -1);

        (*(void (**)(char *, uint64_t))(v118 + 8))(v55, v120);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v53);
      }
      v82 = v104;
      sub_2134D8F68();
      v83 = v107;
      MEMORY[0x2199B45E4](v82, a9);
      v124 = *(void (**)(char *, uint64_t))(v105 + 8);
      v124(v82, v117);
      v84 = swift_allocObject();
      swift_beginAccess();
      v85 = (void *)MEMORY[0x2199B519C](v50);
      swift_unknownObjectWeakInit();

      v86 = swift_allocObject();
      *(_QWORD *)(v86 + 16) = v84;
      *(_BYTE *)(v86 + 24) = v59;
      v87 = v106;
      *(_QWORD *)(v86 + 32) = v106;
      *(_QWORD *)(v86 + 40) = v49;
      *(double *)(v86 + 48) = a9;
      v88 = v123;
      *(_QWORD *)(v86 + 56) = sub_2134D8444;
      *(_QWORD *)(v86 + 64) = v88;
      aBlock[4] = (uint64_t)sub_2134D8150;
      aBlock[5] = v86;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2134C7A98;
      aBlock[3] = (uint64_t)&block_descriptor_135;
      v89 = _Block_copy(aBlock);
      swift_retain();
      v90 = v87;
      swift_retain();
      v91 = v108;
      sub_2134D8F50();
      v125 = MEMORY[0x24BEE4AF8];
      sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
      sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
      v92 = v111;
      v93 = v113;
      sub_2134D916C();
      MEMORY[0x2199B46F8](v83, v91, v92, v89);
      _Block_release(v89);
      (*(void (**)(char *, uint64_t))(v112 + 8))(v92, v93);
      (*(void (**)(char *, uint64_t))(v109 + 8))(v91, v110);
      v124(v83, v117);
      swift_release();
      swift_release();
    }
    else
    {
      v72 = v118;
      if (v47 != -1)
        swift_once();
      v73 = v120;
      v74 = __swift_project_value_buffer(v120, (uint64_t)qword_253F00AB0);
      v75 = v114;
      (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v114, v74, v73);
      v76 = sub_2134D8EA8();
      v77 = sub_2134D907C();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        v79 = swift_slowAlloc();
        *(_DWORD *)v78 = 136315138;
        v80 = (char)v115;
        v81 = *(_QWORD *)&aTotal_2[v80 * 8];
        aBlock[0] = v79;
        v127 = sub_2134C1AE0(v81, qword_2134FA408[v80], aBlock);
        sub_2134D9148();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2134A1000, v76, v77, "Exhausted retry attempts for %s", v78, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199B5148](v79, -1, -1);
        MEMORY[0x2199B5148](v78, -1, -1);

        (*(void (**)(char *, uint64_t))(v118 + 8))(v114, v120);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v72 + 8))(v75, v73);
      }
      v94 = (uint64_t)v103;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v103, 1, 1, v34);
      swift_beginAccess();
      v95 = MEMORY[0x2199B519C](v48 + 16);
      if (v95)
      {
        v96 = (void *)v95;
        v97 = *(id *)(v95 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue);

        MEMORY[0x24BDAC7A8](v98, v99);
        *(&v101 - 2) = v48;
        *((_BYTE *)&v101 - 8) = v116;
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F008B8);
        sub_2134D90D0();

      }
      ((void (*)(uint64_t))v124)(v94);
      sub_2134D8004(v94, &qword_253F00678);
    }
  }
  else
  {
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v35 + 32))(v38, v42, v34);
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v33, v38, v34);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v33, 0, 1, v34);
    v65 = v44;
    swift_beginAccess();
    v66 = MEMORY[0x2199B519C](v44 + 16);
    if (v66)
    {
      v67 = (void *)v66;
      v68 = *(void **)(v66 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue);
      swift_retain();
      swift_retain();
      v69 = v68;

      MEMORY[0x24BDAC7A8](v70, v71);
      *(&v101 - 2) = v65;
      *((_BYTE *)&v101 - 8) = v116;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F008B8);
      sub_2134D90D0();

    }
    else
    {
      swift_retain();
      swift_retain();
    }
    ((void (*)(char *))v124)(v33);
    sub_2134D8004((uint64_t)v33, &qword_253F00678);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v34);
  }
  return swift_release();
}

uint64_t sub_2134D54D0(char *a1, void *a2, uint64_t a3, uint64_t a4, int a5, void *a6, uint64_t a7, uint64_t a8, double a9, unsigned __int8 a10, void (*a11)(char *, uint64_t), uint64_t a12)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  char v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v79;
  void *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  _BYTE *v84;
  int v85;
  void (*v86)(char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t aBlock[6];
  uint64_t v100;

  v93 = a6;
  LODWORD(v96) = a5;
  v95 = a4;
  v91 = a3;
  v80 = a2;
  v94 = a1;
  v82 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F008A8);
  MEMORY[0x24BDAC7A8](v82, v15);
  v84 = (char *)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2134D8EC0();
  v18 = *(_QWORD *)(v17 - 8);
  v97 = v17;
  v98 = v18;
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v83 = (char *)&v79 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v22);
  v81 = (char *)&v79 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00820);
  MEMORY[0x24BDAC7A8](v24, v25);
  v27 = (char *)&v79 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_2134D8D58();
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28, v30);
  v32 = (char *)&v79 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = a8;
  v85 = a10;
  *(_BYTE *)(v33 + 24) = a10;
  v86 = a11;
  *(_QWORD *)(v33 + 32) = a11;
  *(_QWORD *)(v33 + 40) = a12;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = sub_2134D7FEC;
  *(_QWORD *)(v34 + 24) = v33;
  *(_QWORD *)(v34 + 32) = v95;
  *(double *)(v34 + 40) = a9;
  *(_BYTE *)(v34 + 48) = v96;
  v36 = v93;
  v35 = v94;
  *(_QWORD *)(v34 + 56) = v93;
  *(_QWORD *)(v34 + 64) = a7;
  v92 = v34;
  v37 = *v35;
  v89 = a8;
  v90 = v37;
  LOBYTE(aBlock[0]) = v37;
  swift_retain();
  v88 = a12;
  swift_retain();
  v94 = (char *)v33;
  v38 = v91;
  swift_retain();
  v39 = v36;
  v87 = a7;
  swift_retain();
  sub_2134D150C((uint64_t)v27);
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v93 = (void *)v28;
  if (v40(v27, 1, v28) == 1)
  {
    sub_2134D8004((uint64_t)v27, &qword_253F00820);
    if (qword_253F00670 != -1)
      swift_once();
    v41 = v97;
    v42 = __swift_project_value_buffer(v97, (uint64_t)qword_253F00AB0);
    v43 = v81;
    (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v81, v42, v41);
    v44 = sub_2134D8EA8();
    v45 = sub_2134D907C();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      v47 = swift_slowAlloc();
      *(_DWORD *)v46 = 136315138;
      v48 = *(_QWORD *)&aTotal_2[8 * v90];
      aBlock[0] = v47;
      v100 = sub_2134C1AE0(v48, qword_2134FA408[v90], aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2134A1000, v44, v45, "Failed to build urlRequest for cloudLevel %s.", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v47, -1, -1);
      MEMORY[0x2199B5148](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v98 + 8))(v43, v97);
    v49 = (uint64_t)v84;
    *v84 = 0;
    swift_storeEnumTagMultiPayload();
    v50 = v89;
    swift_retain();
    v51 = v88;
    swift_retain();
    sub_2134D4994(v49, v95, v96, v39, v87, v50, v85, v86, a9, v51);
    swift_release();
    swift_release();
    sub_2134D8004(v49, (uint64_t *)&unk_253F008A8);
  }
  else
  {
    (*(void (**)(char *, char *, void *))(v29 + 32))(v32, v27, v93);
    v52 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session;
    v53 = v38;
    if (!*(_QWORD *)(v38 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session))
    {
      v54 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
      objc_msgSend(v54, sel_setAllowsConstrainedNetworkAccess_, 0);
      v55 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v54);
      v56 = *(void **)(v53 + v52);
      *(_QWORD *)(v53 + v52) = v55;

    }
    v96 = v29;
    v57 = v83;
    if (qword_253F00670 != -1)
      swift_once();
    v58 = v97;
    v59 = __swift_project_value_buffer(v97, (uint64_t)qword_253F00AB0);
    (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v57, v59, v58);
    v60 = sub_2134D8EA8();
    v61 = sub_2134D9088();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      v63 = swift_slowAlloc();
      v95 = v52;
      v64 = v63;
      *(_DWORD *)v62 = 136315138;
      v65 = *(_QWORD *)&aTotal_2[8 * v90];
      aBlock[0] = v64;
      v100 = sub_2134C1AE0(v65, qword_2134FA408[v90], aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2134A1000, v60, v61, "Starting download task for cloud data: %s", v62, 0xCu);
      swift_arrayDestroy();
      v66 = v64;
      v52 = v95;
      MEMORY[0x2199B5148](v66, -1, -1);
      MEMORY[0x2199B5148](v62, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v98 + 8))(v57, v97);
    v67 = v92;
    v68 = *(void **)(v53 + v52);
    if (v68)
    {
      v69 = v90;
      v70 = v68;
      v71 = (void *)sub_2134D8D34();
      v72 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v73 = swift_allocObject();
      v74 = v80;
      *(_QWORD *)(v73 + 16) = v72;
      *(_QWORD *)(v73 + 24) = v74;
      *(_QWORD *)(v73 + 32) = sub_2134D8000;
      *(_QWORD *)(v73 + 40) = v67;
      *(_BYTE *)(v73 + 48) = v69;
      aBlock[4] = (uint64_t)sub_2134D8044;
      aBlock[5] = v73;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2134D0014;
      aBlock[3] = (uint64_t)&block_descriptor_106;
      v75 = _Block_copy(aBlock);
      v76 = v74;
      swift_retain();
      swift_release();
      v77 = objc_msgSend(v70, sel_downloadTaskWithRequest_completionHandler_, v71, v75);
      _Block_release(v75);

      objc_msgSend(v77, sel_resume);
    }
    (*(void (**)(char *, void *))(v96 + 8))(v32, v93);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_2134D5CD0(unsigned __int8 *a1, void *a2, char a3, void *a4, void *a5, uint64_t a6, int a7, uint64_t a8, void *a9, void *a10)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  void **p_cache;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  void (*v54)(char *, char *, uint64_t);
  char *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  NSObject *v71;
  char *v72;
  NSObject *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  char *v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  int v83;
  uint64_t v84;
  char v85[24];
  uint64_t v86[4];

  v82 = a2;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00678);
  MEMORY[0x24BDAC7A8](v17, v18);
  v77 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_2134D8E18();
  v81 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76, v20);
  v74 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_2134D8EC0();
  v23 = *(_QWORD *)(v22 - 8);
  v79 = v22;
  v80 = v23;
  MEMORY[0x24BDAC7A8](v22, v24);
  v75 = (char *)&v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = a5;
  *(_QWORD *)(v26 + 24) = a6;
  v78 = a7;
  *(_BYTE *)(v26 + 32) = a7;
  *(_QWORD *)(v26 + 40) = a8;
  *(_QWORD *)(v26 + 48) = a9;
  *(_QWORD *)(v26 + 56) = a10;
  v27 = *a1;
  if ((a3 & 1) != 0)
  {
    v28 = a5;
    swift_retain();
    swift_retain();
    v29 = a9;
    v30 = a10;
LABEL_4:
    swift_beginAccess();
    sub_2134D35D0(v85, v27);
    swift_endAccess();
    v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v35 = qword_254B9EE10;
    swift_retain();
    if (v35 != -1)
      swift_once();
    v36 = qword_254B9F730;
    v37 = *(double *)&qword_254B9F738;
    LOBYTE(v86[0]) = v27;
    v38 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v39 = v82;
    sub_2134D54D0((char *)v86, v39, (uint64_t)a4, v36, v27, v39, v38, v34, v37, v27, (void (*)(char *, uint64_t))sub_2134D7FB0, v26);
    swift_release();
    swift_release_n();

    return swift_release();
  }
  LOBYTE(v86[0]) = v27;
  v31 = a5;
  swift_retain();
  swift_retain();
  v32 = a9;
  v73 = a10;
  sub_2134CC8B0((unsigned __int8 *)v86);
  if ((v33 & 1) != 0)
    goto LABEL_4;
  v40 = a8;
  v41 = a6;
  v82 = v31;
  if (qword_253F00670 != -1)
    swift_once();
  v72 = v32;
  v42 = v79;
  v43 = __swift_project_value_buffer(v79, (uint64_t)qword_253F00AB0);
  v44 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v75, v43, v42);
  v45 = a4;
  v46 = sub_2134D8EA8();
  v47 = sub_2134D9064();
  v71 = v46;
  v70 = v47;
  v48 = os_log_type_enabled(v46, v47);
  p_cache = NUNICloudCoverFileConverter.cache;
  v50 = v76;
  v51 = v81;
  if (v48)
  {
    v52 = swift_slowAlloc();
    v68 = swift_slowAlloc();
    v86[0] = v68;
    *(_DWORD *)v52 = 136315394;
    v53 = &v45[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
    swift_beginAccess();
    v54 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
    v55 = v74;
    v54(v74, v53, v50);
    LOBYTE(v84) = v27;
    sub_2134C7FE0();
    v69 = v41;
    v67 = v40;
    sub_2134D8DDC();
    swift_bridgeObjectRelease();
    sub_2134D8DE8();
    sub_2134D8244(&qword_254B9EF60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v56 = sub_2134D9220();
    v58 = v57;
    (*(void (**)(char *, uint64_t))(v81 + 8))(v55, v50);
    v84 = sub_2134C1AE0(v56, v58, v86);
    sub_2134D9148();

    v51 = v81;
    swift_bridgeObjectRelease();
    *(_WORD *)(v52 + 12) = 1024;
    v59 = &v45[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch];
    swift_beginAccess();
    LODWORD(v59) = *v59;

    v83 = (int)v59;
    p_cache = (void **)(NUNICloudCoverFileConverter + 16);
    sub_2134D9148();

    v60 = v71;
    _os_log_impl(&dword_2134A1000, v71, (os_log_type_t)v70, "Retrieving cloud texture from local cache: %s - Is Fetch Disabled: %{BOOL}d", (uint8_t *)v52, 0x12u);
    v61 = v68;
    swift_arrayDestroy();
    v62 = v61;
    v41 = v69;
    MEMORY[0x2199B5148](v62, -1, -1);
    MEMORY[0x2199B5148](v52, -1, -1);

    v40 = v67;
    (*(void (**)(char *, uint64_t))(v80 + 8))(v44, v79);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v80 + 8))(v44, v42);
  }
  v63 = (char *)p_cache[359] + (_QWORD)v45;
  swift_beginAccess();
  v64 = (uint64_t)v77;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v77, v63, v50);
  LOBYTE(v83) = v27;
  sub_2134C7FE0();
  sub_2134D8DDC();
  swift_bridgeObjectRelease();
  sub_2134D8DE8();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v51 + 56))(v64, 0, 1, v50);
  sub_2134CA5AC(v64, v82, v41, v78, v40, v72, v73);
  sub_2134D8004(v64, &qword_253F00678);
  return swift_release();
}

void sub_2134D6374(uint64_t a1, char *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  char *v25;
  char *v26;
  void (*v27)(void);
  NSObject *v28;
  uint8_t *v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v63;
  _QWORD aBlock[7];

  v57 = a1;
  v7 = sub_2134D8EC0();
  v58 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2134D8F44();
  v48 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_2134D8F5C();
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47, v15);
  v45 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  v49 = v17;
  v18 = objc_allocWithZone(MEMORY[0x24BDD1648]);
  swift_retain();
  v60 = objc_msgSend(v18, sel_init);
  v19 = dispatch_group_create();
  v59 = swift_allocObject();
  *(_QWORD *)(v59 + 16) = MEMORY[0x24BEE4B00];
  v52 = a2;
  v20 = sub_2134CA1D4();
  if (qword_253F00670 != -1)
    swift_once();
  v55 = __swift_project_value_buffer(v7, (uint64_t)qword_253F00AB0);
  v21 = sub_2134D8EA8();
  v22 = sub_2134D9088();
  v23 = os_log_type_enabled(v21, v22);
  v61 = v7;
  if (v23)
  {
    v24 = v11;
    v25 = v10;
    v26 = v14;
    v27 = a3;
    v28 = v19;
    v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v29 = 67109120;
    LODWORD(aBlock[0]) = v20;
    sub_2134D9148();
    _os_log_impl(&dword_2134A1000, v21, v22, "Retrieving all cloud textures. Will Fetch Data: %{BOOL}d", v29, 8u);
    v30 = v29;
    v19 = v28;
    a3 = v27;
    v14 = v26;
    v10 = v25;
    v11 = v24;
    MEMORY[0x2199B5148](v30, -1, -1);
  }

  v31 = swift_allocObject();
  *(_BYTE *)(v31 + 16) = 0;
  if (v20)
  {
    v56 = v31;
    v32 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer;
    v33 = v52;
    if (*(_QWORD *)&v52[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_2134D9124();
      swift_unknownObjectRelease();
    }
    v44 = v14;
    *(_QWORD *)&v33[v32] = 0;
    swift_unknownObjectRelease();
    if (qword_253F006D8 != -1)
      swift_once();
    v34 = qword_253F00B20;
    if (*(_QWORD *)(qword_253F00B20 + 16))
    {
      v54 = v10;
      v43 = v11;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v35 = 136315138;
      v51 = v35;
      v50 = MEMORY[0x24BEE4AD8] + 8;
      v53 = v34;
      v36 = *(unsigned __int8 *)(v34 + 32);
      dispatch_group_enter(v19);
      __asm { BR              X8 }
    }
    v37 = (_QWORD *)swift_allocObject();
    v38 = v56;
    v37[2] = v33;
    v37[3] = v38;
    v37[4] = v59;
    v37[5] = sub_2134D2744;
    v37[6] = v49;
    aBlock[4] = sub_2134D7E54;
    aBlock[5] = v37;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2134C7A98;
    aBlock[3] = &block_descriptor_76;
    v39 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    v40 = v33;
    swift_retain();
    v41 = v45;
    sub_2134D8F50();
    v63 = MEMORY[0x24BEE4AF8];
    sub_2134D8244(&qword_253F00788, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F007A0);
    sub_2134D7D68(&qword_253F007A8, &qword_253F007A0, MEMORY[0x24BEE12C8]);
    v42 = v44;
    sub_2134D916C();
    sub_2134D9094();
    _Block_release(v39);

    (*(void (**)(char *, uint64_t))(v48 + 8))(v42, v11);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v47);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    sub_2134C91C4();
    a3();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_2134D6B80(void (**a1)(char *, char *, uint64_t), void *a2, uint64_t a3, void (*a4)(char *), void (*a5)(_QWORD, _QWORD), uint64_t a6, int a7, void *a8, double a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unsigned int (**v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (**v37)(char *, char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  char v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  char *v78;
  uint64_t v79;
  _BYTE *v80;
  void (*v81)(char *);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void (**v88)(char *, char *, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t aBlock[6];
  uint64_t v92;

  v87 = a3;
  v77 = a2;
  v88 = a1;
  v79 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F008A8);
  MEMORY[0x24BDAC7A8](v79, v16);
  v80 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2134D8EC0();
  v19 = *(_QWORD *)(v18 - 8);
  v89 = v18;
  v90 = v19;
  v21 = MEMORY[0x24BDAC7A8](v18, v20);
  v85 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21, v23);
  v78 = (char *)&v75 - v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00820);
  MEMORY[0x24BDAC7A8](v25, v26);
  v28 = (char *)&v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_2134D8D58();
  v30 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v29 - 8);
  MEMORY[0x24BDAC7A8](v29, v31);
  v33 = (char *)&v75 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = swift_allocObject();
  v81 = a4;
  *(_QWORD *)(v34 + 16) = a4;
  *(_QWORD *)(v34 + 24) = a5;
  v83 = a6;
  *(_QWORD *)(v34 + 32) = a6;
  *(double *)(v34 + 40) = a9;
  LODWORD(v84) = a7;
  *(_BYTE *)(v34 + 48) = a7;
  *(_QWORD *)(v34 + 56) = a8;
  *(_QWORD *)(v34 + 64) = a10;
  v35 = v34;
  v36 = v87;
  v86 = *(char *)v88;
  LOBYTE(aBlock[0]) = v86;
  swift_retain();
  v37 = a8;
  v82 = a10;
  swift_retain();
  sub_2134D150C((uint64_t)v28);
  v88 = (void (**)(char *, char *, uint64_t))v30;
  if (v30[6](v28, 1, v29) == 1)
  {
    sub_2134D8004((uint64_t)v28, &qword_253F00820);
    if (qword_253F00670 != -1)
      swift_once();
    v38 = v89;
    v39 = __swift_project_value_buffer(v89, (uint64_t)qword_253F00AB0);
    v40 = v78;
    (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v78, v39, v38);
    v41 = sub_2134D8EA8();
    v42 = sub_2134D907C();
    if (os_log_type_enabled(v41, v42))
    {
      v88 = v37;
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      *(_DWORD *)v43 = 136315138;
      v45 = *(_QWORD *)&aTotal_2[8 * v86];
      aBlock[0] = v44;
      v92 = sub_2134C1AE0(v45, qword_2134FA408[v86], aBlock);
      sub_2134D9148();
      v37 = v88;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2134A1000, v41, v42, "Failed to build urlRequest for cloudLevel %s.", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B5148](v44, -1, -1);
      MEMORY[0x2199B5148](v43, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v90 + 8))(v40, v89);
    v46 = (uint64_t)v80;
    *v80 = 0;
    swift_storeEnumTagMultiPayload();
    sub_2134CE484(v46, v81, a5, v83, v84, v37, v82, a9);
    sub_2134D8004(v46, (uint64_t *)&unk_253F008A8);
  }
  else
  {
    v88[4](v33, v28, v29);
    v47 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session;
    if (!*(_QWORD *)(v36 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session))
    {
      v48 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
      objc_msgSend(v48, sel_setAllowsConstrainedNetworkAccess_, 0);
      v49 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v48);
      v50 = *(void **)(v36 + v47);
      *(_QWORD *)(v36 + v47) = v49;

    }
    v51 = v85;
    v52 = v35;
    if (qword_253F00670 != -1)
      swift_once();
    v53 = v89;
    v54 = __swift_project_value_buffer(v89, (uint64_t)qword_253F00AB0);
    (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v51, v54, v53);
    v55 = sub_2134D8EA8();
    v56 = sub_2134D9088();
    v57 = os_log_type_enabled(v55, v56);
    v76 = v29;
    if (v57)
    {
      v58 = (uint8_t *)swift_slowAlloc();
      v59 = swift_slowAlloc();
      v84 = v35;
      v60 = v47;
      v61 = v59;
      *(_DWORD *)v58 = 136315138;
      v62 = *(_QWORD *)&aTotal_2[8 * v86];
      aBlock[0] = v61;
      v92 = sub_2134C1AE0(v62, qword_2134FA408[v86], aBlock);
      sub_2134D9148();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2134A1000, v55, v56, "Starting download task for cloud data: %s", v58, 0xCu);
      swift_arrayDestroy();
      v63 = v61;
      v47 = v60;
      v52 = v84;
      MEMORY[0x2199B5148](v63, -1, -1);
      MEMORY[0x2199B5148](v58, -1, -1);

      (*(void (**)(char *, uint64_t))(v90 + 8))(v85, v89);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v90 + 8))(v51, v89);
    }
    v64 = *(void **)(v36 + v47);
    if (v64)
    {
      v65 = v86;
      v66 = v64;
      v67 = (void *)sub_2134D8D34();
      v68 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v69 = swift_allocObject();
      v70 = v77;
      *(_QWORD *)(v69 + 16) = v68;
      *(_QWORD *)(v69 + 24) = v70;
      *(_QWORD *)(v69 + 32) = sub_2134D8000;
      *(_QWORD *)(v69 + 40) = v52;
      *(_BYTE *)(v69 + 48) = v65;
      aBlock[4] = (uint64_t)sub_2134D8044;
      aBlock[5] = v69;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2134D0014;
      aBlock[3] = (uint64_t)&block_descriptor_149;
      v71 = _Block_copy(aBlock);
      v72 = v70;
      swift_retain();
      swift_release();
      v73 = objc_msgSend(v66, sel_downloadTaskWithRequest_completionHandler_, v67, v71);
      _Block_release(v71);

      objc_msgSend(v73, sel_resume);
    }
    ((void (*)(char *, uint64_t))v88[1])(v33, v76);
  }
  return swift_release();
}

uint64_t _s12NanoUniverse22AegirCloudCoverServiceC03allD14LevelFileNamesSaySSGvg_0()
{
  int64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (qword_253F006D8 != -1)
    swift_once();
  v0 = *(_QWORD *)(qword_253F00B20 + 16);
  v1 = MEMORY[0x24BEE4AF8];
  if (v0)
  {
    v7 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_2134D2878(0, v0, 0);
    v2 = 0;
    v1 = v7;
    do
    {
      sub_2134D901C();
      swift_bridgeObjectRelease();
      v4 = *(_QWORD *)(v7 + 16);
      v3 = *(_QWORD *)(v7 + 24);
      if (v4 >= v3 >> 1)
        sub_2134D2878(v3 > 1, v4 + 1, 1);
      ++v2;
      *(_QWORD *)(v7 + 16) = v4 + 1;
      v5 = v7 + 16 * v4;
      *(_QWORD *)(v5 + 32) = 0x61632D632D333070;
      *(_QWORD *)(v5 + 40) = 0xEF2D65706F696C6CLL;
    }
    while (v0 != v2);
    swift_bridgeObjectRelease();
  }
  return v1;
}

unint64_t sub_2134D746C()
{
  unint64_t result;

  result = qword_253F00860;
  if (!qword_253F00860)
  {
    result = MEMORY[0x2199B50C4](&protocol conformance descriptor for AegirCloudCoverService.CloudLevel, &type metadata for AegirCloudCoverService.CloudLevel);
    atomic_store(result, (unint64_t *)&qword_253F00860);
  }
  return result;
}

uint64_t sub_2134D74B0()
{
  return sub_2134D7D68(&qword_254B9EF68, (uint64_t *)&unk_254B9EF70, MEMORY[0x24BEE12E0]);
}

uint64_t sub_2134D74DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t sub_2134D7534@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2134D7584(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_2134D75D8()
{
  return type metadata accessor for AegirCloudCoverService();
}

uint64_t sub_2134D75E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2134D8E18();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t method lookup function for AegirCloudCoverService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AegirCloudCoverService.fileConverter.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.fileConverter.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.fileConverter.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.disableFetch.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.disableFetch.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.disableFetch.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.directory.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.directory.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.directory.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AegirCloudCoverService.__allocating_init(configuration:imageScale:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of AegirCloudCoverService.retrieveCloudTextureURLs(notifyOn:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AegirCloudCoverService.cloudTextureURLs()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AegirCloudCoverService.canFetchData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AegirCloudCoverService.deleteCache()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t initializeBufferWithCopyOfBuffer for AegirCloudCoverService.Configuration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AegirCloudCoverService.Configuration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AegirCloudCoverService.Configuration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AegirCloudCoverService.Configuration(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for AegirCloudCoverService.Configuration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AegirCloudCoverService.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.Configuration()
{
  return &type metadata for AegirCloudCoverService.Configuration;
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.RetryStrategy(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AegirCloudCoverService.RetryStrategy(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.RetryStrategy()
{
  return &type metadata for AegirCloudCoverService.RetryStrategy;
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.CloudLevel(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AegirCloudCoverService.CloudLevel(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2134D7BA8 + 4 * byte_2134FA0DF[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2134D7BDC + 4 * byte_2134FA0DA[v4]))();
}

uint64_t sub_2134D7BDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2134D7BE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2134D7BECLL);
  return result;
}

uint64_t sub_2134D7BF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2134D7C00);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2134D7C04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2134D7C0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2134D7C18(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2134D7C24(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.CloudLevel()
{
  return &type metadata for AegirCloudCoverService.CloudLevel;
}

uint64_t sub_2134D7C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F00820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2134D7C84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2134D8E18();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2134D7CF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_2134D8E18() - 8) + 80);
  return sub_2134D1030(*(void (**)(char *))(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

void sub_2134D7D28()
{
  sub_2134CD9E0();
}

uint64_t sub_2134D7D30(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2134D7D68(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199B50C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2134D7DA8()
{
  uint64_t v0;

  return sub_2134CC104(*(char **)(v0 + 16));
}

void sub_2134D7DB0()
{
  sub_2134CC510();
}

uint64_t sub_2134D7DB8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2134D7DDC(uint64_t a1)
{
  uint64_t v1;

  sub_2134C9170(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2134D7DE4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2134D7E08()
{
  return swift_deallocObject();
}

uint64_t sub_2134D7E18()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2134D7E54()
{
  uint64_t v0;

  return sub_2134CB09C(*(char **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t))(v0 + 40));
}

uint64_t sub_2134D7E64()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2134D7E88()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = *(_BYTE **)(v0 + 24);
  swift_beginAccess();
  return sub_2134CB888((*v1 & 1) == 0);
}

uint64_t sub_2134D7ED4()
{
  return swift_deallocObject();
}

unint64_t sub_2134D7EE4()
{
  unint64_t result;

  result = qword_253F00850;
  if (!qword_253F00850)
  {
    result = MEMORY[0x2199B50C4](&protocol conformance descriptor for AegirCloudCoverService.CloudLevel, &type metadata for AegirCloudCoverService.CloudLevel);
    atomic_store(result, (unint64_t *)&qword_253F00850);
  }
  return result;
}

uint64_t sub_2134D7F28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2134D7F6C()
{
  id *v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_2134D7FB0(uint64_t a1)
{
  uint64_t v1;

  sub_2134CA5AC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40), *(char **)(v1 + 48), *(NSObject **)(v1 + 56));
}

uint64_t sub_2134D7FC4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2134D7FEC(uint64_t a1)
{
  uint64_t v1;

  return sub_2134CC714(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(uint64_t (**)(uint64_t))(v1 + 32));
}

uint64_t sub_2134D8004(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2134D8048()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2134D806C()
{
  uint64_t v0;

  return sub_2134CFEC8(*(void (**)(_BYTE *))(v0 + 16));
}

uint64_t sub_2134D8084()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2134D80B0()
{
  uint64_t v0;

  return sub_2134CFF58(*(void (**)(BOOL *))(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t objectdestroy_95Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2134D80EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2134D8130(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_2134CC808(*(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), a1);
}

uint64_t objectdestroy_98Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2134D818C(uint64_t a1)
{
  uint64_t v1;

  return sub_2134CE484(a1, *(void (**)(char *))(v1 + 16), *(void (**)(_QWORD, _QWORD))(v1 + 24), *(_QWORD *)(v1 + 32), *(unsigned __int8 *)(v1 + 48), *(void **)(v1 + 56), *(_QWORD *)(v1 + 64), *(double *)(v1 + 40));
}

uint64_t objectdestroy_102Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2134D81DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;

  return sub_2134CEE8C(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(unsigned __int8 *)(v3 + 48));
}

uint64_t objectdestroy_131Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_2134D8224()
{
  uint64_t v0;

  sub_2134CED84(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(void (**)(char *))(v0 + 56), *(void (**)(_QWORD, _QWORD))(v0 + 64), *(double *)(v0 + 48));
}

uint64_t sub_2134D823C()
{
  return swift_release();
}

uint64_t sub_2134D8244(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199B50C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2134D8284()
{
  sub_2134C7938();
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.ServerError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AegirCloudCoverService.ServerError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2134D8368 + 4 * byte_2134FA0E9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2134D839C + 4 * byte_2134FA0E4[v4]))();
}

uint64_t sub_2134D839C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2134D83A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2134D83ACLL);
  return result;
}

uint64_t sub_2134D83B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2134D83C0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2134D83C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2134D83CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2134D83D8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.ServerError()
{
  return &type metadata for AegirCloudCoverService.ServerError;
}

unint64_t sub_2134D83F8()
{
  unint64_t result;

  result = qword_254B9F068;
  if (!qword_254B9F068)
  {
    result = MEMORY[0x2199B50C4](&unk_2134FA370, &type metadata for AegirCloudCoverService.ServerError);
    atomic_store(result, (unint64_t *)&qword_254B9F068);
  }
  return result;
}

void sub_2134D84F4(_BYTE *a1@<X8>)
{
  sub_2134D8130(a1);
}

uint64_t sub_2134D8508()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void _NUNICreateImageFromURL_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2134A1000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: unable to open png %@ ", (uint8_t *)&v4, 0xCu);

}

void _NUNCalliopeCreateTexture_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2134A1000, a1, a3, "failed to create texture", a5, a6, a7, a8, 0);
}

void NUNILoadMtlTextureFromMemory_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2134A1000, a2, OS_LOG_TYPE_ERROR, "_loadMtlTextureFromMemory:%@ failed to get backing", (uint8_t *)&v2, 0xCu);
}

void NUNILoadMtlTextureFromMemory_cold_2()
{
  __assert_rtn("_NUNILoadMtlTextureFromBacking", "NUNIClassicRenderer.m", 1048, "opt.planes == 6");
}

void _NUNAegirCreateTexture_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2134A1000, log, OS_LOG_TYPE_ERROR, "failed to create texture", v1, 2u);
}

uint64_t sub_2134D8D34()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_2134D8D40()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_2134D8D4C()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_2134D8D58()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_2134D8D64()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_2134D8D70()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_2134D8D7C()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_2134D8D88()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_2134D8D94()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_2134D8DA0()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_2134D8DAC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2134D8DB8()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2134D8DC4()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2134D8DD0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2134D8DDC()
{
  return MEMORY[0x24BDCD8E8]();
}

uint64_t sub_2134D8DE8()
{
  return MEMORY[0x24BDCD8F0]();
}

uint64_t sub_2134D8DF4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2134D8E00()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2134D8E0C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2134D8E18()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2134D8E24()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_2134D8E30()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_2134D8E3C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2134D8E48()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2134D8E54()
{
  return MEMORY[0x24BEC2058]();
}

uint64_t sub_2134D8E60()
{
  return MEMORY[0x24BEC2060]();
}

uint64_t sub_2134D8E6C()
{
  return MEMORY[0x24BEC2098]();
}

uint64_t sub_2134D8E78()
{
  return MEMORY[0x24BEC20A0]();
}

uint64_t sub_2134D8E84()
{
  return MEMORY[0x24BEC20A8]();
}

uint64_t sub_2134D8E90()
{
  return MEMORY[0x24BEC2120]();
}

uint64_t sub_2134D8E9C()
{
  return MEMORY[0x24BEC2128]();
}

uint64_t sub_2134D8EA8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2134D8EB4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2134D8EC0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2134D8ECC()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2134D8ED8()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_2134D8EE4()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2134D8EF0()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2134D8EFC()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_2134D8F08()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2134D8F14()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2134D8F20()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2134D8F2C()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2134D8F38()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_2134D8F44()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2134D8F50()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2134D8F5C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2134D8F68()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2134D8F74()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2134D8F80()
{
  return MEMORY[0x24BEE55A8]();
}

uint64_t sub_2134D8F8C()
{
  return MEMORY[0x24BEE55B0]();
}

uint64_t sub_2134D8F98()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2134D8FA4()
{
  return MEMORY[0x24BEE5630]();
}

uint64_t sub_2134D8FB0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2134D8FBC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2134D8FC8()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2134D8FD4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2134D8FE0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2134D8FEC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2134D8FF8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2134D9004()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2134D9010()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2134D901C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2134D9028()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2134D9034()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2134D9040()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2134D904C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2134D9058()
{
  return MEMORY[0x24BEE1488]();
}

uint64_t sub_2134D9064()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2134D9070()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2134D907C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2134D9088()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2134D9094()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_2134D90A0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2134D90AC()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2134D90B8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2134D90C4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2134D90D0()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_2134D90DC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2134D90E8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2134D90F4()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_2134D9100()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_2134D910C()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_2134D9118()
{
  return MEMORY[0x24BEE58C0]();
}

uint64_t sub_2134D9124()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_2134D9130()
{
  return MEMORY[0x24BEE58E8]();
}

uint64_t sub_2134D913C()
{
  return MEMORY[0x24BEE5950]();
}

uint64_t sub_2134D9148()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2134D9154()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2134D9160()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2134D916C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2134D9178()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2134D9184()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2134D9190()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2134D919C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2134D91A8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2134D91B4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2134D91C0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2134D91CC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2134D91D8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2134D91E4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2134D91F0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2134D91FC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2134D9208()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2134D9214()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2134D9220()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2134D922C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2134D9238()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2134D9244()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2134D9250()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2134D925C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2134D9268()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2134D9274()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2134D9280()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2134D928C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2134D9298()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2134D92A4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2134D92B0()
{
  return MEMORY[0x24BEE4328]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE5E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

uint64_t CLKEqualObjects()
{
  return MEMORY[0x24BDB85D0]();
}

uint64_t CLKRoundDateDownToNearestMinute()
{
  return MEMORY[0x24BDB8648]();
}

uint64_t CLKUIComputeDimmingRequiredToObtainQuadAPL()
{
  return MEMORY[0x24BE16EB0]();
}

uint64_t CLKUIConvertToRGBfFromSRGBf_fast()
{
  return MEMORY[0x24BE16EB8]();
}

uint64_t CLKUIImageNamedFromBundleForDevice()
{
  return MEMORY[0x24BE16EE0]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BEBE660]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

