@implementation CAWindowServerDisplay

- (CGPoint)convertPoint:(CGPoint)result toContextId:(unsigned int)a4
{
  Server *var1;
  const double *v5;
  double v6;
  CGFloat v7;
  double x;
  double y;
  float64x2_t v10;
  __int128 v11;
  float64x2_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  float64x2_t v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  var1 = self->_impl->var1;
  if (var1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    x = result.x;
    y = result.y;
    CA::WindowServer::Server::context_transform((CA::WindowServer::Server *)&v10, (uint64_t)var1, *(uint64_t *)&a4);
    CA::Mat4Impl::mat4_invert((CA::Mat4Impl *)&v10, (CA::Mat4Impl *)&v10, v5);
    v6 = *((double *)&v17 + 1) + *((double *)&v11 + 1) * x + *((double *)&v13 + 1) * y;
    if (fabs(v6 + -1.0) >= 0.000001)
    {
      if (v6 <= 0.0)
        v6 = INFINITY;
      else
        v6 = 1.0 / v6;
    }
    result = (CGPoint)vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v16, v10, x), v12, y), v6);
    result.y = v7;
  }
  return result;
}

- (id)hitTestAtPosition:(CGPoint)a3 options:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Server *var1;
  __int16 v20;
  char v21;
  unsigned int *v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  double v35;
  unsigned int v36;
  double v37;
  Server *v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  __int32 v45;
  __int32 v46;
  int8x8_t v47;
  int v48;
  int v49;
  int8x8_t v51;
  unsigned int v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  unint64_t v57;
  __IOSurface *v58;
  double v59;
  __IOSurface *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *BaseAddress;
  size_t BytesPerRow;
  float v68;
  float v69;
  uint64_t v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  char *v79;
  unint64_t v80;
  uint64_t v81;
  unsigned int v82;
  float v83;
  unsigned int v84;
  float v85;
  float v86;
  float v87;
  float v88;
  double v89;
  double v90;
  uint64_t v92;
  unsigned int v93;
  _OWORD v94[8];
  _OWORD v95[8];
  _OWORD v96[8];
  _QWORD v97[5];
  __int128 v98;
  __int128 v99;
  _QWORD v100[52];
  uint64_t v101;
  int64x2_t v102;
  __int128 v103;
  _QWORD v104[4];
  _QWORD v105[9];
  const __CFString *v106;
  CGFloat v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  y = a3.y;
  x = a3.x;
  v115 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestOptionExcludedIds"));
  v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestIgnoreBlankingContext")), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestCumulativeOpacity")), "BOOLValue"))
    v9 |= 2u;
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestCumulativeTransform")), "BOOLValue"))v9 |= 4u;
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestWantsLayerBackgroundStatistics")), "BOOLValue"))v9 |= 8u;
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestInsecureFiltered")), "BOOLValue"))
    v9 |= 0x10u;
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestWantsContextSecurityAnalysis")), "BOOLValue"))v10 = v9 | 0x20;
  else
    v10 = v9;
  v11 = objc_msgSend(v8, "count");
  v12 = v11;
  v13 = 4 * v11 + 4;
  if (v11)
  {
    if (v13 > 0x1000)
    {
      v14 = (char *)malloc_type_malloc(4 * v11 + 4, 0xD5876AA1uLL);
      if (!v14)
      {
        v15 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      MEMORY[0x1E0C80A78](v11);
      v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v14, v13);
    }
    v16 = 0;
    do
    {
      *(_DWORD *)&v14[4 * v16] = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v16), "unsignedIntValue");
      ++v16;
    }
    while (v12 != v16);
    v15 = 1;
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
LABEL_20:
  v104[0] = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestBackgroundTopEdgeInset")), "unsignedIntegerValue");
  v104[1] = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestBackgroundLeftEdgeInset")), "unsignedIntegerValue");
  v104[2] = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestBackgroundBottomEdgeInset")), "unsignedIntegerValue");
  v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestBackgroundRightEdgeInset")), "unsignedIntegerValue");
  v18 = 0;
  v104[3] = v17;
  v102 = 0u;
  v103 = 0u;
  var1 = self->_impl->var1;
  v20 = *(_WORD *)(*((_QWORD *)var1 + 12) + 656);
  do
  {
    v102.i64[v18] = v104[((_BYTE)v20 + (_BYTE)v18) & 3];
    ++v18;
  }
  while (v18 != 4);
  v101 = 0;
  memset(v100, 0, sizeof(v100));
  v98 = 0u;
  v99 = 0u;
  v106 = *(const __CFString **)&x;
  v107 = y;
  CA::WindowServer::Server::hit_test((uint64_t)&v98, (uint64_t)var1, (CGFloat *)&v106, (int *)v14, v12, v10, &v102);
  if (v13 > 0x1000)
    v21 = v15;
  else
    v21 = 0;
  if ((v21 & 1) != 0)
    free(v14);
  if (!(_DWORD)v98)
    return 0;
  v22 = (unsigned int *)CA::Render::Context::context_by_id((CA::Render::Context *)v98);
  if (!v22)
    return 0;
  v23 = v22[65];
  if (!(_DWORD)v23)
    v23 = v22[64];
  v24 = v22 + 2;
  do
  {
    v25 = __ldaxr(v24);
    v26 = v25 - 1;
  }
  while (__stlxr(v26, v24));
  if (!v26)
    (*(void (**)(unsigned int *))(*(_QWORD *)v22 + 16))(v22);
  v27 = (void *)MEMORY[0x1E0C99E08];
  v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v98);
  v93 = DWORD1(v98);
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
  v31 = DWORD2(v99) - 1;
  v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", DWORD2(v99) != 0);
  if (v31 > 3)
    v33 = CFSTR("occlusionNone");
  else
    v33 = off_1E15A9478[v31];
  v34 = (void *)objc_msgSend(v27, "dictionaryWithObjectsAndKeys:", v28, CFSTR("hitTestContextId"), v29, CFSTR("hitTestSlotId"), v30, CFSTR("hitTestClientPort"), v32, CFSTR("hitTestDetectedOcclusion"), v33, CFSTR("hitTestOcclusionType"), 0);
  if ((v10 & 2) != 0)
  {
    LODWORD(v35) = v100[0];
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35), CFSTR("hitTestCumulativeOpacity"));
  }
  v36 = v93;
  if ((v10 & 4) != 0 && v93)
  {
    v96[4] = *(_OWORD *)&v100[9];
    v96[5] = *(_OWORD *)&v100[11];
    v96[6] = *(_OWORD *)&v100[13];
    v96[7] = *(_OWORD *)&v100[15];
    v96[0] = *(_OWORD *)&v100[1];
    v96[1] = *(_OWORD *)&v100[3];
    v96[2] = *(_OWORD *)&v100[5];
    v96[3] = *(_OWORD *)&v100[7];
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v96), CFSTR("hitTestCumulativeLayerTransform"));
    v95[4] = *(_OWORD *)&v100[25];
    v95[5] = *(_OWORD *)&v100[27];
    v95[6] = *(_OWORD *)&v100[29];
    v95[7] = *(_OWORD *)&v100[31];
    v95[0] = *(_OWORD *)&v100[17];
    v95[1] = *(_OWORD *)&v100[19];
    v95[2] = *(_OWORD *)&v100[21];
    v95[3] = *(_OWORD *)&v100[23];
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v95), CFSTR("hitTestCumulativeContentsTransform"));
  }
  if ((v10 & 0x10) != 0)
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE12(v99)), CFSTR("hitTestInsecureFiltered"));
  if ((v10 & 0x20) != 0 && (_BYTE)v101)
  {
    LODWORD(v35) = HIDWORD(v100[34]);
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35), CFSTR("hitTestSecurityAnalysisCumulativeOpacity"));
    v94[4] = *(_OWORD *)&v100[43];
    v94[5] = *(_OWORD *)&v100[45];
    v94[6] = *(_OWORD *)&v100[47];
    v94[7] = *(_OWORD *)&v100[49];
    v94[0] = *(_OWORD *)&v100[35];
    v94[1] = *(_OWORD *)&v100[37];
    v94[2] = *(_OWORD *)&v100[39];
    v94[3] = *(_OWORD *)&v100[41];
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v94), CFSTR("hitTestSecurityAnalysisCumulativeLayerTransform"));
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(v100[51])), CFSTR("hitTestSecurityAnalysisIsInsecureFiltered"));
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE1(v100[51])), CFSTR("hitTestSecurityAnalysisParentsHaveInsecureLayerProperties"));
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", BYTE2(v100[51])), CFSTR("hitTestSecurityAnalysisOcclusionType"));
    LODWORD(v37) = HIDWORD(v100[51]);
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37), CFSTR("hitTestSecurityAnalysisOcclusionPercent"));
  }
  if ((v10 & 8) != 0 && v36)
  {
    v38 = self->_impl->var1;
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestBackgroundForeground")), "floatValue");
    v40 = v39;
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestBackgroundPassingContrast")), "floatValue");
    v42 = v41;
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("hitTestBackgroundFailingContrast")), "floatValue");
    v44 = v43;
    v45 = DWORD2(v98);
    v46 = HIDWORD(v98);
    v47 = (int8x8_t)v99;
    if ((int)v99 <= SDWORD1(v99))
      v48 = DWORD1(v99);
    else
      v48 = v99;
    if ((int)v99 >= SDWORD1(v99))
      v49 = DWORD1(v99);
    else
      v49 = v99;
    if (v48 <= 1073741822 && v49 >= 1)
    {
      v45 = DWORD2(v98) + v102.i32[2];
      v46 = HIDWORD(v98) + v102.i32[0];
      if (DWORD1(v99) - ((int)v103 + v102.i32[0]) < 1 || (int)v99 - (DWORD2(v103) + v102.i32[2]) < 1)
        v52 = -1;
      else
        v52 = 0;
      v51.i32[1] = DWORD1(v99) - (v103 + v102.i32[0]);
      v51.i32[0] = v99 - (DWORD2(v103) + v102.i32[2]);
      v47 = vbic_s8(v51, (int8x8_t)vdup_n_s32(v52));
    }
    v53 = v47.i32[0];
    if (v47.i32[0] >= 1000)
      v53 = 1000;
    if (v53 <= 1)
      v54 = 1;
    else
      v54 = v53;
    if (v47.i32[1] >= 1000)
      v55 = 1000;
    else
      v55 = v47.i32[1];
    if (v55 <= 1)
      v56 = 1;
    else
      v56 = v55;
    v57 = (*MEMORY[0x1E0C85AC0] + ((4 * (_WORD)v54 + 63) & 0x1FC0) * (unint64_t)v56) & ~*MEMORY[0x1E0C85AC0];
    v97[0] = 64;
    v97[1] = (4 * (_WORD)v54 + 63) & 0x1FC0;
    v97[2] = 1;
    v97[3] = v57;
    v97[4] = 0;
    v58 = CA::SurfaceUtil::CAIOSurfaceCreate(v54, v56, 1111970369, 1024, 0, 0, 0, v97, CFSTR("Hit Test Snapshot"));
    if (v58)
    {
      v60 = v58;
      v61 = v45;
      v62 = (void *)MEMORY[0x186DBE2E4]();
      v63 = *((_QWORD *)v38 + 13);
      v105[0] = CFSTR("mode");
      v105[1] = CFSTR("destination");
      v106 = CFSTR("stopBeforeSlot");
      v107 = *(double *)&v60;
      v108 = v63;
      v105[2] = CFSTR("displayName");
      v105[3] = CFSTR("slotId");
      v109 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v93);
      v105[4] = CFSTR("originX");
      v110 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v61);
      v105[5] = CFSTR("originY");
      v111 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v46);
      v112 = MEMORY[0x1E0C9AAB0];
      v105[6] = CFSTR("enforceSecureMode");
      v105[7] = CFSTR("ignoreDisableUpdateMasks");
      v105[8] = CFSTR("selfGenerated");
      v113 = MEMORY[0x1E0C9AAA0];
      v114 = MEMORY[0x1E0C9AAB0];
      CARenderServerSnapshot_(0, (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, v105, 9));
      objc_autoreleasePoolPop(v62);
      if (initialized[0] != -1)
        dispatch_once_f(initialized, 0, (dispatch_function_t)init_debug);
      if (*(float *)&dword_1ECDC694C)
      {
        v64 = CAIOSurfaceWriteToFileWithSuffix(v60, "hit-test-slot");
        if (v64)
        {
          if (*(float *)&dword_1ECDC694C > 0.0)
            *(float *)&dword_1ECDC694C = *(float *)&dword_1ECDC694C + -1.0;
          free(v64);
        }
      }
      v65 = 1;
      IOSurfaceLock(v60, 1u, 0);
      BaseAddress = (char *)IOSurfaceGetBaseAddress(v60);
      BytesPerRow = IOSurfaceGetBytesPerRow(v60);
      v70 = 0;
      v71 = v40 + 0.05;
      v72 = (float)(v71 / v42) + -0.05;
      v74 = 1.0 / (float)((float)(v71 / v44) - (float)(v71 / v42));
      v75 = 1.0 / (float)-(float)((float)(v44 * v71) - (float)(v42 * v71));
      v76 = 0.0;
      v77 = 0.0;
      v78 = 0.0;
      do
      {
        v79 = &BaseAddress[v70 * BytesPerRow];
        v80 = v65;
        v81 = v54;
        do
        {
          LOBYTE(v68) = *v79;
          LOBYTE(v69) = v79[1];
          *(float *)&v82 = (float)LODWORD(v69);
          v83 = (float)((float)LODWORD(v68) * 0.0722) + (float)(*(float *)&v82 * 0.7152);
          LOBYTE(v82) = v79[2];
          *(float *)&v84 = (float)v82;
          v85 = v83 + (float)(*(float *)&v84 * 0.2126);
          LOBYTE(v84) = v79[3];
          v86 = (float)(v85 * (float)v84) * 0.0000152590219;
          v73 = (float)(v44 * v71) + -0.05;
          v76 = (float)((float)(fminf(fmaxf(fmaxf((float)((float)(v72 - v86) * v74) + 1.0, (float)(v86 - v73) * v75), 0.0), 1.0)- v76)/ (float)v80)+ v76;
          v87 = v86 - v78;
          v69 = (float)(v86 - v78) / (float)v80;
          v78 = v69 + v78;
          v68 = v86 - v78;
          v77 = v77 + (float)(v68 * v87);
          v79 += 4;
          ++v80;
          --v81;
        }
        while (v81);
        ++v70;
        v65 += v54;
      }
      while (v70 != v56);
      v88 = sqrtf(v77 / (float)(v56 * (unint64_t)v54));
      IOSurfaceUnlock(v60, 1u, 0);
      CFRelease(v60);
    }
    else
    {
      v88 = *((float *)&v100[33] + 1);
      v78 = *(float *)&v100[33];
      v76 = *(float *)&v100[34];
    }
    *(float *)&v59 = v78;
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59), CFSTR("hitTestBackgroundAverage"));
    *(float *)&v89 = v88;
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v89), CFSTR("hitTestBackgroundStandardDeviation"));
    *(float *)&v90 = v76;
    objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v90), CFSTR("hitTestBackgroundAverageContrastThreshold"));
  }
  return v34;
}

- (BOOL)setWhitePoint:(id *)a3 rampDuration:(double)a4 error:(id *)a5
{
  double v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a4;
    LODWORD(a4) = 1.0;
    -[CAWindowServerDisplay setColorMatrix:scale:rampDuration:](self, "setColorMatrix:scale:rampDuration:", a3, a5, a4, v6);
  }
  else if (a5 && !*a5)
  {
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("invalid nonnull argument");
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1, a4));
  }
  return a3 != 0;
}

- (void)setColorMatrix:(const float *)a3 scale:(float)a4 rampDuration:(double)a5
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_color_matrix((CA::WindowServer::Server *)self->_impl->var1, a3, a4, a5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setAmbient:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var0 = a3;
    impl->var2.var14 |= 1u;
  }
}

- (BOOL)commitBrightness:(id *)a3
{
  return -[CAWindowServerDisplay commitBrightness:withBlock:](self, "commitBrightness:withBlock:", a3, 0);
}

- (void)setSDRBrightness:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var2 = a3;
    impl->var2.var14 |= 2u;
  }
}

- (void)setPotentialHeadroom:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var4 = a3;
    impl->var2.var14 |= 8u;
  }
}

- (void)setIndicatorBrightness:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var8 = a3;
    impl->var2.var14 |= 0x1000u;
  }
}

- (void)setHeadroom:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var3 = a3;
    impl->var2.var14 |= 4u;
  }
}

- (void)setContrastEnhancer:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var11 = a3;
    impl->var2.var14 |= 0x200u;
  }
}

- (void)setBrightnessLimit:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var5 = a3;
    impl->var2.var14 |= 0x10u;
  }
}

- (void)setLowAmbientAdaptation:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    if (a3 > 1.0)
      a3 = 1.0;
    if (a3 < 0.0)
      a3 = 0.0;
    impl->var2.var6 = a3;
    impl->var2.var14 |= 0x80u;
  }
}

