const char *FKGetBuildTimestamp()
{
  return "Wed Dec 31 16:00:00 1969";
}

const char *FKGetBuildGitHash()
{
  return "<FK_GIT_HASH>";
}

const char *FKGetFrameworkVersion()
{
  return "Futhark-110";
}

uint64_t FKGetBuildAPIVersion()
{
  return 10;
}

uint64_t createOrResetSessions(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void **v13;

  LODWORD(v4) = a4;
  if (a4 < 1)
    goto LABEL_8;
  v8 = 0;
  v10 = 4;
  do
  {
    v11 = *(_QWORD *)(a1 + 8 * v8);
    if (v11)
    {
      FKSessionReset(v11, a2 >> v8, a3 >> v8);
    }
    else
    {
      v12 = FKSessionCreate(a2 >> v8, a3 >> v8);
      *(_QWORD *)(a1 + 8 * v8) = v12;
      if (!v12)
        return v10;
    }
    ++v8;
  }
  while (v4 != v8);
  if (a4 <= 7)
  {
LABEL_8:
    v4 = (int)v4;
    do
    {
      v13 = *(void ***)(a1 + 8 * v4);
      if (v13)
      {
        FKSessionDestroy(v13);
        *(_QWORD *)(a1 + 8 * v4) = 0;
      }
      ++v4;
    }
    while ((_DWORD)v4 != 8);
  }
  return 0;
}

uint64_t getNumSharedConcomps(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _DWORD *v10;
  int v11;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _DWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _WORD *v22;
  _WORD *v23;
  int v24;
  int v25;
  unsigned int v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _DWORD *v30;
  uint64_t v31;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(v6 + 312);
  v8 = *(_DWORD *)(a1 + 8);
  v9 = v7 + 104 * v8;
  v11 = *(_DWORD *)(v9 + 20);
  v10 = (_DWORD *)(v9 + 20);
  if (v11 < 1)
    return 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)(a2 + 16);
  v17 = *(_QWORD *)(v16 + 312);
  v18 = *(_DWORD *)(a2 + 8);
  v19 = (_DWORD *)(v17 + 104 * v18 + 20);
  v20 = (_QWORD *)(v7 + 104 * v8 + 8);
  v21 = (_QWORD *)(v17 + 104 * v18 + 8);
  v30 = v19;
  v31 = a2;
  do
  {
    if (v13 >= *v19)
      break;
    v22 = (_WORD *)(*(_QWORD *)(v6 + 280) + 100 * *(int *)(*v20 + 4 * v14));
    v23 = (_WORD *)(*(_QWORD *)(v16 + 280) + 100 * *(int *)(*v21 + 4 * v13));
    v24 = *(_DWORD *)(a1 + 24);
    v25 = *(_DWORD *)(a2 + 24);
    v26 = (unsigned __int16)((unsigned __int16)v22[41] << v24);
    if (v26 >= (unsigned __int16)((unsigned __int16)v23[41] << v25))
    {
      if ((unsigned __int16)((unsigned __int16)v23[41] << v25) > (unsigned __int16)((unsigned __int16)v22[40] << v24))
      {
        v28 = concompsOverlap(v22, v6, v23, v16, a3, a4, a5, a6);
        v19 = v30;
        a2 = v31;
        v15 = (v15 + v28);
      }
      ++v13;
    }
    else
    {
      if (v26 > (unsigned __int16)((unsigned __int16)v23[40] << v25))
      {
        v27 = concompsOverlap(v22, v6, v23, v16, a3, a4, a5, a6);
        v19 = v30;
        a2 = v31;
        v15 = (v15 + v27);
      }
      ++v14;
    }
  }
  while (v14 < *v10);
  return v15;
}

uint64_t sortSequencesInSensibleOrder(void *a1)
{
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
  char v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
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
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  int v46;
  int v47;
  int *v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t result;
  void *v53;
  int i;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "count");
  v3 = objc_msgSend(a1, "sortUsingComparator:", &__block_literal_global_219);
  v4 = v2;
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v58 - v5;
  v59 = (int)v2;
  v60 = v2;
  v62 = v2;
  if ((int)v2 >= 1)
  {
    v7 = 0;
    do
    {
      *(_DWORD *)&v6[4 * v7] = v7;
      ++v7;
    }
    while (v2 != v7);
    v8 = 0;
    v9 = 1;
    v62 = v60;
    while (1)
    {
      v10 = objc_msgSend(a1, "objectAtIndex:", v8);
      v61 = v8;
      v63 = v8 + 1;
      v64 = v9;
      if (v8 + 1 < v59)
      {
        v11 = v10;
        while (1)
        {
          v12 = objc_msgSend(a1, "objectAtIndex:", v9);
          v13 = *(_QWORD *)(*(_QWORD *)(v11 + 16) + 312) + 104 * *(int *)(v11 + 8);
          v14 = *(_DWORD *)(v11 + 24);
          v15 = *(_DWORD *)(v13 + 52) << v14;
          v16 = (*(unsigned __int16 *)(v13 + 30) + *(unsigned __int16 *)(v13 + 28) + 1) >> 1 << v14;
          v17 = *(_QWORD *)(*(_QWORD *)(v12 + 16) + 312) + 104 * *(int *)(v12 + 8);
          v18 = *(_DWORD *)(v12 + 24);
          v19 = *(_DWORD *)(v17 + 52) << v18;
          v20 = (*(unsigned __int16 *)(v17 + 30) + *(unsigned __int16 *)(v17 + 28) + 1) >> 1 << v18;
          v21 = v19 + v15;
          if (v19 + v15 < 0 != __OFADD__(v19, v15))
            ++v21;
          v22 = v21 >> 1;
          v23 = v20 - v16;
          if (v23 < 0)
            v23 = -v23;
          if (v23 < 4 * v22)
          {
            v24 = (void *)v12;
            objc_msgSend((id)v11, "boundingBox");
            v26 = v25;
            objc_msgSend(v24, "boundingBox");
            v28 = v27;
            objc_msgSend(v24, "boundingBox");
            if (v26 <= v28 + v29 * 2.0)
            {
              objc_msgSend(v24, "boundingBox");
              v31 = v30;
              objc_msgSend((id)v11, "boundingBox");
              v33 = v32;
              objc_msgSend((id)v11, "boundingBox");
              if (v31 <= v33 + v34 * 2.0)
              {
                objc_msgSend((id)v11, "boundingBox");
                v36 = v35;
                objc_msgSend(v24, "boundingBox");
                v38 = v37;
                objc_msgSend(v24, "boundingBox");
                if (v36 <= v38 + v39)
                {
                  objc_msgSend(v24, "boundingBox");
                  v41 = v40;
                  objc_msgSend((id)v11, "boundingBox");
                  v43 = v42;
                  objc_msgSend((id)v11, "boundingBox");
                  if (v41 <= v43 + v44)
                    break;
                }
              }
            }
          }
LABEL_30:
          if (++v9 == v4)
            goto LABEL_31;
        }
        if (fabsf((float)(v19 - v15) / (float)v22) <= 0.33)
          break;
      }
LABEL_31:
      v9 = v64 + 1;
      v8 = v63;
      if (v63 == v4)
        goto LABEL_32;
    }
    v45 = *(_DWORD *)&v6[4 * v61];
    v46 = *(_DWORD *)&v6[4 * v9];
    if (v45 == v46)
      goto LABEL_30;
    if (v46 >= v45)
      v47 = *(_DWORD *)&v6[4 * v61];
    else
      v47 = *(_DWORD *)&v6[4 * v9];
    if (v46 > v45)
      v45 = *(_DWORD *)&v6[4 * v9];
    v48 = (int *)v6;
    v49 = v4;
    while (1)
    {
      v50 = *v48;
      v51 = v47;
      if (*v48 == v45)
        goto LABEL_27;
      if (v50 > v45)
        break;
LABEL_28:
      ++v48;
      if (!--v49)
      {
        --v62;
        goto LABEL_30;
      }
    }
    v51 = v50 - 1;
LABEL_27:
    *v48 = v51;
    goto LABEL_28;
  }
LABEL_32:
  result = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v59);
  v53 = (void *)result;
  if (v62 >= 1)
  {
    for (i = 0; i != v62; ++i)
    {
      if ((int)v60 >= 1)
      {
        v55 = 0;
        v56 = 1;
        do
        {
          if (*(_DWORD *)&v6[4 * v55] == i)
          {
            result = objc_msgSend(v53, "addObject:", objc_msgSend(a1, "objectAtIndexedSubscript:", v55));
            if (v56)
            {
              result = objc_msgSend(a1, "objectAtIndexedSubscript:", v55);
              v56 = 0;
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 16) + 312) + 104 * *(int *)(result + 8) + 94) = 1;
            }
          }
          ++v55;
        }
        while (v4 != v55);
      }
    }
  }
  if ((int)v60 >= 1)
  {
    v57 = 0;
    do
    {
      result = objc_msgSend(a1, "setObject:atIndexedSubscript:", objc_msgSend(v53, "objectAtIndexedSubscript:", v57), v57);
      ++v57;
    }
    while (v4 != v57);
  }
  return result;
}

void sub_1D45E9520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t runDetectionOnSession(uint64_t result, int a2, int a3, int *a4)
{
  size_t v4;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  __int128 v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int *v46;
  int v47;
  int v48;
  int *v49;
  uint64_t v50;
  int32x4_t v51;
  unint64_t v52;
  int v53;
  int v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  int *v62;
  int v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(result + 8 * a2 + 8);
  v64 = *(_OWORD *)(v4 + 168);
  v65 = *(_OWORD *)(v4 + 184);
  if (*(_QWORD *)(v4 + 200))
  {
    v8 = (char *)result;
    v9 = a2;
    v10 = mach_absolute_time();
    v63 = a3;
    switch(objc_msgSend(v8, "thresholdingAlgorithm"))
    {
      case 0:
        goto LABEL_6;
      case 1:
        v68 = v64;
        v69 = v65;
        FKThresholdBlockAverage(v4, (uint64_t *)&v68);
        goto LABEL_11;
      case 2:
        v11 = objc_msgSend(v8, "enableBinarizerFiltering");
        goto LABEL_9;
      case 3:
        v68 = v64;
        v69 = v65;
        objc_msgSend(v8, "setBinarizerLimit:", FKThresholdCalculateOtsuLimit(v4, &v68));
LABEL_6:
        v12 = objc_msgSend(v8, "binarizerLimit");
        v68 = v64;
        v69 = v65;
        FKThreshold(v4, (uint64_t *)&v68, v12);
        goto LABEL_11;
      default:
        v11 = objc_msgSend(v8, "enableBinarizerFiltering");
        if (a3 < 1)
        {
LABEL_9:
          v15 = objc_msgSend(v8, "contrastLimit");
          v68 = v64;
          v69 = v65;
          v13 = v4;
          v14 = v11;
          v16 = 1;
        }
        else
        {
          v68 = v64;
          v69 = v65;
          v13 = v4;
          v14 = v11;
          v15 = a3;
          v16 = 4;
        }
        FKThresholdMinMaxBlock(v13, &v68, v14, v15, v16);
LABEL_11:
        v17 = mach_absolute_time();
        v18 = dword_1EFEA7B9C;
        if (!dword_1EFEA7B9C)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          v18 = dword_1EFEA7B9C;
        }
        *(_DWORD *)&v8[4 * v9 + 160] = (v17 - v10)
                                     * getTimeInMicro_sTimebaseInfo
                                     / (1000 * v18);
        v19 = mach_absolute_time();
        FKComponentsFind(v4);
        v20 = mach_absolute_time();
        v21 = dword_1EFEA7B9C;
        if (!dword_1EFEA7B9C)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          v21 = dword_1EFEA7B9C;
        }
        v22 = &v8[4 * v9];
        *((_DWORD *)v22 + 48) = (v20 - v19) * getTimeInMicro_sTimebaseInfo / (1000 * v21);
        v23 = mach_absolute_time();
        objc_msgSend(v8, "detectDiacritics");
        FKSequencesFind((int *)v4);
        v24 = mach_absolute_time();
        v25 = dword_1EFEA7B9C;
        if (!dword_1EFEA7B9C)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          v25 = dword_1EFEA7B9C;
        }
        v26 = &v8[48 * (int)v9];
        v27 = (uint64_t *)(v26 + 288);
        *((_DWORD *)v22 + 56) = (v24 - v23) * getTimeInMicro_sTimebaseInfo / (1000 * v25);
        *((_DWORD *)v22 + 64) = 0;
        v28 = (uint64_t *)(v26 + 296);
        result = FKSessionGetMemoryUsage(v4, (_QWORD *)v26 + 37, (uint64_t *)v26 + 38, (uint64_t *)v26 + 39, (uint64_t *)v26 + 40);
        v29 = (uint64_t *)(v26 + 328);
        if (a2 >= 1)
        {
          v30 = *v28;
          *v27 = *v28;
          *v29 = v30 + result;
          if (!a4)
            return result;
          v62 = a4;
          *a4 = 0;
          v31 = mach_absolute_time();
          v32 = objc_msgSend(v8, "contrastLimit");
          if (v63)
          {
            v33 = *(_DWORD *)(v4 + 324);
          }
          else
          {
            v33 = *(_DWORD *)(v4 + 324);
            if (v33 == -1)
              goto LABEL_40;
            v43 = 0;
            v44 = *(_DWORD *)(v4 + 288) - *(_DWORD *)(v4 + 292);
            v45 = *(_DWORD *)(v4 + 324);
            do
            {
              v46 = (int *)(*(_QWORD *)(v4 + 312) + 104 * v45);
              v43 += v46[5];
              v45 = *v46;
            }
            while (v45 != -1);
            if (!v43)
              goto LABEL_40;
            v47 = v44 >= 1000 ? 4 : 10;
            if (v44 / v43 < v47)
            {
LABEL_40:
              v48 = 0;
              v49 = v62;
              goto LABEL_61;
            }
          }
          v60 = v32;
          v61 = v31;
          bzero(&v68, 0x400uLL);
          if (v33 == -1)
          {
            v35 = 0;
            v34 = 0;
          }
          else
          {
            v34 = 0;
            v35 = 0;
            do
            {
              v36 = *(_QWORD *)(v4 + 312);
              v37 = (int *)(v36 + 104 * v33);
              if (v37[5] >= 1)
              {
                v38 = 0;
                v39 = (_QWORD *)(v36 + 104 * v33 + 8);
                do
                {
                  v40 = *(_QWORD *)(v4 + 280) + 100 * *(int *)(*v39 + 4 * v38);
                  v41 = *(_OWORD *)(v4 + 184);
                  v66 = *(_OWORD *)(v4 + 168);
                  v67 = v41;
                  v42 = FKThresholdCalculateContrast(v4, &v66, *(_QWORD *)(v40 + 80));
                  if (v42)
                  {
                    v34 += v42;
                    ++v35;
                    ++*((_DWORD *)&v68 + v42);
                  }
                  ++v38;
                }
                while (v38 < v37[5]);
              }
              v33 = *v37;
            }
            while (*v37 != -1);
          }
          v50 = 0;
          v51 = 0uLL;
          v48 = v63;
          do
          {
            v51 = vmaxq_s32(v51, *(int32x4_t *)((char *)&v68 + v50));
            v50 += 16;
          }
          while (v50 != 1024);
          v49 = v62;
          v31 = v61;
          if (v35 >= 30 && vmaxvq_s32(v51) >= 10)
          {
            if (v34 < 20)
            {
              v55 = 0;
              v54 = v60;
            }
            else
            {
              v52 = 0;
              v53 = 0;
              v54 = v60;
              do
              {
                v55 = v52 + 1;
                if (v52 > 0xFE)
                  break;
                v53 += *((_DWORD *)&v68 + v52) * v52;
                ++v52;
              }
              while (v53 < v34 / 20);
            }
            if (v55 >= 0xFF)
              v56 = 255;
            else
              v56 = v55;
            if ((_DWORD)v56 && *((_DWORD *)&v68 + v56))
            {
              do
              {
                if (*((int *)&v67 + v56 + 3) < 1)
                  goto LABEL_60;
                --v56;
              }
              while ((unint64_t)(v56 + 1) > 1);
              LODWORD(v56) = 0;
            }
LABEL_60:
            v57 = 1374389535 * (10 * v54 + 90 * (int)v56);
            v48 = (v57 >> 37) + ((unint64_t)v57 >> 63);
          }
LABEL_61:
          *v49 = v48;
          result = mach_absolute_time();
          v58 = result;
          v59 = dword_1EFEA7B9C;
          if (!dword_1EFEA7B9C)
          {
            result = mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
            v59 = dword_1EFEA7B9C;
          }
          *(_DWORD *)&v8[4 * v9 + 160] += (v58 - v31)
                                        * getTimeInMicro_sTimebaseInfo
                                        / (1000 * v59);
          return result;
        }
        *v27 = 0;
        *v29 = result;
        if (a4)
          *a4 = 0;
        break;
    }
  }
  return result;
}

BOOL concompsOverlap(_WORD *a1, uint64_t a2, _WORD *a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  double v8;
  unint64_t v9;
  unint64_t v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v15;
  CGFloat v16;
  double v17;
  double v18;
  int v19;
  int v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  float v25;
  float v26;
  float v27;
  double height;
  double width;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  LOWORD(a5) = a1[40];
  v8 = (double)*(unint64_t *)&a5;
  LOWORD(a6) = a1[41];
  LOWORD(a7) = a1[42];
  *(double *)&v9 = (double)*(unint64_t *)&a7;
  LOWORD(a8) = a1[43];
  *(double *)&v10 = (double)*(int *)(a2 + 28);
  v11 = v8 / *(double *)&v10;
  v12 = (double)*(int *)(a2 + 32);
  v13 = *(double *)&v9 / v12;
  v14 = ((double)*(unint64_t *)&a6 - v8 + 1.0) / *(double *)&v10;
  *(double *)&v15 = (double)*(unint64_t *)&a8 - *(double *)&v9 + 1.0;
  v16 = *(double *)&v15 / v12;
  LOWORD(v15) = a3[40];
  v17 = (double)v15;
  LOWORD(v9) = a3[41];
  LOWORD(v10) = a3[42];
  v18 = (double)v10;
  LOWORD(v10) = a3[43];
  v19 = *(_DWORD *)(a4 + 28);
  v20 = *(_DWORD *)(a4 + 32);
  v21 = v17 / (double)v19;
  v22 = v18 / (double)v20;
  v23 = ((double)v9 - v17 + 1.0) / (double)v19;
  v24 = ((double)v10 - v18 + 1.0) / (double)v20;
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.width = v14;
  v31.size.height = v16;
  v34.origin.x = v21;
  v34.origin.y = v22;
  v34.size.width = v23;
  v34.size.height = v24;
  v32 = CGRectIntersection(v31, v34);
  height = v32.size.height;
  width = v32.size.width;
  v32.origin.x = v11;
  v32.origin.y = v13;
  v32.size.width = v14;
  v32.size.height = v16;
  v35.origin.x = v21;
  v35.origin.y = v22;
  v35.size.width = v23;
  v35.size.height = v24;
  v33 = CGRectUnion(v32, v35);
  v25 = v14;
  if (v23 < v25)
  {
    v26 = v23;
    v25 = v26;
  }
  v27 = width * height / (v33.size.height * v25);
  return v27 > 0.8;
}

uint64_t __sortSequencesInApproximateScanOrder_block_invoke(uint64_t a1, void *a2, void *a3)
{
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
  float v16;
  float v17;

  objc_msgSend(a2, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(a3, "boundingBox");
  if (v13 >= v7 + v11)
    return -1;
  if (v7 >= v13 + v15)
    return 1;
  if (v12 >= v5 + v9)
    return -1;
  if (v5 >= v12 + v14)
    return 1;
  v16 = v7 + v11 * 0.5;
  v17 = v13 + v15 * 0.5;
  if (v17 < v16)
    return 1;
  else
    return -1;
}

int *FKRecognizeGetCandidates(uint64_t a1, int *a2, _DWORD *a3)
{
  uint64_t v5;
  float v6;
  uint64_t v7;
  int v8;
  float v9;
  float *v10;
  float *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  float *v17;
  float *v18;
  float v19;
  int v20;
  uint64_t v21;
  float *v22;
  int *v23;
  int *v24;
  float *v25;
  float *v26;
  float v27;
  float *v28;
  float *v29;
  int v30;
  float *v31;
  int *result;
  float v33;
  float *v34;
  int v35;
  BOOL v36;
  uint64_t v37;
  _OWORD *v38;
  int v39;
  uint64_t v40;
  int v41;
  _QWORD *v42;
  int v43;
  int *v44;
  uint64_t v45;
  float *v46;
  float v47;
  uint64_t v48;
  float v49;
  double v50;
  float *v51;
  float v52;
  int *v53;
  float v54;
  int v55;
  int __base;
  float v58;
  _OWORD v59[6];
  uint64_t v60;
  uint64_t v61;

  v5 = 0;
  v61 = *MEMORY[0x1E0C80C00];
  v60 = 0;
  memset(v59, 0, sizeof(v59));
  v6 = *(float *)(a1 + 48) + *(float *)(a1 + 48);
  v7 = 1;
  __base = *(_DWORD *)(a1 + 40);
  v58 = v6;
  do
  {
    v8 = *(_DWORD *)(a1 + v5 + 24);
    v9 = *(float *)(a1 + v5 + 48);
    if (v8 == 9475298)
    {
      v12 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84) + 1;
      v13 = 3 * ((v12 << 8) / (v12 - *(unsigned __int16 *)(a1 + 80) + *(unsigned __int16 *)(a1 + 82) + 1));
      v14 = v13 - 384;
      v15 = v13 - 383;
      if (v14 >= 0)
        v15 = v14;
      v16 = v15 >> 1;
      if (v16 <= -128)
        v16 = -128;
      if (v16 >= 127)
        v16 = 127;
      if ((v16 + 128) >= 0xAB)
      {
        if ((int)v7 > 14)
          goto LABEL_46;
        v22 = (float *)(&__base + 2 * (int)v7);
        *(_DWORD *)v22 = 49;
        v22[1] = (float)(v9 * 5.0) * 0.125;
        if ((_DWORD)v7 != 14)
        {
          v18 = (float *)(&__base + 2 * (int)v7);
          *((_DWORD *)v18 + 2) = 108;
          v18[3] = (float)(v9 + v9) * 0.125;
          if ((int)v7 <= 12)
          {
            v19 = v9 * 0.125;
            v20 = 55;
LABEL_25:
            *((_DWORD *)v18 + 4) = v20;
            v18[5] = v19;
LABEL_26:
            v7 = (v7 + 3);
            goto LABEL_46;
          }
        }
      }
      else
      {
        if ((int)v7 > 14)
          goto LABEL_46;
        v17 = (float *)(&__base + 2 * (int)v7);
        *(_DWORD *)v17 = 55;
        v17[1] = (float)(v9 * 5.0) * 0.125;
        if ((_DWORD)v7 != 14)
        {
          v18 = (float *)(&__base + 2 * (int)v7);
          *((_DWORD *)v18 + 2) = 49;
          v18[3] = (float)(v9 + v9) * 0.125;
          if ((int)v7 <= 12)
          {
            v19 = v9 * 0.125;
            v20 = 108;
            goto LABEL_25;
          }
        }
      }
      goto LABEL_45;
    }
    if (v8 == 124)
    {
      if ((int)v7 > 14)
        goto LABEL_46;
      v10 = (float *)(&__base + 2 * (int)v7);
      *(_DWORD *)v10 = 108;
      v10[1] = v9;
      if ((_DWORD)v7 != 14)
      {
        v11 = (float *)(&__base + 2 * (int)v7);
        *((_DWORD *)v11 + 2) = 73;
        v11[3] = v9;
        if ((int)v7 <= 12)
        {
          *((_DWORD *)v11 + 4) = 49;
          v11[5] = v9;
          goto LABEL_26;
        }
      }
LABEL_45:
      v7 = 15;
      goto LABEL_46;
    }
    if ((int)v7 <= 14)
    {
      v23 = &__base + 2 * (int)v7;
      *v23 = v8;
      *((float *)v23 + 1) = v9;
      v21 = (v7 + 1);
    }
    else
    {
      v21 = v7;
    }
    if (v8 > 255 || !index("cmosuvwxyz", v8 | 0x20u))
    {
      if (v8 == 48)
      {
        if ((int)v21 > 14)
          goto LABEL_43;
        v27 = v9 * 0.5;
        v28 = (float *)(&__base + 2 * (int)v21);
        *(_DWORD *)v28 = 111;
        v28[1] = v9 * 0.5;
        if ((_DWORD)v21 == 14)
          goto LABEL_45;
        v29 = (float *)(&__base + 2 * (int)v21);
        v30 = 79;
      }
      else
      {
        if (v8 != 53)
        {
          if (v8 == 49 && (int)v21 <= 14)
          {
            v26 = (float *)(&__base + 2 * (int)v21);
            *(_DWORD *)v26 = 108;
            v26[1] = v9 * 0.25;
            v7 = (v21 + 1);
            goto LABEL_46;
          }
LABEL_43:
          v7 = v21;
          goto LABEL_46;
        }
        if ((int)v21 > 14)
          goto LABEL_43;
        v27 = v9 * 0.25;
        v31 = (float *)(&__base + 2 * (int)v21);
        *(_DWORD *)v31 = 115;
        v31[1] = v9 * 0.25;
        if ((_DWORD)v21 == 14)
          goto LABEL_45;
        v29 = (float *)(&__base + 2 * (int)v21);
        v30 = 83;
      }
      *((_DWORD *)v29 + 2) = v30;
      v29[3] = v27;
      goto LABEL_50;
    }
    if ((int)v21 > 14)
      goto LABEL_43;
    v24 = &__base + 2 * (int)v21;
    *v24 = v8 ^ 0x20;
    *((float *)v24 + 1) = v9;
    v7 = (int)v21 + 1;
    if ((v8 | 0x20) == 0x6F && (_DWORD)v21 != 14)
    {
      v25 = (float *)(&__base + 2 * v7);
      *(_DWORD *)v25 = 48;
      v25[1] = v9;
LABEL_50:
      v7 = (v21 + 2);
    }
LABEL_46:
    v5 += 4;
  }
  while (v5 != 16);
  if ((int)v7 < 15)
  {
    v33 = *(float *)(a1 + 44) / 10.0;
    v34 = (float *)(&__base + 2 * (int)v7);
    *v34 = 1.7609e-38;
    v34[1] = v33;
    v35 = v7 + 1;
    qsort(&__base, (int)v7 + 1, 8uLL, (int (__cdecl *)(const void *, const void *))clistCompare);
    v36 = (int)v7 < 1;
    LODWORD(v7) = v7 + 1;
    result = a2;
    if (!v36)
      goto LABEL_54;
  }
  else
  {
    qsort(&__base, v7, 8uLL, (int (__cdecl *)(const void *, const void *))clistCompare);
    result = a2;
LABEL_54:
    v37 = 0;
    v38 = v59;
    v39 = 1;
    v35 = v7;
    do
    {
      v40 = v37 + 1;
      if (v37 + 1 >= v35)
      {
        v41 = 0;
      }
      else
      {
        v41 = 0;
        v42 = v38;
        v43 = v39;
        v44 = &__base + 2 * v37;
        do
        {
          if (*v44 == *(_DWORD *)v42)
          {
            ++v41;
          }
          else if (v41)
          {
            *((_QWORD *)&__base + v43 - v41) = *v42;
          }
          ++v43;
          ++v42;
        }
        while (v35 > v43);
      }
      v35 -= v41;
      ++v39;
      v38 = (_OWORD *)((char *)v38 + 8);
      v37 = v40;
    }
    while (v40 < v35 - 1);
  }
  if (v35 < 1)
  {
    v52 = 0.0;
  }
  else
  {
    v45 = v35;
    v46 = &v58;
    v47 = 0.0;
    v48 = v35;
    do
    {
      v49 = *v46;
      v46 += 2;
      v47 = v47 + v49;
      --v48;
    }
    while (v48);
    v50 = v47;
    v51 = &v58;
    v52 = 0.0;
    v53 = result;
    do
    {
      *a3++ = *((_DWORD *)v51 - 1);
      v54 = *v51;
      v51 += 2;
      v55 = (int)(v54 * 100.0 / v50);
      *v53++ = v55;
      v52 = v52 + (float)v55;
      --v45;
    }
    while (v45);
  }
  *result = (int)(float)((float)(100.0 - v52) + (float)*result);
  return result;
}

float FKRecognizeConcomp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  double v7;

  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 52) = 0;
  *(_QWORD *)(a2 + 44) = 0;
  *(_DWORD *)(a2 + 60) = 0;
  v4 = *(_QWORD *)(a1 + 344);
  v5 = *(unsigned __int16 *)(a2 + 82) - *(unsigned __int16 *)(a2 + 80) + 1;
  v6 = *(unsigned __int16 *)(a2 + 86) - *(unsigned __int16 *)(a2 + 84) + 1;
  scaleCC(a1, a2, *(char **)(v4 + 32));
  **(float **)(v4 + 200) = (float)v5 / (float)v6;
  if (!espresso_plan_execute_sync())
    *(float *)&v7 = extractCandidates(a1, (float32x4_t *)a2, 0, (_QWORD *)(*(_QWORD *)(a1 + 344) + 368), v7);
  return *(float *)&v7;
}

float extractCandidates(uint64_t a1, float32x4_t *a2, int a3, _QWORD *a4, double a5)
{
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  char *__s1;
  char __s2[4];

  v6 = a4[12];
  if (v6)
  {
    v9 = 0;
    v10 = *a4 + 4 * a4[18] * a3;
    __s1 = (char *)(a1 + 40);
    while (1)
    {
      v11 = *(float *)(v10 + 4 * v9);
      v12 = FKRecognitionLabels[v9];
      if ((_DWORD)v12 != 8158332)
        break;
      *(float *)&a5 = v11 + a2[2].f32[3];
      a2[2].i32[3] = LODWORD(a5);
LABEL_14:
      if (v6 <= ++v9)
        return ccSetStr(a2, a2[1].u32[2], 1, a5);
    }
    LODWORD(a5) = a2[3].i32[3];
    if (v11 < *(float *)&a5 || v12 == 26996 && (a2[4].i32[0] == -1 || a2[4].i32[1] != -1))
      goto LABEL_14;
    *(_DWORD *)__s2 = FKRecognitionLabels[v9];
    v13 = *(_DWORD *)(a1 + 36);
    if (v13)
    {
      if (v13 == 4544069)
        goto LABEL_13;
      if ((v12 & 0x808080) == 0)
      {
        if (v12 == 92)
          goto LABEL_14;
        goto LABEL_13;
      }
    }
    if (!strstr(__s1, __s2))
    {
      if (!v13 || v13 == 4412225)
        goto LABEL_18;
      if (v12 > 10524385)
      {
        if (v12 == 10524386 || v12 == 10715362)
          goto LABEL_13;
        v14 = 10649826;
      }
      else
      {
        if (v12 == 45250 || v12 == 8755426)
          goto LABEL_13;
        v14 = 9475298;
      }
      if (v12 != v14)
      {
LABEL_18:
        if (v12 <= 41410)
        {
          if (v12 <= 35266)
          {
            if (v12 != 33219 && v12 != 33987 && v12 != 34243)
              goto LABEL_14;
            LODWORD(v12) = 65;
            goto LABEL_13;
          }
          if (v12 <= 38594)
          {
            if (v12 == 35267)
            {
              LODWORD(v12) = 69;
              goto LABEL_13;
            }
            if (v12 != 37827)
              goto LABEL_14;
            goto LABEL_55;
          }
          if (v12 == 38595)
          {
LABEL_55:
            LODWORD(v12) = 79;
            goto LABEL_13;
          }
          v16 = 39107;
LABEL_52:
          if (v12 != v16)
            goto LABEL_14;
          LODWORD(v12) = 48;
          goto LABEL_13;
        }
        if (v12 <= 43458)
        {
          if (v12 == 41411 || v12 == 42179)
          {
            LODWORD(v12) = 97;
          }
          else
          {
            v15 = v12 == 42435;
            LODWORD(v12) = 97;
            if (!v15)
              goto LABEL_14;
          }
          goto LABEL_13;
        }
        if (v12 > 46786)
        {
          if (v12 != 46787)
          {
            v16 = 47299;
            goto LABEL_52;
          }
        }
        else
        {
          if (v12 == 43459)
          {
            LODWORD(v12) = 101;
            goto LABEL_13;
          }
          if (v12 != 46019)
            goto LABEL_14;
        }
        LODWORD(v12) = 111;
      }
    }
LABEL_13:
    *(float *)&a5 = v11;
    *(float *)&a5 = candlistInsert(a2, v12, 1, a5);
    v6 = a4[12];
    goto LABEL_14;
  }
  return ccSetStr(a2, a2[1].u32[2], 1, a5);
}

uint64_t FKPrintRender(uint64_t a1, uint64_t a2)
{
  char *v2;
  int i;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v7[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = v7;
  scaleCC(a1, a2, v7);
  for (i = 0; i != 16; ++i)
  {
    v4 = 0;
    do
    {
      v5 = 799063683 * (int)llroundf(*(float *)&v2[v4] * 255.0);
      printf("%s", off_1E97DAE30[(int)((v5 >> 35) + ((unint64_t)v5 >> 63))]);
      v4 += 4;
    }
    while ((_DWORD)v4 != 64);
    result = putchar(10);
    v2 += v4;
  }
  return result;
}

void scaleCC(uint64_t a1, uint64_t a2, char *a3)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  float v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  _WORD *v17;
  unsigned int v18;
  unsigned __int16 v19;
  unsigned int v20;
  float v21;
  float v22;
  int v23;
  int v24;
  unsigned int v25;
  float v26;
  float v27;
  int v28;
  float v29;
  float v30;
  signed int v31;
  float v32;
  uint64_t v33;
  float v34;
  int v35;
  int v36;
  int v37;
  float v38;
  float v39;
  float *v40;
  float v41;
  float v42;
  int v43;
  float v44;
  float v45;
  float v46;
  int v48;
  BOOL v49;

  v6 = *(unsigned __int16 *)(a2 + 82);
  v7 = *(unsigned __int16 *)(a2 + 80);
  v8 = *(unsigned __int16 *)(a2 + 86);
  v9 = *(unsigned __int16 *)(a2 + 84);
  bzero(a3, 0x400uLL);
  v10 = *(_DWORD *)(a2 + 12);
  if (v10 != -1)
  {
    v11 = *(unsigned __int16 *)(a2 + 80);
    v12 = 16.0 / (float)(v6 - v7 + 1);
    v13 = *(_WORD *)(a2 + 84);
    v14 = *(_QWORD *)(a1 + 256);
    v15 = *(_QWORD *)(a1 + 264);
    v16 = 16.0 / (float)(v8 - v9 + 1);
    do
    {
      v17 = (_WORD *)(v14 + 8 * v10);
      v18 = (unsigned __int16)v17[3];
      v19 = *(v17 - 1) + 1;
      if (v18 >= v19)
      {
        v20 = (unsigned __int16)(*(_WORD *)(v15 + 2 * (v10 >> 6)) - v13 + (*v17 >> 2));
        v21 = (float)((float)v20 * v16) + 0.0;
        v22 = (float)((float)(int)(v20 + 1) * v16) + 0.0;
        v23 = v18 - v11;
        v24 = v19 - v11;
        v25 = vcvtms_s32_f32(v21);
        v26 = ceilf(v22);
        v27 = (float)(int)floorf(v21);
        do
        {
          v28 = v24 + 1;
          if (v26 > v27)
          {
            v29 = (float)((float)v24 * v12) + 0.0;
            v30 = (float)((float)v28 * v12) + 0.0;
            v31 = vcvtms_s32_f32(v29);
            v32 = ceilf(v30);
            v33 = v31;
            v34 = (float)(int)floorf(v29);
            v35 = v31 + 1;
            v36 = 16 * v25;
            v37 = v25;
            v38 = v27;
            do
            {
              v39 = (float)++v37;
              if (v32 > v34)
              {
                v40 = (float *)&a3[4 * v33 + 4 * v36];
                if (v22 <= v39)
                  v41 = v22;
                else
                  v41 = (float)v37;
                if (v21 >= v38)
                  v38 = v21;
                v42 = v41 - v38;
                v43 = v35;
                v44 = v34;
                do
                {
                  v45 = (float)v43;
                  if (v30 <= (float)v43)
                    v46 = (float)((float)v28 * v12) + 0.0;
                  else
                    v46 = (float)v43;
                  if (v29 >= v44)
                    v44 = (float)((float)v24 * v12) + 0.0;
                  *v40 = *v40 + (float)((float)(v46 - v44) * v42);
                  ++v40;
                  ++v43;
                  v44 = v45;
                }
                while (v32 > v45);
              }
              v36 += 16;
              v38 = (float)v37;
            }
            while (v26 > v39);
          }
        }
        while (v24++ < v23);
      }
      v48 = *(unsigned __int16 *)(v14 + 8 * v10 + 4);
      v10 -= v48;
      if (v48)
        v49 = v10 == -1;
      else
        v49 = 1;
    }
    while (!v49);
  }
}

uint64_t FKRecognizeGetLangExtrachars(uint64_t a1)
{
  char v1;
  unint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int v9;

  v1 = 0;
  v2 = 0;
  v3 = 0;
  while (1)
  {
    v4 = *(unsigned __int8 *)(a1 + v2);
    if (!*(_BYTE *)(a1 + v2) || v4 == 45)
      break;
    v5 = (char)v4 << v1;
    if (v2 >= 3)
      v5 = 0;
    v3 += v5;
    ++v2;
    v1 += 8;
  }
  if (v3 == 28261)
  {
    v6 = 0;
    return languageExtrachars[2 * v6 + 1];
  }
  else
  {
    v7 = 0;
    v8 = &dword_1E97DAE70;
    while (v7 != -14)
    {
      v9 = *v8;
      v8 += 4;
      --v7;
      if (v9 == v3)
      {
        v6 = -v7;
        return languageExtrachars[2 * v6 + 1];
      }
    }
    return 0;
  }
}

uint64_t FKRecognizeAddLanguage(uint64_t a1, _BYTE *a2)
{
  unsigned __int8 *v3;
  uint64_t result;
  int v5;
  char *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  char __src[4];
  char __s2[4];

  if (!a2)
    return 0;
  if (*a2 == 59)
  {
    v3 = a2 + 1;
  }
  else
  {
    result = FKRecognizeGetLangExtrachars((uint64_t)a2);
    v3 = (unsigned __int8 *)result;
    if (!result)
      return result;
  }
  *(_DWORD *)__src = 0;
  v5 = *v3;
  if (*v3)
  {
    v6 = (char *)(a1 + 40 + strlen((const char *)(a1 + 40)));
    do
    {
      while (1)
      {
        v7 = v3[1];
        if ((v7 & 0xC0) == 0x80)
        {
          v9 = v3[2];
          v3 += 2;
          v8 = v9;
          v10 = v9 & 0xC0;
          if (v10 == 128)
            ++v3;
          else
            v8 = 0;
        }
        else
        {
          v8 = 0;
          v7 = 0;
          ++v3;
        }
        v11 = (v7 << 8) | (v8 << 16) | v5;
        *(_DWORD *)__src = v11;
        if (!v11 || (uint64_t)&v6[-a1 - 40] > 124)
          return 1;
        *(_DWORD *)__s2 = v11;
        v12 = *(_DWORD *)(a1 + 36);
        if (!v12)
          break;
        if (v12 == 4544069)
          goto LABEL_31;
        if ((v11 & 0x808080) != 0)
          break;
        if (v11 != 92)
          goto LABEL_31;
LABEL_33:
        strcpy(v6, __src);
        v6 += strlen(__src);
        v5 = *v3;
        if (!*v3)
          return 1;
      }
      if (!strstr((char *)(a1 + 40), __s2))
      {
        if (!v12 || v12 == 4412225)
          goto LABEL_33;
        if (v11 > 10524385)
        {
          if (v11 == 10524386 || v11 == 10649826)
            goto LABEL_31;
          v13 = 10715362;
        }
        else
        {
          if (v11 == 45250 || v11 == 8755426)
            goto LABEL_31;
          v13 = 9475298;
        }
        if (v11 != v13)
          goto LABEL_33;
      }
LABEL_31:
      v5 = *v3;
    }
    while (*v3);
  }
  return 1;
}

uint64_t FKRecognizeSetLanguage(uint64_t a1, char *a2)
{
  char v2;
  char v3;
  int v4;
  uint64_t v5;
  int v6;

  *(_BYTE *)(a1 + 40) = 0;
  if (a2 && (v2 = *a2) != 0)
  {
    v3 = 0;
    v4 = 0;
    v5 = 1;
    while (v2 && v2 != 45)
    {
      v6 = v2 << v3;
      if ((unint64_t)(v5 - 1) >= 3)
        v6 = 0;
      v4 += v6;
      v2 = a2[v5++];
      v3 += 8;
    }
    *(_DWORD *)(a1 + 36) = v4;
    return FKRecognizeAddLanguage(a1, a2);
  }
  else
  {
    *(_DWORD *)(a1 + 36) = 0;
    return 1;
  }
}

uint64_t FKRecognizeSequence(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  float32x4_t *v8;
  uint64_t v9;
  int v10;
  float32x4_t *v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned __int16 *v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  unsigned __int16 *v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  double v37;
  unsigned int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  char v42;
  int v43;
  double v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  float32x4_t *v49;
  uint64_t v50;
  int v51;
  int v52;
  float v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  _DWORD *v58;
  int v59;
  int *v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  unsigned int v65;
  unsigned int v66;
  double v67;
  int64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  float32x4_t *v72;
  __int8 *v73;
  __int8 v74;
  uint64_t v75;
  int v76;
  _QWORD *v77;
  int v78;
  unsigned __int16 *v79;
  unsigned __int16 *v80;
  int v81;
  int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  char v86;
  int v87;
  int v88;
  unsigned int v89;
  unsigned int v90;
  __int32 *v91;
  int v92;
  int v93;
  unsigned __int16 *v94;
  int v95;
  int v96;
  uint64_t v97;
  int v98;
  int v99;
  int v100;
  uint64_t v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  BOOL v106;
  int v107;
  int v108;
  int v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  int64_t v114;
  _QWORD *v115;
  char *v116;
  uint64_t v117;
  unsigned __int16 *v118;
  _QWORD *v119;
  unsigned int v120;
  unsigned int v121;
  signed int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  uint64_t v127;
  int v128;
  int v129;
  float32x4_t *v130;
  _QWORD *v131;
  __int32 *v132;
  char *v133;
  int v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  unsigned __int16 *v138;
  int v139;
  unsigned int v140;
  unsigned int v141;
  unsigned int v142;
  uint64_t v144;
  int v145;
  int v146;
  BOOL v147;
  int v148;
  BOOL v149;
  int v150;
  int v151;
  float32x4_t *v152;
  char *v153;
  int v154;
  char v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  unsigned int v161;
  int v163;
  uint64_t v164;
  int v165;
  unsigned __int16 *v166;
  int v167;
  int v168;
  int v169;
  unsigned __int16 *v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  BOOL v182;
  int v183;
  int v184;
  int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  int v196;
  uint64_t v197;
  uint64_t v198;
  _BYTE *v199;
  uint64_t v200;
  int v201;
  int v202;
  unsigned int v203;
  int v204;
  int v205;
  int v206;
  unsigned int v207;
  int v208;
  int v209;
  int v210;
  uint64_t v211;
  int v212;
  int v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  char v217;
  uint64_t v218;
  uint64_t v219;
  _BOOL4 v220;
  double v221;
  BOOL v222;
  float32x4_t *v223;
  unsigned int v224;
  unsigned int v225;
  const char *v226;
  char *v227;
  uint64_t v228;
  uint64_t v229;
  int v230;
  uint64_t v231;
  uint64_t v232;
  int v233;
  uint64_t v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  int v240;
  int v241;
  unsigned int v242;
  BOOL v243;
  unsigned int v244;
  BOOL v245;
  BOOL v246;
  uint64_t v247;
  uint64_t v248;
  int v249;
  uint64_t v250;
  float32x4_t *v251;
  int v252;
  signed int v253;
  double v254;
  char v255;
  int v256;
  unsigned int v257;
  int v258;
  BOOL v259;
  int v260;
  BOOL v262;
  int v263;
  int v264;
  int v265;
  int v266;
  _BYTE *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  int v271;
  uint64_t v272;
  char *v273;
  int v274;
  int v275;
  int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  char *v281;
  uint64_t v282;
  _BOOL4 v283;
  unsigned __int16 *v285;
  unsigned __int16 *v286;
  float32x4_t *v287;
  _QWORD *v288;
  _QWORD *v289;
  __int32 *v290;
  __int32 *v291;
  __int32 *v292;
  __int32 *v293;
  char v294;
  char v295;
  int v296;
  unsigned __int16 *v297;
  int v298;
  int v299;
  int v300;
  uint64_t v301;
  uint64_t v302;
  unsigned int __s1;
  char *__s1a;
  int __s1b;
  int __s1c;
  unsigned __int8 v308;
  int __s2[16];
  char __base[4];
  uint64_t v311;

  v3 = a2;
  v4 = a1;
  v311 = *MEMORY[0x1E0C80C00];
  v308 = 0;
  LODWORD(v5) = *(_DWORD *)(a2 + 20);
  if ((int)v5 < 1)
    goto LABEL_41;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    while (1)
    {
      v9 = *(_QWORD *)(v4 + 280);
      v10 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * v6);
      v11 = (float32x4_t *)(v9 + 100 * v10);
      if ((v11[5].i8[14] & 8) != 0)
        break;
      __s2[v7++] = v10;
      if (v7 != 16)
        goto LABEL_25;
      FKRecognizeMultipleConcomps(v4, (uint64_t)__s2, 16);
      v7 = 0;
      ++v6;
      v5 = *(int *)(v3 + 20);
      v8 = v11;
      if (v6 >= v5)
        goto LABEL_41;
    }
    v12 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * v6);
    v11[1].i64[1] = 0;
    v11[2].i64[0] = 0;
    v13 = v9 + 100 * v10;
    v16 = *(unsigned __int16 *)(v13 + 80);
    v15 = (unsigned __int16 *)(v13 + 80);
    v14 = v16;
    *(_QWORD *)(v15 - 14) = 0;
    *(_QWORD *)(v15 - 18) = 0;
    *((_DWORD *)v15 - 5) = 0;
    if (v8)
    {
      if ((v8[5].i8[13] & 2) == (v8[5].i8[13] & 1))
      {
        v17 = (3 * v8[5].u16[3] + v8[5].u16[2]) >> 2;
      }
      else
      {
        v18 = v8[5].u16[2];
        v19 = v8[5].u16[3];
        v20 = (v19 + v18) >> 1;
        v21 = (3 * v19 + v18) >> 2;
        if ((v8[5].i8[13] & 1) != 0)
          v17 = v21;
        else
          v17 = v20;
      }
    }
    else
    {
      v17 = 0;
    }
    v22 = v15[1] - v14;
    v23 = v15[2];
    v24 = v15[3];
    v25 = v24 - v23 + 1;
    if (3 * v25 > 2 * (v22 + 1) || 3 * (v22 + 1) <= *(_DWORD *)(v3 + 60))
      goto LABEL_19;
    if (!v8 || v17 >= (v24 + v23 + 1) >> 1)
    {
      orderDiacriticToClusterCenters(a1, (uint64_t)v11, __base);
      if (*(unsigned __int16 *)&__base[2] == 2)
      {
        v26 = 126;
      }
      else
      {
        v27 = *(_DWORD *)(v9 + 100 * v12 + 64);
        if (v27 != -1)
        {
          v28 = v15[1] - *v15 + 2;
          v29 = (unsigned __int16 *)(*(_QWORD *)(a1 + 280) + 100 * v27);
          v30 = v29[41] - v29[40] + 2;
          if (3 * v28 >= 4 * v30
            || 3 * v30 >= 4 * v28
            || (v31 = v15[3] - v15[2] + 2, v32 = v29[43] - v29[42] + 2, 3 * v31 >= 4 * v32)
            || 3 * v32 >= 4 * v31)
          {
            v26 = 45;
          }
          else
          {
            v26 = 61;
          }
          goto LABEL_23;
        }
        v26 = 45;
      }
LABEL_38:
      v4 = a1;
      goto LABEL_24;
    }
    if (v22 >= 2 * v25)
    {
      v26 = 95;
      goto LABEL_38;
    }
LABEL_19:
    if (v24 - v23 < v22 || *(_DWORD *)(v9 + 100 * v12 + 72) >= (signed int)((v25 * v25) >> 1))
      v26 = 46;
    else
      v26 = 44;
LABEL_23:
    v4 = a1;
LABEL_24:
    *(float *)&a3 = ccSetStr(v11, v26, 1, a3);
    *(_DWORD *)(v9 + 100 * v12 + 48) = 1065353216;
    LODWORD(v5) = *(_DWORD *)(v3 + 20);
LABEL_25:
    ++v6;
    v8 = v11;
  }
  while (v6 < (int)v5);
  if (v7 > 0)
    FKRecognizeMultipleConcomps(v4, (uint64_t)__s2, v7);
LABEL_41:
  rsSetUpDownNum(v4, v3);
  v301 = v3;
  if (*(int *)(v3 + 20) < 1)
    goto LABEL_369;
  v33 = 0;
  while (2)
  {
    v34 = *(_QWORD *)(v4 + 280);
    v35 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * v33);
    v36 = *(_DWORD *)(v34 + 100 * v35 + 24);
    if (index("{}[]", v36) && (*(_BYTE *)(v34 + 100 * v35 + 93) & 2) == 0)
      goto LABEL_52;
    if (v36 == 40
      && (*(_BYTE *)(v34 + 100 * v35 + 93) & 2) == 0
      && *(unsigned __int16 *)(v34 + 100 * v35 + 86) - *(unsigned __int16 *)(v34 + 100 * v35 + 84) < ((2 * (*(unsigned __int16 *)(v34 + 100 * v35 + 82) - *(unsigned __int16 *)(v34 + 100 * v35 + 80))) | 1))
    {
      v38 = 99;
      goto LABEL_53;
    }
    v39 = v34 + 100 * v35;
    if ((*(_BYTE *)(v39 + 94) & 8) == 0)
    {
      v40 = *(unsigned __int16 *)(v39 + 82) - *(unsigned __int16 *)(v39 + 80);
      if (v40 <= 3
        && *(unsigned __int16 *)(v34 + 100 * v35 + 86) - *(unsigned __int16 *)(v34 + 100 * v35 + 84) >= 3 * v40 + 2)
      {
LABEL_52:
        v38 = 124;
LABEL_53:
        ccSetStr((float32x4_t *)(v34 + 100 * v35), v38, 1, v37);
      }
    }
    ++v33;
    v41 = *(int *)(v3 + 20);
    if (v33 < v41)
      continue;
    break;
  }
  __s2[0] = 0;
  if ((int)v41 >= 1)
  {
    v42 = 0;
    v43 = 0;
    do
    {
      if (shouldTestSplit(*(_QWORD *)(v4 + 280) + 100 * *(int *)(*(_QWORD *)(v3 + 8) + 4 * v43)))
      {
        if (trySplit((_QWORD *)v4, v3, __s2))
          v42 = 1;
        v43 = __s2[0];
      }
      __s2[0] = ++v43;
      LODWORD(v45) = *(_DWORD *)(v3 + 20);
    }
    while (v43 < (int)v45);
    v308 = v42;
    if ((int)v45 >= 1)
    {
      v46 = 0;
      do
      {
        v47 = *(_QWORD *)(v4 + 280);
        v48 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * v46);
        v49 = (float32x4_t *)(v47 + 100 * v48);
        if ((v49[1].i32[2] & 0xFFFFFFDF) == 0x5A)
        {
          v50 = v47 + 100 * v48;
          v51 = *(_DWORD *)(v50 + 64) == -1 ? 6 : 9;
          if (v51 + v51 * (*(unsigned __int16 *)(v50 + 86) - *(unsigned __int16 *)(v50 + 84)) >= 16
                                                                                                * (*(unsigned __int16 *)(v50 + 82)
                                                                                                 - *(unsigned __int16 *)(v50 + 80))
                                                                                                + 16
            && 5 * *(_DWORD *)(v3 + 60) > 3 * *(_DWORD *)(v3 + 52))
          {
            *(float *)&v44 = ccSetStr(v49, 0x6Cu, 1, v44);
            LODWORD(v45) = *(_DWORD *)(v3 + 20);
          }
        }
        ++v46;
      }
      while (v46 < (int)v45);
      if ((int)v45 >= 3)
      {
        v52 = 0;
        do
        {
          v53 = *(float *)(*(_QWORD *)(v4 + 280) + 100 * *(int *)(*(_QWORD *)(v3 + 8) + 4 * v52) + 48);
          if (v53 > 0.0)
          {
            v44 = v53;
            if (v44 > 0.1 || v52 && v52 != (_DWORD)v45 - 1)
              goto LABEL_79;
          }
          FKSequenceRemoveConcomp(v4, v3, v52--);
          LODWORD(v45) = *(_DWORD *)(v3 + 20);
          v42 = 1;
LABEL_79:
          if ((int)v45 < 3)
            break;
          ++v52;
        }
        while (v52 < (int)v45);
        v308 = v42;
        if ((int)v45 >= 3)
        {
          v294 = v42;
          v54 = 1;
          while (1)
          {
            v55 = *(_QWORD *)(v4 + 280);
            v56 = *(_QWORD *)(v3 + 8);
            v57 = *(_DWORD *)(v56 + 4 * v54);
            v58 = (_DWORD *)(v55 + 100 * v57);
            if (v58[10] == 47)
            {
              v60 = v58 + 16;
              v59 = v58[16];
              v61 = v59 != -1;
              if (v58[17] != -1)
                ++v61;
              if (v61 == 1)
              {
                v63 = a1;
                v65 = combineSlash(a1, *(_DWORD *)(v56 + 4 * v54), *(_DWORD *)(v56 + 4 * (v54 - 1)), v59);
                if (v65)
                {
                  __s1 = v65;
                  v64 = v54 - 1;
                  v60 = v58 + 17;
                  --v54;
                }
                else
                {
                  v66 = combineSlash(a1, *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * v54), *v60, *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * (v54 + 1)));
                  if (!v66)
                    goto LABEL_95;
                  __s1 = v66;
                  v64 = v54 + 1;
                  v60 = v58 + 17;
                  v63 = a1;
                }
              }
              else
              {
                if (v61)
                  goto LABEL_95;
                v62 = combineSlash(a1, v57, *(_DWORD *)(v56 + 4 * (v54 - 1)), *(_DWORD *)(v56 + 4 * (v54 + 1)));
                if (!v62)
                  goto LABEL_95;
                __s1 = v62;
                v63 = a1;
                v58[17] = FKSequenceRemoveConcomp(a1, v3, v54 + 1);
                v64 = --v54;
              }
              *v60 = FKSequenceRemoveConcomp(v63, v3, v64);
              *(_BYTE *)(v55 + 100 * v57 + 94) |= 0x20u;
              *(_BYTE *)(v3 + 93) = 0;
              v294 = 1;
              *(float *)&v44 = ccSetStr((float32x4_t *)(v55 + 100 * v57), __s1, 1, v67);
            }
LABEL_95:
            ++v54;
            LODWORD(v45) = *(_DWORD *)(v3 + 20);
            v4 = a1;
            if (v54 >= (int)v45 - 1)
            {
              v42 = v294;
              v308 = v294;
              break;
            }
          }
        }
      }
      if ((int)v45 < 1)
        goto LABEL_369;
      v295 = v42;
      v68 = 0;
      __s1a = (char *)(v4 + 40);
      while (2)
      {
        v69 = *(_QWORD *)(a1 + 280);
        v70 = *(_QWORD *)(v3 + 8);
        v71 = *(_DWORD *)(v70 + 4 * v68);
        v72 = (float32x4_t *)(v69 + 100 * v71);
        v73 = &v72[5].i8[14];
        v74 = v72[5].i8[14];
        if ((v74 & 0x20) != 0)
          goto LABEL_320;
        v75 = v69 + 100 * v71;
        v78 = *(_DWORD *)(v75 + 64);
        v77 = (_QWORD *)(v75 + 64);
        v76 = v78;
        v79 = (unsigned __int16 *)v77 + 10;
        v80 = (unsigned __int16 *)v77 + 11;
        if (v78 != -1)
        {
          v81 = 0;
          v82 = 0;
          v83 = 0;
          v84 = *v80;
          v85 = *v79;
          v86 = 1;
          v87 = v76;
          while (1)
          {
            v88 = v87;
            v89 = *(unsigned __int16 *)(v69 + 100 * v87 + 86);
            if ((v84 + v85 + 1) >> 1 >= v89)
              ++v82;
            if (v89 <= v85)
            {
              ++v81;
              if ((v86 & 1) == 0)
                goto LABEL_112;
            }
            else
            {
              if (*(unsigned __int16 *)(v69 + 100 * v88 + 84) >= v84)
                ++v83;
              if ((v86 & 1) == 0)
              {
LABEL_112:
                v90 = *(unsigned __int16 *)(v69 + 100 * v88 + 80);
                goto LABEL_114;
              }
            }
            v86 = 0;
            v87 = *(_DWORD *)(v69 + 100 * v71 + 68);
            if (v87 == -1)
              goto LABEL_112;
          }
        }
        v81 = 0;
        v82 = 0;
        v83 = 0;
        v90 = 0;
LABEL_114:
        v91 = &v72[2].i32[2];
        v92 = v72[2].i32[2];
        v93 = v76;
        if (v92 > 85)
        {
          if (v92 <= 122)
          {
            switch(v92)
            {
              case 'V':
                if (v83 == 1)
                  v92 = 33;
                else
                  v92 = 86;
                goto LABEL_250;
              case '[':
                if ((*(_BYTE *)(v69 + 100 * v71 + 93) & 3) != 0)
                  goto LABEL_161;
                v92 = 116;
                goto LABEL_250;
              case '\\':
              case ']':
              case 'f':
              case 'i':
              case 'j':
              case 'l':
                goto LABEL_161;
              case 'h':
                v92 = 104;
                if (v82 != 1 || v81)
                  goto LABEL_250;
                *v73 = v74 | 0x20;
                v92 = 26988;
                goto LABEL_311;
              case 'm':
                goto LABEL_157;
              case 'n':
                if (v81 != 1)
                {
                  v92 = 110;
                  goto LABEL_250;
                }
                if (v90 > (*(unsigned __int16 *)(v69 + 100 * v71 + 82)
                          + *(unsigned __int16 *)(v69 + 100 * v71 + 80)
                          + 1) >> 1)
                {
                  v92 = 26994;
                  goto LABEL_201;
                }
                v92 = 110;
                break;
              default:
                goto LABEL_250;
            }
LABEL_202:
            v117 = v69 + 100 * v93;
LABEL_260:
            if ((v92 - 97) <= 0x19)
            {
              v299 = v93;
              v126 = -71;
              goto LABEL_262;
            }
            goto LABEL_311;
          }
          if (v92 <= 28273)
          {
            if ((v92 - 123) >= 3)
              goto LABEL_250;
LABEL_161:
            if (v81 != 1)
            {
              if (v81)
                goto LABEL_250;
              if (v83)
              {
                if (v83 != 1)
                  goto LABEL_254;
                v297 = (unsigned __int16 *)v77 + 11;
                v286 = (unsigned __int16 *)v77 + 10;
                v288 = v77;
                v100 = v76;
                v290 = &v72[2].i32[2];
                if (diacriticLooksLikeDot(a1, v76))
                {
                  v101 = v69 + 100 * v71;
                  v102 = *(unsigned __int16 *)(v101 + 80);
                  LODWORD(v101) = *(unsigned __int16 *)(v101 + 82);
                  v103 = 3
                       * ((*(unsigned __int16 *)(v69 + 100 * v100 + 82)
                         + *(unsigned __int16 *)(v69 + 100 * v100 + 80)
                         + 1) >> 1);
                  v104 = v102 + 2 * v101;
                  v105 = v101 + 2 * v102;
                  v106 = v103 <= v104 && v103 >= v105;
                  v72 = (float32x4_t *)(v69 + 100 * v71);
                  v77 = v288;
                  v91 = v290;
                  v79 = v286;
                  v80 = v297;
                  if (v106)
                  {
                    *v73 = v74 | 0x20;
                    v92 = 33;
                    goto LABEL_311;
                  }
LABEL_254:
                  if (v92 != 108)
                    goto LABEL_311;
                  LOBYTE(v107) = *(_BYTE *)(v69 + 100 * v71 + 93);
LABEL_256:
                  if ((v107 & 1) != 0)
                  {
                    v92 = 108;
                  }
                  else if (*v80 - *v79 >= 15)
                  {
                    v92 = 108;
                  }
                  else
                  {
                    v92 = 105;
                  }
                  goto LABEL_311;
                }
                v72 = (float32x4_t *)(v69 + 100 * v71);
                v77 = v288;
                v91 = v290;
                v79 = v286;
              }
              else
              {
                if (v92 == 106)
                {
                  if (17
                     * (*(unsigned __int16 *)(v69 + 100 * v71 + 82) - *(unsigned __int16 *)(v69 + 100 * v71 + 80))
                     + 13 >= 4 * (*v80 - *v79)
                    || (v107 = *(unsigned __int8 *)(v69 + 100 * v71 + 93), (~v107 & 3) == 0))
                  {
                    v92 = 74;
                    goto LABEL_311;
                  }
                  if ((v107 & 2) != 0)
                  {
                    v92 = 106;
                    goto LABEL_311;
                  }
                  goto LABEL_256;
                }
                v297 = (unsigned __int16 *)v77 + 11;
                v118 = (unsigned __int16 *)v77 + 10;
                v292 = &v72[2].i32[2];
                v119 = v77;
                if (index("{}", v92))
                {
                  v72 = (float32x4_t *)(v69 + 100 * v71);
                  v77 = v119;
                  v91 = v292;
                  v79 = v118;
                  v80 = v297;
                  if ((v72[5].i8[13] & 2) == 0)
                  {
                    v92 = 124;
                    goto LABEL_311;
                  }
                  goto LABEL_254;
                }
                v72 = (float32x4_t *)(v69 + 100 * v71);
                v77 = v119;
                v91 = v292;
                v79 = v118;
              }
              v80 = v297;
              goto LABEL_254;
            }
            if ((*(_BYTE *)(v69 + 100 * v71 + 93) & 2) == 0)
            {
              if ((*(_BYTE *)(v69 + 100 * v71 + 93) & 1) == 0)
                goto LABEL_174;
LABEL_251:
              if (v92 >= 65)
              {
                v117 = v69 + 100 * v76;
                if (v92 >= 0x5B)
                  goto LABEL_260;
                v299 = v93;
                v126 = -65;
LABEL_262:
                v127 = (v126 + v92);
                if (v81 == 2)
                {
                  v128 = unicodeCharWithDiacritic[8 * v127 + 7];
                  if (v128)
                  {
                    __s2[0] = v128;
                    v129 = *(_DWORD *)(a1 + 36);
                    if (!v129)
                      goto LABEL_267;
                    if (v129 == 4544069)
                      goto LABEL_309;
                    if ((v128 & 0x808080) == 0)
                    {
                      if (v128 != 92)
                        goto LABEL_309;
                    }
                    else
                    {
LABEL_267:
                      v130 = v72;
                      v131 = v77;
                      v132 = v91;
                      v133 = strstr(__s1a, (const char *)__s2);
                      v91 = v132;
                      v77 = v131;
                      v72 = v130;
                      if (v133)
                        goto LABEL_309;
                      if (v129 && v129 != 4412225)
                      {
                        if (v128 > 10524385)
                        {
                          if (v128 == 10524386 || v128 == 10715362)
                            goto LABEL_309;
                          v134 = 10649826;
                        }
                        else
                        {
                          if (v128 == 45250 || v128 == 8755426)
                            goto LABEL_309;
                          v134 = 9475298;
                        }
                        if (v128 == v134)
                        {
LABEL_309:
                          if (v128 != v92)
                          {
                            *v73 |= 0x20u;
                            v92 = v128;
                          }
                        }
                      }
                    }
                  }
                }
                else
                {
                  v135 = v69 + 100 * v71;
                  v136 = *(unsigned __int16 *)(v135 + 80);
                  LODWORD(v135) = *(unsigned __int16 *)(v135 + 82);
                  v137 = v69 + 100 * v299;
                  v139 = *(unsigned __int16 *)(v137 + 80);
                  v138 = (unsigned __int16 *)(v137 + 80);
                  v140 = 3 * ((v138[1] + v139 + 1) >> 1);
                  v141 = v136 + 2 * v135;
                  v142 = v135 + 2 * v136;
                  if (v140 <= v141 && v140 >= v142)
                  {
                    v285 = v138;
                    v287 = v72;
                    v289 = v77;
                    v293 = v91;
                    orderDiacriticToClusterCenters(a1, v117, (char *)__s2);
                    v144 = 2;
                    while (1)
                    {
                      v145 = unicodeCharWithDiacritic[8 * v127 + *(unsigned __int16 *)((char *)__s2 + v144)];
                      if (v145)
                      {
                        *(_DWORD *)__base = unicodeCharWithDiacritic[8 * v127
                                                                   + *(unsigned __int16 *)((char *)__s2 + v144)];
                        v146 = *(_DWORD *)(a1 + 36);
                        if (!v146)
                          goto LABEL_301;
                        if (v146 == 4544069)
                          goto LABEL_305;
                        if ((v145 & 0x808080) == 0)
                        {
                          if (v145 != 92)
                            goto LABEL_305;
                        }
                        else
                        {
LABEL_301:
                          if (strstr(__s1a, __base)
                            || v146
                            && v146 != 4412225
                            && (v145 > 10524385
                              ? (v145 != 10524386 ? (v147 = v145 == 10715362) : (v147 = 1), v148 = 10649826)
                              : (v145 != 45250 ? (v147 = v145 == 8755426) : (v147 = 1), v148 = 9475298),
                                !v147 ? (v149 = v145 == v148) : (v149 = 1),
                                v149))
                          {
LABEL_305:
                            v150 = v285[1] - *v285 + 1;
                            if (3 * *(_DWORD *)(v69 + 100 * v299 + 72) >= v150
                                                                           + v150
                                                                           * (*(unsigned __int16 *)(v69
                                                                                                  + 100 * v299
                                                                                                  + 86)
                                                                            - *(unsigned __int16 *)(v69
                                                                                                  + 100 * v299
                                                                                                  + 84)))
                              v128 = v145;
                            else
                              v128 = v92;
LABEL_308:
                            v72 = v287;
                            v77 = v289;
                            v91 = v293;
                            goto LABEL_309;
                          }
                        }
                      }
                      v144 += 4;
                      if (v144 == 54)
                      {
                        v128 = v92;
                        goto LABEL_308;
                      }
                    }
                  }
                }
              }
LABEL_311:
              if ((*v73 & 0x20) == 0 && *(_DWORD *)v77 != -1)
              {
                v44 = NAN;
                *v77 = -1;
                *(_BYTE *)(v3 + 93) = 0;
              }
              if (v92 != *v91)
              {
                __s2[0] = v92;
                v151 = *(_DWORD *)(a1 + 36);
                if (!v151)
                  goto LABEL_318;
                if (v151 == 4544069)
                  goto LABEL_319;
                if ((v92 & 0x808080) != 0)
                {
LABEL_318:
                  v152 = v72;
                  v153 = strstr(__s1a, (const char *)__s2);
                  v72 = v152;
                  if (v153)
                    goto LABEL_319;
                  if (v151 && v151 != 4412225)
                  {
                    if (v92 <= 10524385)
                    {
                      if (v92 != 45250 && v92 != 8755426)
                      {
                        v154 = 9475298;
                        goto LABEL_333;
                      }
                      goto LABEL_319;
                    }
                    if (v92 == 10524386 || v92 == 10715362)
                      goto LABEL_319;
                    v154 = 10649826;
LABEL_333:
                    if (v92 == v154)
LABEL_319:
                      *(float *)&v44 = ccSetStr(v72, v92, 2, v44);
                  }
                }
                else if (v92 != 92)
                {
                  goto LABEL_319;
                }
              }
LABEL_320:
              ++v68;
              v45 = *(int *)(v3 + 20);
              if (v68 < v45)
                continue;
              v4 = a1;
              v155 = v295;
              if ((int)v45 < 1)
                goto LABEL_369;
              v156 = 0;
              LODWORD(v157) = 0;
              v158 = 0;
              while (2)
              {
                v159 = *(_QWORD *)(v4 + 280);
                v160 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * (int)v157);
                if (!v158)
                  goto LABEL_367;
                v161 = *(_DWORD *)(v159 + 100 * v160 + 40);
                if (!v156 || (*(_BYTE *)(v159 + 100 * v160 + 94) & 8) == 0)
                {
                  if (v161 <= 0x2E && ((1 << v161) & 0x508400000000) != 0)
                  {
                    if (*(_DWORD *)(v159 + 100 * v160 + 64) != -1)
                      break;
                    if (v161 == 39)
                    {
                      if (*(_DWORD *)(v158 + 40) == 39)
                      {
                        *(_DWORD *)(v158 + 64) = v160;
                        FKSequenceRemoveConcomp(a1, v301, v157);
                        v4 = a1;
                        *(_BYTE *)(v159 + 100 * v160 + 94) = 1;
                        *(_DWORD *)(v158 + 40) = 34;
                        v157 = (int)v157 - 1;
                        v3 = v301;
                        v163 = *(_DWORD *)(*(_QWORD *)(v301 + 8) + 4 * v157);
                        v164 = *(_QWORD *)(a1 + 280);
                        v165 = *(_DWORD *)(v164 + 100 * v163 + 64);
                        if (v165 != -1 && *(_DWORD *)(v164 + 100 * v163 + 68) == -1)
                        {
                          v166 = (unsigned __int16 *)(v164 + 100 * v163);
                          v167 = v166[43];
                          v168 = v166[42];
                          v169 = v167 - v168 + 1;
                          v170 = (unsigned __int16 *)(v164 + 100 * v165);
                          v171 = v170[43];
                          v172 = v170[42];
                          v173 = v171 - v172 + 1;
                          v174 = 30 * (v169 - v173);
                          v175 = v173 + v169;
                          v176 = v174 / (v175 + 3) * (v174 / (v175 + 3));
                          v177 = v166[41];
                          LODWORD(v166) = v166[40];
                          v178 = v177 - (_DWORD)v166 + 1;
                          v179 = v170[41];
                          LODWORD(v170) = v170[40];
                          v180 = v179 - (_DWORD)v170 + 1;
                          v181 = 30 * (v178 - v180);
                          v182 = __OFADD__(v180, v178);
                          v183 = v180 + v178;
                          v184 = v181 / (v183 + 3);
                          v185 = (int)(40
                                     * (((v167 + v168 + 1) >> 1) - ((v171 + v172 + 1) >> 1)))
                               / (v175 + 3);
                          v186 = v177 + (_DWORD)v166 + 1;
                          v187 = (v179 + (_DWORD)v170 + 1) >> 1;
                          v188 = v183 < 0 != v182 ? v183 + 1 : v183;
                          v189 = (int)(20 * (v187 - ((v188 >> 1) + (v186 >> 1)))) / (v183 + 3);
                          v190 = v176 + v184 * v184 + v185 * v185 + v189 * v189;
                          v191 = 30 * (2 * v175 - 3 * v183) / (3 * v183 + 2 * v175 + 3);
                          if ((v190 + v191 * v191) <= 0x63)
                          {
                            v156 = 0;
                            v155 = 1;
                            goto LABEL_367;
                          }
                        }
LABEL_353:
                        FKSequenceRemoveConcomp(v4, v3, v157);
                        LODWORD(v157) = v157 - 1;
                        v155 = 1;
                        v156 = 1;
                        goto LABEL_367;
                      }
LABEL_366:
                      v156 = 0;
                      v4 = a1;
LABEL_367:
                      v158 = v159 + 100 * v160;
                      LODWORD(v157) = v157 + 1;
                      if ((int)v157 >= *(_DWORD *)(v3 + 20))
                      {
                        v308 = v155;
                        goto LABEL_369;
                      }
                      continue;
                    }
                  }
                  if ((v161 & 0xFFFFFFFE) != 0x3A
                    || (*(_BYTE *)(v158 + 94) & 8) != 0
                    || *(unsigned __int16 *)(v158 + 84) <= (*(unsigned __int16 *)(v159 + 100 * v160 + 86)
                                                          + *(unsigned __int16 *)(v159 + 100 * v160 + 84)
                                                          + 1) >> 1)
                  {
                    goto LABEL_366;
                  }
                }
                break;
              }
              v4 = a1;
              goto LABEL_353;
            }
            if (v92 != 124)
              goto LABEL_200;
            __s2[0] = 41410;
            if (*(_DWORD *)(a1 + 36) == 4544069)
              goto LABEL_199;
            v298 = v76;
            v115 = v77;
            v291 = &v72[2].i32[2];
            v116 = strstr(__s1a, (const char *)__s2);
            v91 = v291;
            v77 = v115;
            v72 = (float32x4_t *)(v69 + 100 * v71);
            v93 = v298;
            if (v116)
LABEL_199:
              v92 = 41410;
            else
LABEL_200:
              v92 = 106;
LABEL_201:
            *v73 = v74 | 0x20;
            goto LABEL_202;
          }
          switch(v92)
          {
            case 28274:
LABEL_157:
              if (v81 != 1)
                break;
              v97 = v69 + 100 * v71;
              v98 = *(unsigned __int16 *)(v97 + 80);
              v99 = *(unsigned __int16 *)(v97 + 82);
              if ((1431655766 * (unint64_t)(v98 + 2 * v99)) >> 32 >= v90)
              {
                if ((1431655766 * (unint64_t)(v99 + 2 * v98)) >> 32 <= v90)
                  goto LABEL_202;
                v92 = 28265;
              }
              else
              {
                v92 = 6910578;
              }
              goto LABEL_201;
            case 29810:
              if (v82 == 1)
              {
                *v73 = v74 | 0x20;
                v92 = 29801;
              }
              else
              {
                v92 = 29810;
              }
              break;
            case 29812:
              if (v82 == 1)
              {
                *v73 = v74 | 0x20;
                v92 = 26996;
              }
              else
              {
                v92 = 29812;
              }
              break;
          }
LABEL_250:
          if (v81 < 1)
            goto LABEL_254;
          goto LABEL_251;
        }
        break;
      }
      if (v92 > 54)
      {
        if (v92 > 72)
        {
          if ((v92 - 73) < 2)
            goto LABEL_161;
          if (v92 == 76 && (*(_BYTE *)(v69 + 100 * v71 + 93) & 1) == 0 && v81 == 1)
          {
LABEL_174:
            v92 = 105;
            goto LABEL_201;
          }
          goto LABEL_250;
        }
        if (v92 != 55 && v92 != 63)
        {
          if (v92 == 68 && (*(_BYTE *)(v69 + 100 * v71 + 93) & 1) == 0 && !v81 && v83 == 1)
          {
            *v73 = v74 | 0x20;
            v92 = 112;
            goto LABEL_311;
          }
          goto LABEL_250;
        }
      }
      else
      {
        if (v92 <= 45)
        {
          if (v92 == 33 || v92 == 41)
            goto LABEL_161;
          if (v92 != 44)
            goto LABEL_250;
          goto LABEL_140;
        }
        if (v92 <= 48)
        {
          if (v92 != 46)
          {
            if (v92 != 47)
              goto LABEL_250;
            goto LABEL_161;
          }
LABEL_140:
          if (v83 == 1)
          {
            v94 = (unsigned __int16 *)(v69 + 100 * v76);
            v95 = v94[41] - v94[40];
            v96 = v94[43] - v94[42];
            if (v96 >= v95)
            {
              if (*(_DWORD *)(v69 + 100 * v76 + 72) >= (signed int)(((v96 + 1) * (v96 + 1)) >> 1))
                v92 = 58;
              else
                v92 = 59;
            }
            else
            {
              v92 = 58;
            }
            *v73 = v74 | 0x20;
            goto LABEL_250;
          }
          v108 = *v80;
          v109 = *v79;
          v110 = v68;
          if (v68)
          {
            do
            {
              v111 = v69 + 100 * *(int *)(v70 + 4 * (v110 - 1));
              if ((*(_BYTE *)(v111 + 94) & 8) != 0)
                v112 = 0;
              else
                v112 = v69 + 100 * *(int *)(v70 + 4 * (v110 - 1));
              v113 = v112 == 0;
              if (v110 < 2)
                break;
              --v110;
            }
            while (!v112);
            LODWORD(v114) = v68 + 1;
            if (v68 + 1 < (int)v45)
            {
              v45 = (int)v45;
              goto LABEL_219;
            }
            if (!v112)
              goto LABEL_250;
LABEL_237:
            v120 = *(unsigned __int16 *)(v111 + 84);
            v121 = *(unsigned __int16 *)(v111 + 86);
          }
          else
          {
            if ((int)v45 <= 1)
              goto LABEL_250;
            v112 = 0;
            LODWORD(v114) = 1;
            v113 = 1;
            v45 = v45;
LABEL_219:
            v114 = (int)v114;
            do
            {
              v111 = v69 + 100 * *(int *)(v70 + 4 * v114);
              if ((*(_BYTE *)(v111 + 94) & 8) != 0)
                v111 = 0;
              ++v114;
            }
            while (v114 < v45 && !v111);
            if (v113)
            {
              if (!v111)
                goto LABEL_250;
              goto LABEL_237;
            }
            if (!v111)
            {
              v111 = v112;
              goto LABEL_237;
            }
            v120 = (*(unsigned __int16 *)(v111 + 84) + *(unsigned __int16 *)(v112 + 84)) >> 1;
            v121 = (*(unsigned __int16 *)(v111 + 86) + *(unsigned __int16 *)(v112 + 86)) >> 1;
          }
          v106 = v121 >= v120;
          v122 = v121 - v120;
          if (v122 != 0 && v106 && (int)(100 * (((v108 + v109 + 1) >> 1) - v120)) / v122 <= 39)
          {
            v123 = *(unsigned __int16 *)(v69 + 100 * v71 + 82) - *(unsigned __int16 *)(v69 + 100 * v71 + 80);
            v124 = v108 - v109;
            if (*(_DWORD *)(a1 + 36) == 4412225 || *(_WORD *)(v69 + 100 * v71 + 88) != 1)
              goto LABEL_247;
            v125 = v123 - v124;
            if (v123 - v124 < 0)
              v125 = v124 - v123;
            if (200 * v125 / (v123 + 1 + v124 + 1) >= 20)
            {
LABEL_247:
              if (v123 <= v124)
                v92 = 39;
              else
                v92 = 34;
            }
            else
            {
              v92 = 45250;
            }
          }
          goto LABEL_250;
        }
        if (v92 == 49)
          goto LABEL_161;
        if (v92 != 50)
          goto LABEL_250;
      }
      if (v83 == 1)
      {
        *v73 = v74 | 0x20;
        v92 = 63;
      }
      goto LABEL_250;
    }
  }
LABEL_369:
  __s1b = computeSpaceLimit(v4, (_DWORD *)v3);
  if (*(int *)(v3 + 20) >= 1)
  {
    v192 = 0;
    while (!v192)
    {
LABEL_402:
      if (++v192 >= *(int *)(v3 + 20))
        goto LABEL_403;
    }
    v193 = *(_QWORD *)(v3 + 8);
    v194 = v4;
    v195 = *(_DWORD *)(v193 + 4 * v192);
    v196 = *(_DWORD *)(v193 + 4 * (v192 - 1));
    v197 = *(_QWORD *)(v194 + 280);
    v198 = v197 + 100 * v195;
    *(_BYTE *)(v198 + 95) = 0;
    v199 = (_BYTE *)(v198 + 95);
    v200 = v197 + 100 * v196;
    v201 = *(_DWORD *)(v200 + 40);
    v202 = *(unsigned __int16 *)(v199 - 15);
    v203 = *(unsigned __int16 *)(v200 + 82);
    v204 = v202 - v203;
    if (v201 == 26214 || v201 == 102)
    {
      v208 = v203 - *(unsigned __int16 *)(v200 + 80) + 1;
      if (3 * *(_DWORD *)(v3 + 60) >= 4 * v208)
        goto LABEL_383;
      v209 = ((int)(((unint64_t)(1431655765 * v208) >> 32) - v208) >> 1)
           + ((((unint64_t)(1431655765 * v208) >> 32) - v208) >> 31)
           + __s1b;
      if (__s1b / 2 <= v209)
        v206 = v209;
      else
        v206 = __s1b / 2;
    }
    else
    {
      if (v201 != 34)
        goto LABEL_383;
      v205 = *(_DWORD *)(v197 + 100 * v196 + 64);
      v206 = __s1b;
      if (v205 != -1)
      {
        v207 = *(unsigned __int16 *)(v197 + 100 * v205 + 82);
        if (v203 < v207)
          v204 = v202 - v207;
LABEL_383:
        v206 = __s1b;
      }
    }
    v210 = *(_DWORD *)(v199 - 55);
    if ((v210 & 0xFFFFFFDF) == 0x4A && (*(_BYTE *)(v197 + 100 * v195 + 93) & 2) != 0)
    {
      v211 = v197 + 100 * v195;
      v296 = *(unsigned __int16 *)(v211 + 86);
      v300 = *(unsigned __int16 *)(v199 - 13);
      v212 = *(unsigned __int16 *)(v211 + 84);
      if (!index("ijl", v201) && v296 - v212 < 3 * (v300 - v202) + 2)
        v206 = 2 * v206 / 3;
      v3 = v301;
    }
    if (index("ALRB", v201) && index("TVWY", v210) || index("TVWY", v201) && v210 == 65)
      v206 = 2 * v206 / 3;
    if ((*(_BYTE *)(v197 + 100 * v195 + 94) & 8) != 0)
    {
      if (v206 >= 0)
        v213 = v206;
      else
        v213 = v206 + 1;
      v206 += v213 >> 1;
    }
    v4 = a1;
    if (v204 > v206)
      *v199 = 1;
    goto LABEL_402;
  }
LABEL_403:
  rsSetUpDownNum(v4, v3);
  LODWORD(v4) = *(_DWORD *)(v3 + 20);
  if ((v4 & 0x80000000) == 0)
  {
    v214 = 0;
    LODWORD(v215) = 0;
    __s1c = 0;
    v216 = 0;
    v217 = 1;
    while (1)
    {
      v218 = v216;
      if (v214 >= (int)v4)
      {
        v216 = 0;
        v219 = a1;
      }
      else
      {
        v219 = a1;
        v216 = *(_QWORD *)(a1 + 280) + 100 * *(int *)(*(_QWORD *)(v3 + 8) + 4 * v214);
      }
      v302 = v218;
      v220 = isWordBoundary(v218, v216);
      if (v220)
      {
        v222 = (_DWORD)v214 - (_DWORD)v215 == 4 || __s1c == 0;
        __s1c = 0;
        if (v222)
        {
          if (v217)
          {
            if ((int)v214 - (int)v215 >= 2)
            {
              v215 = (int)v215;
              if (v214 > (int)v215)
              {
                while (1)
                {
                  v223 = (float32x4_t *)(*(_QWORD *)(v219 + 280) + 100 * *(int *)(*(_QWORD *)(v3 + 8) + 4 * v215));
                  v224 = v223[2].i32[2] - 48;
                  if (v224 <= 0x3F)
                  {
                    if (((1 << v224) & 0x1000000002000002) != 0)
                    {
                      v225 = 49;
                      goto LABEL_422;
                    }
                    if (((1 << v224) & 0x8000000080000001) != 0)
                    {
                      v225 = 48;
LABEL_422:
                      *(float *)&v221 = ccSetStr(v223, v225, 0, v221);
                    }
                  }
                  if (v214 == ++v215)
                  {
                    __s1c = 0;
                    break;
                  }
                }
              }
            }
          }
        }
        v217 = 1;
        LODWORD(v215) = v214;
      }
      if (!v216)
        break;
      if ((_DWORD)v214 - (_DWORD)v215 == 3)
      {
        v226 = (const char *)(v216 + 40);
        v227 = "mM";
      }
      else
      {
        if ((_DWORD)v214 - (_DWORD)v215 != 2)
          goto LABEL_433;
        v226 = (const char *)(v216 + 40);
        v227 = "aApP";
      }
      if (!strstr(v227, v226))
      {
LABEL_433:
        if (!strstr("oO0l1I$", (const char *)(v216 + 40))
          || !v220 && ((*(unsigned __int8 *)(v302 + 93) ^ *(unsigned __int8 *)(v216 + 93)) & 1) != 0)
        {
          v217 = 0;
        }
        if (*(_DWORD *)(v216 + 24) == 73)
          v217 = 0;
        goto LABEL_439;
      }
      __s1c = 1;
LABEL_439:
      v4 = *(int *)(v3 + 20);
      v243 = v214++ < v4;
      if (!v243)
        goto LABEL_442;
    }
    LODWORD(v4) = *(_DWORD *)(v3 + 20);
LABEL_442:
    if ((int)v4 >= 1)
    {
      v228 = 0;
      while (2)
      {
        v229 = *(_QWORD *)(v3 + 8);
        v230 = *(_DWORD *)(v229 + 4 * v228);
        v231 = *(_QWORD *)(a1 + 280);
        v232 = v231 + 100 * v230;
        v235 = *(_DWORD *)(v232 + 40);
        v234 = v232 + 40;
        v233 = v235;
        v236 = *(unsigned __int16 *)(v234 + 46) - *(unsigned __int16 *)(v234 + 44);
        v237 = *(unsigned __int16 *)(v234 + 42);
        v238 = *(unsigned __int16 *)(v234 + 40);
        if (v236 < ((8 * (v237 - v238)) | 7) || (~*(unsigned __int8 *)(v231 + 100 * v230 + 93) & 3) != 0)
        {
          if (v228)
          {
            v239 = *(unsigned __int8 *)(v231 + 100 * v230 + 95);
LABEL_453:
            if (v239)
            {
              v240 = *(_DWORD *)(v229 + 4 * v228 - 4);
              v241 = *(_DWORD *)(v231 + 100 * v240 + 40);
              v242 = v233 - 48;
              v243 = (v241 - 48) >= 0xA && v242 > 9;
              if (!v243)
              {
                v244 = v233 - 41;
                v245 = v244 > 0x34 || ((1 << v244) & 0x10000000000101) == 0;
                if (!v245 && 10 * (v237 - *(unsigned __int16 *)(v231 + 100 * v240 + 82)) < 8 * v236)
                  goto LABEL_480;
                if (v241 > 72)
                {
                  if (v241 != 91 && (v241 != 73 || v228 != 1 && !*(_BYTE *)(v231 + 100 * v240 + 95)))
                    goto LABEL_481;
                }
                else if (v241 != 40 && v241 != 49)
                {
                  goto LABEL_481;
                }
                if (v242 < 0xA
                  || (v244 <= 0x34 ? (v246 = ((1 << v244) & 0x10000000000011) == 0) : (v246 = 1), !v246))
                {
                  if ((int)(v238
                           - ((*(unsigned __int16 *)(v231 + 100 * v240 + 82)
                             + *(unsigned __int16 *)(v231 + 100 * v240 + 80)
                             + 1) >> 1)) < *(unsigned __int16 *)(v231 + 100 * v240 + 86)
                                         - *(unsigned __int16 *)(v231 + 100 * v240 + 84))
LABEL_480:
                    *(_BYTE *)(v231 + 100 * v230 + 95) = 0;
                }
              }
            }
          }
        }
        else if (v228)
        {
          v239 = *(unsigned __int8 *)(v231 + 100 * v230 + 95);
          if (!*(_BYTE *)(v231 + 100 * v230 + 95) || v233 == 91 || v233 == 93)
            goto LABEL_453;
LABEL_469:
          *(_DWORD *)v234 = 124;
          LODWORD(v4) = *(_DWORD *)(v3 + 20);
        }
        else if (v233 != 91 && v233 != 93)
        {
          goto LABEL_469;
        }
LABEL_481:
        if (++v228 < (int)v4)
          continue;
        break;
      }
      if ((int)v4 >= 1)
      {
        v247 = 0;
        while (1)
        {
          v248 = *(_QWORD *)(v3 + 8);
          v249 = *(_DWORD *)(v248 + 4 * v247);
          v250 = *(_QWORD *)(a1 + 280);
          v251 = (float32x4_t *)(v250 + 100 * v249);
          *(_DWORD *)__base = v251[2].i32[2];
          v252 = *(_DWORD *)__base;
          v253 = *(_DWORD *)__base;
          if (*(_DWORD *)__base == 36)
          {
            if (*(_WORD *)(v250 + 100 * v249 + 88)
              || v247 + 1 < (int)v4
              && (*(_DWORD *)(v250 + 100 * *(int *)(v248 + 4 * v247 + 4) + 40) - 48) < 0xA)
            {
              v253 = 36;
            }
            else
            {
              v253 = 83;
              *(_DWORD *)__base = 83;
            }
          }
          if (strstr("CcOoPpSsUuWwXxZz", __base))
          {
            v255 = *(_BYTE *)(v250 + 100 * v249 + 93);
            v256 = v253 | 0x20;
            v257 = v253 & 0xFFFFFFDF;
            goto LABEL_494;
          }
          if (strstr("ÍíØøÓóÖöÚúÜüÇçŒœ", __base))
          {
            v255 = *(_BYTE *)(v250 + 100 * v249 + 93);
            v256 = v253 | 0x2000;
            v257 = v253 & 0xFFFFDFFF;
LABEL_494:
            if ((v255 & 1) != 0)
              v253 = v257;
            else
              v253 = v256;
            goto LABEL_497;
          }
          if (strstr("ĪŌŪŻĆČŠŽ", __base))
          {
            if ((*(_BYTE *)(v250 + 100 * v249 + 93) & 1) == 0)
              v253 += 256;
            goto LABEL_497;
          }
          if (strstr("īōūżćčšž", __base))
          {
            if ((*(_BYTE *)(v250 + 100 * v249 + 93) & 1) != 0)
              v253 -= 256;
            goto LABEL_497;
          }
          if (v253 <= 109)
            break;
          if (v253 > 117)
          {
            if (v253 == 118)
              goto LABEL_547;
            if (v253 != 121)
              goto LABEL_497;
LABEL_544:
            v265 = *(_BYTE *)(v250 + 100 * v249 + 93) & 3;
            if (v265 == 1)
            {
              v253 = 89;
            }
            else if (v265 == 2)
            {
              v253 = 121;
            }
            goto LABEL_497;
          }
          if (v253 != 110)
          {
            if (v253 != 114)
              goto LABEL_497;
            v262 = (*(_BYTE *)(v250 + 100 * v249 + 93) & 1) == 0;
            v263 = 102;
            v264 = 114;
            goto LABEL_554;
          }
          if ((*(_BYTE *)(v250 + 100 * v249 + 93) & 1) != 0)
          {
            if (*(_DWORD *)(v250 + 100 * v249 + 28) == 27756)
              v253 = 27756;
            else
              v253 = 110;
          }
          else
          {
            v253 = 110;
          }
LABEL_497:
          if (v253 != v252)
          {
            __s2[0] = v253;
            v258 = *(_DWORD *)(a1 + 36);
            if (!v258)
              goto LABEL_501;
            if (v258 != 4544069)
            {
              if ((v253 & 0x808080) != 0)
              {
LABEL_501:
                if (!strstr((char *)(a1 + 40), (const char *)__s2))
                {
                  if (!v258 || v258 == 4412225)
                    goto LABEL_503;
                  if (v253 > 10524385)
                  {
                    v259 = v253 == 10524386 || v253 == 10715362;
                    v260 = 10649826;
                  }
                  else
                  {
                    v259 = v253 == 45250 || v253 == 8755426;
                    v260 = 9475298;
                  }
                  if (!v259 && v253 != v260)
                    goto LABEL_503;
                }
              }
              else if (v253 == 92)
              {
                goto LABEL_503;
              }
            }
            ccSetStr(v251, v253, 2, v254);
            LODWORD(v4) = *(_DWORD *)(v3 + 20);
          }
LABEL_503:
          if (++v247 >= (int)v4)
            goto LABEL_563;
        }
        if (v253 <= 88)
        {
          if (v253 == 81)
          {
            v262 = (*(_BYTE *)(v250 + 100 * v249 + 93) & 1) == 0;
            v263 = 81;
            v264 = 111;
LABEL_554:
            if (v262)
              v253 = v264;
            else
              v253 = v263;
            goto LABEL_497;
          }
          if (v253 != 86)
            goto LABEL_497;
LABEL_547:
          if ((*(_BYTE *)(v250 + 100 * v249 + 93) & 2) != 0)
            v266 = 121;
          else
            v266 = 118;
          if ((*(_BYTE *)(v250 + 100 * v249 + 93) & 1) != 0)
            v253 = 86;
          else
            v253 = v266;
          goto LABEL_497;
        }
        if (v253 != 89)
        {
          if (v253 != 108)
            goto LABEL_497;
          v262 = (*(_BYTE *)(v250 + 100 * v249 + 93) & 1) == 0;
          v263 = 108;
          v264 = 105;
          goto LABEL_554;
        }
        goto LABEL_544;
      }
    }
  }
LABEL_563:
  rsRemoveBadWords(a1, v3, &v308);
  if (!*(_BYTE *)(v3 + 93))
  {
    FKSequenceRecalculateBox(a1, v3);
    FKSequenceSortAndProcess((void *)a1, v3, 0);
    v308 = 1;
  }
  v267 = malloc_type_malloc(*(int *)(v3 + 20) + 1, 0x24A467BDuLL);
  *(_QWORD *)(v3 + 80) = v267;
  *(_DWORD *)(v3 + 88) = *(_DWORD *)(v3 + 20);
  *v267 = 0;
  if (*(int *)(v3 + 20) >= 1)
  {
    v268 = 0;
    while (1)
    {
      v269 = a1;
      v270 = *(_QWORD *)(a1 + 280);
      v271 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * v268);
      v272 = v270 + 100 * v271;
      v273 = *(char **)(v3 + 80);
      v274 = strlen(v273);
      v275 = strlen((const char *)(v272 + 40));
      if (*(_BYTE *)(a1 + 336))
        v276 = v275 + 20;
      else
        v276 = v275;
      v277 = v274 + v276 + 2;
      v278 = *(_DWORD *)(v3 + 88);
      if (v277 > v278)
      {
        v279 = 2 * v278;
        if (v279 <= v277)
          v280 = v277;
        else
          v280 = v279;
        v281 = (char *)malloc_type_realloc(v273, v280, 0x678E9981uLL);
        if (!v281)
          return v308;
        v273 = v281;
        *(_QWORD *)(v3 + 80) = v281;
        *(_DWORD *)(v3 + 88) = v280;
        v269 = a1;
      }
      if (*(_BYTE *)(v270 + 100 * v271 + 95))
        v273[v274++] = 32;
      if (!*(_BYTE *)(v269 + 336))
        break;
      if (!*(_BYTE *)(v270 + 100 * v271 + 96))
      {
        v283 = shouldTestSplit(v270 + 100 * v271);
        v282 = *(_QWORD *)(v3 + 80);
        if (v283)
        {
          sprintf((char *)(v282 + v274), "\x1B[31m%s\x1B[0m");
          goto LABEL_585;
        }
        goto LABEL_582;
      }
      sprintf((char *)(*(_QWORD *)(v3 + 80) + v274), "\x1B[32m%s\x1B[0m");
LABEL_585:
      if (++v268 >= *(int *)(v3 + 20))
        return v308;
    }
    v282 = *(_QWORD *)(v3 + 80);
LABEL_582:
    strcpy((char *)(v282 + v274), (const char *)(v272 + 40));
    goto LABEL_585;
  }
  return v308;
}

void rsSetUpDownNum(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  char v18;
  uint64_t v19;
  int v20;
  float32x4_t *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  char *v25;
  int v26;
  int v27;
  BOOL v28;
  int v29;
  char v30;
  char v31;
  signed int v32;
  char v33;
  char *v34;
  float32x4_t *v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v42;
  char v43;
  BOOL v44;
  int v45;
  int v46;
  uint64_t v48;
  uint64_t v50;
  char *v51;
  int v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 44))
  {
    v50 = (uint64_t)&v50;
    v53 = 0;
    MEMORY[0x1E0C80A78](a1);
    v51 = (char *)&v50 - ((v4 + 15) & 0x7FFFFFFF0);
    v6 = *(unsigned int *)(v5 + 20);
    if ((int)v6 >= 1)
    {
      v7 = 0;
      v8 = 0;
      v9 = v6 + 1;
      v10 = v6 - 1;
      do
      {
        v11 = v10;
        v12 = *(_QWORD *)(a1 + 280) + 100 * *(int *)(*(_QWORD *)(a2 + 8) + 4 * v10);
        if ((*(_BYTE *)(v12 + 94) & 8) != 0)
        {
          v8 = 1;
        }
        else
        {
          if (v7)
          {
            v13 = (isWordBoundary(v12, v7) | v8);
            vUpdate((char *)&v53, v7, v13);
            vPredict((char *)&v53, a2, v7, (unsigned __int16 *)v12, v13);
            v8 = 0;
            *(_DWORD *)&v51[4 * v11] = v53;
          }
          else
          {
            *(_DWORD *)&v51[4 * v10] = 0;
          }
          v7 = v12;
        }
        --v9;
        v10 = v11 - 1;
      }
      while (v9 > 1);
      v14 = *(_DWORD *)(a2 + 20);
      v53 = 0;
      if (v14 >= 1)
      {
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 1;
        do
        {
          v19 = *(_QWORD *)(a1 + 280);
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + 8) + 4 * v15);
          v21 = (float32x4_t *)(v19 + 100 * v20);
          if ((v21[5].i8[14] & 8) != 0)
          {
            if (*(_DWORD *)(v19 + 100 * v20 + 40) != 39)
              v18 = 1;
            v22 = v15 + 1;
            goto LABEL_80;
          }
          if (v16)
          {
            vUpdate((char *)&v53, v16, v17);
            v17 = isWordBoundary(v16, (uint64_t)v21) | v18;
            vPredict((char *)&v53, a2, v16, (unsigned __int16 *)v21, v17);
          }
          else
          {
            v17 = v18;
          }
          v52 = 0;
          vUpdate((char *)&v52, (uint64_t)v21, v17);
          v22 = v15 + 1;
          if (v15 + 1 >= *(int *)(a2 + 20))
            v24 = 0;
          else
            v24 = *(_QWORD *)(a1 + 280) + 100 * *(int *)(*(_QWORD *)(a2 + 8) + 4 * v22);
          v25 = &v51[4 * v15];
          v26 = (char)v52 + (char)v53;
          v27 = *v25;
          v28 = __OFADD__(v26, v27);
          v29 = v26 + v27;
          if ((v29 < 0) ^ v28 | (v29 == 0))
            v30 = 0;
          else
            v30 = 1;
          if ((SBYTE1(v52) + SBYTE1(v53) + v25[1] < 0) ^ __OFADD__(SBYTE1(v52) + SBYTE1(v53), v25[1]) | (SBYTE1(v52) + SBYTE1(v53) + v25[1] == 0))
            v31 = 0;
          else
            v31 = 1;
          *(_BYTE *)(v19 + 100 * v20 + 93) = *(_BYTE *)(v19 + 100 * v20 + 93) & 0xFC | v30 | (2 * v31);
          if (BYTE2(v52))
          {
            if (BYTE2(v52) == 100)
            {
              v32 = *(_DWORD *)(v19 + 100 * v20 + 24);
LABEL_38:
              if (!v17 || (v32 & 0xFFFFFFDF) != 0x53)
              {
                v38 = 0;
                v39 = v19 + 100 * v20;
                while (1)
                {
                  v23 = *(float *)(v39 + v38 + 48);
                  if (v23 < 0.1)
                    goto LABEL_79;
                  v40 = *(_DWORD *)(v39 + v38 + 24);
                  if ((v40 & 0xFFFFFFDF) == 0x4F)
                  {
                    v36 = 48;
                    goto LABEL_77;
                  }
                  if ((v40 & 0xFFFFFFEF) == 0x6C || v40 == 73)
                    v36 = 49;
                  else
                    v36 = *(_DWORD *)(v39 + v38 + 24);
                  if (v36 - 48 <= 9)
                    goto LABEL_77;
                  v38 += 4;
                  if (v38 == 16)
                    goto LABEL_79;
                }
              }
              v35 = (float32x4_t *)(v19 + 100 * v20);
              v36 = 36;
              v37 = 1;
              goto LABEL_78;
            }
            if (SBYTE2(v52) < 0)
            {
LABEL_54:
              v42 = v51[4 * v15 + 3] + SHIBYTE(v53);
              v32 = *(_DWORD *)(v19 + 100 * v20 + 24);
              goto LABEL_55;
            }
            v33 = BYTE2(v53);
          }
          else
          {
            v33 = BYTE2(v53);
            if (!BYTE2(v53))
            {
              if (!v51[4 * v15 + 2])
                goto LABEL_54;
              v33 = 0;
            }
          }
          v34 = &v51[4 * v15];
          v32 = *(_DWORD *)(v19 + 100 * v20 + 24);
          if (v34[2] + v33 >= 0)
            goto LABEL_38;
          v42 = v34[3] + SHIBYTE(v53);
LABEL_55:
          v43 = v32 - 48;
          if ((v32 - 48) <= 0x3F)
          {
            if (((1 << v43) & 0x8000000080000001) != 0)
            {
              v44 = v29 <= 0;
              v45 = 111;
              v46 = 79;
              goto LABEL_58;
            }
            if (((1 << v43) & 0x1000000000000002) != 0)
              goto LABEL_67;
          }
          if (v32 == 124 || v32 == 9475298)
          {
LABEL_67:
            if (v42 <= 0)
              v32 = 108;
            else
              v32 = 73;
            v48 = v24;
            ccSetStr(v21, v32, 0, v23);
            v24 = v48;
LABEL_71:
            if (v17
              && v32 == 108
              && (!v24 || strstr("bcCdfghklImnpPqrsStvVwWxXzZñðßç',;:\"", (const char *)(v24 + 40))))
            {
              *(_DWORD *)(v19 + 100 * v20 + 40) = 73;
            }
            goto LABEL_79;
          }
          if (v32 == 73 && v42 <= 0)
          {
            if (*(float *)(v19 + 100 * v20 + 48) < 0.8)
            {
              v32 = 108;
              *(_DWORD *)(v19 + 100 * v20 + 40) = 108;
              goto LABEL_71;
            }
          }
          else
          {
            if (v32 > 82)
            {
              if (v32 != 115 && v32 != 83)
                goto LABEL_71;
LABEL_94:
              v44 = v29 <= 0;
              v45 = 115;
              v46 = 83;
LABEL_58:
              if (v44)
                v36 = v45;
              else
                v36 = v46;
LABEL_77:
              v35 = (float32x4_t *)(v19 + 100 * v20);
              v37 = 0;
LABEL_78:
              ccSetStr(v35, v36, v37, v23);
              goto LABEL_79;
            }
            if (v32 == 53)
              goto LABEL_94;
            if (v32 != 57)
              goto LABEL_71;
            *(_DWORD *)(v19 + 100 * v20 + 40) = 103;
          }
LABEL_79:
          v18 = 0;
          v14 = *(_DWORD *)(a2 + 20);
          v16 = v19 + 100 * v20;
LABEL_80:
          v15 = v22;
        }
        while (v22 < v14);
      }
    }
  }
}

uint64_t computeSpaceLimit(uint64_t a1, _DWORD *a2)
{
  int v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = a2[5];
  if (v2 < 2)
    return 0;
  v5 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v25 - v7;
  v9 = 0;
  v10 = *(_QWORD *)(v5 + 280);
  v12 = *(int **)(v11 + 8);
  v15 = *v12;
  v13 = v12 + 1;
  v14 = v15;
  do
  {
    v16 = v13[v9 / 4];
    v17 = *(unsigned __int16 *)(v10 + 100 * v16 + 80) - *(unsigned __int16 *)(v10 + 100 * v14 + 82);
    *(_DWORD *)&v8[v9] = v17 & ~(v17 >> 31);
    v9 += 4;
    v14 = v16;
  }
  while (v6 != v9);
  qsort(v8, (v2 - 1), 4uLL, (int (__cdecl *)(const void *, const void *))compareInt);
  v18 = v2 >> 1;
  if (v2 <= 2)
    v18 = 0;
  v19 = *(_DWORD *)&v8[4 * v18];
  v20 = a2[15];
  v21 = v20 / 4;
  if (v20 / 4 >= a2[13] / 5)
    v21 = a2[13] / 5;
  if (v21 <= 9 * v19 / 16)
    v21 = 9 * v19 / 16;
  v22 = v21 + v19;
  if (v2 >= 17)
  {
    v23 = *(_DWORD *)&v8[4 * (7 * (v2 - 1) / 8)];
    if (v22 <= v23 / 2)
      v22 = v23 / 2;
  }
  v24 = 4 * v20 / 3;
  if (v22 < v24)
    v24 = v22;
  if (v24 <= 4)
    return 4;
  else
    return v24;
}

void rsRemoveBadWords(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  BOOL v18;
  char *v19;
  char *v20;
  int v21;
  int v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  BOOL v28;
  uint64_t v29;
  int v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v32 - v7;
  *(_DWORD *)((char *)v32 - v7) = 0;
  if (v6 < 0)
    return;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0.0;
  v14 = 0.0;
  do
  {
    if (v9 < v6 && (v15 = *(_QWORD *)(a1 + 280)) != 0)
    {
      v16 = v15 + 100 * *(int *)(*(_QWORD *)(a2 + 8) + 4 * v9);
      if (!*(_BYTE *)(v16 + 95))
        goto LABEL_29;
      v17 = 0;
    }
    else
    {
      v16 = 0;
      v17 = 1;
    }
    if (v12 <= 0)
    {
      v18 = v14 > v13;
    }
    else
    {
      v18 = v14 > v13;
      if (v8[8 * (v12 - 1) + 4])
        goto LABEL_14;
    }
    if ((int)v9 - *(_DWORD *)&v8[8 * v12] <= 2)
      v18 = (double)((int)v9 - *(_DWORD *)&v8[8 * v12]) * 0.5 < v14;
LABEL_14:
    if (v12 < 2 || *(_DWORD *)&v8[8 * v12] - *(_DWORD *)&v8[8 * (v12 - 1)] != 1)
      goto LABEL_24;
    v19 = &v8[8 * (v12 - 1)];
    v22 = v19[4];
    v20 = v19 + 4;
    v21 = v22;
    if (v8[8 * (v12 - 2) + 4])
    {
      if (v21 || !v18)
        goto LABEL_24;
      v23 = 1;
      v24 = 1;
    }
    else
    {
      if (!v21 || v18)
        goto LABEL_24;
      v23 = 0;
      v24 = -1;
    }
    *v20 = v23;
    v11 += v24;
    v10 += v24;
LABEL_24:
    v25 = v12;
    v8[8 * v12 + 4] = v18;
    if (v18)
    {
      ++v11;
      v10 = v9 + v10 - *(_DWORD *)&v8[8 * v12];
    }
    ++v12;
    *(_DWORD *)&v8[8 * v25 + 8] = v9;
    v13 = 0.0;
    if ((v17 & 1) != 0)
    {
      v26 = v6;
      v27 = 0.0;
      goto LABEL_30;
    }
    v14 = 0.0;
LABEL_29:
    v27 = v13 + getConfusionScoreForCC(v16);
    v13 = v14 + *(float *)(v16 + 44);
    v6 = *(_DWORD *)(a2 + 20);
    v26 = v6;
LABEL_30:
    v14 = v13;
    v13 = v27;
    v28 = v9++ < v26;
  }
  while (v28);
  if (v11 >= 1 && v11 != v12 && v6 - v10 >= 2)
  {
    if (v12 >= 1)
    {
      v29 = v12;
      do
      {
        if (v8[8 * (v29 - 1) + 4])
        {
          v30 = *(_DWORD *)&v8[8 * v29];
          v31 = *(_DWORD *)&v8[8 * (v29 - 1)];
          while (v30 > v31)
            FKSequenceRemoveConcomp(a1, a2, --v30);
        }
        v28 = v29-- <= 1;
      }
      while (!v28);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 280) + 100 * **(int **)(a2 + 8) + 95) = 0;
    *a3 = 1;
  }
}

float FKCCMatchGetConfidence(uint64_t a1)
{
  return *(float *)(a1 + 48) / (1.0 - *(float *)(a1 + 44) + 0.000001);
}

char *FKSeqMatchGetConfidence(char *result, uint64_t a2)
{
  int v3;
  char *v4;
  uint64_t v5;
  int v6;
  int v7;
  float v8;
  float v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char __s2[4];

  if (*(_DWORD *)(a2 + 44))
  {
    v3 = *(_DWORD *)(a2 + 20);
    if (v3 >= 2)
    {
      v4 = result;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0.0;
      v9 = 0.0;
      do
      {
        v10 = *((_QWORD *)v4 + 35);
        v11 = *(_DWORD *)(*(_QWORD *)(a2 + 8) + 4 * v5);
        if ((*(_BYTE *)(v10 + 100 * v11 + 94) & 8) == 0)
        {
          v12 = v10 + 100 * v11;
          ++v6;
          v9 = v9 + getConfusionScoreForCC(v12);
          v8 = v8 + *(float *)(v12 + 44);
          *(_DWORD *)__s2 = *(_DWORD *)(v12 + 40);
          result = strstr("•<>%iIl|1!tj?", __s2);
          if (!result)
            ++v7;
          v3 = *(_DWORD *)(a2 + 20);
        }
        ++v5;
      }
      while (v5 < v3);
    }
  }
  return result;
}

float getConfusionScoreForCC(uint64_t a1)
{
  uint64_t v2;
  float v3;
  __darwin_ct_rune_t v4;
  __darwin_ct_rune_t v5;
  __darwin_ct_rune_t v6;
  __darwin_ct_rune_t v7;
  BOOL v8;
  BOOL v9;
  char v11[4];
  char __s2[4];

  v2 = 0;
  v3 = *(float *)(a1 + 48);
  do
  {
    v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)v11 = *(_DWORD *)(a1 + v2 + 28);
    v5 = *(_DWORD *)v11;
    *(_DWORD *)__s2 = v4;
    v6 = __tolower(v4);
    v7 = __tolower(v5);
    if (v5 != 76 && (v4 != 76 ? (v8 = v6 == v7) : (v8 = 0), v8)
      || ((v4 - 73) <= 0x33
        ? (v9 = ((1 << (v4 - 73)) & 0x8000800000001) == 0)
        : (v9 = 1),
          (!v9 || v4 == 49)
       && ((v5 - 73) <= 0x33 && ((1 << (v5 - 73)) & 0x8000800000001) != 0 || v5 == 49))
      || strstr("%xX", __s2) && strstr("%xX", v11)
      || strstr("oO0", __s2) && strstr("oO0", v11)
      || v4 == 109 && v5 == 28274
      || v4 == 28274 && v5 == 109)
    {
      v3 = v3 + *(float *)(a1 + v2 + 52);
    }
    v2 += 4;
  }
  while (v2 != 12);
  return v3;
}

uint64_t clistCompare(uint64_t a1, uint64_t a2)
{
  float v2;
  float v3;
  unsigned int v4;

  v2 = *(float *)(a1 + 4);
  v3 = *(float *)(a2 + 4);
  if (v2 < v3)
    v4 = 1;
  else
    v4 = -1;
  if (v2 == v3)
    return 0;
  else
    return v4;
}

float candlistInsert(float32x4_t *a1, int a2, int a3, double a4)
{
  uint64_t v4;
  int v5;
  float v6;
  uint64_t v7;
  float *v8;
  float v10;
  __int8 *v11;
  int v12;

  if (a2 != 27750 || (a1[5].i8[13] & 1) != 0)
  {
    v4 = 0;
    v5 = 4;
    v6 = 0.0;
    LODWORD(v7) = 4;
    do
    {
      v8 = &a1->f32[v4];
      if (v8[15] <= *(float *)&a4)
        LODWORD(v7) = v4 + 3;
      if (*((_DWORD *)v8 + 9) == a2)
      {
        v5 = v4 + 3;
        v6 = v8[15];
      }
      --v4;
    }
    while (v4 != -4);
    if ((_DWORD)v7 != 4 && (int)v7 <= v5)
    {
      if ((int)v7 > 3)
      {
        v10 = *(float *)&a4;
      }
      else
      {
        v7 = (int)v7;
        do
        {
          v10 = *(float *)&a4;
          v11 = &a1->i8[4 * v7];
          v12 = *((_DWORD *)v11 + 6);
          LODWORD(a4) = *((_DWORD *)v11 + 12);
          *((_DWORD *)v11 + 6) = a2;
          *((float *)v11 + 12) = v10;
          if (v5 == v7)
            break;
          ++v7;
          a2 = v12;
          v10 = *(float *)&a4;
        }
        while ((_DWORD)v7 != 4);
      }
      if (a3 == 2)
      {
        LODWORD(a4) = 0;
        if (v5 < 4)
          *(float *)&a4 = v6;
        *(float *)&a4 = (float)(v10 - *(float *)&a4) + 1.0;
        a1[3] = vdivq_f32(a1[3], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a4, 0));
        *(float *)&a4 = a1[2].f32[3] / *(float *)&a4;
        a1[2].i32[3] = LODWORD(a4);
      }
    }
  }
  return *(float *)&a4;
}

float ccSetStr(float32x4_t *a1, unsigned int a2, int a3, double a4)
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  float v13;
  char *v14;

  if ((a2 & 0xFFFFFFDF) != 0x53 || a1[2].i32[2] != 53 || a1[1].i32[2] != 53 || (a4 = a1[3].f32[0], a4 < 0.8))
  {
    if (a2 == 124)
    {
      v12 = 73;
    }
    else if (a2 == 9475298)
    {
      v7 = a1[5].u16[3] - a1[5].u16[2] + 1;
      v8 = 3 * ((v7 << 8) / (v7 - a1[5].u16[0] + a1[5].u16[1] + 1));
      v9 = v8 - 384;
      v10 = v8 - 383;
      if (v9 >= 0)
        v10 = v9;
      v11 = v10 >> 1;
      if (v11 <= -128)
        v11 = -128;
      if (v11 >= 127)
        v11 = 127;
      v12 = (v11 + 128) >= 0xAB ? 49 : 55;
    }
    else
    {
      v12 = a2;
    }
    a1[2].i32[2] = v12;
    if (a3)
    {
      v13 = a1[3].f32[0];
      LODWORD(a4) = 1.0;
      if (v13 <= 0.0)
      {
LABEL_29:
        *(float *)&a4 = candlistInsert(a1, a2, a3, a4);
        return *(float *)&a4;
      }
      if (a2 > 0x7F)
      {
LABEL_28:
        *(float *)&a4 = v13;
        goto LABEL_29;
      }
      if ((!index("I1l", a2) || !index("I1l|", a1[1].i32[2]))
        && (!index("01259", a2) || !index("oOI1l|zZsSg", a1[1].i32[2])))
      {
        if (index("01259", a1[1].i32[2]))
        {
          v14 = index("oOI1l|zZsSg", a2);
          *(float *)&a4 = v13;
          if (v14)
            return *(float *)&a4;
          goto LABEL_29;
        }
        goto LABEL_28;
      }
    }
  }
  return *(float *)&a4;
}

void FKRecognizeMultipleConcomps(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  int v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;

  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 344) + 8);
  if ((int)v3 >= 1)
  {
    do
    {
      v6 = FKBatchLevels[(v3 - 1)];
      v16 = v3 - 1;
      v17 = v3;
      if (a3 >= (int)v6)
      {
        v7 = v3 - 1;
        if ((int)v6 <= 1)
          v8 = 1;
        else
          v8 = v6;
        v18 = 4 * v6;
        v19 = FKBatchLevels[(v3 - 1)];
        do
        {
          v20 = a3;
          for (i = 0; i != v8; ++i)
          {
            v10 = *(_QWORD *)(a1 + 280) + 100 * *(int *)(a2 + 4 * i);
            *(_QWORD *)(v10 + 24) = 0;
            *(_QWORD *)(v10 + 32) = 0;
            *(_QWORD *)(v10 + 52) = 0;
            *(_QWORD *)(v10 + 44) = 0;
            *(_DWORD *)(v10 + 60) = 0;
            v11 = (_QWORD *)(*(_QWORD *)(a1 + 344) + 520 * v7);
            v12 = *(unsigned __int16 *)(v10 + 82) - *(unsigned __int16 *)(v10 + 80) + 1;
            v13 = *(unsigned __int16 *)(v10 + 86) - *(unsigned __int16 *)(v10 + 84) + 1;
            scaleCC(a1, v10, (char *)(v11[4] + 4 * v11[22] * i));
            *(float *)(v11[25] + 4 * v11[43] * i) = (float)v12 / (float)v13;
          }
          if (!espresso_plan_execute_sync())
          {
            v15 = 0;
            do
            {
              *(float *)&v14 = extractCandidates(a1, (float32x4_t *)(*(_QWORD *)(a1 + 280) + 100 * *(int *)(a2 + 4 * v15)), v15, (_QWORD *)(*(_QWORD *)(a1 + 344) + 520 * v7 + 368), v14);
              ++v15;
            }
            while (v15 < v19);
          }
          a2 += v18;
          a3 = v20 - v19;
        }
        while (v20 - (int)v19 >= (int)v19);
      }
      v3 = v16;
    }
    while (v17 > 1);
  }
}

void orderDiacriticToClusterCenters(uint64_t a1, uint64_t a2, char *__base)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  _WORD *v28;
  unsigned int v29;
  unsigned __int16 v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  BOOL v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  int v47;
  unsigned __int8 *v48;
  uint64_t v49;
  __int16 v50;
  char *v51;
  int v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int16 *)(a2 + 84);
  v4 = *(unsigned __int16 *)(a2 + 80);
  v5 = *(unsigned __int16 *)(a2 + 82);
  v58 = 0;
  v59 = 0;
  v56 = 0;
  v54 = 0;
  v55 = 0;
  v6 = v5 - v4;
  if (v5 - v4 <= 7)
    v7 = v4;
  else
    v7 = v4 + 1;
  v8 = *(_DWORD *)(a2 + 12);
  if (v8 == -1)
  {
    v18 = 0;
    v17 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = v5 + v4;
    v20 = (v5 + v4) >> 1;
    v21 = v4 + v20;
    v22 = v5 - (v5 - v4 > 7);
    v23 = v5 + (v19 >> 1);
    v25 = *(_QWORD *)(a1 + 256);
    v24 = *(_QWORD *)(a1 + 264);
    v26 = v21 >> 1;
    v27 = v23 >> 1;
    do
    {
      v28 = (_WORD *)(v25 + 8 * v8);
      v29 = (unsigned __int16)v28[3];
      v30 = *(v28 - 1) + 1;
      if (v7 == v30)
        v31 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      else
        v31 = 0;
      v18 += v31;
      if (v7 == (unsigned __int16)(*(v28 - 1) + 1))
        ++v17;
      if (v26 <= v29 && v26 >= v30)
        v32 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      else
        v32 = 0;
      v15 += v32;
      v16 += v26 <= v29 && v26 >= v30;
      if (v20 <= v29 && v20 >= v30)
        v33 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      else
        v33 = 0;
      v13 += v33;
      v14 += v20 <= v29 && v20 >= v30;
      v34 = v27 <= v29 && v27 >= v30;
      if (v34)
        v35 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      else
        v35 = 0;
      v11 += v35;
      v12 += v34;
      v36 = v22 == v29;
      if (v22 == v29)
        v37 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      else
        v37 = 0;
      v9 += v37;
      if (v36)
        ++v10;
      v38 = (unsigned __int16)v28[2];
      if (!v38)
        break;
      v8 -= v38;
    }
    while (v8 != -1);
    v58 = __PAIR64__(v14, v16);
    v54 = __PAIR64__(v13, v15);
    v59 = __PAIR64__(v10, v12);
    v55 = __PAIR64__(v9, v11);
  }
  v39 = 0;
  v40 = *(unsigned __int16 *)(a2 + 86);
  v41 = v40 - v3 + 1;
  v57 = v17;
  v53 = v18;
  do
  {
    if (v40 == v3 || (v42 = *(int *)((char *)&v57 + v39)) == 0)
      *(int *)((char *)&v53 + v39) = 50;
    else
      *(int *)((char *)&v53 + v39) = (100 * *(int *)((char *)&v53 + v39) / v42 + 50) / v41;
    v39 += 4;
  }
  while (v39 != 20);
  v43 = 0;
  v44 = 3 * ((v41 << 8) / (v6 + v41 + 1));
  v45 = v44 - 384;
  v46 = v44 - 383;
  if (v45 >= 0)
    v46 = v45;
  v47 = v46 >> 1;
  if (v47 <= -128)
    v47 = -128;
  if (v47 >= 127)
    v47 = 127;
  v56 = v47 + 128;
  v48 = clusterCenter;
  do
  {
    v49 = 0;
    v50 = 0;
    v51 = &__base[4 * v43];
    *((_WORD *)v51 + 1) = clusterCenter[8 * v43 - v43 + 6];
    do
    {
      v52 = *(&v53 + v49) - v48[v49];
      v50 += v52 * v52;
      ++v49;
    }
    while (v49 != 6);
    *(_WORD *)v51 = v50;
    ++v43;
    v48 += 7;
  }
  while (v43 != 13);
  qsort(__base, 0xDuLL, 4uLL, (int (__cdecl *)(const void *, const void *))v_compare);
}

uint64_t v_compare(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 - *a2;
}

BOOL isWordBoundary(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = 1;
  if (a1 && a2)
    return *(_BYTE *)(a2 + 95)
        || index("@-~()[]{}.,:;!?", *(_DWORD *)(a1 + 24))
        || index("@-~()[]{}.,:;!?", *(_DWORD *)(a2 + 24)) != 0;
  return result;
}

uint64_t vUpdate(char *a1, uint64_t a2, int a3)
{
  int v6;
  float v7;
  uint64_t result;
  char v9;
  int v10;
  int v11;
  unsigned int v12;
  float v13;
  char v14;
  int v15;
  char v16;
  uint64_t i;
  int v18;
  uint64_t v19;
  char __s2[4];

  v6 = *(_DWORD *)(a2 + 24);
  v7 = *(float *)(a2 + 48);
  result = getUpInfo(a2);
  v9 = result;
  if (v6 == 116)
  {
    v10 = (*a1 + (*a1 >> 7)) << 24 >> 25;
LABEL_3:
    *a1 = v10;
    goto LABEL_4;
  }
  if (result > 0x54u)
  {
    if (result == 115)
    {
      if (v7 > 0.5)
      {
        LOBYTE(v10) = -100;
        goto LABEL_3;
      }
      goto LABEL_4;
    }
    if (result != 85)
      goto LABEL_4;
  }
  else
  {
    if (result == 68)
    {
      if (v7 > 0.5 && *a1 <= 0)
      {
        LOBYTE(v10) = 25;
        goto LABEL_3;
      }
      goto LABEL_4;
    }
    if (result != 83)
      goto LABEL_4;
  }
  if (v7 > 0.5)
  {
    LOBYTE(v10) = 100;
    goto LABEL_3;
  }
LABEL_4:
  v11 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)__s2 = v11;
  v12 = v11 - 48;
  if ((v11 - 48) <= 9)
  {
    if (*(_DWORD *)(a2 + 64) != -1)
      goto LABEL_21;
    v13 = 0.5;
    if (v12 <= 9)
      v13 = flt_1D45FAABC[v12];
    if (v7 <= v13)
      v14 = 50;
    else
      v14 = 100;
    goto LABEL_18;
  }
  if (v11 == 105 && *(_DWORD *)(a2 + 64) != -1)
  {
    v14 = -50;
LABEL_18:
    a1[2] = v14;
    goto LABEL_21;
  }
  result = getUpInfo(a2);
  if ((_DWORD)result != 32)
  {
    result = (uint64_t)strstr("0OoI1i|┐", __s2);
    if (!result)
    {
      for (i = 0; i != 16; i += 4)
      {
        if (*(float *)(a2 + i + 48) < 0.1)
          break;
        v18 = *(_DWORD *)(a2 + i + 24);
        if ((v18 - 48) < 0xA || (v18 & 0xFFFFFFDF) == 0x4F)
          goto LABEL_21;
      }
      v19 = 0;
      while (*(_DWORD *)(a2 + v19 + 24) != 36)
      {
        v19 += 4;
        if (v19 == 16)
          goto LABEL_55;
      }
      if (*(float *)(a2 + v19 + 48) >= 0.1)
        goto LABEL_21;
LABEL_55:
      v14 = -100;
      goto LABEL_18;
    }
  }
LABEL_21:
  if (v9 == 85)
    goto LABEL_24;
  if (v9 != 58)
  {
    if ((v9 & 0xDF) == 0x53)
      goto LABEL_29;
    LOBYTE(v15) = *a1;
LABEL_28:
    if ((v15 & 0x80) == 0)
      goto LABEL_31;
LABEL_29:
    v16 = -100;
    goto LABEL_30;
  }
  v15 = *a1;
  if (v15 < 1)
    goto LABEL_28;
LABEL_24:
  if (!a3)
  {
    v16 = 100;
LABEL_30:
    a1[3] = v16;
  }
LABEL_31:
  if ((v6 - 128) >= 0xFFFFFFC0 && ((0x5FCE97E05FCF9FEuLL >> v6) & 1) != 0 && v7 > 0.5)
    a1[1] = -100;
  return result;
}

char *vPredict(char *result, uint64_t a2, uint64_t a3, unsigned __int16 *a4, int a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;

  v5 = a4[42];
  v6 = *(unsigned __int16 *)(a3 + 84);
  v7 = (int)((((a4[41] + a4[40] + 1) >> 1)
            - ((*(unsigned __int16 *)(a3 + 82) + *(unsigned __int16 *)(a3 + 80) + 1) >> 1))
           * (*(_DWORD *)(a2 + 36) - *(_DWORD *)(a2 + 32)))
     / (*(unsigned __int16 *)(a2 + 26) - *(unsigned __int16 *)(a2 + 24));
  v8 = v5 - v6 - v7;
  v9 = a4[43];
  v10 = *(unsigned __int16 *)(a3 + 86);
  v11 = v9 - (v5 + v6) + v10;
  v12 = v11 + 2;
  v13 = v11 + 3;
  if (v12 >= 0)
    v13 = v12;
  v14 = v13 >> 1;
  v15 = 100 * v8 / (v13 >> 1);
  v16 = *result;
  v17 = *(_DWORD *)(a3 + 24);
  if (v17 == 64 || v17 == 29810 || v17 == 116)
  {
    if (v15 < 0)
      v18 = 10;
    else
      v18 = -10;
    goto LABEL_9;
  }
  if (v15 < -14)
  {
    v18 = 100;
LABEL_9:
    *result = v18;
    goto LABEL_10;
  }
  if (v15 >= 15)
  {
    v18 = -100;
    goto LABEL_9;
  }
  v18 = *result;
LABEL_10:
  v19 = result[1];
  v20 = v9 - v10 - v7;
  v21 = 100;
  v22 = 100 * v20 / v14;
  if (v22 <= 14)
  {
    if (v22 > -15)
    {
      v21 = result[1];
      if (a5)
        goto LABEL_14;
      goto LABEL_18;
    }
    v21 = 156;
  }
  result[1] = v21;
  if (a5)
  {
LABEL_14:
    *result = (char)(v18 + ((v18 & 0x80) >> 7)) >> 1;
    result[1] = (char)(v21 + (v21 >> 7)) >> 1;
    result[2] = (char)(result[2] + ((result[2] >> 13) & 3)) >> 2;
    result[3] = (char)(result[3] + (result[3] >> 7)) >> 1;
    return result;
  }
LABEL_18:
  v23 = result[2];
  if (v23 >= 1 && (v18 * v16 < 0 || (char)v21 * v19 < 0))
    result[2] = v23 >> 1;
  return result;
}

uint64_t getUpInfo(uint64_t a1)
{
  int v1;
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 24);
  if (v1 == 26214 || v1 == 27756)
    return 83;
  if ((v1 - 128) < 0xFFFFFFA0)
    return 32;
  v4 = (v1 - 32);
  if ((unint64_t)(v4 - 16) > 9)
    return upInfo[v4];
  if (*(_DWORD *)(a1 + 64) == -1)
    return 68;
  return 32;
}

BOOL shouldTestSplit(uint64_t a1)
{
  const char *v2;
  int v3;
  float v4;
  _BOOL8 result;
  double v6;
  double v7;

  v2 = (const char *)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 40);
  v4 = *(float *)(a1 + 44);
  if (v4 > 0.5)
    return (v3 != 72 || v4 >= 0.9) && (v3 != 37 || *(float *)(a1 + 48) <= 0.25);
  if (index("mMwWU", v3)
    || *(float *)(a1 + 44) < 0.1
    || (*(_BYTE *)(a1 + 93) & 1) == 0
    || (result = 1,
        5 * (*(unsigned __int16 *)(a1 + 82) - *(unsigned __int16 *)(a1 + 80)) <= ((6
                                                                                 * (*(unsigned __int16 *)(a1 + 86)
                                                                                  - *(unsigned __int16 *)(a1 + 84))) | 1)))
  {
    if (v3 > 28273)
    {
      if (v3 != 28274)
      {
        if (v3 == 29300)
        {
          v6 = *(float *)(a1 + 44);
          v7 = 0.04;
          goto LABEL_22;
        }
        if (v3 != 29810)
          return strstr("BCDFGHKLMPQRSTVWXZbcdfghkmpqrstvwxz", v2)
              && *(_DWORD *)(a1 + 64) != -1
              && *(float *)(a1 + 48) < 0.95;
      }
    }
    else if (v3 != 26740)
    {
      if (v3 == 27750 || v3 == 28267)
      {
        v6 = *(float *)(a1 + 44);
        v7 = 0.01;
LABEL_22:
        if (v6 > v7 || *(_DWORD *)(a1 + 64) != -1)
          return 1;
      }
      return strstr("BCDFGHKLMPQRSTVWXZbcdfghkmpqrstvwxz", v2)
          && *(_DWORD *)(a1 + 64) != -1
          && *(float *)(a1 + 48) < 0.95;
    }
    v6 = *(float *)(a1 + 44);
    v7 = 0.1;
    goto LABEL_22;
  }
  return result;
}

uint64_t trySplit(_QWORD *a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t i;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  uint64_t result;
  char *v29;
  char *v30;
  size_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 *v36;
  unsigned int v37;
  unint64_t v38;
  int v39;
  unsigned int v40;
  _WORD *v41;
  unsigned int v42;
  int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  unsigned __int16 v48;
  int v49;
  unint64_t v50;
  BOOL v51;
  char v53;
  uint64_t v54;
  int v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  int PathStats;
  int v61;
  int v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  unsigned __int8 *v66;
  uint64_t v67;
  uint64_t v68;
  float *v69;
  unsigned int v70;
  unsigned int v71;
  BOOL v73;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  unsigned int v78;
  unsigned __int8 *v79;
  unsigned int v80;
  unsigned int v81;
  char v83;
  _BOOL4 v84;
  int v85;
  char *v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unsigned int v98;
  int v99;
  int v100;
  _BYTE *v101;
  char v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  unsigned __int16 *v106;
  int v107;
  int v108;
  int v109;
  int v110;
  uint64_t v111;
  unsigned int v112;
  _BOOL8 v113;
  int v114;
  unsigned __int16 *v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  _BYTE *v119;
  int v120;
  int v121;
  uint64_t v122;
  char v123;
  char v124;
  int v125;
  BOOL v126;
  int v128;
  unsigned int v129;
  unint64_t v130;
  int v131;
  uint64_t v132;
  _QWORD *v133;
  int v134;
  _WORD *v135;
  _WORD *v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  int *v140;
  int v141;
  uint64_t v142;
  _QWORD *v143;
  int v144;
  _BYTE *v145;
  uint64_t v146;
  __int16 *v147;
  int v148;
  int v149;
  int v150;
  uint64_t v151;
  int *v152;
  int v153;
  _BYTE v154[12];
  int v155;
  uint64_t v156;
  int *v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  unint64_t v161;
  unint64_t v162;
  _BYTE *v163;
  float *v164;
  char *v165;
  char *v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  __int128 v170;
  _QWORD v171[2];
  char v172;
  _BYTE v173[216];
  _QWORD v174[7];

  v174[5] = *MEMORY[0x1E0C80C00];
  v156 = a2;
  v157 = a3;
  v4 = a1[35];
  v169 = *(int *)(*(_QWORD *)(a2 + 8) + 4 * *a3);
  v5 = *(unsigned __int16 *)(v4 + 100 * (int)v169 + 86)
     - (unint64_t)*(unsigned __int16 *)(v4 + 100 * (int)v169 + 84)
     + 1;
  MEMORY[0x1E0C80A78](a1);
  v9 = &v154[-v8];
  for (i = 0; i != 30; i += 3)
  {
    v171[i] = v9;
    v9 += 2 * v5;
  }
  v161 = *(unsigned __int16 *)(v6 + 100 * (int)v169 + 82)
       - (unint64_t)*(unsigned __int16 *)(v6 + 100 * (int)v169 + 80);
  v11 = v161 + 1;
  v12 = (int)v5 * (uint64_t)((int)v161 + 1);
  if (1 - (int)v12 >= 0)
    v13 = -((1 - v12) & 0x3F);
  else
    v13 = (v12 - 1) & 0x3F;
  v14 = v161 + 1;
  v15 = (52 * v11 + 63) & 0xFFFFFFC0;
  v16 = v12 - v13 + v15;
  v17 = (v7 + 2) * 2 * v11;
  if (1 - v17 >= 0)
    v18 = -((1 - v17) & 0x3F);
  else
    v18 = (v17 - 1) & 0x3F;
  v19 = v17 - v18 + 63;
  v20 = (2 * v12 + 63) & 0xFFFFFFC0;
  v21 = v16 + v20 + v19 + 63;
  v22 = a1[43];
  v23 = *(_DWORD *)(v22 + 2624);
  v168 = (v161 + 1);
  v158 = v7;
  if (v23 >= v21)
  {
    v155 = 2 * v11;
    v162 = v5;
  }
  else
  {
    v24 = v21 + v21 / 4;
    if (1 - v24 >= 0)
      v25 = -((1 - v24) & 0xFFF);
    else
      v25 = (v24 - 1) & 0xFFF;
    v26 = v24 - v25 + 4095;
    v27 = *(void **)(v22 + 2616);
    if (v27)
    {
      result = (uint64_t)malloc_type_realloc(v27, v26, 0x803A58C0uLL);
      if (!result)
        return result;
      v22 = a1[43];
      *(_QWORD *)(v22 + 2616) = result;
    }
    else
    {
      result = (uint64_t)malloc_type_malloc(v26, 0xF088B064uLL);
      v22 = a1[43];
      *(_QWORD *)(v22 + 2616) = result;
      if (!result)
        return result;
    }
    v155 = 2 * v11;
    v162 = v5;
    *(_DWORD *)(v22 + 2624) = v26;
    v14 = v168;
  }
  v167 = *(char **)(v22 + 2616);
  v29 = &v167[v15];
  v30 = &v29[v20];
  v31 = v19;
  v32 = &v30[v19];
  bzero(v30, v31);
  v33 = (uint64_t)&v30[v12 + v14 + v14];
  v165 = &v29[v12];
  v166 = v29;
  v34 = a1[35];
  v35 = v34 + 100 * (int)v169;
  v37 = *(unsigned __int16 *)(v35 + 80);
  v36 = (unsigned __int16 *)(v35 + 80);
  v38 = v36[1] - (unint64_t)v37 + 1;
  bzero(v32, v38 + (int)v38 * (uint64_t)(v36[3] - v36[2]));
  v39 = v36[3];
  v40 = v36[2];
  if (v39 >= v40)
  {
    v41 = (_WORD *)(a1[32] + 8 * *(int *)(v34 + 100 * (int)v169 + 12));
    v42 = *v36;
    do
    {
      v43 = v36[1];
      if (v43 >= v42)
      {
        v44 = (v39 - v40) * v38;
        do
        {
          v45 = (unsigned __int16)(*(v41 - 1) + 1) | ((unsigned __int16)v41[3] << 16);
          v46 = a1[32];
          v47 = ((unint64_t)v41 - v46) >> 3;
          while (1)
          {
            v48 = (*v41 >> 2) + *(_WORD *)(a1[33] + 2 * ((int)v47 >> 6));
            v49 = (unsigned __int16)v41[2];
            if (!v41[2])
              break;
            v50 = ((unint64_t)v41 - v46) >> 3;
            if ((_DWORD)v50 - v49 == -1 || v39 >= v48 && (v39 != v48 || (unsigned __int16)v45 <= v43))
              break;
            LODWORD(v47) = v50 - v49;
            v41 = (_WORD *)(v46 + 8 * ((int)v50 - v49));
            v45 = (unsigned __int16)(*(v41 - 1) + 1) | ((unsigned __int16)v41[3] << 16);
          }
          v51 = v39 != v48 || v43 < (unsigned __int16)v45;
          v53 = !v51 && v43 <= (int)HIWORD(v45);
          v32[v44 - v42 + v43] = v53;
          v42 = *v36;
          v51 = v43-- <= (int)v42;
        }
        while (!v51);
        v40 = v36[2];
      }
      v51 = v39-- <= (int)v40;
    }
    while (!v51);
  }
  v54 = v168;
  v55 = v162;
  v56 = v166;
  calculatePenaltiesForBestPath(v168, v162, (uint64_t)v32, (uint64_t)v30, (uint64_t)v166, 1);
  v57 = v165;
  calculatePenaltiesForBestPath(v54, v55, (uint64_t)v32, v33, (uint64_t)v165, 0);
  v58 = (uint64_t)v30;
  v59 = v167;
  PathStats = getPathStats(v54, v55, (uint64_t)v32, v58, (uint64_t)v56, v167, 1);
  result = 0;
  if (!PathStats)
  {
    v61 = getPathStats(v54, v55, (uint64_t)v32, v33 + (int)v158 * (uint64_t)v11, (uint64_t)v57, &v59[26 * (int)v54], 0);
    result = 0;
    if (!v61)
    {
      v163 = v173;
      filterSplits((_BOOL8)v32, (uint64_t)v59, (uint64_t)v166, 1u, v54, v55);
      v164 = (float *)&v59[26 * (int)v54];
      filterSplits((_BOOL8)v32, (uint64_t)v164, (uint64_t)v57, 0, v54, v55);
      if (v55 >= 0)
        v62 = v55;
      else
        v62 = v55 + 7;
      if ((v161 & 0x80000000) != 0)
      {
LABEL_123:
        v159 = 0;
        goto LABEL_125;
      }
      v63 = 0;
      v64 = 0;
      v160 = (v62 >> 3) + 1;
      v65 = 26 * (int)v54;
      v66 = (unsigned __int8 *)(v59 + 20);
      LODWORD(v67) = -1;
      LODWORD(v68) = -1;
      v69 = v164;
      v159 = v65;
      while (1)
      {
        v70 = *v66;
        v71 = v66[v65];
        if (v71 <= 0xFD)
          v67 = v63;
        else
          v67 = v67;
        if (v70 <= 0xFD)
          v68 = v63;
        else
          v68 = v68;
        if (v70 <= 0xFD || v71 <= 0xFD)
          v64 = 0;
        if (v64)
          v73 = 1;
        else
          v73 = (_DWORD)v68 == -1;
        if (v73 || (_DWORD)v67 == -1)
          goto LABEL_94;
        v75 = (uint64_t)&v59[26 * (int)v68];
        v76 = (uint64_t)v69 + 26 * (int)v67;
        v77 = *(unsigned __int8 *)(v75 + 22);
        v161 = v75 + 22;
        v79 = (unsigned __int8 *)(v76 + 22);
        v78 = *(unsigned __int8 *)(v76 + 22);
        if (v77 >= v78)
          v80 = *(unsigned __int8 *)(v76 + 22);
        else
          v80 = v77;
        if (v77 <= v78)
          v81 = *(unsigned __int8 *)(v76 + 22);
        else
          v81 = v77;
        v83 = v80 == 1 && v81 == 2;
        v84 = areCutsTooClose(v162, v68, v77, (_WORD *)v75, v67, v78, (_WORD *)v69 + 13 * (int)v67, v160 << v83);
        v85 = 0;
        LOBYTE(v174[0]) = 0;
        if (!v84)
        {
          if (!isCuttingSerif ((uint64_t)v32, (unsigned __int16 *)v75, (unsigned __int16 *)v76, v168, v162, (BOOL *)v174)
            && !cutsCreateBadConcomp((uint64_t)v32, v75, (uint64_t)v166, v68, 1, v76, (uint64_t)v165, v67, 0, v168, v162))
          {
            v59 = v167;
            v54 = v168;
            v69 = v164;
            v65 = v159;
            goto LABEL_93;
          }
          v85 = LOBYTE(v174[0]);
        }
        if ((int)v67 >= (int)v68)
        {
          v54 = v168;
          v69 = v164;
          if (v85)
          {
            v59 = v167;
            if (*((unsigned __int8 *)v164 + 26 * (int)v67 + 20) <= 2
                                                                  * v167[26 * (int)v68 + 20])
              goto LABEL_91;
          }
          else
          {
            v90 = *(unsigned __int8 *)v161;
            if (v90 <= 1)
              v90 = 1;
            v91 = v90 * v167[26 * (int)v68 + 20];
            v92 = *v79;
            v59 = v167;
            if (v92 <= 1)
              v92 = 1;
            if (v91 >= v92 * *((unsigned __int8 *)v164 + 26 * (int)v67 + 20))
            {
LABEL_91:
              v86 = &v59[26 * (int)v68 + 20];
              LODWORD(v68) = -1;
              goto LABEL_92;
            }
          }
        }
        else
        {
          v54 = v168;
          v69 = v164;
          if (v85)
          {
            v59 = v167;
            if (v167[26 * (int)v68 + 20] > 2
                                                           * *((unsigned __int8 *)v164 + 26 * (int)v67 + 20))
              goto LABEL_91;
          }
          else
          {
            v87 = *v79;
            if (v87 <= 1)
              v87 = 1;
            v88 = v87 * *((unsigned __int8 *)v164 + 26 * (int)v67 + 20);
            v89 = *(unsigned __int8 *)v161;
            if (v89 <= 1)
              v89 = 1;
            v59 = v167;
            if (v88 < v89 * v167[26 * (int)v68 + 20])
              goto LABEL_91;
          }
        }
        v86 = (char *)v69 + 26 * (int)v67 + 20;
        LODWORD(v67) = -1;
LABEL_92:
        v65 = v159;
        *v86 = -2;
LABEL_93:
        v64 = 1;
LABEL_94:
        v66 += 26;
        if (v54 == ++v63)
        {
          v159 = 0;
          v93 = 0;
          if (v155 <= 1)
            v94 = 1;
          else
            v94 = v155;
          v95 = MEMORY[0x1E0C809B0];
          while (1)
          {
            v96 = v93 >> 1;
            v97 = v167;
            if ((v93 & 1) == 0)
              v97 = (char *)v69;
            v98 = v97[26 * v96 + 20];
            if (v98 <= 0xFD)
            {
              v99 = v162;
              v100 = v159;
              v101 = &v163[24 * (int)v159];
              v101[16] = 0;
              *((_DWORD *)v101 + 2) = v96;
              *((_DWORD *)v101 + 3) = v98;
              v102 = v97[26 * v96 + 22];
              if ((v93 & 1) != 0)
                v103 = v166;
              else
                v103 = v165;
              v101[17] = v102;
              v174[0] = v95;
              v174[1] = 0x40000000;
              v174[2] = __markSplits_block_invoke;
              v174[3] = &__block_descriptor_tmp_35;
              v174[4] = v101;
              if ((walkPathAndReturnFinalColumn((uint64_t)v103, v168, v99, v96, v93 & 1, (uint64_t)v174) & 0x80000000) != 0)
                goto LABEL_123;
              v159 = (v100 + 1);
              v69 = v164;
              if (v100 == 7)
                break;
            }
            if (v94 == ++v93)
              goto LABEL_125;
          }
          v159 = 8;
LABEL_125:
          v104 = 0;
          v105 = a1[35];
          v106 = (unsigned __int16 *)(v105 + 100 * (int)v169);
          v107 = v106[41];
          v108 = v106[43];
          v109 = v106[42];
          v110 = v106[40];
          *(_QWORD *)&v170 = 0;
          v111 = 1;
          v112 = v159;
          do
          {
            v113 = v111;
            *((_DWORD *)v174 + v104) = -1;
            v114 = *(_DWORD *)(v105 + 100 * (int)v169 + 4 * v104 + 64);
            if (v114 != -1)
            {
              v115 = (unsigned __int16 *)(v105 + 100 * v114);
              *((_DWORD *)v174 + v104) = ((v115[41] + v115[40] + 1) >> 1) - v110;
              *((_DWORD *)&v171[-1] + v104) = ((v115[43] + v115[42] + 1) >> 1)
                                            - ((v108 + v109 + 1) >> 1);
            }
            v111 = 0;
            v104 = 1;
          }
          while (v113);
          v116 = 0;
          v160 = v107 - v110 + 1;
          v117 = v108 - v109;
          v118 = v105 + 100 * (int)v169;
          v164 = (float *)(v118 + 48);
          v167 = (char *)(v118 + 40);
          v168 = (int)v112;
          v161 = v112;
          do
          {
            v119 = v163;
            if (v116 < v168)
              v163[24 * v116 + 16] = 0;
            if (v116)
              v120 = *(_DWORD *)&v119[24 * (v116 - 1) + 8];
            else
              v120 = 0;
            v121 = v160;
            if (v116 < v168)
              v121 = *(_DWORD *)&v119[24 * v116 + 8];
            v122 = 0;
            v165 = &v119[24 * v116 + 16];
            v166 = &v119[24 * (v116 - 1) + 16];
            v123 = 1;
            do
            {
              v124 = v123;
              if ((*((_DWORD *)&v171[-1] + v122) & 0x80000000) != 0)
              {
                v125 = *((_DWORD *)v174 + v122);
                v126 = v120 < v125 && v125 < v121;
                if (v126 && 4 * (v121 - v120) / 3 <= v117)
                {
                  v113 = diacriticLooksLikeDot((uint64_t)a1, *(_DWORD *)(v105 + 100 * (int)v169 + 4 * v122 + 64));
                  if (v113 && (*(_DWORD *)v167 != 78 || *v164 <= 0.8))
                  {
                    if (v116 < v168)
                      ++*v165;
                    if (v116)
                      ++*v166;
                  }
                }
              }
              v123 = 0;
              v122 = 1;
            }
            while ((v124 & 1) != 0);
            v73 = v116++ == v161;
          }
          while (!v73);
          v128 = v159;
          v129 = v162;
          if ((int)v159 < 1)
            return 0;
          v130 = 0;
          v131 = 0;
          v132 = 24 * v161;
          do
          {
            v133 = &v171[v130 / 8];
            if (v173[v130 + 16])
              v134 = v131 + 1;
            else
              v134 = 0;
            if (v134 >= 3)
            {
              if (*((unsigned __int8 *)v133 + 16) < 2u)
              {
                v134 = v131 + 1;
              }
              else
              {
                *((_BYTE *)v133 + 16) = 0;
                v134 = 1;
              }
            }
            v130 += 24;
            v131 = v134;
          }
          while (v132 != v130);
          v172 = 1;
          LOBYTE(v171[3 * (v128 + 1) + 2]) = 1;
          if ((v158 & 0x80000000) == 0)
          {
            v135 = (_WORD *)v171[0];
            v136 = (_WORD *)v171[3 * (v128 + 1)];
            v137 = v129;
            do
            {
              *v135++ = 0;
              *v136++ = -1;
              --v137;
            }
            while (v137);
          }
          MEMORY[0x1E0C80A78](v113);
          v140 = (int *)&v154[-((v139 + 15) & 0x7FFFFFFF0)];
          v141 = 0;
          LODWORD(v142) = 0;
          v167 = (char *)v174 + 4;
          v143 = v138 + 2;
          v144 = 1;
          while (2)
          {
            v145 = &v143[3 * v144];
            v146 = v144 - 1;
            while (!*v145)
            {
              ++v144;
              v145 += 24;
              if (++v146 > v168)
                goto LABEL_187;
            }
            v147 = (__int16 *)*((_QWORD *)v145 - 2);
            if (!v141 && *v147 == -1)
            {
              splitCCIfGood((size_t)a1, v169, v169, (uint64_t)v171, 0, v144, (uint64_t)v174);
              v141 = v174[0];
              v170 = *(_OWORD *)v167;
              v150 = HIDWORD(v170);
              if (HIDWORD(v170))
                goto LABEL_185;
              goto LABEL_182;
            }
            v148 = createAndRecognizeSubConcomp((size_t)a1, v169, (_WORD *)v138[3 * v141], (uint64_t)v147);
            if (v148 != -1)
            {
              v149 = v148;
              if (v144 - v141 < 2
                || !shouldTestSplit(a1[35] + 100 * v148)
                || (splitCCIfGood((size_t)a1, v169, v149, (uint64_t)v171, v141, v144, (uint64_t)v174),
                    v144 = v174[0],
                    v170 = *(_OWORD *)v167,
                    v150 = HIDWORD(v170),
                    v141 = v174[0],
                    !HIDWORD(v170)))
              {
                v140[(int)v142] = v149;
                LODWORD(v142) = v142 + 1;
                v141 = v144;
                goto LABEL_182;
              }
LABEL_185:
              if (v150 >= 1)
              {
                memcpy(&v140[(int)v142], &v170, 4 * v150);
                LODWORD(v142) = v142 + v150;
              }
LABEL_182:
              v138 = v171;
              v144 = v141 + 1;
              if (v141 <= (int)v159)
                continue;
LABEL_187:
              if ((int)v142 < 1)
                return 0;
              v151 = 0;
              while (v140[v151] != -1)
              {
                if (++v151 >= (unint64_t)v142)
                {
                  setDiacriticsOnSubCC((uint64_t)a1, v169, v140, v142, 0);
                  v152 = v157;
                  *v152 = v142 + FKSequencesReplaceConcomp(a1, v156, *v157, v140, v142) - 1;
                  return 1;
                }
              }
              goto LABEL_193;
            }
            break;
          }
          if ((int)v142 <= 0)
            return 0;
LABEL_193:
          v142 = v142;
          do
          {
            v153 = *v140++;
            FKConcompRelease((uint64_t)a1, v153, 0);
            result = 0;
            --v142;
          }
          while (v142);
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t createAndRecognizeSubConcomp(size_t a1, int a2, _WORD *a3, uint64_t a4)
{
  uint64_t SubConcomp;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int16 *v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  BOOL v21;
  int v22;
  int v23;
  unsigned int v24;
  int v27;

  SubConcomp = FKConcompCreateSubConcomp(a1, a2, a3, a4);
  v27 = SubConcomp;
  if ((_DWORD)SubConcomp == -1)
    return 0xFFFFFFFFLL;
  v8 = SubConcomp;
  v9 = *(_QWORD *)(a1 + 280);
  v10 = v9 + 100 * a2;
  v11 = *(unsigned __int16 *)(v10 + 86);
  v12 = *(unsigned __int16 *)(v10 + 84);
  v13 = (unsigned __int16 *)(v9 + 100 * (int)SubConcomp);
  v14 = v11 - v12;
  v15 = v13[43];
  v16 = v13[42];
  v17 = v15 - v16 + 1;
  if ((*(_BYTE *)(v10 + 93) & 3) != 0)
    v18 = 4;
  else
    v18 = 3;
  v19 = v18 * v17;
  v20 = 2 * v17;
  v21 = v19 > v14 || v13[41] - v13[40] + 1 < v20;
  if (v21 || (v22 = v14 + 1, (int)(5 * (v11 - v15)) <= v22) || (int)(5 * (v16 - v12)) <= v22)
  {
    v24 = (v11 + v12 + 1) >> 1;
    if (v24 < v15 && v24 > v16)
    {
      setDiacriticsOnSubCC(a1, a2, &v27, 1, 1);
      FKRecognizeConcomp(a1, (uint64_t)v13);
      return v8;
    }
    return 0xFFFFFFFFLL;
  }
  v23 = SubConcomp;
  ccSetStr((float32x4_t *)(v9 + 100 * (int)SubConcomp), 0x2Du, 1, v7);
  *(_BYTE *)(v9 + 100 * v23 + 94) |= 9u;
  return v8;
}

uint64_t splitCCIfGood@<X0>(size_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  int v9;
  int v13;
  float ConfusionScoreForCC;
  int v15;
  uint64_t v16;
  int v17;
  float v18;
  uint64_t v19;
  _QWORD *v20;
  _WORD *v21;
  uint64_t *v22;
  _WORD *v23;
  _WORD **v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  uint64_t result;
  float v49;
  _BOOL4 v50;
  uint64_t v51;
  float v52;
  int v53;
  int v54;
  int v55;
  BOOL v56;
  int v57;
  unint64_t v58;
  float v59;
  float v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  unsigned int v65;
  unsigned __int8 *v66;
  int v67;
  float v68;
  float v69;
  float v70;
  BOOL v71;
  BOOL v72;
  float v73;
  unsigned int v74;
  float v75;
  int *v76;
  uint64_t v77;
  int v78;
  int *v79;
  int v80;
  int *v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  float v90;
  float v91;
  float v92;
  float v93;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106[2];
  int v107[2];
  int v108[3];
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  float v112;
  uint64_t v113;

  v9 = a3;
  v113 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)a7 = 0;
  *(_QWORD *)(a7 + 8) = 0;
  *(_DWORD *)(a7 + 16) = 0;
  v13 = ~a5 + a6;
  v109 = 0;
  v110 = 0;
  v112 = 0.0;
  v111 = 0;
  if (a3 == -1)
    ConfusionScoreForCC = 0.0;
  else
    ConfusionScoreForCC = getConfusionScoreForCC(*(_QWORD *)(a1 + 280) + 100 * a3);
  v98 = a5;
  v95 = v13;
  v92 = ConfusionScoreForCC;
  if (v13 < 3)
  {
    v15 = a5;
    if (v13 == 1)
    {
      v19 = a4 + 24 * a5;
      v20 = (_QWORD *)(a4 + 24 * v15);
      v23 = (_WORD *)*v20;
      v22 = v20 + 6;
      v21 = v23;
      v25 = *(_QWORD *)(v19 + 24);
      v24 = (_WORD **)(v19 + 24);
      v26 = createAndRecognizeSubConcomp(a1, a2, v21, v25);
      v96 = 1;
      v97 = -1;
      v93 = 0.0;
      v99 = -1;
      v27 = -1;
      v28 = -1;
      goto LABEL_12;
    }
    v16 = a5 + 3;
    goto LABEL_10;
  }
  v15 = a5;
  v16 = a5 + 3;
  v17 = createAndRecognizeSubConcomp(a1, a2, *(_WORD **)(a4 + 24 * a5), *(_QWORD *)(a4 + 24 * a5 + 72));
  if (v17 == -1)
  {
LABEL_10:
    v96 = 1;
    v97 = -1;
    v18 = 0.0;
    goto LABEL_11;
  }
  v97 = v17;
  v18 = getConfusionScoreForCC(*(_QWORD *)(a1 + 280) + 100 * v17);
  v96 = 0;
LABEL_11:
  v93 = v18;
  v29 = 24 * v15;
  v30 = a4 + 24 * a5;
  v31 = *(_QWORD *)(v30 + 24);
  v24 = (_WORD **)(v30 + 24);
  v26 = createAndRecognizeSubConcomp(a1, a2, *(_WORD **)(a4 + v29), v31);
  v99 = createAndRecognizeSubConcomp(a1, a2, *v24, (uint64_t)v24[3]);
  v22 = (uint64_t *)(a4 + 24 * v16);
  v27 = createAndRecognizeSubConcomp(a1, a2, v24[3], *v22);
  v28 = createAndRecognizeSubConcomp(a1, a2, *(_WORD **)(a4 + v29), (uint64_t)v24[3]);
LABEL_12:
  v32 = createAndRecognizeSubConcomp(a1, a2, *v24, *v22);
  v33 = 0.0;
  v34 = 0.0;
  if (v26 != -1)
    v34 = getConfusionScoreForCC(*(_QWORD *)(a1 + 280) + 100 * v26);
  if (v99 != -1)
    v33 = getConfusionScoreForCC(*(_QWORD *)(a1 + 280) + 100 * v99);
  v35 = 0.0;
  v36 = 0.0;
  if (v27 != -1)
    v36 = getConfusionScoreForCC(*(_QWORD *)(a1 + 280) + 100 * v27);
  if (v28 != -1)
    v35 = getConfusionScoreForCC(*(_QWORD *)(a1 + 280) + 100 * v28);
  v37 = 0.0;
  v38 = 0.0;
  if (v32 != -1)
    v38 = getConfusionScoreForCC(*(_QWORD *)(a1 + 280) + 100 * v32);
  if (isFeasablePart(a1, a2, v26))
    v39 = v34;
  else
    v39 = 0.0;
  if (isFeasablePart(a1, a2, v99))
    v40 = v33;
  else
    v40 = 0.0;
  if (!isFeasablePart(a1, a2, v27))
    v36 = 0.0;
  if (isFeasablePart(a1, a2, v28))
    v41 = v35;
  else
    v41 = 0.0;
  if (!isFeasablePart(a1, a2, v32))
    v38 = 0.0;
  if (!v96)
    v9 = v97;
  v108[0] = v26;
  v108[1] = v99;
  v108[2] = v27;
  v107[0] = v26;
  v107[1] = v32;
  v106[0] = v28;
  v106[1] = v27;
  v42 = a4 + 24 * v98;
  v43 = v42 + 24;
  v44 = v42 + 48;
  if (isSaneSplit(a1, v9, v108, 3, v42 + 24, 1u))
  {
    if (v39 >= v40)
      v45 = v40;
    else
      v45 = v39;
    if (v36 >= v45)
      v37 = v45;
    else
      v37 = v36;
    *(float *)&v109 = v37;
  }
  v46 = 0.0;
  v47 = 0.0;
  if (isSaneSplit(a1, v9, v108, 2, v43, 1u))
  {
    if (v39 >= v40)
      v47 = v40;
    else
      v47 = v39;
    *(float *)&v111 = v47;
  }
  if (isSaneSplit(a1, v9, v106, 2, v44, 1u))
  {
    if (v41 >= v36)
      v46 = v36;
    else
      v46 = v41;
    *((float *)&v109 + 1) = v46;
  }
  v91 = v36;
  *((float *)&v111 + 1) = v41;
  result = isSaneSplit(a1, v9, v107, 2, v43, 1u);
  if ((_DWORD)result)
  {
    if (v39 >= v38)
      v49 = v38;
    else
      v49 = v39;
    *(float *)&v110 = v49;
  }
  else
  {
    v49 = 0.0;
  }
  v90 = v38;
  if (v28 == -1)
  {
    v112 = v39;
    *((float *)&v110 + 1) = v93;
    v53 = 1;
    v52 = v39;
  }
  else
  {
    v50 = isSaneSplit(a1, v28, v108, 2, v43, 0);
    v51 = 24;
    if (v50)
    {
      v52 = v39;
    }
    else
    {
      v51 = 16;
      v52 = 0.0;
    }
    if (!v50)
      v47 = 0.0;
    *(float *)((char *)&v109 + v51) = v52;
    *((float *)&v110 + 1) = v93;
    result = shouldTestSplit(*(_QWORD *)(a1 + 280) + 100 * v28);
    v53 = result;
  }
  if (v32 == -1)
  {
    v54 = 1;
  }
  else
  {
    result = shouldTestSplit(*(_QWORD *)(a1 + 280) + 100 * v32);
    v54 = result;
  }
  if (v95 >= 3)
  {
    v55 = v97;
    if ((v96 & 1) != 0)
    {
      result = 1;
    }
    else
    {
      v62 = *(_QWORD *)(a1 + 280);
      v63 = v62 + 100 * v97;
      v64 = *(_BYTE *)(v63 + 40);
      if (!v64)
        goto LABEL_112;
      v65 = 0;
      v66 = (unsigned __int8 *)(v62 + 100 * v97 + 41);
      do
      {
        if ((v64 & 0xC0) != 0x80)
          ++v65;
        v67 = *v66++;
        v64 = v67;
      }
      while (v67);
      if (v65 < 2)
        goto LABEL_112;
      if (concatenatedCCsMatchCC(a1, v26, v32, v63))
      {
        v68 = v90;
        if (v39 < v90)
          v68 = v39;
        if (v68 > 0.9)
          goto LABEL_111;
      }
      if (concatenatedCCsMatchCC(a1, v28, v27, v63) && (v41 >= v91 ? (v69 = v91) : (v69 = v41), v69 > 0.9))
LABEL_111:
        result = 0;
      else
LABEL_112:
        result = shouldTestSplit(v63);
    }
    if (v41 <= v47)
      v70 = v47;
    else
      v70 = v41;
    if (v70 <= v52)
      v70 = v52;
    if (v93 > v70 || (v93 > 0.8 ? (v71 = (_DWORD)result == 0) : (v71 = 0), v71))
    {
      v58 = 3;
    }
    else if (v53 && v52 != 0.0
           || (v41 > 0.9 ? (v72 = v54 == 0) : (v72 = 1), v72 && (v47 <= v52 ? (v73 = v52) : (v73 = v47), v41 <= v73)))
    {
      if (v47 <= v52)
        v58 = 6;
      else
        v58 = 4;
    }
    else
    {
      v58 = 5;
    }
    goto LABEL_136;
  }
  if (v53)
    v56 = v54 == 0;
  else
    v56 = 1;
  v57 = !v56;
  v55 = v97;
  if (!v56 && v37 > v49 && v37 > v46)
  {
    v58 = 0;
LABEL_136:
    v59 = v92;
    goto LABEL_137;
  }
  v59 = v92;
  if (v37 > 0.99)
  {
    v60 = v46 <= v49 ? v49 : v46;
    if (v60 < 0.9)
    {
      v58 = 0;
LABEL_137:
      v61 = v99;
      goto LABEL_138;
    }
  }
  if (!(v53 | v54))
  {
    if (v49 <= v46)
      v58 = 1;
    else
      v58 = 2;
    goto LABEL_137;
  }
  v61 = v99;
  if (v57)
  {
    if (v49 <= v46)
      v58 = 1;
    else
      v58 = 2;
  }
  else if (v53)
  {
    v58 = 2;
  }
  else
  {
    v58 = 1;
  }
LABEL_138:
  v74 = 0;
  v75 = *((float *)&v109 + v58);
  v100 = v26;
  v101 = v61;
  v102 = v27;
  v103 = v28;
  v104 = v32;
  v105 = v55;
  *(_DWORD *)(a7 + 16) = 0;
  if (((0x2AuLL >> v58) & 1) == 0)
  {
    v74 = 1;
    *(_DWORD *)(a7 + 16) = 1;
    *(_DWORD *)(a7 + 4) = v26;
    v100 = -1;
  }
  if ((v58 & 3) == 1)
  {
    v76 = &v103;
  }
  else
  {
    if ((v58 & 3) != 0)
      goto LABEL_145;
    v76 = &v101;
    v28 = v61;
  }
  v77 = a7 + 4 * v74++;
  *(_DWORD *)(a7 + 16) = v74;
  *(_DWORD *)(v77 + 4) = v28;
  *v76 = -1;
LABEL_145:
  if (v58 == 2)
  {
    v78 = 0;
    v79 = &v104;
LABEL_151:
    *(_DWORD *)(a7 + 16) = v74 + 1;
    *(_DWORD *)(a7 + 4 * v74 + 4) = v32;
    *v79 = -1;
    goto LABEL_152;
  }
  if (v58 < 2)
  {
    v78 = 0;
    v79 = &v102;
    v32 = v27;
    goto LABEL_151;
  }
  if (v58 == 3)
  {
    v79 = &v105;
    v78 = 1;
    v32 = v55;
    goto LABEL_151;
  }
  v78 = 0;
LABEL_152:
  v80 = *(_DWORD *)(a7 + 16);
  if (v80 < 1)
  {
LABEL_156:
    v84 = 0;
  }
  else
  {
    v81 = (int *)(a7 + 4);
    v82 = *(unsigned int *)(a7 + 16);
    while (1)
    {
      v83 = *v81++;
      if (v83 == -1)
        break;
      if (!--v82)
        goto LABEL_156;
    }
    v84 = 1;
  }
  v85 = 0;
  if (v59 >= v75)
    v86 = 1;
  else
    v86 = v84;
  do
  {
    v87 = *(int *)((char *)&v100 + v85);
    if (v87 != -1)
      result = FKConcompRelease(a1, v87, 0);
    v85 += 4;
  }
  while (v85 != 24);
  *(_DWORD *)a7 = a6;
  if (v86)
  {
    if (v80 >= 1)
    {
      v88 = 0;
      v89 = a7 + 4;
      do
      {
        result = FKConcompRelease(a1, *(_DWORD *)(v89 + 4 * v88), 0);
        *(_DWORD *)(v89 + 4 * v88++) = -1;
      }
      while (v88 < *(int *)(a7 + 16));
    }
    *(_DWORD *)(a7 + 16) = 0;
  }
  else if (v95 >= 3)
  {
    *(_DWORD *)a7 = v98 + 1;
    if (((0x4CuLL >> v58) & 1) != 0)
    {
      if (v78)
        *(_DWORD *)a7 = v98 + 3;
    }
    else
    {
      *(_DWORD *)a7 = v98 + 2;
    }
  }
  return result;
}

uint64_t setDiacriticsOnSubCC(uint64_t result, int a2, int *a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  _DWORD *v28;
  int v29;

  v5 = *(_QWORD *)(result + 280);
  if (a4 >= 1)
  {
    v6 = a4;
    v7 = a3;
    do
    {
      v9 = *v7++;
      v8 = v9;
      if (v9 != -1)
        *(_QWORD *)(v5 + 64 + 100 * v8) = -1;
      --v6;
    }
    while (v6);
  }
  v10 = 0;
  v11 = 1;
  v12 = v5 + 100 * a2;
  do
  {
    v13 = *(_DWORD *)(v12 + 4 * v10 + 64);
    if (v13 == -1)
      break;
    v14 = v11;
    if (a4 >= 1)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0xFFFF;
      while (1)
      {
        result = a3[v15];
        if ((_DWORD)result != -1)
        {
          v18 = v5 + 100 * (int)result;
          v19 = *(unsigned __int16 *)(v5 + 100 * v13 + 80) - *(unsigned __int16 *)(v18 + 80);
          if (v19 < 0)
            v19 = *(unsigned __int16 *)(v18 + 80) - *(unsigned __int16 *)(v5 + 100 * v13 + 80);
          v20 = *(unsigned __int16 *)(v5 + 100 * v13 + 82) - *(unsigned __int16 *)(v18 + 82);
          if (v20 < 0)
            v20 = -v20;
          result = (v20 + v19);
          if ((int)result >= v17)
            goto LABEL_20;
          v17 = result;
          v16 = v15;
        }
        if (a4 == ++v15)
          goto LABEL_20;
      }
    }
    v16 = 0;
    v17 = 0xFFFF;
LABEL_20:
    v21 = a3[v16];
    if (!a5
      || ((v22 = *(unsigned __int16 *)(v5 + 100 * v21 + 82) - *(unsigned __int16 *)(v5 + 100 * v21 + 80),
           result = (v22 + 2),
           v22 + 1 >= 0)
        ? (v23 = v22 + 1)
        : (v23 = v22 + 2),
          v17 > v23 >> 1))
    {
      v24 = 0;
      v25 = 1;
      while (1)
      {
        v26 = v25;
        v27 = v5 + 100 * v21 + 4 * v24;
        v29 = *(_DWORD *)(v27 + 64);
        v28 = (_DWORD *)(v27 + 64);
        if (v29 == -1)
          break;
        v25 = 0;
        v24 = 1;
        if ((v26 & 1) == 0)
          goto LABEL_30;
      }
      *v28 = v13;
    }
LABEL_30:
    v11 = 0;
    v10 = 1;
  }
  while ((v14 & 1) != 0);
  return result;
}

uint64_t calculatePenaltiesForBestPath(uint64_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int *v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  int v16;
  int v17;
  char *v18;
  int v19;
  uint64_t v20;
  int v21;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;

  v6 = (int *)&unk_1D45FAAF0;
  if (!a6)
    v6 = (int *)&unk_1D45FAB00;
  if (a2 >= 1)
  {
    v7 = 0;
    v8 = *v6;
    do
    {
      if ((int)result >= 1)
      {
        v9 = 0;
        v10 = ~v7 + a2;
        if (!a6)
          v10 = v7;
        v11 = v10 * (int)result;
        do
        {
          v12 = 0;
          v13 = v9 + v11;
          v14 = 255;
          if (v9 && v9 != (_DWORD)result - 1)
          {
            v15 = 0;
            v12 = v8;
            do
            {
              v16 = v6[v15];
              if (*(_BYTE *)(a3 + v13))
              {
                v17 = *((_DWORD *)&choiceTable + 5 * v16 + 1);
              }
              else
              {
                v17 = *((_DWORD *)&choiceTable + 5 * v16);
                if (((0xB5uLL >> v16) & 1) == 0)
                {
                  v18 = (char *)&choiceTable + 20 * v16;
                  v19 = *((_DWORD *)v18 + 2);
                  v20 = *((int *)v18 + 3);
                  v21 = v13 + v19 * result;
                  if (!*(_BYTE *)(a3 + v20 + v21)
                    && *(unsigned __int8 *)(a3 + v13 + v20) + *(unsigned __int8 *)(a3 + v21) == 2)
                  {
                    ++v17;
                  }
                }
              }
              v23 = v17
                  + *(unsigned __int8 *)(a4
                                       + *((int *)&choiceTable + 5 * v16 + 3)
                                       + (uint64_t)((int)v13 + *((_DWORD *)&choiceTable + 5 * v16 + 2) * (int)result));
              if (v23 < v14)
              {
                v12 = *((_BYTE *)&choiceTable + 20 * v16 + 17);
                v14 = v23;
              }
              if (v15 > 2)
                break;
              ++v15;
            }
            while (v7);
          }
          *(_BYTE *)(a4 + v13) = v14;
          *(_BYTE *)(a5 + v13) = v12;
          ++v9;
        }
        while (v9 != result);
        if (v7 && (int)result >= 3)
        {
          v24 = a5 + v11;
          v25 = a3 + v11;
          v26 = a4 + v11;
          v27 = (int)result - 2;
          do
          {
            if (*(_BYTE *)(v25 + v27))
              v28 = 7;
            else
              v28 = 2;
            v29 = v28 + *(unsigned __int8 *)(v26 + v27 + 1);
            if (v29 < *(unsigned __int8 *)(v26 + v27))
            {
              *(_BYTE *)(v26 + v27) = v29;
              *(_BYTE *)(v24 + v27) = 5;
            }
          }
          while (v27-- > 1);
        }
      }
      ++v7;
    }
    while (v7 != a2);
  }
  return result;
}

uint64_t getPathStats(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, int a7)
{
  char *v7;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t *v14;
  int v15;
  uint64_t *v16;
  int v17;
  BOOL v19;
  int v20;
  char v21;
  char *v24;
  _QWORD v27[19];
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[3];
  int v48;
  _QWORD v49[3];
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  __int16 v70;
  __int16 v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  int v75;

  v7 = a6;
  bzero(a6, 26 * a1);
  if (a1 >= 1)
  {
    v11 = 0;
    v12 = 1;
    v24 = v7;
    while (1)
    {
      if (!v11 || a1 - 1 == v11)
      {
        v7[20] = -1;
      }
      else
      {
        v72 = 0;
        v73 = &v72;
        v74 = 0x2000000000;
        v75 = 0;
        v67 = 0;
        v68 = &v67;
        v69 = 0x2000000000;
        v70 = v11;
        v71 = v11;
        v63 = 0;
        v64 = &v63;
        v65 = 0x2000000000;
        v66 = 0;
        v59 = 0;
        v60 = &v59;
        v61 = 0x2000000000;
        v62 = 0;
        v55 = 0;
        v56 = &v55;
        v57 = 0x2000000000;
        v58 = 0;
        v51 = 0;
        v52 = &v51;
        v53 = 0x2000000000;
        v54 = 0;
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2000000000;
        v50 = 0;
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x2000000000;
        v48 = v11;
        v43 = 0;
        v44 = &v43;
        v45 = 0x2000000000;
        v46 = 0;
        v39 = 0;
        v40 = &v39;
        v41 = 0x2000000000;
        v42 = 0;
        v35 = 0;
        v36 = &v35;
        v37 = 0x2000000000;
        v38 = 0;
        v31 = 0;
        v32 = &v31;
        v33 = 0x2000000000;
        v34 = 0;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 0x40000000;
        v27[2] = __getPathStats_block_invoke;
        v27[3] = &unk_1E97DAF58;
        v27[4] = &v35;
        v27[16] = a5;
        v27[17] = a3;
        v27[5] = &v51;
        v27[6] = &v63;
        v27[7] = v49;
        v27[8] = v47;
        v28 = a1;
        v29 = a2;
        v27[9] = &v43;
        v27[10] = &v55;
        v27[11] = &v59;
        v27[12] = &v72;
        v27[18] = v24;
        v30 = v11;
        v27[13] = &v31;
        v27[14] = &v39;
        v27[15] = &v67;
        v13 = walkPathAndReturnFinalColumn(a5, a1, a2, v11, a7, (uint64_t)v27);
        if ((v13 & 0x80000000) == 0)
        {
          v14 = v73;
          if (*((_BYTE *)v52 + 24))
          {
            v15 = *((_DWORD *)v73 + 6);
            if (v15 <= 1)
            {
              *(_QWORD *)&v7[8 * v15] = v64[3];
              v15 = *((_DWORD *)v14 + 6);
            }
            *((_DWORD *)v14 + 6) = v15 + 1;
          }
          v16 = v60;
          v7[21] = *((_DWORD *)v60 + 6);
          *((_DWORD *)v7 + 4) = *((_DWORD *)v68 + 6);
          v7[20] = *(_BYTE *)(a4 + v11);
          v17 = *((unsigned __int8 *)v36 + 24);
          v19 = v17 == 7 || v17 == 2;
          v7[25] = v19;
          v20 = *((_DWORD *)v14 + 6);
          v7[22] = v20;
          if (v20 == 1)
          {
            if (*((_BYTE *)v44 + 24) || (v21 = *((_BYTE *)v40 + 24)) != 0)
              v21 = *((_DWORD *)v56 + 6) > *((_DWORD *)v16 + 6) / 2;
          }
          else
          {
            v21 = 0;
          }
          v7[23] = v21;
          v7[24] = *((_BYTE *)v32 + 24);
        }
        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(v47, 8);
        _Block_object_dispose(v49, 8);
        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v63, 8);
        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(&v72, 8);
        if (v13 < 0)
          return (v12 << 31 >> 31);
      }
      v12 = ++v11 < a1;
      v7 += 26;
      if (a1 == v11)
        return (v12 << 31 >> 31);
    }
  }
  v12 = 0;
  return (v12 << 31 >> 31);
}

BOOL filterSplits(_BOOL8 result, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v11;
  int v12;
  unsigned __int16 *v13;
  uint64_t v14;
  unsigned int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  unsigned int v18;
  unsigned int v19;
  _BOOL4 v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  signed int v36;
  int v37;
  int v38;
  _BOOL4 v39;
  uint64_t v43;
  int v44;
  unsigned int v46;
  int v47;
  BOOL v48;
  int v49;
  __int16 v50;
  __int16 v51;
  __int16 v52;
  __int16 v53;
  __int16 v54;
  __int16 v55;
  uint64_t v56;

  v43 = result;
  v56 = *MEMORY[0x1E0C80C00];
  v6 = a6 + 7;
  v49 = 0;
  v50 = 0;
  v51 = a6 - 1;
  if (a6 >= 0)
    v6 = a6;
  v7 = v6 >> 3;
  v8 = (a5 - 1);
  v52 = a5 - 1;
  v53 = a5 - 1;
  if (a6 < 8)
    v9 = 1;
  else
    v9 = v7;
  v54 = 0;
  v55 = a6 - 1;
  if (a5 >= 3)
  {
    v11 = 0;
    v47 = a5 - v9;
    v37 = 3 * a6 / 4;
    v38 = a6 / 4;
    v44 = v7 + 1;
    v12 = 3 * (v7 + 1);
    v13 = (unsigned __int16 *)(a2 + 42);
    v46 = -1;
    v14 = 1;
    while (1)
    {
      v15 = *((unsigned __int8 *)v13 + 6);
      v16 = areCutsTooClose(a6, v14, v15, v13 - 8, 0, 2u, &v49, v9);
      v17 = v9 > *v13 || v47 < v13[1];
      result = areCutsTooClose(a6, v14, *((unsigned __int8 *)v13 + 32), v13 + 5, 0, 2u, &v49, v9);
      v18 = *((unsigned __int8 *)v13 + 4);
      v19 = *((unsigned __int8 *)v13 + 30);
      if (v18 < v19 || v19 == 255 || result)
      {
        v20 = v11 != 0;
        if (v11 && v18 < v19 || v18 < v19 && *((_BYTE *)v13 + 9) && !*((_BYTE *)v13 - 17))
        {
          v20 = 1;
          goto LABEL_23;
        }
      }
      else
      {
        *((_BYTE *)v13 + 4) = -1;
        v11 = 1;
        v20 = 1;
      }
      if (!result)
        v20 = 0;
LABEL_23:
      if (v15 <= 2 && !v16 && !v17 && v20)
      {
        v21 = 0;
        v48 = 0;
        if (v15 != 1)
          goto LABEL_31;
        if (*((_BYTE *)v13 + 8))
          goto LABEL_61;
        if (*(v13 - 7) - *(v13 - 8) <= v44 && (v22 = *(v13 - 5), v23 = *(v13 - 6), v22 - v23 <= v44))
        {
          v21 = 0;
          v36 = (v23 + v22) >> 1;
          if (v36 >= v38 && v36 <= v37)
            v21 = *((unsigned __int8 *)v13 + 7);
        }
        else
        {
          v21 = 0;
        }
LABEL_31:
        if (v21 || (v46 & 0x80000000) != 0)
        {
          if (v21)
            goto LABEL_61;
          result = cutsCreateBadConcomp(v43, 0, 0, v46, a4, (uint64_t)(v13 - 8), a3, v14, a4, a5, a6);
          v32 = !result;
        }
        else
        {
          v39 = v21 == 0;
          v24 = a2 + 26 * v46;
          v25 = *(unsigned __int8 *)(v24 + 22);
          if (v25 >= v15)
            v26 = v15;
          else
            v26 = *(unsigned __int8 *)(v24 + 22);
          if (v25 <= v15)
            v27 = v15;
          else
            v27 = *(unsigned __int8 *)(v24 + 22);
          if (v27 == 2 && v26 == 1)
            v29 = v12 / 2;
          else
            v29 = v44;
          result = areCutsTooClose(a6, v46, v25, (_WORD *)(a2 + 26 * v46), v14, v15, v13 - 8, v29);
          if (result
            || (result = isCuttingSerif (v43, (unsigned __int16 *)v24, v13 - 8, a5, a6, &v48))
            || (result = cutsCreateBadConcomp(v43, v24, a3, v46, a4, (uint64_t)(v13 - 8), a3, v14, a4, a5, a6)))
          {
            if (v48)
            {
              v30 = a2;
              if (*((unsigned __int8 *)v13 + 4) <= 2 * *(unsigned __int8 *)(a2 + 26 * v46 + 20))
                goto LABEL_62;
LABEL_61:
              LOBYTE(v31) = -2;
LABEL_66:
              v11 = 0;
              goto LABEL_67;
            }
            v33 = *(unsigned __int8 *)(v24 + 22);
            if (v33 <= 1)
              v33 = 1;
            v30 = a2;
            v34 = v33 * *(unsigned __int8 *)(a2 + 26 * v46 + 20);
            v35 = *((unsigned __int8 *)v13 + 6);
            if (v35 <= 1)
              v35 = 1;
            if (v34 < v35 * *((unsigned __int8 *)v13 + 4))
              goto LABEL_61;
LABEL_62:
            *(_BYTE *)(v30 + 26 * v46 + 20) = -2;
LABEL_63:
            v31 = *((unsigned __int8 *)v13 + 4);
            if (v31 >= 0xFD)
              LOBYTE(v31) = -3;
            v46 = v14;
            goto LABEL_66;
          }
          v32 = v39;
        }
        if (!v32)
          goto LABEL_61;
        goto LABEL_63;
      }
      LOBYTE(v31) = -1;
LABEL_67:
      *((_BYTE *)v13 + 4) = v31;
      ++v14;
      v13 += 13;
      if (v8 == v14)
      {
        if ((v46 & 0x80000000) == 0)
        {
          result = cutsCreateBadConcomp(v43, a2 + 26 * v46, a3, v46, a4, 0, 0, 0xFFFFFFFFLL, a4, a5, a6);
          if (result)
            *(_BYTE *)(a2 + 26 * v46 + 20) = -2;
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t walkPathAndReturnFinalColumn(uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7;
  int v12;
  unsigned int v13;
  char *v14;

  if (a5)
    v7 = 0;
  else
    v7 = (a3 - 1);
  if ((int)v7 < a3 && (v7 & 0x80000000) == 0)
  {
    while (1)
    {
      v12 = a4 + v7 * a2;
      v13 = *(unsigned __int8 *)(a1 + v12);
      if (!*(_BYTE *)(a1 + v12))
        break;
      if (a6)
        (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 16))(a6, v7, a4);
      v14 = (char *)&choiceTable + 20 * v13;
      v7 = (*((_DWORD *)v14 + 2) + v7);
      a4 = (*((_DWORD *)v14 + 3) + a4);
      if ((int)v7 >= a3 || (v7 & 0x80000000) != 0)
        return a4;
    }
    return 0xFFFFFFFFLL;
  }
  return a4;
}

uint64_t __getPathStats_block_invoke(uint64_t result, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL v20;
  char v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unsigned __int8 *v28;
  int v29;
  unsigned __int8 *v30;
  unsigned int v31;
  BOOL v32;
  char v33;
  int v34;
  int v35;
  int v36;
  _WORD *v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v3 + 24))
    *(_BYTE *)(v3 + 24) = *(_BYTE *)(*(_QWORD *)(result + 128) + a3 + *(int *)(result + 152) * (uint64_t)a2);
  v4 = *(_QWORD *)(result + 136);
  v5 = *(_DWORD *)(result + 152);
  v6 = v5 * a2;
  v7 = v5 * a2 + (uint64_t)a3;
  if (*(_BYTE *)(v4 + v7))
  {
    v8 = result + 40;
    v9 = *(_QWORD *)(result + 128);
    v10 = *(unsigned __int8 *)(v9 + v7);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    {
      v37 = *(_WORD **)(*(_QWORD *)(result + 48) + 8);
      v37[12] = a3;
      v37[13] = a3;
      v37[14] = a2;
      v37[15] = a2;
      v38 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24);
      if (v38 >= 1 && v38 < *(_DWORD *)(result + 156) - 1)
      {
        v39 = v38 * v5;
        v40 = *(int *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24);
        v41 = v40 + v39;
        switch(*(_BYTE *)(v9 + v41))
        {
          case 1:
          case 6:
            v42 = v41 + v4;
            v43 = *(unsigned __int8 *)(v4 + v6 + (int)v40 + 1);
            v44 = *(unsigned __int8 *)(v42 + 1);
            goto LABEL_49;
          case 3:
          case 8:
            v49 = v41 + v4;
            v43 = *(unsigned __int8 *)(v4 + v6 + (int)v40 - 1);
            v44 = *(unsigned __int8 *)(v49 - 1);
LABEL_49:
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 24) = v44 + v43 == 0;
            break;
          default:
            break;
        }
      }
    }
    v11 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
    v12 = *(unsigned __int16 *)(v11 + 24);
    if (v12 >= a3)
      LOWORD(v12) = a3;
    *(_WORD *)(v11 + 24) = v12;
    v13 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
    v14 = *(unsigned __int16 *)(v13 + 26);
    if (v14 <= a3)
      LOWORD(v14) = a3;
    *(_WORD *)(v13 + 26) = v14;
    v15 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
    v16 = *(unsigned __int16 *)(v15 + 28);
    if (v16 >= a2)
      LOWORD(v16) = a2;
    *(_WORD *)(v15 + 28) = v16;
    v17 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
    v18 = *(unsigned __int16 *)(v17 + 30);
    if (v18 <= a2)
      LOWORD(v18) = a2;
    *(_WORD *)(v17 + 30) = v18;
    v32 = v10 >= 8;
    v20 = v10 == 8;
    v19 = (1 << v10) & 0x14A;
    v20 = !v20 && v32 || v19 == 0;
    if (!v20)
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 80) + 8) + 24);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 88) + 8) + 24);
    v21 = 1;
  }
  else
  {
    v8 = result + 40;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
      goto LABEL_43;
    v22 = *(_QWORD *)(*(_QWORD *)(result + 96) + 8);
    v23 = *(_DWORD *)(v22 + 24);
    if (v23 <= 1)
    {
      *(_QWORD *)(*(_QWORD *)(result + 144) + 26 * *(int *)(result + 160) + 8 * v23) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
      v22 = *(_QWORD *)(*(_QWORD *)(result + 96) + 8);
      v23 = *(_DWORD *)(v22 + 24);
    }
    *(_DWORD *)(v22 + 24) = v23 + 1;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 88) + 8) + 24) == 1)
    {
      v24 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24);
      if (v24 >= 2 && v24 < *(_DWORD *)(result + 156) - 1)
      {
        v25 = *(int *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24);
        if ((int)v25 >= 2)
        {
          v26 = *(_DWORD *)(result + 152);
          if ((int)v25 < v26 - 1)
          {
            v27 = *(_QWORD *)(result + 136);
            v28 = (unsigned __int8 *)(v27 + v25 + v26 * (v24 - 1));
            v29 = v26 * v24;
            v30 = (unsigned __int8 *)(v27 + v25 + v26 + v29);
            v31 = v28[1]
                + *(v28 - 1)
                + *(unsigned __int8 *)(v27 + (int)v25 + v29 - 1)
                + *(unsigned __int8 *)(v25 + v29 + v27 + 1)
                + *(v30 - 1)
                + v30[1];
            v32 = *v30 + *v28 != 2 || v31 >= 3;
            v33 = !v32;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 104) + 8) + 24) = v33;
          }
        }
      }
    }
    v21 = 0;
    v34 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24);
    v35 = *(_DWORD *)(result + 152);
    switch(*(_BYTE *)(*(_QWORD *)(result + 128)
                      + *(int *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24)
                      + v35 * (uint64_t)v34))
    {
      case 1:
      case 6:
        v36 = a3 - 1;
        goto LABEL_41;
      case 3:
      case 8:
        v36 = a3 + 1;
LABEL_41:
        v21 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 112) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 136)
                                                                                             + v36
                                                                                             + v35 * a2)
                                                                        + *(unsigned __int8 *)(*(_QWORD *)(result + 136)
                                                                                             + v36
                                                                                             + v35 * v34) == 0;
        break;
      default:
        break;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) = v21;
LABEL_43:
  v45 = *(_QWORD *)(*(_QWORD *)(result + 120) + 8);
  v46 = *(unsigned __int16 *)(v45 + 24);
  if (v46 >= a3)
    LOWORD(v46) = a3;
  *(_WORD *)(v45 + 24) = v46;
  v47 = *(_QWORD *)(*(_QWORD *)(result + 120) + 8);
  v48 = *(unsigned __int16 *)(v47 + 26);
  if (v48 <= a3)
    LOWORD(v48) = a3;
  *(_WORD *)(v47 + 26) = v48;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = a3;
  return result;
}

BOOL areCutsTooClose(__int16 a1, __int16 a2, unsigned int a3, _WORD *a4, __int16 a5, unsigned int a6, _WORD *a7, int a8)
{
  _WORD *v8;
  unint64_t v9;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  BOOL v14;
  unsigned __int16 *v15;
  uint64_t v16;
  unsigned __int16 *v17;
  _BOOL4 v18;
  _WORD v20[4];
  _WORD v21[4];

  v21[0] = a2;
  v21[1] = a2;
  v21[3] = a1 - 1;
  v20[0] = a5;
  v20[1] = a5;
  v20[3] = a1 - 1;
  v8 = v21;
  if (a3)
    v8 = a4;
  if (a3 <= 1)
    v9 = 1;
  else
    v9 = a3;
  if (a6)
    v10 = a7;
  else
    v10 = v20;
  if ((int)v9 < 1)
  {
    return 0;
  }
  else
  {
    v11 = 0;
    if (a6 <= 1)
      v12 = 1;
    else
      v12 = a6;
    v13 = v10 + 2;
    v14 = 1;
    while ((int)v12 < 1)
    {
LABEL_24:
      v14 = ++v11 < v9;
      if (v11 == v9)
        return v14;
    }
    v15 = &v8[4 * v11];
    v16 = v12;
    v17 = v13;
    while (1)
    {
      v18 = v15[1] + a8 < *(v17 - 2) || *(v17 - 1) + a8 < *v15;
      if (v15[3] + a8 >= *v17)
      {
        if (v17[1] + a8 < v15[2])
          v18 = 1;
        if (!v18)
          break;
      }
      v17 += 4;
      if (!--v16)
        goto LABEL_24;
    }
  }
  return v14;
}

BOOL isCuttingSerif (uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, int a4, int a5, BOOL *a6)
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int EndBlackPixelRowInColumn;
  int v25;
  _BOOL8 result;
  unsigned int v27;

  if (a6)
    *a6 = 0;
  if (*((_BYTE *)a3 + 22) != 1)
    return 0;
  if (*((_BYTE *)a2 + 22) != 1)
    return 0;
  v10 = a3[3];
  v11 = a2[2];
  if (v10 < v11)
    return 0;
  v12 = a3[2];
  v13 = a2[3];
  if (v12 > v13)
    return 0;
  v14 = v13 - v11;
  if ((int)(v13 - v11) >= (int)(v10 - v12))
    v14 = v10 - v12;
  v15 = (int)(v13 - v11 - (v10 - v12)) >= 0 ? v13 - v11 - (v10 - v12) : v10 - v12 - (v13 - v11);
  if (v15 >= (int)(3 * v14))
    return 0;
  if (v11 >= v12)
    v11 = a3[2];
  v16 = v13 <= v10 ? a3[3] : a2[3];
  v17 = (v16 + v11) >> 1;
  if ((int)v17 > a5 / 4 && 3 * a5 > 4 * (int)v17)
    return 0;
  v18 = *a2;
  if (v18 >= *a3)
    v18 = *a3;
  v19 = a2[1];
  if (v19 <= a3[1])
    v19 = a3[1];
  v20 = a5 >= 0 ? a5 : a5 + 1;
  if ((int)(v19 - v18) > v20 >> 1)
    return 0;
  v21 = v19 + v18;
  if (!*(_BYTE *)(a1 + (int)(v17 * a4 + ((v19 + v18) >> 1))))
    return 0;
  v27 = v16 - v11;
  v22 = v21 >> 1;
  v23 = v18 | (v19 << 16);
  EndBlackPixelRowInColumn = findEndBlackPixelRowInColumn(a1, a4, a5, v21 >> 1, v17, v23, -1);
  v25 = findEndBlackPixelRowInColumn(a1, a4, a5, v22, v17, v23, 1) - EndBlackPixelRowInColumn;
  result = v25 < (int)(2 * v27);
  if (a6)
  {
    if (v25 < (int)(2 * v27))
    {
      *a6 = v20 >> 1 > v16;
      return 1;
    }
  }
  return result;
}

BOOL cutsCreateBadConcomp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, unsigned int a10, unsigned int a11)
{
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  BOOL *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  BOOL *v25;
  char *v26;
  uint64_t v27;
  BOOL *v28;
  _BOOL8 v29;
  BOOL *v30;
  BOOL *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  size_t v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  int v55;
  int *v56;
  unsigned __int8 *v57;
  uint64_t v58;
  int v59;
  BOOL v61;
  int v62;
  int v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  int v69;
  int v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  BOOL *v74;
  _QWORD v75[10];
  _QWORD v76[3];
  int v77;
  _QWORD v78[3];
  int v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  _QWORD v84[6];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  uint64_t v89;

  v15 = a1;
  v17 = a10;
  v16 = a11;
  v89 = *MEMORY[0x1E0C80C00];
  v18 = MEMORY[0x1E0C80A78](a1);
  v20 = (BOOL *)&v71 - ((v19 + 15) & 0x3FFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v26 = (char *)&v71 - v24;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2000000000;
  v88 = (unsigned __int16)a10;
  if (v25)
    *v25 = 0;
  if (a3 | a7)
  {
    if (a3)
    {
      if (!a7)
      {
        v74 = v25;
        if ((int)a11 >= 1)
        {
          v27 = a11;
          v28 = v20;
          do
          {
            *(_WORD *)v28 = a10 - 1;
            v28 += 2;
            --v27;
          }
          while (v27);
        }
        HIWORD(v88) = a10 - 1;
        LOWORD(v88) = a10 - 1;
        if (!*(_BYTE *)(a2 + 21))
          goto LABEL_21;
        goto LABEL_24;
      }
    }
    else
    {
      v30 = v20;
      v73 = a10;
      v74 = v20;
      v71 = a11;
      v72 = (char *)&v71 - v24;
      v31 = v25;
      v32 = v22;
      v33 = v21;
      v34 = v23;
      bzero(v30, 2 * a11);
      v23 = v34;
      v21 = v33;
      v22 = v32;
      v25 = v31;
      v16 = v71;
      v26 = v72;
      v17 = v73;
      v20 = v74;
      v88 = 0;
    }
    v35 = *(unsigned __int8 *)(a6 + 21);
    if (a2)
    {
      if (*(unsigned __int8 *)(a2 + 21) > v35)
        v35 = *(unsigned __int8 *)(a2 + 21);
    }
    else if (!*(_BYTE *)(a6 + 21))
    {
      goto LABEL_21;
    }
    if (v35)
    {
      v74 = v25;
      if (a3)
      {
        LODWORD(v72) = v22;
        v36 = v21;
        LODWORD(v73) = v23;
        memset(v20, 255, 2 * v16);
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 0x40000000;
        v84[2] = __cutsCreateBadConcomp_block_invoke;
        v84[3] = &unk_1E97DAF80;
        v84[4] = &v85;
        v84[5] = v20;
        walkPathAndReturnFinalColumn(a3, v17, v16, v36, (int)v72, (uint64_t)v84);
        v22 = a9;
        v21 = v73;
      }
      else
      {
        v22 = a9;
        v21 = v23;
      }
      a3 = a7;
LABEL_24:
      v80 = 0;
      v81 = &v80;
      v82 = 0x2000000000;
      v83 = 0;
      v78[0] = 0;
      v78[1] = v78;
      v78[2] = 0x2000000000;
      v79 = 0;
      v76[0] = 0;
      v76[1] = v76;
      v77 = -1;
      v76[2] = 0x2000000000;
      v37 = v22;
      v38 = v21;
      memset(v26, 255, 2 * v16);
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 0x40000000;
      v75[2] = __cutsCreateBadConcomp_block_invoke_2;
      v75[3] = &unk_1E97DAFA8;
      v75[4] = &v85;
      v75[5] = v76;
      v75[8] = v26;
      v75[9] = v20;
      v75[6] = v78;
      v75[7] = &v80;
      v39 = walkPathAndReturnFinalColumn(a3, v17, v16, v38, v37, (uint64_t)v75);
      if (*((_BYTE *)v81 + 24))
        goto LABEL_62;
      v40 = *((unsigned __int16 *)v86 + 12);
      v41 = *((unsigned __int16 *)v86 + 13) - v40;
      if ((int)v41 < 3)
        goto LABEL_62;
      MEMORY[0x1E0C80A78](v39);
      v43 = (int *)((char *)&v71 - v42);
      bzero((char *)&v71 - v42, v44);
      if ((int)v16 >= 1)
      {
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v48 = 0;
        v49 = 0;
        v50 = 0;
        while (1)
        {
          v51 = *(unsigned __int16 *)&v20[2 * v45];
          v52 = *(unsigned __int16 *)&v26[2 * v45];
          v53 = v51 >= v52 ? *(unsigned __int16 *)&v26[2 * v45] : *(unsigned __int16 *)&v20[2 * v45];
          v54 = v51 <= v52 ? *(unsigned __int16 *)&v26[2 * v45] : *(unsigned __int16 *)&v20[2 * v45];
          if (v53 >= v54)
            break;
          v55 = 0;
          v56 = &v43[v53 - v40];
          v57 = (unsigned __int8 *)(v15 + v53);
          v58 = v54 - v53;
          do
          {
            v59 = *v57++;
            v55 += v59;
            *v56++ += v59;
            --v58;
          }
          while (v58);
          if (v46 > 0 && v55 == 0)
            ++v50;
          if (!v55)
            goto LABEL_46;
          v47 = 0;
          ++v49;
LABEL_51:
          ++v45;
          v15 += v17;
          v46 = v55;
          if (v45 == v16)
            goto LABEL_54;
        }
        if (v46 > 0)
          ++v50;
LABEL_46:
        v61 = v50 == 0;
        if (!v50)
          v50 = 0;
        v55 = 0;
        if (v61)
          ++v48;
        else
          ++v47;
        goto LABEL_51;
      }
      v50 = 0;
      v49 = 0;
      v48 = 0;
      v47 = 0;
      v55 = 0;
LABEL_54:
      if (v55 > 0)
        ++v50;
      if (v74)
      {
        if ((int)v16 >= 0)
          v62 = v16;
        else
          v62 = v16 + 1;
        *v74 = v47 >= v62 >> 1;
      }
      if (v50 > 1)
      {
LABEL_62:
        v29 = 1;
      }
      else
      {
        if ((int)v16 >= 0)
          v64 = v16;
        else
          v64 = v16 + 3;
        v65 = v64 >> 2;
        if (v47 <= v64 >> 2)
          goto LABEL_73;
        if (v48 <= v65)
          goto LABEL_73;
        v66 = 0;
        v67 = 0;
        v68 = v41;
        do
        {
          v69 = *v43++;
          v67 += v69;
          v66 += v69 * v69;
          --v68;
        }
        while (v68);
        if ((float)((float)v67 / (float)(int)v41) * 0.75 > (float)((float)((float)v66
                                                                          - (float)((float)(v67 * v67) / (float)(int)v41))
                                                                  / (float)(v41 - 1)))
        {
          v29 = 0;
        }
        else
        {
LABEL_73:
          if ((int)v16 >= 0)
            v70 = v16;
          else
            v70 = v16 + 1;
          if (v47 >= v70 >> 1 || v48 >= v70 >> 1)
            v65 = 2 * (int)v16 / 5;
          v29 = v49 <= v65;
        }
      }
      _Block_object_dispose(v76, 8);
      _Block_object_dispose(v78, 8);
      _Block_object_dispose(&v80, 8);
      goto LABEL_64;
    }
LABEL_21:
    v29 = 0;
    goto LABEL_64;
  }
  v29 = 1;
LABEL_64:
  _Block_object_dispose(&v85, 8);
  return v29;
}

uint64_t findEndBlackPixelRowInColumn(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;

  if ((int)a5 >= 1 && a3 - 1 > (int)a5)
  {
    v7 = a2 * (a7 + (int)a5);
    while (1)
    {
      if (!*(_BYTE *)(a1 + a4 + v7))
      {
        if (a4 > (unsigned __int16)a6 && *(_BYTE *)(a1 + (int)v7 + a4 - 1))
        {
          --a4;
        }
        else
        {
          if (a4 >= HIWORD(a6) || !*(_BYTE *)(a1 + (int)v7 + a4 + 1))
            return a5;
          ++a4;
        }
      }
      a5 = (a5 + a7);
      if ((int)a5 >= 1)
      {
        v7 += a7 * a2;
        if ((int)a5 < a3 - 1)
          continue;
      }
      return a5;
    }
  }
  return a5;
}

uint64_t __cutsCreateBadConcomp_block_invoke(uint64_t result, int a2, int a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;

  v3 = *(_QWORD *)(result + 40);
  v4 = *(unsigned __int16 *)(v3 + 2 * a2);
  if (v4 > a3)
    LOWORD(v4) = a3;
  v5 = (unsigned __int16)v4;
  *(_WORD *)(v3 + 2 * a2) = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v7 = *(unsigned __int16 *)(v6 + 24);
  if (v5 < v7)
    LOWORD(v7) = v5;
  *(_WORD *)(v6 + 24) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v9 = *(unsigned __int16 *)(v8 + 26);
  if (v5 > v9)
    LOWORD(v9) = v5;
  *(_WORD *)(v8 + 26) = v9;
  return result;
}

_QWORD *__cutsCreateBadConcomp_block_invoke_2(_QWORD *result, int a2, int a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;
  int v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  BOOL v15;

  v3 = result[8];
  v4 = *(unsigned __int16 *)(v3 + 2 * a2);
  if (v4 > a3)
    LOWORD(v4) = a3;
  *(_WORD *)(v3 + 2 * a2) = v4;
  v5 = *(_QWORD *)(result[4] + 8);
  v6 = *(unsigned __int16 *)(v5 + 24);
  if ((unsigned __int16)v4 < v6)
    LOWORD(v6) = v4;
  *(_WORD *)(v5 + 24) = v6;
  v7 = *(_QWORD *)(result[4] + 8);
  if ((unsigned __int16)v4 <= *(unsigned __int16 *)(v7 + 26))
    LOWORD(v4) = *(_WORD *)(v7 + 26);
  *(_WORD *)(v7 + 26) = v4;
  v8 = *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  if (v8 != -1 && v8 != a2)
  {
    v10 = *(_QWORD *)(result[6] + 8);
    v11 = *(_DWORD *)(v10 + 24);
    if (v11 == -1)
    {
      v13 = *(unsigned __int16 *)(result[9] + 2 * v8) > *(unsigned __int16 *)(v3 + 2 * v8);
    }
    else
    {
      if (!v11)
      {
        if (*(unsigned __int16 *)(result[9] + 2 * v8) < *(unsigned __int16 *)(v3 + 2 * v8))
          v12 = -1;
        else
          v12 = 1;
        *(_DWORD *)(v10 + 24) = v12;
        goto LABEL_23;
      }
      v13 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) |= v13;
    if (*(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) == 1)
    {
      v14 = *(int *)(*(_QWORD *)(result[5] + 8) + 24);
      v15 = *(unsigned __int16 *)(result[9] + 2 * v14) < *(unsigned __int16 *)(result[8] + 2 * v14);
    }
    else
    {
      v15 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) |= v15;
  }
LABEL_23:
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a2;
  return result;
}

uint64_t __markSplits_block_invoke(uint64_t result, int a2, __int16 a3)
{
  *(_WORD *)(**(_QWORD **)(result + 32) + 2 * a2) = a3;
  return result;
}

BOOL diacriticLooksLikeDot(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned __int16 *v3;
  int v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 280);
  v3 = (unsigned __int16 *)(v2 + 100 * a2);
  v4 = v3[41] - v3[40];
  v5 = v3[43] - v3[42];
  return v4 < 2 * v5 + 3 && v5 < 2 * v4 + 3 && (v5 + 1) * (v4 + 1) <= 2 * *(_DWORD *)(v2 + 100 * a2 + 72);
}

uint64_t isFeasablePart(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  int v7;
  int v8;

  if (a3 == -1)
    return 1;
  v3 = *(_QWORD *)(a1 + 280);
  v4 = v3 + 100 * a2;
  v5 = *(_BYTE *)(v4 + 93);
  v6 = *(unsigned __int16 *)(v4 + 84);
  v7 = *(unsigned __int16 *)(v4 + 86);
  v8 = *(_DWORD *)(v3 + 100 * a3 + 40);
  if (v8 > 72)
  {
    if (v8 != 73 && v8 != 124 && v8 != 108)
      return 1;
    return (v5 & 1) != 0
        && (float)((float)(*(unsigned __int16 *)(v3 + 100 * a3 + 84) - v6) / (float)(v7 - v6 + 1)) <= 0.15;
  }
  if (v8 == 49)
    return (v5 & 1) != 0
        && (float)((float)(*(unsigned __int16 *)(v3 + 100 * a3 + 84) - v6) / (float)(v7 - v6 + 1)) <= 0.15;
  return v8 != 63;
}

BOOL isSaneSplit(uint64_t a1, int a2, int *a3, int a4, uint64_t a5, unsigned int a6)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v11;
  int v12;
  int v13;
  float v14;
  int v15;
  int *v16;
  signed int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  signed int v23;
  int v24;
  _BOOL8 result;
  signed int v26;
  int v28;
  uint64_t v30;
  int *v31;
  int v32;
  size_t v33;
  int v34;
  uint64_t i;
  float ConfusionScoreForCC;
  float v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  double v42;
  const char *v44;
  const char *v45;
  char *v46;
  double v47;
  double v48;
  int v49;
  const char *v50;
  const char *v51;
  double v52;
  double v53;
  const char *v54;
  unint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  float v60;
  int v61;
  uint64_t v62;
  int *v63;
  char v64;
  int v65;
  int v66;
  unsigned __int8 *v67;
  int v68;
  int v69;
  uint64_t v70;
  float v71;
  int v75;
  char __s[4];
  char __s2[4];
  char v78[4];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = *(_QWORD *)(a1 + 280);
  if (a4 < 1)
  {
    v13 = 0;
    v12 = 0;
    v14 = 1.0;
    v17 = 0x7FFFFFFF;
    v15 = 0x7FFFFFFF;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 1.0;
    v15 = 0x7FFFFFFF;
    v16 = a3;
    v17 = 0x7FFFFFFF;
    v18 = a4;
    do
    {
      v20 = *v16++;
      v19 = v20;
      if (v20 == -1)
        return 0;
      if ((*(_BYTE *)(v11 + 100 * v19 + 94) & 8) == 0)
      {
        v21 = v11 + 100 * v19;
        v22 = *(unsigned __int16 *)(v21 + 86) - *(unsigned __int16 *)(v21 + 84);
        v23 = v22 + 1;
        v24 = v23 + v23 * (*(unsigned __int16 *)(v21 + 82) - *(unsigned __int16 *)(v21 + 80));
        if (v12 <= v24)
          v12 = v23 + v23 * (*(unsigned __int16 *)(v21 + 82) - *(unsigned __int16 *)(v21 + 80));
        if (v13 <= v23)
          v13 = v22 + 1;
        if (v15 >= v24)
          v15 = v23 + v23 * (*(unsigned __int16 *)(v21 + 82) - *(unsigned __int16 *)(v21 + 80));
        if (v17 >= v23)
          v17 = v22 + 1;
        if (v14 >= *(float *)(v21 + 48))
          v14 = *(float *)(v21 + 48);
      }
      --v18;
    }
    while (v18);
  }
  result = 0;
  if (!v13)
    return result;
  v26 = v12 / 0xAu;
  if (v17 < (int)(v13 / 3u) || v15 < v26)
    return result;
  v28 = a2;
  if (a6)
  {
    *(_DWORD *)__s = 0;
    if (a4 < 1)
    {
      v34 = 0;
    }
    else
    {
      v30 = a4;
      v31 = a3;
      while (1)
      {
        v32 = *v31++;
        v33 = strlen(__s);
        if (strlen((const char *)(*(_QWORD *)(a1 + 280) + 100 * v32 + 40)) + v33 > 3)
          break;
        __strncat_chk();
        if (!--v30)
        {
          v34 = *(_DWORD *)__s;
          goto LABEL_31;
        }
      }
      v34 = 0;
LABEL_31:
      v8 = a4;
      v6 = a6;
      v7 = a5;
      v28 = a2;
    }
    for (i = 0; i != 154; ++i)
    {
      if (v34 == FKRecognitionLabels[i] && v34 != *(_DWORD *)(v11 + 100 * v28 + 40))
        return 0;
    }
    v11 = *(_QWORD *)(a1 + 280);
  }
  ConfusionScoreForCC = getConfusionScoreForCC(v11 + 100 * v28);
  v37 = ConfusionScoreForCC;
  if (v8 == 2)
  {
    v38 = *(_QWORD *)(a1 + 280);
    v39 = *a3;
    v40 = a3[1];
    v41 = *(_DWORD *)(v11 + 100 * v28 + 40);
    if (v41 > 97)
    {
      switch(v41)
      {
        case 'm':
          if (strstr("llIn[", (const char *)(v38 + 100 * v39 + 40)))
          {
            v41 = 109;
            if (strstr("]", (const char *)(v38 + 100 * v40 + 40)))
              goto LABEL_103;
          }
          else
          {
            v41 = 109;
          }
          goto LABEL_135;
        case 'n':
          if (!strstr("r", (const char *)(v38 + 100 * v39 + 40))
            || !strstr("Il", (const char *)(v38 + 100 * v40 + 40)))
          {
            v41 = 110;
            goto LABEL_135;
          }
          v49 = *(_DWORD *)(v11 + 100 * v28 + 64);
          v41 = 110;
LABEL_102:
          if (v49 != -1)
            goto LABEL_135;
LABEL_103:
          v52 = v14;
          v53 = 0.7;
LABEL_104:
          if (v52 >= v53)
            goto LABEL_135;
          return 0;
        case 'o':
LABEL_56:
          v44 = (const char *)(v38 + 100 * v39 + 40);
          if (strstr("[(", v44) && strstr(")]>", (const char *)(v38 + 100 * v40 + 40)))
            return 0;
          if (!strstr("C[(f", v44))
            goto LABEL_135;
          v45 = (const char *)(v38 + 100 * v40 + 40);
          v46 = ")]Jj";
LABEL_68:
          if (!strstr(v46, v45) || *(_DWORD *)(v11 + 100 * v28 + 64) != -1)
            goto LABEL_135;
          v47 = v37;
          v48 = 0.3;
LABEL_91:
          if (v47 <= v48)
            goto LABEL_135;
          return 0;
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
          goto LABEL_135;
        case 'u':
LABEL_66:
          if (!strstr("Ii", (const char *)(v38 + 100 * v39 + 40)))
            goto LABEL_135;
          v45 = (const char *)(v38 + 100 * v40 + 40);
          v46 = "Jj";
          goto LABEL_68;
        case 'v':
LABEL_71:
          if (!strstr("\\", (const char *)(v38 + 100 * v39 + 40))
            || !strstr("jJ", (const char *)(v38 + 100 * v40 + 40))
            || *(_DWORD *)(v11 + 100 * v28 + 64) != -1)
          {
            goto LABEL_135;
          }
          v47 = v37;
          v48 = 0.2;
          goto LABEL_91;
        case 'w':
LABEL_75:
          if (!strstr("}v", (const char *)(v38 + 100 * v39 + 40))
            || !strstr("vj", (const char *)(v38 + 100 * v40 + 40))
            || *(_DWORD *)(v11 + 100 * v28 + 64) != -1)
          {
            goto LABEL_135;
          }
          goto LABEL_117;
        default:
          if (v41 != 98)
          {
            if (v41 == 100)
            {
              v41 = 100;
              if (strstr("Cc(", (const char *)(v38 + 100 * v39 + 40)))
              {
                v41 = 100;
                if (strstr("yY", (const char *)(v38 + 100 * v40 + 40)))
                {
                  if (*(unsigned __int8 *)(v7 + 17) > 1u)
                    return 0;
                  v41 = 100;
                }
              }
            }
            goto LABEL_135;
          }
          if (!strstr("L", (const char *)(v38 + 100 * v39 + 40)))
          {
            v41 = 98;
            goto LABEL_135;
          }
          v41 = 98;
          if (!strstr(")", (const char *)(v38 + 100 * v40 + 40)))
            goto LABEL_135;
LABEL_117:
          if (v14 >= 0.5)
            goto LABEL_135;
          return 0;
      }
    }
    switch(v41)
    {
      case 'A':
        if (strstr("Il", (const char *)(v38 + 100 * v39 + 40)))
        {
          v41 = 65;
          if (strstr("Il", (const char *)(v38 + 100 * v40 + 40)))
            goto LABEL_103;
        }
        else
        {
          v41 = 65;
        }
        goto LABEL_135;
      case 'B':
      case 'C':
      case 'E':
      case 'F':
      case 'G':
      case 'I':
      case 'J':
      case 'L':
      case 'P':
      case 'S':
      case 'T':
        goto LABEL_135;
      case 'D':
        v50 = (const char *)(v38 + 100 * v39 + 40);
        if (strstr("T[", v50)
          && strstr("Jj", (const char *)(v38 + 100 * v40 + 40))
          && *(_DWORD *)(v11 + 100 * v28 + 64) == -1)
        {
          if (v37 > 0.3)
            return 0;
        }
        else if (strstr("r", v50) && *(unsigned __int8 *)(v7 + 17) > 1u)
        {
          return 0;
        }
        v41 = 68;
        goto LABEL_135;
      case 'H':
        if (!strstr("t", (const char *)(v38 + 100 * v39 + 40)))
        {
          v41 = 72;
          goto LABEL_135;
        }
        v41 = 72;
        if (!strstr("I", (const char *)(v38 + 100 * v40 + 40)))
          goto LABEL_135;
        v47 = v37;
        v48 = 0.7;
        goto LABEL_91;
      case 'K':
        if (strstr("Il", (const char *)(v38 + 100 * v39 + 40)))
        {
          v41 = 75;
          if (strstr("{", (const char *)(v38 + 100 * v40 + 40)))
            goto LABEL_103;
        }
        else
        {
          v41 = 75;
        }
        goto LABEL_135;
      case 'M':
        v51 = (const char *)(v38 + 100 * v39 + 40);
        if (strstr("KI", v51)
          && strstr("I", (const char *)(v38 + 100 * v40 + 40))
          && *(_DWORD *)(v11 + 100 * v28 + 64) == -1)
        {
          if (v14 < 0.5)
            return 0;
        }
        else if (strstr("wWj", v51) && strstr("jJI", (const char *)(v38 + 100 * v40 + 40)))
        {
          v49 = *(_DWORD *)(v11 + 100 * v28 + 64);
          v41 = 77;
          goto LABEL_102;
        }
        v41 = 77;
        goto LABEL_135;
      case 'N':
        if (!strstr("I", (const char *)(v38 + 100 * v39 + 40))
          || !strstr("yN", (const char *)(v38 + 100 * v40 + 40)))
        {
          v41 = 78;
          goto LABEL_135;
        }
        v41 = 78;
        if (*(_DWORD *)(v11 + 100 * v28 + 64) != -1)
          goto LABEL_135;
        v52 = v14;
        v53 = 0.6;
        goto LABEL_104;
      case 'O':
      case 'Q':
        goto LABEL_56;
      case 'R':
        v54 = (const char *)(v38 + 100 * v39 + 40);
        if (strstr("[If", v54) && strstr("Il", (const char *)(v38 + 100 * v40 + 40)))
        {
          result = 0;
          if ((*(_BYTE *)(v11 + 100 * v28 + 93) & 3) != 0 || v14 < v37)
            return result;
        }
        else if (strstr("F", v54)
               && strstr("4", (const char *)(v38 + 100 * v40 + 40))
               && *(unsigned __int8 *)(v7 + 17) > 1u)
        {
          return 0;
        }
        v41 = 82;
        goto LABEL_135;
      case 'U':
        goto LABEL_66;
      case 'V':
        goto LABEL_71;
      case 'W':
        goto LABEL_75;
      default:
        if (v41 == 37)
          goto LABEL_44;
        if (v41 == 48)
          goto LABEL_56;
        goto LABEL_135;
    }
  }
  v41 = *(_DWORD *)(v11 + 100 * v28 + 40);
  if (v41 == 37)
  {
LABEL_44:
    v42 = ConfusionScoreForCC;
    return v14 >= 0.5 && v42 <= 0.3;
  }
LABEL_135:
  *(_DWORD *)__s2 = v41;
  if (!strstr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", __s2))
    return 1;
  v55 = (__PAIR64__(v8, v6) - 1) >> 32;
  if ((int)v55 < 1)
    return 1;
  v75 = v8;
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v59 = *(_QWORD *)(a1 + 280);
  v60 = 1.0;
  do
  {
    v61 = a3[v56];
    v62 = v59 + 100 * v61;
    v65 = *(unsigned __int8 *)(v62 + 40);
    v63 = (int *)(v62 + 40);
    v64 = v65;
    if (v65)
    {
      v66 = 0;
      v67 = (unsigned __int8 *)(v59 + 41 + 100 * v61);
      do
      {
        if ((v64 & 0xC0) != 0x80)
          ++v66;
        v68 = *v67++;
        v64 = v68;
      }
      while (v68);
      if (v66 == 1)
      {
        v69 = *v63;
        *(_DWORD *)v78 = *v63;
        if (strstr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", v78))
        {
          if (((v69 - 73) > 0x33 || ((1 << (v69 - 73)) & 0x8000800000001) == 0)
            && v69 != 49)
          {
            goto LABEL_152;
          }
          ++v57;
        }
        else
        {
          ++v58;
        }
        v70 = v59 + 100 * v61;
        if (*(float *)(v70 + 48) < v60)
          v60 = *(float *)(v70 + 48);
      }
    }
LABEL_152:
    ++v56;
  }
  while (v56 != v55);
  if (v58 > 0)
  {
    v71 = 0.94;
    if (v57 + v58 != v75)
      v71 = 0.5;
    if (v71 <= v37)
      v71 = v37;
    if (v60 < v71)
      return 0;
  }
  return 1;
}

BOOL concatenatedCCsMatchCC(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  uint64_t v10;
  size_t v11;
  char __s[4];
  uint64_t v13;
  uint64_t v14;

  result = 0;
  if (a2 != -1)
  {
    v13 = v4;
    v14 = v5;
    if (a3 != -1)
    {
      v10 = *(_QWORD *)(a1 + 280);
      *(_DWORD *)__s = *(_DWORD *)(v10 + 100 * a2 + 40);
      v11 = strlen(__s);
      if (strlen((const char *)(v10 + 100 * a3 + 40)) + v11 <= 3)
      {
        __strncat_chk();
        return *(_DWORD *)__s == *(_DWORD *)(a4 + 40);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t combineSlash(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  unsigned __int16 *v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  uint64_t v30;
  int v31;
  _DWORD *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  int v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  char v47;
  char v48;
  int v49;
  char *v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[12];
  uint64_t v56;
  _DWORD v57[2];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 280);
  if (*(_DWORD *)(v4 + 100 * a2 + 40) != 47)
    return 0;
  result = 0;
  if (a3 == -1 || a4 == -1)
    return result;
  v11 = v4 + 100 * a2;
  v12 = *(unsigned __int16 *)(v11 + 86);
  v13 = *(unsigned __int16 *)(v11 + 84);
  v14 = v4 + 100 * a3;
  v15 = *(unsigned __int16 *)(v14 + 86);
  v16 = *(unsigned __int16 *)(v14 + 84);
  v17 = 3 * (v12 - v13);
  if (((4 * (v15 - v16)) | 1) > v17)
    return 0;
  v20 = (unsigned __int16 *)(v4 + 100 * a4);
  v21 = v20[43];
  v22 = v20[42];
  v23 = (v15 + v16 + 1) >> 1;
  v24 = (v12 + v13 + 1) >> 1;
  v25 = (*(unsigned __int16 *)(v4 + 100 * a2 + 82) + *(unsigned __int16 *)(v4 + 100 * a2 + 80) + 1) >> 1;
  v26 = ((4 * (v21 - v22)) | 1) > v17
     || (*(unsigned __int16 *)(v4 + 100 * a3 + 82) + *(unsigned __int16 *)(v4 + 100 * a3 + 80) + 1) >> 1 >= v25;
  v27 = v26 || v25 >= (v20[41] + v20[40] + 1) >> 1;
  v28 = v27 || v23 >= v24;
  if (v28 || v24 >= (v21 + v22 + 1) >> 1)
    return 0;
  if (*(_DWORD *)(a1 + 36) == 4412225)
  {
LABEL_26:
    result = FKSequenceScoreAsPercent(a1, a2, a3, 0);
    if (!(_DWORD)result)
      return result;
    result = FKSequenceScoreAsPercent(a1, a2, a4, 0);
    if (!(_DWORD)result)
      return result;
    v57[0] = a3;
    v57[1] = a4;
    v34 = *(_QWORD *)(a1 + 280);
    if (!*(_DWORD *)(v34 + 100 * a3 + 40) && !*(_DWORD *)(v34 + 100 * a4 + 40))
      FKRecognizeMultipleConcomps(a1, (uint64_t)v57, 2);
    v35 = 0;
    memset(v55, 0, sizeof(v55));
    v36 = 1;
    v56 = 0;
    while (1)
    {
      v37 = v36;
      v38 = (char *)(*(_QWORD *)(a1 + 280) + 100 * (int)v57[v35]);
      if ((v38[94] & 8) != 0)
      {
        v39 = *((_OWORD *)v38 + 2);
        v40 = *((_OWORD *)v38 + 3);
        v41 = *((_OWORD *)v38 + 4);
        v42 = *((_OWORD *)v38 + 5);
        v43 = *((_DWORD *)v38 + 24);
        v44 = *(_OWORD *)v38;
        v45 = *((_OWORD *)v38 + 1);
        v38 = (char *)v55 + 100 * v35;
        *((_OWORD *)v38 + 2) = v39;
        *((_OWORD *)v38 + 3) = v40;
        *((_OWORD *)v38 + 4) = v41;
        *((_OWORD *)v38 + 5) = v42;
        *((_DWORD *)v38 + 24) = v43;
        *(_OWORD *)v38 = v44;
        *((_OWORD *)v38 + 1) = v45;
        *((_DWORD *)v38 + 10) = 0;
      }
      if (!*((_DWORD *)v38 + 10))
        FKRecognizeConcomp(a1, (uint64_t)v38);
      if ((*((_DWORD *)v38 + 6) | 0x20) != 0x6F || getConfusionScoreForCC((uint64_t)v38) < 0.8)
        break;
      v36 = 0;
      v35 = 1;
      if ((v37 & 1) == 0)
      {
        v46 = 0;
        v47 = 1;
        do
        {
          v48 = v47;
          if (*((_DWORD *)&v55[2] + 25 * v46 + 2))
          {
            v49 = v57[v46];
            v50 = (char *)v55 + 100 * v46;
            v51 = *((_OWORD *)v50 + 5);
            v52 = *(_QWORD *)(a1 + 280) + 100 * v49;
            *(_OWORD *)(v52 + 64) = *((_OWORD *)v50 + 4);
            *(_OWORD *)(v52 + 80) = v51;
            *(_DWORD *)(v52 + 96) = *((_DWORD *)v50 + 24);
            v53 = *((_OWORD *)v50 + 1);
            *(_OWORD *)v52 = *(_OWORD *)v50;
            *(_OWORD *)(v52 + 16) = v53;
            v54 = *((_OWORD *)v50 + 3);
            *(_OWORD *)(v52 + 32) = *((_OWORD *)v50 + 2);
            *(_OWORD *)(v52 + 48) = v54;
          }
          v47 = 0;
          v46 = 1;
        }
        while ((v48 & 1) != 0);
        return 37;
      }
    }
    return 0;
  }
  v30 = 0;
  v31 = *(_DWORD *)(v4 + 100 * a3 + 40);
  v32 = (_DWORD *)(v4 + 100 * a4 + 40);
  v33 = "41234171913231525354516561838587800";
  while (v31 != *(v33 - 1) || *v32 != *v33)
  {
    v33 += 2;
    if (++v30 == 17)
      goto LABEL_26;
  }
  return combineSlash_vulgarFractionsStr[v30];
}

uint64_t compareInt(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

_QWORD *FKSessionCreate(int a1, int a2)
{
  _QWORD *v2;
  char *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = 0;
  if (a1 >= 1 && a2 >= 1)
  {
    v5 = (char *)malloc_type_calloc(1uLL, 0x160uLL, 0x10B00408D8AB762uLL);
    v2 = v5;
    if (v5)
    {
      *(_DWORD *)v5 = 10;
      *(_QWORD *)&v6 = 0x100000001;
      *((_QWORD *)&v6 + 1) = 0x100000001;
      *(_OWORD *)(v5 + 8) = v6;
      *((_DWORD *)v5 + 6) = 2;
      *((_DWORD *)v5 + 7) = a1;
      *((_DWORD *)v5 + 8) = a2;
      *((_DWORD *)v5 + 9) = 0;
      *((_QWORD *)v5 + 26) = a2;
      *((_QWORD *)v5 + 27) = a1;
      v7 = (a1 + 31) & 0xFFFFFFE0;
      *((_QWORD *)v5 + 28) = v7;
      if (!(a1 >> 15))
      {
        v8 = malloc_type_malloc(v7 * (unint64_t)((a2 + 31) & 0xFFFFFFE0), 0xCD8B3B48uLL);
        v2[25] = v8;
        if (!v8)
          goto LABEL_12;
      }
      v9 = (a1 + 1) | ((a1 + 1) >> 1) | (((a1 + 1) | ((a1 + 1) >> 1)) >> 2);
      v10 = v9 | (v9 >> 4) | ((v9 | (v9 >> 4)) >> 8);
      v11 = v10 | HIWORD(v10);
      *((_DWORD *)v2 + 60) = v11 + 1;
      *((_DWORD *)v2 + 61) = v11;
      *((_DWORD *)v2 + 62) = 0;
      v12 = malloc_type_malloc(12 * (v11 + 1), 0x1000040FD6F1FF4uLL);
      v2[29] = v12;
      if (!v12)
        goto LABEL_12;
      v13 = malloc_type_malloc(0x40000uLL, 0x100004000313F17uLL);
      v2[32] = v13;
      if (!v13)
        goto LABEL_12;
      *((_DWORD *)v2 + 68) = 0x8000;
      v14 = malloc_type_calloc(0x200uLL, 2uLL, 0x1000040BDFB0063uLL);
      v2[33] = v14;
      if (!v14)
        goto LABEL_12;
      v15 = malloc_type_malloc(0x32000uLL, 0x1000040D2C85C19uLL);
      v2[35] = v15;
      if (v15
        && (v2[36] = 2048,
            *((_DWORD *)v2 + 77) = 0,
            v16 = malloc_type_calloc(1uLL, 0x6800uLL, 0x1010040D07E2FD1uLL),
            (v2[39] = v16) != 0))
      {
        v2[40] = 0xFFFFFFFF00000100;
        *((_DWORD *)v2 + 82) = -1;
      }
      else
      {
LABEL_12:
        v17 = (void *)v2[39];
        if (v17)
          free(v17);
        v18 = (void *)v2[35];
        if (v18)
          free(v18);
        v19 = (void *)v2[32];
        if (v19)
          free(v19);
        v20 = (void *)v2[25];
        if (v20)
          free(v20);
        free(v2);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t FKSessionReset(uint64_t result, int a2, int a3)
{
  uint64_t v5;
  int v6;
  signed int v7;
  int v8;
  signed int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  if (result)
  {
    v5 = result;
    if (*(_DWORD *)(result + 28) == a2 && *(_DWORD *)(result + 32) == a3)
    {
LABEL_12:
      *(_QWORD *)(v5 + 248) = 0;
      freeSequenceMemory(v5);
      *(_QWORD *)(v5 + 300) = 0;
      *(_QWORD *)(v5 + 292) = 0;
      *(_DWORD *)(v5 + 308) = 0;
      return 1;
    }
    v6 = a3 + 31;
    if (a3 < -31)
      v6 = a3 + 62;
    v7 = v6 & 0xFFFFFFE0;
    v8 = a2 + 31;
    if (a2 < -31)
      v8 = a2 + 62;
    v9 = v8 & 0xFFFFFFE0;
    *(_QWORD *)(result + 224) = v9;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 200), v7 * (uint64_t)v9, 0xCD2FD1F6uLL);
    if (result)
    {
      *(_QWORD *)(v5 + 200) = result;
      if (*(_DWORD *)(v5 + 28) != a2)
      {
        v10 = (a2 + 1) | ((a2 + 1) >> 1) | (((a2 + 1) | ((a2 + 1) >> 1)) >> 2);
        v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
        v12 = v11 | HIWORD(v11);
        *(_DWORD *)(v5 + 240) = v12 + 1;
        *(_DWORD *)(v5 + 244) = v12;
        *(_QWORD *)(v5 + 232) = malloc_type_realloc(*(void **)(v5 + 232), 12 * (v12 + 1), 0x1000040FD6F1FF4uLL);
      }
      *(_DWORD *)(v5 + 28) = a2;
      *(_DWORD *)(v5 + 32) = a3;
      goto LABEL_12;
    }
  }
  return result;
}

void freeSequenceMemory(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(int *)(a1 + 320) >= 1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *(_QWORD *)(a1 + 312) + v2;
      free(*(void **)(v4 + 80));
      *(_QWORD *)(v4 + 80) = 0;
      *(_DWORD *)(v4 + 88) = 0;
      free(*(void **)(v4 + 8));
      *(_QWORD *)(v4 + 8) = 0;
      *(_DWORD *)(v4 + 16) = 0;
      ++v3;
      v2 += 104;
    }
    while (v3 < *(int *)(a1 + 320));
  }
}

uint64_t FKSessionGetMemoryUsage(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(int *)(a1 + 272);
  v6 = *(_DWORD *)(a1 + 320);
  v7 = 104 * v6;
  if (v6 >= 1)
  {
    v8 = *(unsigned int *)(a1 + 320);
    v9 = (int *)(*(_QWORD *)(a1 + 312) + 16);
    do
    {
      v10 = *v9;
      v9 += 26;
      v7 += 4 * v10;
      --v8;
    }
    while (v8);
  }
  v11 = *(_DWORD *)(a1 + 288);
  v12 = 8 * v5;
  v13 = (int)v5 >> 6;
  v14 = *(_QWORD *)(a1 + 208) * *(_QWORD *)(a1 + 224);
  if (a2)
    *a2 = v14;
  v15 = v12 + 2 * v13;
  if (a3)
    *a3 = v15;
  v16 = 100 * v11;
  if (a4)
    *a4 = v16;
  if (a5)
    *a5 = v7;
  return v16 + v14 + v15 + v7;
}

void FKSessionDestroy(void **a1)
{
  freeSequenceMemory((uint64_t)a1);
  free(a1[25]);
  free(a1[29]);
  free(a1[32]);
  free(a1[33]);
  free(a1[35]);
  free(a1[39]);
  free(a1);
}

void FKSessionDestroyRecognizer(void **a1)
{
  uint64_t i;

  if (a1)
  {
    free(a1[327]);
    *((_DWORD *)a1 + 656) = 0;
    for (i = 3; i != 328; i += 65)
    {
      if (a1[i])
      {
        espresso_plan_destroy();
        a1[i] = 0;
      }
    }
    if (*a1)
      espresso_context_destroy();
    free(a1);
  }
}

void **FKSessionCreateRecognizer()
{
  void **v0;
  void **v1;
  uint64_t context;
  __CFBundle *BundleWithIdentifier;
  const __CFURL *v4;
  const __CFString *v5;
  CFStringRef v6;
  const __CFString *v7;
  CFStringEncoding SystemEncoding;
  int *v9;
  uint64_t v10;
  int v11;
  uint64_t plan;

  v0 = (void **)malloc_type_calloc(0xA48uLL, 1uLL, 0xB9A42192uLL);
  v1 = v0;
  if (v0)
  {
    *((_DWORD *)v0 + 2) = 5;
    v0[327] = 0;
    *((_DWORD *)v0 + 656) = 0;
    context = espresso_create_context();
    *v1 = (void *)context;
    if (context)
    {
      BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.Futhark"));
      v4 = CFBundleCopyResourceURL(BundleWithIdentifier, CFSTR("recognition.espresso.net"), 0, 0);
      if (v4)
      {
        v5 = (const __CFString *)v4;
        v6 = CFURLCopyFileSystemPath(v4, kCFURLPOSIXPathStyle);
        if (v6)
        {
          v7 = v6;
          SystemEncoding = CFStringGetSystemEncoding();
          CFStringGetCStringPtr(v7, SystemEncoding);
          v9 = &FKBatchLevels_0;
          v10 = 0x1FFFFFFFFFFFFEBBLL;
          while (1)
          {
            v11 = *v9++;
            LODWORD(v1[v10 + 327]) = v11;
            plan = espresso_create_plan();
            v1[v10 + 328] = (void *)plan;
            if (!plan
              || espresso_plan_add_network()
              || v10 != -325 && espresso_network_change_input_blob_shapes())
            {
              break;
            }
            if (espresso_plan_build()
              || espresso_network_bind_buffer()
              || espresso_network_bind_buffer()
              || espresso_network_bind_buffer())
            {
              break;
            }
            v10 += 65;
            if (!(v10 * 8))
            {
              CFRelease(v5);
              CFRelease(v7);
              return v1;
            }
          }
          CFRelease(v5);
        }
        else
        {
          v7 = v5;
        }
        CFRelease(v7);
      }
    }
  }
  FKSessionDestroyRecognizer(v1);
  return 0;
}

uint64_t FKThresholdCalculateOtsuLimit(uint64_t a1, _QWORD *a2)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  int v20;
  uint64_t v21;
  uint64_t result;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  _DWORD v28[256];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 28);
  v4 = *(_DWORD *)(a1 + 32);
  bzero(v28, 0x400uLL);
  LODWORD(v5) = v4 / 4;
  v6 = 3 * v4 + 3;
  if (3 * v4 >= 0)
    v6 = 3 * v4;
  if ((int)v5 < v6 >> 2)
  {
    v7 = v6 >> 2;
    if (3 * v3 >= 0)
      v8 = 3 * v3;
    else
      v8 = 3 * v3 + 3;
    v9 = v8 >> 2;
    v10 = a2[3];
    v5 = (int)v5;
    v11 = (uint64_t)v8 >> 2;
    v12 = (unsigned __int8 *)(*a2 + v10 * (int)v5 + v3 / 4);
    v13 = v11 - v3 / 4;
    do
    {
      if (v3 / 4 < v9)
      {
        v14 = v13;
        v15 = v12;
        do
        {
          v16 = *v15++;
          ++v28[v16];
          --v14;
        }
        while (v14);
      }
      ++v5;
      v12 += v10;
    }
    while (v5 != v7);
  }
  v17 = 0;
  v18 = 0.0;
  v19 = 0.0;
  do
  {
    v20 = v28[v17];
    v19 = v19 + (double)v20;
    v18 = v18 + (double)(v20 * (int)v17++);
  }
  while (v17 != 256);
  v21 = 0;
  result = 0;
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  do
  {
    v27 = v28[v21];
    v25 = v25 + (double)v27;
    v24 = v24 + (double)(v27 * (int)v21);
    if (v25 != 0.0)
    {
      if (v25 == v19)
        return result;
      v23 = -v19;
      if ((v24 * v23 + v18 * v25) * (v24 * v23 + v18 * v25) / (v25 * (v19 - v25)) >= v26)
      {
        v26 = (v24 * v23 + v18 * v25) * (v24 * v23 + v18 * v25) / (v25 * (v19 - v25));
        result = v21;
      }
    }
    ++v21;
  }
  while (v21 != 256);
  return result;
}

uint64_t FKThreshold(uint64_t result, uint64_t *a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v3 = *(_DWORD *)(result + 32);
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = *(_QWORD *)(result + 200);
    v6 = *a2;
    v7 = *(_DWORD *)(result + 28);
    do
    {
      if (v7 >= 1)
      {
        v8 = 0;
        do
        {
          *(_BYTE *)(v5 + v8) = *(unsigned __int8 *)(v6 + v8) >= a3;
          v7 = *(_DWORD *)(result + 28);
          ++v8;
        }
        while ((int)v8 < v7);
        v3 = *(_DWORD *)(result + 32);
        v5 += v8;
        v6 += v8;
      }
      v6 += a2[3] - v7;
      v5 += *(_QWORD *)(result + 224) - v7;
      ++v4;
    }
    while (v4 < v3);
  }
  return result;
}

void FKThresholdBlockAverage(uint64_t a1, uint64_t *a2)
{
  int v4;
  int v5;
  BOOL v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t i;
  uint64_t v31;
  int v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  _OWORD v41[4];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = *(_DWORD *)(a1 + 28);
  v4 = *(_DWORD *)(a1 + 32);
  v7 = v4 + 7;
  v6 = v4 < -7;
  v8 = v4 + 14;
  if (!v6)
    v8 = v7;
  v9 = v8 >> 3;
  v10 = v5 + 7;
  v6 = v5 < -7;
  v11 = v5 + 14;
  if (!v6)
    v11 = v10;
  v12 = v11 >> 3;
  v13 = malloc_type_malloc((v11 >> 3) * v9, 0xA0DA9599uLL);
  LODWORD(v14) = *(_DWORD *)(a1 + 32);
  if ((int)v14 >= 1)
  {
    v15 = 0;
    v16 = 0;
    v17 = v12;
    do
    {
      v18 = 0;
      memset(v41, 0, sizeof(v41));
      v19 = (int)v14;
      v20 = *a2;
      v21 = a2[3];
      do
      {
        v22 = v16 + v18;
        if (v16 + v18 >= (int)v14)
          v22 = (int)v14 - 1;
        *((_QWORD *)v41 + v18++) = v20 + v21 * v22;
      }
      while (v18 != 8);
      v23 = *(_DWORD *)(a1 + 28);
      if (v23 >= 1)
      {
        v24 = 0;
        v25 = 0;
        do
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = 255;
          do
          {
            for (i = 0; i != 8; ++i)
            {
              v31 = v24 + i;
              if (v24 + i >= v23)
                v31 = v23 - 1;
              v32 = *(unsigned __int8 *)(*((_QWORD *)v41 + v26) + v31);
              v28 += v32;
              if (v27 <= v32)
                v27 = v32;
              if (v29 >= v32)
                v29 = v32;
            }
            ++v26;
          }
          while (v26 != 8);
          if (v27 - v29 <= 24)
          {
            if (v15
              && v25
              && (v34 = v13[v25 + (v15 - 1) * v17]
                      + 2 * v13[(int)v15 * (int)v17 - 1 + (int)v25]
                      + v13[v25 - 1 + (v15 - 1) * v17],
                  v29 < (int)(v34 >> 2)))
            {
              v33 = v34 >> 2;
            }
            else
            {
              v33 = v29 >> 1;
            }
          }
          else
          {
            v33 = v28 / 64;
          }
          v13[v25 + v15 * v17] = v33;
          v23 = *(_DWORD *)(a1 + 28);
          v14 = *(int *)(a1 + 32);
          if (v16 < v14)
          {
            v35 = 0;
            v36 = v16;
            do
            {
              if (v24 < v23)
              {
                v37 = 0;
                v38 = *((_QWORD *)v41 + v35) + v24;
                do
                {
                  *(_BYTE *)(*(_QWORD *)(a1 + 200) + v36 * *(_QWORD *)(a1 + 224) + v24 + v37) = v33 <= *(unsigned __int8 *)(v38 + v37);
                  ++v37;
                  v23 = *(_DWORD *)(a1 + 28);
                  v39 = v23 - v24;
                  if (v23 - (int)v24 >= 8)
                    v39 = 8;
                }
                while (v37 < v39);
                LODWORD(v14) = *(_DWORD *)(a1 + 32);
              }
              ++v35;
              v40 = v14 - v16;
              if ((int)v14 - (int)v16 >= 8)
                v40 = 8;
              ++v36;
            }
            while (v35 < v40);
          }
          v24 += 8;
          ++v25;
        }
        while (v24 < v23);
        v19 = (int)v14;
      }
      v16 += 8;
      ++v15;
    }
    while (v16 < v19);
  }
  free(v13);
}

uint64_t FKThresholdCalculateContrast(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  unsigned __int8 *v13;
  unint64_t v14;
  int v15;
  int v16;

  v3 = WORD1(a3);
  if (WORD1(a3) >= *(int *)(a1 + 28))
    return 0;
  v4 = HIWORD(a3);
  if (*(_DWORD *)(a1 + 32) <= (int)HIWORD(a3) || v4 <= WORD2(a3))
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = (unsigned __int16)a3;
  v8 = (unsigned __int16)a3;
  v9 = WORD1(a3) - (unsigned __int16)a3;
  v10 = WORD2(a3);
  v11 = WORD1(a3) - (unint64_t)(unsigned __int16)a3;
  v12 = 255;
  do
  {
    if (v3 > v7)
    {
      v13 = (unsigned __int8 *)(*a2 + v8 + a2[3] * v10);
      v14 = v11;
      do
      {
        v16 = *v13++;
        v15 = v16;
        if (v12 >= v16)
          v12 = v15;
        if (v6 <= v15)
          v6 = v15;
        --v14;
      }
      while (v14);
      v5 += v9;
    }
    ++v10;
  }
  while (v10 != v4);
  if (v5)
    return (v6 - v12);
  else
    return 0;
}

void FKThresholdMinMaxBlock(uint64_t a1, _QWORD *a2, int a3, int a4, int a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  _OWORD *v26;
  uint8x16_t *v27;
  int16x8_t v28;
  int16x8_t v29;
  uint8x16_t v30;
  uint8x16_t v31;
  int16x8_t v32;
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
  unsigned int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  char *v66;
  uint64_t v67;
  int v68;
  int v69;
  unsigned int v70;
  int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  char *v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  unint64_t v88;
  unint64_t v89;
  BOOL v91;
  int v92;
  int v93;
  char v94;
  char *v95;
  int v96;
  int v97;
  int v98;
  signed int v99;
  char *v100;
  unint64_t v101;
  int v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  __int128 v107;
  int8x16_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t k;
  _OWORD *v121;
  uint64_t v122;
  uint8x16_t v123;
  uint64_t v124;
  uint8x16_t *v125;
  int8x16_t *v126;
  uint64_t v127;
  int v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  int v134;
  uint64_t v135;
  int v136;
  unsigned __int8 v137;
  uint64_t i;
  int v139;
  int v140;
  float v141;
  uint64_t j;
  _OWORD *v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  size_t v147;
  unint64_t v148;
  char *v149;
  uint64_t kk;
  uint64_t mm;
  uint64_t v152;
  unsigned int v153;
  uint64_t v154;
  uint64_t m;
  uint64_t v156;
  int v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  uint64_t v163;
  int v164;
  unsigned __int8 v165;
  uint64_t n;
  int v167;
  float v168;
  uint64_t ii;
  uint64_t jj;
  uint64_t nn;
  unint64_t v172;
  char *v173;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  _QWORD *v181;
  char *v183;
  unint64_t v186;
  unint64_t v187;
  unint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  unint64_t v192;
  _QWORD v193[2];
  _OWORD v194[16];
  uint8x16_t v195[16];
  uint64_t v196;

  v5 = a2;
  v196 = *MEMORY[0x1E0C80C00];
  v6 = a2[2] + 3;
  v7 = v6 >> 2;
  v179 = a2[1];
  v8 = ((unint64_t)(v179 + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL;
  v9 = (char *)malloc_type_malloc(v8 * (v6 & 0xFFFFFFFFFFFFFFFCLL), 0x100004052888210uLL);
  v181 = v5;
  if (v8)
  {
    v10 = 0;
    v11 = 0;
    v12 = v5[2];
    v13 = (v12 >> 2) & 0x3FFFFFFFFFFFFFFCLL;
    v186 = v12;
    v14 = v12 & 0xF;
    do
    {
      v15 = 0;
      v189 = v11;
      v16 = &v9[4 * v11 * v7];
      v193[0] = v16;
      v193[1] = &v16[4 * v7];
      memset(v194, 0, 64);
      v18 = *v5;
      v17 = v5[1];
      v19 = v5[3];
      do
      {
        v20 = v10 + v15;
        if (v17 <= v10 + v15)
          v20 = v17 - 1;
        *((_QWORD *)v194 + v15++) = v18 + v20 * v19;
      }
      while (v15 != 8);
      if (v186 >= 0x10)
      {
        v21 = 0;
        do
        {
          v22 = 0;
          v23 = 1;
          do
          {
            v24 = 0;
            v25 = v23;
            v26 = &v194[2 * v22];
            do
            {
              v27 = (uint8x16_t *)*((_QWORD *)v26 + v24);
              v195[v24] = *v27;
              *((_QWORD *)v26 + v24++) = v27 + 1;
            }
            while (v24 != 4);
            v23 = 0;
            v28 = (int16x8_t)vpadalq_u8(vpadalq_u8(vpadalq_u8(vpaddlq_u8(v195[1]), v195[0]), v195[2]), v195[3]);
            v29.i64[0] = vpaddq_s16(v28, v28).u64[0];
            v29.i64[1] = v29.i64[0];
            v30 = vminq_u8(vminq_u8(vminq_u8(v195[0], v195[1]), v195[2]), v195[3]);
            v31 = vmaxq_u8(vmaxq_u8(vmaxq_u8(v195[0], v195[1]), v195[2]), v195[3]);
            v32 = (int16x8_t)vpminq_u8(v30, v30);
            v31.i64[0] = vpmaxq_u8(v31, v31).u64[0];
            *(int8x8_t *)v32.i8 = vzip1_s8((int8x8_t)vpmin_u8(*(uint8x8_t *)v32.i8, *(uint8x8_t *)v32.i8), (int8x8_t)vpmax_u8(*(uint8x8_t *)v31.i8, *(uint8x8_t *)v31.i8));
            *(int16x8_t *)(v193[v22] + 4 * v21) = vzip1q_s16(v32, v29);
            v22 = 1;
          }
          while ((v25 & 1) != 0);
          v21 += 4;
        }
        while (v13 > v21);
      }
      if (v14)
      {
        v33 = 0;
        v34 = 0;
        v36 = *((_QWORD *)&v194[0] + 1);
        v35 = *(_QWORD *)&v194[0];
        v38 = *((_QWORD *)&v194[1] + 1);
        v37 = *(_QWORD *)&v194[1];
        v40 = *((_QWORD *)&v194[2] + 1);
        v39 = *(_QWORD *)&v194[2];
        v42 = *((_QWORD *)&v194[3] + 1);
        v41 = *(_QWORD *)&v194[3];
        do
        {
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v48 = 255;
          v49 = 255;
          do
          {
            if (v33 + v43 >= v14)
              break;
            v50 = *(unsigned __int8 *)(v35 + v43);
            if (v49 >= v50)
              v49 = *(unsigned __int8 *)(v35 + v43);
            if ((int)v44 <= v50)
              v44 = *(unsigned __int8 *)(v35 + v43);
            v51 = v46 + v50;
            v52 = *(unsigned __int8 *)(v36 + v43);
            if (v49 >= v52)
              v49 = *(unsigned __int8 *)(v36 + v43);
            if (v44 <= v52)
              v44 = *(unsigned __int8 *)(v36 + v43);
            v53 = *(unsigned __int8 *)(v37 + v43);
            if (v49 >= v53)
              v49 = *(unsigned __int8 *)(v37 + v43);
            if (v44 <= v53)
              v44 = *(unsigned __int8 *)(v37 + v43);
            v54 = v52 + v53;
            v55 = *(unsigned __int8 *)(v38 + v43);
            v56 = v51 + v54;
            if (v49 >= v55)
              v49 = *(unsigned __int8 *)(v38 + v43);
            if (v44 <= v55)
              v44 = *(unsigned __int8 *)(v38 + v43);
            v46 = v56 + v55;
            v57 = *(unsigned __int8 *)(v39 + v43);
            if (v48 >= v57)
              v58 = *(unsigned __int8 *)(v39 + v43);
            else
              v58 = v48;
            if (v47 <= v57)
              v59 = *(unsigned __int8 *)(v39 + v43);
            else
              v59 = v47;
            v60 = v45 + v57;
            v61 = *(unsigned __int8 *)(v40 + v43);
            if (v58 >= (int)v61)
              v58 = *(unsigned __int8 *)(v40 + v43);
            if (v59 <= v61)
              v59 = *(unsigned __int8 *)(v40 + v43);
            v62 = *(unsigned __int8 *)(v41 + v43);
            if (v58 >= (int)v62)
              v58 = *(unsigned __int8 *)(v41 + v43);
            v63 = v59 <= v62 ? *(unsigned __int8 *)(v41 + v43) : v59;
            v64 = v60 + v61 + v62;
            v65 = *(unsigned __int8 *)(v42 + v43);
            v48 = v58 >= (int)v65 ? *(unsigned __int8 *)(v42 + v43) : v58;
            v47 = v63 <= v65 ? *(unsigned __int8 *)(v42 + v43) : v63;
            v45 = v64 + v65;
            ++v43;
          }
          while (v43 != 4);
          v42 += v43;
          v41 += v43;
          v40 += v43;
          v39 += v43;
          v38 += v43;
          v37 += v43;
          v36 += v43;
          v35 += v43;
          v66 = &v16[4 * v34 + 4 * v13];
          *v66 = v49;
          v66[1] = v44;
          *((_WORD *)v66 + 1) = v46;
          v67 = (uint64_t)&v16[4 * v7 + 4 * v34 + 4 * v13];
          *(_BYTE *)v67 = v48;
          *(_BYTE *)(v67 + 1) = v47;
          *(_WORD *)(v67 + 2) = v45;
          ++v34;
          v33 += 4;
        }
        while (v34 != (v14 + 3) >> 2);
      }
      v11 = v189 + 2;
      v10 += 8;
      v5 = v181;
    }
    while ((((unint64_t)(v179 + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) > v189 + 2);
  }
  v68 = *(_DWORD *)(a1 + 28);
  v69 = *(_DWORD *)(a1 + 32);
  v70 = v68 + 62;
  if (v68 >= -31)
    v71 = v68 + 31;
  else
    v71 = v68 + 62;
  v72 = v71 >> 5;
  v177 = (uint64_t)v71 >> 5;
  v73 = v69 + 31;
  v74 = v69 + 62;
  if (v69 < -31)
    v73 = v69 + 62;
  v75 = v73 >> 5;
  v76 = (char *)malloc_type_malloc(2 * v72 * (uint64_t)(v73 >> 5), 0x1000040BDFB0063uLL);
  if (v74 >= 0x3F)
  {
    v77 = 0;
    v78 = a5 + 8;
    if (v177 <= 1)
      v79 = 1;
    else
      v79 = v177;
    if (v75 <= 1)
      v80 = 1;
    else
      v80 = v75;
    do
    {
      if (v70 >= 0x3F)
      {
        v81 = 0;
        v82 = -a5;
        do
        {
          if (v78 <= -a5)
          {
            v85 = 0;
            v84 = 0;
            v83 = 0;
            v86 = 255;
          }
          else
          {
            v83 = 0;
            v84 = 0;
            v85 = 0;
            v86 = 255;
            v87 = -a5;
            do
            {
              v88 = (v87 + 8 * v77);
              v89 = v7 * v88;
              v91 = (v88 & 0x80000000) != 0 || (unint64_t)(v179 + 3) >> 2 <= v88;
              v92 = v82;
              v93 = 2 * a5 + 8;
              do
              {
                v94 = v92 < 0 || v91;
                if ((v94 & 1) == 0 && v7 > v92)
                {
                  v95 = &v9[4 * v89 + 4 * v92];
                  v96 = *v95;
                  v97 = v95[1];
                  v98 = *((unsigned __int16 *)v95 + 1);
                  if (v86 >= v96)
                    v86 = v96;
                  if (v85 <= v97)
                    v85 = v97;
                  v84 += v98;
                  ++v83;
                }
                ++v92;
                --v93;
              }
              while (v93);
              ++v87;
            }
            while (v87 != v78);
          }
          v99 = v84 / (16 * v83) + ((v86 + v85 + 1) >> 1);
          v100 = &v76[2 * v81 + 2 * v77 * v177];
          *v100 = v99 / 2;
          v100[1] = v85 - v86;
          ++v81;
          v82 += 8;
        }
        while (v81 != v79);
      }
      ++v77;
    }
    while (v77 != v80);
  }
  v101 = v5[1];
  v102 = a4;
  if (v101)
  {
    v103 = 0;
    v104 = v5[2];
    v105 = v104 >> 5;
    v172 = v104;
    v173 = v76;
    v175 = v104 & 0xFFFFFFFFFFFFFFE0;
    v176 = v104 >> 5;
    v106 = 1;
    *(_QWORD *)&v107 = 0x202020202020202;
    *((_QWORD *)&v107 + 1) = 0x202020202020202;
    v108.i64[0] = 0x101010101010101;
    v108.i64[1] = 0x101010101010101;
    v109 = v76;
    while (1)
    {
      memset(&v195[0].u64[1], 0, 248);
      v110 = v5[3];
      v111 = *v5 + v110 * v103;
      v112 = *(_QWORD *)(a1 + 200);
      v113 = *(_QWORD *)(a1 + 224);
      v114 = v112 + v113 * v103;
      memset((char *)v194 + 8, 0, 248);
      v195[0].i64[0] = v111;
      v178 = v106;
      v115 = v112 + v113 * v106;
      v116 = 1;
      *(_QWORD *)&v194[0] = v114;
      do
      {
        if (v101 <= v103 + v116)
          v117 = 0;
        else
          v117 = v110;
        v111 += v117;
        v195[0].i64[v116] = v111;
        *((_QWORD *)v194 + v116++) = v115;
        v115 += v113;
      }
      while (v116 != 32);
      v180 = v103;
      if (v172 >= 0x20)
      {
        v118 = 0;
        v119 = v109;
        do
        {
          if (*((unsigned __int8 *)v119 + 1) >= v102)
          {
            v122 = 0;
            v123 = (uint8x16_t)vld1q_dup_s8(v119);
            v124 = (32 * v118);
            do
            {
              v125 = (uint8x16_t *)(v195[0].i64[v122] + v124);
              v126 = (int8x16_t *)(*(_QWORD *)((char *)v194 + v122 * 8) + v124);
              *v126 = vandq_s8((int8x16_t)vcgeq_u8(*v125, v123), v108);
              v126[1] = vandq_s8((int8x16_t)vcgeq_u8(v125[1], v123), v108);
              ++v122;
            }
            while (v122 != 32);
            if (!a3)
              goto LABEL_135;
            v127 = 0;
            v128 = 0;
            v129 = 0;
            do
            {
              v130 = 0;
              v131 = *((_QWORD *)v194 + v127);
              v129 += *(unsigned __int8 *)(v131 + v124);
              v132 = v131 + 32 * (v118 & 0x7FFFFFF);
              do
              {
                v133 = *(unsigned __int8 *)(v132 + v130 + 1);
                v129 += v133;
                if (v133 != *(unsigned __int8 *)(v132 + v130))
                  ++v128;
                ++v130;
              }
              while (v130 != 31);
              ++v127;
            }
            while (v127 != 32);
            v134 = 1024 - v129;
            if (v129 < 1024 - v129)
              v134 = v129;
            if (!v134)
              goto LABEL_135;
            v135 = 0;
            v136 = 0;
            do
            {
              v137 = *(_BYTE *)(v114 + v135 + v124);
              for (i = 8; i != 256; i += 8)
              {
                v139 = *(unsigned __int8 *)(*(_QWORD *)((char *)v194 + i) + v135 + v124);
                if (v139 != v137)
                  ++v136;
                v137 = v139;
              }
              ++v135;
            }
            while (v135 != 32);
            v140 = v136 + v128;
            v141 = (float)v140;
            if (v134 >= 10)
            {
              if (v140 <= 450 && (float)(v141 / (float)v134) <= 2.5)
                goto LABEL_135;
LABEL_133:
              for (j = 0; j != 256; j += 8)
              {
                v143 = (_OWORD *)(*(_QWORD *)((char *)v194 + j) + v124);
                *v143 = v107;
                v143[1] = v107;
              }
              goto LABEL_135;
            }
            if ((float)(v141 / (float)v134) > 3.0)
              goto LABEL_133;
          }
          else
          {
            for (k = 0; k != 256; k += 8)
            {
              v121 = (_OWORD *)(*(_QWORD *)((char *)v194 + k) + (32 * v118));
              *v121 = v107;
              v121[1] = v107;
            }
          }
LABEL_135:
          v119 += 2;
          ++v118;
        }
        while (v118 != v105);
      }
      v183 = v109;
      v144 = v5[2];
      v190 = v144 - v175;
      if (v144 != v175)
      {
        v145 = v190 + 31;
        if ((unint64_t)(v190 + 31) >= 0x20)
          break;
      }
LABEL_181:
      v5 = v181;
      v109 = &v183[2 * v177];
      v103 = v180 + 32;
      v101 = v181[1];
      v106 = v178 + 32;
      v76 = v173;
      v105 = v176;
      if (v101 <= v180 + 32)
        goto LABEL_182;
    }
    v146 = v175;
    v187 = v145 & 0xFFFFFFFFFFFFFFE0;
    v188 = v176 + (v145 >> 5);
    v147 = (v145 & 0xFFFFFFFFFFFFFFE0) - v190;
    v148 = v176;
    v149 = &v109[2 * v176];
    while (1)
    {
      v191 = v149;
      v192 = v148;
      if (v149[1] >= v102)
      {
        v152 = 0;
        v153 = *v149;
        v154 = 32 * v148;
        do
        {
          for (m = 0; m != 32; ++m)
          {
            if (v146 + m >= v144)
              break;
            *(_BYTE *)(*((_QWORD *)v194 + v152) + v146 + m) = *(unsigned __int8 *)(v195[0].i64[v152] + v146 + m) >= v153;
          }
          ++v152;
        }
        while (v152 != 32);
        if (!a3)
          goto LABEL_177;
        v156 = 0;
        v157 = 0;
        v158 = 0;
        do
        {
          v159 = 0;
          v160 = *((_QWORD *)v194 + v156);
          v158 += *(unsigned __int8 *)(v160 + v154);
          v161 = v160 + v146;
          do
          {
            v162 = *(unsigned __int8 *)(v161 + v159 + 1);
            v158 += v162;
            if (v162 != *(unsigned __int8 *)(v161 + v159))
              ++v157;
            ++v159;
          }
          while (v159 != 31);
          ++v156;
        }
        while (v156 != 32);
        if (v158 >= 1024 - v158)
          v158 = 1024 - v158;
        if (!v158)
          goto LABEL_177;
        v163 = 0;
        v164 = 0;
        do
        {
          v165 = *(_BYTE *)(v114 + v163 + v154);
          for (n = 8; n != 256; n += 8)
          {
            v167 = *(unsigned __int8 *)(*(_QWORD *)((char *)v194 + n) + v163 + v154);
            if (v167 != v165)
              ++v164;
            v165 = v167;
          }
          ++v163;
        }
        while (v163 != 32);
        v168 = (float)(v164 + v157);
        if (v158 >= 10)
        {
          if (v164 + v157 > 450 || (float)(v168 / (float)v158) > 2.5)
          {
LABEL_172:
            for (ii = 0; ii != 32; ++ii)
            {
              for (jj = 0; jj != 32; ++jj)
              {
                if (v146 + jj >= v144)
                  break;
                *(_BYTE *)(*((_QWORD *)v194 + ii) + v146 + jj) = 2;
              }
            }
          }
        }
        else if ((float)(v168 / (float)v158) > 3.0)
        {
          goto LABEL_172;
        }
      }
      else
      {
        for (kk = 0; kk != 32; ++kk)
        {
          for (mm = 0; mm != 32; ++mm)
          {
            if (v146 + mm >= v144)
              break;
            *(_BYTE *)(*((_QWORD *)v194 + kk) + v146 + mm) = 2;
          }
        }
      }
LABEL_177:
      if (v187 != v190)
      {
        for (nn = 0; nn != 256; nn += 8)
          memset((void *)(*(_QWORD *)((char *)v194 + nn) + v144), *(unsigned __int8 *)(*(_QWORD *)((char *)v194 + nn) + v144 - 1), v147);
      }
      v149 = v191 + 2;
      v148 = v192 + 1;
      v146 += 32;
      v102 = a4;
      *(_QWORD *)&v107 = 0x202020202020202;
      *((_QWORD *)&v107 + 1) = 0x202020202020202;
      v108.i64[0] = 0x101010101010101;
      v108.i64[1] = 0x101010101010101;
      if (v192 + 1 >= v188)
        goto LABEL_181;
    }
  }
LABEL_182:
  free(v76);
  free(v9);
}

uint64_t FKPrintLinesegList(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (a2 != -1)
  {
    v2 = result;
    do
    {
      v3 = *(_QWORD *)(v2 + 256) + 8 * a2;
      if (*(_WORD *)(v3 + 4))
        v4 = a2 - *(unsigned __int16 *)(v3 + 4);
      else
        v4 = -1;
      result = printf("%6d: %6d %6d %2d %4d %4d %4d\n", a2, v4, *(int *)v3 >> 8, *(_DWORD *)v3 & 3, (unsigned __int16)((*(_DWORD *)v3 >> 2)+ *(_WORD *)(*(_QWORD *)(v2 + 264) + 2 * (a2 >> 6))), (unsigned __int16)(*(_WORD *)(v3 - 2) + 1), *(unsigned __int16 *)(v3 + 6));
      if (!*(_WORD *)(v3 + 4))
        break;
      a2 = ((unint64_t)(v3 - *(_QWORD *)(v2 + 256)) >> 3) - *(unsigned __int16 *)(v3 + 4);
    }
    while (a2 != -1);
  }
  return result;
}

uint64_t FKComponentPrint(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _WORD *v16;
  uint64_t v17;
  unsigned __int16 v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = *(unsigned __int16 *)(a2 + 80);
  v5 = *(unsigned __int16 *)(a2 + 82) - v4;
  v6 = v5 + 1;
  v7 = *(unsigned __int16 *)(a2 + 84);
  v8 = *(unsigned __int16 *)(a2 + 86) - v7;
  MEMORY[0x1E0C80A78](a1);
  v10 = (char *)v27 - v9;
  memset((char *)v27 - v9, 46, v11);
  printf("Color: %d\n", *(unsigned __int8 *)(a2 + 92));
  printf("Size: %dx%d\n", v5 + 1, v8 + 1);
  v12 = *(_DWORD *)(a2 + 12);
  if (v12 != -1)
  {
    v13 = *(_QWORD *)(a1 + 256);
    v14 = *(_QWORD *)(a1 + 264);
    do
    {
      v15 = v12;
      v16 = (_WORD *)(v13 + 8 * v12);
      v17 = (unsigned __int16)v16[3];
      v18 = *(v16 - 1) + 1;
      if (v17 >= v18)
      {
        v19 = v17 - v18 + 1;
        v20 = ((unsigned __int16)((*v16 >> 2) + *(_WORD *)(v14 + 2 * ((int)v15 >> 6))) - v7) * v6
            - v4
            + v18;
        do
        {
          v10[v20++] = 64;
          --v19;
        }
        while (v19);
      }
      v12 = v15 - *(unsigned __int16 *)(v13 + 8 * v15 + 4);
      if (*(_WORD *)(v13 + 8 * v15 + 4))
        v21 = v12 == -1;
      else
        v21 = 1;
    }
    while (!v21);
  }
  if ((v8 & 0x80000000) == 0)
  {
    v22 = 0;
    do
    {
      v23 = v6;
      v24 = v10;
      if ((v5 & 0x80000000) == 0)
      {
        do
        {
          v25 = *v24++;
          putchar(v25);
          --v23;
        }
        while (v23);
      }
      putchar(10);
      ++v22;
      v10 += v6;
    }
    while (v22 != v8 + 1);
  }
  return fflush((FILE *)*MEMORY[0x1E0C80C20]);
}

uint64_t FKConcompRelease(uint64_t result, int a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 != -1)
  {
    v3 = *(_QWORD *)(result + 280);
    v4 = v3 + 100 * a2;
    v7 = *(_DWORD *)(v4 + 8);
    v6 = v4 + 8;
    v5 = v7;
    *(_BYTE *)(v6 + 86) = a3;
    v8 = *(_DWORD *)(v6 - 4);
    v9 = (_DWORD *)(v3 + 100 * v8 + 8);
    if (v8 == -1)
      v9 = (_DWORD *)(result + 300);
    *v9 = v5;
    if (v5 == -1)
      *(_DWORD *)(result + 296) = v8;
    else
      *(_DWORD *)(v3 + 100 * v5 + 4) = v8;
    v10 = 0;
    *(_DWORD *)(v6 - 4) = *(_DWORD *)(result + 304);
    *(_DWORD *)(result + 304) = a2;
    *(_DWORD *)v6 = -2;
    v11 = v3 + 100 * a2;
    v12 = 100 * a2;
    *(_QWORD *)(v11 + 80) = -1;
    *(_DWORD *)(v11 + 40) = 0;
    v13 = *(_QWORD *)(result + 280);
    do
    {
      *(_DWORD *)(v13 + v12 + v10 + 24) = 0;
      v13 = *(_QWORD *)(result + 280);
      *(_DWORD *)(v13 + v12 + v10 + 48) = 0;
      v10 += 4;
    }
    while (v10 != 16);
    *(_QWORD *)(v13 + 100 * a2 + 64) = -1;
    ++*(_DWORD *)(result + 292);
  }
  return result;
}

uint64_t FKConcompCreateSubConcomp(size_t a1, int a2, _WORD *a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned __int16 v14;
  int v15;
  _WORD *v16;
  unint64_t v17;
  unsigned __int16 v18;
  int v19;
  int v20;
  __int16 v21;
  unsigned __int16 v22;
  int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  __int16 *v41;
  __int16 *v42;
  __int16 v43;
  unsigned int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v57;
  int v58;
  _QWORD v59[2];
  BOOL (*v60)(uint64_t, unsigned int, int, int *, int *);
  void *v61;
  _WORD *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  char v66;
  int v67[2];
  int v68;
  int v69[2];
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 280) + 100 * a2;
  v7 = *(_QWORD *)(v6 + 80);
  v8 = *a3 != 0;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 0x40000000;
  v60 = __FKConcompCreateSubConcomp_block_invoke;
  v61 = &__block_descriptor_tmp_0;
  v63 = a4;
  v64 = v7;
  v65 = v8;
  v62 = a3;
  v9 = *(_DWORD *)(v6 + 12);
  v10 = *(_DWORD *)(a1 + 276);
  v11 = (v10 - 1) & 0x3F;
  if (1 - v10 >= 0)
    v11 = -((1 - v10) & 0x3F);
  v12 = v10 - v11 + 63;
  *(_DWORD *)(a1 + 276) = v12;
  if (v9 == -1)
  {
LABEL_51:
    *(_DWORD *)(a1 + 276) = v10;
    return 0xFFFFFFFFLL;
  }
  v58 = v10;
  v57 = v12;
  v13 = 0;
  v14 = 0;
  v15 = 0x7FFFFFFF;
  do
  {
    v16 = (_WORD *)(*(_QWORD *)(a1 + 256) + 8 * v9);
    v17 = (unsigned __int16)(*(v16 - 1) + 1) | ((unint64_t)(unsigned __int16)v16[3] << 16);
    v18 = (*v16 >> 2) + *(_WORD *)(*(_QWORD *)(a1 + 264) + 2 * (v9 >> 6));
    v19 = (unsigned __int16)v16[2];
    v69[0] = 0;
    v67[0] = 0;
    v66 = 0;
    v20 = v18;
    v4 = v17 | v4 & 0xFFFFFFFF00000000;
    if (((unsigned int (*)(_QWORD *, unint64_t, _QWORD, int *, int *, char *))v60)(v59, v4, v18, v69, v67, &v66))
    {
      if (v15 != 0x7FFFFFFF && v15 - 1 > v20)
      {
        *(_DWORD *)(a1 + 276) = v58;
        return 0xFFFFFFFFLL;
      }
      if (v20 <= 63)
        v21 = 63;
      else
        v21 = v20;
      v22 = v21 - 63;
      if ((v13 & 0x3F) == 0)
        v14 = v22;
      createNewLineseg(a1, v20, v69[0], v67[0], *(_DWORD *)v16 & 3, 1, v14);
      ++v13;
      v15 = v20;
    }
    if (v66)
      break;
    v9 -= v19;
  }
  while (v19 && v9 != -1);
  v10 = v58;
  if (!v13)
    goto LABEL_51;
  if (1 - 2 * v13 >= 0)
    v24 = -((1 - 2 * v13) & 0x3F);
  else
    v24 = (2 * (_BYTE)v13 - 1) & 0x3F;
  v25 = (63 - v24) >> 1;
  if (v24 <= 62)
  {
    if ((63 - v24) >> 1 <= 1)
      v26 = 1;
    else
      v26 = (63 - v24) >> 1;
    do
    {
      createNewLineseg(a1, v14, 0, 0, 2u, 1, -1);
      --v26;
    }
    while (v26);
  }
  v27 = *(_DWORD *)(a1 + 276);
  v28 = v27 - v57;
  if (v27 >= v57)
    v29 = v27 - v57;
  else
    v29 = v28 + 1;
  v30 = v29 >> 1;
  if (v28 > 1)
  {
    v31 = v30 + 2;
    if (v30 >= -1)
      v31 = v30 + 1;
    LODWORD(v32) = v31 >> 1;
    if ((int)v32 <= 1)
      v32 = 1;
    else
      v32 = v32;
    v33 = 8 * v57;
    v34 = -2;
    do
    {
      v35 = *(_QWORD *)(a1 + 256);
      v36 = 8 * (v34 + *(_DWORD *)(a1 + 276));
      v37 = *(_OWORD *)(v35 + v33);
      *(_OWORD *)(v35 + v33) = *(_OWORD *)(v35 + v36);
      *(_OWORD *)(v35 + v36) = v37;
      v34 -= 2;
      v33 += 16;
      --v32;
    }
    while (v32);
    v38 = *(_DWORD *)(a1 + 276);
    if (v38 - v57 >= 128)
    {
      v39 = (v38 - v57) >> 7;
      v40 = *(_QWORD *)(a1 + 264);
      v41 = (__int16 *)(v40 + 2 * (v38 >> 6) - 2);
      v42 = (__int16 *)(v40 + 2 * (v57 >> 6));
      do
      {
        v43 = *v42;
        *v42++ = *v41;
        *v41-- = v43;
        --v39;
      }
      while (v39);
    }
  }
  v44 = v30 - v25;
  if ((int)(v30 - v25) < 1)
    return 0xFFFFFFFFLL;
  v45 = v57 - v24 + 64;
  v46 = 8 * v45;
  v47 = 0xFFFFFFFFLL;
  do
  {
    v48 = *(_QWORD *)(a1 + 256);
    v49 = v48 + v46;
    if ((_DWORD)v47 == -1)
    {
      createConcompFromLineseg(a1, (_WORD *)(v48 + v46), 0);
      v47 = (*(int *)v49 >> 8);
      v54 = *(_QWORD *)(a1 + 280) + 100 * (int)v47;
      *(_WORD *)(v54 + 93) = 0;
      *(_BYTE *)(v54 + 96) = 1;
    }
    else
    {
      v50 = *(int *)(*(_QWORD *)(a1 + 280) + 100 * (int)v47 + 12);
      v68 = 0;
      v69[0] = v45;
      v70 = 0;
      v69[1] = (unsigned __int16)(*(_WORD *)(v49 - 2) + 1) | (*(unsigned __int16 *)(v49 + 6) << 16);
      v51 = *(_QWORD *)(a1 + 264);
      v52 = *(_DWORD *)v49;
      LOWORD(v70) = (*(_DWORD *)v49 >> 2) + *(_WORD *)(v51 + 2 * (v45 >> 6));
      HIWORD(v70) = v52 & 3;
      v53 = v48 + 8 * v50;
      v67[0] = v50;
      v67[1] = (unsigned __int16)(*(_WORD *)(v53 - 2) + 1) | (*(unsigned __int16 *)(v53 + 6) << 16);
      LODWORD(v53) = *(_DWORD *)v53;
      LOWORD(v68) = (v53 >> 2) + *(_WORD *)(v51 + 2 * ((int)v50 >> 6));
      HIWORD(v68) = v53 & 3;
      addScansegToScansegList(a1, v69, v67);
    }
    v46 += 16;
    v45 += 2;
    --v44;
  }
  while (v44);
  if ((_DWORD)v47 != -1)
    *(_BYTE *)(*(_QWORD *)(a1 + 280) + 100 * (int)v47 + 94) = *(_BYTE *)(*(_QWORD *)(a1 + 280) + 100 * a2 + 94);
  return v47;
}

size_t FKComponentsFind(size_t result)
{
  size_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  unsigned int v14;
  int *v15;
  int v16;
  unsigned __int16 *v17;
  int v18;
  BOOL v19;
  int v20;
  _BOOL4 v21;
  unsigned int i;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned __int16 *v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  int v37;
  int v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  BOOL v47;
  _WORD *v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;

  v1 = result;
  *(_DWORD *)(result + 276) = 0;
  *(_QWORD *)(result + 248) = 0;
  *(_QWORD *)(result + 296) = -1;
  *(_DWORD *)(result + 304) = 0;
  v2 = *(_DWORD *)(result + 288);
  v3 = *(_QWORD *)(result + 280);
  v4 = (v2 - 1);
  if (v2 <= 1)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v5 = 0;
    v6 = (_DWORD *)(v3 + 4);
    do
    {
      *v6 = ++v5;
      v6 += 25;
    }
    while (v4 != v5);
  }
  *(_DWORD *)(v3 + 100 * v4 + 4) = -1;
  *(_DWORD *)(result + 292) = v2;
  if (*(int *)(result + 32) >= 1)
  {
    v7 = 0;
    do
    {
      v8 = 0;
      v58 = v7;
      v59 = *(_QWORD *)(v1 + 200) + *(_QWORD *)(v1 + 224) * v7;
      v9 = *(_DWORD *)(v1 + 28);
      do
      {
        v10 = v8;
        v11 = *(unsigned __int8 *)(v59 + v8);
        v12 = (unsigned __int8 *)(v59 + v8);
        while (1)
        {
          v13 = *v12++;
          if (v13 != v11)
            break;
          if (v9 == ++v8)
          {
            v8 = v9;
            break;
          }
        }
        if (v8 - v10 <= 1 && *(_DWORD *)(v1 + 308))
          continue;
        v14 = *(_DWORD *)(v1 + 248);
        v15 = (int *)(*(_QWORD *)(v1 + 232) + 12 * v14);
        *(_DWORD *)(v1 + 248) = (v14 + 1) & *(_DWORD *)(v1 + 244);
        v16 = v58;
        *((_WORD *)v15 + 4) = v58;
        *((_WORD *)v15 + 2) = v10;
        *((_WORD *)v15 + 3) = v8 - 1;
        v17 = (unsigned __int16 *)v15 + 3;
        *((_BYTE *)v15 + 10) = v11;
        if (v10)
        {
          v18 = *(_DWORD *)(v1 + 276);
          v19 = __OFSUB__(v18, 1);
          v20 = v18 - 1;
          if (v20 < 0 != v19)
          {
            v21 = 0;
          }
          else
          {
            v16 = v58;
            v21 = v10 - *(unsigned __int16 *)(*(_QWORD *)(v1 + 256) + 8 * v20 + 6) > 1;
          }
        }
        else
        {
          v21 = 1;
        }
        result = (size_t)createNewLineseg(v1, v16, v10, (unsigned __int16)v8 - 1, v11, v21, -1);
        if (!result)
          continue;
        *v15 = (result - *(_QWORD *)(v1 + 256)) >> 3;
        for (i = *(_DWORD *)(v1 + 252); ; *(_DWORD *)(v1 + 252) = i)
        {
          v23 = *(_QWORD *)(v1 + 232);
          v24 = v23 + 12 * i;
          v25 = *(unsigned __int16 *)(v24 + 8);
          v26 = *((unsigned __int16 *)v15 + 4);
          if ((int)(v26 - 1) <= (int)v25)
          {
            if (v25 >= v26)
              goto LABEL_52;
            v27 = i;
            v28 = v23 + 12 * i;
            v31 = *(unsigned __int16 *)(v28 + 6);
            v30 = (unsigned __int16 *)(v28 + 6);
            v29 = v31;
            if (*((unsigned __int16 *)v15 + 2) - 1 <= v31)
              break;
          }
LABEL_37:
          v37 = *(_DWORD *)(v1 + 308);
          v38 = *(_DWORD *)(v1 + 244);
          if (v37 >= 1)
          {
            v39 = *(_QWORD *)(v1 + 232);
            v40 = v38 & (i - 1);
            v41 = *(_QWORD *)(v1 + 256);
            v42 = *(int *)(v41 + 8 * *(int *)(v39 + 12 * v40)) >> 8;
            if (v42 != -1)
            {
              v43 = *(_QWORD *)(v1 + 280);
              if (*(_DWORD *)(v43 + 100 * v42 + 72) <= v37
                && *(unsigned __int16 *)(v43 + 100 * v42 + 82) <= *(unsigned __int16 *)(v39 + 12 * v40 + 6)
                && *(unsigned __int16 *)(v43 + 100 * v42 + 86) <= *(unsigned __int16 *)(v39 + 12 * v40 + 8))
              {
                v44 = *(_DWORD *)(v43 + 100 * v42 + 12);
                if (v44 != -1)
                {
                  do
                  {
                    v45 = v41 + 8 * v44;
                    v46 = *(unsigned __int16 *)(v45 + 4);
                    v44 -= v46;
                    *(_DWORD *)v45 |= 0xFFFFFF00;
                    if (v46)
                      v47 = v44 == -1;
                    else
                      v47 = 1;
                  }
                  while (!v47);
                }
                result = FKConcompRelease(v1, v42, 0);
                i = *(_DWORD *)(v1 + 252);
                v38 = *(_DWORD *)(v1 + 244);
              }
            }
          }
          i = (i + 1) & v38;
        }
        v32 = *v17;
        if (v32 + 1 < *(v30 - 1))
          goto LABEL_52;
        v33 = *((unsigned __int8 *)v15 + 10);
        v34 = *(unsigned __int8 *)(v23 + 12 * v27 + 10);
        if (v34 == 2 || v33 == 2 || v34 == v33)
        {
          result = addScansegToScansegList(v1, v15, (int *)v24);
          v29 = *v30;
          v32 = *v17;
        }
        if (v29 <= v32)
        {
          i = *(_DWORD *)(v1 + 252);
          goto LABEL_37;
        }
        if (v32 + 1 == *(v30 - 1))
          *(_DWORD *)(v1 + 252) = (*(_DWORD *)(v1 + 252) - 1) & *(_DWORD *)(v1 + 244);
LABEL_52:
        v48 = (_WORD *)(*(_QWORD *)(v1 + 256) + 8 * *v15);
        if (*(_DWORD *)v48 >= 0xFFFFFF00)
          result = createConcompFromLineseg(v1, v48, 1);
      }
      while (v8 != v9);
      v7 = v58 + 1;
    }
    while (v58 + 1 < *(int *)(v1 + 32));
    v49 = *(_DWORD *)(v1 + 296);
    while (v49 != -1)
    {
      v50 = *(_QWORD *)(v1 + 280);
      v51 = v49;
      v52 = v50 + 100 * v49;
      v49 = *(_DWORD *)(v52 + 4);
      if (*(_BYTE *)(v52 + 92) == 2)
      {
        v53 = v1;
        v54 = 4;
      }
      else
      {
        if (*(_DWORD *)(v50 + 100 * v51 + 72) >= *(_DWORD *)(v1 + 24))
        {
          if (*(_DWORD *)(v1 + 8))
          {
            v55 = v50 + 100 * v51;
            v57 = *(unsigned __int16 *)(v55 + 80);
            v56 = v55 + 80;
            if (!v57
              || *(_DWORD *)(v1 + 28) - 1 == *(unsigned __int16 *)(v56 + 2)
              || !*(_WORD *)(v50 + 100 * v51 + 84)
              || *(_DWORD *)(v1 + 32) - 1 == *(unsigned __int16 *)(v50 + 100 * v51 + 86))
            {
              *(_BYTE *)(v50 + 100 * v51 + 94) = 4;
            }
          }
          continue;
        }
        v53 = v1;
        v54 = 2;
      }
      result = FKConcompRelease(v53, v51, v54);
    }
  }
  return result;
}

unsigned int *createNewLineseg(uint64_t a1, int a2, __int16 a3, __int16 a4, unsigned __int8 a5, int a6, int a7)
{
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  FILE *v24;
  const char *v25;
  size_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int *result;
  __int16 v30;
  uint64_t v31;

  if (a6)
    v14 = 2;
  else
    v14 = 1;
  v15 = *(_DWORD *)(a1 + 276);
  v16 = *(_DWORD *)(a1 + 272);
  if (v15 + v14 <= v16)
    goto LABEL_13;
  if (v16 >= 0)
    v17 = *(_DWORD *)(a1 + 272);
  else
    v17 = v16 + 1;
  v18 = v17 >> 1;
  if (v18 <= v14)
    v18 = v14;
  v19 = v18 + v16;
  v20 = malloc_type_realloc(*(void **)(a1 + 256), 8 * (v18 + v16), 0x100004000313F17uLL);
  if (!v20)
  {
    v24 = (FILE *)*MEMORY[0x1E0C80C10];
    v25 = "Could not create more linesegments\n";
    v26 = 35;
LABEL_32:
    fwrite(v25, v26, 1uLL, v24);
    fwrite("Could not create more linesegments\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    return 0;
  }
  *(_QWORD *)(a1 + 256) = v20;
  v21 = malloc_type_realloc(*(void **)(a1 + 264), 2 * ((v19 >> 6) + 1), 0x1000040BDFB0063uLL);
  if (!v21)
  {
    v24 = (FILE *)*MEMORY[0x1E0C80C10];
    v25 = "Could not create more linesegments row indices\n";
    v26 = 47;
    goto LABEL_32;
  }
  *(_QWORD *)(a1 + 264) = v21;
  *(_DWORD *)(a1 + 272) = v19;
  v15 = *(_DWORD *)(a1 + 276);
LABEL_13:
  if (a6)
  {
    v22 = *(_QWORD *)(a1 + 256);
    *(_DWORD *)(a1 + 276) = v15 + 1;
    if (a7 >= 0)
      v23 = a7;
    else
      v23 = a2;
    if ((v15 & 0x3F) != 0)
    {
      if (a7 < 0)
        v23 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 264) + 2 * (v15 >> 6));
    }
    else
    {
      *(_WORD *)(*(_QWORD *)(a1 + 264) + 2 * (v15 >> 6)) = v23;
    }
    *(_DWORD *)(v22 + 8 * v15) = (4 * (a2 - v23)) | 0xFFFFFF02;
    v27 = v22 + 8 * v15;
    *(_WORD *)(v27 + 4) = 0;
    *(_WORD *)(v27 + 6) = a3 - 1;
    v15 = *(_DWORD *)(a1 + 276);
  }
  v28 = *(_QWORD *)(a1 + 256);
  *(_DWORD *)(a1 + 276) = v15 + 1;
  result = (unsigned int *)(v28 + 8 * v15);
  if (a7 >= 0)
    v30 = a7;
  else
    v30 = a2;
  if ((v15 & 0x3F) != 0)
  {
    if (a7 < 0)
      v30 = *(_WORD *)(*(_QWORD *)(a1 + 264) + 2 * (v15 >> 6));
  }
  else
  {
    *(_WORD *)(*(_QWORD *)(a1 + 264) + 2 * (v15 >> 6)) = v30;
  }
  *result = a5 | (4 * (a2 - v30)) | 0xFFFFFF00;
  v31 = v28 + 8 * v15;
  *(_WORD *)(v31 + 4) = 0;
  *(_WORD *)(v31 + 6) = a4;
  return result;
}

size_t createConcompFromLineseg(size_t result, _WORD *a2, int a3)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  int v21;
  unsigned __int16 v22;
  unint64_t v23;
  __int16 v24;
  int v25;
  int v26;
  int v27;
  int v28;
  FILE **v29;
  int v30;
  int *v31;
  uint64_t v32;
  int v33;

  v4 = result;
  v5 = *(_DWORD *)(result + 304);
  if (v5 == -1)
  {
    v6 = *(_DWORD *)(result + 288);
    if (!a3 || v6 < 0x8000)
    {
      if (v6 >= 0x800000)
        v28 = 0xFFFFFF;
      else
        v28 = 2 * v6;
      result = (size_t)malloc_type_realloc(*(void **)(result + 280), 100 * v28, 0x1000040D2C85C19uLL);
      v29 = (FILE **)MEMORY[0x1E0C80C10];
      if (result && (v5 = *(_DWORD *)(v4 + 288), *(_QWORD *)(v4 + 280) = result, v28 != v5))
      {
        *(_DWORD *)(v4 + 304) = v5;
        *(_DWORD *)(v4 + 292) = v28 - v5;
        v30 = v28 - 1;
        if (v5 < v28 - 1)
        {
          v31 = (int *)(result + 100 * v5 + 4);
          v32 = v30 - (uint64_t)v5;
          v33 = v5 + 1;
          do
          {
            *v31 = v33;
            v31 += 25;
            ++v33;
            --v32;
          }
          while (v32);
        }
        *(_DWORD *)(result + 100 * v30 + 4) = -1;
        *(_DWORD *)(v4 + 288) = v28;
        if (v5 != -1)
          goto LABEL_27;
      }
      else
      {
        fwrite("Could not create more concomps\n", 0x1FuLL, 1uLL, *v29);
      }
      return fwrite("Could not get a free connected component\n", 0x29uLL, 1uLL, *v29);
    }
    v7 = *(_DWORD *)(result + 308);
    do
    {
      if (v7 <= 1)
        v8 = 1;
      else
        v8 = v7;
      v9 = *(_DWORD *)(v4 + 296);
      if (v9 == -1)
      {
        v5 = -1;
      }
      else
      {
        v10 = (unsigned __int16)((*a2 >> 2)
                               + *(_WORD *)(*(_QWORD *)(v4 + 264)
                                          + 2 * ((int)(((unint64_t)a2 - *(_QWORD *)(v4 + 256)) >> 3) >> 6)))
            - 2;
        do
        {
          v11 = *(_QWORD *)(v4 + 280);
          v12 = v11 + 100 * v9;
          v13 = *(_DWORD *)(v12 + 4);
          if (v10 > *(unsigned __int16 *)(v12 + 86))
          {
            v14 = v9;
            if (*(_DWORD *)(v11 + 100 * v9 + 72) <= v8)
            {
              v15 = *(_DWORD *)(v11 + 100 * v9 + 12);
              if (v15 != -1)
              {
                v16 = *(_QWORD *)(v4 + 256);
                do
                {
                  v17 = v16 + 8 * v15;
                  v18 = *(unsigned __int16 *)(v17 + 4);
                  v15 -= v18;
                  *(_DWORD *)v17 |= 0xFFFFFF00;
                  if (v18)
                    v19 = v15 == -1;
                  else
                    v19 = 1;
                }
                while (!v19);
              }
              result = FKConcompRelease(v4, v14, 0);
            }
          }
          v9 = v13;
        }
        while (v13 != -1);
        v5 = *(_DWORD *)(v4 + 304);
        v7 = *(_DWORD *)(v4 + 308);
      }
      if (v7 < 1)
        v7 = 1;
      else
        v7 *= 2;
      *(_DWORD *)(v4 + 308) = v7;
    }
    while (v5 == -1);
  }
LABEL_27:
  v20 = *(_QWORD *)(v4 + 280) + 100 * v5;
  *(_DWORD *)(v4 + 304) = *(_DWORD *)(v20 + 4);
  --*(_DWORD *)(v4 + 292);
  v21 = (unsigned __int16)a2[3];
  v22 = *(a2 - 1) + 1;
  v23 = ((unint64_t)a2 - *(_QWORD *)(v4 + 256)) >> 3;
  v24 = (*(_DWORD *)a2 >> 2) + *(_WORD *)(*(_QWORD *)(v4 + 264) + 2 * ((int)v23 >> 6));
  v25 = v21 - v22;
  v26 = *(_DWORD *)a2 & 3;
  *(_DWORD *)a2 = *(_DWORD *)a2 | (v5 << 8);
  *(int32x2_t *)(v20 + 12) = vdup_n_s32(v23);
  *(_WORD *)(v20 + 84) = v24;
  *(_WORD *)(v20 + 86) = v24;
  *(_WORD *)(v20 + 80) = v22;
  *(_WORD *)(v20 + 82) = v21;
  *(_BYTE *)(v20 + 92) = v26;
  *(_WORD *)(v20 + 88) = 0;
  *(_DWORD *)(v20 + 72) = v25 + 1;
  *(_DWORD *)(v20 + 76) = 2 * v25 + 4;
  *(_DWORD *)(v20 + 20) = 1;
  *(_WORD *)(v20 + 90) = v25 + 1;
  *(_QWORD *)(v20 + 56) = 0;
  *(_QWORD *)(v20 + 64) = -1;
  *(_QWORD *)(v20 + 24) = 0;
  *(_QWORD *)(v20 + 32) = 0;
  *(_QWORD *)(v20 + 40) = 0;
  *(_QWORD *)(v20 + 48) = 0;
  *(_DWORD *)(v20 + 93) = 0;
  v27 = *(_DWORD *)(v4 + 300);
  *(_DWORD *)(v20 + 8) = v27;
  *(_DWORD *)(v4 + 300) = v5;
  *(_QWORD *)v20 = -1;
  if (v27 == -1)
    *(_DWORD *)(v4 + 296) = v5;
  else
    *(_DWORD *)(*(_QWORD *)(v4 + 280) + 100 * v27 + 4) = v5;
  return result;
}

uint64_t addScansegToScansegList(uint64_t result, int *a2, int *a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  int v30;
  __int16 v31;
  int32x2_t *v32;
  int32x2_t *v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  int32x2_t *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  __int32 v42;
  unsigned int v43;
  __int32 v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  unsigned __int8 *v55;
  BOOL v56;
  uint64_t v57;

  v4 = result;
  v5 = *((unsigned __int16 *)a2 + 2);
  v6 = *((unsigned __int16 *)a3 + 2);
  if (v5 > v6)
    v6 = *((unsigned __int16 *)a2 + 2);
  v7 = *((unsigned __int16 *)a2 + 3);
  v8 = *((unsigned __int16 *)a3 + 3);
  if (v7 < v8)
    v8 = *((unsigned __int16 *)a2 + 3);
  v9 = v6 - v8;
  if (v9 >= 0)
    v10 = v9;
  else
    v10 = -v9;
  v11 = ~v10;
  v12 = v7 - v5;
  v13 = *(_QWORD *)(result + 256);
  v14 = *a2;
  v15 = v13 + 8 * v14;
  v16 = *(int *)v15 >> 8;
  v17 = *(_DWORD *)(v13 + 8 * *a3);
  v18 = v17 >> 8;
  if (v16 == -1)
  {
    v21 = v12 + 1;
    *(_DWORD *)v15 = v17 & 0xFFFFFF00 | *(_DWORD *)v15;
    v22 = *(_QWORD *)(result + 280) + 100 * v18;
    v23 = *(_DWORD *)(v22 + 12);
    v24 = v14 - v23;
    if (v23 == -1)
      v24 = 0;
    *(_WORD *)(v15 + 4) = v24;
    *(_DWORD *)(v22 + 12) = *a2;
    v25 = *((unsigned __int16 *)a2 + 4);
    v26 = *(unsigned __int16 *)(v22 + 84);
    if (v25 < v26)
      LOWORD(v26) = *((_WORD *)a2 + 4);
    *(_WORD *)(v22 + 84) = v26;
    if (v25 <= *(unsigned __int16 *)(v22 + 86))
      LOWORD(v25) = *(_WORD *)(v22 + 86);
    *(_WORD *)(v22 + 86) = v25;
    v27 = *(unsigned __int16 *)(v22 + 80);
    if (v27 >= *((unsigned __int16 *)a2 + 2))
      LOWORD(v27) = *((_WORD *)a2 + 2);
    *(_WORD *)(v22 + 80) = v27;
    v28 = *(unsigned __int16 *)(v22 + 82);
    if (v28 <= *((unsigned __int16 *)a2 + 3))
      LOWORD(v28) = *((_WORD *)a2 + 3);
    *(_WORD *)(v22 + 82) = v28;
    v29 = *(_DWORD *)(v22 + 76);
    v30 = *(_DWORD *)(v22 + 72) + v21;
    ++*(_DWORD *)(v22 + 20);
    *(_DWORD *)(v22 + 72) = v30;
    *(_DWORD *)(v22 + 76) = v29 + 2 * (v12 + v11) + 4;
    if (v21 >= *(unsigned __int16 *)(v22 + 90))
      v31 = v12 + 1;
    else
      v31 = *(_WORD *)(v22 + 90);
    *(_WORD *)(v22 + 90) = v31;
  }
  else
  {
    v19 = *(_QWORD *)(result + 280);
    if (v16 == v18)
    {
      v20 = v19 + 100 * v16;
      ++*(_WORD *)(v20 + 88);
      *(_DWORD *)(v20 + 76) += 2 * (v12 + v11) + 4;
      v18 = v16;
    }
    else
    {
      v32 = (int32x2_t *)(v19 + 100 * v16);
      v33 = (int32x2_t *)(v19 + 100 * v18);
      v34 = v32[10].u16[2];
      v35 = v33[10].u16[2];
      if (v34 > v35 || v34 == v35 && v32[10].u16[0] > v33[10].u16[0])
      {
        v36 = *(int *)v15 >> 8;
        v37 = v33;
      }
      else
      {
        v36 = v17 >> 8;
        v37 = v32;
        v32 = v33;
        v18 = *(int *)v15 >> 8;
      }
      if (v37[11].i8[4] == 2 || v32[11].i8[4] == 2)
        v37[11].i8[4] = 2;
      v38 = v37[10].u16[2];
      if (v38 >= v32[10].u16[2])
        LOWORD(v38) = v32[10].i16[2];
      v37[10].i16[2] = v38;
      v39 = v37[10].u16[3];
      if (v39 <= v32[10].u16[3])
        LOWORD(v39) = v32[10].i16[3];
      v37[10].i16[3] = v39;
      v40 = v37[10].u16[0];
      if (v40 >= v32[10].u16[0])
        LOWORD(v40) = v32[10].i16[0];
      v37[10].i16[0] = v40;
      v41 = v37[10].u16[1];
      if (v41 <= v32[10].u16[1])
        LOWORD(v41) = v32[10].i16[1];
      v37[10].i16[1] = v41;
      v37[11].i16[0] += v32[11].i16[0];
      v42 = v37[2].i32[0];
      v37[2].i32[1] += v32[2].i32[1];
      v43 = v37[11].u16[1];
      if (v43 <= v32[11].u16[1])
        LOWORD(v43) = v32[11].i16[1];
      v37[9] = vadd_s32(v37[9], v32[9]);
      v37[11].i16[1] = v43;
      v45 = v32[1].u32[1];
      v44 = v32[2].i32[0];
      if (v42 > v44)
        v37[2].i32[0] = v44;
      v46 = v37[1].u32[1];
      result = FKConcompRelease(result, v36, 0);
      if ((_DWORD)v45 != -1)
      {
        v47 = v18 << 8;
        v48 = -1;
        while ((_DWORD)v46 != -1)
        {
          v49 = *(_QWORD *)(v4 + 256);
          if ((int)v45 >= (int)v46)
          {
            *(_DWORD *)(v49 + 8 * (int)v45) = *(unsigned __int8 *)(v49 + 8 * (int)v45) | v47;
            if (v48 == -1)
            {
              v37[1].i32[1] = v45;
            }
            else
            {
              *(_WORD *)(v49 + 8 * v48 + 4) = v48 - v45;
              v49 = *(_QWORD *)(v4 + 256);
            }
            v52 = v49 + 8 * (int)v45;
            v53 = *(unsigned __int16 *)(v52 + 4);
            *(_WORD *)(v52 + 4) = v45 - v46;
            if (!v53)
              goto LABEL_66;
            v51 = (v45 - v53);
            v50 = v46;
            LODWORD(v46) = v45;
          }
          else
          {
            if (*(_WORD *)(v49 + 8 * (int)v46 + 4))
              v50 = v46 - *(unsigned __int16 *)(v49 + 8 * (int)v46 + 4);
            else
              v50 = 0xFFFFFFFFLL;
            v51 = v45;
          }
          v48 = v46;
          v45 = v51;
          v46 = v50;
          if ((_DWORD)v51 == -1)
            goto LABEL_66;
        }
        *(_WORD *)(*(_QWORD *)(v4 + 256) + 8 * v48 + 4) = v48 - v45;
        v54 = *(_QWORD *)(v4 + 256);
        do
        {
          v55 = (unsigned __int8 *)(v54 + 8 * (int)v45);
          *(_DWORD *)v55 = *v55 | v47;
          LODWORD(v55) = *((unsigned __int16 *)v55 + 2);
          LODWORD(v45) = v45 - (_DWORD)v55;
          if ((_DWORD)v55)
            v56 = (_DWORD)v45 == -1;
          else
            v56 = 1;
        }
        while (!v56);
      }
LABEL_66:
      v18 = *(int *)v15 >> 8;
      v57 = *(_QWORD *)(v4 + 280) + 100 * v18;
      *(_DWORD *)(v57 + 76) = *(_DWORD *)(v57 + 76) - 2 * v10 - 2;
    }
  }
  if (*((_BYTE *)a2 + 10) == 2)
    *(_BYTE *)(*(_QWORD *)(v4 + 280) + 100 * v18 + 92) = 2;
  return result;
}

void FKSequenceAdjustSlantedLines(uint64_t a1, unsigned __int16 *a2, uint64_t a3, int a4, int *a5, int *a6, int *a7)
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  int v18;

  v7 = *(unsigned __int16 *)(a3 + 2 * (a4 != 0));
  v8 = *a2;
  v9 = *a5;
  v10 = *a6;
  v12 = a2[1] - v8;
  v11 = (*(unsigned __int16 *)(a3 + 2 * (a4 == 0)) - v8) << 16;
  v13 = (v11 / v12 * *a6 + (0x10000 - v11 / v12) * *a5) / 0x10000;
  v14 = *(unsigned __int16 *)(a3 + 4);
  v15 = __OFSUB__(v13, v14);
  v16 = v13 - v14;
  if ((v16 < 0) ^ v15 | (v16 == 0))
  {
    v17 = *a7;
  }
  else
  {
    *a5 = v9 - v16;
    *a6 -= v16;
    v17 = *a7 + v16;
    *a7 = v17;
    v9 = *a5;
    v10 = *a6;
  }
  v18 = *(unsigned __int16 *)(a3 + 6)
      - (((v7 - v8) << 16) / v12 * (v10 + v17) + (0x10000 - ((v7 - v8) << 16) / v12) * (v17 + v9)) / 0x10000;
  if (v18 >= 1)
    *a7 = v18 + v17;
}

uint64_t FKSequenceRecalculateBox(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;

  if (*(int *)(a2 + 20) >= 1)
  {
    v3 = result;
    v4 = 0;
    do
      result = sequenceUpdateBoxWithConcomp(v3, a2, v4++);
    while (v4 < *(_DWORD *)(a2 + 20));
  }
  return result;
}

uint64_t sequenceUpdateBoxWithConcomp(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  _WORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  int v13;
  _WORD *v14;
  unsigned int v15;
  int v16;
  unsigned __int16 *v17;
  int v18;

  v3 = *(_QWORD *)(result + 280);
  v4 = *(_DWORD *)(*(_QWORD *)(a2 + 8) + 4 * a3);
  if (a3)
  {
    LODWORD(v5) = *(unsigned __int16 *)(a2 + 24);
    v6 = (_WORD *)(v3 + 100 * v4);
    if (v5 >= (unsigned __int16)v6[40])
      LOWORD(v5) = v6[40];
    *(_WORD *)(a2 + 24) = v5;
    LODWORD(v7) = *(unsigned __int16 *)(a2 + 26);
    if (v7 <= (unsigned __int16)v6[41])
      LOWORD(v7) = v6[41];
    *(_WORD *)(a2 + 26) = v7;
    LODWORD(v8) = *(unsigned __int16 *)(a2 + 28);
    if (v8 >= (unsigned __int16)v6[42])
      LOWORD(v8) = v6[42];
    *(_WORD *)(a2 + 28) = v8;
    LODWORD(v6) = (unsigned __int16)v6[43];
    if (*(unsigned __int16 *)(a2 + 30) > v6)
      LOWORD(v6) = *(_WORD *)(a2 + 30);
    *(_WORD *)(a2 + 30) = (_WORD)v6;
  }
  else
  {
    v9 = v3 + 100 * v4;
    *(_BYTE *)(a2 + 92) = *(_BYTE *)(v9 + 92);
    v5 = *(_QWORD *)(v9 + 80);
    *(_QWORD *)(a2 + 24) = v5;
    v7 = v5 >> 16;
    *(_DWORD *)(a2 + 56) = 0;
    *(_DWORD *)(a2 + 44) = 0;
    *(_DWORD *)(a2 + 48) = 0;
    v8 = HIDWORD(v5);
    v6 = (_WORD *)HIWORD(v5);
  }
  v10 = 0;
  v11 = 1;
  do
  {
    v12 = v11;
    v13 = *(_DWORD *)(v3 + 100 * v4 + 4 * v10 + 64);
    if (v13 == -1)
      break;
    v11 = 0;
    v14 = (_WORD *)(*(_QWORD *)(result + 280) + 100 * v13);
    if ((unsigned __int16)v5 >= (unsigned __int16)v14[40])
      LOWORD(v5) = v14[40];
    if ((unsigned __int16)v7 <= (unsigned __int16)v14[41])
      LOWORD(v7) = v14[41];
    if ((unsigned __int16)v8 >= (unsigned __int16)v14[42])
      LOWORD(v8) = v14[42];
    *(_WORD *)(a2 + 24) = v5;
    *(_WORD *)(a2 + 26) = v7;
    *(_WORD *)(a2 + 28) = v8;
    v15 = (unsigned __int16)v14[43];
    if ((unsigned __int16)v6 <= v15)
      LOWORD(v6) = v15;
    *(_WORD *)(a2 + 30) = (_WORD)v6;
    v10 = 1;
  }
  while ((v12 & 1) != 0);
  if ((*(_BYTE *)(v3 + 100 * v4 + 94) & 8) == 0)
  {
    v16 = *(_DWORD *)(a2 + 44) + 1;
    v17 = (unsigned __int16 *)(v3 + 100 * v4);
    v18 = *(_DWORD *)(a2 + 48) - v17[42] + v17[43] + 1;
    *(_DWORD *)(a2 + 44) = v16;
    *(_DWORD *)(a2 + 48) = v18;
    LODWORD(v17) = *(_DWORD *)(a2 + 56) - v17[40] + v17[41] + 1;
    *(_DWORD *)(a2 + 52) = v18 / v16;
    *(_DWORD *)(a2 + 56) = (_DWORD)v17;
    *(_DWORD *)(a2 + 60) = (int)v17 / v16;
  }
  return result;
}

uint64_t FKSequenceRemoveConcomp(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(int *)(v5 + 4 * a3);
  v7 = *(_QWORD *)(a1 + 280);
  LODWORD(v8) = *(_DWORD *)(a2 + 20) - 1;
  *(_DWORD *)(a2 + 20) = v8;
  if ((int)v8 > a3)
  {
    v9 = a3;
    do
    {
      *(_DWORD *)(v5 + 4 * v9) = *(_DWORD *)(v5 + 4 * v9 + 4);
      v8 = *(int *)(a2 + 20);
      ++v9;
    }
    while (v9 < v8);
  }
  v10 = v7 + 100 * (int)v6;
  *(_DWORD *)v10 = -1;
  *(_BYTE *)(v10 + 94) = 0;
  if ((int)v8 >= 1)
  {
    v11 = 0;
    do
      sequenceUpdateBoxWithConcomp(a1, a2, v11++);
    while (v11 < *(_DWORD *)(a2 + 20));
  }
  *(_BYTE *)(a2 + 93) = 0;
  *(_DWORD *)(a2 + 95) = 0;
  return v6;
}

uint64_t FKSequenceScoreAsPercent(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4;
  unsigned __int16 *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned __int16 *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  _BOOL4 v26;
  uint64_t v28;
  _BOOL4 v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  int v33;

  v4 = *(_QWORD *)(a1 + 280);
  v5 = (unsigned __int16 *)(v4 + 100 * a2);
  if (v5[44])
    return 0;
  v6 = v5[43];
  v7 = v5[42];
  v8 = v6 - v7 + 1;
  if (*(_DWORD *)(v4 + 100 * a2 + 20) - v8 > v8 / 10)
    return 0;
  v9 = v5[41];
  v10 = v5[40];
  v11 = v9 - v10;
  if (100 * *(unsigned __int16 *)(v4 + 100 * a2 + 90) / (int)(v9 - v10 + 1) > 50
    || *(unsigned __int16 *)(v4 + 100 * a3 + 88) > 1u)
  {
    return 0;
  }
  v12 = (unsigned __int16 *)(v4 + 100 * a3);
  v13 = v12[43];
  v14 = v12[42];
  v15 = 4 * (v13 - v14) + 4;
  v16 = 3 * v8;
  v17 = v15 > (int)(v6 - v7) && v15 <= v16;
  if (!v17)
    return 0;
  v18 = v12[41];
  v19 = v12[40];
  v20 = v18 - v19 + 1;
  if (v11 >= 4 * v20 || (int)(v18 - v19) > v11)
    return 0;
  v22 = v9 + v10 + 1;
  v23 = (v6 + v7 + 1) >> 1;
  v24 = (v18 + v19 + 1) >> 1;
  v25 = (v13 + v14 + 1) >> 1;
  v26 = v24 < v22 >> 1 && v25 < v23 || v24 > v22 >> 1 && v25 > v23;
  if (a4)
  {
    v28 = 0;
    if (v24 < v10 || v24 > v9 || v25 < v7)
      return v28;
    v29 = v25 <= v6;
  }
  else
  {
    if (v9 >= v18)
      v30 = v18;
    else
      v30 = v5[41];
    if (v10 <= v19)
      v31 = v19;
    else
      v31 = v5[40];
    v32 = v30 - v31;
    v17 = v32 <= 0;
    v33 = 5 * v32;
    v29 = !v17 && v33 > v20;
  }
  if (!v26 || !v29)
    return 0;
  return 10
       * scoreForInsideSequence(*(_QWORD *)(a1 + 312) + 104 * *(int *)v5, (unsigned __int16 *)(v4 + 100 * a3))+ 3;
}

uint64_t scoreForInsideSequence(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  unsigned int v3;
  int v4;
  int v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v11;

  v2 = *(unsigned __int16 *)(a1 + 26) + *(_DWORD *)(a1 + 60) / 2;
  v3 = *(unsigned __int16 *)(a1 + 24);
  v4 = a2[40];
  v5 = a2[41];
  v6 = v3 > v4 || v2 < v5;
  if (!v6
    && *(unsigned __int16 *)(a1 + 28) <= a2[42]
    && a2[43] <= *(unsigned __int16 *)(a1 + 30))
  {
    return 3;
  }
  v7 = (v4 + v5 + 1) >> 1;
  v8 = a2[43];
  v9 = a2[42];
  if (v7 >= v3 && (int)v7 <= v2)
  {
    v11 = (v8 + v9 + 1) >> 1;
    if (v11 >= *(unsigned __int16 *)(a1 + 28) && v11 <= *(unsigned __int16 *)(a1 + 30))
      return 2;
  }
  return v3 <= v5 && v2 >= v4 && *(unsigned __int16 *)(a1 + 28) <= v8 && v9 <= *(unsigned __int16 *)(a1 + 30);
}

void FKSequenceSortAndProcess(void *a1, uint64_t a2, int a3)
{
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;

  if (!*(_BYTE *)(a2 + 93))
  {
    *(_BYTE *)(a2 + 93) = 0;
    *(_DWORD *)(a2 + 95) = 0;
    qsort_r(*(void **)(a2 + 8), *(int *)(a2 + 20), 4uLL, a1, (int (__cdecl *)(void *, const void *, const void *))compareCCX);
    v6 = *(_DWORD *)(a2 + 20);
    if (v6 < 1)
    {
      v8 = 0;
      v9 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = *((_QWORD *)a1 + 35);
      v11 = *(int **)(a2 + 8);
      v12 = *(unsigned int *)(a2 + 20);
      do
      {
        v14 = *v11++;
        v13 = v14;
        if (v7)
        {
          v15 = ~*(unsigned __int16 *)(v7 + 82) + *(unsigned __int16 *)(v10 + 100 * v13 + 80);
          v9 += v15;
          v8 -= v15 & (v15 >> 31);
        }
        v7 = v10 + 100 * v13;
        --v12;
      }
      while (v12);
      if (v6 >= 2)
        v9 /= v6 - 1;
    }
    *(_DWORD *)(a2 + 64) = v9;
    v16 = 400 * v8 / (*(_DWORD *)(a2 + 60) * v6);
    if (v16 >= 100)
      LOBYTE(v16) = 100;
    *(_BYTE *)(a2 + 95) = v16;
    sequenceSetSlope((uint64_t)a1, a2);
    if (a3)
      sequenceMarkup();
    *(_BYTE *)(a2 + 93) = 1;
  }
}

void sequenceSetSlope(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int *v15;
  int v16;
  int v17;
  unsigned __int16 *v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  unsigned __int16 *v25;
  int *v26;
  int *v27;
  int v28;
  int *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char v35;
  char v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v2 = a2;
  v44 = a1;
  v45 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a2 + 44);
  v4 = MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v42 - ((v5 + 15) & 0x7FFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (int *)((char *)&v42 - v8);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v42 - v10;
  if (v3 < 4)
    goto LABEL_34;
  v12 = *(unsigned int *)(v2 + 20);
  if ((int)v12 >= 1)
  {
    v13 = 0;
    v14 = *(_QWORD *)(v44 + 280);
    v15 = *(int **)(v2 + 8);
    do
    {
      v17 = *v15++;
      v16 = v17;
      if ((*(_BYTE *)(v14 + 100 * v17 + 94) & 8) == 0)
      {
        v18 = (unsigned __int16 *)(v14 + 100 * v16);
        *(_DWORD *)&v6[4 * v13] = (v18[41] + v18[40] + 1) >> 1;
        *(_DWORD *)&v11[4 * v13] = v18[42];
        v9[v13++] = v18[43];
      }
      --v12;
    }
    while (v12);
  }
  v19 = computeBeta((uint64_t)v11);
  v20 = computeBeta((uint64_t)v9);
  if ((int)v20 * v19 < 1)
  {
LABEL_34:
    v41 = *(unsigned __int16 *)(v2 + 28);
    *(_DWORD *)(v2 + 32) = v41;
    *(_DWORD *)(v2 + 36) = v41;
    *(_DWORD *)(v2 + 40) = *(unsigned __int16 *)(v2 + 30) - v41 + 1;
  }
  else
  {
    if ((int)v20 >= 0)
      v21 = v20;
    else
      v21 = -(int)v20;
    if (v19 >= 0)
      v22 = v19;
    else
      v22 = -v19;
    if (v21 >= v22)
      v23 = v19;
    else
      v23 = v20;
    v24 = *v9;
    v25 = (unsigned __int16 *)(v2 + 24);
    *(_DWORD *)(v2 + 36) = *v9 + ((int)((*(unsigned __int16 *)(v2 + 26) - *(unsigned __int16 *)(v2 + 24)) * v23) >> 16);
    v26 = (int *)(v2 + 36);
    *(_DWORD *)(v2 + 32) = v24;
    v27 = (int *)(v2 + 32);
    v28 = 1;
    *(_DWORD *)(v2 + 40) = 1;
    v29 = (int *)(v2 + 40);
    if (*(int *)(v2 + 20) >= 1)
    {
      v30 = 0;
      v31 = v23 >> 31;
      v43 = v2;
      do
      {
        v32 = *(_QWORD *)(v44 + 280);
        v33 = *(_DWORD *)(*(_QWORD *)(v2 + 8) + 4 * v30);
        FKSequenceAdjustSlantedLines(v20, v25, v32 + 100 * v33 + 80, v31, v27, v26, v29);
        v34 = 0;
        v35 = 1;
        do
        {
          v36 = v35;
          v37 = *(_DWORD *)(v32 + 100 * v33 + 4 * v34 + 64);
          if (v37 == -1)
            break;
          FKSequenceAdjustSlantedLines(v20, v25, *(_QWORD *)(v44 + 280) + 100 * v37 + 80, v31, v27, v26, v29);
          v35 = 0;
          v34 = 1;
        }
        while ((v36 & 1) != 0);
        ++v30;
        v2 = v43;
      }
      while (v30 < *(int *)(v43 + 20));
      v28 = *v29;
    }
    v38 = *(_DWORD *)(v44 + 32);
    if (v28 > v38)
    {
      *v29 = v38;
      v28 = v38;
    }
    v39 = *v27;
    if (*v27 < 0)
    {
      v39 = 0;
      *v27 = 0;
    }
    v40 = *v26;
    if (*v26 < 0)
    {
      v40 = 0;
      *v26 = 0;
    }
    if (v28 + v39 > v38)
      *v27 = v38 - v28;
    if (v40 + v28 > v38)
      *v26 = v38 - v28;
  }
}

uint64_t sequenceMarkup()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unsigned __int16 *v15;
  unsigned int v16;
  _WORD *v17;
  int v18;
  unsigned int v19;
  int v20;
  uint64_t result;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int32x4_t v27;
  int32x4_t v28;
  unsigned int v29;
  int32x4_t v30;
  int32x4_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  unsigned __int16 *v38;
  unsigned __int16 *v39;
  int v40;
  int v41;
  char v42;
  uint64_t v43;
  __int32 v44;
  int v45;
  int v46;
  __int32 v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  unsigned __int16 *v52;
  uint64_t v53;
  unsigned int v54;
  _BOOL4 v56;
  int v57;
  int v58;
  int v59;
  _DWORD *v60;
  int v61;
  int v62;
  uint64_t *v63;
  float v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int *v69;
  int v70;
  int v71;
  char v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t *v81;
  unsigned int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int32x4_t v91;
  int32x4_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v1 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v2 = MEMORY[0x1E0C80A78](v1);
  v86 = v5;
  v6 = (char *)&v74 - ((v5 + 15) & 0x1FFFFFFF0);
  v7 = *(unsigned int *)(v3 + 20);
  v77 = v7;
  v75 = v2;
  if ((int)v7 < 1)
  {
    result = 0;
    v20 = 0;
  }
  else
  {
    v8 = 0;
    v9 = *(_QWORD *)(v2 + 280);
    v10 = *(int **)(v3 + 8);
    v11 = v7;
    do
    {
      v13 = *v10++;
      v12 = v13;
      if ((*(_BYTE *)(v9 + 100 * v13 + 94) & 8) == 0)
      {
        v14 = v9 + 100 * v12;
        v15 = &v4[2 * v8];
        *v15 = *(_WORD *)(v14 + 84);
        v16 = *(unsigned __int16 *)(v14 + 86);
        v15[1] = v16;
        v17 = v15 + 1;
        v18 = *(_DWORD *)(v14 + 64);
        if (v18 != -1)
        {
          v19 = *(unsigned __int16 *)(v9 + 100 * v18 + 86);
          if (v16 > v19)
            LOWORD(v19) = v16;
          *v17 = v19;
        }
        ++v8;
      }
      --v11;
    }
    while (v11);
    v20 = v4[1];
    result = *v4;
  }
  v22 = 0;
  v23 = 0;
  v78 = v3;
  v76 = *(_DWORD *)(v3 + 52);
  v24 = 7 * v76 + 7;
  if (7 * v76 >= 0)
    v24 = 7 * v76;
  v25 = v24 >> 3;
  v26 = 7 * v76 / 24 + 1;
  v81 = &v90;
  v80 = (char *)&v90 + 4;
  v27 = vdupq_n_s32(v20 + 1);
  v79 = (char *)&v89 + 4;
  v28 = vdupq_n_s32(result);
  v85 = (v86 - 1);
  v84 = (uint64_t)&v4[2 * v85 + 1];
  v29 = v26;
  v82 = result;
  v83 = v20;
  while (1)
  {
    v30.i32[0] = v25;
    v30.i32[1] = v26 + v25;
    v30.u64[1] = (unint64_t)vadd_s32(*(int32x2_t *)v30.i8, vdup_n_s32(v29));
    v31 = vsubq_s32(v27, vaddq_s32(v30, v28));
    v91 = vmulq_s32(v31, v31);
    if ((int)v86 >= 2)
    {
      v32 = result;
      v33 = 1;
      do
      {
        v34 = 0;
        v35 = 0;
        v36 = v32;
        v37 = v20;
        v6[v33] = 0;
        v38 = v4;
        v39 = &v4[2 * v33];
        v32 = *v39;
        v20 = v39[1];
        v40 = v32 - v36;
        v41 = v20 - v37;
        do
        {
          v42 = 0;
          v43 = 0;
          v44 = v91.i32[v35];
          do
          {
            if (v22)
            {
              if ((v43 & 1) != 0)
                v45 = v26;
              else
                v45 = 0;
              v46 = v43 & 2;
              v47 = v44
                  + (v20 + 1 - (v29 & ((int)((_DWORD)v43 << 30) >> 31)) - (v25 + v32 + v45))
                  * (v20 + 1 - (v29 & ((int)((_DWORD)v43 << 30) >> 31)) - (v25 + v32 + v45));
            }
            else
            {
              v46 = v43 & 2;
              v47 = v44;
            }
            v23 = v47
                + (v40 + ((v43 & 1) - (v35 & 1)) * v26) * (v40 + ((v43 & 1) - (v35 & 1)) * v26)
                + (v41 + ((int)((v35 & 2) - v46) >> 1) * v29) * (v41 + ((int)((v35 & 2) - v46) >> 1) * v29);
            if (!v35 || v23 < v92.i32[v43])
            {
              v92.i32[v43] = v23;
              v48 = v34 & ~(3 << v42);
              v34 = v48 | ((_DWORD)v35 << v42);
              v6[v33] = v48 | ((_DWORD)v35 << v42);
            }
            ++v43;
            v42 += 2;
          }
          while (v43 != 4);
          ++v35;
        }
        while (v35 != 4);
        v91 = v92;
        ++v33;
        v4 = v38;
      }
      while (v33 != v86);
      v0 = v92.i32[0];
      result = v82;
      v20 = v83;
    }
    v49 = 0;
    v50 = 0;
    do
    {
      v51 = v0;
      if (!v49 || (v51 = v92.i32[v49], v51 < v23))
      {
        v50 = v49;
        v23 = v51;
      }
      ++v49;
    }
    while (v49 != 4);
    v89 = 0;
    v90 = 0;
    v87 = 0;
    v88 = 0;
    if ((int)v86 >= 1)
    {
      v52 = (unsigned __int16 *)v84;
      v53 = v85;
      do
      {
        v54 = v6[v53];
        v6[v53] = v50;
        *((_DWORD *)&v89 + v50) = *((_DWORD *)&v89 + v50) - *(v52 - 1) + *v52 + 1;
        ++*((_DWORD *)&v87 + v50);
        v50 = (v54 >> (2 * v50)) & 3;
        v52 -= 2;
      }
      while (v53-- > 0);
    }
    if (v22 == 1)
      break;
    v56 = (int)v86 < 6;
    if ((_DWORD)v87 != 1)
      v56 = 0;
    if ((int)v87 > 1 || v56)
    {
      v25 = (int)v89 / (int)v87;
      v58 = (int)v89 / (int)v87 / 3 + 1;
      v59 = HIDWORD(v87);
      v60 = v79;
      if (SHIDWORD(v87) > 1 || (v59 = HIDWORD(v88), v60 = v80, v61 = v25 / 3 + 1, SHIDWORD(v88) >= 2))
        v61 = *v60 / v59 - v25;
      if (v61 <= v25 / 6 + 1)
        v26 = v25 / 6 + 1;
      else
        v26 = v61;
      v62 = v88;
      v63 = v81;
      if ((int)v88 > 1 || (v62 = HIDWORD(v88), v63 = (uint64_t *)v80, SHIDWORD(v88) >= 2))
        v58 = *(_DWORD *)v63 / v62 - v25;
      if (v58 <= v25 / 7 + 1)
        v29 = v25 / 7 + 1;
      else
        v29 = v58;
    }
    else
    {
      if ((int)v88 <= 1)
        break;
      v25 = (int)v90 / (int)v88;
      if (SHIDWORD(v88) < 1)
        v57 = v25 / 3 + 1;
      else
        v57 = SHIDWORD(v90) / SHIDWORD(v88) - v25;
      if (v57 <= v25 / 8)
        v26 = v25 / 8;
      else
        v26 = v57;
      v29 = v26;
    }
    ++v22;
  }
  v64 = (float)((float)((float)v23 / (float)(v86 + 2 * v85)) / (float)(v76 * v76)) * 100.0;
  v66 = v77;
  v65 = v78;
  if ((int)v77 >= 1)
  {
    v67 = 0;
    v68 = *(_QWORD *)(v75 + 280);
    v69 = *(int **)(v78 + 8);
    do
    {
      v71 = *v69++;
      v70 = v71;
      if ((*(_BYTE *)(v68 + 100 * v71 + 94) & 8) == 0)
      {
        v72 = v6[v67++];
        *(_BYTE *)(v68 + 100 * v70 + 93) = v72;
      }
      --v66;
    }
    while (v66);
  }
  if (v64 > 1.0)
  {
    v73 = (int)((double)(int)((v64 + -1.0) * 100.0) * 0.25);
    if (v73 >= 100)
      LOBYTE(v73) = 100;
    *(_BYTE *)(v65 + 97) = v73;
  }
  return result;
}

uint64_t FKSequencesReplaceConcomp(_QWORD *a1, uint64_t a2, int a3, int *a4, int a5)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  int *v12;
  int v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  int *v17;
  int v18;

  v9 = a1[39];
  FKSequenceRemoveConcomp((uint64_t)a1, a2, a3);
  if (a5 >= 1)
  {
    v10 = -991146299 * ((unint64_t)(a2 - v9) >> 3);
    v11 = a5;
    v12 = a4;
    do
    {
      v13 = *v12++;
      sequenceAddConcomp((uint64_t)a1, v10, v13, 1);
      --v11;
    }
    while (v11);
  }
  FKSequenceSortAndProcess(a1, a2, 0);
  v14 = *(unsigned int *)(a2 + 20);
  if ((int)v14 < 1)
    return 0;
  result = 0;
  while (a5 < 1)
  {
LABEL_10:
    if (++result == v14)
      return 0;
  }
  v16 = a5;
  v17 = a4;
  while (1)
  {
    v18 = *v17++;
    if (*(_DWORD *)(*(_QWORD *)(a2 + 8) + 4 * result) == v18)
      return result;
    if (!--v16)
      goto LABEL_10;
  }
}

uint64_t sequenceAddConcomp(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  int *v13;
  int v14;
  int *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  uint64_t v19;
  uint64_t result;

  v8 = *(_QWORD *)(a1 + 312);
  v10 = *(_QWORD *)(a1 + 280);
  v12 = v8 + 104 * a2;
  v14 = *(_DWORD *)(v12 + 20);
  v13 = (int *)(v12 + 20);
  v15 = v13 - 1;
  v16 = *(v13 - 1);
  if (v14 >= (int)v16)
  {
    v18 = (void **)(v8 + 104 * a2 + 8);
    if ((_DWORD)v16)
    {
      *v15 = 2 * v16;
      v17 = malloc_type_realloc(*v18, 8 * v16, 0x100004052888210uLL);
    }
    else
    {
      *v15 = 32;
      v17 = malloc_type_malloc(0x80uLL, 0x100004052888210uLL);
    }
    *v18 = v17;
  }
  else
  {
    v17 = *(void **)(v8 + 104 * a2 + 8);
  }
  v19 = *v13;
  *v13 = v19 + 1;
  *((_DWORD *)v17 + v19) = a3;
  if (a4)
    *(_BYTE *)(v10 + 100 * a3 + 94) = a4;
  *(_DWORD *)(v10 + 100 * a3) = a2;
  result = sequenceUpdateBoxWithConcomp(a1, v8 + 104 * a2, *v13 - 1);
  *(_BYTE *)(v8 + 104 * a2 + 93) = 0;
  return result;
}

uint64_t FKSequencesFind(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  int v6;
  int i;
  uint64_t v8;
  int v9;
  int *v10;
  uint64_t v11;
  int v12;
  int v13;
  int NeighborAtY;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint8x8_t v23;
  int v24;
  uint64_t v25;
  int v26;
  int *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  int v33;
  int v34;
  unsigned __int16 *v35;
  unsigned __int16 *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  BOOL v49;
  int v51;
  int v52;
  int v53;
  int v54;
  unsigned int v55;
  BOOL v56;
  BOOL v57;
  int v58;
  int v60;
  int v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  int v65;
  int v66;
  unsigned __int16 *v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  unsigned __int16 *v74;
  uint64_t v75;
  int v76;
  unsigned __int16 *v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  _DWORD *v83;
  int **v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t v90;
  int *v91;
  uint64_t v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v98;
  int v99;
  unsigned __int16 *v100;
  unsigned int v101;
  uint64_t v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  uint64_t v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  uint64_t v118;
  int v119;
  int v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int *v133;
  int v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  unsigned __int16 *v138;
  unsigned __int16 *v139;
  unsigned __int16 *v140;
  int *v141;
  _DWORD *v142;
  unsigned __int16 *v143;
  uint64_t v144;
  int *v145;
  uint64_t v146;
  int v147;
  int v148;
  int v149;
  BOOL v150;
  int v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  int v155;
  uint64_t v156;
  unsigned int v157;
  unsigned int v158;
  signed int v159;
  unsigned int v160;
  unsigned int v161;
  signed int v162;
  uint64_t v163;
  unsigned __int16 *v164;
  int v165;
  int *v166;
  float v167;
  int v168;
  int v169;
  int v170;
  uint64_t v171;
  int v172;
  unsigned __int16 *v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  int *v177;
  uint64_t v178;
  int v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int v184;
  int v185;
  uint64_t v186;
  unsigned int v187;
  int v188;
  int v189;
  unsigned int v190;
  int *v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  unsigned int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  char v203;
  int v204;
  int v205;
  int v208;
  int v209;
  unsigned int v210;
  int v211;
  unint64_t v212;
  int v213;
  int v214;
  uint64_t v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  float v221;
  int v222;
  int v223;
  int v224;
  int v225;
  int v226;
  int *v227;
  int v228;
  unsigned int v229;
  int v230;
  unsigned int v231;
  int v232;
  int v233;
  uint64_t v234;
  signed int v235;
  int v236;
  unsigned int v237;
  int v238;
  int v239;
  int v240;
  int v241;
  BOOL v243;
  unsigned int v244;
  int v245;
  int v246;
  int v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  uint64_t v253;
  unsigned __int16 *v254;
  unsigned int v255;
  int v256;
  unsigned int v257;
  int v258;
  BOOL v259;
  int v261;
  uint64_t v262;
  int v263;
  int v264;
  uint64_t v265;
  int v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  char v270;
  uint64_t v271;
  int v272;
  BOOL v273;
  int v274;
  uint64_t v275;
  int v276;
  double v277;
  uint64_t result;
  int v279;
  uint64_t v280;
  int v281;
  unsigned int *v282;
  int v283;
  uint64_t v284;
  uint64_t v285;
  int v286;
  uint64_t v287;
  uint64_t v288;
  int v289;
  char v290;
  char v291;
  int v292;
  uint64_t v293;
  uint64_t v294;
  int v295;
  int v296;
  uint64_t v297;
  int *v298;
  int v299;
  int v300;
  uint64_t v301;
  int v302;
  int v303;
  float v304;
  double v305;
  int v306;
  double v307;
  BOOL v308;
  uint64_t v309;
  unsigned int v310;
  int v311;
  int v312;
  unsigned int v313;
  int v314;
  signed int v315;
  signed int v316;
  uint64_t v317;
  unsigned __int16 *v318;
  int v319;
  int v320;
  unsigned int v321;
  unsigned int v322;
  int *v323;
  int *v324;
  unsigned int v325;
  int v326;
  int v327;
  _WORD *v328;
  int v329;
  int v330;
  int v331;
  int v332;
  uint64_t v333;
  int v334;
  unsigned int v335;
  int v336;
  int v337;
  int v338;
  int v339;
  unsigned int v340;
  int v341;
  int v342;
  unsigned int v343;
  int v344;
  _DWORD *v345;
  int v346;
  int v347;
  int v348;
  int v349[4];

  *(_QWORD *)v349 = 0;
  a1[81] = -1;
  *((_QWORD *)a1 + 41) = 0xFFFFFFFFLL;
  v2 = a1[80];
  if ((int)v2 >= 1)
  {
    v3 = 0;
    v4 = (int *)*((_QWORD *)a1 + 39);
    do
    {
      v5 = v3 + 1;
      if ((_DWORD)v2 - 1 == v3)
        v6 = -1;
      else
        v6 = v3 + 1;
      *v4 = v6;
      v4 += 26;
      v3 = v5;
    }
    while (v2 != v5);
  }
  for (i = a1[74]; i != -1; i = *(_DWORD *)(v8 + 100 * v9 + 4))
  {
    v8 = *((_QWORD *)a1 + 35);
    v9 = i;
    v10 = (int *)(v8 + 100 * i);
    if (concompCanBeGlyph((uint64_t)v10))
    {
      *(_QWORD *)v349 = -1;
      v11 = v8 + 100 * v9;
      v12 = *(unsigned __int16 *)(v11 + 84);
      v13 = *(unsigned __int16 *)(v11 + 86) - v12;
      NeighborAtY = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 230 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, NeighborAtY, &v349[1], v349);
      v15 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 179 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, v15, &v349[1], v349);
      if (v13 >= 0)
        v16 = v13;
      else
        v16 = v13 + 1;
      v17 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + (v16 >> 1));
      insertNeighbor((uint64_t)a1, v10, v17, &v349[1], v349);
      v18 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 76 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, v18, &v349[1], v349);
      v19 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 25 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, v19, &v349[1], v349);
      if (v349[1] != -1)
        sequenceLinkConcomps(a1, v9, v349[1]);
      if (v349[0] != -1)
        sequenceLinkConcomps(a1, v9, v349[0]);
    }
  }
  v20 = a1[81];
  if (v20 != -1)
  {
    v21 = *((_QWORD *)a1 + 39);
    do
    {
      v22 = 104 * v20;
      FKSequenceSortAndProcess(a1, v21 + v22, 1);
      v21 = *((_QWORD *)a1 + 39);
      v20 = *(_DWORD *)(v21 + v22);
    }
    while (v20 != -1);
  }
  mergeNeighboringSequences(a1);
  v24 = a1[81];
  if (v24 == -1)
    goto LABEL_160;
  do
  {
    v25 = *((_QWORD *)a1 + 39);
    v26 = v24;
    v27 = (int *)(v25 + 104 * v24);
    v28 = v27[13];
    if (v28 < *a1 || (v29 = *(_DWORD *)(v25 + 104 * v24 + 60), v29 < 5))
    {
LABEL_23:
      v24 = sequenceRemove((uint64_t)a1, v26);
      continue;
    }
    v30 = *(unsigned int *)(v25 + 104 * v24 + 20);
    if ((_DWORD)v30 == 2)
    {
      v31 = *((_QWORD *)a1 + 35);
      v32 = *(int **)(v25 + 104 * v24 + 8);
      v34 = *v32;
      v33 = v32[1];
      v35 = (unsigned __int16 *)(v31 + 100 * v34);
      v36 = (unsigned __int16 *)(v31 + 100 * v33);
      v37 = v35[43];
      v38 = v35[42];
      v39 = v37 - v38 + 1;
      v40 = v36[43];
      v41 = v36[42];
      v42 = v40 - v41 + 1;
      v43 = v42 + v39;
      if ((100 * (v42 - v39) / (v42 + v39) - 15) < 0xFFFFFFE3)
        goto LABEL_23;
      v44 = v38 + v37 - (v40 + v41);
      if (v38 + v37 < v40 + v41)
        v44 += 3;
      if ((100 * (v44 >> 2) / v43 - 15) < 0xFFFFFFE3)
        goto LABEL_23;
      v45 = v42 >= 0 ? v40 - v41 + 1 : v40 - v41 + 2;
      v46 = v41 + (v45 >> 1);
      if (v46 <= v38)
        goto LABEL_23;
      v47 = v39 >= 0 ? v37 - v38 + 1 : v37 - v38 + 2;
      v48 = v38 + (v47 >> 1);
      v49 = v48 >= v40 || v48 <= v41;
      if (v49 || v46 >= v37)
        goto LABEL_23;
      v51 = v35[41];
      v52 = v36[40];
      v53 = (v51 - v35[40] + 1) * v39;
      v54 = (v36[41] - v52 + 1) * v42;
      v55 = 100 * (v52 - v51) / v43 - 20;
      v56 = v53 <= 4 * v54 && v54 <= 4 * v53;
      v57 = v56 && v55 >= 0xFFFFFFE7;
      if (!v57)
        goto LABEL_23;
      if (*(unsigned __int16 *)(v31 + 100 * v34 + 88) > 2u)
        goto LABEL_23;
      if (*(unsigned __int16 *)(v31 + 100 * v33 + 88) > 2u)
        goto LABEL_23;
      if (!looksOkey((uint64_t)v35))
        goto LABEL_23;
      if (!looksOkey((uint64_t)v36))
        goto LABEL_23;
      if (5 * v29 <= v28)
        goto LABEL_23;
      v58 = 2 * v28;
      if (v29 >= 2 * v28)
        goto LABEL_23;
    }
    else
    {
      v58 = 2 * v28;
      if (5 * v29 <= v28 || v29 >= v58)
        goto LABEL_23;
      if ((int)v30 < 1)
      {
        v61 = 0;
        v60 = 0;
        goto LABEL_74;
      }
    }
    v60 = 0;
    v61 = 0;
    v62 = *((_QWORD *)a1 + 35);
    v63 = *(int **)(v25 + 104 * v26 + 8);
    v64 = v30;
    do
    {
      v66 = *v63++;
      v65 = v66;
      v67 = (unsigned __int16 *)(v62 + 100 * v66);
      v68 = v67[43] - v67[42];
      v69 = v67[41] - v67[40] + 1;
      if (v68 < 2 * v69)
      {
        ++v61;
        if (10 * *(_DWORD *)(v62 + 100 * v65 + 72) > v69 * (9 * v68 + 9))
          ++v60;
      }
      --v64;
    }
    while (v64);
LABEL_74:
    if (v60 > v61 / 2)
      goto LABEL_23;
    v70 = *(_DWORD *)(v25 + 104 * v26 + 64);
    if (v70 >= v29)
    {
      if ((int)v30 < 3 || v70 > v58)
        goto LABEL_23;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = *((_QWORD *)a1 + 35);
      do
      {
        v76 = *(_DWORD *)(*(_QWORD *)(v25 + 104 * v26 + 8) + v71);
        if (v71)
        {
          v77 = (unsigned __int16 *)(v75 + 100 * v76);
          v78 = v74[42] - v77[42];
          v79 = v74[43] - v77[43];
          v73 += v78 * v78 + v79 * v79;
          if (v77[40] - v74[41] > v29)
            ++v72;
        }
        v74 = (unsigned __int16 *)(v75 + 100 * v76);
        v71 += 4;
      }
      while (4 * v30 != v71);
      if ((int)v30 <= 2 * v72 && 100 * v73 / (2 * (int)v30) >= v28 * v28)
        goto LABEL_23;
    }
    v24 = *v27;
  }
  while (v24 != -1);
  v80 = a1[81];
  if (v80 != -1)
  {
    v81 = *((_QWORD *)a1 + 39);
    do
    {
      v82 = v81 + 104 * v80;
      v83 = (_DWORD *)(v82 + 20);
      v84 = (int **)(v82 + 8);
      v85 = (int *)(v82 + 52);
      v341 = v80;
      v345 = (_DWORD *)(v82 + 60);
      do
      {
        v86 = *v83;
        if ((int)v86 < 1)
          break;
        v87 = 0;
        v88 = 0;
        v89 = 0;
        v90 = *((_QWORD *)a1 + 35);
        v91 = *v84;
        do
        {
          v92 = v90 + 100 * v91[v87];
          v93 = *(unsigned __int16 *)(v92 + 82) - *(unsigned __int16 *)(v92 + 80) + 1;
          v94 = 100
              * *(_DWORD *)(v92 + 72)
              / (v93 + v93 * (*(unsigned __int16 *)(v92 + 86) - *(unsigned __int16 *)(v92 + 84)));
          if (v94 <= 50)
            v95 = 50;
          else
            v95 = v94;
          if (v94 >= 80)
          {
            v96 = 0;
          }
          else
          {
            ++v89;
            v96 = v95;
          }
          v88 += v96;
          ++v87;
        }
        while (v86 != v87);
        if (v89 < 4 || (int)v89 <= (int)v86 >> 1)
          break;
        v98 = v88 / v89 + 15;
        v99 = *v91;
        v100 = (unsigned __int16 *)(v90 + 100 * v91[1]);
        v101 = v100[40];
        v102 = v90 + 100 * *v91;
        v103 = *(unsigned __int16 *)(v102 + 82);
        v104 = v101 - v103;
        v105 = *v85;
        v106 = v100[43];
        v107 = v100[42];
        v108 = v106 + 1;
        v109 = v106 + 1 - v107;
        if (*v85 > v109)
          v109 = *v85;
        if (v104 > 2 * v109)
          goto LABEL_116;
        if (v104 > v105 && v104 > 2 * *(_DWORD *)(v82 + 64))
        {
          v110 = v107
               + *(unsigned __int16 *)(v90 + 100 * v99 + 86)
               - (v106
                + *(unsigned __int16 *)(v90 + 100 * v99 + 84));
          if (v110 < 0)
            v110 = -v110;
          if (3 * v110 > v105)
            goto LABEL_116;
        }
        v111 = *(unsigned __int16 *)(v102 + 80);
        if (v101 <= (v103 + v111 + 1) >> 1)
          goto LABEL_116;
        v112 = v90 + 100 * v99;
        v113 = *(unsigned __int16 *)(v112 + 86);
        v114 = *(unsigned __int16 *)(v112 + 84);
        v115 = v113 - v114 + 1;
        v116 = v105 >= 0 ? *v85 : v105 + 1;
        if (v115 < v116 >> 1)
          goto LABEL_116;
        if (100 * *(_DWORD *)(v90 + 100 * v99 + 72) / (v115 + v115 * (v103 - v111)) <= v98 || v103 - v111 < *v345 / 2)
          goto LABEL_133;
        if (v104 > v116 >> 1)
          goto LABEL_116;
        v131 = ((v113 + v114 + 1) >> 1) - ((v108 + v107) >> 1);
        if (v131 < 0)
          v131 = -v131;
        if (v131 > v105 / 4)
        {
LABEL_116:
          FKSequenceRemoveConcomp((uint64_t)a1, v82, 0);
          v90 = *((_QWORD *)a1 + 35);
          v91 = *v84;
          LODWORD(v86) = *v83;
          v117 = 1;
          v105 = *v85;
        }
        else
        {
LABEL_133:
          v117 = 0;
        }
        v118 = (int)v86 - 1;
        v119 = v91[v118];
        v120 = v91[(int)v86 - 2];
        v121 = v90 + 100 * v119;
        v124 = *(unsigned __int16 *)(v121 + 80);
        v123 = v121 + 80;
        v122 = v124;
        v125 = v90 + 100 * v120;
        v126 = v124 - *(unsigned __int16 *)(v125 + 82);
        if (v126 <= 2 * v105)
        {
          v127 = *(unsigned __int16 *)(v123 + 2);
          if (*(unsigned __int16 *)(v125 + 80) < (v122 + v127 + 1) >> 1)
          {
            v128 = *(unsigned __int16 *)(v90 + 100 * v119 + 86) - *(unsigned __int16 *)(v90 + 100 * v119 + 84) + 1;
            v130 = v105;
            v129 = v105 + (v105 < 0);
            if (v128 >= v130 / 2
              && (100 * *(_DWORD *)(v90 + 100 * v119 + 72) / (v128 + v128 * (v127 - v122)) <= v98
               || v126 <= v129 >> 1
               || v127 - v122 < *v345 / 2))
            {
              continue;
            }
          }
        }
        FKSequenceRemoveConcomp((uint64_t)a1, v82, v118);
        v117 = 1;
        FKSequenceSortAndProcess(a1, v82, 1);
      }
      while (v117);
      v81 = *((_QWORD *)a1 + 39);
      v80 = *(_DWORD *)(v81 + 104 * v341);
    }
    while (v80 != -1);
    v132 = a1[81];
    if (v132 != -1)
    {
      do
      {
        v133 = (int *)(*((_QWORD *)a1 + 39) + 104 * v132);
        v23.i32[0] = *(int *)((char *)v133 + 95);
        if (vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v23))) <= 0x63
          && histogramIsOK((uint64_t)a1, *((_QWORD *)a1 + 39) + 104 * v132))
        {
          v132 = *v133;
        }
        else
        {
          v132 = sequenceRemove((uint64_t)a1, v132);
        }
      }
      while (v132 != -1);
      v134 = a1[81];
      if (v134 != -1)
      {
        v135 = a1[81];
        while (1)
        {
          v136 = *((_QWORD *)a1 + 39);
          if (v134 != -1)
          {
            v137 = v136 + 104 * v135;
            v138 = (unsigned __int16 *)(v137 + 24);
            v139 = (unsigned __int16 *)(v137 + 28);
            v140 = (unsigned __int16 *)(v137 + 30);
            v141 = (int *)(v137 + 52);
            v142 = (_DWORD *)(v137 + 60);
            v143 = (unsigned __int16 *)(v137 + 26);
            do
            {
              v144 = *((_QWORD *)a1 + 39);
              v145 = (int *)(v144 + 104 * v134);
              if (v145[5] == 2
                && (v146 = v144 + 104 * v134, *(unsigned __int16 *)(v146 + 30) >= *v139)
                && *(unsigned __int16 *)(v144 + 104 * v134 + 28) <= *v140
                && ((v147 = *(_DWORD *)(v144 + 104 * v134 + 52), v148 = 5 * v147, v149 = 4 * v147, v148 <= 3 * *v141)
                  ? (v150 = v149 < *v141)
                  : (v150 = 1),
                    !v150
                 && *v138 - *v142 <= *(unsigned __int16 *)(v144 + 104 * v134 + 26)
                 && *v142 + *v143 >= *(unsigned __int16 *)(v146 + 24)))
              {
                v134 = sequenceRemove((uint64_t)a1, v134);
              }
              else
              {
                v134 = *v145;
              }
            }
            while (v134 != -1);
          }
          v135 = *(_DWORD *)(v136 + 104 * v135);
          if (v135 == -1)
            break;
          v134 = a1[81];
        }
      }
    }
  }
LABEL_160:
  v151 = a1[74];
  if (v151 == -1)
    goto LABEL_351;
  while (2)
  {
    v152 = *((_QWORD *)a1 + 35);
    v153 = v151;
    if (*(_BYTE *)(v152 + 100 * v151 + 94))
      goto LABEL_162;
    v154 = a1[81];
    if (v154 == -1)
      goto LABEL_162;
    v155 = 0;
    v338 = 0;
    v156 = v152 + 100 * v151;
    v157 = *(unsigned __int16 *)(v156 + 82);
    v158 = *(unsigned __int16 *)(v156 + 80);
    v159 = (v158 + v157 + 1) >> 1;
    v160 = *(unsigned __int16 *)(v156 + 86);
    v161 = *(unsigned __int16 *)(v156 + 84);
    v162 = (v160 + v161 + 1) >> 1;
    v163 = *((_QWORD *)a1 + 39);
    v164 = (unsigned __int16 *)v156;
    v165 = *(unsigned __int8 *)(v156 + 92);
    v328 = (_WORD *)(v156 + 88);
    v166 = (int *)(v156 + 72);
    v325 = 3 * v160;
    v329 = v160 - v161 + 1;
    v330 = v160 - v161;
    v167 = (float)(int)(2 * (v160 - v161 + v157 - v158) + 4);
    v324 = (int *)(v156 + 76);
    v326 = 4 * v329;
    v331 = v157 - v158;
    v327 = v157 - v158 + 1;
    v168 = -1;
    v169 = a1[81];
    v170 = -1;
    while (2)
    {
      v171 = v163 + 104 * v169;
      if (v165 != *(unsigned __int8 *)(v171 + 92))
        goto LABEL_313;
      v172 = v169;
      v173 = (unsigned __int16 *)(v163 + 104 * v169);
      if (v161 > v173[15])
        goto LABEL_313;
      v174 = *(_DWORD *)(v163 + 104 * v172 + 60);
      if (v159 < v173[12] - v174)
        goto LABEL_313;
      if (v174 + v173[13] < (int)v158)
        goto LABEL_313;
      if (v162 < v173[14] - *(_DWORD *)(v163 + 104 * v172 + 52))
        goto LABEL_313;
      v175 = *(unsigned int *)(v163 + 104 * v172 + 20);
      if ((int)v175 < 1)
        goto LABEL_313;
      v332 = v155;
      v334 = v168;
      v337 = v170;
      v176 = 0x7FFFFFFFLL;
      v177 = *(int **)(v163 + 104 * v172 + 8);
      v346 = -1;
      v342 = -1;
      v178 = 0xFFFFFFFFLL;
      v179 = 0x7FFFFFFF;
      while (2)
      {
        v181 = *v177++;
        v180 = v181;
        v182 = v152 + 100 * (int)v181;
        LODWORD(v181) = *(unsigned __int16 *)(v182 + 80);
        v183 = v182 + 80;
        v184 = v181;
        v185 = v181 - v157;
        if (v181 <= v157)
        {
          v187 = *(unsigned __int16 *)(v183 + 2);
          v188 = v184 - v158;
          if (v188 < 0)
            v188 = -v188;
          v189 = v187 - v157;
          if ((int)(v187 - v157) < 0)
            v189 = v157 - v187;
          v190 = v189 + v188;
          if (v158 > v187)
            v186 = (v158 | 0x10000) - v187;
          else
            v186 = v190;
        }
        else
        {
          v186 = (v185 + 0x10000);
        }
        if ((int)v186 >= v179)
        {
          v180 = v178;
        }
        else
        {
          if ((int)v186 < (int)v176)
          {
            v346 = v178;
            v342 = v180;
            v179 = v176;
            goto LABEL_188;
          }
          v346 = v180;
          v180 = v178;
          v179 = v186;
        }
        v186 = v176;
LABEL_188:
        v178 = v180;
        v176 = v186;
        if (--v175)
          continue;
        break;
      }
      if (v342 == -1)
      {
        v168 = v334;
        v170 = v337;
        v155 = v332;
        goto LABEL_313;
      }
      v323 = v166;
      v191 = (int *)(v152 + 100 * v342);
      v192 = *((unsigned __int16 *)v191 + 41);
      v193 = *((unsigned __int16 *)v191 + 40);
      v194 = v192 - v193;
      v318 = v164;
      v319 = *v191;
      v310 = v192 + v193 + 1;
      v195 = v159 - (v310 >> 1);
      if (v195 < 0)
        v195 = (v310 >> 1) - v159;
      v196 = v194 + 3;
      if (v194 >= -2)
        v196 = v194 + 2;
      v317 = v153;
      v315 = v162;
      v316 = v159;
      v321 = v160;
      v322 = v161;
      if (v195 > v196 >> 1)
      {
        v311 = *(_BYTE *)(v152 + 100 * v342 + 94) & 8;
        goto LABEL_243;
      }
      v197 = *((unsigned __int16 *)v191 + 43);
      v198 = *((unsigned __int16 *)v191 + 42);
      v199 = v197 - v198 + 1;
      v200 = 12 * (v194 + 2) / 10;
      v201 = v197 - v198 + 3;
      if ((int)(v197 - v198) >= -2)
        v201 = v197 - v198 + 2;
      v202 = v201 >> 1;
      if (v200 <= 3 * v199 / 5)
        v200 = 3 * v199 / 5;
      if ((*(_BYTE *)(v152 + 100 * v342 + 94) & 8) != 0)
      {
        v204 = *(_DWORD *)(v163 + 104 * v319 + 52);
        if (v200 <= v204 / 4)
          v200 = v204 / 4;
        v205 = 3 * v204 / 5;
        if (v202 <= v205)
          v202 = v205;
      }
      else if (*v328 == 1)
      {
        v202 = (int)(6 * (v197 - v198 + 2)) / 10;
      }
      v203 = *(_BYTE *)(v152 + 100 * v342 + 94);
      if (v331 >= v200 || v330 >= v202 || v329 < v199 / 8)
      {
        v311 = v203 & 8;
        goto LABEL_243;
      }
      if (v199 >= 0)
        v208 = v197 - v198 + 1;
      else
        v208 = v197 - v198 + 2;
      v209 = v208 >> 1;
      if ((*(_BYTE *)(v152 + 100 * v342 + 94) & 8) != 0)
      {
        v212 = 2863311532 * *(_DWORD *)(v163 + 104 * v319 + 52);
        v213 = HIDWORD(v212) + (v212 >> 63);
        if (v209 <= v213)
          v209 = v213;
        v210 = v160;
        v211 = v161;
      }
      else
      {
        v210 = v160;
        v211 = v161;
        if (*v323 >= *(_DWORD *)(v152 + 100 * v342 + 72))
        {
          v311 = 0;
          goto LABEL_243;
        }
      }
      v311 = v203 & 8;
      if (v325 >= v197 + 2 * v198)
      {
        v57 = v211 >= v197;
        v214 = v211 - v197;
        if (v214 != 0 && v57 && v214 <= v209)
        {
          v215 = v163 + 104 * v319;
          v216 = *(_DWORD *)(v215 + 40);
          v217 = v216 + *(_DWORD *)(v215 + 32);
          v218 = *(_DWORD *)(v215 + 36) + v216;
          LODWORD(v215) = (int)((v158 - *(unsigned __int16 *)(v215 + 24)) << 16)
                        / (*(unsigned __int16 *)(v215 + 26) - *(unsigned __int16 *)(v215 + 24));
          if (v211 <= ((int)v215 * v218 + (0x10000 - (int)v215) * v217) / 0x10000)
            goto LABEL_233;
        }
        goto LABEL_243;
      }
      if ((int)(v198 - v210) > v209)
        goto LABEL_243;
LABEL_233:
      if (*v328 && *v323 < 32)
        goto LABEL_243;
      v219 = *(_DWORD *)(v152 + 100 * v342 + 72);
      v220 = 2 * v194 + 2;
      if (v220 > v199)
        v219 = v219 * v199 / v220;
      if (15 * *v323 < v219
        || (int)(2 * (v157 - v158) + 2) < v330
        || (*v328 != 1 ? (v221 = 1.5) : (v221 = 2.0),
            (float)((float)*v324 / v167) > fmaxf((float)(v221 * (float)*v323) / (float)*v324, 1.0)))
      {
LABEL_243:
        v222 = FKSequenceScoreAsPercent((uint64_t)a1, v342, v153, 1);
        v223 = v342;
        v161 = v322;
        v168 = v334;
        v170 = v337;
        v224 = v332;
        v225 = v338;
        v226 = v346;
        v227 = (int *)(v152 + 100 * v342);
        v228 = v311;
      }
      else
      {
        v245 = 10 * scoreForInsideSequence(v163 + 104 * v319, v164) + 3;
        v228 = v311;
        if (v311)
          v222 = 6;
        else
          v222 = v245;
        v161 = v322;
        v168 = v334;
        v170 = v337;
        v224 = v332;
        v225 = v338;
        v226 = v346;
        v223 = v342;
        v227 = (int *)(v152 + 100 * v342);
      }
      if (v222 <= v225)
        v229 = v225;
      else
        v229 = v222;
      if (v222 <= v225)
        v230 = v224;
      else
        v230 = 17;
      if (v222 > v225)
        v168 = v223;
      if (!v228)
      {
        v347 = v230;
        v153 = v317;
        v162 = v315;
        v159 = v316;
        v160 = v321;
        v166 = v323;
        v164 = v318;
        v232 = v319;
        goto LABEL_260;
      }
      if (v310 >> 1 <= v158 || v310 >> 1 >= v157)
      {
        v347 = v230;
        if ((*(_BYTE *)(v152 + 100 * v226 + 94) & 8) == 0)
        {
          v227 = (int *)(v152 + 100 * v226);
          v226 = v223;
        }
        v232 = *v227;
        v153 = v317;
        v162 = v315;
        v159 = v316;
        v160 = v321;
        v166 = v323;
        v164 = v318;
LABEL_260:
        v339 = *((unsigned __int16 *)v227 + 41);
        v233 = *((unsigned __int16 *)v227 + 40);
        v234 = v163 + 104 * v232;
        v235 = *(_DWORD *)(v234 + 60);
        v333 = v234;
        v236 = *(_DWORD *)(v234 + 52);
        v343 = *((unsigned __int16 *)v227 + 43);
        if (v343 < v161 || (v237 = *((unsigned __int16 *)v227 + 42), v237 > v160))
        {
          if (v226 == -1)
            goto LABEL_269;
          v237 = *((unsigned __int16 *)v227 + 42);
          if (v160 < v237)
          {
            if ((int)(v343 - v237) >= 3 * *(_DWORD *)(v163 + 104 * v232 + 40) / 4)
            {
LABEL_303:
              v231 = 0;
              v170 = v337;
              goto LABEL_304;
            }
            v170 = v337;
            if ((int)(6 * (v237 - v160)) <= (int)(v343 - v237 + 1))
              goto LABEL_270;
LABEL_269:
            v231 = 0;
            goto LABEL_304;
          }
          if (v327 < 3 * v329 || (int)(6 * (v161 - v343)) > (int)(v343 - v237 + 1))
            goto LABEL_269;
        }
LABEL_270:
        v320 = v232;
        v238 = v236 * v236;
        v239 = 2 * v235;
        if (2 * v235 < v236)
          v238 = 4 * v235 * v235;
        v241 = v238;
        v240 = v238 + (v238 < 0 ? 0x3F : 0);
        if (*v166 <= v241 / 64)
        {
          if (3 * *v166 <= v240 >> 6)
            goto LABEL_303;
          if (fabsf((float)(int)(v160 - v343) / (float)v236) > 0.08 || v326 >= 3 * v236)
            goto LABEL_303;
        }
        else if (v326 >= 3 * v236)
        {
          goto LABEL_303;
        }
        v335 = *((unsigned __int16 *)v227 + 40);
        v312 = 3 * v235;
        v243 = 8 * v329 <= v331 && v327 < 3 * v235;
        if (!v243 && v331 >= v239 || 7 * v327 > 4 * v235 && 7 * v329 > 5 * v236)
          goto LABEL_303;
        v244 = (v339 + v233 + 1) >> 1;
        if (v244 <= v157)
        {
          if (v244 >= v158)
            goto LABEL_303;
          if (v312 >= 0)
            v246 = 3 * v235;
          else
            v246 = v312 + 1;
          v247 = v246 >> 1;
          v248 = v239 / 3;
          if (!a1[9])
            v247 = v248;
          if ((int)(v158 - v339) > v247 + 1)
            goto LABEL_303;
          v313 = v237;
          v170 = v337;
          v230 = v347;
          if (((4 * (v158 + v157) + 4) & 0xFFFF8) < v233 - v339 + 8 * v339)
          {
            v231 = 0;
            goto LABEL_305;
          }
LABEL_317:
          v340 = v229;
          v348 = v230;
          v336 = v168;
          v314 = *v166;
          if ((int)(100 * pixelCount((uint64_t)a1, v158, v157, v161, v160, v165)) > 105 * v314)
          {
            v231 = 0;
            v153 = v317;
            v162 = v315;
            v159 = v316;
            v160 = v321;
            v161 = v322;
            v166 = v323;
            v164 = v318;
LABEL_328:
            v168 = v336;
            v170 = v337;
            v230 = v348;
            v229 = v340;
            goto LABEL_305;
          }
          v161 = v322;
          if (v322 <= (v343 + v313 + 1) >> 1)
            v250 = 1;
          else
            v250 = 4;
          if (*(unsigned __int16 *)(v163 + 104 * v320 + 24) >= v157)
          {
            v164 = v318;
            if (!a1[9])
            {
              v231 = 0;
              goto LABEL_327;
            }
          }
          else
          {
            ++v250;
            v164 = v318;
          }
          v344 = v250;
          v251 = scoreForInsideSequence(v333, v164);
          v164 = v318;
          v161 = v322;
          v231 = v344 + 10 * v251;
LABEL_327:
          v153 = v317;
          v162 = v315;
          v159 = v316;
          v160 = v321;
          v166 = v323;
          goto LABEL_328;
        }
        v231 = 0;
        v170 = v337;
        if ((int)(v335 - v157) < v235)
        {
          v313 = v237;
          v230 = v347;
          if (v158 >= v335)
            goto LABEL_305;
          goto LABEL_317;
        }
LABEL_304:
        v230 = v347;
        goto LABEL_305;
      }
      v231 = 0;
      v153 = v317;
      v162 = v315;
      v159 = v316;
      v160 = v321;
      v166 = v323;
      v164 = v318;
LABEL_305:
      if (v231 <= v229)
        v249 = v229;
      else
        v249 = v231;
      v338 = v249;
      if (v231 <= v229)
        v155 = v230;
      else
        v155 = 9;
      if (v231 > v229)
        v170 = v172;
LABEL_313:
      v169 = *(_DWORD *)v171;
      if (*(_DWORD *)v171 != -1)
        continue;
      break;
    }
    if (v338 <= 0)
    {
      do
      {
        v253 = v163 + 104 * v154;
        if (v165 == *(unsigned __int8 *)(v253 + 92))
        {
          v254 = (unsigned __int16 *)(v163 + 104 * v154);
          if (v161 <= v254[15])
          {
            v255 = v254[12];
            v256 = *(_DWORD *)(v163 + 104 * v154 + 60);
            if (v159 >= (int)(v255 - v256))
            {
              v257 = v254[13];
              if (v159 <= (int)(v256 + v257))
              {
                v258 = *(_DWORD *)(v163 + 104 * v154 + 52);
                v259 = v162 >= v254[14] - v258 && v158 >= v255;
                if (v259 && v157 <= v257 && *v166 >= (int)((v258 * v258) >> 8))
                {
                  v261 = ((256 - (int)((v159 - v255) << 8) / (int)(v257 - v255)) * *(_DWORD *)(v163 + 104 * v154 + 32)
                        + *(_DWORD *)(v163 + 104 * v154 + 36) * ((int)((v159 - v255) << 8) / (int)(v257 - v255))) >> 8;
                  if (v261 <= (int)v161 && *(_DWORD *)(v163 + 104 * v154 + 40) + v261 >= (int)v160)
                  {
                    v262 = v163 + 104 * v154;
                    v263 = *(_DWORD *)(v262 + 72) + *v166;
                    ++*(_DWORD *)(v262 + 68);
                    *(_DWORD *)(v262 + 72) = v263;
                  }
                }
              }
            }
          }
        }
        v154 = *(_DWORD *)v253;
      }
      while (*(_DWORD *)v253 != -1);
    }
    else
    {
      v252 = v153;
      if (v155 == 17)
        addDiacritic((uint64_t)a1, v168, v153);
      else
        sequenceAddConcomp((uint64_t)a1, v170, v153, 9);
      LODWORD(v153) = v252;
    }
LABEL_162:
    v151 = *(_DWORD *)(v152 + 100 * (int)v153 + 4);
    if (v151 != -1)
      continue;
    break;
  }
LABEL_351:
  v264 = a1[81];
  while (v264 != -1)
  {
    v265 = *((_QWORD *)a1 + 39);
    v266 = v264;
    v267 = v265 + 104 * v264;
    FKSequenceSortAndProcess(a1, v267, 1);
    v268 = *(unsigned int *)(v267 + 20);
    if ((int)v268 >= 1)
    {
      v269 = 0;
      v270 = 0;
      v271 = *((_QWORD *)a1 + 35);
      while (1)
      {
        v272 = *(_DWORD *)(*(_QWORD *)(v265 + 104 * v266 + 8) + 4 * v269);
        if ((*(_BYTE *)(v271 + 100 * v272 + 94) & 8) == 0)
          break;
        if (*(_DWORD *)(v271 + 100 * v272 + 64) != -1)
          v270 = 1;
        if (v268 == ++v269)
        {
          LODWORD(v269) = *(_DWORD *)(v267 + 20);
          break;
        }
      }
      if (v270)
        v273 = 1;
      else
        v273 = v269 > 2;
      v274 = v273;
      if ((_DWORD)v269 && v274)
      {
        do
        {
          FKSequenceRemoveConcomp((uint64_t)a1, v267, 0);
          LODWORD(v269) = v269 - 1;
        }
        while ((_DWORD)v269);
        LODWORD(v268) = *(_DWORD *)(v267 + 20);
      }
    }
    v275 = v265 + 104 * v266;
    v276 = 100 * *(_DWORD *)(v275 + 68) / (int)v268;
    if (v276 >= 100)
      LOBYTE(v276) = 100;
    *(_BYTE *)(v275 + 98) = v276;
    if (*(unsigned __int8 *)(v275 + 96)
       + *(unsigned __int8 *)(v275 + 95)
       + *(unsigned __int8 *)(v275 + 97)
       + v276 >= 0x64)
      v264 = sequenceRemove((uint64_t)a1, v266);
    else
      v264 = *(_DWORD *)(*((_QWORD *)a1 + 39) + 104 * v266);
  }
  mergeNeighboringSequences(a1);
  result = a1[81];
  if ((_DWORD)result != -1)
  {
    v279 = 0;
    do
    {
      v280 = *((_QWORD *)a1 + 39);
      v281 = result;
      v282 = (unsigned int *)(v280 + 104 * (int)result);
      LODWORD(v277) = *(unsigned int *)((char *)v282 + 95);
      if (vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&v277))) > 0x63)
        goto LABEL_412;
      v283 = v282[11];
      if (v283 < 4 || v283 <= 5 && *(int *)(v280 + 104 * (int)result + 52) <= 32)
      {
        v284 = *(unsigned int *)(v280 + 104 * (int)result + 20);
        if ((int)v284 < 1)
        {
          v286 = 0;
        }
        else
        {
          v285 = 0;
          v286 = 0;
          v287 = *((_QWORD *)a1 + 35);
          do
          {
            v288 = 0;
            v289 = *(_DWORD *)(*(_QWORD *)(v280 + 104 * (int)result + 8) + 4 * v285);
            v286 += *(_DWORD *)(v287 + 100 * v289 + 72);
            v290 = 1;
            do
            {
              v291 = v290;
              v292 = *(_DWORD *)(v287 + 100 * v289 + 4 * v288 + 64);
              if (v292 != -1)
                v286 += *(_DWORD *)(v287 + 100 * v292 + 72);
              v290 = 0;
              v288 = 1;
            }
            while ((v291 & 1) != 0);
            ++v285;
          }
          while (v285 != v284);
        }
        v293 = v280 + 104 * (int)result;
        if (100 * v286 < (int)(99
                              * pixelCount((uint64_t)a1, *(unsigned __int16 *)(v293 + 24), *(unsigned __int16 *)(v293 + 26), *(unsigned __int16 *)(v293 + 28), *(unsigned __int16 *)(v293 + 30), *(unsigned __int8 *)(v293 + 92))))goto LABEL_412;
      }
      if (!histogramIsOK((uint64_t)a1, (uint64_t)v282))
        goto LABEL_412;
      if (!a1[4])
        goto LABEL_415;
      v294 = *(unsigned int *)(v280 + 104 * v281 + 20);
      if ((int)v294 < 1)
      {
        v296 = 0;
        v295 = 0;
      }
      else
      {
        v295 = 0;
        v296 = 0;
        v297 = *((_QWORD *)a1 + 35);
        v298 = *(int **)(v280 + 104 * v281 + 8);
        do
        {
          v300 = *v298++;
          v299 = v300;
          if ((*(_BYTE *)(v297 + 100 * v300 + 94) & 8) == 0)
          {
            v301 = v297 + 100 * v299;
            v302 = *(unsigned __int16 *)(v301 + 82) - *(unsigned __int16 *)(v301 + 80) + 1;
            v303 = *(unsigned __int16 *)(v301 + 86) - *(unsigned __int16 *)(v301 + 84) + 1;
            v277 = (float)((float)*(int *)(v301 + 76) / (float)(2 * (v303 + v302)));
            if (v277 < 1.1)
            {
              v304 = (float)*(int *)(v297 + 100 * v299 + 72) / (float)(v303 * v302);
              v305 = v304;
              if (v304 <= 0.6)
              {
                LOWORD(v305) = *(_WORD *)(v301 + 90);
                v306 = v304 < 0.5;
                if ((float)((float)LODWORD(v305) / (float)v302) >= 0.5)
                  v306 = 0;
                v296 += v306;
              }
              else
              {
                ++v295;
              }
            }
          }
          --v294;
        }
        while (v294);
      }
      if (v283 > 2
        && ((v277 = (double)v295, v307 = (double)v283 * 0.6, v307 >= (double)v295)
          ? (v308 = v307 < (double)v296)
          : (v308 = 1),
            v308))
      {
LABEL_412:
        result = sequenceRemove((uint64_t)a1, v281);
      }
      else
      {
LABEL_415:
        if (v279 <= v283)
          v279 = v283;
        result = *v282;
      }
    }
    while ((_DWORD)result != -1);
    if (v279 == 2)
    {
      result = a1[81];
      while ((_DWORD)result != -1)
      {
        v309 = *((_QWORD *)a1 + 39);
        if ((100
            * (*(unsigned __int16 *)(v309 + 104 * (int)result + 30)
             - *(unsigned __int16 *)(v309 + 104 * (int)result + 28))
            + 100)
           / a1[8] >= 11
          && a1[9]
          && (100
            * (*(unsigned __int16 *)(v309 + 104 * (int)result + 26)
             - *(unsigned __int16 *)(v309 + 104 * (int)result + 24))
            + 100)
           / a1[7] > 10)
        {
          result = *(unsigned int *)(v309 + 104 * (int)result);
        }
        else
        {
          result = sequenceRemove((uint64_t)a1, result);
        }
      }
    }
  }
  return result;
}

uint64_t sequenceLinkFreeList(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v2 = *(int *)(result + 332);
  v3 = *(int *)(result + 320);
  if ((int)v2 < (int)v3)
  {
    v4 = ~v2 + v3;
    v5 = v2 + 1;
    v6 = v3 - v2;
    v7 = *(_QWORD *)(result + 312) + 104 * (int)v2;
    do
    {
      if (v4)
        v8 = v5;
      else
        v8 = -1;
      *(_DWORD *)v7 = v8;
      if (a2)
      {
        *(_QWORD *)(v7 + 8) = 0;
        *(_DWORD *)(v7 + 16) = 0;
        *(_QWORD *)(v7 + 80) = 0;
        *(_DWORD *)(v7 + 88) = 0;
      }
      --v4;
      ++v5;
      v7 += 104;
      --v6;
    }
    while (v6);
  }
  return result;
}

BOOL concompCanBeGlyph(uint64_t a1)
{
  int v1;
  int v3;
  int v4;
  int v5;
  int v6;

  v1 = *(unsigned __int8 *)(a1 + 94);
  if (v1 == 2 || v1 == 4)
    return 0;
  v3 = *(unsigned __int16 *)(a1 + 82) - *(unsigned __int16 *)(a1 + 80);
  v4 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84);
  v5 = 6;
  if (v3 > v4)
    v5 = (6 * v3 + 6) / (v4 + 1);
  if (v5 < *(unsigned __int16 *)(a1 + 88))
    return 0;
  v6 = *(_DWORD *)(a1 + 72);
  if (v6 < 17)
    return 1;
  if (v3 <= v4)
    v3 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84);
  return (v3 + 1) * (v3 + 1) <= 32 * v6;
}

_QWORD *sequenceLinkConcomps(_QWORD *result, int a2, int a3)
{
  uint64_t v4;
  int v5;
  int v6;

  v4 = result[35];
  v5 = *(_DWORD *)(v4 + 100 * a2);
  v6 = *(_DWORD *)(v4 + 100 * a3);
  if (v5 == -1)
  {
    if (v6 == -1)
      return (_QWORD *)sequenceCreate((uint64_t)result, a2, a3);
    v5 = v6;
    a3 = a2;
    return (_QWORD *)sequenceAddConcomp((uint64_t)result, v5, a3, 1);
  }
  if (v6 == -1)
    return (_QWORD *)sequenceAddConcomp((uint64_t)result, v5, a3, 1);
  if (v5 != v6)
    return (_QWORD *)sequenceMerge(result, v5, v6);
  return result;
}

_DWORD *mergeNeighboringSequences(_DWORD *result)
{
  int v1;
  _QWORD *v2;
  uint64_t v3;
  unsigned __int16 *v4;
  int v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  _DWORD *v10;
  int *v11;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
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
  signed int v35;
  uint64_t v36;
  _BOOL4 v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  BOOL v50;
  int v51;
  uint64_t v52;
  int *v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int *v59;
  int v60;
  int v61;
  int v62;
  int v63;
  unsigned __int16 *v65;
  unsigned __int16 *v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  _DWORD *v72;
  unsigned __int16 *v73;
  unsigned __int16 *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  unsigned __int16 *v80;
  int v81;
  unsigned __int16 *v82;
  _DWORD *v83;
  unsigned __int16 *v84;
  unsigned __int16 *v85;
  int v86;
  int **v87;
  _DWORD *v88;
  _DWORD *v89;
  unsigned __int16 *v90;
  unsigned __int16 *v91;
  _BOOL4 v92;
  unsigned int *v93;
  unsigned __int16 *v94;
  unsigned __int16 *v95;
  unsigned __int16 *v96;
  unsigned __int16 *v97;
  int *v98;
  _DWORD *v99;

  v1 = result[81];
  if (v1 != -1)
  {
    v2 = result;
    do
    {
      v3 = v2[39];
      v4 = (unsigned __int16 *)(v3 + 104 * v1);
      v5 = *(_DWORD *)v4;
      if (*(_DWORD *)v4 == -1)
        return result;
      v86 = v1;
      v6 = v3 + 104 * v1;
      v7 = (unsigned __int8 *)(v6 + 92);
      v8 = (unsigned __int16 *)(v6 + 24);
      v9 = (unsigned __int16 *)(v6 + 26);
      v10 = (_DWORD *)(v6 + 60);
      result = (_DWORD *)(v6 + 52);
      v11 = (int *)(v6 + 40);
      v93 = (unsigned int *)(v6 + 20);
      v12 = (unsigned __int16 *)(v6 + 28);
      v13 = (unsigned __int16 *)(v6 + 30);
      v87 = (int **)(v6 + 8);
      v88 = (_DWORD *)(v6 + 44);
      v99 = (_DWORD *)(v6 + 52);
      v98 = (int *)(v6 + 40);
      do
      {
        v14 = v2[39];
        v15 = v14 + 104 * v5;
        if (*v7 == *(unsigned __int8 *)(v15 + 92))
        {
          v16 = v5;
          v17 = *v8;
          v18 = v14 + 104 * v16;
          v19 = *(unsigned __int16 *)(v18 + 24);
          if (v17 <= v19)
            v17 = *(unsigned __int16 *)(v18 + 24);
          v20 = *v9;
          v21 = *(unsigned __int16 *)(v18 + 26);
          if (v20 < v21)
            v21 = *v9;
          v22 = v17 - v21;
          v23 = *(_DWORD *)(v18 + 60);
          v24 = v23 + *v10;
          if (v24 < 0 != __OFADD__(v23, *v10))
            ++v24;
          v25 = v24 >> 1;
          v26 = *result;
          v27 = *(_DWORD *)(v18 + 52);
          v28 = v27 + *result;
          if (v27 + v26 < 0 != __OFADD__(v27, v26))
            ++v28;
          if (v25 <= v28 >> 1)
            v25 = v28 >> 1;
          v29 = v25 >= 0 ? v25 : v25 + 1;
          if (v22 >= -(v29 >> 1) && 5 * v25 >= 2 * v22)
          {
            v30 = *v11;
            if (*v11 && (v31 = *(_DWORD *)(v14 + 104 * v16 + 40)) != 0)
            {
              if (v30 >= v31)
                v30 = *(_DWORD *)(v14 + 104 * v16 + 40);
              v32 = v26 - v27;
              if (v32 >= 0)
                v33 = v32;
              else
                v33 = -v32;
              if (v30 >= 0)
                v34 = v30;
              else
                v34 = v30 + 1;
              if (v33 < v34 >> 1)
              {
                v94 = v13;
                v96 = v12;
                v89 = v10;
                v90 = v9;
                v91 = v8;
                v35 = v34 >> 1;
                v36 = (uint64_t)v4;
                v92 = doesSeqLineIntersectSeq(v15, v4, v34 >> 1);
                v37 = doesSeqLineIntersectSeq(v36, (unsigned __int16 *)v15, v35);
                if (!v92 && !v37 || !v92 && *(int *)(v14 + 104 * v16 + 20) > 5)
                {
                  v8 = v91;
                  v4 = (unsigned __int16 *)v36;
                  v10 = v89;
                  v9 = v90;
                  result = v99;
                  v12 = v96;
                  v11 = v98;
                  v13 = v94;
                  goto LABEL_98;
                }
                v13 = v94;
                v49 = *v93;
                v50 = v37 || (int)v49 < 6;
                v8 = v91;
                v4 = (unsigned __int16 *)v36;
                v10 = v89;
                v9 = v90;
                v12 = v96;
                v11 = v98;
                if (!v50)
                {
                  result = v99;
                  goto LABEL_98;
                }
                result = v99;
                goto LABEL_55;
              }
            }
            else
            {
              v38 = *v13;
              v39 = *v12;
              v40 = v38 - v39 + 1;
              v41 = v14 + 104 * v16;
              v42 = *(unsigned __int16 *)(v41 + 30);
              v43 = *(unsigned __int16 *)(v41 + 28);
              if (v40 >= v42 - v43 + 1)
                v40 = v42 - v43 + 1;
              v44 = v40 + (v40 < 0);
              if (v38 - v39 - (v42 - v43) >= 0)
                v45 = v38 - v39 - (v42 - v43);
              else
                v45 = v42 - v43 - (v38 - v39);
              if (v45 < v44 >> 1)
              {
                v46 = v44 >> 1;
                v47 = v39 - v43;
                if (v47 < 0)
                  v47 = -v47;
                if (v47 < v46)
                {
                  v48 = v38 - v42;
                  if (v48 < 0)
                    v48 = -v48;
                  if (v48 < v46)
                  {
                    v49 = *v93;
LABEL_55:
                    if ((int)v49 < 1)
                    {
                      v51 = 0;
                    }
                    else
                    {
                      v51 = 0;
                      v52 = v2[35];
                      v53 = *v87;
                      do
                      {
                        v55 = *v53++;
                        v54 = v55;
                        if ((*(_BYTE *)(v52 + 100 * v55 + 94) & 8) == 0)
                          v51 += *(_DWORD *)(v52 + 100 * v54 + 72);
                        --v49;
                      }
                      while (v49);
                    }
                    v56 = *(unsigned int *)(v14 + 104 * v16 + 20);
                    if ((int)v56 < 1)
                    {
                      v57 = 0;
                    }
                    else
                    {
                      v57 = 0;
                      v58 = v2[35];
                      v59 = *(int **)(v14 + 104 * v16 + 8);
                      do
                      {
                        v61 = *v59++;
                        v60 = v61;
                        if ((*(_BYTE *)(v58 + 100 * v61 + 94) & 8) == 0)
                          v57 += *(_DWORD *)(v58 + 100 * v60 + 72);
                        --v56;
                      }
                      while (v56);
                    }
                    v62 = v51 / *v88;
                    v63 = v57 / *(_DWORD *)(v14 + 104 * v16 + 44);
                    if (v63 <= 8 * v62 && 8 * v63 >= v62)
                    {
                      v65 = v20 <= v19 ? v4 : (unsigned __int16 *)v15;
                      v66 = v20 <= v19 ? (unsigned __int16 *)v15 : v4;
                      v67 = v65[13];
                      v68 = v66[12] - 1;
                      if (v68 <= v67)
                        goto LABEL_97;
                      v95 = v13;
                      v97 = v12;
                      v69 = v65[14] <= v66[14] ? v66[14] : v65[14];
                      v70 = v65[15] >= v66[15] ? v66[15] : v65[15];
                      v71 = *((_DWORD *)v65 + 10);
                      if (v71)
                      {
                        v72 = v10;
                        v73 = v9;
                        v74 = v4;
                        v75 = *((_DWORD *)v66 + 10);
                        if (v75)
                        {
                          v76 = *((_DWORD *)v65 + 9);
                          v77 = *((_DWORD *)v66 + 8);
                          if (v76 <= v77)
                            v69 = v77;
                          else
                            v69 = *((_DWORD *)v65 + 9);
                          v78 = v76 + v71;
                          v79 = v77 + v75;
                          if (v78 < v79)
                            v79 = v78;
                          v70 = v79 - 1;
                        }
                      }
                      else
                      {
                        v72 = v10;
                        v73 = v9;
                        v74 = v4;
                      }
                      v50 = (int)pixelCount((uint64_t)v2, v67 + 1, v68, v69, v70, *((unsigned __int8 *)v65 + 92)) <= 0;
                      v4 = v74;
                      v9 = v73;
                      v10 = v72;
                      result = v99;
                      v12 = v97;
                      v11 = v98;
                      v13 = v95;
                      if (v50)
                      {
LABEL_97:
                        v80 = v4;
                        v81 = v16;
                        v82 = v9;
                        v83 = v10;
                        v84 = v12;
                        v85 = v13;
                        sequenceMerge(v2, v86, v81);
                        v13 = v85;
                        v12 = v84;
                        v11 = v98;
                        result = v99;
                        v10 = v83;
                        v9 = v82;
                        v4 = v80;
                        v15 = (uint64_t)v80;
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_98:
        v5 = *(_DWORD *)v15;
      }
      while (*(_DWORD *)v15 != -1);
      v1 = *(_DWORD *)v4;
    }
    while (*(_DWORD *)v4 != -1);
  }
  return result;
}

uint64_t sequenceRemove(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  int v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 312);
  v3 = (unsigned int *)(v2 + 104 * a2);
  v4 = v3[5];
  if ((int)v4 >= 1)
  {
    v5 = *(_QWORD *)(a1 + 280);
    v6 = *(int **)(v2 + 104 * a2 + 8);
    do
    {
      v7 = *v6++;
      *(_BYTE *)(v5 + 100 * v7 + 94) = 0;
      --v4;
    }
    while (v4);
  }
  v8 = *(_DWORD *)(v2 + 104 * a2 + 4);
  v9 = *v3;
  if (v8 == -1)
    *(_DWORD *)(a1 + 324) = v9;
  else
    *(_DWORD *)(v2 + 104 * v8) = v9;
  if ((_DWORD)v9 == -1)
    *(_DWORD *)(a1 + 328) = v8;
  else
    *(_DWORD *)(v2 + 104 * (int)v9 + 4) = v8;
  *v3 = *(_DWORD *)(a1 + 332);
  *(_DWORD *)(a1 + 332) = a2;
  return v9;
}

BOOL histogramIsOK(uint64_t a1, uint64_t a2)
{
  int32x4_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  int32x4_t v22;
  float v23;
  int32x4_t v24;
  int32x4_t v25;
  float32x4_t v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  _OWORD v39[8];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(a1 + 12) || *(_DWORD *)(a1 + 36))
    return 1;
  v3 = 0uLL;
  memset(v39, 0, sizeof(v39));
  v4 = *(unsigned int *)(a2 + 20);
  if ((int)v4 > 0)
  {
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 168);
    v7 = *(int *)(a1 + 192);
    v8 = *(_QWORD *)(a1 + 280);
    v9 = *(_QWORD *)(a2 + 8);
    do
    {
      v10 = *(_DWORD *)(v9 + 4 * v5);
      if ((*(_BYTE *)(v8 + 100 * v10 + 94) & 8) == 0)
      {
        v11 = v8 + 100 * v10;
        v12 = *(unsigned __int16 *)(v11 + 80);
        v13 = *(unsigned __int16 *)(v11 + 82);
        if (v12 <= v13)
        {
          v14 = v8 + 100 * v10;
          v15 = *(unsigned __int16 *)(v14 + 84);
          v16 = *(unsigned __int16 *)(v14 + 86);
          do
          {
            if (v15 <= v16)
            {
              v17 = v6 + (int)v7 * (uint64_t)(int)v15;
              v18 = v16 - v15 + 1;
              do
              {
                v19 = ((unint64_t)*(unsigned __int8 *)(v17 + v12) >> 1) & 0x7C;
                ++*(_DWORD *)((char *)v39 + v19);
                v17 += v7;
                --v18;
              }
              while (v18);
            }
          }
          while (v12++ != v13);
        }
      }
      ++v5;
    }
    while (v5 != v4);
  }
  v21 = 0;
  v22 = (int32x4_t)xmmword_1D45FAB70;
  v23 = 0.0;
  v24.i64[0] = 0x400000004;
  v24.i64[1] = 0x400000004;
  do
  {
    v25 = (int32x4_t)v39[v21];
    v3 = vaddq_s32(v25, v3);
    v26 = vcvtq_f32_s32(vmulq_s32(v25, v22));
    v23 = (float)((float)((float)(v23 + v26.f32[0]) + v26.f32[1]) + v26.f32[2]) + v26.f32[3];
    v22 = vaddq_s32(v22, v24);
    ++v21;
  }
  while (v21 != 8);
  v27 = 0;
  v28 = (float)vaddvq_s32(v3);
  v29 = v23 / v28;
  v30 = 0.0;
  v31 = 0.0;
  v32 = 0.0;
  do
  {
    v33 = (float)(int)v27 - v29;
    v34 = (float)*((int *)v39 + v27);
    v32 = v32 + (float)(v34 * (float)(v33 * v33));
    v35 = (float)(v33 * v33) * v34;
    v31 = v31 + (float)(v35 * v33);
    v30 = v30 + (float)(v35 * (float)(v33 * v33));
    ++v27;
  }
  while (v27 != 32);
  v36 = v32 / v28;
  if ((float)(v32 / v28) < 0.00001)
    return 0;
  if ((float)((float)((float)(v31 / v28) * (float)(v31 / v28)) / (float)(v36 * (float)(v36 * v36))) > 0.49)
    return 1;
  v37 = (float)((float)(v30 / v28) / (float)(v36 * v36));
  v38 = v36 >= 8.0 ? 2.4 : 2.3;
  return v37 <= v38;
}

uint64_t FKSequenceOneBox(uint64_t a1)
{
  int v1;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 CanBeGlyph;
  int v9;
  int v10;
  uint64_t v11;
  unsigned __int16 *v12;
  int v13;
  int v14;
  int v15;
  signed int v16;
  int v18;
  signed int v19;
  BOOL v20;
  uint64_t result;
  int v22;
  uint64_t v23;
  unsigned __int8 *v24;
  int *v25;
  uint64_t v26;
  int v27;
  unsigned __int16 *v28;
  BOOL v29;
  unsigned __int16 *v30;
  unsigned int v31;
  int v32;
  int v33;

  v1 = *(_DWORD *)(a1 + 296);
  if (v1 == -1)
    return 0;
  v3 = 0;
  v4 = *(_QWORD *)(a1 + 280);
  v5 = -1;
  do
  {
    v6 = v1;
    v7 = *(_DWORD *)(v4 + 100 * v1 + 72);
    if (v7 >= 32)
    {
      CanBeGlyph = concompCanBeGlyph(v4 + 100 * v1);
      v9 = v7 <= v3 ? v5 : v6;
      v10 = v7 <= v3 ? v3 : v7;
      if (CanBeGlyph)
      {
        v5 = v9;
        v3 = v10;
      }
    }
    v1 = *(_DWORD *)(v4 + 100 * v6 + 4);
  }
  while (v1 != -1);
  if (v5 == -1)
    return 0;
  v11 = *(_QWORD *)(a1 + 280);
  v12 = (unsigned __int16 *)(v11 + 100 * v5);
  v13 = v12[42];
  v14 = v12[43];
  v15 = *(_DWORD *)(a1 + 32);
  v16 = (v14 + v13 + 1) >> 1;
  if (v14 - v13 < v15 / 3 || v16 < v15 / 3)
    return 0;
  v18 = *(_DWORD *)(a1 + 28);
  v19 = (v12[41] + v12[40] + 1) >> 1;
  v20 = v16 > 2 * v15 / 3 || v19 < v18 / 3;
  if (v20 || v19 > 2 * v18 / 3 || *(unsigned __int16 *)(v11 + 100 * v5 + 88) > 5u)
    return 0;
  sequenceCreate(a1, v5, -1);
  v22 = *(_DWORD *)(a1 + 296);
  if (v22 == -1)
    return 1;
  v23 = v11 + 100 * v5;
  v24 = (unsigned __int8 *)(v23 + 92);
  v25 = (int *)(v23 + 72);
  do
  {
    v26 = *(_QWORD *)(a1 + 280);
    v27 = v22;
    v28 = (unsigned __int16 *)(v26 + 100 * v22);
    if (*((_BYTE *)v28 + 94))
      v29 = 1;
    else
      v29 = v28 == v12;
    if (!v29 && *(unsigned __int8 *)(v26 + 100 * v27 + 92) == *v24)
    {
      v30 = (unsigned __int16 *)(v26 + 100 * v27);
      if (v12[42] >= (v30[43] + v30[42] + 1) >> 1)
      {
        v31 = (v30[41] + v30[40] + 1) >> 1;
        if (v31 >= v12[40] && v31 <= v12[41])
        {
          v32 = *v25 + 31;
          if (*v25 >= 0)
            v32 = *v25;
          v33 = *(_DWORD *)(v26 + 100 * v27 + 72);
          if (v33 >= v32 >> 5 && v33 <= *v25 / 3)
            addDiacritic(a1, v5, v27);
        }
      }
    }
    v22 = *(_DWORD *)(v26 + 100 * v27 + 4);
    result = 1;
  }
  while (v22 != -1);
  return result;
}

size_t sequenceCreate(uint64_t a1, int a2, int a3)
{
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  _DWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  size_t result;

  v6 = *(_DWORD *)(a1 + 332);
  if (v6 == -1)
  {
    v7 = malloc_type_realloc(*(void **)(a1 + 312), 208 * *(int *)(a1 + 320), 0x1010040D07E2FD1uLL);
    if (!v7)
      return fwrite("Could not create more sequences\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    *(_QWORD *)(a1 + 312) = v7;
    v8 = *(_DWORD *)(a1 + 320);
    *(_DWORD *)(a1 + 332) = v8;
    *(_DWORD *)(a1 + 320) = 2 * v8;
    sequenceLinkFreeList(a1, 1);
    v6 = *(_DWORD *)(a1 + 332);
  }
  v9 = *(_QWORD *)(a1 + 312);
  v10 = (_DWORD *)(v9 + 104 * v6);
  *(_DWORD *)(a1 + 332) = *v10;
  v11 = *(_DWORD *)(a1 + 328);
  *(_DWORD *)(a1 + 328) = v6;
  if (v11 == -1)
    *(_DWORD *)(a1 + 324) = v6;
  else
    *(_DWORD *)(v9 + 104 * v11) = v6;
  v12 = v9 + 104 * v6;
  *(_DWORD *)(v12 + 4) = v11;
  *v10 = -1;
  v13 = *(int *)(v12 + 16);
  if ((_DWORD)v13)
    bzero(*(void **)(v9 + 104 * v6 + 8), 4 * v13);
  v14 = v9 + 104 * v6;
  v16 = *(_DWORD *)(v14 + 88);
  v15 = (_DWORD *)(v14 + 88);
  if (v16)
  {
    v17 = v9 + 104 * v6;
    v20 = *(void **)(v17 + 80);
    v19 = (_QWORD *)(v17 + 80);
    v18 = v20;
    if (v20)
    {
      free(v18);
      *v19 = 0;
      *v15 = 0;
    }
  }
  v21 = v9 + 104 * v6;
  *(_DWORD *)(v21 + 68) = 0;
  *(_DWORD *)(v21 + 72) = 0;
  *(_OWORD *)(v21 + 20) = 0u;
  *(_OWORD *)(v21 + 36) = 0u;
  *(_OWORD *)(v21 + 48) = 0u;
  *(_DWORD *)(v21 + 92) = 0;
  *(_DWORD *)(v21 + 95) = 0;
  result = sequenceAddConcomp(a1, v6, a2, 1);
  if (a3 != -1)
    return sequenceAddConcomp(a1, v6, a3, 1);
  return result;
}

uint64_t addDiacritic(uint64_t result, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  char i;
  char v7;
  uint64_t v8;
  _DWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;

  v3 = 0;
  v4 = *(_QWORD *)(result + 280);
  v5 = (int *)(v4 + 100 * a2);
  for (i = 1; ; i = 0)
  {
    v7 = i;
    v8 = v4 + 100 * a2 + 4 * v3;
    v10 = *(_DWORD *)(v8 + 64);
    v9 = (_DWORD *)(v8 + 64);
    if (v10 == -1)
      break;
    v3 = 1;
    if ((v7 & 1) == 0)
      return result;
  }
  *v9 = a3;
  v11 = v4 + 100 * a3;
  *(_BYTE *)(v11 + 94) = 17;
  v12 = *(_QWORD *)(result + 312) + 104 * *v5;
  v13 = *(unsigned __int16 *)(v12 + 28);
  if (v13 >= *(unsigned __int16 *)(v11 + 84))
    LOWORD(v13) = *(_WORD *)(v11 + 84);
  *(_WORD *)(v12 + 28) = v13;
  v14 = *(unsigned __int16 *)(v12 + 30);
  if (v14 <= *(unsigned __int16 *)(v11 + 86))
    LOWORD(v14) = *(_WORD *)(v11 + 86);
  *(_WORD *)(v12 + 30) = v14;
  v15 = *(unsigned __int16 *)(v12 + 24);
  if (v15 >= *(unsigned __int16 *)(v11 + 80))
    LOWORD(v15) = *(_WORD *)(v11 + 80);
  *(_WORD *)(v12 + 24) = v15;
  v16 = *(unsigned __int16 *)(v11 + 82);
  if (*(unsigned __int16 *)(v12 + 26) > v16)
    LOWORD(v16) = *(_WORD *)(v12 + 26);
  *(_WORD *)(v12 + 26) = v16;
  *(_BYTE *)(v12 + 93) = 0;
  return result;
}

uint64_t compareCCX(uint64_t a1, int *a2, int *a3)
{
  return *(unsigned __int16 *)(*(_QWORD *)(a1 + 280) + 100 * *a2 + 80)
       - *(unsigned __int16 *)(*(_QWORD *)(a1 + 280) + 100 * *a3 + 80);
}

uint64_t computeBeta(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t result;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = MEMORY[0x1E0C80A78](a1);
  v5 = (char *)&v22 - v4;
  v23 = 1;
  LODWORD(v24) = v3 / 7u + 1;
  HIDWORD(v24) = 2 * v24;
  if (v3 <= 6 && (v24 = 2, v3 <= 4) && (LODWORD(v24) = 0, v3 < 1))
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
    {
      for (i = 0; i != 12; i += 4)
      {
        v9 = *(int *)((char *)&v23 + i);
        v10 = v9 + v6;
        if (v9)
          v11 = v10 < v3;
        else
          v11 = 0;
        if (v11)
        {
          v12 = *(_DWORD *)(v2 + 4 * v6);
          v13 = *(_DWORD *)(v2 + 4 * v10);
          v14 = __OFSUB__(v13, v12);
          v15 = v13 - v12;
          if (!((v15 < 0) ^ v14 | (v15 == 0)))
            *(_DWORD *)&v5[4 * v7++] = ((*(_DWORD *)(v1 + 4 * v10) - *(_DWORD *)(v1 + 4 * v6)) << 16) / v15;
        }
      }
      ++v6;
    }
    while (v6 != v3);
  }
  qsort(v5, v7, 4uLL, (int (__cdecl *)(const void *, const void *))increasingOrderCompare);
  if (v7 >= 0)
    v16 = v7;
  else
    v16 = v7 + 1;
  result = *(unsigned int *)&v5[4 * (v16 >> 1)];
  if ((v7 & 1) == 0)
  {
    v18 = *(_DWORD *)&v5[4 * ((uint64_t)v16 >> 1) + 4];
    if ((int)result <= v18)
      v19 = v18;
    else
      v19 = result;
    if (v18 > 0)
      v19 = 0;
    if ((int)result >= v18)
      v20 = v18;
    else
      v20 = result;
    if (v18 >= 0)
      v21 = v20;
    else
      v21 = 0;
    if ((int)result >= 0)
      return v21;
    else
      return v19;
  }
  return result;
}

uint64_t increasingOrderCompare(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

uint64_t findNeighborAtY(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int v7;
  uint64_t j;
  int v9;
  int v10;
  uint64_t v12;

  v3 = *(_DWORD *)(a2 + 12);
  v4 = *(_QWORD *)(a1 + 256);
  v5 = *(_QWORD *)(a1 + 264);
  for (i = v3;
        a3 != (unsigned __int16)((*(_WORD *)(v4 + 8 * v3) >> 2) + *(_WORD *)(v5 + 2 * (v3 >> 6)));
        i = v3)
  {
    v7 = *(unsigned __int16 *)(v4 + 8 * i + 4);
    v3 -= v7;
    if (!v7)
      v3 = -1;
  }
  if (i)
  {
    for (j = 8 * i + 8; j != 8; j += 8)
    {
      if (*(int *)(a1 + 276) <= j >> 3)
        break;
      v9 = *(_DWORD *)(v4 + j);
      if (a3 != (unsigned __int16)((v9 >> 2)
                                  + *(_WORD *)(v5 + 2 * ((int)((unint64_t)j >> 3) >> 6))))
        break;
      v10 = v9 >> 8;
      if (v9 >> 8 != -1 && (*(_DWORD *)(v4 + j) & 3) == *(_BYTE *)(a2 + 92))
      {
        v12 = *(_QWORD *)(a1 + 280) + 100 * v10;
        if (*(_BYTE *)(v12 + 94) != 2 && v12 != a2)
        {
          if (concompCanBeGlyph(*(_QWORD *)(a1 + 280) + 100 * v10))
            return v10;
          else
            return 0xFFFFFFFFLL;
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t insertNeighbor(uint64_t result, int *a2, int a3, int *a4, int *a5)
{
  uint64_t v5;
  int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  int v33;
  int v34;
  int *v35;
  int *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  BOOL v43;
  int v44;

  if (a3 != -1)
  {
    v5 = *(_QWORD *)(result + 280);
    v6 = (int *)(v5 + 100 * a3);
    v7 = *((unsigned __int16 *)v6 + 40);
    v8 = *((unsigned __int16 *)a2 + 40);
    if (v7 >= v8 || *((unsigned __int16 *)a2 + 41) >= *(unsigned __int16 *)(v5 + 100 * a3 + 82))
    {
      if (v8 >= v7)
      {
        v10 = *((unsigned __int16 *)a2 + 41);
      }
      else
      {
        v9 = *(unsigned __int16 *)(v5 + 100 * a3 + 82);
        v10 = *((unsigned __int16 *)a2 + 41);
        if (v9 < v10 && (v7 <= (v8 + v10 + 1) >> 1 || 7 * v9 + v7 >= 8 * v9))
          return result;
      }
      v11 = v7 - v10;
      v12 = *((unsigned __int16 *)a2 + 43);
      v13 = *((unsigned __int16 *)a2 + 42);
      v14 = v12 - v13 + 1;
      v15 = v5 + 100 * a3;
      v16 = *(unsigned __int16 *)(v15 + 86);
      v17 = *(unsigned __int16 *)(v15 + 84);
      v18 = v16 - v17 + 1;
      v19 = v18 + v14;
      if (v18 + v14 < 0 != __OFADD__(v18, v14))
        v20 = v19 + 1;
      else
        v20 = v18 + v14;
      if (v11 < v20 >> 1
        || (v14 >= v18 ? (v21 = v16 - v17 + 1) : (v21 = v12 - v13 + 1),
            5 * v21 > 2 * v11 && (v14 - v18 >= 0 ? (v22 = v14 - v18) : (v22 = v18 - v14), 3 * v22 < v19)))
      {
        if (5 * v14 > 2 * v18)
        {
          v23 = (v16 + v17 + 1) >> 1;
          v24 = (v12 + v13 + 1) >> 1;
          v25 = 5 * v18 > 2 * v14 && v24 >= v17;
          v26 = v25 && v23 >= v13;
          v27 = !v26 || v24 > v16;
          v28 = v27 || v23 > v12;
          v29 = !v28 && (int)(v13 - v14) <= (int)v17;
          v30 = v29 && (int)(v17 - v18) <= (int)v13;
          v31 = !v30 || (int)(v14 + v12) < (int)v16;
          if (!v31 && (int)(v18 + v16) >= (int)v12)
          {
            v33 = *(unsigned __int16 *)(v5 + 100 * a3 + 82);
            v34 = *((unsigned __int16 *)v6 + 40);
            v35 = a2;
            do
            {
              v36 = v6;
              v6 = v35;
              v37 = v33 - v34;
              v33 = *((unsigned __int16 *)v35 + 41);
              v34 = *((unsigned __int16 *)v35 + 40);
              v38 = v33 - v34;
              v35 = v36;
            }
            while (v37 < v33 - v34);
            v39 = *((unsigned __int16 *)v36 + 43) - *((unsigned __int16 *)v36 + 42);
            v40 = v36[18];
            v41 = v6[18];
            if (v37 > v39)
              v40 = (v40 + v40 * v39) / (v37 + 1);
            if (v38 <= 1)
              v41 = 2 * (*((unsigned __int16 *)v6 + 43) - *((unsigned __int16 *)v6 + 42)) + 2;
            if (v40 <= 8 * v41)
            {
              if (*a2 == -1
                || ((v42 = *(_DWORD *)(*(_QWORD *)(result + 312) + 104 * *a2 + 52), 2 * v18 > v42)
                  ? (v43 = 2 * v42 <= v18)
                  : (v43 = 1),
                    !v43))
              {
                v44 = *a4;
                if (*a4 == -1)
                {
                  *a4 = a3;
                }
                else
                {
                  if (v7 < *(unsigned __int16 *)(v5 + 100 * v44 + 80))
                  {
                    *a4 = a3;
                    a3 = v44;
                  }
                  if (*a5 == -1 || v7 < *(unsigned __int16 *)(v5 + 100 * *a5 + 80))
                    *a5 = a3;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sequenceMerge(_QWORD *a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a1[39];
  v8 = *(unsigned int *)(v6 + 104 * a3 + 20);
  if ((int)v8 >= 1)
  {
    v9 = 0;
    v10 = 4 * v8;
    do
    {
      sequenceAddConcomp((uint64_t)a1, a2, *(_DWORD *)(*(_QWORD *)(a1[39] + 104 * a3 + 8) + v9), 0);
      v9 += 4;
    }
    while (v10 != v9);
    v6 = a1[39];
  }
  FKSequenceSortAndProcess(a1, v6 + 104 * a2, 1);
  *(_DWORD *)(a1[39] + 104 * a3 + 20) = 0;
  return sequenceRemove((uint64_t)a1, a3);
}

BOOL doesSeqLineIntersectSeq(uint64_t a1, unsigned __int16 *a2, signed int a3)
{
  int v3;
  signed int v4;

  v3 = (int)((((a2[13] + a2[12] + 1) >> 1) - *(unsigned __int16 *)(a1 + 24)) << 16)
     / (*(unsigned __int16 *)(a1 + 26) - *(unsigned __int16 *)(a1 + 24));
  v4 = *(_DWORD *)(a1 + 40) / 2
     - ((a2[15] + a2[14] + 1) >> 1)
     + (v3 * *(_DWORD *)(a1 + 36) + (0x10000 - v3) * *(_DWORD *)(a1 + 32)) / 0x10000;
  if (v4 < 0)
    v4 = -v4;
  return v4 < a3;
}

uint64_t pixelCount(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  int v18;

  v6 = a4 & ~(a4 >> 31);
  if (*(_DWORD *)(a1 + 32) - 1 >= a5)
    v7 = a5;
  else
    v7 = *(_DWORD *)(a1 + 32) - 1;
  if ((int)v6 > v7)
    return 0;
  result = 0;
  v10 = *(_DWORD *)(a1 + 28) - 1;
  if (v10 >= a3)
    v10 = a3;
  v11 = a2 & ~(a2 >> 31);
  v12 = *(_QWORD *)(a1 + 200);
  v13 = *(_QWORD *)(a1 + 224);
  v14 = (v7 + 1);
  v15 = (unsigned __int8 *)(v12 + v11 + v13 * v6);
  do
  {
    if ((int)v11 <= v10)
    {
      v16 = (v10 + 1) - v11;
      v17 = v15;
      do
      {
        v18 = *v17++;
        if (v18 == a6)
          result = (result + 1);
        else
          result = result;
        --v16;
      }
      while (v16);
    }
    ++v6;
    v15 += v13;
  }
  while (v6 != v14);
  return result;
}

BOOL looksOkey(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  _BOOL8 result;

  v1 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84) + 1;
  v2 = *(unsigned __int16 *)(a1 + 82) - *(unsigned __int16 *)(a1 + 80);
  result = 0;
  if (v2 < 4 * v1)
  {
    v3 = v2 + 1;
    if (v1 >= 2 * v3 || 100 * *(_DWORD *)(a1 + 72) <= 80 * v1 * v3)
      return 1;
  }
  return result;
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1E0C99168]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B68](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1E0C80C50]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_change_input_blob_shapes()
{
  return MEMORY[0x1E0D20010]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C83948](a1, *(_QWORD *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  MEMORY[0x1E0C84F98](__base, __nel, __width, a4, __compar);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D728](src, dest, tempBuffer, *(_QWORD *)&flags);
}

