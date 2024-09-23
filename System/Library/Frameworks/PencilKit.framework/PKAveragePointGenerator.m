@implementation PKAveragePointGenerator

- (PKAveragePointGenerator)init
{
  PKAveragePointGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAveragePointGenerator;
  result = -[PKAveragePointGenerator init](&v3, sel_init);
  if (result)
  {
    result->_azimuth.isAngle = 1;
    result->_altitude.isAngle = 1;
    result->_directionAngle.isAngle = 1;
    result->_rollAngle.isAngle = 1;
  }
  return result;
}

- (void)reset
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 88);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    *(_OWORD *)(a1 + 16) = 0u;
    *(_QWORD *)(a1 + 80) = 0;
    os_unfair_lock_unlock(v2);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    *(_OWORD *)(a1 + 104) = 0u;
    *(_QWORD *)(a1 + 168) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 264));
    *(_OWORD *)(a1 + 192) = 0u;
    *(_QWORD *)(a1 + 256) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 264));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    *(_OWORD *)(a1 + 280) = 0u;
    *(_QWORD *)(a1 + 344) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    *(_OWORD *)(a1 + 368) = 0u;
    *(_QWORD *)(a1 + 432) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 528));
    *(_OWORD *)(a1 + 456) = 0u;
    *(_QWORD *)(a1 + 520) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 528));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    *(_OWORD *)(a1 + 544) = 0u;
    *(_QWORD *)(a1 + 608) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 704));
    *(_OWORD *)(a1 + 632) = 0u;
    *(_QWORD *)(a1 + 696) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 704));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 792));
    *(_OWORD *)(a1 + 720) = 0u;
    *(_QWORD *)(a1 + 784) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 792));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 880));
    *(_OWORD *)(a1 + 808) = 0u;
    *(_QWORD *)(a1 + 872) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 880));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 968));
    *(_OWORD *)(a1 + 896) = 0u;
    *(_QWORD *)(a1 + 960) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 968));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 1056));
    *(_OWORD *)(a1 + 984) = 0u;
    *(_QWORD *)(a1 + 1048) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 1056));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 1144));
    *(_OWORD *)(a1 + 1072) = 0u;
    *(_QWORD *)(a1 + 1136) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 1144));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 1232));
    *(_OWORD *)(a1 + 1160) = 0u;
    *(_QWORD *)(a1 + 1224) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 1232));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 1320));
    *(_OWORD *)(a1 + 1248) = 0u;
    *(_QWORD *)(a1 + 1312) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 1320));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 1408));
    *(_OWORD *)(a1 + 1336) = 0u;
    *(_QWORD *)(a1 + 1400) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 1408));
  }
}