- (void)setHighAmbientAdaptation:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    if (a3 > 1.0)
      a3 = 1.0;
    if (a3 < 0.0)
      a3 = 0.0;
    impl->var2.var7 = a3;
    impl->var2.var14 |= 0x800u;
  }
}

- (BOOL)commitBrightness:(id *)a3 withBlock:(id)a4
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  uint64_t v9;
  __CFRunLoop *v10;
  CAWindowServerDisplayImpl *v11;
  float var2;
  float var3;
  __int128 v14;
  __int128 v15;
  unsigned int var14;
  void *v17;
  int16x8_t v18;
  _BOOL4 v19;
  const void *v20;
  const __CFString *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  unsigned int v25;
  const char *CStringPtr;
  uint64_t v28;
  _QWORD block[8];
  float v30;
  float v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  unsigned int v37;
  BOOL v38;
  char v39;
  char v40;
  BOOL v41;
  char v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  unsigned __int32 v46;
  BOOL v47;
  BOOL v48;
  _BYTE buf[32];
  __int128 v50;
  __int128 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
  {
    -[CAWindowServerDisplay emitBrightnessError:](self, "emitBrightnessError:", a3, a4);
    if (x_log_hook_p())
      goto LABEL_16;
    v22 = x_log_category_windowserver;
    v19 = os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR);
    if (!v19)
      return v19;
    *(_WORD *)buf = 0;
    v23 = "brightness commit failed - server invalidated";
    goto LABEL_19;
  }
  var1 = impl->var1;
  if (!-[CAWindowServerDisplay brightnessAvailable](self, "brightnessAvailable"))
  {
    -[CAWindowServerDisplay emitBrightnessError:](self, "emitBrightnessError:", a3);
    v20 = (const void *)(*(uint64_t (**)(Server *))(*(_QWORD *)var1 + 304))(var1);
    v21 = CFCopyDescription(v20);
    if (x_log_hook_p())
    {
      -[CAWindowServerDisplay displayId](self, "displayId");
      if (v21)
        CFStringGetCStringPtr(v21, 0x8000100u);
      x_log_();
    }
    else
    {
      v24 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        v25 = -[CAWindowServerDisplay displayId](self, "displayId");
        if (v21)
          CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
        else
          CStringPtr = "(null)";
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v25;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = CStringPtr;
        _os_log_impl(&dword_184457000, v24, OS_LOG_TYPE_ERROR, "Display %d brightness commit failed - unavailable. Capabilities: %s", buf, 0x12u);
        if (!v21)
          goto LABEL_23;
        goto LABEL_22;
      }
    }
    if (!v21)
      goto LABEL_23;
LABEL_22:
    CFRelease(v21);
    goto LABEL_23;
  }
  v9 = (*(uint64_t (**)(Server *))(*(_QWORD *)var1 + 384))(var1);
  if (!v9)
  {
    -[CAWindowServerDisplay emitBrightnessError:](self, "emitBrightnessError:", a3);
    if (x_log_hook_p())
    {
LABEL_16:
      x_log_();
LABEL_23:
      LOBYTE(v19) = 0;
      return v19;
    }
    v22 = x_log_category_windowserver;
    v19 = os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR);
    if (!v19)
      return v19;
    *(_WORD *)buf = 0;
    v23 = "brightness commit failed - no server runloop";
LABEL_19:
    _os_log_impl(&dword_184457000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_23;
  }
  v10 = (__CFRunLoop *)v9;
  v11 = self->_impl;
  var2 = v11->var2.var2;
  var3 = v11->var2.var3;
  v14 = *(_OWORD *)&v11->var2.var8;
  v15 = *(_OWORD *)&v11->var2.var10.var0[6];
  v50 = *(_OWORD *)&v11->var2.var10.var0[2];
  v51 = v15;
  var14 = v11->var2.var14;
  v52 = *(_DWORD *)&v11->var2.var12;
  *(_OWORD *)buf = *(_OWORD *)&v11->var2.var4;
  *(_OWORD *)&buf[16] = v14;
  v11->var2.var13 = 0;
  v11->var2.var14 = 0;
  v28 = *(_QWORD *)&v11->var2.var0;
  -[CAWindowServerDisplay displayId](self, "displayId");
  kdebug_trace();
  v17 = _Block_copy(a4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CAWindowServerDisplay_commitBrightness_withBlock___block_invoke;
  block[3] = &unk_1E15A92E8;
  v38 = (var14 & 0x40) != 0;
  block[7] = v28;
  v30 = var2;
  v31 = var3;
  v33 = *(_OWORD *)&buf[16];
  v34 = v50;
  v35 = v51;
  v32 = *(_OWORD *)buf;
  v36 = v52;
  v37 = var14;
  block[6] = var1;
  v39 = var14 & 1;
  v40 = (var14 & 4) >> 2;
  v41 = (var14 & 8) != 0;
  v42 = (var14 & 2) >> 1;
  v43 = (var14 & 0x10) != 0;
  v44 = (var14 & 0x20) != 0;
  v45 = (var14 & 0x80) != 0;
  v18 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(var14), (uint32x4_t)xmmword_18474E600);
  *(int8x8_t *)v18.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v18), (int8x8_t)0x1000100010001);
  v46 = vmovn_s16(v18).u32[0];
  v47 = (var14 & 0x200) != 0;
  block[4] = self;
  block[5] = v17;
  v48 = (var14 & 0x400) != 0;
  CFRunLoopPerformBlock(v10, (CFTypeRef)*MEMORY[0x1E0C9B270], block);
  CFRunLoopWakeUp(v10);
  LOBYTE(v19) = 1;
  return v19;
}

void __52__CAWindowServerDisplay_commitBrightness_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  float v5;
  __n128 v6;
  float v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  __int128 v49;
  uint64_t v50;
  _BYTE buf[28];
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) + 96);
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 1016))(v2);
  if (*(_BYTE *)(a1 + 144))
  {
    if (*(_BYTE *)(a1 + 136))
      v4 = v3;
    else
      v4 = 0;
    if (v4 == 1)
    {
LABEL_6:
      if (x_log_hook_p())
      {
        x_log_();
        return;
      }
      v8 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = "brightness commit failed - brightness control is disabled";
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        v12 = 2;
LABEL_92:
        _os_log_impl(&dword_184457000, v10, v11, v9, buf, v12);
        return;
      }
      return;
    }
  }
  else if ((v3 & 1) != 0)
  {
    goto LABEL_6;
  }
  v49 = 0uLL;
  v50 = 0;
  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)(*(_QWORD *)(a1 + 48) + 96) + 1216))(&v49);
  if (*(_BYTE *)(a1 + 145))
  {
    v5 = *(float *)(a1 + 56) * 0.318309886;
    *((float *)&v49 + 3) = v5;
  }
  v6.n128_f32[0] = CA::WindowServer::Display::edr_headroom(*(CA::WindowServer::Display **)(*(_QWORD *)(a1 + 48) + 96));
  if (*(_BYTE *)(a1 + 146))
    v7 = *(float *)(a1 + 68);
  else
    v7 = v6.n128_f32[0];
  if (*(_BYTE *)(a1 + 147))
  {
    v13 = *(_DWORD *)(a1 + 72);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) + 96);
    CA::WindowServer::Display::initialize_edr_state((_DWORD *)v14);
    v15 = *(_QWORD *)(v14 + 688);
    if (v15)
      atomic_store(v13, (unsigned int *)(v15 + 4));
  }
  (*(void (**)(_QWORD, __n128))(**(_QWORD **)(*(_QWORD *)(a1 + 48) + 96) + 920))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 96), v6);
  if (*(_BYTE *)(a1 + 148))
  {
    v17 = *(float *)(a1 + 64);
    CA::WindowServer::Server::set_sdr_nits(*(CA::WindowServer::Server **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64), v17);
  }
  else
  {
    v17 = v16;
  }
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 48) + 96) + 936))(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                  + 96));
  if (*(_BYTE *)(a1 + 149))
  {
    v19 = *(float *)(a1 + 76);
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
    pthread_mutex_lock((pthread_mutex_t *)(v20 + 24));
    if ((*(unsigned int (**)(_QWORD, float))(**(_QWORD **)(v20 + 96) + 944))(*(_QWORD *)(v20 + 96), v19))
    {
      if (byte_1ECDC6B04)
      {
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v46 = x_log_category_CADebug;
          if (os_log_type_enabled((os_log_t)x_log_category_CADebug, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "set_brightness_limit";
            _os_log_impl(&dword_184457000, v46, OS_LOG_TYPE_INFO, "kUpdateReasonDisplayBrightness %s", buf, 0xCu);
          }
        }
      }
      *(_QWORD *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, _BYTE *, double))(*(_QWORD *)v20 + 184))(v20, buf, 0.0);
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v20 + 96) + 968))(*(_QWORD *)(v20 + 96), 1);
      if (v19 < 1000.0 && (*(_DWORD *)(*(_QWORD *)(v20 + 96) + 745) & 0x4000) != 0 && MEMORY[0x1E0D15478])
        analytics_send_event_lazy();
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v20 + 24));
  }
  else
  {
    v19 = v18;
  }
  if ((*(_BYTE *)(a1 + 140) & 7) != 0)
  {
    *((float *)&v49 + 2) = v17 * v7;
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
    (*(void (**)(uint64_t, BOOL, float))(*(_QWORD *)v21 + 152))(v21, v7 != 1.0, v7);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
    *(_OWORD *)buf = v49;
    *(_QWORD *)&buf[16] = v50;
    (*(void (**)(_QWORD, _BYTE *))(**(_QWORD **)(v22 + 96) + 1224))(*(_QWORD *)(v22 + 96), buf);
  }
  if (*(_BYTE *)(a1 + 150))
  {
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) + 96);
    (*(void (**)(uint64_t, float))(*(_QWORD *)v23 + 1256))(v23, *(float *)(a1 + 60));
  }
  if (*(_BYTE *)(a1 + 144))
  {
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) + 96);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v24 + 1024))(v24, *(unsigned __int8 *)(a1 + 136));
  }
  if (*(_BYTE *)(a1 + 151))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
    v26 = *(float *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(v25 + 24));
    if ((*(unsigned int (**)(_QWORD, float))(**(_QWORD **)(v25 + 96) + 1280))(*(_QWORD *)(v25 + 96), v26))
    {
      if (byte_1ECDC6B04)
      {
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v47 = x_log_category_CADebug;
          if (os_log_type_enabled((os_log_t)x_log_category_CADebug, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "set_low_ambient_adaptation_strength";
            _os_log_impl(&dword_184457000, v47, OS_LOG_TYPE_INFO, "kUpdateReasonDisplayBrightness %s", buf, 0xCu);
          }
        }
      }
      *(_QWORD *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, _BYTE *, double))(*(_QWORD *)v25 + 184))(v25, buf, 0.0);
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v25 + 96) + 968))(*(_QWORD *)(v25 + 96), 1);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v25 + 24));
  }
  if (*(_BYTE *)(a1 + 152))
  {
    v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
    v28 = *(float *)(a1 + 84);
    pthread_mutex_lock((pthread_mutex_t *)(v27 + 24));
    if ((*(unsigned int (**)(_QWORD, float))(**(_QWORD **)(v27 + 96) + 1296))(*(_QWORD *)(v27 + 96), v28))
    {
      if (byte_1ECDC6B04)
      {
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v48 = x_log_category_CADebug;
          if (os_log_type_enabled((os_log_t)x_log_category_CADebug, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "set_high_ambient_adaptation_strength";
            _os_log_impl(&dword_184457000, v48, OS_LOG_TYPE_INFO, "kUpdateReasonDisplayBrightness %s", buf, 0xCu);
          }
        }
      }
      *(_QWORD *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, _BYTE *, double))(*(_QWORD *)v27 + 184))(v27, buf, 0.0);
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v27 + 96) + 968))(*(_QWORD *)(v27 + 96), 1);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v27 + 24));
  }
  if (*(_BYTE *)(a1 + 153))
  {
    v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
    v30 = *(float *)(a1 + 88);
    pthread_mutex_lock((pthread_mutex_t *)(v29 + 24));
    if ((*(unsigned int (**)(_QWORD, float))(**(_QWORD **)(v29 + 96) + 1312))(*(_QWORD *)(v29 + 96), v30))
    {
      *(_QWORD *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, _BYTE *, double))(*(_QWORD *)v29 + 184))(v29, buf, 0.0);
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v29 + 96) + 968))(*(_QWORD *)(v29 + 96), 1);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v29 + 24));
  }
  if (*(_BYTE *)(a1 + 154) && *(_BYTE *)(a1 + 137))
    CA::WindowServer::Server::set_irdc_hint(*(CA::WindowServer::Server **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64));
  if (*(_BYTE *)(a1 + 155))
    CA::WindowServer::Server::set_color_matrix(*(CA::WindowServer::Server **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64), (const float *)(a1 + 96), *(float *)(a1 + 92), 0.0);
  if (*(_BYTE *)(a1 + 156))
  {
    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
    v32 = *(float *)(a1 + 132);
    pthread_mutex_lock((pthread_mutex_t *)(v31 + 24));
    if ((*(unsigned int (**)(_QWORD, float))(**(_QWORD **)(v31 + 96) + 1328))(*(_QWORD *)(v31 + 96), v32))
    {
      *(_QWORD *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(0x100000uLL);
      (*(void (**)(uint64_t, _BYTE *, double))(*(_QWORD *)v31 + 184))(v31, buf, 0.0);
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v31 + 96) + 968))(*(_QWORD *)(v31 + 96), 1);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v31 + 24));
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) + 96);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v33 + 1904))(v33))
    {
      v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) + 96);
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 1912))(v34);
    }
    else
    {
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    }
    _Block_release(*(const void **)(a1 + 40));
  }
  if (*(_BYTE *)(a1 + 157))
  {
    v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) + 96);
    (*(void (**)(uint64_t))(*(_QWORD *)v35 + 1032))(v35);
  }
  if (x_log_hook_p())
  {
    objc_msgSend(*(id *)(a1 + 32), "displayId");
    x_log_();
    return;
  }
  v36 = x_log_category_brightness;
  if (os_log_type_enabled((os_log_t)x_log_category_brightness, OS_LOG_TYPE_DEFAULT))
  {
    v37 = objc_msgSend(*(id *)(a1 + 32), "displayId");
    v38 = -1.0;
    if (*(_BYTE *)(a1 + 148))
      v39 = v17;
    else
      v39 = -1.0;
    if (*(_BYTE *)(a1 + 146))
      v40 = v7;
    else
      v40 = -1.0;
    if (*(_BYTE *)(a1 + 145))
      v41 = *((float *)&v49 + 3) * 3.14159265;
    else
      v41 = -1.0;
    v42 = -1.0;
    v43 = -1.0;
    if (*(_BYTE *)(a1 + 150))
      v43 = *(float *)(a1 + 60);
    if (*(_BYTE *)(a1 + 149))
      v38 = v19;
    if (*(_BYTE *)(a1 + 151))
      v42 = *(float *)(a1 + 80);
    if (*(_BYTE *)(a1 + 152))
      v44 = *(float *)(a1 + 84);
    else
      v44 = -1.0;
    if (*(_BYTE *)(a1 + 144))
      v45 = *(unsigned __int8 *)(a1 + 136);
    else
      v45 = -1;
    *(_DWORD *)buf = 67111168;
    *(_DWORD *)&buf[4] = v37;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v39;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v40;
    v52 = 2048;
    v53 = v41;
    v54 = 2048;
    v55 = v43;
    v56 = 2048;
    v57 = v38;
    v58 = 2048;
    v59 = v42;
    v60 = 2048;
    v61 = v44;
    v62 = 1024;
    v63 = v45;
    v9 = "Display %d commitBrightness sdr: %g, headroom: %g, ambient lux: %g, filtered ambient: %g, limit: %g, low ambien"
         "t strength: %g, high ambient strength: %g, brightness ctl disabled %d\n";
    v10 = v36;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 84;
    goto LABEL_92;
  }
}

- (unsigned)displayId
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return *(_DWORD *)(*((_QWORD *)impl->var1 + 12) + 24);
  else
    return 0;
}

- (BOOL)brightnessAvailable
{
  if (!self->_impl)
    return 0;
  if (CADeviceSupportsBrightnessTransactions::once != -1)
    dispatch_once(&CADeviceSupportsBrightnessTransactions::once, &__block_literal_global_78);
  return CADeviceSupportsBrightnessTransactions::supports_brightness_transaction
      && !-[CAWindowServerDisplay displayType](self, "displayType")
      || -[CAWindowServerDisplay displayType](self, "displayType") == 3
      || (*(uint64_t (**)(Server *))(*(_QWORD *)self->_impl->var1 + 304))(self->_impl->var1) != 0;
}

- (int64_t)displayType
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v3;

  impl = self->_impl;
  if (impl
    && (v3 = ((*(unsigned __int16 *)(*((_QWORD *)impl->var1 + 12) + 656) >> 10) & 7u) - 1, v3 <= 3))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (void)setOrientation:(id)a3
{
  uint64_t v5;
  CAWindowServerDisplayImpl *impl;
  _WORD *v7;
  int v8;
  __int16 v9;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("portrait")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("landscapeLeft")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("portraitUpsideDown")) & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("landscapeRight")))
  {
    v5 = 3;
  }
  else
  {
    v5 = 0;
  }
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v7 = (_WORD *)*((_QWORD *)self->_impl->var1 + 12);
    v8 = (*(uint64_t (**)(_WORD *, uint64_t))(*(_QWORD *)v7 + 824))(v7, v5);
    v9 = v7[328];
    if (v8 != v9)
    {
      v7[328] = v9 & 0xFF00 | v8;
      CA::WindowServer::Display::post_display_changed((uint64_t)v7);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (NSString)orientation
{
  CAWindowServerDisplayImpl *impl;
  unsigned __int8 *v4;
  unsigned int v5;

  impl = self->_impl;
  if (!impl)
    return (NSString *)CFSTR("portrait");
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (unsigned __int8 *)*((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(unsigned __int8 *, _QWORD))(*(_QWORD *)v4 + 832))(v4, v4[656]);
  pthread_mutex_unlock(&impl->var0._m);
  if (v5 > 3)
    return 0;
  else
    return &off_1E15A9498[v5]->isa;
}

- (id)_initWithCADisplayServer:(void *)a3
{
  CAWindowServerDisplay *v4;
  malloc_zone_t *malloc_zone;
  pthread_mutex_t *v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CAWindowServerDisplay;
  v4 = -[CAWindowServerDisplay init](&v9, sel_init);
  if (v4)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v6 = (pthread_mutex_t *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    v4->_impl = (CAWindowServerDisplayImpl *)v6;
    x_thread_init_mutex(v6, 1);
    v4->_impl->var1 = (Server *)a3;
    if (CADeviceSupportsAPT::once != -1)
      dispatch_once(&CADeviceSupportsAPT::once, &__block_literal_global_37);
    if (CADeviceSupportsAPT::supports_apt && (*(_DWORD *)(*((_QWORD *)a3 + 12) + 624) & 0x10) != 0)
    {
      -[CAWindowServerDisplay powerStateDidChange:](v4, "powerStateDidChange:", 0);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_powerStateDidChange_, *MEMORY[0x1E0CB3048], 0);
    }
  }
  return v4;
}

- (void)invalidate
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    destroy_impl(impl);
    self->_impl = 0;
  }
}

- (void)dealloc
{
  CAWindowServerDisplayImpl *impl;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  impl = self->_impl;
  if (impl)
  {
    destroy_impl(impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAWindowServerDisplay;
  -[CAWindowServerDisplay dealloc](&v4, sel_dealloc);
}

- (void)update
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    CA::WindowServer::Server::update_display_modes_locked((CA::WindowServer::Server *)var1);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (CGRect)bounds
{
  CAWindowServerDisplayImpl *impl;
  int32x4_t v4;
  int32x4_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int8x16_t v10;
  uint64_t v11;
  int64x2_t v12;
  double v13;
  double v14;
  int8x16_t v15;
  double v16;
  double v17;
  double v18;
  int8x16_t v19;
  CGRect result;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v6 = *((_QWORD *)self->_impl->var1 + 12);
    v7 = *(_DWORD *)(v6 + 176);
    v8 = *(_DWORD *)(v6 + 180);
    if (v7 <= v8)
      v9 = *(_DWORD *)(v6 + 180);
    else
      v9 = *(_DWORD *)(v6 + 176);
    v4.i32[0] = 1073741822;
    v5.i32[0] = v9;
    v10 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v5, v4), 0);
    v11 = *(_QWORD *)(v6 + 168);
    v12.i64[0] = (int)v11;
    v12.i64[1] = SHIDWORD(v11);
    v19 = vbslq_s8(v10, (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v12));
    if (v9 <= 1073741822)
      v13 = (double)v7;
    else
      v13 = 1.79769313e308;
    if (v9 <= 1073741822)
      v14 = (double)v8;
    else
      v14 = 1.79769313e308;
    pthread_mutex_unlock(&impl->var0._m);
    v15 = v19;
  }
  else
  {
    v15 = *(int8x16_t *)MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v16 = *(double *)&v15.i64[1];
  v17 = v13;
  v18 = v14;
  result.origin.x = *(double *)v15.i64;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  return result;
}

- (CGSize)nativeSize
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v3;
  int *v4;
  double v5;
  double v6;
  CGSize result;

  impl = self->_impl;
  if (impl)
  {
    v3 = *((_QWORD *)impl->var1 + 12);
    if (((*(unsigned __int16 *)(v3 + 656) >> 10) & 3 | 4) == 4)
    {
      v4 = (int *)(v3 + 88);
    }
    else
    {
      v4 = (int *)(v3 + 80);
      if (!*(_DWORD *)(v3 + 80) || !*(_DWORD *)(v3 + 84))
        v4 = (int *)(v3 + 72);
    }
    v5 = (double)*v4;
    v6 = (double)v4[1];
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)touchScales
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  impl = self->_impl;
  if (impl)
  {
    v3 = *((_QWORD *)impl->var1 + 12);
    v4 = *(double *)(v3 + 112);
    v5 = *(double *)(v3 + 120);
  }
  else
  {
    v4 = 1.0;
    v5 = 1.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)scale
{
  CAWindowServerDisplayImpl *impl;
  double v4;

  impl = self->_impl;
  if (!impl)
    return 1.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *(double *)(*((_QWORD *)self->_impl->var1 + 12) + 128);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setScale:(double)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_scale((CA::WindowServer::Server *)self->_impl->var1, a3, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (CGSize)scales
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v4 = *((_QWORD *)self->_impl->var1 + 12);
    v5 = *(double *)(v4 + 128);
    v6 = *(double *)(v4 + 136);
    pthread_mutex_unlock(&impl->var0._m);
  }
  else
  {
    v5 = 1.0;
    v6 = 1.0;
  }
  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setScales:(CGSize)a3
{
  CAWindowServerDisplayImpl *impl;
  double height;
  double width;

  impl = self->_impl;
  if (impl)
  {
    height = a3.height;
    width = a3.width;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_scale((CA::WindowServer::Server *)self->_impl->var1, width, height);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)scalePreservesAspect
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *(_BYTE *)(*((_QWORD *)self->_impl->var1 + 12) + 144) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setScalePreservesAspect:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  int v4;
  Server *var1;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int32x4_t v14;
  uint64_t v15;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    v15 = *((_QWORD *)var1 + 12);
    if (*(unsigned __int8 *)(v15 + 144) != v4)
    {
      *(_BYTE *)(v15 + 144) = v4;
      CA::WindowServer::Display::update_geometry(v15, v7, v8, v9, v10, v11, v12, v13, v14);
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (double)minimumScale
{
  CAWindowServerDisplayImpl *impl;
  double result;

  impl = self->_impl;
  if (!impl)
    return 1.0;
  (*(void (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 24))(*((_QWORD *)impl->var1 + 12));
  return result;
}

- (double)maximumScale
{
  CAWindowServerDisplayImpl *impl;
  double result;

  impl = self->_impl;
  if (!impl)
    return 1.0;
  (*(void (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 32))(*((_QWORD *)impl->var1 + 12));
  return result;
}

- (unint64_t)maxLayerBandwidth
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(unsigned int (**)(_QWORD, SEL))(**((_QWORD **)impl->var1 + 12) + 40))(*((_QWORD *)impl->var1 + 12), a2);
  else
    return 0;
}

- (unint64_t)minimumSourceRectSize
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 56))(*((_QWORD *)impl->var1 + 12));
  else
    return 32;
}

- (unint64_t)maximumSourceRectWidth
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 64))(*((_QWORD *)impl->var1 + 12));
  else
    return 1920;
}

- (unint64_t)maximumSourceRectPixels
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 72))(*((_QWORD *)impl->var1 + 12));
  else
    return 2304000;
}

- (CGSize)panelPhysicalSize
{
  CAWindowServerDisplayImpl *impl;
  double v3;
  double v4;
  CGSize result;

  impl = self->_impl;
  if (impl)
  {
    (*(void (**)(_QWORD, SEL))(**((_QWORD **)impl->var1 + 12) + 16))(*((_QWORD *)impl->var1 + 12), a2);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSString)name
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (NSString *)*((_QWORD *)impl->var1 + 13);
  else
    return 0;
}

- (NSString)deviceName
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return *(NSString **)(*((_QWORD *)impl->var1 + 12) + 8);
  else
    return 0;
}

- (NSString)uniqueId
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  NSString *v5;
  _OWORD v7[4];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  memset(v7, 0, sizeof(v7));
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  if (((*(uint64_t (**)(uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD))(*(_QWORD *)v4 + 800))(v4, 0, v7, 64, 0) & 1) != 0)v5 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  else
    v5 = 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (NSSet)systemIdentifiers
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return *(NSSet **)(*((_QWORD *)impl->var1 + 12) + 16);
  else
    return 0;
}

- (void)setSystemIdentifiers:(id)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v5;
  id v6;
  CFSetRef Copy;

  impl = self->_impl;
  if (impl)
  {
    v5 = *((_QWORD *)impl->var1 + 12);
    v6 = *(id *)(v5 + 16);
    if (v6 != a3)
    {
      if (v6)
        CFRelease(v6);
      Copy = 0;
      if (a3)
        Copy = CFSetCreateCopy(0, (CFSetRef)a3);
      *(_QWORD *)(v5 + 16) = Copy;
    }
  }
}

- (unint64_t)productId
{
  CAWindowServerDisplayImpl *impl;
  _QWORD v4[3];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return 0;
  (*(void (**)(_QWORD *__return_ptr))(**((_QWORD **)impl->var1 + 12) + 1360))(v4);
  return v5;
}

- (unint64_t)vendorId
{
  CAWindowServerDisplayImpl *impl;
  _QWORD v4[3];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return 0;
  (*(void (**)(_QWORD *__return_ptr))(**((_QWORD **)impl->var1 + 12) + 1360))(v4);
  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", -[CAWindowServerDisplay uniqueId](self, "uniqueId"));
}

- (unsigned)rendererFlags
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return *((_DWORD *)impl->var1 + 46);
  else
    return 0;
}

- (unsigned)contextIdAtPosition:(CGPoint)a3
{
  return -[CAWindowServerDisplay contextIdAtPosition:excludingContextIds:](self, "contextIdAtPosition:excludingContextIds:", 0, a3.x, a3.y);
}

- (unsigned)contextIdAtPosition:(CGPoint)a3 excludingContextIds:(id)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  uint64_t v13;
  Server *var1;
  CGFloat v15[2];
  _DWORD v16[112];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_impl)
    return 0;
  y = a3.y;
  x = a3.x;
  v8 = objc_msgSend(a4, "count");
  v9 = v8;
  v10 = 4 * v8 + 4;
  if (v8)
  {
    if (v10 > 0x1000)
    {
      v11 = (char *)malloc_type_malloc(4 * v8 + 4, 0x13CFDA2EuLL);
      if (!v11)
        goto LABEL_10;
    }
    else
    {
      MEMORY[0x1E0C80A78](v8);
      v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, v10);
    }
    v13 = 0;
    do
    {
      *(_DWORD *)&v11[4 * v13] = objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v13), "unsignedIntValue");
      ++v13;
    }
    while (v9 != v13);
  }
  else
  {
    v11 = 0;
  }
LABEL_10:
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  var1 = self->_impl->var1;
  v15[0] = x;
  v15[1] = y;
  CA::WindowServer::Server::hit_test((uint64_t)v16, (uint64_t)var1, v15, (int *)v11, v9, 0, 0);
  if (v10 > 0x1000)
    free(v11);
  return v16[0];
}

- (unsigned)clientPortAtPosition:(CGPoint)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t var1;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  CGPoint v11;
  CA::Render::Context *v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return 0;
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)v12 = 0u;
  v13 = 0u;
  var1 = (uint64_t)impl->var1;
  v11 = a3;
  CA::WindowServer::Server::hit_test((uint64_t)v12, var1, &v11.x, 0, 0, 0, 0);
  if (!LODWORD(v12[0]))
    return 0;
  v5 = (unsigned int *)CA::Render::Context::context_by_id((CA::Render::Context *)LODWORD(v12[0]));
  if (!v5)
    return 0;
  v6 = v5[65];
  if (!v6)
    v6 = v5[64];
  v7 = v5 + 2;
  do
  {
    v8 = __ldaxr(v7);
    v9 = v8 - 1;
  }
  while (__stlxr(v9, v7));
  if (!v9)
    (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
  return v6;
}

- (unsigned)clientPortOfContextId:(unsigned int)a3
{
  CAWindowServerDisplayImpl *impl;
  unsigned int *v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  impl = self->_impl;
  if (!impl)
    return 0;
  v4 = (unsigned int *)CA::WindowServer::Server::retain_context((os_unfair_lock_s *)impl->var1, a3);
  if (!v4)
    return 0;
  v5 = v4[65];
  if (!v5)
    v5 = v4[64];
  v6 = v4 + 2;
  do
  {
    v7 = __ldaxr(v6);
    v8 = v7 - 1;
  }
  while (__stlxr(v8, v6));
  if (!v8)
    (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
  return v5;
}

- (unsigned)taskNamePortOfContextId:(unsigned int)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  unsigned int *v5;
  mach_port_name_t v6;
  pid_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  mach_port_name_t tn;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v4 = CA::WindowServer::Server::retain_context((os_unfair_lock_s *)impl->var1, a3);
    if (v4)
    {
      v5 = (unsigned int *)v4;
      tn = *(_DWORD *)(v4 + 252);
      if (!tn)
      {
        v6 = *MEMORY[0x1E0C83DA0];
        v7 = getpid();
        task_name_for_pid(v6, v7, &tn);
      }
      v8 = v5 + 2;
      do
      {
        v9 = __ldaxr(v8);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, v8));
      if (!v10)
        (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
      LODWORD(v4) = tn;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }
  return v4;
}

- (CGPoint)convertPoint:(CGPoint)result fromContextId:(unsigned int)a4
{
  Server *var1;
  double v5;
  CGFloat v6;
  double x;
  double y;
  float64x2_t v9;
  __int128 v10;
  float64x2_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float64x2_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  var1 = self->_impl->var1;
  if (var1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    x = result.x;
    y = result.y;
    CA::WindowServer::Server::context_transform((CA::WindowServer::Server *)&v9, (uint64_t)var1, *(uint64_t *)&a4);
    v5 = *((double *)&v16 + 1) + *((double *)&v10 + 1) * x + *((double *)&v12 + 1) * y;
    if (fabs(v5 + -1.0) >= 0.000001)
    {
      if (v5 <= 0.0)
        v5 = INFINITY;
      else
        v5 = 1.0 / v5;
    }
    result = (CGPoint)vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v15, v9, x), v11, y), v5);
    result.y = v6;
  }
  return result;
}