- (void)currentInputPoint
{
  long double v4;
  double v5;
  long double v7;
  double v8;
  long double v10;
  double v11;
  long double v13;
  double v14;

  if (a1)
  {
    *(double *)a2 = PKRunningStat::mean((PKRunningStat *)(a1 + 8));
    *(double *)(a2 + 8) = PKRunningStat::mean((PKRunningStat *)(a1 + 96));
    *(double *)(a2 + 16) = PKRunningStat::mean((PKRunningStat *)(a1 + 184));
    v4 = PKRunningStat::mean((PKRunningStat *)(a1 + 272));
    v5 = fmod(v4, 6.28318531);
    if (v4 <= 6.28318531 && v4 >= 0.0)
      v5 = v4;
    if (v5 < 0.0)
      v5 = v5 + 6.28318531;
    if (v5 == 0.0)
      v5 = 0.0;
    *(double *)(a2 + 24) = v5;
    v7 = PKRunningStat::mean((PKRunningStat *)(a1 + 360));
    v8 = fmod(v7, 6.28318531);
    if (v7 <= 6.28318531 && v7 >= 0.0)
      v8 = v7;
    if (v8 < 0.0)
      v8 = v8 + 6.28318531;
    if (v8 == 0.0)
      v8 = 0.0;
    *(double *)(a2 + 32) = v8;
    *(double *)(a2 + 40) = PKRunningStat::mean((PKRunningStat *)(a1 + 448));
    v10 = PKRunningStat::mean((PKRunningStat *)(a1 + 536));
    v11 = fmod(v10, 6.28318531);
    if (v10 <= 6.28318531 && v10 >= 0.0)
      v11 = v10;
    if (v11 < 0.0)
      v11 = v11 + 6.28318531;
    if (v11 == 0.0)
      v11 = 0.0;
    *(double *)(a2 + 48) = v11;
    *(_QWORD *)(a2 + 56) = 0;
    *(double *)(a2 + 64) = PKRunningStat::mean((PKRunningStat *)(a1 + 712));
    *(_BYTE *)(a2 + 72) = 0;
    *(_QWORD *)(a2 + 80) = 0;
    *(double *)(a2 + 88) = PKRunningStat::mean((PKRunningStat *)(a1 + 800));
    *(_BYTE *)(a2 + 96) = 0;
    v13 = PKRunningStat::mean((PKRunningStat *)(a1 + 888));
    v14 = fmod(v13, 6.28318531);
    if (v13 <= 6.28318531 && v13 >= 0.0)
      v14 = v13;
    if (v14 < 0.0)
      v14 = v14 + 6.28318531;
    if (v14 == 0.0)
      v14 = 0.0;
    *(double *)(a2 + 104) = v14;
    *(_QWORD *)(a2 + 112) = 0;
    *(_QWORD *)(a2 + 120) = 0;
  }
  else
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

- (double)currentStrokePoint
{
  double result;

  if (a1)
  {
    *a2 = PKRunningStat::mean((PKRunningStat *)(a1 + 712));
    a2[1] = PKRunningStat::mean((PKRunningStat *)(a1 + 8));
    a2[2] = PKRunningStat::mean((PKRunningStat *)(a1 + 96));
    a2[3] = PKRunningStat::mean((PKRunningStat *)(a1 + 976));
    a2[4] = PKRunningStat::mean((PKRunningStat *)(a1 + 1152));
    a2[5] = PKRunningStat::mean((PKRunningStat *)(a1 + 1064));
    a2[6] = PKRunningStat::mean((PKRunningStat *)(a1 + 184));
    a2[7] = PKRunningStat::mean((PKRunningStat *)(a1 + 272));
    a2[8] = PKRunningStat::mean((PKRunningStat *)(a1 + 360));
    a2[9] = PKRunningStat::mean((PKRunningStat *)(a1 + 1240));
    result = PKRunningStat::mean((PKRunningStat *)(a1 + 1328));
    a2[10] = result;
  }
  else
  {
    a2[10] = 0.0;
    result = 0.0;
    *((_OWORD *)a2 + 3) = 0u;
    *((_OWORD *)a2 + 4) = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *((_OWORD *)a2 + 2) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  return result;
}

- (void)addInputPoint:(uint64_t)a1
{
  if (a1)
  {
    PKRunningStat::push((PKRunningStat *)(a1 + 8), *a2);
    PKRunningStat::push((PKRunningStat *)(a1 + 96), a2[1]);
    PKRunningStat::push((PKRunningStat *)(a1 + 184), a2[2]);
    PKRunningStat::push((PKRunningStat *)(a1 + 272), a2[3]);
    PKRunningStat::push((PKRunningStat *)(a1 + 360), a2[4]);
    PKRunningStat::push((PKRunningStat *)(a1 + 448), a2[5]);
    PKRunningStat::push((PKRunningStat *)(a1 + 536), a2[6]);
    PKRunningStat::push((PKRunningStat *)(a1 + 624), a2[7]);
    PKRunningStat::push((PKRunningStat *)(a1 + 712), a2[8]);
    PKRunningStat::push((PKRunningStat *)(a1 + 800), a2[11]);
    PKRunningStat::push((PKRunningStat *)(a1 + 888), a2[13]);
  }
}

- (void)addStroke:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PKRunningStat *v16;
  PKRunningStat *v17;
  double v18;
  PKRunningStat *v19;
  PKRunningStat *v20;
  PKRunningStat *v21;
  PKRunningStat *v22;
  PKRunningStat *v23;
  PKRunningStat *v24;
  PKRunningStat *v25;
  double v26;
  id v27;
  PKRunningStat *v28;
  double v29;
  PKRunningStat *v30;
  int v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v27 = v3;
    objc_msgSend(v3, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v35, "count");
    objc_msgSend(v4, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renderingDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    v9 = 0.0;
    v10 = 2.0;
    if (v8)
      v10 = 0.0;
    v33 = v10;
    if (v4)
    {
      objc_msgSend(v4, "transform");
      objc_msgSend(v4, "_inkTransform");
      v9 = sqrt(v39 * v39 + v38 * v38);
      v12 = v37;
      v11 = v36;
    }
    else
    {
      v12 = 0.0;
      v11 = 0.0;
    }
    objc_msgSend(v4, "ink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    if (objc_msgSend(v13, "_isFountainPenInk"))
    {
      objc_msgSend(v4, "ink");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v14, "_isFountainPenInkV2") ^ 1;

    }
    else
    {
      LOBYTE(v31) = 0;
    }

    if (v34)
    {
      v15 = 0;
      v30 = (PKRunningStat *)(a1 + 712);
      v16 = (PKRunningStat *)(a1 + 8);
      v17 = (PKRunningStat *)(a1 + 96);
      v18 = v9 * sqrt(v12 * v12 + v11 * v11);
      v19 = (PKRunningStat *)(a1 + 976);
      v20 = (PKRunningStat *)(a1 + 1152);
      v21 = (PKRunningStat *)(a1 + 1064);
      v22 = (PKRunningStat *)(a1 + 184);
      v28 = (PKRunningStat *)(a1 + 272);
      v23 = (PKRunningStat *)(a1 + 360);
      v24 = (PKRunningStat *)(a1 + 1240);
      v25 = (PKRunningStat *)(a1 + 1328);
      v29 = v18;
      do
      {
        if (v35)
          objc_msgSend(v35, "decompressedPointAt:", v15);
        v26 = 0.0;
        if (v32)
          v26 = v18 * 0.0;
        PKRunningStat::push(v30, 0.0);
        PKRunningStat::push(v16, 0.0);
        PKRunningStat::push(v17, 0.0);
        PKRunningStat::push(v19, v33 + (0.0 - v33) * v18);
        PKRunningStat::push(v20, 0.0);
        PKRunningStat::push(v21, v18 * 0.0);
        PKRunningStat::push(v22, 0.0);
        if ((v31 & 1) == 0)
          PKRunningStat::push(v28, 0.0);
        PKRunningStat::push(v23, 0.0);
        PKRunningStat::push(v24, 0.0);
        PKRunningStat::push(v25, v26);
        ++v15;
        v18 = v29;
      }
      while (v34 != v15);
    }

    v4 = v27;
  }

}

- (void)addStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          -[PKAveragePointGenerator addStroke:](a1, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_DWORD *)self + 22) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_BYTE *)self + 96) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_DWORD *)self + 44) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_BYTE *)self + 184) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_DWORD *)self + 66) = 0;
  *((_OWORD *)self + 12) = 0u;
  *((_BYTE *)self + 272) = 0;
  *((_QWORD *)self + 43) = 0;
  *((_DWORD *)self + 88) = 0;
  *(_OWORD *)((char *)self + 280) = 0u;
  *((_BYTE *)self + 360) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_DWORD *)self + 110) = 0;
  *((_OWORD *)self + 23) = 0u;
  *((_BYTE *)self + 448) = 0;
  *((_QWORD *)self + 65) = 0;
  *((_DWORD *)self + 132) = 0;
  *(_OWORD *)((char *)self + 456) = 0u;
  *((_BYTE *)self + 536) = 0;
  *((_QWORD *)self + 76) = 0;
  *((_DWORD *)self + 154) = 0;
  *((_OWORD *)self + 34) = 0u;
  *((_BYTE *)self + 624) = 0;
  *((_QWORD *)self + 87) = 0;
  *((_DWORD *)self + 176) = 0;
  *(_OWORD *)((char *)self + 632) = 0u;
  *((_BYTE *)self + 712) = 0;
  *((_QWORD *)self + 98) = 0;
  *((_DWORD *)self + 198) = 0;
  *((_OWORD *)self + 45) = 0u;
  *((_BYTE *)self + 800) = 0;
  *((_QWORD *)self + 109) = 0;
  *((_DWORD *)self + 220) = 0;
  *(_OWORD *)((char *)self + 808) = 0u;
  *((_BYTE *)self + 888) = 0;
  *((_QWORD *)self + 120) = 0;
  *((_DWORD *)self + 242) = 0;
  *((_OWORD *)self + 56) = 0u;
  *((_BYTE *)self + 976) = 0;
  *((_QWORD *)self + 131) = 0;
  *((_DWORD *)self + 264) = 0;
  *(_OWORD *)((char *)self + 984) = 0u;
  *((_BYTE *)self + 1064) = 0;
  *((_QWORD *)self + 142) = 0;
  *((_DWORD *)self + 286) = 0;
  *((_OWORD *)self + 67) = 0u;
  *((_BYTE *)self + 1152) = 0;
  *((_QWORD *)self + 153) = 0;
  *((_DWORD *)self + 308) = 0;
  *(_OWORD *)((char *)self + 1160) = 0u;
  *((_BYTE *)self + 1240) = 0;
  *((_QWORD *)self + 164) = 0;
  *((_DWORD *)self + 330) = 0;
  *((_OWORD *)self + 78) = 0u;
  *((_BYTE *)self + 1328) = 0;
  *((_QWORD *)self + 175) = 0;
  *((_DWORD *)self + 352) = 0;
  *(_OWORD *)((char *)self + 1336) = 0u;
  return self;
}

@end