- (CATransform3D)transformFromLayerId:(SEL)a3 inContextId:(unint64_t)a4
{
  CATransform3D *result;
  CA::Render::Object *v6;
  CA::Render::Context *v7;
  CATransform3D *v8;
  CATransform3D *v9;
  uint64_t v10;
  CA::Render::Object *v11;
  CA::Render::Context *v12;
  CA::Render::Context *v13;
  double v14;
  CA::Render::Object *v15;
  CA::Render::Object *v16;
  unsigned int *v17;
  unsigned int v18;
  CA::Render::Object *v19;
  CA::Render::LayerNode *v20;
  CA::Render::LayerNode *v21;
  CA::Render::LayerNode *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  CA::Render::LayerNode *v28;
  CA::Render::LayerNode *v29;
  uint64_t v30;
  __int128 v31;
  CA::Render::LayerNode *v32;
  CA::Render::Object *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int *v37;
  unsigned int v38;
  CA::Render::LayerNode *v39;
  CA::Render::LayerNode *v40;
  CA::Render::Context *v41;
  CA::Render::LayerNode *v42;
  int64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  uint64_t v47;
  CA::Render::LayerNode *v48;
  CA::Render::LayerNode *v49;
  uint64_t v50;
  __int128 v51;
  CA::Render::LayerNode *v52;
  CA::Render::Context *v53;
  CA::Render::Context *v54;
  uint64_t v55;
  CA::Render::Object *v56;
  unsigned int *v57;
  unsigned int v58;
  CA::Render::Object *v59;
  CA::Render::LayerNode *v60;
  CA::Render::LayerNode *v61;
  CA::Render::LayerNode *v62;
  int64_t v63;
  unint64_t v64;
  int64_t v65;
  unint64_t v66;
  uint64_t v67;
  CA::Render::LayerNode *v68;
  CA::Render::LayerNode *v69;
  uint64_t v70;
  __int128 v71;
  CA::Render::LayerNode *v72;
  CA::Render::Object *v73;
  unsigned int v74;
  unsigned int *v75;
  unsigned int v76;
  unsigned int *v77;
  unsigned int v78;
  CA::Render::LayerNode *v79;
  int v80;
  CA::Render::LayerNode *v81;
  const CA::Shape *v82;
  int64x2_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CA::Render::LayerNode *v91;
  unsigned int *v92;
  unsigned int v93;
  unsigned int v94;
  CA::Render::LayerNode *v95;
  CA::Render::LayerNode *i;
  unsigned int *v97;
  unsigned int *v98;
  unsigned int *v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int *v102;
  unsigned int v103;
  unsigned int v104;
  CA::Render::LayerNode *v105;
  CA::Render::LayerNode *v106;
  unsigned int *v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int *v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  _QWORD v116[3];
  CA::Render::Context *v117;
  CA::Render::LayerNode *v118[4];
  uint64_t v119;
  _QWORD v120[2];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[133];
  unsigned int v130;
  CA::Render::LayerNode **v131;
  __int128 v132;
  CA::Render::LayerNode *v133;
  CA::Render::LayerNode **v134;
  uint64_t v135;

  MEMORY[0x1E0C80A78](self);
  v9 = v8;
  v135 = *MEMORY[0x1E0C80C00];
  v10 = *(_QWORD *)(*(_QWORD *)&result->m12 + 64);
  if (!v10)
  {
    *v8 = CATransform3DIdentity;
    return result;
  }
  v11 = v6;
  v116[1] = v6;
  v116[2] = v7;
  v12 = (CA::Render::Context *)CA::Render::Context::context_by_id(v7);
  memset(v118, 0, sizeof(v118));
  v117 = v12;
  v116[0] = &off_1E158C0D8;
  v119 = v10;
  if (v12)
  {
    v13 = v12;
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 16));
    v14 = *(double *)(v10 + 280);
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 16));
    CA::Render::Context::will_commit(v13);
    if (v11)
    {
      v15 = CA::Render::Context::lookup_handle(v13, v11, 0, 0, 0);
      if (!v15)
      {
        v41 = v13;
        goto LABEL_85;
      }
      v16 = v15;
      do
      {
        v17 = (unsigned int *)((char *)v16 + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 + 1, v17));
        v19 = v16;
        if (!v18)
        {
          do
          {
            v19 = 0;
            v34 = __ldaxr(v17);
          }
          while (__stlxr(v34 - 1, v17));
        }
        v20 = v118[2];
        if (v118[2] >= v118[3])
        {
          v22 = v118[1];
          v23 = (v118[2] - v118[1]) >> 3;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 61)
            goto LABEL_136;
          v25 = v118[3] - v118[1];
          if ((v118[3] - v118[1]) >> 2 > v24)
            v24 = v25 >> 2;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
            v26 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          v134 = &v118[3];
          if (v26)
          {
            v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Display::DisplayLinkItem *>>(v26);
            v22 = v118[1];
            v20 = v118[2];
          }
          else
          {
            v27 = 0;
          }
          v28 = (CA::Render::LayerNode *)(v26 + 8 * v23);
          v29 = (CA::Render::LayerNode *)(v26 + 8 * v27);
          v133 = v29;
          *(_QWORD *)v28 = v19;
          *((_QWORD *)&v132 + 1) = (char *)v28 + 8;
          if (v20 == v22)
          {
            v21 = (CA::Render::LayerNode *)((char *)v28 + 8);
          }
          else
          {
            do
            {
              v30 = *((_QWORD *)v20 - 1);
              v20 = (CA::Render::LayerNode *)((char *)v20 - 8);
              *((_QWORD *)v28 - 1) = v30;
              v28 = (CA::Render::LayerNode *)((char *)v28 - 8);
              *(_QWORD *)v20 = 0;
            }
            while (v20 != v22);
            v21 = (CA::Render::LayerNode *)*((_QWORD *)&v132 + 1);
            v29 = v133;
          }
          v31 = *(_OWORD *)&v118[1];
          v118[1] = v28;
          v118[2] = v21;
          v132 = v31;
          v32 = v118[3];
          v118[3] = v29;
          v133 = v32;
          v131 = (CA::Render::LayerNode **)v31;
          std::__split_buffer<X::Ref<CA::Render::Handle>>::~__split_buffer((uint64_t)&v131);
        }
        else
        {
          *(_QWORD *)v118[2] = v19;
          v21 = (CA::Render::LayerNode *)((char *)v20 + 8);
        }
        v118[2] = v21;
        v33 = (CA::Render::Object *)*((_QWORD *)v16 + 4);
        if (!v33)
          break;
        v16 = CA::Render::Context::lookup_handle(v117, v33, 0, 0, 0);
      }
      while (v16);
    }
    else
    {
      v35 = CA::Render::Context::root_layer_handle(v13);
      v36 = v35;
      if (v35)
      {
        v37 = (unsigned int *)(v35 + 8);
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 + 1, v37));
        if (!v38)
        {
          v36 = 0;
          do
            v115 = __ldaxr(v37);
          while (__stlxr(v115 - 1, v37));
        }
      }
      v39 = v118[2];
      if (v118[2] >= v118[3])
      {
        v42 = v118[1];
        v43 = (v118[2] - v118[1]) >> 3;
        v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 61)
LABEL_136:
          abort();
        v45 = v118[3] - v118[1];
        if ((v118[3] - v118[1]) >> 2 > v44)
          v44 = v45 >> 2;
        if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
          v46 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v46 = v44;
        v134 = &v118[3];
        if (v46)
        {
          v46 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Display::DisplayLinkItem *>>(v46);
          v42 = v118[1];
          v39 = v118[2];
        }
        else
        {
          v47 = 0;
        }
        v48 = (CA::Render::LayerNode *)(v46 + 8 * v43);
        v49 = (CA::Render::LayerNode *)(v46 + 8 * v47);
        v133 = v49;
        *(_QWORD *)v48 = v36;
        *((_QWORD *)&v132 + 1) = (char *)v48 + 8;
        if (v39 == v42)
        {
          v40 = (CA::Render::LayerNode *)((char *)v48 + 8);
        }
        else
        {
          do
          {
            v50 = *((_QWORD *)v39 - 1);
            v39 = (CA::Render::LayerNode *)((char *)v39 - 8);
            *((_QWORD *)v48 - 1) = v50;
            v48 = (CA::Render::LayerNode *)((char *)v48 - 8);
            *(_QWORD *)v39 = 0;
          }
          while (v39 != v42);
          v40 = (CA::Render::LayerNode *)*((_QWORD *)&v132 + 1);
          v49 = v133;
        }
        v51 = *(_OWORD *)&v118[1];
        v118[1] = v48;
        v118[2] = v40;
        v132 = v51;
        v52 = v118[3];
        v118[3] = v49;
        v133 = v52;
        v131 = (CA::Render::LayerNode **)v51;
        std::__split_buffer<X::Ref<CA::Render::Handle>>::~__split_buffer((uint64_t)&v131);
      }
      else
      {
        *(_QWORD *)v118[2] = v36;
        v40 = (CA::Render::LayerNode *)((char *)v39 + 8);
      }
      v118[2] = v40;
    }
    v53 = v117;
    if (*((_QWORD *)v117 + 52) && v117)
    {
      while (1)
      {
        v54 = (CA::Render::Context *)*((_QWORD *)v53 + 54);
        if (!v54)
          break;
        v55 = *((_QWORD *)v53 + 52);
        v53 = (CA::Render::Context *)*((_QWORD *)v53 + 54);
        if (v55)
        {
          v56 = *(CA::Render::Object **)(v55 + 24);
          v53 = v54;
          if (v56)
          {
            do
            {
              v57 = (unsigned int *)((char *)v56 + 8);
              do
                v58 = __ldaxr(v57);
              while (__stlxr(v58 + 1, v57));
              v59 = v56;
              if (!v58)
              {
                do
                {
                  v59 = 0;
                  v74 = __ldaxr(v57);
                }
                while (__stlxr(v74 - 1, v57));
              }
              v60 = v118[2];
              if (v118[2] >= v118[3])
              {
                v62 = v118[1];
                v63 = (v118[2] - v118[1]) >> 3;
                v64 = v63 + 1;
                if ((unint64_t)(v63 + 1) >> 61)
                  goto LABEL_136;
                v65 = v118[3] - v118[1];
                if ((v118[3] - v118[1]) >> 2 > v64)
                  v64 = v65 >> 2;
                if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF8)
                  v66 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v66 = v64;
                v134 = &v118[3];
                if (v66)
                {
                  v66 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Display::DisplayLinkItem *>>(v66);
                  v62 = v118[1];
                  v60 = v118[2];
                }
                else
                {
                  v67 = 0;
                }
                v68 = (CA::Render::LayerNode *)(v66 + 8 * v63);
                v69 = (CA::Render::LayerNode *)(v66 + 8 * v67);
                v133 = v69;
                *(_QWORD *)v68 = v59;
                *((_QWORD *)&v132 + 1) = (char *)v68 + 8;
                if (v60 == v62)
                {
                  v61 = (CA::Render::LayerNode *)((char *)v68 + 8);
                }
                else
                {
                  do
                  {
                    v70 = *((_QWORD *)v60 - 1);
                    v60 = (CA::Render::LayerNode *)((char *)v60 - 8);
                    *((_QWORD *)v68 - 1) = v70;
                    v68 = (CA::Render::LayerNode *)((char *)v68 - 8);
                    *(_QWORD *)v60 = 0;
                  }
                  while (v60 != v62);
                  v61 = (CA::Render::LayerNode *)*((_QWORD *)&v132 + 1);
                  v69 = v133;
                }
                v71 = *(_OWORD *)&v118[1];
                v118[1] = v68;
                v118[2] = v61;
                v132 = v71;
                v72 = v118[3];
                v118[3] = v69;
                v133 = v72;
                v131 = (CA::Render::LayerNode **)v71;
                std::__split_buffer<X::Ref<CA::Render::Handle>>::~__split_buffer((uint64_t)&v131);
              }
              else
              {
                *(_QWORD *)v118[2] = v59;
                v61 = (CA::Render::LayerNode *)((char *)v60 + 8);
              }
              v118[2] = v61;
              v73 = (CA::Render::Object *)*((_QWORD *)v56 + 4);
              if (!v73)
                break;
              v56 = CA::Render::Context::lookup_handle(v54, v73, 0, 0, 0);
            }
            while (v56);
            v53 = v54;
          }
        }
      }
      pthread_mutex_lock((pthread_mutex_t *)((char *)v53 + 72));
      v77 = (unsigned int *)((char *)v53 + 8);
      do
        v78 = __ldaxr(v77);
      while (__stlxr(v78 + 1, v77));
      if (v78)
      {
        CA::Render::Context::did_commit((unint64_t)v117, 0, 0, 1, 0, 0);
LABEL_94:
        *v9 = CATransform3DIdentity;
        if (v118[1] != v118[2])
        {
          bzero(v129, 0x430uLL);
          v121 = 0uLL;
          CA::Render::Update::Update((CA::Render::Update *)v129, (const CA::Bounds *)&v131, 0x2000uLL, v14, 0, 0, 0, 0, (const CA::Bounds *)&v121, *(_DWORD *)(v119 + 184));
          if (v129[0])
          {
            v80 = 140;
            if (!*(_BYTE *)(v119 + 514))
              v80 = 12;
            v130 = v80 | v130 & 0xFFFFFF73;
            v129[43] = v116;
            CA::Render::Update::add_context((CA::Render::Update *)v129, v53);
            CA::Render::Update::added_all_contexts((CA::Render::Update *)v129, v81, v82, v83);
            v79 = v118[0];
            if (v118[0])
            {
              v121 = xmmword_18474DF40;
              v122 = 0u;
              v123 = xmmword_18474DF50;
              v124 = 0u;
              v125 = 0u;
              v126 = xmmword_18474DF40;
              v127 = 0u;
              v128 = xmmword_18474DF50;
              v120[0] = &off_1E15997A0;
              v120[1] = &v121;
              CA::Render::LayerNode::MapGeometry::map((uint64_t)v120, v118[0], 0);
              v84 = v122;
              v85 = v123;
              *(_OWORD *)&v9->m11 = v121;
              *(_OWORD *)&v9->m13 = v84;
              v86 = v124;
              v87 = v125;
              *(_OWORD *)&v9->m21 = v85;
              *(_OWORD *)&v9->m23 = v86;
              v88 = v126;
              v89 = v127;
              v90 = v128;
              *(_OWORD *)&v9->m31 = v87;
              *(_OWORD *)&v9->m33 = v88;
              *(_OWORD *)&v9->m41 = v89;
              *(_OWORD *)&v9->m43 = v90;
              v91 = v118[0];
              v118[0] = 0;
              if (v91)
              {
                v92 = (unsigned int *)((char *)v91 + 16);
                do
                {
                  v93 = __ldaxr(v92);
                  v94 = v93 - 1;
                }
                while (__stlxr(v94, v92));
                if (!v94)
                  CA::Render::LayerNode::delete_node(v91, v79);
              }
            }
          }
          CA::Render::Update::~Update((CA::Render::Update *)v129, v79);
        }
        pthread_mutex_unlock((pthread_mutex_t *)((char *)v53 + 72));
        v95 = v118[1];
        for (i = v118[2]; i != v95; i = (CA::Render::LayerNode *)((char *)i - 8))
        {
          v98 = (unsigned int *)*((_QWORD *)i - 1);
          v97 = v98;
          if (v98)
          {
            v99 = v97 + 2;
            do
            {
              v100 = __ldaxr(v99);
              v101 = v100 - 1;
            }
            while (__stlxr(v101, v99));
            if (!v101)
              (*(void (**)(unsigned int *))(*(_QWORD *)v97 + 16))(v97);
          }
        }
        v118[2] = v95;
        if (v53)
        {
          v102 = (unsigned int *)((char *)v53 + 8);
          do
          {
            v103 = __ldaxr(v102);
            v104 = v103 - 1;
          }
          while (__stlxr(v104, v102));
          if (!v104)
            (*(void (**)(CA::Render::Context *))(*(_QWORD *)v53 + 16))(v53);
        }
        goto LABEL_117;
      }
      do
        v113 = __ldaxr(v77);
      while (__stlxr(v113 - 1, v77));
      v41 = v117;
    }
    else
    {
      v41 = v117;
    }
LABEL_85:
    CA::Render::Context::did_commit((unint64_t)v41, 0, 0, 1, 0, 0);
    v53 = v117;
    if (v117)
    {
      v75 = (unsigned int *)((char *)v117 + 8);
      do
        v76 = __ldaxr(v75);
      while (__stlxr(v76 + 1, v75));
      if (!v76)
      {
        v53 = 0;
        do
          v114 = __ldaxr(v75);
        while (__stlxr(v114 - 1, v75));
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)((char *)v53 + 72));
    goto LABEL_94;
  }
  *v9 = CATransform3DIdentity;
LABEL_117:
  v116[0] = &off_1E1598648;
  v131 = &v118[1];
  std::vector<X::Ref<CA::Render::Handle>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v131);
  v106 = v118[0];
  if (v118[0])
  {
    v107 = (unsigned int *)((char *)v118[0] + 16);
    do
    {
      v108 = __ldaxr(v107);
      v109 = v108 - 1;
    }
    while (__stlxr(v109, v107));
    if (!v109)
      CA::Render::LayerNode::delete_node(v106, v105);
  }
  result = (CATransform3D *)v117;
  if (v117)
  {
    v110 = (unsigned int *)((char *)v117 + 8);
    do
    {
      v111 = __ldaxr(v110);
      v112 = v111 - 1;
    }
    while (__stlxr(v112, v110));
    if (!v112)
      return (CATransform3D *)(*(uint64_t (**)(CATransform3D *))(*(_QWORD *)&result->m11 + 16))(result);
  }
  return result;
}

- (NSSet)clones
{
  CAWindowServerDisplayImpl *impl;
  CA::WindowServer::Server **v4;
  uint64_t v5;
  NSSet *v6;
  uint64_t v7;
  CA::WindowServer::Server **v8;
  uint64_t v9;
  CA::WindowServer::Server **v11;
  CA::WindowServer::Server **v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
  pthread_mutex_lock(&self->_impl->var0._m);
  v11 = 0;
  v12 = 0;
  v13 = 0;
  CA::WindowServer::Server::clones((CA::WindowServer::Server *)&v11, (uint64_t)self->_impl->var1);
  v4 = v11;
  v5 = (char *)v12 - (char *)v11;
  if (v12 != v11)
  {
    v6 = (NSSet *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    if ((unint64_t)(v5 >> 3) <= 1)
      v7 = 1;
    else
      v7 = v5 >> 3;
    v8 = v4;
    do
    {
      v9 = display_for_server(*v8);
      if (v9)
        -[NSSet addObject:](v6, "addObject:", v9);
      ++v8;
      --v7;
    }
    while (v7);
    goto LABEL_13;
  }
  v6 = (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
  if (v4)
LABEL_13:
    operator delete(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v6;
}

- (void)addClone:(id)a3 options:(id)a4
{
  CAWindowServerDisplay *v5;
  CAWindowServerDisplay *v6;
  pthread_mutex_t *p_m;
  const __CFString *v8;
  CAWindowServerDisplay *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  int v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  Server *var1;
  CA::WindowServer::Server *v33;
  uint64_t v34;
  Server *v35;
  unint64_t v36;
  malloc_zone_t *malloc_zone;
  char *v38;
  uint64_t v39;
  _DWORD *v40;
  char *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  malloc_zone_t *v45;
  _QWORD *v46;
  id v47;
  pthread_mutex_t *v48;
  CAWindowServerDisplay *v49;
  CAWindowServerDisplay *v50;
  uint64_t v51;
  int64x2_t v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v5 = (CAWindowServerDisplay *)a3;
  v6 = self;
  v58 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAWindowServerDisplay"), CFSTR("%@: can't clone a display to nil"), self);
  p_m = &v6->_impl->var0._m;
  if (p_m && v5->_impl && (_force_cloning & 1) == 0)
  {
    pthread_mutex_lock(&v6->_impl->var0._m);
    if (v5 == v6)
    {
      v8 = CFSTR("%@: can't clone a display to itself");
      v9 = v5;
    }
    else
    {
      if (!*(_QWORD *)(*((_QWORD *)v6->_impl->var1 + 12) + 48))
      {
        if (*(_QWORD *)(*((_QWORD *)v5->_impl->var1 + 12) + 48))
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAWindowServerDisplay"), CFSTR("%@: %@ is already a clone"), v6, v5);
LABEL_11:
        v49 = v6;
        v50 = v5;
        if (a4)
        {
          v48 = p_m;
          v10 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("replayContexts"));
          v11 = v10;
          v47 = a4;
          if (v10
            && (v56 = 0u,
                v57 = 0u,
                v54 = 0u,
                v55 = 0u,
                (v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v53, 16)) != 0))
          {
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = *(_QWORD *)v55;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v55 != v16)
                  objc_enumerationMutation(v11);
                v18 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "unsignedIntValue");
                v19 = v18;
                if ((unint64_t)v14 >= v15)
                {
                  v20 = (v14 - v13) >> 2;
                  v21 = v20 + 1;
                  if ((unint64_t)(v20 + 1) >> 62)
                    abort();
                  if ((uint64_t)(v15 - (_QWORD)v13) >> 1 > v21)
                    v21 = (uint64_t)(v15 - (_QWORD)v13) >> 1;
                  if (v15 - (unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
                    v22 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v22 = v21;
                  if (v22)
                    v22 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v22);
                  else
                    v23 = 0;
                  v24 = (char *)(v22 + 4 * v20);
                  *(_DWORD *)v24 = v19;
                  v25 = v24 + 4;
                  while (v14 != v13)
                  {
                    v26 = *((_DWORD *)v14 - 1);
                    v14 -= 4;
                    *((_DWORD *)v24 - 1) = v26;
                    v24 -= 4;
                  }
                  v15 = v22 + 4 * v23;
                  if (v13)
                    operator delete(v13);
                  v13 = v24;
                  v14 = v25;
                }
                else
                {
                  *(_DWORD *)v14 = v18;
                  v14 += 4;
                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
            }
            while (v12);
          }
          else
          {
            v13 = 0;
            v14 = 0;
          }
          p_m = v48;
          v6 = v49;
          v5 = v50;
          v27 = objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("captureDisplay")), "BOOLValue");
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("disableScaling")), "BOOLValue"))
            v28 = v27 | 2;
          else
            v28 = v27;
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("disableRotation")), "BOOLValue"))
            v28 |= 4u;
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("disableOverscan")), "BOOLValue"))
            v28 |= 8u;
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("disableYUV")), "BOOLValue"))
            v28 |= 0x10u;
          v29 = objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("noReplayScaling")), "BOOLValue");
          v30 = v28 | 0x40;
          if (!v29)
            v30 = v28;
          if (v14 == v13)
            v31 = v30;
          else
            v31 = v30 | 0x20;
        }
        else
        {
          v13 = 0;
          v14 = 0;
          v31 = 0;
        }
        -[CAWindowServerDisplay willChangeValueForKey:](v6, "willChangeValueForKey:", CFSTR("clones"));
        -[CAWindowServerDisplay willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("cloneMaster"));
        var1 = v6->_impl->var1;
        v33 = (CA::WindowServer::Server *)v5->_impl->var1;
        pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
        v34 = *((_QWORD *)var1 + 12);
        if (*(_QWORD *)(v34 + 48) || *(_QWORD *)(*((_QWORD *)v33 + 12) + 48))
        {
          pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
          if ((v31 & 0x20) != 0)
          {
LABEL_57:
            v35 = v5->_impl->var1;
            pthread_mutex_lock((pthread_mutex_t *)((char *)v35 + 24));
            if (*((_QWORD *)v35 + 17))
              CA::WindowServer::Server::clear_replay_contexts((CA::WindowServer::Server *)v35);
            v36 = (v14 - v13) >> 2;
            if ((unint64_t)(v14 - v13) >> 62)
            {
              v38 = 0;
            }
            else
            {
              malloc_zone = (malloc_zone_t *)get_malloc_zone();
              v38 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 4 * (v14 - v13), 0x743898A5uLL);
            }
            if (v14 == v13)
            {
LABEL_69:
              *((_QWORD *)v35 + 17) = v38;
              *((_QWORD *)v35 + 18) = v36;
              *((_BYTE *)v35 + 516) = 1;
            }
            else
            {
              if (v36 <= 1)
                v39 = 1;
              else
                v39 = (v14 - v13) >> 2;
              v40 = v38 + 8;
              v41 = v13;
              while (1)
              {
                v42 = *(_DWORD *)v41;
                v41 += 4;
                v43 = CA::Render::Context::context_by_id((CA::Render::Context *)v42);
                if (!v43)
                  break;
                *((_QWORD *)v40 - 1) = v43;
                *v40 = *(_DWORD *)(v43 + 192);
                v40 += 4;
                if (!--v39)
                  goto LABEL_69;
              }
              *((_QWORD *)v35 + 17) = v38;
              *((_QWORD *)v35 + 18) = v36;
              CA::WindowServer::Server::clear_replay_contexts((CA::WindowServer::Server *)v35);
            }
            (*(void (**)(Server *, _QWORD))(*(_QWORD *)v35 + 192))(v35, 0);
            pthread_mutex_unlock((pthread_mutex_t *)((char *)v35 + 24));
            v6 = v49;
            v5 = v50;
          }
        }
        else
        {
          v44 = *(_QWORD *)(v34 + 40);
          v45 = (malloc_zone_t *)get_malloc_zone();
          v46 = malloc_type_zone_malloc(v45, 0x10uLL, 0x8BB15036uLL);
          *v46 = v33;
          v46[1] = v44;
          v5 = v50;
          *(_QWORD *)(v34 + 40) = v46;
          pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
          CA::WindowServer::Server::set_clone_master(v33, (CA::WindowServer::Server *)var1, v31);
          *(_DWORD *)(*((_QWORD *)var1 + 12) + 745) |= 0x400u;
          v51 = 0;
          v52 = vdupq_n_s64(0x80000uLL);
          (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v51, 0.0);
          if ((v31 & 0x20) != 0)
            goto LABEL_57;
        }
        -[CAWindowServerDisplay didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("cloneMaster"));
        -[CAWindowServerDisplay didChangeValueForKey:](v6, "didChangeValueForKey:", CFSTR("clones"));
        if (v13)
          operator delete(v13);
        pthread_mutex_unlock(p_m);
        return;
      }
      v8 = CFSTR("%@: can't clone a display that's a clone");
      v9 = v6;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAWindowServerDisplay"), v8, v9);
    goto LABEL_11;
  }
}

- (void)addClone:(id)a3
{
  -[CAWindowServerDisplay addClone:options:](self, "addClone:options:", a3, 0);
}

- (void)removeClone:(id)a3
{
  CAWindowServerDisplayImpl *impl;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAWindowServerDisplay"), CFSTR("%@: can't remove a nil clone display"), self);
  impl = self->_impl;
  if (impl && *((_QWORD *)a3 + 1) && (_force_cloning & 1) == 0)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    if (*(Server **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 1) + 64) + 96) + 48) != self->_impl->var1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAWindowServerDisplay"), CFSTR("%@: %@ is not our clone"), self, a3);
    -[CAWindowServerDisplay willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clones"));
    objc_msgSend(a3, "willChangeValueForKey:", CFSTR("cloneMaster"));
    CA::WindowServer::Server::remove_clone((CA::WindowServer::Server *)self->_impl->var1, *(CA::WindowServer::Server **)(*((_QWORD *)a3 + 1) + 64));
    objc_msgSend(a3, "didChangeValueForKey:", CFSTR("cloneMaster"));
    -[CAWindowServerDisplay didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clones"));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)removeAllClones
{
  CAWindowServerDisplayImpl *impl;
  CA::WindowServer::Server **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CA::WindowServer::Server **v9;
  CA::WindowServer::Server **v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl && (_force_cloning & 1) == 0)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v9 = 0;
    v10 = 0;
    v11 = 0;
    CA::WindowServer::Server::clones((CA::WindowServer::Server *)&v9, (uint64_t)self->_impl->var1);
    v4 = v9;
    v5 = (char *)v10 - (char *)v9;
    if (v10 == v9)
    {
      v4 = v10;
      if (!v10)
      {
LABEL_12:
        pthread_mutex_unlock(&impl->var0._m);
        return;
      }
    }
    else
    {
      -[CAWindowServerDisplay willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clones"));
      v6 = 0;
      if ((unint64_t)(v5 >> 3) <= 1)
        v7 = 1;
      else
        v7 = v5 >> 3;
      do
      {
        v8 = (void *)display_for_server(v4[v6]);
        objc_msgSend(v8, "willChangeValueForKey:", CFSTR("cloneMaster"));
        CA::WindowServer::Server::remove_clone((CA::WindowServer::Server *)self->_impl->var1, v4[v6]);
        objc_msgSend(v8, "didChangeValueForKey:", CFSTR("cloneMaster"));
        ++v6;
      }
      while (v7 != v6);
      -[CAWindowServerDisplay didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clones"));
    }
    operator delete(v4);
    goto LABEL_12;
  }
}

- (CAWindowServerDisplay)cloneMaster
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  CAWindowServerDisplay *v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  if (*(_QWORD *)(v4 + 48))
    v5 = (CAWindowServerDisplay *)display_for_server(*(CA::WindowServer::Server **)(v4 + 48));
  else
    v5 = 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)powerStateDidChange:(id)a3
{
  int v4;
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  NSObject *v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_impl)
  {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", a3), "isLowPowerModeEnabled");
    impl = self->_impl;
    pthread_mutex_lock(&impl->var0._m);
    var1 = self->_impl->var1;
    *((_BYTE *)var1 + 518) = v4;
    atomic_store(1u, (unsigned __int8 *)var1 + 465);
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v7 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v9 = v4;
        _os_log_impl(&dword_184457000, v7, OS_LOG_TYPE_DEFAULT, "LowPowerMode=%i", buf, 8u);
      }
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setBlanked:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_blanked((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isBlanked
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *(_BYTE *)(*(_QWORD *)(*((_QWORD *)self->_impl->var1 + 12) + 728) + 1) != 1;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)willUnblank
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    if (*(_BYTE *)(*(_QWORD *)(*((_QWORD *)var1 + 12) + 728) + 1) != 1 && !*((_BYTE *)var1 + 512))
    {
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      if (BYTE9(xmmword_1ECDC6A90))
        kdebug_trace();
      (*(void (**)(_QWORD))(**((_QWORD **)var1 + 12) + 232))(*((_QWORD *)var1 + 12));
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setBlankingRemovesPower:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL8 v4;
  Server *var1;
  NSObject *v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v7 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v9 = v4;
        _os_log_impl(&dword_184457000, v7, OS_LOG_TYPE_DEFAULT, "set_blanking_removes_power=%u", buf, 8u);
      }
    }
    (*(void (**)(_QWORD, _BOOL8))(**((_QWORD **)var1 + 12) + 256))(*((_QWORD *)var1 + 12), v4);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)blankingRemovesPower
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 248))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)resetConfiguration
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  uint64_t v5;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    v5 = *((_QWORD *)var1 + 12);
    if (*(_WORD *)(v5 + 656))
    {
      *(_WORD *)(v5 + 656) &= 0xFF00u;
      CA::WindowServer::Display::post_display_changed(v5);
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setCalibrationPhase:(unsigned int)a3 forIdentifier:(unsigned int)a4
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v5;
  uint64_t v6;

  impl = self->_impl;
  if (impl)
  {
    v5 = *(_QWORD *)&a4;
    v6 = *(_QWORD *)&a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, uint64_t, uint64_t))(*(_QWORD *)self->_impl->var1 + 128))(self->_impl->var1, v6, v5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setFlipBookEnabled:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_flipbook_enabled((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isFlipBookEnabled
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 304))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setFlipBookSuppressed:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_flipbook_suppressed((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isFlipBookSuppressed
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 320))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (BOOL)isFlipBookActive
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (**(_BYTE **)(*((_QWORD *)self->_impl->var1 + 12) + 728) & 0xFE) == 2;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setOverscanAdjustment:(id)a3
{
  int v5;
  CAWindowServerDisplayImpl *impl;

  if (self->_impl)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("scaleContent")) & 1) != 0)
    {
      v5 = 2;
    }
    else
    {
      if (!objc_msgSend(a3, "isEqualToString:", CFSTR("insetBounds")))
        return;
      v5 = 3;
    }
    impl = self->_impl;
    pthread_mutex_lock(&impl->var0._m);
    CA::WindowServer::Server::set_overscan_adjustment((uint64_t)self->_impl->var1, v5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (NSString)overscanAdjustment
{
  CAWindowServerDisplayImpl *impl;
  int v4;

  impl = self->_impl;
  if (!impl)
    return (NSString *)CFSTR("none");
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *(_BYTE *)(*((_QWORD *)self->_impl->var1 + 12) + 657) & 3;
  pthread_mutex_unlock(&impl->var0._m);
  if ((v4 - 1) > 2)
    return 0;
  else
    return &off_1E15A94B8[v4 - 1]->isa;
}

- (void)setOverscanAmount:(double)a3
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  float v7;
  uint64_t v8;

  NSLog(CFSTR("[CAWindowServerDisplay setOverscanAmount:] is deprecated. Please use -setOverscanAmounts:!"), a2);
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    v7 = a3;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    v8 = *((_QWORD *)var1 + 12);
    *(float *)(v8 + 60) = v7;
    *(float *)(v8 + 64) = v7;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (double)overscanAmount
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  double v8;

  NSLog(CFSTR("[CAWindowServerDisplay overscanAmount] is deprecated. Please use -overscanAmounts!"), a2);
  impl = self->_impl;
  if (!impl)
    return 0.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = *(float *)(v4 + 60);
  v6 = *(float *)(v4 + 64);
  if (v5 != v6)
    NSLog(CFSTR("[CAWindowServerDisplay overscanAmount] - horizontal and vertical overscan amounts are not equal!"));
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7;
  pthread_mutex_unlock(&impl->var0._m);
  return v8;
}

- (void)setOverscanAmounts:(CGSize)a3
{
  CAWindowServerDisplayImpl *impl;
  CGFloat height;
  CGFloat width;
  Server *var1;
  uint64_t v8;

  impl = self->_impl;
  if (impl)
  {
    height = a3.height;
    width = a3.width;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    v8 = *((_QWORD *)var1 + 12);
    *(float *)&width = width;
    *(_DWORD *)(v8 + 60) = LODWORD(width);
    *(float *)&height = height;
    *(_DWORD *)(v8 + 64) = LODWORD(height);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (CGSize)overscanAmounts
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v4 = *((_QWORD *)self->_impl->var1 + 12);
    v5 = *(float *)(v4 + 60);
    v6 = *(float *)(v4 + 64);
    pthread_mutex_unlock(&impl->var0._m);
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
  }
  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setApertureOffset:(double)a3
{
  CAWindowServerDisplayImpl *impl;
  pthread_mutex_t *v5;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v5 = (pthread_mutex_t *)((char *)self->_impl->var1 + 24);
    pthread_mutex_lock(v5);
    pthread_mutex_unlock(v5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (double)apertureOffset
{
  CAWindowServerDisplayImpl *impl;
  double v4;

  impl = self->_impl;
  if (!impl)
    return 0.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (float)*(int *)(*((_QWORD *)self->_impl->var1 + 12) + 68);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setInvertsColors:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL8 v4;
  Server *var1;
  uint64_t v7;
  int64x2_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(_QWORD, _BOOL8))(**((_QWORD **)var1 + 12) + 856))(*((_QWORD *)var1 + 12), v4);
    CA::WindowServer::Server::invalidate((os_unfair_lock_s *)var1, *(const CA::Shape **)(*((_QWORD *)var1 + 12) + 216));
    v7 = 0;
    v8 = vdupq_n_s64(0x10000uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v7, 0.0);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)invertsColors
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 848))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setAllowsExtendedDynamicRange:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL8 v4;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, _BOOL8))(*(_QWORD *)self->_impl->var1 + 144))(self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)allowsExtendedDynamicRange
{
  CAWindowServerDisplayImpl *impl;
  char v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (*(uint64_t (**)(Server *))(*(_QWORD *)self->_impl->var1 + 136))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setGrayscale:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL8 v4;
  Server *var1;
  uint64_t v7;
  int64x2_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(_QWORD, _BOOL8))(**((_QWORD **)var1 + 12) + 896))(*((_QWORD *)var1 + 12), v4);
    CA::WindowServer::Server::invalidate((os_unfair_lock_s *)var1, *(const CA::Shape **)(*((_QWORD *)var1 + 12) + 216));
    v7 = 0;
    v8 = vdupq_n_s64(0x10000uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v7, 0.0);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isGrayscale
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 888))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)abortColorMatrixRamp:(float *)a3 scale:(float *)a4
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(_QWORD, float *, float *))(**((_QWORD **)var1 + 12) + 1416))(*((_QWORD *)var1 + 12), a3, a4);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setUserAdjustment:(float *)a3 scale:(float)a4
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(_QWORD, float *, float))(**((_QWORD **)var1 + 12) + 1424))(*((_QWORD *)var1 + 12), a3, a4);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setContrastEnhancer:(float)a3 rampDuration:(double)a4
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v8;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v8 = *((_QWORD *)self->_impl->var1 + 12);
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 1016))(v8) & 1) == 0)
    {
      var1 = self->_impl->var1;
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      (*(void (**)(_QWORD, float, double))(**((_QWORD **)var1 + 12) + 1432))(*((_QWORD *)var1 + 12), a3, a4);
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)abortContrastEnhancerRamp:(float *)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v6;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v6 = *((_QWORD *)self->_impl->var1 + 12);
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 1016))(v6) & 1) == 0)
    {
      var1 = self->_impl->var1;
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      (*(void (**)(_QWORD, float *))(**((_QWORD **)var1 + 12) + 1440))(*((_QWORD *)var1 + 12), a3);
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (float)nits
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  float v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return 0.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(float (**)(uint64_t))(*(_QWORD *)v4 + 920))(v4);
  v7[0] = *(_QWORD *)(*((_QWORD *)self->_impl->var1 + 12) + 640);
  if (!CA::WindowServer::Display::Mode::is_hdr((CA::WindowServer::Display::Mode *)v7))
    v5 = CA::WindowServer::Display::edr_headroom(*((CA::WindowServer::Display **)self->_impl->var1 + 12)) * v5;
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setNits:(float)a3
{
  CAWindowServerDisplayImpl *impl;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v6[0] = *(_QWORD *)(*((_QWORD *)self->_impl->var1 + 12) + 640);
    if (!CA::WindowServer::Display::Mode::is_hdr((CA::WindowServer::Display::Mode *)v6))
      a3 = a3 / CA::WindowServer::Display::edr_headroom(*((CA::WindowServer::Display **)self->_impl->var1 + 12));
    CA::WindowServer::Server::set_sdr_nits((CA::WindowServer::Server *)self->_impl->var1, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setAccessibilityColorMatrix:(float *)a3 scale:(float)a4
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_accessibility_color_matrix((CA::WindowServer::Server *)self->_impl->var1, a3, a4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setAllowsWirelessColorFiltering:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL8 v4;
  uint64_t v6;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    v6 = *((_QWORD *)self->_impl->var1 + 12);
    (*(void (**)(uint64_t, _BOOL8))(*(_QWORD *)v6 + 1480))(v6, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)allowsWirelessColorFiltering
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 1472))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setContrast:(float)a3
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(_QWORD, float))(**((_QWORD **)var1 + 12) + 912))(*((_QWORD *)var1 + 12), a3);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (float)contrast
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  float v5;

  impl = self->_impl;
  if (!impl)
    return 0.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(float (**)(uint64_t))(*(_QWORD *)v4 + 904))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setMaximumBrightness:(float)a3
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(_QWORD, float))(**((_QWORD **)var1 + 12) + 1008))(*((_QWORD *)var1 + 12), a3);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (float)maximumBrightness
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  float v5;

  impl = self->_impl;
  if (!impl)
    return 1.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(float (**)(uint64_t))(*(_QWORD *)v4 + 1000))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (float)maximumLuminance
{
  CAWindowServerDisplayImpl *impl;
  float v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return 0.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  (*(void (**)(_QWORD *__return_ptr))(**((_QWORD **)self->_impl->var1 + 12) + 1216))(v6);
  v4 = *((float *)v6 + 1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setMinimumRefreshRate:(float)a3
{
  NSLog(CFSTR("[CAWindowServerDisplay setMinimumRefreshRate:] is deprecated!"), a2);
}

- (float)minimumRefreshRate
{
  NSLog(CFSTR("[CAWindowServerDisplay minimumRefreshRate] is deprecated!"), a2);
  return 0.0;
}

- (void)setMaximumRefreshRate:(float)a3
{
  NSLog(CFSTR("[CAWindowServerDisplay setMaximumRefreshRate:] is deprecated!"), a2);
}

- (float)maximumRefreshRate
{
  NSLog(CFSTR("[CAWindowServerDisplay maximumRefreshRate] is deprecated!"), a2);
  return 3.4028e38;
}

- (void)setIdealRefreshRate:(float)a3
{
  NSLog(CFSTR("[CAWindowServerDisplay setIdealRefreshRate:] is deprecated!"), a2);
}

- (float)idealRefreshRate
{
  NSLog(CFSTR("[CAWindowServerDisplay idealRefreshRate] is deprecated!"), a2);
  return 60.0;
}

- (void)setUsesPreferredModeRefreshRate:(BOOL)a3
{
  NSLog(CFSTR("[CAWindowServerDisplay setUsesPreferredModeRefreshRate:] is deprecated!"), a2, a3);
}

- (BOOL)usesPreferredModeRefreshRate
{
  NSLog(CFSTR("[CAWindowServerDisplay usesPreferredModeRefreshRate] is deprecated!"), a2);
  return 1;
}

- (NSString)colorMode
{
  NSLog(CFSTR("CoreAnimation: [CAWindowServerDisplay setColorMode:] is deprecated!"), a2);
  return (NSString *)CFSTR("auto");
}

- (void)setColorMode:(id)a3
{
  NSLog(CFSTR("CoreAnimation: [CAWindowServerDisplay setColorMode:] is deprecated!"), a2, a3);
}

- (BOOL)allowsVirtualModes
{
  NSLog(CFSTR("[CAWindowServerDisplay allowsVirtualModes] is deprecated!"), a2);
  return 1;
}

- (void)setAllowsVirtualModes:(BOOL)a3
{
  NSLog(CFSTR("[CAWindowServerDisplay setAllowsVirtualModes:] is deprecated!"), a2, a3);
}

- (BOOL)supportsExtendedColors
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v3;

  impl = self->_impl;
  if (impl)
    return (*(_DWORD *)(*((_QWORD *)impl->var1 + 12) + 624) >> 3) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (void)setTag:(int64_t)a3
{
  CAWindowServerDisplayImpl *impl;
  int v4;
  uint64_t v6;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    v6 = *((_QWORD *)self->_impl->var1 + 12);
    if (*(_DWORD *)(v6 + 628) != v4)
    {
      *(_DWORD *)(v6 + 628) = v4;
      CA::WindowServer::Display::post_display_changed(v6);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (int64_t)tag
{
  CAWindowServerDisplayImpl *impl;
  int64_t v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *(unsigned int *)(*((_QWORD *)self->_impl->var1 + 12) + 628);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setProcessId:(int)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v6 = *((_QWORD *)self->_impl->var1 + 12);
    if (*(_DWORD *)(v6 + 632) != a3)
    {
      *(_DWORD *)(v6 + 632) = a3;
      CA::WindowServer::Display::post_display_changed(v6);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (int)processId
{
  CAWindowServerDisplayImpl *impl;
  int v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *(_DWORD *)(*((_QWORD *)self->_impl->var1 + 12) + 632);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setTVMode:(id)a3
{
  NSLog(CFSTR("%@: setTVMode: is deprecated!"), a2, a3, self);
}

- (NSString)TVMode
{
  NSLog(CFSTR("%@: TVMode is deprecated!"), a2, self);
  return 0;
}

- (void)setTVSignalType:(id)a3
{
  NSLog(CFSTR("%@: Ignoring call to setTVSignalType:"), a2, a3, self);
}

- (NSString)TVSignalType
{
  CAWindowServerDisplayImpl *impl;
  const __CFString *v4;
  const __CFString *v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = CFSTR("digital");
  if (*(_BYTE *)(*((_QWORD *)self->_impl->var1 + 12) + 636) != 2)
    v4 = 0;
  if (*(_BYTE *)(*((_QWORD *)self->_impl->var1 + 12) + 636))
    v5 = v4;
  else
    v5 = CFSTR("none");
  pthread_mutex_unlock(&impl->var0._m);
  return &v5->isa;
}

- (void)setHotPlugCallback:(id)a3
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  const void *v7;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    v7 = (const void *)*((_QWORD *)var1 + 28);
    if (v7)
    {
      _Block_release(v7);
      *((_QWORD *)var1 + 28) = 0;
    }
    if (a3)
      *((_QWORD *)var1 + 28) = _Block_copy(a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setBrightnessCallback:(id)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_brightness_callback((uint64_t)self->_impl->var1, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setUpdateRequestCallback:(id)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v6 = *((_QWORD *)self->_impl->var1 + 12);
    (*(void (**)(uint64_t, id))(*(_QWORD *)v6 + 1776))(v6, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (id)hotPlugCallback
{
  CAWindowServerDisplayImpl *impl;
  void *v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (void *)*((_QWORD *)self->_impl->var1 + 28);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (id)brightnessCallback
{
  CAWindowServerDisplayImpl *impl;
  void *v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (void *)*((_QWORD *)self->_impl->var1 + 29);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (id)updateRequestCallback
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  void *v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 1784))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setSecure:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_secure((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isSecure
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_BYTE *)self->_impl->var1 + 514) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setAllowsDisplayCompositing:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_allows_display_compositing((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)allowsDisplayCompositing
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_BYTE *)self->_impl->var1 + 515) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setTracksCarPlayRegions:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  int v4;
  Server *var1;
  void *v7;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    if (*((unsigned __int8 *)var1 + 524) != v4)
    {
      if (v4)
      {
        if (CACarPlayMarshalCreate(void)::once != -1)
          dispatch_once(&CACarPlayMarshalCreate(void)::once, &__block_literal_global_15314);
        *((_QWORD *)var1 + 59) = objc_opt_new();
      }
      else
      {
        v7 = (void *)*((_QWORD *)var1 + 59);
        objc_msgSend(v7, "invalidate");

        *((_QWORD *)var1 + 59) = 0;
      }
      *((_BYTE *)var1 + 524) = v4;
      v13 = 0;
      __asm { FMOV            V0.2D, #2.0 }
      v14 = _Q0;
      (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v13, 0.0);
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)tracksCarPlayRegions
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_BYTE *)self->_impl->var1 + 524) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)freeze
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  dispatch_time_t v5;
  NSObject *v6;
  uint64_t v7;
  int64x2_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    *((_QWORD *)var1 + 11) = dispatch_semaphore_create(0);
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(_QWORD))(**((_QWORD **)var1 + 12) + 1592))(*((_QWORD *)var1 + 12));
    CA::WindowServer::Server::invalidate((os_unfair_lock_s *)var1, *(const CA::Shape **)(*((_QWORD *)var1 + 12) + 216));
    v7 = 0;
    v8 = vdupq_n_s64(0x8000000uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v7, 0.0);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    v5 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(*((dispatch_semaphore_t *)var1 + 11), v5))
    {
      if (x_log_hook_p())
      {
        x_log_();
      }
      else
      {
        v6 = x_log_category_windowserver;
        if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v7) = 0;
          _os_log_impl(&dword_184457000, v6, OS_LOG_TYPE_DEFAULT, "CoreAnimation: timed out freeze semaphore\n", (uint8_t *)&v7, 2u);
        }
      }
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (__IOSurface)acquireFrozenSurface
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  pthread_mutex_t *v5;
  __IOSurface *v6;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  var1 = self->_impl->var1;
  v5 = (pthread_mutex_t *)((char *)var1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
  v6 = (__IOSurface *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)var1 + 12) + 1584))(*((_QWORD *)var1 + 12));
  pthread_mutex_unlock(v5);
  pthread_mutex_unlock(&impl->var0._m);
  return v6;
}

- (void)setDisablesUpdates:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;
  Server *var1;
  int v7;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    if (v4)
      v7 = 256;
    else
      v7 = 0;
    *(_DWORD *)(*((_QWORD *)var1 + 12) + 745) = *(_DWORD *)(*((_QWORD *)var1 + 12) + 745) & 0xFFFFFEFF | v7;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)disablesUpdates
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v4 = (*(_DWORD *)(*((_QWORD *)self->_impl->var1 + 12) + 745) >> 8) & 1;
    pthread_mutex_unlock(&impl->var0._m);
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setDisabled:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  int v4;
  Server *var1;
  int v7;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    os_unfair_lock_lock((os_unfair_lock_t)var1 + 4);
    v7 = *((unsigned __int8 *)var1 + 512);
    if (v7 != v4)
    {
      *((_BYTE *)var1 + 512) = v4;
      (*(void (**)(Server *, _QWORD))(*(_QWORD *)var1 + 192))(var1, v4 ^ 1u);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)var1 + 4);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    if (v7 != v4 && (v4 & 1) == 0)
      CA::WindowServer::Server::set_blanked((CA::WindowServer::Server *)var1, 0);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)disabled
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_BYTE *)self->_impl->var1 + 512) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL8 v4;

  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, _BOOL8))(*(_QWORD *)self->_impl->var1 + 192))(self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)enabled
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 216))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (unsigned)framebufferFormat
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  unsigned int v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_QWORD *)self->_impl->var1 + 12);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 200))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;

  -[CAWindowServerDisplay bounds](self, "bounds");
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CAWindowServerDisplay:%p %@ %gx%g>"), self, -[CAWindowServerDisplay name](self, "name"), v3, v4);
}

- ($94F468A8D4C62B317260615823C2B210)whitepoint
{
  CAWindowServerDisplayImpl *impl;
  float v3;
  float v4;
  __int128 v5;
  __int128 v6;
  int v7;
  uint64_t v8;
  $94F468A8D4C62B317260615823C2B210 result;

  v8 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v7 = 0;
    v5 = 0u;
    v6 = 0u;
    (*(void (**)(__int128 *__return_ptr))(**((_QWORD **)impl->var1 + 12) + 1344))(&v5);
    v4 = *((float *)&v6 + 3);
    v3 = *((float *)&v6 + 2);
    if (!(_BYTE)v7)
    {
      v4 = 0.0;
      v3 = 0.0;
    }
  }
  else
  {
    v4 = 0.0;
    v3 = 0.0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($05FBF485E644614EAF311772389EC12B)chromaticities
{
  $94F468A8D4C62B317260615823C2B210 var1;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  var1 = self->var1;
  if (var1)
  {
    v8 = 0;
    v6 = 0uLL;
    v7 = 0uLL;
    self = ($05FBF485E644614EAF311772389EC12B *)(*(_QWORD *(**)(__int128 *__return_ptr))(**(_QWORD **)(*(_QWORD *)(*(_QWORD *)&var1 + 64) + 96)
                                                                                                  + 1344))(&v6);
    if ((_BYTE)v8)
    {
      v5 = v7;
      *(_OWORD *)&retstr->var0.var0 = v6;
      *(_OWORD *)&retstr->var2.var0 = v5;
    }
  }
  return self;
}

- (float)gamma
{
  CAWindowServerDisplayImpl *impl;
  float result;

  impl = self->_impl;
  if (!impl)
    return 0.0;
  (*(void (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 1352))(*((_QWORD *)impl->var1 + 12));
  return result;
}

- (int64_t)transportType
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v3;

  impl = self->_impl;
  if (impl
    && (v3 = (*(unsigned int (**)(_QWORD, SEL))(**((_QWORD **)impl->var1 + 12) + 1384))(*((_QWORD *)impl->var1 + 12), a2)- 1, v3 <= 4))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (void)emitBrightnessError:(id *)a3
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!*a3)
    {
      v3 = *MEMORY[0x1E0CB2D50];
      v4[0] = CFSTR("brightness control not supported on this display");
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
    }
  }
}

- (void)emitWhitePointError:(id *)a3
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!*a3)
    {
      v3 = *MEMORY[0x1E0CB2D50];
      v4[0] = CFSTR("white point control not supported on this display");
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
    }
  }
}

- (void)setFilteredAmbient:(float)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var1 = a3;
    impl->var2.var14 |= 0x20u;
  }
}

- (void)setBrightnessControlDisabled:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var12 = a3;
    impl->var2.var14 |= 0x40u;
  }
}

- (void)setIRDCFlushHint:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    impl->var2.var13 = a3;
    impl->var2.var14 |= 0x2000u;
  }
}

- (void)setWhitePointMatrix:(id *)a3 scale:(float)a4
{
  CAWindowServerDisplayImpl *impl;
  __int128 v5;
  __int128 v6;

  impl = self->_impl;
  if (impl)
  {
    v5 = *(_OWORD *)a3->var0;
    v6 = *(_OWORD *)&a3->var0[4];
    impl->var2.var10.var0[8] = a3->var0[8];
    *(_OWORD *)impl->var2.var10.var0 = v5;
    *(_OWORD *)&impl->var2.var10.var0[4] = v6;
    impl->var2.var9 = a4;
    impl->var2.var14 |= 0x100u;
  }
}

- (BOOL)forceCommitBrightness:(id *)a3 withBlock:(id)a4
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    impl->var2.var14 |= 0x400u;
  return -[CAWindowServerDisplay commitBrightness:withBlock:](self, "commitBrightness:withBlock:", a3, a4);
}

- (void)setMaximumHDRLuminance:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, double))(*(_QWORD *)v3 + 1112))(v3, a3);
}

- (double)maximumHDRLuminance
{
  uint64_t v2;
  double result;

  v2 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 1120))(v2);
  return result;
}

- (void)setMaximumSDRLuminance:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, double))(*(_QWORD *)v3 + 1128))(v3, a3);
}

- (double)maximumSDRLuminance
{
  uint64_t v2;
  double result;

  v2 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 1136))(v2);
  return result;
}

- (void)setMinimumLuminance:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, double))(*(_QWORD *)v3 + 1144))(v3, a3);
}

- (double)minimumLuminance
{
  uint64_t v2;
  double result;

  v2 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 1152))(v2);
  return result;
}

- (void)setMaximumReferenceLuminance:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, double))(*(_QWORD *)v3 + 1160))(v3, a3);
}

- (double)maximumReferenceLuminance
{
  uint64_t v2;
  double result;

  v2 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 1168))(v2);
  return result;
}

- (void)setTrinityCabalConfig:(int64_t)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v3 + 1176))(v3, a3);
}

- (int64_t)trinityCabalConfig
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_impl->var1 + 12);
  return (*(unsigned int (**)(uint64_t, SEL))(*(_QWORD *)v2 + 1184))(v2, a2);
}

- (void)setPreserveAppleSRGBGammaResponse:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, BOOL))(*(_QWORD *)v3 + 1192))(v3, a3);
}

- (BOOL)preserveAppleSRGBGammaResponse
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_impl->var1 + 12);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 1200))(v2);
}

- (void)setIsReferencePreset:(BOOL)a3
{
  unsigned int *v3;
  int v4;

  if (a3)
    v4 = 0x4000;
  else
    v4 = 0;
  v3 = (unsigned int *)(*((_QWORD *)self->_impl->var1 + 12) + 745);
  *v3 = *v3 & 0xFFFFBFFF | v4;
}

- (BOOL)isReferencePreset
{
  return (*(unsigned __int8 *)(*((_QWORD *)self->_impl->var1 + 12) + 746) >> 6) & 1;
}

- (BOOL)commitPreset
{
  Server *var1;
  __CFRunLoop *v3;
  __CFRunLoop *v4;
  const void *v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  var1 = self->_impl->var1;
  v3 = (__CFRunLoop *)(*(uint64_t (**)(Server *, SEL))(*(_QWORD *)var1 + 384))(var1, a2);
  v4 = v3;
  if (v3)
  {
    v5 = (const void *)*MEMORY[0x1E0C9B270];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__CAWindowServerDisplay_commitPreset__block_invoke;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = var1;
    CFRunLoopPerformBlock(v3, v5, v7);
    CFRunLoopWakeUp(v4);
  }
  return v4 != 0;
}

- (BOOL)whitePointAvailable
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 160))(impl->var1);
  else
    return 0;
}

- (BOOL)whitePointD50XYZ
{
  _BOOL4 v2;

  v2 = -[CAWindowServerDisplay supportsColorSpaces](self, "supportsColorSpaces");
  if (v2)
  {
    if (CADeviceUseHarmonyXYZD50::once != -1)
      dispatch_once(&CADeviceUseHarmonyXYZD50::once, &__block_literal_global_187);
    LOBYTE(v2) = CADeviceUseHarmonyXYZD50::use_d50_xyz != 0;
  }
  return v2;
}

- (BOOL)abortWhitePointRamp:(id *)a3 error:(id *)a4
{
  -[CAWindowServerDisplay abortColorMatrixRamp:scale:](self, "abortColorMatrixRamp:scale:", a3, 0);
  return 1;
}

- (BOOL)canUpdateWithFlags:(unsigned int)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;
  char v6;

  impl = self->_impl;
  if (!impl)
    return 0;
  v4 = *(_QWORD *)&a3;
  pthread_mutex_lock(&self->_impl->var0._m);
  v6 = (*(uint64_t (**)(Server *, uint64_t))(*(_QWORD *)self->_impl->var1 + 8))(self->_impl->var1, v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v6;
}

- (double)nextWakeupTime
{
  CAWindowServerDisplayImpl *impl;
  double v4;

  impl = self->_impl;
  if (!impl)
    return 0.0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (*(double (**)(Server *))(*(_QWORD *)self->_impl->var1 + 40))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (unint64_t)vblDelta
{
  CAWindowServerDisplayImpl *impl;
  unint64_t v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (*(uint64_t (**)(Server *))(*(_QWORD *)self->_impl->var1 + 48))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (unint64_t)previousVBL
{
  CAWindowServerDisplayImpl *impl;
  unint64_t v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = (*(uint64_t (**)(Server *))(*(_QWORD *)self->_impl->var1 + 56))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)beginExternalUpdate:(void *)a3 usingSoftwareRenderer:(BOOL)a4
{
  CAWindowServerDisplayImpl *impl;
  _BOOL8 v6;

  if (a3)
  {
    impl = self->_impl;
    if (impl)
    {
      v6 = a4;
      pthread_mutex_lock(&impl->var0._m);
      (*(void (**)(Server *, _BOOL8))(*(_QWORD *)self->_impl->var1 + 96))(self->_impl->var1, v6);
      (*(void (**)(Server *, void *))(*(_QWORD *)self->_impl->var1 + 16))(self->_impl->var1, a3);
    }
  }
}

- (BOOL)finishExternalUpdate:(void *)a3 withFlags:(unsigned int)a4
{
  return -[CAWindowServerDisplay finishExternalUpdate:withFlags:debugInfo:](self, "finishExternalUpdate:withFlags:debugInfo:", a3, *(_QWORD *)&a4, 0);
}

- (BOOL)finishExternalUpdate:(void *)a3 withFlags:(unsigned int)a4 debugInfo:(unint64_t)a5
{
  CAWindowServerDisplayImpl *impl;
  char v7;

  if (!a3)
    return 0;
  impl = self->_impl;
  if (!impl)
    return 0;
  v7 = (*(uint64_t (**)(Server *, void *, _QWORD, unint64_t))(*(_QWORD *)impl->var1 + 24))(impl->var1, a3, *(_QWORD *)&a4, a5);
  pthread_mutex_unlock(&self->_impl->var0._m);
  return v7;
}

- (void)activateReplay
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *))(*(_QWORD *)self->_impl->var1 + 32))(self->_impl->var1);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)presentSurface:(__IOSurface *)a3 withOptions:(id)a4
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, __IOSurface *))(*(_QWORD *)self->_impl->var1 + 80))(self->_impl->var1, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setFrameInfoCallback:(id)a3
{
  CAWindowServerDisplayImpl *impl;
  CAWindowServerDisplayImpl *v6;
  id var3;
  void *v8;
  CAWindowServerDisplayImpl *v9;
  uint64_t var1;
  _QWORD *v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v6 = self->_impl;
    var3 = v6->var3;
    if (var3)
    {
      _Block_release(var3);
      v6 = self->_impl;
      v6->var3 = 0;
    }
    if (a3)
    {
      v8 = _Block_copy(a3);
      v9 = self->_impl;
      v9->var3 = v8;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __46__CAWindowServerDisplay_setFrameInfoCallback___block_invoke;
      v12[3] = &unk_1E15A9330;
      v12[4] = self;
      var1 = (uint64_t)v9->var1;
      v11 = v12;
    }
    else
    {
      var1 = (uint64_t)v6->var1;
      v11 = 0;
    }
    CA::WindowServer::Server::set_frame_info_callback(var1, v11);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (id)frameInfoCallback
{
  CAWindowServerDisplayImpl *impl;
  id var3;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  var3 = self->_impl->var3;
  pthread_mutex_unlock(&impl->var0._m);
  return var3;
}

- (int64_t)frameInfoCallbackVersion
{
  return 4;
}

- (void)detachingDisplay
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return CA::WindowServer::Display::ogl_display(*((CA::WindowServer::Display **)impl->var1 + 12));
  else
    return 0;
}

- (BOOL)isDetaching
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 648))(*((_QWORD *)impl->var1 + 12));
  else
    return 0;
}

- (CGRect)detachingRect
{
  CAWindowServerDisplayImpl *impl;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[5];
  CGRect result;

  v8[4] = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v3 = (double *)v8;
    (*(void (**)(_QWORD *__return_ptr))(**((_QWORD **)impl->var1 + 12) + 656))(v8);
    v4 = *(double *)&v8[1];
    v5 = *(double *)&v8[2];
  }
  else
  {
    v3 = (double *)MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  v6 = v3[3];
  v7 = *v3;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (BOOL)needsUpdate
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  return impl
      && (*(uint64_t (**)(_QWORD, SEL))(**((_QWORD **)impl->var1 + 12) + 336))(*((_QWORD *)impl->var1 + 12), a2) != 0;
}

- (BOOL)supportsCursor
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 200))(impl->var1);
  else
    return 0;
}

- (CGSize)maximumCursorSize
{
  CAWindowServerDisplayImpl *impl;
  double v3;
  double v4;
  CGSize result;

  impl = self->_impl;
  if (impl)
  {
    (*(void (**)(_QWORD, SEL))(**((_QWORD **)impl->var1 + 12) + 1656))(*((_QWORD *)impl->var1 + 12), a2);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)cursorPosition
{
  CAWindowServerDisplayImpl *impl;
  double v3;
  double v4;
  CGPoint result;

  impl = self->_impl;
  if (impl)
  {
    (*(void (**)(Server *, SEL))(*(_QWORD *)impl->var1 + 208))(impl->var1, a2);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setCursorPosition:(CGPoint)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(Server *, CGPoint, __n128))(*(_QWORD *)impl->var1 + 216))(impl->var1, a3, *(__n128 *)&a3.y);
}

- (NSDictionary)cursorDictionary
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (NSDictionary *)(*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 224))(impl->var1);
  else
    return 0;
}

- (void)setCursorDictionary:(id)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(Server *, id))(*(_QWORD *)impl->var1 + 232))(impl->var1, a3);
}

- (BOOL)cursorHidden
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 240))(impl->var1);
  else
    return 0;
}

- (void)setCursorHidden:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(Server *, BOOL))(*(_QWORD *)impl->var1 + 248))(impl->var1, a3);
}

- (BOOL)cursorEnabled
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 256))(impl->var1);
  else
    return 0;
}

- (void)setCursorEnabled:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(Server *, BOOL))(*(_QWORD *)impl->var1 + 264))(impl->var1, a3);
}

- (BOOL)tripleBuffered
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 296))(impl->var1);
  else
    return 0;
}

- (NSDictionary)brightnessCapabilities
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (NSDictionary *)(id)(*(uint64_t (**)(Server *, SEL))(*(_QWORD *)impl->var1 + 312))(impl->var1, a2);
  else
    return 0;
}

- (void)setBrightnessCapabilities:(id)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(Server *, id))(*(_QWORD *)impl->var1 + 320))(impl->var1, a3);
}

- (unsigned)serviceObject
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 328))(impl->var1);
  else
    return 0;
}

- (void)registerForNotifications:(id)a3 withBlock:(id)a4
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v8;
  uint64_t var1;
  Server *v10;
  const void *v11;
  Server *v12;
  Server *v13;
  Server *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  const void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD aBlock[5];
  _QWORD v26[5];
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    if (!impl->var8)
    {
      v8 = MEMORY[0x1E0C809B0];
      var1 = (uint64_t)impl->var1;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke;
      v26[3] = &unk_1E15A9358;
      v26[4] = self;
      CA::WindowServer::Server::set_brightness_callback(var1, v26);
      v10 = self->_impl->var1;
      aBlock[0] = v8;
      aBlock[1] = 3221225472;
      aBlock[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_2;
      aBlock[3] = &unk_1E15A9358;
      aBlock[4] = self;
      v11 = (const void *)*((_QWORD *)v10 + 30);
      if (v11)
      {
        _Block_release(v11);
        *((_QWORD *)v10 + 30) = 0;
      }
      *((_QWORD *)v10 + 30) = _Block_copy(aBlock);
      v12 = self->_impl->var1;
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_3;
      v24[3] = &unk_1E15A9358;
      v24[4] = self;
      _Block_release(*((const void **)v12 + 32));
      *((_QWORD *)v12 + 32) = _Block_copy(v24);
      v13 = self->_impl->var1;
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_4;
      v23[3] = &unk_1E15A9380;
      v23[4] = self;
      (*(void (**)(_QWORD, _QWORD *))(**((_QWORD **)v13 + 12) + 2056))(*((_QWORD *)v13 + 12), v23);
      v14 = self->_impl->var1;
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_5;
      v22[3] = &unk_1E15A93A8;
      v22[4] = self;
      v15 = (const void *)*((_QWORD *)v14 + 31);
      if (v15)
      {
        _Block_release(v15);
        *((_QWORD *)v14 + 31) = 0;
      }
      *((_QWORD *)v14 + 31) = _Block_copy(v22);
      impl = self->_impl;
      impl->var8 = 1;
    }
    if (!impl->var6)
      self->_impl->var6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(a3);
          v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v21 = (const void *)objc_msgSend(self->_impl->var6, "objectForKeyedSubscript:", v20);
          if (v21)
            _Block_release(v21);
          objc_msgSend(self->_impl->var6, "setObject:forKeyedSubscript:", _Block_copy(a4), v20);
        }
        v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v17);
    }
  }
}

- (void)unregisterNotificationBlocks
{
  CAWindowServerDisplayImpl *impl;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v3 = (void *)MEMORY[0x186DBE2E4]();
    v4 = (void *)objc_msgSend(impl->var6, "allValues");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          _Block_release(*(const void **)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      }
      while (v6);
    }

    impl->var6 = 0;
    objc_autoreleasePoolPop(v3);
  }
}

- (id)notificationQueue
{
  CAWindowServerDisplayImpl *impl;
  id result;

  impl = self->_impl;
  if (!impl)
    return 0;
  result = impl->var4;
  if (!result)
  {
    result = dispatch_queue_create("CABrightnessControl", 0);
    self->_impl->var4 = result;
  }
  return result;
}

- (void)setNotificationQueue:(id)a3
{
  id v5;

  if (self->_impl)
  {
    v5 = a3;

    self->_impl->var4 = a3;
  }
}

- (void)postNotification:(id)a3 payload:(id)a4
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  const __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  const char *CStringPtr;
  NSObject *v16;
  const char *v17;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v8 = objc_msgSend(impl->var6, "objectForKeyedSubscript:");
    v9 = -[CAWindowServerDisplay notificationQueue](self, "notificationQueue");
    v10 = v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      if (!x_log_hook_p() && !os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEBUG))
        goto LABEL_29;
      if (a4)
        v12 = CFCopyDescription(a4);
      else
        v12 = 0;
      if (x_log_hook_p())
      {
        objc_msgSend(a3, "UTF8String");
        if (v12)
          CFStringGetCStringPtr(v12, 0x8000100u);
        x_log_();
      }
      else
      {
        v13 = x_log_category_windowserver;
        if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(a3, "UTF8String");
          if (v12)
            CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
          else
            CStringPtr = "(null)";
          *(_DWORD *)buf = 136315394;
          v20 = v14;
          v21 = 2080;
          v22 = CStringPtr;
          _os_log_impl(&dword_184457000, v13, OS_LOG_TYPE_DEFAULT, "Posting %s, payload: %s", buf, 0x16u);
          if (!v12)
            goto LABEL_29;
          goto LABEL_28;
        }
      }
      if (!v12)
      {
LABEL_29:
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__CAWindowServerDisplay_postNotification_payload___block_invoke;
        block[3] = &unk_1E15ABC50;
        block[5] = a4;
        block[6] = v8;
        block[4] = a3;
        dispatch_async(v10, block);
        return;
      }
LABEL_28:
      CFRelease(v12);
      goto LABEL_29;
    }
    if (!v9)
    {
      if (x_log_hook_p())
        goto LABEL_16;
      v16 = x_log_category_windowserver;
      if (!os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315138;
      v20 = objc_msgSend(a3, "UTF8String");
      v17 = "no queue available for '%s' notification";
LABEL_33:
      _os_log_impl(&dword_184457000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      return;
    }
    if (v8)
      return;
    if (x_log_hook_p())
    {
LABEL_16:
      objc_msgSend(a3, "UTF8String");
      x_log_();
      return;
    }
    v16 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = objc_msgSend(a3, "UTF8String");
      v17 = "no block registered for '%s' notification";
      goto LABEL_33;
    }
  }
}

- (void)registerForSyncNotifications:(id)a3 withBlock:(id)a4
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v8;
  uint64_t var1;
  Server *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    if (!impl->var9)
    {
      v8 = MEMORY[0x1E0C809B0];
      var1 = (uint64_t)impl->var1;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke;
      v17[3] = &unk_1E15A93D0;
      v17[4] = self;
      CA::WindowServer::Server::set_pre_post_power_callback(var1, v17);
      v10 = self->_impl->var1;
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke_2;
      v16[3] = &unk_1E15A93F8;
      v16[4] = self;
      CA::WindowServer::Server::set_pre_post_flipbook_callback((uint64_t)v10, v16);
      impl = self->_impl;
      impl->var9 = 1;
    }
    if (!impl->var7)
      self->_impl->var7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(a3);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          _Block_release((const void *)objc_msgSend(self->_impl->var7, "objectForKeyedSubscript:", v15));
          objc_msgSend(self->_impl->var7, "setObject:forKeyedSubscript:", _Block_copy(a4), v15);
        }
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v12);
    }
  }
}

- (void)unregisterSyncNotificationBlocks
{
  CAWindowServerDisplayImpl *impl;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v3 = (void *)MEMORY[0x186DBE2E4]();
    v4 = (void *)objc_msgSend(impl->var7, "allValues");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          _Block_release(*(const void **)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      }
      while (v6);
    }

    impl->var7 = 0;
    objc_autoreleasePoolPop(v3);
  }
}

- (id)syncNotificationQueue
{
  CAWindowServerDisplayImpl *impl;
  id result;
  NSObject *v5;

  impl = self->_impl;
  if (!impl)
    return 0;
  result = impl->var5;
  if (!result)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    result = dispatch_queue_create("CABrightnessControl Sync Queue", v5);
    self->_impl->var5 = result;
  }
  return result;
}

- (void)setSyncNotificationQueue:(id)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
  {

    self->_impl->var5 = a3;
  }
}

- (void)postSyncNotification:(id)a3 payload:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_impl)
  {
    v7 = -[CAWindowServerDisplay syncNotificationQueue](self, "syncNotificationQueue");
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(self->_impl->var7, "objectForKeyedSubscript:", a3);
      if (v9)
      {
        v10 = v9;
        if (x_log_hook_p())
        {
          objc_msgSend(a3, "UTF8String");
          x_log_();
        }
        else
        {
          v11 = x_log_category_windowserver;
          if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v15 = objc_msgSend(a3, "UTF8String");
            _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_INFO, "SyncNotification callback '%s' called...", buf, 0xCu);
          }
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __54__CAWindowServerDisplay_postSyncNotification_payload___block_invoke;
        block[3] = &unk_1E15ABC50;
        block[5] = a4;
        block[6] = v10;
        block[4] = a3;
        dispatch_sync(v8, block);
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v12 = x_log_category_windowserver;
          if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_184457000, v12, OS_LOG_TYPE_INFO, "SyncNotification completed", buf, 2u);
          }
        }
      }
    }
  }
}

- (BOOL)setDigitalModes:(id)a3 withTimings:(id)a4
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *, id, id))(*(_QWORD *)impl->var1 + 336))(impl->var1, a3, a4);
  else
    return 0;
}

- (BOOL)setDigitalModes:(id)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *, id))(*(_QWORD *)impl->var1 + 344))(impl->var1, a3);
  else
    return 0;
}

- (void)copyDisplayTimingsFromDisplay:(id)a3
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v4;

  if (a3)
  {
    impl = self->_impl;
    if (impl)
    {
      v4 = *((_QWORD *)a3 + 1);
      if (v4)
        (*(void (**)(Server *, _QWORD))(*(_QWORD *)impl->var1 + 352))(impl->var1, *(_QWORD *)(v4 + 64));
    }
  }
}

- (void)addFramePresentationTimestamp:(unint64_t)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(Server *, unint64_t))(*(_QWORD *)impl->var1 + 368))(impl->var1, a3);
}

- (BOOL)supportsColorSpaces
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (*(uint64_t (**)(Server *))(*(_QWORD *)impl->var1 + 376))(impl->var1);
  else
    return 0;
}

- (CGColorSpace)blendColorSpace
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (CGColorSpace *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 1800))(*((_QWORD *)impl->var1 + 12));
  else
    return 0;
}

- (void)setBlendColorSpace:(CGColorSpace *)a3
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  const __CFData *v6;
  const __CFData *v7;
  char *v8;
  uint64_t v9;
  int64x2_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    var1 = impl->var1;
    (*(void (**)(_QWORD *, CGColorSpace *))(**((_QWORD **)var1 + 12) + 1808))(*((_QWORD **)var1 + 12), a3);
    v9 = 0;
    v10 = vdupq_n_s64(0x10uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v9, 0.0);
  }
  if (BYTE8(xmmword_1ECDC6AB0))
  {
    v6 = CGColorSpaceCopyICCData(a3);
    if (v6)
    {
      v7 = v6;
      v8 = CA_CFDataWriteTempFile(v6, "blend-colorspace-XXXXXX.icc", 4);
      CFRelease(v7);
      free(v8);
    }
  }
}

- (CGColorSpace)displayColorSpace
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    return (CGColorSpace *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)impl->var1 + 12) + 1816))(*((_QWORD *)impl->var1 + 12));
  else
    return 0;
}

- (void)setDisplayColorSpace:(CGColorSpace *)a3
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  const __CFData *v6;
  const __CFData *v7;
  char *v8;
  uint64_t v9;
  int64x2_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    var1 = impl->var1;
    (*(void (**)(_QWORD *, CGColorSpace *))(**((_QWORD **)var1 + 12) + 1824))(*((_QWORD **)var1 + 12), a3);
    v9 = 0;
    v10 = vdupq_n_s64(0x10uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v9, 0.0);
  }
  if (BYTE8(xmmword_1ECDC6AB0))
  {
    v6 = CGColorSpaceCopyICCData(a3);
    if (v6)
    {
      v7 = v6;
      v8 = CA_CFDataWriteTempFile(v6, "display-colorspace-XXXXXX.icc", 4);
      CFRelease(v7);
      free(v8);
    }
  }
}

- (CGColorTRC)systemGamma
{
  unint64_t var0;
  __int128 v5;

  retstr->var1.var0.var6 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.var1.var1 = 0u;
  var0 = self->var1.var1.var0;
  if (var0)
  {
    self = (CGColorTRC *)(*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(*(_QWORD *)(var0 + 64) + 96) + 1848))(*(_QWORD *)(*(_QWORD *)(var0 + 64) + 96), a3);
    if (self)
    {
      v5 = *(_OWORD *)&self->var1.var1.var1;
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var0;
      *(_OWORD *)&retstr->var1.var1.var1 = v5;
      retstr->var1.var0.var6 = self->var1.var0.var6;
    }
  }
  return self;
}

- (void)setSystemGamma:(CGColorTRC *)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(_QWORD, CGColorTRC *))(**((_QWORD **)impl->var1 + 12) + 1856))(*((_QWORD *)impl->var1 + 12), a3);
}

- (CGColorTRC)blackpointAdaptation
{
  unint64_t var0;
  __int128 v5;

  retstr->var1.var0.var6 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.var1.var1 = 0u;
  var0 = self->var1.var1.var0;
  if (var0)
  {
    self = (CGColorTRC *)(*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(*(_QWORD *)(var0 + 64) + 96) + 1864))(*(_QWORD *)(*(_QWORD *)(var0 + 64) + 96), a3);
    if (self)
    {
      v5 = *(_OWORD *)&self->var1.var1.var1;
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var0;
      *(_OWORD *)&retstr->var1.var1.var1 = v5;
      retstr->var1.var0.var6 = self->var1.var0.var6;
    }
  }
  return self;
}

- (void)setBlackpointAdaptation:(CGColorTRC *)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(_QWORD, CGColorTRC *))(**((_QWORD **)impl->var1 + 12) + 1872))(*((_QWORD *)impl->var1 + 12), a3);
}

- (void)setGammaAdjustment:(CGColorTRC)a3[3]
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    (*(void (**)(_QWORD, CGColorTRC *__attribute__((__org_arrdim(0,3)))))(**((_QWORD **)impl->var1 + 12)
                                                                                   + 1888))(*((_QWORD *)impl->var1 + 12), a3);
}

- (BOOL)accessibilityFrameRateLimitEnabled
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  pthread_mutex_lock(&self->_impl->var0._m);
  v4 = *((_BYTE *)self->_impl->var1 + 523) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setAccessibilityFrameRateLimitEnabled:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  _BOOL4 v4;
  Server *var1;
  NSObject *v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    *((_BYTE *)var1 + 523) = v4;
    atomic_store(1u, (unsigned __int8 *)var1 + 466);
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v7 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v9 = v4;
        _os_log_impl(&dword_184457000, v7, OS_LOG_TYPE_DEFAULT, "AXFrameRateLimit=%i", buf, 8u);
      }
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)renderForTime:(double)a3
{
  CAWindowServerDisplayImpl *impl;

  impl = self->_impl;
  if (impl)
    CA::WindowServer::Server::render_for_time((uint64_t)impl->var1);
}

- (CAPixelConstraints)averagePixelConstraints
{
  CAWindowServerDisplayImpl *impl;
  uint64_t v3;

  impl = self->_impl;
  if (impl
    && (v3 = (*(uint64_t (**)(_QWORD, SEL))(**((_QWORD **)impl->var1 + 12) + 1240))(*((_QWORD *)impl->var1 + 12), a2)) != 0)
  {
    return (CAPixelConstraints *)-[CADisplayPixelConstraints initWithConstraints:]([CADisplayPixelConstraints alloc], "initWithConstraints:", v3);
  }
  else
  {
    return 0;
  }
}

- (NSDictionary)virtualDisplayMode
{
  CAWindowServerDisplayImpl *impl;
  void *v3;

  impl = self->_impl;
  if (impl
    && (v3 = (void *)(*(uint64_t (**)(_QWORD, SEL))(**((_QWORD **)impl->var1 + 12) + 720))(*((_QWORD *)impl->var1 + 12), a2)) != 0)
  {
    return (NSDictionary *)v3;
  }
  else
  {
    return 0;
  }
}

- (BOOL)secureIndicatorsEnabled
{
  CAWindowServerDisplayImpl *impl;
  BOOL v4;
  BOOL v5;

  if (!self->_impl)
    return 0;
  if (CADeviceSupportsMedina::once != -1)
    dispatch_once(&CADeviceSupportsMedina::once, &__block_literal_global_227);
  if (!CADeviceSupportsMedina::medina)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAWindowServerDisplay"), CFSTR("%s not supported on this platform"), "-[CAWindowServerDisplay secureIndicatorsEnabled]");
    return 0;
  }
  impl = self->_impl;
  pthread_mutex_lock(&impl->var0._m);
  if (*((_BYTE *)self->_impl->var1 + 525))
    v4 = byte_1ECDC6B07 == 0;
  else
    v4 = 0;
  v5 = v4;
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setSecureIndicatorsEnabled:(BOOL)a3
{
  CAWindowServerDisplayImpl *impl;
  Server *var1;
  uint64_t v7;
  int64x2_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_impl)
  {
    if (CADeviceSupportsMedina::once != -1)
      dispatch_once(&CADeviceSupportsMedina::once, &__block_literal_global_227);
    if (CADeviceSupportsMedina::medina)
    {
      impl = self->_impl;
      pthread_mutex_lock(&impl->var0._m);
      var1 = self->_impl->var1;
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      *((_BYTE *)var1 + 525) = a3;
      if (!a3)
        (*(void (**)(_QWORD))(**((_QWORD **)var1 + 12) + 2080))(*((_QWORD *)var1 + 12));
      v7 = 0;
      v8 = vdupq_n_s64(0x40000000000uLL);
      (*(void (**)(Server *, uint64_t *, double))(*(_QWORD *)var1 + 184))(var1, &v7, 0.0);
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
      pthread_mutex_unlock(&impl->var0._m);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAWindowServerDisplay"), CFSTR("%s not supported on this platform"), "-[CAWindowServerDisplay setSecureIndicatorsEnabled:]");
  }
}

- (unint64_t)panelPointsPerInch
{
  return self->_panelPointsPerInch;
}

- (float)minimumNits
{
  return self->_minimumNits;
}

- (float)maximumSDRNits
{
  return self->_maximumSDRNits;
}

- (BOOL)isMirroringEnabled
{
  return self->_mirroringEnabled;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_mirroringEnabled = a3;
}

- (unint64_t)minimumFrameTime
{
  return self->_minimumFrameTime;
}

- (unint64_t)maximumFrameTime
{
  return self->_maximumFrameTime;
}

- (unint64_t)minimumVRRVBLDelta
{
  return self->_minimumVRRVBLDelta;
}

- (unint64_t)maximumVRRVBLDelta
{
  return self->_maximumVRRVBLDelta;
}

uint64_t __54__CAWindowServerDisplay_postSyncNotification_payload___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  const __CFString *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a2)
    v6 = CFSTR("syncNotificationWillChangePowerState");
  else
    v6 = CFSTR("syncNotificationDidChangePowerState");
  v8[0] = CFSTR("syncNotificationEventState");
  v8[1] = CFSTR("syncNotificationFromHotplug");
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  return objc_msgSend(*(id *)(a1 + 32), "postSyncNotification:payload:", v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
}

uint64_t __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke_2(uint64_t a1, int a2)
{
  const __CFString *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a2)
    v3 = CFSTR("syncNotificationWillChangeFlipBookState");
  else
    v3 = CFSTR("syncNotificationDidChangeFlipBookState");
  v5 = CFSTR("syncNotificationEventState");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
  return objc_msgSend(*(id *)(a1 + 32), "postSyncNotification:payload:", v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

uint64_t __50__CAWindowServerDisplay_postNotification_payload___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke(uint64_t a1, int a2)
{
  const __CFString *v2;

  if (a2)
    v2 = CFSTR("notificationAttached");
  else
    v2 = CFSTR("notificationDetached");
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:payload:", v2, 0);
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_2(uint64_t a1, int a2)
{
  const __CFString *v2;

  if (a2)
    v2 = CFSTR("notificationPowerOn");
  else
    v2 = CFSTR("notificationPowerOff");
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:payload:", v2, 0);
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_3(uint64_t a1, int a2)
{
  const __CFString *v2;

  if (a2)
    v2 = CFSTR("notificationFlipBookOn");
  else
    v2 = CFSTR("notificationFlipBookOff");
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:payload:", v2, 0);
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  const __CFString *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a2)
    v6 = CFSTR("notificationSecureIndicatorOn");
  else
    v6 = CFSTR("notificationSecureIndicatorOff");
  v8[0] = CFSTR("indicatorType");
  v8[1] = CFSTR("activeIndicatorCount");
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:payload:", v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_5(uint64_t a1, int a2, int a3, double a4)
{
  void *v5;
  uint64_t *v6;
  const __CFString **v7;
  uint64_t v8;
  const __CFString *v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!a2)
    *(float *)&a4 = 1.0;
  if (a3)
  {
    v12[0] = CFSTR("requestEDR");
    v12[1] = CFSTR("rampDuration");
    v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a4);
    v13[1] = &unk_1E15D6E80;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = v13;
    v7 = (const __CFString **)v12;
    v8 = 2;
  }
  else
  {
    v10 = CFSTR("requestEDR");
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a4);
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v11;
    v7 = &v10;
    v8 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:payload:", CFSTR("notificationEDR"), objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, v8));
}

uint64_t __46__CAWindowServerDisplay_setFrameInfoCallback___block_invoke(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, float a9, float a10, float a11, __int16 a12, unsigned __int8 a13, uint64_t a14, unsigned int a15)
{
  pthread_mutex_t *v16;
  uint64_t v17;
  _DWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int16 v25;
  __int16 v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19[0] = a2;
  v19[1] = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a12;
  v26 = a13;
  v27 = a9;
  v28 = a10;
  v29 = LODWORD(a11);
  v30 = a14;
  v31 = a15;
  v16 = *(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 8);
  pthread_mutex_lock(v16);
  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 160);
  if (v17)
    (*(void (**)(uint64_t, _DWORD *))(v17 + 16))(v17, v19);
  return pthread_mutex_unlock(v16);
}

uint64_t __37__CAWindowServerDisplay_commitPreset__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  int64x2_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  *(_DWORD *)(v1[12] + 745) |= 0x400u;
  v3 = 0;
  v4 = vdupq_n_s64(0x8000000000uLL);
  (*(void (**)(_QWORD *, uint64_t *, double))(*v1 + 184))(v1, &v3, 0.0);
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)v1[12] + 1208))(v1[12]);
}

@end
